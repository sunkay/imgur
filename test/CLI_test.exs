defmodule CLITest do
  use ExUnit.Case
  doctest Imgur

  import Imgur.CLI

  test "passing help switch displays usage" do
    assert parse_args(["--help"]) == :help
  end

  test "empty arguments uses default" do
    assert parse_args([]) == {4}
  end

end
