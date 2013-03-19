//
//  EBRetriveSADList.h
//  ArrivedSAD
//
//  Created by 赵顼 on 13-3-7.
//  Copyright (c) 2013年 bull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"
@class EBToDo;
@class SAD;

@interface EBRetriveToDoList : NSObject{
    NSMutableArray *toDoList;
}
@property NSMutableArray *toDoList;

//- (NSArray*) getSADList;
- (NSString*) getToDoString;
- (NSMutableArray *)getToDoList:(NSString *)toDoString;
- (EBToDo*)getToDoAtIndex:(NSInteger*)atPath;
-(SAD*)populateSAD:(GDataXMLElement*)sadElement;
@end
