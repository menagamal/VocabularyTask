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
            self.showAccentScreeen()
        }
        navigationController.setViewControllers([getStartedViewControler], animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func showOptionsScreen() {
        let viewModel = OptionsViewModel(options: ["Male", "Female", "Other", "Prefer not to say"])
        let nextVC = OptionsViewController(viewModel: viewModel)
        navigationController.pushViewController(nextVC, animated: true)
    }

    func showEducationalScreen() {
        let nextVC = EducationViewController(getStartedActions: {
            print("")
        })
        navigationController.pushViewController(nextVC, animated: true)
    }

    func showUsernamelScreen() {
        let nextVC = UsernameControlerViewController(getStartedActions: {
            print("")
        })
        navigationController.pushViewController(nextVC, animated: true)
    }

    func showThemeScreeen() {

        let nextVC = ThemeControlerViewController(getStartedActions: {
            print("")
        })
        navigationController.pushViewController(nextVC, animated: true)
    }

    func showAccentScreeen() {

        let nextVC = AccentViewControler(getStartedActions: {
            print("")
        })
        navigationController.pushViewController(nextVC, animated: true)
    }

}
