import 'package:aqua_explore/pages/quizz_page_items/on_finish_quizz_page.dart';
import 'package:aqua_explore/pages/quizz_page_items/on_questionning_page.dart';
import 'package:aqua_explore/pages/quizz_page_items/on_start_quizz_page.dart';
import 'package:flutter/material.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  final PageController controller = PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children:  [
        OnStartQuizzPage(controller: controller),
        OnQuestionningPage(controller: controller),
        OnFinishQuizzPage(controller: controller),
      ],
    );
  }
}
