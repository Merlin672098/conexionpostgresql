/*import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class BotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido al ChatBot',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                    dynamic conversationObject = {
                    'appId': '3dbf50f8d98226a83fefda7b1c6048dae',// The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
                    };

                    KommunicateFlutterPlugin.buildConversation(conversationObject)
                        .then((clientConversationId) {
                      print("Conversation builder success : " + clientConversationId.toString());
                    }).catchError((error) {
                      print("Conversation builder error : " + error.toString());
                    });
              },
              child: Text('Iniciar Chat'),
            ),
          ],
        ),  
      ),
    );
  }
}
*/