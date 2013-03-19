//
//  EBToDo.h
//  ArrivedSAD
//
//  Created by 赵顼 on 13-3-7.
//  Copyright (c) 2013年 bull. All rights reserved.
//

#import <Foundation/Foundation.h>


@class SAD;
@interface EBToDo : NSObject{
    NSString *entity;
    NSString *forward;
    NSString *identifier;
    NSString *participant;
    NSString *pendingActivity;
    NSString *dueBy;

    NSString *pendingDate;
    NSString *performer;
    NSString *release;
    NSString *wfAction;
    NSString *wfInstance;
    NSString *wfNode;
    SAD *sad;
    NSDictionary *extendAttribute;
    UIImage *thumbnail;
}
@property NSString *entity,*forward,*identifier,*participant,*pendingActivity,*performer,*release,*wfAction,*wfInstance,*wfNode;
@property NSString *dueBy,*pendingDate;
@property NSDictionary *extendAttribute;
@property SAD *sad;
@property UIImage *thumbnail;

@end
