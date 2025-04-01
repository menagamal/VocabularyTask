//
//  UsernameControlerViewModel.swift
//  Vocabulary
//
//  Created by Mena Gamal on 01/04/2025.
//

import Foundation

class UsernameControlerViewModel {
    var titleLabel: String {
        dataSource.titleName
    }

    var subTitleLabel: String {
        dataSource.subtitle
    }

    var buttonTitle: String {
        dataSource.buttonTitle
    }

    private let dataSource: PagesStates
    init(dataSource: PagesStates) {
        self.dataSource = dataSource
    }
}
