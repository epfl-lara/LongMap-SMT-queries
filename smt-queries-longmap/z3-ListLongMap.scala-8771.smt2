; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106608 () Bool)

(assert start!106608)

(declare-fun res!843267 () Bool)

(declare-fun e!721516 () Bool)

(assert (=> start!106608 (=> (not res!843267) (not e!721516))))

(declare-datatypes ((B!2018 0))(
  ( (B!2019 (val!16344 Int)) )
))
(declare-datatypes ((tuple2!21288 0))(
  ( (tuple2!21289 (_1!10655 (_ BitVec 64)) (_2!10655 B!2018)) )
))
(declare-datatypes ((List!28420 0))(
  ( (Nil!28417) (Cons!28416 (h!29625 tuple2!21288) (t!41938 List!28420)) )
))
(declare-datatypes ((ListLongMap!19083 0))(
  ( (ListLongMap!19084 (toList!9557 List!28420)) )
))
(declare-fun lm!209 () ListLongMap!19083)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7621 (ListLongMap!19083 (_ BitVec 64)) Bool)

(assert (=> start!106608 (= res!843267 (not (contains!7621 lm!209 a!499)))))

(assert (=> start!106608 e!721516))

(declare-fun e!721517 () Bool)

(declare-fun inv!44177 (ListLongMap!19083) Bool)

(assert (=> start!106608 (and (inv!44177 lm!209) e!721517)))

(assert (=> start!106608 true))

(declare-fun b!1266692 () Bool)

(declare-fun isStrictlySorted!801 (List!28420) Bool)

(assert (=> b!1266692 (= e!721516 (not (isStrictlySorted!801 (toList!9557 lm!209))))))

(declare-fun b!1266693 () Bool)

(declare-fun tp!96470 () Bool)

(assert (=> b!1266693 (= e!721517 tp!96470)))

(assert (= (and start!106608 res!843267) b!1266692))

(assert (= start!106608 b!1266693))

(declare-fun m!1165889 () Bool)

(assert (=> start!106608 m!1165889))

(declare-fun m!1165891 () Bool)

(assert (=> start!106608 m!1165891))

(declare-fun m!1165893 () Bool)

(assert (=> b!1266692 m!1165893))

(check-sat (not b!1266692) (not start!106608) (not b!1266693))
(check-sat)
(get-model)

(declare-fun d!139189 () Bool)

(declare-fun res!843282 () Bool)

(declare-fun e!721538 () Bool)

(assert (=> d!139189 (=> res!843282 e!721538)))

(get-info :version)

(assert (=> d!139189 (= res!843282 (or ((_ is Nil!28417) (toList!9557 lm!209)) ((_ is Nil!28417) (t!41938 (toList!9557 lm!209)))))))

(assert (=> d!139189 (= (isStrictlySorted!801 (toList!9557 lm!209)) e!721538)))

(declare-fun b!1266714 () Bool)

(declare-fun e!721539 () Bool)

(assert (=> b!1266714 (= e!721538 e!721539)))

(declare-fun res!843283 () Bool)

(assert (=> b!1266714 (=> (not res!843283) (not e!721539))))

(assert (=> b!1266714 (= res!843283 (bvslt (_1!10655 (h!29625 (toList!9557 lm!209))) (_1!10655 (h!29625 (t!41938 (toList!9557 lm!209))))))))

(declare-fun b!1266715 () Bool)

(assert (=> b!1266715 (= e!721539 (isStrictlySorted!801 (t!41938 (toList!9557 lm!209))))))

(assert (= (and d!139189 (not res!843282)) b!1266714))

(assert (= (and b!1266714 res!843283) b!1266715))

(declare-fun m!1165907 () Bool)

(assert (=> b!1266715 m!1165907))

(assert (=> b!1266692 d!139189))

(declare-fun d!139195 () Bool)

(declare-fun e!721557 () Bool)

(assert (=> d!139195 e!721557))

(declare-fun res!843293 () Bool)

(assert (=> d!139195 (=> res!843293 e!721557)))

(declare-fun lt!574019 () Bool)

(assert (=> d!139195 (= res!843293 (not lt!574019))))

(declare-fun lt!574018 () Bool)

(assert (=> d!139195 (= lt!574019 lt!574018)))

(declare-datatypes ((Unit!42041 0))(
  ( (Unit!42042) )
))
(declare-fun lt!574020 () Unit!42041)

(declare-fun e!721556 () Unit!42041)

(assert (=> d!139195 (= lt!574020 e!721556)))

(declare-fun c!123498 () Bool)

(assert (=> d!139195 (= c!123498 lt!574018)))

(declare-fun containsKey!663 (List!28420 (_ BitVec 64)) Bool)

(assert (=> d!139195 (= lt!574018 (containsKey!663 (toList!9557 lm!209) a!499))))

(assert (=> d!139195 (= (contains!7621 lm!209 a!499) lt!574019)))

(declare-fun b!1266739 () Bool)

(declare-fun lt!574017 () Unit!42041)

(assert (=> b!1266739 (= e!721556 lt!574017)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!446 (List!28420 (_ BitVec 64)) Unit!42041)

(assert (=> b!1266739 (= lt!574017 (lemmaContainsKeyImpliesGetValueByKeyDefined!446 (toList!9557 lm!209) a!499))))

(declare-datatypes ((Option!733 0))(
  ( (Some!732 (v!19013 B!2018)) (None!731) )
))
(declare-fun isDefined!489 (Option!733) Bool)

(declare-fun getValueByKey!682 (List!28420 (_ BitVec 64)) Option!733)

(assert (=> b!1266739 (isDefined!489 (getValueByKey!682 (toList!9557 lm!209) a!499))))

(declare-fun b!1266740 () Bool)

(declare-fun Unit!42046 () Unit!42041)

(assert (=> b!1266740 (= e!721556 Unit!42046)))

(declare-fun b!1266741 () Bool)

(assert (=> b!1266741 (= e!721557 (isDefined!489 (getValueByKey!682 (toList!9557 lm!209) a!499)))))

(assert (= (and d!139195 c!123498) b!1266739))

(assert (= (and d!139195 (not c!123498)) b!1266740))

(assert (= (and d!139195 (not res!843293)) b!1266741))

(declare-fun m!1165919 () Bool)

(assert (=> d!139195 m!1165919))

(declare-fun m!1165921 () Bool)

(assert (=> b!1266739 m!1165921))

(declare-fun m!1165925 () Bool)

(assert (=> b!1266739 m!1165925))

(assert (=> b!1266739 m!1165925))

(declare-fun m!1165931 () Bool)

(assert (=> b!1266739 m!1165931))

(assert (=> b!1266741 m!1165925))

(assert (=> b!1266741 m!1165925))

(assert (=> b!1266741 m!1165931))

(assert (=> start!106608 d!139195))

(declare-fun d!139203 () Bool)

(assert (=> d!139203 (= (inv!44177 lm!209) (isStrictlySorted!801 (toList!9557 lm!209)))))

(declare-fun bs!35825 () Bool)

(assert (= bs!35825 d!139203))

(assert (=> bs!35825 m!1165893))

(assert (=> start!106608 d!139203))

(declare-fun b!1266764 () Bool)

(declare-fun e!721573 () Bool)

(declare-fun tp_is_empty!32540 () Bool)

(declare-fun tp!96484 () Bool)

(assert (=> b!1266764 (= e!721573 (and tp_is_empty!32540 tp!96484))))

(assert (=> b!1266693 (= tp!96470 e!721573)))

(assert (= (and b!1266693 ((_ is Cons!28416) (toList!9557 lm!209))) b!1266764))

(check-sat tp_is_empty!32540 (not b!1266741) (not b!1266764) (not b!1266715) (not d!139195) (not b!1266739) (not d!139203))
(check-sat)
