module Jekyll
  class Signup < Liquid::Tag
    @@id = 274996
    def render(context)
      %(<script async id="_ck_#{@@id}" src="https://forms.convertkit.com/#{@@id}?v=6"></script>)
    end
  end
end

Liquid::Template.register_tag('signup', Jekyll::Signup)
