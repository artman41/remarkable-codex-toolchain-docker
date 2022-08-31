RM1_CHAINS += codex-x86_64-cortexa9hf-neon-rm10x-toolchain-3.1.15.sh
RM2_CHAINS += codex-x86_64-cortexa7hf-neon-rm11x-toolchain-3.1.15.sh

RM1_CHAINS += codex-x86_64-cortexa9hf-neon-rm10x-toolchain-3.1.2.sh
RM2_CHAINS += codex-x86_64-cortexa7hf-neon-rm11x-toolchain-3.1.2.sh

DOCKER ?= docker

ALL: rm1 rm2

rm1: $(addprefix rm1/,$(RM1_CHAINS))

rm1/%:
	$(DOCKER) build --build-arg TOOLCHAIN_FILENAME=$* -t codex:$* .

rm2: $(addprefix rm2/,$(RM2_CHAINS))

rm2/%:
	$(DOCKER) build --build-arg TOOLCHAIN_FILENAME=$* -t codex:$* .
