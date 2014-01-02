//
//  Card.m
//  Matchismo
//
//  Created by Siddharth Sukumar on 11/25/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize faceUp;
@synthesize unplayable;

//This method is used in CardMatchingGame.m file to find out if either cards have the same rank or suits so that they can be marked unplayable

-(int) matchForTwoCardGame:(NSArray *)otherCards  {
    int score = 0;
    
    for (Card *card in otherCards){

        if ([ card.contents isEqualToString:self.contents]){
            score = 1;
        }
    } return score; 
}

//This method is used in CardMatchingGame.m file to find out if either cards have the same rank or suits so that they can be marked unplayable

- (int) matchForThreeCardGame:(NSArray *)otherCards {
    int score = 0;
    
    for (Card *card in otherCards){
        for (Card *otherCard in otherCards){
            if ( [card.contents isEqualToString:self.contents] && [otherCard.contents isEqualToString:self.contents]){
                score = 1;
            }
        }
    } return score;
}

// This method is used in the Set Card Matching Game to figure out if three cards form a set
- (int) findingOutIfThereIsAMatch : (NSArray *) cards {
    int score  = 0;
    return score;
}



@end
