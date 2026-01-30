import 'ansi_text.dart';
import 'styles.dart';

/// Provides some shorthand methods for text markup.
extension Markup on AnsiText {
  void blink() => apply(Styles.markup.blinking);
  void bold() => apply(Styles.markup.bold);
  void boldItalic() => applyAll({Styles.markup.bold, Styles.markup.italic});
  void boldUnderline() =>
      applyAll({Styles.markup.bold, Styles.markup.underline});
  void concealed() => apply(Styles.markup.concealed);
  void faint() => apply(Styles.markup.faint);
  void inverted() => apply(Styles.markup.inverted);
  void italic() => apply(Styles.markup.italic);
  void strikethrough() => apply(Styles.markup.strikethrough);
  void underline() => apply(Styles.markup.underline);
}

/// Provides some shorthand methods for setting the text color.
extension TextColors on AnsiText {
  void black() => apply(Styles.color.text.black);
  void red() => apply(Styles.color.text.red);
  void green() => apply(Styles.color.text.green);
  void yellow() => apply(Styles.color.text.yellow);
  void blue() => apply(Styles.color.text.blue);
  void magenta() => apply(Styles.color.text.magenta);
  void cyan() => apply(Styles.color.text.cyan);
  void white() => apply(Styles.color.text.white);

  void brightBlack() => apply(Styles.color.text.bright.black);
  void brightRed() => apply(Styles.color.text.bright.red);
  void brightGreen() => apply(Styles.color.text.bright.green);
  void brightYellow() => apply(Styles.color.text.bright.yellow);
  void brightBlue() => apply(Styles.color.text.bright.blue);
  void brightMagenta() => apply(Styles.color.text.bright.magenta);
  void brightCyan() => apply(Styles.color.text.bright.cyan);
  void brightWhite() => apply(Styles.color.text.bright.white);
}

/// Provides some shorthand methods for setting the background color.
extension BackgroundColors on AnsiText {
  void bgBlack() => apply(Styles.color.background.black);
  void bgRed() => apply(Styles.color.background.red);
  void bgGreen() => apply(Styles.color.background.green);
  void bgYellow() => apply(Styles.color.background.yellow);
  void bgBlue() => apply(Styles.color.background.blue);
  void bgMagenta() => apply(Styles.color.background.magenta);
  void bgCyan() => apply(Styles.color.background.cyan);
  void bgWhite() => apply(Styles.color.background.white);

  void bgBrightBlack() => apply(Styles.color.background.bright.black);
  void bgBrightRed() => apply(Styles.color.background.bright.red);
  void bgBrightGreen() => apply(Styles.color.background.bright.green);
  void bgBrightYellow() => apply(Styles.color.background.bright.yellow);
  void bgBrightBlue() => apply(Styles.color.background.bright.blue);
  void bgBrightMagenta() => apply(Styles.color.background.bright.magenta);
  void bgBrightCyan() => apply(Styles.color.background.bright.cyan);
  void bgBrightWhite() => apply(Styles.color.background.bright.white);
}
