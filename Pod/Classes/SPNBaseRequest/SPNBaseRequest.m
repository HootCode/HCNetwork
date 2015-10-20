//
//  SPNBaseRequest.m
//  Pods
//
//  Created by julien.GOUDET on 20/10/2015.
//
//

#import "SPNBaseRequest.h"
#import "TTTURLRequestFormatter.h"


@implementation SPNBaseRequest

#pragma mark - Getters

- (Class)responseModel {
	@throw [NSException exceptionWithName:@"SPNBaseRequest Exception"
	                               reason:[NSString stringWithFormat:@"[%@] - You must override this method. A request can't have a response model, inherited from SPNBaseResponse", NSStringFromClass([self class])] userInfo:nil];
}

+ (NSString *)relativeURL {
	@throw [NSException exceptionWithName:@"SPNBaseRequest Exception"
	                               reason:[NSString stringWithFormat:@"[%@] - You must override this method. Client give the base URL, but you have to give here the endpoint", NSStringFromClass([self class])] userInfo:nil];
}

#pragma mark - OHHTTPStubs

#ifdef STUB

+ (id <OHHTTPStubsDescriptor> )enableStubWithFileNamed:(NSString *)fileName {
	return [OHHTTPStubs stubRequestsPassingTest: ^BOOL (NSURLRequest *request) {
	    return ([request.URL.path rangeOfString:[self relativeURL]].location != NSNotFound);
	} withStubResponse: ^OHHTTPStubsResponse *(NSURLRequest *request) {
	    NSString *mainBundlePath      = [[NSBundle mainBundle] resourcePath];
	    NSString *stubsBundlePath = [mainBundlePath stringByAppendingPathComponent:@"Stubs.bundle"];

	    NSString *fixture = OHPathForFileInBundle(fileName, [NSBundle bundleWithPath:stubsBundlePath]);

	    return [OHHTTPStubsResponse responseWithFileAtPath:fixture
	                                            statusCode:200 headers:@{ @"Content-Type":@"application/json" }];
	}];
}

+ (id <OHHTTPStubsDescriptor> )enableStub {
	NSString *fileName = [[NSString stringWithFormat:@"%@", [self relativeURL]] stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

	return [self enableStubWithFileNamed:fileName];
}

#endif /* ifdef STUB */

@end
