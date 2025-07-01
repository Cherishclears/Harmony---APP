import Index from './Index';
import Search from './Search'
import study from './study'
import mine from './mine'

@Entry
@Component

struct main{
  @State currentIndex: number = 0;
  private controller: TabsController = new TabsController();

  @Builder
  tabBuilder(index: number, name: string, actIcon: string, defIcon: string) {
    Column() {
      Image(this.currentIndex == index ? $rawfile(`${'image/' + actIcon}`) : $rawfile(`${'image/' + defIcon}`)).width(28)
      Text(name).fontSize(14).fontColor(this.currentIndex == index ? '#007DFF' : '#182431')
    }
    .width('100%').height('100%').justifyContent(FlexAlign.SpaceAround)
  }
  build() {
    Tabs({ barPosition: BarPosition.End, index: this.currentIndex, controller: this.controller }) {
      TabContent() {
        Index()
      }.tabBar(this.tabBuilder(0, '首页', 'house_fill.svg', 'home.svg'))

      TabContent() {
        Search()
      }.tabBar(this.tabBuilder(1, '找课', 'search.svg', 'search.svg'))

      TabContent() {
        study()
      }.tabBar(this.tabBuilder(2, '学习', 'book.png', 'book.png'))

      TabContent() {
        mine()
      }.tabBar(this.tabBuilder(3, '我的', 'person.svg', 'person.svg'))
    }
    .vertical(false)
    .scrollable(false)
    .animationDuration(0)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}
