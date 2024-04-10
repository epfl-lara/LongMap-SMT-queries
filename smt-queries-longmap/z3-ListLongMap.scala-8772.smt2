; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106638 () Bool)

(assert start!106638)

(declare-fun res!843352 () Bool)

(declare-fun e!721630 () Bool)

(assert (=> start!106638 (=> (not res!843352) (not e!721630))))

(declare-datatypes ((B!2026 0))(
  ( (B!2027 (val!16348 Int)) )
))
(declare-datatypes ((tuple2!21214 0))(
  ( (tuple2!21215 (_1!10618 (_ BitVec 64)) (_2!10618 B!2026)) )
))
(declare-datatypes ((List!28340 0))(
  ( (Nil!28337) (Cons!28336 (h!29545 tuple2!21214) (t!41867 List!28340)) )
))
(declare-datatypes ((ListLongMap!19009 0))(
  ( (ListLongMap!19010 (toList!9520 List!28340)) )
))
(declare-fun lm!209 () ListLongMap!19009)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7656 (ListLongMap!19009 (_ BitVec 64)) Bool)

(assert (=> start!106638 (= res!843352 (not (contains!7656 lm!209 a!499)))))

(assert (=> start!106638 e!721630))

(declare-fun e!721631 () Bool)

(declare-fun inv!44186 (ListLongMap!19009) Bool)

(assert (=> start!106638 (and (inv!44186 lm!209) e!721631)))

(assert (=> start!106638 true))

(declare-fun b!1266863 () Bool)

(declare-fun res!843351 () Bool)

(assert (=> b!1266863 (=> (not res!843351) (not e!721630))))

(declare-fun isStrictlySorted!809 (List!28340) Bool)

(assert (=> b!1266863 (= res!843351 (isStrictlySorted!809 (toList!9520 lm!209)))))

(declare-fun b!1266864 () Bool)

(declare-fun containsKey!668 (List!28340 (_ BitVec 64)) Bool)

(assert (=> b!1266864 (= e!721630 (containsKey!668 (toList!9520 lm!209) a!499))))

(declare-fun b!1266865 () Bool)

(declare-fun tp!96491 () Bool)

(assert (=> b!1266865 (= e!721631 tp!96491)))

(assert (= (and start!106638 res!843352) b!1266863))

(assert (= (and b!1266863 res!843351) b!1266864))

(assert (= start!106638 b!1266865))

(declare-fun m!1166465 () Bool)

(assert (=> start!106638 m!1166465))

(declare-fun m!1166467 () Bool)

(assert (=> start!106638 m!1166467))

(declare-fun m!1166469 () Bool)

(assert (=> b!1266863 m!1166469))

(declare-fun m!1166471 () Bool)

(assert (=> b!1266864 m!1166471))

(check-sat (not b!1266863) (not b!1266864) (not start!106638) (not b!1266865))
(check-sat)
(get-model)

(declare-fun d!139341 () Bool)

(declare-fun res!843371 () Bool)

(declare-fun e!721650 () Bool)

(assert (=> d!139341 (=> res!843371 e!721650)))

(get-info :version)

(assert (=> d!139341 (= res!843371 (or ((_ is Nil!28337) (toList!9520 lm!209)) ((_ is Nil!28337) (t!41867 (toList!9520 lm!209)))))))

(assert (=> d!139341 (= (isStrictlySorted!809 (toList!9520 lm!209)) e!721650)))

(declare-fun b!1266887 () Bool)

(declare-fun e!721651 () Bool)

(assert (=> b!1266887 (= e!721650 e!721651)))

(declare-fun res!843372 () Bool)

(assert (=> b!1266887 (=> (not res!843372) (not e!721651))))

(assert (=> b!1266887 (= res!843372 (bvslt (_1!10618 (h!29545 (toList!9520 lm!209))) (_1!10618 (h!29545 (t!41867 (toList!9520 lm!209))))))))

(declare-fun b!1266888 () Bool)

(assert (=> b!1266888 (= e!721651 (isStrictlySorted!809 (t!41867 (toList!9520 lm!209))))))

(assert (= (and d!139341 (not res!843371)) b!1266887))

(assert (= (and b!1266887 res!843372) b!1266888))

(declare-fun m!1166481 () Bool)

(assert (=> b!1266888 m!1166481))

(assert (=> b!1266863 d!139341))

(declare-fun d!139347 () Bool)

(declare-fun res!843381 () Bool)

(declare-fun e!721660 () Bool)

(assert (=> d!139347 (=> res!843381 e!721660)))

(assert (=> d!139347 (= res!843381 (and ((_ is Cons!28336) (toList!9520 lm!209)) (= (_1!10618 (h!29545 (toList!9520 lm!209))) a!499)))))

(assert (=> d!139347 (= (containsKey!668 (toList!9520 lm!209) a!499) e!721660)))

(declare-fun b!1266897 () Bool)

(declare-fun e!721661 () Bool)

(assert (=> b!1266897 (= e!721660 e!721661)))

(declare-fun res!843382 () Bool)

(assert (=> b!1266897 (=> (not res!843382) (not e!721661))))

(assert (=> b!1266897 (= res!843382 (and (or (not ((_ is Cons!28336) (toList!9520 lm!209))) (bvsle (_1!10618 (h!29545 (toList!9520 lm!209))) a!499)) ((_ is Cons!28336) (toList!9520 lm!209)) (bvslt (_1!10618 (h!29545 (toList!9520 lm!209))) a!499)))))

(declare-fun b!1266898 () Bool)

(assert (=> b!1266898 (= e!721661 (containsKey!668 (t!41867 (toList!9520 lm!209)) a!499))))

(assert (= (and d!139347 (not res!843381)) b!1266897))

(assert (= (and b!1266897 res!843382) b!1266898))

(declare-fun m!1166487 () Bool)

(assert (=> b!1266898 m!1166487))

(assert (=> b!1266864 d!139347))

(declare-fun d!139353 () Bool)

(declare-fun e!721678 () Bool)

(assert (=> d!139353 e!721678))

(declare-fun res!843391 () Bool)

(assert (=> d!139353 (=> res!843391 e!721678)))

(declare-fun lt!574237 () Bool)

(assert (=> d!139353 (= res!843391 (not lt!574237))))

(declare-fun lt!574239 () Bool)

(assert (=> d!139353 (= lt!574237 lt!574239)))

(declare-datatypes ((Unit!42202 0))(
  ( (Unit!42203) )
))
(declare-fun lt!574238 () Unit!42202)

(declare-fun e!721679 () Unit!42202)

(assert (=> d!139353 (= lt!574238 e!721679)))

(declare-fun c!123526 () Bool)

(assert (=> d!139353 (= c!123526 lt!574239)))

(assert (=> d!139353 (= lt!574239 (containsKey!668 (toList!9520 lm!209) a!499))))

(assert (=> d!139353 (= (contains!7656 lm!209 a!499) lt!574237)))

(declare-fun b!1266923 () Bool)

(declare-fun lt!574236 () Unit!42202)

(assert (=> b!1266923 (= e!721679 lt!574236)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!450 (List!28340 (_ BitVec 64)) Unit!42202)

(assert (=> b!1266923 (= lt!574236 (lemmaContainsKeyImpliesGetValueByKeyDefined!450 (toList!9520 lm!209) a!499))))

(declare-datatypes ((Option!734 0))(
  ( (Some!733 (v!19017 B!2026)) (None!732) )
))
(declare-fun isDefined!489 (Option!734) Bool)

(declare-fun getValueByKey!682 (List!28340 (_ BitVec 64)) Option!734)

(assert (=> b!1266923 (isDefined!489 (getValueByKey!682 (toList!9520 lm!209) a!499))))

(declare-fun b!1266924 () Bool)

(declare-fun Unit!42205 () Unit!42202)

(assert (=> b!1266924 (= e!721679 Unit!42205)))

(declare-fun b!1266925 () Bool)

(assert (=> b!1266925 (= e!721678 (isDefined!489 (getValueByKey!682 (toList!9520 lm!209) a!499)))))

(assert (= (and d!139353 c!123526) b!1266923))

(assert (= (and d!139353 (not c!123526)) b!1266924))

(assert (= (and d!139353 (not res!843391)) b!1266925))

(assert (=> d!139353 m!1166471))

(declare-fun m!1166501 () Bool)

(assert (=> b!1266923 m!1166501))

(declare-fun m!1166503 () Bool)

(assert (=> b!1266923 m!1166503))

(assert (=> b!1266923 m!1166503))

(declare-fun m!1166505 () Bool)

(assert (=> b!1266923 m!1166505))

(assert (=> b!1266925 m!1166503))

(assert (=> b!1266925 m!1166503))

(assert (=> b!1266925 m!1166505))

(assert (=> start!106638 d!139353))

(declare-fun d!139363 () Bool)

(assert (=> d!139363 (= (inv!44186 lm!209) (isStrictlySorted!809 (toList!9520 lm!209)))))

(declare-fun bs!35860 () Bool)

(assert (= bs!35860 d!139363))

(assert (=> bs!35860 m!1166469))

(assert (=> start!106638 d!139363))

(declare-fun b!1266946 () Bool)

(declare-fun e!721696 () Bool)

(declare-fun tp_is_empty!32545 () Bool)

(declare-fun tp!96499 () Bool)

(assert (=> b!1266946 (= e!721696 (and tp_is_empty!32545 tp!96499))))

(assert (=> b!1266865 (= tp!96491 e!721696)))

(assert (= (and b!1266865 ((_ is Cons!28336) (toList!9520 lm!209))) b!1266946))

(check-sat (not b!1266925) (not b!1266898) (not b!1266923) (not d!139353) (not d!139363) (not b!1266946) (not b!1266888) tp_is_empty!32545)
(check-sat)
