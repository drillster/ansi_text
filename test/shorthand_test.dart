import 'package:ansi_text/ansi_text.dart';
import 'package:test/test.dart';

void main() {
  group('shorthand methods', () {
    group('markup', () {
      test('blink', () {
        expect(AnsiText('x')..blink(),
            AnsiText('x')..apply(Styles.markup.blinking));
      });

      test('bold', () {
        expect(AnsiText('x')..bold(), AnsiText('x')..apply(Styles.markup.bold));
      });

      test('bold italic', () {
        expect(
            AnsiText('x')..boldItalic(),
            AnsiText('x')
              ..applyAll({Styles.markup.bold, Styles.markup.italic}));
      });

      test('bold underline', () {
        expect(
            AnsiText('x')..boldUnderline(),
            AnsiText('x')
              ..applyAll({Styles.markup.bold, Styles.markup.underline}));
      });

      test('concealed', () {
        expect(AnsiText('x')..concealed(),
            AnsiText('x')..apply(Styles.markup.concealed));
      });

      test('faint', () {
        expect(
            AnsiText('x')..faint(), AnsiText('x')..apply(Styles.markup.faint));
      });

      test('inverted', () {
        expect(AnsiText('x')..inverted(),
            AnsiText('x')..apply(Styles.markup.inverted));
      });

      test('italic', () {
        expect(AnsiText('x')..italic(),
            AnsiText('x')..apply(Styles.markup.italic));
      });

      test('strikethrough', () {
        expect(AnsiText('x')..strikethrough(),
            AnsiText('x')..apply(Styles.markup.strikethrough));
      });

      test('underline', () {
        expect(AnsiText('x')..underline(),
            AnsiText('x')..apply(Styles.markup.underline));
      });
    });

    group('text colors', () {
      group('standard', () {
        test('black', () {
          expect(AnsiText('x')..black(),
              AnsiText('x')..apply(Styles.color.text.black));
        });

        test('red', () {
          expect(AnsiText('x')..red(),
              AnsiText('x')..apply(Styles.color.text.red));
        });

        test('green', () {
          expect(AnsiText('x')..green(),
              AnsiText('x')..apply(Styles.color.text.green));
        });

        test('yellow', () {
          expect(AnsiText('x')..yellow(),
              AnsiText('x')..apply(Styles.color.text.yellow));
        });

        test('blue', () {
          expect(AnsiText('x')..blue(),
              AnsiText('x')..apply(Styles.color.text.blue));
        });

        test('magenta', () {
          expect(AnsiText('x')..magenta(),
              AnsiText('x')..apply(Styles.color.text.magenta));
        });

        test('cyan', () {
          expect(AnsiText('x')..cyan(),
              AnsiText('x')..apply(Styles.color.text.cyan));
        });

        test('white', () {
          expect(AnsiText('x')..white(),
              AnsiText('x')..apply(Styles.color.text.white));
        });
      });

      group('bright', () {
        test('black', () {
          expect(AnsiText('x')..brightBlack(),
              AnsiText('x')..apply(Styles.color.text.bright.black));
        });

        test('red', () {
          expect(AnsiText('x')..brightRed(),
              AnsiText('x')..apply(Styles.color.text.bright.red));
        });

        test('green', () {
          expect(AnsiText('x')..brightGreen(),
              AnsiText('x')..apply(Styles.color.text.bright.green));
        });

        test('yellow', () {
          expect(AnsiText('x')..brightYellow(),
              AnsiText('x')..apply(Styles.color.text.bright.yellow));
        });

        test('blue', () {
          expect(AnsiText('x')..brightBlue(),
              AnsiText('x')..apply(Styles.color.text.bright.blue));
        });

        test('magenta', () {
          expect(AnsiText('x')..brightMagenta(),
              AnsiText('x')..apply(Styles.color.text.bright.magenta));
        });

        test('cyan', () {
          expect(AnsiText('x')..brightCyan(),
              AnsiText('x')..apply(Styles.color.text.bright.cyan));
        });

        test('white', () {
          expect(AnsiText('x')..brightWhite(),
              AnsiText('x')..apply(Styles.color.text.bright.white));
        });
      });
    });

    group('background colors', () {
      group('standard', () {
        test('black', () {
          expect(AnsiText('x')..bgBlack(),
              AnsiText('x')..apply(Styles.color.background.black));
        });

        test('red', () {
          expect(AnsiText('x')..bgRed(),
              AnsiText('x')..apply(Styles.color.background.red));
        });

        test('green', () {
          expect(AnsiText('x')..bgGreen(),
              AnsiText('x')..apply(Styles.color.background.green));
        });

        test('yellow', () {
          expect(AnsiText('x')..bgYellow(),
              AnsiText('x')..apply(Styles.color.background.yellow));
        });

        test('blue', () {
          expect(AnsiText('x')..bgBlue(),
              AnsiText('x')..apply(Styles.color.background.blue));
        });

        test('magenta', () {
          expect(AnsiText('x')..bgMagenta(),
              AnsiText('x')..apply(Styles.color.background.magenta));
        });

        test('cyan', () {
          expect(AnsiText('x')..bgCyan(),
              AnsiText('x')..apply(Styles.color.background.cyan));
        });

        test('white', () {
          expect(AnsiText('x')..bgWhite(),
              AnsiText('x')..apply(Styles.color.background.white));
        });
      });

      group('bright', () {
        test('black', () {
          expect(AnsiText('x')..bgBrightBlack(),
              AnsiText('x')..apply(Styles.color.background.bright.black));
        });

        test('red', () {
          expect(AnsiText('x')..bgBrightRed(),
              AnsiText('x')..apply(Styles.color.background.bright.red));
        });

        test('green', () {
          expect(AnsiText('x')..bgBrightGreen(),
              AnsiText('x')..apply(Styles.color.background.bright.green));
        });

        test('yellow', () {
          expect(AnsiText('x')..bgBrightYellow(),
              AnsiText('x')..apply(Styles.color.background.bright.yellow));
        });

        test('blue', () {
          expect(AnsiText('x')..bgBrightBlue(),
              AnsiText('x')..apply(Styles.color.background.bright.blue));
        });

        test('magenta', () {
          expect(AnsiText('x')..bgBrightMagenta(),
              AnsiText('x')..apply(Styles.color.background.bright.magenta));
        });

        test('cyan', () {
          expect(AnsiText('x')..bgBrightCyan(),
              AnsiText('x')..apply(Styles.color.background.bright.cyan));
        });

        test('white', () {
          expect(AnsiText('x')..bgBrightWhite(),
              AnsiText('x')..apply(Styles.color.background.bright.white));
        });
      });
    });
  });
}
