import 'package:aqua_explore/utils/data.dart';
import 'package:flutter/material.dart';

class LanguagePickerDialog extends StatefulWidget {
  const LanguagePickerDialog({super.key});
  @override
  State<LanguagePickerDialog> createState() => _LanguagePickerDialogState();
}

class _LanguagePickerDialogState extends State<LanguagePickerDialog> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
          width: MediaQuery.of(context).size.width * .7,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: languages
                .map((e) => InkWell(
                      onTap: () => setState(() => selectedIndex = languages.indexOf(e)),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(e,
                                  style: const TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                            ),
                            if (selectedIndex == languages.indexOf(e)) const Icon(Icons.check, size: 19)
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
