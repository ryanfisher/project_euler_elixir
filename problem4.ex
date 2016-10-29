defmodule Problem4 do
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
    find_palindrome(num - 1)
  end

  def find_palindrome(num) do
    case is_palindrome(num) do
      true ->
        case find_factors(999, 999, num) do
          true -> num
          _    -> find_palindrome(num - 1)
        end
      _ ->
        find_palindrome(num - 1)
    end
  end

  def find_factors(num1, num2, num) do
    product = num1 * num2
    cond do
      num1 * num1 < num || num1 < 100-> false
      product == num -> true
      product < num || num2 < 100 ->
        find_factors(num1 - 1, num1 - 1, num)
      product > num ->
        find_factors(num1, num2 - 1, num)
    end
  end

  def is_palindrome(num) do
    {first, last} = num |> Integer.to_string |> String.split_at(3)
    first == String.reverse(last)
  end

  defp integer_input do
    ""
    |> IO.gets
    |> String.trim
    |> String.to_integer
  end
end
