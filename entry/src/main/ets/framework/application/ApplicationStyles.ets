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

import { ColumnModifier } from '@kit.ArkUI';

/**
 * Description: 统一样式
 *
 * Author: HuaJ1a
 * Date: 2024/7/27
 */
export class ApplicationStyles implements AttributeModifier<ColumnModifier> {

  applyNormalAttribute(instance: ColumnModifier): void {
    instance.width('100%');
    instance.height('100%');
    instance.backgroundColor($r('app.color.color_system_background'));
  }

}