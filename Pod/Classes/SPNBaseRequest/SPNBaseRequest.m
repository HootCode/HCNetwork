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


NSString *const DefaultStubBundleName = @"Stubs.bundle";
NSString *const DefaultStubPath = @"/";

+ (NSString *) stubBundleName{
    return DefaultStubBundleName;
}

+ (NSString *) stubPath{
    return DefaultStubPath;
}

+ (NSString*)stubName {
    return  NSStringFromClass([self class]);
}

+ (id <OHHTTPStubsDescriptor> )enableStubWithFileNamed:(NSString *)fileName {

}

+ (id <OHHTTPStubsDescriptor> )enableStub {

    return [OHHTTPStubs stubRequestsPassingTest: ^BOOL (NSURLRequest *request) {
        return ([request.URL.path rangeOfString:[self relativeURL]].location != NSNotFound);
    } withStubResponse: ^OHHTTPStubsResponse *(NSURLRequest *request) {
        
        NSString *mainBundlePath  = [[NSBundle mainBundle] resourcePath];
        NSString *stubsBundlePath = [mainBundlePath stringByAppendingPathComponent:[self stubBundleName]];
        NSBundle * stubsBundle    = [NSBundle bundleWithPath:stubsBundlePath];
        
        NSString * rgerf=@"TeamResponse";
        NSString * fixture        = [stubsBundle pathForResource:[[self stubPath] stringByAppendingString: @"TeamResponse"] ofType:@"json"];
        
        NSError * error;
        NSArray * directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:stubsBundlePath error:&error];
        
        return [OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                statusCode:200 headers:@{ @"Content-Type":@"application/json" }];
    }];
}


@end
