defmodule Problem1 do
  def solve(0), do: true
  def solve(lines) do
    IO.gets("")
    |> String.trim
    |> String.to_integer
    |> execute_o1
    |> IO.puts
    solve(lines - 1)
  end

  def execute_o1(num) do
    # Summation of finite linear series
    # TODO: Refactor
    threes = div(num - 1, 3)
    fives = div(num - 1, 5)
    fifteens = div(num - 1, 15)

    three_total = div((3 * threes * (threes + 1)), 2)
    five_total = div((5 * fives * (fives + 1)), 2)
    fifteen_total = div((15 * fifteens * (fifteens + 1)), 2)
    three_total + five_total - fifteen_total
  end

  def execute(num) do
    sum_of_three_five_multiples(num - 1, 0)
  end
  
  def sum_of_three_five_multiples(0, acc), do: acc
  def sum_of_three_five_multiples(val, acc) do
    cond do
      rem(val, 3) == 0 || rem(val, 5) == 0 ->
        sum_of_three_five_multiples(val - 1, acc + val)
      true ->
        sum_of_three_five_multiples(val - 1, acc)
    end
  end
end
