import 'package:demo_chat_screen/screen/chat_screen/components/show_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool bye = false;
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return WillPopScope(
        onWillPop: () async {
          if (!isKeyboardVisible) {
            FocusScope.of(context).unfocus();
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: const Text(
              'Demo Text Field',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ****************************** Chat Field Section **********************
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    enableDrag: false,
                    barrierColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return const MyBottomSheet();
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        child: Icon(Icons.add, color: Colors.grey.shade500),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Demo Text Field",
                        style: TextStyle(color: Colors.grey.shade500),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
