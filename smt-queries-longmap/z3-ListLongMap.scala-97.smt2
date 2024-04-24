; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1500 () Bool)

(assert start!1500)

(declare-fun b_free!445 () Bool)

(declare-fun b_next!445 () Bool)

(assert (=> start!1500 (= b_free!445 (not b_next!445))))

(declare-fun tp!1859 () Bool)

(declare-fun b_and!741 () Bool)

(assert (=> start!1500 (= tp!1859 b_and!741)))

(declare-fun b!11300 () Bool)

(declare-fun res!9433 () Bool)

(declare-fun e!6671 () Bool)

(assert (=> b!11300 (=> (not res!9433) (not e!6671))))

(declare-datatypes ((B!386 0))(
  ( (B!387 (val!288 Int)) )
))
(declare-datatypes ((tuple2!372 0))(
  ( (tuple2!373 (_1!186 (_ BitVec 64)) (_2!186 B!386)) )
))
(declare-datatypes ((List!336 0))(
  ( (Nil!333) (Cons!332 (h!898 tuple2!372) (t!2621 List!336)) )
))
(declare-fun kvs!4 () List!336)

(declare-fun isEmpty!66 (List!336) Bool)

(assert (=> b!11300 (= res!9433 (not (isEmpty!66 kvs!4)))))

(declare-fun b!11301 () Bool)

(declare-fun e!6669 () Bool)

(assert (=> b!11301 (= e!6671 (not e!6669))))

(declare-fun res!9432 () Bool)

(assert (=> b!11301 (=> res!9432 e!6669)))

(declare-fun lt!2843 () tuple2!372)

(declare-datatypes ((ListLongMap!353 0))(
  ( (ListLongMap!354 (toList!192 List!336)) )
))
(declare-fun lm!227 () ListLongMap!353)

(declare-fun p!216 () Int)

(declare-fun forall!59 (List!336 Int) Bool)

(declare-fun +!26 (ListLongMap!353 tuple2!372) ListLongMap!353)

(assert (=> b!11301 (= res!9432 (not (forall!59 (toList!192 (+!26 lm!227 lt!2843)) p!216)))))

(declare-fun lt!2842 () List!336)

(declare-fun tail!53 (List!336) List!336)

(assert (=> b!11301 (= lt!2842 (tail!53 kvs!4))))

(assert (=> b!11301 (forall!59 (toList!192 (+!26 lm!227 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843)))) p!216)))

(declare-datatypes ((Unit!247 0))(
  ( (Unit!248) )
))
(declare-fun lt!2844 () Unit!247)

(declare-fun addValidProp!14 (ListLongMap!353 Int (_ BitVec 64) B!386) Unit!247)

(assert (=> b!11301 (= lt!2844 (addValidProp!14 lm!227 p!216 (_1!186 lt!2843) (_2!186 lt!2843)))))

(declare-fun head!773 (List!336) tuple2!372)

(assert (=> b!11301 (= lt!2843 (head!773 kvs!4))))

(declare-fun b!11302 () Bool)

(declare-fun res!9430 () Bool)

(assert (=> b!11302 (=> (not res!9430) (not e!6671))))

(assert (=> b!11302 (= res!9430 (forall!59 kvs!4 p!216))))

(declare-fun b!11303 () Bool)

(declare-fun e!6668 () Bool)

(declare-fun tp_is_empty!559 () Bool)

(declare-fun tp!1857 () Bool)

(assert (=> b!11303 (= e!6668 (and tp_is_empty!559 tp!1857))))

(declare-fun b!11305 () Bool)

(declare-fun res!9431 () Bool)

(assert (=> b!11305 (=> res!9431 e!6669)))

(assert (=> b!11305 (= res!9431 (not (forall!59 lt!2842 p!216)))))

(declare-fun b!11306 () Bool)

(declare-fun ListPrimitiveSize!10 (List!336) Int)

(assert (=> b!11306 (= e!6669 (< (ListPrimitiveSize!10 lt!2842) (ListPrimitiveSize!10 kvs!4)))))

(declare-fun res!9429 () Bool)

(assert (=> start!1500 (=> (not res!9429) (not e!6671))))

(assert (=> start!1500 (= res!9429 (forall!59 (toList!192 lm!227) p!216))))

(assert (=> start!1500 e!6671))

(declare-fun e!6670 () Bool)

(declare-fun inv!558 (ListLongMap!353) Bool)

(assert (=> start!1500 (and (inv!558 lm!227) e!6670)))

(assert (=> start!1500 tp!1859))

(assert (=> start!1500 e!6668))

(declare-fun b!11304 () Bool)

(declare-fun tp!1858 () Bool)

(assert (=> b!11304 (= e!6670 tp!1858)))

(assert (= (and start!1500 res!9429) b!11302))

(assert (= (and b!11302 res!9430) b!11300))

(assert (= (and b!11300 res!9433) b!11301))

(assert (= (and b!11301 (not res!9432)) b!11305))

(assert (= (and b!11305 (not res!9431)) b!11306))

(assert (= start!1500 b!11304))

(get-info :version)

(assert (= (and start!1500 ((_ is Cons!332) kvs!4)) b!11303))

(declare-fun m!7579 () Bool)

(assert (=> b!11302 m!7579))

(declare-fun m!7581 () Bool)

(assert (=> b!11306 m!7581))

(declare-fun m!7583 () Bool)

(assert (=> b!11306 m!7583))

(declare-fun m!7585 () Bool)

(assert (=> b!11300 m!7585))

(declare-fun m!7587 () Bool)

(assert (=> b!11305 m!7587))

(declare-fun m!7589 () Bool)

(assert (=> start!1500 m!7589))

(declare-fun m!7591 () Bool)

(assert (=> start!1500 m!7591))

(declare-fun m!7593 () Bool)

(assert (=> b!11301 m!7593))

(declare-fun m!7595 () Bool)

(assert (=> b!11301 m!7595))

(declare-fun m!7597 () Bool)

(assert (=> b!11301 m!7597))

(declare-fun m!7599 () Bool)

(assert (=> b!11301 m!7599))

(declare-fun m!7601 () Bool)

(assert (=> b!11301 m!7601))

(declare-fun m!7603 () Bool)

(assert (=> b!11301 m!7603))

(declare-fun m!7605 () Bool)

(assert (=> b!11301 m!7605))

(check-sat (not b!11301) b_and!741 tp_is_empty!559 (not b!11305) (not start!1500) (not b_next!445) (not b!11300) (not b!11304) (not b!11306) (not b!11302) (not b!11303))
(check-sat b_and!741 (not b_next!445))
(get-model)

(declare-fun d!1407 () Bool)

(declare-fun res!9468 () Bool)

(declare-fun e!6700 () Bool)

(assert (=> d!1407 (=> res!9468 e!6700)))

(assert (=> d!1407 (= res!9468 ((_ is Nil!333) kvs!4))))

(assert (=> d!1407 (= (forall!59 kvs!4 p!216) e!6700)))

(declare-fun b!11353 () Bool)

(declare-fun e!6701 () Bool)

(assert (=> b!11353 (= e!6700 e!6701)))

(declare-fun res!9469 () Bool)

(assert (=> b!11353 (=> (not res!9469) (not e!6701))))

(declare-fun dynLambda!70 (Int tuple2!372) Bool)

(assert (=> b!11353 (= res!9469 (dynLambda!70 p!216 (h!898 kvs!4)))))

(declare-fun b!11354 () Bool)

(assert (=> b!11354 (= e!6701 (forall!59 (t!2621 kvs!4) p!216))))

(assert (= (and d!1407 (not res!9468)) b!11353))

(assert (= (and b!11353 res!9469) b!11354))

(declare-fun b_lambda!635 () Bool)

(assert (=> (not b_lambda!635) (not b!11353)))

(declare-fun t!2625 () Bool)

(declare-fun tb!285 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2625) tb!285))

(declare-fun result!453 () Bool)

(assert (=> tb!285 (= result!453 true)))

(assert (=> b!11353 t!2625))

(declare-fun b_and!747 () Bool)

(assert (= b_and!741 (and (=> t!2625 result!453) b_and!747)))

(declare-fun m!7663 () Bool)

(assert (=> b!11353 m!7663))

(declare-fun m!7665 () Bool)

(assert (=> b!11354 m!7665))

(assert (=> b!11302 d!1407))

(declare-fun d!1413 () Bool)

(declare-fun res!9474 () Bool)

(declare-fun e!6706 () Bool)

(assert (=> d!1413 (=> res!9474 e!6706)))

(assert (=> d!1413 (= res!9474 ((_ is Nil!333) (toList!192 lm!227)))))

(assert (=> d!1413 (= (forall!59 (toList!192 lm!227) p!216) e!6706)))

(declare-fun b!11359 () Bool)

(declare-fun e!6707 () Bool)

(assert (=> b!11359 (= e!6706 e!6707)))

(declare-fun res!9475 () Bool)

(assert (=> b!11359 (=> (not res!9475) (not e!6707))))

(assert (=> b!11359 (= res!9475 (dynLambda!70 p!216 (h!898 (toList!192 lm!227))))))

(declare-fun b!11360 () Bool)

(assert (=> b!11360 (= e!6707 (forall!59 (t!2621 (toList!192 lm!227)) p!216))))

(assert (= (and d!1413 (not res!9474)) b!11359))

(assert (= (and b!11359 res!9475) b!11360))

(declare-fun b_lambda!637 () Bool)

(assert (=> (not b_lambda!637) (not b!11359)))

(declare-fun t!2627 () Bool)

(declare-fun tb!287 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2627) tb!287))

(declare-fun result!455 () Bool)

(assert (=> tb!287 (= result!455 true)))

(assert (=> b!11359 t!2627))

(declare-fun b_and!749 () Bool)

(assert (= b_and!747 (and (=> t!2627 result!455) b_and!749)))

(declare-fun m!7667 () Bool)

(assert (=> b!11359 m!7667))

(declare-fun m!7669 () Bool)

(assert (=> b!11360 m!7669))

(assert (=> start!1500 d!1413))

(declare-fun d!1415 () Bool)

(declare-fun isStrictlySorted!36 (List!336) Bool)

(assert (=> d!1415 (= (inv!558 lm!227) (isStrictlySorted!36 (toList!192 lm!227)))))

(declare-fun bs!432 () Bool)

(assert (= bs!432 d!1415))

(declare-fun m!7675 () Bool)

(assert (=> bs!432 m!7675))

(assert (=> start!1500 d!1415))

(declare-fun d!1419 () Bool)

(declare-fun e!6719 () Bool)

(assert (=> d!1419 e!6719))

(declare-fun res!9493 () Bool)

(assert (=> d!1419 (=> (not res!9493) (not e!6719))))

(declare-fun lt!2886 () ListLongMap!353)

(declare-fun contains!158 (ListLongMap!353 (_ BitVec 64)) Bool)

(assert (=> d!1419 (= res!9493 (contains!158 lt!2886 (_1!186 lt!2843)))))

(declare-fun lt!2883 () List!336)

(assert (=> d!1419 (= lt!2886 (ListLongMap!354 lt!2883))))

(declare-fun lt!2885 () Unit!247)

(declare-fun lt!2884 () Unit!247)

(assert (=> d!1419 (= lt!2885 lt!2884)))

(declare-datatypes ((Option!33 0))(
  ( (Some!32 (v!1347 B!386)) (None!31) )
))
(declare-fun getValueByKey!27 (List!336 (_ BitVec 64)) Option!33)

(assert (=> d!1419 (= (getValueByKey!27 lt!2883 (_1!186 lt!2843)) (Some!32 (_2!186 lt!2843)))))

(declare-fun lemmaContainsTupThenGetReturnValue!10 (List!336 (_ BitVec 64) B!386) Unit!247)

(assert (=> d!1419 (= lt!2884 (lemmaContainsTupThenGetReturnValue!10 lt!2883 (_1!186 lt!2843) (_2!186 lt!2843)))))

(declare-fun insertStrictlySorted!10 (List!336 (_ BitVec 64) B!386) List!336)

(assert (=> d!1419 (= lt!2883 (insertStrictlySorted!10 (toList!192 lm!227) (_1!186 lt!2843) (_2!186 lt!2843)))))

(assert (=> d!1419 (= (+!26 lm!227 lt!2843) lt!2886)))

(declare-fun b!11377 () Bool)

(declare-fun res!9492 () Bool)

(assert (=> b!11377 (=> (not res!9492) (not e!6719))))

(assert (=> b!11377 (= res!9492 (= (getValueByKey!27 (toList!192 lt!2886) (_1!186 lt!2843)) (Some!32 (_2!186 lt!2843))))))

(declare-fun b!11378 () Bool)

(declare-fun contains!159 (List!336 tuple2!372) Bool)

(assert (=> b!11378 (= e!6719 (contains!159 (toList!192 lt!2886) lt!2843))))

(assert (= (and d!1419 res!9493) b!11377))

(assert (= (and b!11377 res!9492) b!11378))

(declare-fun m!7689 () Bool)

(assert (=> d!1419 m!7689))

(declare-fun m!7691 () Bool)

(assert (=> d!1419 m!7691))

(declare-fun m!7693 () Bool)

(assert (=> d!1419 m!7693))

(declare-fun m!7695 () Bool)

(assert (=> d!1419 m!7695))

(declare-fun m!7697 () Bool)

(assert (=> b!11377 m!7697))

(declare-fun m!7699 () Bool)

(assert (=> b!11378 m!7699))

(assert (=> b!11301 d!1419))

(declare-fun d!1427 () Bool)

(declare-fun res!9496 () Bool)

(declare-fun e!6722 () Bool)

(assert (=> d!1427 (=> res!9496 e!6722)))

(assert (=> d!1427 (= res!9496 ((_ is Nil!333) (toList!192 (+!26 lm!227 lt!2843))))))

(assert (=> d!1427 (= (forall!59 (toList!192 (+!26 lm!227 lt!2843)) p!216) e!6722)))

(declare-fun b!11381 () Bool)

(declare-fun e!6723 () Bool)

(assert (=> b!11381 (= e!6722 e!6723)))

(declare-fun res!9497 () Bool)

(assert (=> b!11381 (=> (not res!9497) (not e!6723))))

(assert (=> b!11381 (= res!9497 (dynLambda!70 p!216 (h!898 (toList!192 (+!26 lm!227 lt!2843)))))))

(declare-fun b!11382 () Bool)

(assert (=> b!11382 (= e!6723 (forall!59 (t!2621 (toList!192 (+!26 lm!227 lt!2843))) p!216))))

(assert (= (and d!1427 (not res!9496)) b!11381))

(assert (= (and b!11381 res!9497) b!11382))

(declare-fun b_lambda!643 () Bool)

(assert (=> (not b_lambda!643) (not b!11381)))

(declare-fun t!2633 () Bool)

(declare-fun tb!293 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2633) tb!293))

(declare-fun result!461 () Bool)

(assert (=> tb!293 (= result!461 true)))

(assert (=> b!11381 t!2633))

(declare-fun b_and!755 () Bool)

(assert (= b_and!749 (and (=> t!2633 result!461) b_and!755)))

(declare-fun m!7705 () Bool)

(assert (=> b!11381 m!7705))

(declare-fun m!7707 () Bool)

(assert (=> b!11382 m!7707))

(assert (=> b!11301 d!1427))

(declare-fun d!1431 () Bool)

(declare-fun e!6724 () Bool)

(assert (=> d!1431 e!6724))

(declare-fun res!9499 () Bool)

(assert (=> d!1431 (=> (not res!9499) (not e!6724))))

(declare-fun lt!2890 () ListLongMap!353)

(assert (=> d!1431 (= res!9499 (contains!158 lt!2890 (_1!186 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843)))))))

(declare-fun lt!2887 () List!336)

(assert (=> d!1431 (= lt!2890 (ListLongMap!354 lt!2887))))

(declare-fun lt!2889 () Unit!247)

(declare-fun lt!2888 () Unit!247)

(assert (=> d!1431 (= lt!2889 lt!2888)))

(assert (=> d!1431 (= (getValueByKey!27 lt!2887 (_1!186 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843)))) (Some!32 (_2!186 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843)))))))

(assert (=> d!1431 (= lt!2888 (lemmaContainsTupThenGetReturnValue!10 lt!2887 (_1!186 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843))) (_2!186 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843)))))))

(assert (=> d!1431 (= lt!2887 (insertStrictlySorted!10 (toList!192 lm!227) (_1!186 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843))) (_2!186 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843)))))))

(assert (=> d!1431 (= (+!26 lm!227 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843))) lt!2890)))

(declare-fun b!11383 () Bool)

(declare-fun res!9498 () Bool)

(assert (=> b!11383 (=> (not res!9498) (not e!6724))))

(assert (=> b!11383 (= res!9498 (= (getValueByKey!27 (toList!192 lt!2890) (_1!186 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843)))) (Some!32 (_2!186 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843))))))))

(declare-fun b!11384 () Bool)

(assert (=> b!11384 (= e!6724 (contains!159 (toList!192 lt!2890) (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843))))))

(assert (= (and d!1431 res!9499) b!11383))

(assert (= (and b!11383 res!9498) b!11384))

(declare-fun m!7709 () Bool)

(assert (=> d!1431 m!7709))

(declare-fun m!7711 () Bool)

(assert (=> d!1431 m!7711))

(declare-fun m!7713 () Bool)

(assert (=> d!1431 m!7713))

(declare-fun m!7715 () Bool)

(assert (=> d!1431 m!7715))

(declare-fun m!7717 () Bool)

(assert (=> b!11383 m!7717))

(declare-fun m!7719 () Bool)

(assert (=> b!11384 m!7719))

(assert (=> b!11301 d!1431))

(declare-fun d!1433 () Bool)

(assert (=> d!1433 (= (tail!53 kvs!4) (t!2621 kvs!4))))

(assert (=> b!11301 d!1433))

(declare-fun d!1435 () Bool)

(assert (=> d!1435 (forall!59 (toList!192 (+!26 lm!227 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843)))) p!216)))

(declare-fun lt!2900 () Unit!247)

(declare-fun choose!157 (ListLongMap!353 Int (_ BitVec 64) B!386) Unit!247)

(assert (=> d!1435 (= lt!2900 (choose!157 lm!227 p!216 (_1!186 lt!2843) (_2!186 lt!2843)))))

(declare-fun e!6737 () Bool)

(assert (=> d!1435 e!6737))

(declare-fun res!9513 () Bool)

(assert (=> d!1435 (=> (not res!9513) (not e!6737))))

(assert (=> d!1435 (= res!9513 (forall!59 (toList!192 lm!227) p!216))))

(assert (=> d!1435 (= (addValidProp!14 lm!227 p!216 (_1!186 lt!2843) (_2!186 lt!2843)) lt!2900)))

(declare-fun b!11400 () Bool)

(assert (=> b!11400 (= e!6737 (dynLambda!70 p!216 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843))))))

(assert (= (and d!1435 res!9513) b!11400))

(declare-fun b_lambda!653 () Bool)

(assert (=> (not b_lambda!653) (not b!11400)))

(declare-fun t!2643 () Bool)

(declare-fun tb!303 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2643) tb!303))

(declare-fun result!471 () Bool)

(assert (=> tb!303 (= result!471 true)))

(assert (=> b!11400 t!2643))

(declare-fun b_and!765 () Bool)

(assert (= b_and!755 (and (=> t!2643 result!471) b_and!765)))

(assert (=> d!1435 m!7603))

(assert (=> d!1435 m!7601))

(declare-fun m!7751 () Bool)

(assert (=> d!1435 m!7751))

(assert (=> d!1435 m!7589))

(declare-fun m!7753 () Bool)

(assert (=> b!11400 m!7753))

(assert (=> b!11301 d!1435))

(declare-fun d!1455 () Bool)

(assert (=> d!1455 (= (head!773 kvs!4) (h!898 kvs!4))))

(assert (=> b!11301 d!1455))

(declare-fun d!1459 () Bool)

(declare-fun res!9516 () Bool)

(declare-fun e!6740 () Bool)

(assert (=> d!1459 (=> res!9516 e!6740)))

(assert (=> d!1459 (= res!9516 ((_ is Nil!333) (toList!192 (+!26 lm!227 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843))))))))

(assert (=> d!1459 (= (forall!59 (toList!192 (+!26 lm!227 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843)))) p!216) e!6740)))

(declare-fun b!11403 () Bool)

(declare-fun e!6741 () Bool)

(assert (=> b!11403 (= e!6740 e!6741)))

(declare-fun res!9517 () Bool)

(assert (=> b!11403 (=> (not res!9517) (not e!6741))))

(assert (=> b!11403 (= res!9517 (dynLambda!70 p!216 (h!898 (toList!192 (+!26 lm!227 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843)))))))))

(declare-fun b!11404 () Bool)

(assert (=> b!11404 (= e!6741 (forall!59 (t!2621 (toList!192 (+!26 lm!227 (tuple2!373 (_1!186 lt!2843) (_2!186 lt!2843))))) p!216))))

(assert (= (and d!1459 (not res!9516)) b!11403))

(assert (= (and b!11403 res!9517) b!11404))

(declare-fun b_lambda!657 () Bool)

(assert (=> (not b_lambda!657) (not b!11403)))

(declare-fun t!2647 () Bool)

(declare-fun tb!307 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2647) tb!307))

(declare-fun result!475 () Bool)

(assert (=> tb!307 (= result!475 true)))

(assert (=> b!11403 t!2647))

(declare-fun b_and!769 () Bool)

(assert (= b_and!765 (and (=> t!2647 result!475) b_and!769)))

(declare-fun m!7759 () Bool)

(assert (=> b!11403 m!7759))

(declare-fun m!7761 () Bool)

(assert (=> b!11404 m!7761))

(assert (=> b!11301 d!1459))

(declare-fun d!1461 () Bool)

(declare-fun lt!2905 () Int)

(assert (=> d!1461 (>= lt!2905 0)))

(declare-fun e!6750 () Int)

(assert (=> d!1461 (= lt!2905 e!6750)))

(declare-fun c!956 () Bool)

(assert (=> d!1461 (= c!956 ((_ is Nil!333) lt!2842))))

(assert (=> d!1461 (= (ListPrimitiveSize!10 lt!2842) lt!2905)))

(declare-fun b!11416 () Bool)

(assert (=> b!11416 (= e!6750 0)))

(declare-fun b!11417 () Bool)

(assert (=> b!11417 (= e!6750 (+ 1 (ListPrimitiveSize!10 (t!2621 lt!2842))))))

(assert (= (and d!1461 c!956) b!11416))

(assert (= (and d!1461 (not c!956)) b!11417))

(declare-fun m!7773 () Bool)

(assert (=> b!11417 m!7773))

(assert (=> b!11306 d!1461))

(declare-fun d!1469 () Bool)

(declare-fun lt!2906 () Int)

(assert (=> d!1469 (>= lt!2906 0)))

(declare-fun e!6751 () Int)

(assert (=> d!1469 (= lt!2906 e!6751)))

(declare-fun c!957 () Bool)

(assert (=> d!1469 (= c!957 ((_ is Nil!333) kvs!4))))

(assert (=> d!1469 (= (ListPrimitiveSize!10 kvs!4) lt!2906)))

(declare-fun b!11418 () Bool)

(assert (=> b!11418 (= e!6751 0)))

(declare-fun b!11419 () Bool)

(assert (=> b!11419 (= e!6751 (+ 1 (ListPrimitiveSize!10 (t!2621 kvs!4))))))

(assert (= (and d!1469 c!957) b!11418))

(assert (= (and d!1469 (not c!957)) b!11419))

(declare-fun m!7775 () Bool)

(assert (=> b!11419 m!7775))

(assert (=> b!11306 d!1469))

(declare-fun d!1471 () Bool)

(assert (=> d!1471 (= (isEmpty!66 kvs!4) ((_ is Nil!333) kvs!4))))

(assert (=> b!11300 d!1471))

(declare-fun d!1473 () Bool)

(declare-fun res!9525 () Bool)

(declare-fun e!6755 () Bool)

(assert (=> d!1473 (=> res!9525 e!6755)))

(assert (=> d!1473 (= res!9525 ((_ is Nil!333) lt!2842))))

(assert (=> d!1473 (= (forall!59 lt!2842 p!216) e!6755)))

(declare-fun b!11425 () Bool)

(declare-fun e!6756 () Bool)

(assert (=> b!11425 (= e!6755 e!6756)))

(declare-fun res!9526 () Bool)

(assert (=> b!11425 (=> (not res!9526) (not e!6756))))

(assert (=> b!11425 (= res!9526 (dynLambda!70 p!216 (h!898 lt!2842)))))

(declare-fun b!11426 () Bool)

(assert (=> b!11426 (= e!6756 (forall!59 (t!2621 lt!2842) p!216))))

(assert (= (and d!1473 (not res!9525)) b!11425))

(assert (= (and b!11425 res!9526) b!11426))

(declare-fun b_lambda!665 () Bool)

(assert (=> (not b_lambda!665) (not b!11425)))

(declare-fun t!2655 () Bool)

(declare-fun tb!315 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2655) tb!315))

(declare-fun result!483 () Bool)

(assert (=> tb!315 (= result!483 true)))

(assert (=> b!11425 t!2655))

(declare-fun b_and!777 () Bool)

(assert (= b_and!769 (and (=> t!2655 result!483) b_and!777)))

(declare-fun m!7777 () Bool)

(assert (=> b!11425 m!7777))

(declare-fun m!7779 () Bool)

(assert (=> b!11426 m!7779))

(assert (=> b!11305 d!1473))

(declare-fun b!11435 () Bool)

(declare-fun e!6761 () Bool)

(declare-fun tp!1880 () Bool)

(assert (=> b!11435 (= e!6761 (and tp_is_empty!559 tp!1880))))

(assert (=> b!11304 (= tp!1858 e!6761)))

(assert (= (and b!11304 ((_ is Cons!332) (toList!192 lm!227))) b!11435))

(declare-fun b!11440 () Bool)

(declare-fun e!6764 () Bool)

(declare-fun tp!1883 () Bool)

(assert (=> b!11440 (= e!6764 (and tp_is_empty!559 tp!1883))))

(assert (=> b!11303 (= tp!1857 e!6764)))

(assert (= (and b!11303 ((_ is Cons!332) (t!2621 kvs!4))) b!11440))

(declare-fun b_lambda!667 () Bool)

(assert (= b_lambda!635 (or (and start!1500 b_free!445) b_lambda!667)))

(declare-fun b_lambda!669 () Bool)

(assert (= b_lambda!643 (or (and start!1500 b_free!445) b_lambda!669)))

(declare-fun b_lambda!671 () Bool)

(assert (= b_lambda!657 (or (and start!1500 b_free!445) b_lambda!671)))

(declare-fun b_lambda!673 () Bool)

(assert (= b_lambda!653 (or (and start!1500 b_free!445) b_lambda!673)))

(declare-fun b_lambda!675 () Bool)

(assert (= b_lambda!637 (or (and start!1500 b_free!445) b_lambda!675)))

(declare-fun b_lambda!677 () Bool)

(assert (= b_lambda!665 (or (and start!1500 b_free!445) b_lambda!677)))

(check-sat (not b_lambda!667) (not b!11417) (not b!11435) (not b_lambda!673) (not b!11404) tp_is_empty!559 (not b!11378) (not b_lambda!669) (not b_lambda!671) (not b!11377) (not b!11440) (not b!11419) (not b!11354) (not b!11384) (not d!1435) (not b!11383) (not b_lambda!677) (not d!1419) (not b_lambda!675) (not b_next!445) (not d!1431) (not d!1415) (not b!11382) (not b!11426) (not b!11360) b_and!777)
(check-sat b_and!777 (not b_next!445))
