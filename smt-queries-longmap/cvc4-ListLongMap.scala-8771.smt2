; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106616 () Bool)

(assert start!106616)

(declare-fun res!843313 () Bool)

(declare-fun e!721573 () Bool)

(assert (=> start!106616 (=> (not res!843313) (not e!721573))))

(declare-datatypes ((B!2022 0))(
  ( (B!2023 (val!16346 Int)) )
))
(declare-datatypes ((tuple2!21210 0))(
  ( (tuple2!21211 (_1!10616 (_ BitVec 64)) (_2!10616 B!2022)) )
))
(declare-datatypes ((List!28338 0))(
  ( (Nil!28335) (Cons!28334 (h!29543 tuple2!21210) (t!41865 List!28338)) )
))
(declare-datatypes ((ListLongMap!19005 0))(
  ( (ListLongMap!19006 (toList!9518 List!28338)) )
))
(declare-fun lm!209 () ListLongMap!19005)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7654 (ListLongMap!19005 (_ BitVec 64)) Bool)

(assert (=> start!106616 (= res!843313 (not (contains!7654 lm!209 a!499)))))

(assert (=> start!106616 e!721573))

(declare-fun e!721574 () Bool)

(declare-fun inv!44179 (ListLongMap!19005) Bool)

(assert (=> start!106616 (and (inv!44179 lm!209) e!721574)))

(assert (=> start!106616 true))

(declare-fun b!1266786 () Bool)

(declare-fun isStrictlySorted!807 (List!28338) Bool)

(assert (=> b!1266786 (= e!721573 (not (isStrictlySorted!807 (toList!9518 lm!209))))))

(declare-fun b!1266787 () Bool)

(declare-fun tp!96476 () Bool)

(assert (=> b!1266787 (= e!721574 tp!96476)))

(assert (= (and start!106616 res!843313) b!1266786))

(assert (= start!106616 b!1266787))

(declare-fun m!1166421 () Bool)

(assert (=> start!106616 m!1166421))

(declare-fun m!1166423 () Bool)

(assert (=> start!106616 m!1166423))

(declare-fun m!1166425 () Bool)

(assert (=> b!1266786 m!1166425))

(push 1)

(assert (not start!106616))

(assert (not b!1266786))

(assert (not b!1266787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139325 () Bool)

(declare-fun e!721596 () Bool)

(assert (=> d!139325 e!721596))

(declare-fun res!843330 () Bool)

(assert (=> d!139325 (=> res!843330 e!721596)))

(declare-fun lt!574184 () Bool)

(assert (=> d!139325 (= res!843330 (not lt!574184))))

(declare-fun lt!574186 () Bool)

(assert (=> d!139325 (= lt!574184 lt!574186)))

(declare-datatypes ((Unit!42189 0))(
  ( (Unit!42190) )
))
(declare-fun lt!574185 () Unit!42189)

(declare-fun e!721595 () Unit!42189)

(assert (=> d!139325 (= lt!574185 e!721595)))

(declare-fun c!123513 () Bool)

(assert (=> d!139325 (= c!123513 lt!574186)))

(declare-fun containsKey!664 (List!28338 (_ BitVec 64)) Bool)

(assert (=> d!139325 (= lt!574186 (containsKey!664 (toList!9518 lm!209) a!499))))

(assert (=> d!139325 (= (contains!7654 lm!209 a!499) lt!574184)))

(declare-fun b!1266812 () Bool)

(declare-fun lt!574187 () Unit!42189)

(assert (=> b!1266812 (= e!721595 lt!574187)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!446 (List!28338 (_ BitVec 64)) Unit!42189)

(assert (=> b!1266812 (= lt!574187 (lemmaContainsKeyImpliesGetValueByKeyDefined!446 (toList!9518 lm!209) a!499))))

(declare-datatypes ((Option!730 0))(
  ( (Some!729 (v!19013 B!2022)) (None!728) )
))
(declare-fun isDefined!485 (Option!730) Bool)

(declare-fun getValueByKey!678 (List!28338 (_ BitVec 64)) Option!730)

(assert (=> b!1266812 (isDefined!485 (getValueByKey!678 (toList!9518 lm!209) a!499))))

(declare-fun b!1266813 () Bool)

(declare-fun Unit!42195 () Unit!42189)

(assert (=> b!1266813 (= e!721595 Unit!42195)))

(declare-fun b!1266814 () Bool)

(assert (=> b!1266814 (= e!721596 (isDefined!485 (getValueByKey!678 (toList!9518 lm!209) a!499)))))

(assert (= (and d!139325 c!123513) b!1266812))

(assert (= (and d!139325 (not c!123513)) b!1266813))

(assert (= (and d!139325 (not res!843330)) b!1266814))

(declare-fun m!1166431 () Bool)

(assert (=> d!139325 m!1166431))

(declare-fun m!1166433 () Bool)

(assert (=> b!1266812 m!1166433))

(declare-fun m!1166435 () Bool)

(assert (=> b!1266812 m!1166435))

(assert (=> b!1266812 m!1166435))

(declare-fun m!1166437 () Bool)

(assert (=> b!1266812 m!1166437))

(assert (=> b!1266814 m!1166435))

(assert (=> b!1266814 m!1166435))

(assert (=> b!1266814 m!1166437))

(assert (=> start!106616 d!139325))

(declare-fun d!139331 () Bool)

(assert (=> d!139331 (= (inv!44179 lm!209) (isStrictlySorted!807 (toList!9518 lm!209)))))

(declare-fun bs!35852 () Bool)

(assert (= bs!35852 d!139331))

(assert (=> bs!35852 m!1166425))

(assert (=> start!106616 d!139331))

(declare-fun d!139333 () Bool)

(declare-fun res!843339 () Bool)

(declare-fun e!721612 () Bool)

(assert (=> d!139333 (=> res!843339 e!721612)))

(assert (=> d!139333 (= res!843339 (or (is-Nil!28335 (toList!9518 lm!209)) (is-Nil!28335 (t!41865 (toList!9518 lm!209)))))))

(assert (=> d!139333 (= (isStrictlySorted!807 (toList!9518 lm!209)) e!721612)))

(declare-fun b!1266836 () Bool)

(declare-fun e!721613 () Bool)

(assert (=> b!1266836 (= e!721612 e!721613)))

(declare-fun res!843340 () Bool)

(assert (=> b!1266836 (=> (not res!843340) (not e!721613))))

(assert (=> b!1266836 (= res!843340 (bvslt (_1!10616 (h!29543 (toList!9518 lm!209))) (_1!10616 (h!29543 (t!41865 (toList!9518 lm!209))))))))

(declare-fun b!1266837 () Bool)

(assert (=> b!1266837 (= e!721613 (isStrictlySorted!807 (t!41865 (toList!9518 lm!209))))))

(assert (= (and d!139333 (not res!843339)) b!1266836))

