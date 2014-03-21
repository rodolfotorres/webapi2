//
//  WebApiManager.m
//  iwebapi2
//
//  Created by Rodolfo Torres on 11/03/14.
//  Copyright (c) 2014 Rodolfo Torres. All rights reserved.
//

#import "WebApiManager.h"

@implementation WebApiManager

- (id)initWithBaseUrl: (NSString *) url
{
    self = [super init];
    if (self) {
        _baseUrl = [NSURL URLWithString:url];
        _manager = [RKObjectManager managerWithBaseURL:self.baseUrl];
    }
    return self;
}

-(BOOL) registerAsyncUser:(NSString *)user withPassword:(NSString *) password
{
    return YES;
}

//grant_type=password&username=teste1&password=teste1
- (void) loginAsyncUser:(NSString *)user withPassword:(NSString *) password sucess:(void (^)(WebApiLoginResponse *))sucess failure:(void (^)(NSString*))failure
{
    
    if(self.manager.requestDescriptors.count == 0){
        [self buildAndAddLogInDescriptors];
    }
    
    
    // Work with the object
    WebApiLogin *login = [[SimpleWebApiLogin alloc] initWithUser:user andPassword:password];
    
    // POST the parameterized representation of the `page` object to `/posts` and map the response
    [self.manager postObject:login path:@"/Token" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        _token = result.firstObject;
        sucess(result.firstObject);
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error){
        NSLog(@"Error: %@", error);
        failure([error localizedDescription]);
    }];
}

- (void)buildAndAddLogInDescriptors
{
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:[WebApiLogin mapping] objectClass:[SimpleWebApiLogin class] rootKeyPath:nil method:RKRequestMethodPOST];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[WebApiLoginResponse mapping] method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:nil];
    
    
    RKObjectMapping *errorMapping = [RKObjectMapping mappingForClass:[RKErrorMessage class]];
    
    [errorMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:nil toKeyPath:@"errorMessage"]];
    
    RKResponseDescriptor *errorDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:errorMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"error_description" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError)];
    
    // Register our descriptors with a manager
    [self.manager addRequestDescriptor:requestDescriptor];
    [self.manager addResponseDescriptor:responseDescriptor];
    [self.manager addResponseDescriptor:errorDescriptor];
}

@end
