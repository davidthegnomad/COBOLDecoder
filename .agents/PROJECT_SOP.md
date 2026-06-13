# Project SOP — cobol-decoder

> Flutter mobile app — a reference app for mainframe engineers bridging modern concepts with legacy z/OS systems.
> **Self-Evolving**: Agents update this file when processes change. See Self-Evolution Protocol.

---

## Environment Setup

```bash
# Navigate to project
cd 05_apps_and_extensions/in-development/cobol-decoder

# Install Flutter dependencies
flutter pub get

# Verify Flutter environment
flutter doctor

# Required: Flutter SDK >= 3.2.0, < 4.0.0
```

## Development

```bash
# Run on connected device or emulator
flutter run

# Run on specific platform
flutter run -d chrome    # Web
flutter run -d android   # Android emulator
flutter run -d ios       # iOS simulator
```

### Key Directories
| Directory | Purpose |
|-----------|---------|
| `lib/` | Dart source code |
| `assets/` | Data files (data.json) |
| `test/` | Flutter widget/unit tests |

### Key Dependencies
- **Framework**: Flutter SDK >= 3.2.0
- **State**: flutter_riverpod
- **UI**: Google Fonts, Glassmorphism, Cupertino Icons
- **Data**: assets/data.json (reference data)

### Code Conventions
- Dart with Flutter lints (flutter_lints v2)
- Riverpod for state management
- Material Design with glassmorphism effects

## Testing

```bash
# Run all tests
flutter test

# Run analyzer
flutter analyze
```

### Pre-Commit Checklist
- [ ] No analyzer warnings (`flutter analyze`)
- [ ] All tests pass (`flutter test`)
- [ ] Build succeeds (`flutter build apk` or `flutter build ios`)
- [ ] SESSION_STATE.md is updated

## Deployment

```bash
# Build Android APK
flutter build apk

# Build Android App Bundle
flutter build appbundle

# Build iOS
flutter build ios
```

### Deployment Targets
| Environment | Platform | Branch/Trigger |
|-------------|----------|----------------|
| Android | Google Play Store | Manual build |
| iOS | Apple App Store | Manual build |

### Post-Deploy Checklist
- [ ] Verify app installs and runs
- [ ] Test data.json loads correctly
- [ ] Update SESSION_STATE.md

## Troubleshooting

### Common Issues
| Issue | Fix |
|-------|-----|
| Pub get fails | Check SDK version constraint in pubspec.yaml |
| Asset not found | Ensure asset is listed in `flutter.assets` section of pubspec.yaml |
| Riverpod provider errors | Wrap root widget with ProviderScope |

### Emergency Procedures
- **Rollback**: Upload previous build to app stores
- **Logs**: `flutter logs`, device console
- **Escalation**: Report to `02_ai_engineering/gnomad-swarm-core/`

---

*This SOP is a living document. Update it whenever processes change.*
