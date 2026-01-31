/// Represents the collection of styles that may be applied to an `AnsiText`
/// object.
class Styles {
  /// Contains the "markup" styles.
  static const markup = _Markup();

  /// Contains the "color" styles.
  static const color = _Color();
}

class _Markup {
  const _Markup();

  Style get bold => const Style('1', '22');
  Style get faint => const Style('2', '22');
  Style get italic => const Style('3', '23');
  Style get underline => const Style('4', '24');
  Style get blinking => const Style('5', '25');
  Style get inverted => const Style('7', '27');
  Style get concealed => const Style('8', '28');
  Style get strikethrough => const Style('9', '29');
}

class _Color {
  const _Color();

  _Background get background => const _Background();
  _Text get text => const _Text();
}

class _Background {
  const _Background();

  Style get black => const Style('40', _defaultBackgroundColor);
  Style get red => const Style('41', _defaultBackgroundColor);
  Style get green => const Style('42', _defaultBackgroundColor);
  Style get yellow => const Style('43', _defaultBackgroundColor);
  Style get blue => const Style('44', _defaultBackgroundColor);
  Style get magenta => const Style('45', _defaultBackgroundColor);
  Style get cyan => const Style('46', _defaultBackgroundColor);
  Style get white => const Style('47', _defaultBackgroundColor);
  _BrightBg get bright => const _BrightBg();

  /// Use an 8-bit color from the given [r], [g] and [b] values. Each component
  /// value must be between 0 and 5 (inclusive).
  Style rgb(int r, int g, int b) =>
      Style('48;5;${_calculateColorCode(r, g, b)}', _defaultBackgroundColor);

  /// Use a grayscale color with a [lightness] between 0 and 23 (inclusive).
  Style gray(int lightness) => Style(
      '48;5;${_calculateGrayscaleCode(lightness)}', _defaultBackgroundColor);

  /// Use a 24-bit color from the given [r], [g] and [b] values. Each component
  /// value must be between 0 and 255 (inclusive).
  Style trueColor(int r, int g, int b) => Style(
      '48;2;${r.clamp(0, 255)};${g.clamp(0, 255)};${b.clamp(0, 255)}',
      _defaultBackgroundColor);
}

class _BrightBg {
  const _BrightBg();

  Style get black => const Style('100', _defaultBackgroundColor);
  Style get red => const Style('101', _defaultBackgroundColor);
  Style get green => const Style('102', _defaultBackgroundColor);
  Style get yellow => const Style('103', _defaultBackgroundColor);
  Style get blue => const Style('104', _defaultBackgroundColor);
  Style get magenta => const Style('105', _defaultBackgroundColor);
  Style get cyan => const Style('106', _defaultBackgroundColor);
  Style get white => const Style('107', _defaultBackgroundColor);
}

class _Text {
  const _Text();

  Style get black => const Style('30', _defaultForegroundColor);
  Style get red => const Style('31', _defaultForegroundColor);
  Style get green => const Style('32', _defaultForegroundColor);
  Style get yellow => const Style('33', _defaultForegroundColor);
  Style get blue => const Style('34', _defaultForegroundColor);
  Style get magenta => const Style('35', _defaultForegroundColor);
  Style get cyan => const Style('36', _defaultForegroundColor);
  Style get white => const Style('37', _defaultForegroundColor);

  _BrightFg get bright => const _BrightFg();

  /// Use an 8-bit color from the given [r], [g] and [b] values. Each component
  /// value must be between 0 and 5 (inclusive).
  Style rgb(int r, int g, int b) =>
      Style('38;5;${_calculateColorCode(r, g, b)}', _defaultForegroundColor);

  /// Use a grayscale color with a [lightness] between 0 and 23 (inclusive).
  Style gray(int lightness) => Style(
      '38;5;${_calculateGrayscaleCode(lightness)}', _defaultForegroundColor);

  /// Use a 24-bit color from the given [r], [g] and [b] values. Each component
  /// value must be between 0 and 255 (inclusive).
  Style trueColor(int r, int g, int b) => Style(
      '38;2;${r.clamp(0, 255)};${g.clamp(0, 255)};${b.clamp(0, 255)}',
      _defaultForegroundColor);
}

class _BrightFg {
  const _BrightFg();

  Style get black => const Style('90', _defaultForegroundColor);
  Style get red => const Style('91', _defaultForegroundColor);
  Style get green => const Style('92', _defaultForegroundColor);
  Style get yellow => const Style('93', _defaultForegroundColor);
  Style get blue => const Style('94', _defaultForegroundColor);
  Style get magenta => const Style('95', _defaultForegroundColor);
  Style get cyan => const Style('96', _defaultForegroundColor);
  Style get white => const Style('97', _defaultForegroundColor);
}

/// Represents a style modification that can be applied to an `AnsiText`.
///
/// Each style has an SGR [activate] code to effectuate the style, and a [reset]
/// code to undo the style.
class Style {
  /// Creates a new style with activation and reset codes.
  const Style(this.activate, this.reset);

  /// Represents the SGR control code to activate the style.
  final String activate;

  /// Represents the SGR control code to reset the style.
  final String reset;
}

const _defaultBackgroundColor = '49';
const _defaultForegroundColor = '39';

/// Calculates the 256-color color code. Each component value must be between
/// 0 and 5.
int _calculateColorCode(int r, int g, int b) =>
    16 + (36 * r.clamp(0, 5)) + (6 * g.clamp(0, 5)) + b.clamp(0, 5);

/// Calculates the 256-color color code for the given grayscale value. This
/// value must be between 0 and 23, where 0 is the darkest and 23 the
/// lightest. On most terminals, black comes before grayscale value 0 and bright
/// white comes after grayscale value 23.
int _calculateGrayscaleCode(int grayscale) => 232 + grayscale.clamp(0, 23);
