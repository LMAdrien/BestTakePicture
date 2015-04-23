//
//  ViewController.h
//  Localeyes
//
//  Created by Adrien LE MOIGNE on 21/04/2015.
//  Copyright (c) 2015 lemoigne.adrien. All rights reserved.
//

#import <UIKit/UIKit.h>

// View NS LOG DEBUG
static BOOL ERRORNSLOG = true;

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *ViewPicture;
@property (weak, nonatomic) IBOutlet UIImageView *ViewCamera;
@property(nonatomic, retain) UIImage *image;
@property(nonatomic, retain) UIImage *outImage;
@property(nonatomic, retain) NSMutableArray *ProspectImage;

- (IBAction)ActionShot:(id)sender;

@end

