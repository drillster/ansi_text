import 'dart:io';

import 'package:ansi_text/ansi_text.dart';

void main() {
  stdout
    ..writeln(AnsiText('AnsiText example page')..bold())
    ..writeln()

    // Text markup
    ..writeln('Text markup:')
    ..write(' - ')
    ..writeln(AnsiText('Bold')..bold())
    ..write(' - ')
    ..writeln(AnsiText('Faint')..faint())
    ..write(' - ')
    ..writeln(AnsiText('Italic')..italic())
    ..write(' - ')
    ..writeln(AnsiText('Bold italic')
      ..bold()
      ..italic())
    ..write(' - ')
    ..writeln(AnsiText('Underline')..underline())
    ..write(' - ')
    ..writeln(AnsiText('Bold underline')
      ..bold()
      ..underline())
    ..write(' - ')
    ..writeln(AnsiText('Blinking')..blink())
    ..write(' - ')
    ..writeln(AnsiText('Inverted')..inverted())
    ..write(' - ')
    ..write(AnsiText('Concealed')..concealed())
    ..writeln(' (concealed)')
    ..write(' - ')
    ..writeln(AnsiText('Strikethrough')..strikethrough())
    ..writeln()

    // standard colors
    ..writeln('Standard colors:')
    ..write(AnsiText(' Black   ')
      ..bold()
      ..bgBlack()
      ..brightWhite())
    ..write('  ')
    ..write(AnsiText(' Red     ')
      ..bold()
      ..bgRed()
      ..brightWhite())
    ..write('  ')
    ..write(AnsiText(' Green   ')
      ..bold()
      ..bgGreen()
      ..black())
    ..write('  ')
    ..write(AnsiText(' Yellow  ')
      ..bold()
      ..bgYellow()
      ..black())
    ..write('  ')
    ..write(AnsiText(' Blue    ')
      ..bold()
      ..bgBlue()
      ..black())
    ..write('  ')
    ..write(AnsiText(' Magenta ')
      ..bold()
      ..bgMagenta()
      ..white())
    ..write('  ')
    ..write(AnsiText(' Cyan    ')
      ..bold()
      ..bgCyan()
      ..black())
    ..write('  ')
    ..write(AnsiText(' White   ')
      ..bold()
      ..bgWhite()
      ..black())
    ..writeln()
    ..writeln()

    // bright colors
    ..writeln('Bright colors:')
    ..write(AnsiText(' Black   ')
      ..bold()
      ..bgBrightBlack()
      ..brightWhite())
    ..write('  ')
    ..write(AnsiText(' Red     ')
      ..bold()
      ..bgBrightRed()
      ..brightWhite())
    ..write('  ')
    ..write(AnsiText(' Green   ')
      ..bold()
      ..bgBrightGreen()
      ..black())
    ..write('  ')
    ..write(AnsiText(' Yellow  ')
      ..bold()
      ..bgBrightYellow()
      ..black())
    ..write('  ')
    ..write(AnsiText(' Blue    ')
      ..bold()
      ..bgBrightBlue()
      ..black())
    ..write('  ')
    ..write(AnsiText(' Magenta ')
      ..bold()
      ..bgBrightMagenta()
      ..white())
    ..write('  ')
    ..write(AnsiText(' Cyan    ')
      ..bold()
      ..bgBrightCyan()
      ..black())
    ..write('  ')
    ..write(AnsiText(' White   ')
      ..bold()
      ..bgBrightWhite()
      ..black())
    ..writeln()
    ..writeln()

    // 8-bit colors
    ..writeln('216 RGB colors:');
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

    // Grayscale values
    ..writeln('Grayscale values:');
  for (var i = 0; i <= 23; i++) {
    stdout
      ..write(AnsiText(' Gray $i ${i < 10 ? ' ' : ''}')
        ..apply(Styles.color.background.gray(i))
        ..apply(Styles.color.text.gray(23 - i))
        ..bold())
      ..write('  ');
    if ((i + 1) % 6 == 0) {
      stdout.writeln();
    }
  }
  stdout
    ..writeln()

    // True color
    ..writeln('24 bit true color:');
  for (var mask = 1; mask < 8; mask++) {
    for (var i = 0; i < 256; i += 3) {
      stdout.write(
        AnsiText(' ')
          ..apply(
            Styles.color.background.trueColor(
              (mask & 4) != 0 ? i : 0,
              (mask & 2) != 0 ? i : 0,
              (mask & 1) != 0 ? i : 0,
            ),
          ),
      );
    }
    stdout.writeln();
  }
  stdout.writeln();
}
