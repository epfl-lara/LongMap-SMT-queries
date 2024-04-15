; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132456 () Bool)

(assert start!132456)

(declare-fun res!1063420 () Bool)

(declare-fun e!865046 () Bool)

(assert (=> start!132456 (=> (not res!1063420) (not e!865046))))

(declare-datatypes ((B!2228 0))(
  ( (B!2229 (val!19200 Int)) )
))
(declare-datatypes ((tuple2!24848 0))(
  ( (tuple2!24849 (_1!12435 (_ BitVec 64)) (_2!12435 B!2228)) )
))
(declare-datatypes ((List!36279 0))(
  ( (Nil!36276) (Cons!36275 (h!37722 tuple2!24848) (t!50992 List!36279)) )
))
(declare-datatypes ((ListLongMap!22457 0))(
  ( (ListLongMap!22458 (toList!11244 List!36279)) )
))
(declare-fun lm!249 () ListLongMap!22457)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10110 (ListLongMap!22457 (_ BitVec 64)) Bool)

(assert (=> start!132456 (= res!1063420 (contains!10110 lm!249 a0!49))))

(assert (=> start!132456 e!865046))

(declare-fun e!865045 () Bool)

(declare-fun inv!57327 (ListLongMap!22457) Bool)

(assert (=> start!132456 (and (inv!57327 lm!249) e!865045)))

(assert (=> start!132456 true))

(declare-fun b!1553657 () Bool)

(declare-fun res!1063419 () Bool)

(assert (=> b!1553657 (=> (not res!1063419) (not e!865046))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553657 (= res!1063419 (not (= a0!49 a!523)))))

(declare-fun b!1553658 () Bool)

(declare-fun containsKey!765 (List!36279 (_ BitVec 64)) Bool)

(assert (=> b!1553658 (= e!865046 (not (containsKey!765 (toList!11244 lm!249) a0!49)))))

(declare-fun b!1553659 () Bool)

(declare-fun tp!112147 () Bool)

(assert (=> b!1553659 (= e!865045 tp!112147)))

(assert (= (and start!132456 res!1063420) b!1553657))

(assert (= (and b!1553657 res!1063419) b!1553658))

(assert (= start!132456 b!1553659))

(declare-fun m!1431635 () Bool)

(assert (=> start!132456 m!1431635))

(declare-fun m!1431637 () Bool)

(assert (=> start!132456 m!1431637))

(declare-fun m!1431639 () Bool)

(assert (=> b!1553658 m!1431639))

(check-sat (not start!132456) (not b!1553658) (not b!1553659))
(check-sat)
(get-model)

(declare-fun d!161402 () Bool)

(declare-fun e!865076 () Bool)

(assert (=> d!161402 e!865076))

(declare-fun res!1063444 () Bool)

(assert (=> d!161402 (=> res!1063444 e!865076)))

(declare-fun lt!669615 () Bool)

(assert (=> d!161402 (= res!1063444 (not lt!669615))))

(declare-fun lt!669613 () Bool)

(assert (=> d!161402 (= lt!669615 lt!669613)))

(declare-datatypes ((Unit!51584 0))(
  ( (Unit!51585) )
))
(declare-fun lt!669614 () Unit!51584)

(declare-fun e!865075 () Unit!51584)

(assert (=> d!161402 (= lt!669614 e!865075)))

(declare-fun c!143250 () Bool)

(assert (=> d!161402 (= c!143250 lt!669613)))

(assert (=> d!161402 (= lt!669613 (containsKey!765 (toList!11244 lm!249) a0!49))))

(assert (=> d!161402 (= (contains!10110 lm!249 a0!49) lt!669615)))

(declare-fun b!1553699 () Bool)

(declare-fun lt!669616 () Unit!51584)

(assert (=> b!1553699 (= e!865075 lt!669616)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!509 (List!36279 (_ BitVec 64)) Unit!51584)

(assert (=> b!1553699 (= lt!669616 (lemmaContainsKeyImpliesGetValueByKeyDefined!509 (toList!11244 lm!249) a0!49))))

(declare-datatypes ((Option!823 0))(
  ( (Some!822 (v!22001 B!2228)) (None!821) )
))
(declare-fun isDefined!561 (Option!823) Bool)

(declare-fun getValueByKey!748 (List!36279 (_ BitVec 64)) Option!823)

(assert (=> b!1553699 (isDefined!561 (getValueByKey!748 (toList!11244 lm!249) a0!49))))

(declare-fun b!1553700 () Bool)

(declare-fun Unit!51588 () Unit!51584)

(assert (=> b!1553700 (= e!865075 Unit!51588)))

(declare-fun b!1553701 () Bool)

(assert (=> b!1553701 (= e!865076 (isDefined!561 (getValueByKey!748 (toList!11244 lm!249) a0!49)))))

(assert (= (and d!161402 c!143250) b!1553699))

(assert (= (and d!161402 (not c!143250)) b!1553700))

(assert (= (and d!161402 (not res!1063444)) b!1553701))

(assert (=> d!161402 m!1431639))

(declare-fun m!1431657 () Bool)

(assert (=> b!1553699 m!1431657))

(declare-fun m!1431661 () Bool)

(assert (=> b!1553699 m!1431661))

(assert (=> b!1553699 m!1431661))

(declare-fun m!1431665 () Bool)

(assert (=> b!1553699 m!1431665))

(assert (=> b!1553701 m!1431661))

(assert (=> b!1553701 m!1431661))

(assert (=> b!1553701 m!1431665))

(assert (=> start!132456 d!161402))

(declare-fun d!161411 () Bool)

(declare-fun isStrictlySorted!894 (List!36279) Bool)

(assert (=> d!161411 (= (inv!57327 lm!249) (isStrictlySorted!894 (toList!11244 lm!249)))))

(declare-fun bs!44624 () Bool)

(assert (= bs!44624 d!161411))

(declare-fun m!1431669 () Bool)

(assert (=> bs!44624 m!1431669))

(assert (=> start!132456 d!161411))

(declare-fun d!161415 () Bool)

(declare-fun res!1063458 () Bool)

(declare-fun e!865093 () Bool)

(assert (=> d!161415 (=> res!1063458 e!865093)))

(get-info :version)

(assert (=> d!161415 (= res!1063458 (and ((_ is Cons!36275) (toList!11244 lm!249)) (= (_1!12435 (h!37722 (toList!11244 lm!249))) a0!49)))))

(assert (=> d!161415 (= (containsKey!765 (toList!11244 lm!249) a0!49) e!865093)))

(declare-fun b!1553721 () Bool)

(declare-fun e!865094 () Bool)

(assert (=> b!1553721 (= e!865093 e!865094)))

(declare-fun res!1063459 () Bool)

(assert (=> b!1553721 (=> (not res!1063459) (not e!865094))))

(assert (=> b!1553721 (= res!1063459 (and (or (not ((_ is Cons!36275) (toList!11244 lm!249))) (bvsle (_1!12435 (h!37722 (toList!11244 lm!249))) a0!49)) ((_ is Cons!36275) (toList!11244 lm!249)) (bvslt (_1!12435 (h!37722 (toList!11244 lm!249))) a0!49)))))

(declare-fun b!1553722 () Bool)

(assert (=> b!1553722 (= e!865094 (containsKey!765 (t!50992 (toList!11244 lm!249)) a0!49))))

(assert (= (and d!161415 (not res!1063458)) b!1553721))

(assert (= (and b!1553721 res!1063459) b!1553722))

(declare-fun m!1431673 () Bool)

(assert (=> b!1553722 m!1431673))

(assert (=> b!1553658 d!161415))

(declare-fun b!1553731 () Bool)

(declare-fun e!865099 () Bool)

(declare-fun tp_is_empty!38241 () Bool)

(declare-fun tp!112158 () Bool)

(assert (=> b!1553731 (= e!865099 (and tp_is_empty!38241 tp!112158))))

(assert (=> b!1553659 (= tp!112147 e!865099)))

(assert (= (and b!1553659 ((_ is Cons!36275) (toList!11244 lm!249))) b!1553731))

(check-sat (not b!1553701) (not b!1553699) (not b!1553731) (not d!161411) (not d!161402) (not b!1553722) tp_is_empty!38241)
(check-sat)
