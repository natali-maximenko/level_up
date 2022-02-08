FROM bitwalker/alpine-elixir:latest as release-stage

COPY mix.* .
RUN mix do deps.get, deps.compile

COPY config ./config
COPY lib ./lib
COPY test ./test

ENV MIX_ENV=prod
ENV CONTACT_EMAIL=release@elixirschool.com
RUN mix release 

FROM bitwalker/alpine-elixir:latest

COPY --from=release-stage $HOME/_build .
RUN chown -R default: ./prod
USER default
CMD ./prod/rel/level_up/bin/level_up start
