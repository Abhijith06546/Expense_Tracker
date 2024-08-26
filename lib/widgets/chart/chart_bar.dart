import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  //ChartBar is a StatelessWidget that displays a single bar in the chart.
  // fill represents the height of the bar relative to the maximum height.
  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          ////FractionallySizedBox uses heightFactor to set the height of the bar relative to the maximum value.
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(8)),
              color: isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.65),
            ),
          ),
        ),
      ),
    );
  }
}

// DecoratedBox creates the visual appearance of the bar with rounded top corners.
// Adjusts the bar color based on whether the app is in dark mode or light mode