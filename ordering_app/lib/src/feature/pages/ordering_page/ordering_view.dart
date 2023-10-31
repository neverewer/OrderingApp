import 'package:flutter/material.dart';
import 'package:ordering_app/src/core/models/user.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/ordering_view_model.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/address_form.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/date_picker.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/next_step_button.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/step_display.dart';
import 'package:provider/provider.dart';

class OrderingView extends StatefulWidget {
  const OrderingView({super.key});

  @override
  State<OrderingView> createState() => _OrderingViewState();
}

class _OrderingViewState extends State<OrderingView> with TickerProviderStateMixin {
  final TextEditingController senderNameController = TextEditingController();
  final TextEditingController senderEmailController = TextEditingController();
  final TextEditingController senderPhoneController = TextEditingController();
  final TextEditingController senderCountryController = TextEditingController();
  final TextEditingController senderCityController = TextEditingController();
  final TextEditingController senderAddressLineController = TextEditingController();
  final TextEditingController senderPostcodeController = TextEditingController();
  final TextEditingController recipientNameController = TextEditingController();
  final TextEditingController recipientEmailController = TextEditingController();
  final TextEditingController recipientPhoneController = TextEditingController();
  final TextEditingController recipientCountryController = TextEditingController();
  final TextEditingController recipientCityController = TextEditingController();
  final TextEditingController recipientAddressLineController = TextEditingController();
  final TextEditingController recipientPostcodeController = TextEditingController();

  late TabController _senderTabController;
  late TabController _recipientTabController;

  @override
  void initState() {
    _senderTabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 300),
    );
    _recipientTabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  void disposeControllers() {
    senderNameController.dispose();
    senderEmailController.dispose();
    senderPhoneController.dispose();
    senderCountryController.dispose();
    senderCityController.dispose();
    senderAddressLineController.dispose();
    senderPostcodeController.dispose();
    recipientNameController.dispose();
    recipientEmailController.dispose();
    recipientPhoneController.dispose();
    recipientCountryController.dispose();
    recipientCityController.dispose();
    recipientAddressLineController.dispose();
    recipientPostcodeController.dispose();
    _recipientTabController.dispose();
    _senderTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
              padding: AppSizes.orderingPageContentPadding,
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const StepDisplay(),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Start date',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF172027),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const DatePicker(),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: SenderAddressForm(
                            nameController: senderNameController,
                            emailController: senderEmailController,
                            phoneController: senderPhoneController,
                            countryController: senderCountryController,
                            cityController: senderCityController,
                            addressLineController: senderAddressLineController,
                            postcodeController: senderPostcodeController,
                            tabController: _senderTabController,
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                          child: RecipientAddressForm(
                        nameController: recipientNameController,
                        emailController: recipientEmailController,
                        phoneController: recipientPhoneController,
                        countryController: recipientCountryController,
                        cityController: recipientCityController,
                        addressLineController: recipientAddressLineController,
                        postcodeController: recipientPostcodeController,
                        tabController: _recipientTabController,
                      )),
                      const SizedBox(height: 20),
                      NextStepButton(
                        onPressed: () {
                          if (_recipientTabController.index == 0 && _senderTabController.index == 0) {
                            final sender = User(
                              fullName: senderNameController.text,
                              email: senderEmailController.text,
                              phoneNumber: senderPhoneController.text,
                              country: senderCountryController.text,
                              city: senderCityController.text,
                              address: senderAddressLineController.text,
                              postcode: senderPostcodeController.text,
                            );
                            final recipient = User(
                              fullName: recipientNameController.text,
                              email: recipientEmailController.text,
                              phoneNumber: recipientPhoneController.text,
                              country: recipientCountryController.text,
                              city: recipientCityController.text,
                              address: recipientAddressLineController.text,
                              postcode: recipientPostcodeController.text,
                            );
                            context.read<OrderingViewModel>().createOrderFromAddedData(sender, recipient);
                          } else if (_recipientTabController.index == 0 && _senderTabController.index != 0) {
                            final recipient = User(
                              fullName: recipientNameController.text,
                              email: recipientEmailController.text,
                              phoneNumber: recipientPhoneController.text,
                              country: recipientCountryController.text,
                              city: recipientCityController.text,
                              address: recipientAddressLineController.text,
                              postcode: recipientPostcodeController.text,
                            );
                            context.read<OrderingViewModel>().createOrderFromSelectedSenderAndAddedRecipient(recipient);
                          } else if (_recipientTabController.index != 0 && _senderTabController.index == 0) {
                            final sender = User(
                              fullName: senderNameController.text,
                              email: senderEmailController.text,
                              phoneNumber: senderPhoneController.text,
                              country: senderCountryController.text,
                              city: senderCityController.text,
                              address: senderAddressLineController.text,
                              postcode: senderPostcodeController.text,
                            );
                            context.read<OrderingViewModel>().createOrderFromSelectedSenderAndAddedRecipient(sender);
                          } else {
                            context.read<OrderingViewModel>().createOrderFromSelectedData();
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class SenderAddressForm extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? phoneController;
  final TextEditingController? countryController;
  final TextEditingController? cityController;
  final TextEditingController? addressLineController;
  final TextEditingController? postcodeController;
  final TabController tabController;

  const SenderAddressForm(
      {super.key,
      this.nameController,
      this.emailController,
      this.phoneController,
      this.countryController,
      this.cityController,
      this.addressLineController,
      this.postcodeController,
      required this.tabController});

  @override
  Widget build(BuildContext context) {
    var selectedSender = context.watch<OrderingViewModel>().selectedSender;
    var suggestions = context.watch<OrderingViewModel>().senders;
    return AddressForm(
      title: 'Sender details',
      nameInputHintText: 'Daniel Egor',
      emailInputHintText: 'egor_zu@gmail.com',
      phoneInputHintText: '+375726014690',
      countryInputHintText: 'Belarus',
      cityInputHintText: 'Minsk',
      addressLineInputHintText: 'Derzinskogo 3b',
      postcodeInputHintText: '220069',
      nameController: nameController,
      emailController: emailController,
      phoneController: phoneController,
      countryController: countryController,
      cityController: cityController,
      addressLineController: addressLineController,
      postcodeController: postcodeController,
      selectedUser: selectedSender,
      tabController: tabController,
      suggestions: suggestions,
      onSuggestionTap: (suggestion) {
        context.read<OrderingViewModel>().selectSender(suggestion);
      },
    );
  }
}

class RecipientAddressForm extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? phoneController;
  final TextEditingController? countryController;
  final TextEditingController? cityController;
  final TextEditingController? addressLineController;
  final TextEditingController? postcodeController;
  final TabController tabController;

  const RecipientAddressForm({
    super.key,
    this.nameController,
    this.emailController,
    this.phoneController,
    this.countryController,
    this.cityController,
    this.addressLineController,
    this.postcodeController,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    var selectedRecipient = context.watch<OrderingViewModel>().selectedRecipient;
    var suggestions = context.watch<OrderingViewModel>().recipients;
    return AddressForm(
        title: 'Recipient details',
        nameInputHintText: 'Ko Yuri',
        emailInputHintText: 'yuri@email.com',
        phoneInputHintText: '+375294545867',
        countryInputHintText: 'Italy',
        cityInputHintText: 'Naple',
        addressLineInputHintText: 'Via Toledo 256',
        postcodeInputHintText: '80100',
        nameController: nameController,
        emailController: emailController,
        phoneController: phoneController,
        countryController: countryController,
        cityController: cityController,
        addressLineController: addressLineController,
        postcodeController: postcodeController,
        selectedUser: selectedRecipient,
        tabController: tabController,
        suggestions: suggestions,
        onSuggestionTap: (suggestion) {
          context.read<OrderingViewModel>().selectRecipient(suggestion);
        });
  }
}
