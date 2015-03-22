//
//  ViewController.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchItemsPresenter.h"
#import "SearchManager.h"

@interface SearchViewController () <UITableViewDataSource, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) SearchItemsPresenter *presenter;
@property (nonatomic, strong) NSDictionary *foundItems;
@end

@implementation SearchViewController

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    __weak typeof(self) weakSelf = self;
    [self.searchManager findItemsWithQuery:searchBar.text withCompletion:^(NSDictionary *items, NSError *error) {
        if (error == nil) {
            [weakSelf setFoundItems:items];
            [weakSelf.tableView reloadData];
        }
        else {
            [weakSelf showError:error];
        }
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.foundItems.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = self.foundItems.allKeys[section];
    NSArray *items = self.foundItems[key];

    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark - UITableViewDelegate

#pragma mark - Properties

- (SearchManager *)searchManager
{
    if (_searchManager == nil) {
        _searchManager = [SearchManager new];
    }
    return _searchManager;
}

#pragma mark - Private

- (void)showError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] init];

    [alert setTitle:error.domain];
    [alert setMessage:error.localizedDescription];
    [alert show];
}

@end
