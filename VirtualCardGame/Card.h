//
//  Card.h
//  VirtualCardGame
//
//  Created by Vilson Farias on 5/20/15.
//  Copyright (c) 2015 ArcTouch. All rights reserved.
//

#ifndef VirtualCardGame_Card_h
#define VirtualCardGame_Card_h

#import <Foundation/Foundation.h>

@interface Card: NSObject

@property (strong, atomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int) match:(NSArray *) otherCards;


@end

#endif
