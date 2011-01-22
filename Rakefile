require 'RedCloth'

task :markup do
  content = open('main.txt').readlines.join ""
  html = RedCloth.new(content)
  File.open('output.html', 'w') do |f|
    f.print html.to_html
  end
end

task :haml do
  `haml template.haml > public/index.html`
  `sass style.sass > public/style.css` 
end

task :compile => [:markup, :haml]

task :open => [:markup, :haml] do
  `open public/index.html`
end

task :default => :open
