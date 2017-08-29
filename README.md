fcr, 总控服务，接受query请求，返回广告

首先，接到query请求后，请求下游拍卖词触发服务，获取拍卖词后，计算所需请求的广告数量，接着请求广告触发服务，获取广告，返回给客户端

请求格式: query

返回格式: winfoid, bidword, bid, q, title, desc1, desc2, targeturl, showurl

并记录notice日志，系统吞吐率，和追踪log信息(分debug, trace, warning, fatal)



