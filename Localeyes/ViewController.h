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
@property (strong, nonatomic) IBOutlet UIView *FrameForCapture;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *labelCounterX;
@property (strong, nonatomic) IBOutlet UILabel *labelCounterY;
@property (strong, nonatomic) IBOutlet UILabel *labelCounterZ;

@property (strong, nonatomic) IBOutlet UILabel *labelYawDegrees;
@property (strong, nonatomic) IBOutlet UILabel *labelPitchDegrees;
@property (strong, nonatomic) IBOutlet UILabel *labelRollDegrees;

- (IBAction)toggleGyro:(id)sender;
- (IBAction)takePhoto:(id)sender;
@end
