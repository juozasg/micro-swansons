require 'rails_helper'

RSpec.describe "tables/edit", type: :view do
  before(:each) do
    @table = assign(:table, Table.create!(
      :name => "MyString",
      :seats => 1
    ))
  end

  it "renders the edit table form" do
    render

    assert_select "form[action=?][method=?]", table_path(@table), "post" do

      assert_select "input[name=?]", "table[name]"

      assert_select "input[name=?]", "table[seats]"
    end
  end
end
