import 'dart:io';

import 'package:ansi_text/ansi_text.dart';

void main() {
  stdout
    ..writeln(AnsiText('The terminal color chart')
      ..bold()
      ..lightYellow()
      ..blink())
    ..writeln(AnsiText('Hello')
      ..apply(Styles.bgRed)
      ..apply(Styles.lightGray))
    ..writeln(
        AnsiText('Also hello')..applyAll({Styles.bgRed, Styles.lightGray}));

  for (var r = 0; r <= 5; r++) {
    for (var g = 0; g <= 5; g++) {
      for (var b = 0; b <= 5; b++) {
        stdout
          ..write(AnsiText(' Color $r $g $b ')
            ..background(r, g, b)
            ..color(5 - r, 5 - g, 5 - b)
            ..bold())
          ..write('  ');
      }
      stdout.writeln();
    }
  }
  stdout.writeln();

  for (var i = 0; i <= 5; i++) {
    stdout
      ..write(AnsiText(' Gray $i $i $i  ')
        ..background(i, i, i)
        ..color(5 - i, 5 - i, 5 - i)
        ..italic())
      ..write('  ');
  }
  stdout.writeln();
}
