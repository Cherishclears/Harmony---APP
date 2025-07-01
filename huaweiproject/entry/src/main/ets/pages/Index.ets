import HttpTools from '../tool/Httptool'

interface IconItem {
  icon: Resource;
  label: string;
  color: string;
}

interface CourseItem {
  id: number
  title: string
  icon: Resource
  bgColor: string
  rating: number
  students: number
  date: string
  star:number
  category: string
  about:string
}
@Entry
@Component


export default struct Index{
  @State query : string = ''
  @State courses: CourseItem[] = [
    {
      id: 1,
      title: 'TypeScript技术入门',
      icon: $rawfile('image/course1.png'),
      bgColor: '#8FA2E3',
      rating: 66.6,
      students: 64,
      star:4.8,
      date: '2022/02/21',
      category: '更新',
      about:"圆桌"
    },
    {
      id: 2,
      title: 'ArkTS基础知识',
      icon: $rawfile('image/course2.png'),
      bgColor: '#A8A8A8',
      rating: 48.5,
      students: 5,
      star:5.0,
      date: '2022/02/21',
      category: '更新',
      about:"圆桌"
    },
    {
      id: 3,
      title: 'ArkTS开发实践',
      icon: $rawfile('image/course3.png'),
      bgColor: '#7BB5A0',
      rating: 99.0,
      students: 42,
      star:4.8,
      date: '2022/02/21',
      category: '相关',
      about:"圆桌"
    },
    {
      id: 4,
      title: '应用程序入口',
      icon: $rawfile('image/course4.png'),
      bgColor: '#5A7BA3',
      rating: 9.6,
      students: 92,
      star:4.5,
      date: '2022/02/21',
      category: '更新',
      about:"圆桌"
    },
    {
      id: 5,
      title: 'HarmonyOS开发',
      icon: $rawfile('image/course5.png'),
      bgColor: '#E57373',
      rating: 88.2,
      students: 156,
      star:4.8,
      date: '2022/02/21',
      category: '热门',
      about:"圆桌"
    },
    {
      id: 6,
      title: '计算机组成原理',
      icon: $rawfile('image/course6.png'),
      bgColor: '#9575CD',
      rating: 76.8,
      students: 89,
      star:4.8,
      date: '2022/02/21',
      category: '推荐',
      about:"圆桌"
    }]
  async loadVideorInfo(){
    // 从数据库获取用户信息
    let response = await HttpTools.getVideoInfo()
    this.courses = response.result as CourseItem[]
  }



  build() {
    Scroll(){
      Column(){
        // 导航栏
        Row(){
          Stack({ alignContent: Alignment.Start }) {
            Image($rawfile('icon/search.svg')).width(12).margin({left:12})
            TextInput({
              text:this.query,
              placeholder: "    想问什么都可以！",
              //Onchange
            })
              .margin({left:2})
              .layoutWeight(1)
            Divider()
              .vertical(true)
              .strokeWidth(1)
              .color(Color.Grey)
              .height(20)
              .margin({ left: 280})
            Text('搜索').margin({left:300}).fontColor(Color.Blue)
          }

        }
        .width("98%")
        .height("10%")

        //轮播图
        this.swiperComponent(this.swiper_images)

        //菜单
        Grid() {
          ForEach(this.iconData, (item: IconItem, index?: number) => {
            GridItem() {
              this.IconItem(item.icon, item.label, item.color)
            }
          }, (item: IconItem, index?: number) => index?.toString())
        }
        .columnsTemplate('1fr 1fr 1fr 1fr') // 4列布局
        .rowsTemplate('1fr 1fr') // 2行布局
        .columnsGap(10)
        .padding({ left: 15, right: 15 })
        .backgroundColor(Color.White)
        .height(140)
        .borderRadius(15)
        .width('95%')
        .margin({top:15})

        //Title（热门标题）
        Column() {
          Text("热门课程")
        }
        .width("100%")
        .margin({left:15,top:15})
        .alignItems(HorizontalAlign.Start)

        //grid网格卡片
        Grid() {
          ForEach(this.courses, (course: CourseItem) => {
            GridItem() {
              this.CourseCard(course)
            }
          })
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(16)
        .rowsGap(16)
        .width('100%')
        .layoutWeight(1)
        .scrollBar(BarState.Auto)



      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F3F3F3')
  }

  @Builder
  swiperComponent(images: string[]) {
    Swiper() {
      ForEach(images, (image: string, index: number) => {
        Image($rawfile(`${'image/swiper/' + image}`)).width('100%')
      })
    }
    .width('95%')
    .height('30%')
    .borderRadius(10)

  }

  @Builder IconItem(icon: Resource, label: string, color: string): void {
    Column() {
      // 图标容器
      Stack() {
        // 背景圆形
        Circle()
          .width(50)
          .height(50)
          .fill(Color.White)

        // 本地图片图标
        Image(icon)
          .width(20)
          .height(30)
      }
      .margin({ bottom: 4 })
      // 标签文字
      Text(label)
        .fontSize(12)
        .fontColor('#333333')
        .textAlign(TextAlign.Center)
        .maxLines(1)
    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      console.log(`点击了${label}`)
    })
  }


  @Builder CourseCard(course: CourseItem) {
    Column() {

      //  test
          Image(course.icon).borderRadius({ topLeft: 12, topRight: 12 })
            .backgroundColor(Color.White).height(100)

      //class Title

      Column(){
        Text(course.title).fontSize(14)
      }
      .alignItems(HorizontalAlign.Start)
      .width("100%")
      .margin({top:10,left:10})


      Column(){
            Row(){
              Image($rawfile('image/person.svg')).width(10).height(10).margin({left:10,top:6})
              Text(`${course.students}`).fontSize(12).padding({left:2})
              Image($rawfile('image/star.svg')).width(10).height(10).margin({left:4,top:6})
              Text(`${course.star}`).fontSize(12).padding({left:5})
              Text(`${course.date}`).fontSize(12).padding({left:5})
              Text(`${course.category}`).fontSize(12).padding({left:5})
            }
            .width("100%")
            .height(10)
      }

      Column(){
            Row(){
              Text(`${course.rating}`).fontSize(14).fontColor(Color.Red)
                .fontWeight(20).margin({left:8,bottom:8})

              Text(`${course.about}`).fontSize(12).margin({left:100})

            }
            .width("100%")
            .height(60)
      }

    }
    .width('100%')
    .height(180)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({
      radius: 8,
      color: '#1A000000',
      offsetX: 0,
      offsetY: 2
    })
    .onClick(() => {
      console.log(`点击了课程: ${course.title}`)
    })
  }


  private swiper_images: string[] = [
    'swiper1.png', 'swiper2.png'
  ]

  private iconData: IconItem[] = []

  aboutToAppear() {
    this.loadVideorInfo()

    // 在生命周期方法中初始化数据
    this.iconData = [
      { icon: $rawfile('image/book.svg'), label: '课程', color: '#4CAF50' } as IconItem,
      { icon: $rawfile('image/class.svg'), label: '班级', color: '#F44336' } as IconItem,
      { icon: $rawfile('image/pengyouquan.svg'), label: '圈子', color: '#E91E63' } as IconItem,
      { icon: $rawfile('image/plan.svg'), label: '计划', color: '#FF5722' } as IconItem,
      { icon: $rawfile('image/homework.svg'), label: '测评', color: '#2196F3' } as IconItem,
      { icon: $rawfile('image/message.svg'), label: '消息', color: '#4CAF50' } as IconItem,
      { icon: $rawfile('image/love.svg'), label: '我的收藏', color: '#F44336' } as IconItem,
      { icon: $rawfile('image/trash.svg'), label: '回收站', color: '#9E9E9E' } as IconItem
    ];
  }
}