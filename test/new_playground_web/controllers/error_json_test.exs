defmodule NewPlaygroundWeb.ErrorJSONTest do
  use NewPlaygroundWeb.ConnCase, async: true

  test "renders 404" do
    assert NewPlaygroundWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert NewPlaygroundWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
