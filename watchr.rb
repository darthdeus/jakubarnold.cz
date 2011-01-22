block = Proc.new { `rake compile`; puts 'compiled' }

watch('main.txt', &block) 
watch('template.haml', &block)
watch('style.sass', &block)
