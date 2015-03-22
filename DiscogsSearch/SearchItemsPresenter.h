//
//  SearchItemsPresenter.h
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchItemsPresenter : NSObject <UITableViewDataSource, UITableViewDataSource>

- (void)searchItemsFound:(NSArray *)items;

@end
