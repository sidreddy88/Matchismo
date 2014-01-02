//
//  Card.h
//  Matchismo
//
//  Created by Siddharth Sukumar on 11/25/13.
//  Copyright (c) 2013 Siddharth Sukumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSArray *differentPossibilites;
@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter= isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;
@property (nonatomic,  getter = isSelected) BOOL selected;
// The next property is used in the Set Card Game to store all the attibutes of each card
@property (nonatomic, strong) NSMutableArray *characteristicsOfTheCards;

-(int) matchForTwoCardGame : (NSArray*) otherCards;
-(int)matchForThreeCardGame:(NSArray *) otherCards;

- (int) findingOutIfThereIsAMatch : (NSArray *) cards;


@end
