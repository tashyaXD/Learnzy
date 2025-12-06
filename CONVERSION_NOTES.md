# Konversi React ke Flutter - Learnzy

## Ringkasan Konversi

Aplikasi Learnzy telah berhasil dikonversi dari React (TypeScript) ke Flutter (Dart). Semua fitur utama dan tampilan visual telah diimplementasikan sesuai dengan requirements.

## Struktur File

```
lib/
├── main.dart                      # Entry point & bottom navigation
├── pages/
│   ├── landing_page.dart         # Halaman utama dengan topik populer
│   ├── recommended_page.dart     # Halaman rekomendasi AI
│   └── adaptive_page.dart        # Halaman mode pembelajaran adaptif
└── widgets/
    └── image_with_fallback.dart  # Widget untuk loading gambar dengan fallback
```

## Dependencies yang Digunakan

Sesuai dengan Requirement 10, berikut adalah dependencies yang ditambahkan di `pubspec.yaml`:

- **cached_network_image**: ^3.4.1 - Untuk loading dan caching gambar dari network
- **google_fonts**: ^6.2.1 - Untuk custom typography (Inter font)

## Mapping Komponen React ke Flutter

### 1. App Structure (Requirement 1)

- **React**: `App.tsx` dengan useState untuk tab management
- **Flutter**: `MainScreen` StatefulWidget dengan BottomNavigationBar

### 2. Icons (Requirement 7)

- **React**: lucide-react icons
- **Flutter**: Material Icons (built-in)
  - Home → Icons.home
  - Sparkles → Icons.auto_awesome
  - Brain → Icons.psychology
  - BookOpen → Icons.menu_book
  - Languages → Icons.language
  - Beaker → Icons.science
  - Calculator → Icons.calculate
  - Focus → Icons.center_focus_strong
  - Zap → Icons.bolt
  - Moon → Icons.nightlight_round

### 3. Styling (Requirement 6)

- **Colors**:
  - mint: Color(0xFF10B981)
  - mint-light: Color(0xFF34D399)
  - gray-bg: Color(0xFFF9FAFB)
  - muted-foreground: Color(0xFF6B7280)
- **Border Radius**: BorderRadius.circular(12-20)
- **Shadows**: BoxShadow dengan opacity 0.05

### 4. Layout (Requirement 9)

- **Max Width**: ConstrainedBox dengan maxWidth: 480
- **Scrollable Content**: SingleChildScrollView
- **Bottom Padding**: 100px untuk menghindari overlap dengan navigation

### 5. Image Loading (Requirement 8)

- **React**: ImageWithFallback component dengan error handling
- **Flutter**: CachedNetworkImage dengan placeholder dan errorWidget

## Fitur yang Diimplementasikan

### Landing Page (Requirement 2)

✅ Header dengan logo Learnzy dan level badge
✅ Hero banner dengan greeting dan streak information
✅ Grid layout 4 topic cards (Matematika, Bahasa, Sains, Sejarah)
✅ Topic cards dengan image, icon, title, dan jumlah lessons
✅ Recommended topics section dengan 3 items
✅ Progress bar untuk setiap recommended topic
✅ AI badge untuk rekomendasi

### Recommended Page (Requirement 3)

✅ Header dengan Sparkles dan Brain icon
✅ AI info banner
✅ Grid layout 6 recommended topic cards
✅ Gradient header untuk setiap card
✅ AI score display
✅ Difficulty badge dan duration
✅ Info section tentang AI score

### Adaptive Page (Requirement 4)

✅ Header dengan Brain icon
✅ Statistics section dengan 3 stat cards (Waktu, Target, Progres)
✅ AI info banner
✅ 3 learning mode cards (Focus Mode, Fast Learning, Evening Mode)
✅ Image, icon, time recommendation untuk setiap mode
✅ Feature badges
✅ Action button "Mulai Sekarang"
✅ Tips section

## Cara Menjalankan

1. Install dependencies:

```bash
flutter pub get
```

2. Jalankan aplikasi:

```bash
flutter run
```

## Perbedaan Utama React vs Flutter

1. **State Management**:

   - React: useState hooks
   - Flutter: StatefulWidget dengan setState

2. **Styling**:

   - React: className dengan Tailwind CSS
   - Flutter: Widget properties (Container, BoxDecoration, TextStyle)

3. **Layout**:

   - React: div, flex dengan CSS
   - Flutter: Column, Row, Container, Stack

4. **Navigation**:

   - React: Conditional rendering
   - Flutter: IndexedStack atau direct widget switching

5. **Images**:
   - React: img tag dengan onError
   - Flutter: CachedNetworkImage widget

## Catatan Tambahan

- Semua warna dan spacing telah disesuaikan untuk match dengan design React
- Icons menggunakan Material Icons yang sudah built-in di Flutter
- Image caching otomatis dengan cached_network_image
- Responsive layout dengan max-width constraint
- Smooth scrolling dengan SingleChildScrollView
