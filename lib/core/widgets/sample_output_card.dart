import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SampleOutputCard extends StatefulWidget {
  const SampleOutputCard({required this.output, super.key});

  final String output;

  @override
  State<SampleOutputCard> createState() => _SampleOutputCardState();
}

class _SampleOutputCardState extends State<SampleOutputCard> {
  bool _visible = true;

  Future<void> _copyOutput() async {
    await Clipboard.setData(ClipboardData(text: widget.output));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sample output ကို copy လုပ်ပြီးပါပြီ။')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
            child: Row(
              children: [
                Icon(Icons.terminal_rounded, color: colorScheme.primary),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text('Sample output',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                IconButton(
                  tooltip: 'Output ပြ/ဖျောက်ရန်',
                  onPressed: () => setState(() => _visible = !_visible),
                  icon: Icon(_visible ? Icons.visibility_off : Icons.visibility),
                ),
                IconButton(
                  tooltip: 'Output copy လုပ်ရန်',
                  onPressed: _visible ? _copyOutput : null,
                  icon: const Icon(Icons.copy),
                ),
              ],
            ),
          ),
          if (_visible)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: colorScheme.surfaceContainerHighest,
              child: SelectableText(
                widget.output,
                style: const TextStyle(fontFamily: 'monospace', height: 1.5),
              ),
            ),
        ],
      ),
    );
  }
}
