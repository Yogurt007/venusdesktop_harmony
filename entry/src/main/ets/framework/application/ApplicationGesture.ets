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

import { TRouterNavigation } from '../router/TRouterNavigation';
import { WindowManager } from '../window/WindowManager';


/**
 * Description: 手势
 *
 * Author: HuaJ1a
 * Date: 2024/7/27
 */
export class ApplicationGesture implements GestureModifier  {

  private navigation: TRouterNavigation;

  public constructor(navigation: TRouterNavigation) {
    this.navigation = navigation;
  }

  applyGesture(event: UIGestureEvent): void {
    event.addGesture(
      new PanGestureHandler()
        .onActionUpdate((event: GestureEvent) => {
          WindowManager.getInstance().drag(this.navigation, event);
        })
    );
    event.addGesture(
      new TapGestureHandler({ count: 2})
        .onAction(() => {
          WindowManager.getInstance().close(this.navigation);
        })
    )
  }

}