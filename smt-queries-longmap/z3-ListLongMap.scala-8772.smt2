; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106860 () Bool)

(assert start!106860)

(declare-fun res!843866 () Bool)

(declare-fun e!722472 () Bool)

(assert (=> start!106860 (=> (not res!843866) (not e!722472))))

(declare-datatypes ((B!2024 0))(
  ( (B!2025 (val!16347 Int)) )
))
(declare-datatypes ((tuple2!21222 0))(
  ( (tuple2!21223 (_1!10622 (_ BitVec 64)) (_2!10622 B!2024)) )
))
(declare-datatypes ((List!28375 0))(
  ( (Nil!28372) (Cons!28371 (h!29589 tuple2!21222) (t!41894 List!28375)) )
))
(declare-datatypes ((ListLongMap!19025 0))(
  ( (ListLongMap!19026 (toList!9528 List!28375)) )
))
(declare-fun lm!209 () ListLongMap!19025)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7680 (ListLongMap!19025 (_ BitVec 64)) Bool)

(assert (=> start!106860 (= res!843866 (not (contains!7680 lm!209 a!499)))))

(assert (=> start!106860 e!722472))

(declare-fun e!722471 () Bool)

(declare-fun inv!44185 (ListLongMap!19025) Bool)

(assert (=> start!106860 (and (inv!44185 lm!209) e!722471)))

(assert (=> start!106860 true))

(declare-fun b!1268159 () Bool)

(declare-fun res!843865 () Bool)

(assert (=> b!1268159 (=> (not res!843865) (not e!722472))))

(declare-fun isStrictlySorted!796 (List!28375) Bool)

(assert (=> b!1268159 (= res!843865 (isStrictlySorted!796 (toList!9528 lm!209)))))

(declare-fun b!1268160 () Bool)

(declare-fun containsKey!667 (List!28375 (_ BitVec 64)) Bool)

(assert (=> b!1268160 (= e!722472 (containsKey!667 (toList!9528 lm!209) a!499))))

(declare-fun b!1268161 () Bool)

(declare-fun tp!96488 () Bool)

(assert (=> b!1268161 (= e!722471 tp!96488)))

(assert (= (and start!106860 res!843866) b!1268159))

(assert (= (and b!1268159 res!843865) b!1268160))

(assert (= start!106860 b!1268161))

(declare-fun m!1168069 () Bool)

(assert (=> start!106860 m!1168069))

(declare-fun m!1168071 () Bool)

(assert (=> start!106860 m!1168071))

(declare-fun m!1168073 () Bool)

(assert (=> b!1268159 m!1168073))

(declare-fun m!1168075 () Bool)

(assert (=> b!1268160 m!1168075))

(check-sat (not b!1268160) (not b!1268159) (not start!106860) (not b!1268161))
(check-sat)
(get-model)

(declare-fun d!139789 () Bool)

(declare-fun res!843891 () Bool)

(declare-fun e!722497 () Bool)

(assert (=> d!139789 (=> res!843891 e!722497)))

(get-info :version)

(assert (=> d!139789 (= res!843891 (and ((_ is Cons!28371) (toList!9528 lm!209)) (= (_1!10622 (h!29589 (toList!9528 lm!209))) a!499)))))

(assert (=> d!139789 (= (containsKey!667 (toList!9528 lm!209) a!499) e!722497)))

(declare-fun b!1268192 () Bool)

(declare-fun e!722498 () Bool)

(assert (=> b!1268192 (= e!722497 e!722498)))

(declare-fun res!843892 () Bool)

(assert (=> b!1268192 (=> (not res!843892) (not e!722498))))

(assert (=> b!1268192 (= res!843892 (and (or (not ((_ is Cons!28371) (toList!9528 lm!209))) (bvsle (_1!10622 (h!29589 (toList!9528 lm!209))) a!499)) ((_ is Cons!28371) (toList!9528 lm!209)) (bvslt (_1!10622 (h!29589 (toList!9528 lm!209))) a!499)))))

(declare-fun b!1268193 () Bool)

(assert (=> b!1268193 (= e!722498 (containsKey!667 (t!41894 (toList!9528 lm!209)) a!499))))

(assert (= (and d!139789 (not res!843891)) b!1268192))

(assert (= (and b!1268192 res!843892) b!1268193))

(declare-fun m!1168093 () Bool)

(assert (=> b!1268193 m!1168093))

(assert (=> b!1268160 d!139789))

(declare-fun d!139795 () Bool)

(declare-fun res!843907 () Bool)

(declare-fun e!722513 () Bool)

(assert (=> d!139795 (=> res!843907 e!722513)))

(assert (=> d!139795 (= res!843907 (or ((_ is Nil!28372) (toList!9528 lm!209)) ((_ is Nil!28372) (t!41894 (toList!9528 lm!209)))))))

(assert (=> d!139795 (= (isStrictlySorted!796 (toList!9528 lm!209)) e!722513)))

(declare-fun b!1268208 () Bool)

(declare-fun e!722514 () Bool)

(assert (=> b!1268208 (= e!722513 e!722514)))

(declare-fun res!843908 () Bool)

(assert (=> b!1268208 (=> (not res!843908) (not e!722514))))

(assert (=> b!1268208 (= res!843908 (bvslt (_1!10622 (h!29589 (toList!9528 lm!209))) (_1!10622 (h!29589 (t!41894 (toList!9528 lm!209))))))))

(declare-fun b!1268209 () Bool)

(assert (=> b!1268209 (= e!722514 (isStrictlySorted!796 (t!41894 (toList!9528 lm!209))))))

(assert (= (and d!139795 (not res!843907)) b!1268208))

(assert (= (and b!1268208 res!843908) b!1268209))

(declare-fun m!1168099 () Bool)

(assert (=> b!1268209 m!1168099))

(assert (=> b!1268159 d!139795))

(declare-fun d!139801 () Bool)

(declare-fun e!722534 () Bool)

(assert (=> d!139801 e!722534))

(declare-fun res!843921 () Bool)

(assert (=> d!139801 (=> res!843921 e!722534)))

(declare-fun lt!574715 () Bool)

(assert (=> d!139801 (= res!843921 (not lt!574715))))

(declare-fun lt!574714 () Bool)

(assert (=> d!139801 (= lt!574715 lt!574714)))

(declare-datatypes ((Unit!42172 0))(
  ( (Unit!42173) )
))
(declare-fun lt!574712 () Unit!42172)

(declare-fun e!722533 () Unit!42172)

(assert (=> d!139801 (= lt!574712 e!722533)))

(declare-fun c!123924 () Bool)

(assert (=> d!139801 (= c!123924 lt!574714)))

(assert (=> d!139801 (= lt!574714 (containsKey!667 (toList!9528 lm!209) a!499))))

(assert (=> d!139801 (= (contains!7680 lm!209 a!499) lt!574715)))

(declare-fun b!1268234 () Bool)

(declare-fun lt!574713 () Unit!42172)

(assert (=> b!1268234 (= e!722533 lt!574713)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!449 (List!28375 (_ BitVec 64)) Unit!42172)

(assert (=> b!1268234 (= lt!574713 (lemmaContainsKeyImpliesGetValueByKeyDefined!449 (toList!9528 lm!209) a!499))))

(declare-datatypes ((Option!729 0))(
  ( (Some!728 (v!19012 B!2024)) (None!727) )
))
(declare-fun isDefined!487 (Option!729) Bool)

(declare-fun getValueByKey!678 (List!28375 (_ BitVec 64)) Option!729)

(assert (=> b!1268234 (isDefined!487 (getValueByKey!678 (toList!9528 lm!209) a!499))))

(declare-fun b!1268235 () Bool)

(declare-fun Unit!42174 () Unit!42172)

(assert (=> b!1268235 (= e!722533 Unit!42174)))

(declare-fun b!1268236 () Bool)

(assert (=> b!1268236 (= e!722534 (isDefined!487 (getValueByKey!678 (toList!9528 lm!209) a!499)))))

(assert (= (and d!139801 c!123924) b!1268234))

(assert (= (and d!139801 (not c!123924)) b!1268235))

(assert (= (and d!139801 (not res!843921)) b!1268236))

(assert (=> d!139801 m!1168075))

(declare-fun m!1168105 () Bool)

(assert (=> b!1268234 m!1168105))

(declare-fun m!1168107 () Bool)

(assert (=> b!1268234 m!1168107))

(assert (=> b!1268234 m!1168107))

(declare-fun m!1168109 () Bool)

(assert (=> b!1268234 m!1168109))

(assert (=> b!1268236 m!1168107))

(assert (=> b!1268236 m!1168107))

(assert (=> b!1268236 m!1168109))

(assert (=> start!106860 d!139801))

(declare-fun d!139807 () Bool)

(assert (=> d!139807 (= (inv!44185 lm!209) (isStrictlySorted!796 (toList!9528 lm!209)))))

(declare-fun bs!35874 () Bool)

(assert (= bs!35874 d!139807))

(assert (=> bs!35874 m!1168073))

(assert (=> start!106860 d!139807))

(declare-fun b!1268247 () Bool)

(declare-fun e!722541 () Bool)

(declare-fun tp_is_empty!32545 () Bool)

(declare-fun tp!96497 () Bool)

(assert (=> b!1268247 (= e!722541 (and tp_is_empty!32545 tp!96497))))

(assert (=> b!1268161 (= tp!96488 e!722541)))

(assert (= (and b!1268161 ((_ is Cons!28371) (toList!9528 lm!209))) b!1268247))

(check-sat (not d!139801) (not b!1268234) tp_is_empty!32545 (not b!1268209) (not d!139807) (not b!1268247) (not b!1268193) (not b!1268236))
(check-sat)
