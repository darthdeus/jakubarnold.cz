
def contents(template)
  File.readlines(File.join(File.dirname(__FILE__), 'views', template)).join ""
end

def markdown(template)
  RDiscount.new(contents("#{template.to_s}.md")).to_html
end


get '/' do
  headers 'Content-Type' => 'text/html;charset=utf-8'
  @header = markdown :header
  @skills = markdown :skills
  haml :index, :layout => :layout
end

get '/style.css' do
  headers 'Content-Type' => 'text/css;charset=utf-8'
  sass :style
end