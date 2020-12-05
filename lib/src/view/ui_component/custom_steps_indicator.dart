import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CustomStepsIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      totalSteps: 3,
      currentStep: 1,
      selectedColor: Colors.black,
    );
  }
}
