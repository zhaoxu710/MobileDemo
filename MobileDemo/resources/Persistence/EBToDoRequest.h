//
//  EBToDoRequest.h
//  MobileDemo
//
//  Created by bull on 3/18/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Context : NSObject{
    NSString *workflow_instance_id, *workflow_action, *workflow_node_id;
}

@property NSString *workflow_instance_id, *workflow_action, *workflow_node_id;
@end

@interface ToDoRequest : NSObject{
    NSString *user_id, *form_id, *act, *clicked_id;
    Context *context;
}

@property NSString *user_id, *form_id, *act, *clicked_id;
@property Context *context;


@end


