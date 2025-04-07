//
//  AppCoordinator.swift
//  CoordinatorProject
//
//  Created by Brad Woodard on 2/28/25.
//

import UIKit
import SwiftUI
import Combine

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    var childCoordinators = [Coordinator]()
    
    // Combine
    var hasSeenOnboarding = CurrentValueSubject<Bool,Never>(false)
    var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Protocol
    func start() {
        
        setupOnboardingValue()
        
        hasSeenOnboarding.sink { [weak self] hasSeen in
            if hasSeen {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self?.childCoordinators = [mainCoordinator]
                self?.window.rootViewController = mainCoordinator.rootViewController
            } else if let hasSeenOnboarding = self?.hasSeenOnboarding {
                let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
                onboardingCoordinator.start()
                self?.childCoordinators = [onboardingCoordinator]
                self?.window.rootViewController = onboardingCoordinator.rootViewController
            }
        }.store(in: &subscriptions)
    }
    
    func setupOnboardingValue() {
        // Storing and loading from UserDefaults
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key) // default of false
        hasSeenOnboarding.send(value)
        
        hasSeenOnboarding
            .filter({ $0 })
            .sink { (value) in
                UserDefaults.standard.set(value, forKey: key)
            }
            .store(in: &subscriptions)
    }
}
