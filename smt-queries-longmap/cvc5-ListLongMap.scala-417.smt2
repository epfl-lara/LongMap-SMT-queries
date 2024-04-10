; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7810 () Bool)

(assert start!7810)

(declare-fun res!28616 () Bool)

(declare-fun e!31815 () Bool)

(assert (=> start!7810 (=> (not res!28616) (not e!31815))))

(declare-datatypes ((B!1016 0))(
  ( (B!1017 (val!1128 Int)) )
))
(declare-datatypes ((tuple2!1838 0))(
  ( (tuple2!1839 (_1!930 (_ BitVec 64)) (_2!930 B!1016)) )
))
(declare-datatypes ((List!1325 0))(
  ( (Nil!1322) (Cons!1321 (h!1901 tuple2!1838) (t!4359 List!1325)) )
))
(declare-fun keyValues!2 () List!1325)

(assert (=> start!7810 (= res!28616 (not (is-Nil!1322 keyValues!2)))))

(assert (=> start!7810 e!31815))

(declare-fun e!31816 () Bool)

(assert (=> start!7810 e!31816))

(declare-datatypes ((ListLongMap!1253 0))(
  ( (ListLongMap!1254 (toList!642 List!1325)) )
))
(declare-fun thiss!210 () ListLongMap!1253)

(declare-fun e!31814 () Bool)

(declare-fun inv!2317 (ListLongMap!1253) Bool)

(assert (=> start!7810 (and (inv!2317 thiss!210) e!31814)))

(declare-fun b!49503 () Bool)

(declare-fun ListPrimitiveSize!58 (List!1325) Int)

(assert (=> b!49503 (= e!31815 (>= (ListPrimitiveSize!58 (t!4359 keyValues!2)) (ListPrimitiveSize!58 keyValues!2)))))

(declare-fun lt!20765 () ListLongMap!1253)

(declare-fun +!76 (ListLongMap!1253 tuple2!1838) ListLongMap!1253)

(assert (=> b!49503 (= lt!20765 (+!76 thiss!210 (h!1901 keyValues!2)))))

(declare-fun b!49504 () Bool)

(declare-fun tp_is_empty!2167 () Bool)

(declare-fun tp!6572 () Bool)

(assert (=> b!49504 (= e!31816 (and tp_is_empty!2167 tp!6572))))

(declare-fun b!49505 () Bool)

(declare-fun tp!6571 () Bool)

(assert (=> b!49505 (= e!31814 tp!6571)))

(assert (= (and start!7810 res!28616) b!49503))

(assert (= (and start!7810 (is-Cons!1321 keyValues!2)) b!49504))

(assert (= start!7810 b!49505))

(declare-fun m!42867 () Bool)

(assert (=> start!7810 m!42867))

(declare-fun m!42869 () Bool)

(assert (=> b!49503 m!42869))

(declare-fun m!42871 () Bool)

(assert (=> b!49503 m!42871))

(declare-fun m!42873 () Bool)

(assert (=> b!49503 m!42873))

(push 1)

(assert (not b!49503))

(assert (not start!7810))

(assert (not b!49504))

(assert tp_is_empty!2167)

(assert (not b!49505))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9918 () Bool)

(declare-fun isStrictlySorted!280 (List!1325) Bool)

(assert (=> d!9918 (= (inv!2317 thiss!210) (isStrictlySorted!280 (toList!642 thiss!210)))))

(declare-fun bs!2305 () Bool)

(assert (= bs!2305 d!9918))

(declare-fun m!42891 () Bool)

(assert (=> bs!2305 m!42891))

(assert (=> start!7810 d!9918))

(declare-fun d!9923 () Bool)

(declare-fun lt!20780 () Int)

(assert (=> d!9923 (>= lt!20780 0)))

(declare-fun e!31843 () Int)

(assert (=> d!9923 (= lt!20780 e!31843)))

(declare-fun c!6693 () Bool)

(assert (=> d!9923 (= c!6693 (is-Nil!1322 (t!4359 keyValues!2)))))

(assert (=> d!9923 (= (ListPrimitiveSize!58 (t!4359 keyValues!2)) lt!20780)))

(declare-fun b!49540 () Bool)

(assert (=> b!49540 (= e!31843 0)))

(declare-fun b!49541 () Bool)

(assert (=> b!49541 (= e!31843 (+ 1 (ListPrimitiveSize!58 (t!4359 (t!4359 keyValues!2)))))))

(assert (= (and d!9923 c!6693) b!49540))

(assert (= (and d!9923 (not c!6693)) b!49541))

(declare-fun m!42897 () Bool)

(assert (=> b!49541 m!42897))

(assert (=> b!49503 d!9923))

(declare-fun d!9931 () Bool)

(declare-fun lt!20782 () Int)

(assert (=> d!9931 (>= lt!20782 0)))

(declare-fun e!31845 () Int)

(assert (=> d!9931 (= lt!20782 e!31845)))

(declare-fun c!6695 () Bool)

(assert (=> d!9931 (= c!6695 (is-Nil!1322 keyValues!2))))

(assert (=> d!9931 (= (ListPrimitiveSize!58 keyValues!2) lt!20782)))

(declare-fun b!49544 () Bool)

(assert (=> b!49544 (= e!31845 0)))

(declare-fun b!49545 () Bool)

(assert (=> b!49545 (= e!31845 (+ 1 (ListPrimitiveSize!58 (t!4359 keyValues!2))))))

(assert (= (and d!9931 c!6695) b!49544))

(assert (= (and d!9931 (not c!6695)) b!49545))

(assert (=> b!49545 m!42869))

(assert (=> b!49503 d!9931))

(declare-fun d!9935 () Bool)

(declare-fun e!31854 () Bool)

(assert (=> d!9935 e!31854))

(declare-fun res!28638 () Bool)

(assert (=> d!9935 (=> (not res!28638) (not e!31854))))

(declare-fun lt!20815 () ListLongMap!1253)

(declare-fun contains!613 (ListLongMap!1253 (_ BitVec 64)) Bool)

(assert (=> d!9935 (= res!28638 (contains!613 lt!20815 (_1!930 (h!1901 keyValues!2))))))

(declare-fun lt!20813 () List!1325)

(assert (=> d!9935 (= lt!20815 (ListLongMap!1254 lt!20813))))

(declare-datatypes ((Unit!1377 0))(
  ( (Unit!1378) )
))
(declare-fun lt!20814 () Unit!1377)

(declare-fun lt!20812 () Unit!1377)

(assert (=> d!9935 (= lt!20814 lt!20812)))

(declare-datatypes ((Option!126 0))(
  ( (Some!125 (v!2148 B!1016)) (None!124) )
))
(declare-fun getValueByKey!120 (List!1325 (_ BitVec 64)) Option!126)

(assert (=> d!9935 (= (getValueByKey!120 lt!20813 (_1!930 (h!1901 keyValues!2))) (Some!125 (_2!930 (h!1901 keyValues!2))))))

(declare-fun lemmaContainsTupThenGetReturnValue!38 (List!1325 (_ BitVec 64) B!1016) Unit!1377)

(assert (=> d!9935 (= lt!20812 (lemmaContainsTupThenGetReturnValue!38 lt!20813 (_1!930 (h!1901 keyValues!2)) (_2!930 (h!1901 keyValues!2))))))

(declare-fun insertStrictlySorted!41 (List!1325 (_ BitVec 64) B!1016) List!1325)

(assert (=> d!9935 (= lt!20813 (insertStrictlySorted!41 (toList!642 thiss!210) (_1!930 (h!1901 keyValues!2)) (_2!930 (h!1901 keyValues!2))))))

(assert (=> d!9935 (= (+!76 thiss!210 (h!1901 keyValues!2)) lt!20815)))

(declare-fun b!49562 () Bool)

(declare-fun res!28637 () Bool)

(assert (=> b!49562 (=> (not res!28637) (not e!31854))))

(assert (=> b!49562 (= res!28637 (= (getValueByKey!120 (toList!642 lt!20815) (_1!930 (h!1901 keyValues!2))) (Some!125 (_2!930 (h!1901 keyValues!2)))))))

(declare-fun b!49563 () Bool)

(declare-fun contains!616 (List!1325 tuple2!1838) Bool)

(assert (=> b!49563 (= e!31854 (contains!616 (toList!642 lt!20815) (h!1901 keyValues!2)))))

(assert (= (and d!9935 res!28638) b!49562))

(assert (= (and b!49562 res!28637) b!49563))

(declare-fun m!42913 () Bool)

(assert (=> d!9935 m!42913))

(declare-fun m!42915 () Bool)

(assert (=> d!9935 m!42915))

(declare-fun m!42917 () Bool)

(assert (=> d!9935 m!42917))

(declare-fun m!42919 () Bool)

(assert (=> d!9935 m!42919))

(declare-fun m!42921 () Bool)

(assert (=> b!49562 m!42921))

(declare-fun m!42923 () Bool)

(assert (=> b!49563 m!42923))

(assert (=> b!49503 d!9935))

(declare-fun b!49578 () Bool)

(declare-fun e!31862 () Bool)

(declare-fun tp!6591 () Bool)

(assert (=> b!49578 (= e!31862 (and tp_is_empty!2167 tp!6591))))

(assert (=> b!49505 (= tp!6571 e!31862)))

(assert (= (and b!49505 (is-Cons!1321 (toList!642 thiss!210))) b!49578))

(declare-fun b!49581 () Bool)

(declare-fun e!31865 () Bool)

(declare-fun tp!6594 () Bool)

(assert (=> b!49581 (= e!31865 (and tp_is_empty!2167 tp!6594))))

(assert (=> b!49504 (= tp!6572 e!31865)))

(assert (= (and b!49504 (is-Cons!1321 (t!4359 keyValues!2))) b!49581))

(push 1)

