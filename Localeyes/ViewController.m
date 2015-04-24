//
//  ViewController.m
//  Localeyes
//
//  Created by Adrien LE MOIGNE on 21/04/2015.
//  Copyright (c) 2015 lemoigne.adrien. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController 



// Initialize object

- (void)viewDidLoad {
    [super viewDidLoad];
    _image = [[UIImage alloc]init];
    _outImage = [[UIImage alloc] init];
    _ProspectImage = [[NSMutableArray alloc] init];
    _image = [UIImage imageNamed:@"etna"];
    _ViewPicture.image = _image;
    
    // Do any additional setup after loading the view, typically from a nib.
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }

//  Action button shot camera

- (IBAction)ActionShot:(id)sender {
    NSInteger NbElementsArray = _ProspectImage.count;
    _ViewCamera.image = _ViewPicture.image;
   [_ProspectImage insertObject:_ViewPicture.image atIndex:NbElementsArray];
    [self takePhoto];
    [_NumberShoot setText:[NSString stringWithFormat: @"%li",_ProspectImage.count]];
    if(ERRORNSLOG == true)
    {
        for (NSInteger i = 0; i < _ProspectImage.count; i++) {
            NSLog(@"%@", [_ProspectImage[i] description]);
        }
    }
}
//  Action button to next column in department store
- (IBAction)ActionNextColumn:(id)sender {
    [self takePhoto];
}


/*
 * TESTING BEGIN
 */
- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)takePhoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerCameraCaptureModePhoto;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)getCamera{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    picker.showsCameraControls = YES;
    picker.navigationBarHidden = NO;
    picker.toolbarHidden = YES;
    [picker takePicture];
    
    // Insert the overlay
    //self.overlay = [[o alloc] initWithNibName:@"Overlay" bundle:nil];
    //overlay.pickerReference = picker;
    //picker.cameraOverlayView = overlay.view;
    //picker.delegate = overlay;
    
    [self presentModalViewController:picker animated:YES];
    
}
/*
 * TESTING END
 */
@end
