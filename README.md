---
tags: delegate,protocol,views
languages:objc
---

# Validated Sign Up

## Instructions

  1. Set up the delegate for all of your `UITextField`s.
  2. Implement validation when a user taps the return button on the keyboard. [Check out the documentation for which method you need](https://developer.apple.com/library/ios/documentation/uikit/reference/UITextFieldDelegate_Protocol/UITextFieldDelegate/UITextFieldDelegate.html).
  3. The validation rules are as follows:
    * First Name:
      * > 0 characters
      * No Digits
    * Last Name:
      * > 0 characters
      * No Digits
    * Email:
      * > 0 characters
      * valid email format (something@something.something)
    * Username:
      * > 0 characters
      * No Digits
    * Password:
      * > 6 characters
  4. Google for at least *20 minutes* to figure out a method to validate email and make sure there are no digits. You don't need to understand...just find one that works :satisfied: .  If you can't figure it out after 20 minutes, decrypt the `validators.txt` file in this repo on [AESencryption.net](http://aesencryption.net/)  Ask one of the instructors for the password.
  5. When the user taps return one each field. You should validate it, then present a [UIAlertView](http://code.tutsplus.com/tutorials/ios-sdk-working-with-uialertview-and-uialertviewdelegate--mobile-3159) with an appropriate error message. The alert view should have two buttons: `OK` and `Clear`. When you press `Clear` it should clear the currently editing textfield.
  6. If the input passes validation, then set the `enabled` property of the next `UITextField` equal to `YES`.
  7. When the password is correct, enable the sign up button.

## Hints

  * To dismiss the keyboard call [resignFirstResponder](https://developer.apple.com/library/ios/documentation/uikit/reference/UIResponder_Class/Reference/Reference.html#//apple_ref/occ/instm/UIResponder/resignFirstResponder) instance method on the currently editing `UITextField`. To move the focus to another `UITextField` call the [becomeFirstResponder](https://developer.apple.com/library/ios/documentation/uikit/reference/UIResponder_Class/Reference/Reference.html#//apple_ref/occ/instm/UIResponder/becomeFirstResponder) instance method on the `UITextField` you want to be focused.

## Extra Credit 

  * This lab lends itself to some messy code if you don't put a lot of thought into the software design. How clean can you make the code? Remember each method should be short. Minimal copy-paste. Descriptive Names. Be prepared to defend your code.
  * `UIAlertView`s are being deprecated in iOS 8. Go ahead and replace it with [UIAlertController](http://useyourloaf.com/blog/2014/09/05/uialertcontroller-changes-in-ios-8.html)
