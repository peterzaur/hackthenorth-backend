//
//  SNViewController.h
//  MakeItRain
//
//  Created by Shahmeer Navid on 9/20/14.
//  Copyright (c) 2014 Hack The North. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <PocketSVG/PocketSVG.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface SNViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UISlider *DenominationSlider;
@property (weak, nonatomic) IBOutlet UILabel *DenominationAmount;

@property (weak, nonatomic) IBOutlet UIView *rect;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIButton *swipeButton;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UIButton *undoButton;
@property double swipe_total;
@property double denomination_value;
@property NSMutableArray *swipe_array;

@property (weak, nonatomic) IBOutlet UILabel *incrementLabel;


- (IBAction)swipeDetected:(UISwipeGestureRecognizer *)sender;

- (void)swipeOccurred;
- (void)flashDenominationAmount:(double)denomination;
- (void)nslogSwipeArray;
- (void)send_squarecash_email;
- (double)updateSwipeTotal;
@end
