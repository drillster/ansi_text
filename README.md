# ANSI Text
Provides a Dart library for styling and formatting terminal text using the
[ANSI escape codes](https://en.wikipedia.org/wiki/ANSI_escape_code). Styles are structured to provide easy IDE auto-completion.

### Usage
In order to add ANSI styling to text, wrap the text string into an `AnsiText` object:
```dart
final text = AnsiText('Hello, world');
```

The `AnsiText` object can now be formatted by applying styling to it:
```dart
text
  ..apply(Styles.markup.bold)
  ..apply(Styles.color.text.bright.yellow)
  ..apply(Styles.color.background.red);
```

The text can be output to the terminal either by printing it or by writing it to `stdout` or `stderr`. This calls `toString()` on
the `AnsiText` object, which evaluates the requested ANSI escape codes, including a terminating reset sequence:

```dart
print(text);
```

If there are multiple style attributes to apply to a single `AnsiText` object, the `applyAll` method may be useful:
```dart
AnsiText('Hello, world')
..applyAll({
    Styles.markup.bold,
    Styles.color.text.bright.yellow,
    Styles.color.background.red,
});
```

Note that the `Styles` class is structured in such a way that it provides out-of-the-box command completion in an IDE, allowing for
fast entry and compile-time checking.

#### Shorthand methods
Various shorthand methods for frequently used styling are provided for. For example, instead of typing:
```dart
text..apply(Styles.markup.bold);
```
one may also use:
```dart
text..bold();
```

See [extensions.dart](lib/src/extensions.dart) for the complete list of shorthand methods.

#### Color palettes
This library supports three different color palettes:
1. The 8 standard colors + 8 brighter versions
2. The 256-color (8-bit) color system, extending the standard colors with 216 RGB colors and 24 grayscales
3. The 24-bit RGB true color palette, comprising of over 16 million colors

The standard colors are implemented as color names. The "bright" variants of the standard colors require a `bright.` prefix. For
example:

```dart
AnsiText('Hello, world')
  ..apply(Styles.color.text.yellow)
  ..apply(Styles.color.background.bright.red)
```

The 216 RGB colors from the 8-bit color scheme are available through the `rgb(int red, int green, int blue)` method. The values of
each component must be between 0 and 5 (inclusive). For example:

```dart
AnsiText('Hello, world')
  ..apply(Styles.color.text.rgb(1,2,3))
  ..apply(Styles.color.background.rgb(3,2,1));
```

For grayscales there is the `gray(int lightness)` method. The value must be between 0 and 23 (inclusive), with 0 being the darkest
and 23 the lightest. Example:

```dart
AnsiText('Hello, world')
  ..apply(Styles.color.text.gray(3))
  ..apply(Styles.color.background.gray(18));
```

In order to output text or background in 24-bit true color, use the `trueColor(int red, int green, int blue)` method. The values of
each component must be between 0 and 255 (inclusive). Example:

```dart
AnsiText('Hello, world')
  ..apply(Styles.color.text.trueColor(60,120,180))
  ..apply(Styles.color.background.trueColor(180,120,60));
```

There is no built-in functionality to determine if the terminal supports any of these color modes. Generally speaking terminals
advertise their color support in the `TERM` and `COLORTERM` environment variables. If `TERM` is set to `xterm-256color` it indicates
that the 256-color palette is supported. If `COLORTERM` is set to `truecolor`, the 24-bit true color palette should be supported.


### Examples

See `bin/examples.dart` for a reasonably exhaustive overview of colors and markup. Running it produces the following output:

![Examples](examples.png)
