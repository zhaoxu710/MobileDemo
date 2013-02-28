//
//  AppDelegate.m
//  MobileDemo
//
//  Created by bull on 2/16/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import "AppDelegate.h"
#import "MapViewController.h"
#import "SAD.h"
#import "ArrivedDelarationViewController.h"


@implementation AppDelegate{
    NSMutableArray *sads;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    sads = [NSMutableArray arrayWithCapacity:20];
    SAD *sad = [[SAD alloc] init];
    sad.sadID = @"12ARIM0021";
    sad.port =@"Dublin Port";
    sad.address =@"Nord road, East third Ring";
    sad.arrivalDate = [[NSDate alloc] init];
    sad.order = 1;
    [sads addObject:sad];
    sad = [[SAD alloc] init];
    sad.sadID = @"12CLIM3001";
    sad.port =@"Dublin Port";
    sad.address =@"Nord road, East third Ring";
    sad.arrivalDate = [[NSDate alloc] init];
    sad.order = 2;
    [sads addObject:sad];
    sad = [[SAD alloc] init];
    sad.sadID = @"12ARIM2830";
    sad.port =@"Dublin Port";
    sad.address =@"Nord road, East third Ring";
    sad.arrivalDate = [[NSDate alloc] init];
    sad.order = 3;
    [sads addObject:sad];
    sad = [[SAD alloc] init];
    sad.sadID = @"12ARIM2831";
    sad.port =@"Dublin Port";
    sad.address =@"Nord road, East third Ring";
    sad.arrivalDate = [[NSDate alloc] init];
    sad.order = 4;
    [sads addObject:sad];
//    UIViewController *mainUIViewerController = (UIViewController *)self.window.rootViewController;
//    UISplitViewController *splitViewController =[mainUIViewerController objectAtIndex:0];
//    UINavigationController *navigationController = [[splitViewController viewControllers] objectAtIndex:0];
//    ArrivedDelarationViewController *arrivedDelarationViewController = [[navigationController viewControllers] objectAtIndex:0];
//    arrivedDelarationViewController.sads = sads;
    
//    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
//    UINavigationController *navigationController = [[splitViewController viewControllers] objectAtIndex:0];
//	ArrivedDelarationViewController *arrivedDelarationViewController = 
//    arrivedDelarationViewController.sads = sads;
    
    
    
    
    // Override point for customization after application launch.
    return YES;
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
