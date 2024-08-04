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


import dayjs from 'dayjs';
import { BusinessError, commonEventManager, systemDateTime } from '@kit.BasicServicesKit';
import { Log } from '@venus/common';

const TAG: string = 'HomeTopWidget';


/**
 * Description:
 *
 * Author: HuaJ1a
 * Date: 2024/6/29
 */
@Component
export struct HomeTopWidget {

  @State systemTime: string = '';

  aboutToAppear(): void {
    this.getSystemTime();
    this.registerTimeEvent();
  }

  build() {
    Row() {

      Image($r('app.media.icon_huawei'))
        .iconStyle();

      Blank();

      Text(this.systemTime);

    }.width('100%')
    .backgroundColor('#66ffffff')
    .padding({
      top: 4,
      bottom: 4,
      left: 32,
      right: 32
    });
  }

  registerTimeEvent() {
    let event: commonEventManager.CommonEventSubscribeInfo = {
      events: ['usual.event.TIME_TICK', 'usual.event.TIMEZONE_CHANGED']
    };
    commonEventManager.createSubscriber(event, (err: BusinessError, subscribe:commonEventManager.CommonEventSubscriber) => {
      if (err) {
        Log.e(TAG, 'createSubscriber error');
        return;
      }
      commonEventManager.subscribe(subscribe, () => {
        this.getSystemTime();
      });
    });
  }

  getSystemTime() {
    let time = systemDateTime.getTime(false);
    this.systemTime = dayjs(time).format('MM月DD日 HH:mm');
  }

  @Styles
  iconStyle() {
    .width(24)
    .height(24)
  }
}