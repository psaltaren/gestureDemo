//
//  ViewController.m
//  GestureDemo
//
//  Created by Fredrik Carlsson on 2014-04-28.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *qMark;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    srand(time(0));
}

- (float)randomFloat {
    return (rand() % 1000) / 1000.0f;
}

- (IBAction)swiped:(id)sender {
    self.qMark.textColor = [UIColor colorWithRed:[self randomFloat] green:[self randomFloat] blue:[self randomFloat] alpha:1.0f];
    
    NSLog(@"You swiped");
                            
}
                            
- (IBAction)rotated:(UIRotationGestureRecognizer*)sender {
    CGAffineTransform newTransform = CGAffineTransformRotate(self.qMark.transform, sender.rotation);

    self.qMark.transform = newTransform;
    sender.rotation = 0;
    
    NSLog(@"Rotation: %f", sender.rotation);

}
- (IBAction)pinched:(UIPinchGestureRecognizer*)sender {
    
    CGAffineTransform newTransform = CGAffineTransformScale(self.qMark.transform, sender.scale, sender.scale);
    self.qMark.transform = newTransform;
    sender.scale = 1.0f;
    
        NSLog(@"Pinch: %f", sender.scale);
}

@end
