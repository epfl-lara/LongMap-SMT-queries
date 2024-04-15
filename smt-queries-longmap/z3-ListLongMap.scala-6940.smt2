; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87372 () Bool)

(assert start!87372)

(declare-fun res!679970 () Bool)

(declare-fun e!569464 () Bool)

(assert (=> start!87372 (=> (not res!679970) (not e!569464))))

(declare-datatypes ((B!1346 0))(
  ( (B!1347 (val!11757 Int)) )
))
(declare-datatypes ((tuple2!15140 0))(
  ( (tuple2!15141 (_1!7581 (_ BitVec 64)) (_2!7581 B!1346)) )
))
(declare-datatypes ((List!21396 0))(
  ( (Nil!21393) (Cons!21392 (h!22590 tuple2!15140) (t!30388 List!21396)) )
))
(declare-fun l!412 () List!21396)

(declare-fun isStrictlySorted!533 (List!21396) Bool)

(assert (=> start!87372 (= res!679970 (isStrictlySorted!533 l!412))))

(assert (=> start!87372 e!569464))

(declare-fun e!569465 () Bool)

(assert (=> start!87372 e!569465))

(declare-fun tp_is_empty!23413 () Bool)

(assert (=> start!87372 tp_is_empty!23413))

(declare-fun b!1012307 () Bool)

(declare-fun res!679969 () Bool)

(assert (=> b!1012307 (=> (not res!679969) (not e!569464))))

(declare-fun value!115 () B!1346)

(get-info :version)

(assert (=> b!1012307 (= res!679969 (and (not (= (_2!7581 (h!22590 l!412)) value!115)) ((_ is Cons!21392) l!412)))))

(declare-fun b!1012308 () Bool)

(assert (=> b!1012308 (= e!569464 (not (isStrictlySorted!533 (t!30388 l!412))))))

(declare-datatypes ((List!21397 0))(
  ( (Nil!21394) (Cons!21393 (h!22591 (_ BitVec 64)) (t!30389 List!21397)) )
))
(declare-fun lt!447271 () List!21397)

(declare-fun getKeysOf!19 (List!21396 B!1346) List!21397)

(assert (=> b!1012308 (= lt!447271 (getKeysOf!19 (t!30388 l!412) value!115))))

(declare-fun b!1012309 () Bool)

(declare-fun tp!70302 () Bool)

(assert (=> b!1012309 (= e!569465 (and tp_is_empty!23413 tp!70302))))

(assert (= (and start!87372 res!679970) b!1012307))

(assert (= (and b!1012307 res!679969) b!1012308))

(assert (= (and start!87372 ((_ is Cons!21392) l!412)) b!1012309))

(declare-fun m!935389 () Bool)

(assert (=> start!87372 m!935389))

(declare-fun m!935391 () Bool)

(assert (=> b!1012308 m!935391))

(declare-fun m!935393 () Bool)

(assert (=> b!1012308 m!935393))

(check-sat (not b!1012308) (not start!87372) (not b!1012309) tp_is_empty!23413)
(check-sat)
(get-model)

(declare-fun d!120157 () Bool)

(declare-fun res!679987 () Bool)

(declare-fun e!569482 () Bool)

(assert (=> d!120157 (=> res!679987 e!569482)))

(assert (=> d!120157 (= res!679987 (or ((_ is Nil!21393) (t!30388 l!412)) ((_ is Nil!21393) (t!30388 (t!30388 l!412)))))))

(assert (=> d!120157 (= (isStrictlySorted!533 (t!30388 l!412)) e!569482)))

(declare-fun b!1012332 () Bool)

(declare-fun e!569483 () Bool)

(assert (=> b!1012332 (= e!569482 e!569483)))

(declare-fun res!679988 () Bool)

(assert (=> b!1012332 (=> (not res!679988) (not e!569483))))

(assert (=> b!1012332 (= res!679988 (bvslt (_1!7581 (h!22590 (t!30388 l!412))) (_1!7581 (h!22590 (t!30388 (t!30388 l!412))))))))

(declare-fun b!1012333 () Bool)

(assert (=> b!1012333 (= e!569483 (isStrictlySorted!533 (t!30388 (t!30388 l!412))))))

(assert (= (and d!120157 (not res!679987)) b!1012332))

(assert (= (and b!1012332 res!679988) b!1012333))

(declare-fun m!935407 () Bool)

(assert (=> b!1012333 m!935407))

(assert (=> b!1012308 d!120157))

(declare-fun b!1012394 () Bool)

(assert (=> b!1012394 true))

(assert (=> b!1012394 true))

(assert (=> b!1012394 true))

(declare-fun bs!28793 () Bool)

(declare-fun b!1012401 () Bool)

(assert (= bs!28793 (and b!1012401 b!1012394)))

(declare-fun lambda!370 () Int)

(declare-fun lt!447357 () List!21396)

(declare-fun lt!447360 () tuple2!15140)

(declare-fun lt!447361 () tuple2!15140)

(declare-fun lt!447356 () List!21396)

(declare-fun lambda!366 () Int)

(assert (=> bs!28793 (= (= (Cons!21392 lt!447361 lt!447356) (Cons!21392 lt!447360 lt!447357)) (= lambda!370 lambda!366))))

(assert (=> b!1012401 true))

(assert (=> b!1012401 true))

(assert (=> b!1012401 true))

(declare-fun bs!28797 () Bool)

(declare-fun d!120163 () Bool)

(assert (= bs!28797 (and d!120163 b!1012394)))

(declare-fun lambda!373 () Int)

(assert (=> bs!28797 (= (= (t!30388 l!412) (Cons!21392 lt!447360 lt!447357)) (= lambda!373 lambda!366))))

(declare-fun bs!28798 () Bool)

(assert (= bs!28798 (and d!120163 b!1012401)))

(assert (=> bs!28798 (= (= (t!30388 l!412) (Cons!21392 lt!447361 lt!447356)) (= lambda!373 lambda!370))))

(assert (=> d!120163 true))

(assert (=> d!120163 true))

(declare-fun call!42515 () Bool)

(assert (=> b!1012394 call!42515))

(declare-datatypes ((Unit!32953 0))(
  ( (Unit!32954) )
))
(declare-fun lt!447355 () Unit!32953)

(declare-fun call!42516 () Unit!32953)

(assert (=> b!1012394 (= lt!447355 call!42516)))

(assert (=> b!1012394 (= lt!447360 (h!22590 (t!30388 l!412)))))

(declare-fun lt!447352 () List!21397)

(declare-fun call!42517 () List!21397)

(assert (=> b!1012394 (= lt!447352 call!42517)))

(assert (=> b!1012394 (= lt!447357 (t!30388 (t!30388 l!412)))))

(declare-fun e!569522 () Unit!32953)

(assert (=> b!1012394 (= e!569522 lt!447355)))

(declare-fun b!1012395 () Bool)

(declare-fun lt!447351 () Unit!32953)

(declare-fun e!569520 () Unit!32953)

(assert (=> b!1012395 (= lt!447351 e!569520)))

(declare-fun c!102271 () Bool)

(declare-fun call!42518 () Bool)

(assert (=> b!1012395 (= c!102271 (not call!42518))))

(declare-fun lt!447359 () List!21397)

(assert (=> b!1012395 (= lt!447359 call!42517)))

(declare-fun e!569521 () List!21397)

(assert (=> b!1012395 (= e!569521 call!42517)))

(declare-fun b!1012396 () Bool)

(declare-fun Unit!32960 () Unit!32953)

(assert (=> b!1012396 (= e!569520 Unit!32960)))

(declare-fun b!1012397 () Bool)

(assert (=> b!1012397 (= e!569521 Nil!21394)))

(declare-fun lt!447353 () List!21397)

(declare-fun forall!215 (List!21397 Int) Bool)

(assert (=> d!120163 (forall!215 lt!447353 lambda!373)))

(declare-fun e!569523 () List!21397)

(assert (=> d!120163 (= lt!447353 e!569523)))

(declare-fun c!102272 () Bool)

(assert (=> d!120163 (= c!102272 (and ((_ is Cons!21392) (t!30388 l!412)) (= (_2!7581 (h!22590 (t!30388 l!412))) value!115)))))

(assert (=> d!120163 (isStrictlySorted!533 (t!30388 l!412))))

(assert (=> d!120163 (= (getKeysOf!19 (t!30388 l!412) value!115) lt!447353)))

(declare-fun b!1012398 () Bool)

(assert (=> b!1012398 (= e!569523 e!569521)))

(declare-fun c!102270 () Bool)

(assert (=> b!1012398 (= c!102270 (and ((_ is Cons!21392) (t!30388 l!412)) (not (= (_2!7581 (h!22590 (t!30388 l!412))) value!115))))))

(declare-fun bm!42512 () Bool)

(assert (=> bm!42512 (= call!42517 (getKeysOf!19 (t!30388 (t!30388 l!412)) value!115))))

(declare-fun b!1012399 () Bool)

(declare-fun Unit!32962 () Unit!32953)

(assert (=> b!1012399 (= e!569522 Unit!32962)))

(declare-fun bm!42513 () Bool)

(declare-fun isEmpty!798 (List!21397) Bool)

(assert (=> bm!42513 (= call!42518 (isEmpty!798 call!42517))))

(declare-fun bm!42514 () Bool)

(declare-fun lt!447350 () List!21397)

(assert (=> bm!42514 (= call!42515 (forall!215 (ite c!102272 lt!447352 lt!447350) (ite c!102272 lambda!366 lambda!370)))))

(declare-fun b!1012400 () Bool)

(assert (=> b!1012400 (= e!569523 (Cons!21393 (_1!7581 (h!22590 (t!30388 l!412))) call!42517))))

(declare-fun c!102269 () Bool)

(assert (=> b!1012400 (= c!102269 (not call!42518))))

(declare-fun lt!447358 () Unit!32953)

(assert (=> b!1012400 (= lt!447358 e!569522)))

(declare-fun bm!42515 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!13 (List!21396 List!21397 B!1346 tuple2!15140) Unit!32953)

(assert (=> bm!42515 (= call!42516 (lemmaForallGetValueByKeySameWithASmallerHead!13 (ite c!102272 lt!447357 lt!447356) (ite c!102272 lt!447352 lt!447350) value!115 (ite c!102272 lt!447360 lt!447361)))))

(declare-fun lt!447354 () Unit!32953)

(assert (=> b!1012401 (= e!569520 lt!447354)))

(assert (=> b!1012401 (= lt!447356 (t!30388 (t!30388 l!412)))))

(assert (=> b!1012401 (= lt!447350 call!42517)))

(assert (=> b!1012401 (= lt!447361 (h!22590 (t!30388 l!412)))))

(assert (=> b!1012401 (= lt!447354 call!42516)))

(assert (=> b!1012401 call!42515))

(assert (= (and d!120163 c!102272) b!1012400))

(assert (= (and d!120163 (not c!102272)) b!1012398))

(assert (= (and b!1012400 c!102269) b!1012394))

(assert (= (and b!1012400 (not c!102269)) b!1012399))

(assert (= (and b!1012398 c!102270) b!1012395))

(assert (= (and b!1012398 (not c!102270)) b!1012397))

(assert (= (and b!1012395 c!102271) b!1012401))

(assert (= (and b!1012395 (not c!102271)) b!1012396))

(assert (= (or b!1012394 b!1012401) bm!42515))

(assert (= (or b!1012394 b!1012401) bm!42514))

(assert (= (or b!1012400 b!1012394 b!1012395 b!1012401) bm!42512))

(assert (= (or b!1012400 b!1012395) bm!42513))

(declare-fun m!935423 () Bool)

(assert (=> bm!42512 m!935423))

(declare-fun m!935425 () Bool)

(assert (=> bm!42513 m!935425))

(declare-fun m!935427 () Bool)

(assert (=> bm!42514 m!935427))

(declare-fun m!935429 () Bool)

(assert (=> d!120163 m!935429))

(assert (=> d!120163 m!935391))

(declare-fun m!935431 () Bool)

(assert (=> bm!42515 m!935431))

(assert (=> b!1012308 d!120163))

(declare-fun d!120171 () Bool)

(declare-fun res!680003 () Bool)

(declare-fun e!569534 () Bool)

(assert (=> d!120171 (=> res!680003 e!569534)))

(assert (=> d!120171 (= res!680003 (or ((_ is Nil!21393) l!412) ((_ is Nil!21393) (t!30388 l!412))))))

(assert (=> d!120171 (= (isStrictlySorted!533 l!412) e!569534)))

(declare-fun b!1012440 () Bool)

(declare-fun e!569535 () Bool)

(assert (=> b!1012440 (= e!569534 e!569535)))

(declare-fun res!680004 () Bool)

(assert (=> b!1012440 (=> (not res!680004) (not e!569535))))

(assert (=> b!1012440 (= res!680004 (bvslt (_1!7581 (h!22590 l!412)) (_1!7581 (h!22590 (t!30388 l!412)))))))

(declare-fun b!1012441 () Bool)

(assert (=> b!1012441 (= e!569535 (isStrictlySorted!533 (t!30388 l!412)))))

(assert (= (and d!120171 (not res!680003)) b!1012440))

(assert (= (and b!1012440 res!680004) b!1012441))

(assert (=> b!1012441 m!935391))

(assert (=> start!87372 d!120171))

(declare-fun b!1012451 () Bool)

(declare-fun e!569543 () Bool)

(declare-fun tp!70314 () Bool)

(assert (=> b!1012451 (= e!569543 (and tp_is_empty!23413 tp!70314))))

(assert (=> b!1012309 (= tp!70302 e!569543)))

(assert (= (and b!1012309 ((_ is Cons!21392) (t!30388 l!412))) b!1012451))

(check-sat tp_is_empty!23413 (not b!1012333) (not bm!42512) (not d!120163) (not bm!42515) (not b!1012441) (not bm!42513) (not bm!42514) (not b!1012451))
(check-sat)
