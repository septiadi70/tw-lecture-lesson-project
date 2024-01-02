
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trinity_lecture_app/core/commons/constants.dart';
import 'package:trinity_lecture_app/core/routes/app_router.gr.dart';
import 'package:trinity_lecture_app/presentation/pages/dummy_ui_page/widgets/dummy_grid_card.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/title_section_text.dart';
import 'package:trinity_lecture_app/presentation/widgets/molecules/action_text.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class DummyUIFirstPage extends StatelessWidget {
  const DummyUIFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy UI'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UIHelper.padding(all: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ActionText(
                onTap: () => AutoRouter.of(context).push(const DummyUISecondRoute()), 
                title: 'Next', 
                desc: 'Tab Bar, GridView, ListView',
              ),
              const TitleSectionText(
                'CONTAINER AND TEXT',
              ),
              UIHelper.verticalSpace(10),
              NewsCard(imgSrc: Constants.dummyImg, title: 'How can I be Flutter Developer Expert?', desc: 'Jill Lepore * 23 May 2023'),
              UIHelper.verticalSpace(30),
              const TitleSectionText(
                'COLUMN',
              ),
              UIHelper.verticalSpace(10),
              Column(
                children: [
                  NewsCard(imgSrc: Constants.dummyImg, title: 'How can I be Flutter Developer Expert?', desc: 'Jill Lepore * 23 May 2023'),
                  UIHelper.verticalSpace(10),
                  NewsCard(imgSrc: Constants.dummyImg, title: 'How can I be Flutter Developer Expert?', desc: 'Jill Lepore * 23 May 2023'),
                ],
              ),
              UIHelper.verticalSpace(30),
              const TitleSectionText(
                'ROW',
              ),
              UIHelper.verticalSpace(10),
              Row(
                children: [
                  const Flexible(child: DummyGridCard(title: 'Container 1'),),
                  UIHelper.horizontalSpace(10),
                  const Flexible(child: DummyGridCard(title: 'Container 2'),),
                  UIHelper.horizontalSpace(10),
                  const Flexible(child: DummyGridCard(title: 'Container 3'),),
                ],
              ),
              UIHelper.verticalSpace(30),
              const TitleSectionText(
                'BUTTON',
              ),
              UIHelper.verticalSpace(10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {}, 
                  child: const Text('SUBMIT'),
                ),
              ),
              UIHelper.verticalSpace(30),
              const TitleSectionText(
                'INPUT',
              ),
              UIHelper.verticalSpace(10),
              TextFormFieldCustom(
                title: 'Email',
                hintText: 'Enter your email',
                preffixIcon: SvgPicture.asset('assets/svgs/email_icon.svg'),
              ),
              UIHelper.verticalSpace(30),
              const TitleSectionText(
                'IMAGE ASSETS, SIZED BOX, AND EXPANDED',
              ),
              UIHelper.verticalSpace(10),
              Row(
                children: [
                  const Expanded(child: DummyGridCard(title: 'Container 1')),
                  UIHelper.horizontalSpace(10),
                  const DummyGridCard(title: 'Container 2'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}