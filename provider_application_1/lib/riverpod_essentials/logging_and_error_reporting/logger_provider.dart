import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../activity.dart';
import '../../activity_repository.dart';

typedef LoggerActivityParameters = ({String type, int maxPrice});

final loggerActivityProvider = AsyncNotifierProvider.autoDispose<LoggerActivityNotifier, Activity>(
  LoggerActivityNotifier.new,
);

class LoggerActivityNotifier extends AutoDisposeAsyncNotifier<Activity> {
  final ActivityRepository _activityRepo = ActivityRepositoryImp();

  @override
  Future<Activity> build() async {
    debugPrint("LoggerActivityNotifier: call build()");
    return await _activityRepo.getActivity();
  }

  LoggerActivityNotifier() {
    debugPrint("LoggerActivityNotifier: call init()");
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _activityRepo.getActivity());
  }
}
