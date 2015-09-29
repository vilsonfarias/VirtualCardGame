//
//  PlayingCardGame.h
//  VirtualCardGame
//
//  Created by Vilson Farias on 5/21/15.
//  Copyright (c) 2015 ArcTouch. All rights reserved.
//

#ifndef VirtualCardGame_PlayingCardGame_h
#define VirtualCardGame_PlayingCardGame_h

#import "Deck.h"

@interface PlayingCardGame : NSObject

- (instancetype) initWithCardCount: (NSInteger) count usingDeck: (Deck *) deck;

- (void) choooseCardAtIndex: (NSInteger) index;
- (Card *) cardAtIndex: (NSInteger) index;

@property (nonatomic, readonly) NSInteger score;

@end

#endif
