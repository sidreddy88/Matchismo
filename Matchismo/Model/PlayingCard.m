//
//  PlayingCard.m
//  Matchismo
//
//  Created by Siddharth Sukumar on 11/25/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

//This method is used in CardMatchingGame.m file to find out if either cards have the same rank or suits so that they can be marked unplayable

- (int) matchForTwoCardGame:(NSArray *)otherCards{
    int score = 0;
    
    
        id otherCard = [otherCards lastObject];
        
        if ([otherCard isKindOfClass:[PlayingCard class]]){
            
            PlayingCard *otherPlayingCard =(PlayingCard *) otherCard;
            if ([otherPlayingCard.suit isEqualToString:self.suit]){
                score = 1;
            } else if (otherPlayingCard.rank == self.rank){
                score = 3;
            }
            
        }
    return score;
}

//This method is used in CardMatchingGame.m file to find out if either cards have the same rank or suits so that they can be marked unplayable

-(int) matchForThreeCardGame:(NSArray *)otherCards {
        
        
    int score = 0;
    
     
        PlayingCard *secondCard = [otherCards lastObject];
        PlayingCard *thirdCard = [otherCards objectAtIndex:otherCards.count - 2];
        
        
        // all three suits are equal
        
        if([secondCard.suit isEqualToString:self.suit] && [thirdCard.suit isEqualToString:self.suit]){
            score = 4;
        }
       // all three ranks are equal
    
        else if (secondCard.rank == self.rank && thirdCard.rank == self.rank){
            score = 6;
            
            
        }
    /*
        //two of the suits are equal
        
        else if ( [secondCard.suit isEqualToString:self.suit] || [thirdCard.suit isEqualToString:self.suit] || [secondCard.suit isEqualToString:thirdCard.suit]){
            score = 1;
            
        }

        // two of the ranks are equal
        
        else if (secondCard.rank == self.rank || thirdCard.rank == self.rank || secondCard.rank == thirdCard.rank){
            score = 3;
        }
         // if two of suits are equal and two of the ranks are equal, then the person gets the higher score, which is two ranks are equal
        
        else if (([secondCard.suit isEqualToString:self.suit] || [thirdCard.suit isEqualToString:self.suit] || [secondCard.suit isEqualToString:thirdCard.suit]) && (secondCard.rank == self.rank || thirdCard.rank == self.rank || secondCard.rank == thirdCard.rank)){
             
            score = 3;
            
        }
    */
    return score;
}

// This method returns the contents of the playing card
-(NSString *) contents{
    
    NSArray *rankStrings = [PlayingCard rankStrings];

    
    return [[rankStrings objectAtIndex:self.rank] stringByAppendingString: self.suit];
    
    
}
+ (NSArray *) rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q",@"K", @"A"];
}


+ (NSArray *) validSuits {
    return @[@"♣", @"♠", @"♦", @"♥"];
}

// setter for suit

-(void) setSuit: (NSString *) suit {
    if( [[PlayingCard validSuits] containsObject:suit])
        _suit = suit;}

-(NSString *) suit{
    
    return _suit ? _suit:@"?";
}



+ (NSUInteger) maxRank {
    return [[self rankStrings] count] - 1;
}

- (void)setRank: (NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
        
    
}

/*

// This method is used in the CardMatchingGame.m file for the 3 card matching game.
// In the 3 card matching game, if we know that only 2 cards match (using the match method), but do not know specifically which cards match, we use this method. 

- (int) whichCardsMatch: (NSArray *) cards{
    
    int score = 0;
     
    if (cards.count ==2){

    PlayingCard *secondCard = [cards objectAtIndex:0];
    PlayingCard *thirdCard = [cards objectAtIndex:1];
        
        // we have 6 special cases and then 3 seperate ones
        // Special cases - if there are combinations where the suits of 2 cards are equal and the rank of two cards are equal, then it is preferable to hae the ranks equal
        
        // if the ranks of the self and second cards are equal AND the suits of the second and third card are equal, we give preference to the rank
        
        if ( self.rank == secondCard.rank && [secondCard.suit isEqualToString:thirdCard.suit]){
            score  = 1;
            
        }
        // if the ranks of the self and second cards are equal AND the suits of the self and third card are equal, we give preference to the rank
        else if ( self.rank == secondCard.rank && [self.suit isEqualToString:thirdCard.suit]){
            score  = 1;
        }
        
        // if the ranks of the self and third cards are equal AND the suits of the second and third card are equal, we give preference to the rank
        else if (self.rank == thirdCard.rank && [secondCard.suit isEqualToString:thirdCard.suit]){
            score = 2;
        }
        
        // if the ranks of the self and third cards are equal AND the suits of the first and second card are equal, we give preference to the rank
        else if (self.rank == thirdCard.rank && [self.suit isEqualToString:secondCard.suit]){
            score = 2;
        }
        
        
        // if the ranks of the second and third cards are equal AND the suits of the self and third card are equal, we give preference to the rank
        else if (secondCard.rank == thirdCard.rank && [self.suit isEqualToString:thirdCard.suit]){
            score = 3;
        }
        // if the ranks of the second and third cards are equal AND the suits of the self and second cards are equal, we give preference to the rank
        else if (secondCard.rank == thirdCard.rank && [self.suit isEqualToString:secondCard.suit]){
            score  = 3;
        }
        
        // self card and second card are equal in either rank or suit
        
         else if ([self.suit isEqualToString:secondCard.suit] ||
            self.rank == thirdCard.rank){
            score  = 1;
            
        }
         // self card and third card are equal in either rank or suit
        
        else if ([self.suit isEqualToString:thirdCard.suit] ||
                   self.rank == thirdCard.rank ){
            score = 2;
        }
        // second card and third card are equal in either rank or suit
        
        else if ([secondCard.suit isEqualToString:thirdCard.suit] ||
                      secondCard.rank == thirdCard.rank ){
            score = 3;
        }
        
       
        
    }
    return score;

}

*/




@end
