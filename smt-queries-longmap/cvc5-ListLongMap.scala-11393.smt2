; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132530 () Bool)

(assert start!132530)

(declare-fun b!1554061 () Bool)

(declare-fun res!1063598 () Bool)

(declare-fun e!865309 () Bool)

(assert (=> b!1554061 (=> (not res!1063598) (not e!865309))))

(declare-datatypes ((B!2234 0))(
  ( (B!2235 (val!19203 Int)) )
))
(declare-datatypes ((tuple2!24782 0))(
  ( (tuple2!24783 (_1!12402 (_ BitVec 64)) (_2!12402 B!2234)) )
))
(declare-datatypes ((List!36237 0))(
  ( (Nil!36234) (Cons!36233 (h!37679 tuple2!24782) (t!50958 List!36237)) )
))
(declare-datatypes ((ListLongMap!22391 0))(
  ( (ListLongMap!22392 (toList!11211 List!36237)) )
))
(declare-fun lm!249 () ListLongMap!22391)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!770 (List!36237 (_ BitVec 64)) Bool)

(assert (=> b!1554061 (= res!1063598 (containsKey!770 (toList!11211 lm!249) a0!49))))

(declare-fun b!1554062 () Bool)

(declare-fun res!1063599 () Bool)

(assert (=> b!1554062 (=> (not res!1063599) (not e!865309))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1554062 (= res!1063599 (not (= a0!49 a!523)))))

(declare-fun res!1063600 () Bool)

(assert (=> start!132530 (=> (not res!1063600) (not e!865309))))

(declare-fun contains!10156 (ListLongMap!22391 (_ BitVec 64)) Bool)

(assert (=> start!132530 (= res!1063600 (contains!10156 lm!249 a0!49))))

(assert (=> start!132530 e!865309))

(declare-fun e!865310 () Bool)

(declare-fun inv!57335 (ListLongMap!22391) Bool)

(assert (=> start!132530 (and (inv!57335 lm!249) e!865310)))

(assert (=> start!132530 true))

(declare-fun b!1554063 () Bool)

(declare-fun e!865308 () Bool)

(assert (=> b!1554063 (= e!865309 e!865308)))

(declare-fun res!1063597 () Bool)

(assert (=> b!1554063 (=> res!1063597 e!865308)))

(declare-fun isStrictlySorted!899 (List!36237) Bool)

(assert (=> b!1554063 (= res!1063597 (not (isStrictlySorted!899 (toList!11211 lm!249))))))

(declare-fun b!1554064 () Bool)

(assert (=> b!1554064 (= e!865308 (= a!523 a0!49))))

(declare-fun b!1554065 () Bool)

(declare-fun tp!112164 () Bool)

(assert (=> b!1554065 (= e!865310 tp!112164)))

(assert (= (and start!132530 res!1063600) b!1554062))

(assert (= (and b!1554062 res!1063599) b!1554061))

(assert (= (and b!1554061 res!1063598) b!1554063))

(assert (= (and b!1554063 (not res!1063597)) b!1554064))

(assert (= start!132530 b!1554065))

(declare-fun m!1432575 () Bool)

(assert (=> b!1554061 m!1432575))

(declare-fun m!1432577 () Bool)

(assert (=> start!132530 m!1432577))

(declare-fun m!1432579 () Bool)

(assert (=> start!132530 m!1432579))

(declare-fun m!1432581 () Bool)

(assert (=> b!1554063 m!1432581))

(push 1)

(assert (not b!1554063))

(assert (not start!132530))

(assert (not b!1554061))

(assert (not b!1554065))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161679 () Bool)

(declare-fun res!1063641 () Bool)

(declare-fun e!865345 () Bool)

(assert (=> d!161679 (=> res!1063641 e!865345)))

(assert (=> d!161679 (= res!1063641 (or (is-Nil!36234 (toList!11211 lm!249)) (is-Nil!36234 (t!50958 (toList!11211 lm!249)))))))

(assert (=> d!161679 (= (isStrictlySorted!899 (toList!11211 lm!249)) e!865345)))

(declare-fun b!1554112 () Bool)

(declare-fun e!865346 () Bool)

(assert (=> b!1554112 (= e!865345 e!865346)))

(declare-fun res!1063642 () Bool)

(assert (=> b!1554112 (=> (not res!1063642) (not e!865346))))

(assert (=> b!1554112 (= res!1063642 (bvslt (_1!12402 (h!37679 (toList!11211 lm!249))) (_1!12402 (h!37679 (t!50958 (toList!11211 lm!249))))))))

(declare-fun b!1554113 () Bool)

(assert (=> b!1554113 (= e!865346 (isStrictlySorted!899 (t!50958 (toList!11211 lm!249))))))

(assert (= (and d!161679 (not res!1063641)) b!1554112))

(assert (= (and b!1554112 res!1063642) b!1554113))

(declare-fun m!1432603 () Bool)

(assert (=> b!1554113 m!1432603))

(assert (=> b!1554063 d!161679))

(declare-fun d!161685 () Bool)

(declare-fun e!865368 () Bool)

(assert (=> d!161685 e!865368))

(declare-fun res!1063656 () Bool)

(assert (=> d!161685 (=> res!1063656 e!865368)))

(declare-fun lt!669945 () Bool)

(assert (=> d!161685 (= res!1063656 (not lt!669945))))

(declare-fun lt!669944 () Bool)

(assert (=> d!161685 (= lt!669945 lt!669944)))

(declare-datatypes ((Unit!51778 0))(
  ( (Unit!51779) )
))
(declare-fun lt!669946 () Unit!51778)

(declare-fun e!865367 () Unit!51778)

(assert (=> d!161685 (= lt!669946 e!865367)))

(declare-fun c!143350 () Bool)

(assert (=> d!161685 (= c!143350 lt!669944)))

(assert (=> d!161685 (= lt!669944 (containsKey!770 (toList!11211 lm!249) a0!49))))

(assert (=> d!161685 (= (contains!10156 lm!249 a0!49) lt!669945)))

(declare-fun b!1554141 () Bool)

(declare-fun lt!669943 () Unit!51778)

(assert (=> b!1554141 (= e!865367 lt!669943)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!514 (List!36237 (_ BitVec 64)) Unit!51778)

(assert (=> b!1554141 (= lt!669943 (lemmaContainsKeyImpliesGetValueByKeyDefined!514 (toList!11211 lm!249) a0!49))))

(declare-datatypes ((Option!825 0))(
  ( (Some!824 (v!22009 B!2234)) (None!823) )
))
(declare-fun isDefined!562 (Option!825) Bool)

(declare-fun getValueByKey!749 (List!36237 (_ BitVec 64)) Option!825)

(assert (=> b!1554141 (isDefined!562 (getValueByKey!749 (toList!11211 lm!249) a0!49))))

(declare-fun b!1554142 () Bool)

(declare-fun Unit!51781 () Unit!51778)

(assert (=> b!1554142 (= e!865367 Unit!51781)))

(declare-fun b!1554143 () Bool)

(assert (=> b!1554143 (= e!865368 (isDefined!562 (getValueByKey!749 (toList!11211 lm!249) a0!49)))))

(assert (= (and d!161685 c!143350) b!1554141))

(assert (= (and d!161685 (not c!143350)) b!1554142))

(assert (= (and d!161685 (not res!1063656)) b!1554143))

(assert (=> d!161685 m!1432575))

(declare-fun m!1432613 () Bool)

(assert (=> b!1554141 m!1432613))

(declare-fun m!1432615 () Bool)

(assert (=> b!1554141 m!1432615))

(assert (=> b!1554141 m!1432615))

(declare-fun m!1432617 () Bool)

(assert (=> b!1554141 m!1432617))

(assert (=> b!1554143 m!1432615))

(assert (=> b!1554143 m!1432615))

(assert (=> b!1554143 m!1432617))

(assert (=> start!132530 d!161685))

(declare-fun d!161693 () Bool)

(assert (=> d!161693 (= (inv!57335 lm!249) (isStrictlySorted!899 (toList!11211 lm!249)))))

(declare-fun bs!44676 () Bool)

(assert (= bs!44676 d!161693))

(assert (=> bs!44676 m!1432581))

(assert (=> start!132530 d!161693))

(declare-fun d!161695 () Bool)

(declare-fun res!1063668 () Bool)

(declare-fun e!865387 () Bool)

(assert (=> d!161695 (=> res!1063668 e!865387)))

(assert (=> d!161695 (= res!1063668 (and (is-Cons!36233 (toList!11211 lm!249)) (= (_1!12402 (h!37679 (toList!11211 lm!249))) a0!49)))))

(assert (=> d!161695 (= (containsKey!770 (toList!11211 lm!249) a0!49) e!865387)))

(declare-fun b!1554167 () Bool)

(declare-fun e!865388 () Bool)

(assert (=> b!1554167 (= e!865387 e!865388)))

(declare-fun res!1063669 () Bool)

(assert (=> b!1554167 (=> (not res!1063669) (not e!865388))))

(assert (=> b!1554167 (= res!1063669 (and (or (not (is-Cons!36233 (toList!11211 lm!249))) (bvsle (_1!12402 (h!37679 (toList!11211 lm!249))) a0!49)) (is-Cons!36233 (toList!11211 lm!249)) (bvslt (_1!12402 (h!37679 (toList!11211 lm!249))) a0!49)))))

(declare-fun b!1554168 () Bool)

(assert (=> b!1554168 (= e!865388 (containsKey!770 (t!50958 (toList!11211 lm!249)) a0!49))))

(assert (= (and d!161695 (not res!1063668)) b!1554167))

(assert (= (and b!1554167 res!1063669) b!1554168))

(declare-fun m!1432627 () Bool)

(assert (=> b!1554168 m!1432627))

(assert (=> b!1554061 d!161695))

(declare-fun b!1554173 () Bool)

(declare-fun e!865391 () Bool)

(declare-fun tp_is_empty!38249 () Bool)

(declare-fun tp!112179 () Bool)

(assert (=> b!1554173 (= e!865391 (and tp_is_empty!38249 tp!112179))))

(assert (=> b!1554065 (= tp!112164 e!865391)))

(assert (= (and b!1554065 (is-Cons!36233 (toList!11211 lm!249))) b!1554173))

(push 1)

