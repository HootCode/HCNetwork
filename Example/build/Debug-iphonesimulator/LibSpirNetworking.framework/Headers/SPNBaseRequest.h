//
//  SPNBaseRequest.h
//  Pods
//
//  Created by julien.GOUDET on 20/10/2015.
//
//

#import "JSONModel.h"
#import "AFNetworking.h"
#import "SPNBaseResponse.h"

#ifdef STUB
#import <OHHTTPStubs/OHHTTPStubs.h>
#endif
@interface SPNBaseRequest : JSONModel

#pragma mark - Getters

- (Class)responseModel;

+ (NSString *)relativeURL;

#pragma mark - Main Requests




#ifdef STUB

#pragma mark - Stub Mode

+ (id <OHHTTPStubsDescriptor> )enableStub;

+ (id <OHHTTPStubsDescriptor> )enableStubWithFileNamed:(NSString *)fileName;

#endif

@end