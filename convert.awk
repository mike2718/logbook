BEGIN {
    print "# BG7XTQ的电台日志"
    print
    print "| 序号 | 日期 | 开始时间(UTC) | 结束时间(UTC) | 呼号 | 频率(MHz) | 模式 | RST(发送) | RST(接收) | 功率(我的) | 功率(对方) | 摘要 | QSL卡片(发) | QSL卡片(收) |"
    print "| :--: | :--: | :---: | :----: | :---: | :--: | :--: | :-----: | :-----: | :--: | :--: | :--: | :--: | :--: |"
}
NR > 1 {
    split($34, date, ".");
    split($49, time_on, ":");
    split($50, time_off, ":");
    if ($28 == "Y") qsl_sent = "是";
    else qsl_sent = ""
    if ($27 == "Y") qsl_rcvd = "是";
    else qsl_rcvd = ""
    #if($37 == "") rst_sent = "-";
    #else rst_sent = $37
    #if($36 == "") rst_rcvd = "-";
    #else rst_rcvd = $36
    printf "| %u | %s/%u/%u | %u:%s | %u:%s | %s | %3.3f | %s | %s | %s | %s | %s | %s | %s |\n", $62, date[1], date[2], date[3], time_on[1], time_on[2], time_off[1], time_off[2], $6, $14, $20, $37, $36, $51, $38, $23, qsl_sent, qsl_rcvd
}