//
//  SPNCookieStore.h
//  Pods
//
//  Created by julien.GOUDET on 20/10/2015.
//
//

#import <Foundation/Foundation.h>

@interface SPNCookieStore : NSObject

+ (instancetype)sharedStore;

@property (nonatomic, strong) NSMutableDictionary *mainStore;

@end
