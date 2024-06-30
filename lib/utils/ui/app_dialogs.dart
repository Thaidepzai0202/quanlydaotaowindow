import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quanlydaotao/common/models/selectable_Item.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';

// _navigateBack(BuildContext context) => AppRouter.back(context, result: false);

class AppDialogs {
  // static hideLoadingCircle(BuildContext context) => _navigateBack(context);

  // static showRequestLoginDialog(BuildContext context, String message) =>
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       barrierColor: Colors.transparent,
  //       builder: (BuildContext context) => RequestLoginDialog(message: message),
  //     );

  // static Future<bool?> showToast(BuildContext context, String msg) =>
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       barrierColor: Colors.transparent,
  //       builder: (BuildContext context) {
  //         Future.delayed(
  //             Duration(seconds: 2), () => Navigator.pop(context, false));

  //         return WillPopScope(
  //           onWillPop: () async {
  //             Navigator.pop(context, true);
  //             return false;
  //           },
  //           child: IgnorePointer(
  //             child: Material(
  //               type: MaterialType.transparency,
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.max,
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   Chip(
  //                     label: Text(
  //                       msg,
  //                       style: TextStyle(color: Colors.white),
  //                     ),
  //                     backgroundColor: Colors.black.withOpacity(0.8),
  //                     labelPadding: const EdgeInsets.symmetric(
  //                       horizontal: 16,
  //                       vertical: 10,
  //                     ),
  //                   ),
  //                   SizedBox(height: 100),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     );

  // TL 23/12/2023: Sửa Fluttertoast thành Bottoast
  // static toast(
  //   String msg, {
  //   Color? color,
  //   //Toast toast = Toast.LENGTH_LONG,
  //   Color? textColor,
  // })
  // //ToastGravity gravity = ToastGravity.BOTTOM})
  // {
  //   BotToast.cleanAll();

  //   BotToast.showText(text: msg); //, contentColor: textColor?)
  //   // Fluttertoast.cancel();
  //   // Fluttertoast.showToast(
  //   //   msg: msg,
  //   //   backgroundColor: color ?? Colors.grey.shade600,
  //   //   textColor: textColor,
  //   //   gravity: gravity,
  //   //   toastLength: toast,
  //   // );
  // }

  // static showFileExistDialog(
  //         BuildContext context, FutureOr<void> onConfirm()) =>
  //     showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //         content: const Text(
  //           'Tệp đã tồn tại!\nBạn có muốn tiếp tục tải xuống không?',
  //           textAlign: TextAlign.center,
  //         ),
  //         actions: [
  //           TextButton(
  //               onPressed: () async => await onConfirm(),
  //               child: const Text(
  //                 'Tải xuống',
  //                 style: TextStyle(color: AppColors.primary),
  //               )),
  //           TextButton(
  //               onPressed: () {
  //                 AppRouter.back(context);
  //               },
  //               child: const Text(
  //                 'Hủy',
  //                 style: TextStyle(color: AppColors.red),
  //               ))
  //         ],
  //       ),
  //     );

  // static Future<void> showErrorDialog(BuildContext context, String msg,
  //         [void Function()? onAffirmativeBtnPressed]) =>
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       barrierColor: AppColors.dialogBarrier,
  //       builder: (_) => CustomDialog(
  //         isMessageDialog: true,
  //         icon: SvgPicture.asset(Images.ic_error_lock),
  //         description: msg,
  //         onAffirmativeBtnPressed:
  //             onAffirmativeBtnPressed ?? () => _navigateBack(context),
  //         onCancel: () => _navigateBack(context),
  //       ),
  //       routeSettings: RouteSettings(name: 'error', arguments: msg),
  //     );

  // static showRadioDialog<T>(
  //   BuildContext context, {
  //   required List<T> items,
  //   T? init,
  // }) async {
  //   T seletedValue = init ?? items[0];
  //   return showDialog<T>(
  //       context: context,
  //       builder: (_) {
  //         return AlertDialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           elevation: 4.0,
  //           contentPadding: EdgeInsets.zero,
  //           titlePadding: EdgeInsets.zero,
  //           insetPadding: const EdgeInsets.symmetric(horizontal: 15),
  //           content: StatefulBuilder(
  //             builder: (context, setState) {
  //               return Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 // padding: EdgeInsets.all(20),
  //                 children: items
  //                     .map(
  //                       (e) => RadioListTile<T>(
  //                         groupValue: seletedValue,
  //                         value: e,
  //                         selected: e == seletedValue,
  //                         contentPadding:
  //                             const EdgeInsets.symmetric(horizontal: 15),
  //                         dense: true,
  //                         onChanged: (_) {
  //                           setState(() {
  //                             seletedValue = e;
  //                           });
  //                         },
  //                         title: Text(
  //                           e.toString(),
  //                           style: AppTextStyles.regularW400(
  //                             context,
  //                             size: 16,
  //                             lineHeight: 22,
  //                           ),
  //                         ),
  //                       ),
  //                     )
  //                     .toList(),
  //               );
  //             },
  //           ),
  //           title: Container(
  //             decoration: BoxDecoration(
  //               color: context.theme.primaryColor,
  //               borderRadius: const BorderRadius.vertical(
  //                 top: Radius.circular(10),
  //               ),
  //             ),
  //             padding: const EdgeInsets.only(left: 15),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   'Cài đặt tin nhắn tự xóa',
  //                   style: AppTextStyles.regularW700(
  //                     context,
  //                     size: 18,
  //                     lineHeight: 21,
  //                     color: AppColors.white,
  //                   ),
  //                 ),
  //                 IconButton(
  //                   icon: SvgPicture.asset(
  //                     Images.ic_cancel,
  //                     color: AppColors.white,
  //                   ),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                 )
  //               ],
  //             ),
  //           ),
  //           actions: [
  //             TextButton(
  //               child: Text(
  //                 StringConst.cancel,
  //                 style: AppTextStyles.regularW700(
  //                   context,
  //                   size: 16,
  //                   lineHeight: 19.2,
  //                   color: context.theme.textColor,
  //                 ),
  //               ),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             TextButton(
  //               child: Text(
  //                 StringConst.confirm,
  //                 style: AppTextStyles.regularW700(
  //                   context,
  //                   size: 16,
  //                   lineHeight: 19.2,
  //                   color: context.theme.primaryColor,
  //                 ),
  //               ),
  //               onPressed: () {
  //                 Navigator.of(context).pop(seletedValue);
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }

  // static resolveFailedState(
  //   BuildContext context,
  //   String error, [
  //   VoidCallback? callback,
  // ]) =>
  //     showErrorDialog(context, error, () {
  //       _navigateBack(context);
  //       AppDialogs.hideLoadingCircle(context);
  //       callback?.call();
  //     });

  // static showLoadingCircle(
  //   BuildContext context, {
  //   bool barrierDismissible = false,
  //   RouteSettings? routeSettings,
  // }) =>
  //     showDialog(
  //       context: context,
  //       barrierDismissible: barrierDismissible,
  //       barrierColor: AppColors.dialogBarrier,
  //       builder: (_) => WillPopScope(
  //         onWillPop: () async => barrierDismissible,
  //         child: SizedBox.expand(
  //           child: Center(
  //             child: CircularProgressIndicator(color: AppColors.primary),
  //           ),
  //         ),
  //       ),
  //       routeSettings: routeSettings ?? RouteSettings(name: 'loading'),
  //     );

  // static showLoadingCircle(
  //   BuildContext context, {
  //   bool barrierDismissible = false,
  //   RouteSettings? routeSettings,
  // }) =>
  //     showDialog(
  //       context: context,
  //       barrierDismissible: barrierDismissible,
  //       barrierColor: AppColors.dialogBarrier,
  //       builder: (_) => Dialog(
  //           child: Container(
  //         padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             CupertinoActivityIndicator(
  //               color: context.theme.primaryColor,
  //               radius: 40,
  //             ),
  //             const SizedBox(
  //               height: 46,
  //             ),
  //             Text(
  //               'Vui lòng đợi trong giây lát!',
  //               textAlign: TextAlign.center,
  //               style: AppTextStyles.regularW700(context, size: 18),
  //             )
  //           ],
  //         ),
  //       )),
  //       routeSettings: routeSettings ?? const RouteSettings(name: 'loading'),
  //     );

  // static showChoicesDialog(
  //   BuildContext context, {
  //   required List<ChoiceDialogItem> choices,
  //   String? title,
  // }) {
  //   return showDialog(
  //     context: context,
  //     routeSettings: RouteSettings(
  //       name: 'DIALOG_CHOICES_${DateTime.now().millisecondsSinceEpoch}',
  //     ),
  //     builder: (context) {
  //       return Dialog(
  //         insetPadding: const EdgeInsets.symmetric(horizontal: 20),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         backgroundColor: context.theme.backgroundColor,
  //         child: ListView(
  //           physics: const ScrollPhysics(),
  //           children: [
  //             if (title != null)
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 20.0,
  //                   vertical: 12,
  //                 ),
  //                 child: Text(
  //                   title,
  //                   style: AppTextStyles.regularW500(
  //                     context,
  //                     size: 16,
  //                     lineHeight: 22,
  //                     color: context.theme.primaryColor,
  //                   ),
  //                 ),
  //               ),
  //             ...choices
  //           ],
  //           padding: const EdgeInsets.symmetric(vertical: 5),
  //           shrinkWrap: true,
  //         ),
  //       );
  //     },
  //   );
  // }

  // static showModalBottomSheetChoicesDialog(
  //   BuildContext context, {
  //   required List<ChoiceDialogItem> choices,
  //   Widget? title,
  // }) {
  //   return showModalBottomSheet(
  //     context: context,
  //     routeSettings: RouteSettings(
  //       name: 'BOTTOM_SHEET_${DateTime.now().millisecondsSinceEpoch}',
  //     ),
  //     barrierColor: AppColors.black.withOpacity(0.85),
  //     constraints: BoxConstraints(
  //       maxHeight: context.mediaQuerySize.height,
  //       minHeight: 0,
  //     ),
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (context) {
  //       return Column(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           if (title != null)
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //               child: title,
  //             ),
  //           choices.isNotEmpty
  //               ? Container(
  //                   margin:
  //                       const EdgeInsets.only(left: 15, right: 15, bottom: 25),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     color: context.theme.backgroundColor,
  //                   ),
  //                   child: GridView(
  //                     gridDelegate:
  //                         const SliverGridDelegateWithFixedCrossAxisCount(
  //                             crossAxisCount: 4, childAspectRatio: 4 / 3),
  //                     // physics: const ScrollPhysics(),
  //                     children: choices,
  //                     padding: const EdgeInsets.symmetric(vertical: 5),
  //                     shrinkWrap: true,
  //                   ),
  //                 )
  //               : Container(),
  //         ],
  //       );
  //     },
  //   );
  // }

  // static showWrongUserTypeAuthDialog(
  //   BuildContext context, {
  //   UserType? wrongUserType,
  //   required UserType rightUserType,
  // }) {
  //   return showDialog(
  //     context: context,
  //     builder: (_) {
  //       var theme = context.theme;
  //       var wrongUserTypeAuthDialogTextStyle =
  //           theme.wrongUserTypeAuthDialogTextStyle;
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         // titlePadding: const EdgeInsets.all(35).copyWith(bottom: 0),
  //         // title: Text(
  //         //   'Tài khoản không chính xác',
  //         //   style: AppTextStyles.regularW600(
  //         //     context,
  //         //     size: 20,
  //         //     lineHeight: 22,
  //         //   ),
  //         // ),
  //         contentPadding:
  //             const EdgeInsets.symmetric(horizontal: 20, vertical: 23)
  //                 .copyWith(top: 35),
  //         content: RichText(
  //           text: TextSpan(
  //             text:
  //                 'Tài khoản bạn đăng nhập được xác minh là tài khoản sử dụng cho ',
  //             style: wrongUserTypeAuthDialogTextStyle,
  //             children: [
  //               TextSpan(
  //                 text: rightUserType.type,
  //                 style: wrongUserTypeAuthDialogTextStyle.copyWith(
  //                   color: theme.primaryColor,
  //                   decoration: TextDecoration.underline,
  //                 ),
  //               ),
  //               const TextSpan(
  //                 text: '.\nBạn có muốn tiếp tục đăng nhập?',
  //               ),
  //             ],
  //           ),
  //         ),
  //         actionsPadding: const EdgeInsets.symmetric(
  //           horizontal: 20,
  //           vertical: 35,
  //         ).copyWith(
  //           top: 0,
  //         ),
  //         actionsAlignment: MainAxisAlignment.center,
  //         actionsOverflowButtonSpacing: 20,
  //         actions: [
  //           actionButton(
  //             context,
  //             OutlinedButton(
  //               child: const Text(StringConst.next),
  //               onPressed: () {
  //                 Navigator.of(context).pop(true);
  //               },
  //             ),
  //           ),
  //           actionButton(
  //             context,
  //             ElevatedButton(
  //               child: const Text(StringConst.no),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // static showWrongUserTypeAuthDialog2(
  //   BuildContext context, {
  //   required UserType wrongUserType,
  //   required UserType rightUserType,
  // }) {
  //   return showDialog(
  //     context: context,
  //     builder: (_) {
  //       var theme = context.theme;
  //       var wrongUserTypeAuthDialogTextStyle =
  //           theme.wrongUserTypeAuthDialogTextStyle;
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         contentPadding:
  //             const EdgeInsets.symmetric(horizontal: 20, vertical: 23)
  //                 .copyWith(top: 35),
  //         content: RichText(
  //           text: TextSpan(
  //             text:
  //                 'Tài khoản bạn đăng nhập được xác minh là tài khoản sử dụng cho ',
  //             style: wrongUserTypeAuthDialogTextStyle,
  //             children: [
  //               TextSpan(
  //                 text: rightUserType.type,
  //                 style: wrongUserTypeAuthDialogTextStyle.copyWith(
  //                   color: theme.primaryColor,
  //                   decoration: TextDecoration.underline,
  //                 ),
  //               ),
  //               const TextSpan(
  //                 text: '.\nBạn có muốn tiếp tục đăng nhập?',
  //               ),
  //             ],
  //           ),
  //         ),
  //         actionsPadding: const EdgeInsets.symmetric(
  //           horizontal: 20,
  //           vertical: 35,
  //         ).copyWith(
  //           top: 0,
  //         ),
  //         actionsAlignment: MainAxisAlignment.center,
  //         actionsOverflowButtonSpacing: 20,
  //         actions: [
  //           actionButton(
  //             context,
  //             OutlinedButton(
  //               child: Text(rightUserType.type),
  //               onPressed: () {
  //                 Navigator.of(context).pop(true);
  //               },
  //             ),
  //           ),
  //           actionButton(
  //             context,
  //             ElevatedButton(
  //               child: const Text(StringConst.no),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // static actionButton(
  //   BuildContext context,
  //   Widget child,
  // ) {
  //   return SizedBox(
  //     width: (context.mediaQuerySize.width - 30 * 2 - 20 - 40 * 2) / 2,
  //     child: child,
  //   );
  // }

  // static showReactionDetailDialog(
  //   BuildContext context, {
  //   int initIndex = 0,
  //   required Iterable<IUserInfo> users,
  //   required Map<Emoji, Emotion> reactions,
  // }) {
  //   var mapUsers =
  //       Map<int, IUserInfo>.fromIterable(users, key: (item) => item.id);

  //   var keys = reactions.keys.toList()
  //     ..removeWhere((e) => reactions[e]!.listUserId.isEmpty);

  //   logger.log(keys.length);

  //   initIndex = initIndex.clamp(0, keys.length - 1).toInt();

  //   return showDialog(
  //       context: context,
  //       builder: (_) {
  //         return Dialog(
  //           backgroundColor: Theme.of(context).colorScheme.background,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //           child: DefaultTabController(
  //             length: keys.length,
  //             initialIndex: initIndex,
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Container(
  //                   alignment: Alignment.centerLeft,
  //                   decoration: BoxDecoration(
  //                     color: context.theme.primaryColor,
  //                     borderRadius: const BorderRadius.vertical(
  //                       top: Radius.circular(15),
  //                       // right: Radius.circular(15),
  //                     ),
  //                   ),
  //                   padding: const EdgeInsets.symmetric(
  //                     horizontal: 20,
  //                     vertical: 10,
  //                   ),
  //                   child: Text(
  //                     'Biểu cảm',
  //                     style: AppTextStyles.regularW500(
  //                       context,
  //                       size: 20,
  //                       lineHeight: 22,
  //                       color: AppColors.white,
  //                     ),
  //                   ),
  //                 ),
  //                 Align(
  //                   alignment: Alignment.centerLeft,
  //                   child: TabBar(
  //                       isScrollable: true,
  //                       padding: EdgeInsets.zero,
  //                       indicatorPadding: EdgeInsets.zero,
  //                       labelPadding:
  //                           const EdgeInsets.symmetric(horizontal: 10),
  //                       indicatorColor: context.theme.primaryColor,
  //                       tabs: keys
  //                           .map(
  //                             (e) => Row(
  //                               children: [
  //                                 Image.asset(
  //                                   e.assetPath,
  //                                   height: 30,
  //                                   width: 30,
  //                                 ),
  //                                 const SizedBox(width: 5),
  //                                 Text(
  //                                   (reactions[e]?.listUserId.length ?? 0)
  //                                       .toString(),
  //                                   style: AppTextStyles.regularW400(
  //                                     context,
  //                                     size: 16,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           )
  //                           .toList()),
  //                 ),
  //                 Container(
  //                   height: context.mediaQuerySize.height / 2.5,
  //                   padding: const EdgeInsets.symmetric(
  //                       horizontal: 20, vertical: 10),
  //                   child: TabBarView(
  //                     children: keys
  //                         .map(
  //                           (e) => ListView.separated(
  //                             itemCount: reactions[e]?.listUserId.length ?? 0,
  //                             separatorBuilder: (_, __) =>
  //                                 const SizedBox(height: 10),
  //                             itemBuilder: (_, index) {
  //                               var user =
  //                                   mapUsers[reactions[e]?.listUserId[index]];
  //                               if (user == null) return const SizedBox();
  //                               return UserListTile(
  //                                 avatar: DisplayImageWithStatusBadge(
  //                                   isGroup: false,
  //                                   model: user,
  //                                   userStatus: user.userStatus,
  //                                 ),
  //                                 userName: user.name,
  //                               );
  //                             },
  //                           ),
  //                         )
  //                         .toList(),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  // static showReadMessageDialog(
  //   BuildContext context,
  //   Map<IUserInfo, DateTime> detail,
  // ) {
  //   Map<IUserInfo, DateTime> resMap = {};
  //   List mapKeys = detail.keys.toList(growable: false);
  //   mapKeys.sort((a, b) {
  //     if (detail[a] == null || detail[b] == null) return 0;
  //     return detail[b]!.compareTo(detail[a]!);
  //   });
  //   mapKeys.forEach((k1) {
  //     resMap[k1] = detail[k1]!;
  //   });
  //   var entries = resMap.entries;
  //   return showDialog(
  //     context: context,
  //     routeSettings: RouteSettings(
  //       name: GeneratorService.generateDialogRouteName(),
  //     ),
  //     builder: (_) => Dialog(
  //       backgroundColor: Theme.of(context).colorScheme.background,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Container(
  //             alignment: Alignment.centerLeft,
  //             decoration: BoxDecoration(
  //               color: context.theme.primaryColor,
  //               borderRadius: const BorderRadius.vertical(
  //                 top: Radius.circular(15),
  //                 // right: Radius.circular(15),
  //               ),
  //             ),
  //             padding: const EdgeInsets.symmetric(
  //               horizontal: 20,
  //               vertical: 10,
  //             ),
  //             child: Text(
  //               'Thành viên đã xem (${entries.length})',
  //               style: AppTextStyles.regularW500(
  //                 context,
  //                 size: 20,
  //                 lineHeight: 22,
  //                 color: AppColors.white,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             height: context.mediaQuerySize.height / 2.5,
  //             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //             child: ListView.separated(
  //               itemCount: detail.length,
  //               separatorBuilder: (_, __) => const SizedBox(height: 10),
  //               itemBuilder: (_, index) {
  //                 var entry = entries.elementAt(index);
  //                 var user = entry.key;
  //                 var time = entry.value;
  //                 return Row(
  //                   children: [
  //                     Expanded(
  //                       flex: 2,
  //                       child: UserListTile(
  //                         avatar: DisplayAvatar(
  //                           isGroup: false,
  //                           model: user,
  //                         ),
  //                         userName: user.name,
  //                       ),
  //                     ),
  //                     const SizedBox(width: 15),
  //                     Expanded(
  //                       flex: 1,
  //                       child: Text(time.diffWith(showSpecialTime: true)),
  //                     ),
  //                   ],
  //                 );
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // static showAppModalBottomSheet(
  //   BuildContext context, {
  //   required Widget child,
  //   String? title,
  // }) {
  //   return showModalBottomSheet(
  //     context: context,
  //     routeSettings: RouteSettings(
  //       name: 'MODAL_BOTTOM_SHEET_${DateTime.now().microsecondsSinceEpoch}',
  //     ),
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(15),
  //       ),
  //     ),
  //     backgroundColor: Theme.of(context).colorScheme.background,
  //     builder: (_) {
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           if (title != null)
  //             Container(
  //               padding: const EdgeInsets.only(
  //                 top: 15,
  //                 bottom: 10,
  //               ),
  //               alignment: Alignment.center,
  //               child: Text(
  //                 title,
  //                 style: AppTextStyles.mbsTitle(context),
  //               ),
  //             ),
  //           child,
  //           const SizedBox(height: 27),
  //         ],
  //       );
  //     },
  //   );
  // }

  // static Future<List<IUserInfo>?> showListUserDialog(
  //   BuildContext context,
  // ) {
  //   var selectedContact = [];
  //   return showDialog(
  //       context: context,
  //       routeSettings: RouteSettings(
  //         name: GeneratorService.generateDialogRouteName(),
  //       ),
  //       builder: (_) {
  //         return Dialog(
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //           insetPadding: EdgeInsets.symmetric(horizontal: 20),
  //           child: SingleChildScrollView(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 SizedBox(
  //                   height: context.mediaQuerySize.height / 1.5,
  //                   child: SelectContactView(
  //                     onChanged: (value) => selectedContact = value,
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.symmetric(vertical: 25),
  //                   child: RoundedButton(
  //                     label: 'Xong',
  //                     fillStyle: true,
  //                     padding:
  //                         EdgeInsets.symmetric(horizontal: 40, vertical: 10),
  //                     onPressed: () => AppRouter.back(
  //                       context,
  //                       result: selectedContact,
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  // static showLogoutDialog(
  //   BuildContext context,
  // ) {
  //   var buttonShape =
  //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));

  //   return showDialog(
  //     context: context,
  //     routeSettings: RouteSettings(
  //       name: GeneratorService.generateDialogRouteName(),
  //     ),
  //     builder: (_) => Dialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       insetPadding: const EdgeInsets.symmetric(horizontal: 20),
  //       child: Padding(
  //         padding: const EdgeInsets.all(30.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(bottom: 15.0),
  //               child: CircleAvatar(
  //                 radius: 45,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(15.0),
  //                   child: SvgPicture.asset(
  //                     Images.ic_log_out,
  //                     height: double.maxFinite,
  //                     width: double.maxFinite,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 12),
  //               child: Text(
  //                 'Đăng xuất',
  //                 style: AppTextStyles.regularW700(
  //                   context,
  //                   size: 18,
  //                   lineHeight: 21,
  //                   color: context.theme.primaryColor,
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(bottom: 30.0),
  //               child: Text(
  //                 'Bạn chắc chắn muốn đăng xuất?',
  //                 style: AppTextStyles.regularW400(
  //                   context,
  //                   size: 14,
  //                   lineHeight: 24,
  //                 ),
  //               ),
  //             ),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: SizedBox(
  //                     height: 40,
  //                     width: double.infinity,
  //                     child: OutlinedButton(
  //                       onPressed: () => AppRouter.back(context),
  //                       child: const Text(
  //                         'Hủy',
  //                       ),
  //                       style: OutlinedButton.styleFrom(
  //                         shape: buttonShape,
  //                         side: BorderSide(
  //                           color: context.theme.primaryColor,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 20),
  //                 Expanded(
  //                   child: SizedBox(
  //                     height: 40,
  //                     width: double.infinity,
  //                     child: ElevatedButton(
  //                       onPressed: () => SystemUtils.logout(context),
  //                       child: const Text(
  //                         'Đăng xuất',
  //                       ),
  //                       style: ElevatedButton.styleFrom(
  //                         shape: buttonShape,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static showLoginTimviec(
  //   BuildContext context, {
  //   required int idUser,
  //   required int? type365,
  //   required int? contactId,
  // }) {
  //   var buttonShape =
  //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));

  //   return showDialog(
  //     context: context,
  //     routeSettings: RouteSettings(
  //       name: GeneratorService.generateDialogRouteName(),
  //     ),
  //     builder: (_) => Dialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       insetPadding: const EdgeInsets.symmetric(horizontal: 20),
  //       child: Padding(
  //         padding: const EdgeInsets.all(30.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(bottom: 15.0),
  //               child: CircleAvatar(
  //                 radius: 45,
  //                 child: SvgPicture.asset(
  //                   Images.ic_question_bold,
  //                   height: double.maxFinite,
  //                   width: double.maxFinite,
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //                 padding: const EdgeInsets.symmetric(vertical: 12),
  //                 child: RichText(
  //                   text: TextSpan(
  //                     text:
  //                         'Bạn đang đăng nhập ứng dụng Chat365 bằng tài khoản ',
  //                     style: AppTextStyles.regularW400(
  //                       context,
  //                       size: 14,
  //                     ),
  //                     children: <TextSpan>[
  //                       TextSpan(
  //                         text: AuthRepo().userInfo?.email,
  //                         style: AppTextStyles.regularW400(
  //                           context,
  //                           color: AppColors.blueGradients1,
  //                           size: 14,
  //                         ),
  //                       ),
  //                       const TextSpan(text: ' trên Chat365.'),
  //                     ],
  //                   ),
  //                 )),
  //             Padding(
  //               padding: const EdgeInsets.only(bottom: 30.0),
  //               child: Text(
  //                 'Bạn có muốn đăng xuất và sử dụng tài khoản 456contrau@gmail.com trên Timviec365 hay không?',
  //                 style: AppTextStyles.regularW400(
  //                   context,
  //                   size: 14,
  //                 ),
  //               ),
  //             ),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: SizedBox(
  //                     height: 40,
  //                     width: double.infinity,
  //                     child: OutlinedButton(
  //                       onPressed: () {
  //                         navigatorKey.currentContext!
  //                             .read<ChatBloc>()
  //                             .tryToChatScreen(
  //                               userId: contactId,
  //                             );
  //                       },
  //                       child: Text(
  //                         'Hủy',
  //                         style: AppTextStyles.regularW400(
  //                           context,
  //                           size: 16,
  //                           color: AppColors.doveGray,
  //                         ),
  //                       ),
  //                       style: OutlinedButton.styleFrom(
  //                         shape: buttonShape,
  //                         side: const BorderSide(
  //                           color: AppColors.doveGray,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 20),
  //                 Expanded(
  //                   child: SizedBox(
  //                     height: 40,
  //                     width: double.infinity,
  //                     child: ElevatedButton(
  //                       onPressed: () async {
  //                         //không cần đăng xuất ra mà đăng nhập vào nick của người kia luôn
  //                         //await SystemUtils.logout(context);
  //                         await LoginCubit()
  //                             .getInfoQR(idUser.toString(), typeUser: type365);
  //                         navigatorKey.currentContext!
  //                             .read<ChatBloc>()
  //                             .tryToChatScreen(
  //                               userId: contactId,
  //                             );
  //                       },
  //                       child: Text(
  //                         'Đồng ý',
  //                         style: AppTextStyles.regularW400(
  //                           context,
  //                           size: 16,
  //                           color: AppColors.white,
  //                         ),
  //                       ),
  //                       style: ElevatedButton.styleFrom(
  //                         shape: buttonShape,
  //                         backgroundColor: AppColors.blueGradients1,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static showLoginDialog(
  //   BuildContext context,
  // ) {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     routeSettings: RouteSettings(
  //       name: GeneratorService.generateDialogRouteName(),
  //     ),
  //     builder: (_) => Dialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       backgroundColor: context.theme.backgroundColor,
  //       insetPadding: EdgeInsets.symmetric(horizontal: 20),
  //       child: Stack(
  //         children: [
  //           Positioned(
  //               top: 0,
  //               right: 0,
  //               child: MaterialButton(
  //                 minWidth: 40,
  //                 padding: EdgeInsets.zero,
  //                 shape: CircleBorder(),
  //                 onPressed: () => AppRouter.back(context),
  //                 child: Padding(
  //                   padding: AppPadding.paddingAll10,
  //                   child: Icon(
  //                     Icons.close,
  //                     color: context.theme.iconColor,
  //                   ),
  //                 ),
  //               )),
  //           Padding(
  //             padding: const EdgeInsets.all(30.0),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 SizedBoxExt.h10,
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 30.0),
  //                   child: Text(
  //                     'Bạn đã có tài khoản trên hệ thống. Xin vui lòng đăng nhập bằng tài khoản đó!',
  //                     textAlign: TextAlign.center,
  //                     style: AppTextStyles.regularW400(
  //                       context,
  //                       size: 16,
  //                       lineHeight: 24,
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 40,
  //                   child: ElevatedButton(
  //                     onPressed: () => AppRouterHelper.toAuthOptionPage(
  //                       context,
  //                       authMode: AuthMode.LOGIN,
  //                     ),
  //                     child: Text(
  //                       'Đăng nhập',
  //                       style: AppTextStyles.regularW700(context, size: 18)
  //                           .copyWith(
  //                         color: context.theme.backgroundColor,
  //                       ),
  //                     ),
  //                     style: context.theme.buttonStyle,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  /// Chi back ve man dang nhap
  // static showUpdatePasswordSuccessDialog(
  //   BuildContext context,
  // ) {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     routeSettings: RouteSettings(
  //       name: GeneratorService.generateDialogRouteName(),
  //     ),
  //     builder: (_) => Dialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       backgroundColor: context.theme.backgroundColor,
  //       insetPadding: EdgeInsets.symmetric(horizontal: 20),
  //       child: Padding(
  //         padding: const EdgeInsets.all(30.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             SizedBoxExt.h10,
  //             Padding(
  //               padding: const EdgeInsets.only(bottom: 30.0),
  //               child: Text(
  //                 'Chúc mừng bạn đã cập nhật mật khẩu thành công. Vui lòng đăng nhập lại!',
  //                 textAlign: TextAlign.center,
  //                 style: AppTextStyles.regularW400(
  //                   context,
  //                   size: 16,
  //                   lineHeight: 24,
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 40,
  //               child: ElevatedButton(
  //                 onPressed: () =>
  //                     AppRouter.backToPage(context, AppPages.Auth_Login),
  //                 child: Text(
  //                   'Về màn Đăng nhập',
  //                   style:
  //                       AppTextStyles.regularW700(context, size: 18).copyWith(
  //                     color: context.theme.backgroundColor,
  //                   ),
  //                 ),
  //                 style: context.theme.buttonStyle,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  ///Thay doi mat khau thanh cong
  // static showChangePasswordSuccessDialog(
  //   BuildContext context,
  //   VoidCallback onTapYes,
  // ) {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     routeSettings: RouteSettings(
  //       name: GeneratorService.generateDialogRouteName(),
  //     ),
  //     builder: (_) => Dialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       backgroundColor: context.theme.backgroundColor,
  //       insetPadding: EdgeInsets.symmetric(horizontal: 20),
  //       child: Padding(
  //         padding: const EdgeInsets.all(30.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             SizedBoxExt.h10,
  //             Text(
  //               'Chúc mừng bạn đã thay đổi mật khẩu thành công.',
  //               textAlign: TextAlign.center,
  //               style: AppTextStyles.regularW400(context,
  //                   size: 16,
  //                   lineHeight: 24,
  //                   color: context.theme.primaryColor),
  //             ),
  //             SizedBoxExt.h10,
  //             Padding(
  //               padding: const EdgeInsets.only(bottom: 30.0),
  //               child: Text(
  //                 'Bạn có muốn đăng xuất khỏi các thiết bị khác.',
  //                 textAlign: TextAlign.center,
  //                 style: AppTextStyles.regularW400(
  //                   context,
  //                   size: 16,
  //                   lineHeight: 24,
  //                 ),
  //               ),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 InkWell(
  //                   onTap: onTapYes,
  //                   borderRadius: BorderRadius.circular(15),
  //                   child: Container(
  //                     height: 40,
  //                     width: MediaQuery.of(context).size.width * 0.3,
  //                     alignment: Alignment.center,
  //                     decoration: BoxDecoration(
  //                         color: context.theme.backgroundFormFieldColor,
  //                         borderRadius: BorderRadius.circular(15),
  //                         border: Border.all(
  //                             color: context.theme.primaryColor, width: 2)),
  //                     child: Text(
  //                       'Có',
  //                       style: AppTextStyles.regularW700(context, size: 18)
  //                           .copyWith(
  //                         color: context.theme.primaryColor,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 InkWell(
  //                   onTap: () =>
  //                       AppRouter.backToPage(context, AppPages.Navigation),
  //                   borderRadius: BorderRadius.circular(15),
  //                   child: Container(
  //                     alignment: Alignment.center,
  //                     height: 40,
  //                     width: MediaQuery.of(context).size.width * 0.3,
  //                     decoration: BoxDecoration(
  //                         color: context.theme.primaryColor,
  //                         borderRadius: BorderRadius.circular(15),
  //                         border: Border.all(
  //                             color: context.theme.primaryColor, width: 2)),
  //                     child: Text(
  //                       'Không',
  //                       style: AppTextStyles.regularW700(context, size: 18)
  //                           .copyWith(
  //                         color: context.theme.backgroundFormFieldColor,
  //                       ),
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             // SizedBox(
  //             //   height: 40,
  //             //   child: ElevatedButton(
  //             //     onPressed: () {
  //             //       AppRouter.back(context);
  //             //       AppRouter.back(context);
  //             //     },
  //             //     child: Text(
  //             //       'Trở về hồ sơ Chat 365',
  //             //       style: AppTextStyles.regularW700(context, size: 18).copyWith(
  //             //         color: context.theme.backgroundColor,
  //             //       ),
  //             //     ),
  //             //     style: context.theme.buttonStyle,
  //             //   ),
  //             // ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

//   ///Phan hien noi dung va chuc nang button
  // static showMessConfirm(
  //   BuildContext context,
  //   String companyName,
  // ) {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     routeSettings: RouteSettings(
  //       name: GeneratorService.generateDialogRouteName(),
  //     ),
  //     builder: (_) => Dialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       backgroundColor: context.theme.backgroundColor,
  //       insetPadding: const EdgeInsets.symmetric(horizontal: 20),
  //       child: Padding(
  //         padding: const EdgeInsets.all(20.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(bottom: 30.0),
  //               child: RichText(
  //                 textAlign: TextAlign.center,
  //                 text: TextSpan(
  //                   style: AppTextStyles.regularW400(
  //                     context,
  //                     size: 16,
  //                     lineHeight: 24,
  //                   ),
  //                   children: <TextSpan>[
  //                     const TextSpan(
  //                       text: 'Vui lòng chờ ',
  //                     ),
  //                     TextSpan(
  //                       text: '$companyName ',
  //                       style: AppTextStyles.regularW500(
  //                         context,
  //                         size: 16,
  //                         lineHeight: 24,
  //                       ),
  //                     ),
  //                     const TextSpan(
  //                       text:
  //                           'duyệt để có thể sử dụng dịch vụ! Nếu thời gian chờ duyệt diễn ra quá lâu, bạn hãy liên hệ bộ phận Nhân sự của Công ty để được hỗ trợ duyệt tài khoản sớm nhất!',
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 40,
  //               child: ElevatedButton(
  //                 onPressed: () => AppRouter.replaceAllWithPage(
  //                     context, AppPages.ChoosePosition,
  //                     arguments: {
  //                       // InPutLogIn.userTypeArg: UserType.staff,
  //                       // InPutLogIn.authMode: AuthMode.LOGIN,
  //                     }),
  //                 child: Text(
  //                   'Quay lại',
  //                   style:
  //                       AppTextStyles.regularW700(context, size: 18).copyWith(
  //                     color: context.theme.backgroundColor,
  //                   ),
  //                 ),
  //                 style: context.theme.buttonStyle,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

//   static showAlternateLoginOptions(
//       BuildContext context, int type, Function callback) {
//     String getAccountTypeString(int type) {
//       if (type == 0) {
//         return "Cá nhân";
//       } else if (type == 1) {
//         return "Công ty";
//       } else {
//         return "Nhân viên";
//       }
//     }

//     return showDialog(
//       context: context,
//       barrierDismissible: true,
//       routeSettings: RouteSettings(
//         name: GeneratorService.generateDialogRouteName(),
//       ),
//       builder: (_) => Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         backgroundColor: context.theme.backgroundColor,
//         insetPadding: EdgeInsets.symmetric(horizontal: 20),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 30.0),
//                 child: RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     style: AppTextStyles.regularW400(
//                       context,
//                       size: 16,
//                       lineHeight: 24,
//                     ),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: 'Tài khoản bạn đang đăng nhập là tài khoản ',
//                       ),
//                       TextSpan(
//                         text: "${getAccountTypeString(type)}.",
//                         style: AppTextStyles.regularW500(
//                           context,
//                           size: 16,
//                           lineHeight: 24,
//                         ),
//                       ),
//                       TextSpan(
//                         text:
//                             'Bạn có muốn tiếp tục đăng nhập với loại tài khoản này?',
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                   height: 40,
//                   child: Row(
//                     children: [
//                       ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: Text(
//                           'Quay lại',
//                           style: AppTextStyles.regularW700(context, size: 18)
//                               .copyWith(
//                             color: context.theme.backgroundColor,
//                           ),
//                         ),
//                         style: context.theme.buttonStyle,
//                       ),
//                       SizedBox(width: 16),
//                       ElevatedButton(
//                         onPressed: () => callback(),
//                         child: Text(
//                           'Tiếp tục',
//                           style: AppTextStyles.regularW700(context, size: 18)
//                               .copyWith(
//                             color: context.theme.backgroundColor,
//                           ),
//                         ),
//                         style: context.theme.buttonStyle,
//                       ),
//                     ],
//                     mainAxisSize: MainAxisSize.min,
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  // static showAlternateLoginOptions(
  //     BuildContext context, int type, Function callback) {
  //   String getAccountTypeString(int type) {
  //     if (type == 0) {
  //       return "Cá nhân";
  //     } else if (type == 1) {
  //       return "Công ty";
  //     } else {
  //       return "Nhân viên";
  //     }
  //   }

  //   return showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     routeSettings: RouteSettings(
  //       name: GeneratorService.generateDialogRouteName(),
  //     ),
  //     builder: (_) => Dialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       backgroundColor: context.theme.backgroundColor,
  //       insetPadding: const EdgeInsets.symmetric(horizontal: 20),
  //       child: Padding(
  //         padding: const EdgeInsets.all(20.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(bottom: 30.0),
  //               child: RichText(
  //                 textAlign: TextAlign.center,
  //                 text: TextSpan(
  //                   style: AppTextStyles.regularW400(
  //                     context,
  //                     size: 16,
  //                     lineHeight: 24,
  //                   ),
  //                   children: <TextSpan>[
  //                     const TextSpan(
  //                       text: 'Tài khoản bạn đang đăng nhập là tài khoản ',
  //                     ),
  //                     TextSpan(
  //                       text: "${getAccountTypeString(type)}.",
  //                       style: AppTextStyles.regularW500(
  //                         context,
  //                         size: 16,
  //                         lineHeight: 24,
  //                       ),
  //                     ),
  //                     const TextSpan(
  //                       text:
  //                           'Bạn có muốn tiếp tục đăng nhập với loại tài khoản này?',
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //                 height: 40,
  //                 child: Row(
  //                   children: [
  //                     ElevatedButton(
  //                       onPressed: () => Navigator.pop(context),
  //                       child: Text(
  //                         'Quay lại',
  //                         style: AppTextStyles.regularW700(context, size: 18)
  //                             .copyWith(
  //                           color: context.theme.backgroundColor,
  //                         ),
  //                       ),
  //                       style: context.theme.buttonStyle,
  //                     ),
  //                     const SizedBox(width: 16),
  //                     ElevatedButton(
  //                       onPressed: () => callback(),
  //                       child: Text(
  //                         'Tiếp tục',
  //                         style: AppTextStyles.regularW700(context, size: 18)
  //                             .copyWith(
  //                           color: context.theme.backgroundColor,
  //                         ),
  //                       ),
  //                       style: context.theme.buttonStyle,
  //                     ),
  //                   ],
  //                   mainAxisSize: MainAxisSize.min,
  //                 )),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static Future<dynamic> showListDialog({
    required BuildContext context,
    required List<SelectableItem> list,
    required SelectableItem? value,
  }) async {
    FocusScope.of(context).unfocus();
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user can tap out side
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          backgroundColor: AppColors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),

          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 2.8,
            ),
            child: SingleChildScrollView(
              child: RawScrollbar(
                // thumbVisibility: true,
                child: ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: <Widget>[
                    if (list.isEmpty)
                      Container(
                        padding: EdgeInsets.all(15),
                        child: const SizedBox(
                          height: 14,
                        ),
                      ),
                    for (SelectableItem item in list)
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(item);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          color: value != null
                              ? value.id == item.id
                                  ? AppColors.primaryHust.withOpacity(1)
                                  : AppColors.white
                              : AppColors.white,
                          child: Text(
                            item.name,
                            style: value != null
                                ? value.id == item.id
                                    ? TextStyle(
                                        color: AppColors.white)
                                    : const TextStyle()
                                : const TextStyle(),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),

          // actionsPadding: EdgeInsets.zero,
          // buttonPadding: EdgeInsets.zero,
          // actions: <Widget>[
          //   SizedBox(
          //     height: 6,
          //   )
          // ],
        );
      },
    );
  }

  // static showSendLocationDialog(
  //   BuildContext context,
  //   Widget child, {
  //   bool isCurrentLocation = false,
  //   required IUserInfo recieveInfo,
  //   required VoidCallback onSend,
  // }) =>
  //     showDialog(
  //         context: context,
  //         builder: (_) {
  //           return AlertDialog(
  //             title: Text(
  //               'Gửi vị trí ${isCurrentLocation ? 'hiện tại' : 'này'} cho ${recieveInfo.name} ?',
  //               maxLines: 2,
  //               style: AppTextStyles.regularW500(
  //                 context,
  //                 size: 18,
  //                 lineHeight: 20,
  //               ),
  //             ),
  //             content: child,
  //             actions: [
  //               TextButton(
  //                 child: Text(
  //                   'HỦY',
  //                   style: AppTextStyles.regularW500(
  //                     context,
  //                     size: 16,
  //                     lineHeight: 18,
  //                     color: context.theme.textColor,
  //                   ),
  //                 ),
  //                 onPressed: () => Navigator.pop(context),
  //               ),
  //               TextButton(
  //                 child: Text(
  //                   'GỬI',
  //                   style: AppTextStyles.regularW500(
  //                     context,
  //                     size: 16,
  //                     lineHeight: 18,
  //                     color: context.theme.primaryColor,
  //                   ),
  //                 ),
  //                 onPressed: onSend,
  //               ),
  //             ],
  //           );
  //         });

  // // static showDetailInfo(
  // //   BuildContext context, {
  // //   required UserType type,
  // //   required Future<DetailModel?> Function() detailModel,
  // // }) =>
  // //     showDialog(
  // //       context: context,
  // //       builder: (BuildContext context) => Dialog(
  // //         child: FutureBuilder<DetailModel?>(
  // //             future: detailModel(),
  // //             builder: (context, snapshot) {
  // //               if (snapshot.connectionState == ConnectionState.waiting)
  // //                 return WidgetUtils.loadingCircle(context);
  // //               if (snapshot.hasError || snapshot.data == null) {
  // //                 return Padding(
  // //                   padding: const EdgeInsets.all(8.0),
  // //                   child: Column(
  // //                     mainAxisSize: MainAxisSize.min,
  // //                     mainAxisAlignment: MainAxisAlignment.center,
  // //                     children: [
  // //                       Image.asset(
  // //                         Images.img_thinkingFace,
  // //                       ),
  // //                       Text(snapshot.error?.toString() ?? 'Đã có lỗi xảy ra'),
  // //                     ],
  // //                   ),
  // //                 );
  // //               }
  // //               return DetailInfo(
  // //                 detailInfo: snapshot.data!,
  // //                 type: type,
  // //               );
  // //             }),
  // //       ),
  // //     );

  // static showFunctionLockDialog(
  //   BuildContext context, {
  //   required String title,
  // }) =>
  //     showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (_) {
  //           return AlertDialog(
  //             title: Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 SvgPicture.asset(Images.ic_error_lock),
  //                 SizedBoxExt.w15,
  //                 Expanded(
  //                   child: Text(
  //                     title,
  //                     maxLines: 5,
  //                     style: AppTextStyles.regularW400(
  //                       context,
  //                       size: 14,
  //                       lineHeight: 20,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             actions: [
  //               TextButton(
  //                 child: Text(
  //                   'Đóng',
  //                   style: AppTextStyles.regularW400(
  //                     context,
  //                     size: 14,
  //                     lineHeight: 18,
  //                     color: context.theme.primaryColor,
  //                   ),
  //                 ),
  //                 onPressed: () => Navigator.pop(context),
  //               ),
  //             ],
  //           );
  //         });

  // static showDialogOke(
  //   BuildContext context, {
  //   required String title,
  //   required String detail,
  // }) =>
  //     showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (_) {
  //           return AlertDialog(
  //             title: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   title,
  //                   style: AppTextStyles.regularW500(context, size: 16),
  //                 ),
  //                 SizedBoxExt.h10,
  //                 const Divider(
  //                   color: AppColors.grayDCDCDC,
  //                   height: 2,
  //                 ),
  //                 SizedBoxExt.h10,
  //                 Text(
  //                   detail,
  //                   maxLines: 5,
  //                   style: AppTextStyles.regularW400(
  //                     context,
  //                     size: 14,
  //                     lineHeight: 20,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             actions: [
  //               TextButton(
  //                 child: Text(
  //                   'ĐÓNG',
  //                   style: AppTextStyles.regularW400(
  //                     context,
  //                     size: 14,
  //                     lineHeight: 18,
  //                     color: context.theme.primaryColor,
  //                   ),
  //                 ),
  //                 onPressed: () => Navigator.pop(context),
  //               ),
  //             ],
  //           );
  //         });

  // static Future<bool> showRequestExternalManageStorage(
  //     BuildContext context) async {
  //   return await showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: const Text('Allow Chat365 to access to manage all files ?'),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       actions: [
  //         TextButton(
  //           child: const Text('ALLOW'),
  //           onPressed: () => Navigator.pop(context, true),
  //         ),
  //         TextButton(
  //           child: const Text('DENY'),
  //           onPressed: () => Navigator.pop(context, false),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // static showDialogCall(BuildContext context, void Function()? onPressed) {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     routeSettings: RouteSettings(
  //       name: GeneratorService.generateDialogRouteName(),
  //     ),
  //     builder: (_) => Dialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       backgroundColor: context.theme.backgroundColor,
  //       insetPadding: const EdgeInsets.symmetric(horizontal: 20),
  //       child: Padding(
  //         padding: const EdgeInsets.all(20.0),
  //         child: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             ElevatedButton(
  //               onPressed: () => AppRouter.back(context),
  //               child: Text(
  //                 'Quay lại',
  //                 style: AppTextStyles.regularW700(context, size: 18).copyWith(
  //                   color: context.theme.backgroundColor,
  //                 ),
  //               ),
  //               style: context.theme.buttonStyle,
  //             ),
  //             ElevatedButton(
  //               onPressed: onPressed,
  //               child: Text(
  //                 'Chấp nhận',
  //                 style: AppTextStyles.regularW700(context, size: 18).copyWith(
  //                   color: context.theme.backgroundColor,
  //                 ),
  //               ),
  //               style: context.theme.buttonStyle,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static openWifiDialog(BuildContext context) => showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Bạn đang offline'),
  //         content: Text('Bật dữ liệu di động hoặc wifi để tiếp tục ?'),
  //         actions: [
  //           // TextButton(
  //           //   child: Text(
  //           //     'Cài đặt',
  //           //   ),
  //           //   onPressed: () async {
  //           //     Navigator.of(context).pop();
  //           //     await AppSettings.openWIFISettings();
  //           //   },
  //           // ),
  //           TextButton(
  //             child: Text(
  //               'Hủy',
  //             ),
  //             onPressed: () => Navigator.of(context).pop(),
  //           ),
  //         ],
  //       ),
  //     );

  // static showAttendanceDialog(
  //   BuildContext context, {
  //   required String title,
  //   required VoidCallback function,
  //   required VoidCallback cancelF,
  // }) =>
  //     showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (_) {
  //           return AlertDialog(
  //             title: Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 SvgPicture.asset(Images.ic_error_lock),
  //                 SizedBoxExt.w15,
  //                 Expanded(
  //                   child: Text(
  //                     title,
  //                     maxLines: 5,
  //                     style: AppTextStyles.regularW400(
  //                       context,
  //                       size: 14,
  //                       lineHeight: 20,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             actions: [
  //               TextButton(
  //                 child: Text(
  //                   'Tiếp tục',
  //                   style: AppTextStyles.regularW400(
  //                     context,
  //                     size: 14,
  //                     lineHeight: 18,
  //                     color: context.theme.primaryColor,
  //                   ),
  //                 ),
  //                 onPressed: function,
  //               ),
  //               TextButton(
  //                 child: Text(
  //                   'Huỷ',
  //                   style: AppTextStyles.regularW400(
  //                     context,
  //                     size: 14,
  //                     lineHeight: 18,
  //                     color: context.theme.primaryColor,
  //                   ),
  //                 ),
  //                 onPressed: cancelF,
  //               ),
  //             ],
  //           );
  //         });

  // // text field dialog
  // static showTextFieldDialog(
  //   BuildContext context, {
  //   required String title,
  //   required VoidCallback function,
  //   required VoidCallback cancelF,
  //   required TextEditingController controller,
  // }) =>
  //     showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (_) {
  //           return AlertDialog(
  //             title: Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 // SvgPicture.asset(Images.ic_error_lock),
  //                 // SizedBoxExt.w15,
  //                 Expanded(
  //                   child: Text(
  //                     title,
  //                     maxLines: 5,
  //                     style: AppTextStyles.regularW400(
  //                       context,
  //                       size: 18,
  //                       lineHeight: 20,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             content: TextField(
  //               // controller: controller,
  //               //  widget.userInfo.name,
  //               // maxLines: 2,
  //               textAlign: TextAlign.center,

  //               style: AppTextStyles.nameCustomerProfileChat(context),
  //               decoration: InputDecoration(
  //                   contentPadding: const EdgeInsets.only(bottom: 5),
  //                   isCollapsed: true,
  //                   isDense: true,
  //                   enabledBorder: const UnderlineInputBorder(
  //                       borderSide: BorderSide(color: AppColors.black)),
  //                   disabledBorder: InputBorder.none,
  //                   border: InputBorder.none,
  //                   focusedBorder: const UnderlineInputBorder(
  //                       borderSide: BorderSide(color: AppColors.black)),
  //                   labelStyle: new TextStyle(color: const Color(0xFF424242)),
  //                   hintText: "Tên nhóm"),
  //             ),
  //             actions: [
  //               TextButton(
  //                 child: Text(
  //                   'Lưu',
  //                   style: AppTextStyles.regularW400(
  //                     context,
  //                     size: 14,
  //                     lineHeight: 18,
  //                     color: context.theme.primaryColor,
  //                   ),
  //                 ),
  //                 onPressed: function,
  //               ),
  //               TextButton(
  //                 child: Text(
  //                   'Huỷ',
  //                   style: AppTextStyles.regularW400(
  //                     context,
  //                     size: 14,
  //                     lineHeight: 18,
  //                     color: context.theme.primaryColor,
  //                   ),
  //                 ),
  //                 onPressed: cancelF,
  //               ),
  //             ],
  //           );
  //         });

//   static showUpdateDialog( BuildContext context,{
//     required VersionStatus versionStatus,
// }){
//    return UpdateDialog(actions: actions, allowDismissal: allowDismissal, dialogTextWidget: dialogTextWidget, dialogTitleWidget: dialogTitleWidget);
//   }
//   static showApplyDialogFailure(BuildContext context, String title) {
//     return showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset(
//                     Images.img_error,
//                     width: 92,
//                     height: 92,
//                   ),
//                   SizedBox(
//                     height: 9,
//                   ),
//                   Text(
//                     'Ứng tuyển thất bại',
//                     style: AppTextStyles.regularW700(
//                       context,
//                       size: 16,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(
//                     height: 9,
//                   ),
//                   Text(
//                     title,
//                     style: AppTextStyles.regularW400(
//                       context,
//                       size: 13,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(
//                     height: 9,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       AppRouter.backToPage(context, AppPages.Navigation);
//                     },
//                     child: Container(
//                       width: 115,
//                       height: 37,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(colors: [
//                           AppColors.primary,
//                           AppColors.indigo2,
//                         ]),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: Center(
//                           child: Text(
//                         'OK',
//                         style: AppTextStyles.regularW500(context,
//                             size: 14, color: AppColors.white),
//                       )),
//                     ),
//                   ),
//                 ],
//               ),
//             ));
//   }

  // static showApplyDialogSuccess(
  //   BuildContext context,
  // ) {
  //   return showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Image.asset(
  //                   Images.img_success,
  //                   width: 92,
  //                   height: 92,
  //                 ),
  //                 const SizedBox(
  //                   height: 9,
  //                 ),
  //                 Text(
  //                   'Ứng tuyển thành công',
  //                   style: AppTextStyles.regularW700(
  //                     context,
  //                     size: 16,
  //                   ),
  //                   textAlign: TextAlign.center,
  //                 ),
  //                 const SizedBox(
  //                   height: 9,
  //                 ),
  //                 InkWell(
  //                   onTap: () {
  //                     AppRouter.back(context);
  //                     AppRouter.back(context);
  //                   },
  //                   child: Container(
  //                     width: 115,
  //                     height: 37,
  //                     decoration: BoxDecoration(
  //                       gradient: const LinearGradient(colors: [
  //                         AppColors.primary,
  //                         AppColors.indigo2,
  //                       ]),
  //                       borderRadius: BorderRadius.circular(30),
  //                     ),
  //                     child: Center(
  //                         child: Text(
  //                       'OK',
  //                       style: AppTextStyles.regularW500(context,
  //                           size: 14, color: AppColors.white),
  //                     )),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ));
  // }

  // static showApplyDialog(BuildContext context, String title, FutureOr onTap(),
  //     {bool? qrApplyPage = false}) {
  //   return showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text(
  //             'Xác nhận',
  //             style: AppTextStyles.regularW600(
  //               context,
  //               size: 20,
  //             ),
  //             textAlign: TextAlign.center,
  //           ),
  //           SizedBox(
  //             height: 9,
  //           ),
  //           RichText(
  //             text: TextSpan(
  //                 text: 'Bạn muốn ứng tuyển tin tuyển dụng ',
  //                 children: [
  //                   TextSpan(
  //                       text: title,
  //                       style: AppTextStyles.regularW400(context,
  //                           size: 15, color: AppColors.primary)),
  //                   TextSpan(
  //                       text: ' ?',
  //                       style: AppTextStyles.regularW700(context, size: 15)),
  //                 ],
  //                 style: AppTextStyles.regularW400(
  //                   context,
  //                   size: 15,
  //                 )),
  //             textAlign: TextAlign.center,
  //           ),
  //           SizedBox(
  //             height: 9,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Expanded(
  //                 child: InkWell(
  //                   onTap: () {
  //                     if (qrApplyPage == true) {
  //                       AppRouter.back(context);
  //                     } else {
  //                       AppRouter.backToPage(context, AppPages.Navigation);
  //                     }
  //                   },
  //                   child: Container(
  //                     // width: 130,
  //                     height: 37,
  //                     decoration: BoxDecoration(
  //                       color: AppColors.greyCACA,
  //                       borderRadius: BorderRadius.circular(30),
  //                     ),
  //                     child: Center(
  //                         child: Text(
  //                       'Huỷ',
  //                       style: AppTextStyles.regularW500(context,
  //                           size: 14, color: AppColors.black),
  //                     )),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: 20,
  //               ),
  //               Expanded(
  //                 child: InkWell(
  //                   onTap: () async {
  //                     await onTap();
  //                   },
  //                   child: Container(
  //                     // width: 130,
  //                     height: 37,
  //                     decoration: BoxDecoration(
  //                       gradient: LinearGradient(colors: [
  //                         AppColors.primary,
  //                         Color(0xFF737FDD),
  //                       ]),
  //                       borderRadius: BorderRadius.circular(30),
  //                     ),
  //                     child: Center(
  //                         child: Text(
  //                       'Ứng tuyển',
  //                       style: AppTextStyles.regularW500(context,
  //                           size: 14, color: AppColors.white),
  //                     )),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // static showUpdateInfoCandidateToApply(BuildContext context, String title,
  //     {bool? isQr = false}) async {
  //   textStyleCustom({bool? isTitle = false}) {
  //     return TextStyle(
  //         fontWeight: FontWeight.w500,
  //         fontSize: 15,
  //         height: 1.35,
  //         color: isTitle == true ? Color(0xff4C5BD4) : AppColors.tundora);
  //   }
  //
  //   return await showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
  //       insetPadding: EdgeInsets.symmetric(horizontal: 10),
  //       content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               mainAxisSize: MainAxisSize.min,
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   width: AppDimens.width * .8,
  //                   child: RichText(
  //                       text: TextSpan(
  //                           text: 'Để ứng tuyển ',
  //                           style: textStyleCustom(),
  //                           children: [
  //                         TextSpan(
  //                           text: title,
  //                           children: [
  //                             TextSpan(
  //                               text:
  //                                   ' bạn cần hoàn thiện hồ sơ bằng 1 trong 2 cách sau',
  //                               style: textStyleCustom(),
  //                             )
  //                           ],
  //                           style: textStyleCustom(isTitle: true),
  //                         ),
  //                       ])),
  //                 ),
  //                 InkWell(
  //                   splashFactory: NoSplash.splashFactory,
  //                   onTap: () {
  //                     if (isQr == true) {
  //                       AppRouter.back(context);
  //                       AppRouter.back(context);
  //                       AppRouter.back(context);
  //                     } else {
  //                       AppRouter.back(context);
  //                     }
  //                   },
  //                   child: Container(
  //                       decoration: BoxDecoration(
  //                           color: Color(0xffEBEBEB),
  //                           borderRadius: BorderRadius.circular(15)),
  //                       child: Icon(Icons.close, size: 17.8)),
  //                 )
  //               ],
  //             ),
  //             SizedBox(height: 20),
  //             Divider(thickness: 1),
  //             SizedBox(height: 24),
  //             Row(
  //               children: [
  //                 Text('Cách 1',
  //                     style: TextStyle(
  //                         color: Color(0xff666666),
  //                         fontWeight: FontWeight.w400,
  //                         fontSize: 14,
  //                         fontStyle: FontStyle.italic)),
  //                 Expanded(
  //                   child: Container(
  //                     margin: EdgeInsets.only(left: 12),
  //                     padding:
  //                         EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //                     decoration: BoxDecoration(
  //                         color: Color(0xffEDF8FF),
  //                         borderRadius: BorderRadius.circular(3)),
  //                     child: WidgetWorkItem.ItemBottomSheet(
  //                       title: 'Tải CV từ điện thoại của bạn',
  //                       svg: Images.ic_cv,
  //                       color: Colors.orangeAccent,
  //                       callback: () {
  //                         if (dataInfo.value?.id != '-1') {
  //                           AppRouter.toPage(
  //                               context, AppPages.DownloadCv_Screen);
  //                         }
  //                       },
  //                       isCvOrVideos: true,
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             SizedBox(height: 16),
  //             Row(
  //               children: [
  //                 Text('Cách 2',
  //                     style: TextStyle(
  //                         color: Color(0xff666666),
  //                         fontWeight: FontWeight.w400,
  //                         fontSize: 14,
  //                         fontStyle: FontStyle.italic)),
  //                 Expanded(
  //                   child: Container(
  //                     margin: EdgeInsets.only(left: 12),
  //                     padding:
  //                         EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //                     decoration: BoxDecoration(
  //                         color: Color(0xffEDF8FF),
  //                         borderRadius: BorderRadius.circular(3)),
  //                     child: WidgetWorkItem.ItemBottomSheet(
  //                         title: 'Tải video giới thiệu',
  //                         svg: Images.ic_video2,
  //                         color: Colors.redAccent,
  //                         callback: () {
  //                           if (dataInfo.value?.id != '-1') {
  //                             AppRouter.toPage(
  //                                 context, AppPages.Download_Video_Screen);
  //                           }
  //                         }),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ]),
  //     ),
  //   );
  // }
  //
  // static showChoiceAccountApplyDialog(BuildContext context,
  //     {required List<AccountPermissionModel> accounts,
  //     required String news_id,
  //     required String device_id,
  //     required String title,
  //     HomeQRCodeBloc? homeQRCodeBloc}) async {
  //   return await showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (_) => ChooseAccountDialog(
  //         accounts: accounts,
  //         news_id: news_id,
  //         device_id: device_id,
  //         homeQRCodeBloc: homeQRCodeBloc,
  //         title: title),
  //   );
  // }

  // static showDeleteMsgDialog(BuildContext context,
  //     {required FutureOr onConfirm()}) async {
  //   return await showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           SvgPicture.asset(
  //             Images.ic_question_bold,
  //             width: 56,
  //             height: 56,
  //           ),
  //           const SizedBox(
  //             height: 8,
  //           ),
  //           Text(
  //             'Bạn có muốn xóa tin nhắn này?',
  //             style: AppTextStyles.regularW700(context, size: 15),
  //           ),
  //           const SizedBox(
  //             height: 8,
  //           ),
  //           Text(
  //             'Tin nhắn này chỉ được xóa ở phía bạn',
  //             style: AppTextStyles.regularW400(context, size: 13),
  //           ),
  //         ],
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => AppRouter.back(_),
  //           child: Text(
  //             'Hủy',
  //             style: AppTextStyles.regularW400(context, size: 16),
  //           ),
  //         ),
  //         TextButton(
  //             onPressed: () async => await onConfirm(),
  //             child: Text(
  //               'Xóa',
  //               style: AppTextStyles.regularW400(context,
  //                   size: 16, color: AppColors.red),
  //             )),
  //       ],
  //     ),
  //   );
  // }

// static showFlashMessage(BuildContext context) async {
//   await context.read<ChatQuickMessageCubit>()
//     ..getListFastMessage();
//
//   return showAppModalBottomSheet(
//     context,
//     child: Container(
//       color: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15), topRight: Radius.circular(15))),
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.only(top: 15, right: 18),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width / 3),
//                     child: Text(
//                       'Tin nhắn nhanh',
//                       style: TextStyle(
//                           color: Color(0xFF4C5BD4),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           height: 1.2),
//                     ),
//                   ),
//                   InkWell(
//                       onTap: () {
//                         AppRouter.toPage(
//                             context, AppPages.List_Quick_Message);
//                       },
//                       child: SvgPicture.asset(Images.list_flash_message))
//                 ],
//               ),
//             ),
//             Container(
//               constraints: BoxConstraints(
//                   maxHeight: (MediaQuery.of(context).size.height / 3) - 53),
//               child: BlocBuilder<ChatQuickMessageCubit,
//                   ChatQuickMessageCubitState>(
//                 builder: (context, state) {
//                   if (state is ChatQuickMessageCubitInitial) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else if (state is ChatQuickMessageLoadedListState) {
//                     return state.quickMessage.length == 0
//                         ? Container(
//                             child: Text(
//                               'Bạn chưa có tin nhắn nhanh nào!',
//                               style: TextStyle(fontSize: 14, height: 1.3),
//                             ),
//                           )
//                         : ListView(
//                             children: List.generate(
//                                 state.quickMessage.length,
//                                 (index) => InkWell(
//                                     onTap: () => AppRouter.toPage(context,
//                                             AppPages.Edit_Quick_Message,
//                                             arguments: {
//                                               'quickMessage':
//                                                   state.quickMessage[index]
//                                             }),
//                                     child: state.quickMessage[index].image ==
//                                             null
//                                         ? QuickMessage(
//                                             flash: state
//                                                 .quickMessage[index].title,
//                                             text: state
//                                                 .quickMessage[index].message,
//                                           )
//                                         : QuickMessage(
//                                             flash: state
//                                                 .quickMessage[index].title,
//                                             text: state
//                                                 .quickMessage[index].message,
//                                             image: state.quickMessage[index]
//                                                 .image!.path,
//                                           ))),
//                           );
//                   } else {
//                     return Container(
//                       child: Text(
//                         'Bạn chưa có tin nhắn nhanh nào!',
//                         style: TextStyle(fontSize: 14, height: 1.3),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 19,
//             ),
//             InkWell(
//               onTap: () {
//                 if (countText >= 50) {
//                   showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text('Thông báo'),
//                           content: Text(
//                               'Bạn chỉ có thể tạo tối đa 50 tin nhắn nhanh!'),
//                           actions: [
//                             MaterialButton(
//                               onPressed: () {
//                                 AppRouter.back(context);
//                               },
//                               child: Text('OK'),
//                             )
//                           ],
//                         );
//                       });
//                 } else {
//                   AppRouter.toPage(context, AppPages.Create_Quick_Message);
//                 }
//               },
//               child: InkWell(
//                 onTap: () {
//                   if (countText >= 50) {
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: Text('Thông báo'),
//                             content: Text(
//                                 'Bạn chỉ có thể tạo tối đa 50 tin nhắn nhanh!'),
//                             actions: [
//                               MaterialButton(
//                                 onPressed: () {
//                                   AppRouter.back(context);
//                                 },
//                                 child: Text('OK'),
//                               )
//                             ],
//                           );
//                         });
//                   } else {
//                     AppRouter.toPage(context, AppPages.Create_Quick_Message,
//                         arguments: {'flash': null});
//                   }
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset(Images.add_flash_message),
//                     Text(
//                       'Tạo mới',
//                       style: TextStyle(color: Color(0xFFbac4C5BD4)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// static showRequestUsePoint(
//     BuildContext context, FutureOr onSubmit(), int candidateId,
//     {int? point, int? type_chat}) async {
//   return showDialog(
//       context: context,
//       builder: (_) => requestUsePointDialog(context, onSubmit, candidateId,
//           point: point, type_chat: type_chat));
// }

// static requestUsePointDialog(
//     BuildContext context, FutureOr onSubmit(), int candidateId,
//     {int? point, int? type_chat}) {
//   return AlertDialog(
//     content: Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20), color: Colors.white),
//       child: (dataInfo.value?.id == '-1')
//           ? Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(Images.candidate_btn),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Text('Bạn chưa có tài khoản nhà tuyển dụng bên tìm việc!',
//                     textAlign: TextAlign.center),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     AppRouter.back(context);
//                   },
//                   child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(width: 1, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(20)),
//                       padding: EdgeInsets.all(8),
//                       child: Center(
//                         child: Text(
//                           'OK',
//                           style: AppTextStyles.candidateCancel
//                               .copyWith(color: AppColors.blueGradients1),
//                         ),
//                       )),
//                 ),
//               ],
//             )
//           : ValueListenableBuilder<int>(
//               valueListenable: dataInfo.value!.point!,
//               builder: (_, __, ___) => Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset(Images.candidate_btn),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   dataInfo.value?.id != '-1'
//                       ? dataInfo.value?.userType == UserType.company
//                           ? __ > 0
//                               ? __ >= point!
//                                   ? Text(
//                                       'Hiện bạn còn $__ điểm. ${type_chat == 1 ? 'Chat' : 'Để xem và chat'} với ứng viên này bạn phải '
//                                       'mất $point điểm.',
//                                       textAlign: TextAlign.center)
//                                   : Text(
//                                       'Hiện bạn còn $__ điểm. ${type_chat == 1 ? 'Chat' : 'Để xem và chat'} với ứng viên này bạn phải mất '
//                                       '$point điểm. Hãy liên hệ với chuyên viên tư vấn của timviec365 để '
//                                       'mua điểm.',
//                                       textAlign: TextAlign.center)
//                               : Text(
//                                   'Hiện bạn còn 0 điểm. ${type_chat == 1 ? 'Chat' : 'Để xem và chat'} với ứng viên này bạn phải mất '
//                                   '$point điểm. Hãy liên hệ với chuyên viên tư vấn của timviec365 để '
//                                   'mua điểm.',
//                                   textAlign: TextAlign.center)
//                           : dataInfo.value?.userType == UserType.staff
//                               ? Text(
//                                   'Tài khoản của bạn không phải tài khoản nhà tuyển dụng.',
//                                   textAlign: TextAlign.center)
//                               : Text(
//                                   'Bạn chưa có tài khoản nhà tuyển dụng bên tìm việc!',
//                                   textAlign: TextAlign.center)
//                       : Text(
//                           'Bạn chưa có tài khoản nhà tuyển dụng bên tìm việc!',
//                           textAlign: TextAlign.center),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   dataInfo.value?.id != '-1'
//                       ? dataInfo.value?.userType == UserType.company
//                           ? Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Expanded(
//                                   child: InkWell(
//                                     onTap: () {
//                                       AppRouter.back(context);
//                                     },
//                                     child: Container(
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 width: 1, color: Colors.blue),
//                                             borderRadius:
//                                                 BorderRadius.circular(20)),
//                                         padding: EdgeInsets.all(8),
//                                         child: Center(
//                                           child: Text(
//                                             'Hủy bỏ',
//                                             style: AppTextStyles
//                                                 .candidateCancel
//                                                 .copyWith(
//                                                     color: AppColors
//                                                         .blueGradients1),
//                                           ),
//                                         )),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 16,
//                                 ),
//                                 Expanded(
//                                   child: __ > 0
//                                       ? __ >= point!
//                                           ? InkWell(
//                                               onTap: () async {
//                                                 showLoadingCircle(context);
//                                                 var res =
//                                                     await commonDataCubit
//                                                         .subtractPoint(
//                                                             candidateId,
//                                                             point: point,
//                                                             type_chat:
//                                                                 type_chat);
//                                                 hideLoadingCircle(context);
//                                                 logger.log('@@@@@@@${res}');
//                                                 if (res) await onSubmit();
//                                               },
//                                               child: Container(
//                                                   decoration: BoxDecoration(
//                                                       color: Colors.blue,
//                                                       border: Border.all(
//                                                           width: 1,
//                                                           color: Colors.blue),
//                                                       borderRadius:
//                                                           BorderRadius
//                                                               .circular(20)),
//                                                   padding: EdgeInsets.all(8),
//                                                   child: Center(
//                                                     child: Text(
//                                                       'Đồng ý',
//                                                       style: AppTextStyles
//                                                           .candidateBtn,
//                                                     ),
//                                                   )),
//                                             )
//                                           : InkWell(
//                                               onTap: () {
//                                                 SystemUtils.openUrlInBrowser(
//                                                     GeneratorService
//                                                         .generateTimviecLink(
//                                                             'https://timviec365.vn/thong-tin-bang-gia.html'));
//                                               },
//                                               splashFactory:
//                                                   NoSplash.splashFactory,
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.blue,
//                                                     border: Border.all(
//                                                         width: 1,
//                                                         color: Colors.blue),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             20)),
//                                                 padding: EdgeInsets.all(8),
//                                                 child: Center(
//                                                   child: Text(
//                                                     'Mua điểm',
//                                                     style: AppTextStyles
//                                                         .regularW600(context,
//                                                             size: 16,
//                                                             color:
//                                                                 Colors.white,
//                                                             lineHeight: 22),
//                                                   ),
//                                                 ),
//                                               ),
//                                             )
//                                       : InkWell(
//                                           onTap: () {
//                                             SystemUtils.openUrlInBrowser(
//                                                 GeneratorService
//                                                     .generateTimviecLink(
//                                                         'https://timviec365.vn/thong-tin-bang-gia.html'));
//                                           },
//                                           splashFactory:
//                                               NoSplash.splashFactory,
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                                 color: Colors.blue,
//                                                 border: Border.all(
//                                                     width: 1,
//                                                     color: Colors.blue),
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         20)),
//                                             padding: EdgeInsets.all(8),
//                                             child: Center(
//                                               child: Text(
//                                                 'Mua điểm',
//                                                 style:
//                                                     AppTextStyles.regularW600(
//                                                         context,
//                                                         size: 16,
//                                                         color: Colors.white,
//                                                         lineHeight: 22),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                 ),
//                               ],
//                             )
//                           : InkWell(
//                               onTap: () {
//                                 AppRouter.back(context);
//                               },
//                               child: Container(
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           width: 1, color: Colors.blue),
//                                       borderRadius:
//                                           BorderRadius.circular(20)),
//                                   padding: EdgeInsets.all(8),
//                                   child: Center(
//                                     child: Text(
//                                       'OK',
//                                       style: AppTextStyles.candidateCancel
//                                           .copyWith(
//                                               color:
//                                                   AppColors.blueGradients1),
//                                     ),
//                                   )),
//                             )
//                       : InkWell(
//                           onTap: () {
//                             AppRouter.back(context);
//                           },
//                           child: Container(
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       width: 1, color: Colors.blue),
//                                   borderRadius: BorderRadius.circular(20)),
//                               padding: EdgeInsets.all(8),
//                               child: Center(
//                                 child: Text(
//                                   'OK',
//                                   style: AppTextStyles.candidateCancel
//                                       .copyWith(
//                                           color: AppColors.blueGradients1),
//                                 ),
//                               )),
//                         ),
//                 ],
//               ),
//             ),
//     ),
//   );
// }
}
