#!/bin/bash

# Kiểm tra và cài đặt speedtest-cli nếu chưa có
if ! command -v speedtest-cli &> /dev/null; then
    echo "speedtest-cli chưa được cài đặt. Đang tiến hành cài đặt..."
    sudo apt update && sudo apt install -y speedtest-cli
    if [ $? -ne 0 ]; then
        echo "Cài đặt speedtest-cli thất bại. Vui lòng kiểm tra kết nối mạng hoặc quyền sudo."
        exit 1
    fi
    echo "Cài đặt speedtest-cli thành công!"
else
    echo "speedtest-cli đã được cài đặt."
fi

echo ""
echo "=== Kiểm tra mạng từ các địa điểm ==="

# Kiểm tra mạng từ các server
declare -a servers=(
  "17757" # VNPT-NET / Ha Noi / Vietnam
  "17756" # VNPT-NET / Da Nang / Vietnam
  "17758" # VNPT-NET / Ho Chi Minh / Vietnam
  "9903"  # Viettel Network / Ha Noi / Vietnam
  "10040" # Viettel Network / Da Nang / Vietnam
  "26853" # Viettel Network / Ho Chi Minh / Vietnam
  "2552"  # FPT Telecom / Hanoi / Vietnam
  "44677" # FPT Telecom / Da Nang / Vietnam
  "2515"  # FPT Telecom / Ho Chi Minh City / Vietnam
  "44817" # SPTEL PTE. LTD. / Singapore / Singapore
  "19230" # Hivelocity / Los Angeles, CA / United States
  "8864"  # CenturyLink / Seattle, WA / United States
  "50467" # Verizon / Tokyo / Japan
  "1536"  # STC / Hong Kong / Hong Kong
)

# Lặp qua từng server và kiểm tra tốc độ
for server in "${servers[@]}"
do
    echo ">>> Kiểm tra mạng với server ID $server:"
    speedtest-cli --server $server
    echo ""
done

echo "=== Hoàn tất kiểm tra ==="
