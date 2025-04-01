//
//  HomeViewModel.swift
//  Vocabulary
//
//  Created by Mena Gamal on 01/04/2025.
//

import Foundation
import UIKit

class HomeViewModel {
    var words: [WordEntry] = [
        WordEntry(word: "Lovelorn", pronunciation: "ˈlʌvˌlɔrn", definition: "(adj.) Feeling sad and lonely because of unrequited love", example: "She has been lovelorn ever since her crush started dating someone else."),
        WordEntry(word: "Ethereal", pronunciation: "ɪˈθɪəriəl", definition: "(adj.) Extremely delicate and light in a way that seems too perfect for this world", example: "The sunrise created an ethereal glow over the lake."),
        WordEntry(word: "Halcyon", pronunciation: "ˈhælsiən", definition: "(adj.) Denoting a period of time in the past that was idyllically happy and peaceful", example: "He often spoke of the halcyon days of his youth."),
    ]
    var currentIndex = 0


    func getUserSavedTheme() -> BackgroundType {
        if let selectedOption = UserDefaults.standard.string(forKey: "theme") {
            if selectedOption.contains(("cozy")) {
                //video
                return .video(name: selectedOption)
            } else if selectedOption.hasPrefix("#") {
                // color
                return .color(hex: selectedOption)
            } else {
                // Image
                return .image(name: selectedOption)
            }
        }

        return .color(hex: "#000000")
    }


    func didLoadHomePage() {
        UserDefaults.standard.set(true, forKey: "didLoadHome")
    }
}
