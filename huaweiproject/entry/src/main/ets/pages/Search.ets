import router from '@ohos.router'
interface CourseItem {
  title: string
  icon: Resource
  rating: number
  students: number
}


@Entry
@Component


export default struct Search1{
  @State query : string = ''

  @State courses: CourseItem[]= [
    {
      title: 'TypeScript技术入门',
      icon: $rawfile('image/course1-small.png'),
      rating: 66.6,
      students: 27,
    },
    {
      title: 'ArkTS基础知识',
      icon: $rawfile('image/course2-small.png'),
      rating: 28.5,
      students: 100,
    },
    {
      title: 'ArkTS开发实践',
      icon: $rawfile('image/course3-small.png'),
      rating:99.0,
      students: 30,
    },
    {
      title: '应用程序入门',
      icon: $rawfile('image/course4-small.png'),
      rating: 9.9,
      students: 19,
    },
    {
      title: '基础组件的使用',
      icon: $rawfile('image/course5-small.png'),
      rating: 0.99,
      students: 56,
    },
    {
      title: '容器组件介绍',
      icon: $rawfile('image/course6-small.png'),
      rating: 9.9,
      students: 57,
    },
    {
      title: '构建列表页面',
      icon: $rawfile('image/course7-small.png'),
      rating: 21.04,
      students: 87,
    },
  ]

  build(){
    Scroll(){
      Column(){
        // 一、导航栏
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

        //二 综合排序和价格区间

        Row(){
          Text("综合排序").fontSize(12)
          Image($rawfile("icon/down.png")).width(20)
          Text("价格区间").fontSize(12).margin({left:5})
          Image($rawfile("icon/down.png")).width(20)
        }
        .width("92%")
        .height("5%")

        Divider().color('#FFF3F3F3')

        // 三、Rowsplit

        RowSplit() {
          //Text('1').width('20%').height("100%").backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          //左组件
          ColumnSplit(){
            Text('语言').width('100%').height(50).textAlign(TextAlign.Center)
            Text('职业').width('100%').height(50).textAlign(TextAlign.Center)
            Text('认证').width('100%').height(50).textAlign(TextAlign.Center)
            Text('HM OS').width('100%').height(50).textAlign(TextAlign.Center)
            Text('大数据').width('100%').height(50).textAlign(TextAlign.Center)
            Text('华为云').width('100%').height(50).textAlign(TextAlign.Center)
            Text('人工智能').width('100%').height(50).textAlign(TextAlign.Center)
          }
          .width('20%')
          .height("70%")
          .resizeable(false)
          //右组件
          Column(){
            Row(){
              Text("Arkts").fontSize(12)
              Text("ArkUI").fontSize(12).margin({left:15})
              Text("Javascript").fontSize(12).margin({left:15})
              Text("Typescript").fontSize(12).margin({left:15})
            }.justifyContent(FlexAlign.Center)

            //grid网格卡片
            Grid() {
              ForEach(this.courses, (course: CourseItem) => {
                GridItem() {
                  this.CourseCard(course)
                }
              })
            }
            .margin({top:20})
            .columnsTemplate('1fr')
            .columnsGap(16)
            .rowsGap(16)
            .width('100%')
            .layoutWeight(1)
            .scrollBar(BarState.Auto)

          }.width("80%").height("100%")

        }
        .resizeable(false) // 可拖动
        .width('95%').height("75%")
      }.width('100%').margin({ top: 5 })

    }
  }
  @Builder CourseCard(course: CourseItem) {
    Row(){
      Image(course.icon).width(60).height(60).borderRadius(5)

      Column(){
        Text(course.title).fontSize(12)

        Row(){
            Text(String(course.rating)).fontSize(14)
            Text(course.students + "人在学").fontSize(12)
        }.justifyContent(FlexAlign.SpaceBetween)
        .height("10%")
        .width("40%")
        .margin({left:50})

      }
    }
  }
}