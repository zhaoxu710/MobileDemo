//
//  IOSLoginResponseParser.h
//  LoginDemo
//
//  Created by 赵顼 on 13-3-5.
//  Copyright (c) 2013年 bull. All rights reserved.
//

#import <Foundation/Foundation.h>


@class IOSLoginResponse;

@interface IOSLoginResponseParser : NSObject

+(IOSLoginResponse* )parse:(NSData*)xmlContent;

@end
