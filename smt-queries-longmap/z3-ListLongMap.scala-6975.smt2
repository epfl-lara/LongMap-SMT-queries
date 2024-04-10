; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88368 () Bool)

(assert start!88368)

(declare-fun b!1017314 () Bool)

(assert (=> b!1017314 true))

(assert (=> b!1017314 true))

(declare-fun bs!29588 () Bool)

(declare-fun b!1017317 () Bool)

(assert (= bs!29588 (and b!1017317 b!1017314)))

(declare-fun lambda!1114 () Int)

(declare-fun lambda!1115 () Int)

(declare-datatypes ((B!1558 0))(
  ( (B!1559 (val!11863 Int)) )
))
(declare-datatypes ((tuple2!15272 0))(
  ( (tuple2!15273 (_1!7647 (_ BitVec 64)) (_2!7647 B!1558)) )
))
(declare-datatypes ((List!21549 0))(
  ( (Nil!21546) (Cons!21545 (h!22743 tuple2!15272) (t!30550 List!21549)) )
))
(declare-fun l!1114 () List!21549)

(declare-fun newHead!31 () tuple2!15272)

(assert (=> bs!29588 (= (= (Cons!21545 newHead!31 l!1114) l!1114) (= lambda!1115 lambda!1114))))

(assert (=> b!1017317 true))

(assert (=> b!1017317 true))

(assert (=> b!1017317 true))

(declare-fun b!1017313 () Bool)

(declare-fun res!682337 () Bool)

(declare-fun e!572342 () Bool)

(assert (=> b!1017313 (=> (not res!682337) (not e!572342))))

(declare-datatypes ((List!21550 0))(
  ( (Nil!21547) (Cons!21546 (h!22744 (_ BitVec 64)) (t!30551 List!21550)) )
))
(declare-fun keys!40 () List!21550)

(get-info :version)

(assert (=> b!1017313 (= res!682337 (not ((_ is Cons!21546) keys!40)))))

(declare-fun res!682333 () Bool)

(assert (=> b!1017314 (=> (not res!682333) (not e!572342))))

(declare-fun forall!293 (List!21550 Int) Bool)

(assert (=> b!1017314 (= res!682333 (forall!293 keys!40 lambda!1114))))

(declare-fun b!1017315 () Bool)

(declare-fun res!682336 () Bool)

(assert (=> b!1017315 (=> (not res!682336) (not e!572342))))

(declare-fun isEmpty!905 (List!21549) Bool)

(assert (=> b!1017315 (= res!682336 (not (isEmpty!905 l!1114)))))

(declare-fun b!1017316 () Bool)

(declare-fun e!572343 () Bool)

(declare-fun tp_is_empty!23625 () Bool)

(declare-fun tp!70849 () Bool)

(assert (=> b!1017316 (= e!572343 (and tp_is_empty!23625 tp!70849))))

(assert (=> b!1017317 (= e!572342 (not (forall!293 keys!40 lambda!1115)))))

(declare-fun res!682335 () Bool)

(assert (=> start!88368 (=> (not res!682335) (not e!572342))))

(declare-fun isStrictlySorted!631 (List!21549) Bool)

(assert (=> start!88368 (= res!682335 (isStrictlySorted!631 l!1114))))

(assert (=> start!88368 e!572342))

(assert (=> start!88368 e!572343))

(assert (=> start!88368 true))

(assert (=> start!88368 tp_is_empty!23625))

(declare-fun b!1017312 () Bool)

(declare-fun res!682334 () Bool)

(assert (=> b!1017312 (=> (not res!682334) (not e!572342))))

(declare-fun head!980 (List!21549) tuple2!15272)

(assert (=> b!1017312 (= res!682334 (bvslt (_1!7647 newHead!31) (_1!7647 (head!980 l!1114))))))

(assert (= (and start!88368 res!682335) b!1017315))

(assert (= (and b!1017315 res!682336) b!1017314))

(assert (= (and b!1017314 res!682333) b!1017312))

(assert (= (and b!1017312 res!682334) b!1017313))

(assert (= (and b!1017313 res!682337) b!1017317))

(assert (= (and start!88368 ((_ is Cons!21545) l!1114)) b!1017316))

(declare-fun m!938723 () Bool)

(assert (=> start!88368 m!938723))

(declare-fun m!938725 () Bool)

(assert (=> b!1017317 m!938725))

(declare-fun m!938727 () Bool)

(assert (=> b!1017312 m!938727))

(declare-fun m!938729 () Bool)

(assert (=> b!1017314 m!938729))

(declare-fun m!938731 () Bool)

(assert (=> b!1017315 m!938731))

(check-sat tp_is_empty!23625 (not b!1017312) (not start!88368) (not b!1017316) (not b!1017317) (not b!1017315) (not b!1017314))
(check-sat)
(get-model)

(declare-fun d!121571 () Bool)

(declare-fun res!682357 () Bool)

(declare-fun e!572354 () Bool)

(assert (=> d!121571 (=> res!682357 e!572354)))

(assert (=> d!121571 (= res!682357 ((_ is Nil!21547) keys!40))))

(assert (=> d!121571 (= (forall!293 keys!40 lambda!1114) e!572354)))

(declare-fun b!1017352 () Bool)

(declare-fun e!572355 () Bool)

(assert (=> b!1017352 (= e!572354 e!572355)))

(declare-fun res!682358 () Bool)

(assert (=> b!1017352 (=> (not res!682358) (not e!572355))))

(declare-fun dynLambda!1927 (Int (_ BitVec 64)) Bool)

(assert (=> b!1017352 (= res!682358 (dynLambda!1927 lambda!1114 (h!22744 keys!40)))))

(declare-fun b!1017353 () Bool)

(assert (=> b!1017353 (= e!572355 (forall!293 (t!30551 keys!40) lambda!1114))))

(assert (= (and d!121571 (not res!682357)) b!1017352))

(assert (= (and b!1017352 res!682358) b!1017353))

(declare-fun b_lambda!15627 () Bool)

(assert (=> (not b_lambda!15627) (not b!1017352)))

(declare-fun m!938743 () Bool)

(assert (=> b!1017352 m!938743))

(declare-fun m!938745 () Bool)

(assert (=> b!1017353 m!938745))

(assert (=> b!1017314 d!121571))

(declare-fun d!121573 () Bool)

(assert (=> d!121573 (= (head!980 l!1114) (h!22743 l!1114))))

(assert (=> b!1017312 d!121573))

(declare-fun d!121575 () Bool)

(declare-fun res!682359 () Bool)

(declare-fun e!572356 () Bool)

(assert (=> d!121575 (=> res!682359 e!572356)))

(assert (=> d!121575 (= res!682359 ((_ is Nil!21547) keys!40))))

(assert (=> d!121575 (= (forall!293 keys!40 lambda!1115) e!572356)))

(declare-fun b!1017354 () Bool)

(declare-fun e!572357 () Bool)

(assert (=> b!1017354 (= e!572356 e!572357)))

(declare-fun res!682360 () Bool)

(assert (=> b!1017354 (=> (not res!682360) (not e!572357))))

(assert (=> b!1017354 (= res!682360 (dynLambda!1927 lambda!1115 (h!22744 keys!40)))))

(declare-fun b!1017355 () Bool)

(assert (=> b!1017355 (= e!572357 (forall!293 (t!30551 keys!40) lambda!1115))))

(assert (= (and d!121575 (not res!682359)) b!1017354))

(assert (= (and b!1017354 res!682360) b!1017355))

(declare-fun b_lambda!15629 () Bool)

(assert (=> (not b_lambda!15629) (not b!1017354)))

(declare-fun m!938747 () Bool)

(assert (=> b!1017354 m!938747))

(declare-fun m!938749 () Bool)

(assert (=> b!1017355 m!938749))

(assert (=> b!1017317 d!121575))

(declare-fun d!121577 () Bool)

(assert (=> d!121577 (= (isEmpty!905 l!1114) ((_ is Nil!21546) l!1114))))

(assert (=> b!1017315 d!121577))

(declare-fun d!121579 () Bool)

(declare-fun res!682369 () Bool)

(declare-fun e!572366 () Bool)

(assert (=> d!121579 (=> res!682369 e!572366)))

(assert (=> d!121579 (= res!682369 (or ((_ is Nil!21546) l!1114) ((_ is Nil!21546) (t!30550 l!1114))))))

(assert (=> d!121579 (= (isStrictlySorted!631 l!1114) e!572366)))

(declare-fun b!1017364 () Bool)

(declare-fun e!572367 () Bool)

(assert (=> b!1017364 (= e!572366 e!572367)))

(declare-fun res!682370 () Bool)

(assert (=> b!1017364 (=> (not res!682370) (not e!572367))))

(assert (=> b!1017364 (= res!682370 (bvslt (_1!7647 (h!22743 l!1114)) (_1!7647 (h!22743 (t!30550 l!1114)))))))

(declare-fun b!1017365 () Bool)

(assert (=> b!1017365 (= e!572367 (isStrictlySorted!631 (t!30550 l!1114)))))

(assert (= (and d!121579 (not res!682369)) b!1017364))

(assert (= (and b!1017364 res!682370) b!1017365))

(declare-fun m!938751 () Bool)

(assert (=> b!1017365 m!938751))

(assert (=> start!88368 d!121579))

(declare-fun b!1017376 () Bool)

(declare-fun e!572376 () Bool)

(declare-fun tp!70855 () Bool)

(assert (=> b!1017376 (= e!572376 (and tp_is_empty!23625 tp!70855))))

(assert (=> b!1017316 (= tp!70849 e!572376)))

(assert (= (and b!1017316 ((_ is Cons!21545) (t!30550 l!1114))) b!1017376))

(declare-fun b_lambda!15633 () Bool)

(assert (= b_lambda!15627 (or b!1017314 b_lambda!15633)))

(declare-fun bs!29590 () Bool)

(declare-fun d!121591 () Bool)

(assert (= bs!29590 (and d!121591 b!1017314)))

(declare-fun value!178 () B!1558)

(declare-datatypes ((Option!615 0))(
  ( (Some!614 (v!14465 B!1558)) (None!613) )
))
(declare-fun getValueByKey!564 (List!21549 (_ BitVec 64)) Option!615)

(assert (=> bs!29590 (= (dynLambda!1927 lambda!1114 (h!22744 keys!40)) (= (getValueByKey!564 l!1114 (h!22744 keys!40)) (Some!614 value!178)))))

(declare-fun m!938757 () Bool)

(assert (=> bs!29590 m!938757))

(assert (=> b!1017352 d!121591))

(declare-fun b_lambda!15635 () Bool)

(assert (= b_lambda!15629 (or b!1017317 b_lambda!15635)))

(declare-fun bs!29591 () Bool)

(declare-fun d!121593 () Bool)

(assert (= bs!29591 (and d!121593 b!1017317)))

(assert (=> bs!29591 (= (dynLambda!1927 lambda!1115 (h!22744 keys!40)) (= (getValueByKey!564 (Cons!21545 newHead!31 l!1114) (h!22744 keys!40)) (Some!614 value!178)))))

(declare-fun m!938759 () Bool)

(assert (=> bs!29591 m!938759))

(assert (=> b!1017354 d!121593))

(check-sat tp_is_empty!23625 (not b!1017353) (not bs!29591) (not b!1017376) (not b_lambda!15635) (not b!1017355) (not b!1017365) (not b_lambda!15633) (not bs!29590))
(check-sat)
