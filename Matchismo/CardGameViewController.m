//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Siddharth Sukumar on 11/24/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "HistoryOfGamesViewController.h"
#import "PlayingCardMatchingGame.h"
#import "SetCardMatchingGame.h"


@interface CardGameViewController ()




@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;



@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultsOfLastFlip;



@end

@implementation CardGameViewController
@synthesize cardButtons = _cardButtons;
@synthesize scoreLabel, resultsOfLastFlip;
@synthesize flipsLabel, game, playingCardGame, setsCardGame;




- (IBAction)dealCards:(UIButton *)sender {
    
    if (sender.isTouchInside){
        [self resetAllButtons:_cardButtons];
        self.resultsOfLastFlip.text = @"Results of last Flip";
        
        if (self.playingCardGame.isTheCurrentGameAPlayingCardGame) {
        
        self.playingCardGame = nil;
        } else if (self.setsCardGame.isTheCurrentGameASetCardGame){
        self.setsCardGame = nil;
        }
        
        [self updateUI];
        
        
        
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"PlayingCard History"]) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        if ([segue.destinationViewController isKindOfClass:[HistoryOfGamesViewController class]]) {
            
            HistoryOfGamesViewController *tvsc = (HistoryOfGamesViewController *)segue.destinationViewController;
    /*
            if (self.playingCardGame.isTheCurrentGameAPlayingCardGame){
            tvsc.game = self.playingCardGame;
            } else if (self.setsCardGame.isTheCurrentGameASetCardGame) {
                 tvsc.game = self.setsCardGame;
            }
    */
            tvsc.textDisplayingHistoryOfCardGame = [NSString stringWithFormat:@"%@", self.resultsOfLastFlip.text];
            
        }
    }
    
}

// Public classes

- (void) settingGameToNil {
    self.playingCardGame = nil;
    
}

- (void) updatingTheUI{
    [self updateUI];
}


// This method is used to reset all buttons once the "Deal" button is pressed in the Playing card Game
- (void) resetAllButtons: (NSArray *)cardButtons {
    
    
    for (UIButton *cardButton in self.cardButtons){
        
        if (self.playingCardGame.isTheCurrentGameAPlayingCardGame) {
            Card *card = [self.playingCardGame cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
          if (card.isUnplayable){
            card.unplayable = NO;
           }
          if (card.isFaceUp){
            card.faceUp = NO;
           }
        }    // for the Set Card Matching Game
         else if (self.setsCardGame.isTheCurrentGameASetCardGame){
             
             Card *card = [self.setsCardGame cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
             
            if (card.isSelected){
                card.selected = NO;
            }
        }
    
    }
}

// setter for the arrray CardButtoms

- (void) setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    [self updateUI];
    
}

// This method updates the UI so that the view and the model are in sync


- (void) updateUI {
    
    if (self.playingCardGame.isTheCurrentGameAPlayingCardGame) {
        [self updateUIForPlayingCardMatchingGame];
    } else if (self.setsCardGame.isTheCurrentGameASetCardGame) {
        [self updateUiForASetCardMatchingGame];
    }
    
}

- (void) updateUIForPlayingCardMatchingGame {
    
    
    for (UIButton *cardButton in self.cardButtons){
        Card *card = [self.playingCardGame cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        
        cardButton.selected = card.isFaceUp;
        
        
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        
        
        
    }self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.playingCardGame.scoreForAPlayingCardGame];


   self.resultsOfLastFlip.text =  [NSString stringWithFormat:@"%@", [self.playingCardGame stringToBePrinted]];

}


- (void) updateUiForASetCardMatchingGame {
    
    for (UIButton *cardButton in self.cardButtons){
        Card *card = [self.setsCardGame cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
    
    NSAttributedString *mine = [self gettingTheAttributesThatGoOnASetCard: card];
    
    [cardButton setAttributedTitle:mine forState:UIControlStateNormal];
    
    
    cardButton.selected = card.isSelected;
    
    
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.setsCardGame.scoreForASetCardGame];
    self.resultsOfLastFlip.text =  [NSString stringWithFormat:@"%@", [self.setsCardGame printifEachMatchIsASet]];
    
    for (UIButton *cardButton in self.cardButtons){
        Card *card = [self.setsCardGame cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        if (self.setsCardGame.theNumberOfSelectedCardsIsThree && card.isSelected){
            card.selected = NO;
        }
        
        
     }
}
    


- (NSAttributedString *)gettingTheAttributesThatGoOnASetCard: card {
    return nil;
}

// lazy instantiation for a new game yes
// abstract method

- (CardMatchingGame *) game {
    
//    if (!game) game = nil;
    if (!game) game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                        usingDeck:[self createDeck]];
     
    return game;
}

// abstract class

- (Deck *) createDeck {
    
    return nil;
}

- (IBAction)flipCard:(UIButton *)sender {
    
    
    
    // code for a Playing Card Matching Game
    
    if (self.playingCardGame.isTheCurrentGameAPlayingCardGame){
    
        [self.playingCardGame flipCardAtIndexForTwoPlayerGame:[self.cardButtons indexOfObject:sender]];
        self.playingCardGame. flipCountForAPlayingCardGame++;
        [self updateUI];
    
    
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips : %i", self.playingCardGame. flipCountForAPlayingCardGame];
        
    }
    
    // code for a Set Card Matching Game
    
     else if (self.setsCardGame.isTheCurrentGameASetCardGame){
        [self.setsCardGame selectCardAtIndexForSetGame:[self.cardButtons indexOfObject:sender]];
         self.setsCardGame.flipCountForASetCardGame++;
         [self updateUI];
         
         self.flipsLabel.text = [NSString stringWithFormat:@"Flips : %i", setsCardGame.flipCountForASetCardGame];
    }
}





- (void)viewDidUnload {
    [self setResultsOfLastFlip:nil];
    [super viewDidUnload];
}
@end
