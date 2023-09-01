import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  double textFieldHeight = 50.0;
  bool isExpanded = false;

  bool something = false;

  late TextEditingController _textEditingController;
  late FocusNode _textFocusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textFocusNode = FocusNode();
    _textFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _textFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final size = MediaQuery.sizeOf(context);
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          something = true;
        });

        debugPrint(
            '$something ****************************** Chat Field Section **********************');
        return true;
      },
      child: something
          ? Container()
          : Container(
              padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom)
                  .copyWith(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    SwipeDetector(
                      onSwipeUp: (offset) {
                        setState(() {
                          isExpanded = !isExpanded;
                          textFieldHeight = isExpanded ? 400 : 50.0;
                        });
                      },
                      onSwipeDown: (offset) {
                        setState(() {
                          isExpanded = !isExpanded;
                          textFieldHeight = isExpanded ? 400 : 50.0;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 3,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    //const SizedBox(height: 16),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      height: textFieldHeight,
                      child: TextField(
                        focusNode: _textFocusNode,
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Type something...',
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          child: Icon(Icons.add, color: Colors.grey.shade500),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Aa",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "@",
                          style: TextStyle(color: Colors.black),
                        ),
                        const Spacer(),
                        CircleAvatar(
                          backgroundColor: Colors.green.shade400,
                          child: const Icon(Icons.send, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
    );
  }
}
