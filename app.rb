
def contents(template)
  File.readlines(File.join(File.dirname(__FILE__), 'views', template)).join ""
end

def markdown(template)
  RDiscount.new(contents("#{template.to_s}.md")).to_html
end


get '/' do
  content_type 'text/css', :charset => 'utf-8'
  @header = markdown :header
  @skills = markdown :skills
  haml :index, :layout => :layout
end

get '/style.css' do
  content_type 'text/css'
  sass :style
end