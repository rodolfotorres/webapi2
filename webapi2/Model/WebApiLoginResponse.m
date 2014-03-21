//
//  RKLoginResponse.m
//  iwebapi2
//
//  Created by Rodolfo Torres on 11/03/14.
//  Copyright (c) 2014 Rodolfo Torres. All rights reserved.
//

#import "WebApiLoginResponse.h"

@implementation WebApiLoginResponse

+ (RKObjectMapping *)mapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[WebApiLoginResponse class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"username": @"username",
                                                  @"token_type": @"tokenType",
                                                  @"access_token": @"acessToken"}];
    
    return mapping;
}

@end
