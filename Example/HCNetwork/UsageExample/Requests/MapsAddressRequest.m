//
//  MapsAddressRequest.m
//  HCNetworking
//
//  Created by julien.GOUDET on 20/10/2015.
//  Copyright © 2015 Julien Goudet. All rights reserved.
//

#import "MapsAddressRequest.h"

@implementation MapsAddressRequest

- (Class)responseModel {
    return [MapsAddressResponse class];
}

+ (NSString *)relativeURL {
    return @"";
}

+ (MapsAddressRequest *)requestForAddress:(NSString *)address {
    
    MapsAddressRequest* request = [MapsAddressRequest new];
    request.address             = address;
    
    return request;
}

@end
