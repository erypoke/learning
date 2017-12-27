require 'dxruby'

x = 0
y = 0
char = Image.load("char.png")

Window.loop do
    
    y += (Input.y) * 3
#    if Input.key_push?(K_UP)
#        y -= 1
#    elsif Input.key_push?(K_DOWN)
#        y += 1
#    end

    x += (Input.x) * 3
#    if Input.key_push?(K_LEFT)
#        x -= 1
#    elsif Input.key_push?(K_RIGHT)
#        x += 1
#    end
    
    Window.draw(x, y, char)
end
