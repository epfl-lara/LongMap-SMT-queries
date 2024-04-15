; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2460 () Bool)

(assert start!2460)

(declare-fun b_free!499 () Bool)

(declare-fun b_next!499 () Bool)

(assert (=> start!2460 (= b_free!499 (not b_next!499))))

(declare-fun tp!2588 () Bool)

(declare-fun b_and!939 () Bool)

(assert (=> start!2460 (= tp!2588 b_and!939)))

(declare-fun res!11692 () Bool)

(declare-fun e!9382 () Bool)

(assert (=> start!2460 (=> (not res!11692) (not e!9382))))

(declare-datatypes ((B!620 0))(
  ( (B!621 (val!408 Int)) )
))
(declare-datatypes ((tuple2!612 0))(
  ( (tuple2!613 (_1!306 (_ BitVec 64)) (_2!306 B!620)) )
))
(declare-datatypes ((List!474 0))(
  ( (Nil!471) (Cons!470 (h!1036 tuple2!612) (t!2906 List!474)) )
))
(declare-datatypes ((ListLongMap!443 0))(
  ( (ListLongMap!444 (toList!237 List!474)) )
))
(declare-fun lm!238 () ListLongMap!443)

(declare-fun p!262 () Int)

(declare-fun forall!116 (List!474 Int) Bool)

(assert (=> start!2460 (= res!11692 (forall!116 (toList!237 lm!238) p!262))))

(assert (=> start!2460 e!9382))

(declare-fun e!9383 () Bool)

(declare-fun inv!800 (ListLongMap!443) Bool)

(assert (=> start!2460 (and (inv!800 lm!238) e!9383)))

(assert (=> start!2460 tp!2588))

(assert (=> start!2460 true))

(declare-fun b!15442 () Bool)

(declare-datatypes ((List!475 0))(
  ( (Nil!472) (Cons!471 (h!1037 (_ BitVec 64)) (t!2907 List!475)) )
))
(declare-fun l!1612 () List!475)

(declare-fun ListPrimitiveSize!28 (List!475) Int)

(assert (=> b!15442 (= e!9382 (< (ListPrimitiveSize!28 l!1612) 0))))

(declare-fun b!15443 () Bool)

(declare-fun tp!2587 () Bool)

(assert (=> b!15443 (= e!9383 tp!2587)))

(assert (= (and start!2460 res!11692) b!15442))

(assert (= start!2460 b!15443))

(declare-fun m!10383 () Bool)

(assert (=> start!2460 m!10383))

(declare-fun m!10385 () Bool)

(assert (=> start!2460 m!10385))

(declare-fun m!10387 () Bool)

(assert (=> b!15442 m!10387))

(check-sat (not start!2460) (not b!15442) (not b!15443) b_and!939 (not b_next!499))
(check-sat b_and!939 (not b_next!499))
(get-model)

(declare-fun d!2665 () Bool)

(declare-fun lt!3773 () Int)

(assert (=> d!2665 (>= lt!3773 0)))

(declare-fun e!9406 () Int)

(assert (=> d!2665 (= lt!3773 e!9406)))

(declare-fun c!1456 () Bool)

(get-info :version)

(assert (=> d!2665 (= c!1456 ((_ is Nil!472) l!1612))))

(assert (=> d!2665 (= (ListPrimitiveSize!28 l!1612) lt!3773)))

(declare-fun b!15470 () Bool)

(assert (=> b!15470 (= e!9406 0)))

(declare-fun b!15472 () Bool)

(assert (=> b!15472 (= e!9406 (+ 1 (ListPrimitiveSize!28 (t!2907 l!1612))))))

(assert (= (and d!2665 c!1456) b!15470))

(assert (= (and d!2665 (not c!1456)) b!15472))

(declare-fun m!10402 () Bool)

(assert (=> b!15472 m!10402))

(assert (=> b!15442 d!2665))

(declare-fun d!2669 () Bool)

(declare-fun res!11715 () Bool)

(declare-fun e!9418 () Bool)

(assert (=> d!2669 (=> res!11715 e!9418)))

(assert (=> d!2669 (= res!11715 ((_ is Nil!471) (toList!237 lm!238)))))

(assert (=> d!2669 (= (forall!116 (toList!237 lm!238) p!262) e!9418)))

(declare-fun b!15484 () Bool)

(declare-fun e!9419 () Bool)

(assert (=> b!15484 (= e!9418 e!9419)))

(declare-fun res!11716 () Bool)

(assert (=> b!15484 (=> (not res!11716) (not e!9419))))

(declare-fun dynLambda!105 (Int tuple2!612) Bool)

(assert (=> b!15484 (= res!11716 (dynLambda!105 p!262 (h!1036 (toList!237 lm!238))))))

(declare-fun b!15485 () Bool)

(assert (=> b!15485 (= e!9419 (forall!116 (t!2906 (toList!237 lm!238)) p!262))))

(assert (= (and d!2669 (not res!11715)) b!15484))

(assert (= (and b!15484 res!11716) b!15485))

(declare-fun b_lambda!1035 () Bool)

(assert (=> (not b_lambda!1035) (not b!15484)))

(declare-fun t!2917 () Bool)

(declare-fun tb!427 () Bool)

(assert (=> (and start!2460 (= p!262 p!262) t!2917) tb!427))

(declare-fun result!751 () Bool)

(assert (=> tb!427 (= result!751 true)))

(assert (=> b!15484 t!2917))

(declare-fun b_and!949 () Bool)

(assert (= b_and!939 (and (=> t!2917 result!751) b_and!949)))

(declare-fun m!10413 () Bool)

(assert (=> b!15484 m!10413))

(declare-fun m!10417 () Bool)

(assert (=> b!15485 m!10417))

(assert (=> start!2460 d!2669))

(declare-fun d!2679 () Bool)

(declare-fun isStrictlySorted!138 (List!474) Bool)

(assert (=> d!2679 (= (inv!800 lm!238) (isStrictlySorted!138 (toList!237 lm!238)))))

(declare-fun bs!680 () Bool)

(assert (= bs!680 d!2679))

(declare-fun m!10421 () Bool)

(assert (=> bs!680 m!10421))

(assert (=> start!2460 d!2679))

(declare-fun b!15504 () Bool)

(declare-fun e!9429 () Bool)

(declare-fun tp_is_empty!788 () Bool)

(declare-fun tp!2607 () Bool)

(assert (=> b!15504 (= e!9429 (and tp_is_empty!788 tp!2607))))

(assert (=> b!15443 (= tp!2587 e!9429)))

(assert (= (and b!15443 ((_ is Cons!470) (toList!237 lm!238))) b!15504))

(declare-fun b_lambda!1037 () Bool)

(assert (= b_lambda!1035 (or (and start!2460 b_free!499) b_lambda!1037)))

(check-sat tp_is_empty!788 (not b!15472) (not b_lambda!1037) (not b!15504) (not b_next!499) (not d!2679) (not b!15485) b_and!949)
(check-sat b_and!949 (not b_next!499))
