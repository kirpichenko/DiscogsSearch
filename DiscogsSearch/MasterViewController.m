//
//  MasterViewController.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/23/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "MasterViewController.h"
#import "Master.h"

@interface MasterViewController ()
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *genreLabel;
@property (nonatomic, weak) IBOutlet UILabel *yearLabel;

@property (nonatomic, strong) Master *master;
@end

@implementation MasterViewController

- (id)initWithMasterItem:(Master *)master
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.master = master;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = self.master.title;
    self.genreLabel.text = [self.master.genre componentsJoinedByString:@", "];
    self.yearLabel.text = self.master.year;
}

@end
