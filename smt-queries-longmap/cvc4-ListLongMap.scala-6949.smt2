; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87514 () Bool)

(assert start!87514)

(declare-fun b!1013315 () Bool)

(declare-fun res!680374 () Bool)

(declare-fun e!570033 () Bool)

(assert (=> b!1013315 (=> (not res!680374) (not e!570033))))

(declare-datatypes ((B!1404 0))(
  ( (B!1405 (val!11786 Int)) )
))
(declare-datatypes ((tuple2!15118 0))(
  ( (tuple2!15119 (_1!7570 (_ BitVec 64)) (_2!7570 B!1404)) )
))
(declare-datatypes ((List!21407 0))(
  ( (Nil!21404) (Cons!21403 (h!22601 tuple2!15118) (t!30408 List!21407)) )
))
(declare-fun l!412 () List!21407)

(declare-fun value!115 () B!1404)

(assert (=> b!1013315 (= res!680374 (and (is-Cons!21403 l!412) (= (_2!7570 (h!22601 l!412)) value!115)))))

(declare-fun b!1013317 () Bool)

(declare-fun ListPrimitiveSize!105 (List!21407) Int)

(assert (=> b!1013317 (= e!570033 (>= (ListPrimitiveSize!105 (t!30408 l!412)) (ListPrimitiveSize!105 l!412)))))

(declare-fun b!1013318 () Bool)

(declare-fun e!570034 () Bool)

(declare-fun tp_is_empty!23471 () Bool)

(declare-fun tp!70433 () Bool)

(assert (=> b!1013318 (= e!570034 (and tp_is_empty!23471 tp!70433))))

(declare-fun res!680376 () Bool)

(assert (=> start!87514 (=> (not res!680376) (not e!570033))))

(declare-fun isStrictlySorted!560 (List!21407) Bool)

(assert (=> start!87514 (= res!680376 (isStrictlySorted!560 l!412))))

(assert (=> start!87514 e!570033))

(assert (=> start!87514 e!570034))

(assert (=> start!87514 tp_is_empty!23471))

(declare-fun b!1013316 () Bool)

(declare-fun res!680375 () Bool)

(assert (=> b!1013316 (=> (not res!680375) (not e!570033))))

(declare-datatypes ((List!21408 0))(
  ( (Nil!21405) (Cons!21404 (h!22602 (_ BitVec 64)) (t!30409 List!21408)) )
))
(declare-fun isEmpty!815 (List!21408) Bool)

(declare-fun getKeysOf!36 (List!21407 B!1404) List!21408)

(assert (=> b!1013316 (= res!680375 (not (isEmpty!815 (getKeysOf!36 (t!30408 l!412) value!115))))))

(assert (= (and start!87514 res!680376) b!1013315))

(assert (= (and b!1013315 res!680374) b!1013316))

(assert (= (and b!1013316 res!680375) b!1013317))

(assert (= (and start!87514 (is-Cons!21403 l!412)) b!1013318))

(declare-fun m!936377 () Bool)

(assert (=> b!1013317 m!936377))

(declare-fun m!936379 () Bool)

(assert (=> b!1013317 m!936379))

(declare-fun m!936381 () Bool)

(assert (=> start!87514 m!936381))

(declare-fun m!936383 () Bool)

(assert (=> b!1013316 m!936383))

(assert (=> b!1013316 m!936383))

(declare-fun m!936385 () Bool)

(assert (=> b!1013316 m!936385))

(push 1)

(assert tp_is_empty!23471)

(assert (not start!87514))

(assert (not b!1013316))

(assert (not b!1013317))

(assert (not b!1013318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120429 () Bool)

(assert (=> d!120429 (= (isEmpty!815 (getKeysOf!36 (t!30408 l!412) value!115)) (is-Nil!21405 (getKeysOf!36 (t!30408 l!412) value!115)))))

(assert (=> b!1013316 d!120429))

(declare-fun b!1013380 () Bool)

(assert (=> b!1013380 true))

(assert (=> b!1013380 true))

(assert (=> b!1013380 true))

(declare-fun bs!28914 () Bool)

(declare-fun b!1013374 () Bool)

(assert (= bs!28914 (and b!1013374 b!1013380)))

(declare-fun lambda!492 () Int)

(declare-fun lt!447970 () tuple2!15118)

(declare-fun lambda!493 () Int)

(declare-fun lt!447965 () List!21407)

(declare-fun lt!447967 () tuple2!15118)

(declare-fun lt!447966 () List!21407)

(assert (=> bs!28914 (= (= (Cons!21403 lt!447967 lt!447966) (Cons!21403 lt!447970 lt!447965)) (= lambda!493 lambda!492))))

(assert (=> b!1013374 true))

(assert (=> b!1013374 true))

(assert (=> b!1013374 true))

(declare-fun bs!28915 () Bool)

(declare-fun d!120431 () Bool)

(assert (= bs!28915 (and d!120431 b!1013380)))

(declare-fun lambda!494 () Int)

(assert (=> bs!28915 (= (= (t!30408 l!412) (Cons!21403 lt!447970 lt!447965)) (= lambda!494 lambda!492))))

(declare-fun bs!28916 () Bool)

(assert (= bs!28916 (and d!120431 b!1013374)))

(assert (=> bs!28916 (= (= (t!30408 l!412) (Cons!21403 lt!447967 lt!447966)) (= lambda!494 lambda!493))))

(assert (=> d!120431 true))

(assert (=> d!120431 true))

(declare-fun b!1013373 () Bool)

(declare-datatypes ((Unit!33111 0))(
  ( (Unit!33112) )
))
(declare-fun e!570065 () Unit!33111)

(declare-fun Unit!33113 () Unit!33111)

(assert (=> b!1013373 (= e!570065 Unit!33113)))

(declare-fun c!102450 () Bool)

(declare-fun bm!42635 () Bool)

(declare-fun lt!447962 () List!21408)

(declare-fun lt!447960 () List!21408)

(declare-fun call!42638 () Unit!33111)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!22 (List!21407 List!21408 B!1404 tuple2!15118) Unit!33111)

(assert (=> bm!42635 (= call!42638 (lemmaForallGetValueByKeySameWithASmallerHead!22 (ite c!102450 lt!447965 lt!447966) (ite c!102450 lt!447962 lt!447960) value!115 (ite c!102450 lt!447970 lt!447967)))))

(declare-fun bm!42636 () Bool)

(declare-fun call!42641 () Bool)

(declare-fun call!42639 () List!21408)

(assert (=> bm!42636 (= call!42641 (isEmpty!815 call!42639))))

(declare-fun lt!447968 () List!21408)

(declare-fun forall!227 (List!21408 Int) Bool)

(assert (=> d!120431 (forall!227 lt!447968 lambda!494)))

(declare-fun e!570066 () List!21408)

(assert (=> d!120431 (= lt!447968 e!570066)))

(assert (=> d!120431 (= c!102450 (and (is-Cons!21403 (t!30408 l!412)) (= (_2!7570 (h!22601 (t!30408 l!412))) value!115)))))

(assert (=> d!120431 (isStrictlySorted!560 (t!30408 l!412))))

(assert (=> d!120431 (= (getKeysOf!36 (t!30408 l!412) value!115) lt!447968)))

(declare-fun bm!42637 () Bool)

(assert (=> bm!42637 (= call!42639 (getKeysOf!36 (t!30408 (t!30408 l!412)) value!115))))

(declare-fun e!570068 () Unit!33111)

(declare-fun lt!447963 () Unit!33111)

(assert (=> b!1013374 (= e!570068 lt!447963)))

(assert (=> b!1013374 (= lt!447966 (t!30408 (t!30408 l!412)))))

(assert (=> b!1013374 (= lt!447960 call!42639)))

(assert (=> b!1013374 (= lt!447967 (h!22601 (t!30408 l!412)))))

(assert (=> b!1013374 (= lt!447963 call!42638)))

(declare-fun call!42640 () Bool)

(assert (=> b!1013374 call!42640))

(declare-fun bm!42638 () Bool)

(assert (=> bm!42638 (= call!42640 (forall!227 (ite c!102450 lt!447962 lt!447960) (ite c!102450 lambda!492 lambda!493)))))

(declare-fun b!1013375 () Bool)

(declare-fun Unit!33117 () Unit!33111)

(assert (=> b!1013375 (= e!570068 Unit!33117)))

(declare-fun b!1013376 () Bool)

(declare-fun lt!447961 () Unit!33111)

(assert (=> b!1013376 (= lt!447961 e!570068)))

(declare-fun c!102448 () Bool)

(assert (=> b!1013376 (= c!102448 (not call!42641))))

(declare-fun lt!447964 () List!21408)

(assert (=> b!1013376 (= lt!447964 call!42639)))

(declare-fun e!570067 () List!21408)

(assert (=> b!1013376 (= e!570067 call!42639)))

(declare-fun b!1013377 () Bool)

(assert (=> b!1013377 (= e!570067 Nil!21405)))

(declare-fun b!1013378 () Bool)

(assert (=> b!1013378 (= e!570066 e!570067)))

(declare-fun c!102449 () Bool)

(assert (=> b!1013378 (= c!102449 (and (is-Cons!21403 (t!30408 l!412)) (not (= (_2!7570 (h!22601 (t!30408 l!412))) value!115))))))

(declare-fun b!1013379 () Bool)

(assert (=> b!1013379 (= e!570066 (Cons!21404 (_1!7570 (h!22601 (t!30408 l!412))) call!42639))))

(declare-fun c!102451 () Bool)

(assert (=> b!1013379 (= c!102451 (not call!42641))))

(declare-fun lt!447959 () Unit!33111)

(assert (=> b!1013379 (= lt!447959 e!570065)))

(assert (=> b!1013380 call!42640))

(declare-fun lt!447969 () Unit!33111)

(assert (=> b!1013380 (= lt!447969 call!42638)))

(assert (=> b!1013380 (= lt!447970 (h!22601 (t!30408 l!412)))))

(assert (=> b!1013380 (= lt!447962 call!42639)))

(assert (=> b!1013380 (= lt!447965 (t!30408 (t!30408 l!412)))))

(assert (=> b!1013380 (= e!570065 lt!447969)))

(assert (= (and d!120431 c!102450) b!1013379))

(assert (= (and d!120431 (not c!102450)) b!1013378))

(assert (= (and b!1013379 c!102451) b!1013380))

(assert (= (and b!1013379 (not c!102451)) b!1013373))

(assert (= (and b!1013378 c!102449) b!1013376))

(assert (= (and b!1013378 (not c!102449)) b!1013377))

(assert (= (and b!1013376 c!102448) b!1013374))

(assert (= (and b!1013376 (not c!102448)) b!1013375))

(assert (= (or b!1013380 b!1013374) bm!42635))

(assert (= (or b!1013380 b!1013374) bm!42638))

(assert (= (or b!1013379 b!1013380 b!1013374 b!1013376) bm!42637))

(assert (= (or b!1013379 b!1013376) bm!42636))

(declare-fun m!936391 () Bool)

(assert (=> bm!42636 m!936391))

(declare-fun m!936393 () Bool)

(assert (=> bm!42637 m!936393))

(declare-fun m!936395 () Bool)

(assert (=> bm!42638 m!936395))

(declare-fun m!936397 () Bool)

(assert (=> d!120431 m!936397))

(declare-fun m!936399 () Bool)

(assert (=> d!120431 m!936399))

(declare-fun m!936401 () Bool)

(assert (=> bm!42635 m!936401))

(assert (=> b!1013316 d!120431))

(declare-fun d!120445 () Bool)

(declare-fun res!680387 () Bool)

(declare-fun e!570077 () Bool)

(assert (=> d!120445 (=> res!680387 e!570077)))

(assert (=> d!120445 (= res!680387 (or (is-Nil!21404 l!412) (is-Nil!21404 (t!30408 l!412))))))

(assert (=> d!120445 (= (isStrictlySorted!560 l!412) e!570077)))

(declare-fun b!1013405 () Bool)

(declare-fun e!570078 () Bool)

(assert (=> b!1013405 (= e!570077 e!570078)))

(declare-fun res!680388 () Bool)

(assert (=> b!1013405 (=> (not res!680388) (not e!570078))))

(assert (=> b!1013405 (= res!680388 (bvslt (_1!7570 (h!22601 l!412)) (_1!7570 (h!22601 (t!30408 l!412)))))))

(declare-fun b!1013406 () Bool)

(assert (=> b!1013406 (= e!570078 (isStrictlySorted!560 (t!30408 l!412)))))

(assert (= (and d!120445 (not res!680387)) b!1013405))

(assert (= (and b!1013405 res!680388) b!1013406))

(assert (=> b!1013406 m!936399))

(assert (=> start!87514 d!120445))

(declare-fun d!120447 () Bool)

(declare-fun lt!447989 () Int)

(assert (=> d!120447 (>= lt!447989 0)))

(declare-fun e!570088 () Int)

(assert (=> d!120447 (= lt!447989 e!570088)))

(declare-fun c!102462 () Bool)

(assert (=> d!120447 (= c!102462 (is-Nil!21404 (t!30408 l!412)))))

(assert (=> d!120447 (= (ListPrimitiveSize!105 (t!30408 l!412)) lt!447989)))

(declare-fun b!1013424 () Bool)

(assert (=> b!1013424 (= e!570088 0)))

(declare-fun b!1013425 () Bool)

(assert (=> b!1013425 (= e!570088 (+ 1 (ListPrimitiveSize!105 (t!30408 (t!30408 l!412)))))))

(assert (= (and d!120447 c!102462) b!1013424))

(assert (= (and d!120447 (not c!102462)) b!1013425))

(declare-fun m!936413 () Bool)

(assert (=> b!1013425 m!936413))

(assert (=> b!1013317 d!120447))

(declare-fun d!120449 () Bool)

(declare-fun lt!447997 () Int)

(assert (=> d!120449 (>= lt!447997 0)))

(declare-fun e!570089 () Int)

(assert (=> d!120449 (= lt!447997 e!570089)))

(declare-fun c!102463 () Bool)

(assert (=> d!120449 (= c!102463 (is-Nil!21404 l!412))))

(assert (=> d!120449 (= (ListPrimitiveSize!105 l!412) lt!447997)))

(declare-fun b!1013426 () Bool)

(assert (=> b!1013426 (= e!570089 0)))

(declare-fun b!1013427 () Bool)

(assert (=> b!1013427 (= e!570089 (+ 1 (ListPrimitiveSize!105 (t!30408 l!412))))))

(assert (= (and d!120449 c!102463) b!1013426))

(assert (= (and d!120449 (not c!102463)) b!1013427))

(assert (=> b!1013427 m!936377))

(assert (=> b!1013317 d!120449))

(declare-fun b!1013432 () Bool)

(declare-fun e!570092 () Bool)

(declare-fun tp!70439 () Bool)

(assert (=> b!1013432 (= e!570092 (and tp_is_empty!23471 tp!70439))))

(assert (=> b!1013318 (= tp!70433 e!570092)))

(assert (= (and b!1013318 (is-Cons!21403 (t!30408 l!412))) b!1013432))

(push 1)

