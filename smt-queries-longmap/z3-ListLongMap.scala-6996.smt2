; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88728 () Bool)

(assert start!88728)

(declare-fun b!1019151 () Bool)

(declare-fun res!683289 () Bool)

(declare-fun e!573525 () Bool)

(assert (=> b!1019151 (=> (not res!683289) (not e!573525))))

(declare-datatypes ((B!1684 0))(
  ( (B!1685 (val!11926 Int)) )
))
(declare-datatypes ((tuple2!15398 0))(
  ( (tuple2!15399 (_1!7710 (_ BitVec 64)) (_2!7710 B!1684)) )
))
(declare-datatypes ((List!21614 0))(
  ( (Nil!21611) (Cons!21610 (h!22808 tuple2!15398) (t!30618 List!21614)) )
))
(declare-fun l!996 () List!21614)

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!539 (List!21614 (_ BitVec 64)) Bool)

(assert (=> b!1019151 (= res!683289 (containsKey!539 l!996 key!261))))

(declare-fun b!1019152 () Bool)

(declare-fun res!683290 () Bool)

(declare-fun e!573524 () Bool)

(assert (=> b!1019152 (=> (not res!683290) (not e!573524))))

(assert (=> b!1019152 (= res!683290 (containsKey!539 (t!30618 l!996) key!261))))

(declare-fun b!1019153 () Bool)

(declare-fun e!573523 () Bool)

(declare-fun tp_is_empty!23751 () Bool)

(declare-fun tp!71134 () Bool)

(assert (=> b!1019153 (= e!573523 (and tp_is_empty!23751 tp!71134))))

(declare-fun b!1019155 () Bool)

(assert (=> b!1019155 (= e!573525 e!573524)))

(declare-fun res!683288 () Bool)

(assert (=> b!1019155 (=> (not res!683288) (not e!573524))))

(get-info :version)

(assert (=> b!1019155 (= res!683288 (and ((_ is Cons!21610) l!996) (bvslt (_1!7710 (h!22808 l!996)) key!261)))))

(declare-fun value!172 () B!1684)

(declare-fun lt!449631 () List!21614)

(declare-fun insertStrictlySorted!357 (List!21614 (_ BitVec 64) B!1684) List!21614)

(assert (=> b!1019155 (= lt!449631 (insertStrictlySorted!357 l!996 key!261 value!172))))

(declare-fun b!1019156 () Bool)

(declare-fun res!683291 () Bool)

(assert (=> b!1019156 (=> (not res!683291) (not e!573524))))

(declare-fun isStrictlySorted!679 (List!21614) Bool)

(assert (=> b!1019156 (= res!683291 (isStrictlySorted!679 (t!30618 l!996)))))

(declare-fun res!683287 () Bool)

(assert (=> start!88728 (=> (not res!683287) (not e!573525))))

(assert (=> start!88728 (= res!683287 (isStrictlySorted!679 l!996))))

(assert (=> start!88728 e!573525))

(assert (=> start!88728 e!573523))

(assert (=> start!88728 true))

(assert (=> start!88728 tp_is_empty!23751))

(declare-fun b!1019154 () Bool)

(declare-fun ListPrimitiveSize!137 (List!21614) Int)

(assert (=> b!1019154 (= e!573524 (>= (ListPrimitiveSize!137 (t!30618 l!996)) (ListPrimitiveSize!137 l!996)))))

(assert (= (and start!88728 res!683287) b!1019151))

(assert (= (and b!1019151 res!683289) b!1019155))

(assert (= (and b!1019155 res!683288) b!1019156))

(assert (= (and b!1019156 res!683291) b!1019152))

(assert (= (and b!1019152 res!683290) b!1019154))

(assert (= (and start!88728 ((_ is Cons!21610) l!996)) b!1019153))

(declare-fun m!939621 () Bool)

(assert (=> b!1019156 m!939621))

(declare-fun m!939623 () Bool)

(assert (=> b!1019151 m!939623))

(declare-fun m!939625 () Bool)

(assert (=> start!88728 m!939625))

(declare-fun m!939627 () Bool)

(assert (=> b!1019155 m!939627))

(declare-fun m!939629 () Bool)

(assert (=> b!1019154 m!939629))

(declare-fun m!939631 () Bool)

(assert (=> b!1019154 m!939631))

(declare-fun m!939633 () Bool)

(assert (=> b!1019152 m!939633))

(check-sat (not b!1019155) (not start!88728) (not b!1019154) (not b!1019152) (not b!1019156) tp_is_empty!23751 (not b!1019151) (not b!1019153))
(check-sat)
(get-model)

(declare-fun d!121997 () Bool)

(declare-fun res!683311 () Bool)

(declare-fun e!573539 () Bool)

(assert (=> d!121997 (=> res!683311 e!573539)))

(assert (=> d!121997 (= res!683311 (and ((_ is Cons!21610) (t!30618 l!996)) (= (_1!7710 (h!22808 (t!30618 l!996))) key!261)))))

(assert (=> d!121997 (= (containsKey!539 (t!30618 l!996) key!261) e!573539)))

(declare-fun b!1019179 () Bool)

(declare-fun e!573540 () Bool)

(assert (=> b!1019179 (= e!573539 e!573540)))

(declare-fun res!683312 () Bool)

(assert (=> b!1019179 (=> (not res!683312) (not e!573540))))

(assert (=> b!1019179 (= res!683312 (and (or (not ((_ is Cons!21610) (t!30618 l!996))) (bvsle (_1!7710 (h!22808 (t!30618 l!996))) key!261)) ((_ is Cons!21610) (t!30618 l!996)) (bvslt (_1!7710 (h!22808 (t!30618 l!996))) key!261)))))

(declare-fun b!1019180 () Bool)

(assert (=> b!1019180 (= e!573540 (containsKey!539 (t!30618 (t!30618 l!996)) key!261))))

(assert (= (and d!121997 (not res!683311)) b!1019179))

(assert (= (and b!1019179 res!683312) b!1019180))

(declare-fun m!939649 () Bool)

(assert (=> b!1019180 m!939649))

(assert (=> b!1019152 d!121997))

(declare-fun d!122001 () Bool)

(declare-fun lt!449637 () Int)

(assert (=> d!122001 (>= lt!449637 0)))

(declare-fun e!573543 () Int)

(assert (=> d!122001 (= lt!449637 e!573543)))

(declare-fun c!103273 () Bool)

(assert (=> d!122001 (= c!103273 ((_ is Nil!21611) (t!30618 l!996)))))

(assert (=> d!122001 (= (ListPrimitiveSize!137 (t!30618 l!996)) lt!449637)))

(declare-fun b!1019185 () Bool)

(assert (=> b!1019185 (= e!573543 0)))

(declare-fun b!1019186 () Bool)

(assert (=> b!1019186 (= e!573543 (+ 1 (ListPrimitiveSize!137 (t!30618 (t!30618 l!996)))))))

(assert (= (and d!122001 c!103273) b!1019185))

(assert (= (and d!122001 (not c!103273)) b!1019186))

(declare-fun m!939651 () Bool)

(assert (=> b!1019186 m!939651))

(assert (=> b!1019154 d!122001))

(declare-fun d!122005 () Bool)

(declare-fun lt!449638 () Int)

(assert (=> d!122005 (>= lt!449638 0)))

(declare-fun e!573544 () Int)

(assert (=> d!122005 (= lt!449638 e!573544)))

(declare-fun c!103274 () Bool)

(assert (=> d!122005 (= c!103274 ((_ is Nil!21611) l!996))))

(assert (=> d!122005 (= (ListPrimitiveSize!137 l!996) lt!449638)))

(declare-fun b!1019187 () Bool)

(assert (=> b!1019187 (= e!573544 0)))

(declare-fun b!1019188 () Bool)

(assert (=> b!1019188 (= e!573544 (+ 1 (ListPrimitiveSize!137 (t!30618 l!996))))))

(assert (= (and d!122005 c!103274) b!1019187))

(assert (= (and d!122005 (not c!103274)) b!1019188))

(assert (=> b!1019188 m!939629))

(assert (=> b!1019154 d!122005))

(declare-fun d!122007 () Bool)

(declare-fun res!683323 () Bool)

(declare-fun e!573561 () Bool)

(assert (=> d!122007 (=> res!683323 e!573561)))

(assert (=> d!122007 (= res!683323 (or ((_ is Nil!21611) l!996) ((_ is Nil!21611) (t!30618 l!996))))))

(assert (=> d!122007 (= (isStrictlySorted!679 l!996) e!573561)))

(declare-fun b!1019211 () Bool)

(declare-fun e!573562 () Bool)

(assert (=> b!1019211 (= e!573561 e!573562)))

(declare-fun res!683324 () Bool)

(assert (=> b!1019211 (=> (not res!683324) (not e!573562))))

(assert (=> b!1019211 (= res!683324 (bvslt (_1!7710 (h!22808 l!996)) (_1!7710 (h!22808 (t!30618 l!996)))))))

(declare-fun b!1019212 () Bool)

(assert (=> b!1019212 (= e!573562 (isStrictlySorted!679 (t!30618 l!996)))))

(assert (= (and d!122007 (not res!683323)) b!1019211))

(assert (= (and b!1019211 res!683324) b!1019212))

(assert (=> b!1019212 m!939621))

(assert (=> start!88728 d!122007))

(declare-fun b!1019308 () Bool)

(declare-fun e!573627 () List!21614)

(declare-fun call!43065 () List!21614)

(assert (=> b!1019308 (= e!573627 call!43065)))

(declare-fun b!1019309 () Bool)

(declare-fun c!103309 () Bool)

(assert (=> b!1019309 (= c!103309 (and ((_ is Cons!21610) l!996) (bvsgt (_1!7710 (h!22808 l!996)) key!261)))))

(declare-fun e!573623 () List!21614)

(assert (=> b!1019309 (= e!573623 e!573627)))

(declare-fun b!1019310 () Bool)

(declare-fun e!573624 () List!21614)

(assert (=> b!1019310 (= e!573624 e!573623)))

(declare-fun c!103311 () Bool)

(assert (=> b!1019310 (= c!103311 (and ((_ is Cons!21610) l!996) (= (_1!7710 (h!22808 l!996)) key!261)))))

(declare-fun b!1019311 () Bool)

(declare-fun e!573625 () List!21614)

(assert (=> b!1019311 (= e!573625 (ite c!103311 (t!30618 l!996) (ite c!103309 (Cons!21610 (h!22808 l!996) (t!30618 l!996)) Nil!21611)))))

(declare-fun b!1019312 () Bool)

(declare-fun call!43064 () List!21614)

(assert (=> b!1019312 (= e!573624 call!43064)))

(declare-fun b!1019313 () Bool)

(assert (=> b!1019313 (= e!573627 call!43065)))

(declare-fun d!122011 () Bool)

(declare-fun e!573626 () Bool)

(assert (=> d!122011 e!573626))

(declare-fun res!683360 () Bool)

(assert (=> d!122011 (=> (not res!683360) (not e!573626))))

(declare-fun lt!449654 () List!21614)

(assert (=> d!122011 (= res!683360 (isStrictlySorted!679 lt!449654))))

(assert (=> d!122011 (= lt!449654 e!573624)))

(declare-fun c!103310 () Bool)

(assert (=> d!122011 (= c!103310 (and ((_ is Cons!21610) l!996) (bvslt (_1!7710 (h!22808 l!996)) key!261)))))

(assert (=> d!122011 (isStrictlySorted!679 l!996)))

(assert (=> d!122011 (= (insertStrictlySorted!357 l!996 key!261 value!172) lt!449654)))

(declare-fun b!1019314 () Bool)

(declare-fun call!43063 () List!21614)

(assert (=> b!1019314 (= e!573623 call!43063)))

(declare-fun bm!43060 () Bool)

(declare-fun $colon$colon!587 (List!21614 tuple2!15398) List!21614)

(assert (=> bm!43060 (= call!43064 ($colon$colon!587 e!573625 (ite c!103310 (h!22808 l!996) (tuple2!15399 key!261 value!172))))))

(declare-fun c!103312 () Bool)

(assert (=> bm!43060 (= c!103312 c!103310)))

(declare-fun b!1019315 () Bool)

(declare-fun res!683359 () Bool)

(assert (=> b!1019315 (=> (not res!683359) (not e!573626))))

(assert (=> b!1019315 (= res!683359 (containsKey!539 lt!449654 key!261))))

(declare-fun bm!43061 () Bool)

(assert (=> bm!43061 (= call!43063 call!43064)))

(declare-fun b!1019316 () Bool)

(assert (=> b!1019316 (= e!573625 (insertStrictlySorted!357 (t!30618 l!996) key!261 value!172))))

(declare-fun bm!43062 () Bool)

(assert (=> bm!43062 (= call!43065 call!43063)))

(declare-fun b!1019317 () Bool)

(declare-fun contains!5907 (List!21614 tuple2!15398) Bool)

(assert (=> b!1019317 (= e!573626 (contains!5907 lt!449654 (tuple2!15399 key!261 value!172)))))

(assert (= (and d!122011 c!103310) b!1019312))

(assert (= (and d!122011 (not c!103310)) b!1019310))

(assert (= (and b!1019310 c!103311) b!1019314))

(assert (= (and b!1019310 (not c!103311)) b!1019309))

(assert (= (and b!1019309 c!103309) b!1019313))

(assert (= (and b!1019309 (not c!103309)) b!1019308))

(assert (= (or b!1019313 b!1019308) bm!43062))

(assert (= (or b!1019314 bm!43062) bm!43061))

(assert (= (or b!1019312 bm!43061) bm!43060))

(assert (= (and bm!43060 c!103312) b!1019316))

(assert (= (and bm!43060 (not c!103312)) b!1019311))

(assert (= (and d!122011 res!683360) b!1019315))

(assert (= (and b!1019315 res!683359) b!1019317))

(declare-fun m!939675 () Bool)

(assert (=> bm!43060 m!939675))

(declare-fun m!939677 () Bool)

(assert (=> b!1019315 m!939677))

(declare-fun m!939679 () Bool)

(assert (=> d!122011 m!939679))

(assert (=> d!122011 m!939625))

(declare-fun m!939681 () Bool)

(assert (=> b!1019317 m!939681))

(declare-fun m!939683 () Bool)

(assert (=> b!1019316 m!939683))

(assert (=> b!1019155 d!122011))

(declare-fun d!122033 () Bool)

(declare-fun res!683361 () Bool)

(declare-fun e!573628 () Bool)

(assert (=> d!122033 (=> res!683361 e!573628)))

(assert (=> d!122033 (= res!683361 (and ((_ is Cons!21610) l!996) (= (_1!7710 (h!22808 l!996)) key!261)))))

(assert (=> d!122033 (= (containsKey!539 l!996 key!261) e!573628)))

(declare-fun b!1019318 () Bool)

(declare-fun e!573629 () Bool)

(assert (=> b!1019318 (= e!573628 e!573629)))

(declare-fun res!683362 () Bool)

(assert (=> b!1019318 (=> (not res!683362) (not e!573629))))

(assert (=> b!1019318 (= res!683362 (and (or (not ((_ is Cons!21610) l!996)) (bvsle (_1!7710 (h!22808 l!996)) key!261)) ((_ is Cons!21610) l!996) (bvslt (_1!7710 (h!22808 l!996)) key!261)))))

(declare-fun b!1019319 () Bool)

(assert (=> b!1019319 (= e!573629 (containsKey!539 (t!30618 l!996) key!261))))

(assert (= (and d!122033 (not res!683361)) b!1019318))

(assert (= (and b!1019318 res!683362) b!1019319))

(assert (=> b!1019319 m!939633))

(assert (=> b!1019151 d!122033))

(declare-fun d!122035 () Bool)

(declare-fun res!683363 () Bool)

(declare-fun e!573632 () Bool)

(assert (=> d!122035 (=> res!683363 e!573632)))

(assert (=> d!122035 (= res!683363 (or ((_ is Nil!21611) (t!30618 l!996)) ((_ is Nil!21611) (t!30618 (t!30618 l!996)))))))

(assert (=> d!122035 (= (isStrictlySorted!679 (t!30618 l!996)) e!573632)))

(declare-fun b!1019324 () Bool)

(declare-fun e!573633 () Bool)

(assert (=> b!1019324 (= e!573632 e!573633)))

(declare-fun res!683364 () Bool)

(assert (=> b!1019324 (=> (not res!683364) (not e!573633))))

(assert (=> b!1019324 (= res!683364 (bvslt (_1!7710 (h!22808 (t!30618 l!996))) (_1!7710 (h!22808 (t!30618 (t!30618 l!996))))))))

(declare-fun b!1019325 () Bool)

(assert (=> b!1019325 (= e!573633 (isStrictlySorted!679 (t!30618 (t!30618 l!996))))))

(assert (= (and d!122035 (not res!683363)) b!1019324))

(assert (= (and b!1019324 res!683364) b!1019325))

(declare-fun m!939685 () Bool)

(assert (=> b!1019325 m!939685))

(assert (=> b!1019156 d!122035))

(declare-fun b!1019334 () Bool)

(declare-fun e!573638 () Bool)

(declare-fun tp!71143 () Bool)

(assert (=> b!1019334 (= e!573638 (and tp_is_empty!23751 tp!71143))))

(assert (=> b!1019153 (= tp!71134 e!573638)))

(assert (= (and b!1019153 ((_ is Cons!21610) (t!30618 l!996))) b!1019334))

(check-sat (not b!1019188) (not b!1019186) (not bm!43060) (not d!122011) (not b!1019212) (not b!1019319) (not b!1019180) (not b!1019316) (not b!1019317) (not b!1019325) tp_is_empty!23751 (not b!1019334) (not b!1019315))
