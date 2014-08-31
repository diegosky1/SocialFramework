//
//  ViewController.h
//  socialapp
//
//  Created by Diego Quevedo on 06/03/14.
//  Copyright (c) 2014 Diego Quevedo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextView *postText;
@property (strong, nonatomic) IBOutlet UIImageView *postImage;
@property (strong, nonatomic) IBOutlet UIImageView *capturedScreen;

- (IBAction)selectImage:(id)sender;
- (IBAction)sendPost:(id)sender;
- (IBAction)sendPostTwitter:(id)sender;
- (IBAction)screenImage:(id)sender;

@end
