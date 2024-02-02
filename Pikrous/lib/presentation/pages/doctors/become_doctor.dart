import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pikrous/helper/utils/colors.dart';

class BecomeDoctors extends StatefulWidget {
  const BecomeDoctors({super.key});

  @override
  State<BecomeDoctors> createState() => _BecomeDoctorsState();
}

class _BecomeDoctorsState extends State<BecomeDoctors> {
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedCategory;
  List<String> categories = [
    '1 Years',
    '2 Years',
    '3 Years',
    '4 Years',
    '5 Years',
    '6 Years',
    '7 Years',
    '8 Years',
    '9 Years',
    '10+ Years',
  ];

  PickedFile? _selectedImage;

  Future<void> _selectImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = PickedFile(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Become a Doctor',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                DottedBorder(
                  strokeWidth: 1,
                  dashPattern: const [10, 6],
                  color: primaryColor,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: const Text("Upload CV"),
                            content: CupertinoScrollbar(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CupertinoDialogAction(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _selectImage(ImageSource.camera);
                                      },
                                      child: const Text("Take a Photo"),
                                    ),
                                    CupertinoDialogAction(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _selectImage(ImageSource.gallery);
                                      },
                                      child: const Text("Choose from Gallery"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      color: primaryColor.withOpacity(0.23),
                      child: _selectedImage == null
                          ? const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_upload_outlined,
                                  color: primaryColor,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Upload your CV as Image here",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            )
                          : Image.file(
                              File(_selectedImage!.path),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Years of Experience',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const Spacer(),
                    DropdownButton<String>(
                      value: _selectedCategory,
                      items: categories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategory = newValue;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _descriptionController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'Enter your description',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: primaryColor
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
