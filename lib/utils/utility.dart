import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewLauncher {
  // Launch WebView or external browser for URL
  void launchWebView(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Opens in external browser
      );
    } else {
      if (context.mounted) {
        showToast(context, "Could not launch URL");
      }
      // Use any logging method you prefer
      debugPrint('Could not launch $url');
    }
  }

  // Show Toast message (you can customize it)
  void showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
