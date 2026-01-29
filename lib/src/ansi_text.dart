part of ansi_text;

class AnsiText {
  AnsiText([this._text = '']);

  String _text = '';

  void apply(Style style) {
    _text = _applyStyle(style, _text);
  }

  void applyAll(Set<Style>? styles) {
    styles?.forEach(apply);
  }

  String _applyStyle(Style style, String text) => '${style.toString()}$text';

  @override
  String toString() => '$_text${Styles.markup.reset.toString()}';
}

/// Provides some shorthand methods for text markup.
extension Markup on AnsiText {
  void bold() => apply(Styles.markup.bold);
  void faint() => apply(Styles.markup.faint);
  void italic() => apply(Styles.markup.italic);
  void underline() => apply(Styles.markup.underline);
  void blinkSlow() => apply(Styles.markup.blink.slow);
  void blinkFast() => apply(Styles.markup.blink.fast);
  void inverted() => apply(Styles.markup.inverted);
  void concealed() => apply(Styles.markup.concealed);
  void strikethrough() => apply(Styles.markup.strikethrough);
}

/// Provides some shorthand methods for setting the text color.
extension TextColors on AnsiText {
  void normal() => apply(Styles.color.text.normal);

  void black() => apply(Styles.color.text.black);
  void red() => apply(Styles.color.text.red);
  void green() => apply(Styles.color.text.green);
  void yellow() => apply(Styles.color.text.yellow);
  void blue() => apply(Styles.color.text.blue);
  void magenta() => apply(Styles.color.text.magenta);
  void cyan() => apply(Styles.color.text.cyan);
  void lightGray() => apply(Styles.color.text.white);
  void gray() => apply(Styles.color.text.bright.black);
  void pink() => apply(Styles.color.text.bright.red);
  void lightGreen() => apply(Styles.color.text.bright.green);
  void lightYellow() => apply(Styles.color.text.bright.yellow);
  void lightBlue() => apply(Styles.color.text.bright.blue);
  void lightMagenta() => apply(Styles.color.text.bright.magenta);
  void lightCyan() => apply(Styles.color.text.bright.cyan);
  void white() => apply(Styles.color.text.bright.white);
}

// extension BackgroundColors on AnsiText {
//   void bgNormal() => apply(Styles.bgNormal);

//   void bgBlack() => apply(Styles.bgBlack);
//   void bgBlue() => apply(Styles.bgBlue);
//   void bgCyan() => apply(Styles.bgCyan);
//   void bgDarkGray() => apply(Styles.bgDarkGray);
//   void bgGreen() => apply(Styles.bgGreen);
//   void bgLightBlue() => apply(Styles.bgLightBlue);
//   void bgLightCyan() => apply(Styles.bgLightCyan);
//   void bgLightGray() => apply(Styles.bgLightGray);
//   void bgLightGreen() => apply(Styles.bgLightGreen);
//   void bgLightMagenta() => apply(Styles.bgLightMagenta);
//   void bgLightRed() => apply(Styles.bgLightRed);
//   void bgLightYellow() => apply(Styles.bgLightYellow);
//   void bgMagenta() => apply(Styles.bgMagenta);
//   void bgRed() => apply(Styles.bgRed);
//   void bgWhite() => apply(Styles.bgWhite);
//   void bgYellow() => apply(Styles.bgYellow);
// }
