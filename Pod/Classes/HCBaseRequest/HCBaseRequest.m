//
//  HCBaseRequest.m
//  Pods
//
//  Created by julien.GOUDET on 20/10/2015.
//
//

#import "HCBaseRequest.h"
#import "TTTURLRequestFormatter.h"


@implementation HCBaseRequest

#pragma mark - Getters

- (Class)responseModel {
	@throw [NSException exceptionWithName:@"HCBaseRequest Exception"
	                               reason:[NSString stringWithFormat:@"[%@] - You must override this method. A request can't have a response model, inherited from HCBaseResponse", NSStringFromClass([self class])] userInfo:nil];
}

- (NSString *)relativeURL {
	@throw [NSException exceptionWithName:@"HCBaseRequest Exception"
	                               reason:[NSString stringWithFormat:@"[%@] - You must override this method. Client give the base URL, but you have to give here the endpoint", NSStringFromClass([self class])] userInfo:nil];
}

#pragma mark - OHHTTPStubs


NSString *const DefaultStubBundleName = @"Stubs.bundle";
NSString *const DefaultStubPath = nil;

+ (NSString *) stubBundleName{
    return DefaultStubBundleName;
}

+ (NSString *) stubPath{
    return DefaultStubPath;
}

+ (NSString*)stubName {
    @throw [NSException exceptionWithName:@"HCBaseRequest Exception"
                                   reason:[NSString stringWithFormat:@"[%@] - You must override this method. Request can handle default path for Stub bundle, but you need to give the name of your json !", NSStringFromClass([self class])] userInfo:nil];
}

+ (id <OHHTTPStubsDescriptor> )enableStub {

    return [OHHTTPStubs stubRequestsPassingTest: ^BOOL (NSURLRequest *request) {
        return ([request.URL.path rangeOfString:[[self new] relativeURL]].location != NSNotFound);
    } withStubResponse: ^OHHTTPStubsResponse *(NSURLRequest *request) {
        
        NSString *mainBundlePath  = [[NSBundle mainBundle] resourcePath];
        NSString *stubsBundlePath = [mainBundlePath stringByAppendingPathComponent:[self stubBundleName]];
        NSBundle * stubsBundle    = [NSBundle bundleWithPath:stubsBundlePath];

        NSString * fixture        = [stubsBundle pathForResource:[self stubName]
                                                          ofType:@"json"
                                                     inDirectory:[self stubPath]];
        
        BOOL success = ![[self stubName] hasSuffix:@"KO"];
        
        return [OHHTTPStubsResponse responseWithFileAtPath:(success ? fixture : nil)
                                                statusCode:(success ? Success200 : InternalError500) headers:@{ @"Content-Type":@"application/json" }];
    }];
}


@end
