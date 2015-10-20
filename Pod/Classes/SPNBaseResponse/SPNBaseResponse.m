//
//  SPNBaseResponse.m
//  Pods
//
//  Created by julien.GOUDET on 20/10/2015.
//
//

#import "SPNBaseResponse.h"

@implementation SPNBaseResponse

- (BOOL)isOk {
	return YES;
}

- (SPNError *)error {
	return nil;
}

@end
