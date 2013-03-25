//
//  EBToDo.h
//  MobileDemo
//
//  Created by bull on 3/25/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SAD;

@interface EBToDo : NSManagedObject

@property (nonatomic, retain) NSString * dueBy;
@property (nonatomic, retain) NSString * extendAttribute;
@property (nonatomic, retain) NSString * forward;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSString * participant;
@property (nonatomic, retain) NSString * pendingActivity;
@property (nonatomic, retain) NSString * pendingDate;
@property (nonatomic, retain) NSString * performer;
@property (nonatomic, retain) NSData * thumbnail;
@property (nonatomic, retain) NSString * toDoEntity;
@property (nonatomic, retain) NSString * toDoRelease;
@property (nonatomic, retain) NSString * wfAction;
@property (nonatomic, retain) NSString * wfInstance;
@property (nonatomic, retain) NSString * wfNode;
@property (nonatomic, retain) SAD *sads;
@property (nonatomic, retain) NSManagedObject *user;

@end
