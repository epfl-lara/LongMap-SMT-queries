; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7816 () Bool)

(assert start!7816)

(declare-fun res!28591 () Bool)

(declare-fun e!31779 () Bool)

(assert (=> start!7816 (=> (not res!28591) (not e!31779))))

(declare-datatypes ((B!1016 0))(
  ( (B!1017 (val!1128 Int)) )
))
(declare-datatypes ((tuple2!1820 0))(
  ( (tuple2!1821 (_1!921 (_ BitVec 64)) (_2!921 B!1016)) )
))
(declare-datatypes ((List!1311 0))(
  ( (Nil!1308) (Cons!1307 (h!1887 tuple2!1820) (t!4345 List!1311)) )
))
(declare-fun keyValues!2 () List!1311)

(get-info :version)

(assert (=> start!7816 (= res!28591 (not ((_ is Nil!1308) keyValues!2)))))

(assert (=> start!7816 e!31779))

(declare-fun e!31777 () Bool)

(assert (=> start!7816 e!31777))

(declare-datatypes ((ListLongMap!1229 0))(
  ( (ListLongMap!1230 (toList!630 List!1311)) )
))
(declare-fun thiss!210 () ListLongMap!1229)

(declare-fun e!31778 () Bool)

(declare-fun inv!2317 (ListLongMap!1229) Bool)

(assert (=> start!7816 (and (inv!2317 thiss!210) e!31778)))

(declare-fun b!49446 () Bool)

(declare-fun ListPrimitiveSize!58 (List!1311) Int)

(assert (=> b!49446 (= e!31779 (>= (ListPrimitiveSize!58 (t!4345 keyValues!2)) (ListPrimitiveSize!58 keyValues!2)))))

(declare-fun lt!20722 () ListLongMap!1229)

(declare-fun +!75 (ListLongMap!1229 tuple2!1820) ListLongMap!1229)

(assert (=> b!49446 (= lt!20722 (+!75 thiss!210 (h!1887 keyValues!2)))))

(declare-fun b!49447 () Bool)

(declare-fun tp_is_empty!2167 () Bool)

(declare-fun tp!6571 () Bool)

(assert (=> b!49447 (= e!31777 (and tp_is_empty!2167 tp!6571))))

(declare-fun b!49448 () Bool)

(declare-fun tp!6572 () Bool)

(assert (=> b!49448 (= e!31778 tp!6572)))

(assert (= (and start!7816 res!28591) b!49446))

(assert (= (and start!7816 ((_ is Cons!1307) keyValues!2)) b!49447))

(assert (= start!7816 b!49448))

(declare-fun m!42743 () Bool)

(assert (=> start!7816 m!42743))

(declare-fun m!42745 () Bool)

(assert (=> b!49446 m!42745))

(declare-fun m!42747 () Bool)

(assert (=> b!49446 m!42747))

(declare-fun m!42749 () Bool)

(assert (=> b!49446 m!42749))

(check-sat tp_is_empty!2167 (not b!49448) (not start!7816) (not b!49446) (not b!49447))
(check-sat)
(get-model)

(declare-fun d!9907 () Bool)

(declare-fun isStrictlySorted!268 (List!1311) Bool)

(assert (=> d!9907 (= (inv!2317 thiss!210) (isStrictlySorted!268 (toList!630 thiss!210)))))

(declare-fun bs!2305 () Bool)

(assert (= bs!2305 d!9907))

(declare-fun m!42767 () Bool)

(assert (=> bs!2305 m!42767))

(assert (=> start!7816 d!9907))

(declare-fun d!9911 () Bool)

(declare-fun lt!20739 () Int)

(assert (=> d!9911 (>= lt!20739 0)))

(declare-fun e!31808 () Int)

(assert (=> d!9911 (= lt!20739 e!31808)))

(declare-fun c!6679 () Bool)

(assert (=> d!9911 (= c!6679 ((_ is Nil!1308) (t!4345 keyValues!2)))))

(assert (=> d!9911 (= (ListPrimitiveSize!58 (t!4345 keyValues!2)) lt!20739)))

(declare-fun b!49487 () Bool)

(assert (=> b!49487 (= e!31808 0)))

(declare-fun b!49488 () Bool)

(assert (=> b!49488 (= e!31808 (+ 1 (ListPrimitiveSize!58 (t!4345 (t!4345 keyValues!2)))))))

(assert (= (and d!9911 c!6679) b!49487))

(assert (= (and d!9911 (not c!6679)) b!49488))

(declare-fun m!42773 () Bool)

(assert (=> b!49488 m!42773))

(assert (=> b!49446 d!9911))

(declare-fun d!9921 () Bool)

(declare-fun lt!20740 () Int)

(assert (=> d!9921 (>= lt!20740 0)))

(declare-fun e!31809 () Int)

(assert (=> d!9921 (= lt!20740 e!31809)))

(declare-fun c!6680 () Bool)

(assert (=> d!9921 (= c!6680 ((_ is Nil!1308) keyValues!2))))

(assert (=> d!9921 (= (ListPrimitiveSize!58 keyValues!2) lt!20740)))

(declare-fun b!49489 () Bool)

(assert (=> b!49489 (= e!31809 0)))

(declare-fun b!49490 () Bool)

(assert (=> b!49490 (= e!31809 (+ 1 (ListPrimitiveSize!58 (t!4345 keyValues!2))))))

(assert (= (and d!9921 c!6680) b!49489))

(assert (= (and d!9921 (not c!6680)) b!49490))

(assert (=> b!49490 m!42745))

(assert (=> b!49446 d!9921))

(declare-fun d!9923 () Bool)

(declare-fun e!31818 () Bool)

(assert (=> d!9923 e!31818))

(declare-fun res!28615 () Bool)

(assert (=> d!9923 (=> (not res!28615) (not e!31818))))

(declare-fun lt!20774 () ListLongMap!1229)

(declare-fun contains!603 (ListLongMap!1229 (_ BitVec 64)) Bool)

(assert (=> d!9923 (= res!28615 (contains!603 lt!20774 (_1!921 (h!1887 keyValues!2))))))

(declare-fun lt!20775 () List!1311)

(assert (=> d!9923 (= lt!20774 (ListLongMap!1230 lt!20775))))

(declare-datatypes ((Unit!1386 0))(
  ( (Unit!1387) )
))
(declare-fun lt!20776 () Unit!1386)

(declare-fun lt!20773 () Unit!1386)

(assert (=> d!9923 (= lt!20776 lt!20773)))

(declare-datatypes ((Option!126 0))(
  ( (Some!125 (v!2148 B!1016)) (None!124) )
))
(declare-fun getValueByKey!120 (List!1311 (_ BitVec 64)) Option!126)

(assert (=> d!9923 (= (getValueByKey!120 lt!20775 (_1!921 (h!1887 keyValues!2))) (Some!125 (_2!921 (h!1887 keyValues!2))))))

(declare-fun lemmaContainsTupThenGetReturnValue!38 (List!1311 (_ BitVec 64) B!1016) Unit!1386)

(assert (=> d!9923 (= lt!20773 (lemmaContainsTupThenGetReturnValue!38 lt!20775 (_1!921 (h!1887 keyValues!2)) (_2!921 (h!1887 keyValues!2))))))

(declare-fun insertStrictlySorted!41 (List!1311 (_ BitVec 64) B!1016) List!1311)

(assert (=> d!9923 (= lt!20775 (insertStrictlySorted!41 (toList!630 thiss!210) (_1!921 (h!1887 keyValues!2)) (_2!921 (h!1887 keyValues!2))))))

(assert (=> d!9923 (= (+!75 thiss!210 (h!1887 keyValues!2)) lt!20774)))

(declare-fun b!49507 () Bool)

(declare-fun res!28614 () Bool)

(assert (=> b!49507 (=> (not res!28614) (not e!31818))))

(assert (=> b!49507 (= res!28614 (= (getValueByKey!120 (toList!630 lt!20774) (_1!921 (h!1887 keyValues!2))) (Some!125 (_2!921 (h!1887 keyValues!2)))))))

(declare-fun b!49508 () Bool)

(declare-fun contains!606 (List!1311 tuple2!1820) Bool)

(assert (=> b!49508 (= e!31818 (contains!606 (toList!630 lt!20774) (h!1887 keyValues!2)))))

(assert (= (and d!9923 res!28615) b!49507))

(assert (= (and b!49507 res!28614) b!49508))

(declare-fun m!42799 () Bool)

(assert (=> d!9923 m!42799))

(declare-fun m!42801 () Bool)

(assert (=> d!9923 m!42801))

(declare-fun m!42803 () Bool)

(assert (=> d!9923 m!42803))

(declare-fun m!42805 () Bool)

(assert (=> d!9923 m!42805))

(declare-fun m!42807 () Bool)

(assert (=> b!49507 m!42807))

(declare-fun m!42809 () Bool)

(assert (=> b!49508 m!42809))

(assert (=> b!49446 d!9923))

(declare-fun b!49519 () Bool)

(declare-fun e!31823 () Bool)

(declare-fun tp!6589 () Bool)

(assert (=> b!49519 (= e!31823 (and tp_is_empty!2167 tp!6589))))

(assert (=> b!49447 (= tp!6571 e!31823)))

(assert (= (and b!49447 ((_ is Cons!1307) (t!4345 keyValues!2))) b!49519))

(declare-fun b!49523 () Bool)

(declare-fun e!31827 () Bool)

(declare-fun tp!6593 () Bool)

(assert (=> b!49523 (= e!31827 (and tp_is_empty!2167 tp!6593))))

(assert (=> b!49448 (= tp!6572 e!31827)))

(assert (= (and b!49448 ((_ is Cons!1307) (toList!630 thiss!210))) b!49523))

(check-sat (not b!49488) (not d!9907) (not b!49508) (not b!49519) (not b!49523) (not b!49507) (not b!49490) (not d!9923) tp_is_empty!2167)
(check-sat)
