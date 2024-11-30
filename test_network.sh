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

# Hà Nội
echo ">>> Kiểm tra mạng tại Hà Nội:"
speedtest-cli --server 12837 # ID của server Hà Nội
echo ""

# Đà Nẵng
echo ">>> Kiểm tra mạng tại Đà Nẵng:"
speedtest-cli --server 21404 # ID của server Đà Nẵng
echo ""

# Sài Gòn
echo ">>> Kiểm tra mạng tại Sài Gòn:"
speedtest-cli --server 16704 # ID của server Sài Gòn
echo ""

echo "=== Hoàn tất kiểm tra ==="
