# check_for_git behaves as expected

    Code
      check_for_git(testing = TRUE)
    Message <rlang_message>
      v Congrats, you've already installed Git!

# pal_check_git_token behaves as expected

    Code
      pal_check_git_token(testing = TRUE)
    Message <rlang_message>
      v OK, I won't do that right now.

# check_for_package behaves as expected

    Code
      check_for_package("test_package", testing = TRUE)
    Message <rlang_message>
      v Congrats, you've already installed 'test_package'!

# check_for_rtools behaves as expected

    Code
      check_for_rtools(testing = TRUE)
    Message <rlang_message>
      v Congrats, you've already installed Rtools!

# check_for_xcode behaves as expected

    Code
      check_for_xcode(testing = TRUE)
    Message <rlang_message>
      v Congrats, you've already installed XCode!

# pal_install_software behaves as expected

    Code
      pal_install_software("Test Software", "https://example.com", testing = TRUE)
    Message <rlang_message>
      v OK, I won't download 'Test Software' right now.

# pal_install_package behaves as expected

    Code
      pal_install_package("test_package", testing = TRUE)
    Message <rlang_message>
      v OK, I won't install 'test_package' right now.

