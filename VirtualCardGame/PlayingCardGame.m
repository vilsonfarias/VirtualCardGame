//
//  PlayingCardGame.m
//  VirtualCardGame
//
//  Created by Vilson Farias on 5/21/15.
//  Copyright (c) 2015 ArcTouch. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PlayingCardGame.h"
#import "PlayingCard.h"

@interface PlayingCardGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation PlayingCardGame

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (NSMutableArray *) cards
{
    if (! _cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck
{
    NSLog(@"new deck with %ld", (long)count);
    self = [super init];
    
    NSLog(@"%@", self);
    
    
    if (self) {
        for (int i = 0; i < count; i++){
            NSLog(@"%d", i);
            Card *card = [deck drawRandomCard];
            self.cards[i] = card;
            if (card){
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *) cardAtIndex:(NSInteger)index
{
    return (index < [self.cards count])? self.cards[index] : nil;
}

- (void) choooseCardAtIndex:(NSInteger)index
{
    Card *card = [self cardAtIndex:index];
    NSLog(@"choooseCardAtIndex");
    
    if (!card.isMatched){
        if (card.isChosen) {
            card.chosen = NO;
            NSLog(@"card.chosen = NO");
        } else {
            for (Card *otherCard in self.cards){
                if (otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]]; //creates an array on the fly @[item]
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                        NSLog(@"card.chosen = NO");
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            NSLog(@"card.chosen = YES");
        }
    }
}

@end