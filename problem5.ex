defmodule Problem5 do
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
    find_smallest_product(num, num)
  end

  def find_smallest_product(num, divisor_max) do
    case divisible_by(num, divisor_max) do
      true  -> num
      false ->
        # We can increase number by divisor_max because it must always be
        # divisible by itself
        find_smallest_product(num + divisor_max, divisor_max)
    end
  end

  def divisible_by(_, 0), do: true
  def divisible_by(num, divisor) do
    case rem(num, divisor) do
      0 -> divisible_by(num, divisor - 1)
      _ -> false
    end
  end

  defp integer_input do
    ""
    |> IO.gets
    |> String.trim
    |> String.to_integer
  end
end
