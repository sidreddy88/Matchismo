//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Siddharth Sukumar on 11/24/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//
// Abstract class


#import <UIKit/UIKit.h>
#import "Deck.h"

@class CardMatchingGame;
@class PlayingCardMatchingGame;
@class SetCardMatchingGame;

@interface CardGameViewController : UIViewController

//protected
//for subclasses

- (Deck *) createDeck;  // abstract



@property (nonatomic, strong) CardMatchingGame *game;
@property (nonatomic, strong) PlayingCardMatchingGame *playingCardGame;
@property (nonatomic, strong) SetCardMatchingGame *setsCardGame;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;



- (void) settingGameToNil;
- (void) updatingTheUI;


@end

