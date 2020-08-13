import 'package:bloc/bloc.dart';

class ResourceObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('$error $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}
