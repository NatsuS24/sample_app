class StaticPagesController < ApplicationController
  def home
  	puts("hello #{root_url}")
  end

  def help
  	puts("hello #{help_url}")
  end

  def about
  	puts("hello #{about_url}")
  end

  def contact 
  	puts("hello #{contact_url}")
  end
end
