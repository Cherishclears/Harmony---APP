import router from '@ohos.router'
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


@Entry
@Component

struct UserInfo {

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

  @State total: number = 0
  @State labels: string[] = []

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

      // Title
      this.TitleComponent()

      Divider()

      // Avatar Component
      Column() {
        Image($rawfile('temp/cherish.jpg')).width(100).height(100).borderRadius(50)
        Text('点击更换头像').height(40).fontSize(12).fontColor('#ffa4a4a4')
      }.width('100%').height(200).justifyContent(FlexAlign.Center)

      Column() {
        Text('昵称').margin({ bottom: 10 })

        TextInput({ text: this.currentUser.username })
          .borderRadius(0).backgroundColor(Color.White).fontColor('#ffa4a4a4')

        Divider()
      }.width('96%').alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Center).margin({ bottom: 15 })

      Column() {
        Text('手机').margin({ bottom: 10 })

        TextInput({ text: '+86 ' + this.currentUser.phone })
          .borderRadius(0).backgroundColor(Color.White).fontColor('#ffa4a4a4')

        Divider()
      }.width('96%').alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Center).margin({ bottom: 15 })

      Column() {
        Text('邮箱').margin({ bottom: 10 })

        TextInput({ text: this.currentUser.email })
          .borderRadius(0).backgroundColor(Color.White).fontColor('#ffa4a4a4')

        Divider()
      }.width('96%').alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Center).margin({ bottom: 15 })

      Column() {
        Text('密码').margin({ bottom: 10 })

        TextInput({ text: this.currentUser.password }).type(InputType.Password)
          .borderRadius(0).backgroundColor(Color.White).fontColor('#ffa4a4a4')

        Divider()
      }.width('96%').alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Center).margin({ bottom: 15 })


      Column() {
        Text('个人简介').margin({ bottom: 10 })
        Stack() {
          TextArea({
            text: this.currentUser.signature,
            placeholder: '示例：你可以填写兴趣爱好，心愿目标',
          })
            .placeholderFont({ size: 14 })
            .placeholderColor('#ffa4a4a4')
            .width('100%')
            .height(100)
            .fontSize(14)
            .fontColor('#FF182431')
            .borderRadius(10)
            .onChange((value) => {
              this.total = value.length
              if (value.length >= 30) {
                return
              }
            })
          Text(this.total + '/30')
            .fontSize(14)
            .fontColor('#ffa4a4a4')
            .margin({ left: 340, top: 70 })
        }
        .width('100%')
        .height(100)
      }.width('96%').alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Center).margin({ bottom: 15 })

    }.width('100%').height('100%').backgroundColor(Color.White)
  }

  @Builder TitleComponent() {
    Row() {
      Image($rawfile("icon/back.png")).width(18).height(18).onClick(() => {
        router.back()
      })

      Text('个人资料').fontSize(12).letterSpacing(2)

      Text('完成')
        .fontSize(16)
        .fontColor('#FF0A59F7')
        .letterSpacing(2)
        .margin({ top: 2 })
        .onClick(() => {
          router.back()
        })

    }.width('95%').height(50).justifyContent(FlexAlign.SpaceBetween)
  }
}