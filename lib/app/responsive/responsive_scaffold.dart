import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import 'navigation_shell.dart';
import 'responsive_breakpoints.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    required this.currentIndex,
    required this.onSelect,
    required this.body,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onSelect;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final type = deviceTypeForWidth(MediaQuery.sizeOf(context).width);
    final isMobile = type == AppDeviceType.mobile;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (!isMobile)
              Padding(
                padding: const EdgeInsets.all(12),
                child: NavigationShell(
                  currentIndex: currentIndex,
                  onSelect: onSelect,
                ),
              ),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1280),
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.defaultPadding),
                    child: body,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: isMobile
          ? NavigationShell(currentIndex: currentIndex, onSelect: onSelect)
          : null,
    );
  }
}
