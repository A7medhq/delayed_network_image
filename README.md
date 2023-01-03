<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


## Features

A package that creates a placeholder using an asset image that the user provides until the network image loads.

## Getting started

import the package 
```dart
import 'package:delayed_network_image/delayed_network_image.dart';
```

## Usage

Wrap your Container with the new ```DelayedNetworkImage``` and put required parameters ```networkImage``` , ```assetImage```

```
DelayedNetworkImage(
networkImage: NetworkImage(
'https://letsenhance.io/static/334225cab5be263aad8e3894809594ce/75c5a/MainAfter.jpg'),
assetImage: AssetImage('image/anyImage.jpg'),
child: Container(),
)
```

