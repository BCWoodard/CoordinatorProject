//
//  SecondTabCoordinator.swift
//  CoordinatorProject
//
//  Created by Brad Woodard on 2/28/25.
//

import UIKit
import SwiftUI

class SecondTabCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    lazy var secondTabViewController: SecondTabViewController = {
        let vc = SecondTabViewController()
        vc.title = "Second Tab"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([secondTabViewController], animated: false)
    }
}
