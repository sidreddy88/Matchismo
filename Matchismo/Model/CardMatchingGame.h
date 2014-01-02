//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Siddharth Sukumar on 11/27/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// General code

@property (nonatomic) int score;
@property (nonatomic) int flipCount;


-(id) initWithCardCount: (NSUInteger)cardCount
              usingDeck: (Deck *) deck;

- (Card *) cardAtIndex: (NSUInteger) index;

@property (nonatomic, readonly) NSMutableArray *cards;







@end
