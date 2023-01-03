A package that creates a placeholder using an asset image that the user provides until the network image loads.


|             | Android | iOS  |
|-------------|---------|------|
| **Support** | SDK 16+ | 9.0+ |

<p>
  <img src="https://i.ibb.co/64gKGTR/Media-230104-005312.gif"
    alt="An animated image of the Android delayed image" height="400"/>
</p>


## Features

Use an ```AssetImage``` while the ```NetworkImage``` downloading.

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

