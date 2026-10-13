# BlockCraft Launcher

BlockCraft Launcher is a buildable Android launcher prototype for Minecraft Java Edition. The project is designed to run as a Jetpack Compose app, fetch official Minecraft version metadata from Mojang's version manifest, and present a clear readiness status for Java runtime and game files without pretending launch support exists when it does not.

## Current capabilities
- Dark Material 3 launcher UI
- Navigation between Home, Versions, Instances, Accounts, Mods, Settings, and Logs
- Official version metadata fetch from Mojang's version manifest endpoint
- Safe JSON parsing with network failure handling
- Honest launcher status reporting for storage, game files, and Java runtime availability
- GitHub Actions workflow to build a debug APK in the cloud

## Features not yet implemented
- Real Microsoft/Minecraft account authentication flow
- Minecraft ownership enforcement
- Java runtime download and installation for ARM64 Android
- Game asset download and verification
- Native library extraction and launch process
- Mod loader integration (Fabric/Forge/Quilt)
- Signed production build pipeline

## Screens and navigation
- Home: selected version, selected instance, Play button, status panel, activity feed
- Versions: list of official Minecraft versions with metadata and install state
- Instances: local instance management and directory status
- Accounts: authentication state explanation and setup guidance
- Mods: planned mod-related actions; currently informational
- Settings: launcher configuration and readiness notes
- Logs: launcher operational log viewer

## Project structure
- app/src/main/java/com/blockcraft/launcher/... source code
- app/src/main/res/... Android resources and theme configuration
- .github/workflows/android-build.yml GitHub Actions workflow
- gradle/libs.versions.toml version catalog
- README.md project overview and build instructions

## Build requirements
- Android Studio (recommended) or Android SDK command line tools
- JDK 17
- Android SDK Platform 36 and Build Tools 36.0.0
- Gradle 8.7 or the wrapper distribution if generated locally

## How to build locally
1. Install Android Studio or the Android SDK command line tools.
2. Accept the SDK licenses.
3. Install Android SDK Platform 36 and Build Tools 36.0.0.
4. Set ANDROID_HOME or use Android Studio's SDK location.
5. From the repository root run:
   ./gradlew --no-daemon --stacktrace :app:assembleDebug
6. The APK will be generated at:
   app/build/outputs/apk/debug/app-debug.apk

## How to build using GitHub Actions from a phone
1. Upload or commit the project to GitHub.
2. Open the repository in GitHub.
3. Select Actions.
4. Select Build Android APK.
5. Tap Run workflow.
6. Wait for the workflow to finish successfully.
7. Open the completed run.
8. Download the BlockCraftLauncher-debug-apk artifact.
9. Extract the ZIP.
10. Review Android's install-from-unknown-apps warning before installing the APK.

GitHub Actions usage limits and availability depend on the user's account, repository settings, and the current GitHub plan.

## How to download the APK artifact
After a successful GitHub Actions run:
- Open the workflow run
- Select the artifact named BlockCraftLauncher-debug-apk
- Download and extract the ZIP
- Install the APK on a compatible Android device

## How to install the APK on Android
- Allow installation from unknown sources if prompted
- Open the extracted APK file
- Confirm the installation prompt
- Launch BlockCraft Launcher

## Troubleshooting
- If Gradle cannot find the Android SDK, set the correct ANDROID_HOME and install Platform 36.
- If the build fails on dependency resolution, check the version catalog and Gradle wrapper version.
- If the app reports "launcher not ready", it is because the Java runtime and game files have not been installed or configured.
- If network requests fail, the app shows an error state instead of crashing.

## Security notes
- Do not commit tokens, keystores, signing keys, or personal account data.
- Do not collect or store Microsoft passwords in the app.
- Do not embed account tokens or pretend a guest session is licensed Minecraft access.
- Use the official OAuth flow only if a real client registration and secure redirect setup is configured.

## Minecraft and Microsoft licensing disclaimer
This project is an independent launcher prototype. It does not bundle or redistribute proprietary Minecraft game files, Microsoft authentication libraries, or any Java runtime from an unverified source.

Minecraft is a trademark of Mojang Studios. Microsoft and Mojang are not sponsors of this project. This launcher is designed to study app architecture, launcher UI, and metadata discovery, not to claim or provide licensed game access.

This project is distributed under the Apache License 2.0.
