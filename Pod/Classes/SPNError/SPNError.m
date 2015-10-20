//
//  SPNError.m
//
//  Created by julien goudet on 24/06/2015.
//  Copyright (c) 2015 Julien Gdt. All rights reserved.
//

#import "SPNError.h"

@implementation SPNError

+ (SPNError *)errorWithErrorCode:(NSString *)errorCode {
	SPNError *error = [[SPNError alloc] init];

	error.errorCode = errorCode;

	return error;
}

+ (SPNError *)errorWithErrorCode:(NSString *)errorCode
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
    
	SPNError *error = [[SPNError alloc] init];

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

+ (SPNError *)errorFromHTTPError:(NSError *)httpError {
	SPNError *error = [SPNError errorWithErrorCode:[NSString stringWithFormat:@"%ld", (long)httpError.code]];

	error.popupMessage = [NSString stringWithFormat:@"%@ (%@)", httpError.userInfo, httpError.domain];

	return error;
}

+ (SPNError *)errorFromJSONError:(NSError *)jsonError {
	return [SPNError errorWithErrorCode:[NSString stringWithFormat:@"json:%ld", (long)jsonError.code]];
}

@end
