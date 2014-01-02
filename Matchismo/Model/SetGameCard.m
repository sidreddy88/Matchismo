//
//  SetGameCard.m
//  Matchismo
//
//  Created by Siddharth Sukumar on 12/18/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "SetGameCard.h"

@implementation SetGameCard

@synthesize characteristicsOfTheCards;

+ (NSArray *) possibleNumberOfTheCard {
    
    return @[ @1, @2, @3];
    
}

+ (NSArray *) possibleColorOfTheCard {
    
    return @[ @"red", @"green", @"blue"];
    
}

+ (NSArray *) possibleSymbolOfTheCard {
    
    return @[ @"circle", @"triangle", @"square"];
    
}

+ (NSArray *) possibleShadingOfTheCard {
    
    return @[@"solid", @"stripped", @"opened"];
    
}

//setter for number


- (void) setNumberOfCard:(int)numberOfCard {
    
    NSNumber *numbers = [NSNumber numberWithInt:numberOfCard];
    if ( [[SetGameCard possibleNumberOfTheCard] containsObject:numbers]){
        _numberOfCard = numberOfCard;
    }
}


// setter for symbol

- (void) setSymbol:(NSString *)symbol {
    if ( [[SetGameCard possibleSymbolOfTheCard] containsObject:symbol]){
        _symbol = symbol;
    }
}

//setter for color

- (void) setColor:(NSString *)color {
    if ( [[SetGameCard possibleColorOfTheCard] containsObject:color]){
        _color = color;
    }
}

// setter for shade

- (void) setShade:(NSString *)shade{
    if ( [[SetGameCard possibleShadingOfTheCard] containsObject:shade]){
        _shade = shade;
    }
}

//setter for the property
/*
- (NSMutableArray *) characteristicsOfTheCards {
    NSMutableArray * allValues;
    
    NSNumber *number = [NSNumber numberWithInt:self.numberOfCard];
    
    
    [allValues addObject: self.color];
    [allValues addObject: number];
    [allValues addObject: self.shade];
    [allValues addObject: self.symbol];
    
    return allValues;

}
*/
/*
- (NSArray *) differentPossibilities {
    
    NSMutableArray * allValues;
    
      NSNumber *number = [NSNumber numberWithInt:self.numberOfCard];
    
    
    [allValues addObject: self.color];
    [allValues addObject: number];
    [allValues addObject: self.shade];
    [allValues addObject: self.symbol];
    
    return allValues;
    
    
}
*/
- (int) findingOutIfThereIsAMatch : (NSArray *) cards {
    
    int match = 0;
    NSMutableArray *findingOutIfCardsMatch = [[NSMutableArray alloc] init];
    
    
    SetGameCard *secondCard = [cards objectAtIndex:0];
    SetGameCard *thirdCard = [cards objectAtIndex:1];
    
/*  Need to check four attributes
   1 - Color
   2 - Number
   3 - Shading
   4 - Symbol
 
 */
    //color
    
    NSComparisonResult colorsOfFirstAndSecondCards = [self.color compare:secondCard.color];
     NSComparisonResult colorsOfFirstAndThirdCards = [self.color compare:thirdCard.color];
     NSComparisonResult colorsOfSecondtAndThirdCards = [secondCard.color compare:thirdCard.color];
    
    
    if ((colorsOfFirstAndSecondCards == NSOrderedSame && colorsOfFirstAndThirdCards == NSOrderedSame) ||
          (colorsOfFirstAndSecondCards != NSOrderedSame && colorsOfFirstAndThirdCards  != NSOrderedSame &&
           colorsOfSecondtAndThirdCards != NSOrderedSame)) {
              [findingOutIfCardsMatch addObject:@"Yes"];
          } else {
              [findingOutIfCardsMatch addObject:@"NO"];
          }
    
    // number
    
    if ((self.numberOfCard == secondCard.numberOfCard && self.numberOfCard == thirdCard.numberOfCard) ||
          (self.numberOfCard != secondCard.numberOfCard && self.numberOfCard != thirdCard.numberOfCard &&
           secondCard.numberOfCard != thirdCard.numberOfCard)){
              [findingOutIfCardsMatch addObject:@"Yes"];
          } else {
              [findingOutIfCardsMatch addObject:@"NO"];
          }
 
    
    // Shading
    
    NSComparisonResult shadingOfFirstAndSecondCards = [self.shade compare:secondCard.shade];
    NSComparisonResult shadingOfFirstAndThirdCards = [self.shade compare:thirdCard.shade];
    NSComparisonResult shadingOfSecondtAndThirdCards = [secondCard.shade compare:thirdCard.shade];
    
    if ((shadingOfFirstAndSecondCards == NSOrderedSame && shadingOfFirstAndThirdCards == NSOrderedSame) ||
        (shadingOfFirstAndSecondCards != NSOrderedSame && shadingOfFirstAndThirdCards  != NSOrderedSame &&
         shadingOfSecondtAndThirdCards != NSOrderedSame)) {
            [findingOutIfCardsMatch addObject:@"Yes"];
        } else {
            [findingOutIfCardsMatch addObject:@"NO"];
        }
  
    // Symbol
    NSComparisonResult symbolOfFirstAndSecondCards = [self.symbol compare:secondCard.symbol];
    NSComparisonResult symbolOfFirstAndThirdCards = [self.symbol compare:thirdCard.symbol];
    NSComparisonResult symbolOfSecondtAndThirdCards = [secondCard.symbol compare:thirdCard.symbol];
    
    if ((symbolOfFirstAndSecondCards == NSOrderedSame && symbolOfFirstAndThirdCards == NSOrderedSame) ||
        (symbolOfFirstAndSecondCards != NSOrderedSame && symbolOfFirstAndThirdCards  != NSOrderedSame &&
         symbolOfSecondtAndThirdCards != NSOrderedSame)) {
            [findingOutIfCardsMatch addObject:@"Yes"];
        } else {
            [findingOutIfCardsMatch addObject:@"NO"];
        }
// If all of the above conditions are true then, the three cards form a set

    if ([[findingOutIfCardsMatch objectAtIndex:0] isEqualToString:@"Yes"] && [[findingOutIfCardsMatch objectAtIndex:1] isEqualToString:@"Yes"] && [[findingOutIfCardsMatch objectAtIndex:2] isEqualToString:@"Yes"] && [[findingOutIfCardsMatch objectAtIndex:3] isEqualToString:@"Yes"]){
        match = 1;
    }
    findingOutIfCardsMatch = nil;
       return match;
    
}




@end
