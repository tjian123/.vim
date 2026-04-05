.PHONY: check
.PHONY: sync

check:
	bash scripts/check.sh

sync:
	bash scripts/sync-packages.sh
