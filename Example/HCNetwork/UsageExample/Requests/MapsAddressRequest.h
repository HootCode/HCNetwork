//
//  MapsAddressRequest.h
//  HCNetworking
//
//  Created by julien.GOUDET on 20/10/2015.
//  Copyright © 2015 Julien Goudet. All rights reserved.
//

#import "MapsAddressResponse.h"

@interface MapsAddressRequest : HCBaseRequest

@property (nonatomic, strong) NSString* address;

+ (MapsAddressRequest *)requestForAddress:(NSString *)address;

@end
