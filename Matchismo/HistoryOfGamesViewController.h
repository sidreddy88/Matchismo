//
//  HistoryOfGamesViewController.h
//  Matchismo
//
//  Created by Siddharth Sukumar on 12/18/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CardMatchingGame;

@interface HistoryOfGamesViewController : UIViewController

@property (nonatomic, strong) NSString *textDisplayingHistoryOfCardGame;
@property (nonatomic, strong) CardMatchingGame *game;


@end
