import 'package:netflix_clone/export_screens.dart';
import 'package:video_player/video_player.dart';

class VidioScreen extends StatefulWidget {
  final String vidiolink;
  const VidioScreen({
    super.key,
    required this.vidiolink,
  });

  @override
  State<VidioScreen> createState() => _VidioScreenState();
}

class _VidioScreenState extends State<VidioScreen> {
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.asset('assets/video/CR7.mp4')
      ..initialize().then((_) {
        setState(() {});
      })
      ..play();

    super.initState();
  }

  @override
  void dispose() {
    controller.pause();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () =>
            controller.value.isPlaying ? controller.pause() : controller.play(),
        child: Center(
          child: AspectRatio(
            aspectRatio: controller.value.isInitialized
                ? controller.value.aspectRatio
                : 0.782,
            child: controller.value.isInitialized
                ? VideoPlayer(controller)
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: const Icon(Icons.image_not_supported_rounded),
                  ),
          ),
        ),
      ),
    );
  }
}
