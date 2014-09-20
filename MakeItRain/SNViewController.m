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

static UIColor *greenColour;
static CGPoint initialPos = {160, 346};

- (IBAction)swipeDetected:(UISwipeGestureRecognizer *)sender{
    CGPoint currentPos = _rectangle.center;
    [UIView animateWithDuration:0.5f animations:^{
        _rectangle.center = CGPointMake(currentPos.x, currentPos.y - 500);
    } completion:^(BOOL finished) {
        _rectangle.center = initialPos;
    }];

    
    double increment = self.denomination_value;
    NSLog([NSString stringWithFormat:@"Swipe Value: $%.2f", increment]);
    
    [self.swipe_array addObject:[NSNumber numberWithDouble:increment]];
    [self updateSwipeTotal];
    
    double current_swipes = self.swipe_total;
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", current_swipes];
    
    self.swipe_total = current_swipes;
    [self flashDenominationAmount:(increment)];
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Transparent navigation bar
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTranslucent:YES];
    
    self.DenominationSlider.minimumValue = 0.25;
    self.DenominationSlider.maximumValue = 5.00;
    self.DenominationSlider.value = 1.00;
    [self.swipeButton setTitle:@"Swipe" forState:UIControlStateNormal];
    
    self.denomination_value = self.DenominationSlider.value;
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", 0.0];
    self.swipe_total = 0;
    self.swipe_array = [[NSMutableArray alloc] init];
    
    greenColour = [UIColor colorWithRed:(123 / 255.0) green:(191 / 255.0) blue:(106 / 255.0) alpha: 1];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch =[touches anyObject];
    CGPoint currentPoint =[touch locationInView:self.view];//point of touch
}

- (void)flashDenominationAmount:(double)denomination {
    _incrementLabel.text = [NSString stringWithFormat:@"+$%.2f", denomination];
    
    [_incrementLabel setAlpha:0.0f];
        [UIView animateWithDuration:0.4f animations:^{
        [_incrementLabel setAlpha:1.0f];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.6f animations:^{
        [_incrementLabel setAlpha:0.0f];
    } completion:nil];
    }];
    
    [UIView animateWithDuration:0.4 animations:^{
        self.view.backgroundColor = greenColour;
    } completion:NULL];
    [UIView animateWithDuration:0.4 animations:^{
        self.view.backgroundColor = [UIColor whiteColor];
    } completion:NULL];
}


- (IBAction)sendButton:(id)sender {
    NSLog(@"Send Button Clicked");
    
    self.send_squarecash_email;
}

- (void) send_squarecash_email {
    
    NSString *email_subject = [NSString stringWithFormat:@"Here's $%.2f",self.swipe_total];
    NSString *email_body = @"Sent from Make it Rain!!";
    NSArray *email_recipients = [NSArray arrayWithObject:@"recipients@email.com"];
    NSArray *cc_recipients = [NSArray arrayWithObjects:@"cash@square.com", nil];
    
    if ([MFMailComposeViewController canSendMail]) {
        NSLog(@"You can send");
        
        MFMailComposeViewController* mailController = [[MFMailComposeViewController alloc] init];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:email_subject];
        [mailController setMessageBody:email_body isHTML:NO];
        //[mailController setToRecipients:email_recipients]; // we can populate this if we ask earlier
        [mailController setCcRecipients:cc_recipients];
        
        [self presentViewController:mailController animated:YES completion:nil];
        //[mailController release];
    }
    else {
        NSLog(@"Sorry, you need to setup mail first!");
    }
}

- (void)mailComposeController:(MFMailComposeViewController*) controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    NSString *sendingStatus = @"";
    switch (result)
    {
        case MFMailComposeResultCancelled:
            sendingStatus = @"Mail sending cancelled.";
            NSLog(@"Mail Cancelled");
            break;
        case MFMailComposeResultSaved:
            sendingStatus = @"Mail saved.";
            NSLog(@"Mail Saved");
            break;
        case MFMailComposeResultSent:
            sendingStatus = @"Mail sent.";
            NSLog(@"Mail Sent");
            break;
        case MFMailComposeResultFailed:
            sendingStatus = @"Mail sending failed.";
            NSLog(@"Mail Failed");
            break;
        default:
            sendingStatus = @"Mail not sent.";
            NSLog(@"Mail Not Sent");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"SendingStatus: %d", sendingStatus);
}

- (IBAction)undoButton:(id)sender {
    NSLog(@"Undo Button Clicked");
    
    [self.swipe_array removeLastObject];
    self.updateSwipeTotal;
    
    self.nslogSwipeArray;
}

- (IBAction)denominationSliderChanged:(id)sender {
    double roundedValue = round(self.DenominationSlider.value * 4) / 4.0;
    self.DenominationSlider.value = roundedValue;
    
    self.DenominationAmount.text = [NSString stringWithFormat:@"$%.2f", roundedValue];
    
    self.denomination_value = roundedValue;
}

- (void)nslogSwipeArray {
    NSString *swipe_array_contents = @"Swipe Array: ";
    for (NSNumber *i in self.swipe_array) {
        swipe_array_contents = [swipe_array_contents stringByAppendingFormat:@"$%.2f, ", i.doubleValue];
    }
    NSLog(swipe_array_contents);
}

- (double)updateSwipeTotal{
    double swipe_sum = 0.0;
    for (NSNumber *i in self.swipe_array) {
        swipe_sum += i.doubleValue;
    }
    NSLog([NSString stringWithFormat:@"New Swipe Total: $%.2f", swipe_sum]);
    
    self.swipe_total = swipe_sum;
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", self.swipe_total];
    
    return self.swipe_total;
}

@end
