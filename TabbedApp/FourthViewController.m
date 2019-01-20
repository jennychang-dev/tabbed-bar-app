//
//  FourthViewController.m
//  TabbedApp
//
//  Created by Jenny Chang on 20/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "FourthViewController.h"
#import "CustomView.h"

@interface FourthViewController ()

@property (weak, nonatomic) IBOutlet UIView *greyView;
@property (weak, nonatomic) IBOutlet CustomView *whiteView;

@end

@implementation FourthViewController

// grey view should observe the white view white view and therefore it should move accordingly

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"loading fourth or ya gonna crash?");
    
    // setting key observer for path point: observing the white view
    
    [self.whiteView addObserver:self forKeyPath:@"panPoint" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    // observing whether property "panPoint" is changing in CustomView class

    if ([keyPath isEqualToString:@"panPoint"]) {
        NSLog(@"KVO observed");
        [self moveGreyViewAccordingToTouch];
    }
    
}

-(void)moveGreyViewAccordingToTouch {
    
    self.greyView.frame = CGRectMake(_whiteView.panPoint.x, _whiteView.panPoint.y, 152, 105);
    
    
    // track how much touch has moved relative to its previous position and use this to move grey view relative to grey view
}

- (IBAction)panGestureOnWhiteView:(UIPanGestureRecognizer *)sender {
    // panning
}




@end
