//
//  SADAnnotation.m
//  MobileDemo
//
//  Created by bull on 3/11/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import "SADAnnotation.h"

@implementation SADAnnotation
@synthesize name = _name;
@synthesize address = _address;
@synthesize coordinate = _coordinate;

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate {
    if ((self = [super init])) {
        _name = [name copy];
        _address = [address copy];
        _coordinate = coordinate;
    }
    return self;
}

- (NSString *)title {
    if ([_name isKindOfClass:[NSNull class]])
        return @"Unknown port name";
    else
        return _name;
}

- (NSString *)subtitle {
    return _address;
}

@end
