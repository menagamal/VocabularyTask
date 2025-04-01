//
//  PagesStates.swift
//  Vocabulary
//
//  Created by Mena Gamal on 31/03/2025.
//

import Foundation
enum PagesStates: Int {
    case getStarted, howDidYouHear, tailorRecommendations, howOldAreYou, genderPage, usernamePage,
         tailorRecommendationsV2, howManyWords, whatsYourLevel, themePage, accentPage,
         customizePage, whatsYourGoal, whatsYourInterest, goalToLearnPage, home

    var imageName: String {
        switch self {
        case .tailorRecommendations: return "steps_podium"
        case .tailorRecommendationsV2: return "reading_scene"
        case .customizePage: return "target_books"
        default: return ""
        }
    }

    var titleName: String {
        switch self {
        case .getStarted:
            return "Expand your Vocabulary in 1 minute a day"
        case .howDidYouHear:
            return "How did you hear about Vocabulary?"
        case .tailorRecommendations:
            return "Tailor your word recommendations"
        case .howOldAreYou:
            return "How old are you?"
        case .genderPage:
            return "Which option represents you best?"
        case .usernamePage:
            return "What do you want to be called?"
        case .tailorRecommendationsV2:
            return "Tailor your word recommendations"
        case .howManyWords:
            return "How many words do you want to learn per week?"
        case .whatsYourLevel:
            return "What's your vocabulary level?"
        case .themePage:
            return "Which theme would you like to start with?"
        case .accentPage:
            return "Choose a voice to pronounce words"
        case .customizePage:
            return "Customize the app to improve your experience"
        case .whatsYourGoal:
            return "Do you have a specific goal in mind?"
        case .whatsYourInterest:
            return "Which topics are you interested in?"
        case .goalToLearnPage:
            return "Set a goal to learn every day"
        default:
            return ""
        }
    }

    var subtitle: String {
        switch self {
        case .getStarted:
            return "Learn 10,000+ new words with a new daily habit that takes just 1 minute"
        case .howDidYouHear,
             .genderPage,
             .whatsYourLevel:
            return "Select an option to continue"
        case .howOldAreYou:
            return "Your age is used to personalize your content"
        case .usernamePage:
            return "Your name is used to personalize your experience"
        case .howManyWords:
            return "You can always change your goal later"
        case .themePage:
            return "Choose from a larger selection of themes or create your own later"
        case .accentPage:
            return "Select the one that suits you best"
        case .whatsYourGoal:
            return "Select at least one option to continue"
        case .whatsYourInterest:
            return "Select at least one to continue"
        case .goalToLearnPage:
            return "Being consistent is key to expanding your vocabulary"
        default:
            return ""
        }
    }

    var options: [String] {
        switch self {
        case .howDidYouHear:
            return ["Instagram", "Web search", "TikTok", "Friend/family", "Facebook", "App Store", "Other"]
        case .howOldAreYou:
            return ["13 to 17", "18 to 24", "25 to 34", "35 to 44", "45 to 54", "55+"]
        case .genderPage:
            return ["Female", "Male", "Other", "Prefer not to say"]
        case .howManyWords:
            return ["10 words a week", "30 words a week", "50 words a week"]
        case .whatsYourLevel:
            return ["Beginner", "Intermediate", "Advanced"]
        case .accentPage:
            return ["Brian (American)", "Mia (American)", "Amelia (British)", "Frederick (British)", "Paul (Australian)", "Miriam (Australian)"]
        case .whatsYourGoal:
            return ["Get ready for a test", "Enhance my lexicon", "Improve my job prospects", "Enjoy learning new words", "Other"]
        case .whatsYourInterest:
            return ["Emotions", "Business", "Society", "Human body", "Words in foreign languages", "Other"]
        case .goalToLearnPage:
            return ["3 days", "7 days", "21 days"]
        default:
            return []
        }
    }

    var buttonTitle: String {
        switch self {
        case .getStarted:
            return "Get started"
        case .tailorRecommendations,
             .tailorRecommendationsV2,
             .usernamePage,
             .howManyWords,
             .whatsYourLevel,
             .themePage,
             .customizePage,
             .whatsYourGoal,
             .whatsYourInterest,
             .goalToLearnPage:
            return "Continue"
        case .accentPage:
            return "Save voice selection"
        default:
            return ""
        }
    }

    var showPrimaryButton: Bool {
        switch self {
        case .getStarted,
             .tailorRecommendations,
             .tailorRecommendationsV2,
             .usernamePage,
             .howManyWords,
             .whatsYourLevel,
             .themePage,
             .accentPage,
             .customizePage,
             .whatsYourGoal,
             .whatsYourInterest,
             .goalToLearnPage:
            return true
        default:
            return false
        }
    }

    var showSubTitle: Bool {
        switch self {
        case .getStarted,
             .howDidYouHear,
             .howOldAreYou,
             .genderPage,
             .usernamePage,
             .howManyWords,
             .whatsYourLevel,
             .themePage,
             .accentPage,
             .whatsYourGoal,
             .whatsYourInterest,
             .goalToLearnPage:
            return true
        default:
            return false
        }
    }
}
