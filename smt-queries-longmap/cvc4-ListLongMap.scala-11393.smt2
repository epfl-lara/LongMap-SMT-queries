; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132534 () Bool)

(assert start!132534)

(declare-fun b!1554091 () Bool)

(declare-fun e!865328 () Bool)

(declare-fun e!865326 () Bool)

(assert (=> b!1554091 (= e!865328 e!865326)))

(declare-fun res!1063622 () Bool)

(assert (=> b!1554091 (=> res!1063622 e!865326)))

(declare-datatypes ((B!2238 0))(
  ( (B!2239 (val!19205 Int)) )
))
(declare-datatypes ((tuple2!24786 0))(
  ( (tuple2!24787 (_1!12404 (_ BitVec 64)) (_2!12404 B!2238)) )
))
(declare-datatypes ((List!36239 0))(
  ( (Nil!36236) (Cons!36235 (h!37681 tuple2!24786) (t!50960 List!36239)) )
))
(declare-datatypes ((ListLongMap!22395 0))(
  ( (ListLongMap!22396 (toList!11213 List!36239)) )
))
(declare-fun lm!249 () ListLongMap!22395)

(declare-fun isStrictlySorted!901 (List!36239) Bool)

(assert (=> b!1554091 (= res!1063622 (not (isStrictlySorted!901 (toList!11213 lm!249))))))

(declare-fun res!1063621 () Bool)

(assert (=> start!132534 (=> (not res!1063621) (not e!865328))))

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10158 (ListLongMap!22395 (_ BitVec 64)) Bool)

(assert (=> start!132534 (= res!1063621 (contains!10158 lm!249 a0!49))))

(assert (=> start!132534 e!865328))

(declare-fun e!865327 () Bool)

(declare-fun inv!57337 (ListLongMap!22395) Bool)

(assert (=> start!132534 (and (inv!57337 lm!249) e!865327)))

(assert (=> start!132534 true))

(declare-fun b!1554092 () Bool)

(declare-fun tp!112170 () Bool)

(assert (=> b!1554092 (= e!865327 tp!112170)))

(declare-fun b!1554093 () Bool)

(declare-fun res!1063624 () Bool)

(assert (=> b!1554093 (=> (not res!1063624) (not e!865328))))

(declare-fun containsKey!772 (List!36239 (_ BitVec 64)) Bool)

(assert (=> b!1554093 (= res!1063624 (containsKey!772 (toList!11213 lm!249) a0!49))))

(declare-fun b!1554094 () Bool)

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1554094 (= e!865326 (= a!523 a0!49))))

(declare-fun b!1554095 () Bool)

(declare-fun res!1063623 () Bool)

(assert (=> b!1554095 (=> (not res!1063623) (not e!865328))))

(assert (=> b!1554095 (= res!1063623 (not (= a0!49 a!523)))))

(assert (= (and start!132534 res!1063621) b!1554095))

(assert (= (and b!1554095 res!1063623) b!1554093))

(assert (= (and b!1554093 res!1063624) b!1554091))

(assert (= (and b!1554091 (not res!1063622)) b!1554094))

(assert (= start!132534 b!1554092))

(declare-fun m!1432591 () Bool)

(assert (=> b!1554091 m!1432591))

(declare-fun m!1432593 () Bool)

(assert (=> start!132534 m!1432593))

(declare-fun m!1432595 () Bool)

(assert (=> start!132534 m!1432595))

(declare-fun m!1432597 () Bool)

(assert (=> b!1554093 m!1432597))

(push 1)

(assert (not b!1554091))

(assert (not b!1554093))

(assert (not start!132534))

(assert (not b!1554092))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161675 () Bool)

(declare-fun res!1063633 () Bool)

(declare-fun e!865337 () Bool)

(assert (=> d!161675 (=> res!1063633 e!865337)))

(assert (=> d!161675 (= res!1063633 (or (is-Nil!36236 (toList!11213 lm!249)) (is-Nil!36236 (t!50960 (toList!11213 lm!249)))))))

(assert (=> d!161675 (= (isStrictlySorted!901 (toList!11213 lm!249)) e!865337)))

(declare-fun b!1554104 () Bool)

(declare-fun e!865338 () Bool)

(assert (=> b!1554104 (= e!865337 e!865338)))

(declare-fun res!1063634 () Bool)

(assert (=> b!1554104 (=> (not res!1063634) (not e!865338))))

(assert (=> b!1554104 (= res!1063634 (bvslt (_1!12404 (h!37681 (toList!11213 lm!249))) (_1!12404 (h!37681 (t!50960 (toList!11213 lm!249))))))))

(declare-fun b!1554105 () Bool)

(assert (=> b!1554105 (= e!865338 (isStrictlySorted!901 (t!50960 (toList!11213 lm!249))))))

(assert (= (and d!161675 (not res!1063633)) b!1554104))

(assert (= (and b!1554104 res!1063634) b!1554105))

(declare-fun m!1432599 () Bool)

(assert (=> b!1554105 m!1432599))

(assert (=> b!1554091 d!161675))

(declare-fun d!161681 () Bool)

(declare-fun res!1063647 () Bool)

(declare-fun e!865351 () Bool)

(assert (=> d!161681 (=> res!1063647 e!865351)))

(assert (=> d!161681 (= res!1063647 (and (is-Cons!36235 (toList!11213 lm!249)) (= (_1!12404 (h!37681 (toList!11213 lm!249))) a0!49)))))

(assert (=> d!161681 (= (containsKey!772 (toList!11213 lm!249) a0!49) e!865351)))

(declare-fun b!1554118 () Bool)

(declare-fun e!865352 () Bool)

(assert (=> b!1554118 (= e!865351 e!865352)))

(declare-fun res!1063648 () Bool)

(assert (=> b!1554118 (=> (not res!1063648) (not e!865352))))

(assert (=> b!1554118 (= res!1063648 (and (or (not (is-Cons!36235 (toList!11213 lm!249))) (bvsle (_1!12404 (h!37681 (toList!11213 lm!249))) a0!49)) (is-Cons!36235 (toList!11213 lm!249)) (bvslt (_1!12404 (h!37681 (toList!11213 lm!249))) a0!49)))))

(declare-fun b!1554119 () Bool)

(assert (=> b!1554119 (= e!865352 (containsKey!772 (t!50960 (toList!11213 lm!249)) a0!49))))

(assert (= (and d!161681 (not res!1063647)) b!1554118))

(assert (= (and b!1554118 res!1063648) b!1554119))

(declare-fun m!1432605 () Bool)

(assert (=> b!1554119 m!1432605))

(assert (=> b!1554093 d!161681))

(declare-fun d!161687 () Bool)

(declare-fun e!865371 () Bool)

(assert (=> d!161687 e!865371))

(declare-fun res!1063659 () Bool)

(assert (=> d!161687 (=> res!1063659 e!865371)))

(declare-fun lt!669949 () Bool)

(assert (=> d!161687 (= res!1063659 (not lt!669949))))

(declare-fun lt!669948 () Bool)

(assert (=> d!161687 (= lt!669949 lt!669948)))

(declare-datatypes ((Unit!51782 0))(
  ( (Unit!51783) )
))
(declare-fun lt!669950 () Unit!51782)

(declare-fun e!865372 () Unit!51782)

(assert (=> d!161687 (= lt!669950 e!865372)))

(declare-fun c!143351 () Bool)

(assert (=> d!161687 (= c!143351 lt!669948)))

(assert (=> d!161687 (= lt!669948 (containsKey!772 (toList!11213 lm!249) a0!49))))

(assert (=> d!161687 (= (contains!10158 lm!249 a0!49) lt!669949)))

(declare-fun b!1554146 () Bool)

(declare-fun lt!669947 () Unit!51782)

(assert (=> b!1554146 (= e!865372 lt!669947)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!515 (List!36239 (_ BitVec 64)) Unit!51782)

(assert (=> b!1554146 (= lt!669947 (lemmaContainsKeyImpliesGetValueByKeyDefined!515 (toList!11213 lm!249) a0!49))))

(declare-datatypes ((Option!826 0))(
  ( (Some!825 (v!22010 B!2238)) (None!824) )
))
(declare-fun isDefined!563 (Option!826) Bool)

(declare-fun getValueByKey!750 (List!36239 (_ BitVec 64)) Option!826)

(assert (=> b!1554146 (isDefined!563 (getValueByKey!750 (toList!11213 lm!249) a0!49))))

(declare-fun b!1554147 () Bool)

(declare-fun Unit!51784 () Unit!51782)

(assert (=> b!1554147 (= e!865372 Unit!51784)))

(declare-fun b!1554148 () Bool)

(assert (=> b!1554148 (= e!865371 (isDefined!563 (getValueByKey!750 (toList!11213 lm!249) a0!49)))))

(assert (= (and d!161687 c!143351) b!1554146))

(assert (= (and d!161687 (not c!143351)) b!1554147))

(assert (= (and d!161687 (not res!1063659)) b!1554148))

(assert (=> d!161687 m!1432597))

(declare-fun m!1432619 () Bool)

(assert (=> b!1554146 m!1432619))

(declare-fun m!1432621 () Bool)

(assert (=> b!1554146 m!1432621))

(assert (=> b!1554146 m!1432621))

(declare-fun m!1432623 () Bool)

(assert (=> b!1554146 m!1432623))

(assert (=> b!1554148 m!1432621))

(assert (=> b!1554148 m!1432621))

(assert (=> b!1554148 m!1432623))

(assert (=> start!132534 d!161687))

(declare-fun d!161697 () Bool)

(assert (=> d!161697 (= (inv!57337 lm!249) (isStrictlySorted!901 (toList!11213 lm!249)))))

(declare-fun bs!44677 () Bool)

