; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2498 () Bool)

(assert start!2498)

(declare-fun b_free!519 () Bool)

(declare-fun b_next!519 () Bool)

(assert (=> start!2498 (= b_free!519 (not b_next!519))))

(declare-fun tp!2657 () Bool)

(declare-fun b_and!965 () Bool)

(assert (=> start!2498 (= tp!2657 b_and!965)))

(declare-fun res!11746 () Bool)

(declare-fun e!9470 () Bool)

(assert (=> start!2498 (=> (not res!11746) (not e!9470))))

(declare-datatypes ((B!640 0))(
  ( (B!641 (val!418 Int)) )
))
(declare-datatypes ((tuple2!636 0))(
  ( (tuple2!637 (_1!318 (_ BitVec 64)) (_2!318 B!640)) )
))
(declare-datatypes ((List!495 0))(
  ( (Nil!492) (Cons!491 (h!1057 tuple2!636) (t!2933 List!495)) )
))
(declare-datatypes ((ListLongMap!467 0))(
  ( (ListLongMap!468 (toList!249 List!495)) )
))
(declare-fun lm!238 () ListLongMap!467)

(declare-fun p!262 () Int)

(declare-fun forall!123 (List!495 Int) Bool)

(assert (=> start!2498 (= res!11746 (forall!123 (toList!249 lm!238) p!262))))

(assert (=> start!2498 e!9470))

(declare-fun e!9469 () Bool)

(declare-fun inv!825 (ListLongMap!467) Bool)

(assert (=> start!2498 (and (inv!825 lm!238) e!9469)))

(assert (=> start!2498 tp!2657))

(assert (=> start!2498 true))

(declare-fun b!15558 () Bool)

(declare-fun res!11745 () Bool)

(assert (=> b!15558 (=> (not res!11745) (not e!9470))))

(declare-datatypes ((List!496 0))(
  ( (Nil!493) (Cons!492 (h!1058 (_ BitVec 64)) (t!2934 List!496)) )
))
(declare-fun l!1612 () List!496)

(declare-fun isEmpty!133 (List!496) Bool)

(assert (=> b!15558 (= res!11745 (not (isEmpty!133 l!1612)))))

(declare-fun b!15559 () Bool)

(declare-fun ListPrimitiveSize!32 (List!496) Int)

(declare-fun tail!60 (List!496) List!496)

(assert (=> b!15559 (= e!9470 (not (< (ListPrimitiveSize!32 (tail!60 l!1612)) (ListPrimitiveSize!32 l!1612))))))

(declare-fun lt!3807 () (_ BitVec 64))

(declare-fun -!22 (ListLongMap!467 (_ BitVec 64)) ListLongMap!467)

(assert (=> b!15559 (forall!123 (toList!249 (-!22 lm!238 lt!3807)) p!262)))

(declare-datatypes ((Unit!308 0))(
  ( (Unit!309) )
))
(declare-fun lt!3806 () Unit!308)

(declare-fun removeValidProp!15 (ListLongMap!467 Int (_ BitVec 64)) Unit!308)

(assert (=> b!15559 (= lt!3806 (removeValidProp!15 lm!238 p!262 lt!3807))))

(declare-fun head!813 (List!496) (_ BitVec 64))

(assert (=> b!15559 (= lt!3807 (head!813 l!1612))))

(declare-fun b!15560 () Bool)

(declare-fun tp!2656 () Bool)

(assert (=> b!15560 (= e!9469 tp!2656)))

(assert (= (and start!2498 res!11746) b!15558))

(assert (= (and b!15558 res!11745) b!15559))

(assert (= start!2498 b!15560))

(declare-fun m!10501 () Bool)

(assert (=> start!2498 m!10501))

(declare-fun m!10503 () Bool)

(assert (=> start!2498 m!10503))

(declare-fun m!10505 () Bool)

(assert (=> b!15558 m!10505))

(declare-fun m!10507 () Bool)

(assert (=> b!15559 m!10507))

(declare-fun m!10509 () Bool)

(assert (=> b!15559 m!10509))

(declare-fun m!10511 () Bool)

(assert (=> b!15559 m!10511))

(declare-fun m!10513 () Bool)

(assert (=> b!15559 m!10513))

(declare-fun m!10515 () Bool)

(assert (=> b!15559 m!10515))

(declare-fun m!10517 () Bool)

(assert (=> b!15559 m!10517))

(declare-fun m!10519 () Bool)

(assert (=> b!15559 m!10519))

(assert (=> b!15559 m!10517))

(check-sat (not start!2498) (not b!15558) b_and!965 (not b_next!519) (not b!15560) (not b!15559))
(check-sat b_and!965 (not b_next!519))
(get-model)

(declare-fun d!2691 () Bool)

(assert (=> d!2691 (= (tail!60 l!1612) (t!2934 l!1612))))

(assert (=> b!15559 d!2691))

(declare-fun d!2693 () Bool)

(declare-fun res!11763 () Bool)

(declare-fun e!9487 () Bool)

(assert (=> d!2693 (=> res!11763 e!9487)))

(get-info :version)

(assert (=> d!2693 (= res!11763 ((_ is Nil!492) (toList!249 (-!22 lm!238 lt!3807))))))

(assert (=> d!2693 (= (forall!123 (toList!249 (-!22 lm!238 lt!3807)) p!262) e!9487)))

(declare-fun b!15580 () Bool)

(declare-fun e!9488 () Bool)

(assert (=> b!15580 (= e!9487 e!9488)))

(declare-fun res!11764 () Bool)

(assert (=> b!15580 (=> (not res!11764) (not e!9488))))

(declare-fun dynLambda!108 (Int tuple2!636) Bool)

(assert (=> b!15580 (= res!11764 (dynLambda!108 p!262 (h!1057 (toList!249 (-!22 lm!238 lt!3807)))))))

(declare-fun b!15581 () Bool)

(assert (=> b!15581 (= e!9488 (forall!123 (t!2933 (toList!249 (-!22 lm!238 lt!3807))) p!262))))

(assert (= (and d!2693 (not res!11763)) b!15580))

(assert (= (and b!15580 res!11764) b!15581))

(declare-fun b_lambda!1045 () Bool)

(assert (=> (not b_lambda!1045) (not b!15580)))

(declare-fun t!2940 () Bool)

(declare-fun tb!431 () Bool)

(assert (=> (and start!2498 (= p!262 p!262) t!2940) tb!431))

(declare-fun result!761 () Bool)

(assert (=> tb!431 (= result!761 true)))

(assert (=> b!15580 t!2940))

(declare-fun b_and!971 () Bool)

(assert (= b_and!965 (and (=> t!2940 result!761) b_and!971)))

(declare-fun m!10545 () Bool)

(assert (=> b!15580 m!10545))

(declare-fun m!10547 () Bool)

(assert (=> b!15581 m!10547))

(assert (=> b!15559 d!2693))

(declare-fun d!2697 () Bool)

(declare-fun lt!3823 () ListLongMap!467)

(declare-fun contains!199 (ListLongMap!467 (_ BitVec 64)) Bool)

(assert (=> d!2697 (not (contains!199 lt!3823 lt!3807))))

(declare-fun removeStrictlySorted!11 (List!495 (_ BitVec 64)) List!495)

(assert (=> d!2697 (= lt!3823 (ListLongMap!468 (removeStrictlySorted!11 (toList!249 lm!238) lt!3807)))))

(assert (=> d!2697 (= (-!22 lm!238 lt!3807) lt!3823)))

(declare-fun bs!692 () Bool)

(assert (= bs!692 d!2697))

(declare-fun m!10555 () Bool)

(assert (=> bs!692 m!10555))

(declare-fun m!10557 () Bool)

(assert (=> bs!692 m!10557))

(assert (=> b!15559 d!2697))

(declare-fun d!2705 () Bool)

(declare-fun lt!3830 () Int)

(assert (=> d!2705 (>= lt!3830 0)))

(declare-fun e!9493 () Int)

(assert (=> d!2705 (= lt!3830 e!9493)))

(declare-fun c!1465 () Bool)

(assert (=> d!2705 (= c!1465 ((_ is Nil!493) l!1612))))

(assert (=> d!2705 (= (ListPrimitiveSize!32 l!1612) lt!3830)))

(declare-fun b!15590 () Bool)

(assert (=> b!15590 (= e!9493 0)))

(declare-fun b!15591 () Bool)

(assert (=> b!15591 (= e!9493 (+ 1 (ListPrimitiveSize!32 (t!2934 l!1612))))))

(assert (= (and d!2705 c!1465) b!15590))

(assert (= (and d!2705 (not c!1465)) b!15591))

(declare-fun m!10563 () Bool)

(assert (=> b!15591 m!10563))

(assert (=> b!15559 d!2705))

(declare-fun d!2713 () Bool)

(assert (=> d!2713 (= (head!813 l!1612) (h!1058 l!1612))))

(assert (=> b!15559 d!2713))

(declare-fun d!2715 () Bool)

(declare-fun lt!3834 () Int)

(assert (=> d!2715 (>= lt!3834 0)))

(declare-fun e!9497 () Int)

(assert (=> d!2715 (= lt!3834 e!9497)))

(declare-fun c!1469 () Bool)

(assert (=> d!2715 (= c!1469 ((_ is Nil!493) (tail!60 l!1612)))))

(assert (=> d!2715 (= (ListPrimitiveSize!32 (tail!60 l!1612)) lt!3834)))

(declare-fun b!15598 () Bool)

(assert (=> b!15598 (= e!9497 0)))

(declare-fun b!15599 () Bool)

(assert (=> b!15599 (= e!9497 (+ 1 (ListPrimitiveSize!32 (t!2934 (tail!60 l!1612)))))))

(assert (= (and d!2715 c!1469) b!15598))

(assert (= (and d!2715 (not c!1469)) b!15599))

(declare-fun m!10567 () Bool)

(assert (=> b!15599 m!10567))

(assert (=> b!15559 d!2715))

(declare-fun d!2719 () Bool)

(assert (=> d!2719 (forall!123 (toList!249 (-!22 lm!238 lt!3807)) p!262)))

(declare-fun lt!3839 () Unit!308)

(declare-fun choose!176 (ListLongMap!467 Int (_ BitVec 64)) Unit!308)

(assert (=> d!2719 (= lt!3839 (choose!176 lm!238 p!262 lt!3807))))

(assert (=> d!2719 (forall!123 (toList!249 lm!238) p!262)))

(assert (=> d!2719 (= (removeValidProp!15 lm!238 p!262 lt!3807) lt!3839)))

(declare-fun bs!695 () Bool)

(assert (= bs!695 d!2719))

(assert (=> bs!695 m!10507))

(assert (=> bs!695 m!10513))

(declare-fun m!10581 () Bool)

(assert (=> bs!695 m!10581))

(assert (=> bs!695 m!10501))

(assert (=> b!15559 d!2719))

(declare-fun d!2733 () Bool)

(declare-fun res!11775 () Bool)

(declare-fun e!9510 () Bool)

(assert (=> d!2733 (=> res!11775 e!9510)))

(assert (=> d!2733 (= res!11775 ((_ is Nil!492) (toList!249 lm!238)))))

(assert (=> d!2733 (= (forall!123 (toList!249 lm!238) p!262) e!9510)))

(declare-fun b!15614 () Bool)

(declare-fun e!9511 () Bool)

(assert (=> b!15614 (= e!9510 e!9511)))

(declare-fun res!11776 () Bool)

(assert (=> b!15614 (=> (not res!11776) (not e!9511))))

(assert (=> b!15614 (= res!11776 (dynLambda!108 p!262 (h!1057 (toList!249 lm!238))))))

(declare-fun b!15615 () Bool)

(assert (=> b!15615 (= e!9511 (forall!123 (t!2933 (toList!249 lm!238)) p!262))))

(assert (= (and d!2733 (not res!11775)) b!15614))

(assert (= (and b!15614 res!11776) b!15615))

(declare-fun b_lambda!1053 () Bool)

(assert (=> (not b_lambda!1053) (not b!15614)))

(declare-fun t!2948 () Bool)

(declare-fun tb!439 () Bool)

(assert (=> (and start!2498 (= p!262 p!262) t!2948) tb!439))

(declare-fun result!769 () Bool)

(assert (=> tb!439 (= result!769 true)))

(assert (=> b!15614 t!2948))

(declare-fun b_and!979 () Bool)

(assert (= b_and!971 (and (=> t!2948 result!769) b_and!979)))

(declare-fun m!10587 () Bool)

(assert (=> b!15614 m!10587))

(declare-fun m!10589 () Bool)

(assert (=> b!15615 m!10589))

(assert (=> start!2498 d!2733))

(declare-fun d!2737 () Bool)

(declare-fun isStrictlySorted!147 (List!495) Bool)

(assert (=> d!2737 (= (inv!825 lm!238) (isStrictlySorted!147 (toList!249 lm!238)))))

(declare-fun bs!698 () Bool)

(assert (= bs!698 d!2737))

(declare-fun m!10595 () Bool)

(assert (=> bs!698 m!10595))

(assert (=> start!2498 d!2737))

(declare-fun d!2743 () Bool)

(assert (=> d!2743 (= (isEmpty!133 l!1612) ((_ is Nil!493) l!1612))))

(assert (=> b!15558 d!2743))

(declare-fun b!15631 () Bool)

(declare-fun e!9520 () Bool)

(declare-fun tp_is_empty!795 () Bool)

(declare-fun tp!2671 () Bool)

(assert (=> b!15631 (= e!9520 (and tp_is_empty!795 tp!2671))))

(assert (=> b!15560 (= tp!2656 e!9520)))

(assert (= (and b!15560 ((_ is Cons!491) (toList!249 lm!238))) b!15631))

(declare-fun b_lambda!1059 () Bool)

(assert (= b_lambda!1053 (or (and start!2498 b_free!519) b_lambda!1059)))

(declare-fun b_lambda!1061 () Bool)

(assert (= b_lambda!1045 (or (and start!2498 b_free!519) b_lambda!1061)))

(check-sat b_and!979 (not d!2737) (not b_lambda!1061) tp_is_empty!795 (not d!2697) (not b!15581) (not b_lambda!1059) (not b!15599) (not b!15631) (not b_next!519) (not b!15615) (not d!2719) (not b!15591))
(check-sat b_and!979 (not b_next!519))
