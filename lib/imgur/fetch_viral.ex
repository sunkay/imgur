defmodule Imgur.FetchViral do
  @url "https://api.imgur.com/3/gallery/hot/viral/"
  @client_id "7c901ab4610a8f5"

  def fetch(count) do
    HTTPoison.get(@url, [{"Authorization", "Client-ID #{@client_id}"}])
    |> handle_response
    |> get_records
    |> Enum.take(count)
    |> print_header
    |> Enum.each(fn record -> print_viral_title(record) end)
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    {:ok, Poison.Parser.parse!(body)}
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 404}}) do
    {:error, "Page Not found --"}
  end

  def handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    IO.inspect reason
    {:error, reason}
  end

  def get_records({:ok, %{"data" => records, "status" => 200, "success" => true}}) do
    records
  end

  def print_header(body) do
    IO.puts "Views | Points |  title"
    IO.puts "--------------------------------"
    body
  end

  def print_viral_title(%{"title" => title, "points" => points, "views" => views}) do
    IO.puts(Integer.to_string(views) <> " | " <> Integer.to_string(points) <> " | " <> title)
  end

end
