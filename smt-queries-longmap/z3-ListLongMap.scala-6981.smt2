; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88450 () Bool)

(assert start!88450)

(declare-fun b!1017474 () Bool)

(declare-fun e!572443 () Bool)

(declare-datatypes ((B!1592 0))(
  ( (B!1593 (val!11880 Int)) )
))
(declare-datatypes ((tuple2!15386 0))(
  ( (tuple2!15387 (_1!7704 (_ BitVec 64)) (_2!7704 B!1592)) )
))
(declare-datatypes ((List!21603 0))(
  ( (Nil!21600) (Cons!21599 (h!22797 tuple2!15386) (t!30595 List!21603)) )
))
(declare-fun l!1036 () List!21603)

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!625 0))(
  ( (Some!624 (v!14472 B!1592)) (None!623) )
))
(declare-fun isDefined!422 (Option!625) Bool)

(declare-fun getValueByKey!574 (List!21603 (_ BitVec 64)) Option!625)

(assert (=> b!1017474 (= e!572443 (not (isDefined!422 (getValueByKey!574 (t!30595 l!1036) key!271))))))

(declare-fun b!1017475 () Bool)

(declare-fun res!682421 () Bool)

(declare-fun e!572445 () Bool)

(assert (=> b!1017475 (=> (not res!682421) (not e!572445))))

(get-info :version)

(assert (=> b!1017475 (= res!682421 (and ((_ is Cons!21599) l!1036) (not (= (_1!7704 (h!22797 l!1036)) key!271))))))

(declare-fun res!682423 () Bool)

(assert (=> start!88450 (=> (not res!682423) (not e!572445))))

(declare-fun isStrictlySorted!635 (List!21603) Bool)

(assert (=> start!88450 (= res!682423 (isStrictlySorted!635 l!1036))))

(assert (=> start!88450 e!572445))

(declare-fun e!572444 () Bool)

(assert (=> start!88450 e!572444))

(assert (=> start!88450 true))

(declare-fun b!1017476 () Bool)

(declare-fun tp_is_empty!23659 () Bool)

(declare-fun tp!70919 () Bool)

(assert (=> b!1017476 (= e!572444 (and tp_is_empty!23659 tp!70919))))

(declare-fun b!1017477 () Bool)

(assert (=> b!1017477 (= e!572445 e!572443)))

(declare-fun res!682424 () Bool)

(assert (=> b!1017477 (=> res!682424 e!572443)))

(assert (=> b!1017477 (= res!682424 (not (isStrictlySorted!635 (t!30595 l!1036))))))

(declare-fun b!1017478 () Bool)

(declare-fun res!682422 () Bool)

(assert (=> b!1017478 (=> (not res!682422) (not e!572445))))

(assert (=> b!1017478 (= res!682422 (isDefined!422 (getValueByKey!574 l!1036 key!271)))))

(assert (= (and start!88450 res!682423) b!1017478))

(assert (= (and b!1017478 res!682422) b!1017475))

(assert (= (and b!1017475 res!682421) b!1017477))

(assert (= (and b!1017477 (not res!682424)) b!1017474))

(assert (= (and start!88450 ((_ is Cons!21599) l!1036)) b!1017476))

(declare-fun m!938269 () Bool)

(assert (=> b!1017474 m!938269))

(assert (=> b!1017474 m!938269))

(declare-fun m!938271 () Bool)

(assert (=> b!1017474 m!938271))

(declare-fun m!938273 () Bool)

(assert (=> start!88450 m!938273))

(declare-fun m!938275 () Bool)

(assert (=> b!1017477 m!938275))

(declare-fun m!938277 () Bool)

(assert (=> b!1017478 m!938277))

(assert (=> b!1017478 m!938277))

(declare-fun m!938279 () Bool)

(assert (=> b!1017478 m!938279))

(check-sat (not b!1017478) (not start!88450) (not b!1017476) (not b!1017477) tp_is_empty!23659 (not b!1017474))
(check-sat)
(get-model)

(declare-fun d!121507 () Bool)

(declare-fun isEmpty!915 (Option!625) Bool)

(assert (=> d!121507 (= (isDefined!422 (getValueByKey!574 (t!30595 l!1036) key!271)) (not (isEmpty!915 (getValueByKey!574 (t!30595 l!1036) key!271))))))

(declare-fun bs!29588 () Bool)

(assert (= bs!29588 d!121507))

(assert (=> bs!29588 m!938269))

(declare-fun m!938305 () Bool)

(assert (=> bs!29588 m!938305))

(assert (=> b!1017474 d!121507))

(declare-fun b!1017519 () Bool)

(declare-fun e!572472 () Option!625)

(assert (=> b!1017519 (= e!572472 (Some!624 (_2!7704 (h!22797 (t!30595 l!1036)))))))

(declare-fun b!1017521 () Bool)

(declare-fun e!572473 () Option!625)

(assert (=> b!1017521 (= e!572473 (getValueByKey!574 (t!30595 (t!30595 l!1036)) key!271))))

(declare-fun b!1017522 () Bool)

(assert (=> b!1017522 (= e!572473 None!623)))

(declare-fun d!121509 () Bool)

(declare-fun c!103004 () Bool)

(assert (=> d!121509 (= c!103004 (and ((_ is Cons!21599) (t!30595 l!1036)) (= (_1!7704 (h!22797 (t!30595 l!1036))) key!271)))))

(assert (=> d!121509 (= (getValueByKey!574 (t!30595 l!1036) key!271) e!572472)))

(declare-fun b!1017520 () Bool)

(assert (=> b!1017520 (= e!572472 e!572473)))

(declare-fun c!103005 () Bool)

(assert (=> b!1017520 (= c!103005 (and ((_ is Cons!21599) (t!30595 l!1036)) (not (= (_1!7704 (h!22797 (t!30595 l!1036))) key!271))))))

(assert (= (and d!121509 c!103004) b!1017519))

(assert (= (and d!121509 (not c!103004)) b!1017520))

(assert (= (and b!1017520 c!103005) b!1017521))

(assert (= (and b!1017520 (not c!103005)) b!1017522))

(declare-fun m!938309 () Bool)

(assert (=> b!1017521 m!938309))

(assert (=> b!1017474 d!121509))

(declare-fun d!121517 () Bool)

(declare-fun res!682459 () Bool)

(declare-fun e!572484 () Bool)

(assert (=> d!121517 (=> res!682459 e!572484)))

(assert (=> d!121517 (= res!682459 (or ((_ is Nil!21600) l!1036) ((_ is Nil!21600) (t!30595 l!1036))))))

(assert (=> d!121517 (= (isStrictlySorted!635 l!1036) e!572484)))

(declare-fun b!1017539 () Bool)

(declare-fun e!572485 () Bool)

(assert (=> b!1017539 (= e!572484 e!572485)))

(declare-fun res!682460 () Bool)

(assert (=> b!1017539 (=> (not res!682460) (not e!572485))))

(assert (=> b!1017539 (= res!682460 (bvslt (_1!7704 (h!22797 l!1036)) (_1!7704 (h!22797 (t!30595 l!1036)))))))

(declare-fun b!1017540 () Bool)

(assert (=> b!1017540 (= e!572485 (isStrictlySorted!635 (t!30595 l!1036)))))

(assert (= (and d!121517 (not res!682459)) b!1017539))

(assert (= (and b!1017539 res!682460) b!1017540))

(assert (=> b!1017540 m!938275))

(assert (=> start!88450 d!121517))

(declare-fun d!121523 () Bool)

(assert (=> d!121523 (= (isDefined!422 (getValueByKey!574 l!1036 key!271)) (not (isEmpty!915 (getValueByKey!574 l!1036 key!271))))))

(declare-fun bs!29591 () Bool)

(assert (= bs!29591 d!121523))

(assert (=> bs!29591 m!938277))

(declare-fun m!938313 () Bool)

(assert (=> bs!29591 m!938313))

(assert (=> b!1017478 d!121523))

(declare-fun b!1017541 () Bool)

(declare-fun e!572486 () Option!625)

(assert (=> b!1017541 (= e!572486 (Some!624 (_2!7704 (h!22797 l!1036))))))

(declare-fun b!1017543 () Bool)

(declare-fun e!572487 () Option!625)

(assert (=> b!1017543 (= e!572487 (getValueByKey!574 (t!30595 l!1036) key!271))))

(declare-fun b!1017544 () Bool)

(assert (=> b!1017544 (= e!572487 None!623)))

(declare-fun d!121525 () Bool)

(declare-fun c!103010 () Bool)

(assert (=> d!121525 (= c!103010 (and ((_ is Cons!21599) l!1036) (= (_1!7704 (h!22797 l!1036)) key!271)))))

(assert (=> d!121525 (= (getValueByKey!574 l!1036 key!271) e!572486)))

(declare-fun b!1017542 () Bool)

(assert (=> b!1017542 (= e!572486 e!572487)))

(declare-fun c!103011 () Bool)

(assert (=> b!1017542 (= c!103011 (and ((_ is Cons!21599) l!1036) (not (= (_1!7704 (h!22797 l!1036)) key!271))))))

(assert (= (and d!121525 c!103010) b!1017541))

(assert (= (and d!121525 (not c!103010)) b!1017542))

(assert (= (and b!1017542 c!103011) b!1017543))

(assert (= (and b!1017542 (not c!103011)) b!1017544))

(assert (=> b!1017543 m!938269))

(assert (=> b!1017478 d!121525))

(declare-fun d!121527 () Bool)

(declare-fun res!682461 () Bool)

(declare-fun e!572493 () Bool)

(assert (=> d!121527 (=> res!682461 e!572493)))

(assert (=> d!121527 (= res!682461 (or ((_ is Nil!21600) (t!30595 l!1036)) ((_ is Nil!21600) (t!30595 (t!30595 l!1036)))))))

(assert (=> d!121527 (= (isStrictlySorted!635 (t!30595 l!1036)) e!572493)))

(declare-fun b!1017557 () Bool)

(declare-fun e!572495 () Bool)

(assert (=> b!1017557 (= e!572493 e!572495)))

(declare-fun res!682462 () Bool)

(assert (=> b!1017557 (=> (not res!682462) (not e!572495))))

(assert (=> b!1017557 (= res!682462 (bvslt (_1!7704 (h!22797 (t!30595 l!1036))) (_1!7704 (h!22797 (t!30595 (t!30595 l!1036))))))))

(declare-fun b!1017558 () Bool)

(assert (=> b!1017558 (= e!572495 (isStrictlySorted!635 (t!30595 (t!30595 l!1036))))))

(assert (= (and d!121527 (not res!682461)) b!1017557))

(assert (= (and b!1017557 res!682462) b!1017558))

(declare-fun m!938317 () Bool)

(assert (=> b!1017558 m!938317))

(assert (=> b!1017477 d!121527))

(declare-fun b!1017563 () Bool)

(declare-fun e!572498 () Bool)

(declare-fun tp!70928 () Bool)

(assert (=> b!1017563 (= e!572498 (and tp_is_empty!23659 tp!70928))))

(assert (=> b!1017476 (= tp!70919 e!572498)))

(assert (= (and b!1017476 ((_ is Cons!21599) (t!30595 l!1036))) b!1017563))

(check-sat (not b!1017558) (not b!1017543) (not d!121507) (not b!1017563) tp_is_empty!23659 (not d!121523) (not b!1017521) (not b!1017540))
(check-sat)
