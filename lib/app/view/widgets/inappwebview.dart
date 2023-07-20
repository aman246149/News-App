import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:newsapp/global/theme/app_color.dart';
import 'package:newsapp/global/theme/text_theme.dart';
import 'package:newsapp/global/utils/shimmer_effect.dart';

class InAppWeb extends StatefulWidget {
  final String url;
  final bool isAppBarNeeded;

  const InAppWeb({super.key, required this.url, this.isAppBarNeeded = true});

  @override
  State<InAppWeb> createState() => _InAppWebState();
}

class _InAppWebState extends State<InAppWeb> {
  InAppWebViewController? webViewController;
  PullToRefreshController? pullToRefreshController;
  String url = "";
  double progress = 0;
  String error = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.yellow,
        title: Text(
          "NEWS",
          style: AppStyle.blackBold24,
        ),
      ),
      backgroundColor: AppColor.yellow,
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            onLoadStart: (controller, url) {
              // log("ON WEB URL LOAD", name: url.toString(), level: 4);

              // //! Redirection for investment document
              // if ()) {}
            },
            onProgressChanged: (controller, progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
            onLoadError: (controller, url, code, message) {
              setState(() {
                error = message;
              });
            },
          ),
          progress < 1.0
              ? const ShimmerWidget(
                  height: double.infinity,
                  width: double.infinity,
                )
              : const SizedBox.shrink(),
          error.isNotEmpty
              ? Center(
                  child: Text(error),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
