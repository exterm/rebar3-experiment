TARGET = _build/default/rel/myrel/bin/myrel

.PHONY: compile dialyzer release production_release clean activate_kerlang test start stop console

compile  \
dialyzer \
release  \
clean:
	rebar3 $@

production_release:
	rebar3 as production tar
# config for the prod profile is in rebar.config

activate_kerlang:
	@echo "To activate kerl-based erlang, install kerl and execute:"
	@echo
	@echo "KERL_CONFIGURE_OPTIONS=--enable-hipe kerl build 18.1 18.1_hipe"
	@echo "{go to the folder you want erlang installed in}"
	@echo "kerl install 18.1_hipe"
	@echo
	@echo "{and then to activate kerl-erlang for the current session:}"
	@echo ". {path-to-kerl-erlang}/activate"

test:
	rebar3 eunit

start \
stop  \
console: release
	$(TARGET) $@
