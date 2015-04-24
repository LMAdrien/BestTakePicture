//
//  ViewController.h
//  Localeyes
//
//  Created by Adrien LE MOIGNE on 21/04/2015.
//  Copyright (c) 2015 lemoigne.adrien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "MakerPicture.h"
#define kAccelerationThreshold 1.7
#define kUpdateInterval (1.0f/10.0f)

// View NS LOG DEBUG
static BOOL ERRORNSLOG = true;

@interface ViewController : UIViewController
{
    CMMotionManager *motionManager;
}

@property(nonatomic, retain) UIImage *outImage;
@property(nonatomic, retain) NSMutableArray *ProspectImage;
@property(nonatomic, retain) MakerPicture *makerPicture;
@property (weak, nonatomic) IBOutlet UILabel *NumberShoot;
@property (retain,nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) IBOutlet UIView *FrameForCapture;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;


- (IBAction)takePhoto:(id)sender;
@end




