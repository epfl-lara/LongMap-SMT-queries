; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88370 () Bool)

(assert start!88370)

(declare-fun b!1017337 () Bool)

(assert (=> b!1017337 true))

(assert (=> b!1017337 true))

(declare-fun bs!29589 () Bool)

(declare-fun b!1017339 () Bool)

(assert (= bs!29589 (and b!1017339 b!1017337)))

(declare-fun lambda!1121 () Int)

(declare-fun lambda!1120 () Int)

(declare-datatypes ((B!1560 0))(
  ( (B!1561 (val!11864 Int)) )
))
(declare-datatypes ((tuple2!15274 0))(
  ( (tuple2!15275 (_1!7648 (_ BitVec 64)) (_2!7648 B!1560)) )
))
(declare-datatypes ((List!21551 0))(
  ( (Nil!21548) (Cons!21547 (h!22745 tuple2!15274) (t!30552 List!21551)) )
))
(declare-fun l!1114 () List!21551)

(declare-fun newHead!31 () tuple2!15274)

(assert (=> bs!29589 (= (= (Cons!21547 newHead!31 l!1114) l!1114) (= lambda!1121 lambda!1120))))

(assert (=> b!1017339 true))

(assert (=> b!1017339 true))

(assert (=> b!1017339 true))

(declare-fun b!1017336 () Bool)

(declare-fun e!572348 () Bool)

(declare-fun tp_is_empty!23627 () Bool)

(declare-fun tp!70852 () Bool)

(assert (=> b!1017336 (= e!572348 (and tp_is_empty!23627 tp!70852))))

(declare-fun res!682348 () Bool)

(declare-fun e!572349 () Bool)

(assert (=> b!1017337 (=> (not res!682348) (not e!572349))))

(declare-datatypes ((List!21552 0))(
  ( (Nil!21549) (Cons!21548 (h!22746 (_ BitVec 64)) (t!30553 List!21552)) )
))
(declare-fun keys!40 () List!21552)

(declare-fun forall!294 (List!21552 Int) Bool)

(assert (=> b!1017337 (= res!682348 (forall!294 keys!40 lambda!1120))))

(declare-fun b!1017338 () Bool)

(declare-fun res!682350 () Bool)

(assert (=> b!1017338 (=> (not res!682350) (not e!572349))))

(declare-fun isEmpty!906 (List!21551) Bool)

(assert (=> b!1017338 (= res!682350 (not (isEmpty!906 l!1114)))))

(assert (=> b!1017339 (= e!572349 (not (forall!294 keys!40 lambda!1121)))))

(declare-fun res!682352 () Bool)

(assert (=> start!88370 (=> (not res!682352) (not e!572349))))

(declare-fun isStrictlySorted!632 (List!21551) Bool)

(assert (=> start!88370 (= res!682352 (isStrictlySorted!632 l!1114))))

(assert (=> start!88370 e!572349))

(assert (=> start!88370 e!572348))

(assert (=> start!88370 true))

(assert (=> start!88370 tp_is_empty!23627))

(declare-fun b!1017340 () Bool)

(declare-fun res!682351 () Bool)

(assert (=> b!1017340 (=> (not res!682351) (not e!572349))))

(assert (=> b!1017340 (= res!682351 (not (is-Cons!21548 keys!40)))))

(declare-fun b!1017341 () Bool)

(declare-fun res!682349 () Bool)

(assert (=> b!1017341 (=> (not res!682349) (not e!572349))))

(declare-fun head!981 (List!21551) tuple2!15274)

(assert (=> b!1017341 (= res!682349 (bvslt (_1!7648 newHead!31) (_1!7648 (head!981 l!1114))))))

(assert (= (and start!88370 res!682352) b!1017338))

(assert (= (and b!1017338 res!682350) b!1017337))

(assert (= (and b!1017337 res!682348) b!1017341))

(assert (= (and b!1017341 res!682349) b!1017340))

(assert (= (and b!1017340 res!682351) b!1017339))

(assert (= (and start!88370 (is-Cons!21547 l!1114)) b!1017336))

(declare-fun m!938733 () Bool)

(assert (=> b!1017339 m!938733))

(declare-fun m!938735 () Bool)

(assert (=> b!1017337 m!938735))

(declare-fun m!938737 () Bool)

(assert (=> b!1017341 m!938737))

(declare-fun m!938739 () Bool)

(assert (=> b!1017338 m!938739))

(declare-fun m!938741 () Bool)

(assert (=> start!88370 m!938741))

(push 1)

(assert (not start!88370))

(assert (not b!1017336))

(assert (not b!1017337))

(assert (not b!1017341))

(assert (not b!1017339))

(assert (not b!1017338))

(assert tp_is_empty!23627)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121583 () Bool)

(declare-fun res!682377 () Bool)

(declare-fun e!572377 () Bool)

(assert (=> d!121583 (=> res!682377 e!572377)))

(assert (=> d!121583 (= res!682377 (is-Nil!21549 keys!40))))

(assert (=> d!121583 (= (forall!294 keys!40 lambda!1120) e!572377)))

(declare-fun b!1017377 () Bool)

(declare-fun e!572378 () Bool)

(assert (=> b!1017377 (= e!572377 e!572378)))

(declare-fun res!682378 () Bool)

(assert (=> b!1017377 (=> (not res!682378) (not e!572378))))

(declare-fun dynLambda!1929 (Int (_ BitVec 64)) Bool)

(assert (=> b!1017377 (= res!682378 (dynLambda!1929 lambda!1120 (h!22746 keys!40)))))

(declare-fun b!1017378 () Bool)

(assert (=> b!1017378 (= e!572378 (forall!294 (t!30553 keys!40) lambda!1120))))

(assert (= (and d!121583 (not res!682377)) b!1017377))

(assert (= (and b!1017377 res!682378) b!1017378))

(declare-fun b_lambda!15637 () Bool)

(assert (=> (not b_lambda!15637) (not b!1017377)))

(declare-fun m!938761 () Bool)

(assert (=> b!1017377 m!938761))

(declare-fun m!938763 () Bool)

(assert (=> b!1017378 m!938763))

(assert (=> b!1017337 d!121583))

(declare-fun d!121595 () Bool)

(assert (=> d!121595 (= (head!981 l!1114) (h!22745 l!1114))))

(assert (=> b!1017341 d!121595))

(declare-fun d!121597 () Bool)

(declare-fun res!682391 () Bool)

(declare-fun e!572394 () Bool)

(assert (=> d!121597 (=> res!682391 e!572394)))

(assert (=> d!121597 (= res!682391 (or (is-Nil!21548 l!1114) (is-Nil!21548 (t!30552 l!1114))))))

(assert (=> d!121597 (= (isStrictlySorted!632 l!1114) e!572394)))

(declare-fun b!1017396 () Bool)

(declare-fun e!572395 () Bool)

(assert (=> b!1017396 (= e!572394 e!572395)))

(declare-fun res!682392 () Bool)

(assert (=> b!1017396 (=> (not res!682392) (not e!572395))))

(assert (=> b!1017396 (= res!682392 (bvslt (_1!7648 (h!22745 l!1114)) (_1!7648 (h!22745 (t!30552 l!1114)))))))

(declare-fun b!1017397 () Bool)

(assert (=> b!1017397 (= e!572395 (isStrictlySorted!632 (t!30552 l!1114)))))

(assert (= (and d!121597 (not res!682391)) b!1017396))

(assert (= (and b!1017396 res!682392) b!1017397))

(declare-fun m!938775 () Bool)

(assert (=> b!1017397 m!938775))

(assert (=> start!88370 d!121597))

(declare-fun d!121605 () Bool)

(assert (=> d!121605 (= (isEmpty!906 l!1114) (is-Nil!21548 l!1114))))

(assert (=> b!1017338 d!121605))

