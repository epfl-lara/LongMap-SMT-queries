; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106612 () Bool)

(assert start!106612)

(declare-fun res!843307 () Bool)

(declare-fun e!721561 () Bool)

(assert (=> start!106612 (=> (not res!843307) (not e!721561))))

(declare-datatypes ((B!2018 0))(
  ( (B!2019 (val!16344 Int)) )
))
(declare-datatypes ((tuple2!21206 0))(
  ( (tuple2!21207 (_1!10614 (_ BitVec 64)) (_2!10614 B!2018)) )
))
(declare-datatypes ((List!28336 0))(
  ( (Nil!28333) (Cons!28332 (h!29541 tuple2!21206) (t!41863 List!28336)) )
))
(declare-datatypes ((ListLongMap!19001 0))(
  ( (ListLongMap!19002 (toList!9516 List!28336)) )
))
(declare-fun lm!209 () ListLongMap!19001)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7652 (ListLongMap!19001 (_ BitVec 64)) Bool)

(assert (=> start!106612 (= res!843307 (not (contains!7652 lm!209 a!499)))))

(assert (=> start!106612 e!721561))

(declare-fun e!721562 () Bool)

(declare-fun inv!44177 (ListLongMap!19001) Bool)

(assert (=> start!106612 (and (inv!44177 lm!209) e!721562)))

(assert (=> start!106612 true))

(declare-fun b!1266774 () Bool)

(declare-fun isStrictlySorted!805 (List!28336) Bool)

(assert (=> b!1266774 (= e!721561 (not (isStrictlySorted!805 (toList!9516 lm!209))))))

(declare-fun b!1266775 () Bool)

(declare-fun tp!96470 () Bool)

(assert (=> b!1266775 (= e!721562 tp!96470)))

(assert (= (and start!106612 res!843307) b!1266774))

(assert (= start!106612 b!1266775))

(declare-fun m!1166409 () Bool)

(assert (=> start!106612 m!1166409))

(declare-fun m!1166411 () Bool)

(assert (=> start!106612 m!1166411))

(declare-fun m!1166413 () Bool)

(assert (=> b!1266774 m!1166413))

(push 1)

(assert (not b!1266774))

(assert (not start!106612))

(assert (not b!1266775))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139321 () Bool)

(declare-fun res!843318 () Bool)

(declare-fun e!721579 () Bool)

(assert (=> d!139321 (=> res!843318 e!721579)))

(assert (=> d!139321 (= res!843318 (or (is-Nil!28333 (toList!9516 lm!209)) (is-Nil!28333 (t!41863 (toList!9516 lm!209)))))))

(assert (=> d!139321 (= (isStrictlySorted!805 (toList!9516 lm!209)) e!721579)))

(declare-fun b!1266792 () Bool)

(declare-fun e!721580 () Bool)

(assert (=> b!1266792 (= e!721579 e!721580)))

(declare-fun res!843319 () Bool)

(assert (=> b!1266792 (=> (not res!843319) (not e!721580))))

(assert (=> b!1266792 (= res!843319 (bvslt (_1!10614 (h!29541 (toList!9516 lm!209))) (_1!10614 (h!29541 (t!41863 (toList!9516 lm!209))))))))

(declare-fun b!1266793 () Bool)

(assert (=> b!1266793 (= e!721580 (isStrictlySorted!805 (t!41863 (toList!9516 lm!209))))))

(assert (= (and d!139321 (not res!843318)) b!1266792))

(assert (= (and b!1266792 res!843319) b!1266793))

(declare-fun m!1166427 () Bool)

(assert (=> b!1266793 m!1166427))

(assert (=> b!1266774 d!139321))

(declare-fun d!139327 () Bool)

(declare-fun e!721602 () Bool)

(assert (=> d!139327 e!721602))

(declare-fun res!843333 () Bool)

(assert (=> d!139327 (=> res!843333 e!721602)))

(declare-fun lt!574199 () Bool)

(assert (=> d!139327 (= res!843333 (not lt!574199))))

(declare-fun lt!574197 () Bool)

(assert (=> d!139327 (= lt!574199 lt!574197)))

(declare-datatypes ((Unit!42191 0))(
  ( (Unit!42192) )
))
(declare-fun lt!574198 () Unit!42191)

(declare-fun e!721601 () Unit!42191)

(assert (=> d!139327 (= lt!574198 e!721601)))

(declare-fun c!123516 () Bool)

(assert (=> d!139327 (= c!123516 lt!574197)))

(declare-fun containsKey!665 (List!28336 (_ BitVec 64)) Bool)

(assert (=> d!139327 (= lt!574197 (containsKey!665 (toList!9516 lm!209) a!499))))

(assert (=> d!139327 (= (contains!7652 lm!209 a!499) lt!574199)))

(declare-fun b!1266821 () Bool)

(declare-fun lt!574196 () Unit!42191)

(assert (=> b!1266821 (= e!721601 lt!574196)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!447 (List!28336 (_ BitVec 64)) Unit!42191)

(assert (=> b!1266821 (= lt!574196 (lemmaContainsKeyImpliesGetValueByKeyDefined!447 (toList!9516 lm!209) a!499))))

(declare-datatypes ((Option!731 0))(
  ( (Some!730 (v!19014 B!2018)) (None!729) )
))
(declare-fun isDefined!486 (Option!731) Bool)

(declare-fun getValueByKey!679 (List!28336 (_ BitVec 64)) Option!731)

(assert (=> b!1266821 (isDefined!486 (getValueByKey!679 (toList!9516 lm!209) a!499))))

(declare-fun b!1266822 () Bool)

(declare-fun Unit!42196 () Unit!42191)

(assert (=> b!1266822 (= e!721601 Unit!42196)))

(declare-fun b!1266823 () Bool)

(assert (=> b!1266823 (= e!721602 (isDefined!486 (getValueByKey!679 (toList!9516 lm!209) a!499)))))

(assert (= (and d!139327 c!123516) b!1266821))

(assert (= (and d!139327 (not c!123516)) b!1266822))

(assert (= (and d!139327 (not res!843333)) b!1266823))

(declare-fun m!1166439 () Bool)

(assert (=> d!139327 m!1166439))

(declare-fun m!1166441 () Bool)

(assert (=> b!1266821 m!1166441))

(declare-fun m!1166443 () Bool)

(assert (=> b!1266821 m!1166443))

(assert (=> b!1266821 m!1166443))

(declare-fun m!1166445 () Bool)

(assert (=> b!1266821 m!1166445))

(assert (=> b!1266823 m!1166443))

(assert (=> b!1266823 m!1166443))

(assert (=> b!1266823 m!1166445))

(assert (=> start!106612 d!139327))

(declare-fun d!139335 () Bool)

(assert (=> d!139335 (= (inv!44177 lm!209) (isStrictlySorted!805 (toList!9516 lm!209)))))

(declare-fun bs!35853 () Bool)

(assert (= bs!35853 d!139335))

(assert (=> bs!35853 m!1166413))

(assert (=> start!106612 d!139335))

(declare-fun b!1266835 () Bool)

(declare-fun e!721611 () Bool)

(declare-fun tp_is_empty!32539 () Bool)

(declare-fun tp!96479 () Bool)

(assert (=> b!1266835 (= e!721611 (and tp_is_empty!32539 tp!96479))))

(assert (=> b!1266775 (= tp!96470 e!721611)))

(assert (= (and b!1266775 (is-Cons!28332 (toList!9516 lm!209))) b!1266835))

(push 1)

(assert tp_is_empty!32539)

(assert (not b!1266823))

(assert (not b!1266835))

(assert (not d!139327))

(assert (not b!1266793))

(assert (not b!1266821))

(assert (not d!139335))

(check-sat)

(pop 1)

