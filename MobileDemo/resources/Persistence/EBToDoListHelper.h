//
//  EBRetriveSADList.h
//  ArrivedSAD
//
//  Created by 赵顼 on 13-3-7.
//  Copyright (c) 2013年 bull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "GDataXMLNode.h"

@class User;
@class EBToDo;
@class SAD;

@interface EBToDoListHelper : NSObject

@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext;

- (EBToDoListHelper *)initWtihContext:(NSManagedObjectContext *)_managedObjectContext;
- (void)insertToDoToDB:(NSString *)userName andPassword:(NSString *)password;


//- (NSString*) getToDoString:(NSString*)userName;
//- (NSMutableArray *)getToDoList:(NSString *)toDoString;
//- (EBToDo*)getToDoAtIndex:(NSInteger*)atPath;
//- (SAD*)populateSAD:(GDataXMLElement*)sadElement;


@end
