//
//  MapsClient.h
//  HCNetworking
//
//  Created by julien.GOUDET on 20/10/2015.
//  Copyright © 2015 Julien Goudet. All rights reserved.
//

#import <HCNetworking/HCNetworking.h>

#import "MapsClientResources.h"
#import "MapsAddressRequest.h"



@interface MapsClient : HCBaseClient

/**
 *  Call this method to fetch all results for a given address
 *
 *  @param tweetId The given address to find
 *  @param block   The completion block called on success or failure
 */
+ (void)resultsForAddress:(NSString *)address WithBlock:(void (^)(MapsAddressResponse *response, HCError *error))block;

@end
