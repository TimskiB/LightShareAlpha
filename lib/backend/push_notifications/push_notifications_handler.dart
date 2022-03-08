import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../new_devices/new_devices_widget.dart';
import '../../folder/folder_widget.dart';
import '../../onboarding/onboarding_widget.dart';
import '../../authi/authi_widget.dart';
import '../../auth_register/auth_register_widget.dart';
import '../../forgot_password/forgot_password_widget.dart';
import '../../profile/profile_widget.dart';
import '../../settings/settings_widget.dart';
import '../../server_test/server_test_widget.dart';
import '../../phone_auth/phone_auth_widget.dart';
import '../../verify/verify_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).tertiaryColor,
          child: Builder(
            builder: (context) => Image.asset(
              'assets/images/undraw_progressive_app_m9ms.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Files': (data) async => NavBarPage(initialPage: 'FilesWidget'),
  'NewDevices': (data) async => hasMatchingParameters(data, {'userID'})
      ? NewDevicesWidget(
          userID: getParameter(data, 'userID'),
        )
      : NavBarPage(initialPage: 'NewDevicesWidget'),
  'Folder': (data) async => FolderWidget(
        folderName: getParameter(data, 'folderName'),
      ),
  'Onboarding': (data) async => OnboardingWidget(),
  'Authi': (data) async => AuthiWidget(),
  'AuthRegister': (data) async => AuthRegisterWidget(),
  'forgotPassword': (data) async => ForgotPasswordWidget(),
  'Profile': (data) async => ProfileWidget(),
  'Settings': (data) async => SettingsWidget(),
  'ServerTest': (data) async => ServerTestWidget(),
  'PhoneAuth': (data) async => PhoneAuthWidget(),
  'Verify': (data) async => VerifyWidget(),
  'Groups': (data) async => NavBarPage(initialPage: 'GroupsWidget'),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
