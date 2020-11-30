# like

## post：like/contentID

- body:
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




## patch:like/contentID

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

## get:like

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







# content

## delete:content/contentID

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

## get：content/detail/contentID

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

## get：content/public?page=1&eachPage=100

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

## get：content/texts/userID

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

## post：content/text(发布一条新的)

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

## patch：content/all/contentID

格式同content/text

## 
