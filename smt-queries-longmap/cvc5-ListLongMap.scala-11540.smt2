; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134740 () Bool)

(assert start!134740)

(declare-fun b!1571060 () Bool)

(declare-fun e!875969 () Bool)

(assert (=> b!1571060 (= e!875969 (not true))))

(declare-datatypes ((B!2478 0))(
  ( (B!2479 (val!19601 Int)) )
))
(declare-fun v1!32 () B!2478)

(declare-fun v2!10 () B!2478)

(declare-datatypes ((tuple2!25364 0))(
  ( (tuple2!25365 (_1!12693 (_ BitVec 64)) (_2!12693 B!2478)) )
))
(declare-datatypes ((List!36753 0))(
  ( (Nil!36750) (Cons!36749 (h!38214 tuple2!25364) (t!51653 List!36753)) )
))
(declare-fun l!750 () List!36753)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun insertStrictlySorted!581 (List!36753 (_ BitVec 64) B!2478) List!36753)

(assert (=> b!1571060 (= (insertStrictlySorted!581 (insertStrictlySorted!581 (t!51653 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!581 (insertStrictlySorted!581 (t!51653 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!51985 0))(
  ( (Unit!51986) )
))
(declare-fun lt!674118 () Unit!51985)

(declare-fun lemmaInsertStrictlySortedCommutative!6 (List!36753 (_ BitVec 64) B!2478 (_ BitVec 64) B!2478) Unit!51985)

(assert (=> b!1571060 (= lt!674118 (lemmaInsertStrictlySortedCommutative!6 (t!51653 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1571061 () Bool)

(declare-fun res!1073144 () Bool)

(assert (=> b!1571061 (=> (not res!1073144) (not e!875969))))

(declare-fun isStrictlySorted!982 (List!36753) Bool)

(assert (=> b!1571061 (= res!1073144 (isStrictlySorted!982 l!750))))

(declare-fun res!1073145 () Bool)

(assert (=> start!134740 (=> (not res!1073145) (not e!875969))))

(assert (=> start!134740 (= res!1073145 (not (= key1!37 key2!21)))))

(assert (=> start!134740 e!875969))

(declare-fun tp_is_empty!39029 () Bool)

(assert (=> start!134740 tp_is_empty!39029))

(declare-fun e!875968 () Bool)

(assert (=> start!134740 e!875968))

(assert (=> start!134740 true))

(declare-fun b!1571062 () Bool)

(declare-fun res!1073146 () Bool)

(assert (=> b!1571062 (=> (not res!1073146) (not e!875969))))

(assert (=> b!1571062 (= res!1073146 (and (is-Cons!36749 l!750) (bvslt (_1!12693 (h!38214 l!750)) key1!37) (bvslt (_1!12693 (h!38214 l!750)) key2!21)))))

(declare-fun b!1571063 () Bool)

(declare-fun res!1073147 () Bool)

(assert (=> b!1571063 (=> (not res!1073147) (not e!875969))))

(assert (=> b!1571063 (= res!1073147 (isStrictlySorted!982 (t!51653 l!750)))))

(declare-fun b!1571064 () Bool)

(declare-fun tp!114045 () Bool)

(assert (=> b!1571064 (= e!875968 (and tp_is_empty!39029 tp!114045))))

(assert (= (and start!134740 res!1073145) b!1571061))

(assert (= (and b!1571061 res!1073144) b!1571062))

(assert (= (and b!1571062 res!1073146) b!1571063))

(assert (= (and b!1571063 res!1073147) b!1571060))

(assert (= (and start!134740 (is-Cons!36749 l!750)) b!1571064))

(declare-fun m!1445485 () Bool)

(assert (=> b!1571060 m!1445485))

(assert (=> b!1571060 m!1445485))

(declare-fun m!1445487 () Bool)

(assert (=> b!1571060 m!1445487))

(declare-fun m!1445489 () Bool)

(assert (=> b!1571060 m!1445489))

(declare-fun m!1445491 () Bool)

(assert (=> b!1571060 m!1445491))

(assert (=> b!1571060 m!1445489))

(declare-fun m!1445493 () Bool)

(assert (=> b!1571060 m!1445493))

(declare-fun m!1445495 () Bool)

(assert (=> b!1571061 m!1445495))

(declare-fun m!1445497 () Bool)

(assert (=> b!1571063 m!1445497))

(push 1)

(assert (not b!1571063))

(assert tp_is_empty!39029)

(assert (not b!1571064))

(assert (not b!1571061))

(assert (not b!1571060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

