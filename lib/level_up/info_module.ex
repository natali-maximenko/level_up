defmodule LevelUp.InfoModule do
  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
      @before_compile unquote(__MODULE__)
      @after_compile unquote(__MODULE__)
      @on_definition {LevelUp.InfoModule, :log}

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
    # IO.inspect(__ENV__.module.__info__(:macros))

    quote do
      case __ENV__.file do
        "iex" -> IO.puts("Definded in IEX")
        file -> IO.puts("Defined in #{file}")
      end
    end
  end

  # Unlike other hooks, @on_definition will only invoke functions and never macros
  def log(_env, :defmacro, _name, _args, _guards, _body), do: IO.puts("Macros!")

  def log(_env, kind, name, _args, _guards, _body) do
    IO.puts("Defining #{kind} named #{name}")
  end
end
