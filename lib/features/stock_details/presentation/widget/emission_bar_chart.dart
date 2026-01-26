import 'package:flutter/material.dart';

class EmissionBarChart extends StatelessWidget {
  const EmissionBarChart();

  @override
  Widget build(BuildContext context) {
    final values = [1.2, 1.5, 1.8, 2.0, 2.3, 2.5];
    final years = ['2020', '2021', '2022', '2023', '2024', '2025'];

    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(values.length, (index) {
          final value = values[index];
          return Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: value * 30,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  years[index],
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ],
            ),
          ));
        }));
  }
}
