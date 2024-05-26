#!/bin/zsh

html_file=$1

html_file_name="${html_file%.*}"
rsemi_path="$HOME/sakumotolab/2024-r-semi"

if [ ! -f "${html_file}" ]; then
    echo "ファイルが存在しません"
    exit 1
fi

output_pdf_file="${html_file_name}.pdf"
wkhtmltopdf "${html_file}" "${rsemi_path}/material/${output_pdf_file}" 1>&/dev/null

if [ $? -eq 0 ]; then
    cd "${rsemi_path}/material"
    git add "${rsemi_path}/material/${output_pdf_file}"
    echo "成功"
else
    echo "pdfの作成に失敗しました"
    exit 1
fi

cd "${rsemi_path}/material"

