import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'campaign_controller.dart';
import '../../widgets/campaign_card.dart';

class CampaignMatchingView extends GetView<CampaignController> {
  const CampaignMatchingView({super.key});

  @override
  Widget build(BuildContext context) {
    final campaigns = List.generate(
      6,
      (i) => {
        "title": "회사명 나오는 자리",
        "subtitle": "소개말 나오는 자리입니다 한줄만 나옵니다....",
        "image": [
          "https://images.pexels.com/photos/3184360/pexels-photo-3184360.jpeg?auto=compress&cs=tinysrgb&w=200&h=120",
          "https://images.pexels.com/photos/3184436/pexels-photo-3184436.jpeg?auto=compress&cs=tinysrgb&w=200&h=120",
          "https://images.pexels.com/photos/3184465/pexels-photo-3184465.jpeg?auto=compress&cs=tinysrgb&w=200&h=120",
        ][i % 3],
        "categories": ["F&B", "패션", "육아/키즈", "리빙/인테리어"],
      },
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(135),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0.5,
            flexibleSpace: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, bottom: 4),
                    child: Text(
                      "캠페인 매칭",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  // TabBar below title
                  const TabBar(
                    indicatorColor: Colors.purple,
                    labelColor: Colors.purple,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "신청"),
                      Tab(text: "진행중"),
                      Tab(text: "완료"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        body: TabBarView(
          children: [
            _buildList(campaigns),
            _buildList(campaigns),
            _buildList(campaigns),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<Map<String, dynamic>> campaigns) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: campaigns.length,
      itemBuilder: (context, index) {
        final c = campaigns[index];
        return CampaignCard(
          title: c["title"] as String,
          subtitle: c["subtitle"] as String,
          imageUrl: c["image"] as String,
          categories: List<String>.from(c["categories"] as List),
        );
      },
    );
  }
}
