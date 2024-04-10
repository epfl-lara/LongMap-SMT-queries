; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87844 () Bool)

(assert start!87844)

(declare-fun b!1015195 () Bool)

(assert (=> b!1015195 true))

(assert (=> b!1015195 true))

(declare-fun bs!29366 () Bool)

(declare-fun b!1015196 () Bool)

(assert (= bs!29366 (and b!1015196 b!1015195)))

(declare-fun lambda!845 () Int)

(declare-fun lambda!844 () Int)

(assert (=> bs!29366 (= lambda!845 lambda!844)))

(assert (=> b!1015196 true))

(assert (=> b!1015196 true))

(declare-fun b!1015194 () Bool)

(declare-datatypes ((Unit!33218 0))(
  ( (Unit!33219) )
))
(declare-fun e!571089 () Unit!33218)

(declare-fun Unit!33220 () Unit!33218)

(assert (=> b!1015194 (= e!571089 Unit!33220)))

(declare-fun lt!449031 () Unit!33218)

(assert (=> b!1015195 (= e!571089 lt!449031)))

(declare-datatypes ((List!21458 0))(
  ( (Nil!21455) (Cons!21454 (h!22652 (_ BitVec 64)) (t!30459 List!21458)) )
))
(declare-fun lt!449030 () List!21458)

(declare-datatypes ((B!1458 0))(
  ( (B!1459 (val!11813 Int)) )
))
(declare-fun value!115 () B!1458)

(declare-datatypes ((tuple2!15172 0))(
  ( (tuple2!15173 (_1!7597 (_ BitVec 64)) (_2!7597 B!1458)) )
))
(declare-datatypes ((List!21459 0))(
  ( (Nil!21456) (Cons!21455 (h!22653 tuple2!15172) (t!30460 List!21459)) )
))
(declare-fun l!412 () List!21459)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!46 (List!21459 List!21458 B!1458 tuple2!15172) Unit!33218)

(assert (=> b!1015195 (= lt!449031 (lemmaForallGetValueByKeySameWithASmallerHead!46 (t!30460 l!412) lt!449030 value!115 (h!22653 l!412)))))

(declare-fun forall!252 (List!21458 Int) Bool)

(assert (=> b!1015195 (forall!252 lt!449030 lambda!844)))

(declare-fun res!681021 () Bool)

(declare-fun e!571090 () Bool)

(assert (=> start!87844 (=> (not res!681021) (not e!571090))))

(declare-fun isStrictlySorted!587 (List!21459) Bool)

(assert (=> start!87844 (= res!681021 (isStrictlySorted!587 l!412))))

(assert (=> start!87844 e!571090))

(declare-fun e!571088 () Bool)

(assert (=> start!87844 e!571088))

(declare-fun tp_is_empty!23525 () Bool)

(assert (=> start!87844 tp_is_empty!23525))

(assert (=> b!1015196 (= e!571090 (not (forall!252 lt!449030 lambda!845)))))

(declare-fun lt!449029 () Unit!33218)

(assert (=> b!1015196 (= lt!449029 e!571089)))

(declare-fun c!102855 () Bool)

(declare-fun isEmpty!852 (List!21458) Bool)

(assert (=> b!1015196 (= c!102855 (not (isEmpty!852 lt!449030)))))

(declare-fun getKeysOf!60 (List!21459 B!1458) List!21458)

(assert (=> b!1015196 (= lt!449030 (getKeysOf!60 (t!30460 l!412) value!115))))

(declare-fun b!1015197 () Bool)

(declare-fun tp!70598 () Bool)

(assert (=> b!1015197 (= e!571088 (and tp_is_empty!23525 tp!70598))))

(declare-fun b!1015198 () Bool)

(declare-fun res!681020 () Bool)

(assert (=> b!1015198 (=> (not res!681020) (not e!571090))))

(assert (=> b!1015198 (= res!681020 (and (not (= (_2!7597 (h!22653 l!412)) value!115)) (is-Cons!21455 l!412)))))

(assert (= (and start!87844 res!681021) b!1015198))

(assert (= (and b!1015198 res!681020) b!1015196))

(assert (= (and b!1015196 c!102855) b!1015195))

(assert (= (and b!1015196 (not c!102855)) b!1015194))

(assert (= (and start!87844 (is-Cons!21455 l!412)) b!1015197))

(declare-fun m!937401 () Bool)

(assert (=> b!1015195 m!937401))

(declare-fun m!937403 () Bool)

(assert (=> b!1015195 m!937403))

(declare-fun m!937405 () Bool)

(assert (=> start!87844 m!937405))

(declare-fun m!937407 () Bool)

(assert (=> b!1015196 m!937407))

(declare-fun m!937409 () Bool)

(assert (=> b!1015196 m!937409))

(declare-fun m!937411 () Bool)

(assert (=> b!1015196 m!937411))

(push 1)

(assert (not b!1015195))

(assert (not b!1015196))

(assert (not start!87844))

(assert (not b!1015197))

(assert tp_is_empty!23525)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bs!29367 () Bool)

(declare-fun b!1015216 () Bool)

(assert (= bs!29367 (and b!1015216 b!1015195)))

(declare-fun lambda!850 () Int)

(assert (=> bs!29367 (= (= (t!30460 l!412) l!412) (= lambda!850 lambda!844))))

(declare-fun bs!29368 () Bool)

(assert (= bs!29368 (and b!1015216 b!1015196)))

(assert (=> bs!29368 (= (= (t!30460 l!412) l!412) (= lambda!850 lambda!845))))

(assert (=> b!1015216 true))

(assert (=> b!1015216 true))

(declare-fun bs!29369 () Bool)

(declare-fun d!120907 () Bool)

(assert (= bs!29369 (and d!120907 b!1015195)))

(declare-fun lambda!851 () Int)

(assert (=> bs!29369 (= (= (Cons!21455 (h!22653 l!412) (t!30460 l!412)) l!412) (= lambda!851 lambda!844))))

(declare-fun bs!29370 () Bool)

(assert (= bs!29370 (and d!120907 b!1015196)))

(assert (=> bs!29370 (= (= (Cons!21455 (h!22653 l!412) (t!30460 l!412)) l!412) (= lambda!851 lambda!845))))

(declare-fun bs!29371 () Bool)

(assert (= bs!29371 (and d!120907 b!1015216)))

(assert (=> bs!29371 (= (= (Cons!21455 (h!22653 l!412) (t!30460 l!412)) (t!30460 l!412)) (= lambda!851 lambda!850))))

(assert (=> d!120907 true))

(assert (=> d!120907 true))

(assert (=> d!120907 true))

(assert (=> d!120907 (forall!252 lt!449030 lambda!851)))

(declare-fun lt!449034 () Unit!33218)

(declare-fun choose!1637 (List!21459 List!21458 B!1458 tuple2!15172) Unit!33218)

(assert (=> d!120907 (= lt!449034 (choose!1637 (t!30460 l!412) lt!449030 value!115 (h!22653 l!412)))))

(declare-fun e!571099 () Bool)

(assert (=> d!120907 e!571099))

(declare-fun res!681034 () Bool)

(assert (=> d!120907 (=> (not res!681034) (not e!571099))))

(assert (=> d!120907 (= res!681034 (isStrictlySorted!587 (t!30460 l!412)))))

(assert (=> d!120907 (= (lemmaForallGetValueByKeySameWithASmallerHead!46 (t!30460 l!412) lt!449030 value!115 (h!22653 l!412)) lt!449034)))

(declare-fun b!1015215 () Bool)

(declare-fun res!681036 () Bool)

(assert (=> b!1015215 (=> (not res!681036) (not e!571099))))

(declare-fun isEmpty!853 (List!21459) Bool)

(assert (=> b!1015215 (= res!681036 (not (isEmpty!853 (t!30460 l!412))))))

(declare-fun res!681035 () Bool)

(assert (=> b!1015216 (=> (not res!681035) (not e!571099))))

(assert (=> b!1015216 (= res!681035 (forall!252 lt!449030 lambda!850))))

(declare-fun b!1015217 () Bool)

(declare-fun head!946 (List!21459) tuple2!15172)

(assert (=> b!1015217 (= e!571099 (bvslt (_1!7597 (h!22653 l!412)) (_1!7597 (head!946 (t!30460 l!412)))))))

(assert (= (and d!120907 res!681034) b!1015215))

(assert (= (and b!1015215 res!681036) b!1015216))

(assert (= (and b!1015216 res!681035) b!1015217))

(declare-fun m!937417 () Bool)

(assert (=> d!120907 m!937417))

(declare-fun m!937419 () Bool)

(assert (=> d!120907 m!937419))

(declare-fun m!937421 () Bool)

(assert (=> d!120907 m!937421))

(declare-fun m!937423 () Bool)

(assert (=> b!1015215 m!937423))

(declare-fun m!937425 () Bool)

(assert (=> b!1015216 m!937425))

(declare-fun m!937427 () Bool)

(assert (=> b!1015217 m!937427))

(assert (=> b!1015195 d!120907))

(declare-fun d!120917 () Bool)

(declare-fun res!681045 () Bool)

(declare-fun e!571108 () Bool)

(assert (=> d!120917 (=> res!681045 e!571108)))

(assert (=> d!120917 (= res!681045 (is-Nil!21455 lt!449030))))

(assert (=> d!120917 (= (forall!252 lt!449030 lambda!844) e!571108)))

(declare-fun b!1015228 () Bool)

(declare-fun e!571109 () Bool)

(assert (=> b!1015228 (= e!571108 e!571109)))

(declare-fun res!681046 () Bool)

(assert (=> b!1015228 (=> (not res!681046) (not e!571109))))

(declare-fun dynLambda!1897 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015228 (= res!681046 (dynLambda!1897 lambda!844 (h!22652 lt!449030)))))

(declare-fun b!1015229 () Bool)

(assert (=> b!1015229 (= e!571109 (forall!252 (t!30459 lt!449030) lambda!844))))

(assert (= (and d!120917 (not res!681045)) b!1015228))

(assert (= (and b!1015228 res!681046) b!1015229))

(declare-fun b_lambda!15393 () Bool)

(assert (=> (not b_lambda!15393) (not b!1015228)))

(declare-fun m!937429 () Bool)

(assert (=> b!1015228 m!937429))

(declare-fun m!937431 () Bool)

(assert (=> b!1015229 m!937431))

(assert (=> b!1015195 d!120917))

(declare-fun d!120919 () Bool)

(declare-fun res!681047 () Bool)

(declare-fun e!571110 () Bool)

(assert (=> d!120919 (=> res!681047 e!571110)))

(assert (=> d!120919 (= res!681047 (is-Nil!21455 lt!449030))))

(assert (=> d!120919 (= (forall!252 lt!449030 lambda!845) e!571110)))

(declare-fun b!1015230 () Bool)

(declare-fun e!571111 () Bool)

(assert (=> b!1015230 (= e!571110 e!571111)))

(declare-fun res!681048 () Bool)

(assert (=> b!1015230 (=> (not res!681048) (not e!571111))))

(assert (=> b!1015230 (= res!681048 (dynLambda!1897 lambda!845 (h!22652 lt!449030)))))

(declare-fun b!1015231 () Bool)

(assert (=> b!1015231 (= e!571111 (forall!252 (t!30459 lt!449030) lambda!845))))

(assert (= (and d!120919 (not res!681047)) b!1015230))

(assert (= (and b!1015230 res!681048) b!1015231))

(declare-fun b_lambda!15395 () Bool)

(assert (=> (not b_lambda!15395) (not b!1015230)))

(declare-fun m!937433 () Bool)

(assert (=> b!1015230 m!937433))

(declare-fun m!937437 () Bool)

(assert (=> b!1015231 m!937437))

(assert (=> b!1015196 d!120919))

(declare-fun d!120921 () Bool)

(assert (=> d!120921 (= (isEmpty!852 lt!449030) (is-Nil!21455 lt!449030))))

(assert (=> b!1015196 d!120921))

(declare-fun bs!29381 () Bool)

(declare-fun b!1015303 () Bool)

(assert (= bs!29381 (and b!1015303 b!1015195)))

(declare-fun lambda!873 () Int)

(declare-fun lt!449109 () List!21459)

(declare-fun lt!449112 () tuple2!15172)

(assert (=> bs!29381 (= (= (Cons!21455 lt!449112 lt!449109) l!412) (= lambda!873 lambda!844))))

(declare-fun bs!29382 () Bool)

(assert (= bs!29382 (and b!1015303 b!1015196)))

(assert (=> bs!29382 (= (= (Cons!21455 lt!449112 lt!449109) l!412) (= lambda!873 lambda!845))))

(declare-fun bs!29383 () Bool)

(assert (= bs!29383 (and b!1015303 b!1015216)))

(assert (=> bs!29383 (= (= (Cons!21455 lt!449112 lt!449109) (t!30460 l!412)) (= lambda!873 lambda!850))))

(declare-fun bs!29384 () Bool)

(assert (= bs!29384 (and b!1015303 d!120907)))

(assert (=> bs!29384 (= (= (Cons!21455 lt!449112 lt!449109) (Cons!21455 (h!22653 l!412) (t!30460 l!412))) (= lambda!873 lambda!851))))

(assert (=> b!1015303 true))

(assert (=> b!1015303 true))

(assert (=> b!1015303 true))

(declare-fun bs!29386 () Bool)

(declare-fun b!1015300 () Bool)

(assert (= bs!29386 (and b!1015300 b!1015195)))

(declare-fun lt!449118 () List!21459)

(declare-fun lt!449113 () tuple2!15172)

(declare-fun lambda!876 () Int)

(assert (=> bs!29386 (= (= (Cons!21455 lt!449113 lt!449118) l!412) (= lambda!876 lambda!844))))

(declare-fun bs!29388 () Bool)

(assert (= bs!29388 (and b!1015300 d!120907)))

(assert (=> bs!29388 (= (= (Cons!21455 lt!449113 lt!449118) (Cons!21455 (h!22653 l!412) (t!30460 l!412))) (= lambda!876 lambda!851))))

(declare-fun bs!29390 () Bool)

(assert (= bs!29390 (and b!1015300 b!1015196)))

(assert (=> bs!29390 (= (= (Cons!21455 lt!449113 lt!449118) l!412) (= lambda!876 lambda!845))))

(declare-fun bs!29392 () Bool)

(assert (= bs!29392 (and b!1015300 b!1015303)))

(assert (=> bs!29392 (= (= (Cons!21455 lt!449113 lt!449118) (Cons!21455 lt!449112 lt!449109)) (= lambda!876 lambda!873))))

(declare-fun bs!29394 () Bool)

(assert (= bs!29394 (and b!1015300 b!1015216)))

(assert (=> bs!29394 (= (= (Cons!21455 lt!449113 lt!449118) (t!30460 l!412)) (= lambda!876 lambda!850))))

(assert (=> b!1015300 true))

(assert (=> b!1015300 true))

(assert (=> b!1015300 true))

(declare-fun bs!29396 () Bool)

(declare-fun d!120925 () Bool)

(assert (= bs!29396 (and d!120925 b!1015195)))

(declare-fun lambda!879 () Int)

(assert (=> bs!29396 (= (= (t!30460 l!412) l!412) (= lambda!879 lambda!844))))

(declare-fun bs!29398 () Bool)

(assert (= bs!29398 (and d!120925 b!1015300)))

(assert (=> bs!29398 (= (= (t!30460 l!412) (Cons!21455 lt!449113 lt!449118)) (= lambda!879 lambda!876))))

(declare-fun bs!29400 () Bool)

(assert (= bs!29400 (and d!120925 d!120907)))

(assert (=> bs!29400 (= (= (t!30460 l!412) (Cons!21455 (h!22653 l!412) (t!30460 l!412))) (= lambda!879 lambda!851))))

(declare-fun bs!29402 () Bool)

(assert (= bs!29402 (and d!120925 b!1015196)))

(assert (=> bs!29402 (= (= (t!30460 l!412) l!412) (= lambda!879 lambda!845))))

(declare-fun bs!29404 () Bool)

(assert (= bs!29404 (and d!120925 b!1015303)))

(assert (=> bs!29404 (= (= (t!30460 l!412) (Cons!21455 lt!449112 lt!449109)) (= lambda!879 lambda!873))))

(declare-fun bs!29406 () Bool)

(assert (= bs!29406 (and d!120925 b!1015216)))

(assert (=> bs!29406 (= lambda!879 lambda!850)))

(assert (=> d!120925 true))

(assert (=> d!120925 true))

(declare-fun b!1015296 () Bool)

(declare-fun e!571149 () List!21458)

(declare-fun e!571146 () List!21458)

(assert (=> b!1015296 (= e!571149 e!571146)))

(declare-fun c!102883 () Bool)

(assert (=> b!1015296 (= c!102883 (and (is-Cons!21455 (t!30460 l!412)) (not (= (_2!7597 (h!22653 (t!30460 l!412))) value!115))))))

(declare-fun bm!42939 () Bool)

(declare-fun call!42945 () List!21458)

(assert (=> bm!42939 (= call!42945 (getKeysOf!60 (t!30460 (t!30460 l!412)) value!115))))

(declare-fun b!1015297 () Bool)

(declare-fun lt!449120 () Unit!33218)

(declare-fun e!571148 () Unit!33218)

(assert (=> b!1015297 (= lt!449120 e!571148)))

(declare-fun c!102881 () Bool)

(declare-fun call!42943 () Bool)

(assert (=> b!1015297 (= c!102881 (not call!42943))))

(declare-fun lt!449116 () List!21458)

(assert (=> b!1015297 (= lt!449116 call!42945)))

(assert (=> b!1015297 (= e!571146 call!42945)))

(declare-fun b!1015298 () Bool)

(declare-fun e!571147 () Unit!33218)

(declare-fun Unit!33223 () Unit!33218)

(assert (=> b!1015298 (= e!571147 Unit!33223)))

(declare-fun lt!449111 () List!21458)

(assert (=> d!120925 (forall!252 lt!449111 lambda!879)))

(assert (=> d!120925 (= lt!449111 e!571149)))

(declare-fun c!102882 () Bool)

(assert (=> d!120925 (= c!102882 (and (is-Cons!21455 (t!30460 l!412)) (= (_2!7597 (h!22653 (t!30460 l!412))) value!115)))))

(assert (=> d!120925 (isStrictlySorted!587 (t!30460 l!412))))

(assert (=> d!120925 (= (getKeysOf!60 (t!30460 l!412) value!115) lt!449111)))

(declare-fun bm!42940 () Bool)

(assert (=> bm!42940 (= call!42943 (isEmpty!852 call!42945))))

(declare-fun lt!449110 () List!21458)

(declare-fun call!42944 () Bool)

(declare-fun bm!42941 () Bool)

(declare-fun lt!449115 () List!21458)

(assert (=> bm!42941 (= call!42944 (forall!252 (ite c!102882 lt!449110 lt!449115) (ite c!102882 lambda!873 lambda!876)))))

(declare-fun b!1015299 () Bool)

(declare-fun Unit!33225 () Unit!33218)

(assert (=> b!1015299 (= e!571148 Unit!33225)))

(declare-fun lt!449114 () Unit!33218)

(assert (=> b!1015300 (= e!571148 lt!449114)))

(assert (=> b!1015300 (= lt!449118 (t!30460 (t!30460 l!412)))))

(assert (=> b!1015300 (= lt!449115 call!42945)))

(assert (=> b!1015300 (= lt!449113 (h!22653 (t!30460 l!412)))))

(declare-fun call!42942 () Unit!33218)

(assert (=> b!1015300 (= lt!449114 call!42942)))

(assert (=> b!1015300 call!42944))

(declare-fun b!1015301 () Bool)

(assert (=> b!1015301 (= e!571146 Nil!21455)))

(declare-fun b!1015302 () Bool)

(assert (=> b!1015302 (= e!571149 (Cons!21454 (_1!7597 (h!22653 (t!30460 l!412))) call!42945))))

(declare-fun c!102880 () Bool)

(assert (=> b!1015302 (= c!102880 (not call!42943))))

(declare-fun lt!449117 () Unit!33218)

(assert (=> b!1015302 (= lt!449117 e!571147)))

(assert (=> b!1015303 call!42944))

(declare-fun lt!449119 () Unit!33218)

(assert (=> b!1015303 (= lt!449119 call!42942)))

(assert (=> b!1015303 (= lt!449112 (h!22653 (t!30460 l!412)))))

(assert (=> b!1015303 (= lt!449110 call!42945)))

(assert (=> b!1015303 (= lt!449109 (t!30460 (t!30460 l!412)))))

(assert (=> b!1015303 (= e!571147 lt!449119)))

(declare-fun bm!42942 () Bool)

(assert (=> bm!42942 (= call!42942 (lemmaForallGetValueByKeySameWithASmallerHead!46 (ite c!102882 lt!449109 lt!449118) (ite c!102882 lt!449110 lt!449115) value!115 (ite c!102882 lt!449112 lt!449113)))))

(assert (= (and d!120925 c!102882) b!1015302))

(assert (= (and d!120925 (not c!102882)) b!1015296))

(assert (= (and b!1015302 c!102880) b!1015303))

(assert (= (and b!1015302 (not c!102880)) b!1015298))

(assert (= (and b!1015296 c!102883) b!1015297))

(assert (= (and b!1015296 (not c!102883)) b!1015301))

(assert (= (and b!1015297 c!102881) b!1015300))

(assert (= (and b!1015297 (not c!102881)) b!1015299))

(assert (= (or b!1015303 b!1015300) bm!42942))

(assert (= (or b!1015303 b!1015300) bm!42941))

(assert (= (or b!1015302 b!1015303 b!1015297 b!1015300) bm!42939))

(assert (= (or b!1015302 b!1015297) bm!42940))

(declare-fun m!937465 () Bool)

(assert (=> bm!42939 m!937465))

(declare-fun m!937467 () Bool)

(assert (=> d!120925 m!937467))

(assert (=> d!120925 m!937421))

(declare-fun m!937469 () Bool)

(assert (=> bm!42940 m!937469))

(declare-fun m!937473 () Bool)

(assert (=> bm!42941 m!937473))

(declare-fun m!937477 () Bool)

(assert (=> bm!42942 m!937477))

(assert (=> b!1015196 d!120925))

(declare-fun d!120937 () Bool)

(declare-fun res!681078 () Bool)

(declare-fun e!571167 () Bool)

(assert (=> d!120937 (=> res!681078 e!571167)))

(assert (=> d!120937 (= res!681078 (or (is-Nil!21456 l!412) (is-Nil!21456 (t!30460 l!412))))))

(assert (=> d!120937 (= (isStrictlySorted!587 l!412) e!571167)))

(declare-fun b!1015327 () Bool)

(declare-fun e!571168 () Bool)

(assert (=> b!1015327 (= e!571167 e!571168)))

(declare-fun res!681079 () Bool)

(assert (=> b!1015327 (=> (not res!681079) (not e!571168))))

(assert (=> b!1015327 (= res!681079 (bvslt (_1!7597 (h!22653 l!412)) (_1!7597 (h!22653 (t!30460 l!412)))))))

(declare-fun b!1015328 () Bool)

(assert (=> b!1015328 (= e!571168 (isStrictlySorted!587 (t!30460 l!412)))))

(assert (= (and d!120937 (not res!681078)) b!1015327))

(assert (= (and b!1015327 res!681079) b!1015328))

(assert (=> b!1015328 m!937421))

(assert (=> start!87844 d!120937))

(declare-fun b!1015338 () Bool)

(declare-fun e!571174 () Bool)

(declare-fun tp!70604 () Bool)

(assert (=> b!1015338 (= e!571174 (and tp_is_empty!23525 tp!70604))))

(assert (=> b!1015197 (= tp!70598 e!571174)))

(assert (= (and b!1015197 (is-Cons!21455 (t!30460 l!412))) b!1015338))

(declare-fun b_lambda!15403 () Bool)

(assert (= b_lambda!15395 (or b!1015196 b_lambda!15403)))

(declare-fun bs!29407 () Bool)

(declare-fun d!120941 () Bool)

(assert (= bs!29407 (and d!120941 b!1015196)))

(declare-datatypes ((Option!582 0))(
  ( (Some!581 (v!14432 B!1458)) (None!580) )
))
(declare-fun getValueByKey!531 (List!21459 (_ BitVec 64)) Option!582)

(assert (=> bs!29407 (= (dynLambda!1897 lambda!845 (h!22652 lt!449030)) (= (getValueByKey!531 l!412 (h!22652 lt!449030)) (Some!581 value!115)))))

(declare-fun m!937480 () Bool)

(assert (=> bs!29407 m!937480))

(assert (=> b!1015230 d!120941))

(declare-fun b_lambda!15406 () Bool)

(assert (= b_lambda!15393 (or b!1015195 b_lambda!15406)))

(declare-fun bs!29410 () Bool)

(declare-fun d!120945 () Bool)

(assert (= bs!29410 (and d!120945 b!1015195)))

(assert (=> bs!29410 (= (dynLambda!1897 lambda!844 (h!22652 lt!449030)) (= (getValueByKey!531 l!412 (h!22652 lt!449030)) (Some!581 value!115)))))

(assert (=> bs!29410 m!937480))

(assert (=> b!1015228 d!120945))

(push 1)

