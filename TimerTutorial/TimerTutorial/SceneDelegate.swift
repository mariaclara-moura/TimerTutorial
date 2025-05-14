//
//  SceneDelegate.swift
//  TimerTutorial
//
//  Created by Maria Clara Albuquerque Moura on 14/05/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        
        let controller: UIViewController = TutorialViewController()
        window.rootViewController = controller
        self.window = window
    }

}

