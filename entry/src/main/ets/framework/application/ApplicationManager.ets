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
import { ApplicationBean } from './ApplicationBean';

/**
 * Description: 预置应用全局管理
 *
 * Author: HuaJ1a
 * Date: 2024/8/1
 */
export class ApplicationManager {

  private static instance?: ApplicationManager;

  private apps: ApplicationBean[] = [];

  private constructor() {
  }

  public static getInstance(): ApplicationManager {
    if (!ApplicationManager.instance) {
      ApplicationManager.instance = new ApplicationManager();
    }
    return ApplicationManager.instance;
  }

  public init(): void {
    this.apps.push(new ApplicationBean(TRouterNavigation.DEFAULT, $r('app.media.icon_application')));
    this.apps.push(new ApplicationBean(TRouterNavigation.DEFAULT, $r('app.media.icon_browser')));
    this.apps.push(new ApplicationBean(TRouterNavigation.DEFAULT, $r('app.media.icon_camera')));
    this.apps.push(new ApplicationBean(TRouterNavigation.DEFAULT, $r('app.media.icon_album')));
    this.apps.push(new ApplicationBean(TRouterNavigation.DEFAULT, $r('app.media.icon_music')));
  }

}