//
//  SetGameCardDeck.m
//  Matchismo
//
//  Created by Siddharth Sukumar on 12/19/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "SetGameCardDeck.h"
#import "SetGameCard.h"


@implementation SetGameCardDeck

- (id) init {
    
    self = [super init];
    if (self){
        
        for ( NSString *color in [SetGameCard possibleColorOfTheCard]){
            for ( NSNumber *number in [SetGameCard possibleNumberOfTheCard]){
                for ( NSString *shade in [SetGameCard possibleShadingOfTheCard]){
                    for ( NSString *symbol in [SetGameCard possibleSymbolOfTheCard]){
                        SetGameCard *card = [[SetGameCard alloc]init];
                        
                        int actualNumber = [number integerValue];
                        card.color = color;
                        card.numberOfCard = actualNumber;
                        card.shade = shade;
                        card.symbol = symbol;
                        [self addCard:card atTop:YES];
                        
                        
                        
                        
                    }
                }
        }
        
        }
    
    } return self;
}

@end
