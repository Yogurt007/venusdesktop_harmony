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

import window from '@ohos.window';
import { TRouterNavigation } from '../router/TRouterNavigation';
import { WindowLocation, WindowSize } from './WindowProperties';
import { WindowMeta } from './WindowMeta';

/**
 * Description:
 *
 * Author: HuaJ1a
 * Date: 2024/6/25
 */
export class WindowManager {
  private static instance: WindowManager;

  private windowStage: window.WindowStage | null = null;

  /**
   * 主窗口的大小 - 主要用于用来测量子窗口的大小
   */
  public mainWindowSize: WindowSize = new WindowSize();

  private windowPool: Map<TRouterNavigation, WindowMeta> = new Map();

  private constructor() {
  }

  public static getInstance(): WindowManager {
    if (!WindowManager.instance) {
      WindowManager.instance = new WindowManager();
    }
    return WindowManager.instance;
  }

  /**
   * 初始化
   *
   * @param windowStage
   */
  public init(windowStage: window.WindowStage): void {
    this.windowStage = windowStage;
    // 获取主窗口的大小
    this.windowStage.getMainWindow().then((win: window.Window) => {
      let properties: window.WindowProperties = win.getWindowProperties();
      let width = properties.windowRect.width;
      let height = properties.windowRect.height;
      // 选择长边作为主窗口的宽 - 因为手机的主窗口是按照竖屏计算的
      if (width > height) {
        this.mainWindowSize.width = width;
        this.mainWindowSize.height = height;
      } else {
        this.mainWindowSize.width = height;
        this.mainWindowSize.height = width;
      }
    })
  }

  /**
   * 打开窗口
   *
   * @param windowRouter 路由
   */
  public openWindow(windowMeta: WindowMeta) {
    this.windowStage!.createSubWindow(windowMeta.routerMeta.navigation).then(win => {
      win.moveWindowTo(windowMeta.location.x, windowMeta.location.y);
      win.resize(windowMeta.windowSize.width, windowMeta.windowSize.height);
      win.setUIContent(windowMeta.routerMeta.pagePath);
      win.showWindow();

      windowMeta.win = win;
      this.windowPool.set(windowMeta.routerMeta.navigation, windowMeta);
    });
  }

  /**
   * 窗口拖动
   *
   * @param navigation 路由
   * @param event 手势事件
   */
  public drag(navigation: TRouterNavigation, event: GestureEvent): void {
    let windowWant = this.windowPool.get(navigation) as WindowMeta;
    windowWant.location.x += event.offsetX;
    windowWant.location.y += event.offsetY;
    windowWant.win?.moveWindowTo(windowWant.location.x, windowWant.location.y);
  }

  /**
   * 窗口关闭
   *
   * @param navigation 路由导航
   */
  public close(navigation: TRouterNavigation): void {
    let windowWant = this.windowPool.get(navigation) as WindowMeta;
    windowWant.win?.destroyWindow();
    this.windowPool.delete(navigation);
  }
}