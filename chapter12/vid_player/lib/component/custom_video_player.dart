import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io'; // 파일 괸련 작업 패키지

// 동영상 위젯 생성
class CustomVideoPlayer extends StatefulWidget {
  // 선택한 동영상을 저장할 변수
  // XFile은 ImagePicket로 영상 또는 이미지를 선택했을 때 변환하는 타이ㅏㅂ
  final XFile video;

  const CustomVideoPlayer({
    required this.video, // 상위에서 선택한 동영상 주입해주기
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  // 동영상을 조작하는 컨트롤러
  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();

    initializeController();
  }

  initializeController() async {
    final videoController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await videoController.initialize();

    setState(() {
      this.videoController = videoController;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 동영상 컨트롤러가 준비 중일 때 로딩 표시
    if (videoController == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    // 동영상 비율에 따른 화면 렌더링
    return AspectRatio(
        aspectRatio: videoController!.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(
              videoController!,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Slider(
                // 슬라이더가 이동할 때마다 실행할 함수
                onChanged: (double val) {
                  videoController!.seekTo(
                    Duration(seconds: val.toInt()),
                  );
                },

                // 동영상 재생 위치를 초 단위로 표현
                value: videoController!.value.position.inSeconds.toDouble(),
                min: 0,
                max: videoController!.value.duration.inSeconds.toDouble(),
              ),
            )
          ],
        ));
  }
}
