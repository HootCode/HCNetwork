//
//  HCEnumerations.h
//  Pods
//
//  Created by julien.GOUDET on 20/11/2015.
//
//


typedef NS_ENUM(NSInteger, HTTPCodeInformation) {
    Continue100           = 100,
    SwitchingProtocols101 = 101,
    Processing102         = 102
};


typedef NS_ENUM(NSInteger, HTTPCodeSuccess) {
    Success200        = 200,
    Created201        = 201,
    Accepted202       = 202,
    NoCertified203    = 203,
    NoContent204      = 204,
    ResetContent205   = 205,
    PartialContent206 = 206,
    MultiStatus207    = 207,
    DiffContent210    = 210,
    IMUsed226         = 226
};



typedef NS_ENUM(NSInteger, HTTPCodeRedirect) {
    MultipleChoices300     = 300,
    MovedPermanently301    = 301,
    MovedTemporarily302    = 302,
    SeeOther303            = 303,
    NotModified304         = 304,
    UseProxy305            = 305,
    RedirectTemporarily307 = 307,
    RedirectPermanently308 = 308,
    TooManyRedirects310    = 310
};

typedef NS_ENUM(NSInteger, HTTPCodeAppError) {
    BadRequest400           = 400,
    Unauthorized401         = 401,
    PaymentRequired402      = 402,
    Forbidden403            = 403,
    NotFound404             = 404,
    NotAllowed405           = 405,
    NotAcceptable406        = 406,
    ProxyAuthRequired407    = 407,
    RequestTimeOut408       = 408,
    Gone410                 = 410,
    LenghtRequired411       = 411,
    PreconditionFailed412   = 412,
    RequestTooBig413        = 413,
    URITooLong414           = 414,
    UnsupportedMediaType415 = 415,
    IncorrectRange416       = 416,
    ExpectionFailed417      = 417,
    TeapotMotherFucker418   = 418,
    UnprocessableRequest422 = 422,
    Locked423               = 423,
    MethodFailure424        = 424,
    UnorderedCollection425  = 425,
    TLSUpgradeRequired426   = 426,
    PreconditionRequired428 = 428,
    TooManyRequests429      = 429,
    HeadersTooBig431        = 431,
    RetryWith449            = 449,
    ParentalControl450      = 450,
    IllegalInYourState451   = 451,
    UnrecoverableError456   = 456,
    AppCloseConnection499   = 499
};


typedef NS_ENUM(NSInteger, HTTPCodeServerError) {
    InternalError500           = 500,
    NotImplemented501          = 501,
    BadGateway502              = 502,
    ServiceUnavailable503      = 503,
    GatewayTimeOut504          = 504,
    NotSupportedHTTPVersion505 = 505,
    NegociationError506        = 506,
    InsufficiantStorage507     = 507,
    LoopDetected508            = 508,
    BandwidthLimitExceeded509  = 509,
    NotExtended510             = 510,
    NetworkAuthRequired511     = 511,
    UnknownError520            = 520
};
