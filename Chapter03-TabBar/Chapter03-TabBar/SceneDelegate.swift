//
//  SceneDelegate.swift
//  Chapter03-TabBar
//
//  Created by 이윤수 on 2020/12/16.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // 1. 루트 뷰 컨트롤러를 UITabBarController로 캐스팅한다.
        if let tbC = self.window?.rootViewController as? UITabBarController{
        
            // 6. 탭 바에 배경 이미지를 설정한다.
            // tbC.tabBar.backgroundImage = UIImage(named: "connectivity-bar")?.stretchableImage(withLeftCapWidth: 0, topCapHeight: 0)
            // tbC.tabBar.barTintColor = UIColor(patternImage: UIImage(named: "connectivity-bar")!)
            tbC.tabBar.tintColor = UIColor.black
            
            // 2. 탭 바에서 탭 바 아이템 배열을 가지고 온다.
            if let tbItems = tbC.tabBar.items{
                
                // 3. 탭 바 아이템에 커스텀 이미지를 등록한다.
                // tbItems[0].image = UIImage(named: "calendar")
                // tbItems[1].image = UIImage(named: "file-tree")
                // tbItems[2].image = UIImage(named: "photo")
                tbItems[0].image = UIImage(named: "designbump")?.withRenderingMode(.alwaysOriginal) // 랜더링을 하지 않고 오리지날로 표시한다.
                tbItems[1].image = UIImage(named: "rss")?.withRenderingMode(.alwaysOriginal)
                tbItems[2].image = UIImage(named: "facebook")?.withRenderingMode(.alwaysOriginal)
                
                // 탭 바 아이템 전체를 순회하면서 selectedImage 속성에 이미지를 설정한다.
                for tbItem in tbItems{
                    let image = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
                    tbItem.selectedImage = image
                    
                    // FOR문을 통해 한 탭 바 아이탬씩 설정
                    // tbItem.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .disabled)
                    // tbItem.setTitleTextAttributes([.foregroundColor:UIColor.red], for: .selected)
                    // tbItem.setTitleTextAttributes([.font:UIFont.systemFont(ofSize: 15)], for: .normal)
                }
                
                let tbItemProxy = UITabBarItem.appearance()
                
                // 외형 프록시 객체를 이용하여 한번에 설정
                tbItemProxy.setTitleTextAttributes([.foregroundColor:UIColor.gray], for: .disabled)
                tbItemProxy.setTitleTextAttributes([.foregroundColor:UIColor.red], for: .selected)
                tbItemProxy.setTitleTextAttributes([.font:UIFont.systemFont(ofSize: 15)], for: .normal)
                
                // 4. 탭 바 아이템이 타이틀을 설정한다.
                tbItems[0].title = "Calendar"
                tbItems[1].title = "File"
                tbItems[2].title = "Photo"
                
                // 5. 탭 바 아이템의 이미지 색상을 변경한다.
                tbC.tabBar.tintColor = .white
                tbC.tabBar.unselectedItemTintColor = .gray
            }
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
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

