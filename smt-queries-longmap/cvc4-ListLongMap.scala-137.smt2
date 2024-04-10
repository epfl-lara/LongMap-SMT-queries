; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2464 () Bool)

(assert start!2464)

(declare-fun b_free!503 () Bool)

(declare-fun b_next!503 () Bool)

(assert (=> start!2464 (= b_free!503 (not b_next!503))))

(declare-fun tp!2599 () Bool)

(declare-fun b_and!943 () Bool)

(assert (=> start!2464 (= tp!2599 b_and!943)))

(declare-fun res!11698 () Bool)

(declare-fun e!9395 () Bool)

(assert (=> start!2464 (=> (not res!11698) (not e!9395))))

(declare-datatypes ((B!624 0))(
  ( (B!625 (val!410 Int)) )
))
(declare-datatypes ((tuple2!620 0))(
  ( (tuple2!621 (_1!310 (_ BitVec 64)) (_2!310 B!624)) )
))
(declare-datatypes ((List!482 0))(
  ( (Nil!479) (Cons!478 (h!1044 tuple2!620) (t!2914 List!482)) )
))
(declare-datatypes ((ListLongMap!451 0))(
  ( (ListLongMap!452 (toList!241 List!482)) )
))
(declare-fun lm!238 () ListLongMap!451)

(declare-fun p!262 () Int)

(declare-fun forall!118 (List!482 Int) Bool)

(assert (=> start!2464 (= res!11698 (forall!118 (toList!241 lm!238) p!262))))

(assert (=> start!2464 e!9395))

(declare-fun e!9394 () Bool)

(declare-fun inv!802 (ListLongMap!451) Bool)

(assert (=> start!2464 (and (inv!802 lm!238) e!9394)))

(assert (=> start!2464 tp!2599))

(assert (=> start!2464 true))

(declare-fun b!15454 () Bool)

(declare-datatypes ((List!483 0))(
  ( (Nil!480) (Cons!479 (h!1045 (_ BitVec 64)) (t!2915 List!483)) )
))
(declare-fun l!1612 () List!483)

(declare-fun ListPrimitiveSize!30 (List!483) Int)

(assert (=> b!15454 (= e!9395 (< (ListPrimitiveSize!30 l!1612) 0))))

(declare-fun b!15455 () Bool)

(declare-fun tp!2600 () Bool)

(assert (=> b!15455 (= e!9394 tp!2600)))

(assert (= (and start!2464 res!11698) b!15454))

(assert (= start!2464 b!15455))

(declare-fun m!10403 () Bool)

(assert (=> start!2464 m!10403))

(declare-fun m!10405 () Bool)

(assert (=> start!2464 m!10405))

(declare-fun m!10407 () Bool)

(assert (=> b!15454 m!10407))

(push 1)

(assert (not b!15454))

(assert b_and!943)

(assert (not b!15455))

(assert (not b_next!503))

(assert (not start!2464))

(check-sat)

(pop 1)

(push 1)

(assert b_and!943)

(assert (not b_next!503))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2665 () Bool)

(declare-fun lt!3773 () Int)

(assert (=> d!2665 (>= lt!3773 0)))

(declare-fun e!9406 () Int)

(assert (=> d!2665 (= lt!3773 e!9406)))

(declare-fun c!1456 () Bool)

(assert (=> d!2665 (= c!1456 (is-Nil!480 l!1612))))

(assert (=> d!2665 (= (ListPrimitiveSize!30 l!1612) lt!3773)))

(declare-fun b!15470 () Bool)

(assert (=> b!15470 (= e!9406 0)))

(declare-fun b!15471 () Bool)

(assert (=> b!15471 (= e!9406 (+ 1 (ListPrimitiveSize!30 (t!2915 l!1612))))))

(assert (= (and d!2665 c!1456) b!15470))

(assert (= (and d!2665 (not c!1456)) b!15471))

(declare-fun m!10415 () Bool)

(assert (=> b!15471 m!10415))

(assert (=> b!15454 d!2665))

(declare-fun d!2673 () Bool)

(declare-fun res!11714 () Bool)

(declare-fun e!9423 () Bool)

(assert (=> d!2673 (=> res!11714 e!9423)))

(assert (=> d!2673 (= res!11714 (is-Nil!479 (toList!241 lm!238)))))

(assert (=> d!2673 (= (forall!118 (toList!241 lm!238) p!262) e!9423)))

(declare-fun b!15494 () Bool)

(declare-fun e!9425 () Bool)

(assert (=> b!15494 (= e!9423 e!9425)))

(declare-fun res!11716 () Bool)

(assert (=> b!15494 (=> (not res!11716) (not e!9425))))

(declare-fun dynLambda!107 (Int tuple2!620) Bool)

(assert (=> b!15494 (= res!11716 (dynLambda!107 p!262 (h!1044 (toList!241 lm!238))))))

(declare-fun b!15496 () Bool)

(assert (=> b!15496 (= e!9425 (forall!118 (t!2914 (toList!241 lm!238)) p!262))))

(assert (= (and d!2673 (not res!11714)) b!15494))

(assert (= (and b!15494 res!11716) b!15496))

(declare-fun b_lambda!1037 () Bool)

(assert (=> (not b_lambda!1037) (not b!15494)))

(declare-fun t!2921 () Bool)

(declare-fun tb!427 () Bool)

(assert (=> (and start!2464 (= p!262 p!262) t!2921) tb!427))

(declare-fun result!753 () Bool)

(assert (=> tb!427 (= result!753 true)))

(assert (=> b!15494 t!2921))

(declare-fun b_and!949 () Bool)

(assert (= b_and!943 (and (=> t!2921 result!753) b_and!949)))

(declare-fun m!10423 () Bool)

(assert (=> b!15494 m!10423))

(declare-fun m!10427 () Bool)

(assert (=> b!15496 m!10427))

(assert (=> start!2464 d!2673))

(declare-fun d!2679 () Bool)

(declare-fun isStrictlySorted!145 (List!482) Bool)

(assert (=> d!2679 (= (inv!802 lm!238) (isStrictlySorted!145 (toList!241 lm!238)))))

(declare-fun bs!680 () Bool)

(assert (= bs!680 d!2679))

(declare-fun m!10431 () Bool)

(assert (=> bs!680 m!10431))

(assert (=> start!2464 d!2679))

(declare-fun b!15506 () Bool)

(declare-fun e!9431 () Bool)

(declare-fun tp_is_empty!790 () Bool)

(declare-fun tp!2609 () Bool)

(assert (=> b!15506 (= e!9431 (and tp_is_empty!790 tp!2609))))

(assert (=> b!15455 (= tp!2600 e!9431)))

