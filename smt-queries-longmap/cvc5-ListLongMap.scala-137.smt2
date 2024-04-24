; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2464 () Bool)

(assert start!2464)

(declare-fun b_free!503 () Bool)

(declare-fun b_next!503 () Bool)

(assert (=> start!2464 (= b_free!503 (not b_next!503))))

(declare-fun tp!2600 () Bool)

(declare-fun b_and!943 () Bool)

(assert (=> start!2464 (= tp!2600 b_and!943)))

(declare-fun res!11696 () Bool)

(declare-fun e!9390 () Bool)

(assert (=> start!2464 (=> (not res!11696) (not e!9390))))

(declare-datatypes ((B!624 0))(
  ( (B!625 (val!410 Int)) )
))
(declare-datatypes ((tuple2!616 0))(
  ( (tuple2!617 (_1!308 (_ BitVec 64)) (_2!308 B!624)) )
))
(declare-datatypes ((List!478 0))(
  ( (Nil!475) (Cons!474 (h!1040 tuple2!616) (t!2910 List!478)) )
))
(declare-datatypes ((ListLongMap!447 0))(
  ( (ListLongMap!448 (toList!239 List!478)) )
))
(declare-fun lm!238 () ListLongMap!447)

(declare-fun p!262 () Int)

(declare-fun forall!118 (List!478 Int) Bool)

(assert (=> start!2464 (= res!11696 (forall!118 (toList!239 lm!238) p!262))))

(assert (=> start!2464 e!9390))

(declare-fun e!9391 () Bool)

(declare-fun inv!802 (ListLongMap!447) Bool)

(assert (=> start!2464 (and (inv!802 lm!238) e!9391)))

(assert (=> start!2464 tp!2600))

(assert (=> start!2464 true))

(declare-fun b!15448 () Bool)

(declare-datatypes ((List!479 0))(
  ( (Nil!476) (Cons!475 (h!1041 (_ BitVec 64)) (t!2911 List!479)) )
))
(declare-fun l!1612 () List!479)

(declare-fun ListPrimitiveSize!30 (List!479) Int)

(assert (=> b!15448 (= e!9390 (< (ListPrimitiveSize!30 l!1612) 0))))

(declare-fun b!15449 () Bool)

(declare-fun tp!2599 () Bool)

(assert (=> b!15449 (= e!9391 tp!2599)))

(assert (= (and start!2464 res!11696) b!15448))

(assert (= start!2464 b!15449))

(declare-fun m!10395 () Bool)

(assert (=> start!2464 m!10395))

(declare-fun m!10397 () Bool)

(assert (=> start!2464 m!10397))

(declare-fun m!10399 () Bool)

(assert (=> b!15448 m!10399))

(push 1)

(assert (not start!2464))

(assert (not b_next!503))

(assert b_and!943)

(assert (not b!15448))

(assert (not b!15449))

(check-sat)

(pop 1)

(push 1)

(assert b_and!943)

(assert (not b_next!503))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2661 () Bool)

(declare-fun res!11705 () Bool)

(declare-fun e!9400 () Bool)

(assert (=> d!2661 (=> res!11705 e!9400)))

(assert (=> d!2661 (= res!11705 (is-Nil!475 (toList!239 lm!238)))))

(assert (=> d!2661 (= (forall!118 (toList!239 lm!238) p!262) e!9400)))

(declare-fun b!15458 () Bool)

(declare-fun e!9401 () Bool)

(assert (=> b!15458 (= e!9400 e!9401)))

(declare-fun res!11706 () Bool)

(assert (=> b!15458 (=> (not res!11706) (not e!9401))))

(declare-fun dynLambda!102 (Int tuple2!616) Bool)

(assert (=> b!15458 (= res!11706 (dynLambda!102 p!262 (h!1040 (toList!239 lm!238))))))

(declare-fun b!15459 () Bool)

(assert (=> b!15459 (= e!9401 (forall!118 (t!2910 (toList!239 lm!238)) p!262))))

(assert (= (and d!2661 (not res!11705)) b!15458))

(assert (= (and b!15458 res!11706) b!15459))

(declare-fun b_lambda!1031 () Bool)

(assert (=> (not b_lambda!1031) (not b!15458)))

(declare-fun t!2913 () Bool)

(declare-fun tb!423 () Bool)

(assert (=> (and start!2464 (= p!262 p!262) t!2913) tb!423))

(declare-fun result!747 () Bool)

(assert (=> tb!423 (= result!747 true)))

(assert (=> b!15458 t!2913))

(declare-fun b_and!945 () Bool)

(assert (= b_and!943 (and (=> t!2913 result!747) b_and!945)))

(declare-fun m!10401 () Bool)

(assert (=> b!15458 m!10401))

(declare-fun m!10403 () Bool)

(assert (=> b!15459 m!10403))

(assert (=> start!2464 d!2661))

(declare-fun d!2665 () Bool)

(declare-fun isStrictlySorted!134 (List!478) Bool)

(assert (=> d!2665 (= (inv!802 lm!238) (isStrictlySorted!134 (toList!239 lm!238)))))

(declare-fun bs!678 () Bool)

(assert (= bs!678 d!2665))

(declare-fun m!10413 () Bool)

(assert (=> bs!678 m!10413))

(assert (=> start!2464 d!2665))

(declare-fun d!2671 () Bool)

(declare-fun lt!3771 () Int)

(assert (=> d!2671 (>= lt!3771 0)))

(declare-fun e!9412 () Int)

(assert (=> d!2671 (= lt!3771 e!9412)))

(declare-fun c!1452 () Bool)

(assert (=> d!2671 (= c!1452 (is-Nil!476 l!1612))))

(assert (=> d!2671 (= (ListPrimitiveSize!30 l!1612) lt!3771)))

(declare-fun b!15472 () Bool)

(assert (=> b!15472 (= e!9412 0)))

(declare-fun b!15473 () Bool)

(assert (=> b!15473 (= e!9412 (+ 1 (ListPrimitiveSize!30 (t!2911 l!1612))))))

(assert (= (and d!2671 c!1452) b!15472))

(assert (= (and d!2671 (not c!1452)) b!15473))

(declare-fun m!10419 () Bool)

(assert (=> b!15473 m!10419))

(assert (=> b!15448 d!2671))

(declare-fun b!15482 () Bool)

(declare-fun e!9417 () Bool)

(declare-fun tp_is_empty!787 () Bool)

(declare-fun tp!2603 () Bool)

(assert (=> b!15482 (= e!9417 (and tp_is_empty!787 tp!2603))))

(assert (=> b!15449 (= tp!2599 e!9417)))

(assert (= (and b!15449 (is-Cons!474 (toList!239 lm!238))) b!15482))

(declare-fun b_lambda!1037 () Bool)

(assert (= b_lambda!1031 (or (and start!2464 b_free!503) b_lambda!1037)))

(push 1)

(assert b_and!945)

(assert (not b_next!503))

(assert (not b!15482))

(assert (not d!2665))

(assert (not b!15473))

(assert (not b_lambda!1037))

(assert tp_is_empty!787)

(assert (not b!15459))

(check-sat)

(pop 1)

(push 1)

(assert b_and!945)

(assert (not b_next!503))

(check-sat)

(pop 1)

