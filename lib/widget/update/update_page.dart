import 'package:flutter/material.dart';

import '../../domain/api_tasks/api_tasks.dart';

class UpdatePageWidget extends StatefulWidget {
  const UpdatePageWidget({Key? key}) : super(key: key);

  @override
  State<UpdatePageWidget> createState() => _UpdatePageWidgetState();
}

class _UpdatePageWidgetState extends State<UpdatePageWidget> {
  final _textStyle = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black);

  final _buttonStyle = ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(const Color.fromRGBO(255, 137, 137, 1)),
      overlayColor:
          MaterialStateProperty.all(const Color.fromRGBO(251, 239, 180, 1)),
      minimumSize: MaterialStateProperty.all(const Size(169, 50)),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))));

  ApiClient apiClient = ApiClient();

  final nameController = TextEditingController();
  final dataController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(169, 169, 169, 1),
            Color.fromRGBO(56, 56, 56, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(),
                const TopRowWidget(),
                const Divider(),
                Column(
                  children: [
                    Container(
                      height: 50,
                      color: const Color.fromRGBO(251, 239, 180, 1),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                height: 50,
                              ),
                              CustomRadioButton(),
                              SizedBox(width: 10),
                              Text('Робочі', style: TextStyle(fontSize: 18.0)),
                              SizedBox(width: 140),
                              CustomRadioButton(),
                              SizedBox(width: 10),
                              Text('Особисті',
                                  style: TextStyle(fontSize: 18.0)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    TextField(
                        controller: nameController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30, top: 30),
                          hintText: 'Додати опис...',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black),
                          filled: true,
                          fillColor: Color.fromRGBO(251, 239, 180, 1),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                        )),
                    const Divider(),
                    ColoredBox(
                        color: const Color.fromRGBO(251, 239, 180, 1),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: TextButton(
                                  child: const Text(
                                    'Вкладене зображення',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Container()
                            ])),
                    const Divider(),
                    TextField(
                        controller: dataController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30),
                          hintText: 'Дата завершeння:',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black),
                          filled: true,
                          fillColor: Color.fromRGBO(251, 239, 180, 1),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                        )),
                    const Divider(),
                    Container(
                      color: const Color.fromRGBO(251, 239, 180, 1),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: const [
                          SizedBox(width: 30),
                          CustomRadioButton(),
                          SizedBox(width: 10),
                          Text(
                            'Термінове',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(),
                ElevatedButton(
                  onPressed: () async {
                    // final respons = await apiClient.createData(
                    //     'ewqfdg',
                    //     'status',
                    //     'name',
                    //     'type',
                    //     'description',
                    //     'file',
                    //     'finishDate',
                    //     'urgent',
                    //     'syncTime');

                    // if (respons) {
                    //   Navigator.popAndPushNamed(context, '/todo');
                    // } else {
                    //   throw Exception('Failed to create tasks.');
                    // }
                  },
                  style: _buttonStyle,
                  child: Text(
                    'Видалити',
                    style: _textStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopRowWidget extends StatelessWidget {
  const TopRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 36),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            size: 27,
            color: Colors.amber,
          ),
        ),
        const SizedBox(width: 30),
        const Text(
          'Назва завдання...',
          style: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        const SizedBox(width: 30),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.done,
            size: 27,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({Key? key}) : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(219, 219, 219, 1),
          shape: BoxShape.circle,
        ),
        width: 30,
        height: 30,
        child: isSelected
            ? Container(
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 214, 0, 1),
                      shape: BoxShape.circle,
                    ),
                    width: 15,
                    height: 15,
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
