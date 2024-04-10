; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107824 () Bool)

(assert start!107824)

(declare-fun b!1274741 () Bool)

(declare-fun e!727519 () Bool)

(declare-datatypes ((B!2158 0))(
  ( (B!2159 (val!16675 Int)) )
))
(declare-datatypes ((tuple2!21432 0))(
  ( (tuple2!21433 (_1!10727 (_ BitVec 64)) (_2!10727 B!2158)) )
))
(declare-datatypes ((List!28601 0))(
  ( (Nil!28598) (Cons!28597 (h!29806 tuple2!21432) (t!42134 List!28601)) )
))
(declare-fun l!595 () List!28601)

(declare-fun key!173 () (_ BitVec 64))

(declare-fun containsKey!701 (List!28601 (_ BitVec 64)) Bool)

(assert (=> b!1274741 (= e!727519 (containsKey!701 (t!42134 l!595) key!173))))

(declare-fun b!1274742 () Bool)

(declare-fun e!727517 () Bool)

(declare-fun tp_is_empty!33201 () Bool)

(declare-fun tp!98024 () Bool)

(assert (=> b!1274742 (= e!727517 (and tp_is_empty!33201 tp!98024))))

(declare-fun res!847372 () Bool)

(declare-fun e!727518 () Bool)

(assert (=> start!107824 (=> (not res!847372) (not e!727518))))

(declare-fun isStrictlySorted!853 (List!28601) Bool)

(assert (=> start!107824 (= res!847372 (isStrictlySorted!853 l!595))))

(assert (=> start!107824 e!727518))

(assert (=> start!107824 e!727517))

(assert (=> start!107824 true))

(declare-fun b!1274740 () Bool)

(assert (=> b!1274740 (= e!727518 e!727519)))

(declare-fun res!847370 () Bool)

(assert (=> b!1274740 (=> res!847370 e!727519)))

(assert (=> b!1274740 (= res!847370 (not (isStrictlySorted!853 (t!42134 l!595))))))

(declare-fun b!1274739 () Bool)

(declare-fun res!847371 () Bool)

(assert (=> b!1274739 (=> (not res!847371) (not e!727518))))

(get-info :version)

(assert (=> b!1274739 (= res!847371 (and ((_ is Cons!28597) l!595) (= (_1!10727 (h!29806 l!595)) key!173)))))

(assert (= (and start!107824 res!847372) b!1274739))

(assert (= (and b!1274739 res!847371) b!1274740))

(assert (= (and b!1274740 (not res!847370)) b!1274741))

(assert (= (and start!107824 ((_ is Cons!28597) l!595)) b!1274742))

(declare-fun m!1171339 () Bool)

(assert (=> b!1274741 m!1171339))

(declare-fun m!1171341 () Bool)

(assert (=> start!107824 m!1171341))

(declare-fun m!1171343 () Bool)

(assert (=> b!1274740 m!1171343))

(check-sat tp_is_empty!33201 (not b!1274742) (not b!1274740) (not b!1274741) (not start!107824))
(check-sat)
(get-model)

(declare-fun d!140205 () Bool)

(declare-fun res!847386 () Bool)

(declare-fun e!727533 () Bool)

(assert (=> d!140205 (=> res!847386 e!727533)))

(assert (=> d!140205 (= res!847386 (or ((_ is Nil!28598) l!595) ((_ is Nil!28598) (t!42134 l!595))))))

(assert (=> d!140205 (= (isStrictlySorted!853 l!595) e!727533)))

(declare-fun b!1274759 () Bool)

(declare-fun e!727534 () Bool)

(assert (=> b!1274759 (= e!727533 e!727534)))

(declare-fun res!847387 () Bool)

(assert (=> b!1274759 (=> (not res!847387) (not e!727534))))

(assert (=> b!1274759 (= res!847387 (bvslt (_1!10727 (h!29806 l!595)) (_1!10727 (h!29806 (t!42134 l!595)))))))

(declare-fun b!1274760 () Bool)

(assert (=> b!1274760 (= e!727534 (isStrictlySorted!853 (t!42134 l!595)))))

(assert (= (and d!140205 (not res!847386)) b!1274759))

(assert (= (and b!1274759 res!847387) b!1274760))

(assert (=> b!1274760 m!1171343))

(assert (=> start!107824 d!140205))

(declare-fun d!140209 () Bool)

(declare-fun res!847388 () Bool)

(declare-fun e!727535 () Bool)

(assert (=> d!140209 (=> res!847388 e!727535)))

(assert (=> d!140209 (= res!847388 (or ((_ is Nil!28598) (t!42134 l!595)) ((_ is Nil!28598) (t!42134 (t!42134 l!595)))))))

(assert (=> d!140209 (= (isStrictlySorted!853 (t!42134 l!595)) e!727535)))

(declare-fun b!1274761 () Bool)

(declare-fun e!727536 () Bool)

(assert (=> b!1274761 (= e!727535 e!727536)))

(declare-fun res!847389 () Bool)

(assert (=> b!1274761 (=> (not res!847389) (not e!727536))))

(assert (=> b!1274761 (= res!847389 (bvslt (_1!10727 (h!29806 (t!42134 l!595))) (_1!10727 (h!29806 (t!42134 (t!42134 l!595))))))))

(declare-fun b!1274762 () Bool)

(assert (=> b!1274762 (= e!727536 (isStrictlySorted!853 (t!42134 (t!42134 l!595))))))

(assert (= (and d!140209 (not res!847388)) b!1274761))

(assert (= (and b!1274761 res!847389) b!1274762))

(declare-fun m!1171351 () Bool)

(assert (=> b!1274762 m!1171351))

(assert (=> b!1274740 d!140209))

(declare-fun d!140211 () Bool)

(declare-fun res!847400 () Bool)

(declare-fun e!727547 () Bool)

(assert (=> d!140211 (=> res!847400 e!727547)))

(assert (=> d!140211 (= res!847400 (and ((_ is Cons!28597) (t!42134 l!595)) (= (_1!10727 (h!29806 (t!42134 l!595))) key!173)))))

(assert (=> d!140211 (= (containsKey!701 (t!42134 l!595) key!173) e!727547)))

(declare-fun b!1274773 () Bool)

(declare-fun e!727548 () Bool)

(assert (=> b!1274773 (= e!727547 e!727548)))

(declare-fun res!847401 () Bool)

(assert (=> b!1274773 (=> (not res!847401) (not e!727548))))

(assert (=> b!1274773 (= res!847401 (and (or (not ((_ is Cons!28597) (t!42134 l!595))) (bvsle (_1!10727 (h!29806 (t!42134 l!595))) key!173)) ((_ is Cons!28597) (t!42134 l!595)) (bvslt (_1!10727 (h!29806 (t!42134 l!595))) key!173)))))

(declare-fun b!1274774 () Bool)

(assert (=> b!1274774 (= e!727548 (containsKey!701 (t!42134 (t!42134 l!595)) key!173))))

(assert (= (and d!140211 (not res!847400)) b!1274773))

(assert (= (and b!1274773 res!847401) b!1274774))

(declare-fun m!1171355 () Bool)

(assert (=> b!1274774 m!1171355))

(assert (=> b!1274741 d!140211))

(declare-fun b!1274779 () Bool)

(declare-fun e!727551 () Bool)

(declare-fun tp!98030 () Bool)

(assert (=> b!1274779 (= e!727551 (and tp_is_empty!33201 tp!98030))))

(assert (=> b!1274742 (= tp!98024 e!727551)))

(assert (= (and b!1274742 ((_ is Cons!28597) (t!42134 l!595))) b!1274779))

(check-sat tp_is_empty!33201 (not b!1274774) (not b!1274762) (not b!1274760) (not b!1274779))
(check-sat)
