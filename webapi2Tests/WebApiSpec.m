#import "Kiwi.h"
#import "WebApiManager.h"
#import <RestKit/Testing.h>


SPEC_BEGIN(WebApiSpec)

describe(@"WebApiSpec", ^{
    __block NSBundle *testTargetBundle;
    
    beforeAll(^{
        testTargetBundle = [NSBundle bundleWithIdentifier:@"mbpr.rodolfo.torres.webapi2Tests"];
        [RKTestFixture setFixtureBundle:testTargetBundle];
    });
    
    context(@"when mapping a login object", ^{
        it(@"should not be null", ^{
           
            id parsedJSON = [RKTestFixture parsedObjectWithContentsOfFixture:@"login.json"];
            RKMappingTest *test = [RKMappingTest testForMapping:[WebApiLogin mapping] sourceObject:parsedJSON destinationObject:nil];
            
            [test addExpectation:[RKPropertyMappingTestExpectation expectationWithSourceKeyPath:@"username" destinationKeyPath:@"username"]];
            
            [[test shouldNot] equal:nil];
        });
    });
    
});

SPEC_END