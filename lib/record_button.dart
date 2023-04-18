import 'package:flutter/material.dart';
import 'package:record_button/record_waves.dart';

class RecordButton extends StatefulWidget {
  const RecordButton({super.key});

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  final duration = const Duration(milliseconds: 300);

  var isRecording = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.5;

    return Stack(
      alignment: Alignment.center,
      children: [
        if (isRecording)
          RecordWaves(
            duration: duration,
            size: width,
          ),
        AnimatedContainer(
          width: width,
          height: width,
          duration: duration,
          decoration: BoxDecoration(
              border: Border.all(
                color: isRecording ? Colors.red : Colors.grey,
                width: isRecording ? 4 : 1,
              ),
              borderRadius: BorderRadius.circular(width)),
          child: tapButton(width),
        ),
      ],
    );
  }

  Widget tapButton(double size) => Center(
        child: GestureDetector(
          onTap: () => setState(() => isRecording = !isRecording),
          child: AnimatedContainer(
            duration: duration,
            width: isRecording ? size * 0.65 - 30 : size * 0.65,
            height: isRecording ? size * 0.65 - 30 : size * 0.65,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: isRecording ? 4 : 8,
              ),
              color: Colors.red,
              borderRadius: BorderRadius.circular(
                isRecording ? 20 : 80,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.4),
                  blurRadius: isRecording ? 17.5 : 40.0,
                  spreadRadius: isRecording ? 7.5 : 20.0,
                )
              ],
            ),
            child: Center(
              child: Text(isRecording ? 'STOP' : 'RECORD'),
            ),
          ),
        ),
      );
}
