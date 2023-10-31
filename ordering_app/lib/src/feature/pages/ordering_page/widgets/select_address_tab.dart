import 'package:flutter/material.dart';
import 'package:ordering_app/src/core/models/user.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:ordering_app/src/feature/app/icons.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/ordering_view_model.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

class SelectAddressTab extends StatelessWidget {
  final User? user;
  final List<User> suggestions;
  final void Function(User) onSuggestionTap;

  const SelectAddressTab({
    super.key,
    required this.user,
    required this.suggestions,
    required this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchInput(
          suggestions: suggestions,
          onSuggestionTap: onSuggestionTap,
        ),
        const SizedBox(height: 12),
        user != null ? SelectedAddressBox(user: user!) : const SizedBox(),
      ],
    );
  }
}

class SelectedAddressBox extends StatelessWidget {
  final User user;

  const SelectedAddressBox({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.selecteAddresBoxHeight,
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColors.selectedAddresBoxBackgroundColor,
        ),
        child: SelectedAddressBoxContent(
          user: user,
        ),
      ),
    );
  }
}

class SelectedAddressBoxContent extends StatelessWidget {
  final User user;

  const SelectedAddressBoxContent({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.selectedAddresBoxPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.selectedAddresBoxPersonLabelColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  user.getFullAddress(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.selectedAddresBoxAddresLabelColor,
                  ),
                )
              ],
            ),
          ),
          Icon(
            AppIcons.create.icon,
            size: AppSizes.selectedAddressBoxIconsSize,
            color: AppColors.selectedAddresBoxIconColor,
          )
        ],
      ),
    );
  }
}

class SearchInput extends StatefulWidget {
  final List<User> suggestions;
  final void Function(User) onSuggestionTap;

  const SearchInput({
    super.key,
    required this.suggestions,
    required this.onSuggestionTap,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SearchField<User>(
        itemHeight: AppSizes.searchInputItemHeight,
        focusNode: focus,
        searchInputDecoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: AppSizes.inputBorderRadius,
            borderSide: BorderSide(
              width: AppSizes.inputBorderWidth,
              color: AppColors.borderColor,
            ),
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.inputHintTextColor,
          ),
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(AppIcons.search.icon),
          prefixIconColor: AppColors.iconsColor,
        ),
        maxSuggestionsInViewPort: 6,
        onSuggestionTap: (suggestion) {
          focus.unfocus();
          if (suggestion.item == null) {
            return;
          }
          widget.onSuggestionTap(suggestion.item!);
        },
        suggestions: widget.suggestions
            .map(
              (e) => SearchFieldListItem<User>(
                e.fullName,
                item: e,
                child: CustomSuggestionView(user: e),
              ),
            )
            .toList());
  }
}

class CustomSuggestionView extends StatelessWidget {
  final User user;

  const CustomSuggestionView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.fullName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            user.getFullAddress(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
