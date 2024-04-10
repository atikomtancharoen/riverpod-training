import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = NotifierProvider.autoDispose<AuthNotifier, bool>(AuthNotifier.new);

class AuthNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    return false;
  }

  void login() {
    state = true;
  }

  void logout() {
    state = false;
  }
}
