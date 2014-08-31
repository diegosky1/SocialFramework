//
//  ViewController.m
//  socialapp
//
//  Created by Diego Quevedo on 06/03/14.
//  Copyright (c) 2014 Diego Quevedo. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)initsocialthing{
  //  NSString *postText = @"myfirstpost";
//    UIImage *postImage = [UIImage imageNamed:@"1.png"];
//    NSArray *activityItems = @[postText, postImage]; UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
//    [self presentViewController:activityController animated:YES completion:nil];
    
//    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
//        
//        //device is able to send facebook post
//        SLComposeViewController *composeController = [SLComposeViewController
//                                                      composeViewControllerForServiceType:SLServiceTypeFacebook];
//        [composeController setInitialText:@"look at this Test post"];
//        [composeController addImage:postImage]; [composeController addURL: [NSURL URLWithString:
//                                                                                  @"http://www.google.com"]]; [self presentViewController:composeController
//                                                                                                                                      animated:YES completion:nil];
//        
//    }
//}

- (IBAction)selectImage:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init]; imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary; imagePicker.mediaTypes = @[(NSString *) kUTTypeImage]; imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

#pragma mark UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType]; [self dismissViewControllerAnimated:YES completion:nil];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        _postImage.image = image;
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if ([_postText isFirstResponder] && [touch view] != _postText) {
        [_postText resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}


-(IBAction)screenImage:(id)sender
{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    CGRect rect = [keyWindow bounds];
    UIGraphicsBeginImageContextWithOptions(rect.size,YES,0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [keyWindow.layer renderInContext:context];
    UIImage *capturedScreen = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/capturedImage.jpg"]];
    [UIImageJPEGRepresentation(capturedScreen, 0.95) writeToFile:imagePath atomically:YES];
    _capturedScreen.image=capturedScreen;
}



- (IBAction)sendPost:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        
        //device is able to send facebook post
        SLComposeViewController *composeController = [SLComposeViewController
                                                      composeViewControllerForServiceType:SLServiceTypeFacebook];
        [composeController setInitialText:@"Hey, this is a cool example post"];
        [composeController addImage:_capturedScreen.image]; [composeController addURL: [NSURL URLWithString:@"http://www.google.com"]]; [self presentViewController:composeController
    animated:YES completion:nil];
        
    }
    
    //Native post
//    NSArray *activityItems;
//    if (_postImage.image != nil) {
//        activityItems = @[_postText.text, _postImage.image];
//    } else {
//        activityItems = @[_postText.text];
//    }
//    UIActivityViewController *activityController = [[UIActivityViewController alloc]
//                                                    initWithActivityItems:activityItems applicationActivities:nil];
//    [self presentViewController:activityController animated:YES completion:nil];
}

- (IBAction)sendPostTwitter:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
        
        //device is able to send twitter post
        SLComposeViewController *composeControllerTwitter = [SLComposeViewController
                                                      composeViewControllerForServiceType:SLServiceTypeTwitter];
        [composeControllerTwitter setInitialText:@"#googling"];
        [composeControllerTwitter addImage:_capturedScreen.image];
        //[composeController addURL: [NSURL URLWithString:@"http://www.google.com"]];
        [self presentViewController:composeControllerTwitter animated:YES completion:nil];
    }
    
    
//    NSArray *activityItems;
//    if (_postImage.image != nil) {
//        activityItems = @[_postText.text, _postImage.image];
//    } else {
//        activityItems = @[_postText.text];
//    }
//    UIActivityViewController *activityController2 = [[UIActivityViewController alloc]
//                                                    initWithActivityItems:activityItems applicationActivities:nil];
//    [self presentViewController:activityController2 animated:YES completion:nil];
    

}



@end
