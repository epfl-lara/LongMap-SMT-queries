; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88754 () Bool)

(assert start!88754)

(declare-fun res!683319 () Bool)

(declare-fun e!573569 () Bool)

(assert (=> start!88754 (=> (not res!683319) (not e!573569))))

(declare-datatypes ((B!1688 0))(
  ( (B!1689 (val!11928 Int)) )
))
(declare-datatypes ((tuple2!15482 0))(
  ( (tuple2!15483 (_1!7752 (_ BitVec 64)) (_2!7752 B!1688)) )
))
(declare-datatypes ((List!21651 0))(
  ( (Nil!21648) (Cons!21647 (h!22845 tuple2!15482) (t!30646 List!21651)) )
))
(declare-fun l!996 () List!21651)

(declare-fun isStrictlySorted!677 (List!21651) Bool)

(assert (=> start!88754 (= res!683319 (isStrictlySorted!677 l!996))))

(assert (=> start!88754 e!573569))

(declare-fun e!573567 () Bool)

(assert (=> start!88754 e!573567))

(assert (=> start!88754 true))

(declare-fun tp_is_empty!23755 () Bool)

(assert (=> start!88754 tp_is_empty!23755))

(declare-fun b!1019219 () Bool)

(declare-fun tp!71149 () Bool)

(assert (=> b!1019219 (= e!573567 (and tp_is_empty!23755 tp!71149))))

(declare-fun b!1019220 () Bool)

(declare-fun res!683320 () Bool)

(declare-fun e!573568 () Bool)

(assert (=> b!1019220 (=> (not res!683320) (not e!573568))))

(assert (=> b!1019220 (= res!683320 (isStrictlySorted!677 (t!30646 l!996)))))

(declare-fun b!1019221 () Bool)

(assert (=> b!1019221 (= e!573569 e!573568)))

(declare-fun res!683318 () Bool)

(assert (=> b!1019221 (=> (not res!683318) (not e!573568))))

(declare-fun key!261 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1019221 (= res!683318 (and ((_ is Cons!21647) l!996) (bvslt (_1!7752 (h!22845 l!996)) key!261)))))

(declare-fun value!172 () B!1688)

(declare-fun lt!449460 () List!21651)

(declare-fun insertStrictlySorted!360 (List!21651 (_ BitVec 64) B!1688) List!21651)

(assert (=> b!1019221 (= lt!449460 (insertStrictlySorted!360 l!996 key!261 value!172))))

(declare-fun b!1019222 () Bool)

(declare-fun res!683316 () Bool)

(assert (=> b!1019222 (=> (not res!683316) (not e!573569))))

(declare-fun containsKey!541 (List!21651 (_ BitVec 64)) Bool)

(assert (=> b!1019222 (= res!683316 (containsKey!541 l!996 key!261))))

(declare-fun b!1019223 () Bool)

(declare-fun length!44 (List!21651) Int)

(assert (=> b!1019223 (= e!573568 (not (= (length!44 lt!449460) (length!44 l!996))))))

(assert (=> b!1019223 (= (length!44 (insertStrictlySorted!360 (t!30646 l!996) key!261 value!172)) (length!44 (t!30646 l!996)))))

(declare-datatypes ((Unit!33183 0))(
  ( (Unit!33184) )
))
(declare-fun lt!449461 () Unit!33183)

(declare-fun lemmaAddExistingKeyPreservesSize!4 (List!21651 (_ BitVec 64) B!1688) Unit!33183)

(assert (=> b!1019223 (= lt!449461 (lemmaAddExistingKeyPreservesSize!4 (t!30646 l!996) key!261 value!172))))

(declare-fun b!1019224 () Bool)

(declare-fun res!683317 () Bool)

(assert (=> b!1019224 (=> (not res!683317) (not e!573568))))

(assert (=> b!1019224 (= res!683317 (containsKey!541 (t!30646 l!996) key!261))))

(assert (= (and start!88754 res!683319) b!1019222))

(assert (= (and b!1019222 res!683316) b!1019221))

(assert (= (and b!1019221 res!683318) b!1019220))

(assert (= (and b!1019220 res!683320) b!1019224))

(assert (= (and b!1019224 res!683317) b!1019223))

(assert (= (and start!88754 ((_ is Cons!21647) l!996)) b!1019219))

(declare-fun m!939079 () Bool)

(assert (=> b!1019224 m!939079))

(declare-fun m!939081 () Bool)

(assert (=> b!1019221 m!939081))

(declare-fun m!939083 () Bool)

(assert (=> b!1019223 m!939083))

(declare-fun m!939085 () Bool)

(assert (=> b!1019223 m!939085))

(declare-fun m!939087 () Bool)

(assert (=> b!1019223 m!939087))

(declare-fun m!939089 () Bool)

(assert (=> b!1019223 m!939089))

(assert (=> b!1019223 m!939083))

(declare-fun m!939091 () Bool)

(assert (=> b!1019223 m!939091))

(declare-fun m!939093 () Bool)

(assert (=> b!1019223 m!939093))

(declare-fun m!939095 () Bool)

(assert (=> start!88754 m!939095))

(declare-fun m!939097 () Bool)

(assert (=> b!1019220 m!939097))

(declare-fun m!939099 () Bool)

(assert (=> b!1019222 m!939099))

(check-sat (not b!1019223) (not b!1019220) (not b!1019224) (not b!1019222) (not b!1019221) (not start!88754) (not b!1019219) tp_is_empty!23755)
(check-sat)
(get-model)

(declare-fun d!121891 () Bool)

(declare-fun res!683355 () Bool)

(declare-fun e!573592 () Bool)

(assert (=> d!121891 (=> res!683355 e!573592)))

(assert (=> d!121891 (= res!683355 (or ((_ is Nil!21648) l!996) ((_ is Nil!21648) (t!30646 l!996))))))

(assert (=> d!121891 (= (isStrictlySorted!677 l!996) e!573592)))

(declare-fun b!1019265 () Bool)

(declare-fun e!573593 () Bool)

(assert (=> b!1019265 (= e!573592 e!573593)))

(declare-fun res!683356 () Bool)

(assert (=> b!1019265 (=> (not res!683356) (not e!573593))))

(assert (=> b!1019265 (= res!683356 (bvslt (_1!7752 (h!22845 l!996)) (_1!7752 (h!22845 (t!30646 l!996)))))))

(declare-fun b!1019266 () Bool)

(assert (=> b!1019266 (= e!573593 (isStrictlySorted!677 (t!30646 l!996)))))

(assert (= (and d!121891 (not res!683355)) b!1019265))

(assert (= (and b!1019265 res!683356) b!1019266))

(assert (=> b!1019266 m!939097))

(assert (=> start!88754 d!121891))

(declare-fun d!121895 () Bool)

(declare-fun res!683361 () Bool)

(declare-fun e!573598 () Bool)

(assert (=> d!121895 (=> res!683361 e!573598)))

(assert (=> d!121895 (= res!683361 (and ((_ is Cons!21647) (t!30646 l!996)) (= (_1!7752 (h!22845 (t!30646 l!996))) key!261)))))

(assert (=> d!121895 (= (containsKey!541 (t!30646 l!996) key!261) e!573598)))

(declare-fun b!1019271 () Bool)

(declare-fun e!573599 () Bool)

(assert (=> b!1019271 (= e!573598 e!573599)))

(declare-fun res!683362 () Bool)

(assert (=> b!1019271 (=> (not res!683362) (not e!573599))))

(assert (=> b!1019271 (= res!683362 (and (or (not ((_ is Cons!21647) (t!30646 l!996))) (bvsle (_1!7752 (h!22845 (t!30646 l!996))) key!261)) ((_ is Cons!21647) (t!30646 l!996)) (bvslt (_1!7752 (h!22845 (t!30646 l!996))) key!261)))))

(declare-fun b!1019272 () Bool)

(assert (=> b!1019272 (= e!573599 (containsKey!541 (t!30646 (t!30646 l!996)) key!261))))

(assert (= (and d!121895 (not res!683361)) b!1019271))

(assert (= (and b!1019271 res!683362) b!1019272))

(declare-fun m!939147 () Bool)

(assert (=> b!1019272 m!939147))

(assert (=> b!1019224 d!121895))

(declare-fun b!1019341 () Bool)

(declare-fun e!573645 () List!21651)

(assert (=> b!1019341 (= e!573645 (insertStrictlySorted!360 (t!30646 l!996) key!261 value!172))))

(declare-fun b!1019342 () Bool)

(declare-fun res!683392 () Bool)

(declare-fun e!573644 () Bool)

(assert (=> b!1019342 (=> (not res!683392) (not e!573644))))

(declare-fun lt!449482 () List!21651)

(assert (=> b!1019342 (= res!683392 (containsKey!541 lt!449482 key!261))))

(declare-fun b!1019343 () Bool)

(declare-fun e!573643 () List!21651)

(declare-fun e!573647 () List!21651)

(assert (=> b!1019343 (= e!573643 e!573647)))

(declare-fun c!103304 () Bool)

(assert (=> b!1019343 (= c!103304 (and ((_ is Cons!21647) l!996) (= (_1!7752 (h!22845 l!996)) key!261)))))

(declare-fun b!1019344 () Bool)

(declare-fun e!573646 () List!21651)

(declare-fun call!43068 () List!21651)

(assert (=> b!1019344 (= e!573646 call!43068)))

(declare-fun b!1019345 () Bool)

(declare-fun call!43067 () List!21651)

(assert (=> b!1019345 (= e!573647 call!43067)))

(declare-fun b!1019346 () Bool)

(declare-fun c!103305 () Bool)

(assert (=> b!1019346 (= c!103305 (and ((_ is Cons!21647) l!996) (bvsgt (_1!7752 (h!22845 l!996)) key!261)))))

(assert (=> b!1019346 (= e!573647 e!573646)))

(declare-fun b!1019347 () Bool)

(declare-fun call!43069 () List!21651)

(assert (=> b!1019347 (= e!573643 call!43069)))

(declare-fun b!1019348 () Bool)

(assert (=> b!1019348 (= e!573645 (ite c!103304 (t!30646 l!996) (ite c!103305 (Cons!21647 (h!22845 l!996) (t!30646 l!996)) Nil!21648)))))

(declare-fun c!103303 () Bool)

(declare-fun bm!43064 () Bool)

(declare-fun $colon$colon!592 (List!21651 tuple2!15482) List!21651)

(assert (=> bm!43064 (= call!43069 ($colon$colon!592 e!573645 (ite c!103303 (h!22845 l!996) (tuple2!15483 key!261 value!172))))))

(declare-fun c!103306 () Bool)

(assert (=> bm!43064 (= c!103306 c!103303)))

(declare-fun bm!43065 () Bool)

(assert (=> bm!43065 (= call!43067 call!43069)))

(declare-fun b!1019349 () Bool)

(declare-fun contains!5884 (List!21651 tuple2!15482) Bool)

(assert (=> b!1019349 (= e!573644 (contains!5884 lt!449482 (tuple2!15483 key!261 value!172)))))

(declare-fun d!121899 () Bool)

(assert (=> d!121899 e!573644))

(declare-fun res!683391 () Bool)

(assert (=> d!121899 (=> (not res!683391) (not e!573644))))

(assert (=> d!121899 (= res!683391 (isStrictlySorted!677 lt!449482))))

(assert (=> d!121899 (= lt!449482 e!573643)))

(assert (=> d!121899 (= c!103303 (and ((_ is Cons!21647) l!996) (bvslt (_1!7752 (h!22845 l!996)) key!261)))))

(assert (=> d!121899 (isStrictlySorted!677 l!996)))

(assert (=> d!121899 (= (insertStrictlySorted!360 l!996 key!261 value!172) lt!449482)))

(declare-fun bm!43066 () Bool)

(assert (=> bm!43066 (= call!43068 call!43067)))

(declare-fun b!1019350 () Bool)

(assert (=> b!1019350 (= e!573646 call!43068)))

(assert (= (and d!121899 c!103303) b!1019347))

(assert (= (and d!121899 (not c!103303)) b!1019343))

(assert (= (and b!1019343 c!103304) b!1019345))

(assert (= (and b!1019343 (not c!103304)) b!1019346))

(assert (= (and b!1019346 c!103305) b!1019350))

(assert (= (and b!1019346 (not c!103305)) b!1019344))

(assert (= (or b!1019350 b!1019344) bm!43066))

(assert (= (or b!1019345 bm!43066) bm!43065))

(assert (= (or b!1019347 bm!43065) bm!43064))

(assert (= (and bm!43064 c!103306) b!1019341))

(assert (= (and bm!43064 (not c!103306)) b!1019348))

(assert (= (and d!121899 res!683391) b!1019342))

(assert (= (and b!1019342 res!683392) b!1019349))

(declare-fun m!939167 () Bool)

(assert (=> d!121899 m!939167))

(assert (=> d!121899 m!939095))

(assert (=> b!1019341 m!939083))

(declare-fun m!939171 () Bool)

(assert (=> b!1019349 m!939171))

(declare-fun m!939175 () Bool)

(assert (=> bm!43064 m!939175))

(declare-fun m!939177 () Bool)

(assert (=> b!1019342 m!939177))

(assert (=> b!1019221 d!121899))

(declare-fun d!121919 () Bool)

(declare-fun res!683395 () Bool)

(declare-fun e!573653 () Bool)

(assert (=> d!121919 (=> res!683395 e!573653)))

(assert (=> d!121919 (= res!683395 (or ((_ is Nil!21648) (t!30646 l!996)) ((_ is Nil!21648) (t!30646 (t!30646 l!996)))))))

(assert (=> d!121919 (= (isStrictlySorted!677 (t!30646 l!996)) e!573653)))

(declare-fun b!1019361 () Bool)

(declare-fun e!573654 () Bool)

(assert (=> b!1019361 (= e!573653 e!573654)))

(declare-fun res!683396 () Bool)

(assert (=> b!1019361 (=> (not res!683396) (not e!573654))))

(assert (=> b!1019361 (= res!683396 (bvslt (_1!7752 (h!22845 (t!30646 l!996))) (_1!7752 (h!22845 (t!30646 (t!30646 l!996))))))))

(declare-fun b!1019362 () Bool)

(assert (=> b!1019362 (= e!573654 (isStrictlySorted!677 (t!30646 (t!30646 l!996))))))

(assert (= (and d!121919 (not res!683395)) b!1019361))

(assert (= (and b!1019361 res!683396) b!1019362))

(declare-fun m!939183 () Bool)

(assert (=> b!1019362 m!939183))

(assert (=> b!1019220 d!121919))

(declare-fun d!121923 () Bool)

(declare-fun res!683397 () Bool)

(declare-fun e!573655 () Bool)

(assert (=> d!121923 (=> res!683397 e!573655)))

(assert (=> d!121923 (= res!683397 (and ((_ is Cons!21647) l!996) (= (_1!7752 (h!22845 l!996)) key!261)))))

(assert (=> d!121923 (= (containsKey!541 l!996 key!261) e!573655)))

(declare-fun b!1019363 () Bool)

(declare-fun e!573656 () Bool)

(assert (=> b!1019363 (= e!573655 e!573656)))

(declare-fun res!683398 () Bool)

(assert (=> b!1019363 (=> (not res!683398) (not e!573656))))

(assert (=> b!1019363 (= res!683398 (and (or (not ((_ is Cons!21647) l!996)) (bvsle (_1!7752 (h!22845 l!996)) key!261)) ((_ is Cons!21647) l!996) (bvslt (_1!7752 (h!22845 l!996)) key!261)))))

(declare-fun b!1019364 () Bool)

(assert (=> b!1019364 (= e!573656 (containsKey!541 (t!30646 l!996) key!261))))

(assert (= (and d!121923 (not res!683397)) b!1019363))

(assert (= (and b!1019363 res!683398) b!1019364))

(assert (=> b!1019364 m!939079))

(assert (=> b!1019222 d!121923))

(declare-fun b!1019365 () Bool)

(declare-fun e!573659 () List!21651)

(assert (=> b!1019365 (= e!573659 (insertStrictlySorted!360 (t!30646 (t!30646 l!996)) key!261 value!172))))

(declare-fun b!1019366 () Bool)

(declare-fun res!683400 () Bool)

(declare-fun e!573658 () Bool)

(assert (=> b!1019366 (=> (not res!683400) (not e!573658))))

(declare-fun lt!449484 () List!21651)

(assert (=> b!1019366 (= res!683400 (containsKey!541 lt!449484 key!261))))

(declare-fun b!1019367 () Bool)

(declare-fun e!573657 () List!21651)

(declare-fun e!573661 () List!21651)

(assert (=> b!1019367 (= e!573657 e!573661)))

(declare-fun c!103312 () Bool)

(assert (=> b!1019367 (= c!103312 (and ((_ is Cons!21647) (t!30646 l!996)) (= (_1!7752 (h!22845 (t!30646 l!996))) key!261)))))

(declare-fun b!1019368 () Bool)

(declare-fun e!573660 () List!21651)

(declare-fun call!43074 () List!21651)

(assert (=> b!1019368 (= e!573660 call!43074)))

(declare-fun b!1019369 () Bool)

(declare-fun call!43073 () List!21651)

(assert (=> b!1019369 (= e!573661 call!43073)))

(declare-fun b!1019370 () Bool)

(declare-fun c!103313 () Bool)

(assert (=> b!1019370 (= c!103313 (and ((_ is Cons!21647) (t!30646 l!996)) (bvsgt (_1!7752 (h!22845 (t!30646 l!996))) key!261)))))

(assert (=> b!1019370 (= e!573661 e!573660)))

(declare-fun b!1019371 () Bool)

(declare-fun call!43075 () List!21651)

(assert (=> b!1019371 (= e!573657 call!43075)))

(declare-fun b!1019372 () Bool)

(assert (=> b!1019372 (= e!573659 (ite c!103312 (t!30646 (t!30646 l!996)) (ite c!103313 (Cons!21647 (h!22845 (t!30646 l!996)) (t!30646 (t!30646 l!996))) Nil!21648)))))

(declare-fun bm!43070 () Bool)

(declare-fun c!103311 () Bool)

(assert (=> bm!43070 (= call!43075 ($colon$colon!592 e!573659 (ite c!103311 (h!22845 (t!30646 l!996)) (tuple2!15483 key!261 value!172))))))

(declare-fun c!103314 () Bool)

(assert (=> bm!43070 (= c!103314 c!103311)))

(declare-fun bm!43071 () Bool)

(assert (=> bm!43071 (= call!43073 call!43075)))

(declare-fun b!1019373 () Bool)

(assert (=> b!1019373 (= e!573658 (contains!5884 lt!449484 (tuple2!15483 key!261 value!172)))))

(declare-fun d!121925 () Bool)

(assert (=> d!121925 e!573658))

(declare-fun res!683399 () Bool)

(assert (=> d!121925 (=> (not res!683399) (not e!573658))))

(assert (=> d!121925 (= res!683399 (isStrictlySorted!677 lt!449484))))

(assert (=> d!121925 (= lt!449484 e!573657)))

(assert (=> d!121925 (= c!103311 (and ((_ is Cons!21647) (t!30646 l!996)) (bvslt (_1!7752 (h!22845 (t!30646 l!996))) key!261)))))

(assert (=> d!121925 (isStrictlySorted!677 (t!30646 l!996))))

(assert (=> d!121925 (= (insertStrictlySorted!360 (t!30646 l!996) key!261 value!172) lt!449484)))

(declare-fun bm!43072 () Bool)

(assert (=> bm!43072 (= call!43074 call!43073)))

(declare-fun b!1019374 () Bool)

(assert (=> b!1019374 (= e!573660 call!43074)))

(assert (= (and d!121925 c!103311) b!1019371))

(assert (= (and d!121925 (not c!103311)) b!1019367))

(assert (= (and b!1019367 c!103312) b!1019369))

(assert (= (and b!1019367 (not c!103312)) b!1019370))

(assert (= (and b!1019370 c!103313) b!1019374))

(assert (= (and b!1019370 (not c!103313)) b!1019368))

(assert (= (or b!1019374 b!1019368) bm!43072))

(assert (= (or b!1019369 bm!43072) bm!43071))

(assert (= (or b!1019371 bm!43071) bm!43070))

(assert (= (and bm!43070 c!103314) b!1019365))

(assert (= (and bm!43070 (not c!103314)) b!1019372))

(assert (= (and d!121925 res!683399) b!1019366))

(assert (= (and b!1019366 res!683400) b!1019373))

(declare-fun m!939185 () Bool)

(assert (=> d!121925 m!939185))

(assert (=> d!121925 m!939097))

(declare-fun m!939187 () Bool)

(assert (=> b!1019365 m!939187))

(declare-fun m!939189 () Bool)

(assert (=> b!1019373 m!939189))

(declare-fun m!939191 () Bool)

(assert (=> bm!43070 m!939191))

(declare-fun m!939193 () Bool)

(assert (=> b!1019366 m!939193))

(assert (=> b!1019223 d!121925))

(declare-fun d!121927 () Bool)

(declare-fun size!31129 (List!21651) Int)

(assert (=> d!121927 (= (length!44 lt!449460) (size!31129 lt!449460))))

(declare-fun bs!29662 () Bool)

(assert (= bs!29662 d!121927))

(declare-fun m!939195 () Bool)

(assert (=> bs!29662 m!939195))

(assert (=> b!1019223 d!121927))

(declare-fun d!121929 () Bool)

(assert (=> d!121929 (= (length!44 (t!30646 l!996)) (size!31129 (t!30646 l!996)))))

(declare-fun bs!29663 () Bool)

(assert (= bs!29663 d!121929))

(declare-fun m!939197 () Bool)

(assert (=> bs!29663 m!939197))

(assert (=> b!1019223 d!121929))

(declare-fun d!121931 () Bool)

(assert (=> d!121931 (= (length!44 l!996) (size!31129 l!996))))

(declare-fun bs!29664 () Bool)

(assert (= bs!29664 d!121931))

(declare-fun m!939199 () Bool)

(assert (=> bs!29664 m!939199))

(assert (=> b!1019223 d!121931))

(declare-fun d!121933 () Bool)

(assert (=> d!121933 (= (length!44 (insertStrictlySorted!360 (t!30646 l!996) key!261 value!172)) (length!44 (t!30646 l!996)))))

(declare-fun lt!449489 () Unit!33183)

(declare-fun choose!1683 (List!21651 (_ BitVec 64) B!1688) Unit!33183)

(assert (=> d!121933 (= lt!449489 (choose!1683 (t!30646 l!996) key!261 value!172))))

(assert (=> d!121933 (= (lemmaAddExistingKeyPreservesSize!4 (t!30646 l!996) key!261 value!172) lt!449489)))

(declare-fun bs!29665 () Bool)

(assert (= bs!29665 d!121933))

(assert (=> bs!29665 m!939083))

(assert (=> bs!29665 m!939083))

(assert (=> bs!29665 m!939085))

(assert (=> bs!29665 m!939091))

(declare-fun m!939205 () Bool)

(assert (=> bs!29665 m!939205))

(assert (=> b!1019223 d!121933))

(declare-fun d!121939 () Bool)

(assert (=> d!121939 (= (length!44 (insertStrictlySorted!360 (t!30646 l!996) key!261 value!172)) (size!31129 (insertStrictlySorted!360 (t!30646 l!996) key!261 value!172)))))

(declare-fun bs!29666 () Bool)

(assert (= bs!29666 d!121939))

(assert (=> bs!29666 m!939083))

(declare-fun m!939207 () Bool)

(assert (=> bs!29666 m!939207))

(assert (=> b!1019223 d!121939))

(declare-fun b!1019414 () Bool)

(declare-fun e!573687 () Bool)

(declare-fun tp!71161 () Bool)

(assert (=> b!1019414 (= e!573687 (and tp_is_empty!23755 tp!71161))))

(assert (=> b!1019219 (= tp!71149 e!573687)))

(assert (= (and b!1019219 ((_ is Cons!21647) (t!30646 l!996))) b!1019414))

(check-sat (not b!1019272) (not d!121931) (not d!121933) (not b!1019266) (not bm!43064) (not d!121925) (not b!1019365) (not b!1019341) (not b!1019414) tp_is_empty!23755 (not b!1019342) (not d!121899) (not b!1019364) (not d!121927) (not d!121939) (not b!1019366) (not bm!43070) (not d!121929) (not b!1019373) (not b!1019362) (not b!1019349))
(check-sat)
(get-model)

(declare-fun d!121957 () Bool)

(declare-fun res!683423 () Bool)

(declare-fun e!573705 () Bool)

(assert (=> d!121957 (=> res!683423 e!573705)))

(assert (=> d!121957 (= res!683423 (or ((_ is Nil!21648) lt!449482) ((_ is Nil!21648) (t!30646 lt!449482))))))

(assert (=> d!121957 (= (isStrictlySorted!677 lt!449482) e!573705)))

(declare-fun b!1019444 () Bool)

(declare-fun e!573706 () Bool)

(assert (=> b!1019444 (= e!573705 e!573706)))

(declare-fun res!683424 () Bool)

(assert (=> b!1019444 (=> (not res!683424) (not e!573706))))

(assert (=> b!1019444 (= res!683424 (bvslt (_1!7752 (h!22845 lt!449482)) (_1!7752 (h!22845 (t!30646 lt!449482)))))))

(declare-fun b!1019445 () Bool)

(assert (=> b!1019445 (= e!573706 (isStrictlySorted!677 (t!30646 lt!449482)))))

(assert (= (and d!121957 (not res!683423)) b!1019444))

(assert (= (and b!1019444 res!683424) b!1019445))

(declare-fun m!939241 () Bool)

(assert (=> b!1019445 m!939241))

(assert (=> d!121899 d!121957))

(assert (=> d!121899 d!121891))

(declare-fun d!121959 () Bool)

(declare-fun res!683425 () Bool)

(declare-fun e!573707 () Bool)

(assert (=> d!121959 (=> res!683425 e!573707)))

(assert (=> d!121959 (= res!683425 (and ((_ is Cons!21647) lt!449484) (= (_1!7752 (h!22845 lt!449484)) key!261)))))

(assert (=> d!121959 (= (containsKey!541 lt!449484 key!261) e!573707)))

(declare-fun b!1019446 () Bool)

(declare-fun e!573708 () Bool)

(assert (=> b!1019446 (= e!573707 e!573708)))

(declare-fun res!683426 () Bool)

(assert (=> b!1019446 (=> (not res!683426) (not e!573708))))

(assert (=> b!1019446 (= res!683426 (and (or (not ((_ is Cons!21647) lt!449484)) (bvsle (_1!7752 (h!22845 lt!449484)) key!261)) ((_ is Cons!21647) lt!449484) (bvslt (_1!7752 (h!22845 lt!449484)) key!261)))))

(declare-fun b!1019447 () Bool)

(assert (=> b!1019447 (= e!573708 (containsKey!541 (t!30646 lt!449484) key!261))))

(assert (= (and d!121959 (not res!683425)) b!1019446))

(assert (= (and b!1019446 res!683426) b!1019447))

(declare-fun m!939243 () Bool)

(assert (=> b!1019447 m!939243))

(assert (=> b!1019366 d!121959))

(declare-fun d!121961 () Bool)

(declare-fun res!683427 () Bool)

(declare-fun e!573709 () Bool)

(assert (=> d!121961 (=> res!683427 e!573709)))

(assert (=> d!121961 (= res!683427 (and ((_ is Cons!21647) lt!449482) (= (_1!7752 (h!22845 lt!449482)) key!261)))))

(assert (=> d!121961 (= (containsKey!541 lt!449482 key!261) e!573709)))

(declare-fun b!1019448 () Bool)

(declare-fun e!573710 () Bool)

(assert (=> b!1019448 (= e!573709 e!573710)))

(declare-fun res!683428 () Bool)

(assert (=> b!1019448 (=> (not res!683428) (not e!573710))))

(assert (=> b!1019448 (= res!683428 (and (or (not ((_ is Cons!21647) lt!449482)) (bvsle (_1!7752 (h!22845 lt!449482)) key!261)) ((_ is Cons!21647) lt!449482) (bvslt (_1!7752 (h!22845 lt!449482)) key!261)))))

(declare-fun b!1019449 () Bool)

(assert (=> b!1019449 (= e!573710 (containsKey!541 (t!30646 lt!449482) key!261))))

(assert (= (and d!121961 (not res!683427)) b!1019448))

(assert (= (and b!1019448 res!683428) b!1019449))

(declare-fun m!939245 () Bool)

(assert (=> b!1019449 m!939245))

(assert (=> b!1019342 d!121961))

(declare-fun d!121963 () Bool)

(declare-fun res!683429 () Bool)

(declare-fun e!573711 () Bool)

(assert (=> d!121963 (=> res!683429 e!573711)))

(assert (=> d!121963 (= res!683429 (or ((_ is Nil!21648) (t!30646 (t!30646 l!996))) ((_ is Nil!21648) (t!30646 (t!30646 (t!30646 l!996))))))))

(assert (=> d!121963 (= (isStrictlySorted!677 (t!30646 (t!30646 l!996))) e!573711)))

(declare-fun b!1019450 () Bool)

(declare-fun e!573712 () Bool)

(assert (=> b!1019450 (= e!573711 e!573712)))

(declare-fun res!683430 () Bool)

(assert (=> b!1019450 (=> (not res!683430) (not e!573712))))

(assert (=> b!1019450 (= res!683430 (bvslt (_1!7752 (h!22845 (t!30646 (t!30646 l!996)))) (_1!7752 (h!22845 (t!30646 (t!30646 (t!30646 l!996)))))))))

(declare-fun b!1019451 () Bool)

(assert (=> b!1019451 (= e!573712 (isStrictlySorted!677 (t!30646 (t!30646 (t!30646 l!996)))))))

(assert (= (and d!121963 (not res!683429)) b!1019450))

(assert (= (and b!1019450 res!683430) b!1019451))

(declare-fun m!939247 () Bool)

(assert (=> b!1019451 m!939247))

(assert (=> b!1019362 d!121963))

(declare-fun d!121965 () Bool)

(declare-fun lt!449497 () Int)

(assert (=> d!121965 (>= lt!449497 0)))

(declare-fun e!573715 () Int)

(assert (=> d!121965 (= lt!449497 e!573715)))

(declare-fun c!103333 () Bool)

(assert (=> d!121965 (= c!103333 ((_ is Nil!21648) (insertStrictlySorted!360 (t!30646 l!996) key!261 value!172)))))

(assert (=> d!121965 (= (size!31129 (insertStrictlySorted!360 (t!30646 l!996) key!261 value!172)) lt!449497)))

(declare-fun b!1019456 () Bool)

(assert (=> b!1019456 (= e!573715 0)))

(declare-fun b!1019457 () Bool)

(assert (=> b!1019457 (= e!573715 (+ 1 (size!31129 (t!30646 (insertStrictlySorted!360 (t!30646 l!996) key!261 value!172)))))))

(assert (= (and d!121965 c!103333) b!1019456))

(assert (= (and d!121965 (not c!103333)) b!1019457))

(declare-fun m!939249 () Bool)

(assert (=> b!1019457 m!939249))

(assert (=> d!121939 d!121965))

(assert (=> b!1019364 d!121895))

(declare-fun d!121967 () Bool)

(declare-fun lt!449498 () Int)

(assert (=> d!121967 (>= lt!449498 0)))

(declare-fun e!573716 () Int)

(assert (=> d!121967 (= lt!449498 e!573716)))

(declare-fun c!103334 () Bool)

(assert (=> d!121967 (= c!103334 ((_ is Nil!21648) (t!30646 l!996)))))

(assert (=> d!121967 (= (size!31129 (t!30646 l!996)) lt!449498)))

(declare-fun b!1019458 () Bool)

(assert (=> b!1019458 (= e!573716 0)))

(declare-fun b!1019459 () Bool)

(assert (=> b!1019459 (= e!573716 (+ 1 (size!31129 (t!30646 (t!30646 l!996)))))))

(assert (= (and d!121967 c!103334) b!1019458))

(assert (= (and d!121967 (not c!103334)) b!1019459))

(declare-fun m!939251 () Bool)

(assert (=> b!1019459 m!939251))

(assert (=> d!121929 d!121967))

(declare-fun d!121969 () Bool)

(declare-fun res!683431 () Bool)

(declare-fun e!573717 () Bool)

(assert (=> d!121969 (=> res!683431 e!573717)))

(assert (=> d!121969 (= res!683431 (or ((_ is Nil!21648) lt!449484) ((_ is Nil!21648) (t!30646 lt!449484))))))

(assert (=> d!121969 (= (isStrictlySorted!677 lt!449484) e!573717)))

(declare-fun b!1019460 () Bool)

(declare-fun e!573718 () Bool)

(assert (=> b!1019460 (= e!573717 e!573718)))

(declare-fun res!683432 () Bool)

(assert (=> b!1019460 (=> (not res!683432) (not e!573718))))

(assert (=> b!1019460 (= res!683432 (bvslt (_1!7752 (h!22845 lt!449484)) (_1!7752 (h!22845 (t!30646 lt!449484)))))))

(declare-fun b!1019461 () Bool)

(assert (=> b!1019461 (= e!573718 (isStrictlySorted!677 (t!30646 lt!449484)))))

(assert (= (and d!121969 (not res!683431)) b!1019460))

(assert (= (and b!1019460 res!683432) b!1019461))

(declare-fun m!939253 () Bool)

(assert (=> b!1019461 m!939253))

(assert (=> d!121925 d!121969))

(assert (=> d!121925 d!121919))

(assert (=> d!121933 d!121939))

(assert (=> d!121933 d!121925))

(assert (=> d!121933 d!121929))

(declare-fun d!121971 () Bool)

(assert (=> d!121971 (= (length!44 (insertStrictlySorted!360 (t!30646 l!996) key!261 value!172)) (length!44 (t!30646 l!996)))))

(assert (=> d!121971 true))

(declare-fun _$10!25 () Unit!33183)

(assert (=> d!121971 (= (choose!1683 (t!30646 l!996) key!261 value!172) _$10!25)))

(declare-fun bs!29672 () Bool)

(assert (= bs!29672 d!121971))

(assert (=> bs!29672 m!939083))

(assert (=> bs!29672 m!939083))

(assert (=> bs!29672 m!939085))

(assert (=> bs!29672 m!939091))

(assert (=> d!121933 d!121971))

(declare-fun d!121973 () Bool)

(declare-fun lt!449499 () Int)

(assert (=> d!121973 (>= lt!449499 0)))

(declare-fun e!573719 () Int)

(assert (=> d!121973 (= lt!449499 e!573719)))

(declare-fun c!103335 () Bool)

(assert (=> d!121973 (= c!103335 ((_ is Nil!21648) lt!449460))))

(assert (=> d!121973 (= (size!31129 lt!449460) lt!449499)))

(declare-fun b!1019462 () Bool)

(assert (=> b!1019462 (= e!573719 0)))

(declare-fun b!1019463 () Bool)

(assert (=> b!1019463 (= e!573719 (+ 1 (size!31129 (t!30646 lt!449460))))))

(assert (= (and d!121973 c!103335) b!1019462))

(assert (= (and d!121973 (not c!103335)) b!1019463))

(declare-fun m!939255 () Bool)

(assert (=> b!1019463 m!939255))

(assert (=> d!121927 d!121973))

(assert (=> b!1019266 d!121919))

(declare-fun d!121975 () Bool)

(assert (=> d!121975 (= ($colon$colon!592 e!573659 (ite c!103311 (h!22845 (t!30646 l!996)) (tuple2!15483 key!261 value!172))) (Cons!21647 (ite c!103311 (h!22845 (t!30646 l!996)) (tuple2!15483 key!261 value!172)) e!573659))))

(assert (=> bm!43070 d!121975))

(declare-fun d!121977 () Bool)

(assert (=> d!121977 (= ($colon$colon!592 e!573645 (ite c!103303 (h!22845 l!996) (tuple2!15483 key!261 value!172))) (Cons!21647 (ite c!103303 (h!22845 l!996) (tuple2!15483 key!261 value!172)) e!573645))))

(assert (=> bm!43064 d!121977))

(declare-fun d!121979 () Bool)

(declare-fun res!683433 () Bool)

(declare-fun e!573720 () Bool)

(assert (=> d!121979 (=> res!683433 e!573720)))

(assert (=> d!121979 (= res!683433 (and ((_ is Cons!21647) (t!30646 (t!30646 l!996))) (= (_1!7752 (h!22845 (t!30646 (t!30646 l!996)))) key!261)))))

(assert (=> d!121979 (= (containsKey!541 (t!30646 (t!30646 l!996)) key!261) e!573720)))

(declare-fun b!1019464 () Bool)

(declare-fun e!573721 () Bool)

(assert (=> b!1019464 (= e!573720 e!573721)))

(declare-fun res!683434 () Bool)

(assert (=> b!1019464 (=> (not res!683434) (not e!573721))))

(assert (=> b!1019464 (= res!683434 (and (or (not ((_ is Cons!21647) (t!30646 (t!30646 l!996)))) (bvsle (_1!7752 (h!22845 (t!30646 (t!30646 l!996)))) key!261)) ((_ is Cons!21647) (t!30646 (t!30646 l!996))) (bvslt (_1!7752 (h!22845 (t!30646 (t!30646 l!996)))) key!261)))))

(declare-fun b!1019465 () Bool)

(assert (=> b!1019465 (= e!573721 (containsKey!541 (t!30646 (t!30646 (t!30646 l!996))) key!261))))

(assert (= (and d!121979 (not res!683433)) b!1019464))

(assert (= (and b!1019464 res!683434) b!1019465))

(declare-fun m!939257 () Bool)

(assert (=> b!1019465 m!939257))

(assert (=> b!1019272 d!121979))

(declare-fun b!1019466 () Bool)

(declare-fun e!573724 () List!21651)

(assert (=> b!1019466 (= e!573724 (insertStrictlySorted!360 (t!30646 (t!30646 (t!30646 l!996))) key!261 value!172))))

(declare-fun b!1019467 () Bool)

(declare-fun res!683436 () Bool)

(declare-fun e!573723 () Bool)

(assert (=> b!1019467 (=> (not res!683436) (not e!573723))))

(declare-fun lt!449500 () List!21651)

(assert (=> b!1019467 (= res!683436 (containsKey!541 lt!449500 key!261))))

(declare-fun b!1019468 () Bool)

(declare-fun e!573722 () List!21651)

(declare-fun e!573726 () List!21651)

(assert (=> b!1019468 (= e!573722 e!573726)))

(declare-fun c!103337 () Bool)

(assert (=> b!1019468 (= c!103337 (and ((_ is Cons!21647) (t!30646 (t!30646 l!996))) (= (_1!7752 (h!22845 (t!30646 (t!30646 l!996)))) key!261)))))

(declare-fun b!1019469 () Bool)

(declare-fun e!573725 () List!21651)

(declare-fun call!43089 () List!21651)

(assert (=> b!1019469 (= e!573725 call!43089)))

(declare-fun b!1019470 () Bool)

(declare-fun call!43088 () List!21651)

(assert (=> b!1019470 (= e!573726 call!43088)))

(declare-fun b!1019471 () Bool)

(declare-fun c!103338 () Bool)

(assert (=> b!1019471 (= c!103338 (and ((_ is Cons!21647) (t!30646 (t!30646 l!996))) (bvsgt (_1!7752 (h!22845 (t!30646 (t!30646 l!996)))) key!261)))))

(assert (=> b!1019471 (= e!573726 e!573725)))

(declare-fun b!1019472 () Bool)

(declare-fun call!43090 () List!21651)

(assert (=> b!1019472 (= e!573722 call!43090)))

(declare-fun b!1019473 () Bool)

(assert (=> b!1019473 (= e!573724 (ite c!103337 (t!30646 (t!30646 (t!30646 l!996))) (ite c!103338 (Cons!21647 (h!22845 (t!30646 (t!30646 l!996))) (t!30646 (t!30646 (t!30646 l!996)))) Nil!21648)))))

(declare-fun bm!43085 () Bool)

(declare-fun c!103336 () Bool)

(assert (=> bm!43085 (= call!43090 ($colon$colon!592 e!573724 (ite c!103336 (h!22845 (t!30646 (t!30646 l!996))) (tuple2!15483 key!261 value!172))))))

(declare-fun c!103339 () Bool)

(assert (=> bm!43085 (= c!103339 c!103336)))

(declare-fun bm!43086 () Bool)

(assert (=> bm!43086 (= call!43088 call!43090)))

(declare-fun b!1019474 () Bool)

(assert (=> b!1019474 (= e!573723 (contains!5884 lt!449500 (tuple2!15483 key!261 value!172)))))

(declare-fun d!121981 () Bool)

(assert (=> d!121981 e!573723))

(declare-fun res!683435 () Bool)

(assert (=> d!121981 (=> (not res!683435) (not e!573723))))

(assert (=> d!121981 (= res!683435 (isStrictlySorted!677 lt!449500))))

(assert (=> d!121981 (= lt!449500 e!573722)))

(assert (=> d!121981 (= c!103336 (and ((_ is Cons!21647) (t!30646 (t!30646 l!996))) (bvslt (_1!7752 (h!22845 (t!30646 (t!30646 l!996)))) key!261)))))

(assert (=> d!121981 (isStrictlySorted!677 (t!30646 (t!30646 l!996)))))

(assert (=> d!121981 (= (insertStrictlySorted!360 (t!30646 (t!30646 l!996)) key!261 value!172) lt!449500)))

(declare-fun bm!43087 () Bool)

(assert (=> bm!43087 (= call!43089 call!43088)))

(declare-fun b!1019475 () Bool)

(assert (=> b!1019475 (= e!573725 call!43089)))

(assert (= (and d!121981 c!103336) b!1019472))

(assert (= (and d!121981 (not c!103336)) b!1019468))

(assert (= (and b!1019468 c!103337) b!1019470))

(assert (= (and b!1019468 (not c!103337)) b!1019471))

(assert (= (and b!1019471 c!103338) b!1019475))

(assert (= (and b!1019471 (not c!103338)) b!1019469))

(assert (= (or b!1019475 b!1019469) bm!43087))

(assert (= (or b!1019470 bm!43087) bm!43086))

(assert (= (or b!1019472 bm!43086) bm!43085))

(assert (= (and bm!43085 c!103339) b!1019466))

(assert (= (and bm!43085 (not c!103339)) b!1019473))

(assert (= (and d!121981 res!683435) b!1019467))

(assert (= (and b!1019467 res!683436) b!1019474))

(declare-fun m!939259 () Bool)

(assert (=> d!121981 m!939259))

(assert (=> d!121981 m!939183))

(declare-fun m!939261 () Bool)

(assert (=> b!1019466 m!939261))

(declare-fun m!939263 () Bool)

(assert (=> b!1019474 m!939263))

(declare-fun m!939265 () Bool)

(assert (=> bm!43085 m!939265))

(declare-fun m!939267 () Bool)

(assert (=> b!1019467 m!939267))

(assert (=> b!1019365 d!121981))

(assert (=> b!1019341 d!121925))

(declare-fun d!121985 () Bool)

(declare-fun lt!449509 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!489 (List!21651) (InoxSet tuple2!15482))

(assert (=> d!121985 (= lt!449509 (select (content!489 lt!449484) (tuple2!15483 key!261 value!172)))))

(declare-fun e!573740 () Bool)

(assert (=> d!121985 (= lt!449509 e!573740)))

(declare-fun res!683448 () Bool)

(assert (=> d!121985 (=> (not res!683448) (not e!573740))))

(assert (=> d!121985 (= res!683448 ((_ is Cons!21647) lt!449484))))

(assert (=> d!121985 (= (contains!5884 lt!449484 (tuple2!15483 key!261 value!172)) lt!449509)))

(declare-fun b!1019492 () Bool)

(declare-fun e!573741 () Bool)

(assert (=> b!1019492 (= e!573740 e!573741)))

(declare-fun res!683447 () Bool)

(assert (=> b!1019492 (=> res!683447 e!573741)))

(assert (=> b!1019492 (= res!683447 (= (h!22845 lt!449484) (tuple2!15483 key!261 value!172)))))

(declare-fun b!1019493 () Bool)

(assert (=> b!1019493 (= e!573741 (contains!5884 (t!30646 lt!449484) (tuple2!15483 key!261 value!172)))))

(assert (= (and d!121985 res!683448) b!1019492))

(assert (= (and b!1019492 (not res!683447)) b!1019493))

(declare-fun m!939275 () Bool)

(assert (=> d!121985 m!939275))

(declare-fun m!939277 () Bool)

(assert (=> d!121985 m!939277))

(declare-fun m!939279 () Bool)

(assert (=> b!1019493 m!939279))

(assert (=> b!1019373 d!121985))

(declare-fun d!121991 () Bool)

(declare-fun lt!449511 () Bool)

(assert (=> d!121991 (= lt!449511 (select (content!489 lt!449482) (tuple2!15483 key!261 value!172)))))

(declare-fun e!573743 () Bool)

(assert (=> d!121991 (= lt!449511 e!573743)))

(declare-fun res!683450 () Bool)

(assert (=> d!121991 (=> (not res!683450) (not e!573743))))

(assert (=> d!121991 (= res!683450 ((_ is Cons!21647) lt!449482))))

(assert (=> d!121991 (= (contains!5884 lt!449482 (tuple2!15483 key!261 value!172)) lt!449511)))

(declare-fun b!1019496 () Bool)

(declare-fun e!573744 () Bool)

(assert (=> b!1019496 (= e!573743 e!573744)))

(declare-fun res!683449 () Bool)

(assert (=> b!1019496 (=> res!683449 e!573744)))

(assert (=> b!1019496 (= res!683449 (= (h!22845 lt!449482) (tuple2!15483 key!261 value!172)))))

(declare-fun b!1019497 () Bool)

(assert (=> b!1019497 (= e!573744 (contains!5884 (t!30646 lt!449482) (tuple2!15483 key!261 value!172)))))

(assert (= (and d!121991 res!683450) b!1019496))

(assert (= (and b!1019496 (not res!683449)) b!1019497))

(declare-fun m!939283 () Bool)

(assert (=> d!121991 m!939283))

(declare-fun m!939285 () Bool)

(assert (=> d!121991 m!939285))

(declare-fun m!939287 () Bool)

(assert (=> b!1019497 m!939287))

(assert (=> b!1019349 d!121991))

(declare-fun d!121997 () Bool)

(declare-fun lt!449512 () Int)

(assert (=> d!121997 (>= lt!449512 0)))

(declare-fun e!573745 () Int)

(assert (=> d!121997 (= lt!449512 e!573745)))

(declare-fun c!103344 () Bool)

(assert (=> d!121997 (= c!103344 ((_ is Nil!21648) l!996))))

(assert (=> d!121997 (= (size!31129 l!996) lt!449512)))

(declare-fun b!1019498 () Bool)

(assert (=> b!1019498 (= e!573745 0)))

(declare-fun b!1019499 () Bool)

(assert (=> b!1019499 (= e!573745 (+ 1 (size!31129 (t!30646 l!996))))))

(assert (= (and d!121997 c!103344) b!1019498))

(assert (= (and d!121997 (not c!103344)) b!1019499))

(assert (=> b!1019499 m!939197))

(assert (=> d!121931 d!121997))

(declare-fun b!1019500 () Bool)

(declare-fun e!573746 () Bool)

(declare-fun tp!71165 () Bool)

(assert (=> b!1019500 (= e!573746 (and tp_is_empty!23755 tp!71165))))

(assert (=> b!1019414 (= tp!71161 e!573746)))

(assert (= (and b!1019414 ((_ is Cons!21647) (t!30646 (t!30646 l!996)))) b!1019500))

(check-sat (not b!1019466) (not b!1019465) (not b!1019459) (not b!1019493) (not bm!43085) (not b!1019474) (not d!121981) (not b!1019457) (not b!1019445) (not b!1019461) (not b!1019467) tp_is_empty!23755 (not b!1019500) (not d!121985) (not d!121991) (not b!1019499) (not b!1019451) (not d!121971) (not b!1019449) (not b!1019497) (not b!1019447) (not b!1019463))
(check-sat)
