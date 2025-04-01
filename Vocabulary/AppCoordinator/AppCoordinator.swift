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

    var currentState: PagesStates = .getStarted

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }

    func start() {
        let getStartedViewControler = GetStartedViewController { [weak self] in
            guard let self = self else { return }
            self.loadNextState()
        }
        navigationController.setViewControllers([getStartedViewControler], animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func loadNextState() {
        if let next =  PagesStates(rawValue: currentState.rawValue + 1 ) {
            currentState = next

            switch currentState {
            case .howDidYouHear,  .howOldAreYou, .genderPage, .howManyWords, .whatsYourLevel, .whatsYourGoal, .whatsYourInterest, .goalToLearnPage:
                self.showOptionsScreen()
            case .tailorRecommendations, .tailorRecommendationsV2, .customizePage:
                self.showEducationalScreen()
            case .usernamePage:
                self.showUsernamelScreen()
            case .themePage:
                self.showThemeScreeen()
            case .accentPage:
                self.showAccentScreeen()
            case .home, .getStarted:
                break
            }
        }
    }
}


extension AppCoordinator {
    func showOptionsScreen() {
        let viewModel = OptionsViewModel(dataSource: currentState)
        let nextVC = OptionsViewController(viewModel: viewModel, getStartedActions:  { [weak self] in
            guard let self = self else { return }
            self.loadNextState()
        })
        navigationController.pushViewController(nextVC, animated: true)
    }

    func showEducationalScreen() {
        let nextVC = EducationViewController(
            viewModel: EducationViewModel(dataSource: currentState),
            getStartedActions: { [weak self] in
                guard let self = self else { return }
                self.loadNextState()
        })
        navigationController.pushViewController(nextVC, animated: true)
    }

    func showUsernamelScreen() {

        // ViewModel TO Save UserName
        let nextVC = UsernameControlerViewController(
            viewModel: UsernameControlerViewModel(dataSource: currentState),
            getStartedActions: { [weak self] in
                guard let self = self else { return }
                self.loadNextState()
            })
        navigationController.pushViewController(nextVC, animated: true)
    }

    func showThemeScreeen() {
        // ViewModel TO Save Theme

        let nextVC = ThemeControlerViewController(
            viewModel: ThemeControlerViewModel(dataSource: currentState),
            getStartedActions: { [weak self] in
                guard let self = self else { return }
                self.loadNextState()
            })
        navigationController.pushViewController(nextVC, animated: true)
    }

    func showAccentScreeen() {
        // ViewModel TO Save Accent

        let nextVC = AccentViewControler(
            viewModel: AccentViewModel(dataSource: currentState),
            getStartedActions: { [weak self] in
                guard let self = self else { return }
                self.loadNextState()
            })
        navigationController.pushViewController(nextVC, animated: true)
    }
}
