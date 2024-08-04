import { HomeBottomWidget } from './widget/HomeBottomWidget';
import { HomeTopWidget } from './widget/HomeTopWidget'

@Entry
@Component
struct HomePage {

  build() {
    RelativeContainer() {

      HomeTopWidget()
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top }
        })
        .id('HomeTopWidget');

      HomeBottomWidget()
        .alignRules({
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
        })
        .id('HomeBottomWidget');

    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.macos'))
    .backgroundImageSize({
      width: '100%',
      height: '100%'
    })
  }
}