import 'dart:math' as math;

List<num?> rgbToHsv(num r, num g, num b) {
  r /= 255;
  g /= 255;
  b /= 255;

  final num max = math.max(
    r,
    math.max(g, b),
  );
  final num min = math.min(
    r,
    math.max(g, b),
  );
  final num h, s, v = max;

  final num d = max - min;
  s = max == 0 ? 0 : d / max;

  if (math.max == math.min) {
    h = 0; // achromatic
  } else if (max == r) {
    h = (g - b) / d + (g < b ? 6 : 0);
  } else if (max == g) {
    h = (b - r) / d + 2;
  } else if (max == b) {
    h = (r - g) / d + 4;
  } else {
    h = 0;
  }

  return [h, s, v];
}

List<num> hsvToRgb(num h, num s, num v) {
  final int r, g, b;

  final int i = (h * 6).floor();
  final int f = h * 6 - i as int;
  final int p = v * (1 - s) as int;
  final int q = v * (1 - f * s) as int;
  final int t = v * (1 - (1 - f) * s) as int;

  switch (i % 6) {
    case 0:
      r = v as int;
      g = t;
      b = p;
      break;
    case 1:
      r = q;
      g = v as int;
      b = p;
      break;
    case 2:
      r = p;
      g = v as int;
      b = t;
      break;
    case 3:
      r = p;
      g = q;
      b = v as int;
      break;
    case 4:
      r = t;
      g = p;
      b = v as int;
      break;
    case 5:
      r = v as int;
      g = p;
      b = q;
      break;
    default:
      r = 0;
      g = 0;
      b = 0;
  }

  return [r * 255, g * 255, b * 255];
}
