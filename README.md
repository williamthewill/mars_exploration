# MarsExplore

**Pré-requisitos**

É necessário ter instalado em sua máquina o elixir

**MarsExplore**

Para rodar a a aplicação basta executar o terminal interativo do elixir, na raiz do diretorio da aplicação, onde se encontra o arquivo ```mix.exs```

```
iex -S mix
```

Com a aplicação iniciada, dentro do terminal iterativo você pode chamar a função de start para explorar marte

```
MarsExplore.start()
```

A saída é baseada nas entradas que estão setadas no arquivo ``` inpusts.txt ``` para você ver novas saídas basta adicionar ou alterar os inputs que estão nesse arquivo. 

Por padrão a primeira linha do arquivo será sempra o tamanho máximo da malha que as sondas podem percorrer, nesse formato

```
5 5
```

As linhas subsequentes corresponden as coordenadas inicias e instruções de movimentação de cada sonda. Então para cada sonda teremos duas linhas no seguinte padrão.

```
1 2 N
LMLMLMLMM
```

A primeira linha da sonda representa sua coordenada corrente e a segunda linha represanta as instruções de movimentação.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mars_explore` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mars_explore, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/marte_explore](https://hexdocs.pm/marte_explore).
