import 'package:flutter/material.dart';
import 'package:hot_or_cold_game/core/base/widget/base_widget.dart';
import 'package:hot_or_cold_game/core/extension/context_extension.dart';
import 'package:hot_or_cold_game/view/home/model/result_enum.dart';
import 'package:hot_or_cold_game/view/home/viewmodel/hot_cold_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/component/button/standard_elevated_button.dart';
import '../../../core/component/lottie/lottie_widget.dart';

class HotColdVieww extends StatefulWidget {
  const HotColdVieww({super.key});

  @override
  State<HotColdVieww> createState() => _HotColdViewwState();
}

class _HotColdViewwState extends BaseState<HotColdVieww> {
  HotColdViewModel viewModel = HotColdViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView<HotColdViewModel>(
      onDispose: () {},
      viewModel: HotColdViewModel(),
      onModelReady: (model) {
        context;
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, HotColdViewModel value) => Scaffold(
        appBar: AppBar(
          title: const Text('Hot or Cold'),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Observer(
                          builder: (context) {
                            return Container(
                              width: dynamicWidth(0.2),
                              height: dynamicHeight(0.15),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(context.borderRadius),
                                color: viewModel.resultEnum == ResultEnum.HOT
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                              child: const Icon(Icons.wb_sunny),
                            );
                          },
                        )
                        // Observer(
                        //   builder: (context) {
                        //     return Container(
                        //       width: dynamicWidth(0.2),
                        //       height: dynamicHeight(0.15),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(
                        //             context.borderRadius),
                        //       ),
                        //       color: viewModel.resultEnum == ResultEnum.HOT
                        //           ? Colors.red
                        //           : Colors.grey,
                        //       child: const Icon(Icons.wb_sunny),
                        //     );
                        //   },
                        // )
                        // greenObserver(),
                        // coldObserver(),
                      ],
                    ),
                    // buildGuessContainer(),
                    // makeGuessButton(),
                    // cheatElevatedButton(),
                  ],
                )
                //hotOrColdColumn(),
                // Flexible(
                //   flex: 1,
                //   child: randomShower(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildView() {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              hotOrColdColumn(),
              // Flexible(
              //   flex: 1,
              //   child: randomShower(),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Column hotOrColdColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //hotObserver(),
              greenObserver(),
              coldObserver(),
            ],
          ),
        ),
        buildGuessContainer(),
        makeGuessButton(),
        cheatElevatedButton(),
      ],
    );
  }

  Observer hotObserver() {
    return Observer(
      builder: (context) {
        return Container(
          width: dynamicWidth(0.2),
          height: dynamicHeight(0.15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.borderRadius),
          ),
          color:
              viewModel.resultEnum == ResultEnum.HOT ? Colors.red : Colors.grey,
          child: const Icon(Icons.wb_sunny),
        );
      },
    );
  }

  Observer greenObserver() {
    return Observer(
      builder: (context) {
        return Container(
          width: dynamicWidth(0.2),
          height: dynamicHeight(0.15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.borderRadius),
              color: viewModel.resultEnum == ResultEnum.HIT
                  ? Colors.green
                  : Colors.grey),
          child: viewModel.resultEnum == ResultEnum.HIT
              ? const LottieWidget(
                  path: "17297-fireworks",
                )
              : const Icon(Icons.done),
        );
      },
    );
  }

  Container buildGuessContainer() {
    return Container(
      width: dynamicWidth(0.45),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: context.paddingLow,
          hintText: 'Tahmin Yap',
        ),
        controller: viewModel.myController,
      ),
    );
  }

  StandardElevatedButton makeGuessButton() {
    return StandardElevatedButton(
      onPressed: () {
        viewModel.isHotOrCold(
          int.parse(viewModel.myController.text),
        );
      },
      color: Colors.blue.shade200,
      child: Text(
        'Tahmin Yolla',
        textScaleFactor: context.fixScaleFactor,
      ),
    );
  }

  StandardElevatedButton cheatElevatedButton() {
    return StandardElevatedButton(
        onPressed: () {
          viewModel.changeVisibility();
        },
        color: Colors.blue.shade200,
        child: Observer(
          builder: (context) {
            return viewModel.isVisible
                ? Text(
                    'Cevabı Sakla',
                    textScaleFactor: context.fixScaleFactor,
                  )
                : Text(
                    'Cevabı Göster',
                    textScaleFactor: context.fixScaleFactor,
                  );
          },
        ));
  }

  Observer coldObserver() {
    return Observer(
      builder: (context) {
        return Container(
          width: dynamicWidth(0.2),
          height: dynamicHeight(0.15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.borderRadius),
              color: viewModel.resultEnum == ResultEnum.COLD
                  ? Colors.blue
                  : Colors.grey),
          child: const Icon(Icons.ac_unit),
        );
      },
    );
  }

  Observer randomShower() {
    return Observer(
      builder: (context) {
        return Visibility(
          visible: viewModel.isVisible,
          child: Text(
            viewModel.randomNumber.toString(),
            textScaleFactor: context.fixScaleFactor,
          ),
        );
      },
    );
  }
}
