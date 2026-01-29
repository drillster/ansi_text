import 'dart:io';

import 'package:ansi_text/ansi_text.dart';

void main() {
  stdout
    ..writeln(AnsiText('The ANSI Terminal color chart')..bold())
    ..writeln()

    // standard colors
    ..writeln(AnsiText('BLACK')..black())
    ..writeln(AnsiText('RED')..red())
    ..writeln(AnsiText('GREEN')..green())
    ..writeln(AnsiText('YELLOW')..yellow());
  // void blue() => apply(Styles.color.text.blue);
  // void magenta() => apply(Styles.color.text.magenta);
  // void cyan() => apply(Styles.color.text.cyan);
  // void lightGray() => apply(Styles.color.text.white);
  // void gray() => apply(Styles.color.text.bright.black);
  // void pink() => apply(Styles.color.text.bright.red);
  // void lightGreen() => apply(Styles.color.text.bright.green);
  // void lightYellow() => apply(Styles.color.text.bright.yellow);
  // void lightBlue() => apply(Styles.color.text.bright.blue);
  // void lightMagenta() => apply(Styles.color.text.bright.magenta);
  // void lightCyan() => apply(Styles.color.text.bright.cyan);
  // void white() => apply(Styles.color.text.bright.white);

  for (var r = 0; r <= 5; r++) {
    for (var g = 0; g <= 5; g++) {
      for (var b = 0; b <= 5; b++) {
        stdout
          ..write(AnsiText(' Color $r $g $b ')
            ..apply(Styles.color.background.rgb(r, g, b))
            ..apply(Styles.color.text.rgb(5 - r, 5 - g, 5 - b))
            ..bold())
          ..write('  ');
      }
      stdout.writeln();
    }
  }
  stdout
    ..writeln()
    ..write(AnsiText(' Black  ')
      ..applyAll(
          {Styles.color.background.black, Styles.color.text.bright.white}))
    ..writeln();
  for (var i = 0; i <= 23; i++) {
    stdout
      ..write(AnsiText(' Gray $i ')
        ..apply(Styles.color.background.gray(i))
        ..apply(Styles.color.text.gray(23 - i))
        ..italic())
      ..writeln();
  }
  stdout
    ..write(AnsiText(' White  ')
      ..applyAll(
          {Styles.color.background.bright.white, Styles.color.text.black}))
    ..writeln()
    ..writeln();
}
