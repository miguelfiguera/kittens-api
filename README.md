# README

Project for The Odin Project curriculum: https://www.theodinproject.com/lessons/ruby-on-rails-kittens-api



Notes: 

1) Cuando trate de cambiar la columna softness de string a Integer me dio un error debido a la presencia de postgresql
para la base de datos, por lo que en las migraciones tuve que usar una forma diferente de cambio:

20230203180601_softness_to_integer :

`
class SoftnessToInteger < ActiveRecord::Migration[7.0]
  def up
    change_column :kittens,:softness,'integer USING CAST(softness AS integer)'
  end

  def down
    change_column :kittens,:softness,'string USING CAST(softness AS string)'
  end
end

`

