//
//  SAD.h
//  MobileDemo
//
//  Created by bull on 2/17/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreData/CoreData.h>
#import "Item.h"

@interface SAD : NSManagedObject


@property int order,b5_items;
@property NSString  *sad_id,
*b14_declarant_tr,
*b14_address,
*b14_country,
*b14_name,
*b15_dispatch_ctr,
*b17_dest_country,
*b18_trans_id,
*b20_deliv_terms_sub1,
*b20_deliv_terms_sub2,
*b20_deliv_terms_sub3,
*b22_currency_code,
*b1_decla_sub1,
*b1_decla_sub2,
*boxa_office_code,
*boxa_office_country_code,
*boxa_office_sub_code,
*cd_status,
*cd_trade_move,
*b25_border_trans,
*b26_inland_trans,
*b29_exit_office_sub1,
*b29_exit_office_sub2,
*b29_exit_office_sub3,
*b30_location,
*b30_point,
*b48_deferred_pay;
@property NSDecimalNumber
*b6_total_packages,
*version,
*b22_total_amount,
*b23_exchange_rate;
@property NSDate    *t2_accept,
*t3_risk_assess,
*t4_check_risk,
*t6_conform,
*t15_discharge;
@property NSMutableArray *items;

-(CLLocationCoordinate2D)getLocation;

@end
