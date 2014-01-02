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

@interface SetCardGameViewController ()


@end

@implementation SetCardGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.game = [[SetCardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                     usingDeck:[self createDeck]];

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

//    self.setsCardGame. isTheCurrentGameASetCardGame  = YES;
    [super updatingTheUI];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];

    [super settingGameToNil];
    self.setsCardGame. isTheCurrentGameASetCardGame  = NO;
    
}
@end
