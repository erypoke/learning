#��ʉE�[�Ƃ̏Փ˔���

require 'dxruby'

x = 300
y = 0

image = Image.load("char.png")
sample_sprite = Sprite.new(x, y, image)

Window.loop do
  # sample_sprite �Ƃ��� Sprite �f�[�^�� x ���W���v���X 1 ����
  # += �Ƃ����L���̑g�ݍ��킹�́A���ӂ̒l�ɉE�ӂ̒l���v���X���A�������Ӗ�������
  # ���ɂ��A-=, *=, /= �Ȃǂ�����
  # += 1 �̏ꍇ���ƍ��ӂ̕ϐ��̒l�� 1 ���������Ă���
  sample_sprite.x -= 1

  if sample_sprite.x < 0
    sample_sprite.x += 1
  end

  # y �� 1 ������
  sample_sprite.y += 1

  # Sprite.draw ���\�b�h���g���Ǝw�肵�� Sprite �f�[�^����ʂɕ\�� (�`��) ���邱�Ƃ��o����
  Sprite.draw(sample_sprite)
end