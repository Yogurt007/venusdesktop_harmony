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

import { ApplicationGesture } from '../../../framework/application/ApplicationGesture';
import { ApplicationStyles } from '../../../framework/application/ApplicationStyles';
import { TRouterMeta } from '../../../framework/router/TRouterMeta';
import { TRouterNavigation } from '../../../framework/router/TRouterNavigation';


const TAG = TRouterNavigation.BROWSER;

/**
 * Description: 浏览器
 *
 * Author: HuaJ1a
 * Date: 2024/6/29
 */
@Entry
@Component
export struct BrowserApplication {
  build() {
    Column() {

    }
    .attributeModifier(new ApplicationStyles())
    .gestureModifier(new ApplicationGesture(TAG))
  }
}

export const BrowserMeta: TRouterMeta = {
  navigation: TAG,
  pagePath: 'pages/application/browser/BrowserApplication',
  pWidth: 0.5,
  pHeight: 0.5
}