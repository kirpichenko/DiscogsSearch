//
//  NetworkManager.h
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "NetworkResponseSerializer.h"

@interface NetworkManager : NSObject

+ (void)sendURLRequest:(NSURLRequest *)request
    responseSerializer:(id<NetworkResponseSerializer>)serializer
       completionBlock:(void(^)(id response, NSError *error))completionBlock;

@end
