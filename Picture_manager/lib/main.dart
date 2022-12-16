import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main(){
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("圖片總覽"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("跳轉到第二頁"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(),
                maintainState: false,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _uploadImage,
        child: Icon(Icons.add),
      ),
      // 設置按鈕的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("圖片資訊"),
      ),
      body: Center(
        child: Column(

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.pop(context);
        },
        child: Icon(Icons.home),
      ),
      // 設置按鈕的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

void _uploadImage() async {
  // 選取圖片
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  // 取得 Firebase Storage 的 reference
  final StorageReference storageReference = FirebaseStorage.instance
      .ref()
      .child('image/image1.jpg');
  // 上傳圖片
  final StorageUploadTask uploadTask = storageReference.putFile(
    pickedFile,
    StorageMetadata(
      contentType: 'image/jpeg',
    ),
  );
  // 等待上傳完成
  await uploadTask.onComplete;
  print('Image uploaded successfully');
}
