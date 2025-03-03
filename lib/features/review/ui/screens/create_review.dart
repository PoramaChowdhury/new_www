import 'package:flutter/material.dart';

class CreateReview extends StatefulWidget {
  static const String name = "/create-review";
  const CreateReview({super.key});

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Write Review"),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              height: 2,
              color: Colors.grey.shade200,)),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              spacing: 24,
              children: [
                const SizedBox(height: 66,),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(
                    hintText: "First Name",
                  ),
                ),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(
                    hintText: "Last Name",
                  ),
                ),
                TextFormField(
                  controller: _reviewTEController,
                  maxLines: 7,
                  decoration: const InputDecoration(
                    hintText: "Write review",

                  ),
                ),
                ElevatedButton(
                    onPressed: (){},
                    child: const Text("Submit"))
                    ],
                  ),
          )),
    );
  }
  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _reviewTEController.dispose();
    super.dispose();
  }
}
