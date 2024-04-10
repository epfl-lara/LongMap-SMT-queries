; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7812 () Bool)

(assert start!7812)

(declare-fun res!28619 () Bool)

(declare-fun e!31824 () Bool)

(assert (=> start!7812 (=> (not res!28619) (not e!31824))))

(declare-datatypes ((B!1018 0))(
  ( (B!1019 (val!1129 Int)) )
))
(declare-datatypes ((tuple2!1840 0))(
  ( (tuple2!1841 (_1!931 (_ BitVec 64)) (_2!931 B!1018)) )
))
(declare-datatypes ((List!1326 0))(
  ( (Nil!1323) (Cons!1322 (h!1902 tuple2!1840) (t!4360 List!1326)) )
))
(declare-fun keyValues!2 () List!1326)

(get-info :version)

(assert (=> start!7812 (= res!28619 (not ((_ is Nil!1323) keyValues!2)))))

(assert (=> start!7812 e!31824))

(declare-fun e!31825 () Bool)

(assert (=> start!7812 e!31825))

(declare-datatypes ((ListLongMap!1255 0))(
  ( (ListLongMap!1256 (toList!643 List!1326)) )
))
(declare-fun thiss!210 () ListLongMap!1255)

(declare-fun e!31823 () Bool)

(declare-fun inv!2318 (ListLongMap!1255) Bool)

(assert (=> start!7812 (and (inv!2318 thiss!210) e!31823)))

(declare-fun b!49512 () Bool)

(declare-fun ListPrimitiveSize!59 (List!1326) Int)

(assert (=> b!49512 (= e!31824 (>= (ListPrimitiveSize!59 (t!4360 keyValues!2)) (ListPrimitiveSize!59 keyValues!2)))))

(declare-fun lt!20768 () ListLongMap!1255)

(declare-fun +!77 (ListLongMap!1255 tuple2!1840) ListLongMap!1255)

(assert (=> b!49512 (= lt!20768 (+!77 thiss!210 (h!1902 keyValues!2)))))

(declare-fun b!49513 () Bool)

(declare-fun tp_is_empty!2169 () Bool)

(declare-fun tp!6578 () Bool)

(assert (=> b!49513 (= e!31825 (and tp_is_empty!2169 tp!6578))))

(declare-fun b!49514 () Bool)

(declare-fun tp!6577 () Bool)

(assert (=> b!49514 (= e!31823 tp!6577)))

(assert (= (and start!7812 res!28619) b!49512))

(assert (= (and start!7812 ((_ is Cons!1322) keyValues!2)) b!49513))

(assert (= start!7812 b!49514))

(declare-fun m!42875 () Bool)

(assert (=> start!7812 m!42875))

(declare-fun m!42877 () Bool)

(assert (=> b!49512 m!42877))

(declare-fun m!42879 () Bool)

(assert (=> b!49512 m!42879))

(declare-fun m!42881 () Bool)

(assert (=> b!49512 m!42881))

(check-sat tp_is_empty!2169 (not start!7812) (not b!49512) (not b!49514) (not b!49513))
(check-sat)
(get-model)

(declare-fun d!9919 () Bool)

(declare-fun lt!20774 () Int)

(assert (=> d!9919 (>= lt!20774 0)))

(declare-fun e!31837 () Int)

(assert (=> d!9919 (= lt!20774 e!31837)))

(declare-fun c!6687 () Bool)

(assert (=> d!9919 (= c!6687 ((_ is Nil!1323) (t!4360 keyValues!2)))))

(assert (=> d!9919 (= (ListPrimitiveSize!59 (t!4360 keyValues!2)) lt!20774)))

(declare-fun b!49528 () Bool)

(assert (=> b!49528 (= e!31837 0)))

(declare-fun b!49529 () Bool)

(assert (=> b!49529 (= e!31837 (+ 1 (ListPrimitiveSize!59 (t!4360 (t!4360 keyValues!2)))))))

(assert (= (and d!9919 c!6687) b!49528))

(assert (= (and d!9919 (not c!6687)) b!49529))

(declare-fun m!42895 () Bool)

(assert (=> b!49529 m!42895))

(assert (=> b!49512 d!9919))

(declare-fun d!9927 () Bool)

(declare-fun lt!20775 () Int)

(assert (=> d!9927 (>= lt!20775 0)))

(declare-fun e!31838 () Int)

(assert (=> d!9927 (= lt!20775 e!31838)))

(declare-fun c!6688 () Bool)

(assert (=> d!9927 (= c!6688 ((_ is Nil!1323) keyValues!2))))

(assert (=> d!9927 (= (ListPrimitiveSize!59 keyValues!2) lt!20775)))

(declare-fun b!49530 () Bool)

(assert (=> b!49530 (= e!31838 0)))

(declare-fun b!49531 () Bool)

(assert (=> b!49531 (= e!31838 (+ 1 (ListPrimitiveSize!59 (t!4360 keyValues!2))))))

(assert (= (and d!9927 c!6688) b!49530))

(assert (= (and d!9927 (not c!6688)) b!49531))

(assert (=> b!49531 m!42877))

(assert (=> b!49512 d!9927))

(declare-fun d!9929 () Bool)

(declare-fun e!31853 () Bool)

(assert (=> d!9929 e!31853))

(declare-fun res!28636 () Bool)

(assert (=> d!9929 (=> (not res!28636) (not e!31853))))

(declare-fun lt!20809 () ListLongMap!1255)

(declare-fun contains!612 (ListLongMap!1255 (_ BitVec 64)) Bool)

(assert (=> d!9929 (= res!28636 (contains!612 lt!20809 (_1!931 (h!1902 keyValues!2))))))

(declare-fun lt!20810 () List!1326)

(assert (=> d!9929 (= lt!20809 (ListLongMap!1256 lt!20810))))

(declare-datatypes ((Unit!1375 0))(
  ( (Unit!1376) )
))
(declare-fun lt!20808 () Unit!1375)

(declare-fun lt!20811 () Unit!1375)

(assert (=> d!9929 (= lt!20808 lt!20811)))

(declare-datatypes ((Option!125 0))(
  ( (Some!124 (v!2147 B!1018)) (None!123) )
))
(declare-fun getValueByKey!119 (List!1326 (_ BitVec 64)) Option!125)

(assert (=> d!9929 (= (getValueByKey!119 lt!20810 (_1!931 (h!1902 keyValues!2))) (Some!124 (_2!931 (h!1902 keyValues!2))))))

(declare-fun lemmaContainsTupThenGetReturnValue!37 (List!1326 (_ BitVec 64) B!1018) Unit!1375)

(assert (=> d!9929 (= lt!20811 (lemmaContainsTupThenGetReturnValue!37 lt!20810 (_1!931 (h!1902 keyValues!2)) (_2!931 (h!1902 keyValues!2))))))

(declare-fun insertStrictlySorted!40 (List!1326 (_ BitVec 64) B!1018) List!1326)

(assert (=> d!9929 (= lt!20810 (insertStrictlySorted!40 (toList!643 thiss!210) (_1!931 (h!1902 keyValues!2)) (_2!931 (h!1902 keyValues!2))))))

(assert (=> d!9929 (= (+!77 thiss!210 (h!1902 keyValues!2)) lt!20809)))

(declare-fun b!49560 () Bool)

(declare-fun res!28635 () Bool)

(assert (=> b!49560 (=> (not res!28635) (not e!31853))))

(assert (=> b!49560 (= res!28635 (= (getValueByKey!119 (toList!643 lt!20809) (_1!931 (h!1902 keyValues!2))) (Some!124 (_2!931 (h!1902 keyValues!2)))))))

(declare-fun b!49561 () Bool)

(declare-fun contains!614 (List!1326 tuple2!1840) Bool)

(assert (=> b!49561 (= e!31853 (contains!614 (toList!643 lt!20809) (h!1902 keyValues!2)))))

(assert (= (and d!9929 res!28636) b!49560))

(assert (= (and b!49560 res!28635) b!49561))

(declare-fun m!42901 () Bool)

(assert (=> d!9929 m!42901))

(declare-fun m!42903 () Bool)

(assert (=> d!9929 m!42903))

(declare-fun m!42905 () Bool)

(assert (=> d!9929 m!42905))

(declare-fun m!42907 () Bool)

(assert (=> d!9929 m!42907))

(declare-fun m!42909 () Bool)

(assert (=> b!49560 m!42909))

(declare-fun m!42911 () Bool)

(assert (=> b!49561 m!42911))

(assert (=> b!49512 d!9929))

(declare-fun d!9939 () Bool)

(declare-fun isStrictlySorted!282 (List!1326) Bool)

(assert (=> d!9939 (= (inv!2318 thiss!210) (isStrictlySorted!282 (toList!643 thiss!210)))))

(declare-fun bs!2307 () Bool)

(assert (= bs!2307 d!9939))

(declare-fun m!42932 () Bool)

(assert (=> bs!2307 m!42932))

(assert (=> start!7812 d!9939))

(declare-fun b!49579 () Bool)

(declare-fun e!31863 () Bool)

(declare-fun tp!6592 () Bool)

(assert (=> b!49579 (= e!31863 (and tp_is_empty!2169 tp!6592))))

(assert (=> b!49513 (= tp!6578 e!31863)))

(assert (= (and b!49513 ((_ is Cons!1322) (t!4360 keyValues!2))) b!49579))

(declare-fun b!49582 () Bool)

(declare-fun e!31866 () Bool)

(declare-fun tp!6595 () Bool)

(assert (=> b!49582 (= e!31866 (and tp_is_empty!2169 tp!6595))))

(assert (=> b!49514 (= tp!6577 e!31866)))

(assert (= (and b!49514 ((_ is Cons!1322) (toList!643 thiss!210))) b!49582))

(check-sat tp_is_empty!2169 (not d!9939) (not b!49579) (not b!49531) (not b!49560) (not d!9929) (not b!49529) (not b!49582) (not b!49561))
(check-sat)
