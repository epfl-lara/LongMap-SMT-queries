; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106636 () Bool)

(assert start!106636)

(declare-fun res!843346 () Bool)

(declare-fun e!721625 () Bool)

(assert (=> start!106636 (=> (not res!843346) (not e!721625))))

(declare-datatypes ((B!2024 0))(
  ( (B!2025 (val!16347 Int)) )
))
(declare-datatypes ((tuple2!21212 0))(
  ( (tuple2!21213 (_1!10617 (_ BitVec 64)) (_2!10617 B!2024)) )
))
(declare-datatypes ((List!28339 0))(
  ( (Nil!28336) (Cons!28335 (h!29544 tuple2!21212) (t!41866 List!28339)) )
))
(declare-datatypes ((ListLongMap!19007 0))(
  ( (ListLongMap!19008 (toList!9519 List!28339)) )
))
(declare-fun lm!209 () ListLongMap!19007)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7655 (ListLongMap!19007 (_ BitVec 64)) Bool)

(assert (=> start!106636 (= res!843346 (not (contains!7655 lm!209 a!499)))))

(assert (=> start!106636 e!721625))

(declare-fun e!721624 () Bool)

(declare-fun inv!44185 (ListLongMap!19007) Bool)

(assert (=> start!106636 (and (inv!44185 lm!209) e!721624)))

(assert (=> start!106636 true))

(declare-fun b!1266854 () Bool)

(declare-fun res!843345 () Bool)

(assert (=> b!1266854 (=> (not res!843345) (not e!721625))))

(declare-fun isStrictlySorted!808 (List!28339) Bool)

(assert (=> b!1266854 (= res!843345 (isStrictlySorted!808 (toList!9519 lm!209)))))

(declare-fun b!1266855 () Bool)

(declare-fun containsKey!667 (List!28339 (_ BitVec 64)) Bool)

(assert (=> b!1266855 (= e!721625 (containsKey!667 (toList!9519 lm!209) a!499))))

(declare-fun b!1266856 () Bool)

(declare-fun tp!96488 () Bool)

(assert (=> b!1266856 (= e!721624 tp!96488)))

(assert (= (and start!106636 res!843346) b!1266854))

(assert (= (and b!1266854 res!843345) b!1266855))

(assert (= start!106636 b!1266856))

(declare-fun m!1166457 () Bool)

(assert (=> start!106636 m!1166457))

(declare-fun m!1166459 () Bool)

(assert (=> start!106636 m!1166459))

(declare-fun m!1166461 () Bool)

(assert (=> b!1266854 m!1166461))

(declare-fun m!1166463 () Bool)

(assert (=> b!1266855 m!1166463))

(push 1)

(assert (not b!1266854))

(assert (not start!106636))

(assert (not b!1266855))

(assert (not b!1266856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139345 () Bool)

(declare-fun res!843373 () Bool)

(declare-fun e!721652 () Bool)

(assert (=> d!139345 (=> res!843373 e!721652)))

(assert (=> d!139345 (= res!843373 (or (is-Nil!28336 (toList!9519 lm!209)) (is-Nil!28336 (t!41866 (toList!9519 lm!209)))))))

(assert (=> d!139345 (= (isStrictlySorted!808 (toList!9519 lm!209)) e!721652)))

(declare-fun b!1266889 () Bool)

(declare-fun e!721653 () Bool)

(assert (=> b!1266889 (= e!721652 e!721653)))

(declare-fun res!843374 () Bool)

(assert (=> b!1266889 (=> (not res!843374) (not e!721653))))

(assert (=> b!1266889 (= res!843374 (bvslt (_1!10617 (h!29544 (toList!9519 lm!209))) (_1!10617 (h!29544 (t!41866 (toList!9519 lm!209))))))))

(declare-fun b!1266890 () Bool)

(assert (=> b!1266890 (= e!721653 (isStrictlySorted!808 (t!41866 (toList!9519 lm!209))))))

(assert (= (and d!139345 (not res!843373)) b!1266889))

(assert (= (and b!1266889 res!843374) b!1266890))

(declare-fun m!1166483 () Bool)

(assert (=> b!1266890 m!1166483))

(assert (=> b!1266854 d!139345))

(declare-fun d!139349 () Bool)

(declare-fun e!721670 () Bool)

(assert (=> d!139349 e!721670))

(declare-fun res!843387 () Bool)

(assert (=> d!139349 (=> res!843387 e!721670)))

(declare-fun lt!574222 () Bool)

(assert (=> d!139349 (= res!843387 (not lt!574222))))

(declare-fun lt!574221 () Bool)

(assert (=> d!139349 (= lt!574222 lt!574221)))

(declare-datatypes ((Unit!42198 0))(
  ( (Unit!42199) )
))
(declare-fun lt!574220 () Unit!42198)

(declare-fun e!721671 () Unit!42198)

(assert (=> d!139349 (= lt!574220 e!721671)))

(declare-fun c!123522 () Bool)

(assert (=> d!139349 (= c!123522 lt!574221)))

(assert (=> d!139349 (= lt!574221 (containsKey!667 (toList!9519 lm!209) a!499))))

(assert (=> d!139349 (= (contains!7655 lm!209 a!499) lt!574222)))

(declare-fun b!1266911 () Bool)

(declare-fun lt!574223 () Unit!42198)

(assert (=> b!1266911 (= e!721671 lt!574223)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!449 (List!28339 (_ BitVec 64)) Unit!42198)

(assert (=> b!1266911 (= lt!574223 (lemmaContainsKeyImpliesGetValueByKeyDefined!449 (toList!9519 lm!209) a!499))))

(declare-datatypes ((Option!733 0))(
  ( (Some!732 (v!19016 B!2024)) (None!731) )
))
(declare-fun isDefined!488 (Option!733) Bool)

(declare-fun getValueByKey!681 (List!28339 (_ BitVec 64)) Option!733)

(assert (=> b!1266911 (isDefined!488 (getValueByKey!681 (toList!9519 lm!209) a!499))))

(declare-fun b!1266912 () Bool)

(declare-fun Unit!42204 () Unit!42198)

(assert (=> b!1266912 (= e!721671 Unit!42204)))

(declare-fun b!1266913 () Bool)

(assert (=> b!1266913 (= e!721670 (isDefined!488 (getValueByKey!681 (toList!9519 lm!209) a!499)))))

(assert (= (and d!139349 c!123522) b!1266911))

(assert (= (and d!139349 (not c!123522)) b!1266912))

(assert (= (and d!139349 (not res!843387)) b!1266913))

(assert (=> d!139349 m!1166463))

(declare-fun m!1166489 () Bool)

(assert (=> b!1266911 m!1166489))

(declare-fun m!1166491 () Bool)

(assert (=> b!1266911 m!1166491))

(assert (=> b!1266911 m!1166491))

(declare-fun m!1166493 () Bool)

(assert (=> b!1266911 m!1166493))

(assert (=> b!1266913 m!1166491))

(assert (=> b!1266913 m!1166491))

(assert (=> b!1266913 m!1166493))

(assert (=> start!106636 d!139349))

(declare-fun d!139355 () Bool)

(assert (=> d!139355 (= (inv!44185 lm!209) (isStrictlySorted!808 (toList!9519 lm!209)))))

(declare-fun bs!35858 () Bool)

(assert (= bs!35858 d!139355))

(assert (=> bs!35858 m!1166461))

(assert (=> start!106636 d!139355))

(declare-fun d!139359 () Bool)

(declare-fun res!843402 () Bool)

(declare-fun e!721692 () Bool)

(assert (=> d!139359 (=> res!843402 e!721692)))

(assert (=> d!139359 (= res!843402 (and (is-Cons!28335 (toList!9519 lm!209)) (= (_1!10617 (h!29544 (toList!9519 lm!209))) a!499)))))

(assert (=> d!139359 (= (containsKey!667 (toList!9519 lm!209) a!499) e!721692)))

(declare-fun b!1266940 () Bool)

(declare-fun e!721693 () Bool)

(assert (=> b!1266940 (= e!721692 e!721693)))

(declare-fun res!843403 () Bool)

(assert (=> b!1266940 (=> (not res!843403) (not e!721693))))

(assert (=> b!1266940 (= res!843403 (and (or (not (is-Cons!28335 (toList!9519 lm!209))) (bvsle (_1!10617 (h!29544 (toList!9519 lm!209))) a!499)) (is-Cons!28335 (toList!9519 lm!209)) (bvslt (_1!10617 (h!29544 (toList!9519 lm!209))) a!499)))))

(declare-fun b!1266941 () Bool)

(assert (=> b!1266941 (= e!721693 (containsKey!667 (t!41866 (toList!9519 lm!209)) a!499))))

(assert (= (and d!139359 (not res!843402)) b!1266940))

(assert (= (and b!1266940 res!843403) b!1266941))

(declare-fun m!1166509 () Bool)

(assert (=> b!1266941 m!1166509))

(assert (=> b!1266855 d!139359))

(declare-fun b!1266952 () Bool)

(declare-fun e!721700 () Bool)

(declare-fun tp_is_empty!32549 () Bool)

(declare-fun tp!96503 () Bool)

(assert (=> b!1266952 (= e!721700 (and tp_is_empty!32549 tp!96503))))

(assert (=> b!1266856 (= tp!96488 e!721700)))

(assert (= (and b!1266856 (is-Cons!28335 (toList!9519 lm!209))) b!1266952))

(push 1)

