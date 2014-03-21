//
//  RKLogin.m
//  iwebapi2
//
//  Created by Rodolfo Torres on 11/03/14.
//  Copyright (c) 2014 Rodolfo Torres. All rights reserved.
//

#import "WebApiLogin.h"

@implementation WebApiLogin

- (id) initWithUser: (NSString *)username andPassword: (NSString *) password
{
    self = [super init];

    if(self){
        _username = username;
        _password = password;
    }
    
    return self;
}

+ (RKObjectMapping *)mapping
{
    RKObjectMapping *requestMapping = [RKObjectMapping requestMapping];
    [requestMapping addAttributeMappingsFromDictionary:@{
                                                         @"grantType": @"grant_type",
                                                         @"username": @"username",
                                                         @"password": @"password"}];
    
    return requestMapping;
}

@end
