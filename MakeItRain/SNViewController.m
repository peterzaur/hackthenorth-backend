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
    
    self.DenominationSlider.minimumValue = 0.25;
    self.DenominationSlider.maximumValue = 5.00;
    self.DenominationSlider.value = 1.00;
    self.denomination_value = self.DenominationSlider.value;
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", 0];
    self.swipe_total = 0;
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
    
    double increment = self.denomination_value;
    double current_swipes = self.swipe_total + increment;
    
    NSLog([NSString stringWithFormat:@"$%.2f", current_swipes]);
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", current_swipes];
    
    self.swipe_total = current_swipes;
    
    // Do more stuff
}

- (IBAction)sendButton:(id)sender {
    
    NSLog(@"Send Button Clicked");
}

- (IBAction)undoButton:(id)sender {
    NSLog(@"Undo Button Clicked");
}


- (IBAction)denominationSliderChanged:(id)sender {
    
    double roundedValue = round(self.DenominationSlider.value * 4) / 4.0;
    self.DenominationSlider.value = roundedValue;
    
    self.DenominationAmount.text = [NSString stringWithFormat:@"$%.2f", roundedValue];
    
    self.denomination_value = roundedValue;
}

@end
