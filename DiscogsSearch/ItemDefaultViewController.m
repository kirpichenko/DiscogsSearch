//
//  ArtistViewController.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/23/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "ItemDefaultViewController.h"
#import "Item.h"

#import "UIImageView+AFNetworking.h"

@interface ItemDefaultViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *photoImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) Item *item;
@end

@implementation ItemDefaultViewController

#pragma mark - Life Cycle

- (id)initWithItem:(Item *)item
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.item = item;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.titleLabel setText:self.item.title];
    [self.photoImageView setImageWithURL:self.item.thumbURL];
}

@end
