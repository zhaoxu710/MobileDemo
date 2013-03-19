//
//  ArrivalOfGoodsCell.h
//  MobileDemo
//
//  Created by bull on 2/18/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArrivedDeclarationCell : UITableViewCell


@property (nonatomic, strong) IBOutlet UILabel *sadIdLabel;
@property (nonatomic, strong) IBOutlet UILabel *portNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *addressLabel;
@property (nonatomic, strong) IBOutlet UILabel *arrivalDateLabel;
@property (nonatomic, strong) IBOutlet UIImageView *orderImageView;

@end
