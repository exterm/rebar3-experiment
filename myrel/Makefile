.PHONY: compile dialyze release production_release clean activate_kerlang

compile:
	rebar3 compile

dialyze:
	rebar3 dialyzer

release:
	rebar3 release

production_release:
	rebar3 as production tar
# config for the prod profile is in rebar.config

clean:
	rebar3 clean

activate_kerlang:
	@echo "To activate kerl-based erlang, install kerl and execute:"
	@echo
	@echo "KERL_CONFIGURE_OPTIONS=--enable-hipe kerl build 18.1 18.1_hipe"
	@echo "{go to the folder you want erlang installed in}"
	@echo "kerl install 18.1_hipe"
	@echo
	@echo "{and then to activate kerl-erlang for the current session:}"
	@echo ". {path-to-kerl-erlang}/activate"
