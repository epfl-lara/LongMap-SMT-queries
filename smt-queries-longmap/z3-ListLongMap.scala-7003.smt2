; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88914 () Bool)

(assert start!88914)

(declare-fun res!683867 () Bool)

(declare-fun e!574278 () Bool)

(assert (=> start!88914 (=> (not res!683867) (not e!574278))))

(declare-datatypes ((B!1726 0))(
  ( (B!1727 (val!11947 Int)) )
))
(declare-datatypes ((tuple2!15440 0))(
  ( (tuple2!15441 (_1!7731 (_ BitVec 64)) (_2!7731 B!1726)) )
))
(declare-datatypes ((List!21635 0))(
  ( (Nil!21632) (Cons!21631 (h!22829 tuple2!15440) (t!30645 List!21635)) )
))
(declare-fun l!1367 () List!21635)

(declare-fun isStrictlySorted!700 (List!21635) Bool)

(assert (=> start!88914 (= res!683867 (isStrictlySorted!700 l!1367))))

(assert (=> start!88914 e!574278))

(declare-fun e!574277 () Bool)

(assert (=> start!88914 e!574277))

(assert (=> start!88914 true))

(declare-fun tp_is_empty!23793 () Bool)

(assert (=> start!88914 tp_is_empty!23793))

(declare-fun b!1020303 () Bool)

(declare-fun res!683866 () Bool)

(assert (=> b!1020303 (=> (not res!683866) (not e!574278))))

(declare-fun value!188 () B!1726)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun contains!5926 (List!21635 tuple2!15440) Bool)

(assert (=> b!1020303 (= res!683866 (contains!5926 l!1367 (tuple2!15441 key!393 value!188)))))

(declare-fun b!1020304 () Bool)

(declare-fun ListPrimitiveSize!140 (List!21635) Int)

(assert (=> b!1020304 (= e!574278 (< (ListPrimitiveSize!140 l!1367) 0))))

(declare-fun b!1020305 () Bool)

(declare-fun tp!71239 () Bool)

(assert (=> b!1020305 (= e!574277 (and tp_is_empty!23793 tp!71239))))

(assert (= (and start!88914 res!683867) b!1020303))

(assert (= (and b!1020303 res!683866) b!1020304))

(get-info :version)

(assert (= (and start!88914 ((_ is Cons!21631) l!1367)) b!1020305))

(declare-fun m!940309 () Bool)

(assert (=> start!88914 m!940309))

(declare-fun m!940311 () Bool)

(assert (=> b!1020303 m!940311))

(declare-fun m!940313 () Bool)

(assert (=> b!1020304 m!940313))

(check-sat (not start!88914) (not b!1020303) tp_is_empty!23793 (not b!1020305) (not b!1020304))
(check-sat)
(get-model)

(declare-fun d!122331 () Bool)

(declare-fun lt!449835 () Int)

(assert (=> d!122331 (>= lt!449835 0)))

(declare-fun e!574293 () Int)

(assert (=> d!122331 (= lt!449835 e!574293)))

(declare-fun c!103495 () Bool)

(assert (=> d!122331 (= c!103495 ((_ is Nil!21632) l!1367))))

(assert (=> d!122331 (= (ListPrimitiveSize!140 l!1367) lt!449835)))

(declare-fun b!1020325 () Bool)

(assert (=> b!1020325 (= e!574293 0)))

(declare-fun b!1020326 () Bool)

(assert (=> b!1020326 (= e!574293 (+ 1 (ListPrimitiveSize!140 (t!30645 l!1367))))))

(assert (= (and d!122331 c!103495) b!1020325))

(assert (= (and d!122331 (not c!103495)) b!1020326))

(declare-fun m!940323 () Bool)

(assert (=> b!1020326 m!940323))

(assert (=> b!1020304 d!122331))

(declare-fun d!122337 () Bool)

(declare-fun lt!449844 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!494 (List!21635) (InoxSet tuple2!15440))

(assert (=> d!122337 (= lt!449844 (select (content!494 l!1367) (tuple2!15441 key!393 value!188)))))

(declare-fun e!574307 () Bool)

(assert (=> d!122337 (= lt!449844 e!574307)))

(declare-fun res!683890 () Bool)

(assert (=> d!122337 (=> (not res!683890) (not e!574307))))

(assert (=> d!122337 (= res!683890 ((_ is Cons!21631) l!1367))))

(assert (=> d!122337 (= (contains!5926 l!1367 (tuple2!15441 key!393 value!188)) lt!449844)))

(declare-fun b!1020343 () Bool)

(declare-fun e!574308 () Bool)

(assert (=> b!1020343 (= e!574307 e!574308)))

(declare-fun res!683891 () Bool)

(assert (=> b!1020343 (=> res!683891 e!574308)))

(assert (=> b!1020343 (= res!683891 (= (h!22829 l!1367) (tuple2!15441 key!393 value!188)))))

(declare-fun b!1020344 () Bool)

(assert (=> b!1020344 (= e!574308 (contains!5926 (t!30645 l!1367) (tuple2!15441 key!393 value!188)))))

(assert (= (and d!122337 res!683890) b!1020343))

(assert (= (and b!1020343 (not res!683891)) b!1020344))

(declare-fun m!940333 () Bool)

(assert (=> d!122337 m!940333))

(declare-fun m!940335 () Bool)

(assert (=> d!122337 m!940335))

(declare-fun m!940337 () Bool)

(assert (=> b!1020344 m!940337))

(assert (=> b!1020303 d!122337))

(declare-fun d!122343 () Bool)

(declare-fun res!683908 () Bool)

(declare-fun e!574328 () Bool)

(assert (=> d!122343 (=> res!683908 e!574328)))

(assert (=> d!122343 (= res!683908 (or ((_ is Nil!21632) l!1367) ((_ is Nil!21632) (t!30645 l!1367))))))

(assert (=> d!122343 (= (isStrictlySorted!700 l!1367) e!574328)))

(declare-fun b!1020366 () Bool)

(declare-fun e!574329 () Bool)

(assert (=> b!1020366 (= e!574328 e!574329)))

(declare-fun res!683909 () Bool)

(assert (=> b!1020366 (=> (not res!683909) (not e!574329))))

(assert (=> b!1020366 (= res!683909 (bvslt (_1!7731 (h!22829 l!1367)) (_1!7731 (h!22829 (t!30645 l!1367)))))))

(declare-fun b!1020367 () Bool)

(assert (=> b!1020367 (= e!574329 (isStrictlySorted!700 (t!30645 l!1367)))))

(assert (= (and d!122343 (not res!683908)) b!1020366))

(assert (= (and b!1020366 res!683909) b!1020367))

(declare-fun m!940347 () Bool)

(assert (=> b!1020367 m!940347))

(assert (=> start!88914 d!122343))

(declare-fun b!1020376 () Bool)

(declare-fun e!574334 () Bool)

(declare-fun tp!71248 () Bool)

(assert (=> b!1020376 (= e!574334 (and tp_is_empty!23793 tp!71248))))

(assert (=> b!1020305 (= tp!71239 e!574334)))

(assert (= (and b!1020305 ((_ is Cons!21631) (t!30645 l!1367))) b!1020376))

(check-sat (not b!1020326) tp_is_empty!23793 (not b!1020376) (not b!1020344) (not b!1020367) (not d!122337))
(check-sat)
