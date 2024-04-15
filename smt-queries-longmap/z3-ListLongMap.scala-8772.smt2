; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106632 () Bool)

(assert start!106632)

(declare-fun res!843305 () Bool)

(declare-fun e!721579 () Bool)

(assert (=> start!106632 (=> (not res!843305) (not e!721579))))

(declare-datatypes ((B!2024 0))(
  ( (B!2025 (val!16347 Int)) )
))
(declare-datatypes ((tuple2!21294 0))(
  ( (tuple2!21295 (_1!10658 (_ BitVec 64)) (_2!10658 B!2024)) )
))
(declare-datatypes ((List!28423 0))(
  ( (Nil!28420) (Cons!28419 (h!29628 tuple2!21294) (t!41941 List!28423)) )
))
(declare-datatypes ((ListLongMap!19089 0))(
  ( (ListLongMap!19090 (toList!9560 List!28423)) )
))
(declare-fun lm!209 () ListLongMap!19089)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7624 (ListLongMap!19089 (_ BitVec 64)) Bool)

(assert (=> start!106632 (= res!843305 (not (contains!7624 lm!209 a!499)))))

(assert (=> start!106632 e!721579))

(declare-fun e!721580 () Bool)

(declare-fun inv!44185 (ListLongMap!19089) Bool)

(assert (=> start!106632 (and (inv!44185 lm!209) e!721580)))

(assert (=> start!106632 true))

(declare-fun b!1266772 () Bool)

(declare-fun res!843306 () Bool)

(assert (=> b!1266772 (=> (not res!843306) (not e!721579))))

(declare-fun isStrictlySorted!804 (List!28423) Bool)

(assert (=> b!1266772 (= res!843306 (isStrictlySorted!804 (toList!9560 lm!209)))))

(declare-fun b!1266773 () Bool)

(declare-fun containsKey!665 (List!28423 (_ BitVec 64)) Bool)

(assert (=> b!1266773 (= e!721579 (containsKey!665 (toList!9560 lm!209) a!499))))

(declare-fun b!1266774 () Bool)

(declare-fun tp!96488 () Bool)

(assert (=> b!1266774 (= e!721580 tp!96488)))

(assert (= (and start!106632 res!843305) b!1266772))

(assert (= (and b!1266772 res!843306) b!1266773))

(assert (= start!106632 b!1266774))

(declare-fun m!1165937 () Bool)

(assert (=> start!106632 m!1165937))

(declare-fun m!1165939 () Bool)

(assert (=> start!106632 m!1165939))

(declare-fun m!1165941 () Bool)

(assert (=> b!1266772 m!1165941))

(declare-fun m!1165943 () Bool)

(assert (=> b!1266773 m!1165943))

(check-sat (not start!106632) (not b!1266772) (not b!1266773) (not b!1266774))
(check-sat)
(get-model)

(declare-fun d!139209 () Bool)

(declare-fun e!721607 () Bool)

(assert (=> d!139209 e!721607))

(declare-fun res!843329 () Bool)

(assert (=> d!139209 (=> res!843329 e!721607)))

(declare-fun lt!574044 () Bool)

(assert (=> d!139209 (= res!843329 (not lt!574044))))

(declare-fun lt!574041 () Bool)

(assert (=> d!139209 (= lt!574044 lt!574041)))

(declare-datatypes ((Unit!42048 0))(
  ( (Unit!42049) )
))
(declare-fun lt!574042 () Unit!42048)

(declare-fun e!721608 () Unit!42048)

(assert (=> d!139209 (= lt!574042 e!721608)))

(declare-fun c!123504 () Bool)

(assert (=> d!139209 (= c!123504 lt!574041)))

(assert (=> d!139209 (= lt!574041 (containsKey!665 (toList!9560 lm!209) a!499))))

(assert (=> d!139209 (= (contains!7624 lm!209 a!499) lt!574044)))

(declare-fun b!1266811 () Bool)

(declare-fun lt!574043 () Unit!42048)

(assert (=> b!1266811 (= e!721608 lt!574043)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!448 (List!28423 (_ BitVec 64)) Unit!42048)

(assert (=> b!1266811 (= lt!574043 (lemmaContainsKeyImpliesGetValueByKeyDefined!448 (toList!9560 lm!209) a!499))))

(declare-datatypes ((Option!735 0))(
  ( (Some!734 (v!19015 B!2024)) (None!733) )
))
(declare-fun isDefined!491 (Option!735) Bool)

(declare-fun getValueByKey!684 (List!28423 (_ BitVec 64)) Option!735)

(assert (=> b!1266811 (isDefined!491 (getValueByKey!684 (toList!9560 lm!209) a!499))))

(declare-fun b!1266812 () Bool)

(declare-fun Unit!42052 () Unit!42048)

(assert (=> b!1266812 (= e!721608 Unit!42052)))

(declare-fun b!1266813 () Bool)

(assert (=> b!1266813 (= e!721607 (isDefined!491 (getValueByKey!684 (toList!9560 lm!209) a!499)))))

(assert (= (and d!139209 c!123504) b!1266811))

(assert (= (and d!139209 (not c!123504)) b!1266812))

(assert (= (and d!139209 (not res!843329)) b!1266813))

(assert (=> d!139209 m!1165943))

(declare-fun m!1165963 () Bool)

(assert (=> b!1266811 m!1165963))

(declare-fun m!1165965 () Bool)

(assert (=> b!1266811 m!1165965))

(assert (=> b!1266811 m!1165965))

(declare-fun m!1165967 () Bool)

(assert (=> b!1266811 m!1165967))

(assert (=> b!1266813 m!1165965))

(assert (=> b!1266813 m!1165965))

(assert (=> b!1266813 m!1165967))

(assert (=> start!106632 d!139209))

(declare-fun d!139217 () Bool)

(assert (=> d!139217 (= (inv!44185 lm!209) (isStrictlySorted!804 (toList!9560 lm!209)))))

(declare-fun bs!35830 () Bool)

(assert (= bs!35830 d!139217))

(assert (=> bs!35830 m!1165941))

(assert (=> start!106632 d!139217))

(declare-fun d!139221 () Bool)

(declare-fun res!843342 () Bool)

(declare-fun e!721625 () Bool)

(assert (=> d!139221 (=> res!843342 e!721625)))

(get-info :version)

(assert (=> d!139221 (= res!843342 (or ((_ is Nil!28420) (toList!9560 lm!209)) ((_ is Nil!28420) (t!41941 (toList!9560 lm!209)))))))

(assert (=> d!139221 (= (isStrictlySorted!804 (toList!9560 lm!209)) e!721625)))

(declare-fun b!1266834 () Bool)

(declare-fun e!721626 () Bool)

(assert (=> b!1266834 (= e!721625 e!721626)))

(declare-fun res!843343 () Bool)

(assert (=> b!1266834 (=> (not res!843343) (not e!721626))))

(assert (=> b!1266834 (= res!843343 (bvslt (_1!10658 (h!29628 (toList!9560 lm!209))) (_1!10658 (h!29628 (t!41941 (toList!9560 lm!209))))))))

(declare-fun b!1266835 () Bool)

(assert (=> b!1266835 (= e!721626 (isStrictlySorted!804 (t!41941 (toList!9560 lm!209))))))

(assert (= (and d!139221 (not res!843342)) b!1266834))

(assert (= (and b!1266834 res!843343) b!1266835))

(declare-fun m!1165981 () Bool)

(assert (=> b!1266835 m!1165981))

(assert (=> b!1266772 d!139221))

(declare-fun d!139227 () Bool)

(declare-fun res!843358 () Bool)

(declare-fun e!721641 () Bool)

(assert (=> d!139227 (=> res!843358 e!721641)))

(assert (=> d!139227 (= res!843358 (and ((_ is Cons!28419) (toList!9560 lm!209)) (= (_1!10658 (h!29628 (toList!9560 lm!209))) a!499)))))

(assert (=> d!139227 (= (containsKey!665 (toList!9560 lm!209) a!499) e!721641)))

(declare-fun b!1266850 () Bool)

(declare-fun e!721642 () Bool)

(assert (=> b!1266850 (= e!721641 e!721642)))

(declare-fun res!843359 () Bool)

(assert (=> b!1266850 (=> (not res!843359) (not e!721642))))

(assert (=> b!1266850 (= res!843359 (and (or (not ((_ is Cons!28419) (toList!9560 lm!209))) (bvsle (_1!10658 (h!29628 (toList!9560 lm!209))) a!499)) ((_ is Cons!28419) (toList!9560 lm!209)) (bvslt (_1!10658 (h!29628 (toList!9560 lm!209))) a!499)))))

(declare-fun b!1266851 () Bool)

(assert (=> b!1266851 (= e!721642 (containsKey!665 (t!41941 (toList!9560 lm!209)) a!499))))

(assert (= (and d!139227 (not res!843358)) b!1266850))

(assert (= (and b!1266850 res!843359) b!1266851))

(declare-fun m!1165985 () Bool)

(assert (=> b!1266851 m!1165985))

(assert (=> b!1266773 d!139227))

(declare-fun b!1266864 () Bool)

(declare-fun e!721651 () Bool)

(declare-fun tp_is_empty!32545 () Bool)

(declare-fun tp!96499 () Bool)

(assert (=> b!1266864 (= e!721651 (and tp_is_empty!32545 tp!96499))))

(assert (=> b!1266774 (= tp!96488 e!721651)))

(assert (= (and b!1266774 ((_ is Cons!28419) (toList!9560 lm!209))) b!1266864))

(check-sat (not b!1266864) (not d!139217) (not b!1266851) (not b!1266813) tp_is_empty!32545 (not d!139209) (not b!1266835) (not b!1266811))
(check-sat)
