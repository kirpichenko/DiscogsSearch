//
//  Item.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "Item.h"

@implementation Item

+ (EKObjectMapping *)objectMapping
{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromArray:@[@"name"]];
        [mapping mapKeyPath:@"thumb" toProperty:@"thumbURL" withValueBlock:^id(NSString *key, id value) {
            return [NSURL URLWithString:value];
        }];
    }];
}

@end
