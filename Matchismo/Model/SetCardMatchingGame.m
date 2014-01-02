//
//  SetCardMatchingGame.m
//  Matchismo
//
//  Created by Siddharth Sukumar on 12/31/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "SetCardMatchingGame.h"

@interface SetCardMatchingGame ()

//The following two properties are used in the method selectCardAtIndexForSetGame to keep track of cards in the Set Card Game.
@property (nonatomic) int numberOfSelectedCards;
@property (nonatomic, strong) NSMutableArray *cardsToBeCompared;

// the following property is used to hold the result from the selectCardAtIndexForSetGame method and print out in the contoller using the printifEachMatchIsASet method.
@property (nonatomic, strong) NSString* resultsOFTheEachSetMatch;

@property (nonatomic, readwrite) NSMutableArray *historyOfTheSetCardGame;



@end

@implementation SetCardMatchingGame

@synthesize numberOfSelectedCards, cardsToBeCompared,theNumberOfSelectedCardsIsThree,resultsOFTheEachSetMatch, historyOfTheSetCardGame, isTheCurrentGameASetCardGame, scoreForASetCardGame, flipCountForASetCardGame;

    
-(id) initWithCardCount: (NSUInteger)count usingDeck: (Deck *) deck{
        
    
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
    
    isTheCurrentGameASetCardGame = YES;
    cardsToBeCompared =  [[NSMutableArray alloc]init];
    self.numberOfSelectedCards = 0;
   historyOfTheSetCardGame = [[NSMutableArray alloc]init];

    
    
    return self;
}

#define FLIP_COST 1
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2

// This method is used in the Set Card Matching game when someone clicks on the any button.
- (void) selectCardAtIndexForSetGame : (NSUInteger) index {
    
    Card *currentCard = [self cardAtIndex:index];
    
    currentCard.Selected  = YES;
    self.scoreForASetCardGame -= FLIP_COST;
    theNumberOfSelectedCardsIsThree = NO;
    [cardsToBeCompared addObject:currentCard];
    
    
    // The following code also takes care of the situation in which the person clicks on the same card
    if ( [cardsToBeCompared count] == 2 && [ currentCard isEqual:[cardsToBeCompared objectAtIndex:0]]){
        [cardsToBeCompared removeObjectAtIndex:1];
        resultsOFTheEachSetMatch = @"Choose a different card";
    } else  if ([cardsToBeCompared count] == 3 && [ currentCard isEqual:[cardsToBeCompared objectAtIndex:1]]){
        
        [cardsToBeCompared removeObjectAtIndex:1];
        resultsOFTheEachSetMatch = @"Choose a different card";
        
    } else{
        numberOfSelectedCards++;
    }
    
    
    
    
    if (numberOfSelectedCards == 3){
        theNumberOfSelectedCardsIsThree = YES;
        resultsOFTheEachSetMatch = nil;;
        Card *firstCard = cardsToBeCompared [0];
        Card *secondCard = cardsToBeCompared [1];
        Card *thirdCard = cardsToBeCompared [2];
        
        int matchScore = [ firstCard findingOutIfThereIsAMatch:[[NSArray alloc]initWithObjects:secondCard, thirdCard,  nil]];
        
        if (matchScore){
            //            theThreeCardsFormASet = YES;
            self.scoreForASetCardGame += 5;
            resultsOFTheEachSetMatch = @"The cards form a set";
            
            
        } else {
            //            theThreeCardsFormASet = NO;
            self.scoreForASetCardGame -= 3;
            resultsOFTheEachSetMatch = @"The cards do not form a set";
            
        }
        [cardsToBeCompared removeAllObjects];
        numberOfSelectedCards = 0;
        
    }
    
    
}

// The following method is used to print what is happening in the model in the UILablel resultOfLastFlip;

- (NSString *) printifEachMatchIsASet {
    
    NSString *result = resultsOFTheEachSetMatch;
    if (result != nil){
        [historyOfTheSetCardGame addObject:result];
    }
    return result;
    
}





@end
