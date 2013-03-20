//
//  User.h
//  MobileDemo
//
//  Created by bull on 3/20/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@class EBToDo;
@interface User : NSManagedObject

@property NSString *userName, *password;
@property NSMutableArray *todolist;

@end
