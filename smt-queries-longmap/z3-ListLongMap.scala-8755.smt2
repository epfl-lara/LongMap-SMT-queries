; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106494 () Bool)

(assert start!106494)

(declare-fun b!1265996 () Bool)

(declare-fun res!842736 () Bool)

(declare-fun e!721047 () Bool)

(assert (=> b!1265996 (=> (not res!842736) (not e!721047))))

(declare-datatypes ((B!1922 0))(
  ( (B!1923 (val!16296 Int)) )
))
(declare-datatypes ((tuple2!21120 0))(
  ( (tuple2!21121 (_1!10571 (_ BitVec 64)) (_2!10571 B!1922)) )
))
(declare-datatypes ((List!28324 0))(
  ( (Nil!28321) (Cons!28320 (h!29538 tuple2!21120) (t!41837 List!28324)) )
))
(declare-datatypes ((ListLongMap!19001 0))(
  ( (ListLongMap!19002 (toList!9516 List!28324)) )
))
(declare-fun lm!212 () ListLongMap!19001)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun containsKey!634 (List!28324 (_ BitVec 64)) Bool)

(assert (=> b!1265996 (= res!842736 (not (containsKey!634 (toList!9516 lm!212) a1!67)))))

(declare-fun b!1265995 () Bool)

(declare-fun res!842738 () Bool)

(assert (=> b!1265995 (=> (not res!842738) (not e!721047))))

(declare-fun isStrictlySorted!763 (List!28324) Bool)

(assert (=> b!1265995 (= res!842738 (isStrictlySorted!763 (toList!9516 lm!212)))))

(declare-fun b!1265998 () Bool)

(declare-fun e!721046 () Bool)

(declare-fun tp!96239 () Bool)

(assert (=> b!1265998 (= e!721046 tp!96239)))

(declare-fun res!842737 () Bool)

(assert (=> start!106494 (=> (not res!842737) (not e!721047))))

(declare-fun contains!7653 (ListLongMap!19001 (_ BitVec 64)) Bool)

(assert (=> start!106494 (= res!842737 (not (contains!7653 lm!212 a1!67)))))

(assert (=> start!106494 e!721047))

(declare-fun inv!44088 (ListLongMap!19001) Bool)

(assert (=> start!106494 (and (inv!44088 lm!212) e!721046)))

(assert (=> start!106494 true))

(declare-fun tp_is_empty!32455 () Bool)

(assert (=> start!106494 tp_is_empty!32455))

(declare-fun b!1265997 () Bool)

(declare-fun b1!78 () B!1922)

(declare-fun -!2127 (ListLongMap!19001 (_ BitVec 64)) ListLongMap!19001)

(declare-fun +!4311 (ListLongMap!19001 tuple2!21120) ListLongMap!19001)

(assert (=> b!1265997 (= e!721047 (not (= (-!2127 (+!4311 lm!212 (tuple2!21121 a1!67 b1!78)) a1!67) lm!212)))))

(declare-fun removeStrictlySorted!145 (List!28324 (_ BitVec 64)) List!28324)

(declare-fun insertStrictlySorted!454 (List!28324 (_ BitVec 64) B!1922) List!28324)

(assert (=> b!1265997 (= (removeStrictlySorted!145 (insertStrictlySorted!454 (toList!9516 lm!212) a1!67 b1!78) a1!67) (toList!9516 lm!212))))

(declare-datatypes ((Unit!42136 0))(
  ( (Unit!42137) )
))
(declare-fun lt!574363 () Unit!42136)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!1 (List!28324 (_ BitVec 64) B!1922) Unit!42136)

(assert (=> b!1265997 (= lt!574363 (lemmaInsertStrictlySortedThenRemoveIsSame!1 (toList!9516 lm!212) a1!67 b1!78))))

(assert (= (and start!106494 res!842737) b!1265995))

(assert (= (and b!1265995 res!842738) b!1265996))

(assert (= (and b!1265996 res!842736) b!1265997))

(assert (= start!106494 b!1265998))

(declare-fun m!1166785 () Bool)

(assert (=> b!1265996 m!1166785))

(declare-fun m!1166787 () Bool)

(assert (=> b!1265995 m!1166787))

(declare-fun m!1166789 () Bool)

(assert (=> start!106494 m!1166789))

(declare-fun m!1166791 () Bool)

(assert (=> start!106494 m!1166791))

(declare-fun m!1166793 () Bool)

(assert (=> b!1265997 m!1166793))

(declare-fun m!1166795 () Bool)

(assert (=> b!1265997 m!1166795))

(declare-fun m!1166797 () Bool)

(assert (=> b!1265997 m!1166797))

(declare-fun m!1166799 () Bool)

(assert (=> b!1265997 m!1166799))

(assert (=> b!1265997 m!1166799))

(declare-fun m!1166801 () Bool)

(assert (=> b!1265997 m!1166801))

(assert (=> b!1265997 m!1166793))

(check-sat (not b!1265996) (not b!1265997) tp_is_empty!32455 (not start!106494) (not b!1265998) (not b!1265995))
(check-sat)
(get-model)

(declare-fun d!139227 () Bool)

(declare-fun e!721072 () Bool)

(assert (=> d!139227 e!721072))

(declare-fun res!842763 () Bool)

(assert (=> d!139227 (=> res!842763 e!721072)))

(declare-fun lt!574397 () Bool)

(assert (=> d!139227 (= res!842763 (not lt!574397))))

(declare-fun lt!574395 () Bool)

(assert (=> d!139227 (= lt!574397 lt!574395)))

(declare-fun lt!574394 () Unit!42136)

(declare-fun e!721073 () Unit!42136)

(assert (=> d!139227 (= lt!574394 e!721073)))

(declare-fun c!123561 () Bool)

(assert (=> d!139227 (= c!123561 lt!574395)))

(assert (=> d!139227 (= lt!574395 (containsKey!634 (toList!9516 lm!212) a1!67))))

(assert (=> d!139227 (= (contains!7653 lm!212 a1!67) lt!574397)))

(declare-fun b!1266041 () Bool)

(declare-fun lt!574396 () Unit!42136)

(assert (=> b!1266041 (= e!721073 lt!574396)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!443 (List!28324 (_ BitVec 64)) Unit!42136)

(assert (=> b!1266041 (= lt!574396 (lemmaContainsKeyImpliesGetValueByKeyDefined!443 (toList!9516 lm!212) a1!67))))

(declare-datatypes ((Option!723 0))(
  ( (Some!722 (v!19000 B!1922)) (None!721) )
))
(declare-fun isDefined!481 (Option!723) Bool)

(declare-fun getValueByKey!672 (List!28324 (_ BitVec 64)) Option!723)

(assert (=> b!1266041 (isDefined!481 (getValueByKey!672 (toList!9516 lm!212) a1!67))))

(declare-fun b!1266042 () Bool)

(declare-fun Unit!42142 () Unit!42136)

(assert (=> b!1266042 (= e!721073 Unit!42142)))

(declare-fun b!1266043 () Bool)

(assert (=> b!1266043 (= e!721072 (isDefined!481 (getValueByKey!672 (toList!9516 lm!212) a1!67)))))

(assert (= (and d!139227 c!123561) b!1266041))

(assert (= (and d!139227 (not c!123561)) b!1266042))

(assert (= (and d!139227 (not res!842763)) b!1266043))

(assert (=> d!139227 m!1166785))

(declare-fun m!1166839 () Bool)

(assert (=> b!1266041 m!1166839))

(declare-fun m!1166841 () Bool)

(assert (=> b!1266041 m!1166841))

(assert (=> b!1266041 m!1166841))

(declare-fun m!1166843 () Bool)

(assert (=> b!1266041 m!1166843))

(assert (=> b!1266043 m!1166841))

(assert (=> b!1266043 m!1166841))

(assert (=> b!1266043 m!1166843))

(assert (=> start!106494 d!139227))

(declare-fun d!139233 () Bool)

(assert (=> d!139233 (= (inv!44088 lm!212) (isStrictlySorted!763 (toList!9516 lm!212)))))

(declare-fun bs!35802 () Bool)

(assert (= bs!35802 d!139233))

(assert (=> bs!35802 m!1166787))

(assert (=> start!106494 d!139233))

(declare-fun d!139239 () Bool)

(declare-fun res!842778 () Bool)

(declare-fun e!721090 () Bool)

(assert (=> d!139239 (=> res!842778 e!721090)))

(get-info :version)

(assert (=> d!139239 (= res!842778 (or ((_ is Nil!28321) (toList!9516 lm!212)) ((_ is Nil!28321) (t!41837 (toList!9516 lm!212)))))))

(assert (=> d!139239 (= (isStrictlySorted!763 (toList!9516 lm!212)) e!721090)))

(declare-fun b!1266062 () Bool)

(declare-fun e!721091 () Bool)

(assert (=> b!1266062 (= e!721090 e!721091)))

(declare-fun res!842779 () Bool)

(assert (=> b!1266062 (=> (not res!842779) (not e!721091))))

(assert (=> b!1266062 (= res!842779 (bvslt (_1!10571 (h!29538 (toList!9516 lm!212))) (_1!10571 (h!29538 (t!41837 (toList!9516 lm!212))))))))

(declare-fun b!1266063 () Bool)

(assert (=> b!1266063 (= e!721091 (isStrictlySorted!763 (t!41837 (toList!9516 lm!212))))))

(assert (= (and d!139239 (not res!842778)) b!1266062))

(assert (= (and b!1266062 res!842779) b!1266063))

(declare-fun m!1166857 () Bool)

(assert (=> b!1266063 m!1166857))

(assert (=> b!1265995 d!139239))

(declare-fun d!139245 () Bool)

(declare-fun res!842796 () Bool)

(declare-fun e!721108 () Bool)

(assert (=> d!139245 (=> res!842796 e!721108)))

(assert (=> d!139245 (= res!842796 (and ((_ is Cons!28320) (toList!9516 lm!212)) (= (_1!10571 (h!29538 (toList!9516 lm!212))) a1!67)))))

(assert (=> d!139245 (= (containsKey!634 (toList!9516 lm!212) a1!67) e!721108)))

(declare-fun b!1266080 () Bool)

(declare-fun e!721109 () Bool)

(assert (=> b!1266080 (= e!721108 e!721109)))

(declare-fun res!842797 () Bool)

(assert (=> b!1266080 (=> (not res!842797) (not e!721109))))

(assert (=> b!1266080 (= res!842797 (and (or (not ((_ is Cons!28320) (toList!9516 lm!212))) (bvsle (_1!10571 (h!29538 (toList!9516 lm!212))) a1!67)) ((_ is Cons!28320) (toList!9516 lm!212)) (bvslt (_1!10571 (h!29538 (toList!9516 lm!212))) a1!67)))))

(declare-fun b!1266081 () Bool)

(assert (=> b!1266081 (= e!721109 (containsKey!634 (t!41837 (toList!9516 lm!212)) a1!67))))

(assert (= (and d!139245 (not res!842796)) b!1266080))

(assert (= (and b!1266080 res!842797) b!1266081))

(declare-fun m!1166863 () Bool)

(assert (=> b!1266081 m!1166863))

(assert (=> b!1265996 d!139245))

(declare-fun d!139251 () Bool)

(assert (=> d!139251 (= (removeStrictlySorted!145 (insertStrictlySorted!454 (toList!9516 lm!212) a1!67 b1!78) a1!67) (toList!9516 lm!212))))

(declare-fun lt!574412 () Unit!42136)

(declare-fun choose!1884 (List!28324 (_ BitVec 64) B!1922) Unit!42136)

(assert (=> d!139251 (= lt!574412 (choose!1884 (toList!9516 lm!212) a1!67 b1!78))))

(assert (=> d!139251 (isStrictlySorted!763 (toList!9516 lm!212))))

(assert (=> d!139251 (= (lemmaInsertStrictlySortedThenRemoveIsSame!1 (toList!9516 lm!212) a1!67 b1!78) lt!574412)))

(declare-fun bs!35805 () Bool)

(assert (= bs!35805 d!139251))

(assert (=> bs!35805 m!1166799))

(assert (=> bs!35805 m!1166799))

(assert (=> bs!35805 m!1166801))

(declare-fun m!1166869 () Bool)

(assert (=> bs!35805 m!1166869))

(assert (=> bs!35805 m!1166787))

(assert (=> b!1265997 d!139251))

(declare-fun b!1266116 () Bool)

(declare-fun e!721134 () List!28324)

(assert (=> b!1266116 (= e!721134 Nil!28321)))

(declare-fun b!1266117 () Bool)

(declare-fun $colon$colon!631 (List!28324 tuple2!21120) List!28324)

(assert (=> b!1266117 (= e!721134 ($colon$colon!631 (removeStrictlySorted!145 (t!41837 (insertStrictlySorted!454 (toList!9516 lm!212) a1!67 b1!78)) a1!67) (h!29538 (insertStrictlySorted!454 (toList!9516 lm!212) a1!67 b1!78))))))

(declare-fun b!1266118 () Bool)

(declare-fun e!721133 () List!28324)

(assert (=> b!1266118 (= e!721133 e!721134)))

(declare-fun c!123577 () Bool)

(assert (=> b!1266118 (= c!123577 (and ((_ is Cons!28320) (insertStrictlySorted!454 (toList!9516 lm!212) a1!67 b1!78)) (not (= (_1!10571 (h!29538 (insertStrictlySorted!454 (toList!9516 lm!212) a1!67 b1!78))) a1!67))))))

(declare-fun b!1266119 () Bool)

(assert (=> b!1266119 (= e!721133 (t!41837 (insertStrictlySorted!454 (toList!9516 lm!212) a1!67 b1!78)))))

(declare-fun d!139257 () Bool)

(declare-fun e!721132 () Bool)

(assert (=> d!139257 e!721132))

(declare-fun res!842808 () Bool)

(assert (=> d!139257 (=> (not res!842808) (not e!721132))))

(declare-fun lt!574421 () List!28324)

(assert (=> d!139257 (= res!842808 (isStrictlySorted!763 lt!574421))))

(assert (=> d!139257 (= lt!574421 e!721133)))

(declare-fun c!123576 () Bool)

(assert (=> d!139257 (= c!123576 (and ((_ is Cons!28320) (insertStrictlySorted!454 (toList!9516 lm!212) a1!67 b1!78)) (= (_1!10571 (h!29538 (insertStrictlySorted!454 (toList!9516 lm!212) a1!67 b1!78))) a1!67)))))

(assert (=> d!139257 (isStrictlySorted!763 (insertStrictlySorted!454 (toList!9516 lm!212) a1!67 b1!78))))

(assert (=> d!139257 (= (removeStrictlySorted!145 (insertStrictlySorted!454 (toList!9516 lm!212) a1!67 b1!78) a1!67) lt!574421)))

(declare-fun b!1266120 () Bool)

(assert (=> b!1266120 (= e!721132 (not (containsKey!634 lt!574421 a1!67)))))

(assert (= (and d!139257 c!123576) b!1266119))

(assert (= (and d!139257 (not c!123576)) b!1266118))

(assert (= (and b!1266118 c!123577) b!1266117))

(assert (= (and b!1266118 (not c!123577)) b!1266116))

(assert (= (and d!139257 res!842808) b!1266120))

(declare-fun m!1166875 () Bool)

(assert (=> b!1266117 m!1166875))

(assert (=> b!1266117 m!1166875))

(declare-fun m!1166879 () Bool)

(assert (=> b!1266117 m!1166879))

(declare-fun m!1166881 () Bool)

(assert (=> d!139257 m!1166881))

(assert (=> d!139257 m!1166799))

(declare-fun m!1166885 () Bool)

(assert (=> d!139257 m!1166885))

(declare-fun m!1166889 () Bool)

(assert (=> b!1266120 m!1166889))

(assert (=> b!1265997 d!139257))

(declare-fun d!139263 () Bool)

(declare-fun e!721147 () Bool)

(assert (=> d!139263 e!721147))

(declare-fun res!842823 () Bool)

(assert (=> d!139263 (=> (not res!842823) (not e!721147))))

(declare-fun lt!574451 () ListLongMap!19001)

(assert (=> d!139263 (= res!842823 (contains!7653 lt!574451 (_1!10571 (tuple2!21121 a1!67 b1!78))))))

(declare-fun lt!574450 () List!28324)

(assert (=> d!139263 (= lt!574451 (ListLongMap!19002 lt!574450))))

(declare-fun lt!574449 () Unit!42136)

(declare-fun lt!574448 () Unit!42136)

(assert (=> d!139263 (= lt!574449 lt!574448)))

(assert (=> d!139263 (= (getValueByKey!672 lt!574450 (_1!10571 (tuple2!21121 a1!67 b1!78))) (Some!722 (_2!10571 (tuple2!21121 a1!67 b1!78))))))

(declare-fun lemmaContainsTupThenGetReturnValue!340 (List!28324 (_ BitVec 64) B!1922) Unit!42136)

(assert (=> d!139263 (= lt!574448 (lemmaContainsTupThenGetReturnValue!340 lt!574450 (_1!10571 (tuple2!21121 a1!67 b1!78)) (_2!10571 (tuple2!21121 a1!67 b1!78))))))

(assert (=> d!139263 (= lt!574450 (insertStrictlySorted!454 (toList!9516 lm!212) (_1!10571 (tuple2!21121 a1!67 b1!78)) (_2!10571 (tuple2!21121 a1!67 b1!78))))))

(assert (=> d!139263 (= (+!4311 lm!212 (tuple2!21121 a1!67 b1!78)) lt!574451)))

(declare-fun b!1266143 () Bool)

(declare-fun res!842824 () Bool)

(assert (=> b!1266143 (=> (not res!842824) (not e!721147))))

(assert (=> b!1266143 (= res!842824 (= (getValueByKey!672 (toList!9516 lt!574451) (_1!10571 (tuple2!21121 a1!67 b1!78))) (Some!722 (_2!10571 (tuple2!21121 a1!67 b1!78)))))))

(declare-fun b!1266144 () Bool)

(declare-fun contains!7656 (List!28324 tuple2!21120) Bool)

(assert (=> b!1266144 (= e!721147 (contains!7656 (toList!9516 lt!574451) (tuple2!21121 a1!67 b1!78)))))

(assert (= (and d!139263 res!842823) b!1266143))

(assert (= (and b!1266143 res!842824) b!1266144))

(declare-fun m!1166905 () Bool)

(assert (=> d!139263 m!1166905))

(declare-fun m!1166909 () Bool)

(assert (=> d!139263 m!1166909))

(declare-fun m!1166913 () Bool)

(assert (=> d!139263 m!1166913))

(declare-fun m!1166917 () Bool)

(assert (=> d!139263 m!1166917))

(declare-fun m!1166921 () Bool)

(assert (=> b!1266143 m!1166921))

(declare-fun m!1166925 () Bool)

(assert (=> b!1266144 m!1166925))

(assert (=> b!1265997 d!139263))

(declare-fun d!139269 () Bool)

(declare-fun lt!574467 () ListLongMap!19001)

(assert (=> d!139269 (not (contains!7653 lt!574467 a1!67))))

(assert (=> d!139269 (= lt!574467 (ListLongMap!19002 (removeStrictlySorted!145 (toList!9516 (+!4311 lm!212 (tuple2!21121 a1!67 b1!78))) a1!67)))))

(assert (=> d!139269 (= (-!2127 (+!4311 lm!212 (tuple2!21121 a1!67 b1!78)) a1!67) lt!574467)))

(declare-fun bs!35809 () Bool)

(assert (= bs!35809 d!139269))

(declare-fun m!1166943 () Bool)

(assert (=> bs!35809 m!1166943))

(declare-fun m!1166947 () Bool)

(assert (=> bs!35809 m!1166947))

(assert (=> b!1265997 d!139269))

(declare-fun bm!62416 () Bool)

(declare-fun call!62419 () List!28324)

(declare-fun call!62421 () List!28324)

(assert (=> bm!62416 (= call!62419 call!62421)))

(declare-fun b!1266219 () Bool)

(declare-fun c!123613 () Bool)

(assert (=> b!1266219 (= c!123613 (and ((_ is Cons!28320) (toList!9516 lm!212)) (bvsgt (_1!10571 (h!29538 (toList!9516 lm!212))) a1!67)))))

(declare-fun e!721186 () List!28324)

(declare-fun e!721185 () List!28324)

(assert (=> b!1266219 (= e!721186 e!721185)))

(declare-fun b!1266220 () Bool)

(declare-fun e!721188 () List!28324)

(assert (=> b!1266220 (= e!721188 (insertStrictlySorted!454 (t!41837 (toList!9516 lm!212)) a1!67 b1!78))))

(declare-fun b!1266222 () Bool)

(declare-fun res!842843 () Bool)

(declare-fun e!721189 () Bool)

(assert (=> b!1266222 (=> (not res!842843) (not e!721189))))

(declare-fun lt!574476 () List!28324)

(assert (=> b!1266222 (= res!842843 (containsKey!634 lt!574476 a1!67))))

(declare-fun b!1266223 () Bool)

(assert (=> b!1266223 (= e!721185 call!62419)))

(declare-fun b!1266224 () Bool)

(assert (=> b!1266224 (= e!721189 (contains!7656 lt!574476 (tuple2!21121 a1!67 b1!78)))))

(declare-fun bm!62417 () Bool)

(declare-fun call!62420 () List!28324)

(assert (=> bm!62417 (= call!62421 call!62420)))

(declare-fun b!1266225 () Bool)

(declare-fun e!721187 () List!28324)

(assert (=> b!1266225 (= e!721187 call!62420)))

(declare-fun c!123612 () Bool)

(declare-fun b!1266226 () Bool)

(assert (=> b!1266226 (= e!721188 (ite c!123612 (t!41837 (toList!9516 lm!212)) (ite c!123613 (Cons!28320 (h!29538 (toList!9516 lm!212)) (t!41837 (toList!9516 lm!212))) Nil!28321)))))

(declare-fun b!1266227 () Bool)

(assert (=> b!1266227 (= e!721186 call!62421)))

(declare-fun b!1266228 () Bool)

(assert (=> b!1266228 (= e!721187 e!721186)))

(assert (=> b!1266228 (= c!123612 (and ((_ is Cons!28320) (toList!9516 lm!212)) (= (_1!10571 (h!29538 (toList!9516 lm!212))) a1!67)))))

(declare-fun c!123610 () Bool)

(declare-fun bm!62418 () Bool)

(assert (=> bm!62418 (= call!62420 ($colon$colon!631 e!721188 (ite c!123610 (h!29538 (toList!9516 lm!212)) (tuple2!21121 a1!67 b1!78))))))

(declare-fun c!123611 () Bool)

(assert (=> bm!62418 (= c!123611 c!123610)))

(declare-fun b!1266221 () Bool)

(assert (=> b!1266221 (= e!721185 call!62419)))

(declare-fun d!139277 () Bool)

(assert (=> d!139277 e!721189))

(declare-fun res!842844 () Bool)

(assert (=> d!139277 (=> (not res!842844) (not e!721189))))

(assert (=> d!139277 (= res!842844 (isStrictlySorted!763 lt!574476))))

(assert (=> d!139277 (= lt!574476 e!721187)))

(assert (=> d!139277 (= c!123610 (and ((_ is Cons!28320) (toList!9516 lm!212)) (bvslt (_1!10571 (h!29538 (toList!9516 lm!212))) a1!67)))))

(assert (=> d!139277 (isStrictlySorted!763 (toList!9516 lm!212))))

(assert (=> d!139277 (= (insertStrictlySorted!454 (toList!9516 lm!212) a1!67 b1!78) lt!574476)))

(assert (= (and d!139277 c!123610) b!1266225))

(assert (= (and d!139277 (not c!123610)) b!1266228))

(assert (= (and b!1266228 c!123612) b!1266227))

(assert (= (and b!1266228 (not c!123612)) b!1266219))

(assert (= (and b!1266219 c!123613) b!1266223))

(assert (= (and b!1266219 (not c!123613)) b!1266221))

(assert (= (or b!1266223 b!1266221) bm!62416))

(assert (= (or b!1266227 bm!62416) bm!62417))

(assert (= (or b!1266225 bm!62417) bm!62418))

(assert (= (and bm!62418 c!123611) b!1266220))

(assert (= (and bm!62418 (not c!123611)) b!1266226))

(assert (= (and d!139277 res!842844) b!1266222))

(assert (= (and b!1266222 res!842843) b!1266224))

(declare-fun m!1166955 () Bool)

(assert (=> d!139277 m!1166955))

(assert (=> d!139277 m!1166787))

(declare-fun m!1166961 () Bool)

(assert (=> b!1266222 m!1166961))

(declare-fun m!1166965 () Bool)

(assert (=> b!1266220 m!1166965))

(declare-fun m!1166973 () Bool)

(assert (=> b!1266224 m!1166973))

(declare-fun m!1166979 () Bool)

(assert (=> bm!62418 m!1166979))

(assert (=> b!1265997 d!139277))

(declare-fun b!1266253 () Bool)

(declare-fun e!721203 () Bool)

(declare-fun tp!96254 () Bool)

(assert (=> b!1266253 (= e!721203 (and tp_is_empty!32455 tp!96254))))

(assert (=> b!1265998 (= tp!96239 e!721203)))

(assert (= (and b!1265998 ((_ is Cons!28320) (toList!9516 lm!212))) b!1266253))

(check-sat (not d!139251) (not b!1266220) (not bm!62418) (not b!1266117) (not b!1266120) (not b!1266253) tp_is_empty!32455 (not b!1266081) (not b!1266041) (not d!139277) (not d!139263) (not b!1266144) (not d!139257) (not b!1266043) (not d!139233) (not b!1266143) (not b!1266224) (not b!1266063) (not d!139269) (not d!139227) (not b!1266222))
(check-sat)
