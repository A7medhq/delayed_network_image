import 'package:flutter/material.dart';

class DelayedNetworkImage extends StatefulWidget {
  ImageProvider networkImage;
  ImageProvider assetImage;
  Widget? child;
  Color? color;
  AlignmentGeometry? alignment;
  EdgeInsetsGeometry? padding;
  Decoration? foregroundDecoration;
  double? width;
  double? height;
  BoxConstraints? constraints;
  EdgeInsetsGeometry? margin;
  Matrix4? transform;
  AlignmentGeometry? transformAlignment;
  Clip clipBehavior = Clip.none;

  DelayedNetworkImage(
      {Key? key,
      required this.assetImage,
      required this.networkImage,
      this.height,
      this.child,
      this.color,
      this.margin,
      this.width,
      this.alignment,
      this.padding,
      this.clipBehavior = Clip.none,
      this.constraints,
      this.foregroundDecoration,
      this.transform,
      this.transformAlignment})
      : super(key: key);

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
      height: widget.height,
      width: widget.width,
      foregroundDecoration: widget.foregroundDecoration,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: _doneLoading == true
                  ? widget.networkImage
                  : widget.assetImage,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop))),
      color: widget.color,
      constraints: widget.constraints,
      clipBehavior: widget.clipBehavior,
      alignment: widget.alignment,
      transform: widget.transform,
      transformAlignment: widget.transformAlignment,
      margin: widget.margin,
      padding: widget.padding,
      child: widget.child,
    );
  }
}
