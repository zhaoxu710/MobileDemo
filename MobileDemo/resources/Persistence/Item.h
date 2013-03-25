//
//  Item.h
//  MobileDemo
//
//  Created by bull on 3/25/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SAD;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * b33_commodity_code;
@property (nonatomic, retain) NSString * b34_origin_country;
@property (nonatomic, retain) NSDecimalNumber * b35_gross_mass;
@property (nonatomic, retain) NSString * b36_preference;
@property (nonatomic, retain) NSString * b37_cat_type;
@property (nonatomic, retain) NSString * b37_previous_pro;
@property (nonatomic, retain) NSString * b37_requested_pro;
@property (nonatomic, retain) NSString * b37_subcat;
@property (nonatomic, retain) NSDecimalNumber * b38_net_mass;
@property (nonatomic, retain) NSString * b40_prev_doc_abb;
@property (nonatomic, retain) NSString * b40_prev_doc_sub1;
@property (nonatomic, retain) NSString * b40_prev_doc_sub2;
@property (nonatomic, retain) NSString * b40_prev_doc_type;
@property (nonatomic, retain) NSDecimalNumber * b41_unit_num;
@property (nonatomic, retain) NSDecimalNumber * b42_item_price;
@property (nonatomic, retain) NSDecimalNumber * b46_stat_value;
@property (nonatomic, retain) NSString * is_channel;
@property (nonatomic, retain) NSString * item_num;
@property (nonatomic, retain) SAD *sad;

@end
