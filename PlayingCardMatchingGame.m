//
//  PlayingCardMatchingGame.m
//  Matchismo
//
//  Created by Siddharth Sukumar on 12/31/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "PlayingCardMatchingGame.h"

@interface PlayingCardMatchingGame ()


@property (nonatomic) BOOL lastFlipWasMatched;
@property (nonatomic) int lastFlipScore;
@property (nonatomic) BOOL itIsATwoCardGame;
@property (nonatomic) BOOL onlyOneCardHasBeenPicked;
@property (nonatomic) BOOL itIsAThreeCardGame;
@property (nonatomic, strong) NSMutableArray *cardsToBePrinted;
@property (nonatomic, readwrite) NSMutableArray *historyOfThePlayingCardGame;

@end
@implementation PlayingCardMatchingGame

@synthesize lastFlipScore,lastFlipWasMatched,itIsAThreeCardGame,itIsATwoCardGame,onlyOneCardHasBeenPicked, cardsToBePrinted, historyOfThePlayingCardGame;

-(id) initWithCardCount: (NSUInteger)count usingDeck: (Deck *) deck{
    
    self.score= 0;
    self.flipCount = 0;
    historyOfThePlayingCardGame = [[NSMutableArray alloc]init];
   
    
    self = [super init];
    if (self) {
        for(int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if(!card){
                self = nil;
            } else {
                [ self.cards insertObject:card atIndex:i];
            }
        }
        
    }
    
    return self;
    

}
/*
- (void) setThePlayingCardToBeNil {
    self = nil;
}

*/
// getter for the array cardsToBePrinted
- (NSMutableArray *) cardsToBePrinted {
    if (!cardsToBePrinted) cardsToBePrinted = [[NSMutableArray alloc]init];
    return cardsToBePrinted;
}



#define FLIP_COST 1
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2



// This method is for flipping a card in a two player game

- (void) flipCardAtIndexForTwoPlayerGame: (NSUInteger)index {
    
    Card *card = [self cardAtIndex:index];
    self.cardsToBePrinted = [[NSMutableArray alloc]init];
    //    self.cardsToBePrinted = nil;
    // The following booleans cannot be initialized in the init method cause they need to be reset every time a cardButton is pressed.
    
    lastFlipWasMatched = NO;
    lastFlipScore = nil;
    itIsATwoCardGame = NO;
    onlyOneCardHasBeenPicked = NO;
    
    // logic for a 2 card game
    
    
    // This code is used to tell whether there are only one or no cards that are face up. This information is used in the method stringsToBePrinted
    
    int numberOfFlippedCards = 0;
    for (Card * card in self.cards){
        if (card.isFaceUp && !card.isUnplayable){
            numberOfFlippedCards ++;
            
        }
    }
    
    if (numberOfFlippedCards == 0){
        onlyOneCardHasBeenPicked = YES;
    } else if (numberOfFlippedCards == 1){
        itIsATwoCardGame = YES;
    }
    
    
    
    if (card && !card.isUnplayable){
        if (!card.isFaceUp){
            for (Card *otherCard in self.cards){
                if(otherCard.isFaceUp && !otherCard.isUnplayable){
                    int matchScore = [card matchForTwoCardGame:@[ otherCard ]];
                    if(matchScore){
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                        lastFlipWasMatched = YES;
                        lastFlipScore = matchScore * MATCH_BONUS;
                        
                    }else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        
                        lastFlipWasMatched = NO;
                        lastFlipScore = MISMATCH_PENALTY;
                        
                        
                        
                    } [cardsToBePrinted addObject:otherCard.contents];
                    break;
                    
                }
                
                
                
            }self.score -= FLIP_COST;
            
            
        }
        card.faceUp = !card.isFaceUp;
        [cardsToBePrinted addObject:card.contents];
    }
    
    
}
 // I use this method to print what is happening in the model in the UILabel resultOfLastFlip. I use three properties
 // - lastFlipWasMatched, lastFlipScore and cardsToBePrinted in this method

 
 
- (NSString *) stringToBePrinted {
    
    NSString *result = @"Results of last flip";
    
    if (onlyOneCardHasBeenPicked || [cardsToBePrinted count] == 1){
        result = [NSString stringWithFormat: @" Flipped up %@", [cardsToBePrinted objectAtIndex:0]];
        
    }
    if (itIsATwoCardGame && [cardsToBePrinted count] > 1){
        if (lastFlipWasMatched){
            result = [NSString stringWithFormat:@"Matched %@ and %@ for %d points", [cardsToBePrinted objectAtIndex:0], [cardsToBePrinted objectAtIndex:1], lastFlipScore];
            
        } else {
            result = result = [NSString stringWithFormat:@"%@ and %@ do not match! %d point penalty", [cardsToBePrinted objectAtIndex:0], [cardsToBePrinted objectAtIndex:1], lastFlipScore];
        }
        
    }
    
    if (itIsAThreeCardGame && [cardsToBePrinted count] > 2 ){
        if (lastFlipWasMatched){
            result = result = [NSString stringWithFormat:@"Matched %@, %@ and %@ for %d points", [cardsToBePrinted objectAtIndex:0], [cardsToBePrinted objectAtIndex:1],[cardsToBePrinted objectAtIndex:2], lastFlipScore];
        }
    }
    
    [historyOfThePlayingCardGame addObject:result];
    return result;
    
    
}


@end
