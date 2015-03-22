//
//  SearchManager.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "SearchManager.h"
#import "NetworkManager.h"
#import "NetworkRequestsFactory.h"
#import "NetworkResponseSerializerFactory.h"

@implementation SearchManager

- (void)findItemsWithQuery:(NSString *)query withCompletion:(SearchCompletionBlock)completionBlock
{
    NSURLRequest *request = [NetworkRequestsFactory searchRequestWithQuery:query];
    id serializer = [NetworkResponseSerializerFactory searchResponseSerializer];

    if (request) {
        [NetworkManager sendURLRequest:request responseSerializer:serializer
                       completionBlock:completionBlock];
    }
}

@end
