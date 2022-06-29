//
//  HomeFeedViewController.m
//  Instagram
//
//  Created by Samuel Osa-Agbontaen on 6/28/22.
//

#import "HomeFeedViewController.h"
#import "Parse/Parse.h"
#import "SceneDelegate.h"
#import "LoginViewController.h"

@interface HomeFeedViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *composeButton;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@end

@implementation HomeFeedViewController
- (IBAction)composeAction:(id)sender {
}  

- (IBAction)logoutButton:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        SceneDelegate *mySceneDelegate = (SceneDelegate * ) UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

        
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        self.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"FeedNavigationController"];
        
        
        if ([mySceneDelegate.window.rootViewController isKindOfClass:[UINavigationController self]]){
            mySceneDelegate.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            NSLog(@"ONE!");
        }
        else{
            [self dismissViewControllerAnimated:YES completion:^{}];
            NSLog(@"TWO!");
        }
        
        NSLog(@"User logged out succesfully!");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
