//
//  PostCell.h
//  Instagram
//
//  Created by Samuel Osa-Agbontaen on 6/29/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *postDescription;
@property (weak, nonatomic) IBOutlet UIButton *detailsButton;
@property (weak, nonatomic) IBOutlet UIImageView *posterAvatar;
@property (weak, nonatomic) IBOutlet UILabel *posterName;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (nonatomic) Post* post;
@end

NS_ASSUME_NONNULL_END
