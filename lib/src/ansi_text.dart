part of ansi_text;

class AnsiText {
  AnsiText([this._text = '']);

  static const String _esc = '\u{1B}';

  String _text = '';

  void apply(Styles style) {
    _text = _applyStyle(style, _text);
  }

  void applyAll(Set<Styles>? styles) {
    styles?.forEach(apply);
  }

  /// Sets the text color. Each color component must be between 0 and 5.
  void color(int r, int g, int b) {
    _text = '${_escapeSequence('38;5;${_calculateColorCode(r, g, b)}')}$_text';
  }

  /// Sets the background color. Each color component must be between 0 and 5.
  void background(int r, int g, int b) {
    _text = '${_escapeSequence('48;5;${_calculateColorCode(r, g, b)}')}$_text';
  }

  /// Calculates the 256-color color code. Each component value must be between
  /// 0 and 5.
  int _calculateColorCode(int r, int g, int b) =>
      16 + (36 * r.clamp(0, 5)) + (6 * g.clamp(0, 5)) + b.clamp(0, 5);

  String _applyStyle(Styles style, String text) =>
      '${_escapeSequence(_getStyleCode(style))}$text';

  String _escapeSequence(String code) => '$_esc[${code}m';

  @override
  String toString() => '$_text${_escapeSequence(_getStyleCode(Styles.reset))}';

  String _getStyleCode(Styles style) {
    switch (style) {
      case Styles.reset:
        return '0';
      case Styles.bold:
        return '1';
      case Styles.dark:
        return '2';
      case Styles.italic:
        return '3';
      case Styles.underline:
        return '4';
      case Styles.blink:
        return '5';
      case Styles.reverse:
        return '7';
      case Styles.concealed:
        return '8';
      case Styles.black:
        return '30';
      case Styles.red:
        return '31';
      case Styles.green:
        return '32';
      case Styles.yellow:
        return '33';
      case Styles.blue:
        return '34';
      case Styles.magenta:
        return '35';
      case Styles.cyan:
        return '36';
      case Styles.lightGray:
        return '37';
      case Styles.normal:
        return '39';
      case Styles.bgBlack:
        return '40';
      case Styles.bgRed:
        return '41';
      case Styles.bgGreen:
        return '42';
      case Styles.bgYellow:
        return '43';
      case Styles.bgBlue:
        return '44';
      case Styles.bgMagenta:
        return '45';
      case Styles.bgCyan:
        return '46';
      case Styles.bgLightGray:
        return '47';
      case Styles.bgNormal:
        return '49';
      case Styles.darkGray:
        return '90';
      case Styles.lightRed:
        return '91';
      case Styles.lightGreen:
        return '92';
      case Styles.lightYellow:
        return '93';
      case Styles.lightBlue:
        return '94';
      case Styles.lightMagenta:
        return '95';
      case Styles.lighCyan:
        return '96';
      case Styles.white:
        return '97';
      case Styles.bgDarkGray:
        return '100';
      case Styles.bgLightRed:
        return '101';
      case Styles.bgLightGreen:
        return '102';
      case Styles.bgLightYellow:
        return '103';
      case Styles.bgLightBlue:
        return '104';
      case Styles.bgLightMagenta:
        return '105';
      case Styles.bgLightCyan:
        return '106';
      case Styles.bgWhite:
        return '107';
    }
  }
}

extension Markup on AnsiText {
  void blink() => apply(Styles.blink);
  void bold() => apply(Styles.bold);
  void concealed() => apply(Styles.concealed);
  void dark() => apply(Styles.dark);
  void darkGray() => apply(Styles.darkGray);
  void italic() => apply(Styles.italic);
  void reverse() => apply(Styles.reverse);
  void underline() => apply(Styles.underline);
}

extension TextColors on AnsiText {
  void normal() => apply(Styles.normal);

  void black() => apply(Styles.black);
  void blue() => apply(Styles.blue);
  void cyan() => apply(Styles.cyan);
  void green() => apply(Styles.green);
  void magenta() => apply(Styles.magenta);
  void red() => apply(Styles.red);
  void white() => apply(Styles.white);
  void yellow() => apply(Styles.yellow);
  void lightBlue() => apply(Styles.lightBlue);
  void lightCyan() => apply(Styles.lighCyan);
  void lightGray() => apply(Styles.lightGray);
  void lightGreen() => apply(Styles.lightGreen);
  void lightMagenta() => apply(Styles.lightMagenta);
  void lightRed() => apply(Styles.lightRed);
  void lightYellow() => apply(Styles.lightYellow);
}

extension BackgroundColors on AnsiText {
  void bgNormal() => apply(Styles.bgNormal);

  void bgBlack() => apply(Styles.bgBlack);
  void bgBlue() => apply(Styles.bgBlue);
  void bgCyan() => apply(Styles.bgCyan);
  void bgDarkGray() => apply(Styles.bgDarkGray);
  void bgGreen() => apply(Styles.bgGreen);
  void bgLightBlue() => apply(Styles.bgLightBlue);
  void bgLightCyan() => apply(Styles.bgLightCyan);
  void bgLightGray() => apply(Styles.bgLightGray);
  void bgLightGreen() => apply(Styles.bgLightGreen);
  void bgLightMagenta() => apply(Styles.bgLightMagenta);
  void bgLightRed() => apply(Styles.bgLightRed);
  void bgLightYellow() => apply(Styles.bgLightYellow);
  void bgMagenta() => apply(Styles.bgMagenta);
  void bgRed() => apply(Styles.bgRed);
  void bgWhite() => apply(Styles.bgWhite);
  void bgYellow() => apply(Styles.bgYellow);
}
