import 'package:flutter/material.dart';

class DelayedNetworkImage extends StatefulWidget {
  // it's where the network image provider goes
  final ImageProvider networkImage;

  // it's where the asset image provider goes
  final ImageProvider assetImage;

  // it's where the child goes
  final Widget? child;

  const DelayedNetworkImage({
    Key? key,
    required this.assetImage,
    required this.networkImage,
    this.child,
  }) : super(key: key);

  @override
  State<DelayedNetworkImage> createState() => _DelayedNetworkImageState();
}

class _DelayedNetworkImageState extends State<DelayedNetworkImage> {
  // to check if the NetworkImage finished downloading
  bool _doneLoading = false;

  @override
  void initState() {
    // The function that check the loading process
    widget.networkImage
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo imageInfo, bool syncCall) {
      setState(() {
        _doneLoading = true;
      });
    }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Our custom Container with Decoration image that changes according to the downloading process
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: _doneLoading == true
                  ? widget.networkImage
                  : widget.assetImage,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop))),
      child: widget.child,
    );
  }
}
