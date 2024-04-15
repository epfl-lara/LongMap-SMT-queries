; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7816 () Bool)

(assert start!7816)

(declare-fun res!28602 () Bool)

(declare-fun e!31789 () Bool)

(assert (=> start!7816 (=> (not res!28602) (not e!31789))))

(declare-datatypes ((B!1020 0))(
  ( (B!1021 (val!1130 Int)) )
))
(declare-datatypes ((tuple2!1846 0))(
  ( (tuple2!1847 (_1!934 (_ BitVec 64)) (_2!934 B!1020)) )
))
(declare-datatypes ((List!1323 0))(
  ( (Nil!1320) (Cons!1319 (h!1899 tuple2!1846) (t!4356 List!1323)) )
))
(declare-fun keyValues!2 () List!1323)

(assert (=> start!7816 (= res!28602 (not (is-Nil!1320 keyValues!2)))))

(assert (=> start!7816 e!31789))

(declare-fun e!31791 () Bool)

(assert (=> start!7816 e!31791))

(declare-datatypes ((ListLongMap!1249 0))(
  ( (ListLongMap!1250 (toList!640 List!1323)) )
))
(declare-fun thiss!210 () ListLongMap!1249)

(declare-fun e!31790 () Bool)

(declare-fun inv!2319 (ListLongMap!1249) Bool)

(assert (=> start!7816 (and (inv!2319 thiss!210) e!31790)))

(declare-fun b!49455 () Bool)

(declare-fun ListPrimitiveSize!60 (List!1323) Int)

(assert (=> b!49455 (= e!31789 (>= (ListPrimitiveSize!60 (t!4356 keyValues!2)) (ListPrimitiveSize!60 keyValues!2)))))

(declare-fun lt!20755 () ListLongMap!1249)

(declare-fun +!78 (ListLongMap!1249 tuple2!1846) ListLongMap!1249)

(assert (=> b!49455 (= lt!20755 (+!78 thiss!210 (h!1899 keyValues!2)))))

(declare-fun b!49456 () Bool)

(declare-fun tp_is_empty!2171 () Bool)

(declare-fun tp!6584 () Bool)

(assert (=> b!49456 (= e!31791 (and tp_is_empty!2171 tp!6584))))

(declare-fun b!49457 () Bool)

(declare-fun tp!6583 () Bool)

(assert (=> b!49457 (= e!31790 tp!6583)))

(assert (= (and start!7816 res!28602) b!49455))

(assert (= (and start!7816 (is-Cons!1319 keyValues!2)) b!49456))

(assert (= start!7816 b!49457))

(declare-fun m!42801 () Bool)

(assert (=> start!7816 m!42801))

(declare-fun m!42803 () Bool)

(assert (=> b!49455 m!42803))

(declare-fun m!42805 () Bool)

(assert (=> b!49455 m!42805))

(declare-fun m!42807 () Bool)

(assert (=> b!49455 m!42807))

(push 1)

(assert tp_is_empty!2171)

(assert (not b!49457))

(assert (not b!49456))

(assert (not start!7816))

(assert (not b!49455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9891 () Bool)

(declare-fun lt!20758 () Int)

(assert (=> d!9891 (>= lt!20758 0)))

(declare-fun e!31794 () Int)

(assert (=> d!9891 (= lt!20758 e!31794)))

(declare-fun c!6664 () Bool)

(assert (=> d!9891 (= c!6664 (is-Nil!1320 (t!4356 keyValues!2)))))

(assert (=> d!9891 (= (ListPrimitiveSize!60 (t!4356 keyValues!2)) lt!20758)))

(declare-fun b!49462 () Bool)

(assert (=> b!49462 (= e!31794 0)))

(declare-fun b!49463 () Bool)

(assert (=> b!49463 (= e!31794 (+ 1 (ListPrimitiveSize!60 (t!4356 (t!4356 keyValues!2)))))))

(assert (= (and d!9891 c!6664) b!49462))

(assert (= (and d!9891 (not c!6664)) b!49463))

(declare-fun m!42809 () Bool)

(assert (=> b!49463 m!42809))

(assert (=> b!49455 d!9891))

(declare-fun d!9897 () Bool)

(declare-fun lt!20759 () Int)

(assert (=> d!9897 (>= lt!20759 0)))

(declare-fun e!31795 () Int)

(assert (=> d!9897 (= lt!20759 e!31795)))

(declare-fun c!6665 () Bool)

(assert (=> d!9897 (= c!6665 (is-Nil!1320 keyValues!2))))

(assert (=> d!9897 (= (ListPrimitiveSize!60 keyValues!2) lt!20759)))

(declare-fun b!49464 () Bool)

(assert (=> b!49464 (= e!31795 0)))

(declare-fun b!49465 () Bool)

(assert (=> b!49465 (= e!31795 (+ 1 (ListPrimitiveSize!60 (t!4356 keyValues!2))))))

(assert (= (and d!9897 c!6665) b!49464))

(assert (= (and d!9897 (not c!6665)) b!49465))

(assert (=> b!49465 m!42803))

(assert (=> b!49455 d!9897))

(declare-fun d!9899 () Bool)

(declare-fun e!31806 () Bool)

(assert (=> d!9899 e!31806))

(declare-fun res!28608 () Bool)

(assert (=> d!9899 (=> (not res!28608) (not e!31806))))

(declare-fun lt!20776 () ListLongMap!1249)

(declare-fun contains!609 (ListLongMap!1249 (_ BitVec 64)) Bool)

(assert (=> d!9899 (= res!28608 (contains!609 lt!20776 (_1!934 (h!1899 keyValues!2))))))

(declare-fun lt!20777 () List!1323)

(assert (=> d!9899 (= lt!20776 (ListLongMap!1250 lt!20777))))

(declare-datatypes ((Unit!1380 0))(
  ( (Unit!1381) )
))
(declare-fun lt!20778 () Unit!1380)

(declare-fun lt!20779 () Unit!1380)

(assert (=> d!9899 (= lt!20778 lt!20779)))

(declare-datatypes ((Option!123 0))(
  ( (Some!122 (v!2145 B!1020)) (None!121) )
))
(declare-fun getValueByKey!117 (List!1323 (_ BitVec 64)) Option!123)

(assert (=> d!9899 (= (getValueByKey!117 lt!20777 (_1!934 (h!1899 keyValues!2))) (Some!122 (_2!934 (h!1899 keyValues!2))))))

(declare-fun lemmaContainsTupThenGetReturnValue!38 (List!1323 (_ BitVec 64) B!1020) Unit!1380)

(assert (=> d!9899 (= lt!20779 (lemmaContainsTupThenGetReturnValue!38 lt!20777 (_1!934 (h!1899 keyValues!2)) (_2!934 (h!1899 keyValues!2))))))

(declare-fun insertStrictlySorted!41 (List!1323 (_ BitVec 64) B!1020) List!1323)

(assert (=> d!9899 (= lt!20777 (insertStrictlySorted!41 (toList!640 thiss!210) (_1!934 (h!1899 keyValues!2)) (_2!934 (h!1899 keyValues!2))))))

(assert (=> d!9899 (= (+!78 thiss!210 (h!1899 keyValues!2)) lt!20776)))

(declare-fun b!49486 () Bool)

(declare-fun res!28607 () Bool)

(assert (=> b!49486 (=> (not res!28607) (not e!31806))))

(assert (=> b!49486 (= res!28607 (= (getValueByKey!117 (toList!640 lt!20776) (_1!934 (h!1899 keyValues!2))) (Some!122 (_2!934 (h!1899 keyValues!2)))))))

(declare-fun b!49487 () Bool)

(declare-fun contains!610 (List!1323 tuple2!1846) Bool)

(assert (=> b!49487 (= e!31806 (contains!610 (toList!640 lt!20776) (h!1899 keyValues!2)))))

(assert (= (and d!9899 res!28608) b!49486))

(assert (= (and b!49486 res!28607) b!49487))

(declare-fun m!42819 () Bool)

(assert (=> d!9899 m!42819))

(declare-fun m!42821 () Bool)

(assert (=> d!9899 m!42821))

(declare-fun m!42823 () Bool)

(assert (=> d!9899 m!42823))

(declare-fun m!42825 () Bool)

(assert (=> d!9899 m!42825))

(declare-fun m!42827 () Bool)

(assert (=> b!49486 m!42827))

(declare-fun m!42829 () Bool)

(assert (=> b!49487 m!42829))

(assert (=> b!49455 d!9899))

(declare-fun d!9913 () Bool)

(declare-fun isStrictlySorted!277 (List!1323) Bool)

(assert (=> d!9913 (= (inv!2319 thiss!210) (isStrictlySorted!277 (toList!640 thiss!210)))))

(declare-fun bs!2306 () Bool)

(assert (= bs!2306 d!9913))

(declare-fun m!42831 () Bool)

(assert (=> bs!2306 m!42831))

(assert (=> start!7816 d!9913))

(declare-fun b!49492 () Bool)

(declare-fun e!31809 () Bool)

(declare-fun tp!6587 () Bool)

(assert (=> b!49492 (= e!31809 (and tp_is_empty!2171 tp!6587))))

(assert (=> b!49456 (= tp!6584 e!31809)))

(assert (= (and b!49456 (is-Cons!1319 (t!4356 keyValues!2))) b!49492))

(declare-fun b!49493 () Bool)

(declare-fun e!31810 () Bool)

(declare-fun tp!6588 () Bool)

(assert (=> b!49493 (= e!31810 (and tp_is_empty!2171 tp!6588))))

(assert (=> b!49457 (= tp!6583 e!31810)))

(assert (= (and b!49457 (is-Cons!1319 (toList!640 thiss!210))) b!49493))

(push 1)

(assert tp_is_empty!2171)

(assert (not d!9899))

(assert (not b!49493))

(assert (not b!49486))

(assert (not b!49463))

(assert (not b!49492))

(assert (not b!49487))

(assert (not d!9913))

(assert (not b!49465))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

