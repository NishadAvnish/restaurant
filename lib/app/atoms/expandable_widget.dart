import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/app/core/constants.dart';
import 'package:restaurant/app/atoms/text_extension.dart';
import '../core/app_color.dart';
import '../core/spacers.dart';

class ExpandibleWidget extends StatefulWidget {
  final Duration? animationDuration;
  final Curve? animationCurve;
  final String headingTitle;
  final Widget expandedAreaWidget;
  final IconData? expandedIcon;
  final IconData? unExpandedIcon;
  final bool? isExpanded;
  final Function(bool value)? onChange;

  const ExpandibleWidget({
    Key? key,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeIn,
    required this.headingTitle,
    required this.expandedAreaWidget,
    this.expandedIcon = Icons.remove,
    this.unExpandedIcon = Icons.add,
    this.isExpanded = false,
    this.onChange,
  }) : super(key: key);

  @override
  _ExpandibleWidgetState createState() => _ExpandibleWidgetState();
}

class _ExpandibleWidgetState extends State<ExpandibleWidget>
    with TickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded!;
    _animationController = AnimationController(
        vsync: this,
        duration: widget.animationDuration,
        reverseDuration: widget.animationDuration!);
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve!,
    );

    _expandAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ExpandibleWidget oldWidget) {
    if (oldWidget.isExpanded != widget.isExpanded) {
      if (widget.isExpanded == false) {
        _animationController.reverse();
        _isExpanded = widget.isExpanded!;
      } else if (widget.isExpanded == true) {
        _animationController.forward();
        _isExpanded = widget.isExpanded!;
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        child: Container(
          padding: EdgeInsets.only(
              left: 16.0.w, right: 16.w, top: 12.h, bottom: 12.h),
          decoration: BoxDecoration(
              boxShadow: [BOXSHADOW()],
              color: AppColors.COLOR_WHITE,
              borderRadius: BorderRadius.circular(VALUE_INPUT_BORDER_RADIUS)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  if (!_isExpanded) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                  if (widget.onChange != null) {
                    widget.onChange!(_isExpanded);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.headingTitle.body16(
                            fontWeight: FontWeight.w700,
                            textColor: !_isExpanded
                                ? AppColors.COLOR_GREY_900
                                : AppColors.COLOR_BLUE_500),
                      ],
                    ),
                    Icon(_isExpanded
                        ? widget.expandedIcon
                        : widget.unExpandedIcon),
                  ],
                ),
              ),
              SizeTransition(
                sizeFactor: _expandAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSpacers.height12,
                    widget.expandedAreaWidget,
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
