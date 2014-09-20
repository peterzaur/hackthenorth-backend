//
//  SNViewController.h
//  MakeItRain
//
//  Created by Shahmeer Navid on 9/20/14.
//  Copyright (c) 2014 Hack The North. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIView *rect;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIButton *swipeButton;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UIButton *undoButton;
@property NSInteger swipe_count;

- (IBAction)swipeDetected:(UISwipeGestureRecognizer *)sender;

- (void)swipeOccured;

@end
