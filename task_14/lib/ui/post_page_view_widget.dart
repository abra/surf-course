import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/post.dart';

class PostPageViewWidget extends StatefulWidget {
  const PostPageViewWidget({
    super.key,
    required this.postId,
    required this.posts,
  });

  final int postId;
  final List<Post> posts;

  @override
  State<PostPageViewWidget> createState() => _PostPageViewWidgetState();
}

class _PostPageViewWidgetState extends State<PostPageViewWidget> {
  late int _currentPost;
  late List<Post> _posts;
  late PageController _pageController;

  void _onPageChanged() {
    final prevPage = _currentPost;
    _currentPost = _pageController.page?.round() ?? _currentPost;
    if (prevPage != _currentPost) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _currentPost = widget.postId - 1;
    _posts = widget.posts;
    _pageController = PageController(
      initialPage: _currentPost,
      viewportFraction: 0.85,
    );
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController
      ..removeListener(_onPageChanged)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        foregroundColor: black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'SF Pro Display Regular',
                    fontWeight: FontWeight.w700,
                    color: black,
                  ),
                  children: [
                    TextSpan(
                      text: '${_currentPost + 1}',
                    ),
                    TextSpan(
                      text: '/${_posts.length}',
                      style: const TextStyle(
                        color: grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _posts.length,
        itemBuilder: (_, index) {
          return AnimatedScale(
            duration: const Duration(milliseconds: 300),
            scale: _currentPost == index ? 1 : 0.9,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                bottom: 60.0,
              ),
              child: GestureDetector(
                onTap: () => _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                ),
                child: SizedBox.expand(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                        image: AssetImage(_posts[index].path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
