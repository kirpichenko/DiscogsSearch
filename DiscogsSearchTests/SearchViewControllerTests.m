//
//  SearchViewControllerTests.m
//  DiscogsSearchTests
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "SearchViewController.h"
#import "SearchManager.h"

@interface SearchViewControllerTests : XCTestCase
@property (nonatomic, strong) SearchViewController *searchViewController;
@property (nonatomic, strong) SearchManager *searchManager;
@end

@implementation SearchViewControllerTests

- (void)setUp
{
    [super setUp];
    
    self.searchManager = [SearchManager new];
    self.searchViewController = [SearchViewController new];
}

- (void)testThatSearchStartsWhenSearchButtonTapped
{
    
}

@end
