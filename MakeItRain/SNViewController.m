//
//  SNViewController.m
//  MakeItRain
//
//  Created by Shahmeer Navid on 9/20/14.
//  Copyright (c) 2014 Hack The North. All rights reserved.
//

#import "SNViewController.h"

@interface SNViewController ()

@property IBOutlet UIView *rectangle;

@end

@implementation SNViewController

- (IBAction)swipeDetected:(UISwipeGestureRecognizer *)sender{
    CGPoint currentPos = _rectangle.center;
    [UIView animateWithDuration:0.5f animations:^{
        _rectangle.center = CGPointMake(currentPos.x, currentPos.y - 500);
    }];
}

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.totalLabel.text = @"0";
    self.swipe_count = 0;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch =[touches anyObject];
    CGPoint currentPoint =[touch locationInView:self.view];//point of touch
}

- (IBAction)sendSwipeAction:(id)sender {
    
    NSLog(@"Swipe Button Clicked");
    
    self.swipeOccured;
}

- (void)swipeOccured {
    
    int increment = 1;
    int current_swipes = self.swipe_count + increment;
    
    NSLog(@"%d", current_swipes);
    self.totalLabel.text = [NSString stringWithFormat:@"%d", current_swipes];
    
    self.swipe_count = current_swipes;
    
    // Do more stuff
}

- (IBAction)sendButton:(id)sender {
    
    NSLog(@"Send Button Clicked");
}

- (IBAction)undoButton:(id)sender {
    NSLog(@"Undo Button Clicked");
}


@end
