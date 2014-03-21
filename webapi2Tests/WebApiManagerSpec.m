#import "Kiwi.h"
#import "WebApiManager.h"
#import "WebApiLoginResponse.h"

SPEC_BEGIN(WebApiManagerSpec)

describe(@"WebApiManagerSpec", ^{
    __block WebApiManager *manager;
    __block NSString *url;
    
    beforeAll(^{
        url = @"http://imanage.azurewebsites.net/";
        manager = [[WebApiManager alloc] initWithBaseUrl:url];
    });
    
    context(@"when creating a manager", ^{
        
        it(@"should not be null", ^{
            [[manager shouldNot] equal:nil];
        });
        
        it(@"should pass the correct url", ^{
            NSURL *expected = [[NSURL alloc] initWithString:url];
            [[manager.baseUrl should] equal:expected];
            
        });
    });
    
    context(@"when a valid user and password is passed", ^{
        
        it(@"should not be null", ^{
            
            __block WebApiLoginResponse *loginResponse;
            
            [manager loginAsyncUser:@"demo" withPassword:@"123456789"
                        sucess:^(WebApiLoginResponse *response) {
                            loginResponse = response;
                        } failure:^(NSString *error) {
                            NSLog(@"Error!!!");
                        }];            
            [[expectFutureValue(loginResponse) shouldEventuallyBeforeTimingOutAfter(5.0)] beNonNil];

        });
    });
    
    context(@"when an invalid user or password is passed", ^{
        
        it(@"should not be null", ^{
            
            __block WebApiLoginResponse *loginResponse;
            __block NSString *expectedError;
            
            [manager loginAsyncUser:@"demo" withPassword:@"123"
                        sucess:^(WebApiLoginResponse *response) {
                            loginResponse = response;
                        } failure:^(NSString *error) {
                            expectedError = error;
                        }];
            
            [[expectFutureValue(expectedError) shouldEventuallyBeforeTimingOutAfter(5.0)] equal:@"The user name or password is incorrect."];
            
        });
    });
    
});

SPEC_END