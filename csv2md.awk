# csv2md.awk
# 把从Logger32导出的.csv格式电台日志文件转换成GitHub风格的Markdown电台日志表格

# 此函数鸣谢：ChatGPT
function month_to_english_abbreviation(month) {
    if (month == "01") return "Jan"
    else if (month == "02") return "Feb"
    else if (month == "03") return "Mar"
    else if (month == "04") return "Apr"
    else if (month == "05") return "May"
    else if (month == "06") return "Jun"
    else if (month == "07") return "Jul"
    else if (month == "08") return "Aug"
    else if (month == "09") return "Sep"
    else if (month == "10") return "Oct"
    else if (month == "11") return "Nov"
    else if (month == "12") return "Dec"
    else return "Unknown"
}

BEGIN {
        print "# 业余无线电台 BG7XTQ 的日志"
        printf "\n"
        print "| # | DATE | UTC | CALLSIGN | FREQ (MHz) | MODE | RST (SENT) | RST (RCVD) | PWR (MY) | PWR (THEIR) | PROP | COMMENT | QSL (SENT) | QSL (RCVD) |"
        print "| :--: | :--: | :---: | :---: | :--: | :--: | :-----: | :-----: | :--: | :--: | :--: | :--: | :--: | :--: |"
}

NF > 0 && NR > 1 {
        split($32, qso_date, "")
        split($48, time_on, ":")
        split($49, time_off, ":")
        printf "| **%u** | %4u-%s-%02u | %02u:%02uUTC | `%s` | %.3f | %s | %s | %s | %s | %s | %s | %s | %s | %s |\n", $61, qso_date[1] qso_date[2] qso_date[3] qso_date[4], month_to_english_abbreviation(qso_date[5] qso_date[6]), qso_date[7] qso_date[8], time_on[1], time_on[2], $5, $57, $19, $36, $35, ($50 == "" ? "" : $50 "W"), ($37 == "" ? "" : $37 "W"),  $39, $22, ($63 == "Y" ? "✓" : ""), ($26 == "Y" ? "✓" : "")
}

END {
        #printf "\n"
}
