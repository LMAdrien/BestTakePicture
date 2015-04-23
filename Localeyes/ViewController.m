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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }

//  Action button shot camera

- (IBAction)ActionShot:(id)sender {
    NSInteger NbElementsArray = _ProspectImage.count;
    _ViewCamera.image = _ViewPicture.image;
   [_ProspectImage insertObject:_ViewPicture.image atIndex:NbElementsArray];
    if(ERRORNSLOG == true)
    {
        for (NSInteger i = 0; i < _ProspectImage.count; i++) {
            NSLog(@"%@", [_ProspectImage[i] description]);
        }
    }
}

//  Action button to next column in department store

- (IBAction)ActionNextColumn:(id)sender {
    
}
@end
