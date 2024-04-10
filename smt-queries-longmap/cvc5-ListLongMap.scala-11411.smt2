; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132878 () Bool)

(assert start!132878)

(declare-fun b!1556162 () Bool)

(declare-fun e!866696 () Bool)

(declare-fun tp_is_empty!38353 () Bool)

(declare-fun tp!112407 () Bool)

(assert (=> b!1556162 (= e!866696 (and tp_is_empty!38353 tp!112407))))

(declare-fun res!1064654 () Bool)

(declare-fun e!866695 () Bool)

(assert (=> start!132878 (=> (not res!1064654) (not e!866695))))

(declare-datatypes ((B!2342 0))(
  ( (B!2343 (val!19257 Int)) )
))
(declare-datatypes ((tuple2!24890 0))(
  ( (tuple2!24891 (_1!12456 (_ BitVec 64)) (_2!12456 B!2342)) )
))
(declare-datatypes ((List!36291 0))(
  ( (Nil!36288) (Cons!36287 (h!37733 tuple2!24890) (t!51012 List!36291)) )
))
(declare-fun l!1177 () List!36291)

(declare-fun isStrictlySorted!944 (List!36291) Bool)

(assert (=> start!132878 (= res!1064654 (isStrictlySorted!944 l!1177))))

(assert (=> start!132878 e!866695))

(assert (=> start!132878 e!866696))

(assert (=> start!132878 true))

(declare-fun b!1556160 () Bool)

(declare-fun res!1064656 () Bool)

(assert (=> b!1556160 (=> (not res!1064656) (not e!866695))))

(assert (=> b!1556160 (= res!1064656 (isStrictlySorted!944 (t!51012 l!1177)))))

(declare-fun b!1556159 () Bool)

(declare-fun res!1064655 () Bool)

(assert (=> b!1556159 (=> (not res!1064655) (not e!866695))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1556159 (= res!1064655 (and (not (= newKey!105 otherKey!50)) (is-Cons!36287 l!1177) (not (= (_1!12456 (h!37733 l!1177)) otherKey!50))))))

(declare-fun b!1556161 () Bool)

(declare-fun ListPrimitiveSize!178 (List!36291) Int)

(assert (=> b!1556161 (= e!866695 (>= (ListPrimitiveSize!178 (t!51012 l!1177)) (ListPrimitiveSize!178 l!1177)))))

(assert (= (and start!132878 res!1064654) b!1556159))

(assert (= (and b!1556159 res!1064655) b!1556160))

(assert (= (and b!1556160 res!1064656) b!1556161))

(assert (= (and start!132878 (is-Cons!36287 l!1177)) b!1556162))

(declare-fun m!1433793 () Bool)

(assert (=> start!132878 m!1433793))

(declare-fun m!1433795 () Bool)

(assert (=> b!1556160 m!1433795))

(declare-fun m!1433797 () Bool)

(assert (=> b!1556161 m!1433797))

(declare-fun m!1433799 () Bool)

(assert (=> b!1556161 m!1433799))

(push 1)

(assert tp_is_empty!38353)

(assert (not start!132878))

(assert (not b!1556160))

(assert (not b!1556161))

(assert (not b!1556162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162083 () Bool)

(declare-fun res!1064693 () Bool)

(declare-fun e!866731 () Bool)

(assert (=> d!162083 (=> res!1064693 e!866731)))

(assert (=> d!162083 (= res!1064693 (or (is-Nil!36288 l!1177) (is-Nil!36288 (t!51012 l!1177))))))

(assert (=> d!162083 (= (isStrictlySorted!944 l!1177) e!866731)))

(declare-fun b!1556213 () Bool)

(declare-fun e!866732 () Bool)

(assert (=> b!1556213 (= e!866731 e!866732)))

(declare-fun res!1064694 () Bool)

(assert (=> b!1556213 (=> (not res!1064694) (not e!866732))))

(assert (=> b!1556213 (= res!1064694 (bvslt (_1!12456 (h!37733 l!1177)) (_1!12456 (h!37733 (t!51012 l!1177)))))))

(declare-fun b!1556214 () Bool)

(assert (=> b!1556214 (= e!866732 (isStrictlySorted!944 (t!51012 l!1177)))))

(assert (= (and d!162083 (not res!1064693)) b!1556213))

(assert (= (and b!1556213 res!1064694) b!1556214))

(assert (=> b!1556214 m!1433795))

(assert (=> start!132878 d!162083))

(declare-fun d!162093 () Bool)

(declare-fun res!1064697 () Bool)

(declare-fun e!866735 () Bool)

(assert (=> d!162093 (=> res!1064697 e!866735)))

(assert (=> d!162093 (= res!1064697 (or (is-Nil!36288 (t!51012 l!1177)) (is-Nil!36288 (t!51012 (t!51012 l!1177)))))))

(assert (=> d!162093 (= (isStrictlySorted!944 (t!51012 l!1177)) e!866735)))

(declare-fun b!1556217 () Bool)

(declare-fun e!866736 () Bool)

(assert (=> b!1556217 (= e!866735 e!866736)))

(declare-fun res!1064698 () Bool)

(assert (=> b!1556217 (=> (not res!1064698) (not e!866736))))

(assert (=> b!1556217 (= res!1064698 (bvslt (_1!12456 (h!37733 (t!51012 l!1177))) (_1!12456 (h!37733 (t!51012 (t!51012 l!1177))))))))

(declare-fun b!1556218 () Bool)

(assert (=> b!1556218 (= e!866736 (isStrictlySorted!944 (t!51012 (t!51012 l!1177))))))

(assert (= (and d!162093 (not res!1064697)) b!1556217))

(assert (= (and b!1556217 res!1064698) b!1556218))

(declare-fun m!1433823 () Bool)

(assert (=> b!1556218 m!1433823))

(assert (=> b!1556160 d!162093))

(declare-fun d!162095 () Bool)

(declare-fun lt!670390 () Int)

(assert (=> d!162095 (>= lt!670390 0)))

(declare-fun e!866746 () Int)

(assert (=> d!162095 (= lt!670390 e!866746)))

(declare-fun c!143725 () Bool)

(assert (=> d!162095 (= c!143725 (is-Nil!36288 (t!51012 l!1177)))))

(assert (=> d!162095 (= (ListPrimitiveSize!178 (t!51012 l!1177)) lt!670390)))

(declare-fun b!1556236 () Bool)

(assert (=> b!1556236 (= e!866746 0)))

(declare-fun b!1556237 () Bool)

(assert (=> b!1556237 (= e!866746 (+ 1 (ListPrimitiveSize!178 (t!51012 (t!51012 l!1177)))))))

(assert (= (and d!162095 c!143725) b!1556236))

(assert (= (and d!162095 (not c!143725)) b!1556237))

(declare-fun m!1433827 () Bool)

(assert (=> b!1556237 m!1433827))

(assert (=> b!1556161 d!162095))

(declare-fun d!162099 () Bool)

(declare-fun lt!670391 () Int)

(assert (=> d!162099 (>= lt!670391 0)))

(declare-fun e!866749 () Int)

(assert (=> d!162099 (= lt!670391 e!866749)))

(declare-fun c!143726 () Bool)

(assert (=> d!162099 (= c!143726 (is-Nil!36288 l!1177))))

(assert (=> d!162099 (= (ListPrimitiveSize!178 l!1177) lt!670391)))

(declare-fun b!1556242 () Bool)

(assert (=> b!1556242 (= e!866749 0)))

(declare-fun b!1556243 () Bool)

(assert (=> b!1556243 (= e!866749 (+ 1 (ListPrimitiveSize!178 (t!51012 l!1177))))))

(assert (= (and d!162099 c!143726) b!1556242))

(assert (= (and d!162099 (not c!143726)) b!1556243))

(assert (=> b!1556243 m!1433797))

(assert (=> b!1556161 d!162099))

(declare-fun b!1556249 () Bool)

(declare-fun e!866753 () Bool)

(declare-fun tp!112422 () Bool)

(assert (=> b!1556249 (= e!866753 (and tp_is_empty!38353 tp!112422))))

(assert (=> b!1556162 (= tp!112407 e!866753)))

(assert (= (and b!1556162 (is-Cons!36287 (t!51012 l!1177))) b!1556249))

(push 1)

