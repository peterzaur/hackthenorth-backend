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
    self.DenominationSlider.minimumValue = 0.25;
    self.DenominationSlider.maximumValue = 5.00;
    self.DenominationSlider.value = 1.00;
	// Do any additional setup after loading the view, typically from a nib.
    
    self.totalLabel.text = @"0";
    
    [self.swipeButton setTitle:@"Swipe" forState:UIControlStateNormal];
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
    
    self.swipeOccured;
}
- (void)swipeOccured {
    
    int increment = 1;
    int current_swipes = self.totalLabel.text.intValue;
    NSLog(@"%d", current_swipes);
    self.totalLabel.text = [NSString stringWithFormat:@"%d", current_swipes + increment];
    
    // Do more stuff
}

- (IBAction)denominationSliderChanged:(id)sender {
    
    double roundedValue = round(self.DenominationSlider.value * 4) / 4.0;
    
    self.DenominationAmount.text = [NSString stringWithFormat:@"$%.2f", roundedValue];
}

@end
