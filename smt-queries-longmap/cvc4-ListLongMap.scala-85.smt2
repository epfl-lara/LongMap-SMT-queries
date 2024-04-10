; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1228 () Bool)

(assert start!1228)

(declare-fun res!8884 () Bool)

(declare-fun e!5980 () Bool)

(assert (=> start!1228 (=> (not res!8884) (not e!5980))))

(declare-datatypes ((B!318 0))(
  ( (B!319 (val!254 Int)) )
))
(declare-datatypes ((tuple2!308 0))(
  ( (tuple2!309 (_1!154 (_ BitVec 64)) (_2!154 B!318)) )
))
(declare-datatypes ((List!306 0))(
  ( (Nil!303) (Cons!302 (h!868 tuple2!308) (t!2453 List!306)) )
))
(declare-fun l!408 () List!306)

(assert (=> start!1228 (= res!8884 (is-Cons!302 l!408))))

(assert (=> start!1228 e!5980))

(declare-fun e!5981 () Bool)

(assert (=> start!1228 e!5981))

(declare-fun b!10345 () Bool)

(declare-fun ListPrimitiveSize!6 (List!306) Int)

(assert (=> b!10345 (= e!5980 (>= (ListPrimitiveSize!6 (t!2453 l!408)) (ListPrimitiveSize!6 l!408)))))

(declare-fun b!10346 () Bool)

(declare-fun tp_is_empty!491 () Bool)

(declare-fun tp!1487 () Bool)

(assert (=> b!10346 (= e!5981 (and tp_is_empty!491 tp!1487))))

(assert (= (and start!1228 res!8884) b!10345))

(assert (= (and start!1228 (is-Cons!302 l!408)) b!10346))

(declare-fun m!6715 () Bool)

(assert (=> b!10345 m!6715))

(declare-fun m!6717 () Bool)

(assert (=> b!10345 m!6717))

(push 1)

(assert (not b!10345))

(assert (not b!10346))

(assert tp_is_empty!491)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1091 () Bool)

(declare-fun lt!2547 () Int)

(assert (=> d!1091 (>= lt!2547 0)))

(declare-fun e!5989 () Int)

(assert (=> d!1091 (= lt!2547 e!5989)))

(declare-fun c!931 () Bool)

(assert (=> d!1091 (= c!931 (is-Nil!303 (t!2453 l!408)))))

(assert (=> d!1091 (= (ListPrimitiveSize!6 (t!2453 l!408)) lt!2547)))

(declare-fun b!10361 () Bool)

(assert (=> b!10361 (= e!5989 0)))

(declare-fun b!10363 () Bool)

(assert (=> b!10363 (= e!5989 (+ 1 (ListPrimitiveSize!6 (t!2453 (t!2453 l!408)))))))

(assert (= (and d!1091 c!931) b!10361))

(assert (= (and d!1091 (not c!931)) b!10363))

(declare-fun m!6723 () Bool)

(assert (=> b!10363 m!6723))

(assert (=> b!10345 d!1091))

(declare-fun d!1099 () Bool)

(declare-fun lt!2550 () Int)

(assert (=> d!1099 (>= lt!2550 0)))

(declare-fun e!5993 () Int)

(assert (=> d!1099 (= lt!2550 e!5993)))

(declare-fun c!935 () Bool)

(assert (=> d!1099 (= c!935 (is-Nil!303 l!408))))

(assert (=> d!1099 (= (ListPrimitiveSize!6 l!408) lt!2550)))

(declare-fun b!10369 () Bool)

(assert (=> b!10369 (= e!5993 0)))

(declare-fun b!10370 () Bool)

(assert (=> b!10370 (= e!5993 (+ 1 (ListPrimitiveSize!6 (t!2453 l!408))))))

(assert (= (and d!1099 c!935) b!10369))

(assert (= (and d!1099 (not c!935)) b!10370))

(assert (=> b!10370 m!6715))

(assert (=> b!10345 d!1099))

(declare-fun b!10385 () Bool)

(declare-fun e!6002 () Bool)

(declare-fun tp!1496 () Bool)

(assert (=> b!10385 (= e!6002 (and tp_is_empty!491 tp!1496))))

(assert (=> b!10346 (= tp!1487 e!6002)))

(assert (= (and b!10346 (is-Cons!302 (t!2453 l!408))) b!10385))

(push 1)

