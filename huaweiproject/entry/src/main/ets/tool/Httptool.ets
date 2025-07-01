// 引入包名
import { http } from '@kit.NetworkKit';


const BASE_URL: string = 'localhost:8080'

// const BASE_URL: string = 'http://m8986b7d.natappfree.cc'

class HttpTools {
  private getHttpRequestOptions(methodType: http.RequestMethod, data?: string | Object | ArrayBuffer) {
    let options: http.HttpRequestOptions = {
      method: methodType,
      expectDataType: http.HttpDataType.OBJECT,
      extraData: data,
      header: {
        'Accept': 'application/json',
        'content-Type': 'application/json',
        'X-Auth-Token': globalThis.hw_token
      }
    }
    return options
  }

  /**
   * @param url 接口地址
   * @param fn  回调函数
   */
  get(url: string, fn: Function) {
    let httpRequest = http.createHttp();
    let options = this.getHttpRequestOptions(http.RequestMethod.GET)
    httpRequest.request(url, options, (err, data) => {
      if (!err) {
        // 调用外层传入进来的回调函数，将api-data作为参数传入到回调函数中，为回调函数中定义的方法参数赋值
        fn(data)
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      } else {
        console.info('error:' + JSON.stringify(err));
        httpRequest.destroy();
      }
    });
  }

  /**
   *
   * @param url 接口地址
   * @param params 请求参数
   * @param fn  回调函数
   */
  post(url: string, params: object, fn: Function) {
    let httpRequest = http.createHttp();
    let options = this.getHttpRequestOptions(http.RequestMethod.POST, params)
    httpRequest.request(BASE_URL + url, options, (err, data) => {
      if (!err) {
        // 调用外层传入进来的回调函数，将api-data作为参数传入到回调函数中，为回调函数中定义的方法参数赋值
        fn(data)
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      } else {
        console.info('error:' + JSON.stringify(err));
        httpRequest.destroy();
      }
    });
  }

  asyncGet(url: string) {
    let httpRequest = http.createHttp();
    let options = this.getHttpRequestOptions(http.RequestMethod.GET)
    return httpRequest.request(BASE_URL +url,options)
  }

  asyncPost(url: string, params: object) {
    let httpRequest = http.createHttp();
    let options = this.getHttpRequestOptions(http.RequestMethod.POST, params)
    return httpRequest.request(BASE_URL + url, options)
  }

  asyncGetIoT(url: string) {
    let httpRequest = http.createHttp();
    let options = this.getHttpRequestOptions(http.RequestMethod.GET)
    return httpRequest.request(url, options)
  }

  asyncPostIoT(url: string, params: object) {
    let httpRequest = http.createHttp();
    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      expectDataType: http.HttpDataType.OBJECT,
      extraData: params,
      header: {
        'Accept': 'application/json',
        'content-Type': 'application/json',
      }
    }
    return httpRequest.request(url, options)
  }

  async getUserInfo(username: string) {
    let httpRequest = http.createHttp();
    let options = this.getHttpRequestOptions(http.RequestMethod.GET)
    return httpRequest.request(BASE_URL + `/api/user/info?username=${username}`, options)
  }

  async getVideoInfo() {
    let httpRequest = http.createHttp();
    let options = this.getHttpRequestOptions(http.RequestMethod.GET)
    return httpRequest.request(BASE_URL + `/api/video/info`, options)
  }
}




export default new HttpTools()