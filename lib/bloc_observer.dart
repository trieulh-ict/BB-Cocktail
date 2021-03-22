import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(Cubit bloc) {
    super.onCreate(bloc);
    // ignore: avoid_print
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(Cubit bloc, Change change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(Cubit bloc, Object error, StackTrace stackTrace) {
    // ignore: avoid_print
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(Cubit bloc) {
    super.onClose(bloc);
    // ignore: avoid_print
    print('onClose -- ${bloc.runtimeType}');
  }
}
