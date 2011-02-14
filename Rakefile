require 'rdiscount'

require 'lib/parser'

task :markup do
  content = open('views/skills.md').readlines.join ""
  html = RDiscount.new(content)
  File.open('output.html', 'w') do |f|
    f.print html.to_html
  end
end

task :haml do
  `haml template.haml > public/index.html`
  `sass views/style.sass > public/style.css` 
end

task :compile => [:markup, :haml]

task :open => [:markup, :haml] do
  `open public/index.html`
end


task :pdf do
  require 'prawn' 
  
  
  Prawn::Document.generate('hello.pdf') do |pdf| 
    header = File.readlines('views/header.md')
    header.each do |line|
      if line =~ /^#/
        pdf.text line
      end
    end

    pdf.text("Hello Prawn!") 
  end
  `open hello.pdf`
end


task :default => :pdf
