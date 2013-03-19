//
//  IOSLoginResponse.h
//  LoginDemo
//
//  Created by 赵顼 on 13-3-5.
//  Copyright (c) 2013年 bull. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IOSLoginResponse : NSObject{
    NSString *isValid;
    NSString *userName;
    NSString *language;
    NSString *customsOffice;
    NSString *profile;
    NSString *trno;
    NSString *userId;
}
@property NSString *userName;
@property NSString *language;
@property NSString *customsOffice;
@property NSString *profile;
@property NSString *trno,*userId;
@property NSString *isValid;


@end
