//
//  SearchManager.h
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SearchCompletionBlock)(NSArray *items, NSError *error);

@interface SearchManager : NSObject

- (void)findItemsWithQuery:(NSString *)query withCompletion:(SearchCompletionBlock)completionBlock;

@end
