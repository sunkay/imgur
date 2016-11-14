defmodule Imgur.CLI do

  # constant which tells how many imgur articles to get
  @default_topics  4

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switchs: [help: :boolean],
                                     aliases: [h: :help])

    case parse do
      {_, [count], _} ->
        {String.to_integer(count)}
      {[], [], []} ->
        {@default_topics}
      {[h: true], _, _} ->
        :help
      _ ->
        :help
    end
  end

  def process(:help) do
    IO.puts """
    Usage: imgur count [--help| -h]
    """
  end

  def process({count}) do
    IO.puts count
  end

end
