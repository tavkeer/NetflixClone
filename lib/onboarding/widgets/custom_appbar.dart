import 'package:flutter/material.dart';

customAppBar(void Function()? ontap) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: Image.asset(
      'assets/netflixlogo.png',
      scale: 3,
    ),
    actions: [
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              const Text(
                'PRIVACY',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: ontap,
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ))
    ],
  );
}
