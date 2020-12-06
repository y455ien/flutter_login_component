import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_component/src/view/ui_component/custom_login_flat_button.dart';
import 'package:login_component/src/view/ui_component/custom_logo_image.dart';
import 'package:login_component/src/view/ui_component/custom_steps_indicator.dart';
import 'package:login_component/src/view/ui_component/custom_text_field.dart';
import 'base_screen_widget.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BaseScreenWidget.of(context);

    // bloc.authStream.listen((event) {
    //   BotToast.showText(text:event);
    // });

    return ListView(
      padding: EdgeInsets.all(30.0),
      children: [
        CustomStepsIndicator(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
        ),
        Text('Step 1'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
        ),
        Text(
          'Personal Information',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
        ),
        CustomLogoImage(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
        ),
        CustomTextField(bloc),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
        ),
        CustomFlatButton(bloc),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
        ),
        Text('By continuing you indicate that you have read and agree to the Terms of Service and Privacy Policy'),
      ],
    );
  }
}
