//
//  MainViewController.m
//  MobileDemo
//
//  Created by bull on 3/4/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import "MainViewController.h"
#import "MapSplitViewController.h"
#import "CoreDataHelper.h"

@implementation MainViewController

@synthesize managedObjectContext;
@synthesize viewContainer = _viewContainer;
@synthesize segmentedButton = _segmentedButton;
@synthesize viewControllers = _viewControllers;
@synthesize currentViewController = _currentViewController;


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    // set toolbar's backgroud 
    UIImage *barsBack = [UIImage imageNamed:@"Top-bar-top1.png"];
    [[UIToolbar appearance] setBackgroundImage:barsBack forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
   
    // custom segemented button
    // TODO
    if (managedObjectContext) {
        NSLog(@"MainViewController context is not null");
    }else{
        NSLog(@"MainViewController context is null");
    }
    
    // add viewController so you can switch them later.
    UIViewController *vc = [self viewControllerForSegmentIndex:self.segmentedButton.selectedSegmentIndex];
    [self addChildViewController:vc];
    vc.view.frame = self.viewContainer.bounds;
    [self.viewContainer addSubview:vc.view];
    self.currentViewController = vc;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changeView:(UISegmentedControl *)sender {
     NSLog(@"presss %d button", self.segmentedButton.selectedSegmentIndex);
    UIViewController *vc = [self viewControllerForSegmentIndex:sender.selectedSegmentIndex];
    [self addChildViewController:vc];
    //UIViewAnimationOptionTransitionFlipFromBottom
    [self transitionFromViewController:self.currentViewController toViewController:vc duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self.currentViewController.view removeFromSuperview];
        vc.view.frame = self.viewContainer.bounds;
        [self.viewContainer addSubview:vc.view];
    } completion:^(BOOL finished) {
        [vc didMoveToParentViewController:self];
        [self.currentViewController removeFromParentViewController];
        self.currentViewController = vc;
    }];
    self.navigationItem.title = vc.title;
}


- (UIViewController *)viewControllerForSegmentIndex:(NSInteger)index {
    UIViewController *vc;
    switch (index) {
        case 0:{
                vc = [self.storyboard instantiateViewControllerWithIdentifier:@"mapview"];
                MapSplitViewController *mvc = (MapSplitViewController *)vc;
                mvc.managedObjectContext = self.managedObjectContext;
                vc = mvc;
                break;
            }
        case 1:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"thumnail"];
            break;
    }
    return vc;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"logout"]) {
        
        // clean up all data
        [CoreDataHelper deleteAllObjectsForEntity:@"User" andContext:self.managedObjectContext];
        [CoreDataHelper deleteAllObjectsForEntity:@"EBToDo" andContext:self.managedObjectContext];
        [CoreDataHelper deleteAllObjectsForEntity:@"SAD" andContext:self.managedObjectContext];
        
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
    }
}
@end
