//
//  PlayingCard.h
//  VirtualCardGame
//
//  Created by Vilson Farias on 5/20/15.
//  Copyright (c) 2015 ArcTouch. All rights reserved.
//
//test2

#ifndef VirtualCardGame_PlayingCard_h
#define VirtualCardGame_PlayingCard_h
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end

#endif
