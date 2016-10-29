defmodule Problem2 do
  def solve(0), do: true
  def solve(lines) do
    IO.gets("")
    |> String.trim
    |> String.to_integer
    |> execute
    |> IO.puts
    solve(lines - 1)
  end

  def execute(num) do
    sum_even_fibonacci(1, 2, num, 0)
  end

  def sum_even_fibonacci(cur, next, num, acc) do
    cond do
      cur > num -> acc
      rem(cur, 2) == 0 ->
        sum_even_fibonacci(next, cur + next, num, acc + cur)
      true ->
        sum_even_fibonacci(next, cur + next, num, acc)
    end
  end
end
