# 📚 Vocabulary App – Rebuild Task

This project is a technical test implementation of the [Vocabulary](https://apps.apple.com/us/app/vocabulary-learn-words-daily/id1084540807) app, rebuilt in **Swift (UIKit)** with a focus on clean UI, engaging UX, and creative enhancements.

---

## 🚀 Features Implemented

- ✅ Recreated core **onboarding flow** (simplified)
- ✅ **Home screen** with swipeable cards showing 5 words (looping)
- ✅ Dynamic **background modes**: color, image, and video
- ✅ Smooth **swipe animations** with **haptic feedback**
- ✅ **Audio pronunciation** using AVSpeechSynthesizer
- ✅ Responsive design and clean architecture

---

## ✂️ Features Skipped (as instructed)

- ⛔ Notifications / reminders
- ⛔ Premium subscription screens
- ⛔ Alternate app icons
- ⛔ iOS widgets
- ⛔ Home screen lower controls (share, favorite, etc.)
- ⛔ Bottom tab navigation (categories, practice, settings)

---

## 💡 UX Enhancements

- ✅ **Haptic feedback** when swiping cards (inspired by Squad Busters)
- ✅ Clean, minimal, and modern UI
- ✅ Uses ambient **video/image/color backgrounds** for mood & immersion
- ✅ Responsive layout with accessibility-friendly font sizing

---

## ✨ Personal Touch

> Introduced a **background engine** that supports:
- Video (e.g. cozy fire loops)
- Image (e.g. libraries, reading rooms)
- Plain color themes

🎯 This makes the learning experience more emotionally engaging and visually rich. Future improvements could tie background themes to word tone (e.g., melancholy = rainy scene).

---

## 🔍 Task 2: UX Evaluation

### ❌ One UX Issue in Original App

> **Too many onboarding steps**
- Original app includes 6–8 onboarding screens, some of which feel unnecessary.
- Slows down time-to-value and can discourage users.
- ✅ **Fix**: This rebuild trims the flow and prioritizes learning over profiling.

### ✅ One Missing Feature That Adds Value

> **Theme-reactive backgrounds**
- Words could trigger background changes to reflect their tone or usage.
- Example: "elated" → sunny scene, "somber" → rainy scene
- Enhances retention through emotional connection and context.

---

## 📦 Build Instructions

### iOS

- **Xcode version**: 15.x
- **Deployment target**: iOS 15+
- Uses **UIKit**, no external dependencies


## ✨ Personal Touch – Unique Feature Proposal

To enhance user experience and demonstrate creativity, I propose the addition of a **Mood-Based Word Experience** as a unique, immersive feature.

---

### 🔮 Mood-Based Word Themes

**Idea:**  
Make vocabulary learning emotionally resonant by letting users select their current **mood**, and dynamically adjusting the word content and background visuals to match.

---

### 🎯 How It Works

- At launch or via a swipe-up drawer, users can select how they feel:
  - Calm, Curious, Ambitious, Reflective, Romantic, etc.
- The app then:
  - Displays a curated word matching that emotional tone
  - Loads a **background video/image** that reflects the same feeling
  - Optionally adjusts the **color theme** or typography

---

### 🚀 Example:

| Mood       | Word Example   | Background Theme        |
|------------|----------------|--------------------------|
| Reflective | *Ephemeral*    | Misty mountain morning   |
| Ambitious  | *Tenacity*     | Sunrise over a city      |
| Calm       | *Serene*       | Gentle ocean waves       |
| Romantic   | *Yearn*        | Soft candle-lit room     |

---

### ✅ Why It Matters

- Adds **emotion-based context** to word learning — improving recall and retention
- Turns a passive learning experience into an immersive, atmospheric one
- Gives users a **reason to return daily** based on how they feel, not just to "study"

---

### 🛠 Possible Extensions

- Store mood-based sessions in a timeline (like a language journal)
- Recommend flashbacks based on how you felt previously
- Add soft transitions and ambient soundscapes to deepen immersion

---

### 🚀 Why It's a Strong Personal Touch

This feature goes beyond UI polish and directly enriches the **learning experience**, blending language, emotion, and ambiance in a unique way. It turns vocabulary study into a **daily ritual** that meets users where they are — emotionally and intellectually.



