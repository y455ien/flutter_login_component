
import 'package:flutter/cupertino.dart';
import 'package:login_component/src/bloc/new_trial/trial_bloc.dart';

class TrialProvider extends InheritedWidget {

  final bloc = TrialBloc();

  TrialProvider({Key key, Widget child})
  : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static TrialBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TrialProvider>().bloc;
  }

}