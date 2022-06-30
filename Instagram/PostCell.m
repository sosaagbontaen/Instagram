//
//  PostCell.m
//  Instagram
//
//  Created by Samuel Osa-Agbontaen on 6/29/22.
//

#import "PostCell.h"

@implementation PostCell
- (IBAction)likePost:(id)sender {
}
- (IBAction)commentOnPost:(id)sender {
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)likeAction:(id)sender {
    if (self.post.likedByUser == NO){
        [self.post incrementKey:@"likeCount"];
        self.post.likedByUser = YES;
    } else{
        self.post.likedByUser = NO;
    }
    
    [self.post saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [self refreshLikes];
        }
        else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (void)refreshLikes{
    UIImage *emptyHeart = [UIImage imageNamed:@"heart.fill"];
        UIImage *fullHeart = [UIImage imageNamed:@"heart"];
    [self.likeButton setSelected:NO];
        [self.likeButton setHighlighted:NO];
    
    self.likeCountLabel.text = [NSString stringWithFormat:@"%d", self.post.likeCount];
    if (self.post.likedByUser == YES){
        
        NSLog(@"full!");
        [self.likeButton setImage:fullHeart
                                   forState:UIControlStateNormal];
    }
    else{
        
        NSLog(@"empty!");
        [self.likeButton setImage:emptyHeart
                                   forState:UIControlStateNormal];
    }
    
}


- (void)setPost:(Post *)post {
    self.postDescription.text = post.caption;
    self.postImage.image = [UIImage imageWithData:[post.image getData]];
    [post.author fetchIfNeeded];
    self.posterName.text = post.author.username;
    self.likeCountLabel.text = [NSString stringWithFormat:@"%d", self.post.likeCount];
    
    long datePostedAsInt;
        
    if ([post.datePosted secondsAgo] < 60){
        datePostedAsInt = [post.datePosted secondsAgo];
        self.dateView.text = [NSString stringWithFormat:@"%lds", datePostedAsInt];
    }
    else if ([post.datePosted minutesAgo] < 60){
        datePostedAsInt = [post.datePosted minutesAgo];
        self.dateView.text = [NSString stringWithFormat:@"%ldm", datePostedAsInt];
    }
    else if ([post.datePosted hoursAgo] < 24){
        datePostedAsInt = [post.datePosted hoursAgo];
        self.dateView.text = [NSString stringWithFormat:@"%ldh", datePostedAsInt];
    }
    else if ([post.datePosted daysAgo] < 7){
        datePostedAsInt = [post.datePosted daysAgo];
        self.dateView.text = [NSString stringWithFormat:@"%ldd", datePostedAsInt];
    }
    else{
        NSString *formattedDate = [post.datePosted formattedDateWithStyle:NSDateFormatterShortStyle];
        self.dateView.text = formattedDate;
    }
}

@end
