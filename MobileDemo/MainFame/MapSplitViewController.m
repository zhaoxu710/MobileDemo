//
//  MapView.m
//  MobileDemo
//
//  Created by bull on 3/6/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import "MapSplitViewController.h"
#import "MapMasterViewController.h"

@implementation MapSplitViewController

@synthesize managedObjectContext;

- (void)viewDidLoad

{
    [super viewDidLoad];
    
    if (managedObjectContext) {
        NSLog(@"MapSplitViewController context is not null");
    }else{
        NSLog(@"MapSplitViewController context is null");
    }
    UINavigationController *navigationController = [self.viewControllers lastObject];
    self.delegate = (id)navigationController.topViewController;
    
    UINavigationController *masterNavigationController = [self.viewControllers objectAtIndex:0];
    MapMasterViewController *controller = (MapMasterViewController *)masterNavigationController.topViewController;
    controller.manageObjectContext = self.managedObjectContext;

}

@end
