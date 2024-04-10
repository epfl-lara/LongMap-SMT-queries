; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2460 () Bool)

(assert start!2460)

(declare-fun b_free!499 () Bool)

(declare-fun b_next!499 () Bool)

(assert (=> start!2460 (= b_free!499 (not b_next!499))))

(declare-fun tp!2587 () Bool)

(declare-fun b_and!939 () Bool)

(assert (=> start!2460 (= tp!2587 b_and!939)))

(declare-fun res!11692 () Bool)

(declare-fun e!9383 () Bool)

(assert (=> start!2460 (=> (not res!11692) (not e!9383))))

(declare-datatypes ((B!620 0))(
  ( (B!621 (val!408 Int)) )
))
(declare-datatypes ((tuple2!616 0))(
  ( (tuple2!617 (_1!308 (_ BitVec 64)) (_2!308 B!620)) )
))
(declare-datatypes ((List!478 0))(
  ( (Nil!475) (Cons!474 (h!1040 tuple2!616) (t!2910 List!478)) )
))
(declare-datatypes ((ListLongMap!447 0))(
  ( (ListLongMap!448 (toList!239 List!478)) )
))
(declare-fun lm!238 () ListLongMap!447)

(declare-fun p!262 () Int)

(declare-fun forall!116 (List!478 Int) Bool)

(assert (=> start!2460 (= res!11692 (forall!116 (toList!239 lm!238) p!262))))

(assert (=> start!2460 e!9383))

(declare-fun e!9382 () Bool)

(declare-fun inv!800 (ListLongMap!447) Bool)

(assert (=> start!2460 (and (inv!800 lm!238) e!9382)))

(assert (=> start!2460 tp!2587))

(assert (=> start!2460 true))

(declare-fun b!15442 () Bool)

(declare-datatypes ((List!479 0))(
  ( (Nil!476) (Cons!475 (h!1041 (_ BitVec 64)) (t!2911 List!479)) )
))
(declare-fun l!1612 () List!479)

(declare-fun ListPrimitiveSize!28 (List!479) Int)

(assert (=> b!15442 (= e!9383 (< (ListPrimitiveSize!28 l!1612) 0))))

(declare-fun b!15443 () Bool)

(declare-fun tp!2588 () Bool)

(assert (=> b!15443 (= e!9382 tp!2588)))

(assert (= (and start!2460 res!11692) b!15442))

(assert (= start!2460 b!15443))

(declare-fun m!10391 () Bool)

(assert (=> start!2460 m!10391))

(declare-fun m!10393 () Bool)

(assert (=> start!2460 m!10393))

(declare-fun m!10395 () Bool)

(assert (=> b!15442 m!10395))

(push 1)

(assert (not b!15442))

(assert (not start!2460))

(assert (not b_next!499))

(assert b_and!939)

(assert (not b!15443))

(check-sat)

(pop 1)

(push 1)

(assert b_and!939)

(assert (not b_next!499))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2663 () Bool)

(declare-fun res!11703 () Bool)

(declare-fun e!9400 () Bool)

(assert (=> d!2663 (=> res!11703 e!9400)))

(assert (=> d!2663 (= res!11703 (is-Nil!475 (toList!239 lm!238)))))

(assert (=> d!2663 (= (forall!116 (toList!239 lm!238) p!262) e!9400)))

(declare-fun b!15460 () Bool)

(declare-fun e!9401 () Bool)

(assert (=> b!15460 (= e!9400 e!9401)))

(declare-fun res!11704 () Bool)

(assert (=> b!15460 (=> (not res!11704) (not e!9401))))

(declare-fun dynLambda!105 (Int tuple2!616) Bool)

(assert (=> b!15460 (= res!11704 (dynLambda!105 p!262 (h!1040 (toList!239 lm!238))))))

(declare-fun b!15461 () Bool)

(assert (=> b!15461 (= e!9401 (forall!116 (t!2910 (toList!239 lm!238)) p!262))))

(assert (= (and d!2663 (not res!11703)) b!15460))

(assert (= (and b!15460 res!11704) b!15461))

(declare-fun b_lambda!1031 () Bool)

(assert (=> (not b_lambda!1031) (not b!15460)))

(declare-fun t!2917 () Bool)

(declare-fun tb!423 () Bool)

(assert (=> (and start!2460 (= p!262 p!262) t!2917) tb!423))

(declare-fun result!747 () Bool)

(assert (=> tb!423 (= result!747 true)))

(assert (=> b!15460 t!2917))

(declare-fun b_and!945 () Bool)

(assert (= b_and!939 (and (=> t!2917 result!747) b_and!945)))

(declare-fun m!10409 () Bool)

(assert (=> b!15460 m!10409))

(declare-fun m!10411 () Bool)

(assert (=> b!15461 m!10411))

(assert (=> start!2460 d!2663))

(declare-fun d!2669 () Bool)

(declare-fun isStrictlySorted!143 (List!478) Bool)

(assert (=> d!2669 (= (inv!800 lm!238) (isStrictlySorted!143 (toList!239 lm!238)))))

(declare-fun bs!678 () Bool)

(assert (= bs!678 d!2669))

(declare-fun m!10413 () Bool)

(assert (=> bs!678 m!10413))

(assert (=> start!2460 d!2669))

(declare-fun d!2671 () Bool)

(declare-fun lt!3777 () Int)

(assert (=> d!2671 (>= lt!3777 0)))

(declare-fun e!9410 () Int)

(assert (=> d!2671 (= lt!3777 e!9410)))

(declare-fun c!1460 () Bool)

(assert (=> d!2671 (= c!1460 (is-Nil!476 l!1612))))

(assert (=> d!2671 (= (ListPrimitiveSize!28 l!1612) lt!3777)))

(declare-fun b!15478 () Bool)

(assert (=> b!15478 (= e!9410 0)))

(declare-fun b!15479 () Bool)

(assert (=> b!15479 (= e!9410 (+ 1 (ListPrimitiveSize!28 (t!2911 l!1612))))))

(assert (= (and d!2671 c!1460) b!15478))

(assert (= (and d!2671 (not c!1460)) b!15479))

(declare-fun m!10419 () Bool)

(assert (=> b!15479 m!10419))

(assert (=> b!15442 d!2671))

(declare-fun b!15492 () Bool)

(declare-fun e!9421 () Bool)

(declare-fun tp_is_empty!787 () Bool)

(declare-fun tp!2603 () Bool)

(assert (=> b!15492 (= e!9421 (and tp_is_empty!787 tp!2603))))

(assert (=> b!15443 (= tp!2588 e!9421)))

(assert (= (and b!15443 (is-Cons!474 (toList!239 lm!238))) b!15492))

(declare-fun b_lambda!1033 () Bool)

(assert (= b_lambda!1031 (or (and start!2460 b_free!499) b_lambda!1033)))

(push 1)

(assert (not b!15492))

(assert b_and!945)

(assert (not d!2669))

(assert (not b_next!499))

(assert (not b!15479))

(assert tp_is_empty!787)

(assert (not b_lambda!1033))

(assert (not b!15461))

(check-sat)

(pop 1)

(push 1)

(assert b_and!945)

(assert (not b_next!499))

(check-sat)

