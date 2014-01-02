//
//  SetGameCard.h
//  Matchismo
//
//  Created by Siddharth Sukumar on 12/18/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import "Card.h"

@interface SetGameCard : Card


@property (nonatomic) int numberOfCard;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *shade;


+ (NSArray *) possibleNumberOfTheCard;
+ (NSArray *) possibleColorOfTheCard;
+ (NSArray *) possibleSymbolOfTheCard;
+ (NSArray *) possibleShadingOfTheCard;

- (int) findingOutIfThereIsAMatch : (NSArray *) cards;


@end
