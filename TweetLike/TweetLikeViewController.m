//
//  TweetLikeViewController.m
//  TweetLike
//
//  Created by Jason Gotlieb on 6/30/14.
//  Copyright (c) 2014 jasongotlieb. All rights reserved.
//

#import "TweetLikeViewController.h"

@interface TweetLikeViewController ()

@property (weak, nonatomic) UIButton *tl_tweetButton;

@end

@implementation TweetLikeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _tl_tweetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_tl_tweetButton setImage:[UIImage imageNamed:@"Twitter_logo_white"] forState:UIControlStateNormal];
    [_tl_tweetButton setTintColor:[UIColor whiteColor]];

    
    if ([self.tl_tweeter isEqualToString:@"drake"]) {
        [self loadDrake];
    } else if ([self.tl_tweeter isEqualToString:@"hemingway"]) {
        [self loadHemingway];
    }
        
}

- (void) loadHemingway {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hemingway-bg"]];
    
    [self.tl_tweetButton addTarget:self
                       action:@selector(hemingwayButtonPressed:)
             forControlEvents:UIControlEventTouchUpInside];
    self.tl_tweetButton.frame = CGRectMake(230.0, 234.0, 70.0, 57.0);
    [self.view addSubview:self.tl_tweetButton];
}

- (void) loadDrake {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"drake-bg"]];

    [self.tl_tweetButton addTarget:self
                       action:@selector(drakeButtonPressed:)
             forControlEvents:UIControlEventTouchUpInside];

    self.tl_tweetButton.frame = CGRectMake(61.0, 200.0, 70.0, 57.0);
    [self.view addSubview:self.tl_tweetButton];
}

- (IBAction)drakeButtonPressed:(id)sender {
}

- (IBAction)hemingwayButtonPressed:(id)sender {
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
