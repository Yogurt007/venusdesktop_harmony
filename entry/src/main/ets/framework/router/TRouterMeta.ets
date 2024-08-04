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

import { TRouterNavigation } from './TRouterNavigation'

/**
 * Description: 路由元信息
 *
 * Author: HuaJ1a
 * Date: 2024/7/27
 */
export class TRouterMeta {

  /**
   * 导航路径
   */
  navigation: TRouterNavigation = TRouterNavigation.DEFAULT;

  /**
   * page路径
   */
  pagePath: string = '';

  /**
   * 宽度占屏幕的百分比， 默认50%
   */
  pWidth: number = 0.5;

  /**
   * 高度占屏幕的百分比， 默认50%
   */
  pHeight: number = 0.5;
}