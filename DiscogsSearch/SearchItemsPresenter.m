//
//  SearchItemsPresenter.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "SearchItemsPresenter.h"

#import "Artist.h"
#import "ArtistViewController.h"

@interface SearchItemsPresenter ()
@property (nonatomic, weak) UINavigationController *navigationController;
@end

@implementation SearchItemsPresenter

#pragma mark - Life Cycle

- (id)initWithNavigationController:(UINavigationController *)navigationController
{
    if (self = [super init]) {
        self.navigationController = navigationController;
    }
    return self;
}

#pragma mark - Public

- (void)presentItem:(Item *)item
{
    UIViewController *presentingController;

    if ([item isKindOfClass:[Artist class]]) {
        presentingController = [[ArtistViewController alloc] initWithArtist:(Artist *)item];
    }
    
    if (presentingController) {
        [self.navigationController pushViewController:presentingController animated:YES];
    }
}

@end
