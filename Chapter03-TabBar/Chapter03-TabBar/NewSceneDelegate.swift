//
//  NewSceneDelegate.swift
//  Chapter03-TabBar
//
//  Created by 이윤수 on 2020/12/23.
//

import UIKit

// 새로운 SceneDelegate 생성
class NewSceneDelegate:UIResponder, UIWindowSceneDelegate{
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // 1. 탭 바 컨트롤러를 생성하고, 배경을 흰색으로 채운다.
        let tbc = UITabBarController()
        tbc.view.backgroundColor = .white
        
        // 2. 생성된 tbc를 루트 뷰 컨트롤러로 등록한다.
        self.window?.rootViewController = tbc
        
        // 3. 탭 바 아이템에 연결된 뷰 컨트롤러 객체를 생성한다.
        let view01 = ViewController()
        let view02 = SecondViewController()
        let view03 = ThirdViewController()
        
        // 4. 생성된 뷰 컨트롤러 객체들을 탑 바 컨트롤러에 등록한다.
        tbc.setViewControllers([view01,view02,view03], animated: false)
        
        // 5. 개별 탭 바 아이템 속성을 설정한다.
        view01.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), selectedImage: nil)
        view02.tabBarItem = UITabBarItem(title: "File", image: UIImage(named: "file-tree"), selectedImage: nil)
        view03.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(named: "photo"), selectedImage: nil)
    }
}
