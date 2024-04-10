; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134324 () Bool)

(assert start!134324)

(declare-fun b!1568594 () Bool)

(declare-fun e!874447 () Bool)

(declare-fun tp_is_empty!39025 () Bool)

(declare-fun tp!114039 () Bool)

(assert (=> b!1568594 (= e!874447 (and tp_is_empty!39025 tp!114039))))

(declare-fun res!1072263 () Bool)

(declare-fun e!874448 () Bool)

(assert (=> start!134324 (=> (not res!1072263) (not e!874448))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134324 (= res!1072263 (not (= key1!37 key2!21)))))

(assert (=> start!134324 e!874448))

(assert (=> start!134324 tp_is_empty!39025))

(assert (=> start!134324 e!874447))

(assert (=> start!134324 true))

(declare-fun b!1568595 () Bool)

(declare-fun res!1072261 () Bool)

(assert (=> b!1568595 (=> (not res!1072261) (not e!874448))))

(declare-datatypes ((B!2474 0))(
  ( (B!2475 (val!19599 Int)) )
))
(declare-datatypes ((tuple2!25300 0))(
  ( (tuple2!25301 (_1!12661 (_ BitVec 64)) (_2!12661 B!2474)) )
))
(declare-datatypes ((List!36719 0))(
  ( (Nil!36716) (Cons!36715 (h!38162 tuple2!25300) (t!51627 List!36719)) )
))
(declare-fun l!750 () List!36719)

(declare-fun isStrictlySorted!992 (List!36719) Bool)

(assert (=> b!1568595 (= res!1072261 (isStrictlySorted!992 l!750))))

(declare-fun b!1568596 () Bool)

(assert (=> b!1568596 (= e!874448 (not true))))

(declare-fun v1!32 () B!2474)

(declare-fun v2!10 () B!2474)

(declare-fun insertStrictlySorted!578 (List!36719 (_ BitVec 64) B!2474) List!36719)

(assert (=> b!1568596 (= (insertStrictlySorted!578 (insertStrictlySorted!578 (t!51627 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!578 (insertStrictlySorted!578 (t!51627 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52072 0))(
  ( (Unit!52073) )
))
(declare-fun lt!673204 () Unit!52072)

(declare-fun lemmaInsertStrictlySortedCommutative!4 (List!36719 (_ BitVec 64) B!2474 (_ BitVec 64) B!2474) Unit!52072)

(assert (=> b!1568596 (= lt!673204 (lemmaInsertStrictlySortedCommutative!4 (t!51627 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1568597 () Bool)

(declare-fun res!1072260 () Bool)

(assert (=> b!1568597 (=> (not res!1072260) (not e!874448))))

(assert (=> b!1568597 (= res!1072260 (and (is-Cons!36715 l!750) (bvslt (_1!12661 (h!38162 l!750)) key1!37) (bvslt (_1!12661 (h!38162 l!750)) key2!21)))))

(declare-fun b!1568598 () Bool)

(declare-fun res!1072262 () Bool)

(assert (=> b!1568598 (=> (not res!1072262) (not e!874448))))

(assert (=> b!1568598 (= res!1072262 (isStrictlySorted!992 (t!51627 l!750)))))

(assert (= (and start!134324 res!1072263) b!1568595))

(assert (= (and b!1568595 res!1072261) b!1568597))

(assert (= (and b!1568597 res!1072260) b!1568598))

(assert (= (and b!1568598 res!1072262) b!1568596))

(assert (= (and start!134324 (is-Cons!36715 l!750)) b!1568594))

(declare-fun m!1443199 () Bool)

(assert (=> b!1568595 m!1443199))

(declare-fun m!1443201 () Bool)

(assert (=> b!1568596 m!1443201))

(assert (=> b!1568596 m!1443201))

(declare-fun m!1443203 () Bool)

(assert (=> b!1568596 m!1443203))

(declare-fun m!1443205 () Bool)

(assert (=> b!1568596 m!1443205))

(declare-fun m!1443207 () Bool)

(assert (=> b!1568596 m!1443207))

(assert (=> b!1568596 m!1443205))

(declare-fun m!1443209 () Bool)

(assert (=> b!1568596 m!1443209))

(declare-fun m!1443211 () Bool)

(assert (=> b!1568598 m!1443211))

(push 1)

(assert (not b!1568595))

(assert (not b!1568594))

(assert (not b!1568596))

(assert (not b!1568598))

(assert tp_is_empty!39025)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

