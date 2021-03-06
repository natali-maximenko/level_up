defmodule LogModule do
  def log_macro(_env, :defmacro, name, _args, _guards, body) do
    IO.puts("Defining macros named #{name}")
    IO.puts("and body")
    IO.puts(Macro.to_string(body))
  end
end

defmodule LevelUp.InfoModule do
  @on_definition {LogModule, :log_macro}

  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
      @before_compile unquote(__MODULE__)
      @after_compile unquote(__MODULE__)

      def print_env, do: IO.inspect(__ENV__)
    end
  end

  defmacro __before_compile__(env) do
    quote do
      def functions do
        info = unquote(Macro.escape(env))
        IO.inspect(info.module.__info__(:functions))
      end
    end
  end

  defmacro __after_compile__(_env, _opts) do
    quote do
      case __ENV__.file do
        "iex" -> IO.puts("Definded in IEX")
        file -> IO.puts("Defined in #{file}")
      end
    end
  end
end
