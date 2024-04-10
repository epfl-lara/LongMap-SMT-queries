; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7814 () Bool)

(assert start!7814)

(declare-fun res!28622 () Bool)

(declare-fun e!31833 () Bool)

(assert (=> start!7814 (=> (not res!28622) (not e!31833))))

(declare-datatypes ((B!1020 0))(
  ( (B!1021 (val!1130 Int)) )
))
(declare-datatypes ((tuple2!1842 0))(
  ( (tuple2!1843 (_1!932 (_ BitVec 64)) (_2!932 B!1020)) )
))
(declare-datatypes ((List!1327 0))(
  ( (Nil!1324) (Cons!1323 (h!1903 tuple2!1842) (t!4361 List!1327)) )
))
(declare-fun keyValues!2 () List!1327)

(assert (=> start!7814 (= res!28622 (not (is-Nil!1324 keyValues!2)))))

(assert (=> start!7814 e!31833))

(declare-fun e!31834 () Bool)

(assert (=> start!7814 e!31834))

(declare-datatypes ((ListLongMap!1257 0))(
  ( (ListLongMap!1258 (toList!644 List!1327)) )
))
(declare-fun thiss!210 () ListLongMap!1257)

(declare-fun e!31832 () Bool)

(declare-fun inv!2319 (ListLongMap!1257) Bool)

(assert (=> start!7814 (and (inv!2319 thiss!210) e!31832)))

(declare-fun b!49521 () Bool)

(declare-fun ListPrimitiveSize!60 (List!1327) Int)

(assert (=> b!49521 (= e!31833 (>= (ListPrimitiveSize!60 (t!4361 keyValues!2)) (ListPrimitiveSize!60 keyValues!2)))))

(declare-fun lt!20771 () ListLongMap!1257)

(declare-fun +!78 (ListLongMap!1257 tuple2!1842) ListLongMap!1257)

(assert (=> b!49521 (= lt!20771 (+!78 thiss!210 (h!1903 keyValues!2)))))

(declare-fun b!49522 () Bool)

(declare-fun tp_is_empty!2171 () Bool)

(declare-fun tp!6584 () Bool)

(assert (=> b!49522 (= e!31834 (and tp_is_empty!2171 tp!6584))))

(declare-fun b!49523 () Bool)

(declare-fun tp!6583 () Bool)

(assert (=> b!49523 (= e!31832 tp!6583)))

(assert (= (and start!7814 res!28622) b!49521))

(assert (= (and start!7814 (is-Cons!1323 keyValues!2)) b!49522))

(assert (= start!7814 b!49523))

(declare-fun m!42883 () Bool)

(assert (=> start!7814 m!42883))

(declare-fun m!42885 () Bool)

(assert (=> b!49521 m!42885))

(declare-fun m!42887 () Bool)

(assert (=> b!49521 m!42887))

(declare-fun m!42889 () Bool)

(assert (=> b!49521 m!42889))

(push 1)

(assert (not b!49523))

(assert tp_is_empty!2171)

(assert (not b!49521))

(assert (not start!7814))

(assert (not b!49522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9921 () Bool)

(declare-fun isStrictlySorted!281 (List!1327) Bool)

(assert (=> d!9921 (= (inv!2319 thiss!210) (isStrictlySorted!281 (toList!644 thiss!210)))))

(declare-fun bs!2306 () Bool)

(assert (= bs!2306 d!9921))

(declare-fun m!42893 () Bool)

(assert (=> bs!2306 m!42893))

(assert (=> start!7814 d!9921))

(declare-fun d!9925 () Bool)

(declare-fun lt!20781 () Int)

(assert (=> d!9925 (>= lt!20781 0)))

(declare-fun e!31844 () Int)

(assert (=> d!9925 (= lt!20781 e!31844)))

(declare-fun c!6694 () Bool)

(assert (=> d!9925 (= c!6694 (is-Nil!1324 (t!4361 keyValues!2)))))

(assert (=> d!9925 (= (ListPrimitiveSize!60 (t!4361 keyValues!2)) lt!20781)))

(declare-fun b!49542 () Bool)

(assert (=> b!49542 (= e!31844 0)))

(declare-fun b!49543 () Bool)

(assert (=> b!49543 (= e!31844 (+ 1 (ListPrimitiveSize!60 (t!4361 (t!4361 keyValues!2)))))))

(assert (= (and d!9925 c!6694) b!49542))

(assert (= (and d!9925 (not c!6694)) b!49543))

(declare-fun m!42899 () Bool)

(assert (=> b!49543 m!42899))

(assert (=> b!49521 d!9925))

(declare-fun d!9933 () Bool)

(declare-fun lt!20783 () Int)

(assert (=> d!9933 (>= lt!20783 0)))

(declare-fun e!31846 () Int)

(assert (=> d!9933 (= lt!20783 e!31846)))

(declare-fun c!6696 () Bool)

(assert (=> d!9933 (= c!6696 (is-Nil!1324 keyValues!2))))

(assert (=> d!9933 (= (ListPrimitiveSize!60 keyValues!2) lt!20783)))

(declare-fun b!49546 () Bool)

(assert (=> b!49546 (= e!31846 0)))

(declare-fun b!49547 () Bool)

(assert (=> b!49547 (= e!31846 (+ 1 (ListPrimitiveSize!60 (t!4361 keyValues!2))))))

(assert (= (and d!9933 c!6696) b!49546))

(assert (= (and d!9933 (not c!6696)) b!49547))

(assert (=> b!49547 m!42885))

(assert (=> b!49521 d!9933))

(declare-fun d!9937 () Bool)

(declare-fun e!31855 () Bool)

(assert (=> d!9937 e!31855))

(declare-fun res!28639 () Bool)

(assert (=> d!9937 (=> (not res!28639) (not e!31855))))

(declare-fun lt!20816 () ListLongMap!1257)

(declare-fun contains!615 (ListLongMap!1257 (_ BitVec 64)) Bool)

(assert (=> d!9937 (= res!28639 (contains!615 lt!20816 (_1!932 (h!1903 keyValues!2))))))

(declare-fun lt!20819 () List!1327)

(assert (=> d!9937 (= lt!20816 (ListLongMap!1258 lt!20819))))

(declare-datatypes ((Unit!1379 0))(
  ( (Unit!1380) )
))
(declare-fun lt!20818 () Unit!1379)

(declare-fun lt!20817 () Unit!1379)

(assert (=> d!9937 (= lt!20818 lt!20817)))

(declare-datatypes ((Option!127 0))(
  ( (Some!126 (v!2149 B!1020)) (None!125) )
))
(declare-fun getValueByKey!121 (List!1327 (_ BitVec 64)) Option!127)

(assert (=> d!9937 (= (getValueByKey!121 lt!20819 (_1!932 (h!1903 keyValues!2))) (Some!126 (_2!932 (h!1903 keyValues!2))))))

(declare-fun lemmaContainsTupThenGetReturnValue!39 (List!1327 (_ BitVec 64) B!1020) Unit!1379)

(assert (=> d!9937 (= lt!20817 (lemmaContainsTupThenGetReturnValue!39 lt!20819 (_1!932 (h!1903 keyValues!2)) (_2!932 (h!1903 keyValues!2))))))

(declare-fun insertStrictlySorted!42 (List!1327 (_ BitVec 64) B!1020) List!1327)

(assert (=> d!9937 (= lt!20819 (insertStrictlySorted!42 (toList!644 thiss!210) (_1!932 (h!1903 keyValues!2)) (_2!932 (h!1903 keyValues!2))))))

(assert (=> d!9937 (= (+!78 thiss!210 (h!1903 keyValues!2)) lt!20816)))

(declare-fun b!49564 () Bool)

(declare-fun res!28640 () Bool)

(assert (=> b!49564 (=> (not res!28640) (not e!31855))))

(assert (=> b!49564 (= res!28640 (= (getValueByKey!121 (toList!644 lt!20816) (_1!932 (h!1903 keyValues!2))) (Some!126 (_2!932 (h!1903 keyValues!2)))))))

(declare-fun b!49565 () Bool)

(declare-fun contains!617 (List!1327 tuple2!1842) Bool)

(assert (=> b!49565 (= e!31855 (contains!617 (toList!644 lt!20816) (h!1903 keyValues!2)))))

(assert (= (and d!9937 res!28639) b!49564))

(assert (= (and b!49564 res!28640) b!49565))

(declare-fun m!42925 () Bool)

