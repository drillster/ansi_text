import 'package:ansi_text/ansi_text.dart';
import 'package:test/test.dart';

void main() {
  group('foreground colors', () {
    test('black', () {
      final text = AnsiText('text')..black();
      expect(text.toString(), '\x1B[30mtext\x1B[0m');
    });

    test('red', () {
      final text = AnsiText('text')..red();
      expect(text.toString(), '\x1B[31mtext\x1B[0m');
    });

    test('green', () {
      final text = AnsiText('text')..green();
      expect(text.toString(), '\x1B[32mtext\x1B[0m');
    });

    test('yellow', () {
      final text = AnsiText('text')..yellow();
      expect(text.toString(), '\x1B[33mtext\x1B[0m');
    });

    test('blue', () {
      final text = AnsiText('text')..blue();
      expect(text.toString(), '\x1B[34mtext\x1B[0m');
    });

    test('magenta', () {
      final text = AnsiText('text')..magenta();
      expect(text.toString(), '\x1B[35mtext\x1B[0m');
    });

    test('cyan', () {
      final text = AnsiText('text')..cyan();
      expect(text.toString(), '\x1B[36mtext\x1B[0m');
    });

    test('light gray', () {
      final text = AnsiText('text')..lightGray();
      expect(text.toString(), '\x1B[37mtext\x1B[0m');
    });
  });

  group('combination of styles', () {
    test('bold and magenta', () {
      final text = AnsiText('text')
        ..bold()
        ..magenta();
      expect(text.toString(), '\x1B[35m\x1B[1mtext\x1B[0m');
    });
  });
}
