module IssuesHelper
        #<summary><%= replace_special_chars val.summary.to_s %></summary>
        #<pubDate><%= Date.parse(val['release_date']).rfc2822%></pubDate>
        #<code><%= replace_special_chars val.code.to_s %></code>
        #<description><%= replace_special_chars val.description.to_s %></description>
        #&lt;p&gt;&lt;code&gt;<%= val.code %>&lt;/code&gt;&lt;/p&gt;
        #&lt;p&gt;<%= val.description %>&lt;/p&gt;
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
