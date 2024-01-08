import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trinity_lecture_app/infrastructure/common/dtos/article_model.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class NewsAppPopularPage extends StatefulWidget {
  const NewsAppPopularPage({super.key});

  @override
  State<NewsAppPopularPage> createState() => _NewsAppPopularPageState();
}

class _NewsAppPopularPageState extends State<NewsAppPopularPage> {
  final List<ArticleModel> _articles = [
    ArticleModel(id: '100000009248582', title: 'What Biden Needs to Tell Us', byline: 'By David Brooks', multimedia: ['images/2024/01/04/opinion/04brooks1/04brooks1-thumbStandard.jpg'], publishedDate: '2024-01-04'),
    ArticleModel(id: '100000009235275', title: 'Waiting for Snow in the Netherlands', byline: 'By Benjamin Moser', multimedia: ['images/2024/01/04/opinion/02moser/02moser-thumbStandard.jpg'], publishedDate: '2024-01-03'),
    ArticleModel(id: '100000009230514', title: 'This Year, Make a Resolution About Something Bigger Than Yourself', byline: 'By Roger Rosenblatt', multimedia: ['images/2023/12/30/opinion/26rosenblatt/26rosenblatt-thumbStandard.jpg'], publishedDate: '2023-12-26'),
    ArticleModel(id: '100000009232651', title: 'Renovating a Kitchen? Don’t Forget the Most Crucial Thing: Light.', byline: 'By Tim McKeough', multimedia: ['images/2024/01/07/realestate/02fix01/oakImage-1703263808894-thumbStandard.jpg'], publishedDate: '2024-01-02'),
    ArticleModel(id: '100000009207596', title: 'The People Who Brought You Travis Kelce', byline: 'By Zach Schonbrun', multimedia: ['images/2023/01/02/multimedia/02TRAVIS-KELCE-TEAM-05-hkpc/02TRAVIS-KELCE-TEAM-05-hkpc-thumbStandard.jpg'], publishedDate: '2024-01-02'),
    ArticleModel(id: '100000009242488', title: 'Cats Filled the Prison. Then the Inmates Fell in Love.', byline: 'By Jack Nicas', multimedia: ['images/2023/12/31/multimedia/31chile-prison-cats7-wfcg/31chile-prison-cats7-wfcg-thumbStandard.jpg'], publishedDate: '2023-12-31'),
    ArticleModel(id: '100000008677561', title: '5 Exercises to Keep an Aging Body Strong and Fit', byline: 'By Connie Chang', multimedia: ['images/2023/03/07/multimedia/-01WELL-AGING-EXERCISES21-bzjq/-01WELL-AGING-EXERCISES21-bzjq-thumbStandard.jpg'], publishedDate: '2023-03-01'),
    ArticleModel(id: '100000009222499', title: 'Caregivers Helped Us Be a Family. Everyone Should Have That Option.', byline: 'By Rachael Scarborough King', multimedia: ['images/2024/01/08/opinion/01king/01king-thumbStandard.jpg'], publishedDate: '2024-01-01'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Most Popular Articles',
        ),
      ),
      body: Padding(
        padding: UIHelper.padding(horizontal: 20),
        child: ListView.builder(
          itemCount: _articles.length,
          itemBuilder: (context, index) {
            final article = _articles[index];
            return Padding(
              padding: UIHelper.padding(vertical: 5),
              child: NewsCard(
                imgSrc: article.multimediaConverted, 
                title: article.title, 
                desc: '${article.byline} * ${article.publishedDateConverted}'
              ),
            );
          },
        ),
      ),
    );
  }
}