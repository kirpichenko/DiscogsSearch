//
//  SearchResponseSerializer.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "SearchResponseSerializer.h"

#import "EKMapper.h"

#import "Artist.h"
#import "Master.h"
#import "Release.h"
#import "Label.h"

@implementation SearchResponseSerializer

- (id)serializeJSONObject:(id)JSONObject
{
    if (![JSONObject isKindOfClass:[NSDictionary class]]) {
        return [NSDictionary dictionary];
    }

    NSMutableDictionary *serializedResponse = [NSMutableDictionary dictionary];
    
    NSArray *results = JSONObject[@"results"];
    for (NSDictionary *itemRepresentation in results) {
        NSString *itemType = itemRepresentation[@"type"];

        Class<EKMappingProtocol> itemClass = [self itemClassForType:itemType];
        if (itemClass) {
            NSMutableArray *itemsOfType = serializedResponse[itemType];
            if (itemsOfType == nil) {
                itemsOfType = [NSMutableArray array];
                serializedResponse[itemType] = itemsOfType;
            }

            Item *item = [EKMapper objectFromExternalRepresentation:itemRepresentation withMapping:[itemClass objectMapping]];
            [itemsOfType addObject:item];
        }
    }

    return [serializedResponse copy];
}

- (Class<EKMappingProtocol>)itemClassForType:(NSString *)type
{
    Class itemClass;

    if ([type isEqualToString:@"artist"]) {
        itemClass = [Artist class];
    }
    else if ([type isEqualToString:@"master"]) {
        itemClass = [Master class];
    }
    else if ([type isEqualToString:@"release"]) {
        itemClass = [Release class];
    }
    else if ([type isEqualToString:@"label"]) {
        itemClass = [Label class];
    }
    
    return itemClass;
}

@end
