//
//  Item.h
//  MobileDemo
//
//  Created by bull on 2/18/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic,copy) NSString *combinedNomencltureCode;
@property (nonatomic,copy) NSString *countryOfOrigin;
@property (nonatomic,copy) NSString *containerNumber;
@property (nonatomic,copy) NSString *packageType;
@property (nonatomic,assign) float *grossMass;
@property (nonatomic,assign) int *decalredQuantity;

@end
