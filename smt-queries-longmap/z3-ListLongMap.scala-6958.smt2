; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88078 () Bool)

(assert start!88078)

(declare-fun b!1016490 () Bool)

(assert (=> b!1016490 true))

(assert (=> b!1016490 true))

(declare-fun bs!29384 () Bool)

(declare-fun b!1016493 () Bool)

(assert (= bs!29384 (and b!1016493 b!1016490)))

(declare-fun lambda!833 () Int)

(declare-fun lambda!832 () Int)

(assert (=> bs!29384 (= lambda!833 lambda!832)))

(assert (=> b!1016493 true))

(assert (=> b!1016493 true))

(declare-datatypes ((Unit!33213 0))(
  ( (Unit!33214) )
))
(declare-fun e!571927 () Unit!33213)

(declare-fun lt!449526 () Unit!33213)

(assert (=> b!1016490 (= e!571927 lt!449526)))

(declare-datatypes ((List!21443 0))(
  ( (Nil!21440) (Cons!21439 (h!22646 (_ BitVec 64)) (t!30436 List!21443)) )
))
(declare-fun lt!449527 () List!21443)

(declare-datatypes ((B!1454 0))(
  ( (B!1455 (val!11811 Int)) )
))
(declare-fun value!115 () B!1454)

(declare-datatypes ((tuple2!15172 0))(
  ( (tuple2!15173 (_1!7597 (_ BitVec 64)) (_2!7597 B!1454)) )
))
(declare-datatypes ((List!21444 0))(
  ( (Nil!21441) (Cons!21440 (h!22647 tuple2!15172) (t!30437 List!21444)) )
))
(declare-fun l!412 () List!21444)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!47 (List!21444 List!21443 B!1454 tuple2!15172) Unit!33213)

(assert (=> b!1016490 (= lt!449526 (lemmaForallGetValueByKeySameWithASmallerHead!47 (t!30437 l!412) lt!449527 value!115 (h!22647 l!412)))))

(declare-fun forall!252 (List!21443 Int) Bool)

(assert (=> b!1016490 (forall!252 lt!449527 lambda!832)))

(declare-fun b!1016491 () Bool)

(declare-fun Unit!33215 () Unit!33213)

(assert (=> b!1016491 (= e!571927 Unit!33215)))

(declare-fun res!681526 () Bool)

(declare-fun e!571928 () Bool)

(assert (=> start!88078 (=> (not res!681526) (not e!571928))))

(declare-fun isStrictlySorted!573 (List!21444) Bool)

(assert (=> start!88078 (= res!681526 (isStrictlySorted!573 l!412))))

(assert (=> start!88078 e!571928))

(declare-fun e!571929 () Bool)

(assert (=> start!88078 e!571929))

(declare-fun tp_is_empty!23521 () Bool)

(assert (=> start!88078 tp_is_empty!23521))

(declare-fun b!1016492 () Bool)

(declare-fun res!681527 () Bool)

(assert (=> b!1016492 (=> (not res!681527) (not e!571928))))

(get-info :version)

(assert (=> b!1016492 (= res!681527 (and (not (= (_2!7597 (h!22647 l!412)) value!115)) ((_ is Cons!21440) l!412)))))

(assert (=> b!1016493 (= e!571928 (not (forall!252 lt!449527 lambda!833)))))

(declare-fun lt!449528 () Unit!33213)

(assert (=> b!1016493 (= lt!449528 e!571927)))

(declare-fun c!103264 () Bool)

(declare-fun isEmpty!854 (List!21443) Bool)

(assert (=> b!1016493 (= c!103264 (not (isEmpty!854 lt!449527)))))

(declare-fun getKeysOf!58 (List!21444 B!1454) List!21443)

(assert (=> b!1016493 (= lt!449527 (getKeysOf!58 (t!30437 l!412) value!115))))

(declare-fun b!1016494 () Bool)

(declare-fun tp!70593 () Bool)

(assert (=> b!1016494 (= e!571929 (and tp_is_empty!23521 tp!70593))))

(assert (= (and start!88078 res!681526) b!1016492))

(assert (= (and b!1016492 res!681527) b!1016493))

(assert (= (and b!1016493 c!103264) b!1016490))

(assert (= (and b!1016493 (not c!103264)) b!1016491))

(assert (= (and start!88078 ((_ is Cons!21440) l!412)) b!1016494))

(declare-fun m!939053 () Bool)

(assert (=> b!1016490 m!939053))

(declare-fun m!939055 () Bool)

(assert (=> b!1016490 m!939055))

(declare-fun m!939057 () Bool)

(assert (=> start!88078 m!939057))

(declare-fun m!939059 () Bool)

(assert (=> b!1016493 m!939059))

(declare-fun m!939061 () Bool)

(assert (=> b!1016493 m!939061))

(declare-fun m!939063 () Bool)

(assert (=> b!1016493 m!939063))

(check-sat (not b!1016490) (not b!1016493) tp_is_empty!23521 (not b!1016494) (not start!88078))
(check-sat)
(get-model)

(declare-fun bs!29387 () Bool)

(declare-fun b!1016556 () Bool)

(assert (= bs!29387 (and b!1016556 b!1016490)))

(declare-fun lambda!850 () Int)

(assert (=> bs!29387 (= (= (t!30437 l!412) l!412) (= lambda!850 lambda!832))))

(declare-fun bs!29388 () Bool)

(assert (= bs!29388 (and b!1016556 b!1016493)))

(assert (=> bs!29388 (= (= (t!30437 l!412) l!412) (= lambda!850 lambda!833))))

(assert (=> b!1016556 true))

(assert (=> b!1016556 true))

(declare-fun bs!29389 () Bool)

(declare-fun d!121383 () Bool)

(assert (= bs!29389 (and d!121383 b!1016490)))

(declare-fun lambda!851 () Int)

(assert (=> bs!29389 (= (= (Cons!21440 (h!22647 l!412) (t!30437 l!412)) l!412) (= lambda!851 lambda!832))))

(declare-fun bs!29390 () Bool)

(assert (= bs!29390 (and d!121383 b!1016493)))

(assert (=> bs!29390 (= (= (Cons!21440 (h!22647 l!412) (t!30437 l!412)) l!412) (= lambda!851 lambda!833))))

(declare-fun bs!29391 () Bool)

(assert (= bs!29391 (and d!121383 b!1016556)))

(assert (=> bs!29391 (= (= (Cons!21440 (h!22647 l!412) (t!30437 l!412)) (t!30437 l!412)) (= lambda!851 lambda!850))))

(assert (=> d!121383 true))

(assert (=> d!121383 true))

(assert (=> d!121383 true))

(assert (=> d!121383 (forall!252 lt!449527 lambda!851)))

(declare-fun lt!449549 () Unit!33213)

(declare-fun choose!1641 (List!21444 List!21443 B!1454 tuple2!15172) Unit!33213)

(assert (=> d!121383 (= lt!449549 (choose!1641 (t!30437 l!412) lt!449527 value!115 (h!22647 l!412)))))

(declare-fun e!571962 () Bool)

(assert (=> d!121383 e!571962))

(declare-fun res!681559 () Bool)

(assert (=> d!121383 (=> (not res!681559) (not e!571962))))

(assert (=> d!121383 (= res!681559 (isStrictlySorted!573 (t!30437 l!412)))))

(assert (=> d!121383 (= (lemmaForallGetValueByKeySameWithASmallerHead!47 (t!30437 l!412) lt!449527 value!115 (h!22647 l!412)) lt!449549)))

(declare-fun b!1016555 () Bool)

(declare-fun res!681558 () Bool)

(assert (=> b!1016555 (=> (not res!681558) (not e!571962))))

(declare-fun isEmpty!857 (List!21444) Bool)

(assert (=> b!1016555 (= res!681558 (not (isEmpty!857 (t!30437 l!412))))))

(declare-fun res!681560 () Bool)

(assert (=> b!1016556 (=> (not res!681560) (not e!571962))))

(assert (=> b!1016556 (= res!681560 (forall!252 lt!449527 lambda!850))))

(declare-fun b!1016557 () Bool)

(declare-fun head!942 (List!21444) tuple2!15172)

(assert (=> b!1016557 (= e!571962 (bvslt (_1!7597 (h!22647 l!412)) (_1!7597 (head!942 (t!30437 l!412)))))))

(assert (= (and d!121383 res!681559) b!1016555))

(assert (= (and b!1016555 res!681558) b!1016556))

(assert (= (and b!1016556 res!681560) b!1016557))

(declare-fun m!939097 () Bool)

(assert (=> d!121383 m!939097))

(declare-fun m!939099 () Bool)

(assert (=> d!121383 m!939099))

(declare-fun m!939101 () Bool)

(assert (=> d!121383 m!939101))

(declare-fun m!939103 () Bool)

(assert (=> b!1016555 m!939103))

(declare-fun m!939105 () Bool)

(assert (=> b!1016556 m!939105))

(declare-fun m!939107 () Bool)

(assert (=> b!1016557 m!939107))

(assert (=> b!1016490 d!121383))

(declare-fun d!121397 () Bool)

(declare-fun res!681565 () Bool)

(declare-fun e!571967 () Bool)

(assert (=> d!121397 (=> res!681565 e!571967)))

(assert (=> d!121397 (= res!681565 ((_ is Nil!21440) lt!449527))))

(assert (=> d!121397 (= (forall!252 lt!449527 lambda!832) e!571967)))

(declare-fun b!1016564 () Bool)

(declare-fun e!571968 () Bool)

(assert (=> b!1016564 (= e!571967 e!571968)))

(declare-fun res!681566 () Bool)

(assert (=> b!1016564 (=> (not res!681566) (not e!571968))))

(declare-fun dynLambda!1923 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016564 (= res!681566 (dynLambda!1923 lambda!832 (h!22646 lt!449527)))))

(declare-fun b!1016565 () Bool)

(assert (=> b!1016565 (= e!571968 (forall!252 (t!30436 lt!449527) lambda!832))))

(assert (= (and d!121397 (not res!681565)) b!1016564))

(assert (= (and b!1016564 res!681566) b!1016565))

(declare-fun b_lambda!15409 () Bool)

(assert (=> (not b_lambda!15409) (not b!1016564)))

(declare-fun m!939109 () Bool)

(assert (=> b!1016564 m!939109))

(declare-fun m!939111 () Bool)

(assert (=> b!1016565 m!939111))

(assert (=> b!1016490 d!121397))

(declare-fun d!121399 () Bool)

(declare-fun res!681571 () Bool)

(declare-fun e!571973 () Bool)

(assert (=> d!121399 (=> res!681571 e!571973)))

(assert (=> d!121399 (= res!681571 (or ((_ is Nil!21441) l!412) ((_ is Nil!21441) (t!30437 l!412))))))

(assert (=> d!121399 (= (isStrictlySorted!573 l!412) e!571973)))

(declare-fun b!1016570 () Bool)

(declare-fun e!571974 () Bool)

(assert (=> b!1016570 (= e!571973 e!571974)))

(declare-fun res!681572 () Bool)

(assert (=> b!1016570 (=> (not res!681572) (not e!571974))))

(assert (=> b!1016570 (= res!681572 (bvslt (_1!7597 (h!22647 l!412)) (_1!7597 (h!22647 (t!30437 l!412)))))))

(declare-fun b!1016571 () Bool)

(assert (=> b!1016571 (= e!571974 (isStrictlySorted!573 (t!30437 l!412)))))

(assert (= (and d!121399 (not res!681571)) b!1016570))

(assert (= (and b!1016570 res!681572) b!1016571))

(assert (=> b!1016571 m!939101))

(assert (=> start!88078 d!121399))

(declare-fun d!121401 () Bool)

(declare-fun res!681573 () Bool)

(declare-fun e!571975 () Bool)

(assert (=> d!121401 (=> res!681573 e!571975)))

(assert (=> d!121401 (= res!681573 ((_ is Nil!21440) lt!449527))))

(assert (=> d!121401 (= (forall!252 lt!449527 lambda!833) e!571975)))

(declare-fun b!1016572 () Bool)

(declare-fun e!571976 () Bool)

(assert (=> b!1016572 (= e!571975 e!571976)))

(declare-fun res!681574 () Bool)

(assert (=> b!1016572 (=> (not res!681574) (not e!571976))))

(assert (=> b!1016572 (= res!681574 (dynLambda!1923 lambda!833 (h!22646 lt!449527)))))

(declare-fun b!1016573 () Bool)

(assert (=> b!1016573 (= e!571976 (forall!252 (t!30436 lt!449527) lambda!833))))

(assert (= (and d!121401 (not res!681573)) b!1016572))

(assert (= (and b!1016572 res!681574) b!1016573))

(declare-fun b_lambda!15411 () Bool)

(assert (=> (not b_lambda!15411) (not b!1016572)))

(declare-fun m!939113 () Bool)

(assert (=> b!1016572 m!939113))

(declare-fun m!939115 () Bool)

(assert (=> b!1016573 m!939115))

(assert (=> b!1016493 d!121401))

(declare-fun d!121403 () Bool)

(assert (=> d!121403 (= (isEmpty!854 lt!449527) ((_ is Nil!21440) lt!449527))))

(assert (=> b!1016493 d!121403))

(declare-fun bs!29410 () Bool)

(declare-fun b!1016659 () Bool)

(assert (= bs!29410 (and b!1016659 b!1016490)))

(declare-fun lt!449657 () tuple2!15172)

(declare-fun lambda!884 () Int)

(declare-fun lt!449660 () List!21444)

(assert (=> bs!29410 (= (= (Cons!21440 lt!449657 lt!449660) l!412) (= lambda!884 lambda!832))))

(declare-fun bs!29411 () Bool)

(assert (= bs!29411 (and b!1016659 b!1016493)))

(assert (=> bs!29411 (= (= (Cons!21440 lt!449657 lt!449660) l!412) (= lambda!884 lambda!833))))

(declare-fun bs!29412 () Bool)

(assert (= bs!29412 (and b!1016659 b!1016556)))

(assert (=> bs!29412 (= (= (Cons!21440 lt!449657 lt!449660) (t!30437 l!412)) (= lambda!884 lambda!850))))

(declare-fun bs!29413 () Bool)

(assert (= bs!29413 (and b!1016659 d!121383)))

(assert (=> bs!29413 (= (= (Cons!21440 lt!449657 lt!449660) (Cons!21440 (h!22647 l!412) (t!30437 l!412))) (= lambda!884 lambda!851))))

(assert (=> b!1016659 true))

(assert (=> b!1016659 true))

(assert (=> b!1016659 true))

(declare-fun bs!29414 () Bool)

(declare-fun b!1016655 () Bool)

(assert (= bs!29414 (and b!1016655 d!121383)))

(declare-fun lt!449652 () List!21444)

(declare-fun lt!449656 () tuple2!15172)

(declare-fun lambda!885 () Int)

(assert (=> bs!29414 (= (= (Cons!21440 lt!449656 lt!449652) (Cons!21440 (h!22647 l!412) (t!30437 l!412))) (= lambda!885 lambda!851))))

(declare-fun bs!29415 () Bool)

(assert (= bs!29415 (and b!1016655 b!1016659)))

(assert (=> bs!29415 (= (= (Cons!21440 lt!449656 lt!449652) (Cons!21440 lt!449657 lt!449660)) (= lambda!885 lambda!884))))

(declare-fun bs!29416 () Bool)

(assert (= bs!29416 (and b!1016655 b!1016556)))

(assert (=> bs!29416 (= (= (Cons!21440 lt!449656 lt!449652) (t!30437 l!412)) (= lambda!885 lambda!850))))

(declare-fun bs!29417 () Bool)

(assert (= bs!29417 (and b!1016655 b!1016493)))

(assert (=> bs!29417 (= (= (Cons!21440 lt!449656 lt!449652) l!412) (= lambda!885 lambda!833))))

(declare-fun bs!29420 () Bool)

(assert (= bs!29420 (and b!1016655 b!1016490)))

(assert (=> bs!29420 (= (= (Cons!21440 lt!449656 lt!449652) l!412) (= lambda!885 lambda!832))))

(assert (=> b!1016655 true))

(assert (=> b!1016655 true))

(assert (=> b!1016655 true))

(declare-fun bs!29429 () Bool)

(declare-fun d!121405 () Bool)

(assert (= bs!29429 (and d!121405 d!121383)))

(declare-fun lambda!888 () Int)

(assert (=> bs!29429 (= (= (t!30437 l!412) (Cons!21440 (h!22647 l!412) (t!30437 l!412))) (= lambda!888 lambda!851))))

(declare-fun bs!29430 () Bool)

(assert (= bs!29430 (and d!121405 b!1016659)))

(assert (=> bs!29430 (= (= (t!30437 l!412) (Cons!21440 lt!449657 lt!449660)) (= lambda!888 lambda!884))))

(declare-fun bs!29431 () Bool)

(assert (= bs!29431 (and d!121405 b!1016556)))

(assert (=> bs!29431 (= lambda!888 lambda!850)))

(declare-fun bs!29432 () Bool)

(assert (= bs!29432 (and d!121405 b!1016493)))

(assert (=> bs!29432 (= (= (t!30437 l!412) l!412) (= lambda!888 lambda!833))))

(declare-fun bs!29433 () Bool)

(assert (= bs!29433 (and d!121405 b!1016655)))

(assert (=> bs!29433 (= (= (t!30437 l!412) (Cons!21440 lt!449656 lt!449652)) (= lambda!888 lambda!885))))

(declare-fun bs!29436 () Bool)

(assert (= bs!29436 (and d!121405 b!1016490)))

(assert (=> bs!29436 (= (= (t!30437 l!412) l!412) (= lambda!888 lambda!832))))

(assert (=> d!121405 true))

(assert (=> d!121405 true))

(declare-fun b!1016654 () Bool)

(declare-fun e!572013 () List!21443)

(declare-fun e!572014 () List!21443)

(assert (=> b!1016654 (= e!572013 e!572014)))

(declare-fun c!103305 () Bool)

(assert (=> b!1016654 (= c!103305 (and ((_ is Cons!21440) (t!30437 l!412)) (not (= (_2!7597 (h!22647 (t!30437 l!412))) value!115))))))

(declare-fun e!572016 () Unit!33213)

(declare-fun lt!449658 () Unit!33213)

(assert (=> b!1016655 (= e!572016 lt!449658)))

(assert (=> b!1016655 (= lt!449652 (t!30437 (t!30437 l!412)))))

(declare-fun lt!449650 () List!21443)

(declare-fun call!43024 () List!21443)

(assert (=> b!1016655 (= lt!449650 call!43024)))

(assert (=> b!1016655 (= lt!449656 (h!22647 (t!30437 l!412)))))

(declare-fun call!43023 () Unit!33213)

(assert (=> b!1016655 (= lt!449658 call!43023)))

(declare-fun call!43021 () Bool)

(assert (=> b!1016655 call!43021))

(declare-fun b!1016656 () Bool)

(assert (=> b!1016656 (= e!572013 (Cons!21439 (_1!7597 (h!22647 (t!30437 l!412))) call!43024))))

(declare-fun c!103306 () Bool)

(declare-fun call!43022 () Bool)

(assert (=> b!1016656 (= c!103306 (not call!43022))))

(declare-fun lt!449659 () Unit!33213)

(declare-fun e!572015 () Unit!33213)

(assert (=> b!1016656 (= lt!449659 e!572015)))

(declare-fun lt!449651 () List!21443)

(assert (=> d!121405 (forall!252 lt!449651 lambda!888)))

(assert (=> d!121405 (= lt!449651 e!572013)))

(declare-fun c!103304 () Bool)

(assert (=> d!121405 (= c!103304 (and ((_ is Cons!21440) (t!30437 l!412)) (= (_2!7597 (h!22647 (t!30437 l!412))) value!115)))))

(assert (=> d!121405 (isStrictlySorted!573 (t!30437 l!412))))

(assert (=> d!121405 (= (getKeysOf!58 (t!30437 l!412) value!115) lt!449651)))

(declare-fun b!1016657 () Bool)

(declare-fun Unit!33226 () Unit!33213)

(assert (=> b!1016657 (= e!572016 Unit!33226)))

(declare-fun b!1016658 () Bool)

(declare-fun Unit!33227 () Unit!33213)

(assert (=> b!1016658 (= e!572015 Unit!33227)))

(declare-fun bm!43018 () Bool)

(assert (=> bm!43018 (= call!43022 (isEmpty!854 call!43024))))

(declare-fun bm!43019 () Bool)

(assert (=> bm!43019 (= call!43024 (getKeysOf!58 (t!30437 (t!30437 l!412)) value!115))))

(assert (=> b!1016659 call!43021))

(declare-fun lt!449653 () Unit!33213)

(assert (=> b!1016659 (= lt!449653 call!43023)))

(assert (=> b!1016659 (= lt!449657 (h!22647 (t!30437 l!412)))))

(declare-fun lt!449655 () List!21443)

(assert (=> b!1016659 (= lt!449655 call!43024)))

(assert (=> b!1016659 (= lt!449660 (t!30437 (t!30437 l!412)))))

(assert (=> b!1016659 (= e!572015 lt!449653)))

(declare-fun bm!43020 () Bool)

(assert (=> bm!43020 (= call!43023 (lemmaForallGetValueByKeySameWithASmallerHead!47 (ite c!103304 lt!449660 lt!449652) (ite c!103304 lt!449655 lt!449650) value!115 (ite c!103304 lt!449657 lt!449656)))))

(declare-fun b!1016660 () Bool)

(assert (=> b!1016660 (= e!572014 Nil!21440)))

(declare-fun bm!43021 () Bool)

(assert (=> bm!43021 (= call!43021 (forall!252 (ite c!103304 lt!449655 lt!449650) (ite c!103304 lambda!884 lambda!885)))))

(declare-fun b!1016661 () Bool)

(declare-fun lt!449661 () Unit!33213)

(assert (=> b!1016661 (= lt!449661 e!572016)))

(declare-fun c!103303 () Bool)

(assert (=> b!1016661 (= c!103303 (not call!43022))))

(declare-fun lt!449654 () List!21443)

(assert (=> b!1016661 (= lt!449654 call!43024)))

(assert (=> b!1016661 (= e!572014 call!43024)))

(assert (= (and d!121405 c!103304) b!1016656))

(assert (= (and d!121405 (not c!103304)) b!1016654))

(assert (= (and b!1016656 c!103306) b!1016659))

(assert (= (and b!1016656 (not c!103306)) b!1016658))

(assert (= (and b!1016654 c!103305) b!1016661))

(assert (= (and b!1016654 (not c!103305)) b!1016660))

(assert (= (and b!1016661 c!103303) b!1016655))

(assert (= (and b!1016661 (not c!103303)) b!1016657))

(assert (= (or b!1016659 b!1016655) bm!43020))

(assert (= (or b!1016659 b!1016655) bm!43021))

(assert (= (or b!1016656 b!1016659 b!1016655 b!1016661) bm!43019))

(assert (= (or b!1016656 b!1016661) bm!43018))

(declare-fun m!939141 () Bool)

(assert (=> bm!43021 m!939141))

(declare-fun m!939143 () Bool)

(assert (=> bm!43018 m!939143))

(declare-fun m!939145 () Bool)

(assert (=> bm!43019 m!939145))

(declare-fun m!939147 () Bool)

(assert (=> bm!43020 m!939147))

(declare-fun m!939149 () Bool)

(assert (=> d!121405 m!939149))

(assert (=> d!121405 m!939101))

(assert (=> b!1016493 d!121405))

(declare-fun b!1016676 () Bool)

(declare-fun e!572025 () Bool)

(declare-fun tp!70602 () Bool)

(assert (=> b!1016676 (= e!572025 (and tp_is_empty!23521 tp!70602))))

(assert (=> b!1016494 (= tp!70593 e!572025)))

(assert (= (and b!1016494 ((_ is Cons!21440) (t!30437 l!412))) b!1016676))

(declare-fun b_lambda!15417 () Bool)

(assert (= b_lambda!15411 (or b!1016493 b_lambda!15417)))

(declare-fun bs!29447 () Bool)

(declare-fun d!121419 () Bool)

(assert (= bs!29447 (and d!121419 b!1016493)))

(declare-datatypes ((Option!580 0))(
  ( (Some!579 (v!14430 B!1454)) (None!578) )
))
(declare-fun getValueByKey!529 (List!21444 (_ BitVec 64)) Option!580)

(assert (=> bs!29447 (= (dynLambda!1923 lambda!833 (h!22646 lt!449527)) (= (getValueByKey!529 l!412 (h!22646 lt!449527)) (Some!579 value!115)))))

(declare-fun m!939179 () Bool)

(assert (=> bs!29447 m!939179))

(assert (=> b!1016572 d!121419))

(declare-fun b_lambda!15419 () Bool)

(assert (= b_lambda!15409 (or b!1016490 b_lambda!15419)))

(declare-fun bs!29448 () Bool)

(declare-fun d!121421 () Bool)

(assert (= bs!29448 (and d!121421 b!1016490)))

(assert (=> bs!29448 (= (dynLambda!1923 lambda!832 (h!22646 lt!449527)) (= (getValueByKey!529 l!412 (h!22646 lt!449527)) (Some!579 value!115)))))

(assert (=> bs!29448 m!939179))

(assert (=> b!1016564 d!121421))

(check-sat (not d!121383) (not bs!29447) (not b!1016556) (not b!1016565) (not b!1016571) (not bm!43018) (not bs!29448) (not bm!43020) (not d!121405) (not b_lambda!15417) (not b!1016573) (not b!1016676) (not b!1016555) (not bm!43019) (not b_lambda!15419) tp_is_empty!23521 (not bm!43021) (not b!1016557))
(check-sat)
