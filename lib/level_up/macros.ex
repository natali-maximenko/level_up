defmodule LevelUp.Macros do
  defmacro case_if(condition) do
    quote do
      case unquote(condition) do
        true -> true
        false -> false
      end
    end
  end

  defmacro assert_match(pattern, code, message) do
    quote do
      if match?(unquote(pattern), unquote(code)), do: true, else: unquote(message)
    end
  end
end
