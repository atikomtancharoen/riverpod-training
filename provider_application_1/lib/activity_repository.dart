import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'activity.dart';

abstract class ActivityRepository {
  Future<Activity> getActivity();
  Future<Activity> getActivityDetail(String activityKey);
  Future<Activity> getActivityError();
}

class ActivityRepositoryImp implements ActivityRepository {
  final baseUri = Uri(
    scheme: 'https',
    host: 'www.boredapi.com',
  );

  @override
  Future<Activity> getActivity() async {
    final uri = baseUri.replace(path: '/api/activity/');
    final response = await http.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;

    debugPrint("ActivityRepository: call getActivity()");

    return Activity.fromJson(json);
  }

  @override
  Future<Activity> getActivityDetail(String activityKey) async {
    final uri = baseUri.replace(path: '/api/activity/', queryParameters: {'key': activityKey});
    final response = await http.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return Activity.fromJson(json);
  }

  @override
  Future<Activity> getActivityError() async {
    final uri = baseUri.replace(path: '/ap/activity/');
    final response = await http.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return Activity.fromJson(json);
  }
}
