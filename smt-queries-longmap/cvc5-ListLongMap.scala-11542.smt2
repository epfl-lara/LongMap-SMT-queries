; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134770 () Bool)

(assert start!134770)

(declare-fun b!1571405 () Bool)

(declare-fun e!876149 () Bool)

(assert (=> b!1571405 (= e!876149 (not true))))

(declare-datatypes ((B!2490 0))(
  ( (B!2491 (val!19607 Int)) )
))
(declare-fun v1!32 () B!2490)

(declare-datatypes ((tuple2!25376 0))(
  ( (tuple2!25377 (_1!12699 (_ BitVec 64)) (_2!12699 B!2490)) )
))
(declare-datatypes ((List!36759 0))(
  ( (Nil!36756) (Cons!36755 (h!38220 tuple2!25376) (t!51659 List!36759)) )
))
(declare-fun l!750 () List!36759)

(declare-fun v2!10 () B!2490)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun insertStrictlySorted!587 (List!36759 (_ BitVec 64) B!2490) List!36759)

(assert (=> b!1571405 (= (insertStrictlySorted!587 (insertStrictlySorted!587 (t!51659 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!587 (insertStrictlySorted!587 (t!51659 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!51997 0))(
  ( (Unit!51998) )
))
(declare-fun lt!674166 () Unit!51997)

(declare-fun lemmaInsertStrictlySortedCommutative!12 (List!36759 (_ BitVec 64) B!2490 (_ BitVec 64) B!2490) Unit!51997)

(assert (=> b!1571405 (= lt!674166 (lemmaInsertStrictlySortedCommutative!12 (t!51659 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun res!1073290 () Bool)

(assert (=> start!134770 (=> (not res!1073290) (not e!876149))))

(assert (=> start!134770 (= res!1073290 (not (= key1!37 key2!21)))))

(assert (=> start!134770 e!876149))

(declare-fun tp_is_empty!39041 () Bool)

(assert (=> start!134770 tp_is_empty!39041))

(declare-fun e!876148 () Bool)

(assert (=> start!134770 e!876148))

(assert (=> start!134770 true))

(declare-fun b!1571406 () Bool)

(declare-fun res!1073289 () Bool)

(assert (=> b!1571406 (=> (not res!1073289) (not e!876149))))

(declare-fun isStrictlySorted!988 (List!36759) Bool)

(assert (=> b!1571406 (= res!1073289 (isStrictlySorted!988 l!750))))

(declare-fun b!1571407 () Bool)

(declare-fun res!1073288 () Bool)

(assert (=> b!1571407 (=> (not res!1073288) (not e!876149))))

(assert (=> b!1571407 (= res!1073288 (isStrictlySorted!988 (t!51659 l!750)))))

(declare-fun b!1571408 () Bool)

(declare-fun tp!114072 () Bool)

(assert (=> b!1571408 (= e!876148 (and tp_is_empty!39041 tp!114072))))

(declare-fun b!1571409 () Bool)

(declare-fun res!1073291 () Bool)

(assert (=> b!1571409 (=> (not res!1073291) (not e!876149))))

(assert (=> b!1571409 (= res!1073291 (and (is-Cons!36755 l!750) (bvslt (_1!12699 (h!38220 l!750)) key1!37) (bvslt (_1!12699 (h!38220 l!750)) key2!21)))))

(assert (= (and start!134770 res!1073290) b!1571406))

(assert (= (and b!1571406 res!1073289) b!1571409))

(assert (= (and b!1571409 res!1073291) b!1571407))

(assert (= (and b!1571407 res!1073288) b!1571405))

(assert (= (and start!134770 (is-Cons!36755 l!750)) b!1571408))

(declare-fun m!1445755 () Bool)

(assert (=> b!1571405 m!1445755))

(assert (=> b!1571405 m!1445755))

(declare-fun m!1445757 () Bool)

(assert (=> b!1571405 m!1445757))

(declare-fun m!1445759 () Bool)

(assert (=> b!1571405 m!1445759))

(declare-fun m!1445761 () Bool)

(assert (=> b!1571405 m!1445761))

(assert (=> b!1571405 m!1445759))

(declare-fun m!1445763 () Bool)

(assert (=> b!1571405 m!1445763))

(declare-fun m!1445765 () Bool)

(assert (=> b!1571406 m!1445765))

(declare-fun m!1445767 () Bool)

(assert (=> b!1571407 m!1445767))

(push 1)

(assert (not b!1571406))

(assert (not b!1571408))

(assert (not b!1571405))

(assert tp_is_empty!39041)

(assert (not b!1571407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

