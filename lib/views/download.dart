
import 'dart:convert';
import 'dart:ui';

import 'package:clipboard/clipboard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reel_downloader/constants/color-constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart'as http;

class DownloadReel extends StatefulWidget {
  const DownloadReel({Key? key}) : super(key: key);

  @override
  _DownloadReelState createState() => _DownloadReelState();
}

class _DownloadReelState extends State<DownloadReel> {
  var maxHeight;
  var maxWidth;


  final TextEditingController _mediaLink = TextEditingController();
  @override
  Widget build(BuildContext context) {
    maxHeight = MediaQuery.of(context).size.height;
    maxWidth = MediaQuery.of(context).size.width;
    return Column(
        children: [
          _reelLinkBox(),
          const SizedBox(
            width: 20,
          ),
          _proceedButton(),
        ],
      );
  }

  Widget _reelLinkBox(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: gradient1),
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 12,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            ),
          ]
        ),
        child:  Padding(
          padding: const EdgeInsets.only(left: 0),
          child: TextField(
            controller: _mediaLink,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Paste Url Here",
              prefixIcon: const Icon(Icons.link),
              suffixIcon: GestureDetector(
                onTap: (){
                  FlutterClipboard.paste().then((value) {
                    _mediaLink.text = value;
                  });
                },
                child: Container(
                  width: maxWidth*.2,
                  height: maxHeight*.04,
                  decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8)),
                  gradient:  LinearGradient(
                    colors: [
                      gradient1,
                      gradient2,
                    ]
                  )
                ),child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Paste",style: TextStyle(color: whiteTextColor),),
                  ],
                )),
              )
            ),
          ),
        ),
      ),
    );
  }

  Widget _proceedButton(){
    return GestureDetector(
      onTap: (){
        _downloadMedia();

      },
      child: Container(
        width: maxWidth*.2,
        height: maxHeight*.04,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              gradient1,
              gradient2,
            ]
          )
        ),
        child: const Center(child: Text("Proceed",style: TextStyle(color: whiteTextColor,fontWeight: FontWeight.w600),)),
      ),
    );
  }


  /*
  * Method
  *
  *
  * Method
  *
  * Method
  *
  *
  * */

  @override
  void initState(){
    super.initState();
    initializeDownloader();
  }

  void initializeDownloader()async{
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterDownloader.initialize(debug: true);
  }


  void _downloadMedia() async{
    await Permission.storage.request();
    var linkEdit = _mediaLink.text.replaceAll(" ", "").split("/");
    var downloadURL = await http.get(Uri.parse('${linkEdit[0]}//${linkEdit[2]}/${linkEdit[3]}/${linkEdit[4]}' + "/?__a=1"));
    print(downloadURL.body);
    var data = json.decode(downloadURL.body);
    var graphql = data['graphql'];
    var shortcodeMedia = graphql['shortcode_media'];
    var videoUrl = shortcodeMedia['video_url'];
    print(videoUrl);
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + "/temp.mp4";
    await Dio().download(videoUrl, savePath);
    final result = await ImageGallerySaver.saveFile(savePath).then((value) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Reel Stored in $savePath")));
    });

  }

}
