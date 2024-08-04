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

import animator, { AnimatorResult } from '@ohos.animator';
import router from '@ohos.router';

/**
 * Description: 启动页
 *
 * Author: HuaJ1a
 * Date: 2024/6/23
 */
@Entry
@Component
export struct SplashPage {
  private loadingAnimator: AnimatorResult | undefined = undefined

  @State progress: number = 0;

  build() {
    Column({space: 32}) {

      Image($r('app.media.icon_huawei'))
        .width(120)
        .height(120)
        .fillColor(Color.White);

      Progress({
        value: this.progress,
        total: 100,
        type: ProgressType.Linear
      })
        .width('50%')
        .backgroundColor(Color.White);

    }.width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Black);
  }

  onPageShow(): void {
    this.loadingAnimator = animator.create({
      duration: 2000,
      easing: "ease",
      delay: 0,
      fill: "forwards",
      direction: "normal",
      iterations: 1,
      begin: 0,
      end: 100
    });
    this.loadingAnimator.onFinish = () => {
      this.jumpToHomePage();
    };
    this.loadingAnimator.onFrame = (value: number) => {
      this.progress = value;
    };
    this.loadingAnimator.play();
  }

  jumpToHomePage() {
    router.pushUrl({
      url: 'pages/HomePage'
    });
    // 清除路由栈，避免返回启动页
    router.clear();
  }

}