# COBOL Decoder — Agent Swarm

> Tier 2 (Focused Team) | Escalation: `02_ai_engineering/gnomad-swarm-core/`

## DECODER-BUILD: Flutter Builder

**Stack**: Flutter (Dart SDK >=3.2), Riverpod (flutter_riverpod), Google Fonts, Glassmorphism, Material Design
**Location**: `05_apps_and_extensions/in-development/cobol-decoder/`

### Responsibilities
- Build and maintain the Flutter cross-platform app targeting iOS, Android, macOS, and Web
- Implement the glassmorphic UI with custom widgets (`glass_container.dart`, `scanline_effect.dart`)
- Manage state with Riverpod providers (`providers/data_provider.dart`) and the COBOL data model (`models/cobol_data.dart`)
- Maintain screen navigation: Home, Error Decoder, Performance Quest (`lib/screens/`)
- Ensure the app theme (`theme/app_theme.dart`) and Google Fonts integration are consistent across platforms

### Coordination
- Works alongside DECODER-XPLAT on platform-specific build configurations and testing
- Owns the `flutter build` and `flutter run` pipelines for all target platforms
- Escalates Dart SDK or Riverpod version conflicts to the master orchestrator

## DECODER-XPLAT: Cross-Platform Agent

**Stack**: Flutter platform runners (iOS, Android, macOS, Web, Linux, Windows), Xcode, Gradle, CMake
**Location**: `05_apps_and_extensions/in-development/cobol-decoder/`

### Responsibilities
- Maintain platform-specific runner configurations (macOS `Runner/`, web `manifest.json`, etc.)
- Manage platform assets: app icons (`Assets.xcassets`), splash screens, and manifests
- Validate that `assets/data.json` loads correctly across all target platforms
- Test and resolve platform-specific rendering differences (especially macOS and Web)
- Keep `analysis_options.yaml` lint rules enforced across the codebase

### Coordination
- Provides platform build status and test results to DECODER-BUILD
- Flags platform-specific bugs that require widget or layout adjustments
- Escalates Xcode signing, Gradle versioning, or CMake configuration issues to the master orchestrator
