//
//  ViewController.m
//  Localeyes
//
//  Created by Adrien LE MOIGNE on 21/04/2015.
//  Copyright (c) 2015 lemoigne.adrien. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()

@end

@implementation ViewController

    AVCaptureSession *session;
    AVCaptureStillImageOutput *stillImageOutput;

// Initialize object

- (void)viewDidLoad {
    [super viewDidLoad];
    //_image = [[UIImage alloc]init];
    //_outImage = [[UIImage alloc] init];
    //_ProspectImage = [[NSMutableArray alloc] init];
    //_image = [UIImage imageNamed:@"etna"];
    //_ViewPicture.image = _image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }

//  Action button shot camera
/*
- (IBAction)ActionShot:(id)sender {
    NSInteger NbElementsArray = _ProspectImage.count;
    _ViewCamera.image = _ViewPicture.image;
   [_ProspectImage insertObject:_ViewPicture.image atIndex:NbElementsArray];
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
    [self getCamera];
}
*/

/*
 * TESTING BEGIN
 */

-(void)viewWillAppear:(BOOL)animated{
    session = [[AVCaptureSession alloc] init];
    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    AVCaptureDevice *inputDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];
    if ([session canAddInput:deviceInput])
        [session addInput:deviceInput];
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    CALayer *rootLayer = [[self view] layer];
    [rootLayer setMasksToBounds:YES];
    CGRect frame = self.FrameForCapture.frame;
    [previewLayer setFrame:frame];
    [rootLayer insertSublayer:previewLayer atIndex:0];
    stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [stillImageOutput setOutputSettings:outputSettings];
    [session addOutput:stillImageOutput];
    [session startRunning];
    
}

- (IBAction)takePhoto:(id)sender {
    
    AVCaptureConnection *videoConnection = nil;
    for (AVCaptureConnection *connection in stillImageOutput.connections) {
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]){
                videoConnection = connection;
                break;
            }
        }
        if (videoConnection) {
            break;
        }
    }
    [stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer != NULL) {
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            UIImage *image = [UIImage imageWithData:imageData];
            self.imageView.image = image;
        }
    }];
}
/*
- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)takePhotoOld{
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
 */
/*
 * TESTING END
 */

@end
