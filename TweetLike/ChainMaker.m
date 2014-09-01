//
//  ChainMaker.m
//  TweetLike
//
//  Created by Jason Gotlieb on 9/1/14.
//  Copyright (c) 2014 jasongotlieb. All rights reserved.
//

#import "ChainMaker.h"

@interface ChainMaker()

@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong) NSArray *words;

@end

@implementation ChainMaker

-(id) initWithPath:(NSString *)path {
    self = [super init];
    
    [self getContentsOfFile:path];
    [self createDict];
    
    return self;
}

-(void) getContentsOfFile:(NSString *)path {
    NSString * fileContents = [NSString stringWithContentsOfFile:path
                                                        encoding:NSUTF8StringEncoding
                                                           error:nil];
    
    _words = [[NSArray alloc]
             initWithArray:[fileContents componentsSeparatedByCharactersInSet:
                            [NSCharacterSet whitespaceAndNewlineCharacterSet]]];
}

-(void) createDict {
    NSMutableDictionary * mutDict = [[NSMutableDictionary alloc] init];
    
    NSString * prev = @"";
    for (NSString *word in _words) {
        if (![mutDict objectForKey:prev]) {
            [mutDict setObject:@[word] forKey:prev];
        } else {
            NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:[mutDict objectForKey:prev]];
            [temp addObject:word];
            [mutDict setObject:temp forKey:prev];
        }
        prev = word;
    }
    
    /** Uncomment following lines to see contents of dict **/
    /* for(NSString* key in [dict allKeys]) {
        NSLog(@"%@ : %@", key, [[dict objectForKey:key] description]);
    } */
    
    _dict = [[NSDictionary alloc] initWithDictionary:mutDict];
}

-(NSString *)composeTweet {
    NSMutableString * tweet = [[NSMutableString alloc] init];
    
    NSString *nextWord = [_words objectAtIndex:[self getRandomInRange:((uint32_t)[[_dict allKeys] count])]];
    while ([tweet length] < 100) {
        [tweet appendString:nextWord];
        [tweet appendString:@" "];
        NSArray *tmp = [_dict objectForKey:nextWord];
        if (tmp) {
            nextWord = [tmp objectAtIndex:[self getRandomInRange:((uint32_t)[tmp count])]];
        } else {
            nextWord = [_words objectAtIndex:[self getRandomInRange:((uint32_t)[[_dict allKeys] count])]];
        }
    }
    NSLog(@"TWEET: %@", tweet);
    return tweet;
}

-(uint32_t)getRandomInRange:(uint32_t)range {
    return arc4random_uniform(range);
}


@end
