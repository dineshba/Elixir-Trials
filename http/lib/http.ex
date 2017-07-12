defmodule Http do
  alias Poison.Parser
  
	def invoke() do
    %{body: get_response} = HTTPotion.get("http://httpbin.org/get", [headers: ["Content-Type": "application/json"]])
    IO.puts get_response
    parsed_response = get_response |> Parser.parse!
    
    IO.puts "url == #{parsed_response["url"]}"

    %{status_code: status_code, body: post_response} = HTTPotion.post("http://httpbin.org/post", [headers: ["Content-Type": "application/json", body: Poison.encode!(%{"output" => %{"count" => 6}})]])
    
    if status_code == 200, do: IO.puts post_response

    IO.puts "completed"
  end

end
