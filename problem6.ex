defmodule Problem6 do
  def solve do
    integer_input
    |> solve
  end

  def solve(0), do: true
  def solve(lines) do
    integer_input
    |> execute
    |> IO.puts
    solve(lines - 1)
  end

  def execute(num) do
    square_of_sums(num) - sum_of_squares(num)
  end

  def sum_of_squares(num) do
    1..num
    |> Enum.map(fn n -> n * n end)
    |> Enum.sum

  end

  def square_of_sums(num) do
    sum = 1..num |> Enum.sum
    sum * sum
  end

  defp integer_input do
    ""
    |> IO.gets
    |> String.trim
    |> String.to_integer
  end
end
