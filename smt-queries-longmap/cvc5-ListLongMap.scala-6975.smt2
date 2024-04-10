; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88366 () Bool)

(assert start!88366)

(declare-fun b!1017289 () Bool)

(assert (=> b!1017289 true))

(assert (=> b!1017289 true))

(declare-fun bs!29587 () Bool)

(declare-fun b!1017292 () Bool)

(assert (= bs!29587 (and b!1017292 b!1017289)))

(declare-fun lambda!1109 () Int)

(declare-datatypes ((B!1556 0))(
  ( (B!1557 (val!11862 Int)) )
))
(declare-datatypes ((tuple2!15270 0))(
  ( (tuple2!15271 (_1!7646 (_ BitVec 64)) (_2!7646 B!1556)) )
))
(declare-datatypes ((List!21547 0))(
  ( (Nil!21544) (Cons!21543 (h!22741 tuple2!15270) (t!30548 List!21547)) )
))
(declare-fun l!1114 () List!21547)

(declare-fun newHead!31 () tuple2!15270)

(declare-fun lambda!1108 () Int)

(assert (=> bs!29587 (= (= (Cons!21543 newHead!31 l!1114) l!1114) (= lambda!1109 lambda!1108))))

(assert (=> b!1017292 true))

(assert (=> b!1017292 true))

(assert (=> b!1017292 true))

(declare-fun b!1017288 () Bool)

(declare-fun res!682321 () Bool)

(declare-fun e!572337 () Bool)

(assert (=> b!1017288 (=> (not res!682321) (not e!572337))))

(declare-fun head!979 (List!21547) tuple2!15270)

(assert (=> b!1017288 (= res!682321 (bvslt (_1!7646 newHead!31) (_1!7646 (head!979 l!1114))))))

(declare-fun res!682319 () Bool)

(assert (=> b!1017289 (=> (not res!682319) (not e!572337))))

(declare-datatypes ((List!21548 0))(
  ( (Nil!21545) (Cons!21544 (h!22742 (_ BitVec 64)) (t!30549 List!21548)) )
))
(declare-fun keys!40 () List!21548)

(declare-fun forall!292 (List!21548 Int) Bool)

(assert (=> b!1017289 (= res!682319 (forall!292 keys!40 lambda!1108))))

(declare-fun b!1017291 () Bool)

(declare-fun e!572336 () Bool)

(declare-fun tp_is_empty!23623 () Bool)

(declare-fun tp!70846 () Bool)

(assert (=> b!1017291 (= e!572336 (and tp_is_empty!23623 tp!70846))))

(declare-fun res!682322 () Bool)

(assert (=> start!88366 (=> (not res!682322) (not e!572337))))

(declare-fun isStrictlySorted!630 (List!21547) Bool)

(assert (=> start!88366 (= res!682322 (isStrictlySorted!630 l!1114))))

(assert (=> start!88366 e!572337))

(assert (=> start!88366 e!572336))

(assert (=> start!88366 true))

(assert (=> start!88366 tp_is_empty!23623))

(declare-fun b!1017290 () Bool)

(declare-fun res!682318 () Bool)

(assert (=> b!1017290 (=> (not res!682318) (not e!572337))))

(assert (=> b!1017290 (= res!682318 (not (is-Cons!21544 keys!40)))))

(assert (=> b!1017292 (= e!572337 (not (forall!292 keys!40 lambda!1109)))))

(declare-fun b!1017293 () Bool)

(declare-fun res!682320 () Bool)

(assert (=> b!1017293 (=> (not res!682320) (not e!572337))))

(declare-fun isEmpty!904 (List!21547) Bool)

(assert (=> b!1017293 (= res!682320 (not (isEmpty!904 l!1114)))))

(assert (= (and start!88366 res!682322) b!1017293))

(assert (= (and b!1017293 res!682320) b!1017289))

(assert (= (and b!1017289 res!682319) b!1017288))

(assert (= (and b!1017288 res!682321) b!1017290))

(assert (= (and b!1017290 res!682318) b!1017292))

(assert (= (and start!88366 (is-Cons!21543 l!1114)) b!1017291))

(declare-fun m!938713 () Bool)

(assert (=> b!1017292 m!938713))

(declare-fun m!938715 () Bool)

(assert (=> start!88366 m!938715))

(declare-fun m!938717 () Bool)

(assert (=> b!1017289 m!938717))

(declare-fun m!938719 () Bool)

(assert (=> b!1017293 m!938719))

(declare-fun m!938721 () Bool)

(assert (=> b!1017288 m!938721))

(push 1)

(assert (not b!1017288))

(assert (not b!1017292))

(assert (not start!88366))

(assert tp_is_empty!23623)

(assert (not b!1017291))

(assert (not b!1017289))

(assert (not b!1017293))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121581 () Bool)

(declare-fun res!682371 () Bool)

(declare-fun e!572368 () Bool)

(assert (=> d!121581 (=> res!682371 e!572368)))

(assert (=> d!121581 (= res!682371 (is-Nil!21545 keys!40))))

(assert (=> d!121581 (= (forall!292 keys!40 lambda!1108) e!572368)))

(declare-fun b!1017366 () Bool)

(declare-fun e!572369 () Bool)

(assert (=> b!1017366 (= e!572368 e!572369)))

(declare-fun res!682372 () Bool)

(assert (=> b!1017366 (=> (not res!682372) (not e!572369))))

(declare-fun dynLambda!1928 (Int (_ BitVec 64)) Bool)

(assert (=> b!1017366 (= res!682372 (dynLambda!1928 lambda!1108 (h!22742 keys!40)))))

(declare-fun b!1017367 () Bool)

(assert (=> b!1017367 (= e!572369 (forall!292 (t!30549 keys!40) lambda!1108))))

(assert (= (and d!121581 (not res!682371)) b!1017366))

(assert (= (and b!1017366 res!682372) b!1017367))

(declare-fun b_lambda!15631 () Bool)

(assert (=> (not b_lambda!15631) (not b!1017366)))

(declare-fun m!938753 () Bool)

(assert (=> b!1017366 m!938753))

(declare-fun m!938755 () Bool)

(assert (=> b!1017367 m!938755))

(assert (=> b!1017289 d!121581))

(declare-fun d!121585 () Bool)

(assert (=> d!121585 (= (isEmpty!904 l!1114) (is-Nil!21544 l!1114))))

(assert (=> b!1017293 d!121585))

(declare-fun d!121587 () Bool)

(assert (=> d!121587 (= (head!979 l!1114) (h!22741 l!1114))))

(assert (=> b!1017288 d!121587))

(declare-fun d!121589 () Bool)

(declare-fun res!682383 () Bool)

(declare-fun e!572383 () Bool)

(assert (=> d!121589 (=> res!682383 e!572383)))

(assert (=> d!121589 (= res!682383 (or (is-Nil!21544 l!1114) (is-Nil!21544 (t!30548 l!1114))))))

(assert (=> d!121589 (= (isStrictlySorted!630 l!1114) e!572383)))

(declare-fun b!1017383 () Bool)

(declare-fun e!572384 () Bool)

(assert (=> b!1017383 (= e!572383 e!572384)))

(declare-fun res!682384 () Bool)

(assert (=> b!1017383 (=> (not res!682384) (not e!572384))))

(assert (=> b!1017383 (= res!682384 (bvslt (_1!7646 (h!22741 l!1114)) (_1!7646 (h!22741 (t!30548 l!1114)))))))

(declare-fun b!1017384 () Bool)

(assert (=> b!1017384 (= e!572384 (isStrictlySorted!630 (t!30548 l!1114)))))

(assert (= (and d!121589 (not res!682383)) b!1017383))

(assert (= (and b!1017383 res!682384) b!1017384))

(declare-fun m!938765 () Bool)

(assert (=> b!1017384 m!938765))

(assert (=> start!88366 d!121589))

(declare-fun d!121599 () Bool)

(declare-fun res!682385 () Bool)

(declare-fun e!572385 () Bool)

(assert (=> d!121599 (=> res!682385 e!572385)))

(assert (=> d!121599 (= res!682385 (is-Nil!21545 keys!40))))

(assert (=> d!121599 (= (forall!292 keys!40 lambda!1109) e!572385)))

(declare-fun b!1017385 () Bool)

(declare-fun e!572386 () Bool)

(assert (=> b!1017385 (= e!572385 e!572386)))

(declare-fun res!682386 () Bool)

(assert (=> b!1017385 (=> (not res!682386) (not e!572386))))

(assert (=> b!1017385 (= res!682386 (dynLambda!1928 lambda!1109 (h!22742 keys!40)))))

(declare-fun b!1017386 () Bool)

(assert (=> b!1017386 (= e!572386 (forall!292 (t!30549 keys!40) lambda!1109))))

(assert (= (and d!121599 (not res!682385)) b!1017385))

(assert (= (and b!1017385 res!682386) b!1017386))

(declare-fun b_lambda!15639 () Bool)

(assert (=> (not b_lambda!15639) (not b!1017385)))

(declare-fun m!938767 () Bool)

(assert (=> b!1017385 m!938767))

(declare-fun m!938769 () Bool)

(assert (=> b!1017386 m!938769))

(assert (=> b!1017292 d!121599))

(declare-fun b!1017391 () Bool)

(declare-fun e!572389 () Bool)

(declare-fun tp!70858 () Bool)

(assert (=> b!1017391 (= e!572389 (and tp_is_empty!23623 tp!70858))))

(assert (=> b!1017291 (= tp!70846 e!572389)))

(assert (= (and b!1017291 (is-Cons!21543 (t!30548 l!1114))) b!1017391))

(declare-fun b_lambda!15641 () Bool)

(assert (= b_lambda!15631 (or b!1017289 b_lambda!15641)))

(declare-fun bs!29592 () Bool)

(declare-fun d!121601 () Bool)

(assert (= bs!29592 (and d!121601 b!1017289)))

(declare-fun value!178 () B!1556)

(declare-datatypes ((Option!616 0))(
  ( (Some!615 (v!14466 B!1556)) (None!614) )
))
(declare-fun getValueByKey!565 (List!21547 (_ BitVec 64)) Option!616)

(assert (=> bs!29592 (= (dynLambda!1928 lambda!1108 (h!22742 keys!40)) (= (getValueByKey!565 l!1114 (h!22742 keys!40)) (Some!615 value!178)))))

(declare-fun m!938771 () Bool)

(assert (=> bs!29592 m!938771))

(assert (=> b!1017366 d!121601))

(declare-fun b_lambda!15643 () Bool)

(assert (= b_lambda!15639 (or b!1017292 b_lambda!15643)))

(declare-fun bs!29593 () Bool)

(declare-fun d!121603 () Bool)

(assert (= bs!29593 (and d!121603 b!1017292)))

(assert (=> bs!29593 (= (dynLambda!1928 lambda!1109 (h!22742 keys!40)) (= (getValueByKey!565 (Cons!21543 newHead!31 l!1114) (h!22742 keys!40)) (Some!615 value!178)))))

(declare-fun m!938773 () Bool)

(assert (=> bs!29593 m!938773))

(assert (=> b!1017385 d!121603))

(push 1)

