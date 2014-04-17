module IssuesHelper
  def replace_special_chars input
    final = ""
    input.each_char do |x|
      if x == ">"
        final << "&gt;"
        next
      end
      if x == "<"
        final << "&lt;"
        next
      end
      final << x
    end
    final
  end
end
