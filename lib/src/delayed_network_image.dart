import 'package:flutter/material.dart';

class DelayedNetworkImage extends StatefulWidget {
  ImageProvider networkImage;
  ImageProvider assetImage;
  Widget? child;

  DelayedNetworkImage({
    Key? key,
    required this.assetImage,
    required this.networkImage,
    this.child,
  }) : super(key: key);

  @override
  State<DelayedNetworkImage> createState() => _DelayedNetworkImageState();
}

class _DelayedNetworkImageState extends State<DelayedNetworkImage> {
  bool _doneLoading = false;

  @override
  void initState() {
    widget.networkImage
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo imageInfo, bool syncCall) {
      setState(() {
        _doneLoading = true;
      });
    }));

    super.initState();
  }

  ImageProvider createImageProvider() {
    return _doneLoading == true ? widget.networkImage : widget.assetImage;
  }

  @override
  Widget build(BuildContext context) {
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
