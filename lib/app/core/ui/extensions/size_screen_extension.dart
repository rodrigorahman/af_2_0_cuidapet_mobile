import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeScreenExtenson on num {
  double get w => ScreenUtil().setWidth(this);
  double get h => ScreenUtil().setHeight(this);
  double get r => ScreenUtil().radius(this);
  double get sp => ScreenUtil().setSp(this);
  double get sw => ScreenUtil().screenWidth * this;
  double get sh => ScreenUtil().screenHeight * this;
  double get stausBarHeight => ScreenUtil().statusBarHeight * this;
}