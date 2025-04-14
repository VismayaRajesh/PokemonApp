import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pokemon_app/core/constants/app_color.dart';

import 'view_option_item.dart';

class ViewToggleButton extends StatefulWidget {
  final Function(bool isGrid) onViewChanged;
  final bool initialView;
  final BoxConstraints constraints;

  const ViewToggleButton({
    required this.onViewChanged,
    required this.initialView,
    required this.constraints,
  });

  @override
  State<ViewToggleButton> createState() => _ViewToggleButtonState();
}

class _ViewToggleButtonState extends State<ViewToggleButton>
    with SingleTickerProviderStateMixin {
  bool _showOptions = false;
  late bool _isGrid;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _isGrid = widget.initialView;
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleOptions() {
    if (_showOptions) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
    setState(() {
      _showOptions = !_showOptions;
    });
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
  }

  void _removeOverlay() {
    _animationController.reverse().then((value) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    var size = renderBox.size;

    double popupWidth = widget.constraints.maxWidth < 400 ? 120 : 150;

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx - popupWidth + size.width,
        top: offset.dy + size.height + 8,
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: popupWidth,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ViewOptionItem(
                    icon: LucideIcons.grid2x2,
                    label: 'Grid View',
                    isSelected: _isGrid,
                    onTap: () => _selectView(true),
                  ),
                  const Divider(height: 1),
                  ViewOptionItem(
                    icon: LucideIcons.list,
                    label: 'List View',
                    isSelected: !_isGrid,
                    onTap: () => _selectView(false),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectView(bool isGrid) {
    setState(() {
      _isGrid = isGrid;
    });
    _removeOverlay();
    widget.onViewChanged(isGrid);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleOptions,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          _isGrid ? LucideIcons.grid2x2 : LucideIcons.list,
          color: AppColors.white,
        ),
      ),
    );
  }
}
