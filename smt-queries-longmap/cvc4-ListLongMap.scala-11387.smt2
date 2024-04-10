; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132402 () Bool)

(assert start!132402)

(declare-fun res!1063264 () Bool)

(declare-fun e!864895 () Bool)

(assert (=> start!132402 (=> (not res!1063264) (not e!864895))))

(declare-datatypes ((B!2202 0))(
  ( (B!2203 (val!19187 Int)) )
))
(declare-datatypes ((tuple2!24750 0))(
  ( (tuple2!24751 (_1!12386 (_ BitVec 64)) (_2!12386 B!2202)) )
))
(declare-datatypes ((List!36221 0))(
  ( (Nil!36218) (Cons!36217 (h!37663 tuple2!24750) (t!50942 List!36221)) )
))
(declare-datatypes ((ListLongMap!22359 0))(
  ( (ListLongMap!22360 (toList!11195 List!36221)) )
))
(declare-fun lm!249 () ListLongMap!22359)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10137 (ListLongMap!22359 (_ BitVec 64)) Bool)

(assert (=> start!132402 (= res!1063264 (contains!10137 lm!249 a0!49))))

(assert (=> start!132402 e!864895))

(declare-fun e!864896 () Bool)

(declare-fun inv!57289 (ListLongMap!22359) Bool)

(assert (=> start!132402 (and (inv!57289 lm!249) e!864896)))

(assert (=> start!132402 true))

(declare-fun b!1553454 () Bool)

(declare-fun res!1063263 () Bool)

(assert (=> b!1553454 (=> (not res!1063263) (not e!864895))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553454 (= res!1063263 (not (= a0!49 a!523)))))

(declare-fun b!1553455 () Bool)

(declare-fun isStrictlySorted!890 (List!36221) Bool)

(assert (=> b!1553455 (= e!864895 (not (isStrictlySorted!890 (toList!11195 lm!249))))))

(declare-fun b!1553456 () Bool)

(declare-fun tp!112089 () Bool)

(assert (=> b!1553456 (= e!864896 tp!112089)))

(assert (= (and start!132402 res!1063264) b!1553454))

(assert (= (and b!1553454 res!1063263) b!1553455))

(assert (= start!132402 b!1553456))

(declare-fun m!1432137 () Bool)

(assert (=> start!132402 m!1432137))

(declare-fun m!1432139 () Bool)

(assert (=> start!132402 m!1432139))

(declare-fun m!1432141 () Bool)

(assert (=> b!1553455 m!1432141))

(push 1)

(assert (not start!132402))

(assert (not b!1553455))

(assert (not b!1553456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161549 () Bool)

(declare-fun e!864911 () Bool)

(assert (=> d!161549 e!864911))

(declare-fun res!1063275 () Bool)

(assert (=> d!161549 (=> res!1063275 e!864911)))

(declare-fun lt!669678 () Bool)

(assert (=> d!161549 (= res!1063275 (not lt!669678))))

(declare-fun lt!669676 () Bool)

(assert (=> d!161549 (= lt!669678 lt!669676)))

(declare-datatypes ((Unit!51734 0))(
  ( (Unit!51735) )
))
(declare-fun lt!669677 () Unit!51734)

(declare-fun e!864912 () Unit!51734)

(assert (=> d!161549 (= lt!669677 e!864912)))

(declare-fun c!143257 () Bool)

(assert (=> d!161549 (= c!143257 lt!669676)))

(declare-fun containsKey!755 (List!36221 (_ BitVec 64)) Bool)

(assert (=> d!161549 (= lt!669676 (containsKey!755 (toList!11195 lm!249) a0!49))))

(assert (=> d!161549 (= (contains!10137 lm!249 a0!49) lt!669678)))

(declare-fun b!1553475 () Bool)

(declare-fun lt!669679 () Unit!51734)

(assert (=> b!1553475 (= e!864912 lt!669679)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!501 (List!36221 (_ BitVec 64)) Unit!51734)

(assert (=> b!1553475 (= lt!669679 (lemmaContainsKeyImpliesGetValueByKeyDefined!501 (toList!11195 lm!249) a0!49))))

(declare-datatypes ((Option!809 0))(
  ( (Some!808 (v!21993 B!2202)) (None!807) )
))
(declare-fun isDefined!549 (Option!809) Bool)

(declare-fun getValueByKey!733 (List!36221 (_ BitVec 64)) Option!809)

(assert (=> b!1553475 (isDefined!549 (getValueByKey!733 (toList!11195 lm!249) a0!49))))

(declare-fun b!1553476 () Bool)

(declare-fun Unit!51740 () Unit!51734)

(assert (=> b!1553476 (= e!864912 Unit!51740)))

(declare-fun b!1553477 () Bool)

(assert (=> b!1553477 (= e!864911 (isDefined!549 (getValueByKey!733 (toList!11195 lm!249) a0!49)))))

(assert (= (and d!161549 c!143257) b!1553475))

(assert (= (and d!161549 (not c!143257)) b!1553476))

(assert (= (and d!161549 (not res!1063275)) b!1553477))

(declare-fun m!1432145 () Bool)

(assert (=> d!161549 m!1432145))

(declare-fun m!1432147 () Bool)

(assert (=> b!1553475 m!1432147))

(declare-fun m!1432149 () Bool)

(assert (=> b!1553475 m!1432149))

(assert (=> b!1553475 m!1432149))

(declare-fun m!1432151 () Bool)

(assert (=> b!1553475 m!1432151))

(assert (=> b!1553477 m!1432149))

(assert (=> b!1553477 m!1432149))

(assert (=> b!1553477 m!1432151))

(assert (=> start!132402 d!161549))

(declare-fun d!161557 () Bool)

(assert (=> d!161557 (= (inv!57289 lm!249) (isStrictlySorted!890 (toList!11195 lm!249)))))

(declare-fun bs!44645 () Bool)

(assert (= bs!44645 d!161557))

(assert (=> bs!44645 m!1432141))

(assert (=> start!132402 d!161557))

(declare-fun d!161559 () Bool)

(declare-fun res!1063284 () Bool)

(declare-fun e!864925 () Bool)

(assert (=> d!161559 (=> res!1063284 e!864925)))

(assert (=> d!161559 (= res!1063284 (or (is-Nil!36218 (toList!11195 lm!249)) (is-Nil!36218 (t!50942 (toList!11195 lm!249)))))))

(assert (=> d!161559 (= (isStrictlySorted!890 (toList!11195 lm!249)) e!864925)))

(declare-fun b!1553494 () Bool)

(declare-fun e!864926 () Bool)

(assert (=> b!1553494 (= e!864925 e!864926)))

(declare-fun res!1063285 () Bool)

(assert (=> b!1553494 (=> (not res!1063285) (not e!864926))))

(assert (=> b!1553494 (= res!1063285 (bvslt (_1!12386 (h!37663 (toList!11195 lm!249))) (_1!12386 (h!37663 (t!50942 (toList!11195 lm!249))))))))

(declare-fun b!1553495 () Bool)

(assert (=> b!1553495 (= e!864926 (isStrictlySorted!890 (t!50942 (toList!11195 lm!249))))))

(assert (= (and d!161559 (not res!1063284)) b!1553494))

