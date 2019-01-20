//
//  SecondViewController.m
//  TabbedApp
//
//  Created by Jenny Chang on 19/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];


}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeValue:) name:@".com.jc.is.confused" object:nil];
    }
    return self;
}

-(void)changeValue:(NSNotification *)notification {
    
    self.countLabel.text = [NSString stringWithFormat:@"%@",[notification.userInfo objectForKey:@"senderKey"]];
    
}

- (void)appWillResign {
    NSLog(@"Do things when the app is about to be closed");
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@".com.jc.is.confused"  object:nil];
}






@end
