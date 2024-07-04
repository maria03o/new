import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kScrollbarThickness = 8.0; // Adjust thickness as needed

class MyScrollbar extends StatefulWidget {
  final ScrollableWidgetBuilder builder;
  final ScrollController scrollController;

  const MyScrollbar({
    Key? key,
    required this.scrollController,
    required this.builder,
  }) : super(key: key);

  @override
  _MyScrollbarState createState() => _MyScrollbarState();
}

class _MyScrollbarState extends State<MyScrollbar> {
  late ScrollbarPainter _scrollbarPainter;
  late ScrollController _scrollController;
  late Orientation _orientation;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateScrollPainter(_scrollController.position);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollbarPainter = _buildMaterialScrollbarPainter();
  }

  @override
  void dispose() {
    _scrollbarPainter.dispose();
    super.dispose();
  }

  ScrollbarPainter _buildMaterialScrollbarPainter() {
    return ScrollbarPainter(
      color: Color.fromARGB(255, 245, 244, 244),
      textDirection: Directionality.of(context),
      thickness: _kScrollbarThickness,
      radius: Radius.circular(20),
      fadeoutOpacityAnimation: const AlwaysStoppedAnimation<double>(1.0),
      padding: EdgeInsets.only(top: 8, right: 4, bottom: 8, left: 4), // Adjust padding as needed
    );
  }

  bool _updateScrollPainter(ScrollMetrics position) {
    _scrollbarPainter.update(
      position,
      position.axisDirection,
    );
    return false;
  }

  @override
  void didUpdateWidget(MyScrollbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateScrollPainter(_scrollController.position);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation != _orientation) {
          _orientation = orientation;
          _updateScrollPainter(_scrollController.position);
        }
        return NotificationListener
    <ScrollNotification>(
          onNotification: (notification) =>
              _updateScrollPainter(notification.metrics),
          child: CustomPaint(
            painter: _scrollbarPainter,
            child: widget.builder(context, _scrollController),
          ),
        );
      },
    );
  }
}






