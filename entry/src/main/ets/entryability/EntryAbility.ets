import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { window } from '@kit.ArkUI';
import { WindowManager } from '../framework/window/WindowManager';
import { Log } from '@venus/common';


const TAG: string = 'EntryAbility';

export default class EntryAbility extends UIAbility {

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Log.i(TAG, 'onCreate');
  }

  onDestroy(): void {
    Log.i(TAG, 'onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Log.i(TAG, 'onWindowStageCreate');
    WindowManager.getInstance().init(windowStage);
    this.initStyle(windowStage);

    windowStage.loadContent('pages/SplashPage', (err: BusinessError) => {
      if (err.code) {
        Log.i(TAG, `loadContent error, message: ${err.message}`);
        return;
      }
    });
  }

  onWindowStageDestroy(): void {
    Log.i(TAG, 'onWindowStageDestroy');
  }

  onForeground(): void {
    Log.i(TAG, 'onForeground');
  }

  onBackground(): void {
    Log.i(TAG, 'onBackground');
  }

  /**
   * 初始化样式
   */
  private initStyle(windowStage: window.WindowStage) {
    windowStage.getMainWindow().then((win: window.Window) => {
      // 隐藏通知栏和导航栏
      win.setWindowLayoutFullScreen(true);
      win.setSpecificSystemBarEnabled('status', false);
    })
  }
}
