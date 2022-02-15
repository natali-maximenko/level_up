defmodule LevelUp.Macros do
  defmacro case_if(condition, do: true_block, else: false_block) do
    quote do
      case unquote(condition) do
        true -> unquote(true_block)
        false -> unquote(false_block)
      end
    end
  end

  defmacro assert_match(pattern, code, message) do
    quote do
      if match?(unquote(pattern), unquote(code)), do: true, else: unquote(message)
    end
  end

  defmacro inspect_caller(msg) do
    quote do
      info = unquote(Macro.escape(__CALLER__))
      {function, arity} = info.function

      IO.inspect(unquote(msg),
        label: "called from #{function}/#{arity} in module #{info.module} on line #{info.line}"
      )
    end
  end
end
