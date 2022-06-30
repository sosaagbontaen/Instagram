//
//  DetailsViewController.m
//  Instagram
//
//  Created by Samuel Osa-Agbontaen on 6/30/22.
//

#import "DetailsViewController.h"
#import "DateTools.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dateViewLabel;

@end

@implementation DetailsViewController
- (IBAction)returnToFeed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.post.author fetchIfNeeded];
    self.usernameLabel.text = self.post.author.username;
    self.captionLabel.text = self.post.caption;
    self.postImage.image = [UIImage imageWithData:[self.post.image getData]];
    
    long datePostedAsInt;
        
    if ([self.post.datePosted secondsAgo] < 60){
        datePostedAsInt = [self.post.datePosted secondsAgo];
        self.dateViewLabel.text = [NSString stringWithFormat:@"%lds", datePostedAsInt];
    }
    else if ([self.post.datePosted minutesAgo] < 60){
        datePostedAsInt = [self.post.datePosted minutesAgo];
        self.dateViewLabel.text = [NSString stringWithFormat:@"%ldm", datePostedAsInt];
    }
    else if ([self.post.datePosted hoursAgo] < 24){
        datePostedAsInt = [self.post.datePosted hoursAgo];
        self.dateViewLabel.text = [NSString stringWithFormat:@"%ldh", datePostedAsInt];
    }
    else if ([self.post.datePosted daysAgo] < 7){
        datePostedAsInt = [self.post.datePosted daysAgo];
        self.dateViewLabel.text = [NSString stringWithFormat:@"%ldd", datePostedAsInt];
    }
    else{
        NSString *formattedDate = [self.post.datePosted formattedDateWithStyle:NSDateFormatterShortStyle];
        self.dateViewLabel.text = formattedDate;
    }
    
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
