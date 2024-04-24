; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88036 () Bool)

(assert start!88036)

(declare-fun b!1016256 () Bool)

(assert (=> b!1016256 true))

(assert (=> b!1016256 true))

(declare-fun b!1016253 () Bool)

(declare-datatypes ((Unit!33199 0))(
  ( (Unit!33200) )
))
(declare-fun e!571799 () Unit!33199)

(declare-fun Unit!33201 () Unit!33199)

(assert (=> b!1016253 (= e!571799 Unit!33201)))

(declare-fun b!1016254 () Bool)

(declare-fun e!571798 () Bool)

(declare-datatypes ((B!1448 0))(
  ( (B!1449 (val!11808 Int)) )
))
(declare-datatypes ((tuple2!15166 0))(
  ( (tuple2!15167 (_1!7594 (_ BitVec 64)) (_2!7594 B!1448)) )
))
(declare-datatypes ((List!21437 0))(
  ( (Nil!21434) (Cons!21433 (h!22640 tuple2!15166) (t!30430 List!21437)) )
))
(declare-fun l!412 () List!21437)

(declare-fun ListPrimitiveSize!118 (List!21437) Int)

(assert (=> b!1016254 (= e!571798 (>= (ListPrimitiveSize!118 (t!30430 l!412)) (ListPrimitiveSize!118 l!412)))))

(declare-fun lt!449371 () Unit!33199)

(assert (=> b!1016254 (= lt!449371 e!571799)))

(declare-fun c!103207 () Bool)

(declare-datatypes ((List!21438 0))(
  ( (Nil!21435) (Cons!21434 (h!22641 (_ BitVec 64)) (t!30431 List!21438)) )
))
(declare-fun lt!449370 () List!21438)

(declare-fun isEmpty!848 (List!21438) Bool)

(assert (=> b!1016254 (= c!103207 (not (isEmpty!848 lt!449370)))))

(declare-fun value!115 () B!1448)

(declare-fun getKeysOf!55 (List!21437 B!1448) List!21438)

(assert (=> b!1016254 (= lt!449370 (getKeysOf!55 (t!30430 l!412) value!115))))

(declare-fun b!1016255 () Bool)

(declare-fun e!571800 () Bool)

(declare-fun tp_is_empty!23515 () Bool)

(declare-fun tp!70575 () Bool)

(assert (=> b!1016255 (= e!571800 (and tp_is_empty!23515 tp!70575))))

(declare-fun lt!449372 () Unit!33199)

(assert (=> b!1016256 (= e!571799 lt!449372)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!44 (List!21437 List!21438 B!1448 tuple2!15166) Unit!33199)

(assert (=> b!1016256 (= lt!449372 (lemmaForallGetValueByKeySameWithASmallerHead!44 (t!30430 l!412) lt!449370 value!115 (h!22640 l!412)))))

(declare-fun lambda!776 () Int)

(declare-fun forall!249 (List!21438 Int) Bool)

(assert (=> b!1016256 (forall!249 lt!449370 lambda!776)))

(declare-fun res!681446 () Bool)

(assert (=> start!88036 (=> (not res!681446) (not e!571798))))

(declare-fun isStrictlySorted!570 (List!21437) Bool)

(assert (=> start!88036 (= res!681446 (isStrictlySorted!570 l!412))))

(assert (=> start!88036 e!571798))

(assert (=> start!88036 e!571800))

(assert (=> start!88036 tp_is_empty!23515))

(declare-fun b!1016257 () Bool)

(declare-fun res!681445 () Bool)

(assert (=> b!1016257 (=> (not res!681445) (not e!571798))))

(get-info :version)

(assert (=> b!1016257 (= res!681445 (and (not (= (_2!7594 (h!22640 l!412)) value!115)) ((_ is Cons!21433) l!412)))))

(assert (= (and start!88036 res!681446) b!1016257))

(assert (= (and b!1016257 res!681445) b!1016254))

(assert (= (and b!1016254 c!103207) b!1016256))

(assert (= (and b!1016254 (not c!103207)) b!1016253))

(assert (= (and start!88036 ((_ is Cons!21433) l!412)) b!1016255))

(declare-fun m!938921 () Bool)

(assert (=> b!1016254 m!938921))

(declare-fun m!938923 () Bool)

(assert (=> b!1016254 m!938923))

(declare-fun m!938925 () Bool)

(assert (=> b!1016254 m!938925))

(declare-fun m!938927 () Bool)

(assert (=> b!1016254 m!938927))

(declare-fun m!938929 () Bool)

(assert (=> b!1016256 m!938929))

(declare-fun m!938931 () Bool)

(assert (=> b!1016256 m!938931))

(declare-fun m!938933 () Bool)

(assert (=> start!88036 m!938933))

(check-sat (not start!88036) tp_is_empty!23515 (not b!1016254) (not b!1016256) (not b!1016255))
(check-sat)
(get-model)

(declare-fun d!121333 () Bool)

(declare-fun lt!449393 () Int)

(assert (=> d!121333 (>= lt!449393 0)))

(declare-fun e!571821 () Int)

(assert (=> d!121333 (= lt!449393 e!571821)))

(declare-fun c!103216 () Bool)

(assert (=> d!121333 (= c!103216 ((_ is Nil!21434) (t!30430 l!412)))))

(assert (=> d!121333 (= (ListPrimitiveSize!118 (t!30430 l!412)) lt!449393)))

(declare-fun b!1016304 () Bool)

(assert (=> b!1016304 (= e!571821 0)))

(declare-fun b!1016305 () Bool)

(assert (=> b!1016305 (= e!571821 (+ 1 (ListPrimitiveSize!118 (t!30430 (t!30430 l!412)))))))

(assert (= (and d!121333 c!103216) b!1016304))

(assert (= (and d!121333 (not c!103216)) b!1016305))

(declare-fun m!938963 () Bool)

(assert (=> b!1016305 m!938963))

(assert (=> b!1016254 d!121333))

(declare-fun d!121335 () Bool)

(declare-fun lt!449394 () Int)

(assert (=> d!121335 (>= lt!449394 0)))

(declare-fun e!571822 () Int)

(assert (=> d!121335 (= lt!449394 e!571822)))

(declare-fun c!103217 () Bool)

(assert (=> d!121335 (= c!103217 ((_ is Nil!21434) l!412))))

(assert (=> d!121335 (= (ListPrimitiveSize!118 l!412) lt!449394)))

(declare-fun b!1016306 () Bool)

(assert (=> b!1016306 (= e!571822 0)))

(declare-fun b!1016307 () Bool)

(assert (=> b!1016307 (= e!571822 (+ 1 (ListPrimitiveSize!118 (t!30430 l!412))))))

(assert (= (and d!121335 c!103217) b!1016306))

(assert (= (and d!121335 (not c!103217)) b!1016307))

(assert (=> b!1016307 m!938921))

(assert (=> b!1016254 d!121335))

(declare-fun d!121337 () Bool)

(assert (=> d!121337 (= (isEmpty!848 lt!449370) ((_ is Nil!21435) lt!449370))))

(assert (=> b!1016254 d!121337))

(declare-fun bs!29336 () Bool)

(declare-fun b!1016365 () Bool)

(assert (= bs!29336 (and b!1016365 b!1016256)))

(declare-fun lambda!797 () Int)

(declare-fun lt!449447 () tuple2!15166)

(declare-fun lt!449444 () List!21437)

(assert (=> bs!29336 (= (= (Cons!21433 lt!449447 lt!449444) l!412) (= lambda!797 lambda!776))))

(assert (=> b!1016365 true))

(assert (=> b!1016365 true))

(assert (=> b!1016365 true))

(declare-fun bs!29337 () Bool)

(declare-fun b!1016367 () Bool)

(assert (= bs!29337 (and b!1016367 b!1016256)))

(declare-fun lt!449450 () tuple2!15166)

(declare-fun lt!449448 () List!21437)

(declare-fun lambda!799 () Int)

(assert (=> bs!29337 (= (= (Cons!21433 lt!449450 lt!449448) l!412) (= lambda!799 lambda!776))))

(declare-fun bs!29338 () Bool)

(assert (= bs!29338 (and b!1016367 b!1016365)))

(assert (=> bs!29338 (= (= (Cons!21433 lt!449450 lt!449448) (Cons!21433 lt!449447 lt!449444)) (= lambda!799 lambda!797))))

(assert (=> b!1016367 true))

(assert (=> b!1016367 true))

(assert (=> b!1016367 true))

(declare-fun bs!29339 () Bool)

(declare-fun d!121339 () Bool)

(assert (= bs!29339 (and d!121339 b!1016256)))

(declare-fun lambda!801 () Int)

(assert (=> bs!29339 (= (= (t!30430 l!412) l!412) (= lambda!801 lambda!776))))

(declare-fun bs!29340 () Bool)

(assert (= bs!29340 (and d!121339 b!1016365)))

(assert (=> bs!29340 (= (= (t!30430 l!412) (Cons!21433 lt!449447 lt!449444)) (= lambda!801 lambda!797))))

(declare-fun bs!29341 () Bool)

(assert (= bs!29341 (and d!121339 b!1016367)))

(assert (=> bs!29341 (= (= (t!30430 l!412) (Cons!21433 lt!449450 lt!449448)) (= lambda!801 lambda!799))))

(assert (=> d!121339 true))

(assert (=> d!121339 true))

(declare-fun call!42964 () Bool)

(assert (=> b!1016365 call!42964))

(declare-fun lt!449446 () Unit!33199)

(declare-fun call!42961 () Unit!33199)

(assert (=> b!1016365 (= lt!449446 call!42961)))

(assert (=> b!1016365 (= lt!449447 (h!22640 (t!30430 l!412)))))

(declare-fun lt!449445 () List!21438)

(declare-fun call!42962 () List!21438)

(assert (=> b!1016365 (= lt!449445 call!42962)))

(assert (=> b!1016365 (= lt!449444 (t!30430 (t!30430 l!412)))))

(declare-fun e!571855 () Unit!33199)

(assert (=> b!1016365 (= e!571855 lt!449446)))

(declare-fun b!1016366 () Bool)

(declare-fun lt!449443 () Unit!33199)

(declare-fun e!571852 () Unit!33199)

(assert (=> b!1016366 (= lt!449443 e!571852)))

(declare-fun c!103240 () Bool)

(declare-fun call!42963 () Bool)

(assert (=> b!1016366 (= c!103240 (not call!42963))))

(declare-fun lt!449451 () List!21438)

(assert (=> b!1016366 (= lt!449451 call!42962)))

(declare-fun e!571854 () List!21438)

(assert (=> b!1016366 (= e!571854 call!42962)))

(declare-fun lt!449453 () Unit!33199)

(assert (=> b!1016367 (= e!571852 lt!449453)))

(assert (=> b!1016367 (= lt!449448 (t!30430 (t!30430 l!412)))))

(declare-fun lt!449452 () List!21438)

(assert (=> b!1016367 (= lt!449452 call!42962)))

(assert (=> b!1016367 (= lt!449450 (h!22640 (t!30430 l!412)))))

(assert (=> b!1016367 (= lt!449453 call!42961)))

(assert (=> b!1016367 call!42964))

(declare-fun bm!42958 () Bool)

(assert (=> bm!42958 (= call!42963 (isEmpty!848 call!42962))))

(declare-fun bm!42959 () Bool)

(declare-fun c!103239 () Bool)

(assert (=> bm!42959 (= call!42964 (forall!249 (ite c!103239 lt!449445 lt!449452) (ite c!103239 lambda!797 lambda!799)))))

(declare-fun lt!449449 () List!21438)

(assert (=> d!121339 (forall!249 lt!449449 lambda!801)))

(declare-fun e!571853 () List!21438)

(assert (=> d!121339 (= lt!449449 e!571853)))

(assert (=> d!121339 (= c!103239 (and ((_ is Cons!21433) (t!30430 l!412)) (= (_2!7594 (h!22640 (t!30430 l!412))) value!115)))))

(assert (=> d!121339 (isStrictlySorted!570 (t!30430 l!412))))

(assert (=> d!121339 (= (getKeysOf!55 (t!30430 l!412) value!115) lt!449449)))

(declare-fun bm!42960 () Bool)

(assert (=> bm!42960 (= call!42962 (getKeysOf!55 (t!30430 (t!30430 l!412)) value!115))))

(declare-fun b!1016368 () Bool)

(declare-fun Unit!33208 () Unit!33199)

(assert (=> b!1016368 (= e!571852 Unit!33208)))

(declare-fun b!1016369 () Bool)

(assert (=> b!1016369 (= e!571854 Nil!21435)))

(declare-fun b!1016370 () Bool)

(assert (=> b!1016370 (= e!571853 e!571854)))

(declare-fun c!103238 () Bool)

(assert (=> b!1016370 (= c!103238 (and ((_ is Cons!21433) (t!30430 l!412)) (not (= (_2!7594 (h!22640 (t!30430 l!412))) value!115))))))

(declare-fun b!1016371 () Bool)

(assert (=> b!1016371 (= e!571853 (Cons!21434 (_1!7594 (h!22640 (t!30430 l!412))) call!42962))))

(declare-fun c!103241 () Bool)

(assert (=> b!1016371 (= c!103241 (not call!42963))))

(declare-fun lt!449442 () Unit!33199)

(assert (=> b!1016371 (= lt!449442 e!571855)))

(declare-fun b!1016372 () Bool)

(declare-fun Unit!33209 () Unit!33199)

(assert (=> b!1016372 (= e!571855 Unit!33209)))

(declare-fun bm!42961 () Bool)

(assert (=> bm!42961 (= call!42961 (lemmaForallGetValueByKeySameWithASmallerHead!44 (ite c!103239 lt!449444 lt!449448) (ite c!103239 lt!449445 lt!449452) value!115 (ite c!103239 lt!449447 lt!449450)))))

(assert (= (and d!121339 c!103239) b!1016371))

(assert (= (and d!121339 (not c!103239)) b!1016370))

(assert (= (and b!1016371 c!103241) b!1016365))

(assert (= (and b!1016371 (not c!103241)) b!1016372))

(assert (= (and b!1016370 c!103238) b!1016366))

(assert (= (and b!1016370 (not c!103238)) b!1016369))

(assert (= (and b!1016366 c!103240) b!1016367))

(assert (= (and b!1016366 (not c!103240)) b!1016368))

(assert (= (or b!1016365 b!1016367) bm!42961))

(assert (= (or b!1016365 b!1016367) bm!42959))

(assert (= (or b!1016371 b!1016365 b!1016366 b!1016367) bm!42960))

(assert (= (or b!1016371 b!1016366) bm!42958))

(declare-fun m!938985 () Bool)

(assert (=> bm!42960 m!938985))

(declare-fun m!938987 () Bool)

(assert (=> bm!42961 m!938987))

(declare-fun m!938989 () Bool)

(assert (=> d!121339 m!938989))

(declare-fun m!938991 () Bool)

(assert (=> d!121339 m!938991))

(declare-fun m!938993 () Bool)

(assert (=> bm!42958 m!938993))

(declare-fun m!938995 () Bool)

(assert (=> bm!42959 m!938995))

(assert (=> b!1016254 d!121339))

(declare-fun d!121361 () Bool)

(declare-fun res!681478 () Bool)

(declare-fun e!571864 () Bool)

(assert (=> d!121361 (=> res!681478 e!571864)))

(assert (=> d!121361 (= res!681478 (or ((_ is Nil!21434) l!412) ((_ is Nil!21434) (t!30430 l!412))))))

(assert (=> d!121361 (= (isStrictlySorted!570 l!412) e!571864)))

(declare-fun b!1016387 () Bool)

(declare-fun e!571865 () Bool)

(assert (=> b!1016387 (= e!571864 e!571865)))

(declare-fun res!681479 () Bool)

(assert (=> b!1016387 (=> (not res!681479) (not e!571865))))

(assert (=> b!1016387 (= res!681479 (bvslt (_1!7594 (h!22640 l!412)) (_1!7594 (h!22640 (t!30430 l!412)))))))

(declare-fun b!1016388 () Bool)

(assert (=> b!1016388 (= e!571865 (isStrictlySorted!570 (t!30430 l!412)))))

(assert (= (and d!121361 (not res!681478)) b!1016387))

(assert (= (and b!1016387 res!681479) b!1016388))

(assert (=> b!1016388 m!938991))

(assert (=> start!88036 d!121361))

(declare-fun bs!29348 () Bool)

(declare-fun b!1016422 () Bool)

(assert (= bs!29348 (and b!1016422 b!1016256)))

(declare-fun lambda!815 () Int)

(assert (=> bs!29348 (= (= (t!30430 l!412) l!412) (= lambda!815 lambda!776))))

(declare-fun bs!29349 () Bool)

(assert (= bs!29349 (and b!1016422 b!1016365)))

(assert (=> bs!29349 (= (= (t!30430 l!412) (Cons!21433 lt!449447 lt!449444)) (= lambda!815 lambda!797))))

(declare-fun bs!29350 () Bool)

(assert (= bs!29350 (and b!1016422 b!1016367)))

(assert (=> bs!29350 (= (= (t!30430 l!412) (Cons!21433 lt!449450 lt!449448)) (= lambda!815 lambda!799))))

(declare-fun bs!29351 () Bool)

(assert (= bs!29351 (and b!1016422 d!121339)))

(assert (=> bs!29351 (= lambda!815 lambda!801)))

(assert (=> b!1016422 true))

(assert (=> b!1016422 true))

(declare-fun bs!29352 () Bool)

(declare-fun d!121363 () Bool)

(assert (= bs!29352 (and d!121363 b!1016422)))

(declare-fun lambda!820 () Int)

(assert (=> bs!29352 (= (= (Cons!21433 (h!22640 l!412) (t!30430 l!412)) (t!30430 l!412)) (= lambda!820 lambda!815))))

(declare-fun bs!29353 () Bool)

(assert (= bs!29353 (and d!121363 b!1016256)))

(assert (=> bs!29353 (= (= (Cons!21433 (h!22640 l!412) (t!30430 l!412)) l!412) (= lambda!820 lambda!776))))

(declare-fun bs!29354 () Bool)

(assert (= bs!29354 (and d!121363 b!1016367)))

(assert (=> bs!29354 (= (= (Cons!21433 (h!22640 l!412) (t!30430 l!412)) (Cons!21433 lt!449450 lt!449448)) (= lambda!820 lambda!799))))

(declare-fun bs!29355 () Bool)

(assert (= bs!29355 (and d!121363 b!1016365)))

(assert (=> bs!29355 (= (= (Cons!21433 (h!22640 l!412) (t!30430 l!412)) (Cons!21433 lt!449447 lt!449444)) (= lambda!820 lambda!797))))

(declare-fun bs!29356 () Bool)

(assert (= bs!29356 (and d!121363 d!121339)))

(assert (=> bs!29356 (= (= (Cons!21433 (h!22640 l!412) (t!30430 l!412)) (t!30430 l!412)) (= lambda!820 lambda!801))))

(assert (=> d!121363 true))

(assert (=> d!121363 true))

(assert (=> d!121363 true))

(assert (=> d!121363 (forall!249 lt!449370 lambda!820)))

(declare-fun lt!449504 () Unit!33199)

(declare-fun choose!1639 (List!21437 List!21438 B!1448 tuple2!15166) Unit!33199)

(assert (=> d!121363 (= lt!449504 (choose!1639 (t!30430 l!412) lt!449370 value!115 (h!22640 l!412)))))

(declare-fun e!571880 () Bool)

(assert (=> d!121363 e!571880))

(declare-fun res!681488 () Bool)

(assert (=> d!121363 (=> (not res!681488) (not e!571880))))

(assert (=> d!121363 (= res!681488 (isStrictlySorted!570 (t!30430 l!412)))))

(assert (=> d!121363 (= (lemmaForallGetValueByKeySameWithASmallerHead!44 (t!30430 l!412) lt!449370 value!115 (h!22640 l!412)) lt!449504)))

(declare-fun b!1016421 () Bool)

(declare-fun res!681486 () Bool)

(assert (=> b!1016421 (=> (not res!681486) (not e!571880))))

(declare-fun isEmpty!852 (List!21437) Bool)

(assert (=> b!1016421 (= res!681486 (not (isEmpty!852 (t!30430 l!412))))))

(declare-fun res!681487 () Bool)

(assert (=> b!1016422 (=> (not res!681487) (not e!571880))))

(assert (=> b!1016422 (= res!681487 (forall!249 lt!449370 lambda!815))))

(declare-fun b!1016423 () Bool)

(declare-fun head!940 (List!21437) tuple2!15166)

(assert (=> b!1016423 (= e!571880 (bvslt (_1!7594 (h!22640 l!412)) (_1!7594 (head!940 (t!30430 l!412)))))))

(assert (= (and d!121363 res!681488) b!1016421))

(assert (= (and b!1016421 res!681486) b!1016422))

(assert (= (and b!1016422 res!681487) b!1016423))

(declare-fun m!939009 () Bool)

(assert (=> d!121363 m!939009))

(declare-fun m!939011 () Bool)

(assert (=> d!121363 m!939011))

(assert (=> d!121363 m!938991))

(declare-fun m!939013 () Bool)

(assert (=> b!1016421 m!939013))

(declare-fun m!939015 () Bool)

(assert (=> b!1016422 m!939015))

(declare-fun m!939017 () Bool)

(assert (=> b!1016423 m!939017))

(assert (=> b!1016256 d!121363))

(declare-fun d!121367 () Bool)

(declare-fun res!681502 () Bool)

(declare-fun e!571892 () Bool)

(assert (=> d!121367 (=> res!681502 e!571892)))

(assert (=> d!121367 (= res!681502 ((_ is Nil!21435) lt!449370))))

(assert (=> d!121367 (= (forall!249 lt!449370 lambda!776) e!571892)))

(declare-fun b!1016445 () Bool)

(declare-fun e!571893 () Bool)

(assert (=> b!1016445 (= e!571892 e!571893)))

(declare-fun res!681503 () Bool)

(assert (=> b!1016445 (=> (not res!681503) (not e!571893))))

(declare-fun dynLambda!1919 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016445 (= res!681503 (dynLambda!1919 lambda!776 (h!22641 lt!449370)))))

(declare-fun b!1016446 () Bool)

(assert (=> b!1016446 (= e!571893 (forall!249 (t!30431 lt!449370) lambda!776))))

(assert (= (and d!121367 (not res!681502)) b!1016445))

(assert (= (and b!1016445 res!681503) b!1016446))

(declare-fun b_lambda!15395 () Bool)

(assert (=> (not b_lambda!15395) (not b!1016445)))

(declare-fun m!939019 () Bool)

(assert (=> b!1016445 m!939019))

(declare-fun m!939021 () Bool)

(assert (=> b!1016446 m!939021))

(assert (=> b!1016256 d!121367))

(declare-fun b!1016451 () Bool)

(declare-fun e!571896 () Bool)

(declare-fun tp!70584 () Bool)

(assert (=> b!1016451 (= e!571896 (and tp_is_empty!23515 tp!70584))))

(assert (=> b!1016255 (= tp!70575 e!571896)))

(assert (= (and b!1016255 ((_ is Cons!21433) (t!30430 l!412))) b!1016451))

(declare-fun b_lambda!15397 () Bool)

(assert (= b_lambda!15395 (or b!1016256 b_lambda!15397)))

(declare-fun bs!29373 () Bool)

(declare-fun d!121371 () Bool)

(assert (= bs!29373 (and d!121371 b!1016256)))

(declare-datatypes ((Option!578 0))(
  ( (Some!577 (v!14428 B!1448)) (None!576) )
))
(declare-fun getValueByKey!527 (List!21437 (_ BitVec 64)) Option!578)

(assert (=> bs!29373 (= (dynLambda!1919 lambda!776 (h!22641 lt!449370)) (= (getValueByKey!527 l!412 (h!22641 lt!449370)) (Some!577 value!115)))))

(declare-fun m!939033 () Bool)

(assert (=> bs!29373 m!939033))

(assert (=> b!1016445 d!121371))

(check-sat (not b!1016451) tp_is_empty!23515 (not bm!42960) (not b_lambda!15397) (not d!121339) (not b!1016421) (not bs!29373) (not b!1016305) (not b!1016446) (not bm!42959) (not b!1016422) (not b!1016423) (not bm!42958) (not b!1016307) (not bm!42961) (not d!121363) (not b!1016388))
(check-sat)
