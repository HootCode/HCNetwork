//
//  HCBaseClient.h
//  Pods
//
//  Created by julien.GOUDET on 20/10/2015.
//
//

#import "AFHTTPRequestOperationManager.h"
#import "HCError.h"
#import "HCBaseRequest.h"


/**
   `HCBaseClient` is a subclass of `AFHTTPRequestOperationManager`. It encapsulates all you need to simply send requests and receive responses, errors or progress state
 */
@interface HCBaseClient : AFHTTPRequestOperationManager

/**
 *  Call this method to get the one and only client
 *
 *  @return the shared instance
 */
+ (instancetype)sharedClient;

/**
 *  Call this method to save into shared client the given array of cookie
 *
 *  @param cookies An array of NSHTTPCookie
 */
- (void)saveCookies:(NSArray *)cookies;

/**
 *  Call this method to get all cookies for this shared client
 *
 *  @return all the cookie in a dictionary (key:value)
 */
- (NSMutableDictionary *)cookieStore;




#pragma mark - Main Requests - Public POST

/**
 *  Call this method to send the given request through POST method
 *
 *  @param requestModel the given request to send
 *  @param block        the completion block, call on success with responser and/or error
 *
 *  @return the AFHTTPRequestOperation created if you want it
 */
- (AFHTTPRequestOperation *)POST:(HCBaseRequest *)requestModel
                       withBlock:(void (^)(id responseModel, HCError *error))block;

/**
 *  Call this method to send the given request through POST method
 *
 *  @param requestModel the given request to send
 *  @param block        the completion block, call on success with responser and/or error
 *  @param progress     The progress block, called on every packet received, giving you the progress download in percent
 *
 *  @return the AFHTTPRequestOperation created if you want it
 */
- (AFHTTPRequestOperation *)POSTProgress:(HCBaseRequest *)requestModel
                               withBlock:(void (^)(id responseModel, HCError *error))block
                                progress:(void (^)(int percent))progress;


/**
 *  Call this method to send the given request through PUT method
 *
 *  @param requestModel the given request to send
 *  @param block        the completion block, call on success with responser and/or error
 *
 *  @return the AFHTTPRequestOperation created if you want it
 */
- (AFHTTPRequestOperation *)PUT:(HCBaseRequest *)requestModel
                       withBlock:(void (^)(id responseModel, HCError *error))block;

/**
 *  Call this method to send the given request through DELETE method
 *
 *  @param requestModel the given request to send
 *  @param block        the completion block, call on success with responser and/or error
 *
 *  @return the AFHTTPRequestOperation created if you want it
 */
- (AFHTTPRequestOperation *)DELETE:(HCBaseRequest *)requestModel
                      withBlock:(void (^)(id responseModel, HCError *error))block;

- (AFHTTPRequestOperation *)DELETEProgress:(HCBaseRequest *)requestModel
                              withBlock:(void (^)(id responseModel, HCError *error))block
                               progress:(void (^)(int percent))progress;


#pragma mark - Main Requests - Public GET

/**
 *  Call this method to send the given request through POST method
 *
 *  @param requestModel the given request to send
 *  @param block        the completion block, call on success with responser and/or error
 *
 *  @return the AFHTTPRequestOperation created if you want it
 */
- (AFHTTPRequestOperation *)GET:(HCBaseRequest *)requestModel
                      withBlock:(void (^)(id responseModel, HCError *error))block;

/**
 *  Call this method to send the given request through GET method
 *
 *  @param requestModel the given request to send
 *  @param block        the completion block, call on success with responser and/or error
 *  @param progress     The progress block, called on every packet received, giving you the progress download in percent
 *
 *  @return the AFHTTPRequestOperation created if you want it
 */
- (AFHTTPRequestOperation *)GETProgress:(HCBaseRequest *)requestModel
                              withBlock:(void (^)(id responseModel, HCError *error))block
                               progress:(void (^)(int percent))progress;


//Parse Error
-(NSError*)errorWithOperation:(AFHTTPRequestOperation*)operation andBaseError:(NSError*)error;

/**
 *  Override this method to handle the error (for ex: Popup) and re-arrange it, then do what you want
 *
 *  @param error        The pre-formatted error
 *  @param urlRequest   The request which fire the error
 *  @param disableError YES if we have to fire the error
 *  @param block        the completion block to continue the process
 */
- (void)handleFailure:(HCError *)error forURLRequest:(NSURLRequest *)urlRequest disableError:(BOOL)disableError withBlock:(void (^)(id responseModel, HCError *error))block;

@end
