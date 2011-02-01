
def contents(template)
  File.readlines(File.join(File.dirname(__FILE__), 'views', template)).join ""
end

def markdown(template)
  RDiscount.new(contents("#{template.to_s}.md")).to_html
end



get '/' do
  @header = markdown :header
  @skills = markdown :skills
  haml :index, :layout => :layout
end

get '/style.css' do
  sass :style
end