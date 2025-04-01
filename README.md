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

