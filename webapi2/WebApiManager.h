//
//  WebApiManager.h
//  iwebapi2
//
//  Created by Rodolfo Torres on 11/03/14.
//  Copyright (c) 2014 Rodolfo Torres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "WebApiLoginResponse.h"
#import "WebApiLogin.h"
#import "SimpleWebApiLogin.h"
#import <RestKit/RestKit.h>

@interface WebApiManager : NSObject

@property (nonatomic, strong) NSURL *baseUrl;
@property (nonatomic, strong) RKObjectManager *manager;

@property (nonatomic, strong) WebApiLoginResponse *token;

- (id) initWithBaseUrl: (NSString *) url;
- (BOOL) registerAsyncUser:(NSString *)user withPassword:(NSString *) password;
- (void) loginAsyncUser:(NSString *)user withPassword:(NSString *) password sucess:(void (^)(WebApiLoginResponse *))sucess failure:(void (^)(NSString*))failure;

@end
