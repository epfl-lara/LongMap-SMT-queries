; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106614 () Bool)

(assert start!106614)

(declare-fun res!843310 () Bool)

(declare-fun e!721567 () Bool)

(assert (=> start!106614 (=> (not res!843310) (not e!721567))))

(declare-datatypes ((B!2020 0))(
  ( (B!2021 (val!16345 Int)) )
))
(declare-datatypes ((tuple2!21208 0))(
  ( (tuple2!21209 (_1!10615 (_ BitVec 64)) (_2!10615 B!2020)) )
))
(declare-datatypes ((List!28337 0))(
  ( (Nil!28334) (Cons!28333 (h!29542 tuple2!21208) (t!41864 List!28337)) )
))
(declare-datatypes ((ListLongMap!19003 0))(
  ( (ListLongMap!19004 (toList!9517 List!28337)) )
))
(declare-fun lm!209 () ListLongMap!19003)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7653 (ListLongMap!19003 (_ BitVec 64)) Bool)

(assert (=> start!106614 (= res!843310 (not (contains!7653 lm!209 a!499)))))

(assert (=> start!106614 e!721567))

(declare-fun e!721568 () Bool)

(declare-fun inv!44178 (ListLongMap!19003) Bool)

(assert (=> start!106614 (and (inv!44178 lm!209) e!721568)))

(assert (=> start!106614 true))

(declare-fun b!1266780 () Bool)

(declare-fun isStrictlySorted!806 (List!28337) Bool)

(assert (=> b!1266780 (= e!721567 (not (isStrictlySorted!806 (toList!9517 lm!209))))))

(declare-fun b!1266781 () Bool)

(declare-fun tp!96473 () Bool)

(assert (=> b!1266781 (= e!721568 tp!96473)))

(assert (= (and start!106614 res!843310) b!1266780))

(assert (= start!106614 b!1266781))

(declare-fun m!1166415 () Bool)

(assert (=> start!106614 m!1166415))

(declare-fun m!1166417 () Bool)

(assert (=> start!106614 m!1166417))

(declare-fun m!1166419 () Bool)

(assert (=> b!1266780 m!1166419))

(check-sat (not b!1266780) (not start!106614) (not b!1266781))
(check-sat)
(get-model)

(declare-fun d!139323 () Bool)

(declare-fun res!843324 () Bool)

(declare-fun e!721585 () Bool)

(assert (=> d!139323 (=> res!843324 e!721585)))

(get-info :version)

(assert (=> d!139323 (= res!843324 (or ((_ is Nil!28334) (toList!9517 lm!209)) ((_ is Nil!28334) (t!41864 (toList!9517 lm!209)))))))

(assert (=> d!139323 (= (isStrictlySorted!806 (toList!9517 lm!209)) e!721585)))

(declare-fun b!1266798 () Bool)

(declare-fun e!721586 () Bool)

(assert (=> b!1266798 (= e!721585 e!721586)))

(declare-fun res!843325 () Bool)

(assert (=> b!1266798 (=> (not res!843325) (not e!721586))))

(assert (=> b!1266798 (= res!843325 (bvslt (_1!10615 (h!29542 (toList!9517 lm!209))) (_1!10615 (h!29542 (t!41864 (toList!9517 lm!209))))))))

(declare-fun b!1266799 () Bool)

(assert (=> b!1266799 (= e!721586 (isStrictlySorted!806 (t!41864 (toList!9517 lm!209))))))

(assert (= (and d!139323 (not res!843324)) b!1266798))

(assert (= (and b!1266798 res!843325) b!1266799))

(declare-fun m!1166429 () Bool)

(assert (=> b!1266799 m!1166429))

(assert (=> b!1266780 d!139323))

(declare-fun d!139329 () Bool)

(declare-fun e!721606 () Bool)

(assert (=> d!139329 e!721606))

(declare-fun res!843336 () Bool)

(assert (=> d!139329 (=> res!843336 e!721606)))

(declare-fun lt!574200 () Bool)

(assert (=> d!139329 (= res!843336 (not lt!574200))))

(declare-fun lt!574201 () Bool)

(assert (=> d!139329 (= lt!574200 lt!574201)))

(declare-datatypes ((Unit!42193 0))(
  ( (Unit!42194) )
))
(declare-fun lt!574203 () Unit!42193)

(declare-fun e!721605 () Unit!42193)

(assert (=> d!139329 (= lt!574203 e!721605)))

(declare-fun c!123517 () Bool)

(assert (=> d!139329 (= c!123517 lt!574201)))

(declare-fun containsKey!666 (List!28337 (_ BitVec 64)) Bool)

(assert (=> d!139329 (= lt!574201 (containsKey!666 (toList!9517 lm!209) a!499))))

(assert (=> d!139329 (= (contains!7653 lm!209 a!499) lt!574200)))

(declare-fun b!1266826 () Bool)

(declare-fun lt!574202 () Unit!42193)

(assert (=> b!1266826 (= e!721605 lt!574202)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!448 (List!28337 (_ BitVec 64)) Unit!42193)

(assert (=> b!1266826 (= lt!574202 (lemmaContainsKeyImpliesGetValueByKeyDefined!448 (toList!9517 lm!209) a!499))))

(declare-datatypes ((Option!732 0))(
  ( (Some!731 (v!19015 B!2020)) (None!730) )
))
(declare-fun isDefined!487 (Option!732) Bool)

(declare-fun getValueByKey!680 (List!28337 (_ BitVec 64)) Option!732)

(assert (=> b!1266826 (isDefined!487 (getValueByKey!680 (toList!9517 lm!209) a!499))))

(declare-fun b!1266827 () Bool)

(declare-fun Unit!42197 () Unit!42193)

(assert (=> b!1266827 (= e!721605 Unit!42197)))

(declare-fun b!1266828 () Bool)

(assert (=> b!1266828 (= e!721606 (isDefined!487 (getValueByKey!680 (toList!9517 lm!209) a!499)))))

(assert (= (and d!139329 c!123517) b!1266826))

(assert (= (and d!139329 (not c!123517)) b!1266827))

(assert (= (and d!139329 (not res!843336)) b!1266828))

(declare-fun m!1166447 () Bool)

(assert (=> d!139329 m!1166447))

(declare-fun m!1166449 () Bool)

(assert (=> b!1266826 m!1166449))

(declare-fun m!1166451 () Bool)

(assert (=> b!1266826 m!1166451))

(assert (=> b!1266826 m!1166451))

(declare-fun m!1166453 () Bool)

(assert (=> b!1266826 m!1166453))

(assert (=> b!1266828 m!1166451))

(assert (=> b!1266828 m!1166451))

(assert (=> b!1266828 m!1166453))

(assert (=> start!106614 d!139329))

(declare-fun d!139337 () Bool)

(assert (=> d!139337 (= (inv!44178 lm!209) (isStrictlySorted!806 (toList!9517 lm!209)))))

(declare-fun bs!35854 () Bool)

(assert (= bs!35854 d!139337))

(assert (=> bs!35854 m!1166419))

(assert (=> start!106614 d!139337))

(declare-fun b!1266847 () Bool)

(declare-fun e!721619 () Bool)

(declare-fun tp_is_empty!32543 () Bool)

(declare-fun tp!96485 () Bool)

(assert (=> b!1266847 (= e!721619 (and tp_is_empty!32543 tp!96485))))

(assert (=> b!1266781 (= tp!96473 e!721619)))

(assert (= (and b!1266781 ((_ is Cons!28333) (toList!9517 lm!209))) b!1266847))

(check-sat tp_is_empty!32543 (not b!1266826) (not d!139337) (not d!139329) (not b!1266828) (not b!1266847) (not b!1266799))
(check-sat)
