// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:netflix_clone/export_screens.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List contentList;
  final bool isOrignals;
  const ContentList({
    Key? key,
    required this.title,
    required this.contentList,
    this.isOrignals = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: isOrignals ? 550 : 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                final content = contentList[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: isOrignals ? 400.0 : 200.0,
                    width: isOrignals ? 200 : 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            content.imageUrl,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
