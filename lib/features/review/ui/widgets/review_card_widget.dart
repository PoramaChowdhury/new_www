import 'package:flutter/material.dart';

import '../../data/models/review_list_model.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({
    super.key,
    required this.results,
  });
final Results results;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 0,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 8,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: results.user?.avatarUrl?.isNotEmpty == true
                            ? ClipOval(child: Image.network(results.user!.avatarUrl!,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      errorBuilder: (context, object, stackTrace){
                              return const Icon(Icons.person_outline);
                      },
                    ))
                            : const Icon(Icons.person_outline),
                    ),
                  Text(
                    (results.user?.firstName?.isNotEmpty == true)
                        ? "${results.user?.firstName} ${results.user?.lastName}"
                        : "Hasinul Huda Enu",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black54
                  ),),
                ],
              ),
              Text(
                  (results.comment?.isNotEmpty ==true)
                      ? "${results.comment}"
                      : "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem ",
                  style: TextTheme.of(context).bodyLarge
              )
            ],
          ),
        ),
      ),
    );
  }
}