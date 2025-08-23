import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget customAppBarWithTitle(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(110),
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  size: 32,
                  color: Colors.black,
                ),
                onPressed: () => Get.back(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
