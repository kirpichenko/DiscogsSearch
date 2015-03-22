//
//  SearchViewControllerTests.m
//  DiscogsSearchTests
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import <OCMock/OCMock.h>

#import "SearchViewController.h"
#import "SearchManager.h"

@interface SearchViewControllerTests : XCTestCase
@property (nonatomic, strong) SearchViewController *searchViewController;
@end

@implementation SearchViewControllerTests

- (void)setUp
{
    [super setUp];
    
    self.searchViewController = [SearchViewController new];
}

- (void)testThatSearchStartsWhenSearchButtonTapped
{
    NSString *const query = @"query";
    
    OCMockObject *searchBarStub = [OCMockObject niceMockForClass:[UISearchBar class]];
    [[[searchBarStub stub] andReturn:query] text];

    OCMockObject *searchManagerMock = [OCMockObject niceMockForClass:[SearchManager class]];
    [[searchManagerMock expect] findItemsWithQuery:query withCompletion:[OCMArg any]];
    
    [self.searchViewController setSearchManager:(SearchManager *)searchManagerMock];
    [self.searchViewController searchBarSearchButtonClicked:(UISearchBar *)searchBarStub];
    
    [searchManagerMock verify];
}

@end
