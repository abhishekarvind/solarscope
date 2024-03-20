import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solarscope/utils/colors.dart';
import 'package:solarscope/utils/textstyles.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String generated_text = "";
  TextEditingController user_text = TextEditingController();
  List<String> userData = [];
  List<String> botData = [];
  bool isLoading = false;

  Future<void> chatbot(String query) async {
    setState(() {
      isLoading = true;
    });

    http.Client client = http.Client();

    try {
      Map<String, dynamic> prompt = {
        'prompt':
        "Act as a chat bot whose job is to clarify user doubt the user question is $query make your responses short and precise"
      };
      http.Response response = await client.post(
        Uri.parse('http://192.168.1.7:5000/get_openai_response'),
        headers: {"Content-Type": 'application/json'},
        body: json.encode(prompt),
      );

      if (response.statusCode == 200) {
        final getresponse = await client.get(
          Uri.parse('http://192.168.1.7:5000/get_openai_response'),
          headers: {"Content-Type": 'application/json'},
        );

        if (getresponse.statusCode == 200) {
          Map<String, dynamic> content = jsonDecode(getresponse.body);
          generated_text = content['generated_content'];
          botData.add(generated_text);
          print(generated_text);
        } else {
          print('Failed to get response: ${getresponse.statusCode}');
        }
      } else {
        print('Failed to post response: ${response.statusCode}');
      }
    } finally {
      setState(() {
        isLoading = false;
      });
      // Dispose of the client to release resources
      client.close();
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userData.clear();
    botData.clear();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomTextStyles.head("SunGuide Buddy", 24.0),

        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/back.jpg",), // Change the path to your image
              fit: BoxFit.contain,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const PageScrollPhysics(),
                  reverse: false,
                  itemCount: userData.length + botData.length,
                  itemBuilder: (context, index) {
                    if (index.isEven && index ~/ 2 < botData.length) {
                      // Bot message
                      return _buildChatBubble(userData[index ~/ 2], true);
                    } else if (index.isOdd && index ~/ 2 < userData.length) {
                      // User message
                      return _buildChatBubble(botData[index ~/ 2], false);
                    } else {
                      // Loading indicator
                      return _buildLoadingIndicator();
                    }
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: CustomColor.lightorange(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Type your message...',
                            border: InputBorder.none,
                          ),
                          controller: user_text,
                          onSaved: (value) {
                            user_text.text = value!;
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            userData.add(user_text.text.trim());
                            chatbot(user_text.text.trim());
                            user_text.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildChatBubble(String message, bool isBotMessage) {
    return Align(
      alignment: isBotMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isBotMessage ? CustomColor.lightorange() : CustomColor.orange(),
          borderRadius: BorderRadius.only(
            topLeft: isBotMessage ? const Radius.circular(16) : const Radius.circular(0),
            topRight: isBotMessage ? const Radius.circular(0) : const Radius.circular(16),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Image.asset("assets/type.gif",height: 56,),
      ),
    );
  }
}
