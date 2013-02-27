//
//  SAD.h
//  MobileDemo
//
//  Created by bull on 2/17/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Item.h"

@interface SAD : NSObject

@property (nonatomic, assign) int order;
@property (nonatomic, copy) NSString *sadID;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *office;
@property (nonatomic, assign) int itemsSize;
@property (nonatomic, copy) NSString *fiscalChannel;
@property (nonatomic, assign) int *totalPackages;
@property (nonatomic, assign) int *totalGrossMass;
//@property (nonatomic, assign) CLLocationCoordinate2D *location;
@property (nonatomic, copy) NSString *consignor;
@property (nonatomic, copy) NSString *consignee;
@property (nonatomic, copy) NSString *port;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSDate  *arrivalDate;
//@property (nonatomic, strong) NSMutableArray *items;

@end
