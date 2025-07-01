import router from '@ohos.router'
import { http } from '@kit.NetworkKit';
import HttpTools from '../tool/Httptool'
interface  use{
  id:number
  username:string
  password:string
  nickname:string
  uid:string
  phone:string
  email:string
  signature:string
  labels:string[]
}
interface videohistory{
  video_image :Resource
  video_title :string
}

interface CourseItem{
  icon:Resource
  title:string
}

@Entry
@Component

export default struct mine{

  @State course0: videohistory[]= [
    {
      video_image:$rawfile('image/course1.png'),
      video_title:"Hello World 入门"
    },
    {
      video_image:$rawfile('image/course2.png'),
      video_title:"TS快速入门"
    },
    {
      video_image:$rawfile('image/course3.png'),
      video_title:"ArkTS基础训练"
    }
  ]

  @State courses: CourseItem[] =[{
    icon:$rawfile('image/homework.svg'),
    title:"作业"
  },
    {
      icon:$rawfile('image/daka.png'),
      title:"打卡"
    },
    {
      icon:$rawfile('image/star.svg'),
      title:"收藏"
    },
    {
      icon:$rawfile('image/notebook.png'),
      title:"笔记"
    },
  ]

  @State courses2: CourseItem[] =[{
    icon:$rawfile('image/list.png'),
    title:"订单"
  },
    {
      icon:$rawfile('image/coupon.png'),
      title:"优惠券"
    },
    {
      icon:$rawfile('image/profit.png'),
      title:"余额"
    }
  ]

  @State courses3: CourseItem[] =[{
    icon:$rawfile('image/kefu.png'),
    title:"在线客服"
  },
    {
      icon:$rawfile('image/download.png'),
      title:"缓存"
    }
  ]

  @State currentUser: use = {
    "id": 0,
    "username": "胡桃",
    "password": "",
    "nickname": "",
    "uid": "",
    "phone": "",
    "email": "",
    "signature": "",
    "labels": []
  }
  aboutToAppear() {
    this.loadUserInfo()
  }
  async loadUserInfo(){
    // 从数据库获取用户信息
    let response = await HttpTools.getUserInfo(globalThis.current_username)
    this.currentUser = response.result as use
  }


  build() {

    Column() {

      this.TitleComponent()

      this.AvatarComponent()

      this.HistoryComponent()

      this.ContentComponent()

      this.AccountComponent()

      this.OtherComponent()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .backgroundColor('#F3F3F3')
  }


  @Builder TitleComponent() {
    Row() {
      Image($rawfile('icon/setting.png')).width(20).height(20).margin({ right: 5 }).onClick(() => {
        router.pushUrl({
          url: 'pages/Setting'
        })
      })
      Badge({ value: '', style: { badgeSize: 5, badgeColor: Color.Red } }) {
        Image($rawfile('icon/ring.png')).width(20).height(20)
      }
      .width(20)
      .height(20)
    }
    .width('96%')
    .height(40)
    .justifyContent(FlexAlign.End)
  }


  @Builder AvatarComponent() {
    Row() {
      Image($rawfile('temp/cherish.jpg')).width(60).height(60).borderRadius(50)
      Column() {
        Row(){
          Text(this.currentUser.username).fontSize(14)
        }

        Text('UID:232407652').fontSize(12)
      }
      .width('75%')
      .height(50)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceAround)
    }
    .width('96%')
    .height(100)
    .justifyContent(FlexAlign.SpaceBetween)
  }



  @Builder HistoryComponent() {
    Text('观看历史').width('96%').height(50).fontSize(12).textAlign(TextAlign.Start)
    Scroll() {
      Row() {

        ForEach(this.course0, (item: videohistory) => {
          this.CourseCard2(item)
        })

        // ForEach(MockData.videos, (item: CommonEntity, index: number) => {
        //   Column() {
        //     Image(item.icon).width('100%').height(70).borderRadius(10)
        //     Text(item.text).fontSize(12)
        //   }
        //   .width(150)
        //   .height('80%')
        //   .justifyContent(FlexAlign.SpaceAround)
        //   .padding({ left: 5 })
        //   .margin({ left: 5, right: index == MockData.videos.length - 1 ? 5 : 0 }) // 最后一个数组元素，那么margin-right:5，
        // })
      }
      .width("100%")
      .height(140)
      .borderRadius(10)
      .backgroundColor(Color.White)
    }
    .width('96%')
    .borderRadius(10)
    .scrollBar(BarState.Off)
    .scrollable(ScrollDirection.Horizontal)
  }

  @Builder ContentComponent(){
    Column(){
      Text("观看历史").width('96%').height(20).fontSize(14).textAlign(TextAlign.Start)
      // Row(){
        Grid() {
          ForEach(this.courses, (course: CourseItem) => {
            GridItem() {
              this.CourseCard(course)
            }
          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr') // 4列布局
        .rowsTemplate('1fr') // 1行布局
        .columnsGap(10)
        .padding({ left: 15, right: 15 })
        .backgroundColor(Color.White)
        .height(80)
        .borderRadius(15)
        .width('95%')


    }
  }

  @Builder CourseCard2(course: videohistory){
    Column(){
      Image(course.video_image).width(70).height(50)
      Text(course.video_title).fontSize(10).margin({top:1})
    }
  }

  @Builder CourseCard(course: CourseItem){
    Column(){
      Image(course.icon).width(30).height(30)
      Text(course.title).fontSize(13).margin({top:1})
    }
  }

  @Builder AccountComponent(){
    Column(){
      Text("我的账户").width('96%').height(20).fontSize(14).textAlign(TextAlign.Start)
      Grid() {
        ForEach(this.courses2, (course: CourseItem) => {
          GridItem() {
            this.CourseCard(course)
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr') // 4列布局
      .rowsTemplate('1fr') // 1行布局
      .columnsGap(10)
      .padding({ left: 15, right: 15 })
      .backgroundColor(Color.White)
      .height(80)
      .borderRadius(15)
      .width('95%')
      .margin({top:5})
    }
  }

  @Builder OtherComponent(){
    Text("其他功能").width('96%').height(20).fontSize(14).textAlign(TextAlign.Start)
    Grid() {
      ForEach(this.courses3, (course: CourseItem) => {
        GridItem() {
          this.CourseCard(course)
        }
      })
    }
    .columnsTemplate('1fr 1fr 1fr 1fr') // 4列布局
    .rowsTemplate('1fr') // 1行布局
    .columnsGap(10)
    .padding({ left: 15, right: 15 })
    .backgroundColor(Color.White)
    .height(80)
    .borderRadius(15)
    .width('95%')
    .margin({top:5})
  }
}