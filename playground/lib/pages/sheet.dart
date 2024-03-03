import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

enum SheetStyle {
  primary,
  side,
}

class SheetPage extends StatelessWidget {
  const SheetPage({
    super.key,
    required this.style,
  });

  final SheetStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: () {
            return switch (style) {
              SheetStyle.primary => ShadButton.outline(
                  text: const Text('Open'),
                  onPressed: () => showShadSheet(
                    side: ShadSheetSide.right,
                    context: context,
                    builder: (context) => const EditProfileSheet(),
                  ),
                ),
              SheetStyle.side => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShadButton.outline(
                          width: 100,
                          text: const Text('Top'),
                          onPressed: () => showShadSheet(
                            side: ShadSheetSide.top,
                            context: context,
                            builder: (context) =>
                                const EditProfileSheet(side: ShadSheetSide.top),
                          ),
                        ),
                        ShadButton.outline(
                          width: 100,
                          text: const Text('Bottom'),
                          onPressed: () => showShadSheet(
                            side: ShadSheetSide.bottom,
                            context: context,
                            builder: (context) => const EditProfileSheet(
                                side: ShadSheetSide.bottom),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShadButton.outline(
                          width: 100,
                          text: const Text('Right'),
                          onPressed: () => showShadSheet(
                            side: ShadSheetSide.right,
                            context: context,
                            builder: (context) => const EditProfileSheet(
                                side: ShadSheetSide.right),
                          ),
                        ),
                        ShadButton.outline(
                          width: 100,
                          text: const Text('Left'),
                          onPressed: () => showShadSheet(
                            side: ShadSheetSide.left,
                            context: context,
                            builder: (context) => const EditProfileSheet(
                                side: ShadSheetSide.left),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            };
          }(),
        ),
      ),
    );
  }
}

final profile = [
  (title: 'Name', value: 'Alexandru'),
  (title: 'Username', value: 'nank1ro'),
];

class EditProfileSheet extends StatelessWidget {
  const EditProfileSheet({super.key, this.side});

  final ShadSheetSide? side;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadSheet(
      title: const Text('Edit Profile'),
      description: const Text(
          "Make changes to your profile here. Click save when you're done"),
      content: SizedBox(
        width: side == ShadSheetSide.bottom || side == ShadSheetSide.top
            ? MediaQuery.sizeOf(context).width
            : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: profile
                .map(
                  (p) => Row(
                    children: [
                      Expanded(
                        child: Text(
                          p.title,
                          textAlign: TextAlign.end,
                          style: theme.textTheme.small,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 3,
                        child: ShadInput(initialValue: p.value),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
      actions: const [
        ShadButton(text: Text('Save changes')),
      ],
    );
  }
}
