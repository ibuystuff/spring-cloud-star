#!/usr/bin/env bash
vault policy-write appa vault-appA.hcl

vault token-create -policy=appa -id="00000000-0000-0000-0000-000000000001" -orphan

vault write secret/testConsulVaultAppA appA.secret=appAsecret

vault policy-write appb vault-appB.hcl

vault token-create -policy=appb -id="00000000-0000-0000-0000-000000000002" -orphan

vault write secret/testConsulVaultAppB appB.secret=appBsecret

vault write secret/application shared.secret=sharedSecret
