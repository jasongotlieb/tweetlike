//
//  TweetLikeViewController.m
//  TweetLike
//
//  Created by Jason Gotlieb on 6/30/14.
//  Copyright (c) 2014 jasongotlieb. All rights reserved.
//

#import "TweetLikeViewController.h"

@interface TweetLikeViewController ()

@end

@implementation TweetLikeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tl_drakeBird.image = [UIImage imageNamed:@"Twitter_logo_white"];
    self.tl_hemingwayBird.image = [UIImage imageNamed:@"Twitter_logo_white"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:self.tl_ImageName]];
    
}

- (void) loadHemingway {
    
}

- (void) loadDrake {
    
}


- (IBAction)closeButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
