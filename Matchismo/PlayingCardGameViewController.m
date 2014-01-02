//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Siddharth Sukumar on 12/18/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "HistoryOfGamesViewController.h"
#import "PlayingCardMatchingGame.h"

@interface PlayingCardGameViewController ()

// I use the following BOOL to keep track of when the Playing Card game is being played. When this game appears on screen, this bool is set to true and is only set to false when the game disappers from the screen.

@property BOOL itIsAPlayingCardGameRightNow;

@end

@implementation PlayingCardGameViewController

- (Deck *) createDeck {
    
    
    PlayingCardDeck *newDeck =  [[PlayingCardDeck alloc] init];
    
    return newDeck;
}







- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [super updatingTheUI];
    
    

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

//    [super settingGameToNil];
    self.playingCardGame = nil;
    
    
    
}



@end
