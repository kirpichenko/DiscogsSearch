//
//  SearchItemCell.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "SearchItemCell.h"
#import "Item.h"

#import "UIImageView+AFNetworking.h"

@interface SearchItemCell ()
@property (nonatomic, weak) IBOutlet UIImageView *thumbImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@property (nonatomic, readwrite) Item *item;
@end

@implementation SearchItemCell

- (void)updateWithItem:(Item *)item
{
    [self setItem:item];

    [self.titleLabel setText:item.title];
    
    [self.thumbImageView setImage:nil];
    [self.thumbImageView setImageWithURL:item.thumbURL];
}

@end
