//
//  SceneDelegate.swift
//  Msg-Notification
//
//  Created by 이윤수 on 2020/10/27.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        if #available(iOS 10.0, *) {
            // 알림 동의 여부 확인
            UNUserNotificationCenter.current().getNotificationSettings(completionHandler: {settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                    // 알림 콘텐츠 객체
                                   let nContent = UNMutableNotificationContent()
                                   nContent.badge = 999
                                   nContent.title = "로컬 알림 메세지"
                                   nContent.subtitle = "준비된 내용이 많습니다. 당장 들어와"
                                   nContent.body = "앗? 왜 나갔어? 다시 들어와"
                                   nContent.sound = UNNotificationSound.default
                                   nContent.userInfo = ["name":"홍길동"]
                                   
                                   // 알림 발송 조건 객체
                                   let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                                   
                                   // 알림 요청 객체
                                   let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                                   
                                   // 노티피케이션 센터에 추가
                                   UNUserNotificationCenter.current().add(request)
                }else{
                    print("사용자가 알림을 동의하지 않았습니다.오여")
                }
            })
            
        }
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

