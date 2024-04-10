; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107888 () Bool)

(assert start!107888)

(declare-fun res!847579 () Bool)

(declare-fun e!727791 () Bool)

(assert (=> start!107888 (=> (not res!847579) (not e!727791))))

(declare-datatypes ((B!2174 0))(
  ( (B!2175 (val!16683 Int)) )
))
(declare-datatypes ((tuple2!21448 0))(
  ( (tuple2!21449 (_1!10735 (_ BitVec 64)) (_2!10735 B!2174)) )
))
(declare-datatypes ((List!28609 0))(
  ( (Nil!28606) (Cons!28605 (h!29814 tuple2!21448) (t!42145 List!28609)) )
))
(declare-fun l!595 () List!28609)

(declare-fun isStrictlySorted!861 (List!28609) Bool)

(assert (=> start!107888 (= res!847579 (isStrictlySorted!861 l!595))))

(assert (=> start!107888 e!727791))

(declare-fun e!727792 () Bool)

(assert (=> start!107888 e!727792))

(assert (=> start!107888 true))

(declare-fun b!1275093 () Bool)

(declare-fun tp_is_empty!33217 () Bool)

(declare-fun tp!98078 () Bool)

(assert (=> b!1275093 (= e!727792 (and tp_is_empty!33217 tp!98078))))

(declare-fun b!1275090 () Bool)

(declare-fun res!847578 () Bool)

(assert (=> b!1275090 (=> (not res!847578) (not e!727791))))

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1275090 (= res!847578 (and (or (not (is-Cons!28605 l!595)) (not (= (_1!10735 (h!29814 l!595)) key!173))) (or (not (is-Cons!28605 l!595)) (= (_1!10735 (h!29814 l!595)) key!173)) (is-Nil!28606 l!595)))))

(declare-fun b!1275092 () Bool)

(declare-fun e!727790 () Bool)

(declare-fun containsKey!706 (List!28609 (_ BitVec 64)) Bool)

(assert (=> b!1275092 (= e!727790 (containsKey!706 Nil!28606 key!173))))

(declare-fun b!1275091 () Bool)

(assert (=> b!1275091 (= e!727791 e!727790)))

(declare-fun res!847577 () Bool)

(assert (=> b!1275091 (=> res!847577 e!727790)))

(assert (=> b!1275091 (= res!847577 false)))

(assert (= (and start!107888 res!847579) b!1275090))

(assert (= (and b!1275090 res!847578) b!1275091))

(assert (= (and b!1275091 (not res!847577)) b!1275092))

(assert (= (and start!107888 (is-Cons!28605 l!595)) b!1275093))

(declare-fun m!1171519 () Bool)

(assert (=> start!107888 m!1171519))

(declare-fun m!1171521 () Bool)

(assert (=> b!1275092 m!1171521))

(push 1)

(assert (not b!1275092))

(assert (not start!107888))

(assert (not b!1275093))

(assert tp_is_empty!33217)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140321 () Bool)

(declare-fun res!847608 () Bool)

(declare-fun e!727821 () Bool)

(assert (=> d!140321 (=> res!847608 e!727821)))

(assert (=> d!140321 (= res!847608 (and (is-Cons!28605 Nil!28606) (= (_1!10735 (h!29814 Nil!28606)) key!173)))))

(assert (=> d!140321 (= (containsKey!706 Nil!28606 key!173) e!727821)))

(declare-fun b!1275128 () Bool)

(declare-fun e!727822 () Bool)

(assert (=> b!1275128 (= e!727821 e!727822)))

(declare-fun res!847609 () Bool)

(assert (=> b!1275128 (=> (not res!847609) (not e!727822))))

(assert (=> b!1275128 (= res!847609 (and (or (not (is-Cons!28605 Nil!28606)) (bvsle (_1!10735 (h!29814 Nil!28606)) key!173)) (is-Cons!28605 Nil!28606) (bvslt (_1!10735 (h!29814 Nil!28606)) key!173)))))

(declare-fun b!1275129 () Bool)

(assert (=> b!1275129 (= e!727822 (containsKey!706 (t!42145 Nil!28606) key!173))))

(assert (= (and d!140321 (not res!847608)) b!1275128))

(assert (= (and b!1275128 res!847609) b!1275129))

(declare-fun m!1171533 () Bool)

(assert (=> b!1275129 m!1171533))

(assert (=> b!1275092 d!140321))

(declare-fun d!140327 () Bool)

(declare-fun res!847620 () Bool)

(declare-fun e!727833 () Bool)

(assert (=> d!140327 (=> res!847620 e!727833)))

(assert (=> d!140327 (= res!847620 (or (is-Nil!28606 l!595) (is-Nil!28606 (t!42145 l!595))))))

(assert (=> d!140327 (= (isStrictlySorted!861 l!595) e!727833)))

(declare-fun b!1275140 () Bool)

(declare-fun e!727834 () Bool)

(assert (=> b!1275140 (= e!727833 e!727834)))

(declare-fun res!847621 () Bool)

(assert (=> b!1275140 (=> (not res!847621) (not e!727834))))

(assert (=> b!1275140 (= res!847621 (bvslt (_1!10735 (h!29814 l!595)) (_1!10735 (h!29814 (t!42145 l!595)))))))

(declare-fun b!1275141 () Bool)

(assert (=> b!1275141 (= e!727834 (isStrictlySorted!861 (t!42145 l!595)))))

(assert (= (and d!140327 (not res!847620)) b!1275140))

(assert (= (and b!1275140 res!847621) b!1275141))

(declare-fun m!1171537 () Bool)

(assert (=> b!1275141 m!1171537))

(assert (=> start!107888 d!140327))

(declare-fun b!1275151 () Bool)

(declare-fun e!727840 () Bool)

(declare-fun tp!98090 () Bool)

(assert (=> b!1275151 (= e!727840 (and tp_is_empty!33217 tp!98090))))

(assert (=> b!1275093 (= tp!98078 e!727840)))

(assert (= (and b!1275093 (is-Cons!28605 (t!42145 l!595))) b!1275151))

(push 1)

(assert (not b!1275141))

(assert (not b!1275129))

(assert (not b!1275151))

(assert tp_is_empty!33217)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

