; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132734 () Bool)

(assert start!132734)

(declare-fun b!1555189 () Bool)

(declare-fun res!1064165 () Bool)

(declare-fun e!866046 () Bool)

(assert (=> b!1555189 (=> (not res!1064165) (not e!866046))))

(declare-datatypes ((B!2276 0))(
  ( (B!2277 (val!19224 Int)) )
))
(declare-datatypes ((tuple2!24824 0))(
  ( (tuple2!24825 (_1!12423 (_ BitVec 64)) (_2!12423 B!2276)) )
))
(declare-datatypes ((List!36258 0))(
  ( (Nil!36255) (Cons!36254 (h!37700 tuple2!24824) (t!50979 List!36258)) )
))
(declare-fun l!1177 () List!36258)

(declare-fun isStrictlySorted!917 (List!36258) Bool)

(assert (=> b!1555189 (= res!1064165 (isStrictlySorted!917 (t!50979 l!1177)))))

(declare-fun b!1555190 () Bool)

(declare-fun res!1064167 () Bool)

(assert (=> b!1555190 (=> (not res!1064167) (not e!866046))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1555190 (= res!1064167 (and (not (= newKey!105 otherKey!50)) (is-Cons!36254 l!1177) (not (= (_1!12423 (h!37700 l!1177)) otherKey!50))))))

(declare-fun b!1555191 () Bool)

(declare-fun e!866048 () Bool)

(declare-fun tp_is_empty!38287 () Bool)

(declare-fun tp!112263 () Bool)

(assert (=> b!1555191 (= e!866048 (and tp_is_empty!38287 tp!112263))))

(declare-fun b!1555192 () Bool)

(declare-fun lt!670230 () List!36258)

(declare-fun e!866047 () Bool)

(declare-datatypes ((Option!842 0))(
  ( (Some!841 (v!22026 B!2276)) (None!840) )
))
(declare-fun getValueByKey!766 (List!36258 (_ BitVec 64)) Option!842)

(assert (=> b!1555192 (= e!866047 (= (getValueByKey!766 lt!670230 otherKey!50) (getValueByKey!766 (t!50979 l!1177) otherKey!50)))))

(declare-fun res!1064164 () Bool)

(assert (=> start!132734 (=> (not res!1064164) (not e!866046))))

(assert (=> start!132734 (= res!1064164 (isStrictlySorted!917 l!1177))))

(assert (=> start!132734 e!866046))

(assert (=> start!132734 e!866048))

(assert (=> start!132734 true))

(assert (=> start!132734 tp_is_empty!38287))

(declare-fun b!1555193 () Bool)

(assert (=> b!1555193 (= e!866046 (not true))))

(declare-fun newValue!105 () B!2276)

(declare-fun lt!670231 () Bool)

(declare-fun containsKey!788 (List!36258 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!528 (List!36258 (_ BitVec 64) B!2276) List!36258)

(assert (=> b!1555193 (= lt!670231 (containsKey!788 (insertStrictlySorted!528 l!1177 newKey!105 newValue!105) otherKey!50))))

(assert (=> b!1555193 e!866047))

(declare-fun res!1064166 () Bool)

(assert (=> b!1555193 (=> (not res!1064166) (not e!866047))))

(assert (=> b!1555193 (= res!1064166 (= (containsKey!788 lt!670230 otherKey!50) (containsKey!788 (t!50979 l!1177) otherKey!50)))))

(assert (=> b!1555193 (= lt!670230 (insertStrictlySorted!528 (t!50979 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51820 0))(
  ( (Unit!51821) )
))
(declare-fun lt!670232 () Unit!51820)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!25 (List!36258 (_ BitVec 64) B!2276 (_ BitVec 64)) Unit!51820)

(assert (=> b!1555193 (= lt!670232 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!25 (t!50979 l!1177) newKey!105 newValue!105 otherKey!50))))

(assert (= (and start!132734 res!1064164) b!1555190))

(assert (= (and b!1555190 res!1064167) b!1555189))

(assert (= (and b!1555189 res!1064165) b!1555193))

(assert (= (and b!1555193 res!1064166) b!1555192))

(assert (= (and start!132734 (is-Cons!36254 l!1177)) b!1555191))

(declare-fun m!1433265 () Bool)

(assert (=> b!1555189 m!1433265))

(declare-fun m!1433267 () Bool)

(assert (=> b!1555192 m!1433267))

(declare-fun m!1433269 () Bool)

(assert (=> b!1555192 m!1433269))

(declare-fun m!1433271 () Bool)

(assert (=> start!132734 m!1433271))

(declare-fun m!1433273 () Bool)

(assert (=> b!1555193 m!1433273))

(declare-fun m!1433275 () Bool)

(assert (=> b!1555193 m!1433275))

(declare-fun m!1433277 () Bool)

(assert (=> b!1555193 m!1433277))

(declare-fun m!1433279 () Bool)

(assert (=> b!1555193 m!1433279))

(declare-fun m!1433281 () Bool)

(assert (=> b!1555193 m!1433281))

(assert (=> b!1555193 m!1433275))

(declare-fun m!1433283 () Bool)

(assert (=> b!1555193 m!1433283))

(push 1)

(assert tp_is_empty!38287)

(assert (not b!1555193))

(assert (not start!132734))

(assert (not b!1555191))

(assert (not b!1555192))

(assert (not b!1555189))

(check-sat)

(pop 1)

