; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87510 () Bool)

(assert start!87510)

(declare-fun b!1013294 () Bool)

(declare-fun e!570022 () Bool)

(declare-fun tp_is_empty!23467 () Bool)

(declare-fun tp!70427 () Bool)

(assert (=> b!1013294 (= e!570022 (and tp_is_empty!23467 tp!70427))))

(declare-fun b!1013292 () Bool)

(declare-fun res!680357 () Bool)

(declare-fun e!570021 () Bool)

(assert (=> b!1013292 (=> (not res!680357) (not e!570021))))

(declare-datatypes ((B!1400 0))(
  ( (B!1401 (val!11784 Int)) )
))
(declare-datatypes ((tuple2!15114 0))(
  ( (tuple2!15115 (_1!7568 (_ BitVec 64)) (_2!7568 B!1400)) )
))
(declare-datatypes ((List!21403 0))(
  ( (Nil!21400) (Cons!21399 (h!22597 tuple2!15114) (t!30404 List!21403)) )
))
(declare-fun l!412 () List!21403)

(declare-fun value!115 () B!1400)

(declare-datatypes ((List!21404 0))(
  ( (Nil!21401) (Cons!21400 (h!22598 (_ BitVec 64)) (t!30405 List!21404)) )
))
(declare-fun isEmpty!813 (List!21404) Bool)

(declare-fun getKeysOf!34 (List!21403 B!1400) List!21404)

(assert (=> b!1013292 (= res!680357 (not (isEmpty!813 (getKeysOf!34 (t!30404 l!412) value!115))))))

(declare-fun res!680358 () Bool)

(assert (=> start!87510 (=> (not res!680358) (not e!570021))))

(declare-fun isStrictlySorted!558 (List!21403) Bool)

(assert (=> start!87510 (= res!680358 (isStrictlySorted!558 l!412))))

(assert (=> start!87510 e!570021))

(assert (=> start!87510 e!570022))

(assert (=> start!87510 tp_is_empty!23467))

(declare-fun b!1013291 () Bool)

(declare-fun res!680356 () Bool)

(assert (=> b!1013291 (=> (not res!680356) (not e!570021))))

(assert (=> b!1013291 (= res!680356 (and (is-Cons!21399 l!412) (= (_2!7568 (h!22597 l!412)) value!115)))))

(declare-fun b!1013293 () Bool)

(declare-fun ListPrimitiveSize!103 (List!21403) Int)

(assert (=> b!1013293 (= e!570021 (>= (ListPrimitiveSize!103 (t!30404 l!412)) (ListPrimitiveSize!103 l!412)))))

(assert (= (and start!87510 res!680358) b!1013291))

(assert (= (and b!1013291 res!680356) b!1013292))

(assert (= (and b!1013292 res!680357) b!1013293))

(assert (= (and start!87510 (is-Cons!21399 l!412)) b!1013294))

(declare-fun m!936357 () Bool)

(assert (=> b!1013292 m!936357))

(assert (=> b!1013292 m!936357))

(declare-fun m!936359 () Bool)

(assert (=> b!1013292 m!936359))

(declare-fun m!936361 () Bool)

(assert (=> start!87510 m!936361))

(declare-fun m!936363 () Bool)

(assert (=> b!1013293 m!936363))

(declare-fun m!936365 () Bool)

(assert (=> b!1013293 m!936365))

(push 1)

(assert (not b!1013293))

(assert (not b!1013294))

(assert (not start!87510))

(assert (not b!1013292))

(assert tp_is_empty!23467)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120427 () Bool)

(declare-fun res!680381 () Bool)

(declare-fun e!570039 () Bool)

(assert (=> d!120427 (=> res!680381 e!570039)))

(assert (=> d!120427 (= res!680381 (or (is-Nil!21400 l!412) (is-Nil!21400 (t!30404 l!412))))))

(assert (=> d!120427 (= (isStrictlySorted!558 l!412) e!570039)))

(declare-fun b!1013323 () Bool)

(declare-fun e!570040 () Bool)

(assert (=> b!1013323 (= e!570039 e!570040)))

(declare-fun res!680382 () Bool)

(assert (=> b!1013323 (=> (not res!680382) (not e!570040))))

(assert (=> b!1013323 (= res!680382 (bvslt (_1!7568 (h!22597 l!412)) (_1!7568 (h!22597 (t!30404 l!412)))))))

(declare-fun b!1013324 () Bool)

(assert (=> b!1013324 (= e!570040 (isStrictlySorted!558 (t!30404 l!412)))))

(assert (= (and d!120427 (not res!680381)) b!1013323))

(assert (= (and b!1013323 res!680382) b!1013324))

(declare-fun m!936387 () Bool)

(assert (=> b!1013324 m!936387))

(assert (=> start!87510 d!120427))

(declare-fun d!120433 () Bool)

(declare-fun lt!447897 () Int)

(assert (=> d!120433 (>= lt!447897 0)))

(declare-fun e!570043 () Int)

(assert (=> d!120433 (= lt!447897 e!570043)))

(declare-fun c!102426 () Bool)

(assert (=> d!120433 (= c!102426 (is-Nil!21400 (t!30404 l!412)))))

(assert (=> d!120433 (= (ListPrimitiveSize!103 (t!30404 l!412)) lt!447897)))

(declare-fun b!1013329 () Bool)

(assert (=> b!1013329 (= e!570043 0)))

(declare-fun b!1013330 () Bool)

(assert (=> b!1013330 (= e!570043 (+ 1 (ListPrimitiveSize!103 (t!30404 (t!30404 l!412)))))))

(assert (= (and d!120433 c!102426) b!1013329))

(assert (= (and d!120433 (not c!102426)) b!1013330))

(declare-fun m!936389 () Bool)

(assert (=> b!1013330 m!936389))

(assert (=> b!1013293 d!120433))

(declare-fun d!120437 () Bool)

(declare-fun lt!447898 () Int)

(assert (=> d!120437 (>= lt!447898 0)))

(declare-fun e!570044 () Int)

(assert (=> d!120437 (= lt!447898 e!570044)))

(declare-fun c!102427 () Bool)

(assert (=> d!120437 (= c!102427 (is-Nil!21400 l!412))))

(assert (=> d!120437 (= (ListPrimitiveSize!103 l!412) lt!447898)))

(declare-fun b!1013331 () Bool)

(assert (=> b!1013331 (= e!570044 0)))

(declare-fun b!1013332 () Bool)

(assert (=> b!1013332 (= e!570044 (+ 1 (ListPrimitiveSize!103 (t!30404 l!412))))))

(assert (= (and d!120437 c!102427) b!1013331))

(assert (= (and d!120437 (not c!102427)) b!1013332))

(assert (=> b!1013332 m!936363))

(assert (=> b!1013293 d!120437))

(declare-fun d!120439 () Bool)

(assert (=> d!120439 (= (isEmpty!813 (getKeysOf!34 (t!30404 l!412) value!115)) (is-Nil!21401 (getKeysOf!34 (t!30404 l!412) value!115)))))

(assert (=> b!1013292 d!120439))

(declare-fun b!1013388 () Bool)

(assert (=> b!1013388 true))

(assert (=> b!1013388 true))

(assert (=> b!1013388 true))

(declare-fun bs!28917 () Bool)

(declare-fun b!1013389 () Bool)

(assert (= bs!28917 (and b!1013389 b!1013388)))

(declare-fun lambda!495 () Int)

(declare-fun lt!447981 () List!21403)

(declare-fun lt!447974 () tuple2!15114)

(declare-fun lambda!496 () Int)

(declare-fun lt!447977 () List!21403)

(declare-fun lt!447980 () tuple2!15114)

(assert (=> bs!28917 (= (= (Cons!21399 lt!447974 lt!447981) (Cons!21399 lt!447980 lt!447977)) (= lambda!496 lambda!495))))

(assert (=> b!1013389 true))

(assert (=> b!1013389 true))

(assert (=> b!1013389 true))

(declare-fun bs!28918 () Bool)

(declare-fun d!120443 () Bool)

(assert (= bs!28918 (and d!120443 b!1013388)))

(declare-fun lambda!497 () Int)

(assert (=> bs!28918 (= (= (t!30404 l!412) (Cons!21399 lt!447980 lt!447977)) (= lambda!497 lambda!495))))

(declare-fun bs!28919 () Bool)

(assert (= bs!28919 (and d!120443 b!1013389)))

(assert (=> bs!28919 (= (= (t!30404 l!412) (Cons!21399 lt!447974 lt!447981)) (= lambda!497 lambda!496))))

(assert (=> d!120443 true))

(assert (=> d!120443 true))

(declare-fun b!1013387 () Bool)

(declare-datatypes ((Unit!33114 0))(
  ( (Unit!33115) )
))
(declare-fun e!570071 () Unit!33114)

(declare-fun Unit!33116 () Unit!33114)

(assert (=> b!1013387 (= e!570071 Unit!33116)))

(declare-fun bm!42639 () Bool)

(declare-fun call!42643 () Bool)

(declare-fun call!42642 () List!21404)

(assert (=> bm!42639 (= call!42643 (isEmpty!813 call!42642))))

(declare-fun call!42644 () Bool)

(assert (=> b!1013388 call!42644))

(declare-fun lt!447972 () Unit!33114)

(declare-fun call!42645 () Unit!33114)

(assert (=> b!1013388 (= lt!447972 call!42645)))

(assert (=> b!1013388 (= lt!447980 (h!22597 (t!30404 l!412)))))

(declare-fun lt!447975 () List!21404)

(assert (=> b!1013388 (= lt!447975 call!42642)))

(assert (=> b!1013388 (= lt!447977 (t!30404 (t!30404 l!412)))))

(declare-fun e!570072 () Unit!33114)

(assert (=> b!1013388 (= e!570072 lt!447972)))

(declare-fun lt!447976 () Unit!33114)

(assert (=> b!1013389 (= e!570071 lt!447976)))

(assert (=> b!1013389 (= lt!447981 (t!30404 (t!30404 l!412)))))

(declare-fun lt!447982 () List!21404)

(assert (=> b!1013389 (= lt!447982 call!42642)))

(assert (=> b!1013389 (= lt!447974 (h!22597 (t!30404 l!412)))))

(assert (=> b!1013389 (= lt!447976 call!42645)))

(assert (=> b!1013389 call!42644))

(declare-fun c!102452 () Bool)

(declare-fun bm!42640 () Bool)

(declare-fun forall!228 (List!21404 Int) Bool)

(assert (=> bm!42640 (= call!42644 (forall!228 (ite c!102452 lt!447975 lt!447982) (ite c!102452 lambda!495 lambda!496)))))

(declare-fun b!1013391 () Bool)

(declare-fun Unit!33118 () Unit!33114)

(assert (=> b!1013391 (= e!570072 Unit!33118)))

(declare-fun bm!42641 () Bool)

(assert (=> bm!42641 (= call!42642 (getKeysOf!34 (t!30404 (t!30404 l!412)) value!115))))

(declare-fun b!1013392 () Bool)

(declare-fun e!570069 () List!21404)

(assert (=> b!1013392 (= e!570069 Nil!21401)))

(declare-fun b!1013393 () Bool)

(declare-fun e!570070 () List!21404)

(assert (=> b!1013393 (= e!570070 e!570069)))

(declare-fun c!102454 () Bool)

(assert (=> b!1013393 (= c!102454 (and (is-Cons!21399 (t!30404 l!412)) (not (= (_2!7568 (h!22597 (t!30404 l!412))) value!115))))))

(declare-fun b!1013390 () Bool)

(declare-fun lt!447973 () Unit!33114)

(assert (=> b!1013390 (= lt!447973 e!570071)))

(declare-fun c!102453 () Bool)

(assert (=> b!1013390 (= c!102453 (not call!42643))))

(declare-fun lt!447971 () List!21404)

(assert (=> b!1013390 (= lt!447971 call!42642)))

(assert (=> b!1013390 (= e!570069 call!42642)))

(declare-fun lt!447979 () List!21404)

(assert (=> d!120443 (forall!228 lt!447979 lambda!497)))

(assert (=> d!120443 (= lt!447979 e!570070)))

(assert (=> d!120443 (= c!102452 (and (is-Cons!21399 (t!30404 l!412)) (= (_2!7568 (h!22597 (t!30404 l!412))) value!115)))))

(assert (=> d!120443 (isStrictlySorted!558 (t!30404 l!412))))

(assert (=> d!120443 (= (getKeysOf!34 (t!30404 l!412) value!115) lt!447979)))

(declare-fun bm!42642 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!23 (List!21403 List!21404 B!1400 tuple2!15114) Unit!33114)

(assert (=> bm!42642 (= call!42645 (lemmaForallGetValueByKeySameWithASmallerHead!23 (ite c!102452 lt!447977 lt!447981) (ite c!102452 lt!447975 lt!447982) value!115 (ite c!102452 lt!447980 lt!447974)))))

(declare-fun b!1013394 () Bool)

(assert (=> b!1013394 (= e!570070 (Cons!21400 (_1!7568 (h!22597 (t!30404 l!412))) call!42642))))

(declare-fun c!102455 () Bool)

(assert (=> b!1013394 (= c!102455 (not call!42643))))

(declare-fun lt!447978 () Unit!33114)

(assert (=> b!1013394 (= lt!447978 e!570072)))

(assert (= (and d!120443 c!102452) b!1013394))

(assert (= (and d!120443 (not c!102452)) b!1013393))

(assert (= (and b!1013394 c!102455) b!1013388))

(assert (= (and b!1013394 (not c!102455)) b!1013391))

(assert (= (and b!1013393 c!102454) b!1013390))

(assert (= (and b!1013393 (not c!102454)) b!1013392))

(assert (= (and b!1013390 c!102453) b!1013389))

(assert (= (and b!1013390 (not c!102453)) b!1013387))

(assert (= (or b!1013388 b!1013389) bm!42642))

(assert (= (or b!1013388 b!1013389) bm!42640))

(assert (= (or b!1013394 b!1013388 b!1013389 b!1013390) bm!42641))

(assert (= (or b!1013394 b!1013390) bm!42639))

(declare-fun m!936403 () Bool)

(assert (=> bm!42639 m!936403))

(declare-fun m!936405 () Bool)

(assert (=> bm!42640 m!936405))

(declare-fun m!936407 () Bool)

(assert (=> bm!42642 m!936407))

(declare-fun m!936409 () Bool)

(assert (=> d!120443 m!936409))

(assert (=> d!120443 m!936387))

(declare-fun m!936411 () Bool)

(assert (=> bm!42641 m!936411))

(assert (=> b!1013292 d!120443))

(declare-fun b!1013419 () Bool)

(declare-fun e!570085 () Bool)

(declare-fun tp!70436 () Bool)

(assert (=> b!1013419 (= e!570085 (and tp_is_empty!23467 tp!70436))))

(assert (=> b!1013294 (= tp!70427 e!570085)))

(assert (= (and b!1013294 (is-Cons!21399 (t!30404 l!412))) b!1013419))

(push 1)

(assert (not bm!42642))

(assert (not bm!42640))

(assert (not bm!42639))

(assert (not b!1013419))

(assert (not b!1013330))

(assert tp_is_empty!23467)

(assert (not d!120443))

(assert (not bm!42641))

(assert (not b!1013324))

(assert (not b!1013332))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

