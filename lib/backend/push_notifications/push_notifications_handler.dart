import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
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
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/vasravitan.png',
            fit: BoxFit.fitWidth,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'mainHomePage': ParameterData.none(),
  'productDetails': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
        },
      ),
  'fullCartView': (data) async => ParameterData(
        allParams: {
          'subPage': getParameter<bool>(data, 'subPage'),
          'subPageName': getParameter<String>(data, 'subPageName'),
        },
      ),
  'mainFavorites': ParameterData.none(),
  'sellerDetails': ParameterData.none(),
  'loginPage': (data) async => ParameterData(
        allParams: {
          'isas': getParameter<DocumentReference>(data, 'isas'),
        },
      ),
  'mainOrderHistory': ParameterData.none(),
  'mainProfile': ParameterData.none(),
  'createProfile': (data) async => ParameterData(
        allParams: {
          'editProfile': getParameter<bool>(data, 'editProfile'),
        },
      ),
  'successPage': (data) async => ParameterData(
        allParams: {
          'orderTotal': getParameter<double>(data, 'orderTotal'),
        },
      ),
  'orderHistory_Details': (data) async => ParameterData(
        allParams: {
          'orderRef': await getDocumentParameter<OrdersRecord>(
              data, 'orderRef', OrdersRecord.fromSnapshot),
        },
      ),
  'forgotPassword': ParameterData.none(),
  'checkout_FullPage': (data) async => ParameterData(
        allParams: {
          'subPage': getParameter<bool>(data, 'subPage'),
          'subPageName': getParameter<String>(data, 'subPageName'),
        },
      ),
  'checkoutCopy': ParameterData.none(),
  'create_Item': ParameterData.none(),
  'open_seller': ParameterData.none(),
  'seller_homepage': (data) async => ParameterData(
        allParams: {},
      ),
  'seller_product': ParameterData.none(),
  'seller_profile': ParameterData.none(),
};

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
