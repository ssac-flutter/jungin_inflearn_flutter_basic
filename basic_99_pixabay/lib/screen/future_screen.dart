import 'package:basic_99_pixabay/ui/search_screen_widget.dart';
import 'package:flutter/material.dart';

import '../data/api/photo_api.dart';
import '../data/model/photo.dart';
import '../ui/photo_grid_view_widget.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({Key? key}) : super(key: key);

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  final api = PhotoApi();

  // final q = 'apple';
  String q = 'apple';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixarbay Clone'),
      ),
      body: Center(
        child: Column(
          children: [
            // SearchScreen(),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                // Textfield 위젯으로 빼고 싶은데 어떻게 해야할까요?
                child: SearchScreenWidget(onTextChange: (query) {
                  // debounce 처리
                  setState(() {
                    q = query;
                  });

                }),
              ),
            ),
            const SizedBox(height: 30),
            FutureBuilder<List<Photo>>(
                future: api.getPhotos(q),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.hasData == false) {
                    // 로딩
                    return Text(
                      '데이터 없음',
                      style: Theme.of(context).textTheme.displayLarge,
                    );
                  }

                  final photos = snapshot.data!;

                  debugPrint(photos.length.toString());

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: PhotoGridViewWidget(photos: photos),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
