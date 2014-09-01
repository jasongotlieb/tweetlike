//
//  ChainMaker.h
//  TweetLike
//
//  Created by Jason Gotlieb on 9/1/14.
//  Copyright (c) 2014 jasongotlieb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChainMaker : NSObject


-(id) initWithPath:(NSString *)path;

-(NSString *)composeTweet;

@end
