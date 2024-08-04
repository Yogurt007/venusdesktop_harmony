/*
 * Copyright 2024 HuaJ1a
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { TRouter } from '../../framework/router/TRouter';
import { TRouterNavigation } from '../../framework/router/TRouterNavigation';

/**
 * Description:
 *
 * Author: HuaJ1a
 * Date: 2024/6/29
 */
@Component
export struct HomeBottomWidget {
  build() {
    Row() {
      Row({ space: 8 }) {
        Image($r('app.media.icon_application'))
          .onClick(() => {
            TRouter.getInstance().build(TRouterNavigation.CAMERA).navigate();
          })
          .iconStyle();

        Image($r('app.media.icon_browser'))
          .onClick(() => {
            TRouter.getInstance().build(TRouterNavigation.BROWSER).navigate();
          })
          .iconStyle();
      }
      .backgroundColor('#4dffffff')
      .borderRadius(26)
      .padding({
        top: 8,
        bottom: 8,
        left: 20,
        right: 20
      });
    }.width('100%')
    .padding({
      bottom: 8
    })
    .justifyContent(FlexAlign.Center);
  }

  @Styles
  iconStyle() {
    .width(40)
    .height(40)
  }
}