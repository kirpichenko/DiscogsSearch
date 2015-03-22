//
//  NetworkManager.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "NetworkManager.h"

#import "AFNetworking.h"

@interface ResponseSerializerAdapter : AFJSONResponseSerializer

- (id)initWithResponseSerializer:(id<NetworkResponseSerializer>)serializer;

@property (nonatomic, readonly) id<NetworkResponseSerializer> serializer;

@end

@implementation ResponseSerializerAdapter

- (id)initWithResponseSerializer:(id<NetworkResponseSerializer>)serializer
{
    if (self = [super init]) {
        _serializer = serializer;
    }
    return self;
}

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    id responseObject = [super responseObjectForResponse:response data:data error:error];
    if (*error == nil) {
        responseObject = [self.serializer serializeJSONObject:responseObject];
    }

    return responseObject;
}

@end

@implementation NetworkManager

#pragma mark - Public

+ (void)sendURLRequest:(NSURLRequest *)request
    responseSerializer:(id<NetworkResponseSerializer>)serializer
       completionBlock:(void(^)(id response, NSError *error))completionBlock
{
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setResponseSerializer:[[ResponseSerializerAdapter alloc] initWithResponseSerializer:serializer]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completionBlock) {
            completionBlock(responseObject, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completionBlock) {
            completionBlock(nil, error);
        }
    }];
    
    [operation start];
}

@end
