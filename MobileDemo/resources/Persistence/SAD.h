//
//  SAD.h
//  MobileDemo
//
//  Created by bull on 3/25/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class EBToDo, Item;

@interface SAD : NSManagedObject

@property (nonatomic, retain) NSString * b1_decla_sub1;
@property (nonatomic, retain) NSString * b1_decla_sub2;
@property (nonatomic, retain) NSNumber * b5_items;
@property (nonatomic, retain) NSDecimalNumber * b6_total_packages;
@property (nonatomic, retain) NSString * b14_address;
@property (nonatomic, retain) NSString * b14_country;
@property (nonatomic, retain) NSString * b14_declarant_tr;
@property (nonatomic, retain) NSString * b14_name;
@property (nonatomic, retain) NSString * b15_dispatch_ctr;
@property (nonatomic, retain) NSString * b17_dest_country;
@property (nonatomic, retain) NSString * b18_trans_id;
@property (nonatomic, retain) NSString * b20_deliv_terms_sub1;
@property (nonatomic, retain) NSString * b20_deliv_terms_sub2;
@property (nonatomic, retain) NSString * b20_deliv_terms_sub3;
@property (nonatomic, retain) NSString * b22_currency_code;
@property (nonatomic, retain) NSDecimalNumber * b22_total_amount;
@property (nonatomic, retain) NSDecimalNumber * b23_exchange_rate;
@property (nonatomic, retain) NSString * b25_border_trans;
@property (nonatomic, retain) NSString * b29_exit_office_sub1;
@property (nonatomic, retain) NSString * b29_exit_office_sub2;
@property (nonatomic, retain) NSString * b29_exit_office_sub3;
@property (nonatomic, retain) NSString * b30_location;
@property (nonatomic, retain) NSString * b30_point;
@property (nonatomic, retain) NSString * b48_deferred_pay;
@property (nonatomic, retain) NSString * boxa_office_code;
@property (nonatomic, retain) NSString * boxa_office_country_code;
@property (nonatomic, retain) NSString * boxa_office_sub_code;
@property (nonatomic, retain) NSString * cd_status;
@property (nonatomic, retain) NSString * cd_trade_move;
@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) NSDate * t2_accept;
@property (nonatomic, retain) NSDate * t3_risk_assess;
@property (nonatomic, retain) NSDate * t4_check_risk;
@property (nonatomic, retain) NSDate * t6_conform;
@property (nonatomic, retain) NSDate * t15_discharge;
@property (nonatomic, retain) NSDecimalNumber * version;
@property (nonatomic, retain) NSString * sad_id;
@property (nonatomic, retain) NSSet *items;
@property (nonatomic, retain) EBToDo *todolist;
@end

@interface SAD (CoreDataGeneratedAccessors)

- (void)addItemsObject:(Item *)value;
- (void)removeItemsObject:(Item *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
