//
//  ViewController.h
//  CPAnimationWithGesture
//
//  Created by Student P_06 on 25/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
- (IBAction)zoomOutAction:(id)sender;

- (IBAction)zoomInAction:(id)sender;

@end

