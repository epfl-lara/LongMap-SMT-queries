; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106670 () Bool)

(assert start!106670)

(declare-fun b!1266988 () Bool)

(declare-fun e!721718 () Bool)

(declare-fun tp!96512 () Bool)

(assert (=> b!1266988 (= e!721718 tp!96512)))

(declare-fun b!1266986 () Bool)

(declare-fun res!843428 () Bool)

(declare-fun e!721717 () Bool)

(assert (=> b!1266986 (=> (not res!843428) (not e!721717))))

(declare-datatypes ((B!2034 0))(
  ( (B!2035 (val!16352 Int)) )
))
(declare-datatypes ((tuple2!21222 0))(
  ( (tuple2!21223 (_1!10622 (_ BitVec 64)) (_2!10622 B!2034)) )
))
(declare-datatypes ((List!28344 0))(
  ( (Nil!28341) (Cons!28340 (h!29549 tuple2!21222) (t!41871 List!28344)) )
))
(declare-datatypes ((ListLongMap!19017 0))(
  ( (ListLongMap!19018 (toList!9524 List!28344)) )
))
(declare-fun lm!209 () ListLongMap!19017)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun containsKey!672 (List!28344 (_ BitVec 64)) Bool)

(assert (=> b!1266986 (= res!843428 (not (containsKey!672 (toList!9524 lm!209) a!499)))))

(declare-fun b!1266985 () Bool)

(declare-fun res!843430 () Bool)

(assert (=> b!1266985 (=> (not res!843430) (not e!721717))))

(declare-fun isStrictlySorted!813 (List!28344) Bool)

(assert (=> b!1266985 (= res!843430 (isStrictlySorted!813 (toList!9524 lm!209)))))

(declare-fun res!843429 () Bool)

(assert (=> start!106670 (=> (not res!843429) (not e!721717))))

(declare-fun contains!7660 (ListLongMap!19017 (_ BitVec 64)) Bool)

(assert (=> start!106670 (= res!843429 (not (contains!7660 lm!209 a!499)))))

(assert (=> start!106670 e!721717))

(declare-fun inv!44195 (ListLongMap!19017) Bool)

(assert (=> start!106670 (and (inv!44195 lm!209) e!721718)))

(assert (=> start!106670 true))

(declare-fun b!1266987 () Bool)

(declare-fun -!2157 (ListLongMap!19017 (_ BitVec 64)) ListLongMap!19017)

(assert (=> b!1266987 (= e!721717 (not (= (-!2157 lm!209 a!499) lm!209)))))

(declare-fun removeStrictlySorted!163 (List!28344 (_ BitVec 64)) List!28344)

(assert (=> b!1266987 (= (removeStrictlySorted!163 (toList!9524 lm!209) a!499) (toList!9524 lm!209))))

(declare-datatypes ((Unit!42211 0))(
  ( (Unit!42212) )
))
(declare-fun lt!574248 () Unit!42211)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!3 (List!28344 (_ BitVec 64)) Unit!42211)

(assert (=> b!1266987 (= lt!574248 (lemmaRemoveStrictlySortedNotPresentPreserves!3 (toList!9524 lm!209) a!499))))

(assert (= (and start!106670 res!843429) b!1266985))

(assert (= (and b!1266985 res!843430) b!1266986))

(assert (= (and b!1266986 res!843428) b!1266987))

(assert (= start!106670 b!1266988))

(declare-fun m!1166539 () Bool)

(assert (=> b!1266986 m!1166539))

(declare-fun m!1166541 () Bool)

(assert (=> b!1266985 m!1166541))

(declare-fun m!1166543 () Bool)

(assert (=> start!106670 m!1166543))

(declare-fun m!1166545 () Bool)

(assert (=> start!106670 m!1166545))

(declare-fun m!1166547 () Bool)

(assert (=> b!1266987 m!1166547))

(declare-fun m!1166549 () Bool)

(assert (=> b!1266987 m!1166549))

(declare-fun m!1166551 () Bool)

(assert (=> b!1266987 m!1166551))

(push 1)

(assert (not b!1266986))

(assert (not b!1266987))

(assert (not b!1266985))

(assert (not start!106670))

(assert (not b!1266988))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139369 () Bool)

(declare-fun e!721742 () Bool)

(assert (=> d!139369 e!721742))

(declare-fun res!843451 () Bool)

(assert (=> d!139369 (=> res!843451 e!721742)))

(declare-fun lt!574259 () Bool)

(assert (=> d!139369 (= res!843451 (not lt!574259))))

(declare-fun lt!574257 () Bool)

(assert (=> d!139369 (= lt!574259 lt!574257)))

(declare-fun lt!574258 () Unit!42211)

(declare-fun e!721741 () Unit!42211)

(assert (=> d!139369 (= lt!574258 e!721741)))

(declare-fun c!123529 () Bool)

(assert (=> d!139369 (= c!123529 lt!574257)))

(assert (=> d!139369 (= lt!574257 (containsKey!672 (toList!9524 lm!209) a!499))))

(assert (=> d!139369 (= (contains!7660 lm!209 a!499) lt!574259)))

(declare-fun b!1267013 () Bool)

(declare-fun lt!574260 () Unit!42211)

(assert (=> b!1267013 (= e!721741 lt!574260)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!452 (List!28344 (_ BitVec 64)) Unit!42211)

(assert (=> b!1267013 (= lt!574260 (lemmaContainsKeyImpliesGetValueByKeyDefined!452 (toList!9524 lm!209) a!499))))

(declare-datatypes ((Option!736 0))(
  ( (Some!735 (v!19019 B!2034)) (None!734) )
))
(declare-fun isDefined!491 (Option!736) Bool)

(declare-fun getValueByKey!684 (List!28344 (_ BitVec 64)) Option!736)

(assert (=> b!1267013 (isDefined!491 (getValueByKey!684 (toList!9524 lm!209) a!499))))

(declare-fun b!1267014 () Bool)

(declare-fun Unit!42213 () Unit!42211)

(assert (=> b!1267014 (= e!721741 Unit!42213)))

(declare-fun b!1267015 () Bool)

(assert (=> b!1267015 (= e!721742 (isDefined!491 (getValueByKey!684 (toList!9524 lm!209) a!499)))))

(assert (= (and d!139369 c!123529) b!1267013))

(assert (= (and d!139369 (not c!123529)) b!1267014))

(assert (= (and d!139369 (not res!843451)) b!1267015))

(assert (=> d!139369 m!1166539))

(declare-fun m!1166559 () Bool)

(assert (=> b!1267013 m!1166559))

(declare-fun m!1166561 () Bool)

(assert (=> b!1267013 m!1166561))

(assert (=> b!1267013 m!1166561))

(declare-fun m!1166563 () Bool)

(assert (=> b!1267013 m!1166563))

(assert (=> b!1267015 m!1166561))

(assert (=> b!1267015 m!1166561))

(assert (=> b!1267015 m!1166563))

(assert (=> start!106670 d!139369))

(declare-fun d!139379 () Bool)

(assert (=> d!139379 (= (inv!44195 lm!209) (isStrictlySorted!813 (toList!9524 lm!209)))))

(declare-fun bs!35864 () Bool)

(assert (= bs!35864 d!139379))

(assert (=> bs!35864 m!1166541))

(assert (=> start!106670 d!139379))

(declare-fun d!139381 () Bool)

(declare-fun lt!574275 () ListLongMap!19017)

(assert (=> d!139381 (not (contains!7660 lt!574275 a!499))))

(assert (=> d!139381 (= lt!574275 (ListLongMap!19018 (removeStrictlySorted!163 (toList!9524 lm!209) a!499)))))

(assert (=> d!139381 (= (-!2157 lm!209 a!499) lt!574275)))

(declare-fun bs!35865 () Bool)

(assert (= bs!35865 d!139381))

(declare-fun m!1166571 () Bool)

(assert (=> bs!35865 m!1166571))

(assert (=> bs!35865 m!1166549))

(assert (=> b!1266987 d!139381))

(declare-fun b!1267044 () Bool)

(declare-fun e!721763 () List!28344)

(assert (=> b!1267044 (= e!721763 Nil!28341)))

(declare-fun b!1267045 () Bool)

(declare-fun e!721762 () List!28344)

(assert (=> b!1267045 (= e!721762 (t!41871 (toList!9524 lm!209)))))

(declare-fun b!1267046 () Bool)

(declare-fun $colon$colon!647 (List!28344 tuple2!21222) List!28344)

(assert (=> b!1267046 (= e!721763 ($colon$colon!647 (removeStrictlySorted!163 (t!41871 (toList!9524 lm!209)) a!499) (h!29549 (toList!9524 lm!209))))))

(declare-fun b!1267047 () Bool)

(declare-fun e!721761 () Bool)

(declare-fun lt!574296 () List!28344)

(assert (=> b!1267047 (= e!721761 (not (containsKey!672 lt!574296 a!499)))))

(declare-fun d!139385 () Bool)

(assert (=> d!139385 e!721761))

(declare-fun res!843460 () Bool)

(assert (=> d!139385 (=> (not res!843460) (not e!721761))))

(assert (=> d!139385 (= res!843460 (isStrictlySorted!813 lt!574296))))

(assert (=> d!139385 (= lt!574296 e!721762)))

(declare-fun c!123541 () Bool)

(assert (=> d!139385 (= c!123541 (and (is-Cons!28340 (toList!9524 lm!209)) (= (_1!10622 (h!29549 (toList!9524 lm!209))) a!499)))))

(assert (=> d!139385 (isStrictlySorted!813 (toList!9524 lm!209))))

(assert (=> d!139385 (= (removeStrictlySorted!163 (toList!9524 lm!209) a!499) lt!574296)))

(declare-fun b!1267048 () Bool)

(assert (=> b!1267048 (= e!721762 e!721763)))

(declare-fun c!123540 () Bool)

(assert (=> b!1267048 (= c!123540 (and (is-Cons!28340 (toList!9524 lm!209)) (not (= (_1!10622 (h!29549 (toList!9524 lm!209))) a!499))))))

(assert (= (and d!139385 c!123541) b!1267045))

(assert (= (and d!139385 (not c!123541)) b!1267048))

(assert (= (and b!1267048 c!123540) b!1267046))

(assert (= (and b!1267048 (not c!123540)) b!1267044))

(assert (= (and d!139385 res!843460) b!1267047))

(declare-fun m!1166583 () Bool)

(assert (=> b!1267046 m!1166583))

(assert (=> b!1267046 m!1166583))

(declare-fun m!1166585 () Bool)

(assert (=> b!1267046 m!1166585))

(declare-fun m!1166587 () Bool)

(assert (=> b!1267047 m!1166587))

(declare-fun m!1166589 () Bool)

(assert (=> d!139385 m!1166589))

(assert (=> d!139385 m!1166541))

(assert (=> b!1266987 d!139385))

(declare-fun d!139397 () Bool)

(assert (=> d!139397 (= (removeStrictlySorted!163 (toList!9524 lm!209) a!499) (toList!9524 lm!209))))

(declare-fun lt!574301 () Unit!42211)

(declare-fun choose!1890 (List!28344 (_ BitVec 64)) Unit!42211)

(assert (=> d!139397 (= lt!574301 (choose!1890 (toList!9524 lm!209) a!499))))

(assert (=> d!139397 (isStrictlySorted!813 (toList!9524 lm!209))))

(assert (=> d!139397 (= (lemmaRemoveStrictlySortedNotPresentPreserves!3 (toList!9524 lm!209) a!499) lt!574301)))

(declare-fun bs!35870 () Bool)

(assert (= bs!35870 d!139397))

(assert (=> bs!35870 m!1166549))

(declare-fun m!1166591 () Bool)

(assert (=> bs!35870 m!1166591))

(assert (=> bs!35870 m!1166541))

(assert (=> b!1266987 d!139397))

(declare-fun d!139399 () Bool)

(declare-fun res!843470 () Bool)

(declare-fun e!721783 () Bool)

(assert (=> d!139399 (=> res!843470 e!721783)))

(assert (=> d!139399 (= res!843470 (or (is-Nil!28341 (toList!9524 lm!209)) (is-Nil!28341 (t!41871 (toList!9524 lm!209)))))))

(assert (=> d!139399 (= (isStrictlySorted!813 (toList!9524 lm!209)) e!721783)))

(declare-fun b!1267078 () Bool)

(declare-fun e!721784 () Bool)

(assert (=> b!1267078 (= e!721783 e!721784)))

(declare-fun res!843471 () Bool)

(assert (=> b!1267078 (=> (not res!843471) (not e!721784))))

(assert (=> b!1267078 (= res!843471 (bvslt (_1!10622 (h!29549 (toList!9524 lm!209))) (_1!10622 (h!29549 (t!41871 (toList!9524 lm!209))))))))

(declare-fun b!1267079 () Bool)

(assert (=> b!1267079 (= e!721784 (isStrictlySorted!813 (t!41871 (toList!9524 lm!209))))))

(assert (= (and d!139399 (not res!843470)) b!1267078))

(assert (= (and b!1267078 res!843471) b!1267079))

(declare-fun m!1166601 () Bool)

(assert (=> b!1267079 m!1166601))

(assert (=> b!1266985 d!139399))

(declare-fun d!139403 () Bool)

(declare-fun res!843483 () Bool)

(declare-fun e!721798 () Bool)

(assert (=> d!139403 (=> res!843483 e!721798)))

(assert (=> d!139403 (= res!843483 (and (is-Cons!28340 (toList!9524 lm!209)) (= (_1!10622 (h!29549 (toList!9524 lm!209))) a!499)))))

(assert (=> d!139403 (= (containsKey!672 (toList!9524 lm!209) a!499) e!721798)))

(declare-fun b!1267095 () Bool)

(declare-fun e!721799 () Bool)

(assert (=> b!1267095 (= e!721798 e!721799)))

(declare-fun res!843484 () Bool)

(assert (=> b!1267095 (=> (not res!843484) (not e!721799))))

(assert (=> b!1267095 (= res!843484 (and (or (not (is-Cons!28340 (toList!9524 lm!209))) (bvsle (_1!10622 (h!29549 (toList!9524 lm!209))) a!499)) (is-Cons!28340 (toList!9524 lm!209)) (bvslt (_1!10622 (h!29549 (toList!9524 lm!209))) a!499)))))

(declare-fun b!1267096 () Bool)

(assert (=> b!1267096 (= e!721799 (containsKey!672 (t!41871 (toList!9524 lm!209)) a!499))))

