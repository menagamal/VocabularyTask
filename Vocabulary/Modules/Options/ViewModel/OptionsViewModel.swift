//
//  OptionsViewModel.swift
//  Vocabulary
//
//  Created by Mena Gamal on 28/03/2025.
//

import Foundation

class OptionsViewModel {
    let options: [String]

    lazy var selectedTitle = options.randomElement()
    init(options: [String]) {
        self.options = options
    }
}
