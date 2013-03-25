//
//  MainViewController.h
//  MobileDemo
//
//  Created by bull on 3/4/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapSplitViewController.h"
#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController


@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) IBOutlet UIView *viewContainer;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedButton;
@property (strong, nonatomic) NSArray *viewControllers;
@property (strong, nonatomic) UIViewController *currentViewController;

- (IBAction)changeView:(id)sender;

@end

