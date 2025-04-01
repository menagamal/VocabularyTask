//
//  ThemeControlerViewModel.swift
//  Vocabulary
//
//  Created by Mena Gamal on 01/04/2025.
//

import Foundation

class ThemeControlerViewModel {

    var titleLabel: String {
        dataSource.titleName
    }

    var subTitleLabel: String {
        dataSource.subtitle
    }

    var buttonTitle: String {
        dataSource.buttonTitle
    }

    var selectedIndex = 4


    let cardImages: [String] = [
        "#F5EFE5",   // for UIColor(red: 245/255, 239/255, 229/255)
        "cozy_study",
        "cozy_reading",
        "library",
        "david",
        "#000000"    // for UIColor.black
    ]

    private let dataSource: PagesStates
    
    init(dataSource: PagesStates) {
        self.dataSource = dataSource
    }
    
    func setTheUserSelectedTheme() {
        UserDefaults.standard.set(cardImages[selectedIndex], forKey: "theme")
    }
}
