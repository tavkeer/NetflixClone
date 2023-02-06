// import 'package:netflix_clone/auth/signin_page.dart';
import 'package:netflix_clone/auth/signin_page.dart';
import 'package:netflix_clone/export_screens.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final height = MediaQuery.of(context).size.height;
    final formKey = GlobalKey<FormState>();
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Positioned(
              top: 50,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.cancel),
                color: Colors.grey,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Positioned(
              top: height * 0.13,
              child: SizedBox(
                width: width,
                child: const Text(
                  'Ready to watch?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Positioned(
              top: height * 0.21,
              child: SizedBox(
                width: width,
                child: const Text(
                  'Enter your email to create or sign in to your\naccount.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Positioned(
              top: height * 0.3,
              child: SizedBox(
                width: width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      controller: controller,
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val!)
                            ? null
                            : "Please enter a valid email";
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text("Email"),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 17,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.42,
              child: GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignInPage(
                                email: controller.text,
                              )),
                    );
                  }
                },
                child: SizedBox(
                  width: width,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFFA2A1B),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "GET STARTED",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
