//
//  MapsAddressResponse.h
//  LibSpirNetworking
//
//  Created by julien.GOUDET on 20/10/2015.
//  Copyright © 2015 Julien Goudet. All rights reserved.
//

#import <LibSpirNetworking/LibSpirNetworking.h>

@interface MapsAddressResponse : SPNBaseResponse

@property (nonatomic, strong) NSArray* results;
@property (nonatomic, strong) NSString* status;

@end
