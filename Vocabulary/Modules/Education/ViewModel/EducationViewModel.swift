//
//  EducationViewModel.swift
//  Vocabulary
//
//  Created by Mena Gamal on 01/04/2025.
//

import Foundation


class EducationViewModel {
    var titleLabel: String {
        dataSource.titleName
    }

    var buttonTitle: String {
        dataSource.buttonTitle
    }

    var imageName: String {
        dataSource.imageName
    }


    private let dataSource: PagesStates
    init(dataSource: PagesStates) {
        self.dataSource = dataSource
    }
}
