; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1454 () Bool)

(assert start!1454)

(declare-fun b_free!441 () Bool)

(declare-fun b_next!441 () Bool)

(assert (=> start!1454 (= b_free!441 (not b_next!441))))

(declare-fun tp!1827 () Bool)

(declare-fun b_and!701 () Bool)

(assert (=> start!1454 (= tp!1827 b_and!701)))

(declare-fun b!11166 () Bool)

(declare-fun res!9328 () Bool)

(declare-fun e!6570 () Bool)

(assert (=> b!11166 (=> (not res!9328) (not e!6570))))

(declare-datatypes ((B!382 0))(
  ( (B!383 (val!286 Int)) )
))
(declare-datatypes ((tuple2!372 0))(
  ( (tuple2!373 (_1!186 (_ BitVec 64)) (_2!186 B!382)) )
))
(declare-datatypes ((List!338 0))(
  ( (Nil!335) (Cons!334 (h!900 tuple2!372) (t!2587 List!338)) )
))
(declare-fun kvs!4 () List!338)

(declare-fun isEmpty!64 (List!338) Bool)

(assert (=> b!11166 (= res!9328 (not (isEmpty!64 kvs!4)))))

(declare-fun b!11167 () Bool)

(declare-fun e!6569 () Bool)

(assert (=> b!11167 (= e!6570 (not e!6569))))

(declare-fun res!9329 () Bool)

(assert (=> b!11167 (=> (not res!9329) (not e!6569))))

(declare-fun lt!2771 () tuple2!372)

(declare-datatypes ((ListLongMap!353 0))(
  ( (ListLongMap!354 (toList!192 List!338)) )
))
(declare-fun lm!227 () ListLongMap!353)

(declare-fun p!216 () Int)

(declare-fun forall!57 (List!338 Int) Bool)

(declare-fun +!24 (ListLongMap!353 tuple2!372) ListLongMap!353)

(assert (=> b!11167 (= res!9329 (forall!57 (toList!192 (+!24 lm!227 lt!2771)) p!216))))

(assert (=> b!11167 (forall!57 (toList!192 (+!24 lm!227 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771)))) p!216)))

(declare-datatypes ((Unit!233 0))(
  ( (Unit!234) )
))
(declare-fun lt!2772 () Unit!233)

(declare-fun addValidProp!12 (ListLongMap!353 Int (_ BitVec 64) B!382) Unit!233)

(assert (=> b!11167 (= lt!2772 (addValidProp!12 lm!227 p!216 (_1!186 lt!2771) (_2!186 lt!2771)))))

(declare-fun head!771 (List!338) tuple2!372)

(assert (=> b!11167 (= lt!2771 (head!771 kvs!4))))

(declare-fun b!11168 () Bool)

(declare-fun e!6571 () Bool)

(declare-fun tp!1828 () Bool)

(assert (=> b!11168 (= e!6571 tp!1828)))

(declare-fun res!9330 () Bool)

(assert (=> start!1454 (=> (not res!9330) (not e!6570))))

(assert (=> start!1454 (= res!9330 (forall!57 (toList!192 lm!227) p!216))))

(assert (=> start!1454 e!6570))

(declare-fun inv!551 (ListLongMap!353) Bool)

(assert (=> start!1454 (and (inv!551 lm!227) e!6571)))

(assert (=> start!1454 tp!1827))

(declare-fun e!6572 () Bool)

(assert (=> start!1454 e!6572))

(declare-fun b!11169 () Bool)

(declare-fun res!9331 () Bool)

(assert (=> b!11169 (=> (not res!9331) (not e!6570))))

(assert (=> b!11169 (= res!9331 (forall!57 kvs!4 p!216))))

(declare-fun b!11170 () Bool)

(declare-fun tp_is_empty!555 () Bool)

(declare-fun tp!1829 () Bool)

(assert (=> b!11170 (= e!6572 (and tp_is_empty!555 tp!1829))))

(declare-fun b!11171 () Bool)

(declare-fun tail!51 (List!338) List!338)

(assert (=> b!11171 (= e!6569 (forall!57 (tail!51 kvs!4) p!216))))

(assert (= (and start!1454 res!9330) b!11169))

(assert (= (and b!11169 res!9331) b!11166))

(assert (= (and b!11166 res!9328) b!11167))

(assert (= (and b!11167 res!9329) b!11171))

(assert (= start!1454 b!11168))

(get-info :version)

(assert (= (and start!1454 ((_ is Cons!334) kvs!4)) b!11170))

(declare-fun m!7385 () Bool)

(assert (=> b!11169 m!7385))

(declare-fun m!7387 () Bool)

(assert (=> b!11166 m!7387))

(declare-fun m!7389 () Bool)

(assert (=> start!1454 m!7389))

(declare-fun m!7391 () Bool)

(assert (=> start!1454 m!7391))

(declare-fun m!7393 () Bool)

(assert (=> b!11167 m!7393))

(declare-fun m!7395 () Bool)

(assert (=> b!11167 m!7395))

(declare-fun m!7397 () Bool)

(assert (=> b!11167 m!7397))

(declare-fun m!7399 () Bool)

(assert (=> b!11167 m!7399))

(declare-fun m!7401 () Bool)

(assert (=> b!11167 m!7401))

(declare-fun m!7403 () Bool)

(assert (=> b!11167 m!7403))

(declare-fun m!7405 () Bool)

(assert (=> b!11171 m!7405))

(assert (=> b!11171 m!7405))

(declare-fun m!7407 () Bool)

(assert (=> b!11171 m!7407))

(check-sat (not b!11167) tp_is_empty!555 (not b!11171) (not b_next!441) (not b!11168) (not b!11166) (not b!11170) (not b!11169) (not start!1454) b_and!701)
(check-sat b_and!701 (not b_next!441))
(get-model)

(declare-fun d!1333 () Bool)

(declare-fun res!9352 () Bool)

(declare-fun e!6593 () Bool)

(assert (=> d!1333 (=> res!9352 e!6593)))

(assert (=> d!1333 (= res!9352 ((_ is Nil!335) kvs!4))))

(assert (=> d!1333 (= (forall!57 kvs!4 p!216) e!6593)))

(declare-fun b!11198 () Bool)

(declare-fun e!6594 () Bool)

(assert (=> b!11198 (= e!6593 e!6594)))

(declare-fun res!9353 () Bool)

(assert (=> b!11198 (=> (not res!9353) (not e!6594))))

(declare-fun dynLambda!67 (Int tuple2!372) Bool)

(assert (=> b!11198 (= res!9353 (dynLambda!67 p!216 (h!900 kvs!4)))))

(declare-fun b!11199 () Bool)

(assert (=> b!11199 (= e!6594 (forall!57 (t!2587 kvs!4) p!216))))

(assert (= (and d!1333 (not res!9352)) b!11198))

(assert (= (and b!11198 res!9353) b!11199))

(declare-fun b_lambda!563 () Bool)

(assert (=> (not b_lambda!563) (not b!11198)))

(declare-fun t!2590 () Bool)

(declare-fun tb!249 () Bool)

(assert (=> (and start!1454 (= p!216 p!216) t!2590) tb!249))

(declare-fun result!411 () Bool)

(assert (=> tb!249 (= result!411 true)))

(assert (=> b!11198 t!2590))

(declare-fun b_and!705 () Bool)

(assert (= b_and!701 (and (=> t!2590 result!411) b_and!705)))

(declare-fun m!7433 () Bool)

(assert (=> b!11198 m!7433))

(declare-fun m!7435 () Bool)

(assert (=> b!11199 m!7435))

(assert (=> b!11169 d!1333))

(declare-fun d!1339 () Bool)

(declare-fun res!9356 () Bool)

(declare-fun e!6597 () Bool)

(assert (=> d!1339 (=> res!9356 e!6597)))

(assert (=> d!1339 (= res!9356 ((_ is Nil!335) (toList!192 lm!227)))))

(assert (=> d!1339 (= (forall!57 (toList!192 lm!227) p!216) e!6597)))

(declare-fun b!11202 () Bool)

(declare-fun e!6598 () Bool)

(assert (=> b!11202 (= e!6597 e!6598)))

(declare-fun res!9357 () Bool)

(assert (=> b!11202 (=> (not res!9357) (not e!6598))))

(assert (=> b!11202 (= res!9357 (dynLambda!67 p!216 (h!900 (toList!192 lm!227))))))

(declare-fun b!11203 () Bool)

(assert (=> b!11203 (= e!6598 (forall!57 (t!2587 (toList!192 lm!227)) p!216))))

(assert (= (and d!1339 (not res!9356)) b!11202))

(assert (= (and b!11202 res!9357) b!11203))

(declare-fun b_lambda!567 () Bool)

(assert (=> (not b_lambda!567) (not b!11202)))

(declare-fun t!2594 () Bool)

(declare-fun tb!253 () Bool)

(assert (=> (and start!1454 (= p!216 p!216) t!2594) tb!253))

(declare-fun result!415 () Bool)

(assert (=> tb!253 (= result!415 true)))

(assert (=> b!11202 t!2594))

(declare-fun b_and!709 () Bool)

(assert (= b_and!705 (and (=> t!2594 result!415) b_and!709)))

(declare-fun m!7441 () Bool)

(assert (=> b!11202 m!7441))

(declare-fun m!7443 () Bool)

(assert (=> b!11203 m!7443))

(assert (=> start!1454 d!1339))

(declare-fun d!1343 () Bool)

(declare-fun isStrictlySorted!41 (List!338) Bool)

(assert (=> d!1343 (= (inv!551 lm!227) (isStrictlySorted!41 (toList!192 lm!227)))))

(declare-fun bs!427 () Bool)

(assert (= bs!427 d!1343))

(declare-fun m!7447 () Bool)

(assert (=> bs!427 m!7447))

(assert (=> start!1454 d!1343))

(declare-fun d!1347 () Bool)

(declare-fun res!9358 () Bool)

(declare-fun e!6599 () Bool)

(assert (=> d!1347 (=> res!9358 e!6599)))

(assert (=> d!1347 (= res!9358 ((_ is Nil!335) (tail!51 kvs!4)))))

(assert (=> d!1347 (= (forall!57 (tail!51 kvs!4) p!216) e!6599)))

(declare-fun b!11204 () Bool)

(declare-fun e!6600 () Bool)

(assert (=> b!11204 (= e!6599 e!6600)))

(declare-fun res!9359 () Bool)

(assert (=> b!11204 (=> (not res!9359) (not e!6600))))

(assert (=> b!11204 (= res!9359 (dynLambda!67 p!216 (h!900 (tail!51 kvs!4))))))

(declare-fun b!11205 () Bool)

(assert (=> b!11205 (= e!6600 (forall!57 (t!2587 (tail!51 kvs!4)) p!216))))

(assert (= (and d!1347 (not res!9358)) b!11204))

(assert (= (and b!11204 res!9359) b!11205))

(declare-fun b_lambda!569 () Bool)

(assert (=> (not b_lambda!569) (not b!11204)))

(declare-fun t!2596 () Bool)

(declare-fun tb!255 () Bool)

(assert (=> (and start!1454 (= p!216 p!216) t!2596) tb!255))

(declare-fun result!417 () Bool)

(assert (=> tb!255 (= result!417 true)))

(assert (=> b!11204 t!2596))

(declare-fun b_and!711 () Bool)

(assert (= b_and!709 (and (=> t!2596 result!417) b_and!711)))

(declare-fun m!7449 () Bool)

(assert (=> b!11204 m!7449))

(declare-fun m!7451 () Bool)

(assert (=> b!11205 m!7451))

(assert (=> b!11171 d!1347))

(declare-fun d!1349 () Bool)

(assert (=> d!1349 (= (tail!51 kvs!4) (t!2587 kvs!4))))

(assert (=> b!11171 d!1349))

(declare-fun d!1351 () Bool)

(assert (=> d!1351 (= (isEmpty!64 kvs!4) ((_ is Nil!335) kvs!4))))

(assert (=> b!11166 d!1351))

(declare-fun d!1353 () Bool)

(assert (=> d!1353 (forall!57 (toList!192 (+!24 lm!227 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771)))) p!216)))

(declare-fun lt!2787 () Unit!233)

(declare-fun choose!155 (ListLongMap!353 Int (_ BitVec 64) B!382) Unit!233)

(assert (=> d!1353 (= lt!2787 (choose!155 lm!227 p!216 (_1!186 lt!2771) (_2!186 lt!2771)))))

(declare-fun e!6615 () Bool)

(assert (=> d!1353 e!6615))

(declare-fun res!9374 () Bool)

(assert (=> d!1353 (=> (not res!9374) (not e!6615))))

(assert (=> d!1353 (= res!9374 (forall!57 (toList!192 lm!227) p!216))))

(assert (=> d!1353 (= (addValidProp!12 lm!227 p!216 (_1!186 lt!2771) (_2!186 lt!2771)) lt!2787)))

(declare-fun b!11223 () Bool)

(assert (=> b!11223 (= e!6615 (dynLambda!67 p!216 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771))))))

(assert (= (and d!1353 res!9374) b!11223))

(declare-fun b_lambda!577 () Bool)

(assert (=> (not b_lambda!577) (not b!11223)))

(declare-fun t!2604 () Bool)

(declare-fun tb!263 () Bool)

(assert (=> (and start!1454 (= p!216 p!216) t!2604) tb!263))

(declare-fun result!425 () Bool)

(assert (=> tb!263 (= result!425 true)))

(assert (=> b!11223 t!2604))

(declare-fun b_and!719 () Bool)

(assert (= b_and!711 (and (=> t!2604 result!425) b_and!719)))

(assert (=> d!1353 m!7393))

(assert (=> d!1353 m!7397))

(declare-fun m!7465 () Bool)

(assert (=> d!1353 m!7465))

(assert (=> d!1353 m!7389))

(declare-fun m!7467 () Bool)

(assert (=> b!11223 m!7467))

(assert (=> b!11167 d!1353))

(declare-fun d!1363 () Bool)

(declare-fun e!6630 () Bool)

(assert (=> d!1363 e!6630))

(declare-fun res!9400 () Bool)

(assert (=> d!1363 (=> (not res!9400) (not e!6630))))

(declare-fun lt!2829 () ListLongMap!353)

(declare-fun contains!156 (ListLongMap!353 (_ BitVec 64)) Bool)

(assert (=> d!1363 (= res!9400 (contains!156 lt!2829 (_1!186 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771)))))))

(declare-fun lt!2830 () List!338)

(assert (=> d!1363 (= lt!2829 (ListLongMap!354 lt!2830))))

(declare-fun lt!2828 () Unit!233)

(declare-fun lt!2831 () Unit!233)

(assert (=> d!1363 (= lt!2828 lt!2831)))

(declare-datatypes ((Option!31 0))(
  ( (Some!30 (v!1345 B!382)) (None!29) )
))
(declare-fun getValueByKey!25 (List!338 (_ BitVec 64)) Option!31)

(assert (=> d!1363 (= (getValueByKey!25 lt!2830 (_1!186 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771)))) (Some!30 (_2!186 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!9 (List!338 (_ BitVec 64) B!382) Unit!233)

(assert (=> d!1363 (= lt!2831 (lemmaContainsTupThenGetReturnValue!9 lt!2830 (_1!186 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771))) (_2!186 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771)))))))

(declare-fun insertStrictlySorted!9 (List!338 (_ BitVec 64) B!382) List!338)

(assert (=> d!1363 (= lt!2830 (insertStrictlySorted!9 (toList!192 lm!227) (_1!186 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771))) (_2!186 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771)))))))

(assert (=> d!1363 (= (+!24 lm!227 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771))) lt!2829)))

(declare-fun b!11248 () Bool)

(declare-fun res!9399 () Bool)

(assert (=> b!11248 (=> (not res!9399) (not e!6630))))

(assert (=> b!11248 (= res!9399 (= (getValueByKey!25 (toList!192 lt!2829) (_1!186 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771)))) (Some!30 (_2!186 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771))))))))

(declare-fun b!11249 () Bool)

(declare-fun contains!158 (List!338 tuple2!372) Bool)

(assert (=> b!11249 (= e!6630 (contains!158 (toList!192 lt!2829) (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771))))))

(assert (= (and d!1363 res!9400) b!11248))

(assert (= (and b!11248 res!9399) b!11249))

(declare-fun m!7515 () Bool)

(assert (=> d!1363 m!7515))

(declare-fun m!7521 () Bool)

(assert (=> d!1363 m!7521))

(declare-fun m!7527 () Bool)

(assert (=> d!1363 m!7527))

(declare-fun m!7531 () Bool)

(assert (=> d!1363 m!7531))

(declare-fun m!7533 () Bool)

(assert (=> b!11248 m!7533))

(declare-fun m!7535 () Bool)

(assert (=> b!11249 m!7535))

(assert (=> b!11167 d!1363))

(declare-fun d!1377 () Bool)

(declare-fun res!9403 () Bool)

(declare-fun e!6633 () Bool)

(assert (=> d!1377 (=> res!9403 e!6633)))

(assert (=> d!1377 (= res!9403 ((_ is Nil!335) (toList!192 (+!24 lm!227 lt!2771))))))

(assert (=> d!1377 (= (forall!57 (toList!192 (+!24 lm!227 lt!2771)) p!216) e!6633)))

(declare-fun b!11252 () Bool)

(declare-fun e!6634 () Bool)

(assert (=> b!11252 (= e!6633 e!6634)))

(declare-fun res!9404 () Bool)

(assert (=> b!11252 (=> (not res!9404) (not e!6634))))

(assert (=> b!11252 (= res!9404 (dynLambda!67 p!216 (h!900 (toList!192 (+!24 lm!227 lt!2771)))))))

(declare-fun b!11253 () Bool)

(assert (=> b!11253 (= e!6634 (forall!57 (t!2587 (toList!192 (+!24 lm!227 lt!2771))) p!216))))

(assert (= (and d!1377 (not res!9403)) b!11252))

(assert (= (and b!11252 res!9404) b!11253))

(declare-fun b_lambda!585 () Bool)

(assert (=> (not b_lambda!585) (not b!11252)))

(declare-fun t!2612 () Bool)

(declare-fun tb!271 () Bool)

(assert (=> (and start!1454 (= p!216 p!216) t!2612) tb!271))

(declare-fun result!433 () Bool)

(assert (=> tb!271 (= result!433 true)))

(assert (=> b!11252 t!2612))

(declare-fun b_and!727 () Bool)

(assert (= b_and!719 (and (=> t!2612 result!433) b_and!727)))

(declare-fun m!7541 () Bool)

(assert (=> b!11252 m!7541))

(declare-fun m!7543 () Bool)

(assert (=> b!11253 m!7543))

(assert (=> b!11167 d!1377))

(declare-fun d!1383 () Bool)

(assert (=> d!1383 (= (head!771 kvs!4) (h!900 kvs!4))))

(assert (=> b!11167 d!1383))

(declare-fun d!1389 () Bool)

(declare-fun res!9411 () Bool)

(declare-fun e!6641 () Bool)

(assert (=> d!1389 (=> res!9411 e!6641)))

(assert (=> d!1389 (= res!9411 ((_ is Nil!335) (toList!192 (+!24 lm!227 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771))))))))

(assert (=> d!1389 (= (forall!57 (toList!192 (+!24 lm!227 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771)))) p!216) e!6641)))

(declare-fun b!11260 () Bool)

(declare-fun e!6642 () Bool)

(assert (=> b!11260 (= e!6641 e!6642)))

(declare-fun res!9412 () Bool)

(assert (=> b!11260 (=> (not res!9412) (not e!6642))))

(assert (=> b!11260 (= res!9412 (dynLambda!67 p!216 (h!900 (toList!192 (+!24 lm!227 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771)))))))))

(declare-fun b!11261 () Bool)

(assert (=> b!11261 (= e!6642 (forall!57 (t!2587 (toList!192 (+!24 lm!227 (tuple2!373 (_1!186 lt!2771) (_2!186 lt!2771))))) p!216))))

(assert (= (and d!1389 (not res!9411)) b!11260))

(assert (= (and b!11260 res!9412) b!11261))

(declare-fun b_lambda!593 () Bool)

(assert (=> (not b_lambda!593) (not b!11260)))

(declare-fun t!2620 () Bool)

(declare-fun tb!279 () Bool)

(assert (=> (and start!1454 (= p!216 p!216) t!2620) tb!279))

(declare-fun result!441 () Bool)

(assert (=> tb!279 (= result!441 true)))

(assert (=> b!11260 t!2620))

(declare-fun b_and!735 () Bool)

(assert (= b_and!727 (and (=> t!2620 result!441) b_and!735)))

(declare-fun m!7557 () Bool)

(assert (=> b!11260 m!7557))

(declare-fun m!7559 () Bool)

(assert (=> b!11261 m!7559))

(assert (=> b!11167 d!1389))

(declare-fun d!1395 () Bool)

(declare-fun e!6643 () Bool)

(assert (=> d!1395 e!6643))

(declare-fun res!9414 () Bool)

(assert (=> d!1395 (=> (not res!9414) (not e!6643))))

(declare-fun lt!2833 () ListLongMap!353)

(assert (=> d!1395 (= res!9414 (contains!156 lt!2833 (_1!186 lt!2771)))))

(declare-fun lt!2834 () List!338)

(assert (=> d!1395 (= lt!2833 (ListLongMap!354 lt!2834))))

(declare-fun lt!2832 () Unit!233)

(declare-fun lt!2835 () Unit!233)

(assert (=> d!1395 (= lt!2832 lt!2835)))

(assert (=> d!1395 (= (getValueByKey!25 lt!2834 (_1!186 lt!2771)) (Some!30 (_2!186 lt!2771)))))

(assert (=> d!1395 (= lt!2835 (lemmaContainsTupThenGetReturnValue!9 lt!2834 (_1!186 lt!2771) (_2!186 lt!2771)))))

(assert (=> d!1395 (= lt!2834 (insertStrictlySorted!9 (toList!192 lm!227) (_1!186 lt!2771) (_2!186 lt!2771)))))

(assert (=> d!1395 (= (+!24 lm!227 lt!2771) lt!2833)))

(declare-fun b!11262 () Bool)

(declare-fun res!9413 () Bool)

(assert (=> b!11262 (=> (not res!9413) (not e!6643))))

(assert (=> b!11262 (= res!9413 (= (getValueByKey!25 (toList!192 lt!2833) (_1!186 lt!2771)) (Some!30 (_2!186 lt!2771))))))

(declare-fun b!11263 () Bool)

(assert (=> b!11263 (= e!6643 (contains!158 (toList!192 lt!2833) lt!2771))))

(assert (= (and d!1395 res!9414) b!11262))

(assert (= (and b!11262 res!9413) b!11263))

(declare-fun m!7561 () Bool)

(assert (=> d!1395 m!7561))

(declare-fun m!7563 () Bool)

(assert (=> d!1395 m!7563))

(declare-fun m!7565 () Bool)

(assert (=> d!1395 m!7565))

(declare-fun m!7567 () Bool)

(assert (=> d!1395 m!7567))

(declare-fun m!7569 () Bool)

(assert (=> b!11262 m!7569))

(declare-fun m!7571 () Bool)

(assert (=> b!11263 m!7571))

(assert (=> b!11167 d!1395))

(declare-fun b!11270 () Bool)

(declare-fun e!6648 () Bool)

(declare-fun tp!1841 () Bool)

(assert (=> b!11270 (= e!6648 (and tp_is_empty!555 tp!1841))))

(assert (=> b!11170 (= tp!1829 e!6648)))

(assert (= (and b!11170 ((_ is Cons!334) (t!2587 kvs!4))) b!11270))

(declare-fun b!11273 () Bool)

(declare-fun e!6651 () Bool)

(declare-fun tp!1842 () Bool)

(assert (=> b!11273 (= e!6651 (and tp_is_empty!555 tp!1842))))

(assert (=> b!11168 (= tp!1828 e!6651)))

(assert (= (and b!11168 ((_ is Cons!334) (toList!192 lm!227))) b!11273))

(declare-fun b_lambda!599 () Bool)

(assert (= b_lambda!569 (or (and start!1454 b_free!441) b_lambda!599)))

(declare-fun b_lambda!601 () Bool)

(assert (= b_lambda!577 (or (and start!1454 b_free!441) b_lambda!601)))

(declare-fun b_lambda!603 () Bool)

(assert (= b_lambda!585 (or (and start!1454 b_free!441) b_lambda!603)))

(declare-fun b_lambda!605 () Bool)

(assert (= b_lambda!563 (or (and start!1454 b_free!441) b_lambda!605)))

(declare-fun b_lambda!607 () Bool)

(assert (= b_lambda!567 (or (and start!1454 b_free!441) b_lambda!607)))

(declare-fun b_lambda!609 () Bool)

(assert (= b_lambda!593 (or (and start!1454 b_free!441) b_lambda!609)))

(check-sat (not b!11263) (not b!11262) (not b!11270) (not b!11253) (not b!11203) (not d!1395) (not b_lambda!599) b_and!735 (not b!11199) (not b!11261) (not b_lambda!605) (not b_lambda!603) (not b_lambda!609) (not b!11248) (not b_lambda!607) (not b_next!441) (not d!1363) (not d!1353) (not d!1343) (not b!11273) (not b!11205) tp_is_empty!555 (not b_lambda!601) (not b!11249))
(check-sat b_and!735 (not b_next!441))
