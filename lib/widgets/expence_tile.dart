import 'package:expence_blaster_yt/models/expence.dart';
import 'package:flutter/material.dart';

class ExpenceTile extends StatelessWidget {
  const ExpenceTile({super.key, required this.expence});

  final ExpenceModel expence;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromARGB(255, 241, 243, 242),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expence.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    expence.amount.toStringAsFixed(2),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(CategoryIcons[expence.category]),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(expence.getFormatedDate)
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
