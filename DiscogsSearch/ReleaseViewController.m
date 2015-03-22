//
//  ReleaseViewController.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/23/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "ReleaseViewController.h"

#import "Release.h"

@interface ReleaseViewController ()
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *formatLabel;
@property (nonatomic, strong) Release *releaseItem;
@end

@implementation ReleaseViewController

#pragma mark - Life Cycle

- (id)initWithRelease:(Release *)release
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.releaseItem = release;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleLabel.text = self.releaseItem.title;
    self.formatLabel.text = [self.releaseItem.format componentsJoinedByString:@", "];
}

@end
