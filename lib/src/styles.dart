part of ansi_text;

/// The collection of styles.
class Styles {
  static const markup = _Markup();
  static const color = _Color();
}

class _Markup {
  const _Markup();

  Style get reset => const Style('0');
  Style get bold => const Style('1');
  Style get faint => const Style('2');
  Style get italic => const Style('3');
  Style get underline => const Style('4');
  _Blink get blink => const _Blink();
  Style get inverted => const Style('7');
  Style get concealed => const Style('8');
  Style get strikethrough => const Style('9');
}

class _Blink {
  const _Blink();

  Style get slow => const Style('5');
  Style get fast => const Style('6');
}

class _Color {
  const _Color();

  _Background get background => const _Background();
  _Text get text => const _Text();
}

class _Background {
  const _Background();

  Style get normal => const Style('49');

  Style get black => const Style('40');
  Style get red => const Style('41');
  Style get green => const Style('42');
  Style get yellow => const Style('43');
  Style get blue => const Style('44');
  Style get magenta => const Style('45');
  Style get cyan => const Style('46');
  Style get white => const Style('47');
  _BrightBg get bright => const _BrightBg();

  Style rgb(int r, int g, int b) =>
      Style('48;5;${_calculateColorCode(r, g, b)}');

  Style gray(int lightness) =>
      Style('48;5;${_calculateGrayscaleCode(lightness)}');
}

class _BrightBg {
  const _BrightBg();

  Style get black => const Style('100');
  Style get red => const Style('101');
  Style get green => const Style('102');
  Style get yellow => const Style('103');
  Style get blue => const Style('104');
  Style get magenta => const Style('105');
  Style get cyan => const Style('106');
  Style get white => const Style('107');
}

class _Text {
  const _Text();

  Style get normal => const Style('39');

  Style get black => const Style('30');
  Style get red => const Style('31');
  Style get green => const Style('32');
  Style get yellow => const Style('33');
  Style get blue => const Style('34');
  Style get magenta => const Style('35');
  Style get cyan => const Style('36');
  Style get white => const Style('37');
  _BrightFg get bright => const _BrightFg();

  Style rgb(int r, int g, int b) =>
      Style('38;5;${_calculateColorCode(r, g, b)}');

  Style gray(int lightness) =>
      Style('38;5;${_calculateGrayscaleCode(lightness)}');
}

class _BrightFg {
  const _BrightFg();

  Style get black => const Style('90');
  Style get red => const Style('91');
  Style get green => const Style('92');
  Style get yellow => const Style('93');
  Style get blue => const Style('94');
  Style get magenta => const Style('95');
  Style get cyan => const Style('96');
  Style get white => const Style('97');
}

/// Represents a style modification that can be applied to an `AnsiText`.
class Style {
  const Style(this.code);

  static const String _esc = '\u{1B}';

  final String code;

  @override
  String toString() => '$_esc[${code}m';
}

/// Calculates the 256-color color code. Each component value must be between
/// 0 and 5.
int _calculateColorCode(int r, int g, int b) =>
    16 + (36 * r.clamp(0, 5)) + (6 * g.clamp(0, 5)) + b.clamp(0, 5);

/// Calculates the 256-color color code for the given grayscale value. This
/// value must be between 0 and 23, where 0 is the darkest and 23 the
/// lightest. Black comes before grayscale 0 and bright white comes after
/// grayscale 23.
int _calculateGrayscaleCode(int grayscale) => 232 + grayscale.clamp(0, 23);
