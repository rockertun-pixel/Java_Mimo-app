import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/lesson_model.dart';
import '../../../data/models/quiz_question_model.dart';
import '../providers/quiz_providers.dart';
import 'quiz_result_screen.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({required this.lesson, super.key});

  final LessonModel lesson;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(quizQuestionsProvider(lesson.id));

    return Scaffold(
      appBar: AppBar(title: Text('${lesson.titleMyanmar} Quiz')),
      body: questions.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Quiz data ဖတ်မရပါ။\n$error')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('ဤသင်ခန်းစာအတွက် Quiz မရှိသေးပါ။'));
          }
          return _QuizRunner(lesson: lesson, questions: items);
        },
      ),
    );
  }
}

class _QuizRunner extends StatefulWidget {
  const _QuizRunner({required this.lesson, required this.questions});

  final LessonModel lesson;
  final List<QuizQuestionModel> questions;

  @override
  State<_QuizRunner> createState() => _QuizRunnerState();
}

class _QuizRunnerState extends State<_QuizRunner> {
  int _questionIndex = 0;
  int _correctAnswers = 0;
  int? _selectedIndex;
  bool _submitted = false;

  QuizQuestionModel get _question => widget.questions[_questionIndex];

  void _submitOrContinue() {
    final selected = _selectedIndex;
    if (selected == null) return;

    if (!_submitted) {
      setState(() => _submitted = true);
      return;
    }

    final nextScore = _correctAnswers + (_question.isCorrect(selected) ? 1 : 0);
    if (_questionIndex == widget.questions.length - 1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => QuizResultScreen(
            lesson: widget.lesson,
            correctAnswers: nextScore,
            totalQuestions: widget.questions.length,
          ),
        ),
      );
      return;
    }

    setState(() {
      _correctAnswers = nextScore;
      _questionIndex++;
      _selectedIndex = null;
      _submitted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selectedIndex;
    final isCorrect = selected != null && _question.isCorrect(selected);

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'မေးခွန်း ${_questionIndex + 1} / ${widget.questions.length}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        LinearProgressIndicator(
          value: (_questionIndex + 1) / widget.questions.length,
        ),
        const SizedBox(height: 28),
        Text(_question.questionMyanmar,
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 20),
        for (var index = 0; index < _question.options.length; index++)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _AnswerOption(
              index: index,
              text: _question.options[index],
              selected: selected == index,
              enabled: !_submitted,
              onTap: () => setState(() => _selectedIndex = index),
            ),
          ),
        if (_submitted)
          Card(
            color: isCorrect
                ? Colors.green.withOpacity(0.14)
                : Theme.of(context).colorScheme.errorContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '${isCorrect ? 'အဖြေမှန်ပါသည်။' : 'အဖြေမမှန်သေးပါ။'}\n${_question.explanationMyanmar}',
              ),
            ),
          ),
        const SizedBox(height: 20),
        FilledButton(
          onPressed: selected == null ? null : _submitOrContinue,
          child: Text(
            !_submitted
                ? 'အဖြေစစ်မည်'
                : _questionIndex == widget.questions.length - 1
                    ? 'ရလဒ်ကြည့်မည်'
                    : 'နောက်မေးခွန်း',
          ),
        ),
      ],
    );
  }
}

class _AnswerOption extends StatelessWidget {
  const _AnswerOption({
    required this.index,
    required this.text,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  final int index;
  final String text;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outlineVariant,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              child: Text(String.fromCharCode(65 + index)),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
