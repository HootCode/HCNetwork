//
//  ef.m
//  Pods
//
//  Created by julien.GOUDET on 20/10/2015.
//
//

#import "JSONModel.h"
#import "HCError.h"

#import "HCEnumerations.h"
#import "HCConstants.h"

@interface HCBaseResponse : JSONModel

/**
 *  Call this method to know if main checker for the response are OK.
 *  Ex: root returnCode is 0, critical datas are here ... etc
 *
 *  @return YES if checks are good, else NO
 */
- (BOOL)isOk;

/**
 *  Call this method to get the associated error when [self isOk] return NO
 *
 *  @return The given and self generated Error object
 */
- (HCError *)error;

@end
