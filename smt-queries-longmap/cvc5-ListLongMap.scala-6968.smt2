; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88262 () Bool)

(assert start!88262)

(declare-fun b!1017413 () Bool)

(assert (=> b!1017413 true))

(assert (=> b!1017413 true))

(declare-fun b!1017409 () Bool)

(declare-fun res!682067 () Bool)

(declare-fun e!572439 () Bool)

(assert (=> b!1017409 (=> (not res!682067) (not e!572439))))

(declare-datatypes ((List!21498 0))(
  ( (Nil!21495) (Cons!21494 (h!22701 (_ BitVec 64)) (t!30491 List!21498)) )
))
(declare-fun keys!40 () List!21498)

(assert (=> b!1017409 (= res!682067 (not (is-Cons!21494 keys!40)))))

(declare-fun b!1017410 () Bool)

(declare-fun res!682063 () Bool)

(assert (=> b!1017410 (=> (not res!682063) (not e!572439))))

(declare-datatypes ((B!1518 0))(
  ( (B!1519 (val!11843 Int)) )
))
(declare-datatypes ((tuple2!15236 0))(
  ( (tuple2!15237 (_1!7629 (_ BitVec 64)) (_2!7629 B!1518)) )
))
(declare-datatypes ((List!21499 0))(
  ( (Nil!21496) (Cons!21495 (h!22702 tuple2!15236) (t!30492 List!21499)) )
))
(declare-fun l!1114 () List!21499)

(declare-fun isEmpty!877 (List!21499) Bool)

(assert (=> b!1017410 (= res!682063 (not (isEmpty!877 l!1114)))))

(declare-fun b!1017411 () Bool)

(declare-fun res!682066 () Bool)

(assert (=> b!1017411 (=> (not res!682066) (not e!572439))))

(declare-fun newHead!31 () tuple2!15236)

(declare-fun head!956 (List!21499) tuple2!15236)

(assert (=> b!1017411 (= res!682066 (bvslt (_1!7629 newHead!31) (_1!7629 (head!956 l!1114))))))

(declare-fun b!1017412 () Bool)

(declare-fun isStrictlySorted!599 (List!21499) Bool)

(assert (=> b!1017412 (= e!572439 (not (isStrictlySorted!599 (Cons!21495 newHead!31 l!1114))))))

(declare-fun res!682064 () Bool)

(assert (=> b!1017413 (=> (not res!682064) (not e!572439))))

(declare-fun lambda!998 () Int)

(declare-fun forall!275 (List!21498 Int) Bool)

(assert (=> b!1017413 (= res!682064 (forall!275 keys!40 lambda!998))))

(declare-fun res!682065 () Bool)

(assert (=> start!88262 (=> (not res!682065) (not e!572439))))

(assert (=> start!88262 (= res!682065 (isStrictlySorted!599 l!1114))))

(assert (=> start!88262 e!572439))

(declare-fun e!572438 () Bool)

(assert (=> start!88262 e!572438))

(assert (=> start!88262 true))

(declare-fun tp_is_empty!23585 () Bool)

(assert (=> start!88262 tp_is_empty!23585))

(declare-fun b!1017414 () Bool)

(declare-fun tp!70725 () Bool)

(assert (=> b!1017414 (= e!572438 (and tp_is_empty!23585 tp!70725))))

(assert (= (and start!88262 res!682065) b!1017410))

(assert (= (and b!1017410 res!682063) b!1017413))

(assert (= (and b!1017413 res!682064) b!1017411))

(assert (= (and b!1017411 res!682066) b!1017409))

(assert (= (and b!1017409 res!682067) b!1017412))

(assert (= (and start!88262 (is-Cons!21495 l!1114)) b!1017414))

(declare-fun m!939595 () Bool)

(assert (=> b!1017410 m!939595))

(declare-fun m!939597 () Bool)

(assert (=> b!1017412 m!939597))

(declare-fun m!939599 () Bool)

(assert (=> start!88262 m!939599))

(declare-fun m!939601 () Bool)

(assert (=> b!1017411 m!939601))

(declare-fun m!939603 () Bool)

(assert (=> b!1017413 m!939603))

(push 1)

(assert (not start!88262))

(assert (not b!1017411))

(assert (not b!1017414))

(assert (not b!1017413))

(assert (not b!1017412))

(assert tp_is_empty!23585)

(assert (not b!1017410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121597 () Bool)

(declare-fun res!682086 () Bool)

(declare-fun e!572460 () Bool)

(assert (=> d!121597 (=> res!682086 e!572460)))

(assert (=> d!121597 (= res!682086 (is-Nil!21495 keys!40))))

(assert (=> d!121597 (= (forall!275 keys!40 lambda!998) e!572460)))

(declare-fun b!1017441 () Bool)

(declare-fun e!572461 () Bool)

(assert (=> b!1017441 (= e!572460 e!572461)))

(declare-fun res!682087 () Bool)

(assert (=> b!1017441 (=> (not res!682087) (not e!572461))))

(declare-fun dynLambda!1932 (Int (_ BitVec 64)) Bool)

(assert (=> b!1017441 (= res!682087 (dynLambda!1932 lambda!998 (h!22701 keys!40)))))

(declare-fun b!1017442 () Bool)

(assert (=> b!1017442 (= e!572461 (forall!275 (t!30491 keys!40) lambda!998))))

(assert (= (and d!121597 (not res!682086)) b!1017441))

(assert (= (and b!1017441 res!682087) b!1017442))

(declare-fun b_lambda!15491 () Bool)

(assert (=> (not b_lambda!15491) (not b!1017441)))

(declare-fun m!939613 () Bool)

(assert (=> b!1017441 m!939613))

(declare-fun m!939615 () Bool)

(assert (=> b!1017442 m!939615))

(assert (=> b!1017413 d!121597))

(declare-fun d!121605 () Bool)

(declare-fun res!682106 () Bool)

(declare-fun e!572481 () Bool)

(assert (=> d!121605 (=> res!682106 e!572481)))

(assert (=> d!121605 (= res!682106 (or (is-Nil!21496 (Cons!21495 newHead!31 l!1114)) (is-Nil!21496 (t!30492 (Cons!21495 newHead!31 l!1114)))))))

(assert (=> d!121605 (= (isStrictlySorted!599 (Cons!21495 newHead!31 l!1114)) e!572481)))

(declare-fun b!1017462 () Bool)

(declare-fun e!572482 () Bool)

(assert (=> b!1017462 (= e!572481 e!572482)))

(declare-fun res!682107 () Bool)

(assert (=> b!1017462 (=> (not res!682107) (not e!572482))))

(assert (=> b!1017462 (= res!682107 (bvslt (_1!7629 (h!22702 (Cons!21495 newHead!31 l!1114))) (_1!7629 (h!22702 (t!30492 (Cons!21495 newHead!31 l!1114))))))))

(declare-fun b!1017463 () Bool)

(assert (=> b!1017463 (= e!572482 (isStrictlySorted!599 (t!30492 (Cons!21495 newHead!31 l!1114))))))

(assert (= (and d!121605 (not res!682106)) b!1017462))

(assert (= (and b!1017462 res!682107) b!1017463))

(declare-fun m!939627 () Bool)

(assert (=> b!1017463 m!939627))

(assert (=> b!1017412 d!121605))

(declare-fun d!121615 () Bool)

(assert (=> d!121615 (= (head!956 l!1114) (h!22702 l!1114))))

(assert (=> b!1017411 d!121615))

(declare-fun d!121619 () Bool)

(assert (=> d!121619 (= (isEmpty!877 l!1114) (is-Nil!21496 l!1114))))

(assert (=> b!1017410 d!121619))

(declare-fun d!121621 () Bool)

(declare-fun res!682108 () Bool)

(declare-fun e!572486 () Bool)

(assert (=> d!121621 (=> res!682108 e!572486)))

(assert (=> d!121621 (= res!682108 (or (is-Nil!21496 l!1114) (is-Nil!21496 (t!30492 l!1114))))))

(assert (=> d!121621 (= (isStrictlySorted!599 l!1114) e!572486)))

(declare-fun b!1017469 () Bool)

(declare-fun e!572487 () Bool)

(assert (=> b!1017469 (= e!572486 e!572487)))

(declare-fun res!682109 () Bool)

(assert (=> b!1017469 (=> (not res!682109) (not e!572487))))

(assert (=> b!1017469 (= res!682109 (bvslt (_1!7629 (h!22702 l!1114)) (_1!7629 (h!22702 (t!30492 l!1114)))))))

(declare-fun b!1017470 () Bool)

(assert (=> b!1017470 (= e!572487 (isStrictlySorted!599 (t!30492 l!1114)))))

(assert (= (and d!121621 (not res!682108)) b!1017469))

(assert (= (and b!1017469 res!682109) b!1017470))

(declare-fun m!939631 () Bool)

(assert (=> b!1017470 m!939631))

(assert (=> start!88262 d!121621))

(declare-fun b!1017475 () Bool)

(declare-fun e!572490 () Bool)

(declare-fun tp!70734 () Bool)

(assert (=> b!1017475 (= e!572490 (and tp_is_empty!23585 tp!70734))))

(assert (=> b!1017414 (= tp!70725 e!572490)))

(assert (= (and b!1017414 (is-Cons!21495 (t!30492 l!1114))) b!1017475))

(declare-fun b_lambda!15499 () Bool)

(assert (= b_lambda!15491 (or b!1017413 b_lambda!15499)))

(declare-fun bs!29521 () Bool)

(declare-fun d!121623 () Bool)

(assert (= bs!29521 (and d!121623 b!1017413)))

(declare-fun value!178 () B!1518)

(declare-datatypes ((Option!594 0))(
  ( (Some!593 (v!14444 B!1518)) (None!592) )
))
(declare-fun getValueByKey!543 (List!21499 (_ BitVec 64)) Option!594)

(assert (=> bs!29521 (= (dynLambda!1932 lambda!998 (h!22701 keys!40)) (= (getValueByKey!543 l!1114 (h!22701 keys!40)) (Some!593 value!178)))))

(declare-fun m!939633 () Bool)

(assert (=> bs!29521 m!939633))

(assert (=> b!1017441 d!121623))

(push 1)

(assert (not bs!29521))

(assert (not b!1017463))

(assert (not b!1017470))

(assert (not b_lambda!15499))

(assert tp_is_empty!23585)

(assert (not b!1017475))

(assert (not b!1017442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

