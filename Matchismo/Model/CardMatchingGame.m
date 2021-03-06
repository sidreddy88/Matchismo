//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Siddharth Sukumar on 11/27/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "CardMatchingGame.h"



@interface CardMatchingGame ()

// The following properties are used in the PLAYING Card Matching Game.

@property (nonatomic, readwrite) NSMutableArray *cards;

@end

@implementation CardMatchingGame

@synthesize cards, score;

// getter for the array cards
-(NSMutableArray *) cards {
    if (!cards) cards = [[NSMutableArray alloc]init];
    return cards;
}



// setter method for flipCount

- (void) setFlipCount:(int)flipCount {
    
    
    _flipCount = flipCount;
    }

// This method is used to create a new card game with count number of cards from a deck

-(id) initWithCardCount: (NSUInteger)count usingDeck: (Deck *) deck {
    
    return nil;
    
}

// This method is used in the Update UI method in the controller



- (Card *) cardAtIndex: (NSUInteger) index {

    
    return (index < self.cards.count) ? [self.cards objectAtIndex:index] : nil;
}

/*
- (NSString *)description
{
    NSString *desc = [super description];
    
    desc = [desc stringByAppendingFormat:@" currentGameIsAPlayingCardMatchingGame = %d ", self.currentGameIsAPlayingCardMatchingGame];
    desc = [desc stringByAppendingFormat:@" currentGameIsASetCardMatchingGame = %d ", self.currentGameIsASetCardMatchingGame];
    
    return desc;
}
    
*/



    
    
    



@end
