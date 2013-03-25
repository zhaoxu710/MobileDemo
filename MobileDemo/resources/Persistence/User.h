//
//  User.h
//  MobileDemo
//
//  Created by bull on 3/25/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class EBToDo;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSSet *todolist;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addTodolistObject:(EBToDo *)value;
- (void)removeTodolistObject:(EBToDo *)value;
- (void)addTodolist:(NSSet *)values;
- (void)removeTodolist:(NSSet *)values;

@end
