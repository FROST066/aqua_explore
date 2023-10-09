import 'package:aqua_explore/pages/auth/change_email.dart';
import 'package:aqua_explore/pages/auth/change_password.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Image.asset("assets/images/profile_image.png"),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * .9,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          // padding: const EdgeInsets.all(5),
                          constraints: const BoxConstraints(
                            maxHeight: 250,
                            maxWidth: 250,
                            minWidth: 135,
                            minHeight: 135,
                          ),
                          height: MediaQuery.of(context).size.width * 0.32,
                          width: MediaQuery.of(context).size.width * 0.32,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset("assets/images/profile_image.png", fit: BoxFit.cover)),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(color: primaryBlue, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: Material(
                    elevation: 0,
                    color: Colors.transparent,
                    textStyle: const TextStyle(fontSize: 15, color: primaryBlue, fontWeight: FontWeight.w600),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text("Notifications"), CustomSwitch()],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Language"),
                              Text(
                                "Default",
                                style: TextStyle(color: Color(0xFFD9D9D9)),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(
                            () => const ChangePassword(),
                            transition: Transition.rightToLeft,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text("Change password")],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(
                            () => const ChangeEmail(),
                            transition: Transition.rightToLeft,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [Text("Change e-mail")],
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
