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

@interface ViewController : UIViewController

@property(nonatomic, retain) UIImage *outImage;
@property(nonatomic, retain) NSMutableArray *ProspectImage;
@property(nonatomic, retain) NSMutableArray *ColumnImage;
@property(nonatomic, retain) MakerPicture *makerPicture;
@property (weak, nonatomic) IBOutlet UILabel *NumberShoot;
@property (strong, nonatomic) IBOutlet UILabel *NumberColumn;

@property (strong, nonatomic) IBOutlet UIView *FrameForCapture;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewColumn;


- (IBAction)takePhoto:(id)sender;
- (IBAction)NewColumn:(id)sender;

@end

