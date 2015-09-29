//
//  Deck.h
//  VirtualCardGame
//
//  Created by Vilson Farias on 5/20/15.
//  Copyright (c) 2015 ArcTouch. All rights reserved.
//
#import "Card.h"

#ifndef VirtualCardGame_Deck_h
#define VirtualCardGame_Deck_h

@interface Deck : NSObject

-(void) addCard:(Card *) card atTop:(BOOL) atTop;
-(void) addCard:(Card *) card;

-(Card *)drawRandomCard;

@end

#endif
