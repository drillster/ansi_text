import 'ansi_text.dart';
import 'styles.dart';

/// Provides some shorthand methods for text markup.
extension Markup on AnsiText {
  /// Applies the "blinking" markup style.
  void blink() => apply(Styles.markup.blinking);

  /// Applies the "bold" markup style.
  void bold() => apply(Styles.markup.bold);

  /// Applies both "bold" and "italic" markup styles.
  void boldItalic() => applyAll({Styles.markup.bold, Styles.markup.italic});

  /// Applies both "bold" and "underline" markup styles.
  void boldUnderline() =>
      applyAll({Styles.markup.bold, Styles.markup.underline});

  /// Applies the "concealed" markup style.
  void concealed() => apply(Styles.markup.concealed);

  /// Applies the "faint" markup style.
  void faint() => apply(Styles.markup.faint);

  /// Applies the "inverted" markup style.
  void inverted() => apply(Styles.markup.inverted);

  /// Applies the "italic" markup style.
  void italic() => apply(Styles.markup.italic);

  /// Applies the "strikethrough" markup style.
  void strikethrough() => apply(Styles.markup.strikethrough);

  /// Applies the "underline" markup style.
  void underline() => apply(Styles.markup.underline);
}

/// Provides some shorthand methods for setting the text color.
extension TextColors on AnsiText {
  /// Applies a black text color.
  void black() => apply(Styles.color.text.black);

  /// Applies a red text color.
  void red() => apply(Styles.color.text.red);

  /// Applies a green text color.
  void green() => apply(Styles.color.text.green);

  /// Applies a yellow text color.
  void yellow() => apply(Styles.color.text.yellow);

  /// Applies a blue text color.
  void blue() => apply(Styles.color.text.blue);

  /// Applies a magenta text color.
  void magenta() => apply(Styles.color.text.magenta);

  /// Applies a cyan text color.
  void cyan() => apply(Styles.color.text.cyan);

  /// Applies a white text color.
  void white() => apply(Styles.color.text.white);

  /// Applies a bright black text color.
  void brightBlack() => apply(Styles.color.text.bright.black);

  /// Applies a bright red text color.
  void brightRed() => apply(Styles.color.text.bright.red);

  /// Applies a bright green text color.
  void brightGreen() => apply(Styles.color.text.bright.green);

  /// Applies a bright yellow text color.
  void brightYellow() => apply(Styles.color.text.bright.yellow);

  /// Applies a bright blue text color.
  void brightBlue() => apply(Styles.color.text.bright.blue);

  /// Applies a bright magenta text color.
  void brightMagenta() => apply(Styles.color.text.bright.magenta);

  /// Applies a bright cyan text color.
  void brightCyan() => apply(Styles.color.text.bright.cyan);

  /// Applies a bright white text color.
  void brightWhite() => apply(Styles.color.text.bright.white);
}

/// Provides some shorthand methods for setting the background color.
extension BackgroundColors on AnsiText {
  /// Applies a black background color.
  void bgBlack() => apply(Styles.color.background.black);

  /// Applies a red background color.
  void bgRed() => apply(Styles.color.background.red);

  /// Applies a green background color.
  void bgGreen() => apply(Styles.color.background.green);

  /// Applies a yellow background color.
  void bgYellow() => apply(Styles.color.background.yellow);

  /// Applies a blue background color.
  void bgBlue() => apply(Styles.color.background.blue);

  /// Applies a magenta background color.
  void bgMagenta() => apply(Styles.color.background.magenta);

  /// Applies a cyan background color.
  void bgCyan() => apply(Styles.color.background.cyan);

  /// Applies a white background color.
  void bgWhite() => apply(Styles.color.background.white);

  /// Applies a bright black background color.
  void bgBrightBlack() => apply(Styles.color.background.bright.black);

  /// Applies a bright red background color.
  void bgBrightRed() => apply(Styles.color.background.bright.red);

  /// Applies a bright green background color.
  void bgBrightGreen() => apply(Styles.color.background.bright.green);

  /// Applies a bright yellow background color.
  void bgBrightYellow() => apply(Styles.color.background.bright.yellow);

  /// Applies a bright blue background color.
  void bgBrightBlue() => apply(Styles.color.background.bright.blue);

  /// Applies a bright magenta background color.
  void bgBrightMagenta() => apply(Styles.color.background.bright.magenta);

  /// Applies a bright cyan background color.
  void bgBrightCyan() => apply(Styles.color.background.bright.cyan);

  /// Applies a bright white background color.
  void bgBrightWhite() => apply(Styles.color.background.bright.white);
}
