import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/app/view/widgets/popular_news_widget.dart';
import 'package:newsapp/app/viewmodel/news_view_model.dart';
import 'package:newsapp/global/theme/text_theme.dart';
import 'package:newsapp/global/widgets/vspace.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Timer? _debounceTimer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Search News",
          style: AppStyle.blackBold24,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Vspace(
              height: 20,
            ),
            _buildSearchField(),
            const Vspace(
              height: 20,
            ),
            const Expanded(
                child: PopularNews(
              isPhysicsRequired: true,
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (_debounceTimer != null && _debounceTimer!.isActive) {
            _debounceTimer!.cancel();
          }
          _debounceTimer = Timer(const Duration(milliseconds: 500), () {
            context.read<NewsViewModel>().fetchEveryThing(value, context);
          });
        },
      ),
    );
  }
}
