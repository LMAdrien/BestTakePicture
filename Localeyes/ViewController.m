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

//  Action button shot camera => to Refactoring
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

// Method to Load Streaming camera to UIView

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


// Method Action Button one shoot camera

- (IBAction)takePhoto:(id)sender {
    //NSInteger NbElementsArray = _ProspectImage.count;
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
 * Test Method
 */

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

/*
 * TESTING END
 */

@end
