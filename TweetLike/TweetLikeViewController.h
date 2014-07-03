//
//  TweetLikeViewController.h
//  TweetLike
//
//  Created by Jason Gotlieb on 6/30/14.
//  Copyright (c) 2014 jasongotlieb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetLikeViewController : UIViewController

//@property (weak, nonatomic) IBOutlet UIImageView *tl_ImageView;
@property (weak, nonatomic) IBOutlet UINavigationItem *tl_Title;
@property (weak, nonatomic) NSString *tl_ImageName;

@property (weak, nonatomic) IBOutlet UIImageView *tl_drakeBird;
@property (weak, nonatomic) IBOutlet UIImageView *tl_hemingwayBird;
- (IBAction)closeButtonPressed:(id)sender;

@end
