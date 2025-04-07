//
//  FirstTabCoordinator.swift
//  CoordinatorProject
//
//  Created by Brad Woodard on 2/28/25.
//

import UIKit
import SwiftUI

class FirstTabCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    let viewModel = FirstTabViewModel()
    
    lazy var firstTabViewController: FirstTabViewController = {
        let vc = FirstTabViewController()
        vc.viewModel = viewModel
        vc.showDetailRequested = { [weak self] in
            self?.goToDetail()
        }
        vc.title = "First Tab"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([firstTabViewController], animated: false)
    }
    
    func goToDetail() {
        let detailVC = UIHostingController(rootView: FirstTabDetailView(viewModel: viewModel))
        rootViewController.pushViewController(detailVC, animated: true)
    }
    
}
