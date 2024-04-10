; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132430 () Bool)

(assert start!132430)

(declare-fun b!1553560 () Bool)

(declare-fun res!1063322 () Bool)

(declare-fun e!864976 () Bool)

(assert (=> b!1553560 (=> (not res!1063322) (not e!864976))))

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553560 (= res!1063322 (not (= a0!49 a!523)))))

(declare-fun b!1553561 () Bool)

(declare-fun res!1063324 () Bool)

(assert (=> b!1553561 (=> (not res!1063324) (not e!864976))))

(declare-datatypes ((B!2212 0))(
  ( (B!2213 (val!19192 Int)) )
))
(declare-datatypes ((tuple2!24760 0))(
  ( (tuple2!24761 (_1!12391 (_ BitVec 64)) (_2!12391 B!2212)) )
))
(declare-datatypes ((List!36226 0))(
  ( (Nil!36223) (Cons!36222 (h!37668 tuple2!24760) (t!50947 List!36226)) )
))
(declare-datatypes ((ListLongMap!22369 0))(
  ( (ListLongMap!22370 (toList!11200 List!36226)) )
))
(declare-fun lm!249 () ListLongMap!22369)

(declare-fun containsKey!759 (List!36226 (_ BitVec 64)) Bool)

(assert (=> b!1553561 (= res!1063324 (containsKey!759 (toList!11200 lm!249) a0!49))))

(declare-fun res!1063321 () Bool)

(assert (=> start!132430 (=> (not res!1063321) (not e!864976))))

(declare-fun contains!10142 (ListLongMap!22369 (_ BitVec 64)) Bool)

(assert (=> start!132430 (= res!1063321 (contains!10142 lm!249 a0!49))))

(assert (=> start!132430 e!864976))

(declare-fun e!864977 () Bool)

(declare-fun inv!57304 (ListLongMap!22369) Bool)

(assert (=> start!132430 (and (inv!57304 lm!249) e!864977)))

(assert (=> start!132430 true))

(declare-fun tp_is_empty!38223 () Bool)

(assert (=> start!132430 tp_is_empty!38223))

(declare-fun b!1553562 () Bool)

(declare-fun tp!112113 () Bool)

(assert (=> b!1553562 (= e!864977 tp!112113)))

(declare-fun b!1553563 () Bool)

(assert (=> b!1553563 (= e!864976 (not true))))

(declare-fun e!864975 () Bool)

(assert (=> b!1553563 e!864975))

(declare-fun res!1063323 () Bool)

(assert (=> b!1553563 (=> (not res!1063323) (not e!864975))))

(declare-fun lt!669707 () List!36226)

(assert (=> b!1553563 (= res!1063323 (containsKey!759 lt!669707 a0!49))))

(declare-fun b!96 () B!2212)

(declare-fun insertStrictlySorted!505 (List!36226 (_ BitVec 64) B!2212) List!36226)

(assert (=> b!1553563 (= lt!669707 (insertStrictlySorted!505 (toList!11200 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51745 0))(
  ( (Unit!51746) )
))
(declare-fun lt!669706 () Unit!51745)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!2 (List!36226 (_ BitVec 64) B!2212 (_ BitVec 64)) Unit!51745)

(assert (=> b!1553563 (= lt!669706 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!2 (toList!11200 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1553564 () Bool)

(declare-datatypes ((Option!813 0))(
  ( (Some!812 (v!21997 B!2212)) (None!811) )
))
(declare-fun getValueByKey!737 (List!36226 (_ BitVec 64)) Option!813)

(assert (=> b!1553564 (= e!864975 (= (getValueByKey!737 lt!669707 a0!49) (getValueByKey!737 (toList!11200 lm!249) a0!49)))))

(assert (= (and start!132430 res!1063321) b!1553560))

(assert (= (and b!1553560 res!1063322) b!1553561))

(assert (= (and b!1553561 res!1063324) b!1553563))

(assert (= (and b!1553563 res!1063323) b!1553564))

(assert (= start!132430 b!1553562))

(declare-fun m!1432201 () Bool)

(assert (=> b!1553561 m!1432201))

(declare-fun m!1432203 () Bool)

(assert (=> start!132430 m!1432203))

(declare-fun m!1432205 () Bool)

(assert (=> start!132430 m!1432205))

(declare-fun m!1432207 () Bool)

(assert (=> b!1553563 m!1432207))

(declare-fun m!1432209 () Bool)

(assert (=> b!1553563 m!1432209))

(declare-fun m!1432211 () Bool)

(assert (=> b!1553563 m!1432211))

(declare-fun m!1432213 () Bool)

(assert (=> b!1553564 m!1432213))

(declare-fun m!1432215 () Bool)

(assert (=> b!1553564 m!1432215))

(check-sat tp_is_empty!38223 (not b!1553561) (not start!132430) (not b!1553562) (not b!1553563) (not b!1553564))
(check-sat)
