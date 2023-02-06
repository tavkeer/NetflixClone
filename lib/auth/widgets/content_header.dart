import 'package:video_player/video_player.dart';
import 'package:netflix_clone/auth/widgets/verticle_iconbutton.dart';
import 'package:netflix_clone/export_screens.dart';

class ContentHeader extends StatefulWidget {
  final Content featuredContent;
  const ContentHeader({
    super.key,
    required this.featuredContent,
  });

  @override
  State<ContentHeader> createState() => _ContentHeaderState();
}

class _ContentHeaderState extends State<ContentHeader> {
  bool isMuted = true;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    _videoController = VideoPlayerController.asset('assets/video/CR7.mp4')
      ..initialize().then((_) {
        setState(() {});
      })
      ..play();

    super.initState();
  }

  @override
  void dispose() {
    _videoController.pause();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized
                ? _videoController.value.aspectRatio
                : 0.782,
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : Image.asset(
                    widget.featuredContent.imageUrl.toString(),
                    fit: BoxFit.cover,
                  ),
          ),
          Container(
            height: 500,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            child: SizedBox(
              width: 250,
              child:
                  Image.asset(widget.featuredContent.titleImageUrl.toString()),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticleIconButton(
                  title: 'List',
                  onTap: () {},
                  icon: Icons.add,
                ),
                _PlayButton(
                  videoController: _videoController,
                ),
                VerticleIconButton(
                  title: 'Info',
                  onTap: () {},
                  icon: Icons.info_outline,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  final VideoPlayerController videoController;

  const _PlayButton({required this.videoController});
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(10, 10, 14, 10),
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
      onPressed: () {
        videoController.pause();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const VidioScreen(vidiolink: 'assets/video/CR7.mp4'),
          ),
        );
      },
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.black,
        size: 30,
      ),
      label: const Text(
        'Play',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}
