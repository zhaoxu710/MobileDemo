//
//  Item.h
//  MobileDemo
//
//  Created by bull on 2/18/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Item : NSManagedObject
@property NSString  *item_num,
*b33_commodity_code,
*b34_origin_country,
*b36_preference,
*b37_cat_type,
*b37_previous_pro,
*b37_requested_pro,
*b37_subcat,
*b40_prev_doc_abb,
*b40_prev_doc_sub1,
*b40_prev_doc_sub2,
*b40_prev_doc_type,
*is_channel;

@property NSDecimalNumber
*b35_gross_mass,
*b38_net_mass,
*b41_unit_num,
*b42_item_price,
*b46_stat_value;

@end
