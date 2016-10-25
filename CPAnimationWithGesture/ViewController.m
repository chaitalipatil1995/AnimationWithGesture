//
//  ViewController.m
//  CPAnimationWithGesture
//
//  Created by Student P_06 on 25/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UISwipeGestureRecognizer *rightGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleRightGesture)];
    
    [rightGesture setDirection:UISwipeGestureRecognizerDirectionRight];
    
    [self.view addGestureRecognizer:rightGesture];
    
    ///////////////////////////////////////////////////////////////////////////
    
    UISwipeGestureRecognizer *leftGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleLeftGesture)];
    [leftGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    [self.view addGestureRecognizer:leftGesture];
    
    //////////////////////////////////////////////////////////////////////////////////
    
    UISwipeGestureRecognizer *upGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleUpGesture)];
    
    [upGesture setDirection:UISwipeGestureRecognizerDirectionUp];
    
    [self.view addGestureRecognizer:upGesture];
    
    //////////////////////////////////////////////////////////////////////////////////
    
    UISwipeGestureRecognizer *downGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleDownGesture)];
    [downGesture setDirection:UISwipeGestureRecognizerDirectionDown];
    
    
    [self.view addGestureRecognizer:downGesture];
    
    /////////////////////////////////////////////////////////////////////////////////
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture)];
    
    tapGesture.numberOfTapsRequired = 1;
    
    self.view.userInteractionEnabled = YES;
    
    [self.myImageView addGestureRecognizer:tapGesture];
    
    
    /////////////////////////////////////////////////////////////////////////////////
    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    
    self.myImageView.userInteractionEnabled = YES;
    
    [self.myImageView addGestureRecognizer:panGesture];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tranistionDimentionForX: (CGFloat) xOriginChange
                              Y: (CGFloat) yOriginChange {
    
    [UIView transitionWithView: self.myImageView duration:0.5 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        
        
        CGPoint point = self.myImageView.frame.origin;
        
        CGFloat width = self.myImageView.frame.size.width;
        
        CGFloat height = self.myImageView.frame.size.height;
        
        [self.myImageView setFrame:CGRectMake(point.x + xOriginChange, point.y + yOriginChange, width, height)];
        
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            NSLog(@"Transition Finish");
        }
    }];
}
-(void)zoomActionForDimentionForX : (CGFloat)zoomInChange
                               Y: (CGFloat)zoomOutChange {
    
    [UIView transitionWithView:self.myImageView duration:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        CGPoint point = self.myImageView.frame.origin;
        
        CGFloat width = self.myImageView.frame.size.width;
        
        CGFloat height = self.myImageView.frame.size.height;
        
        [self.myImageView setFrame:CGRectMake(point.x, point.y, width + zoomInChange, height + zoomOutChange)];
        
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            NSLog(@"Animation Finished");
        }
    }];
}

-(void)handleRightGesture {
    
    [self tranistionDimentionForX:100 Y:0];
    
}
-(void)handleLeftGesture {
    
    [self tranistionDimentionForX:-100 Y:0];
}
-(void)handleUpGesture {
    
    [self tranistionDimentionForX:0 Y:-100];
    
}
-(void)handleDownGesture {
    [self tranistionDimentionForX:0 Y:100];
    
}
//-(void)handleTapGesture {
//    [self rotatedImage];
//    
//}
//-(void)rotatedImage {
//    
//    [UIView transitionWithView:self.myImageView duration:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        
//        for (int a=1; a<=10; a++)
//            self.myImageView.transform = CGAffineTransformMakeRotation(a * 2);
//        self.myImageView.animationRepeatCount =  10;
//        
//    } completion:nil];
//    
//}
-(void)handlePanGesture:(UIPanGestureRecognizer *)gesture {
    
    CGRect originalFrame;
    
    if ([gesture isKindOfClass:[UIPanGestureRecognizer class]]) {
        
        if (gesture.state == UIGestureRecognizerStateBegan) {
            
            originalFrame = gesture.view.frame;
            
        }
        else if (gesture.state == UIGestureRecognizerStateChanged) {
            
            CGPoint delta = [gesture locationInView:self.view];
            
            gesture.view.center = delta;
        }
        else if (gesture.state == UIGestureRecognizerStateEnded) {
            
        }
    }
    else {
        NSLog(@"Pan Gesture Not Detected");
        
    }
    
}


- (IBAction)zoomOutAction:(id)sender {
    
    [self zoomActionForDimentionForX:50 Y:50];

}

- (IBAction)zoomInAction:(id)sender {
    
    [self zoomActionForDimentionForX:-50 Y:-50];

}
@end
