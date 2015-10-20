//
//  MapsAddressResponse.m
//  LibSpirNetworking
//
//  Created by julien.GOUDET on 20/10/2015.
//  Copyright © 2015 Julien Goudet. All rights reserved.
//

#import "MapsAddressResponse.h"

@implementation MapsAddressResponse

- (BOOL)isOk {
    return [super isOk];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return NO;
}

/**
 *  [OPTIONAL] Implement this method to link your Object name to the JSON model
 *
 *  @return The map to use by the JSON Parser
 */
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{ @"results": @"results",
                                                        @"status": @"status"}];
}

@end
