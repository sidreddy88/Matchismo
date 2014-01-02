//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by Siddharth Sukumar on 12/18/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetGameCardDeck.h"
#import "CardMatchingGame.h"
#import "SetGameCard.h"
#import "SetCardMatchingGame.h"
#import "HistoryOfGamesViewController.h"

@interface SetCardGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultsOfLastFlip;
@property (strong,nonatomic) SetCardMatchingGame *game;


@end

@implementation SetCardGameViewController

@synthesize cardButtons = _cardButtons;
@synthesize scoreLabel, resultsOfLastFlip, flipsLabel, game;



- (SetCardMatchingGame *) game {
    
   
    if (!game) game = [[SetCardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                        usingDeck:[self createDeck]];
    
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    
    if ([segue.identifier isEqualToString:@"PlayingCard History"]) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        if ([segue.destinationViewController isKindOfClass:[HistoryOfGamesViewController class]]) {
            
            HistoryOfGamesViewController *tvsc = (HistoryOfGamesViewController *)segue.destinationViewController;
            
            tvsc.textDisplayingHistoryOfCardGame = [NSString stringWithFormat:@"%@", self.resultsOfLastFlip.text];
            
        }
    }
  
}

// This method is used to reset all buttons once the "Deal" button is pressed in the Playing card Game
- (void) resetAllButtons: (NSArray *)cardButtons {
    
  
    for (UIButton *cardButton in self.cardButtons){
        
            Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
            
            if (card.isSelected){
                card.selected = NO;
            }


}
}

- (void) updateUI {

    
    for (UIButton *cardButton in self.cardButtons){
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        NSAttributedString *mine = [self gettingTheAttributesThatGoOnASetCard: card];
        
        [cardButton setAttributedTitle:mine forState:UIControlStateNormal];
        
        
        cardButton.selected = card.isSelected;
        
        
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.game.score];
    self.resultsOfLastFlip.text =  [NSString stringWithFormat:@"%@", [self.game printifEachMatchIsASet]];
    
    for (UIButton *cardButton in self.cardButtons){
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        if (self.game.theNumberOfSelectedCardsIsThree && card.isSelected){
            card.selected = NO;
        }
        
        
    }
}




- (IBAction)flipCard:(UIButton *)sender {
    

     [self.game selectCardAtIndexForSetGame:[self.cardButtons indexOfObject:sender]];
        self.game.flipCount++;
        [self updateUI];
        
        self.flipsLabel.text = [NSString stringWithFormat:@"Flips : %i", game.flipCount];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.game = [[SetCardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
//                                                     usingDeck:[self createDeck]];

    NSLog(@"%s - game = %@", __PRETTY_FUNCTION__, self.game);
    NSLog(@"first card = %@", [self.game.cards firstObject]);
}


- (Deck *) createDeck {
        SetGameCardDeck *newDeck = [[SetGameCardDeck alloc] init];
    
        return newDeck;

}



- (NSAttributedString * ) gettingTheAttributesThatGoOnASetCard: (Card *)card {
    
//    NSUInteger index = [self.game.cards indexOfObjectIdenticalTo: card];
    
    SetGameCard *currentCard = (SetGameCard *) card;
    
    NSString *color = currentCard.color;
    int number = currentCard.numberOfCard;
    
    NSString *shade = currentCard.shade;
    NSString *symbol = currentCard.symbol;
    NSString *numberAndSymbol;
    
    
    if (number == 1 && [symbol isEqualToString:@"square"] && [shade isEqualToString:@"opened"]){
        
        numberAndSymbol = @" ⃞";
    }
    else if (number == 2 && [symbol isEqualToString:@"square"] && [shade isEqualToString:@"opened"]){
        numberAndSymbol = @" ⃞ ⃞";
        
    } else if (number == 3 && [symbol isEqualToString:@"square"] && [shade isEqualToString:@"opened"] ){
        numberAndSymbol = @" ⃞ ⃞ ⃞";
        
    } else if (number == 1 && [symbol isEqualToString:@"square"] && [shade isEqualToString:@"stripped"] ){
        numberAndSymbol = @"▥";
        
    } else if (number == 2 && [symbol isEqualToString:@"square"] && [shade isEqualToString:@"stripped"] ){
        numberAndSymbol = @"▥▥";
        
    } else if (number == 3 && [symbol isEqualToString:@"square"] && [shade isEqualToString:@"stripped"] ){
        numberAndSymbol = @"▥▥▥";
        
    } else if (number == 1 && [symbol isEqualToString:@"square"] && [shade isEqualToString:@"solid"] ){
        numberAndSymbol = @"■";
        
    } else if (number == 2 && [symbol isEqualToString:@"square"] && [shade isEqualToString:@"solid"] ){
        numberAndSymbol = @"■■";
        
    } else if (number == 3 && [symbol isEqualToString:@"square"] && [shade isEqualToString:@"solid"] ){
        numberAndSymbol = @"■■■";
        
    } else if (number == 1 && [symbol isEqualToString:@"triangle"] && [shade isEqualToString:@"opened"]){
        numberAndSymbol = @"△";
        
    } else if (number == 2 && [symbol isEqualToString:@"triangle"] && [shade isEqualToString:@"opened"]){
        numberAndSymbol = @"△△";
        
    } else if (number== 3 && [symbol isEqualToString:@"triangle"] && [shade isEqualToString:@"opened"]){
        numberAndSymbol = @"△△△";
        
    } else if (number== 1 && [symbol isEqualToString:@"triangle"] && [shade isEqualToString:@"stripped"]){
        numberAndSymbol = @"⏃";
        
    } else if (number== 2 && [symbol isEqualToString:@"triangle"] && [shade isEqualToString:@"stripped"]){
        numberAndSymbol = @"⏃⏃";
        
    } else if (number== 3 && [symbol isEqualToString:@"triangle"] && [shade isEqualToString:@"stripped"]){
        numberAndSymbol = @"⏃⏃⏃";
        
    } else if (number== 1 && [symbol isEqualToString:@"triangle"] && [shade isEqualToString:@"solid"]){
        numberAndSymbol = @"▲";
        
    } else if (number== 2 && [symbol isEqualToString:@"triangle"] && [shade isEqualToString:@"solid"]){
        numberAndSymbol = @"▲▲";
        
    } else if (number== 3 && [symbol isEqualToString:@"triangle"] && [shade isEqualToString:@"solid"]){
        numberAndSymbol = @"▲▲▲";
        
    } else if (number == 1 && [symbol isEqualToString:@"circle"] && [shade isEqualToString:@"opened"] ){
        numberAndSymbol = @"◦";
        
    } else if (number == 2 && [symbol isEqualToString:@"circle"] && [shade isEqualToString:@"opened"]){
        numberAndSymbol = @"◦◦";
        
    } else if (number == 3 && [symbol isEqualToString:@"circle"] && [shade isEqualToString:@"opened"]){
        numberAndSymbol = @"◦◦◦";
        
    } else if (number == 1 && [symbol isEqualToString:@"circle"] && [shade isEqualToString:@"stripped"]){
        numberAndSymbol = @"◎";
        
    } else if (number == 2 && [symbol isEqualToString:@"circle"] && [shade isEqualToString:@"stripped"]){
        numberAndSymbol = @"◎◎";
        
    } else if (number == 3 && [symbol isEqualToString:@"circle"] && [shade isEqualToString:@"stripped"]){
        numberAndSymbol = @"◎◎◎";
        
    } else if (number == 1 && [symbol isEqualToString:@"circle"] && [shade isEqualToString:@"solid"]){
        numberAndSymbol = @"●";
        
    } else if (number == 2 && [symbol isEqualToString:@"circle"] && [shade isEqualToString:@"solid"]){
        numberAndSymbol = @"●●";
        
    } else if (number == 3 && [symbol isEqualToString:@"circle"] && [shade isEqualToString:@"solid"]){
        numberAndSymbol = @"●●●";
        
    }
    
    UIColor *colorToBeUsed;
    
    if ([color isEqualToString:@"green"]) {
        
        colorToBeUsed = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:1];
        
    }  else if ([color isEqualToString:@"red"]){
        
        colorToBeUsed = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
        
    } else if ([color isEqualToString:@"blue"]){
        
        colorToBeUsed = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
        
    } 
    
    
    
    NSAttributedString *mine = [[NSAttributedString alloc]initWithString:numberAndSymbol attributes:@ { NSForegroundColorAttributeName : colorToBeUsed }];
    
    
    
    return mine;
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];


    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.game = nil;

    
    
}
@end
