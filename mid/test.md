<!-- TOC -->

- [1. like](#1-like)
    - [1.1. post：like/contentID：点赞](#11-postlikecontentid点赞)
    - [1.2. patch:like/contentID：取消点赞数](#12-patchlikecontentid取消点赞数)
    - [1.3. get:like：获取当前用户点赞的content/comment的id,想要获得当前content的点赞数需要用`content/detail/id`.获取comment的点赞数用`comment/contentID`获取该content下的所有comment的信息。](#13-getlike获取当前用户点赞的contentcomment的id想要获得当前content的点赞数需要用contentdetailid获取comment的点赞数用commentcontentid获取该content下的所有comment的信息)
- [2. content](#2-content)
    - [2.1. delete:content/contentID](#21-deletecontentcontentid)
    - [2.2. get：content/detail/contentID：根据id获得content的具体信息，相较根据userid获得的content的内容，这里在最后多了一个user属性集。](#22-getcontentdetailcontentid根据id获得content的具体信息相较根据userid获得的content的内容这里在最后多了一个user属性集)
    - [2.3. get：content/public?page=1&eachPage=100](#23-getcontentpublicpage1eachpage100)
    - [2.4. get：content/texts/userID：根据用户id得到用户所发布的全部content的信息，不包括content下的评论](#24-getcontenttextsuserid根据用户id得到用户所发布的全部content的信息不包括content下的评论)
    - [2.5. post：content/text(发布一条新的)](#25-postcontenttext发布一条新的)
    - [2.6. patch：content/all/contentID:根据id修改content的内容-bug：只要登录状态下都能根据id修改任何content](#26-patchcontentallcontentid根据id修改content的内容-bug只要登录状态下都能根据id修改任何content)
    - [2.7.](#27)
- [3. comment](#3-comment)
    - [3.1. get:comment/contentID:获取该content下的全部评论的信息](#31-getcommentcontentid获取该content下的全部评论的信息)
    - [3.2. Post：/comment](#32-postcomment)
    - [3.3. delete：comment/id](#33-deletecommentid)
- [4. Thumb](#4-thumb)
    - [4.1. get:thumb/ThumbID](#41-getthumbthumbid)
    - [4.2. get:thumb/url](#42-getthumburl)

<!-- /TOC -->

# 1. like

## 1.1. post：like/contentID：点赞

- body :
```
{
    "isContent":true,
    "isComment":true,
    "isReply":true
}
```
- res-1:
```
{
    "State": "success",
    "Data": ""
}
```

- res-2:已经点过赞
```

{
    "State": "exist",
    "Data": ""
}
```

- res-3:id错误等
```
{
    "State": "bad_req",
    "Data": ""
}
```

- ps:

    - 每个用户只能对同一条点一次赞。
    - comment和reply意义不明




## 1.2. patch:like/contentID：取消点赞数

- body同post like

- res-1：
```
{
    "State": "success",
    "Data": ""
}
```

- res-2:已经取消过

```
{
    "State": "not found",
    "Data": ""
}
```

## 1.3. get:like：获取当前用户点赞的content/comment的id,想要获得当前content的点赞数需要用`content/detail/id`.获取comment的点赞数用`comment/contentID`获取该content下的所有comment的信息。

- body：

无

- res:

```
{
    "State": "success",
    "Data": [
        "5fc4e198f5beb29bc3968c9c",
        "5fc366e3f5beb29bc3968ba1"
    ]
}
```
data可以是空







# 2. content

## 2.1. delete:content/contentID

- body:
wu

- res-1:

```
{
    "State": "success",
    "Data": ""
}
```

- res-2:同一条id的话删两次。测了一下，这个是id格式正确的话，若不存在就返回notfound，格式错误就是下面那个。格式的话应该长度一样就是正确格式。

```
{
    "State": "not found",
    "Data": ""
}
```

- res-3:

```
{
    "State": "bad_req",
    "Data": ""
}
```

## 2.2. get：content/detail/contentID：根据id获得content的具体信息，相较根据userid获得的content的内容，这里在最后多了一个user属性集。

- body:

- res-1;

```
{
    "State": "success",
    "Data": {
        "ID": "5fc4d57cf5beb29bc3968c88",
        "Name": "hello wo222rld",
        "Detail": "hw_mid_test",
        "OwnID": "5fc314a3f5beb29bc3968b65",
        "PublishDate": 1606735228000,
        "EditDate": 1606735228000,
        "LikeNum": 0,
        "CommentNum": 0,
        "Public": true,
        "Native": false,
        "Type": "Text",
        "SubType": "",
        "Remarks": "",
        "Tag": [],
        "Image": [],
        "Files": [],
        "Movie": {
            "File": {
                "File": "",
                "Size": 0,
                "Title": "",
                "Time": 0,
                "Count": 0,
                "Type": ""
            },
            "URL": "",
            "Image": [],
            "Type": "",
            "Detail": "",
            "Watched": false
        },
        "Album": {
            "Images": [],
            "Title": "",
            "Time": 0,
            "Location": ""
        },
        "App": {
            "File": {
                "File": "",
                "Size": 0,
                "Title": "",
                "Time": 0,
                "Count": 0,
                "Type": ""
            },
            "Web": "",
            "URL": "",
            "Image": [],
            "Version": ""
        }
    },
    "User": {
        "Name": "ddd",
        "Avatar": "",
        "Gender": 0
    }
}
```

- res-2-3同上

## 2.3. get：content/public?page=1&eachPage=100

这个应该不需要怎么解释，返回值列举一个

每一条content由data分隔开，包含在一个data[]中
```
{
"State": "success",
    "Data": [


        //1
        {
            "Data": {
                "ID": "5fc4e93df5beb29bc3968cab",
                "Name": "懒狗",
                "Detail": "wzh",
                "OwnID": "5fbcb442f5beb22628d4b685",
                "PublishDate": 1606740285000,
                "EditDate": 1606740285000,
                "LikeNum": 0,
                "CommentNum": 0,
                "Public": true,
                "Native": false,
                "Type": "Text",
                "SubType": "",
                "Remarks": "",
                "Tag": [],
                "Image": [],
                "Files": [],
                "Movie": {
                    "File": {
                        "File": "",
                        "Size": 0,
                        "Title": "",
                        "Time": 0,
                        "Count": 0,
                        "Type": ""
                    },
                    "URL": "",
                    "Image": [],
                    "Type": "",
                    "Detail": "",
                    "Watched": false
                },
                "Album": {
                    "Images": [],
                    "Title": "",
                    "Time": 0,
                    "Location": ""
                },
                "App": {
                    "File": {
                        "File": "",
                        "Size": 0,
                        "Title": "",
                        "Time": 0,
                        "Count": 0,
                        "Type": ""
                    },
                    "Web": "",
                    "URL": "",
                    "Image": [],
                    "Version": ""
                }
            },
            "User": {
                "Name": "张三",
                "Avatar": "",
                "Gender": 0
            }
        },

        //2
        {

        }
    ]
}
```

## 2.4. get：content/texts/userID：根据用户id得到用户所发布的全部content的信息，不包括content下的评论

- body:
wu

- res-1:

```c++

{
    "State": "success",
    "Data": [

    //1
        {
            "ID": "5fc4d57cf5beb29bc3968c88",
            "Name": "hello wo222rld",
            "Detail": "hw_mid_test",
            "OwnID": "5fc314a3f5beb29bc3968b65",
            "PublishDate": 1606735228000,
            "EditDate": 1606735228000,
            "LikeNum": 0,
            "CommentNum": 0,
            "Public": true,
            "Native": false,
            "Type": "Text",
            "SubType": "",
            "Remarks": "",
            "Tag": [],
            "Image": [],
            "Files": [],
            "Movie": {
                "File": {
                    "File": "",
                    "Size": 0,
                    "Title": "",
                    "Time": 0,
                    "Count": 0,
                    "Type": ""
                },
                "URL": "",
                "Image": [],
                "Type": "",
                "Detail": "",
                "Watched": false
            },
            "Album": {
                "Images": [],
                "Title": "",
                "Time": 0,
                "Location": ""
            },
            "App": {
                "File": {
                    "File": "",
                    "Size": 0,
                    "Title": "",
                    "Time": 0,
                    "Count": 0,
                    "Type": ""
                },
                "Web": "",
                "URL": "",
                "Image": [],
                "Version": ""
            }
        },

            //2
            {
            ```
            }



        }
    ]
}
```

## 2.5. post：content/text(发布一条新的)

- body:

```
{
    "title":"哈哈",
    "detail":"VTB天狗",
    "tags":[],
    "isPublic":true
}
```

- res-1:

```
{
    "State": "success",
    "Data": ""
}
```

## 2.6. patch：content/all/contentID:根据id修改content的内容-bug：只要登录状态下都能根据id修改任何content

格式同content/text

## 2.7.  


# 3. comment

## 3.1. get:comment/contentID:获取该content下的全部评论的信息

- body

无

- res-1:

几个参数的解释如下：
1. Comment
    1. {}：直接对应于content，回复content的叫做comment
    2. ID:该comment的id
    3. ContentID:该comment回复的那条content的id
    4. FatherID:回复的那条content对应的user的id（即发布这条content的用户id）
    5. data
    6. Content:内容
    7. LikeNume
2. User:
    1. Name:这个comment的用户名
    2. 
3. Replies：如果没有回复则是null。replies特指？回复comment的语句，(疑问：如何回复reply？我用reply的id，使用comment语句去回复会提示`not found``)
    1. Reply
        1. ID：
        2. contentID：回复的那条comment的id
        3. fatherID：comment所在的那条conteneID
        4. UserID
        5. Date
        6.Content
        7. LikeNum
    2. User
        1. Name:发送这条reply的用户名
        2. 
        3. 
    3. Father
        1. Name:这里应该是后端固定给你把id改成了匿名用户，让你可以回复的时候at一下，不懂什么意思

```
{
    "State": "success",
    "Data": [
        {
            "Comment": {
                "ID": "5fc50e64f5beb29bc3968cca",
                "ContentID": "5fc508c0f5beb29bc3968cb9",
                "FatherID": "5fc314a3f5beb29bc3968b65",
                "UserID": "5fbde0e0f5beb22628d4b697",
                "Date": 1606749796000,
                "Content": "VTB是什么呀",
                "LikeNum": 1
            },
            "User": {
                "Name": "郑桌",
                "Avatar": "",
                "Gender": 0
            },
            "Replies": [
                {
                    "Reply": {
                        "ID": "5fc51295f5beb29bc3968cd0",
                        "ContentID": "5fc50e64f5beb29bc3968cca",
                        "FatherID": "5fc508c0f5beb29bc3968cb9",
                        "UserID": "5fc314a3f5beb29bc3968b65",
                        "Date": 1606750869000,
                        "Content": "套皮女主播罢了",
                        "LikeNum": 0
                    },
                    "User": {
                        "Name": "VTB舔狗",
                        "Avatar": "",
                        "Gender": 0
                    },
                    "Father": {
                        "Name": "匿名用户",
                        "Avatar": "https://pic3.zhimg.com/50/v2-e2361d82ce7465808260f87bed4a32d0_im.jpg",
                        "Gender": 0
                    }
                }
            ]
        },
        {
            "Comment": {
                "ID": "5fc50e14f5beb29bc3968cc3",
                "ContentID": "5fc508c0f5beb29bc3968cb9",
                "FatherID": "5fc314a3f5beb29bc3968b65",
                "UserID": "5fc314a3f5beb29bc3968b65",
                "Date": 1606749716000,
                "Content": "我也来做个测试v2",
                "LikeNum": 0
            },
            "User": {
                "Name": "VTB舔狗",
                "Avatar": "",
                "Gender": 0
            },
            "Replies": null
        },
        {
            "Comment": {
                "ID": "5fc50c0af5beb29bc3968cbb",
                "ContentID": "5fc508c0f5beb29bc3968cb9",
                "FatherID": "5fc314a3f5beb29bc3968b65",
                "UserID": "5fc50612f5beb29bc3968cb7",
                "Date": 1606749194000,
                "Content": "做一个简单的测试",
                "LikeNum": 1
            },
            "User": {
                "Name": "晗町",
                "Avatar": "",
                "Gender": 0
            },
            "Replies": [
                {
                    "Reply": {
                        "ID": "5fc50db3f5beb29bc3968cbd",
                        "ContentID": "5fc50c0af5beb29bc3968cbb",
                        "FatherID": "5fc508c0f5beb29bc3968cb9",
                        "UserID": "5fc314a3f5beb29bc3968b65",
                        "Date": 1606749619000,
                        "Content": "我也来做个测试",
                        "LikeNum": 1
                    },
                    "User": {
                        "Name": "VTB舔狗",
                        "Avatar": "",
                        "Gender": 0
                    },
                    "Father": {
                        "Name": "匿名用户",
                        "Avatar": "https://pic3.zhimg.com/50/v2-e2361d82ce7465808260f87bed4a32d0_im.jpg",
                        "Gender": 0
                    }
                }
            ]
        }
    ]
}
```

## 3.2. Post：/comment

- body：

1. contentID:你要回复的那条content/comment的id
2. fatherID：顺着你要回复的那条content/comment的信息看，下面一条（一般是contentID，我感觉这里说grandfather也许更好？指的是要回复的那一条的上一级id）。
 >如果是从广场去回复别人的content，一般是从public拉下来信息，public里的content有`id`和`ownID`两种，id对应的就是contentID，OwnId对应的就是fatherID。而如果是回复别人的comment信息，想要知道comment的信息那就需要从content入手，用comment/contentID来拉去content下面的comment信息。就用ID和contentID来对应这里的contentID和fatherID
3. content
4. isReply：回复content：false；回复comment：true，回复reply：未知

```
{
    "contentID":"5fc50c0af5beb29bc3968cbb",
    "fatherID":"5fc508c0f5beb29bc3968cb9",
    "content":"测试v3",
    "isReply":true
}
```

## 3.3. delete：comment/id

- 删除别人的
```
{
    "State": "not_allow",
    "Data": ""
}
```

经测试，不能删除别人的content/comment，但是可以更改content/.comment没有patch接口，那没事了



# 4. Thumb

## 4.1. get:thumb/ThumbID

如果content有图片，会有thumb的id值，记录一下通过这个可以获取图片。

## 4.2. get:thumb/url

没看到url
