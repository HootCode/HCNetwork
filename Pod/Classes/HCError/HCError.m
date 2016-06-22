//
//  HCError.m
//
//  Created by julien goudet on 24/06/2015.
//  Copyright (c) 2015 Julien Gdt. All rights reserved.
//

#import "HCError.h"

@implementation HCError

+ (HCError *)errorWithErrorCode:(NSString *)errorCode {
	HCError *error = [[HCError alloc] init];

	error.errorCode = errorCode;

	return error;
}

+ (HCError *)errorWithErrorCode:(NSString *)errorCode
          shouldDeleteClientInfo:(BOOL)deleteClientInfo
          shouldDeleteCachedData:(BOOL)deleteCachedData
      shouldDeleteEncryptionKeys:(BOOL)deleteEncryptionKeys
       shouldDeleteLocalDataKeys:(BOOL)deleteLocalDataKeys
           shouldDeleteLocalData:(BOOL)deleteLocalData
        shouldDeleteAuthentToken:(BOOL)deleteAuthentToken
                    shouldLogout:(BOOL)logout
            shouldRedirectToHome:(BOOL)redirectToHome
                    shouldGoBack:(BOOL)goBack
                  withPopupTitle:(NSString *)popupTitle
                withPopupMessage:(NSString *)popupMessage
                    withPopupTag:(NSInteger)popupTag {
    
	HCError *error = [[HCError alloc] init];

	error.errorCode = errorCode;
	error.deleteClientInfo = deleteClientInfo;
	error.deleteCachedData = deleteCachedData;
	error.deleteEncryptionKeys = deleteEncryptionKeys;
	error.deleteLocalDataKeys = deleteLocalDataKeys;
	error.deleteLocalData = deleteLocalData;
	error.deleteAuthentToken = deleteAuthentToken;
	error.logout = logout;
	error.redirectToHome = redirectToHome;
	error.goBack = goBack;
	error.popupTitle = popupTitle;
	error.popupMessage = popupMessage;
	error.popupTag = popupTag;

	return error;
}

+ (HCError *)errorFromHTTPError:(NSError *)httpError {
	HCError *error = [HCError errorWithErrorCode:[NSString stringWithFormat:@"%ld", (long)httpError.code]];

	error.popupMessage = [NSString stringWithFormat:@"%@ (%@)", httpError.userInfo, httpError.domain];

	return error;
}

+ (HCError *)errorFromJSONError:(NSError *)jsonError {
	return [HCError errorWithErrorCode:[NSString stringWithFormat:@"json:%ld", (long)jsonError.code]];
}

@end
