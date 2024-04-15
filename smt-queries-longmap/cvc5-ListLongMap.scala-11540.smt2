; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134278 () Bool)

(assert start!134278)

(declare-fun b!1568311 () Bool)

(declare-fun res!1072158 () Bool)

(declare-fun e!874262 () Bool)

(assert (=> b!1568311 (=> (not res!1072158) (not e!874262))))

(declare-datatypes ((B!2478 0))(
  ( (B!2479 (val!19601 Int)) )
))
(declare-datatypes ((tuple2!25372 0))(
  ( (tuple2!25373 (_1!12697 (_ BitVec 64)) (_2!12697 B!2478)) )
))
(declare-datatypes ((List!36762 0))(
  ( (Nil!36759) (Cons!36758 (h!38206 tuple2!25372) (t!51662 List!36762)) )
))
(declare-fun l!750 () List!36762)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1568311 (= res!1072158 (and (is-Cons!36758 l!750) (bvslt (_1!12697 (h!38206 l!750)) key1!37) (bvslt (_1!12697 (h!38206 l!750)) key2!21)))))

(declare-fun b!1568312 () Bool)

(assert (=> b!1568312 (= e!874262 (not true))))

(declare-fun v1!32 () B!2478)

(declare-fun v2!10 () B!2478)

(declare-fun insertStrictlySorted!581 (List!36762 (_ BitVec 64) B!2478) List!36762)

(assert (=> b!1568312 (= (insertStrictlySorted!581 (insertStrictlySorted!581 (t!51662 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!581 (insertStrictlySorted!581 (t!51662 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!51885 0))(
  ( (Unit!51886) )
))
(declare-fun lt!672924 () Unit!51885)

(declare-fun lemmaInsertStrictlySortedCommutative!6 (List!36762 (_ BitVec 64) B!2478 (_ BitVec 64) B!2478) Unit!51885)

(assert (=> b!1568312 (= lt!672924 (lemmaInsertStrictlySortedCommutative!6 (t!51662 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1568313 () Bool)

(declare-fun res!1072156 () Bool)

(assert (=> b!1568313 (=> (not res!1072156) (not e!874262))))

(declare-fun isStrictlySorted!992 (List!36762) Bool)

(assert (=> b!1568313 (= res!1072156 (isStrictlySorted!992 l!750))))

(declare-fun res!1072157 () Bool)

(assert (=> start!134278 (=> (not res!1072157) (not e!874262))))

(assert (=> start!134278 (= res!1072157 (not (= key1!37 key2!21)))))

(assert (=> start!134278 e!874262))

(declare-fun tp_is_empty!39029 () Bool)

(assert (=> start!134278 tp_is_empty!39029))

(declare-fun e!874261 () Bool)

(assert (=> start!134278 e!874261))

(assert (=> start!134278 true))

(declare-fun b!1568314 () Bool)

(declare-fun tp!114046 () Bool)

(assert (=> b!1568314 (= e!874261 (and tp_is_empty!39029 tp!114046))))

(declare-fun b!1568315 () Bool)

(declare-fun res!1072155 () Bool)

(assert (=> b!1568315 (=> (not res!1072155) (not e!874262))))

(assert (=> b!1568315 (= res!1072155 (isStrictlySorted!992 (t!51662 l!750)))))

(assert (= (and start!134278 res!1072157) b!1568313))

(assert (= (and b!1568313 res!1072156) b!1568311))

(assert (= (and b!1568311 res!1072158) b!1568315))

(assert (= (and b!1568315 res!1072155) b!1568312))

(assert (= (and start!134278 (is-Cons!36758 l!750)) b!1568314))

(declare-fun m!1442335 () Bool)

(assert (=> b!1568312 m!1442335))

(assert (=> b!1568312 m!1442335))

(declare-fun m!1442337 () Bool)

(assert (=> b!1568312 m!1442337))

(declare-fun m!1442339 () Bool)

(assert (=> b!1568312 m!1442339))

(declare-fun m!1442341 () Bool)

(assert (=> b!1568312 m!1442341))

(assert (=> b!1568312 m!1442339))

(declare-fun m!1442343 () Bool)

(assert (=> b!1568312 m!1442343))

(declare-fun m!1442345 () Bool)

(assert (=> b!1568313 m!1442345))

(declare-fun m!1442347 () Bool)

(assert (=> b!1568315 m!1442347))

(push 1)

(assert (not b!1568313))

(assert (not b!1568314))

(assert (not b!1568315))

(assert tp_is_empty!39029)

(assert (not b!1568312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

