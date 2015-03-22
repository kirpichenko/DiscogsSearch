//
//  Item.h
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EKMappingProtocol.h"

@interface Item : NSObject <EKMappingProtocol>

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSURL *thumbURL;

@end
