; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106890 () Bool)

(assert start!106890)

(declare-fun b!1268268 () Bool)

(declare-fun e!722552 () Bool)

(declare-datatypes ((B!2030 0))(
  ( (B!2031 (val!16350 Int)) )
))
(declare-datatypes ((tuple2!21228 0))(
  ( (tuple2!21229 (_1!10625 (_ BitVec 64)) (_2!10625 B!2030)) )
))
(declare-datatypes ((List!28378 0))(
  ( (Nil!28375) (Cons!28374 (h!29592 tuple2!21228) (t!41897 List!28378)) )
))
(declare-datatypes ((ListLongMap!19031 0))(
  ( (ListLongMap!19032 (toList!9531 List!28378)) )
))
(declare-fun lm!209 () ListLongMap!19031)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun -!2130 (ListLongMap!19031 (_ BitVec 64)) ListLongMap!19031)

(assert (=> b!1268268 (= e!722552 (not (= (-!2130 lm!209 a!499) lm!209)))))

(declare-fun removeStrictlySorted!160 (List!28378 (_ BitVec 64)) List!28378)

(assert (=> b!1268268 (= (removeStrictlySorted!160 (toList!9531 lm!209) a!499) (toList!9531 lm!209))))

(declare-datatypes ((Unit!42180 0))(
  ( (Unit!42181) )
))
(declare-fun lt!574726 () Unit!42180)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!1 (List!28378 (_ BitVec 64)) Unit!42180)

(assert (=> b!1268268 (= lt!574726 (lemmaRemoveStrictlySortedNotPresentPreserves!1 (toList!9531 lm!209) a!499))))

(declare-fun res!843930 () Bool)

(assert (=> start!106890 (=> (not res!843930) (not e!722552))))

(declare-fun contains!7683 (ListLongMap!19031 (_ BitVec 64)) Bool)

(assert (=> start!106890 (= res!843930 (not (contains!7683 lm!209 a!499)))))

(assert (=> start!106890 e!722552))

(declare-fun e!722553 () Bool)

(declare-fun inv!44193 (ListLongMap!19031) Bool)

(assert (=> start!106890 (and (inv!44193 lm!209) e!722553)))

(assert (=> start!106890 true))

(declare-fun b!1268266 () Bool)

(declare-fun res!843931 () Bool)

(assert (=> b!1268266 (=> (not res!843931) (not e!722552))))

(declare-fun isStrictlySorted!799 (List!28378) Bool)

(assert (=> b!1268266 (= res!843931 (isStrictlySorted!799 (toList!9531 lm!209)))))

(declare-fun b!1268269 () Bool)

(declare-fun tp!96506 () Bool)

(assert (=> b!1268269 (= e!722553 tp!96506)))

(declare-fun b!1268267 () Bool)

(declare-fun res!843932 () Bool)

(assert (=> b!1268267 (=> (not res!843932) (not e!722552))))

(declare-fun containsKey!670 (List!28378 (_ BitVec 64)) Bool)

(assert (=> b!1268267 (= res!843932 (not (containsKey!670 (toList!9531 lm!209) a!499)))))

(assert (= (and start!106890 res!843930) b!1268266))

(assert (= (and b!1268266 res!843931) b!1268267))

(assert (= (and b!1268267 res!843932) b!1268268))

(assert (= start!106890 b!1268269))

(declare-fun m!1168123 () Bool)

(assert (=> b!1268268 m!1168123))

(declare-fun m!1168125 () Bool)

(assert (=> b!1268268 m!1168125))

(declare-fun m!1168127 () Bool)

(assert (=> b!1268268 m!1168127))

(declare-fun m!1168129 () Bool)

(assert (=> start!106890 m!1168129))

(declare-fun m!1168131 () Bool)

(assert (=> start!106890 m!1168131))

(declare-fun m!1168133 () Bool)

(assert (=> b!1268266 m!1168133))

(declare-fun m!1168135 () Bool)

(assert (=> b!1268267 m!1168135))

(check-sat (not b!1268267) (not b!1268266) (not b!1268269) (not start!106890) (not b!1268268))
(check-sat)
(get-model)

(declare-fun d!139815 () Bool)

(declare-fun e!722586 () Bool)

(assert (=> d!139815 e!722586))

(declare-fun res!843967 () Bool)

(assert (=> d!139815 (=> res!843967 e!722586)))

(declare-fun lt!574751 () Bool)

(assert (=> d!139815 (= res!843967 (not lt!574751))))

(declare-fun lt!574752 () Bool)

(assert (=> d!139815 (= lt!574751 lt!574752)))

(declare-fun lt!574749 () Unit!42180)

(declare-fun e!722587 () Unit!42180)

(assert (=> d!139815 (= lt!574749 e!722587)))

(declare-fun c!123931 () Bool)

(assert (=> d!139815 (= c!123931 lt!574752)))

(assert (=> d!139815 (= lt!574752 (containsKey!670 (toList!9531 lm!209) a!499))))

(assert (=> d!139815 (= (contains!7683 lm!209 a!499) lt!574751)))

(declare-fun b!1268318 () Bool)

(declare-fun lt!574750 () Unit!42180)

(assert (=> b!1268318 (= e!722587 lt!574750)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!452 (List!28378 (_ BitVec 64)) Unit!42180)

(assert (=> b!1268318 (= lt!574750 (lemmaContainsKeyImpliesGetValueByKeyDefined!452 (toList!9531 lm!209) a!499))))

(declare-datatypes ((Option!731 0))(
  ( (Some!730 (v!19014 B!2030)) (None!729) )
))
(declare-fun isDefined!489 (Option!731) Bool)

(declare-fun getValueByKey!680 (List!28378 (_ BitVec 64)) Option!731)

(assert (=> b!1268318 (isDefined!489 (getValueByKey!680 (toList!9531 lm!209) a!499))))

(declare-fun b!1268319 () Bool)

(declare-fun Unit!42186 () Unit!42180)

(assert (=> b!1268319 (= e!722587 Unit!42186)))

(declare-fun b!1268320 () Bool)

(assert (=> b!1268320 (= e!722586 (isDefined!489 (getValueByKey!680 (toList!9531 lm!209) a!499)))))

(assert (= (and d!139815 c!123931) b!1268318))

(assert (= (and d!139815 (not c!123931)) b!1268319))

(assert (= (and d!139815 (not res!843967)) b!1268320))

(assert (=> d!139815 m!1168135))

(declare-fun m!1168169 () Bool)

(assert (=> b!1268318 m!1168169))

(declare-fun m!1168171 () Bool)

(assert (=> b!1268318 m!1168171))

(assert (=> b!1268318 m!1168171))

(declare-fun m!1168173 () Bool)

(assert (=> b!1268318 m!1168173))

(assert (=> b!1268320 m!1168171))

(assert (=> b!1268320 m!1168171))

(assert (=> b!1268320 m!1168173))

(assert (=> start!106890 d!139815))

(declare-fun d!139825 () Bool)

(assert (=> d!139825 (= (inv!44193 lm!209) (isStrictlySorted!799 (toList!9531 lm!209)))))

(declare-fun bs!35880 () Bool)

(assert (= bs!35880 d!139825))

(assert (=> bs!35880 m!1168133))

(assert (=> start!106890 d!139825))

(declare-fun d!139827 () Bool)

(declare-fun lt!574759 () ListLongMap!19031)

(assert (=> d!139827 (not (contains!7683 lt!574759 a!499))))

(assert (=> d!139827 (= lt!574759 (ListLongMap!19032 (removeStrictlySorted!160 (toList!9531 lm!209) a!499)))))

(assert (=> d!139827 (= (-!2130 lm!209 a!499) lt!574759)))

(declare-fun bs!35882 () Bool)

(assert (= bs!35882 d!139827))

(declare-fun m!1168181 () Bool)

(assert (=> bs!35882 m!1168181))

(assert (=> bs!35882 m!1168125))

(assert (=> b!1268268 d!139827))

(declare-fun b!1268353 () Bool)

(declare-fun e!722610 () List!28378)

(declare-fun $colon$colon!646 (List!28378 tuple2!21228) List!28378)

(assert (=> b!1268353 (= e!722610 ($colon$colon!646 (removeStrictlySorted!160 (t!41897 (toList!9531 lm!209)) a!499) (h!29592 (toList!9531 lm!209))))))

(declare-fun b!1268354 () Bool)

(declare-fun e!722609 () Bool)

(declare-fun lt!574781 () List!28378)

(assert (=> b!1268354 (= e!722609 (not (containsKey!670 lt!574781 a!499)))))

(declare-fun d!139833 () Bool)

(assert (=> d!139833 e!722609))

(declare-fun res!843976 () Bool)

(assert (=> d!139833 (=> (not res!843976) (not e!722609))))

(assert (=> d!139833 (= res!843976 (isStrictlySorted!799 lt!574781))))

(declare-fun e!722608 () List!28378)

(assert (=> d!139833 (= lt!574781 e!722608)))

(declare-fun c!123944 () Bool)

(get-info :version)

(assert (=> d!139833 (= c!123944 (and ((_ is Cons!28374) (toList!9531 lm!209)) (= (_1!10625 (h!29592 (toList!9531 lm!209))) a!499)))))

(assert (=> d!139833 (isStrictlySorted!799 (toList!9531 lm!209))))

(assert (=> d!139833 (= (removeStrictlySorted!160 (toList!9531 lm!209) a!499) lt!574781)))

(declare-fun b!1268355 () Bool)

(assert (=> b!1268355 (= e!722608 e!722610)))

(declare-fun c!123945 () Bool)

(assert (=> b!1268355 (= c!123945 (and ((_ is Cons!28374) (toList!9531 lm!209)) (not (= (_1!10625 (h!29592 (toList!9531 lm!209))) a!499))))))

(declare-fun b!1268356 () Bool)

(assert (=> b!1268356 (= e!722610 Nil!28375)))

(declare-fun b!1268357 () Bool)

(assert (=> b!1268357 (= e!722608 (t!41897 (toList!9531 lm!209)))))

(assert (= (and d!139833 c!123944) b!1268357))

(assert (= (and d!139833 (not c!123944)) b!1268355))

(assert (= (and b!1268355 c!123945) b!1268353))

(assert (= (and b!1268355 (not c!123945)) b!1268356))

(assert (= (and d!139833 res!843976) b!1268354))

(declare-fun m!1168193 () Bool)

(assert (=> b!1268353 m!1168193))

(assert (=> b!1268353 m!1168193))

(declare-fun m!1168195 () Bool)

(assert (=> b!1268353 m!1168195))

(declare-fun m!1168197 () Bool)

(assert (=> b!1268354 m!1168197))

(declare-fun m!1168199 () Bool)

(assert (=> d!139833 m!1168199))

(assert (=> d!139833 m!1168133))

(assert (=> b!1268268 d!139833))

(declare-fun d!139843 () Bool)

(assert (=> d!139843 (= (removeStrictlySorted!160 (toList!9531 lm!209) a!499) (toList!9531 lm!209))))

(declare-fun lt!574786 () Unit!42180)

(declare-fun choose!1893 (List!28378 (_ BitVec 64)) Unit!42180)

(assert (=> d!139843 (= lt!574786 (choose!1893 (toList!9531 lm!209) a!499))))

(assert (=> d!139843 (isStrictlySorted!799 (toList!9531 lm!209))))

(assert (=> d!139843 (= (lemmaRemoveStrictlySortedNotPresentPreserves!1 (toList!9531 lm!209) a!499) lt!574786)))

(declare-fun bs!35886 () Bool)

(assert (= bs!35886 d!139843))

(assert (=> bs!35886 m!1168125))

(declare-fun m!1168209 () Bool)

(assert (=> bs!35886 m!1168209))

(assert (=> bs!35886 m!1168133))

(assert (=> b!1268268 d!139843))

(declare-fun d!139847 () Bool)

(declare-fun res!843988 () Bool)

(declare-fun e!722628 () Bool)

(assert (=> d!139847 (=> res!843988 e!722628)))

(assert (=> d!139847 (= res!843988 (and ((_ is Cons!28374) (toList!9531 lm!209)) (= (_1!10625 (h!29592 (toList!9531 lm!209))) a!499)))))

(assert (=> d!139847 (= (containsKey!670 (toList!9531 lm!209) a!499) e!722628)))

(declare-fun b!1268381 () Bool)

(declare-fun e!722629 () Bool)

(assert (=> b!1268381 (= e!722628 e!722629)))

(declare-fun res!843989 () Bool)

(assert (=> b!1268381 (=> (not res!843989) (not e!722629))))

(assert (=> b!1268381 (= res!843989 (and (or (not ((_ is Cons!28374) (toList!9531 lm!209))) (bvsle (_1!10625 (h!29592 (toList!9531 lm!209))) a!499)) ((_ is Cons!28374) (toList!9531 lm!209)) (bvslt (_1!10625 (h!29592 (toList!9531 lm!209))) a!499)))))

(declare-fun b!1268382 () Bool)

(assert (=> b!1268382 (= e!722629 (containsKey!670 (t!41897 (toList!9531 lm!209)) a!499))))

(assert (= (and d!139847 (not res!843988)) b!1268381))

(assert (= (and b!1268381 res!843989) b!1268382))

(declare-fun m!1168213 () Bool)

(assert (=> b!1268382 m!1168213))

(assert (=> b!1268267 d!139847))

(declare-fun d!139851 () Bool)

(declare-fun res!844001 () Bool)

(declare-fun e!722643 () Bool)

(assert (=> d!139851 (=> res!844001 e!722643)))

(assert (=> d!139851 (= res!844001 (or ((_ is Nil!28375) (toList!9531 lm!209)) ((_ is Nil!28375) (t!41897 (toList!9531 lm!209)))))))

(assert (=> d!139851 (= (isStrictlySorted!799 (toList!9531 lm!209)) e!722643)))

(declare-fun b!1268398 () Bool)

(declare-fun e!722644 () Bool)

(assert (=> b!1268398 (= e!722643 e!722644)))

(declare-fun res!844002 () Bool)

(assert (=> b!1268398 (=> (not res!844002) (not e!722644))))

(assert (=> b!1268398 (= res!844002 (bvslt (_1!10625 (h!29592 (toList!9531 lm!209))) (_1!10625 (h!29592 (t!41897 (toList!9531 lm!209))))))))

(declare-fun b!1268399 () Bool)

(assert (=> b!1268399 (= e!722644 (isStrictlySorted!799 (t!41897 (toList!9531 lm!209))))))

(assert (= (and d!139851 (not res!844001)) b!1268398))

(assert (= (and b!1268398 res!844002) b!1268399))

(declare-fun m!1168225 () Bool)

(assert (=> b!1268399 m!1168225))

(assert (=> b!1268266 d!139851))

(declare-fun b!1268406 () Bool)

(declare-fun e!722649 () Bool)

(declare-fun tp_is_empty!32551 () Bool)

(declare-fun tp!96515 () Bool)

(assert (=> b!1268406 (= e!722649 (and tp_is_empty!32551 tp!96515))))

(assert (=> b!1268269 (= tp!96506 e!722649)))

(assert (= (and b!1268269 ((_ is Cons!28374) (toList!9531 lm!209))) b!1268406))

(check-sat (not d!139843) (not b!1268399) (not b!1268382) (not b!1268406) (not b!1268318) tp_is_empty!32551 (not d!139833) (not d!139815) (not b!1268353) (not b!1268354) (not b!1268320) (not d!139825) (not d!139827))
(check-sat)
