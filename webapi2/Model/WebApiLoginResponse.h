//
//  RKLoginResponse.h
//  iwebapi2
//
//  Created by Rodolfo Torres on 11/03/14.
//  Copyright (c) 2014 Rodolfo Torres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface WebApiLoginResponse : NSObject

//userName=teste1
@property (nonatomic, strong) NSString *username;
//token_type=bearer
@property (nonatomic, strong) NSString *tokenType;
//access_token=
@property (nonatomic, strong) NSString *acessToken;

+ (RKObjectMapping *) mapping;

@end
