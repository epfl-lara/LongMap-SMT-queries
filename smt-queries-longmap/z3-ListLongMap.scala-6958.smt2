; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87842 () Bool)

(assert start!87842)

(declare-fun b!1015178 () Bool)

(assert (=> b!1015178 true))

(assert (=> b!1015178 true))

(declare-fun bs!29365 () Bool)

(declare-fun b!1015175 () Bool)

(assert (= bs!29365 (and b!1015175 b!1015178)))

(declare-fun lambda!839 () Int)

(declare-fun lambda!838 () Int)

(assert (=> bs!29365 (= lambda!839 lambda!838)))

(assert (=> b!1015175 true))

(assert (=> b!1015175 true))

(declare-fun b!1015176 () Bool)

(declare-fun res!681015 () Bool)

(declare-fun e!571080 () Bool)

(assert (=> b!1015176 (=> (not res!681015) (not e!571080))))

(declare-datatypes ((B!1456 0))(
  ( (B!1457 (val!11812 Int)) )
))
(declare-datatypes ((tuple2!15170 0))(
  ( (tuple2!15171 (_1!7596 (_ BitVec 64)) (_2!7596 B!1456)) )
))
(declare-datatypes ((List!21456 0))(
  ( (Nil!21453) (Cons!21452 (h!22650 tuple2!15170) (t!30457 List!21456)) )
))
(declare-fun l!412 () List!21456)

(declare-fun value!115 () B!1456)

(get-info :version)

(assert (=> b!1015176 (= res!681015 (and (not (= (_2!7596 (h!22650 l!412)) value!115)) ((_ is Cons!21452) l!412)))))

(declare-fun b!1015177 () Bool)

(declare-datatypes ((Unit!33215 0))(
  ( (Unit!33216) )
))
(declare-fun e!571081 () Unit!33215)

(declare-fun Unit!33217 () Unit!33215)

(assert (=> b!1015177 (= e!571081 Unit!33217)))

(declare-fun lt!449021 () Unit!33215)

(assert (=> b!1015178 (= e!571081 lt!449021)))

(declare-datatypes ((List!21457 0))(
  ( (Nil!21454) (Cons!21453 (h!22651 (_ BitVec 64)) (t!30458 List!21457)) )
))
(declare-fun lt!449022 () List!21457)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!45 (List!21456 List!21457 B!1456 tuple2!15170) Unit!33215)

(assert (=> b!1015178 (= lt!449021 (lemmaForallGetValueByKeySameWithASmallerHead!45 (t!30457 l!412) lt!449022 value!115 (h!22650 l!412)))))

(declare-fun forall!251 (List!21457 Int) Bool)

(assert (=> b!1015178 (forall!251 lt!449022 lambda!838)))

(declare-fun b!1015179 () Bool)

(declare-fun e!571079 () Bool)

(declare-fun tp_is_empty!23523 () Bool)

(declare-fun tp!70595 () Bool)

(assert (=> b!1015179 (= e!571079 (and tp_is_empty!23523 tp!70595))))

(assert (=> b!1015175 (= e!571080 (not (forall!251 lt!449022 lambda!839)))))

(declare-fun lt!449020 () Unit!33215)

(assert (=> b!1015175 (= lt!449020 e!571081)))

(declare-fun c!102852 () Bool)

(declare-fun isEmpty!851 (List!21457) Bool)

(assert (=> b!1015175 (= c!102852 (not (isEmpty!851 lt!449022)))))

(declare-fun getKeysOf!59 (List!21456 B!1456) List!21457)

(assert (=> b!1015175 (= lt!449022 (getKeysOf!59 (t!30457 l!412) value!115))))

(declare-fun res!681014 () Bool)

(assert (=> start!87842 (=> (not res!681014) (not e!571080))))

(declare-fun isStrictlySorted!586 (List!21456) Bool)

(assert (=> start!87842 (= res!681014 (isStrictlySorted!586 l!412))))

(assert (=> start!87842 e!571080))

(assert (=> start!87842 e!571079))

(assert (=> start!87842 tp_is_empty!23523))

(assert (= (and start!87842 res!681014) b!1015176))

(assert (= (and b!1015176 res!681015) b!1015175))

(assert (= (and b!1015175 c!102852) b!1015178))

(assert (= (and b!1015175 (not c!102852)) b!1015177))

(assert (= (and start!87842 ((_ is Cons!21452) l!412)) b!1015179))

(declare-fun m!937389 () Bool)

(assert (=> b!1015178 m!937389))

(declare-fun m!937391 () Bool)

(assert (=> b!1015178 m!937391))

(declare-fun m!937393 () Bool)

(assert (=> b!1015175 m!937393))

(declare-fun m!937395 () Bool)

(assert (=> b!1015175 m!937395))

(declare-fun m!937397 () Bool)

(assert (=> b!1015175 m!937397))

(declare-fun m!937399 () Bool)

(assert (=> start!87842 m!937399))

(check-sat (not start!87842) tp_is_empty!23523 (not b!1015179) (not b!1015175) (not b!1015178))
(check-sat)
(get-model)

(declare-fun d!120915 () Bool)

(declare-fun res!681049 () Bool)

(declare-fun e!571112 () Bool)

(assert (=> d!120915 (=> res!681049 e!571112)))

(assert (=> d!120915 (= res!681049 (or ((_ is Nil!21453) l!412) ((_ is Nil!21453) (t!30457 l!412))))))

(assert (=> d!120915 (= (isStrictlySorted!586 l!412) e!571112)))

(declare-fun b!1015232 () Bool)

(declare-fun e!571113 () Bool)

(assert (=> b!1015232 (= e!571112 e!571113)))

(declare-fun res!681050 () Bool)

(assert (=> b!1015232 (=> (not res!681050) (not e!571113))))

(assert (=> b!1015232 (= res!681050 (bvslt (_1!7596 (h!22650 l!412)) (_1!7596 (h!22650 (t!30457 l!412)))))))

(declare-fun b!1015233 () Bool)

(assert (=> b!1015233 (= e!571113 (isStrictlySorted!586 (t!30457 l!412)))))

(assert (= (and d!120915 (not res!681049)) b!1015232))

(assert (= (and b!1015232 res!681050) b!1015233))

(declare-fun m!937435 () Bool)

(assert (=> b!1015233 m!937435))

(assert (=> start!87842 d!120915))

(declare-fun d!120923 () Bool)

(declare-fun res!681055 () Bool)

(declare-fun e!571118 () Bool)

(assert (=> d!120923 (=> res!681055 e!571118)))

(assert (=> d!120923 (= res!681055 ((_ is Nil!21454) lt!449022))))

(assert (=> d!120923 (= (forall!251 lt!449022 lambda!839) e!571118)))

(declare-fun b!1015238 () Bool)

(declare-fun e!571119 () Bool)

(assert (=> b!1015238 (= e!571118 e!571119)))

(declare-fun res!681056 () Bool)

(assert (=> b!1015238 (=> (not res!681056) (not e!571119))))

(declare-fun dynLambda!1898 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015238 (= res!681056 (dynLambda!1898 lambda!839 (h!22651 lt!449022)))))

(declare-fun b!1015239 () Bool)

(assert (=> b!1015239 (= e!571119 (forall!251 (t!30458 lt!449022) lambda!839))))

(assert (= (and d!120923 (not res!681055)) b!1015238))

(assert (= (and b!1015238 res!681056) b!1015239))

(declare-fun b_lambda!15397 () Bool)

(assert (=> (not b_lambda!15397) (not b!1015238)))

(declare-fun m!937439 () Bool)

(assert (=> b!1015238 m!937439))

(declare-fun m!937441 () Bool)

(assert (=> b!1015239 m!937441))

(assert (=> b!1015175 d!120923))

(declare-fun d!120927 () Bool)

(assert (=> d!120927 (= (isEmpty!851 lt!449022) ((_ is Nil!21454) lt!449022))))

(assert (=> b!1015175 d!120927))

(declare-fun bs!29411 () Bool)

(declare-fun b!1015341 () Bool)

(assert (= bs!29411 (and b!1015341 b!1015178)))

(declare-fun lt!449145 () List!21456)

(declare-fun lt!449143 () tuple2!15170)

(declare-fun lambda!882 () Int)

(assert (=> bs!29411 (= (= (Cons!21452 lt!449143 lt!449145) l!412) (= lambda!882 lambda!838))))

(declare-fun bs!29412 () Bool)

(assert (= bs!29412 (and b!1015341 b!1015175)))

(assert (=> bs!29412 (= (= (Cons!21452 lt!449143 lt!449145) l!412) (= lambda!882 lambda!839))))

(assert (=> b!1015341 true))

(assert (=> b!1015341 true))

(assert (=> b!1015341 true))

(declare-fun bs!29413 () Bool)

(declare-fun b!1015344 () Bool)

(assert (= bs!29413 (and b!1015344 b!1015178)))

(declare-fun lt!449142 () tuple2!15170)

(declare-fun lt!449144 () List!21456)

(declare-fun lambda!883 () Int)

(assert (=> bs!29413 (= (= (Cons!21452 lt!449142 lt!449144) l!412) (= lambda!883 lambda!838))))

(declare-fun bs!29414 () Bool)

(assert (= bs!29414 (and b!1015344 b!1015175)))

(assert (=> bs!29414 (= (= (Cons!21452 lt!449142 lt!449144) l!412) (= lambda!883 lambda!839))))

(declare-fun bs!29415 () Bool)

(assert (= bs!29415 (and b!1015344 b!1015341)))

(assert (=> bs!29415 (= (= (Cons!21452 lt!449142 lt!449144) (Cons!21452 lt!449143 lt!449145)) (= lambda!883 lambda!882))))

(assert (=> b!1015344 true))

(assert (=> b!1015344 true))

(assert (=> b!1015344 true))

(declare-fun bs!29416 () Bool)

(declare-fun d!120929 () Bool)

(assert (= bs!29416 (and d!120929 b!1015178)))

(declare-fun lambda!884 () Int)

(assert (=> bs!29416 (= (= (t!30457 l!412) l!412) (= lambda!884 lambda!838))))

(declare-fun bs!29417 () Bool)

(assert (= bs!29417 (and d!120929 b!1015175)))

(assert (=> bs!29417 (= (= (t!30457 l!412) l!412) (= lambda!884 lambda!839))))

(declare-fun bs!29418 () Bool)

(assert (= bs!29418 (and d!120929 b!1015341)))

(assert (=> bs!29418 (= (= (t!30457 l!412) (Cons!21452 lt!449143 lt!449145)) (= lambda!884 lambda!882))))

(declare-fun bs!29419 () Bool)

(assert (= bs!29419 (and d!120929 b!1015344)))

(assert (=> bs!29419 (= (= (t!30457 l!412) (Cons!21452 lt!449142 lt!449144)) (= lambda!884 lambda!883))))

(assert (=> d!120929 true))

(assert (=> d!120929 true))

(declare-fun lt!449141 () List!21457)

(declare-fun lt!449140 () List!21457)

(declare-fun call!42954 () Unit!33215)

(declare-fun c!102889 () Bool)

(declare-fun bm!42951 () Bool)

(assert (=> bm!42951 (= call!42954 (lemmaForallGetValueByKeySameWithASmallerHead!45 (ite c!102889 lt!449145 lt!449144) (ite c!102889 lt!449141 lt!449140) value!115 (ite c!102889 lt!449143 lt!449142)))))

(declare-fun lt!449136 () List!21457)

(assert (=> d!120929 (forall!251 lt!449136 lambda!884)))

(declare-fun e!571177 () List!21457)

(assert (=> d!120929 (= lt!449136 e!571177)))

(assert (=> d!120929 (= c!102889 (and ((_ is Cons!21452) (t!30457 l!412)) (= (_2!7596 (h!22650 (t!30457 l!412))) value!115)))))

(assert (=> d!120929 (isStrictlySorted!586 (t!30457 l!412))))

(assert (=> d!120929 (= (getKeysOf!59 (t!30457 l!412) value!115) lt!449136)))

(declare-fun b!1015339 () Bool)

(declare-fun lt!449134 () Unit!33215)

(declare-fun e!571175 () Unit!33215)

(assert (=> b!1015339 (= lt!449134 e!571175)))

(declare-fun c!102890 () Bool)

(declare-fun call!42957 () Bool)

(assert (=> b!1015339 (= c!102890 (not call!42957))))

(declare-fun lt!449135 () List!21457)

(declare-fun call!42955 () List!21457)

(assert (=> b!1015339 (= lt!449135 call!42955)))

(declare-fun e!571176 () List!21457)

(assert (=> b!1015339 (= e!571176 call!42955)))

(declare-fun bm!42952 () Bool)

(assert (=> bm!42952 (= call!42955 (getKeysOf!59 (t!30457 (t!30457 l!412)) value!115))))

(declare-fun bm!42953 () Bool)

(assert (=> bm!42953 (= call!42957 (isEmpty!851 call!42955))))

(declare-fun b!1015340 () Bool)

(assert (=> b!1015340 (= e!571177 e!571176)))

(declare-fun c!102888 () Bool)

(assert (=> b!1015340 (= c!102888 (and ((_ is Cons!21452) (t!30457 l!412)) (not (= (_2!7596 (h!22650 (t!30457 l!412))) value!115))))))

(declare-fun call!42956 () Bool)

(assert (=> b!1015341 call!42956))

(declare-fun lt!449139 () Unit!33215)

(assert (=> b!1015341 (= lt!449139 call!42954)))

(assert (=> b!1015341 (= lt!449143 (h!22650 (t!30457 l!412)))))

(assert (=> b!1015341 (= lt!449141 call!42955)))

(assert (=> b!1015341 (= lt!449145 (t!30457 (t!30457 l!412)))))

(declare-fun e!571178 () Unit!33215)

(assert (=> b!1015341 (= e!571178 lt!449139)))

(declare-fun bm!42954 () Bool)

(assert (=> bm!42954 (= call!42956 (forall!251 (ite c!102889 lt!449141 lt!449140) (ite c!102889 lambda!882 lambda!883)))))

(declare-fun b!1015342 () Bool)

(declare-fun Unit!33224 () Unit!33215)

(assert (=> b!1015342 (= e!571178 Unit!33224)))

(declare-fun b!1015343 () Bool)

(assert (=> b!1015343 (= e!571177 (Cons!21453 (_1!7596 (h!22650 (t!30457 l!412))) call!42955))))

(declare-fun c!102891 () Bool)

(assert (=> b!1015343 (= c!102891 (not call!42957))))

(declare-fun lt!449137 () Unit!33215)

(assert (=> b!1015343 (= lt!449137 e!571178)))

(declare-fun lt!449138 () Unit!33215)

(assert (=> b!1015344 (= e!571175 lt!449138)))

(assert (=> b!1015344 (= lt!449144 (t!30457 (t!30457 l!412)))))

(assert (=> b!1015344 (= lt!449140 call!42955)))

(assert (=> b!1015344 (= lt!449142 (h!22650 (t!30457 l!412)))))

(assert (=> b!1015344 (= lt!449138 call!42954)))

(assert (=> b!1015344 call!42956))

(declare-fun b!1015345 () Bool)

(assert (=> b!1015345 (= e!571176 Nil!21454)))

(declare-fun b!1015346 () Bool)

(declare-fun Unit!33226 () Unit!33215)

(assert (=> b!1015346 (= e!571175 Unit!33226)))

(assert (= (and d!120929 c!102889) b!1015343))

(assert (= (and d!120929 (not c!102889)) b!1015340))

(assert (= (and b!1015343 c!102891) b!1015341))

(assert (= (and b!1015343 (not c!102891)) b!1015342))

(assert (= (and b!1015340 c!102888) b!1015339))

(assert (= (and b!1015340 (not c!102888)) b!1015345))

(assert (= (and b!1015339 c!102890) b!1015344))

(assert (= (and b!1015339 (not c!102890)) b!1015346))

(assert (= (or b!1015341 b!1015344) bm!42951))

(assert (= (or b!1015341 b!1015344) bm!42954))

(assert (= (or b!1015343 b!1015341 b!1015344 b!1015339) bm!42952))

(assert (= (or b!1015343 b!1015339) bm!42953))

(declare-fun m!937483 () Bool)

(assert (=> bm!42952 m!937483))

(declare-fun m!937485 () Bool)

(assert (=> bm!42951 m!937485))

(declare-fun m!937487 () Bool)

(assert (=> bm!42953 m!937487))

(declare-fun m!937489 () Bool)

(assert (=> d!120929 m!937489))

(assert (=> d!120929 m!937435))

(declare-fun m!937491 () Bool)

(assert (=> bm!42954 m!937491))

(assert (=> b!1015175 d!120929))

(declare-fun bs!29420 () Bool)

(declare-fun b!1015356 () Bool)

(assert (= bs!29420 (and b!1015356 d!120929)))

(declare-fun lambda!889 () Int)

(assert (=> bs!29420 (= lambda!889 lambda!884)))

(declare-fun bs!29421 () Bool)

(assert (= bs!29421 (and b!1015356 b!1015175)))

(assert (=> bs!29421 (= (= (t!30457 l!412) l!412) (= lambda!889 lambda!839))))

(declare-fun bs!29422 () Bool)

(assert (= bs!29422 (and b!1015356 b!1015341)))

(assert (=> bs!29422 (= (= (t!30457 l!412) (Cons!21452 lt!449143 lt!449145)) (= lambda!889 lambda!882))))

(declare-fun bs!29423 () Bool)

(assert (= bs!29423 (and b!1015356 b!1015344)))

(assert (=> bs!29423 (= (= (t!30457 l!412) (Cons!21452 lt!449142 lt!449144)) (= lambda!889 lambda!883))))

(declare-fun bs!29424 () Bool)

(assert (= bs!29424 (and b!1015356 b!1015178)))

(assert (=> bs!29424 (= (= (t!30457 l!412) l!412) (= lambda!889 lambda!838))))

(assert (=> b!1015356 true))

(assert (=> b!1015356 true))

(declare-fun bs!29425 () Bool)

(declare-fun d!120947 () Bool)

(assert (= bs!29425 (and d!120947 d!120929)))

(declare-fun lambda!890 () Int)

(assert (=> bs!29425 (= (= (Cons!21452 (h!22650 l!412) (t!30457 l!412)) (t!30457 l!412)) (= lambda!890 lambda!884))))

(declare-fun bs!29426 () Bool)

(assert (= bs!29426 (and d!120947 b!1015175)))

(assert (=> bs!29426 (= (= (Cons!21452 (h!22650 l!412) (t!30457 l!412)) l!412) (= lambda!890 lambda!839))))

(declare-fun bs!29427 () Bool)

(assert (= bs!29427 (and d!120947 b!1015341)))

(assert (=> bs!29427 (= (= (Cons!21452 (h!22650 l!412) (t!30457 l!412)) (Cons!21452 lt!449143 lt!449145)) (= lambda!890 lambda!882))))

(declare-fun bs!29428 () Bool)

(assert (= bs!29428 (and d!120947 b!1015344)))

(assert (=> bs!29428 (= (= (Cons!21452 (h!22650 l!412) (t!30457 l!412)) (Cons!21452 lt!449142 lt!449144)) (= lambda!890 lambda!883))))

(declare-fun bs!29429 () Bool)

(assert (= bs!29429 (and d!120947 b!1015356)))

(assert (=> bs!29429 (= (= (Cons!21452 (h!22650 l!412) (t!30457 l!412)) (t!30457 l!412)) (= lambda!890 lambda!889))))

(declare-fun bs!29430 () Bool)

(assert (= bs!29430 (and d!120947 b!1015178)))

(assert (=> bs!29430 (= (= (Cons!21452 (h!22650 l!412) (t!30457 l!412)) l!412) (= lambda!890 lambda!838))))

(assert (=> d!120947 true))

(assert (=> d!120947 true))

(assert (=> d!120947 true))

(assert (=> d!120947 (forall!251 lt!449022 lambda!890)))

(declare-fun lt!449148 () Unit!33215)

(declare-fun choose!1639 (List!21456 List!21457 B!1456 tuple2!15170) Unit!33215)

(assert (=> d!120947 (= lt!449148 (choose!1639 (t!30457 l!412) lt!449022 value!115 (h!22650 l!412)))))

(declare-fun e!571181 () Bool)

(assert (=> d!120947 e!571181))

(declare-fun res!681088 () Bool)

(assert (=> d!120947 (=> (not res!681088) (not e!571181))))

(assert (=> d!120947 (= res!681088 (isStrictlySorted!586 (t!30457 l!412)))))

(assert (=> d!120947 (= (lemmaForallGetValueByKeySameWithASmallerHead!45 (t!30457 l!412) lt!449022 value!115 (h!22650 l!412)) lt!449148)))

(declare-fun b!1015355 () Bool)

(declare-fun res!681086 () Bool)

(assert (=> b!1015355 (=> (not res!681086) (not e!571181))))

(declare-fun isEmpty!855 (List!21456) Bool)

(assert (=> b!1015355 (= res!681086 (not (isEmpty!855 (t!30457 l!412))))))

(declare-fun res!681087 () Bool)

(assert (=> b!1015356 (=> (not res!681087) (not e!571181))))

(assert (=> b!1015356 (= res!681087 (forall!251 lt!449022 lambda!889))))

(declare-fun b!1015357 () Bool)

(declare-fun head!948 (List!21456) tuple2!15170)

(assert (=> b!1015357 (= e!571181 (bvslt (_1!7596 (h!22650 l!412)) (_1!7596 (head!948 (t!30457 l!412)))))))

(assert (= (and d!120947 res!681088) b!1015355))

(assert (= (and b!1015355 res!681086) b!1015356))

(assert (= (and b!1015356 res!681087) b!1015357))

(declare-fun m!937493 () Bool)

(assert (=> d!120947 m!937493))

(declare-fun m!937495 () Bool)

(assert (=> d!120947 m!937495))

(assert (=> d!120947 m!937435))

(declare-fun m!937497 () Bool)

(assert (=> b!1015355 m!937497))

(declare-fun m!937499 () Bool)

(assert (=> b!1015356 m!937499))

(declare-fun m!937501 () Bool)

(assert (=> b!1015357 m!937501))

(assert (=> b!1015178 d!120947))

(declare-fun d!120949 () Bool)

(declare-fun res!681089 () Bool)

(declare-fun e!571182 () Bool)

(assert (=> d!120949 (=> res!681089 e!571182)))

(assert (=> d!120949 (= res!681089 ((_ is Nil!21454) lt!449022))))

(assert (=> d!120949 (= (forall!251 lt!449022 lambda!838) e!571182)))

(declare-fun b!1015358 () Bool)

(declare-fun e!571183 () Bool)

(assert (=> b!1015358 (= e!571182 e!571183)))

(declare-fun res!681090 () Bool)

(assert (=> b!1015358 (=> (not res!681090) (not e!571183))))

(assert (=> b!1015358 (= res!681090 (dynLambda!1898 lambda!838 (h!22651 lt!449022)))))

(declare-fun b!1015359 () Bool)

(assert (=> b!1015359 (= e!571183 (forall!251 (t!30458 lt!449022) lambda!838))))

(assert (= (and d!120949 (not res!681089)) b!1015358))

(assert (= (and b!1015358 res!681090) b!1015359))

(declare-fun b_lambda!15409 () Bool)

(assert (=> (not b_lambda!15409) (not b!1015358)))

(declare-fun m!937503 () Bool)

(assert (=> b!1015358 m!937503))

(declare-fun m!937505 () Bool)

(assert (=> b!1015359 m!937505))

(assert (=> b!1015178 d!120949))

(declare-fun b!1015364 () Bool)

(declare-fun e!571186 () Bool)

(declare-fun tp!70607 () Bool)

(assert (=> b!1015364 (= e!571186 (and tp_is_empty!23523 tp!70607))))

(assert (=> b!1015179 (= tp!70595 e!571186)))

(assert (= (and b!1015179 ((_ is Cons!21452) (t!30457 l!412))) b!1015364))

(declare-fun b_lambda!15411 () Bool)

(assert (= b_lambda!15397 (or b!1015175 b_lambda!15411)))

(declare-fun bs!29431 () Bool)

(declare-fun d!120951 () Bool)

(assert (= bs!29431 (and d!120951 b!1015175)))

(declare-datatypes ((Option!583 0))(
  ( (Some!582 (v!14433 B!1456)) (None!581) )
))
(declare-fun getValueByKey!532 (List!21456 (_ BitVec 64)) Option!583)

(assert (=> bs!29431 (= (dynLambda!1898 lambda!839 (h!22651 lt!449022)) (= (getValueByKey!532 l!412 (h!22651 lt!449022)) (Some!582 value!115)))))

(declare-fun m!937507 () Bool)

(assert (=> bs!29431 m!937507))

(assert (=> b!1015238 d!120951))

(declare-fun b_lambda!15413 () Bool)

(assert (= b_lambda!15409 (or b!1015178 b_lambda!15413)))

(declare-fun bs!29432 () Bool)

(declare-fun d!120953 () Bool)

(assert (= bs!29432 (and d!120953 b!1015178)))

(assert (=> bs!29432 (= (dynLambda!1898 lambda!838 (h!22651 lt!449022)) (= (getValueByKey!532 l!412 (h!22651 lt!449022)) (Some!582 value!115)))))

