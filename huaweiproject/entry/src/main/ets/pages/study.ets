import router from '@ohos.router'
import { ArkTSUtils } from '@kit.ArkTS'


interface MyCourse{
  title: string
  icon: string
  derive: string
  lesson_num: number
}

@Entry
@Component

export default struct study{
  @State flag: number = 0

  @State courses: MyCourse[]=[
    {
      title:"ArkTS基础知识",
      icon:'image/course1-small.png',
      derive:"华为开发者联盟",
      lesson_num:32
    },
    {
      title:"ArkTS开发实践",
      icon:'image/course2-small.png',
      derive:"华为开发者联盟",
      lesson_num:48
    },
    {
      title:"ArkTS基础知识",
      icon:'image/course3-small.png',
      derive:"华为开发者联盟",
      lesson_num:64
    }
  ]
  build() {
    Column() {

      // 标题1
      this.TitleComponent1()

      // 上次学习
      Text('上次学习').width('96%').height(40).fontSize(10).fontWeight(400)

      this.HistoryComponent()

      // 标题2
      this.TitleComponent2()

      // 我的课程
      Scroll() {
        Column() {
          ForEach(this.courses, (item: MyCourse, index: number) => {
            this.MyCourseComponent(item, index)
          })
        }.margin({ bottom: 80 })
      }.width('100%').height('45%').scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
  @Builder TitleComponent1() {
    Row() {
      Text('学习，成就更好的自我').fontSize(20).fontWeight(400)
      Badge({ value: '', style: { badgeSize: 5, badgeColor: Color.Red } }) {
        Button() {
          Row() {
            Image($rawfile('icon/people.png')).width(16).height(16)
            Text('班级群').fontSize(12).fontColor('#FF708BE2')
          }
        }.width(90).height(26).backgroundColor('#ffd9e9ff')
      }.width(90).height(26)

    }
    .width('96%')
    .height(40)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder HistoryComponent() {
    Stack({ alignContent: Alignment.TopStart }) {
      Image($rawfile('image/course1.png')).width('100%').height(155).borderRadius({
        topLeft: 10, topRight: 10
      })

      Row() {
        Column() {

          Text('HarmonyOS 应用开发').width('90%').fontSize(12)

          Row() {
            Text('华为开发者联盟').fontSize(12).fontColor('#FFBABABA')
            Text('共32节').fontSize(12).fontColor('#FFBABABA')
          }
          .width('90%')
          .justifyContent(FlexAlign.SpaceBetween)

          Button('继续学习')
            .type(ButtonType.Capsule)
            .width('85%')
            .backgroundColor('#FF708BE2')
            .onClick(() => {
              router.pushUrl({
                url: 'pages/CourseDetail',
                params: {
                  url: ''
                }
              })
            })
        }
        .width('90%')
        .height(120)
        .borderRadius(10)
        .backgroundColor(Color.White)
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ top: 60 })
      }
      .width('100%')
      .height('60%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 140 })
      .borderRadius({
        bottomLeft: 10, bottomRight: 10
      })
      .linearGradient({
        direction: GradientDirection.Bottom,
        repeating: true,
        colors: [['#16f3f3f3', 0.0], ['#b7484848', 1.0]]
      })

    }
    .width('96%').height(350).borderRadius(10)
  }


  @Builder TitleComponent2() {
    Row() {
      Text('我的课程').height(40).fontSize(16).fontWeight(400)

      Row() {
        this.TextToggle('近期学习', 0)
        this.TextToggle('我的购买', 1)
      }
      .width(130)
      .height(30)
      .borderRadius(25)
      .backgroundColor('#FFF3F3F3')
      .justifyContent(FlexAlign.Center)
    }
    .width('96%')
    .height(50)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder TextToggle(name: string, index: number) {
    Text(name)
      .width(60)
      .height(24)
      .fontSize(12)
      .textAlign(TextAlign.Center)
      .borderRadius(25)
      .fontColor(this.flag == index ? Color.Black : '#ffa4a4a4')
      .backgroundColor(this.flag == index ? Color.White : '#FFF3F3F3')
      .onClick(() => {
        this.flag = index
      })
  }


  @Builder MyCourseComponent(course: MyCourse, index: number) {
    Stack({ alignContent: Alignment.Center }) {
      Column() {
        Text(course.title).width('70%').fontSize(18).textAlign(TextAlign.Start)
        Row() {
          Text(course.derive).fontColor('#FF777777').fontSize(12)
          Row() {
            Text('共' + course.lesson_num + '节').fontSize(12).fontColor('#FF777777')
            // Divider().vertical(true).height(14).margin({ left: 5, right: 5 })
            // Text(course.schedule).fontSize(12).fontColor('#FF708BE2')
          }
        }.width('70%').justifyContent(FlexAlign.SpaceBetween).padding({ right: 5 })
      }
      .width('100%')
      .height(110)
      .borderRadius(10)
      .alignItems(HorizontalAlign.End)
      .justifyContent(FlexAlign.SpaceAround)
      .backgroundColor('#FFF3F3F3')

      Image($rawfile(course.icon))
        .width(100)
        .height(100)
        .borderRadius(10)
        .margin({ right: 1000, bottom: 120 })
      if (index == 0) {
        Text('上次学习')
          .width(55)
          .height(20)
          .fontSize(12)
          .fontColor(Color.White)
          .backgroundColor('#FF708BE2')
          .borderRadius({ topLeft: 10, bottomRight: 10 })
          .margin({ right: 9999, bottom: 9999 })
      }
    }
    .width('96%').height(130)
  }
}
