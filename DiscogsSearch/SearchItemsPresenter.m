//
//  SearchItemsPresenter.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "SearchItemsPresenter.h"

#import "ItemDefaultViewController.h"

#import "Master.h"
#import "MasterViewController.h"

#import "Release.h"
#import "ReleaseViewController.h"

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
    if (item == nil) {
        return;
    }
    
    UIViewController *presentingController;

    if ([item isKindOfClass:[Release class]]) {
        presentingController = [[ReleaseViewController alloc] initWithRelease:(Release *)item];
    }
    else if ([item isKindOfClass:[Master class]]) {
        presentingController = [[MasterViewController alloc] initWithMasterItem:(Master *)item];
    }
    else {
        presentingController = [[ItemDefaultViewController alloc] initWithItem:item];
    }
    
    if (presentingController) {
        [self.navigationController pushViewController:presentingController animated:YES];
    }
}

@end
