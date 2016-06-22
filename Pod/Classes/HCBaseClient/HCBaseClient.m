//
//  HCBaseClient.m
//  Pods
//
//  Created by julien.GOUDET on 20/10/2015.
//
//

#import "HCBaseClient.h"

@interface HCBaseClient (){
    NSMutableDictionary *cookieStore;
}

@end

@implementation HCBaseClient

#pragma mark - Class methods

+ (instancetype)sharedClient {
    static HCBaseClient   *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[[self class] alloc] initWithBaseURL:_sharedClient.baseURL];
    });
    
    
    return _sharedClient;
}

- (NSURL *)baseURL {
    @throw [NSException exceptionWithName:@"HCBaseClient Exception"
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

- (AFHTTPRequestOperation *)POST:(HCBaseRequest *)requestModel
                       withBlock:(void (^)(id responseModel, HCError *error))block {
    return [self POST:[requestModel relativeURL]  requestModel:requestModel disableError:NO withBlock:block];
}

- (AFHTTPRequestOperation *)POSTProgress:(HCBaseRequest *)requestModel
                               withBlock:(void (^)(id responseModel, HCError *error))block
                                progress:(void (^)(int percent))progress {
    return [self POST:[requestModel relativeURL]  requestModel:requestModel disableError:NO withBlock:block progress:progress];
}

#pragma mark - Main Requests - Private POST

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                    requestModel:(id)requestModel
                    disableError:(BOOL)disableError
                       withBlock:(void (^)(id responseModel, HCError *error))block {
    NSDictionary *parameters = nil;
    
    if (requestModel) {
        parameters = [requestModel toDictionary];
    }
    
    if (NEEDSTUB) {
        [requestModel enableStub];
    }
    
    return [self POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"⭕️ [OK POST] Request With Params:\n\n URL = %@\n\n Params = %@ \n\n HeaderFields = %@ \n\n Response = \n\n %@", operation.request.URL, [requestModel toJSONString], [operation.request allHTTPHeaderFields], responseObject);
        
        [self operation:operation didSucceedWithResponse:responseObject requestObject:requestModel disableError:disableError withBlock:block];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"❌ [KO POST] Request With Params:\n URL = %@\n Params = %@ \n HeaderFields = %@ \n Reason = %@", operation.request.URL, [requestModel toJSONString], [operation.request allHTTPHeaderFields], operation.responseString);
        
        [self operation:operation didFailedWithError:error disableError:disableError withBlock:block];
    }];
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                    requestModel:(id)requestModel
                    disableError:(BOOL)disableError
                       withBlock:(void (^)(id responseModel, HCError *error))block
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
                       withBlock:(void (^)(id responseModel, HCError *error))block {
    return [self POST:URLString requestModel:requestModel multipartFormData:formData disableError:NO withBlock:block];
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                    requestModel:(id)requestModel
               multipartFormData:(void (^)(id <AFMultipartFormData> formData))formData
                    disableError:(BOOL)disableError
                       withBlock:(void (^)(id responseModel, HCError *error))block {
    NSDictionary *parameters = nil;
    
    if (requestModel) {
        parameters = [requestModel toDictionary];
    }
    
    return [self POST:URLString parameters:parameters constructingBodyWithBlock:formData success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"⭕️ [OK POST] Request With Params:\n\n URL = %@\n\n Params = %@ \n\n HeaderFields = %@ \n\n Response = \n\n %@", operation.request.URL, [requestModel toJSONString], [operation.request allHTTPHeaderFields], responseObject);

        [self operation:operation didSucceedWithResponse:responseObject requestObject:requestModel disableError:disableError withBlock:block];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"❌ [KO POST] Request With Params:\n URL = %@\n Params = %@ \n HeaderFields = %@ \n Reason = %@", operation.request.URL, [requestModel toJSONString], [operation.request allHTTPHeaderFields], operation.responseString);

        [self operation:operation didFailedWithError:error disableError:disableError withBlock:block];
    }];
}

#pragma mark - Main Requests - Public PUT

- (AFHTTPRequestOperation *)PUT:(HCBaseRequest *)requestModel
                      withBlock:(void (^)(id responseModel, HCError *error))block{
        return [self PUT:[requestModel relativeURL]  requestModel:requestModel disableError:NO withBlock:block];
}

#pragma mark - Main Requests - Private PUT

- (AFHTTPRequestOperation *)PUT:(NSString *)URLString
                    requestModel:(id)requestModel
                    disableError:(BOOL)disableError
                       withBlock:(void (^)(id responseModel, HCError *error))block {
    NSDictionary *parameters = nil;
    
    if (requestModel) {
        parameters = [requestModel toDictionary];
    }
    
    if (NEEDSTUB) {
        [requestModel enableStub];
    }
    
    return [self PUT:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"⭕️ [OK PUT] Request With Params:\n\n URL = %@\n\n Params = %@ \n\n HeaderFields = %@ \n\n Response = \n\n %@", operation.request.URL, [requestModel toJSONString], [operation.request allHTTPHeaderFields], responseObject);
        
        [self operation:operation didSucceedWithResponse:responseObject requestObject:requestModel disableError:disableError withBlock:block];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"❌ [KO PUT] Request With Params:\n URL = %@\n Params = %@ \n HeaderFields = %@ \n Reason = %@", operation.request.URL, [requestModel toJSONString], [operation.request allHTTPHeaderFields], operation.responseString);
        
        [self operation:operation didFailedWithError:error disableError:disableError withBlock:block];
    }];
}

#pragma mark - Main Requests - Public DELETE

- (AFHTTPRequestOperation *)DELETE:(HCBaseRequest *)requestModel
                      withBlock:(void (^)(id responseModel, HCError *error))block {
    return [self DELETE:[requestModel relativeURL]  requestModel:requestModel disableError:NO withBlock:block];
}

- (AFHTTPRequestOperation *)DELETEProgress:(HCBaseRequest *)requestModel
                              withBlock:(void (^)(id responseModel, HCError *error))block
                               progress:(void (^)(int percent))progress {
    return [self DELETE:[requestModel relativeURL]  requestModel:requestModel disableError:NO withBlock:block progress:progress];
}

#pragma mark - Main Requests - Private DELETE

- (AFHTTPRequestOperation *)DELETE:(NSString *)URLString
                   requestModel:(id)requestModel
                   disableError:(BOOL)disableError
                      withBlock:(void (^)(id responseModel, HCError *error))block {
    NSDictionary *parameters = nil;
    
    if (requestModel) {
        parameters = [requestModel toDictionary];
    }
    
    if (NEEDSTUB) {
        [[requestModel class] enableStub];
    }
    
    return [self DELETE:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"⭕️ [OK DELETE] Request with URL = %@\n\n HeaderFields = %@ \n\n Response = \n\n %@", operation.request.URL, [operation.request allHTTPHeaderFields], responseObject);
        
        [self operation:operation didSucceedWithResponse:responseObject requestObject:requestModel disableError:disableError withBlock:block];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"❌ [KO DELETE] Request With URL = %@\n\n HeaderFields = %@\n\n Reason = %@", operation.request.URL, [operation.request allHTTPHeaderFields], operation.responseString);
        
        [self operation:operation didFailedWithError:error disableError:disableError withBlock:block];
    }];
}

-(NSError*)errorWithOperation:(AFHTTPRequestOperation*)operation andBaseError:(NSError*)error
{
    NSMutableDictionary* dico = [NSMutableDictionary dictionaryWithDictionary:error.userInfo];
    dico[@"NSLocalizedDescription"] = [self retrieveSpirMessage:operation.responseObject]?:error.userInfo[@"NSLocalizedDescription"];
    NSError* err = [NSError errorWithDomain:error.domain code:error.code userInfo:dico];
    return err;
}

-(NSString*)retrieveSpirMessage:(id)json
{
    NSString* message;
    
    if ([json isKindOfClass:[NSDictionary class]]) {
        message = [json valueForKey:@"Message"];
        
        if (message==nil) {
            message = [json valueForKey:@"ErrorMessage"];
        }
        
        if (message==nil) {
            message = [json valueForKey:@"message"];
        }
    }else if ([json isKindOfClass:[NSArray class]])
    {
        NSArray* errors;
        @try {
            errors = [json valueForKey:@"ErrorMessage"];
        }
        @catch (NSException *exception) {
            if(exception) NSLog(@"<WSKIT> ❌ Got error parsing ErrorMessage : %@", exception.description);
        }
        
        if ([errors containsObject:[NSNull null]]) {
            @try {
                errors = [json valueForKey:@"message"];
            }
            @catch (NSException *exception) {
                if(exception) NSLog(@"<WSKIT> ❌ Got error parsing error : %@", exception.description);
            }
        }
        
        for (id potentialError in errors) {
            if (potentialError != [NSNull null]) {
                if (message==nil) message=[NSString stringWithFormat:@"%@\n",potentialError];
                else message = [message stringByAppendingFormat:@"\n%@\n",potentialError];
            }
        }
    }
    
    return [message stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
}


- (AFHTTPRequestOperation *)DELETE:(NSString *)URLString
                   requestModel:(id)requestModel
                   disableError:(BOOL)disableError
                      withBlock:(void (^)(id responseModel, HCError *error))block
                       progress:(void (^)(int percent))progress {
    
    AFHTTPRequestOperation *operation = [self DELETE:URLString requestModel:requestModel disableError:disableError withBlock:block];
    
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        progress((int)(totalBytesRead / totalBytesExpectedToRead * 100));
    }];
    
    return operation;
}


#pragma mark - Main Requests - Public GET

- (AFHTTPRequestOperation *)GET:(HCBaseRequest *)requestModel
                      withBlock:(void (^)(id responseModel, HCError *error))block {
    return [self GET:[requestModel relativeURL]  requestModel:requestModel disableError:NO withBlock:block];
}

- (AFHTTPRequestOperation *)GETProgress:(HCBaseRequest *)requestModel
                              withBlock:(void (^)(id responseModel, HCError *error))block
                               progress:(void (^)(int percent))progress {
    return [self GET:[requestModel relativeURL]  requestModel:requestModel disableError:NO withBlock:block progress:progress];
}

#pragma mark - Main Requests - Private GET

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                   requestModel:(id)requestModel
                   disableError:(BOOL)disableError
                      withBlock:(void (^)(id responseModel, HCError *error))block {
    NSDictionary *parameters = nil;
    
    if (requestModel) {
        parameters = [requestModel toDictionary];
    }
    
    if (NEEDSTUB) {
        [[requestModel class] enableStub];
    }
    
    return [self GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"⭕️ [OK GET] Request with URL = %@\n\n HeaderFields = %@ \n\n Response = \n\n %@", operation.request.URL, [operation.request allHTTPHeaderFields], responseObject);
        
        [self operation:operation didSucceedWithResponse:responseObject requestObject:requestModel disableError:disableError withBlock:block];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"❌ [KO GET] Request With URL = %@\n\n HeaderFields = %@\n\n Reason = %@", operation.request.URL, [operation.request allHTTPHeaderFields], operation.responseString);
        
        [self operation:operation didFailedWithError:error disableError:disableError withBlock:block];
    }];
}

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                   requestModel:(id)requestModel
                   disableError:(BOOL)disableError
                      withBlock:(void (^)(id responseModel, HCError *error))block
                       progress:(void (^)(int percent))progress {
    
    AFHTTPRequestOperation *operation = [self GET:URLString requestModel:requestModel disableError:disableError withBlock:block];
    
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        progress((int)(totalBytesRead / totalBytesExpectedToRead * 100));
    }];
    
    return operation;
}

#pragma mark - Main Replies
- (void)operation:(AFHTTPRequestOperation *)operation didSucceedWithResponse:(id)responseObject requestObject:(id)requestObject disableError:(BOOL)disableError withBlock:(void (^)(id responseModel, HCError *error))block {
    [self handleCookiesForOperation:operation];
    [self handleSuccessWithResponseObject:responseObject request:requestObject forURLRequest:operation.request disableError:disableError withBlock:block];
}

- (void)operation:(AFHTTPRequestOperation *)operation didFailedWithError:(NSError *)error disableError:(BOOL)disableError withBlock:(void (^)(id responseModel, HCError *error))block {
    [self handleFailure:[HCError errorFromHTTPError:[self errorWithOperation:operation andBaseError:error]] forURLRequest:operation.request disableError:disableError withBlock:block];
}

- (void)handleSuccessWithResponseObject:(id)responseObject request:(id)requestObject forURLRequest:(NSURLRequest *)urlRequest disableError:(BOOL)disableError withBlock:(void (^)(id responseModel, HCError *error))block {
    if (block) {
        NSError *jsonError    = nil;
        id      responseModel = [[[requestObject responseModel] alloc]initWithDictionary:responseObject error:&jsonError];
        
        if (!responseModel) {
            responseModel = [[HCBaseResponse alloc] initWithDictionary:responseObject error:&jsonError];
        }
        
        if (!responseModel) {
            [self handleFailure:[HCError errorFromJSONError:jsonError] forURLRequest:urlRequest disableError:disableError withBlock:block];
        } else if ([responseModel isOk]) {
            block(responseModel, nil);
        } else {
            HCError *err = (HCError *)[responseModel error];
            [self handleFailure:err forURLRequest:urlRequest disableError:disableError withBlock:block];
        }
    }
}

- (void)handleFailure:(HCError *)error forURLRequest:(NSURLRequest *)urlRequest disableError:(BOOL)disableError withBlock:(void (^)(id responseModel, HCError *error))block {
    error.urlRequest = urlRequest;
    
    /**
     *  Do what you want with the error here
     */
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:error.popupTitle
                                                                   message:error.popupMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {}]];
    
    UIWindow* alertWindow          = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    alertWindow.rootViewController = [[UIViewController alloc] init];
    alertWindow.windowLevel        = UIWindowLevelAlert + 1;
    [alertWindow makeKeyAndVisible];
    [alertWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    
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
