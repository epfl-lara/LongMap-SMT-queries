; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132480 () Bool)

(assert start!132480)

(declare-fun b!1553748 () Bool)

(declare-fun res!1063470 () Bool)

(declare-fun e!865110 () Bool)

(assert (=> b!1553748 (=> (not res!1063470) (not e!865110))))

(declare-datatypes ((B!2234 0))(
  ( (B!2235 (val!19203 Int)) )
))
(declare-datatypes ((tuple2!24854 0))(
  ( (tuple2!24855 (_1!12438 (_ BitVec 64)) (_2!12438 B!2234)) )
))
(declare-datatypes ((List!36282 0))(
  ( (Nil!36279) (Cons!36278 (h!37725 tuple2!24854) (t!50995 List!36282)) )
))
(declare-datatypes ((ListLongMap!22463 0))(
  ( (ListLongMap!22464 (toList!11247 List!36282)) )
))
(declare-fun lm!249 () ListLongMap!22463)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!768 (List!36282 (_ BitVec 64)) Bool)

(assert (=> b!1553748 (= res!1063470 (containsKey!768 (toList!11247 lm!249) a0!49))))

(declare-fun b!1553749 () Bool)

(declare-fun e!865111 () Bool)

(assert (=> b!1553749 (= e!865110 e!865111)))

(declare-fun res!1063469 () Bool)

(assert (=> b!1553749 (=> res!1063469 e!865111)))

(declare-fun isStrictlySorted!897 (List!36282) Bool)

(assert (=> b!1553749 (= res!1063469 (not (isStrictlySorted!897 (toList!11247 lm!249))))))

(declare-fun b!1553750 () Bool)

(declare-fun e!865112 () Bool)

(declare-fun tp!112165 () Bool)

(assert (=> b!1553750 (= e!865112 tp!112165)))

(declare-fun res!1063471 () Bool)

(assert (=> start!132480 (=> (not res!1063471) (not e!865110))))

(declare-fun contains!10113 (ListLongMap!22463 (_ BitVec 64)) Bool)

(assert (=> start!132480 (= res!1063471 (contains!10113 lm!249 a0!49))))

(assert (=> start!132480 e!865110))

(declare-fun inv!57335 (ListLongMap!22463) Bool)

(assert (=> start!132480 (and (inv!57335 lm!249) e!865112)))

(assert (=> start!132480 true))

(declare-fun b!1553751 () Bool)

(declare-fun res!1063468 () Bool)

(assert (=> b!1553751 (=> (not res!1063468) (not e!865110))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553751 (= res!1063468 (not (= a0!49 a!523)))))

(declare-fun b!1553752 () Bool)

(assert (=> b!1553752 (= e!865111 (= a!523 a0!49))))

(assert (= (and start!132480 res!1063471) b!1553751))

(assert (= (and b!1553751 res!1063468) b!1553748))

(assert (= (and b!1553748 res!1063470) b!1553749))

(assert (= (and b!1553749 (not res!1063469)) b!1553752))

(assert (= start!132480 b!1553750))

(declare-fun m!1431683 () Bool)

(assert (=> b!1553748 m!1431683))

(declare-fun m!1431685 () Bool)

(assert (=> b!1553749 m!1431685))

(declare-fun m!1431687 () Bool)

(assert (=> start!132480 m!1431687))

(declare-fun m!1431689 () Bool)

(assert (=> start!132480 m!1431689))

(check-sat (not b!1553749) (not start!132480) (not b!1553748) (not b!1553750))
(check-sat)
(get-model)

(declare-fun d!161422 () Bool)

(declare-fun res!1063502 () Bool)

(declare-fun e!865137 () Bool)

(assert (=> d!161422 (=> res!1063502 e!865137)))

(get-info :version)

(assert (=> d!161422 (= res!1063502 (or ((_ is Nil!36279) (toList!11247 lm!249)) ((_ is Nil!36279) (t!50995 (toList!11247 lm!249)))))))

(assert (=> d!161422 (= (isStrictlySorted!897 (toList!11247 lm!249)) e!865137)))

(declare-fun b!1553789 () Bool)

(declare-fun e!865138 () Bool)

(assert (=> b!1553789 (= e!865137 e!865138)))

(declare-fun res!1063503 () Bool)

(assert (=> b!1553789 (=> (not res!1063503) (not e!865138))))

(assert (=> b!1553789 (= res!1063503 (bvslt (_1!12438 (h!37725 (toList!11247 lm!249))) (_1!12438 (h!37725 (t!50995 (toList!11247 lm!249))))))))

(declare-fun b!1553790 () Bool)

(assert (=> b!1553790 (= e!865138 (isStrictlySorted!897 (t!50995 (toList!11247 lm!249))))))

(assert (= (and d!161422 (not res!1063502)) b!1553789))

(assert (= (and b!1553789 res!1063503) b!1553790))

(declare-fun m!1431707 () Bool)

(assert (=> b!1553790 m!1431707))

(assert (=> b!1553749 d!161422))

(declare-fun d!161427 () Bool)

(declare-fun e!865158 () Bool)

(assert (=> d!161427 e!865158))

(declare-fun res!1063515 () Bool)

(assert (=> d!161427 (=> res!1063515 e!865158)))

(declare-fun lt!669660 () Bool)

(assert (=> d!161427 (= res!1063515 (not lt!669660))))

(declare-fun lt!669657 () Bool)

(assert (=> d!161427 (= lt!669660 lt!669657)))

(declare-datatypes ((Unit!51595 0))(
  ( (Unit!51596) )
))
(declare-fun lt!669658 () Unit!51595)

(declare-fun e!865157 () Unit!51595)

(assert (=> d!161427 (= lt!669658 e!865157)))

(declare-fun c!143261 () Bool)

(assert (=> d!161427 (= c!143261 lt!669657)))

(assert (=> d!161427 (= lt!669657 (containsKey!768 (toList!11247 lm!249) a0!49))))

(assert (=> d!161427 (= (contains!10113 lm!249 a0!49) lt!669660)))

(declare-fun b!1553816 () Bool)

(declare-fun lt!669659 () Unit!51595)

(assert (=> b!1553816 (= e!865157 lt!669659)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!513 (List!36282 (_ BitVec 64)) Unit!51595)

(assert (=> b!1553816 (= lt!669659 (lemmaContainsKeyImpliesGetValueByKeyDefined!513 (toList!11247 lm!249) a0!49))))

(declare-datatypes ((Option!827 0))(
  ( (Some!826 (v!22005 B!2234)) (None!825) )
))
(declare-fun isDefined!565 (Option!827) Bool)

(declare-fun getValueByKey!752 (List!36282 (_ BitVec 64)) Option!827)

(assert (=> b!1553816 (isDefined!565 (getValueByKey!752 (toList!11247 lm!249) a0!49))))

(declare-fun b!1553817 () Bool)

(declare-fun Unit!51600 () Unit!51595)

(assert (=> b!1553817 (= e!865157 Unit!51600)))

(declare-fun b!1553818 () Bool)

(assert (=> b!1553818 (= e!865158 (isDefined!565 (getValueByKey!752 (toList!11247 lm!249) a0!49)))))

(assert (= (and d!161427 c!143261) b!1553816))

(assert (= (and d!161427 (not c!143261)) b!1553817))

(assert (= (and d!161427 (not res!1063515)) b!1553818))

(assert (=> d!161427 m!1431683))

(declare-fun m!1431717 () Bool)

(assert (=> b!1553816 m!1431717))

(declare-fun m!1431719 () Bool)

(assert (=> b!1553816 m!1431719))

(assert (=> b!1553816 m!1431719))

(declare-fun m!1431721 () Bool)

(assert (=> b!1553816 m!1431721))

(assert (=> b!1553818 m!1431719))

(assert (=> b!1553818 m!1431719))

(assert (=> b!1553818 m!1431721))

(assert (=> start!132480 d!161427))

(declare-fun d!161435 () Bool)

(assert (=> d!161435 (= (inv!57335 lm!249) (isStrictlySorted!897 (toList!11247 lm!249)))))

(declare-fun bs!44630 () Bool)

(assert (= bs!44630 d!161435))

(assert (=> bs!44630 m!1431685))

(assert (=> start!132480 d!161435))

(declare-fun d!161437 () Bool)

(declare-fun res!1063535 () Bool)

(declare-fun e!865179 () Bool)

(assert (=> d!161437 (=> res!1063535 e!865179)))

(assert (=> d!161437 (= res!1063535 (and ((_ is Cons!36278) (toList!11247 lm!249)) (= (_1!12438 (h!37725 (toList!11247 lm!249))) a0!49)))))

(assert (=> d!161437 (= (containsKey!768 (toList!11247 lm!249) a0!49) e!865179)))

(declare-fun b!1553840 () Bool)

(declare-fun e!865180 () Bool)

(assert (=> b!1553840 (= e!865179 e!865180)))

(declare-fun res!1063536 () Bool)

(assert (=> b!1553840 (=> (not res!1063536) (not e!865180))))

(assert (=> b!1553840 (= res!1063536 (and (or (not ((_ is Cons!36278) (toList!11247 lm!249))) (bvsle (_1!12438 (h!37725 (toList!11247 lm!249))) a0!49)) ((_ is Cons!36278) (toList!11247 lm!249)) (bvslt (_1!12438 (h!37725 (toList!11247 lm!249))) a0!49)))))

(declare-fun b!1553841 () Bool)

(assert (=> b!1553841 (= e!865180 (containsKey!768 (t!50995 (toList!11247 lm!249)) a0!49))))

(assert (= (and d!161437 (not res!1063535)) b!1553840))

(assert (= (and b!1553840 res!1063536) b!1553841))

(declare-fun m!1431731 () Bool)

(assert (=> b!1553841 m!1431731))

(assert (=> b!1553748 d!161437))

(declare-fun b!1553855 () Bool)

(declare-fun e!865190 () Bool)

(declare-fun tp_is_empty!38245 () Bool)

(declare-fun tp!112177 () Bool)

(assert (=> b!1553855 (= e!865190 (and tp_is_empty!38245 tp!112177))))

(assert (=> b!1553750 (= tp!112165 e!865190)))

(assert (= (and b!1553750 ((_ is Cons!36278) (toList!11247 lm!249))) b!1553855))

(check-sat (not b!1553816) tp_is_empty!38245 (not d!161427) (not b!1553841) (not b!1553790) (not d!161435) (not b!1553855) (not b!1553818))
(check-sat)
