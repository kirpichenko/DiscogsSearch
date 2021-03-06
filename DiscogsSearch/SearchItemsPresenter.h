//
//  SearchItemsPresenter.h
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;

@interface SearchItemsPresenter : NSObject

- (id)initWithNavigationController:(UINavigationController *)navigationController;

- (void)presentItem:(Item *)item;

@end
