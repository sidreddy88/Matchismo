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
#import "Card.h"

@interface PlayingCardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultsOfLastFlip;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong,nonatomic) PlayingCardMatchingGame *game;





// I use the following BOOL to keep track of when the Playing Card game is being played. When this game appears on screen, this bool is set to true and is only set to false when the game disappers from the screen.

@property BOOL itIsAPlayingCardGameRightNow;

@end

@implementation PlayingCardGameViewController

@synthesize cardButtons = _cardButtons;
@synthesize scoreLabel, resultsOfLastFlip, flipsLabel, game;



- (PlayingCardMatchingGame *) game {
 
    
    if (!game) game = [[PlayingCardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                               usingDeck:[[PlayingCardDeck alloc] init]];
    return game;
}


// setter for the arrray CardButtoms

- (void) setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    [self updateUI];
    
}


- (IBAction)dealCards:(UIButton *)sender {

    
    if (sender.isTouchInside){
        [self resetAllButtons:_cardButtons];
        self.resultsOfLastFlip.text = @"Results of last Flip";
        
            self.game = nil;
                [self updateUI];
        

        
    }
}

- (IBAction)flipCard:(UIButton *)sender {
    


        
        [self.game flipCardAtIndexForTwoPlayerGame:[self.cardButtons indexOfObject:sender]];
        self.game. flipCount++;
        [self updateUI];
        
        
        self.flipsLabel.text = [NSString stringWithFormat:@"Flips : %i", self.game.flipCount];
        
    
}

- (void) resetAllButtons: (NSArray *)cardButtons{

    
    for (UIButton *cardButton in self.cardButtons){
        
        
            Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
            
            if (card.isUnplayable){
                card.unplayable = NO;
            }
            if (card.isFaceUp){
                card.faceUp = NO;
            }
        
    }
}


- (void) updateUI {
  
    for (UIButton *cardButton in self.cardButtons){
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        
        cardButton.selected = card.isFaceUp;
        
        
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        
        
        
    }self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.game.score];
    
    
    self.resultsOfLastFlip.text =  [NSString stringWithFormat:@"%@", [self.game stringToBePrinted]];
    
}




- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"PlayingCard History"]) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        if ([segue.destinationViewController isKindOfClass:[HistoryOfGamesViewController class]]) {
            
            HistoryOfGamesViewController *tvsc = (HistoryOfGamesViewController *)segue.destinationViewController;
            
            tvsc.textDisplayingHistoryOfCardGame = [NSString stringWithFormat:@"%@", self.resultsOfLastFlip.text];
            
        }
    }
    
}





- (Deck *) createDeck {
    
    
    PlayingCardDeck *newDeck =  [[PlayingCardDeck alloc] init];
    
    return newDeck;
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    
    

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self updateUI];
    self.game = nil;
    [self updateUI];
    
    
    
    
}

- (void) viewDidLoad {
    
    [super viewDidLoad];

    
    NSLog(@"%s - game = %@", __PRETTY_FUNCTION__, self.game);
    NSLog(@"first card = %@", [self.game.cards firstObject]);
}



@end
