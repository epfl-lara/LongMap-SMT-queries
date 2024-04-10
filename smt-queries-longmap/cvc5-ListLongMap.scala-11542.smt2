; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134354 () Bool)

(assert start!134354)

(declare-fun b!1568939 () Bool)

(declare-fun res!1072406 () Bool)

(declare-fun e!874627 () Bool)

(assert (=> b!1568939 (=> (not res!1072406) (not e!874627))))

(declare-datatypes ((B!2486 0))(
  ( (B!2487 (val!19605 Int)) )
))
(declare-datatypes ((tuple2!25312 0))(
  ( (tuple2!25313 (_1!12667 (_ BitVec 64)) (_2!12667 B!2486)) )
))
(declare-datatypes ((List!36725 0))(
  ( (Nil!36722) (Cons!36721 (h!38168 tuple2!25312) (t!51633 List!36725)) )
))
(declare-fun l!750 () List!36725)

(declare-fun isStrictlySorted!998 (List!36725) Bool)

(assert (=> b!1568939 (= res!1072406 (isStrictlySorted!998 l!750))))

(declare-fun b!1568940 () Bool)

(declare-fun res!1072405 () Bool)

(assert (=> b!1568940 (=> (not res!1072405) (not e!874627))))

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1568940 (= res!1072405 (and (is-Cons!36721 l!750) (bvslt (_1!12667 (h!38168 l!750)) key1!37) (bvslt (_1!12667 (h!38168 l!750)) key2!21)))))

(declare-fun b!1568941 () Bool)

(declare-fun e!874628 () Bool)

(declare-fun tp_is_empty!39037 () Bool)

(declare-fun tp!114066 () Bool)

(assert (=> b!1568941 (= e!874628 (and tp_is_empty!39037 tp!114066))))

(declare-fun res!1072407 () Bool)

(assert (=> start!134354 (=> (not res!1072407) (not e!874627))))

(assert (=> start!134354 (= res!1072407 (not (= key1!37 key2!21)))))

(assert (=> start!134354 e!874627))

(assert (=> start!134354 tp_is_empty!39037))

(assert (=> start!134354 e!874628))

(assert (=> start!134354 true))

(declare-fun b!1568942 () Bool)

(declare-fun res!1072404 () Bool)

(assert (=> b!1568942 (=> (not res!1072404) (not e!874627))))

(assert (=> b!1568942 (= res!1072404 (isStrictlySorted!998 (t!51633 l!750)))))

(declare-fun b!1568943 () Bool)

(assert (=> b!1568943 (= e!874627 (not true))))

(declare-fun v1!32 () B!2486)

(declare-fun v2!10 () B!2486)

(declare-fun insertStrictlySorted!584 (List!36725 (_ BitVec 64) B!2486) List!36725)

(assert (=> b!1568943 (= (insertStrictlySorted!584 (insertStrictlySorted!584 (t!51633 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!584 (insertStrictlySorted!584 (t!51633 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52084 0))(
  ( (Unit!52085) )
))
(declare-fun lt!673252 () Unit!52084)

(declare-fun lemmaInsertStrictlySortedCommutative!10 (List!36725 (_ BitVec 64) B!2486 (_ BitVec 64) B!2486) Unit!52084)

(assert (=> b!1568943 (= lt!673252 (lemmaInsertStrictlySortedCommutative!10 (t!51633 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (= (and start!134354 res!1072407) b!1568939))

(assert (= (and b!1568939 res!1072406) b!1568940))

(assert (= (and b!1568940 res!1072405) b!1568942))

(assert (= (and b!1568942 res!1072404) b!1568943))

(assert (= (and start!134354 (is-Cons!36721 l!750)) b!1568941))

(declare-fun m!1443469 () Bool)

(assert (=> b!1568939 m!1443469))

(declare-fun m!1443471 () Bool)

(assert (=> b!1568942 m!1443471))

(declare-fun m!1443473 () Bool)

(assert (=> b!1568943 m!1443473))

(assert (=> b!1568943 m!1443473))

(declare-fun m!1443475 () Bool)

(assert (=> b!1568943 m!1443475))

(declare-fun m!1443477 () Bool)

(assert (=> b!1568943 m!1443477))

(declare-fun m!1443479 () Bool)

(assert (=> b!1568943 m!1443479))

(assert (=> b!1568943 m!1443477))

(declare-fun m!1443481 () Bool)

(assert (=> b!1568943 m!1443481))

(push 1)

(assert (not b!1568941))

(assert tp_is_empty!39037)

(assert (not b!1568942))

(assert (not b!1568943))

(assert (not b!1568939))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

