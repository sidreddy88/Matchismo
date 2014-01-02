//
//  PlayingCard.h
//  Matchismo
//
//  Created by Siddharth Sukumar on 11/25/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic,strong) NSString *suit;
@property (nonatomic) NSUInteger rank;


+ (NSArray *) validSuits;
+ (NSUInteger ) maxRank;
+ (NSArray *) rankStrings;
@end
