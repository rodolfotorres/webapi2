//
//  SimpleWebApiLogin.m
//  webapinet
//
//  Created by Rodolfo Torres on 16/03/14.
//  Copyright (c) 2014 Rodolfo Torres. All rights reserved.
//

#import "SimpleWebApiLogin.h"

@implementation SimpleWebApiLogin

- (id) initWithUser:(NSString *)username andPassword:(NSString *)password
{
    self = [super initWithUser:username andPassword:password];
    
    if(self){
        super.grantType = @"password";
    }
    
    return self;
}

@end
