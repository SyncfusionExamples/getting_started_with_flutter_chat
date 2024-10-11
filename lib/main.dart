import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_chat/chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SfChat(
          messages: _messages,
          outgoingUser: 'Sam',
          incomingBubbleSettings: ChatBubbleSettings(
            contentBackgroundColor: Colors.grey.shade300,
            widthFactor: 0.9,
            contentShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(5),
              ),
            ),
            headerTextStyle: const TextStyle(
              color: Colors.green,
              fontSize: 10,
            ),
          ),
          outgoingBubbleSettings: ChatBubbleSettings(
            contentBackgroundColor: Theme.of(context).colorScheme.primary,
            widthFactor: 0.85,
            showTimestamp: false,
            showUserAvatar: false,
            showUserName: false,
            contentShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.zero,
              ),
            ),
            textStyle: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          placeholderBuilder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.question_answer_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 32,
                ),
                Text(
                  'No conversation yet.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            );
          },
          composer: const ChatComposer(
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Enter the message...',
            ),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.deepPurple,
            ),
          ),
          actionButton: ChatActionButton(
            tooltip: 'Send Button',
            hoverColor: Colors.green,
            onPressed: (String text) {
              setState(() {
                _messages.add(
                  ChatMessage(
                    text: text,
                    time: DateTime.now(),
                    author: const ChatAuthor(
                      id: 'Sam',
                      name: 'Sam',
                      avatar: AssetImage(
                        'assets/images/People_Circle14.png',
                      ),
                    ),
                  ),
                );
              });

              if (text == 'Hi. How are you?') {
                Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    _messages.add(
                      ChatMessage(
                        text: 'I am fine. What about you?',
                        time: DateTime.now(),
                        author: const ChatAuthor(
                          id: 'Jack',
                          name: 'Jack',
                          avatar: AssetImage(
                            'assets/images/People_Circle23.png',
                          ),
                        ),
                      ),
                    );
                  });
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
