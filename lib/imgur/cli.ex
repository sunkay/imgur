defmodule Imgur.CLI do

  # constant which tells how many imgur articles to get
  @default_topics  4

  def run(argv) do
    argv
    |> parse_args
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switchs: [help: :boolean],
                                     aliases: [h: :help])

    IO.inspect parse
  end

end
