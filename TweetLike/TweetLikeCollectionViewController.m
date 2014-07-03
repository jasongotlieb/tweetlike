//
//  TweetLikeCollectionViewController.m
//  TweetLike
//
//  Created by Jason Gotlieb on 6/30/14.
//  Copyright (c) 2014 jasongotlieb. All rights reserved.
//

#import "TweetLikeCollectionViewController.h"
#import "TweetLikeViewController.h"

@interface TweetLikeCollectionViewController () {
    NSArray *faceImages;
}

@end

@implementation TweetLikeCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    faceImages = [NSArray arrayWithObjects:@"drake", @"hemingway", nil];
    
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);

}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return faceImages.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"FaceCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *faceImageView = (UIImageView *)[cell viewWithTag:100];
    
    faceImageView.image = [UIImage imageNamed:[faceImages objectAtIndex:indexPath.row]];
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame"]];
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"showTweetLikePhoto"]) {
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        TweetLikeViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        destViewController.tl_ImageName = [faceImages objectAtIndex:indexPath.row];
//        destViewController.tl_ImageName = [NSString stringWithFormat:@"%@-bg", destViewController.tl_ImageName];
        
        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
}
 


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
