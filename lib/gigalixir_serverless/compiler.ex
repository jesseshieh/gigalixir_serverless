defmodule GigalixirServerless.Compiler do
  require Logger

  def compile(code, id, lock_version) do
    module = Module.concat(GigalixirServerless.RuntimeFunctions, "Data#{id}")
    Logger.debug("Module: #{module}")

    # strangely, returns either false or {:file, []}
    is_loaded = :code.is_loaded(module) != false
    is_new_version = is_loaded and lock_version > module.lock_version

    Logger.debug("is_loaded: #{is_loaded}")
    Logger.debug("is_new_version: #{is_new_version}")

    compile = not is_loaded or is_new_version

    if compile do
      contents = Code.string_to_quoted!(code)

      contents =
        quote do
          def lock_version, do: unquote(lock_version)
          unquote(contents)
        end

      Module.create(module, contents, Macro.Env.location(__ENV__))
    end

    module
  end
end
