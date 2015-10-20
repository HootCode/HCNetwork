//
//  SPNError.h
//
//  Created by julien goudet on 24/06/2015.
//  Copyright (c) 2015 Julien Gdt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPNError : NSObject

@property (nonatomic, copy) NSString *errorCode;

@property (nonatomic, assign) BOOL deleteClientInfo;
@property (nonatomic, assign) BOOL deleteCachedData;
@property (nonatomic, assign) BOOL deleteEncryptionKeys;
@property (nonatomic, assign) BOOL deleteLocalDataKeys;
@property (nonatomic, assign) BOOL deleteLocalData;
@property (nonatomic, assign) BOOL deleteAuthentToken;
@property (nonatomic, assign) BOOL logout;
@property (nonatomic, assign) BOOL redirectToHome;
@property (nonatomic, assign) BOOL goBack;
@property (nonatomic, copy) NSString *popupTitle;
@property (nonatomic, copy) NSString *popupMessage;
@property (nonatomic, assign) NSInteger popupTag;
@property (nonatomic, strong) NSURLRequest *urlRequest;

+ (SPNError *)errorWithErrorCode:(NSString *)errorCode;

+ (SPNError *)errorFromHTTPError:(NSError *)error;

+ (SPNError *)errorFromJSONError:(NSError *)error;

@end
