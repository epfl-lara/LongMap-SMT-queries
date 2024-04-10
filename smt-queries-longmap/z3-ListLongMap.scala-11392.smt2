; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132508 () Bool)

(assert start!132508)

(declare-fun res!1063555 () Bool)

(declare-fun e!865249 () Bool)

(assert (=> start!132508 (=> (not res!1063555) (not e!865249))))

(declare-datatypes ((B!2230 0))(
  ( (B!2231 (val!19201 Int)) )
))
(declare-datatypes ((tuple2!24778 0))(
  ( (tuple2!24779 (_1!12400 (_ BitVec 64)) (_2!12400 B!2230)) )
))
(declare-datatypes ((List!36235 0))(
  ( (Nil!36232) (Cons!36231 (h!37677 tuple2!24778) (t!50956 List!36235)) )
))
(declare-datatypes ((ListLongMap!22387 0))(
  ( (ListLongMap!22388 (toList!11209 List!36235)) )
))
(declare-fun lm!249 () ListLongMap!22387)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10154 (ListLongMap!22387 (_ BitVec 64)) Bool)

(assert (=> start!132508 (= res!1063555 (contains!10154 lm!249 a0!49))))

(assert (=> start!132508 e!865249))

(declare-fun e!865250 () Bool)

(declare-fun inv!57328 (ListLongMap!22387) Bool)

(assert (=> start!132508 (and (inv!57328 lm!249) e!865250)))

(assert (=> start!132508 true))

(declare-fun b!1553979 () Bool)

(declare-fun res!1063554 () Bool)

(assert (=> b!1553979 (=> (not res!1063554) (not e!865249))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553979 (= res!1063554 (not (= a0!49 a!523)))))

(declare-fun b!1553980 () Bool)

(declare-fun containsKey!768 (List!36235 (_ BitVec 64)) Bool)

(assert (=> b!1553980 (= e!865249 (not (containsKey!768 (toList!11209 lm!249) a0!49)))))

(declare-fun b!1553981 () Bool)

(declare-fun tp!112149 () Bool)

(assert (=> b!1553981 (= e!865250 tp!112149)))

(assert (= (and start!132508 res!1063555) b!1553979))

(assert (= (and b!1553979 res!1063554) b!1553980))

(assert (= start!132508 b!1553981))

(declare-fun m!1432533 () Bool)

(assert (=> start!132508 m!1432533))

(declare-fun m!1432535 () Bool)

(assert (=> start!132508 m!1432535))

(declare-fun m!1432537 () Bool)

(assert (=> b!1553980 m!1432537))

(check-sat (not b!1553980) (not start!132508) (not b!1553981))
(check-sat)
(get-model)

(declare-fun d!161657 () Bool)

(declare-fun res!1063572 () Bool)

(declare-fun e!865267 () Bool)

(assert (=> d!161657 (=> res!1063572 e!865267)))

(get-info :version)

(assert (=> d!161657 (= res!1063572 (and ((_ is Cons!36231) (toList!11209 lm!249)) (= (_1!12400 (h!37677 (toList!11209 lm!249))) a0!49)))))

(assert (=> d!161657 (= (containsKey!768 (toList!11209 lm!249) a0!49) e!865267)))

(declare-fun b!1554001 () Bool)

(declare-fun e!865268 () Bool)

(assert (=> b!1554001 (= e!865267 e!865268)))

(declare-fun res!1063573 () Bool)

(assert (=> b!1554001 (=> (not res!1063573) (not e!865268))))

(assert (=> b!1554001 (= res!1063573 (and (or (not ((_ is Cons!36231) (toList!11209 lm!249))) (bvsle (_1!12400 (h!37677 (toList!11209 lm!249))) a0!49)) ((_ is Cons!36231) (toList!11209 lm!249)) (bvslt (_1!12400 (h!37677 (toList!11209 lm!249))) a0!49)))))

(declare-fun b!1554002 () Bool)

(assert (=> b!1554002 (= e!865268 (containsKey!768 (t!50956 (toList!11209 lm!249)) a0!49))))

(assert (= (and d!161657 (not res!1063572)) b!1554001))

(assert (= (and b!1554001 res!1063573) b!1554002))

(declare-fun m!1432547 () Bool)

(assert (=> b!1554002 m!1432547))

(assert (=> b!1553980 d!161657))

(declare-fun d!161663 () Bool)

(declare-fun e!865286 () Bool)

(assert (=> d!161663 e!865286))

(declare-fun res!1063581 () Bool)

(assert (=> d!161663 (=> res!1063581 e!865286)))

(declare-fun lt!669914 () Bool)

(assert (=> d!161663 (= res!1063581 (not lt!669914))))

(declare-fun lt!669913 () Bool)

(assert (=> d!161663 (= lt!669914 lt!669913)))

(declare-datatypes ((Unit!51769 0))(
  ( (Unit!51770) )
))
(declare-fun lt!669911 () Unit!51769)

(declare-fun e!865285 () Unit!51769)

(assert (=> d!161663 (= lt!669911 e!865285)))

(declare-fun c!143341 () Bool)

(assert (=> d!161663 (= c!143341 lt!669913)))

(assert (=> d!161663 (= lt!669913 (containsKey!768 (toList!11209 lm!249) a0!49))))

(assert (=> d!161663 (= (contains!10154 lm!249 a0!49) lt!669914)))

(declare-fun b!1554025 () Bool)

(declare-fun lt!669909 () Unit!51769)

(assert (=> b!1554025 (= e!865285 lt!669909)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!511 (List!36235 (_ BitVec 64)) Unit!51769)

(assert (=> b!1554025 (= lt!669909 (lemmaContainsKeyImpliesGetValueByKeyDefined!511 (toList!11209 lm!249) a0!49))))

(declare-datatypes ((Option!821 0))(
  ( (Some!820 (v!22005 B!2230)) (None!819) )
))
(declare-fun isDefined!559 (Option!821) Bool)

(declare-fun getValueByKey!745 (List!36235 (_ BitVec 64)) Option!821)

(assert (=> b!1554025 (isDefined!559 (getValueByKey!745 (toList!11209 lm!249) a0!49))))

(declare-fun b!1554027 () Bool)

(declare-fun Unit!51771 () Unit!51769)

(assert (=> b!1554027 (= e!865285 Unit!51771)))

(declare-fun b!1554029 () Bool)

(assert (=> b!1554029 (= e!865286 (isDefined!559 (getValueByKey!745 (toList!11209 lm!249) a0!49)))))

(assert (= (and d!161663 c!143341) b!1554025))

(assert (= (and d!161663 (not c!143341)) b!1554027))

(assert (= (and d!161663 (not res!1063581)) b!1554029))

(assert (=> d!161663 m!1432537))

(declare-fun m!1432559 () Bool)

(assert (=> b!1554025 m!1432559))

(declare-fun m!1432563 () Bool)

(assert (=> b!1554025 m!1432563))

(assert (=> b!1554025 m!1432563))

(declare-fun m!1432567 () Bool)

(assert (=> b!1554025 m!1432567))

(assert (=> b!1554029 m!1432563))

(assert (=> b!1554029 m!1432563))

(assert (=> b!1554029 m!1432567))

(assert (=> start!132508 d!161663))

(declare-fun d!161671 () Bool)

(declare-fun isStrictlySorted!897 (List!36235) Bool)

(assert (=> d!161671 (= (inv!57328 lm!249) (isStrictlySorted!897 (toList!11209 lm!249)))))

(declare-fun bs!44671 () Bool)

(assert (= bs!44671 d!161671))

(declare-fun m!1432571 () Bool)

(assert (=> bs!44671 m!1432571))

(assert (=> start!132508 d!161671))

(declare-fun b!1554042 () Bool)

(declare-fun e!865295 () Bool)

(declare-fun tp_is_empty!38241 () Bool)

(declare-fun tp!112157 () Bool)

(assert (=> b!1554042 (= e!865295 (and tp_is_empty!38241 tp!112157))))

(assert (=> b!1553981 (= tp!112149 e!865295)))

(assert (= (and b!1553981 ((_ is Cons!36231) (toList!11209 lm!249))) b!1554042))

(check-sat (not b!1554029) (not d!161671) (not b!1554042) (not b!1554002) (not d!161663) tp_is_empty!38241 (not b!1554025))
(check-sat)
