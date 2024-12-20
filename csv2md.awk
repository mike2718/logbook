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
        print "# 业余无线电台BG7XTQ的日志"
        printf "\n"
        print "| 序号 | 日期(UTC) | 开始时间(UTC) | 结束时间(UTC) | 电台呼号 | 下行频率(MHz) | 上行频率(MHz) | 模式 | RST(发送) | RST(接收) | 功率W(我的) | 功率W(对方) | 摘要 | QSL卡片(发) | QSL卡片(收) |"
        print "| :--: | :--: | :---: | :----: | :---: | :--: | :--: | :--: | :-----: | :-----: | :--: | :--: | :--: | :--: | :--: |"
}

NF > 0 && NR > 1 {
        split($32, qso_date, "")
        split($48, time_on, ":")
        split($49, time_off, ":")
        printf "| **%u** | %u-%s-%u | %02u%02u | %02u%02u | `%s` | %.3f | %.3f | %s | %s | %s | %s | %s | %s | %s | %s |\n", $61, qso_date[1] qso_date[2] qso_date[3] qso_date[4], month_to_english_abbreviation(qso_date[5] qso_date[6]), time_on[1], qso_date[7] qso_date[8], time_on[2], time_off[1], time_off[2], $5, $57, $13, $19, $36, $35, ($50 == "" ? "" : $50 "W"), ($37 == "" ? "" : $37 "W"), $22, ($63 == "Y" ? "✓" : ""), ($26 == "Y" ? "✓" : "")
}

END {
        #printf "\n"
}
