import 'package:netflix_clone/export_screens.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({
    super.key,
  });

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 4500),
    ).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: height,
        width: double.infinity,
        child: Column(children: [
          SizedBox(
            height: height * 0.2,
          ),
          Lottie.asset(
            'assets/netfixsplash.json',
            repeat: false,
          ),
          const CircularProgressIndicator(
            color: Colors.red,
            backgroundColor: Colors.black,
          )
        ]),
      ),
    );
  }
}
