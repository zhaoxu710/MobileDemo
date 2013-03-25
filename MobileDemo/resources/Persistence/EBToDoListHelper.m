//
//  EBRetriveSADList.m
//  ArrivedSAD
//
//  Created by 赵顼 on 13-3-7.
//  Copyright (c) 2013年 bull. All rights reserved.
//

#import "EBToDoListHelper.h"
#import "GDataXMLNode.h"
#import "ASIFormDataRequest.h"
#import "User.h"
#import "EBToDo.h"
#import "SAD.h"




@implementation EBToDoListHelper

@synthesize managedObjectContext;

-(EBToDoListHelper *)initWtihContext:(NSManagedObjectContext *)_managedObjectContext{
    self.managedObjectContext = _managedObjectContext;
    return self;
}

-(void) getToDoString:(NSString*)userName andPassword:(NSString *)password{
    
    //check managedObjectContext whether is nil
    if (!self.managedObjectContext) {
        NSLog(@"EBToDoListHelper context is nil");
    }else{
        NSLog(@"EBToDoListHelper context is not nil");
    }
    
    // grab todo list from server
    NSString *url = [NSString stringWithFormat:@"http://129.184.13.94:14000/e-biscus/service/rest/todo/mytask/%@", userName];
    NSURL *loginUrl=[NSURL URLWithString:url];
    ASIHTTPRequest *myRequest=[ASIHTTPRequest requestWithURL:loginUrl];
    [myRequest startSynchronous];
    
    
    // get todo list with string format
    NSString *toDoString=[myRequest responseString];
    toDoString=[toDoString stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    toDoString=[toDoString stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    toDoString=[toDoString stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    
    // put user info to DB
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                          inManagedObjectContext:self.managedObjectContext];
    
    user.userName = userName;
    user.password = password;
    
    NSError *error;
    
    if(toDoString){
        NSLog(@"get todo list");        
        GDataXMLDocument *doc=[[GDataXMLDocument  alloc]initWithXMLString:toDoString options:0 error:&error];
        GDataXMLElement *root=doc.rootElement;
        NSArray *itemList=[root elementsForName:@"itemList"];
        NSLog(@"itemList size=%d",itemList.count);
        for(GDataXMLElement *item in itemList){
            EBToDo *toDo=[NSEntityDescription insertNewObjectForEntityForName:@"EBToDo"
                                                       inManagedObjectContext:self.managedObjectContext];
            NSArray *identifierElements=[item elementsForName:@"identifer"];
            if(identifierElements.count>0){
                GDataXMLElement *identifier=identifierElements[0];
                toDo.identifier=identifier.stringValue;
                NSLog(@"item xml identifier=%@,toDo identifier=%@",identifier.stringValue,toDo.identifier);
            }
            NSArray *dueByElements=[item elementsForName:@"dueBy"];
            if(dueByElements.count>0 ){
                GDataXMLElement *dueBy=dueByElements[0];
                toDo.dueBy=dueBy.stringValue;
                NSLog(@"item xml dueBy=%@",toDo.dueBy);
            }
            // wfInstance
            NSArray *wfinstanceElements=[item elementsForName:@"wfInstance"];
            if(wfinstanceElements.count>0 ){
                GDataXMLElement *wfinstanceElement =wfinstanceElements[0];
                toDo.wfInstance= wfinstanceElement.stringValue;
                NSLog(@"item xml wfInstance=%@",toDo.wfInstance);
            }
            // wfAction
            NSArray *wfActionElements=[item elementsForName:@"wfAction"];
            if(wfinstanceElements.count>0 ){
                GDataXMLElement *wfActionElement =wfActionElements[0];
                toDo.wfAction= wfActionElement.stringValue;
                NSLog(@"item xml wfAction=%@",toDo.wfAction);
            }
            // wfNode
            NSArray *wfNodeElements=[item elementsForName:@"wfNode"];
            if(wfinstanceElements.count>0 ){
                GDataXMLElement *wfNodeElement =wfNodeElements[0];
                toDo.wfNode= wfNodeElement.stringValue;
                 NSLog(@"item xml wfNode=%@",toDo.wfNode);
            }
            NSError *error;
            NSArray *sadElements=[item nodesForXPath:@"data/SAD" error:&error];
            if(sadElements.count>0){
                GDataXMLElement *sadElement=[sadElements objectAtIndex:0];
                [self populateSAD:sadElement andTodo:toDo];
            }
            [toDo setValue:user forKey:@"user"];
            [[user mutableSetValueForKey:@"todolist"] addObject:toDo];
            NSLog(@"The SAD boxa_office_sub2======%@",toDo.sads.boxa_office_sub_code);
            NSLog(@"The SAD location point======%@",toDo.sads.b30_point);
        }
        
    }else{
        NSLog(@"get empty todo list");
    }
    
    NSLog(@"save");
    if (![self.managedObjectContext save:&error])
         NSLog(@"Whoops, couldn't save: %@", [error domain]);
}

-(void)populateSAD:(GDataXMLElement*)sadElement andTodo:(EBToDo *) toDo{
    SAD *sad=[NSEntityDescription insertNewObjectForEntityForName:@"SAD"
                                           inManagedObjectContext:self.managedObjectContext];

    NSArray *sadIdArray=[sadElement elementsForName:@"sad_id"];
    if(sadIdArray.count>0){
        sad.sad_id=[sadIdArray[0] stringValue];
        NSLog(@"sad xml sad_id=%@",sad.sad_id);

    }
    NSArray *versionArray=[sadElement elementsForName:@"version"];
    if(versionArray.count>0){
        NSDecimalNumber *versionNumber=[NSDecimalNumber alloc];
        sad.version=[versionNumber initWithString:([versionArray[0] stringValue])];
        NSLog(@"sad xml version=%@",sad.version);
    }
    NSArray *office2Array=[sadElement elementsForName:@"boxa_office_sub_code" ];
    if(office2Array.count>0){
        sad.boxa_office_sub_code=[office2Array[0] stringValue];
         NSLog(@"sad xml boxa_office_sub_code=%@",sad.boxa_office_sub_code);
    }
    NSArray *b30_locationArray=[sadElement elementsForName:@"b30_location"];
    if(b30_locationArray.count>0){
        sad.b30_location=[b30_locationArray[0] stringValue];
        NSLog(@"sad xml b30_location=%@",sad.b30_location);
    }
    NSArray *b30_pointArray=[sadElement elementsForName:@"b30_point"];
    if(b30_pointArray.count>0){
        sad.b30_point=[b30_pointArray[0] stringValue];
        NSLog(@"sad xml b30_point=%@",sad.b30_point);
    }
    NSArray *b14_addressArray=[sadElement elementsForName:@"b14_address"];
    if(b14_addressArray.count>0){
        sad.b14_address=[b14_addressArray[0] stringValue];
        NSLog(@"sad xml b14_address=%@",sad.b14_address);
    }
    
    [toDo setValue:sad forKey:@"sads"];
    [sad setValue:toDo forKey:@"todolist"];

    
}


- (void)insertToDoToDB:(NSString *)userName andPassword:(NSString *)password{
   [self getToDoString:userName andPassword:password];
}

@end
