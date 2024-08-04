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

import { Log } from '@venus/common';
import { WindowManager } from '../window/WindowManager';
import { WindowMeta } from '../window/WindowMeta';
import { TRouterMeta } from './TRouterMeta';
import { TRouterNavigation } from './TRouterNavigation';
import { router } from '@kit.ArkUI';

const TAG: string = 'TRouter';

/**
 * Description: 主路由
 * 一个路由两种跳转模式： 1、窗口（navigate） ； 2、页面（router）
 *
 * Author: HuaJ1a
 * Date: 2024/7/27
 */
export class TRouter {

  private static instance?: TRouter;

  /**
   * 路由集合
   */
  private routerMap: Map<TRouterNavigation, TRouterMeta> = new Map();

  /**
   * 路由建造者
   */
  private builder: TRouterBuilder | null = null;

  private constructor() {
  }

  public static getInstance(): TRouter {
    if (!TRouter.instance) {
      TRouter.instance = new TRouter();
    }
    return TRouter.instance;
  }

  /**
   * 路由注册
   *
   * @param routerMeta 路由元信息
   */
  public register(routerMeta: TRouterMeta): void {
    this.routerMap.set(routerMeta.navigation, routerMeta);
  }

  public build(navigation: TRouterNavigation): TRouter {
    this.builder = new TRouterBuilder();
    this.builder.navigation = navigation;
    return TRouter.instance!;
  }

  /**
   * 窗口跳转模式
   */
  public navigate() {
    // 如果建造者为空， 抛出异常
    if (!this.builder) {
      throw new Error('navigate error, builder can not be null');
    }
    let routerMeta = this.routerMap.get(this.builder!.navigation!);
    if (!routerMeta) {
      Log.i(TAG, 'not find routerMeta');
      return;
    }

    // 启动window流程
    let windowMeta: WindowMeta = new WindowMeta();
    windowMeta.routerMeta = routerMeta;
    // 设置窗口大小
    windowMeta.windowSize.width = WindowManager.getInstance().mainWindowSize.width * routerMeta.pWidth;
    windowMeta.windowSize.height = WindowManager.getInstance().mainWindowSize.height * routerMeta.pHeight;
    // 设置窗口初始位置 - 居中
    windowMeta.location.x = WindowManager.getInstance().mainWindowSize.width / 2
      - windowMeta.windowSize.width / 2;
    windowMeta.location.y = WindowManager.getInstance().mainWindowSize.height / 2
      - windowMeta.windowSize.height / 2;
    WindowManager.getInstance().openWindow(windowMeta);
    // 置空建造者，防止对下一次路由跳转有影响
    this.builder = null;
  }

  /**
   * 页面跳转
   */
  public router() {
    // 如果建造者为空， 抛出异常
    if (!this.builder) {
      throw new Error('navigate error, builder can not be null');
    }
    let routerMeta = this.routerMap.get(this.builder!.navigation!);
    if (!routerMeta) {
      Log.i(TAG, 'not find routerMeta');
      return;
    }

    router.pushUrl({
      url: routerMeta.pagePath,
      params: this.builder.params
    });
  }
}

/**
 * 路由构建
 */
class  TRouterBuilder {

  public navigation?: TRouterNavigation;

  /**
   * 页面跳转携带参数
   */
  public params?: Object;

}