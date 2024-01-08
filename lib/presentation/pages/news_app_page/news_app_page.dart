import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trinity_lecture_app/core/commons/colors_const.dart';
import 'package:trinity_lecture_app/core/routes/app_router.gr.dart';
import 'package:trinity_lecture_app/infrastructure/common/dtos/article_model.dart';
import 'package:trinity_lecture_app/presentation/pages/news_app_page/widgets/news_section_title_text.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class NewsAppPage extends StatefulWidget {
  const NewsAppPage({super.key});

  @override
  State<NewsAppPage> createState() => _NewsAppPageState();
}

class _NewsAppPageState extends State<NewsAppPage> {
  final List<ArticleModel> _articles = [
    ArticleModel(id: '100000009248582', title: 'What Biden Needs to Tell Us', byline: 'By David Brooks', multimedia: ['images/2024/01/04/opinion/04brooks1/04brooks1-thumbStandard.jpg'], publishedDate: '2024-01-04'),
    ArticleModel(id: '100000009235275', title: 'Waiting for Snow in the Netherlands', byline: 'By Benjamin Moser', multimedia: ['images/2024/01/04/opinion/02moser/02moser-thumbStandard.jpg'], publishedDate: '2024-01-03'),
    ArticleModel(id: '100000009230514', title: 'This Year, Make a Resolution About Something Bigger Than Yourself', byline: 'By Roger Rosenblatt', multimedia: ['images/2023/12/30/opinion/26rosenblatt/26rosenblatt-thumbStandard.jpg'], publishedDate: '2023-12-26'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
        ),
      ),
      body: Padding(
        padding: UIHelper.padding(horizontal: 20),
        child: Column(
          children: [
            const NewsSectionTitleText(
              title: 'Top Stories', 
              subtitle: 'Top stories from all time',
            ),
            UIHelper.verticalSpace(5),
            ElevatedButton(
              onPressed: () => AutoRouter.of(context).push(const NewsAppTopStoriesRoute()), 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: UIHelper.padding(all: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: ColorConstant.primary,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Go To Categories Section',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: ColorConstant.primary
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_double_arrow_right,
                    color: ColorConstant.primary,
                    size: 30,
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(20),
            NewsSectionTitleText(
              title: 'Most Popular Articles', 
              subtitle: 'Top articles from last week',
              buttonText: 'See All',
              onPressed: () {
                AutoRouter.of(context).push(const NewsAppPopularRoute());
              },
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}