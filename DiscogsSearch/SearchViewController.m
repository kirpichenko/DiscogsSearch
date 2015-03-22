//
//  ViewController.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchManager.h"

@interface SearchViewController () 

@end

@implementation SearchViewController

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"search");
}

#pragma mark - Properties

- (SearchManager *)searchManager
{
    if (_searchManager == nil) {
        _searchManager = [SearchManager new];
    }
    return _searchManager;
}

@end
