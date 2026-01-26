// ignore_for_file: avoid_print

import 'package:ansi_text/ansi_text.dart';

void main() {
  print(AnsiText('The quick brown fox')
    ..bold()
    ..lightYellow()
    ..blink());
  print(AnsiText('Hello')
    ..apply(Styles.bgRed)
    ..apply(Styles.lightGray));
  print(AnsiText('Also hello')..applyAll({Styles.bgRed, Styles.lightGray}));

  for (var r = 0; r <= 5; r++) {
    for (var g = 0; g <= 5; g++) {
      for (var b = 0; b <= 5; b++) {
        print(AnsiText(' Color $r $g $b ')
          ..color(r, g, b)
          ..background(5 - r, 5 - g, 5 - b)
          ..bold());
      }
    }
  }
}
