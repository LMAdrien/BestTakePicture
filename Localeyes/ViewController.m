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
@synthesize motionManager;
@end


@implementation ViewController

    AVCaptureSession *session;
    AVCaptureStillImageOutput *stillImageOutput;
    CMMotionManager *motionManager;


// Initialize object

- (void)viewDidLoad {
    [super viewDidLoad];
    _outImage = [[UIImage alloc] init];
    
    _ProspectImage = [[NSMutableArray alloc] init];
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

// Auto lock orientation

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

// Method to Load Streaming camera to UIView

-(void)viewWillAppear:(BOOL)animated{
    [_NumberShoot setText:[NSString stringWithFormat: @"%li",(unsigned long)[_ProspectImage count]]];
    session = [[AVCaptureSession alloc] init];
    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    AVCaptureDevice *inputDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];
    if ([session canAddInput:deviceInput])
        [session addInput:deviceInput];
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
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
             [_ProspectImage insertObject:image atIndex:[_ProspectImage count]];
             [_NumberShoot setText:[NSString stringWithFormat: @"%li",(unsigned long)[_ProspectImage count]]];
                       self.imageView.image = image;
        }
    }];
    if(ERRORNSLOG == true)
    {
        for (NSInteger i = 0; i < _ProspectImage.count; i++) {
            NSLog(@"%@", [_ProspectImage[i] description]);
            NSLog(@"%lu", (unsigned long)_ProspectImage.count);
        }
    }

}
//


@end
