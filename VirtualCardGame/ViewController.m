//
//  ViewController.m
//  VirtualCardGame
//
//  Created by Vilson Farias on 5/20/15.
//  Copyright (c) 2015 ArcTouch. All rights reserved.
//
//branch09

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "PlayingCardGame.h"

@interface ViewController ()
@property (strong, nonatomic) PlayingCardGame *game;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController

- (PlayingCardGame *) game
{
    if (!_game) _game = [[PlayingCardGame alloc]
                         initWithCardCount:[self.cardButtons count]
                         usingDeck:[self createDeck]];
    return _game;
}

-(Deck *) deck
{
    if (!_deck)
        _deck = [self createDeck];
    return _deck;
}

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    NSLog(@"card at index %lu", (unsigned long)cardIndex);
    [self.game choooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void) updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        
        [cardButton setTitle:[self titleForCard:card]  forState:UIControlStateNormal];
        [cardButton setBackgroundImage: [self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    NSLog(@"Score: %ld", (long) self.game.score);
    self.scoreLabel.text = [NSString stringWithFormat: @"Score: %ld", (long) self.game.score];
}

- (NSString *) titleForCard:(Card *) card
{
    return card.isChosen? card.contents : @"";
}

- (UIImage *) backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen? @"cardfront": @"cardback"];
}

@end
