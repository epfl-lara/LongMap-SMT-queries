; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134458 () Bool)

(assert start!134458)

(declare-fun res!1072730 () Bool)

(declare-fun e!875086 () Bool)

(assert (=> start!134458 (=> (not res!1072730) (not e!875086))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134458 (= res!1072730 (not (= key1!37 key2!21)))))

(assert (=> start!134458 e!875086))

(assert (=> start!134458 true))

(declare-fun e!875087 () Bool)

(assert (=> start!134458 e!875087))

(declare-fun b!1569731 () Bool)

(declare-datatypes ((B!2536 0))(
  ( (B!2537 (val!19630 Int)) )
))
(declare-datatypes ((tuple2!25362 0))(
  ( (tuple2!25363 (_1!12692 (_ BitVec 64)) (_2!12692 B!2536)) )
))
(declare-datatypes ((List!36750 0))(
  ( (Nil!36747) (Cons!36746 (h!38193 tuple2!25362) (t!51658 List!36750)) )
))
(declare-fun l!750 () List!36750)

(declare-fun isStrictlySorted!1014 (List!36750) Bool)

(assert (=> b!1569731 (= e!875086 (not (isStrictlySorted!1014 (t!51658 l!750))))))

(declare-fun b!1569729 () Bool)

(declare-fun res!1072731 () Bool)

(assert (=> b!1569729 (=> (not res!1072731) (not e!875086))))

(assert (=> b!1569729 (= res!1072731 (isStrictlySorted!1014 l!750))))

(declare-fun b!1569732 () Bool)

(declare-fun tp_is_empty!39087 () Bool)

(declare-fun tp!114177 () Bool)

(assert (=> b!1569732 (= e!875087 (and tp_is_empty!39087 tp!114177))))

(declare-fun b!1569730 () Bool)

(declare-fun res!1072729 () Bool)

(assert (=> b!1569730 (=> (not res!1072729) (not e!875086))))

(get-info :version)

(assert (=> b!1569730 (= res!1072729 (and ((_ is Cons!36746) l!750) (bvslt (_1!12692 (h!38193 l!750)) key1!37) (bvslt (_1!12692 (h!38193 l!750)) key2!21)))))

(assert (= (and start!134458 res!1072730) b!1569729))

(assert (= (and b!1569729 res!1072731) b!1569730))

(assert (= (and b!1569730 res!1072729) b!1569731))

(assert (= (and start!134458 ((_ is Cons!36746) l!750)) b!1569732))

(declare-fun m!1443887 () Bool)

(assert (=> b!1569731 m!1443887))

(declare-fun m!1443889 () Bool)

(assert (=> b!1569729 m!1443889))

(check-sat (not b!1569729) (not b!1569731) (not b!1569732) tp_is_empty!39087)
(check-sat)
(get-model)

(declare-fun d!163933 () Bool)

(declare-fun res!1072745 () Bool)

(declare-fun e!875098 () Bool)

(assert (=> d!163933 (=> res!1072745 e!875098)))

(assert (=> d!163933 (= res!1072745 (or ((_ is Nil!36747) l!750) ((_ is Nil!36747) (t!51658 l!750))))))

(assert (=> d!163933 (= (isStrictlySorted!1014 l!750) e!875098)))

(declare-fun b!1569749 () Bool)

(declare-fun e!875099 () Bool)

(assert (=> b!1569749 (= e!875098 e!875099)))

(declare-fun res!1072746 () Bool)

(assert (=> b!1569749 (=> (not res!1072746) (not e!875099))))

(assert (=> b!1569749 (= res!1072746 (bvslt (_1!12692 (h!38193 l!750)) (_1!12692 (h!38193 (t!51658 l!750)))))))

(declare-fun b!1569750 () Bool)

(assert (=> b!1569750 (= e!875099 (isStrictlySorted!1014 (t!51658 l!750)))))

(assert (= (and d!163933 (not res!1072745)) b!1569749))

(assert (= (and b!1569749 res!1072746) b!1569750))

(assert (=> b!1569750 m!1443887))

(assert (=> b!1569729 d!163933))

(declare-fun d!163935 () Bool)

(declare-fun res!1072747 () Bool)

(declare-fun e!875100 () Bool)

(assert (=> d!163935 (=> res!1072747 e!875100)))

(assert (=> d!163935 (= res!1072747 (or ((_ is Nil!36747) (t!51658 l!750)) ((_ is Nil!36747) (t!51658 (t!51658 l!750)))))))

(assert (=> d!163935 (= (isStrictlySorted!1014 (t!51658 l!750)) e!875100)))

(declare-fun b!1569751 () Bool)

(declare-fun e!875101 () Bool)

(assert (=> b!1569751 (= e!875100 e!875101)))

(declare-fun res!1072748 () Bool)

(assert (=> b!1569751 (=> (not res!1072748) (not e!875101))))

(assert (=> b!1569751 (= res!1072748 (bvslt (_1!12692 (h!38193 (t!51658 l!750))) (_1!12692 (h!38193 (t!51658 (t!51658 l!750))))))))

(declare-fun b!1569752 () Bool)

(assert (=> b!1569752 (= e!875101 (isStrictlySorted!1014 (t!51658 (t!51658 l!750))))))

(assert (= (and d!163935 (not res!1072747)) b!1569751))

(assert (= (and b!1569751 res!1072748) b!1569752))

(declare-fun m!1443895 () Bool)

(assert (=> b!1569752 m!1443895))

(assert (=> b!1569731 d!163935))

(declare-fun b!1569757 () Bool)

(declare-fun e!875104 () Bool)

(declare-fun tp!114183 () Bool)

(assert (=> b!1569757 (= e!875104 (and tp_is_empty!39087 tp!114183))))

(assert (=> b!1569732 (= tp!114177 e!875104)))

(assert (= (and b!1569732 ((_ is Cons!36746) (t!51658 l!750))) b!1569757))

(check-sat (not b!1569752) (not b!1569750) (not b!1569757) tp_is_empty!39087)
(check-sat)
