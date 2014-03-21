//
//  RKLogin.h
//  iwebapi2
//
//  Created by Rodolfo Torres on 11/03/14.
//  Copyright (c) 2014 Rodolfo Torres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface WebApiLogin : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *grantType;

- (id) initWithUser: (NSString *)username andPassword: (NSString *) password;


+ (RKObjectMapping *)mapping;

@end
