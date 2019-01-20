//
//  FirstViewController.m
//  TabbedApp
//
//  Created by Jenny Chang on 19/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)stepper:(UIStepper *)sender {
    
    // converting float to NSNumber
    
    NSNumber *senderVal = @(sender.value);
    
//  Make its key stepperValue (or whatever you like). The value of this key will be the stepper's value property. This is a double. So, convert it to an NSNumber. Remember NSDictionary values must be objects.
    
    NSNotification *notification = [[NSNotification alloc] initWithName:@".com.jc.is.confused" object:nil userInfo:@{@"senderKey":senderVal}];
    
    // now send a notification
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}



@end
