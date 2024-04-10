; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134358 () Bool)

(assert start!134358)

(declare-fun b!1568969 () Bool)

(declare-fun e!874639 () Bool)

(assert (=> b!1568969 (= e!874639 (not true))))

(declare-datatypes ((B!2490 0))(
  ( (B!2491 (val!19607 Int)) )
))
(declare-fun v1!32 () B!2490)

(declare-fun v2!10 () B!2490)

(declare-datatypes ((tuple2!25316 0))(
  ( (tuple2!25317 (_1!12669 (_ BitVec 64)) (_2!12669 B!2490)) )
))
(declare-datatypes ((List!36727 0))(
  ( (Nil!36724) (Cons!36723 (h!38170 tuple2!25316) (t!51635 List!36727)) )
))
(declare-fun l!750 () List!36727)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun insertStrictlySorted!586 (List!36727 (_ BitVec 64) B!2490) List!36727)

(assert (=> b!1568969 (= (insertStrictlySorted!586 (insertStrictlySorted!586 (t!51635 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!586 (insertStrictlySorted!586 (t!51635 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52088 0))(
  ( (Unit!52089) )
))
(declare-fun lt!673258 () Unit!52088)

(declare-fun lemmaInsertStrictlySortedCommutative!12 (List!36727 (_ BitVec 64) B!2490 (_ BitVec 64) B!2490) Unit!52088)

(assert (=> b!1568969 (= lt!673258 (lemmaInsertStrictlySortedCommutative!12 (t!51635 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1568970 () Bool)

(declare-fun res!1072429 () Bool)

(assert (=> b!1568970 (=> (not res!1072429) (not e!874639))))

(declare-fun isStrictlySorted!1000 (List!36727) Bool)

(assert (=> b!1568970 (= res!1072429 (isStrictlySorted!1000 (t!51635 l!750)))))

(declare-fun b!1568972 () Bool)

(declare-fun res!1072431 () Bool)

(assert (=> b!1568972 (=> (not res!1072431) (not e!874639))))

(assert (=> b!1568972 (= res!1072431 (and (is-Cons!36723 l!750) (bvslt (_1!12669 (h!38170 l!750)) key1!37) (bvslt (_1!12669 (h!38170 l!750)) key2!21)))))

(declare-fun b!1568973 () Bool)

(declare-fun res!1072430 () Bool)

(assert (=> b!1568973 (=> (not res!1072430) (not e!874639))))

(assert (=> b!1568973 (= res!1072430 (isStrictlySorted!1000 l!750))))

(declare-fun b!1568971 () Bool)

(declare-fun e!874640 () Bool)

(declare-fun tp_is_empty!39041 () Bool)

(declare-fun tp!114072 () Bool)

(assert (=> b!1568971 (= e!874640 (and tp_is_empty!39041 tp!114072))))

(declare-fun res!1072428 () Bool)

(assert (=> start!134358 (=> (not res!1072428) (not e!874639))))

(assert (=> start!134358 (= res!1072428 (not (= key1!37 key2!21)))))

(assert (=> start!134358 e!874639))

(assert (=> start!134358 tp_is_empty!39041))

(assert (=> start!134358 e!874640))

(assert (=> start!134358 true))

(assert (= (and start!134358 res!1072428) b!1568973))

(assert (= (and b!1568973 res!1072430) b!1568972))

(assert (= (and b!1568972 res!1072431) b!1568970))

(assert (= (and b!1568970 res!1072429) b!1568969))

(assert (= (and start!134358 (is-Cons!36723 l!750)) b!1568971))

(declare-fun m!1443497 () Bool)

(assert (=> b!1568969 m!1443497))

(assert (=> b!1568969 m!1443497))

(declare-fun m!1443499 () Bool)

(assert (=> b!1568969 m!1443499))

(declare-fun m!1443501 () Bool)

(assert (=> b!1568969 m!1443501))

(declare-fun m!1443503 () Bool)

(assert (=> b!1568969 m!1443503))

(assert (=> b!1568969 m!1443501))

(declare-fun m!1443505 () Bool)

(assert (=> b!1568969 m!1443505))

(declare-fun m!1443507 () Bool)

(assert (=> b!1568970 m!1443507))

(declare-fun m!1443509 () Bool)

(assert (=> b!1568973 m!1443509))

(push 1)

(assert (not b!1568969))

(assert (not b!1568971))

(assert (not b!1568973))

(assert tp_is_empty!39041)

(assert (not b!1568970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

