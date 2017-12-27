#画面右端との衝突判定

require 'dxruby'

x = 300
y = 0

image = Image.load("char.png")
sample_sprite = Sprite.new(x, y, image)

Window.loop do
  # sample_sprite という Sprite データの x 座標をプラス 1 する
  # += という記号の組み合わせは、左辺の値に右辺の値をプラスし、代入する意味を持つ
  # 他にも、-=, *=, /= などもある
  # += 1 の場合だと左辺の変数の値が 1 ずつ増加していく
  sample_sprite.x -= 1

  if sample_sprite.x < 0
    sample_sprite.x += 1
  end

  # y も 1 ずつ増加
  sample_sprite.y += 1

  # Sprite.draw メソッドを使うと指定した Sprite データを画面に表示 (描画) することが出来る
  Sprite.draw(sample_sprite)
end