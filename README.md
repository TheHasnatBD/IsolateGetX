# Isolate - Flutter example
> Isolate Flutter, REST API, GetX, MVC design pattern

This is a sample project for practicing Isolate use case.

## Why Isolate?
By default, Dart apps do all of their work on a single thread. In many cases, this model simplifies coding and is fast enough that it does not result in poor app performance or stuttering animations, often called “jank.”
However, we might need to perform an expensive computation, such as parsing a very large JSON document. If this work takes more than 16 milliseconds, app users experience jank.

To avoid jank, we need to perform expensive computations like this in the background. On Android, this means scheduling work on a different thread. In Flutter, we can use a separate Isolate.



These resources will help you if you want to learn more:

- [Isolate: Official documentation example](https://flutter.dev/docs/cookbook/networking/background-parsing)
- [GetX: For details](https://pub.dev/packages/get)

>_Find me on [LinkedIn](https://www.linkedin.com/in/thehasnatbd/)_
