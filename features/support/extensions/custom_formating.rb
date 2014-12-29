require 'gherkin/formatter/ansi_escapes'
require 'cucumber/formatter/pretty'
require 'cucumber/formatter/html'

module Cucumber
  module RbSupport
    module RbWorld
      def put_collapsible_list(list_title, list)
        @__cucumber_runtime.put_collapsible_list(list_title, list)
      end
    end
  end
end

module Cucumber
  class Runtime
    module UserInterface
      def put_collapsible_list(list_title, list)
        @visitor.put_collapsible_list(list_title, list)
      end
    end
  end
end

module Cucumber
  class Runtime
    class ForProgrammingLanguages
      def_delegators :@user_interface,
                     :put_collapsible_list
    end
  end
end

module Cucumber
  module Ast
    # Walks the AST, executing steps and notifying listeners
    class TreeWalker
      def put_collapsible_list(list_title, list)
        broadcast(list_title, list)
      end
    end
  end
end


module Cucumber
  module Formatter
    class Html
      def put_collapsible_list(list_title, list)
        @delayed_messages << <<-HTML.strip
          <a onclick="ol=document.getElementById('#{list_title}'); ol.style.display = (ol.style.display == 'none' ? 'block' : 'none');return false">#{list_title} (click to expand/hide)</a>
          <ol id="#{list_title}" style="display:none;">
          #{list_helper(list)}
          </ol>
        HTML
      end

      def list_helper(list)
        list.to_a.flatten.inject("") do |a, item|
          a + <<-HTML
            <li>#{item}</li>
          HTML
        end
      end
    end
  end
end

=begin
module Cucumber
  module Formatter
    class Pretty
      def put_collapsible_list(list_title, list)
        @delayed_messages << list_title
        list.each do |column|
          @delayed_messages << column
        end
      end
    end
  end
end
=end
