import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  //------------------------------------------------------------------------
  static showSnackbarError(String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  //------------------------------------------------------------------------
  static showSnackbar(String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.green.withOpacity(0.9),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  //------------------------------------------------------------------------
  static showBusyIndicator(BuildContext context) {
    AlertDialog dialog = AlertDialog(
      content: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(
                color: Colors.indigo,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Por favor espere...',
                  style: TextStyle(color: Colors.black, fontSize: 20))
            ],
          ),
        ),
      ),
    );

    showDialog(context: context, builder: (_) => dialog);
  }
}
