# Define the connection variables
IP="127.0.0.1"
PORT="7860"
ROUTE="/sdapi/v1/txt2img"

# Execute curl by stitching them together
curl -X POST "http://${IP}:${PORT}${ROUTE}" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Jessica Alba wearing a short plaid skirt with stockings and garters, highly detailed",
    "negative_prompt": "photo quality",
    "steps": 8,
    "width": 704,
    "height": 704,
    "cfg_scale": 1.5,
    "sample_method": "lcm"
  }' \
  --output test_image.json

python3 -c "import json, base64; data = json.load(open('test_image.json')); img_str = data['images'][0] if isinstance(data['images'], list) else data['images']; open('cyberpunk_workspace.png', 'wb').write(base64.b64decode(img_str))"

