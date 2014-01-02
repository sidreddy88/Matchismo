//
//  PlayingCardMatchingGame.h
//  Matchismo
//
//  Created by Siddharth Sukumar on 12/31/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Card.h"

@interface PlayingCardMatchingGame : CardMatchingGame

- (void) flipCardAtIndexForTwoPlayerGame: (NSUInteger)index;


- (NSString *) stringToBePrinted;

//- (void) flipCardAtIndexForThreePlayerGame: (NSUInteger)index;

@property (nonatomic, readonly) NSMutableArray *historyOfThePlayingCardMatchingGame;

@property(nonatomic) BOOL isTheCurrentGameAPlayingCardGame;

@property (nonatomic) int scoreForAPlayingCardGame;
@property (nonatomic) int flipCountForAPlayingCardGame;

- (void) setThePlayingCardToBeNil;

@end
