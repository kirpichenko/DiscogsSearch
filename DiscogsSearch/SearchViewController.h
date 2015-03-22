//
//  ViewController.h
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchManager;

@interface SearchViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic, strong) SearchManager *searchManager;

@end

