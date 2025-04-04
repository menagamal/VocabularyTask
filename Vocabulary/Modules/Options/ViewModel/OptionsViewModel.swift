//
//  OptionsViewModel.swift
//  Vocabulary
//
//  Created by Mena Gamal on 28/03/2025.
//

import Foundation

class OptionsViewModel {

    var selectedTitle: String?

    var options: [String] {
        dataSource.options
    }

    var titleLabel: String {
        dataSource.titleName
    }

    var subTitleLabel: String {
        dataSource.subtitle
    }


    private let dataSource: PagesStates
    init(dataSource: PagesStates) {
        self.dataSource = dataSource
    }
}
