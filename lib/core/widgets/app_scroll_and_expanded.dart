import 'package:flutter/material.dart';

class AppScrollAndExpanded extends StatelessWidget {
  const AppScrollAndExpanded({
    super.key,
    required this.child,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.physics,
    this.showScrollBar = true,
  });

  final Widget child;
  final Axis? scrollDirection;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool? showScrollBar;

  @override
  Widget build(BuildContext context) {
    return _returnAxisDirection();
  }

  _returnAxisDirection() {
    if (scrollDirection == Axis.vertical) {
      return LayoutBuilder(
        builder: (context, constraint) {
          return ScrollConfiguration(
            behavior: ScrollConfiguration.of(context)
                .copyWith(scrollbars: showScrollBar),
            child: SingleChildScrollView(
              physics: physics,
              controller: controller,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: child,
                ),
              ),
            ),
          );
        },
      );
    } else {
      return LayoutBuilder(
        builder: (context, constraint) {
          return ScrollConfiguration(
            behavior: ScrollConfiguration.of(context)
                .copyWith(scrollbars: showScrollBar),
            child: SingleChildScrollView(
              scrollDirection: scrollDirection!,
              controller: controller,
              physics: physics,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraint.maxWidth),
                child: IntrinsicWidth(
                  child: child,
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
