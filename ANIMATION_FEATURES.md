# Fitur Animasi Learnzy Flutter

## Animasi yang Diimplementasikan

### 1. Initial Load Animation (Fade + Slide)

Setiap halaman memiliki animasi saat pertama kali dimuat:

- **Fade In**: Opacity dari 0 ke 1 (800ms)
- **Slide Up**: Posisi dari bawah (offset 0.1) ke posisi normal
- **Curve**: `Curves.easeOut` untuk transisi yang smooth

**Implementasi:**

```dart
FadeTransition + SlideTransition pada body setiap page
Duration: 800ms
```

### 2. Staggered Card Animation

Cards muncul secara bertahap dengan delay berbeda:

- Hero Banner: 100ms delay
- Topic Cards: 200-350ms delay (staggered)
- Recommended Items: 400-500ms delay
- Stats Cards: 100-200ms delay
- Learning Mode Cards: 300-500ms delay

**Implementasi:**

```dart
AnimatedCard widget dengan parameter delay
Setiap card memiliki fade + slide animation
```

### 3. Hover Effects

Saat mouse hover di atas card:

- **Scale**: Card membesar 2% (scale 1.02)
- **Translate**: Card bergerak ke atas 4px
- **Duration**: 200ms
- **Curve**: `Curves.easeOut`

**Implementasi:**

```dart
MouseRegion + AnimatedScale + AnimatedContainer
Smooth transition dengan duration 200ms
```

### 4. Scroll Animation (Slide Up)

Cards muncul dari bawah saat pertama kali di-render:

- **Initial Position**: Offset(0, 0.3) - 30% dari tinggi card
- **Final Position**: Offset.zero
- **Animation**: Smooth slide up dengan fade in
- **Duration**: 600ms per card

**Implementasi:**

```dart
SlideTransition dalam AnimatedCard widget
Automatic trigger saat widget di-mount
```

## Struktur Widget Animasi

### AnimatedCard Widget

Widget reusable untuk animasi card dengan fitur:

- Fade in animation
- Slide up animation
- Hover scale effect
- Hover translate effect
- Configurable delay

**Properties:**

- `child`: Widget - Content yang akan dianimasi
- `delay`: int - Delay dalam milliseconds sebelum animasi dimulai

**Usage:**

```dart
AnimatedCard(
  delay: 200,
  child: YourCardWidget(),
)
```

## Performance Optimization

1. **SingleTickerProviderStateMixin**: Digunakan untuk efisiensi animation controller
2. **Dispose Pattern**: Semua animation controller di-dispose dengan benar
3. **Conditional Animation**: Animasi hanya berjalan saat widget mounted
4. **Hardware Acceleration**: Transform dan opacity menggunakan GPU acceleration

## Timing Configuration

| Element           | Delay (ms) | Duration (ms) | Curve   |
| ----------------- | ---------- | ------------- | ------- |
| Page Fade/Slide   | 0          | 800           | easeOut |
| Hero Banner       | 100        | 600           | easeOut |
| Topic Cards       | 200-350    | 600           | easeOut |
| Recommended Items | 400-500    | 600           | easeOut |
| Stats Cards       | 100-200    | 600           | easeOut |
| Learning Modes    | 300-500    | 600           | easeOut |
| Hover Effect      | 0          | 200           | easeOut |

## Browser/Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web (dengan MouseRegion untuk hover)
- ✅ Desktop (Windows, macOS, Linux)

## Catatan Implementasi

1. **Staggered Animation**: Menggunakan delay berbeda untuk menciptakan efek cascade
2. **Hover Detection**: MouseRegion bekerja di web dan desktop, tidak berpengaruh di mobile
3. **Smooth Transitions**: Semua animasi menggunakan `Curves.easeOut` untuk feel yang natural
4. **Memory Management**: Animation controllers di-dispose dengan benar untuk mencegah memory leak
5. **Responsive**: Animasi bekerja di semua ukuran layar dengan constraint maxWidth 480px

## Future Enhancements

Potensi peningkatan animasi di masa depan:

- [ ] Pull-to-refresh animation
- [ ] Swipe gestures untuk navigation
- [ ] Parallax scrolling effect
- [ ] Skeleton loading animation
- [ ] Ripple effect pada button press
- [ ] Page transition animation saat switch tab
