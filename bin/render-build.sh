#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

# binstub整備（Windows由来のCRLF/ ruby.exe対策）
chmod a+x bin/* || true
sed -i "s/\r$//g" bin/* || true
sed -i '1s|^#!/usr/bin/env ruby\.exe$|#!/usr/bin/env ruby|' bin/* || true

bundle install

# 本番鍵なしでアセットだけ先にプリコンパイル
SECRET_KEY_BASE_DUMMY=1 bin/rails assets:precompile
bin/rails assets:clean

# ここではDBに触らない（RenderのPost-deployで実行）
# bin/rails db:migrate