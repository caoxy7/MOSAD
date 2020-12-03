//
//  PostItem.m
//  mid
//
//  Created by itlab on 12/1/20.
//

#import "ContentItem.h"

@implementation ContentItem

- (id)init
{
  self = [super init];

  _tags = [NSMutableArray new];
  return self;
}

- (NSDictionary *)getDict
{
    NSDictionary *dict = @{
        @"title" : _title,
        @"detail" : _detail,
        @"tags" : _tags,
        @"isPublic" : [NSNumber numberWithBool:_isPublic]
    };
    return dict;
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    self.title = dict[@"Name"];
    self.detail = dict[@"Detail"];
    self.isPublic = [dict[@"Public"] intValue] == 1;
    self.tags = (NSMutableArray *)dict[@"Tag"];
    self.contentID = dict[@"ID"];
    self.ownerID = dict[@"OwnID"];
<<<<<<< HEAD
    self.PublishDate = [dict[@"PublishDate"] longValue]/1000;
=======
    self.PublishDate = [dict[@"PublishDate"] longValue] / 1000;
>>>>>>> 76d5ad1d6625334b12b8b990b89a1a0081eaa43c
    self.likeNum = [dict[@"LikeNum"] intValue];
    self.commentNum = [dict[@"CommentNum"] intValue];
    self.type = dict[@"Type"];
    
    self.album = dict[@"Album"];
    
    return self;
}
@end
