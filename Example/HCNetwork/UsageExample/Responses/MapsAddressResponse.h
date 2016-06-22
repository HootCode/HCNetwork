//
//  MapsAddressResponse.h
//  HCNetworking
//
//  Created by julien.GOUDET on 20/10/2015.
//  Copyright © 2015 Julien Goudet. All rights reserved.
//

#import <HCNetworking/HCNetworking.h>

@interface MapsAddressResponse : HCBaseResponse

@property (nonatomic, strong) NSArray* results;
@property (nonatomic, strong) NSString* status;

@end
