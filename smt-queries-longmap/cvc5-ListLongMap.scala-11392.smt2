; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132506 () Bool)

(assert start!132506)

(declare-fun res!1063548 () Bool)

(declare-fun e!865244 () Bool)

(assert (=> start!132506 (=> (not res!1063548) (not e!865244))))

(declare-datatypes ((B!2228 0))(
  ( (B!2229 (val!19200 Int)) )
))
(declare-datatypes ((tuple2!24776 0))(
  ( (tuple2!24777 (_1!12399 (_ BitVec 64)) (_2!12399 B!2228)) )
))
(declare-datatypes ((List!36234 0))(
  ( (Nil!36231) (Cons!36230 (h!37676 tuple2!24776) (t!50955 List!36234)) )
))
(declare-datatypes ((ListLongMap!22385 0))(
  ( (ListLongMap!22386 (toList!11208 List!36234)) )
))
(declare-fun lm!249 () ListLongMap!22385)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10153 (ListLongMap!22385 (_ BitVec 64)) Bool)

(assert (=> start!132506 (= res!1063548 (contains!10153 lm!249 a0!49))))

(assert (=> start!132506 e!865244))

(declare-fun e!865243 () Bool)

(declare-fun inv!57327 (ListLongMap!22385) Bool)

(assert (=> start!132506 (and (inv!57327 lm!249) e!865243)))

(assert (=> start!132506 true))

(declare-fun b!1553970 () Bool)

(declare-fun res!1063549 () Bool)

(assert (=> b!1553970 (=> (not res!1063549) (not e!865244))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553970 (= res!1063549 (not (= a0!49 a!523)))))

(declare-fun b!1553971 () Bool)

(declare-fun containsKey!767 (List!36234 (_ BitVec 64)) Bool)

(assert (=> b!1553971 (= e!865244 (not (containsKey!767 (toList!11208 lm!249) a0!49)))))

(declare-fun b!1553972 () Bool)

(declare-fun tp!112146 () Bool)

(assert (=> b!1553972 (= e!865243 tp!112146)))

(assert (= (and start!132506 res!1063548) b!1553970))

(assert (= (and b!1553970 res!1063549) b!1553971))

(assert (= start!132506 b!1553972))

(declare-fun m!1432527 () Bool)

(assert (=> start!132506 m!1432527))

(declare-fun m!1432529 () Bool)

(assert (=> start!132506 m!1432529))

(declare-fun m!1432531 () Bool)

(assert (=> b!1553971 m!1432531))

(push 1)

(assert (not start!132506))

(assert (not b!1553971))

(assert (not b!1553972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161659 () Bool)

(declare-fun e!865277 () Bool)

(assert (=> d!161659 e!865277))

(declare-fun res!1063576 () Bool)

(assert (=> d!161659 (=> res!1063576 e!865277)))

(declare-fun lt!669904 () Bool)

(assert (=> d!161659 (= res!1063576 (not lt!669904))))

(declare-fun lt!669905 () Bool)

(assert (=> d!161659 (= lt!669904 lt!669905)))

(declare-datatypes ((Unit!51767 0))(
  ( (Unit!51768) )
))
(declare-fun lt!669906 () Unit!51767)

(declare-fun e!865278 () Unit!51767)

(assert (=> d!161659 (= lt!669906 e!865278)))

(declare-fun c!143340 () Bool)

(assert (=> d!161659 (= c!143340 lt!669905)))

(assert (=> d!161659 (= lt!669905 (containsKey!767 (toList!11208 lm!249) a0!49))))

(assert (=> d!161659 (= (contains!10153 lm!249 a0!49) lt!669904)))

(declare-fun b!1554017 () Bool)

(declare-fun lt!669903 () Unit!51767)

(assert (=> b!1554017 (= e!865278 lt!669903)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!510 (List!36234 (_ BitVec 64)) Unit!51767)

(assert (=> b!1554017 (= lt!669903 (lemmaContainsKeyImpliesGetValueByKeyDefined!510 (toList!11208 lm!249) a0!49))))

(declare-datatypes ((Option!822 0))(
  ( (Some!821 (v!22006 B!2228)) (None!820) )
))
(declare-fun isDefined!558 (Option!822) Bool)

(declare-fun getValueByKey!746 (List!36234 (_ BitVec 64)) Option!822)

(assert (=> b!1554017 (isDefined!558 (getValueByKey!746 (toList!11208 lm!249) a0!49))))

(declare-fun b!1554018 () Bool)

(declare-fun Unit!51772 () Unit!51767)

(assert (=> b!1554018 (= e!865278 Unit!51772)))

(declare-fun b!1554019 () Bool)

(assert (=> b!1554019 (= e!865277 (isDefined!558 (getValueByKey!746 (toList!11208 lm!249) a0!49)))))

(assert (= (and d!161659 c!143340) b!1554017))

(assert (= (and d!161659 (not c!143340)) b!1554018))

(assert (= (and d!161659 (not res!1063576)) b!1554019))

(assert (=> d!161659 m!1432531))

(declare-fun m!1432549 () Bool)

(assert (=> b!1554017 m!1432549))

(declare-fun m!1432551 () Bool)

(assert (=> b!1554017 m!1432551))

(assert (=> b!1554017 m!1432551))

(declare-fun m!1432553 () Bool)

(assert (=> b!1554017 m!1432553))

(assert (=> b!1554019 m!1432551))

(assert (=> b!1554019 m!1432551))

(assert (=> b!1554019 m!1432553))

(assert (=> start!132506 d!161659))

(declare-fun d!161665 () Bool)

(declare-fun isStrictlySorted!898 (List!36234) Bool)

(assert (=> d!161665 (= (inv!57327 lm!249) (isStrictlySorted!898 (toList!11208 lm!249)))))

(declare-fun bs!44669 () Bool)

(assert (= bs!44669 d!161665))

(declare-fun m!1432555 () Bool)

(assert (=> bs!44669 m!1432555))

(assert (=> start!132506 d!161665))

(declare-fun d!161667 () Bool)

(declare-fun res!1063587 () Bool)

(declare-fun e!865297 () Bool)

(assert (=> d!161667 (=> res!1063587 e!865297)))

(assert (=> d!161667 (= res!1063587 (and (is-Cons!36230 (toList!11208 lm!249)) (= (_1!12399 (h!37676 (toList!11208 lm!249))) a0!49)))))

(assert (=> d!161667 (= (containsKey!767 (toList!11208 lm!249) a0!49) e!865297)))

(declare-fun b!1554044 () Bool)

(declare-fun e!865298 () Bool)

(assert (=> b!1554044 (= e!865297 e!865298)))

(declare-fun res!1063588 () Bool)

(assert (=> b!1554044 (=> (not res!1063588) (not e!865298))))

(assert (=> b!1554044 (= res!1063588 (and (or (not (is-Cons!36230 (toList!11208 lm!249))) (bvsle (_1!12399 (h!37676 (toList!11208 lm!249))) a0!49)) (is-Cons!36230 (toList!11208 lm!249)) (bvslt (_1!12399 (h!37676 (toList!11208 lm!249))) a0!49)))))

