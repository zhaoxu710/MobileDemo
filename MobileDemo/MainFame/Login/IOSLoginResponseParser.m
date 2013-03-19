//
//  IOSLoginResponseParser.m
//  LoginDemo
//
//  Created by 赵顼 on 13-3-5.
//  Copyright (c) 2013年 bull. All rights reserved.
//

#import "IOSLoginResponseParser.h"
#import "GDataXMLNode.h"
#import "IOSLoginResponse.h"

@implementation IOSLoginResponseParser

+(IOSLoginResponse* )parse:(NSData*)xmlContent{
    IOSLoginResponse *response=[IOSLoginResponse alloc];
    NSError *error;
    GDataXMLDocument *doc=[[GDataXMLDocument alloc]initWithData:xmlContent options:0 error:&error];
    if(doc==nil){
        NSLog(@"Login Response is nil!");
        return nil;
    }
    GDataXMLElement *loginResponse=doc.rootElement;
    NSLog(@"Root element=%@",loginResponse.stringValue);
    //populates userId;
    NSArray *userIds=[loginResponse elementsForName:@"userId"];
    if(userIds.count>0){
        GDataXMLElement *userId=[userIds objectAtIndex:0];
        response.userId=userId.stringValue;
        NSLog(@"Userid in xml=%@, in response object=%@",userId.XMLString,response.userId);
    }
    //populates isValid
    NSArray *isValids=[loginResponse elementsForName:@"isValid"];
    if(isValids.count>0){
        GDataXMLElement *isValid=[isValids objectAtIndex:0];
        response.isValid=isValid.stringValue;
    }
    if(response.isValid){
        //continue on other fields
        //populates customsOffice
        NSArray *customsOffices=[loginResponse elementsForName:@"customsOffice"];
        if(customsOffices.count>0){
            GDataXMLElement *customsOffice=[customsOffices objectAtIndex:0];
            response.customsOffice=customsOffice.stringValue;
        }
        //populates language
        NSArray *languages=[loginResponse elementsForName:@"language"];
        if(languages.count>0){
            GDataXMLElement *language=[languages objectAtIndex:0];
            response.language=language.stringValue;
        }
        //populates userName
        NSArray * userNames=[loginResponse elementsForName:@"name"];
        if(userNames.count>0){
            GDataXMLElement *userName=[userNames objectAtIndex:0];
            response.userName=userName.stringValue;
        }
        //populates profile
        NSArray *profiles=[loginResponse elementsForName:@"profile"];
        if(profiles.count>0){
            GDataXMLElement *profile=[profiles objectAtIndex:0];
            response.profile=profile.stringValue;
        }
        //populates trno
        NSArray *trnos=[loginResponse elementsForName:@"trno"];
        if(trnos.count>0){
            GDataXMLElement *trno=[trnos objectAtIndex:0];
            response.trno=trno.stringValue;
        }
    }else{
        //that's all
    }
    //
    return response;
}

@end
