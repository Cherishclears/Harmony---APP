// Flex弹性布局
import { http } from '@kit.NetworkKit';

import { HWUser, LoginUser } from '../Model/model'
import { JSON } from '@kit.ArkTS';
import HttpTools from '../tool/Httptool'
import router from '@ohos.router'

@Entry
@Component

struct login{
  @State username:string = 'Cherish001'
  @State password:string = '123456789'
  build() {
    // login title
    Column() {
      Column({ space: 4 }) {
        Text("通鸿云课堂").fontSize(24).fontColor(Color.Red).margin({top:80})
      }
      .width("100%")
      .height("30%")
      .justifyContent(FlexAlign.Center) //居中对齐
      //login Bottom
      Column() {
        Column() {
          TextInput({ text: $$this.username,placeholder: '账号' })
            .type(InputType.Normal)
            .placeholderColor(Color.Gray)
            .placeholderFont({ size: 13 })
            .fontColor(Color.Black)
        }
        .width('95%')
        .backgroundColor(Color.White)

        Column() {
          TextInput({ text: $$this.password,placeholder: '密码' })
            .type(InputType.Password)
            .placeholderColor(Color.Gray)
            .placeholderFont({ size: 13 })
            .fontColor(Color.Black)
        }
        .width('95%')
        .backgroundColor(Color.White)

        Row(){
          Text("短信验证码登录").fontSize(12).fontColor('#999999')
          Text("忘记密码").fontSize(12).fontColor('#999999')
        }
        .width('95%')
        .margin({top : 14})
        .justifyContent(FlexAlign.SpaceBetween)

        Button('登录').width('80%').margin({top:60}).onClick(() => this.loginIOT())
        Button('注册账号').width('80%').backgroundColor(Color.White).fontColor('#000000').fontSize(12)

      }
      .width('100%')
      .height('60%')


      Row() {
        Image($rawfile('icon/vx.png'))
          .width(40)
          .height(40)
          .borderRadius(25)
          .onClick(() => {
            console.log('WeChat 登录点击')
          })
        Image($rawfile('icon/qq.png'))
          .width(40)
          .height(40)
          .borderRadius(25)
          .onClick(() => {
            console.log('QQ 登录点击')
          })

        Image($rawfile('icon/dd.png'))
          .width(40)
          .height(40)
          .borderRadius(25)
          .onClick(() => {
            console.log('钉钉 登录点击')
          })
      }
      .width('80%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ top: 20 })
    }
    .width('100%').padding(20)
  }


  login() {
    console.log('username:', this.username, ' password:', this.password)
    let user: LoginUser = {
      username: this.username,
      password: this.password
    }
    HttpTools.post('/api/login', user, (data: http.HttpResponse) => {
      console.log('API Interface result :', JSON.stringify(data.result))
      router.pushUrl({
        url: 'pages/main'
      })
    })

  }

  async loginIOT() {
    let user: HWUser = new HWUser(this.username, this.password,'hid_0ie01of14n-zs22')
    let data = await HttpTools.asyncPostIoT('https://iam.cn-north-4.myhuaweicloud.com/v3/auth/tokens', user)
    globalThis.hw_token = data.header['x-subject-token'] as string
    globalThis.current_username=this.username as string
    router.pushUrl({
      url: 'pages/main'
    })
  }
}


