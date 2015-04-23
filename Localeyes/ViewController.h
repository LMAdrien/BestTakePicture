//
//  ViewController.h
//  Localeyes
//
//  Created by Adrien LE MOIGNE on 21/04/2015.
//  Copyright (c) 2015 lemoigne.adrien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MakerPicture.h"

// View NS LOG DEBUG
static BOOL ERRORNSLOG = true;

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *ViewPicture;
@property (weak, nonatomic) IBOutlet UIImageView *ViewCamera;
@property(nonatomic, retain) UIImage *image;
@property(nonatomic, retain) UIImage *outImage;
@property(nonatomic, retain) NSMutableArray *ProspectImage;
@property(nonatomic, retain) MakerPicture *makerPicture;
@property (weak, nonatomic) IBOutlet UILabel *NumberShoot;

- (IBAction)ActionSelect:(UIButton *)sender;
- (IBAction)ActionShot:(UIButton *)sender;
- (IBAction)ActionNextColumn:(id)sender;
@end

