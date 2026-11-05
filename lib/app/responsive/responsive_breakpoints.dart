import '../../core/constants/app_constants.dart';

enum AppDeviceType { mobile, tablet, desktop }

AppDeviceType deviceTypeForWidth(double width) {
  if (width >= AppConstants.desktopBreakpoint) {
    return AppDeviceType.desktop;
  }
  if (width >= AppConstants.tabletBreakpoint) {
    return AppDeviceType.tablet;
  }
  return AppDeviceType.mobile;
}
