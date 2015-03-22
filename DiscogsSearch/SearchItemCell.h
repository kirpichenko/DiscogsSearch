//
//  SearchItemCell.h
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;

@interface SearchItemCell : UITableViewCell

- (void)updateWithItem:(Item *)item;

@property (nonatomic, readonly) Item *item;

@end
