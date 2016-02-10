//
//  SPNBaseClient.m
//  Pods
//
//  Created by julien.GOUDET on 20/10/2015.
//
//

#import "SPNBaseClient.h"

@interface SPNBaseClient (){
    NSMutableDictionary *cookieStore;
}

@end

@implementation SPNBaseClient

#pragma mark - Class methods

+ (instancetype)sharedClient {
    static SPNBaseClient   *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[[self class] alloc] initWithBaseURL:_sharedClient.baseURL];
    });
    
    
    return _sharedClient;
}

- (NSURL *)baseURL {
    @throw [NSException exceptionWithName:@"SPNBaseClient Exception"
                                   reason:[NSString stringWithFormat:@"[%@] - You must override this method.", NSStringFromClass([self class])] userInfo:nil];
}

#pragma mark - Initializer

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.requestSerializer.HTTPShouldHandleCookies = ![self cookieStore];
    }
    
    return self;
}

#pragma mark - Main Requests - Public POST

- (AFHTTPRequestOperation *)POST:(SPNBaseRequest *)requestModel
                       withBlock:(void (^)(id responseModel, SPNError *error))block {
    return [self POST:[[requestModel class] relativeURL]  requestModel:requestModel disableError:NO withBlock:block];
}

- (AFHTTPRequestOperation *)POSTProgress:(SPNBaseRequest *)requestModel
                               withBlock:(void (^)(id responseModel, SPNError *error))block
                                progress:(void (^)(int percent))progress {
    return [self POST:[[requestModel class] relativeURL]  requestModel:requestModel disableError:NO withBlock:block progress:progress];
}

#pragma mark - Main Requests - Private POST

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                    requestModel:(id)requestModel
                    disableError:(BOOL)disableError
                       withBlock:(void (^)(id responseModel, SPNError *error))block {
    NSDictionary *parameters = nil;
    
    if (requestModel) {
        parameters = [requestModel toDictionary];
    }
    
    if (NEEDSTUB) {
        [requestModel enableStub];
    }
    
    return [self POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"[OK POST] Request With Params:\n\n URL = %@\n\n Params = %@ \n\n HeaderFields = %@ \n\n Response = \n\n %@", URLString, [requestModel toJSONString], [operation.request allHTTPHeaderFields], responseObject);
        
        [self operation:operation didSucceedWithResponse:responseObject requestObject:requestModel disableError:disableError withBlock:block];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[KO POST] Request With Params:\n URL = %@\n Params = %@ \n HeaderFields = %@ \n Reason = %@", URLString, [requestModel toJSONString], [operation.request allHTTPHeaderFields], operation.responseString);
        
        [self operation:operation didFailedWithError:error disableError:disableError withBlock:block];
    }];
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                    requestModel:(id)requestModel
                    disableError:(BOOL)disableError
                       withBlock:(void (^)(id responseModel, SPNError *error))block
                        progress:(void (^)(int percent))progress {
    
    AFHTTPRequestOperation *operation = [self POST:URLString requestModel:requestModel disableError:disableError withBlock:block];
    
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        progress((int)(totalBytesRead / totalBytesExpectedToRead * 100));
    }];
    
    return operation;
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                    requestModel:(id)requestModel
               multipartFormData:(void (^)(id <AFMultipartFormData> formData))formData
                       withBlock:(void (^)(id responseModel, SPNError *error))block {
    return [self POST:URLString requestModel:requestModel multipartFormData:formData disableError:NO withBlock:block];
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                    requestModel:(id)requestModel
               multipartFormData:(void (^)(id <AFMultipartFormData> formData))formData
                    disableError:(BOOL)disableError
                       withBlock:(void (^)(id responseModel, SPNError *error))block {
    NSDictionary *parameters = nil;
    
    if (requestModel) {
        parameters = [requestModel toDictionary];
    }
    
    return [self POST:URLString parameters:parameters constructingBodyWithBlock:formData success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"[OK POST] Request With Params:\n\n URL = %@\n\n Params = %@ \n\n HeaderFields = %@ \n\n Response = \n\n %@", URLString, [requestModel toJSONString], [operation.request allHTTPHeaderFields], responseObject);

        [self operation:operation didSucceedWithResponse:responseObject requestObject:requestModel disableError:disableError withBlock:block];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[KO POST] Request With Params:\n URL = %@\n Params = %@ \n HeaderFields = %@ \n Reason = %@", URLString, [requestModel toJSONString], [operation.request allHTTPHeaderFields], operation.responseString);

        [self operation:operation didFailedWithError:error disableError:disableError withBlock:block];
    }];
}

#pragma mark - Main Requests - Public GET

- (AFHTTPRequestOperation *)GET:(SPNBaseRequest *)requestModel
                      withBlock:(void (^)(id responseModel, SPNError *error))block {
    return [self GET:[[requestModel class] relativeURL]  requestModel:requestModel disableError:NO withBlock:block];
}

- (AFHTTPRequestOperation *)GETProgress:(SPNBaseRequest *)requestModel
                              withBlock:(void (^)(id responseModel, SPNError *error))block
                               progress:(void (^)(int percent))progress {
    return [self GET:[[requestModel class] relativeURL]  requestModel:requestModel disableError:NO withBlock:block progress:progress];
}

#pragma mark - Main Requests - Private GET

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                   requestModel:(id)requestModel
                   disableError:(BOOL)disableError
                      withBlock:(void (^)(id responseModel, SPNError *error))block {
    NSDictionary *parameters = nil;
    
    if (requestModel) {
        parameters = [requestModel toDictionary];
    }
    
    if (NEEDSTUB) {
        [[requestModel class] enableStub];
    }
    
    return [self GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"[OK GET] Request with URL = %@\n\n HeaderFields = %@ \n\n Response = \n\n %@", URLString, [operation.request allHTTPHeaderFields], responseObject);
        
        [self operation:operation didSucceedWithResponse:responseObject requestObject:requestModel disableError:disableError withBlock:block];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[KO GET] Request With URL = %@\n\n HeaderFields = %@\n\n Reason = %@", URLString, [operation.request allHTTPHeaderFields], operation.responseString);
        
        [self operation:operation didFailedWithError:error disableError:disableError withBlock:block];
    }];
}

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                   requestModel:(id)requestModel
                   disableError:(BOOL)disableError
                      withBlock:(void (^)(id responseModel, SPNError *error))block
                       progress:(void (^)(int percent))progress {
    
    AFHTTPRequestOperation *operation = [self GET:URLString requestModel:requestModel disableError:disableError withBlock:block];
    
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        progress((int)(totalBytesRead / totalBytesExpectedToRead * 100));
    }];
    
    return operation;
}

#pragma mark - Main Replies
- (void)operation:(AFHTTPRequestOperation *)operation didSucceedWithResponse:(id)responseObject requestObject:(id)requestObject disableError:(BOOL)disableError withBlock:(void (^)(id responseModel, SPNError *error))block {
    [self handleCookiesForOperation:operation];
    [self handleSuccessWithResponseObject:responseObject request:requestObject forURLRequest:operation.request disableError:disableError withBlock:block];
}

- (void)operation:(AFHTTPRequestOperation *)operation didFailedWithError:(NSError *)error disableError:(BOOL)disableError withBlock:(void (^)(id responseModel, SPNError *error))block {
    [self handleFailure:[SPNError errorFromHTTPError:error] forURLRequest:operation.request disableError:disableError withBlock:block];
}

- (void)handleSuccessWithResponseObject:(id)responseObject request:(id)requestObject forURLRequest:(NSURLRequest *)urlRequest disableError:(BOOL)disableError withBlock:(void (^)(id responseModel, SPNError *error))block {
    if (block) {
        NSError *jsonError    = nil;
        id      responseModel = [[[requestObject responseModel] alloc]initWithDictionary:responseObject error:&jsonError];
        
        if (!responseModel) {
            responseModel = [[SPNBaseResponse alloc] initWithDictionary:responseObject error:&jsonError];
        }
        
        if (!responseModel) {
            [self handleFailure:[SPNError errorFromJSONError:jsonError] forURLRequest:urlRequest disableError:disableError withBlock:block];
        } else if ([responseModel isOk]) {
            block(responseModel, nil);
        } else {
            SPNError *err = (SPNError *)[responseModel error];
            [self handleFailure:err forURLRequest:urlRequest disableError:disableError withBlock:block];
        }
    }
}

- (void)handleFailure:(SPNError *)error forURLRequest:(NSURLRequest *)urlRequest disableError:(BOOL)disableError withBlock:(void (^)(id responseModel, SPNError *error))block {
    error.urlRequest = urlRequest;
    
    /**
     *  Do what you want with the error here
     */
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:error.popupTitle
                                                   message:error.popupMessage
                                                  delegate:nil
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [alert show];
    
    if (block) {
        block(nil, error);
    }
}

#pragma mark - Cookies stuff

- (NSMutableDictionary *)cookieStore {
    if (!cookieStore) {
        cookieStore = [NSMutableDictionary new];
    }
    return cookieStore;
}

- (void)saveCookies:(NSArray *)cookies {
    if ([self cookieStore]) {
        for (NSHTTPCookie *cookie in cookies) {
            [self cookieStore][cookie.name] = cookie;
        }
    }
}

- (void)handleCookiesForOperation:(AFHTTPRequestOperation *)operation {
    if ([self cookieStore]) {
        NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:operation.response.allHeaderFields forURL:operation.request.URL];
        
        if ([cookies count]) {
            [self saveCookies:cookies];
        }
    }
}

@end
