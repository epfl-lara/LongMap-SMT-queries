; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88956 () Bool)

(assert start!88956)

(declare-fun res!684019 () Bool)

(declare-fun e!574447 () Bool)

(assert (=> start!88956 (=> (not res!684019) (not e!574447))))

(declare-datatypes ((B!1738 0))(
  ( (B!1739 (val!11953 Int)) )
))
(declare-datatypes ((tuple2!15452 0))(
  ( (tuple2!15453 (_1!7737 (_ BitVec 64)) (_2!7737 B!1738)) )
))
(declare-datatypes ((List!21641 0))(
  ( (Nil!21638) (Cons!21637 (h!22835 tuple2!15452) (t!30651 List!21641)) )
))
(declare-fun l!1367 () List!21641)

(declare-fun isStrictlySorted!706 (List!21641) Bool)

(assert (=> start!88956 (= res!684019 (isStrictlySorted!706 l!1367))))

(assert (=> start!88956 e!574447))

(declare-fun e!574448 () Bool)

(assert (=> start!88956 e!574448))

(assert (=> start!88956 true))

(declare-fun tp_is_empty!23805 () Bool)

(assert (=> start!88956 tp_is_empty!23805))

(declare-fun b!1020522 () Bool)

(declare-fun res!684021 () Bool)

(declare-fun e!574449 () Bool)

(assert (=> b!1020522 (=> (not res!684021) (not e!574449))))

(assert (=> b!1020522 (= res!684021 (isStrictlySorted!706 (t!30651 l!1367)))))

(declare-fun b!1020523 () Bool)

(assert (=> b!1020523 (= e!574447 e!574449)))

(declare-fun res!684023 () Bool)

(assert (=> b!1020523 (=> (not res!684023) (not e!574449))))

(declare-fun lt!449877 () tuple2!15452)

(declare-fun contains!5932 (List!21641 tuple2!15452) Bool)

(assert (=> b!1020523 (= res!684023 (contains!5932 l!1367 lt!449877))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1738)

(assert (=> b!1020523 (= lt!449877 (tuple2!15453 key!393 value!188))))

(declare-fun b!1020524 () Bool)

(declare-fun tp!71275 () Bool)

(assert (=> b!1020524 (= e!574448 (and tp_is_empty!23805 tp!71275))))

(declare-fun b!1020525 () Bool)

(declare-fun res!684020 () Bool)

(assert (=> b!1020525 (=> (not res!684020) (not e!574449))))

(get-info :version)

(assert (=> b!1020525 (= res!684020 (and ((_ is Cons!21637) l!1367) (not (= (h!22835 l!1367) lt!449877))))))

(declare-fun b!1020526 () Bool)

(declare-fun ListPrimitiveSize!143 (List!21641) Int)

(assert (=> b!1020526 (= e!574449 (>= (ListPrimitiveSize!143 (t!30651 l!1367)) (ListPrimitiveSize!143 l!1367)))))

(declare-fun b!1020527 () Bool)

(declare-fun res!684022 () Bool)

(assert (=> b!1020527 (=> (not res!684022) (not e!574449))))

(assert (=> b!1020527 (= res!684022 (contains!5932 (t!30651 l!1367) lt!449877))))

(assert (= (and start!88956 res!684019) b!1020523))

(assert (= (and b!1020523 res!684023) b!1020525))

(assert (= (and b!1020525 res!684020) b!1020522))

(assert (= (and b!1020522 res!684021) b!1020527))

(assert (= (and b!1020527 res!684022) b!1020526))

(assert (= (and start!88956 ((_ is Cons!21637) l!1367)) b!1020524))

(declare-fun m!940423 () Bool)

(assert (=> b!1020526 m!940423))

(declare-fun m!940425 () Bool)

(assert (=> b!1020526 m!940425))

(declare-fun m!940427 () Bool)

(assert (=> start!88956 m!940427))

(declare-fun m!940429 () Bool)

(assert (=> b!1020523 m!940429))

(declare-fun m!940431 () Bool)

(assert (=> b!1020522 m!940431))

(declare-fun m!940433 () Bool)

(assert (=> b!1020527 m!940433))

(check-sat tp_is_empty!23805 (not b!1020523) (not b!1020526) (not b!1020522) (not start!88956) (not b!1020524) (not b!1020527))
(check-sat)
(get-model)

(declare-fun d!122377 () Bool)

(declare-fun res!684048 () Bool)

(declare-fun e!574467 () Bool)

(assert (=> d!122377 (=> res!684048 e!574467)))

(assert (=> d!122377 (= res!684048 (or ((_ is Nil!21638) l!1367) ((_ is Nil!21638) (t!30651 l!1367))))))

(assert (=> d!122377 (= (isStrictlySorted!706 l!1367) e!574467)))

(declare-fun b!1020554 () Bool)

(declare-fun e!574469 () Bool)

(assert (=> b!1020554 (= e!574467 e!574469)))

(declare-fun res!684049 () Bool)

(assert (=> b!1020554 (=> (not res!684049) (not e!574469))))

(assert (=> b!1020554 (= res!684049 (bvslt (_1!7737 (h!22835 l!1367)) (_1!7737 (h!22835 (t!30651 l!1367)))))))

(declare-fun b!1020556 () Bool)

(assert (=> b!1020556 (= e!574469 (isStrictlySorted!706 (t!30651 l!1367)))))

(assert (= (and d!122377 (not res!684048)) b!1020554))

(assert (= (and b!1020554 res!684049) b!1020556))

(assert (=> b!1020556 m!940431))

(assert (=> start!88956 d!122377))

(declare-fun d!122381 () Bool)

(declare-fun res!684051 () Bool)

(declare-fun e!574471 () Bool)

(assert (=> d!122381 (=> res!684051 e!574471)))

(assert (=> d!122381 (= res!684051 (or ((_ is Nil!21638) (t!30651 l!1367)) ((_ is Nil!21638) (t!30651 (t!30651 l!1367)))))))

(assert (=> d!122381 (= (isStrictlySorted!706 (t!30651 l!1367)) e!574471)))

(declare-fun b!1020558 () Bool)

(declare-fun e!574472 () Bool)

(assert (=> b!1020558 (= e!574471 e!574472)))

(declare-fun res!684052 () Bool)

(assert (=> b!1020558 (=> (not res!684052) (not e!574472))))

(assert (=> b!1020558 (= res!684052 (bvslt (_1!7737 (h!22835 (t!30651 l!1367))) (_1!7737 (h!22835 (t!30651 (t!30651 l!1367))))))))

(declare-fun b!1020559 () Bool)

(assert (=> b!1020559 (= e!574472 (isStrictlySorted!706 (t!30651 (t!30651 l!1367))))))

(assert (= (and d!122381 (not res!684051)) b!1020558))

(assert (= (and b!1020558 res!684052) b!1020559))

(declare-fun m!940451 () Bool)

(assert (=> b!1020559 m!940451))

(assert (=> b!1020522 d!122381))

(declare-fun d!122385 () Bool)

(declare-fun lt!449889 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!500 (List!21641) (InoxSet tuple2!15452))

(assert (=> d!122385 (= lt!449889 (select (content!500 l!1367) lt!449877))))

(declare-fun e!574495 () Bool)

(assert (=> d!122385 (= lt!449889 e!574495)))

(declare-fun res!684074 () Bool)

(assert (=> d!122385 (=> (not res!684074) (not e!574495))))

(assert (=> d!122385 (= res!684074 ((_ is Cons!21637) l!1367))))

(assert (=> d!122385 (= (contains!5932 l!1367 lt!449877) lt!449889)))

(declare-fun b!1020584 () Bool)

(declare-fun e!574496 () Bool)

(assert (=> b!1020584 (= e!574495 e!574496)))

(declare-fun res!684073 () Bool)

(assert (=> b!1020584 (=> res!684073 e!574496)))

(assert (=> b!1020584 (= res!684073 (= (h!22835 l!1367) lt!449877))))

(declare-fun b!1020585 () Bool)

(assert (=> b!1020585 (= e!574496 (contains!5932 (t!30651 l!1367) lt!449877))))

(assert (= (and d!122385 res!684074) b!1020584))

(assert (= (and b!1020584 (not res!684073)) b!1020585))

(declare-fun m!940461 () Bool)

(assert (=> d!122385 m!940461))

(declare-fun m!940463 () Bool)

(assert (=> d!122385 m!940463))

(assert (=> b!1020585 m!940433))

(assert (=> b!1020523 d!122385))

(declare-fun d!122395 () Bool)

(declare-fun lt!449898 () Int)

(assert (=> d!122395 (>= lt!449898 0)))

(declare-fun e!574505 () Int)

(assert (=> d!122395 (= lt!449898 e!574505)))

(declare-fun c!103512 () Bool)

(assert (=> d!122395 (= c!103512 ((_ is Nil!21638) (t!30651 l!1367)))))

(assert (=> d!122395 (= (ListPrimitiveSize!143 (t!30651 l!1367)) lt!449898)))

(declare-fun b!1020602 () Bool)

(assert (=> b!1020602 (= e!574505 0)))

(declare-fun b!1020603 () Bool)

(assert (=> b!1020603 (= e!574505 (+ 1 (ListPrimitiveSize!143 (t!30651 (t!30651 l!1367)))))))

(assert (= (and d!122395 c!103512) b!1020602))

(assert (= (and d!122395 (not c!103512)) b!1020603))

(declare-fun m!940469 () Bool)

(assert (=> b!1020603 m!940469))

(assert (=> b!1020526 d!122395))

(declare-fun d!122403 () Bool)

(declare-fun lt!449901 () Int)

(assert (=> d!122403 (>= lt!449901 0)))

(declare-fun e!574510 () Int)

(assert (=> d!122403 (= lt!449901 e!574510)))

(declare-fun c!103513 () Bool)

(assert (=> d!122403 (= c!103513 ((_ is Nil!21638) l!1367))))

(assert (=> d!122403 (= (ListPrimitiveSize!143 l!1367) lt!449901)))

(declare-fun b!1020610 () Bool)

(assert (=> b!1020610 (= e!574510 0)))

(declare-fun b!1020611 () Bool)

(assert (=> b!1020611 (= e!574510 (+ 1 (ListPrimitiveSize!143 (t!30651 l!1367))))))

(assert (= (and d!122403 c!103513) b!1020610))

(assert (= (and d!122403 (not c!103513)) b!1020611))

(assert (=> b!1020611 m!940423))

(assert (=> b!1020526 d!122403))

(declare-fun d!122405 () Bool)

(declare-fun lt!449902 () Bool)

(assert (=> d!122405 (= lt!449902 (select (content!500 (t!30651 l!1367)) lt!449877))))

(declare-fun e!574513 () Bool)

(assert (=> d!122405 (= lt!449902 e!574513)))

(declare-fun res!684080 () Bool)

(assert (=> d!122405 (=> (not res!684080) (not e!574513))))

(assert (=> d!122405 (= res!684080 ((_ is Cons!21637) (t!30651 l!1367)))))

(assert (=> d!122405 (= (contains!5932 (t!30651 l!1367) lt!449877) lt!449902)))

(declare-fun b!1020614 () Bool)

(declare-fun e!574514 () Bool)

(assert (=> b!1020614 (= e!574513 e!574514)))

(declare-fun res!684079 () Bool)

(assert (=> b!1020614 (=> res!684079 e!574514)))

(assert (=> b!1020614 (= res!684079 (= (h!22835 (t!30651 l!1367)) lt!449877))))

(declare-fun b!1020615 () Bool)

(assert (=> b!1020615 (= e!574514 (contains!5932 (t!30651 (t!30651 l!1367)) lt!449877))))

(assert (= (and d!122405 res!684080) b!1020614))

(assert (= (and b!1020614 (not res!684079)) b!1020615))

(declare-fun m!940471 () Bool)

(assert (=> d!122405 m!940471))

(declare-fun m!940473 () Bool)

(assert (=> d!122405 m!940473))

(declare-fun m!940475 () Bool)

(assert (=> b!1020615 m!940475))

(assert (=> b!1020527 d!122405))

(declare-fun b!1020621 () Bool)

(declare-fun e!574518 () Bool)

(declare-fun tp!71284 () Bool)

(assert (=> b!1020621 (= e!574518 (and tp_is_empty!23805 tp!71284))))

(assert (=> b!1020524 (= tp!71275 e!574518)))

(assert (= (and b!1020524 ((_ is Cons!21637) (t!30651 l!1367))) b!1020621))

(check-sat (not b!1020556) (not d!122405) (not b!1020611) (not b!1020615) tp_is_empty!23805 (not b!1020559) (not b!1020621) (not d!122385) (not b!1020603) (not b!1020585))
(check-sat)
