; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87322 () Bool)

(assert start!87322)

(declare-fun b!1012137 () Bool)

(assert (=> b!1012137 true))

(assert (=> b!1012137 true))

(declare-fun res!679895 () Bool)

(declare-fun e!569362 () Bool)

(assert (=> start!87322 (=> (not res!679895) (not e!569362))))

(declare-datatypes ((B!1332 0))(
  ( (B!1333 (val!11750 Int)) )
))
(declare-datatypes ((tuple2!15046 0))(
  ( (tuple2!15047 (_1!7534 (_ BitVec 64)) (_2!7534 B!1332)) )
))
(declare-datatypes ((List!21350 0))(
  ( (Nil!21347) (Cons!21346 (h!22544 tuple2!15046) (t!30351 List!21350)) )
))
(declare-fun l!412 () List!21350)

(declare-fun isStrictlySorted!530 (List!21350) Bool)

(assert (=> start!87322 (= res!679895 (isStrictlySorted!530 l!412))))

(assert (=> start!87322 e!569362))

(declare-fun e!569360 () Bool)

(assert (=> start!87322 e!569360))

(declare-fun tp_is_empty!23399 () Bool)

(assert (=> start!87322 tp_is_empty!23399))

(declare-datatypes ((Unit!33050 0))(
  ( (Unit!33051) )
))
(declare-fun e!569361 () Unit!33050)

(declare-fun lt!447322 () Unit!33050)

(assert (=> b!1012137 (= e!569361 lt!447322)))

(declare-datatypes ((List!21351 0))(
  ( (Nil!21348) (Cons!21347 (h!22545 (_ BitVec 64)) (t!30352 List!21351)) )
))
(declare-fun lt!447324 () List!21351)

(declare-fun value!115 () B!1332)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!7 (List!21350 List!21351 B!1332 tuple2!15046) Unit!33050)

(assert (=> b!1012137 (= lt!447322 (lemmaForallGetValueByKeySameWithASmallerHead!7 (t!30351 l!412) lt!447324 value!115 (h!22544 l!412)))))

(declare-fun lambda!293 () Int)

(declare-fun forall!209 (List!21351 Int) Bool)

(assert (=> b!1012137 (forall!209 lt!447324 lambda!293)))

(declare-fun b!1012138 () Bool)

(declare-fun res!679896 () Bool)

(assert (=> b!1012138 (=> (not res!679896) (not e!569362))))

(assert (=> b!1012138 (= res!679896 (and (is-Cons!21346 l!412) (= (_2!7534 (h!22544 l!412)) value!115)))))

(declare-fun b!1012139 () Bool)

(declare-fun Unit!33052 () Unit!33050)

(assert (=> b!1012139 (= e!569361 Unit!33052)))

(declare-fun b!1012140 () Bool)

(declare-fun tp!70262 () Bool)

(assert (=> b!1012140 (= e!569360 (and tp_is_empty!23399 tp!70262))))

(declare-fun b!1012141 () Bool)

(assert (=> b!1012141 (= e!569362 (not (isStrictlySorted!530 (t!30351 l!412))))))

(declare-fun lt!447323 () Unit!33050)

(assert (=> b!1012141 (= lt!447323 e!569361)))

(declare-fun c!102231 () Bool)

(declare-fun isEmpty!785 (List!21351) Bool)

(assert (=> b!1012141 (= c!102231 (not (isEmpty!785 lt!447324)))))

(declare-fun getKeysOf!15 (List!21350 B!1332) List!21351)

(assert (=> b!1012141 (= lt!447324 (getKeysOf!15 (t!30351 l!412) value!115))))

(assert (= (and start!87322 res!679895) b!1012138))

(assert (= (and b!1012138 res!679896) b!1012141))

(assert (= (and b!1012141 c!102231) b!1012137))

(assert (= (and b!1012141 (not c!102231)) b!1012139))

(assert (= (and start!87322 (is-Cons!21346 l!412)) b!1012140))

(declare-fun m!935863 () Bool)

(assert (=> start!87322 m!935863))

(declare-fun m!935865 () Bool)

(assert (=> b!1012137 m!935865))

(declare-fun m!935867 () Bool)

(assert (=> b!1012137 m!935867))

(declare-fun m!935869 () Bool)

(assert (=> b!1012141 m!935869))

(declare-fun m!935871 () Bool)

(assert (=> b!1012141 m!935871))

(declare-fun m!935873 () Bool)

(assert (=> b!1012141 m!935873))

(push 1)

(assert tp_is_empty!23399)

(assert (not start!87322))

(assert (not b!1012140))

(assert (not b!1012137))

(assert (not b!1012141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120239 () Bool)

(declare-fun res!679913 () Bool)

(declare-fun e!569379 () Bool)

(assert (=> d!120239 (=> res!679913 e!569379)))

(assert (=> d!120239 (= res!679913 (or (is-Nil!21347 l!412) (is-Nil!21347 (t!30351 l!412))))))

(assert (=> d!120239 (= (isStrictlySorted!530 l!412) e!569379)))

(declare-fun b!1012162 () Bool)

(declare-fun e!569380 () Bool)

(assert (=> b!1012162 (= e!569379 e!569380)))

(declare-fun res!679914 () Bool)

(assert (=> b!1012162 (=> (not res!679914) (not e!569380))))

(assert (=> b!1012162 (= res!679914 (bvslt (_1!7534 (h!22544 l!412)) (_1!7534 (h!22544 (t!30351 l!412)))))))

(declare-fun b!1012163 () Bool)

(assert (=> b!1012163 (= e!569380 (isStrictlySorted!530 (t!30351 l!412)))))

(assert (= (and d!120239 (not res!679913)) b!1012162))

(assert (= (and b!1012162 res!679914) b!1012163))

(assert (=> b!1012163 m!935869))

(assert (=> start!87322 d!120239))

(declare-fun bs!28764 () Bool)

(declare-fun b!1012171 () Bool)

(assert (= bs!28764 (and b!1012171 b!1012137)))

(declare-fun lambda!298 () Int)

(assert (=> bs!28764 (= (= (t!30351 l!412) l!412) (= lambda!298 lambda!293))))

(assert (=> b!1012171 true))

(assert (=> b!1012171 true))

(declare-fun bs!28765 () Bool)

(declare-fun d!120247 () Bool)

(assert (= bs!28765 (and d!120247 b!1012137)))

(declare-fun lambda!299 () Int)

(assert (=> bs!28765 (= (= (Cons!21346 (h!22544 l!412) (t!30351 l!412)) l!412) (= lambda!299 lambda!293))))

(declare-fun bs!28766 () Bool)

(assert (= bs!28766 (and d!120247 b!1012171)))

(assert (=> bs!28766 (= (= (Cons!21346 (h!22544 l!412) (t!30351 l!412)) (t!30351 l!412)) (= lambda!299 lambda!298))))

(assert (=> d!120247 true))

(assert (=> d!120247 true))

(assert (=> d!120247 true))

(assert (=> d!120247 (forall!209 lt!447324 lambda!299)))

(declare-fun lt!447327 () Unit!33050)

(declare-fun choose!1623 (List!21350 List!21351 B!1332 tuple2!15046) Unit!33050)

(assert (=> d!120247 (= lt!447327 (choose!1623 (t!30351 l!412) lt!447324 value!115 (h!22544 l!412)))))

(declare-fun e!569383 () Bool)

(assert (=> d!120247 e!569383))

(declare-fun res!679923 () Bool)

(assert (=> d!120247 (=> (not res!679923) (not e!569383))))

(assert (=> d!120247 (= res!679923 (isStrictlySorted!530 (t!30351 l!412)))))

(assert (=> d!120247 (= (lemmaForallGetValueByKeySameWithASmallerHead!7 (t!30351 l!412) lt!447324 value!115 (h!22544 l!412)) lt!447327)))

(declare-fun b!1012170 () Bool)

(declare-fun res!679921 () Bool)

(assert (=> b!1012170 (=> (not res!679921) (not e!569383))))

(declare-fun isEmpty!786 (List!21350) Bool)

(assert (=> b!1012170 (= res!679921 (not (isEmpty!786 (t!30351 l!412))))))

(declare-fun res!679922 () Bool)

(assert (=> b!1012171 (=> (not res!679922) (not e!569383))))

(assert (=> b!1012171 (= res!679922 (forall!209 lt!447324 lambda!298))))

(declare-fun b!1012172 () Bool)

(declare-fun head!923 (List!21350) tuple2!15046)

(assert (=> b!1012172 (= e!569383 (bvslt (_1!7534 (h!22544 l!412)) (_1!7534 (head!923 (t!30351 l!412)))))))

(assert (= (and d!120247 res!679923) b!1012170))

(assert (= (and b!1012170 res!679921) b!1012171))

(assert (= (and b!1012171 res!679922) b!1012172))

(declare-fun m!935879 () Bool)

(assert (=> d!120247 m!935879))

(declare-fun m!935881 () Bool)

(assert (=> d!120247 m!935881))

(assert (=> d!120247 m!935869))

(declare-fun m!935883 () Bool)

(assert (=> b!1012170 m!935883))

(declare-fun m!935885 () Bool)

(assert (=> b!1012171 m!935885))

(declare-fun m!935887 () Bool)

(assert (=> b!1012172 m!935887))

(assert (=> b!1012137 d!120247))

(declare-fun d!120251 () Bool)

(declare-fun res!679928 () Bool)

(declare-fun e!569388 () Bool)

(assert (=> d!120251 (=> res!679928 e!569388)))

(assert (=> d!120251 (= res!679928 (is-Nil!21348 lt!447324))))

(assert (=> d!120251 (= (forall!209 lt!447324 lambda!293) e!569388)))

(declare-fun b!1012179 () Bool)

(declare-fun e!569389 () Bool)

(assert (=> b!1012179 (= e!569388 e!569389)))

(declare-fun res!679929 () Bool)

(assert (=> b!1012179 (=> (not res!679929) (not e!569389))))

(declare-fun dynLambda!1878 (Int (_ BitVec 64)) Bool)

(assert (=> b!1012179 (= res!679929 (dynLambda!1878 lambda!293 (h!22545 lt!447324)))))

(declare-fun b!1012180 () Bool)

(assert (=> b!1012180 (= e!569389 (forall!209 (t!30352 lt!447324) lambda!293))))

(assert (= (and d!120251 (not res!679928)) b!1012179))

(assert (= (and b!1012179 res!679929) b!1012180))

(declare-fun b_lambda!15229 () Bool)

(assert (=> (not b_lambda!15229) (not b!1012179)))

(declare-fun m!935889 () Bool)

(assert (=> b!1012179 m!935889))

(declare-fun m!935891 () Bool)

(assert (=> b!1012180 m!935891))

(assert (=> b!1012137 d!120251))

(declare-fun d!120253 () Bool)

(declare-fun res!679930 () Bool)

(declare-fun e!569390 () Bool)

(assert (=> d!120253 (=> res!679930 e!569390)))

(assert (=> d!120253 (= res!679930 (or (is-Nil!21347 (t!30351 l!412)) (is-Nil!21347 (t!30351 (t!30351 l!412)))))))

(assert (=> d!120253 (= (isStrictlySorted!530 (t!30351 l!412)) e!569390)))

(declare-fun b!1012181 () Bool)

(declare-fun e!569391 () Bool)

(assert (=> b!1012181 (= e!569390 e!569391)))

(declare-fun res!679931 () Bool)

(assert (=> b!1012181 (=> (not res!679931) (not e!569391))))

(assert (=> b!1012181 (= res!679931 (bvslt (_1!7534 (h!22544 (t!30351 l!412))) (_1!7534 (h!22544 (t!30351 (t!30351 l!412))))))))

(declare-fun b!1012182 () Bool)

(assert (=> b!1012182 (= e!569391 (isStrictlySorted!530 (t!30351 (t!30351 l!412))))))

(assert (= (and d!120253 (not res!679930)) b!1012181))

(assert (= (and b!1012181 res!679931) b!1012182))

(declare-fun m!935893 () Bool)

(assert (=> b!1012182 m!935893))

(assert (=> b!1012141 d!120253))

(declare-fun d!120255 () Bool)

(assert (=> d!120255 (= (isEmpty!785 lt!447324) (is-Nil!21348 lt!447324))))

(assert (=> b!1012141 d!120255))

(declare-fun bs!28797 () Bool)

(declare-fun b!1012272 () Bool)

(assert (= bs!28797 (and b!1012272 b!1012137)))

(declare-fun lambda!336 () Int)

(declare-fun lt!447441 () tuple2!15046)

(declare-fun lt!447438 () List!21350)

(assert (=> bs!28797 (= (= (Cons!21346 lt!447441 lt!447438) l!412) (= lambda!336 lambda!293))))

(declare-fun bs!28798 () Bool)

(assert (= bs!28798 (and b!1012272 b!1012171)))

(assert (=> bs!28798 (= (= (Cons!21346 lt!447441 lt!447438) (t!30351 l!412)) (= lambda!336 lambda!298))))

(declare-fun bs!28799 () Bool)

(assert (= bs!28799 (and b!1012272 d!120247)))

(assert (=> bs!28799 (= (= (Cons!21346 lt!447441 lt!447438) (Cons!21346 (h!22544 l!412) (t!30351 l!412))) (= lambda!336 lambda!299))))

(assert (=> b!1012272 true))

(assert (=> b!1012272 true))

(assert (=> b!1012272 true))

(declare-fun bs!28800 () Bool)

(declare-fun b!1012277 () Bool)

(assert (= bs!28800 (and b!1012277 b!1012137)))

(declare-fun lambda!337 () Int)

(declare-fun lt!447432 () List!21350)

(declare-fun lt!447434 () tuple2!15046)

(assert (=> bs!28800 (= (= (Cons!21346 lt!447434 lt!447432) l!412) (= lambda!337 lambda!293))))

(declare-fun bs!28801 () Bool)

(assert (= bs!28801 (and b!1012277 b!1012171)))

(assert (=> bs!28801 (= (= (Cons!21346 lt!447434 lt!447432) (t!30351 l!412)) (= lambda!337 lambda!298))))

(declare-fun bs!28802 () Bool)

(assert (= bs!28802 (and b!1012277 d!120247)))

(assert (=> bs!28802 (= (= (Cons!21346 lt!447434 lt!447432) (Cons!21346 (h!22544 l!412) (t!30351 l!412))) (= lambda!337 lambda!299))))

(declare-fun bs!28803 () Bool)

(assert (= bs!28803 (and b!1012277 b!1012272)))

(assert (=> bs!28803 (= (= (Cons!21346 lt!447434 lt!447432) (Cons!21346 lt!447441 lt!447438)) (= lambda!337 lambda!336))))

(assert (=> b!1012277 true))

(assert (=> b!1012277 true))

(assert (=> b!1012277 true))

(declare-fun bs!28805 () Bool)

(declare-fun d!120257 () Bool)

(assert (= bs!28805 (and d!120257 b!1012137)))

(declare-fun lambda!338 () Int)

(assert (=> bs!28805 (= (= (t!30351 l!412) l!412) (= lambda!338 lambda!293))))

(declare-fun bs!28806 () Bool)

(assert (= bs!28806 (and d!120257 b!1012277)))

(assert (=> bs!28806 (= (= (t!30351 l!412) (Cons!21346 lt!447434 lt!447432)) (= lambda!338 lambda!337))))

(declare-fun bs!28807 () Bool)

(assert (= bs!28807 (and d!120257 b!1012171)))

(assert (=> bs!28807 (= lambda!338 lambda!298)))

(declare-fun bs!28808 () Bool)

(assert (= bs!28808 (and d!120257 b!1012272)))

(assert (=> bs!28808 (= (= (t!30351 l!412) (Cons!21346 lt!447441 lt!447438)) (= lambda!338 lambda!336))))

(declare-fun bs!28810 () Bool)

(assert (= bs!28810 (and d!120257 d!120247)))

(assert (=> bs!28810 (= (= (t!30351 l!412) (Cons!21346 (h!22544 l!412) (t!30351 l!412))) (= lambda!338 lambda!299))))

(assert (=> d!120257 true))

(assert (=> d!120257 true))

(declare-fun c!102265 () Bool)

(declare-fun lt!447435 () List!21351)

(declare-fun call!42513 () Unit!33050)

(declare-fun bm!42507 () Bool)

(declare-fun lt!447430 () List!21351)

(assert (=> bm!42507 (= call!42513 (lemmaForallGetValueByKeySameWithASmallerHead!7 (ite c!102265 lt!447438 lt!447432) (ite c!102265 lt!447430 lt!447435) value!115 (ite c!102265 lt!447441 lt!447434)))))

(declare-fun call!42511 () Bool)

(declare-fun bm!42508 () Bool)

(assert (=> bm!42508 (= call!42511 (forall!209 (ite c!102265 lt!447430 lt!447435) (ite c!102265 lambda!336 lambda!337)))))

(declare-fun b!1012271 () Bool)

(declare-fun e!569432 () List!21351)

(declare-fun e!569433 () List!21351)

(assert (=> b!1012271 (= e!569432 e!569433)))

(declare-fun c!102266 () Bool)

(assert (=> b!1012271 (= c!102266 (and (is-Cons!21346 (t!30351 l!412)) (not (= (_2!7534 (h!22544 (t!30351 l!412))) value!115))))))

(declare-fun lt!447431 () List!21351)

(assert (=> d!120257 (forall!209 lt!447431 lambda!338)))

(assert (=> d!120257 (= lt!447431 e!569432)))

(assert (=> d!120257 (= c!102265 (and (is-Cons!21346 (t!30351 l!412)) (= (_2!7534 (h!22544 (t!30351 l!412))) value!115)))))

(assert (=> d!120257 (isStrictlySorted!530 (t!30351 l!412))))

(assert (=> d!120257 (= (getKeysOf!15 (t!30351 l!412) value!115) lt!447431)))

(declare-fun bm!42509 () Bool)

(declare-fun call!42512 () List!21351)

(assert (=> bm!42509 (= call!42512 (getKeysOf!15 (t!30351 (t!30351 l!412)) value!115))))

(assert (=> b!1012272 call!42511))

(declare-fun lt!447440 () Unit!33050)

(assert (=> b!1012272 (= lt!447440 call!42513)))

(assert (=> b!1012272 (= lt!447441 (h!22544 (t!30351 l!412)))))

(assert (=> b!1012272 (= lt!447430 call!42512)))

(assert (=> b!1012272 (= lt!447438 (t!30351 (t!30351 l!412)))))

(declare-fun e!569435 () Unit!33050)

(assert (=> b!1012272 (= e!569435 lt!447440)))

(declare-fun b!1012273 () Bool)

(declare-fun lt!447433 () Unit!33050)

(declare-fun e!569434 () Unit!33050)

(assert (=> b!1012273 (= lt!447433 e!569434)))

(declare-fun c!102267 () Bool)

(declare-fun call!42510 () Bool)

(assert (=> b!1012273 (= c!102267 (not call!42510))))

(declare-fun lt!447437 () List!21351)

(assert (=> b!1012273 (= lt!447437 call!42512)))

(assert (=> b!1012273 (= e!569433 call!42512)))

(declare-fun b!1012274 () Bool)

(declare-fun Unit!33057 () Unit!33050)

(assert (=> b!1012274 (= e!569435 Unit!33057)))

(declare-fun b!1012275 () Bool)

(assert (=> b!1012275 (= e!569433 Nil!21348)))

(declare-fun b!1012276 () Bool)

(assert (=> b!1012276 (= e!569432 (Cons!21347 (_1!7534 (h!22544 (t!30351 l!412))) call!42512))))

(declare-fun c!102264 () Bool)

(assert (=> b!1012276 (= c!102264 (not call!42510))))

(declare-fun lt!447436 () Unit!33050)

(assert (=> b!1012276 (= lt!447436 e!569435)))

