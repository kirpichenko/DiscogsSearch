//
//  ArtistViewController.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/23/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "ArtistViewController.h"
#import "Artist.h"

#import "UIImageView+AFNetworking.h"

@interface ArtistViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *photoImageView;
@property (nonatomic, strong) Artist *artist;
@end

@implementation ArtistViewController

#pragma mark - Life Cycle

- (id)initWithArtist:(Artist *)artist
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _artist = artist;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.photoImageView setImageWithURL:self.artist.thumbURL];
}

@end
