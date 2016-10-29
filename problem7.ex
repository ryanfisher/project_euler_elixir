defmodule Problem7 do
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

  @primes [2, 3, 5, 7, 11, 13]

  def execute(n) do
    find_nth_prime(n, 2)
  end

  def find_nth_prime(n , prime_test) do
    cond do
      n == 1 && is_prime(prime_test) -> prime_test
      n == 1 -> find_nth_prime(n, prime_test + 1)
      is_prime(prime_test) -> find_nth_prime(n - 1, prime_test + 1)
      true -> find_nth_prime(n, prime_test + 1)
    end
  end

  def is_prime(n) do
    n == 2 || n == 3 ||
    Enum.all?((2..div(n, 2)), fn divisor -> rem(n, divisor) != 0 end)
  end

  defp integer_input do
    ""
    |> IO.gets
    |> String.trim
    |> String.to_integer
  end
end
