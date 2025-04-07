//
//  OnboardingCoordinator.swift
//  CoordinatorProject
//
//  Created by Brad Woodard on 2/28/25.
//

import UIKit
import SwiftUI
import Combine

class OnboardingCoordinator: Coordinator {
    var rootViewController = UIViewController()
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>
    
    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    func start() {
        let view = OnboardingView { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        rootViewController = UIHostingController(rootView: view)
    }
}
