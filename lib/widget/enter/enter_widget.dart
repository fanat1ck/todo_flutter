import 'package:flutter/material.dart';
import 'package:flutter_application_todo/domain/api_tasks/api_tasks.dart';

class EnterWidget extends StatelessWidget {
  const EnterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _textStyle = TextStyle(
        fontSize: 24, color: Colors.black, fontWeight: FontWeight.w400);
    final _buttonStyle = ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(255, 214, 0, 1)),
        overlayColor:
            MaterialStateProperty.all(const Color.fromRGBO(251, 239, 180, 1)),
        minimumSize: MaterialStateProperty.all(const Size(108, 50)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))));
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color.fromRGBO(169, 169, 169, 1),
            Color.fromRGBO(56, 56, 56, 1),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                bottom: 256,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/todo'),
                  },
                  style: _buttonStyle,
                  child: const Text(
                    'Вхід',
                    style: _textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
