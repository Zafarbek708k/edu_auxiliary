import 'dart:developer';

import 'package:edu_auxiliary/src/core/constants/all_library.dart';

class Subject extends StatefulWidget {
  const Subject({super.key});

  @override
  SubjectState createState() => SubjectState();
}

class SubjectState extends State<Subject> {
  XFile? _selectedImageHW, _selectedImageExam; // Store selected image
  bool imageSendHW = false, imageSendExam = false;

  final ImagePicker _imagePicker = ImagePicker(); // Initialize once to reuse

  // Function to pick an image for homework
  Future<void> selectImageForHW(BuildContext context) async {
    log("select for exam");
    await showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: BorderSide(color: context.appTheme.secondary)),
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.camera, color: context.appTheme.secondary),
            title: CustomTextWidget('Take Photo', textColor: context.appTheme.secondary),
            onTap: () async {
              final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
              setState(() {
                _selectedImageHW = pickedFile;
                imageSendHW = false;
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library, color: context.appTheme.secondary),
            title: CustomTextWidget('Choose from Gallery', textColor: context.appTheme.secondary),
            onTap: () async {
              final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
              setState(() {
                _selectedImageHW = pickedFile;
                imageSendHW = false;
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  // Function to send the selected homework image
  Future<void> sendImageForHW() async {
    if (_selectedImageHW != null) {
      setState(() {
        imageSendHW = true;
      });
      // Implement actual send logic here
    }
  }

  // Function to pick an image for the exam
  Future<void> selectImageForExam(BuildContext context) async {
    log("select for exam");
    await showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: BorderSide(color: context.appTheme.secondary)),
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.camera, color: context.appTheme.secondary),
            title: CustomTextWidget('Take Photo', textColor: context.appTheme.secondary),
            onTap: () async {
              final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
              setState(() {
                _selectedImageExam = pickedFile;
                imageSendExam = false;
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library, color: context.appTheme.secondary),
            title: CustomTextWidget('Choose from Gallery', textColor: context.appTheme.secondary),
            onTap: () async {
              final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
              setState(() {
                _selectedImageExam = pickedFile;
                imageSendExam = false;
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  // Function to send the selected exam image
  Future<void> sendImageForExam() async {
    if (_selectedImageExam != null) {
      setState(() {
        imageSendExam = true;
      });
      // Implement actual send logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        centerTitle: true,
        forceMaterialTransparency: true,
        title: CustomTextWidget(
          "Subject",
          textColor: context.appTheme.secondary,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        iconTheme: IconThemeData(color: context.appTheme.secondary),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 2),
          child: Divider(color: context.appTheme.secondary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            CustomTextWidget(
              "Lesson Time 00:00 - 00:00",
              textColor: context.appTheme.secondary,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: REdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                padding: REdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: context.appTheme.secondary),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget("Home Work title:", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
                    SizedBox(height: 10.h),
                    CustomTextWidget("1. Reading from 14 to 16 page", textColor: context.appTheme.secondary, fontWeight: FontWeight.w400),
                    SizedBox(height: 10.h),
                    CustomTextWidget("2. Listening 2 section in 4-unit", textColor: context.appTheme.secondary, fontWeight: FontWeight.w400),
                  ],
                ),
              ),
            ),
            // Homework image display and selection button
            ImageWidget(file: _selectedImageHW),
            CustomTextWidget("Home Work send button", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
            SelectAndSend(
              isSend: imageSendHW,
              selectImage: ()async{
                await selectImageForHW(context);
              },
              sendImage: ()async{
               await sendImageForHW();
              },
            ),
            CustomTextWidget("Exam Deadline", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
            Padding(
              padding: REdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                padding: REdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: context.appTheme.secondary),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget("Deadline from 12.11.2024 to 15.11.2024", textColor: context.appTheme.secondary, fontWeight: FontWeight.w400),
                  ],
                ),
              ),
            ),
            // Exam image display and selection button
            ImageWidget(file: _selectedImageExam),
            CustomTextWidget("Exam send button", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
            SelectAndSend(
              isSend: imageSendExam,
              selectImage: () async{
               await selectImageForExam(context);
              },
              sendImage: ()async{
                await sendImageForExam();
              },
            ),
          ],
        ),
      ),
    );
  }
}


class SelectAndSend extends StatelessWidget {
  const SelectAndSend({super.key, required this.selectImage, required this.sendImage, required this.isSend});
  final VoidCallback selectImage, sendImage;
  final bool isSend;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MainButton(
            onPressed: selectImage,
            title: "Select Image",
            verticalPadding: 10,
            radius: 10,
          ),
        ),
        SizedBox(width: 25.w),
        Expanded(
          child: MainButton(
            onPressed: sendImage,
            title: "Send Image",
            verticalPadding: 10,
            radius: 10,
            rightIcon: isSend ? const Icon(Icons.done_all_rounded) : const Icon(Icons.send_and_archive_outlined),
          ),
        ),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, this.file});

  final XFile? file;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 10.0),
      child: file != null
          ? Image.file(
              File(file!.path),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          : Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[200],
              child: Center(
                child: CustomTextWidget("No image selected", textColor: context.appTheme.secondary),
              ),
            ),
    );
  }
}
