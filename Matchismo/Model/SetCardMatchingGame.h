//
//  SetCardMatchingGame.h
//  Matchismo
//
//  Created by Siddharth Sukumar on 12/31/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"
#import "Card.h"

@interface SetCardMatchingGame : UIViewController

- (NSString *) printifEachMatchIsASet;

- (void) selectCardAtIndexForSetGame : (NSUInteger) index;

// This property is used in the Card Game View Controller to mark the selected cards as unslected once three cards have been selected
@property (nonatomic) BOOL theNumberOfSelectedCardsIsThree;
@end
