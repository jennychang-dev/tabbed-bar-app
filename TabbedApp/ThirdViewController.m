//
//  ThirdViewController.m
//  TabbedApp
//
//  Created by Jenny Chang on 20/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *TextField;
@property (nonatomic, readonly) CGFloat oldConstraint;
@property (nonatomic) float origViewHeight;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.origViewHeight = self.view.frame.size.height;
    
    [self setUpTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidChangeFrameNotification object:nil];
}


-(void)setUpTextField {
    self.TextField.keyboardType = UIKeyboardTypeDefault;
    NSLog(@"keyboard has come up");
    
    // assigning delegate to myself
    self.TextField.delegate = self;
    
    // clear text mode
    self.TextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    [self setUpTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    NSLog(@"i have begun editing");
    return YES;
}

-(void)keyboardDidShow:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0, 0, 400, self.origViewHeight - [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height)];
}

//-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
//
//    NSLog(@"I have stopped editing");
//    [textField resignFirstResponder];
//    return YES;
//}
//
//
//-(void)keyboardDidHide:(NSNotification *)notification
//{
//    NSLog(@"hidden keyboard");
//    [self.view setFrame:CGRectMake(0,0,320,460)];
//}


@end
