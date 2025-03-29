//
//  AppCoordinator.swift
//  Vocabulary
//
//  Created by Mena Gamal on 28/03/2025.
//

import UIKit

class AppCoordinator {
    var window: UIWindow
    var navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }

    func start() {
        let getStartedViewControler = GetStartedViewController { [weak self] in
            guard let self = self else { return }
            self.showNextScreen()
        }
        navigationController.setViewControllers([getStartedViewControler], animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func showNextScreen() {
        // Navigate to next screen (e.g., onboarding, home)
        let viewModel = OptionsViewModel(options: ["Male", "Female", "Other", "Prefer not to say"])
        let nextVC = OptionsViewController(viewModel: viewModel)
        navigationController.pushViewController(nextVC, animated: true)
    }
}
