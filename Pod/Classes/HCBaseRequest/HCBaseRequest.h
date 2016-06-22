//
//  HCBaseRequest.h
//  Pods
//
//  Created by julien.GOUDET on 20/10/2015.
//
//

#import "JSONModel.h"
#import "AFNetworking.h"
#import "HCBaseResponse.h"

#import <OHHTTPStubs/OHHTTPStubs.h>

@interface HCBaseRequest : JSONModel

#pragma mark - Getters

- (Class)responseModel;

- (NSString *)relativeURL;

#pragma mark - Main Requests






#pragma mark - Stub Mode

extern NSString *const DefaultStubBundleName;
extern NSString *const DefaultStubPath;

+ (NSString *) stubBundleName;

+ (NSString *) stubPath;

+ (NSString *) stubName;

+ (id <OHHTTPStubsDescriptor> )enableStub;


@end
