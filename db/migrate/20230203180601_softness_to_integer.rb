class SoftnessToInteger < ActiveRecord::Migration[7.0]
  def up
    change_column :kittens,:softness,'integer USING CAST(softness AS integer)'
  end

  def down
    change_column :kittens,:softness,'string USING CAST(softness AS string)'
  end
end


##Save this migration and reference it on the README for further investigacion.