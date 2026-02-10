# COBOLDecoder 📟✨

**COBOLDecoder** is a mobile-first reference app designed for the next generation of mainframe engineers. It bridges the gap between modern programming concepts and legacy z/OS systems with a sleek, "Terminal Neon" aesthetic.

## 🚀 The Vibe
*   **Theme:** "Terminal Neon" - A high-contrast dark mode ("Obsidian") with "Cyber-Lime" and "Electric-Purple" accents.
*   **Aesthetics:** Glassmorphism components, retro-terminal scanlines, and Google Fonts (Outfit & Inter).
*   **Target Audience:** Junior mainframe engineers (Millennials/Gen Z).

## ⚡ Features

### 🔍 Decoder Hub
A powerful search interface that supports "fuzzy search" for standard SQL keywords and their DB2 for z/OS equivalents.

### 🔄 Logic Swapper
A split-view component that translates Standard SQL logic into z/OS specific syntax, complete with explanations and examples.

### 🐛 Error Decoder
Instantly decode cryptic 3 or 4-digit SQLCODEs (e.g., `-904`, `-911`) into human-readable explanations with actionable "Fix Steps."

### 🛡️ Performance Quest
A gamified "Pro-Tips" section that turns performance optimization into a quest, highlighting efficiency tricks for z/OS to avoid CPU waste.

## 🛠️ Tech Stack
*   **Framework:** [Flutter](https://flutter.dev) (Mobile First)
*   **State Management:** [Riverpod](https://riverpod.dev)
*   **Fonts:** [Google Fonts](https://pub.dev/packages/google_fonts)
*   **Icons:** Cupertino Icons
*   **Data:** Local JSON (Offline-first architecture)

## 📦 Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/davidthegnomad/COBOLDecoder.git
    cd COBOLDecoder
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the app:**
    ```bash
    flutter run
    ```

## 🤝 Contributing
Contributions are welcome! Pull requests are encouraged for new "quests," additional error codes, or UI enhancements.

## 📄 License
This project is licensed under the MIT License.
