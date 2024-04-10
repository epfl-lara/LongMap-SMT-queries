; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113784 () Bool)

(assert start!113784)

(declare-fun k!387 () (_ BitVec 64))

(declare-datatypes ((B!2196 0))(
  ( (B!2197 (val!18887 Int)) )
))
(declare-datatypes ((tuple2!24368 0))(
  ( (tuple2!24369 (_1!12195 (_ BitVec 64)) (_2!12195 B!2196)) )
))
(declare-datatypes ((List!31505 0))(
  ( (Nil!31502) (Cons!31501 (h!32710 tuple2!24368) (t!46163 List!31505)) )
))
(declare-datatypes ((ListLongMap!22025 0))(
  ( (ListLongMap!22026 (toList!11028 List!31505)) )
))
(declare-fun contains!9214 (ListLongMap!22025 (_ BitVec 64)) Bool)

(assert (=> start!113784 (contains!9214 (ListLongMap!22026 Nil!31502) k!387)))

(assert (=> start!113784 true))

(declare-fun bs!38726 () Bool)

(assert (= bs!38726 start!113784))

(declare-fun m!1237403 () Bool)

(assert (=> bs!38726 m!1237403))

(push 1)

(assert (not start!113784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!144855 () Bool)

(declare-fun e!768038 () Bool)

(assert (=> d!144855 e!768038))

(declare-fun res!895623 () Bool)

(assert (=> d!144855 (=> res!895623 e!768038)))

(declare-fun lt!596932 () Bool)

(assert (=> d!144855 (= res!895623 (not lt!596932))))

(declare-fun lt!596930 () Bool)

(assert (=> d!144855 (= lt!596932 lt!596930)))

(declare-datatypes ((Unit!44227 0))(
  ( (Unit!44228) )
))
(declare-fun lt!596931 () Unit!44227)

(declare-fun e!768037 () Unit!44227)

(assert (=> d!144855 (= lt!596931 e!768037)))

(declare-fun c!126691 () Bool)

(assert (=> d!144855 (= c!126691 lt!596930)))

(declare-fun containsKey!749 (List!31505 (_ BitVec 64)) Bool)

(assert (=> d!144855 (= lt!596930 (containsKey!749 (toList!11028 (ListLongMap!22026 Nil!31502)) k!387))))

(assert (=> d!144855 (= (contains!9214 (ListLongMap!22026 Nil!31502) k!387) lt!596932)))

(declare-fun b!1350125 () Bool)

(declare-fun lt!596928 () Unit!44227)

(assert (=> b!1350125 (= e!768037 lt!596928)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!495 (List!31505 (_ BitVec 64)) Unit!44227)

(assert (=> b!1350125 (= lt!596928 (lemmaContainsKeyImpliesGetValueByKeyDefined!495 (toList!11028 (ListLongMap!22026 Nil!31502)) k!387))))

(declare-datatypes ((Option!779 0))(
  ( (Some!778 (v!21533 B!2196)) (None!777) )
))
(declare-fun isDefined!534 (Option!779) Bool)

(declare-fun getValueByKey!727 (List!31505 (_ BitVec 64)) Option!779)

(assert (=> b!1350125 (isDefined!534 (getValueByKey!727 (toList!11028 (ListLongMap!22026 Nil!31502)) k!387))))

(declare-fun b!1350126 () Bool)

(declare-fun Unit!44231 () Unit!44227)

(assert (=> b!1350126 (= e!768037 Unit!44231)))

(declare-fun b!1350127 () Bool)

(assert (=> b!1350127 (= e!768038 (isDefined!534 (getValueByKey!727 (toList!11028 (ListLongMap!22026 Nil!31502)) k!387)))))

(assert (= (and d!144855 c!126691) b!1350125))

(assert (= (and d!144855 (not c!126691)) b!1350126))

(assert (= (and d!144855 (not res!895623)) b!1350127))

(declare-fun m!1237406 () Bool)

(assert (=> d!144855 m!1237406))

(declare-fun m!1237413 () Bool)

(assert (=> b!1350125 m!1237413))

(declare-fun m!1237419 () Bool)

(assert (=> b!1350125 m!1237419))

(assert (=> b!1350125 m!1237419))

(declare-fun m!1237425 () Bool)

(assert (=> b!1350125 m!1237425))

(assert (=> b!1350127 m!1237419))

(assert (=> b!1350127 m!1237419))

(assert (=> b!1350127 m!1237425))

(assert (=> start!113784 d!144855))

(push 1)

(assert (not b!1350125))

(assert (not d!144855))

(assert (not b!1350127))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!144867 () Bool)

(assert (=> d!144867 (isDefined!534 (getValueByKey!727 (toList!11028 (ListLongMap!22026 Nil!31502)) k!387))))

(declare-fun lt!596941 () Unit!44227)

(declare-fun choose!1988 (List!31505 (_ BitVec 64)) Unit!44227)

(assert (=> d!144867 (= lt!596941 (choose!1988 (toList!11028 (ListLongMap!22026 Nil!31502)) k!387))))

(declare-fun e!768058 () Bool)

(assert (=> d!144867 e!768058))

(declare-fun res!895636 () Bool)

(assert (=> d!144867 (=> (not res!895636) (not e!768058))))

(declare-fun isStrictlySorted!885 (List!31505) Bool)

(assert (=> d!144867 (= res!895636 (isStrictlySorted!885 (toList!11028 (ListLongMap!22026 Nil!31502))))))

(assert (=> d!144867 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!495 (toList!11028 (ListLongMap!22026 Nil!31502)) k!387) lt!596941)))

(declare-fun b!1350154 () Bool)

(assert (=> b!1350154 (= e!768058 (containsKey!749 (toList!11028 (ListLongMap!22026 Nil!31502)) k!387))))

(assert (= (and d!144867 res!895636) b!1350154))

(assert (=> d!144867 m!1237419))

(assert (=> d!144867 m!1237419))

(assert (=> d!144867 m!1237425))

(declare-fun m!1237441 () Bool)

(assert (=> d!144867 m!1237441))

(declare-fun m!1237443 () Bool)

(assert (=> d!144867 m!1237443))

(assert (=> b!1350154 m!1237406))

(assert (=> b!1350125 d!144867))

(declare-fun d!144875 () Bool)

(declare-fun isEmpty!1103 (Option!779) Bool)

(assert (=> d!144875 (= (isDefined!534 (getValueByKey!727 (toList!11028 (ListLongMap!22026 Nil!31502)) k!387)) (not (isEmpty!1103 (getValueByKey!727 (toList!11028 (ListLongMap!22026 Nil!31502)) k!387))))))

(declare-fun bs!38729 () Bool)

(assert (= bs!38729 d!144875))

(assert (=> bs!38729 m!1237419))

(declare-fun m!1237445 () Bool)

(assert (=> bs!38729 m!1237445))

(assert (=> b!1350125 d!144875))

(declare-fun b!1350183 () Bool)

(declare-fun e!768077 () Option!779)

(assert (=> b!1350183 (= e!768077 None!777)))

(declare-fun b!1350181 () Bool)

(declare-fun e!768076 () Option!779)

(assert (=> b!1350181 (= e!768076 e!768077)))

