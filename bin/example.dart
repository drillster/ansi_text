import 'dart:io';

import 'package:ansi_text/ansi_text.dart';

void main() {
  stdout
    ..writeln(AnsiText('AnsiText example page')..bold())
    ..writeln()

    // Text markup options
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
      ..bgBlack()
      ..brightWhite())
    ..write('  ')
    ..write(AnsiText(' Red     ')..bgRed())
    ..write('  ')
    ..write(AnsiText(' Green   ')..bgGreen())
    ..write('  ')
    ..write(AnsiText(' Yellow  ')..bgYellow())
    ..write('  ')
    ..write(AnsiText(' Blue    ')..bgBlue())
    ..write('  ')
    ..write(AnsiText(' Magenta ')..bgMagenta())
    ..write('  ')
    ..write(AnsiText(' Cyan    ')..bgCyan())
    ..write('  ')
    ..write(AnsiText(' White   ')
      ..bgWhite()
      ..black())
    ..writeln()
    ..writeln()

    // bright colors
    ..writeln('Bright colors:')
    ..write(AnsiText(' Black   ')
      ..bgBrightBlack()
      ..white())
    ..write('  ')
    ..write(AnsiText(' Red     ')..bgBrightRed())
    ..write('  ')
    ..write(AnsiText(' Green   ')..bgBrightGreen())
    ..write('  ')
    ..write(AnsiText(' Yellow  ')..bgBrightYellow())
    ..write('  ')
    ..write(AnsiText(' Blue    ')..bgBrightBlue())
    ..write('  ')
    ..write(AnsiText(' Magenta ')..bgBrightMagenta())
    ..write('  ')
    ..write(AnsiText(' Cyan    ')..bgBrightCyan())
    ..write('  ')
    ..write(AnsiText(' White   ')
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

  // Grayscale values
  stdout
    ..writeln()
    ..writeln('Grayscale values:');
  for (var i = 0; i <= 23; i++) {
    stdout
      ..write(AnsiText(' Gray $i ')
        ..apply(Styles.color.background.gray(i))
        ..apply(Styles.color.text.gray(23 - i))
        ..italic())
      ..writeln();
  }
  stdout
    ..writeln()
    ..writeln('24 bit true color:');

  for (var i = 0; i < 256; i = i + 3) {
    stdout.write(
        AnsiText(' ')..apply(Styles.color.background.trueColor(0, 0, i)));
  }
  stdout.writeln();
  for (var i = 0; i < 256; i = i + 3) {
    stdout.write(
        AnsiText(' ')..apply(Styles.color.background.trueColor(0, i, 0)));
  }
  stdout.writeln();
  for (var i = 0; i < 256; i = i + 3) {
    stdout.write(
        AnsiText(' ')..apply(Styles.color.background.trueColor(0, i, i)));
  }
  stdout.writeln();
  for (var i = 0; i < 256; i = i + 3) {
    stdout.write(
        AnsiText(' ')..apply(Styles.color.background.trueColor(i, 0, 0)));
  }
  stdout.writeln();
  for (var i = 0; i < 256; i = i + 3) {
    stdout.write(
        AnsiText(' ')..apply(Styles.color.background.trueColor(i, 0, i)));
  }
  stdout.writeln();
  for (var i = 0; i < 256; i = i + 3) {
    stdout.write(
        AnsiText(' ')..apply(Styles.color.background.trueColor(i, i, 0)));
  }
  stdout.writeln();
  for (var i = 0; i < 256; i = i + 3) {
    stdout.write(
        AnsiText(' ')..apply(Styles.color.background.trueColor(i, i, i)));
  }

  stdout
    ..writeln()
    ..writeln();
}
