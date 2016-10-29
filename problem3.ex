defmodule Problem3 do
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
    largest_prime_factor(num)
  end

  def largest_prime_factor(num) do
    result = num
    |> prime_factorize(2, [], div(num, 2))
    |> List.first
    result || num
  end

  def prime_factorize(num, divisor, prime_factors, max) do
    cond do
      max < divisor -> prime_factors
      rem(num, divisor) == 0 ->
        prime_factorize(div(num, divisor), divisor, [divisor | prime_factors], max)
      true ->
        prime_factorize(num, divisor + 1, prime_factors, max)
    end
  end

  defp integer_input do
    ""
    |> IO.gets
    |> String.trim
    |> String.to_integer
  end
end
