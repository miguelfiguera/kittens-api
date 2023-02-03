class SoftnessToStringAgainJustForFun < ActiveRecord::Migration[7.0]
  
  def up
    change_column :kittens,:softness,'text USING CAST(softness AS text)'
  end
  
  def down
    change_column :kittens,:softness,'integer USING CAST(softness AS integer)'
  end

end
