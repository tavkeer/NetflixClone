// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:netflix_clone/export_screens.dart';

class VerticleIconButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final IconData icon;
  const VerticleIconButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
