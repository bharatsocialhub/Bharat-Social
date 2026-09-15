# Bharat Social — phone/cloud build ready

This repository is designed so the Android project can be generated on a cloud CI runner. It includes Firebase initialization, email/password authentication, Firestore feed, Firebase Storage image upload, profile and activity screens.

## Build locally
flutter pub get
flutter create --platforms android . --org com.bharatsocial
flutter run

## GitHub build
The workflow in `.github/workflows/build-apk.yml` installs Flutter, generates the Android platform folder, gets dependencies, and builds a debug APK.

For production release, add Android signing credentials and use `flutter build appbundle --release`.

## Firebase
Enable Email/Password Authentication, Firestore, and Storage in the Firebase console. Review and deploy `firestore.rules` and `storage.rules`.

## Important
Storage for new Firebase projects may require the Blaze plan. Check Firebase pricing before enabling paid services.
