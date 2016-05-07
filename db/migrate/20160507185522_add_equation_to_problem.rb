class AddEquationToProblem < ActiveRecord::Migration
  def change
  	add_column :problems, :equation, :string
  end
end
