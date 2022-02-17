defmodule LevelUp.InfoModule do
  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
      @before_compile unquote(__MODULE__)

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

  defmacro __after_compile__(env, _opts) do
    quote do
      def iex_defined? do
        info = unquote(Macro.escape(env))
        info.file == "iex"
      end
    end
  end
end
