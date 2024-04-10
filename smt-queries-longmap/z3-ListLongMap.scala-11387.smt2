; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132400 () Bool)

(assert start!132400)

(declare-fun res!1063258 () Bool)

(declare-fun e!864890 () Bool)

(assert (=> start!132400 (=> (not res!1063258) (not e!864890))))

(declare-datatypes ((B!2200 0))(
  ( (B!2201 (val!19186 Int)) )
))
(declare-datatypes ((tuple2!24748 0))(
  ( (tuple2!24749 (_1!12385 (_ BitVec 64)) (_2!12385 B!2200)) )
))
(declare-datatypes ((List!36220 0))(
  ( (Nil!36217) (Cons!36216 (h!37662 tuple2!24748) (t!50941 List!36220)) )
))
(declare-datatypes ((ListLongMap!22357 0))(
  ( (ListLongMap!22358 (toList!11194 List!36220)) )
))
(declare-fun lm!249 () ListLongMap!22357)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10136 (ListLongMap!22357 (_ BitVec 64)) Bool)

(assert (=> start!132400 (= res!1063258 (contains!10136 lm!249 a0!49))))

(assert (=> start!132400 e!864890))

(declare-fun e!864889 () Bool)

(declare-fun inv!57288 (ListLongMap!22357) Bool)

(assert (=> start!132400 (and (inv!57288 lm!249) e!864889)))

(assert (=> start!132400 true))

(declare-fun b!1553445 () Bool)

(declare-fun res!1063257 () Bool)

(assert (=> b!1553445 (=> (not res!1063257) (not e!864890))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553445 (= res!1063257 (not (= a0!49 a!523)))))

(declare-fun b!1553446 () Bool)

(declare-fun isStrictlySorted!889 (List!36220) Bool)

(assert (=> b!1553446 (= e!864890 (not (isStrictlySorted!889 (toList!11194 lm!249))))))

(declare-fun b!1553447 () Bool)

(declare-fun tp!112086 () Bool)

(assert (=> b!1553447 (= e!864889 tp!112086)))

(assert (= (and start!132400 res!1063258) b!1553445))

(assert (= (and b!1553445 res!1063257) b!1553446))

(assert (= start!132400 b!1553447))

(declare-fun m!1432131 () Bool)

(assert (=> start!132400 m!1432131))

(declare-fun m!1432133 () Bool)

(assert (=> start!132400 m!1432133))

(declare-fun m!1432135 () Bool)

(assert (=> b!1553446 m!1432135))

(check-sat (not b!1553446) (not start!132400) (not b!1553447))
(check-sat)
(get-model)

(declare-fun d!161551 () Bool)

(declare-fun res!1063269 () Bool)

(declare-fun e!864901 () Bool)

(assert (=> d!161551 (=> res!1063269 e!864901)))

(get-info :version)

(assert (=> d!161551 (= res!1063269 (or ((_ is Nil!36217) (toList!11194 lm!249)) ((_ is Nil!36217) (t!50941 (toList!11194 lm!249)))))))

(assert (=> d!161551 (= (isStrictlySorted!889 (toList!11194 lm!249)) e!864901)))

(declare-fun b!1553461 () Bool)

(declare-fun e!864902 () Bool)

(assert (=> b!1553461 (= e!864901 e!864902)))

(declare-fun res!1063270 () Bool)

(assert (=> b!1553461 (=> (not res!1063270) (not e!864902))))

(assert (=> b!1553461 (= res!1063270 (bvslt (_1!12385 (h!37662 (toList!11194 lm!249))) (_1!12385 (h!37662 (t!50941 (toList!11194 lm!249))))))))

(declare-fun b!1553462 () Bool)

(assert (=> b!1553462 (= e!864902 (isStrictlySorted!889 (t!50941 (toList!11194 lm!249))))))

(assert (= (and d!161551 (not res!1063269)) b!1553461))

(assert (= (and b!1553461 res!1063270) b!1553462))

(declare-fun m!1432143 () Bool)

(assert (=> b!1553462 m!1432143))

(assert (=> b!1553446 d!161551))

(declare-fun d!161555 () Bool)

(declare-fun e!864923 () Bool)

(assert (=> d!161555 e!864923))

(declare-fun res!1063283 () Bool)

(assert (=> d!161555 (=> res!1063283 e!864923)))

(declare-fun lt!669692 () Bool)

(assert (=> d!161555 (= res!1063283 (not lt!669692))))

(declare-fun lt!669693 () Bool)

(assert (=> d!161555 (= lt!669692 lt!669693)))

(declare-datatypes ((Unit!51738 0))(
  ( (Unit!51739) )
))
(declare-fun lt!669695 () Unit!51738)

(declare-fun e!864924 () Unit!51738)

(assert (=> d!161555 (= lt!669695 e!864924)))

(declare-fun c!143261 () Bool)

(assert (=> d!161555 (= c!143261 lt!669693)))

(declare-fun containsKey!757 (List!36220 (_ BitVec 64)) Bool)

(assert (=> d!161555 (= lt!669693 (containsKey!757 (toList!11194 lm!249) a0!49))))

(assert (=> d!161555 (= (contains!10136 lm!249 a0!49) lt!669692)))

(declare-fun b!1553489 () Bool)

(declare-fun lt!669694 () Unit!51738)

(assert (=> b!1553489 (= e!864924 lt!669694)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!503 (List!36220 (_ BitVec 64)) Unit!51738)

(assert (=> b!1553489 (= lt!669694 (lemmaContainsKeyImpliesGetValueByKeyDefined!503 (toList!11194 lm!249) a0!49))))

(declare-datatypes ((Option!811 0))(
  ( (Some!810 (v!21995 B!2200)) (None!809) )
))
(declare-fun isDefined!551 (Option!811) Bool)

(declare-fun getValueByKey!735 (List!36220 (_ BitVec 64)) Option!811)

(assert (=> b!1553489 (isDefined!551 (getValueByKey!735 (toList!11194 lm!249) a0!49))))

(declare-fun b!1553490 () Bool)

(declare-fun Unit!51742 () Unit!51738)

(assert (=> b!1553490 (= e!864924 Unit!51742)))

(declare-fun b!1553491 () Bool)

(assert (=> b!1553491 (= e!864923 (isDefined!551 (getValueByKey!735 (toList!11194 lm!249) a0!49)))))

(assert (= (and d!161555 c!143261) b!1553489))

(assert (= (and d!161555 (not c!143261)) b!1553490))

(assert (= (and d!161555 (not res!1063283)) b!1553491))

(declare-fun m!1432161 () Bool)

(assert (=> d!161555 m!1432161))

(declare-fun m!1432163 () Bool)

(assert (=> b!1553489 m!1432163))

(declare-fun m!1432165 () Bool)

(assert (=> b!1553489 m!1432165))

(assert (=> b!1553489 m!1432165))

(declare-fun m!1432167 () Bool)

(assert (=> b!1553489 m!1432167))

(assert (=> b!1553491 m!1432165))

(assert (=> b!1553491 m!1432165))

(assert (=> b!1553491 m!1432167))

(assert (=> start!132400 d!161555))

(declare-fun d!161565 () Bool)

(assert (=> d!161565 (= (inv!57288 lm!249) (isStrictlySorted!889 (toList!11194 lm!249)))))

(declare-fun bs!44647 () Bool)

(assert (= bs!44647 d!161565))

(assert (=> bs!44647 m!1432135))

(assert (=> start!132400 d!161565))

(declare-fun b!1553509 () Bool)

(declare-fun e!864936 () Bool)

(declare-fun tp_is_empty!38217 () Bool)

(declare-fun tp!112095 () Bool)

(assert (=> b!1553509 (= e!864936 (and tp_is_empty!38217 tp!112095))))

(assert (=> b!1553447 (= tp!112086 e!864936)))

(assert (= (and b!1553447 ((_ is Cons!36216) (toList!11194 lm!249))) b!1553509))

(check-sat (not b!1553489) (not b!1553462) (not d!161565) tp_is_empty!38217 (not b!1553509) (not b!1553491) (not d!161555))
(check-sat)
