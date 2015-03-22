//
//  RequestsFactory.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "NetworkRequestsFactory.h"
#import "NetworkConstants.h"

#import "AFNetworking.h"

@implementation NetworkRequestsFactory

#pragma mark - Public

+ (NSURLRequest *)searchRequestWithQuery:(NSString *)query
{
    if (query.length == 0) {
        NSAssert(query, @"Query is not provided");
        return nil;
    }
    
    NSString *urlString = [self urlStringWithPath:searchPath];
    NSDictionary *parameters = @{@"q" : query,
                                 @"key" : consumerKey,
                                 @"secret" : consumerSecret};
    
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    NSURLRequest *request = [requestSerializer requestWithMethod:@"GET"
                                                       URLString:urlString parameters:parameters error:nil];
    return request;
}

#pragma mark - Private

+ (NSString *)urlStringWithPath:(NSString *)path
{
    NSString *urlString = [NSString stringWithFormat:@"%@://%@/%@", scheme, host, path];
    
    return urlString;
}

@end
