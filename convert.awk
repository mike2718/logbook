BEGIN {
    print "# BG7XTQ的电台日志"
    print
    print "| 序号 | 日期 | 开始时间(UTC) | 结束时间(UTC) | 呼号 | 下行频率(MHz) | 上行频率(MHz) | 模式 | RST(发送) | RST(接收) | 功率W(我的) | 功率W(对方) | 摘要 | QSL卡片(发) | QSL卡片(收) |"
    print "| :--: | :--: | :---: | :----: | :---: | :--: | :--: | :--: | :-----: | :-----: | :--: | :--: | :--: | :--: | :--: |"
}
NR > 1 {
    split($33, qso_date, "");
    split($49, time_on, ":");
    split($50, time_off, ":");
    # $6 呼号
    # $20 模式
    # $23 摘要
    # $34 日期
    # $36 接收信号报告
    # $37 发送信号报告
    # $38 对方功率
    # $51 我的功率
    printf "| **%u** | %u/%u/%u | %u:%02u | %u:%02u | `%s` | %.3f | %.3f | %s | %s | %s | %s | %s | %s | %s | %s |\n", $62, qso_date[1] qso_date[2] qso_date[3] qso_date[4], qso_date[5] qso_date[6], qso_date[7] qso_date[8], time_on[1], time_on[2], time_off[1], time_off[2], $6, $58, $14, $20, $37, $36, ($51 == "" ? "" : $51 "W"), ($38 == "" ? "" : $38 "W"), $23, ($28 == "Y" ? "✓" : ""), ($27 == "Y" ? "✓" : "")
}
END {
    printf "\n"
}
