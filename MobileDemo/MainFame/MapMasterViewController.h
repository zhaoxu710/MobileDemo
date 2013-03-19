//
//  ArrivalOfGoodsViewController.h
//  MobileDemo
//
//  Created by bull on 2/17/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapDetailViewController.h"
#import "MainViewController.h"
#import "PDFViewController.h"
#import "EBToDo.h"
#import "AppDelegate.h"

@interface MapMasterViewController : UITableViewController{
    MainViewController *parentViewControler;
}

@property (nonatomic, strong) NSMutableArray *sads;
@property (nonatomic, strong) NSMutableArray *todoList;
@property (nonatomic, strong) NSManagedObjectContext *manageObjectContext;
@property (strong, nonatomic) MapDetailViewController *detailViewController;

- (NSMutableArray *)dataLoading;

@end
