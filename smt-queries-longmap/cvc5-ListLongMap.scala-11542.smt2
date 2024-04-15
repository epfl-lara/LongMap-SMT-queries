; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134308 () Bool)

(assert start!134308)

(declare-fun b!1568656 () Bool)

(declare-fun e!874441 () Bool)

(assert (=> b!1568656 (= e!874441 (not true))))

(declare-datatypes ((B!2490 0))(
  ( (B!2491 (val!19607 Int)) )
))
(declare-fun v1!32 () B!2490)

(declare-fun v2!10 () B!2490)

(declare-datatypes ((tuple2!25384 0))(
  ( (tuple2!25385 (_1!12703 (_ BitVec 64)) (_2!12703 B!2490)) )
))
(declare-datatypes ((List!36768 0))(
  ( (Nil!36765) (Cons!36764 (h!38212 tuple2!25384) (t!51668 List!36768)) )
))
(declare-fun l!750 () List!36768)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun insertStrictlySorted!587 (List!36768 (_ BitVec 64) B!2490) List!36768)

(assert (=> b!1568656 (= (insertStrictlySorted!587 (insertStrictlySorted!587 (t!51668 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!587 (insertStrictlySorted!587 (t!51668 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!51897 0))(
  ( (Unit!51898) )
))
(declare-fun lt!672972 () Unit!51897)

(declare-fun lemmaInsertStrictlySortedCommutative!12 (List!36768 (_ BitVec 64) B!2490 (_ BitVec 64) B!2490) Unit!51897)

(assert (=> b!1568656 (= lt!672972 (lemmaInsertStrictlySortedCommutative!12 (t!51668 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1568657 () Bool)

(declare-fun res!1072299 () Bool)

(assert (=> b!1568657 (=> (not res!1072299) (not e!874441))))

(declare-fun isStrictlySorted!998 (List!36768) Bool)

(assert (=> b!1568657 (= res!1072299 (isStrictlySorted!998 l!750))))

(declare-fun b!1568658 () Bool)

(declare-fun res!1072301 () Bool)

(assert (=> b!1568658 (=> (not res!1072301) (not e!874441))))

(assert (=> b!1568658 (= res!1072301 (isStrictlySorted!998 (t!51668 l!750)))))

(declare-fun b!1568659 () Bool)

(declare-fun e!874442 () Bool)

(declare-fun tp_is_empty!39041 () Bool)

(declare-fun tp!114073 () Bool)

(assert (=> b!1568659 (= e!874442 (and tp_is_empty!39041 tp!114073))))

(declare-fun res!1072300 () Bool)

(assert (=> start!134308 (=> (not res!1072300) (not e!874441))))

(assert (=> start!134308 (= res!1072300 (not (= key1!37 key2!21)))))

(assert (=> start!134308 e!874441))

(assert (=> start!134308 tp_is_empty!39041))

(assert (=> start!134308 e!874442))

(assert (=> start!134308 true))

(declare-fun b!1568660 () Bool)

(declare-fun res!1072302 () Bool)

(assert (=> b!1568660 (=> (not res!1072302) (not e!874441))))

(assert (=> b!1568660 (= res!1072302 (and (is-Cons!36764 l!750) (bvslt (_1!12703 (h!38212 l!750)) key1!37) (bvslt (_1!12703 (h!38212 l!750)) key2!21)))))

(assert (= (and start!134308 res!1072300) b!1568657))

(assert (= (and b!1568657 res!1072299) b!1568660))

(assert (= (and b!1568660 res!1072302) b!1568658))

(assert (= (and b!1568658 res!1072301) b!1568656))

(assert (= (and start!134308 (is-Cons!36764 l!750)) b!1568659))

(declare-fun m!1442605 () Bool)

(assert (=> b!1568656 m!1442605))

(assert (=> b!1568656 m!1442605))

(declare-fun m!1442607 () Bool)

(assert (=> b!1568656 m!1442607))

(declare-fun m!1442609 () Bool)

(assert (=> b!1568656 m!1442609))

(declare-fun m!1442611 () Bool)

(assert (=> b!1568656 m!1442611))

(assert (=> b!1568656 m!1442609))

(declare-fun m!1442613 () Bool)

(assert (=> b!1568656 m!1442613))

(declare-fun m!1442615 () Bool)

(assert (=> b!1568657 m!1442615))

(declare-fun m!1442617 () Bool)

(assert (=> b!1568658 m!1442617))

(push 1)

(assert (not b!1568658))

(assert tp_is_empty!39041)

(assert (not b!1568659))

(assert (not b!1568657))

(assert (not b!1568656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

