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
#import "SearchItemCell.h"

static NSString *const SearchItemCellIdentidifier = @"SearchItemCell";

@interface SearchViewController () <UITableViewDataSource, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndycator;

@property (nonatomic, strong) SearchItemsPresenter *presenter;
@property (nonatomic, strong) NSDictionary *foundItems;
@end

@implementation SearchViewController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:SearchItemCellIdentidifier bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:SearchItemCellIdentidifier];
    
    self.presenter = [[SearchItemsPresenter alloc] initWithNavigationController:self.navigationController];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];

    __weak typeof(self) weakSelf = self;
    [self.activityIndycator startAnimating];
    [self.searchManager findItemsWithQuery:searchBar.text withCompletion:^(NSDictionary *items, NSError *error) {
        if (error == nil) {
            [weakSelf setFoundItems:items];
            [weakSelf.tableView reloadData];
        }
        else {
            [weakSelf showError:error];
        }
        [weakSelf.activityIndycator stopAnimating];
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
    NSString *key = self.foundItems.allKeys[indexPath.section];
    NSArray *items = self.foundItems[key];
    
    SearchItemCell *itemCell = [tableView dequeueReusableCellWithIdentifier:SearchItemCellIdentidifier];
    [itemCell updateWithItem:items[indexPath.row]];

    return itemCell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *key = [self.foundItems.allKeys[section] capitalizedString];
    
    return key;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SearchItemCell *cell = (SearchItemCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self.presenter presentItem:cell.item];
}

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
