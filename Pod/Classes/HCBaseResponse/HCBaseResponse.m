//
//  HCBaseResponse.m
//  Pods
//
//  Created by julien.GOUDET on 20/10/2015.
//
//

#import "HCBaseResponse.h"

@implementation HCBaseResponse

- (BOOL)isOk {
	return YES;
}

- (HCError *)error {
	return nil;
}

@end
