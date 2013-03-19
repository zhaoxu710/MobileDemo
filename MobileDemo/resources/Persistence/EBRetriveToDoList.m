//
//  EBRetriveSADList.m
//  ArrivedSAD
//
//  Created by 赵顼 on 13-3-7.
//  Copyright (c) 2013年 bull. All rights reserved.
//

#import "EBRetriveToDoList.h"
#import "GDataXMLNode.h"
#import "ASIFormDataRequest.h"
#import "EBToDo.h"
#import "SAD.h"

@implementation EBRetriveToDoList
@synthesize toDoList;
-(NSString*) getToDoString{
    /*
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"todo" ofType:@"xml"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [NSException raise:@"File not found" format:@"Couldn't find the file at path: %@", filePath];
    }
    
    NSString *toDoString = [NSString stringWithContentsOfFile:filePath];
     */
    NSURL *loginUrl=[NSURL URLWithString:@"http://129.184.13.94:14000/e-biscus/service/rest/todo/mytask/user3"];
    ASIHTTPRequest *myRequest=[ASIHTTPRequest requestWithURL:loginUrl];
        [myRequest startSynchronous];
    
    NSString *toDoString=[myRequest responseString];
    toDoString=[toDoString stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    toDoString=[toDoString stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    toDoString=[toDoString stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    NSLog(@"ToDo string is %@",toDoString);
    return toDoString;
}

-(NSMutableArray*) getToDoList:(NSString*)toDoString{
    NSError *error;
    GDataXMLDocument *doc=[[GDataXMLDocument  alloc]initWithXMLString:toDoString options:0 error:&error];
    GDataXMLElement *root=doc.rootElement;
    NSArray *itemList=[root elementsForName:@"itemList"];
    NSLog(@"itemList size=%d",itemList.count);
    toDoList=[[NSMutableArray alloc]initWithCapacity:itemList.count];
    for(GDataXMLElement *item in itemList){
        EBToDo *toDo=[EBToDo alloc];
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
        }
        // wfInstance
        NSArray *wfinstanceElements=[item elementsForName:@"wfInstance"];
        if(wfinstanceElements.count>0 ){
            GDataXMLElement *wfinstanceElement =wfinstanceElements[0];
            toDo.wfInstance= wfinstanceElement.stringValue;
        }
        // wfAction
        NSArray *wfActionElements=[item elementsForName:@"wfAction"];
        if(wfinstanceElements.count>0 ){
            GDataXMLElement *wfActionElement =wfActionElements[0];
            toDo.wfAction= wfActionElement.stringValue;
        }
        // wfNode
        NSArray *wfNodeElements=[item elementsForName:@"wfNode"];
        if(wfinstanceElements.count>0 ){
            GDataXMLElement *wfNodeElement =wfNodeElements[0];
            toDo.wfNode= wfNodeElement.stringValue;
        }
        NSError *error;
        NSArray *sadElements=[item nodesForXPath:@"data/SAD" error:&error];
        if(sadElements.count>0){
            GDataXMLElement *sadElement=[sadElements objectAtIndex:0];
            SAD *sad=[self populateSAD:sadElement];
            toDo.sad=sad;
        }
        [toDoList addObject:toDo];
        NSLog(@"The SAD boxa_office_sub2======%@",toDo.sad.boxa_office_sub_code);
        NSLog(@"The SAD location point======%@",toDo.sad.b30_point);
    }
    
    return toDoList;
}

-(SAD*)populateSAD:(GDataXMLElement*)sadElement{
    SAD *sad=[SAD alloc];
    NSArray *sadIdArray=[sadElement elementsForName:@"sad_id"];
    if(sadIdArray.count>0){
        sad.sad_id=[sadIdArray[0] stringValue];
    }
    NSArray *versionArray=[sadElement elementsForName:@"version"];
    if(versionArray.count>0){
        NSDecimalNumber *versionNumber=[NSDecimalNumber alloc];
        sad.version=[versionNumber initWithString:([versionArray[0] stringValue])];
    }
    NSArray *office2Array=[sadElement elementsForName:@"boxa_office_sub_code" ];
    if(office2Array.count>0){
        sad.boxa_office_sub_code=[office2Array[0] stringValue];
    }
    NSArray *b30_locationArray=[sadElement elementsForName:@"b30_location"];
    if(b30_locationArray.count>0){
        sad.b30_location=[b30_locationArray[0] stringValue];
    }
    NSArray *b30_pointArray=[sadElement elementsForName:@"b30_point"];
    if(b30_pointArray.count>0){
        sad.b30_point=[b30_pointArray[0] stringValue];
    }
    NSArray *b14_addressArray=[sadElement elementsForName:@"b14_address"];
    if(b14_addressArray.count>0){
        sad.b14_address=[b14_addressArray[0] stringValue];
    }
    return sad;
    
}

-(id)getToDoAtIndex:(int *)atPath{
    return [toDoList objectAtIndex:atPath];
}


@end
