import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeViewer extends StatefulWidget {
  const CodeViewer({required this.code, this.title = 'Code example', super.key});

  final String code;
  final String title;

  @override
  State<CodeViewer> createState() => _CodeViewerState();
}

class _CodeViewerState extends State<CodeViewer> {
  bool _copied = false;

  Future<void> _copyCode() async {
    await Clipboard.setData(ClipboardData(text: widget.code));
    if (!mounted) return;
    setState(() => _copied = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Code ကို copy လုပ်ပြီးပါပြီ။')),
    );
    Future<void>.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final lines = widget.code.split('\n');
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      color: colorScheme.surfaceContainerHighest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: colorScheme.primaryContainer,
            child: Row(
              children: [
                Icon(Icons.code_rounded, size: 20, color: colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(widget.title,
                      style: Theme.of(context).textTheme.labelLarge),
                ),
                IconButton(
                  tooltip: 'Code copy လုပ်ရန်',
                  onPressed: _copyCode,
                  icon: Icon(_copied ? Icons.check : Icons.copy),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _LineNumbers(lineCount: lines.length),
                const SizedBox(width: 16),
                SelectableText(
                  widget.code,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LineNumbers extends StatelessWidget {
  const _LineNumbers({required this.lineCount});

  final int lineCount;

  @override
  Widget build(BuildContext context) {
    return Text(
      List<String>.generate(lineCount, (index) => '${index + 1}')
          .join('\n'),
      textAlign: TextAlign.right,
      style: TextStyle(
        fontFamily: 'monospace',
        fontSize: 14,
        height: 1.6,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
