//
//  HistoryOfGamesViewController.m
//  Matchismo
//
//  Created by Siddharth Sukumar on 12/18/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "HistoryOfGamesViewController.h"
#import "CardMatchingGame.h"

@interface HistoryOfGamesViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;



@end

@implementation HistoryOfGamesViewController

@synthesize body, game, textDisplayingHistoryOfCardGame;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
}

- (void) updateUI {
    
    
 //   NSLog(@"%s - game = %@", __PRETTY_FUNCTION__, self.game);
    NSLog(@"game = %@", self.game);

        
    self.body.text =  self.textDisplayingHistoryOfCardGame;

}



- (void) viewWillAppear:(BOOL)animated {
    
        [super viewWillAppear:animated];
    
   NSLog(@"%s - textDisplayingHistoryOfCardGame = '%@'", __PRETTY_FUNCTION__, self.textDisplayingHistoryOfCardGame);
    
    
        [self updateUI];
    
        
    }
@end
