; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132510 () Bool)

(assert start!132510)

(declare-fun res!1063561 () Bool)

(declare-fun e!865255 () Bool)

(assert (=> start!132510 (=> (not res!1063561) (not e!865255))))

(declare-datatypes ((B!2232 0))(
  ( (B!2233 (val!19202 Int)) )
))
(declare-datatypes ((tuple2!24780 0))(
  ( (tuple2!24781 (_1!12401 (_ BitVec 64)) (_2!12401 B!2232)) )
))
(declare-datatypes ((List!36236 0))(
  ( (Nil!36233) (Cons!36232 (h!37678 tuple2!24780) (t!50957 List!36236)) )
))
(declare-datatypes ((ListLongMap!22389 0))(
  ( (ListLongMap!22390 (toList!11210 List!36236)) )
))
(declare-fun lm!249 () ListLongMap!22389)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10155 (ListLongMap!22389 (_ BitVec 64)) Bool)

(assert (=> start!132510 (= res!1063561 (contains!10155 lm!249 a0!49))))

(assert (=> start!132510 e!865255))

(declare-fun e!865256 () Bool)

(declare-fun inv!57329 (ListLongMap!22389) Bool)

(assert (=> start!132510 (and (inv!57329 lm!249) e!865256)))

(assert (=> start!132510 true))

(declare-fun b!1553988 () Bool)

(declare-fun res!1063560 () Bool)

(assert (=> b!1553988 (=> (not res!1063560) (not e!865255))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553988 (= res!1063560 (not (= a0!49 a!523)))))

(declare-fun b!1553989 () Bool)

(declare-fun containsKey!769 (List!36236 (_ BitVec 64)) Bool)

(assert (=> b!1553989 (= e!865255 (not (containsKey!769 (toList!11210 lm!249) a0!49)))))

(declare-fun b!1553990 () Bool)

(declare-fun tp!112152 () Bool)

(assert (=> b!1553990 (= e!865256 tp!112152)))

(assert (= (and start!132510 res!1063561) b!1553988))

(assert (= (and b!1553988 res!1063560) b!1553989))

(assert (= start!132510 b!1553990))

(declare-fun m!1432539 () Bool)

(assert (=> start!132510 m!1432539))

(declare-fun m!1432541 () Bool)

(assert (=> start!132510 m!1432541))

(declare-fun m!1432543 () Bool)

(assert (=> b!1553989 m!1432543))

(push 1)

(assert (not b!1553989))

(assert (not start!132510))

(assert (not b!1553990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161655 () Bool)

(declare-fun res!1063570 () Bool)

(declare-fun e!865265 () Bool)

(assert (=> d!161655 (=> res!1063570 e!865265)))

(assert (=> d!161655 (= res!1063570 (and (is-Cons!36232 (toList!11210 lm!249)) (= (_1!12401 (h!37678 (toList!11210 lm!249))) a0!49)))))

(assert (=> d!161655 (= (containsKey!769 (toList!11210 lm!249) a0!49) e!865265)))

(declare-fun b!1553999 () Bool)

(declare-fun e!865266 () Bool)

(assert (=> b!1553999 (= e!865265 e!865266)))

(declare-fun res!1063571 () Bool)

(assert (=> b!1553999 (=> (not res!1063571) (not e!865266))))

(assert (=> b!1553999 (= res!1063571 (and (or (not (is-Cons!36232 (toList!11210 lm!249))) (bvsle (_1!12401 (h!37678 (toList!11210 lm!249))) a0!49)) (is-Cons!36232 (toList!11210 lm!249)) (bvslt (_1!12401 (h!37678 (toList!11210 lm!249))) a0!49)))))

(declare-fun b!1554000 () Bool)

(assert (=> b!1554000 (= e!865266 (containsKey!769 (t!50957 (toList!11210 lm!249)) a0!49))))

(assert (= (and d!161655 (not res!1063570)) b!1553999))

(assert (= (and b!1553999 res!1063571) b!1554000))

(declare-fun m!1432545 () Bool)

(assert (=> b!1554000 m!1432545))

(assert (=> b!1553989 d!161655))

(declare-fun d!161661 () Bool)

(declare-fun e!865283 () Bool)

(assert (=> d!161661 e!865283))

(declare-fun res!1063582 () Bool)

(assert (=> d!161661 (=> res!1063582 e!865283)))

(declare-fun lt!669908 () Bool)

(assert (=> d!161661 (= res!1063582 (not lt!669908))))

(declare-fun lt!669912 () Bool)

(assert (=> d!161661 (= lt!669908 lt!669912)))

(declare-datatypes ((Unit!51773 0))(
  ( (Unit!51774) )
))
(declare-fun lt!669907 () Unit!51773)

(declare-fun e!865284 () Unit!51773)

(assert (=> d!161661 (= lt!669907 e!865284)))

(declare-fun c!143342 () Bool)

(assert (=> d!161661 (= c!143342 lt!669912)))

(assert (=> d!161661 (= lt!669912 (containsKey!769 (toList!11210 lm!249) a0!49))))

(assert (=> d!161661 (= (contains!10155 lm!249 a0!49) lt!669908)))

(declare-fun b!1554024 () Bool)

(declare-fun lt!669910 () Unit!51773)

(assert (=> b!1554024 (= e!865284 lt!669910)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!512 (List!36236 (_ BitVec 64)) Unit!51773)

(assert (=> b!1554024 (= lt!669910 (lemmaContainsKeyImpliesGetValueByKeyDefined!512 (toList!11210 lm!249) a0!49))))

(declare-datatypes ((Option!823 0))(
  ( (Some!822 (v!22007 B!2232)) (None!821) )
))
(declare-fun isDefined!560 (Option!823) Bool)

(declare-fun getValueByKey!747 (List!36236 (_ BitVec 64)) Option!823)

(assert (=> b!1554024 (isDefined!560 (getValueByKey!747 (toList!11210 lm!249) a0!49))))

(declare-fun b!1554026 () Bool)

(declare-fun Unit!51775 () Unit!51773)

(assert (=> b!1554026 (= e!865284 Unit!51775)))

(declare-fun b!1554028 () Bool)

(assert (=> b!1554028 (= e!865283 (isDefined!560 (getValueByKey!747 (toList!11210 lm!249) a0!49)))))

