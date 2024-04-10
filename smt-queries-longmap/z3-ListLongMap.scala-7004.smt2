; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88938 () Bool)

(assert start!88938)

(declare-fun b!1020409 () Bool)

(declare-fun e!574360 () Bool)

(declare-fun tp_is_empty!23799 () Bool)

(declare-fun tp!71257 () Bool)

(assert (=> b!1020409 (= e!574360 (and tp_is_empty!23799 tp!71257))))

(declare-fun b!1020410 () Bool)

(declare-fun res!683932 () Bool)

(declare-fun e!574362 () Bool)

(assert (=> b!1020410 (=> (not res!683932) (not e!574362))))

(declare-datatypes ((B!1732 0))(
  ( (B!1733 (val!11950 Int)) )
))
(declare-datatypes ((tuple2!15446 0))(
  ( (tuple2!15447 (_1!7734 (_ BitVec 64)) (_2!7734 B!1732)) )
))
(declare-datatypes ((List!21638 0))(
  ( (Nil!21635) (Cons!21634 (h!22832 tuple2!15446) (t!30648 List!21638)) )
))
(declare-fun l!1367 () List!21638)

(declare-fun lt!449856 () tuple2!15446)

(get-info :version)

(assert (=> b!1020410 (= res!683932 (and ((_ is Cons!21634) l!1367) (not (= (h!22832 l!1367) lt!449856))))))

(declare-fun b!1020411 () Bool)

(declare-fun e!574361 () Bool)

(assert (=> b!1020411 (= e!574361 e!574362)))

(declare-fun res!683931 () Bool)

(assert (=> b!1020411 (=> (not res!683931) (not e!574362))))

(declare-fun contains!5929 (List!21638 tuple2!15446) Bool)

(assert (=> b!1020411 (= res!683931 (contains!5929 l!1367 lt!449856))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1732)

(assert (=> b!1020411 (= lt!449856 (tuple2!15447 key!393 value!188))))

(declare-fun b!1020412 () Bool)

(declare-fun e!574359 () Bool)

(assert (=> b!1020412 (= e!574359 (not (contains!5929 (t!30648 l!1367) lt!449856)))))

(declare-fun res!683933 () Bool)

(assert (=> start!88938 (=> (not res!683933) (not e!574361))))

(declare-fun isStrictlySorted!703 (List!21638) Bool)

(assert (=> start!88938 (= res!683933 (isStrictlySorted!703 l!1367))))

(assert (=> start!88938 e!574361))

(assert (=> start!88938 e!574360))

(assert (=> start!88938 true))

(assert (=> start!88938 tp_is_empty!23799))

(declare-fun b!1020413 () Bool)

(assert (=> b!1020413 (= e!574362 e!574359)))

(declare-fun res!683930 () Bool)

(assert (=> b!1020413 (=> res!683930 e!574359)))

(assert (=> b!1020413 (= res!683930 (not (isStrictlySorted!703 (t!30648 l!1367))))))

(assert (= (and start!88938 res!683933) b!1020411))

(assert (= (and b!1020411 res!683931) b!1020410))

(assert (= (and b!1020410 res!683932) b!1020413))

(assert (= (and b!1020413 (not res!683930)) b!1020412))

(assert (= (and start!88938 ((_ is Cons!21634) l!1367)) b!1020409))

(declare-fun m!940359 () Bool)

(assert (=> b!1020411 m!940359))

(declare-fun m!940361 () Bool)

(assert (=> b!1020412 m!940361))

(declare-fun m!940363 () Bool)

(assert (=> start!88938 m!940363))

(declare-fun m!940365 () Bool)

(assert (=> b!1020413 m!940365))

(check-sat (not start!88938) (not b!1020411) (not b!1020409) (not b!1020412) tp_is_empty!23799 (not b!1020413))
(check-sat)
(get-model)

(declare-fun d!122349 () Bool)

(declare-fun res!683952 () Bool)

(declare-fun e!574381 () Bool)

(assert (=> d!122349 (=> res!683952 e!574381)))

(assert (=> d!122349 (= res!683952 (or ((_ is Nil!21635) l!1367) ((_ is Nil!21635) (t!30648 l!1367))))))

(assert (=> d!122349 (= (isStrictlySorted!703 l!1367) e!574381)))

(declare-fun b!1020433 () Bool)

(declare-fun e!574382 () Bool)

(assert (=> b!1020433 (= e!574381 e!574382)))

(declare-fun res!683953 () Bool)

(assert (=> b!1020433 (=> (not res!683953) (not e!574382))))

(assert (=> b!1020433 (= res!683953 (bvslt (_1!7734 (h!22832 l!1367)) (_1!7734 (h!22832 (t!30648 l!1367)))))))

(declare-fun b!1020434 () Bool)

(assert (=> b!1020434 (= e!574382 (isStrictlySorted!703 (t!30648 l!1367)))))

(assert (= (and d!122349 (not res!683952)) b!1020433))

(assert (= (and b!1020433 res!683953) b!1020434))

(assert (=> b!1020434 m!940365))

(assert (=> start!88938 d!122349))

(declare-fun d!122355 () Bool)

(declare-fun lt!449865 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!497 (List!21638) (InoxSet tuple2!15446))

(assert (=> d!122355 (= lt!449865 (select (content!497 (t!30648 l!1367)) lt!449856))))

(declare-fun e!574400 () Bool)

(assert (=> d!122355 (= lt!449865 e!574400)))

(declare-fun res!683971 () Bool)

(assert (=> d!122355 (=> (not res!683971) (not e!574400))))

(assert (=> d!122355 (= res!683971 ((_ is Cons!21634) (t!30648 l!1367)))))

(assert (=> d!122355 (= (contains!5929 (t!30648 l!1367) lt!449856) lt!449865)))

(declare-fun b!1020453 () Bool)

(declare-fun e!574399 () Bool)

(assert (=> b!1020453 (= e!574400 e!574399)))

(declare-fun res!683970 () Bool)

(assert (=> b!1020453 (=> res!683970 e!574399)))

(assert (=> b!1020453 (= res!683970 (= (h!22832 (t!30648 l!1367)) lt!449856))))

(declare-fun b!1020454 () Bool)

(assert (=> b!1020454 (= e!574399 (contains!5929 (t!30648 (t!30648 l!1367)) lt!449856))))

(assert (= (and d!122355 res!683971) b!1020453))

(assert (= (and b!1020453 (not res!683970)) b!1020454))

(declare-fun m!940381 () Bool)

(assert (=> d!122355 m!940381))

(declare-fun m!940383 () Bool)

(assert (=> d!122355 m!940383))

(declare-fun m!940385 () Bool)

(assert (=> b!1020454 m!940385))

(assert (=> b!1020412 d!122355))

(declare-fun d!122363 () Bool)

(declare-fun res!683976 () Bool)

(declare-fun e!574405 () Bool)

(assert (=> d!122363 (=> res!683976 e!574405)))

(assert (=> d!122363 (= res!683976 (or ((_ is Nil!21635) (t!30648 l!1367)) ((_ is Nil!21635) (t!30648 (t!30648 l!1367)))))))

(assert (=> d!122363 (= (isStrictlySorted!703 (t!30648 l!1367)) e!574405)))

(declare-fun b!1020459 () Bool)

(declare-fun e!574406 () Bool)

(assert (=> b!1020459 (= e!574405 e!574406)))

(declare-fun res!683977 () Bool)

(assert (=> b!1020459 (=> (not res!683977) (not e!574406))))

(assert (=> b!1020459 (= res!683977 (bvslt (_1!7734 (h!22832 (t!30648 l!1367))) (_1!7734 (h!22832 (t!30648 (t!30648 l!1367))))))))

(declare-fun b!1020460 () Bool)

(assert (=> b!1020460 (= e!574406 (isStrictlySorted!703 (t!30648 (t!30648 l!1367))))))

(assert (= (and d!122363 (not res!683976)) b!1020459))

(assert (= (and b!1020459 res!683977) b!1020460))

(declare-fun m!940387 () Bool)

(assert (=> b!1020460 m!940387))

(assert (=> b!1020413 d!122363))

(declare-fun d!122365 () Bool)

(declare-fun lt!449868 () Bool)

(assert (=> d!122365 (= lt!449868 (select (content!497 l!1367) lt!449856))))

(declare-fun e!574408 () Bool)

(assert (=> d!122365 (= lt!449868 e!574408)))

(declare-fun res!683979 () Bool)

(assert (=> d!122365 (=> (not res!683979) (not e!574408))))

(assert (=> d!122365 (= res!683979 ((_ is Cons!21634) l!1367))))

(assert (=> d!122365 (= (contains!5929 l!1367 lt!449856) lt!449868)))

(declare-fun b!1020461 () Bool)

(declare-fun e!574407 () Bool)

(assert (=> b!1020461 (= e!574408 e!574407)))

(declare-fun res!683978 () Bool)

(assert (=> b!1020461 (=> res!683978 e!574407)))

(assert (=> b!1020461 (= res!683978 (= (h!22832 l!1367) lt!449856))))

(declare-fun b!1020462 () Bool)

(assert (=> b!1020462 (= e!574407 (contains!5929 (t!30648 l!1367) lt!449856))))

(assert (= (and d!122365 res!683979) b!1020461))

(assert (= (and b!1020461 (not res!683978)) b!1020462))

(declare-fun m!940389 () Bool)

(assert (=> d!122365 m!940389))

(declare-fun m!940391 () Bool)

(assert (=> d!122365 m!940391))

(assert (=> b!1020462 m!940361))

(assert (=> b!1020411 d!122365))

(declare-fun b!1020473 () Bool)

(declare-fun e!574417 () Bool)

(declare-fun tp!71263 () Bool)

(assert (=> b!1020473 (= e!574417 (and tp_is_empty!23799 tp!71263))))

(assert (=> b!1020409 (= tp!71257 e!574417)))

(assert (= (and b!1020409 ((_ is Cons!21634) (t!30648 l!1367))) b!1020473))

(check-sat (not d!122365) (not b!1020454) tp_is_empty!23799 (not b!1020462) (not d!122355) (not b!1020460) (not b!1020434) (not b!1020473))
(check-sat)
