//
//  MainCoordinator.swift
//  CoordinatorProject
//
//  Created by Brad Woodard on 2/28/25.
//

import UIKit
import SwiftUI

class MainCoordinator: Coordinator {
    
    var rootViewController: UITabBarController
    var childCoordinators = [Coordinator]()
    
    init() {
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .lightGray
    }

    
    func start() {
        let firstTabCoordinator = FirstTabCoordinator()
        firstTabCoordinator.start()
        self.childCoordinators.append(firstTabCoordinator)
        let firstViewController = firstTabCoordinator.rootViewController
        firstViewController.tabBarItem = UITabBarItem(
            title: "First",
            image: UIImage(systemName: "figure.walk.circle"),
            selectedImage: UIImage(systemName: "figure.walk.circle.fill")
        )
        
        let secondTabCoordinator = SecondTabCoordinator()
        secondTabCoordinator.start()
        self.childCoordinators.append(secondTabCoordinator)
        let secondViewController = secondTabCoordinator.rootViewController
        secondViewController.tabBarItem = UITabBarItem(
            title: "Second",
            image: UIImage(systemName: "airplane.circle"),
            selectedImage: UIImage(systemName: "airplane.circle.fill")
        )
        
        self.rootViewController.viewControllers = [
            firstTabCoordinator.rootViewController,
            secondTabCoordinator.rootViewController
        ]
    }
}
