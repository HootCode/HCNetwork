//
//  HCCookieStore.m
//  Pods
//
//  Created by julien.GOUDET on 20/10/2015.
//
//

#import "HCCookieStore.h"

@implementation HCCookieStore


+ (instancetype)sharedStore {
	static id _sharedStore = nil;
	static dispatch_once_t onceToken;

	dispatch_once(&onceToken, ^{
		_sharedStore = [[[self class] alloc] init];
	});

	return _sharedStore;
}

- (instancetype)init {
	self = [super init];

	if (self) {
		self.mainStore = [[NSMutableDictionary alloc]init];
	}

	return self;
}

@end
