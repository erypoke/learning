require "dxruby"

#�}�b�v�f�[�^
@map = [[1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
        [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 1],
        [1, 0, 0, 1, 1, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 1],
        [1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
        [1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1],
        [1, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 1],
        [1, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 1],
        [1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1],
        [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1],
        [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1],
        [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1],
        [1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1],
        [1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1],
        [1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1],
        [1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1]]

#�z�u�p�[�c
@map_tile = []
@map_tile[0] = Image.new(32, 32, [0x00,0x99,0xff]) #�w�i�P�i��j
@map_tile[1] = Image.new(32, 32, [0x66,0x33,0x00]) #��Q���i�u���b�N�j
@map_tile[2] = Image.new(32, 32, [0xff,0xff,0xff]) #�w�i�Q�i�_�j

#�L����
@char_tile = Image.load("char.png")

#�t���[�����ݒ�
Window.fps = 30

#�����l�ݒ�
x = 32
y = y_prev = 32
f = 2
jump_ok = false

#�Ή�����z���Ԃ�
def collision_tile(x, y, arr)
  return arr[y/32][x/32] #�}�b�v�z��̎d�l��A���Ƃ����t�ɂȂ��Ă���̂ɒ���
end

#�Q�[�����[�v
Window.loop do

  #�x���ړ������̐ݒ�
  y_move = (y - y_prev) + f
  #���W�������P�u���b�N�𒴂��Ȃ��悤�ɕ␳
  if y_move > 31
    y_move = 31
  end
  y_prev = y
  y += y_move
  f = 2 #f�l��������������

  #���ɗ���������W��������
  if y >= 480
    x = 32
    y = y_prev = 0
  end

  #�V��Փ˔���
  if (collision_tile(x   , y, @map) == 1 or 
     collision_tile(x+31, y, @map) == 1) 
    y = y/32*32 + 32
  end

  #���Փ˔���
  if collision_tile(x   , y+31, @map) == 1 or 
     collision_tile(x+31, y+31, @map) == 1
    y = y/32*32
    jump_ok = true #�n�ʂɐڒn���Ă���̂ŃW�����v��������
  else
    jump_ok = false #�n�ʂɐڒn���Ă��Ȃ��̂ŁA�W�����v�͋����Ȃ�
  end

  #���E�ړ�
  x += Input.x * 2

  #�ǏՓ˔���i�����j
  if collision_tile(x, y   , @map) == 1 or 
     collision_tile(x, y+31, @map) == 1
    x = x/32*32 + 32
  end
  #�ǏՓ˔���i�E���j
  if collision_tile(x+31, y   , @map) == 1 or 
     collision_tile(x+31, y+31, @map) == 1 
    x = x/32*32
  end

  #�W�����v
  if Input.key_push?(K_SPACE) and jump_ok
    f = -20
  end

  #�}�b�v�̕\��
  Window.draw_tile(0,0,@map,@map_tile,0,0,17,15)

  #�L�����̕\��
  Window.draw(x, y, @char_tile)

end

