import router from '@ohos.router'

@Entry
@Component
struct Settings {
  @State message: string = 'Hello World'

  build() {

    Column() {

      // Title
      Row() {
        Image($rawfile('icon/back.png')).width(18).height(18).onClick(() => {
          router.back()
        })

        Text('设置').fontSize(12).letterSpacing(2)

        Row() {
        }.width(20)
      }.width('95%').height(50).justifyContent(FlexAlign.SpaceBetween)

      Divider()

      Column() {
        Row() {
          Text('个人信息').fontSize(12)
          Image($rawfile('icon/ge.png')).width(14).height(14)
        }.width('100%').height(55).justifyContent(FlexAlign.SpaceBetween)
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/person'
            }
          )
        })

        Divider().color(Color.Gray)

        Row() {
          Text('账号与安全').fontSize(12)
          Image($rawfile('icon/ge.png')).width(14).height(14)
        }.width('100%').height(55).justifyContent(FlexAlign.SpaceBetween)

        Divider().color(Color.Gray)

        Row() {
          Text('通知设置').fontSize(12)
          Image($rawfile('icon/ge.png')).width(14).height(14)
        }.width('100%').height(55).justifyContent(FlexAlign.SpaceBetween)
      }.width('96%')

      Divider().strokeWidth(10).color(Color.Gray)

      Column() {
        Row() {
          Text('全局护眼').fontSize(12)
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor('#007DFF')
            .switchPointColor('#FFFFFF')
            .onChange((isOn: boolean) => {
              console.info('Component status:' + isOn)
            })
        }.width('100%').height(55).justifyContent(FlexAlign.SpaceBetween)

        Divider().color(Color.Gray)

        Row() {
          Text('家长监管').fontSize(12)
          Image($rawfile('icon/ge.png')).width(14).height(14)
        }.width('100%').height(55).justifyContent(FlexAlign.SpaceBetween)

        Divider().color(Color.Gray)

        Row() {
          Text('清除缓存').fontSize(12)
          Text('10.24MB').fontSize(12).fontColor('#ffa4a4a4')
        }.width('100%').height(55).justifyContent(FlexAlign.SpaceBetween)

        Divider().color(Color.Gray)

        Row() {
          Text('个性化推荐').fontSize(12)
          Image($rawfile('icon/ge.png')).width(14).height(14)
        }.width('100%').height(55).justifyContent(FlexAlign.SpaceBetween)

      }.width('96%')

      Divider().strokeWidth(10).color(Color.Gray)

      Column() {
        Row() {
          Text('关于').fontSize(12)
          Image($rawfile('icon/ge.png')).width(14).height(14)
        }.width('100%').height(55).justifyContent(FlexAlign.SpaceBetween)

        Divider().color(Color.Gray)

        Row() {
          Text('个人信息收集清单').fontSize(12)
          Image($rawfile('icon/ge.png')).width(14).height(14)
        }.width('100%').height(55).justifyContent(FlexAlign.SpaceBetween)

        Divider().color(12)

        Row() {
          Text('第三方信息共享清单').fontSize(12)
          Image($rawfile('icon/ge.png')).width(14).height(14)
        }.width('100%').height(55).justifyContent(FlexAlign.SpaceBetween)

        Divider().color(Color.Gray)

      }.width('96%')


      Button('退 出 登 录')
        .type(ButtonType.Normal)
        .width('90%')
        .borderRadius(5)
        .fontColor('#ffffffff')
        .backgroundColor('rgb(235, 105, 121)')
        .margin({ top: 40 })

      Stack() {
        Divider().width('50%').strokeWidth(1).color('#FFBEBEBE')
        Text('通鸿云课堂   v1.0.0')
          .fontSize(14)
          .fontColor('#FFBEBEBE')
          .width(140)
          .textAlign(TextAlign.Center)
          .backgroundColor($r('app.color.start_window_background'))

      }.margin({ top: 80 })

    }.width('100%').height('100%').backgroundColor(Color.White)
  }
}