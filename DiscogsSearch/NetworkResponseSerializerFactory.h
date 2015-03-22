//
//  NetworkResponseSerializerFactory.h
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "NetworkResponseSerializer.h"

@interface NetworkResponseSerializerFactory : NSObject

+ (id<NetworkResponseSerializer>)searchResponseSerializer;

@end
