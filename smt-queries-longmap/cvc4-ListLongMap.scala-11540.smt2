; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134328 () Bool)

(assert start!134328)

(declare-fun b!1568624 () Bool)

(declare-fun e!874460 () Bool)

(assert (=> b!1568624 (= e!874460 (not true))))

(declare-datatypes ((B!2478 0))(
  ( (B!2479 (val!19601 Int)) )
))
(declare-fun v1!32 () B!2478)

(declare-fun v2!10 () B!2478)

(declare-datatypes ((tuple2!25304 0))(
  ( (tuple2!25305 (_1!12663 (_ BitVec 64)) (_2!12663 B!2478)) )
))
(declare-datatypes ((List!36721 0))(
  ( (Nil!36718) (Cons!36717 (h!38164 tuple2!25304) (t!51629 List!36721)) )
))
(declare-fun l!750 () List!36721)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun insertStrictlySorted!580 (List!36721 (_ BitVec 64) B!2478) List!36721)

(assert (=> b!1568624 (= (insertStrictlySorted!580 (insertStrictlySorted!580 (t!51629 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!580 (insertStrictlySorted!580 (t!51629 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52076 0))(
  ( (Unit!52077) )
))
(declare-fun lt!673210 () Unit!52076)

(declare-fun lemmaInsertStrictlySortedCommutative!6 (List!36721 (_ BitVec 64) B!2478 (_ BitVec 64) B!2478) Unit!52076)

(assert (=> b!1568624 (= lt!673210 (lemmaInsertStrictlySortedCommutative!6 (t!51629 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1568625 () Bool)

(declare-fun e!874459 () Bool)

(declare-fun tp_is_empty!39029 () Bool)

(declare-fun tp!114045 () Bool)

(assert (=> b!1568625 (= e!874459 (and tp_is_empty!39029 tp!114045))))

(declare-fun b!1568626 () Bool)

(declare-fun res!1072285 () Bool)

(assert (=> b!1568626 (=> (not res!1072285) (not e!874460))))

(assert (=> b!1568626 (= res!1072285 (and (is-Cons!36717 l!750) (bvslt (_1!12663 (h!38164 l!750)) key1!37) (bvslt (_1!12663 (h!38164 l!750)) key2!21)))))

(declare-fun res!1072284 () Bool)

(assert (=> start!134328 (=> (not res!1072284) (not e!874460))))

(assert (=> start!134328 (= res!1072284 (not (= key1!37 key2!21)))))

(assert (=> start!134328 e!874460))

(assert (=> start!134328 tp_is_empty!39029))

(assert (=> start!134328 e!874459))

(assert (=> start!134328 true))

(declare-fun b!1568627 () Bool)

(declare-fun res!1072286 () Bool)

(assert (=> b!1568627 (=> (not res!1072286) (not e!874460))))

(declare-fun isStrictlySorted!994 (List!36721) Bool)

(assert (=> b!1568627 (= res!1072286 (isStrictlySorted!994 (t!51629 l!750)))))

(declare-fun b!1568628 () Bool)

(declare-fun res!1072287 () Bool)

(assert (=> b!1568628 (=> (not res!1072287) (not e!874460))))

(assert (=> b!1568628 (= res!1072287 (isStrictlySorted!994 l!750))))

(assert (= (and start!134328 res!1072284) b!1568628))

(assert (= (and b!1568628 res!1072287) b!1568626))

(assert (= (and b!1568626 res!1072285) b!1568627))

(assert (= (and b!1568627 res!1072286) b!1568624))

(assert (= (and start!134328 (is-Cons!36717 l!750)) b!1568625))

(declare-fun m!1443227 () Bool)

(assert (=> b!1568624 m!1443227))

(assert (=> b!1568624 m!1443227))

(declare-fun m!1443229 () Bool)

(assert (=> b!1568624 m!1443229))

(declare-fun m!1443231 () Bool)

(assert (=> b!1568624 m!1443231))

(declare-fun m!1443233 () Bool)

(assert (=> b!1568624 m!1443233))

(assert (=> b!1568624 m!1443231))

(declare-fun m!1443235 () Bool)

(assert (=> b!1568624 m!1443235))

(declare-fun m!1443237 () Bool)

(assert (=> b!1568627 m!1443237))

(declare-fun m!1443239 () Bool)

(assert (=> b!1568628 m!1443239))

(push 1)

(assert (not b!1568625))

(assert (not b!1568624))

(assert (not b!1568627))

(assert (not b!1568628))

(assert tp_is_empty!39029)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

