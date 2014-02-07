require 'test/unit'
require 'exif_utility'

class ExifUtilityTest < Test::Unit::TestCase
  def test_exif_hello
    assert_equal "tester.jpg", ExifUtility.hi
  end

  def test_any_hello
    assert_equal "aaa.jpg", ExifUtility.hi("aaa.jpg")
  end

end