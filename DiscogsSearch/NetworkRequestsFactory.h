//
//  RequestsFactory.h
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkRequestsFactory : NSObject

+ (NSURLRequest *)searchRequestWithQuery:(NSString *)query;

@end
