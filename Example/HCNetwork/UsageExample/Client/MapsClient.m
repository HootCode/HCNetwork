//
//  MapsClient.m
//  HCNetworking
//
//  Created by julien.GOUDET on 20/10/2015.
//  Copyright © 2015 Julien Goudet. All rights reserved.
//

#import "MapsClient.h"

@implementation MapsClient

/**
 *  Call this method to point on the one-and-only MapsClient
 *
 *  @return The static shared Maps client
 */
+ (instancetype) sharedClient {
    static MapsClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[MapsClient alloc] init];
    });
    
    return _sharedClient;
}

# pragma mark - Must Fill methods

- (NSURL*) baseURL {
    return [NSURL URLWithString:MapsClientBaseUrl];
}

# pragma mark - Requests -


+ (void)resultsForAddress:(NSString *)address WithBlock:(void (^)(MapsAddressResponse *response, HCError *error))block {
    [[self sharedClient] GET:[MapsAddressRequest requestForAddress:address] withBlock:block];
}


@end
