; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2496 () Bool)

(assert start!2496)

(declare-fun b_free!517 () Bool)

(declare-fun b_next!517 () Bool)

(assert (=> start!2496 (= b_free!517 (not b_next!517))))

(declare-fun tp!2650 () Bool)

(declare-fun b_and!963 () Bool)

(assert (=> start!2496 (= tp!2650 b_and!963)))

(declare-fun res!11739 () Bool)

(declare-fun e!9464 () Bool)

(assert (=> start!2496 (=> (not res!11739) (not e!9464))))

(declare-datatypes ((B!638 0))(
  ( (B!639 (val!417 Int)) )
))
(declare-datatypes ((tuple2!630 0))(
  ( (tuple2!631 (_1!315 (_ BitVec 64)) (_2!315 B!638)) )
))
(declare-datatypes ((List!489 0))(
  ( (Nil!486) (Cons!485 (h!1051 tuple2!630) (t!2927 List!489)) )
))
(declare-datatypes ((ListLongMap!461 0))(
  ( (ListLongMap!462 (toList!246 List!489)) )
))
(declare-fun lm!238 () ListLongMap!461)

(declare-fun p!262 () Int)

(declare-fun forall!122 (List!489 Int) Bool)

(assert (=> start!2496 (= res!11739 (forall!122 (toList!246 lm!238) p!262))))

(assert (=> start!2496 e!9464))

(declare-fun e!9463 () Bool)

(declare-fun inv!824 (ListLongMap!461) Bool)

(assert (=> start!2496 (and (inv!824 lm!238) e!9463)))

(assert (=> start!2496 tp!2650))

(assert (=> start!2496 true))

(declare-fun b!15549 () Bool)

(declare-fun res!11740 () Bool)

(assert (=> b!15549 (=> (not res!11740) (not e!9464))))

(declare-datatypes ((List!490 0))(
  ( (Nil!487) (Cons!486 (h!1052 (_ BitVec 64)) (t!2928 List!490)) )
))
(declare-fun l!1612 () List!490)

(declare-fun isEmpty!132 (List!490) Bool)

(assert (=> b!15549 (= res!11740 (not (isEmpty!132 l!1612)))))

(declare-fun b!15550 () Bool)

(declare-fun ListPrimitiveSize!31 (List!490) Int)

(declare-fun tail!59 (List!490) List!490)

(assert (=> b!15550 (= e!9464 (not (< (ListPrimitiveSize!31 (tail!59 l!1612)) (ListPrimitiveSize!31 l!1612))))))

(declare-fun lt!3801 () (_ BitVec 64))

(declare-fun -!21 (ListLongMap!461 (_ BitVec 64)) ListLongMap!461)

(assert (=> b!15550 (forall!122 (toList!246 (-!21 lm!238 lt!3801)) p!262)))

(declare-datatypes ((Unit!316 0))(
  ( (Unit!317) )
))
(declare-fun lt!3800 () Unit!316)

(declare-fun removeValidProp!14 (ListLongMap!461 Int (_ BitVec 64)) Unit!316)

(assert (=> b!15550 (= lt!3800 (removeValidProp!14 lm!238 p!262 lt!3801))))

(declare-fun head!812 (List!490) (_ BitVec 64))

(assert (=> b!15550 (= lt!3801 (head!812 l!1612))))

(declare-fun b!15551 () Bool)

(declare-fun tp!2651 () Bool)

(assert (=> b!15551 (= e!9463 tp!2651)))

(assert (= (and start!2496 res!11739) b!15549))

(assert (= (and b!15549 res!11740) b!15550))

(assert (= start!2496 b!15551))

(declare-fun m!10473 () Bool)

(assert (=> start!2496 m!10473))

(declare-fun m!10475 () Bool)

(assert (=> start!2496 m!10475))

(declare-fun m!10477 () Bool)

(assert (=> b!15549 m!10477))

(declare-fun m!10479 () Bool)

(assert (=> b!15550 m!10479))

(declare-fun m!10481 () Bool)

(assert (=> b!15550 m!10481))

(declare-fun m!10483 () Bool)

(assert (=> b!15550 m!10483))

(declare-fun m!10485 () Bool)

(assert (=> b!15550 m!10485))

(declare-fun m!10487 () Bool)

(assert (=> b!15550 m!10487))

(declare-fun m!10489 () Bool)

(assert (=> b!15550 m!10489))

(declare-fun m!10491 () Bool)

(assert (=> b!15550 m!10491))

(assert (=> b!15550 m!10489))

(check-sat (not b!15551) (not b!15550) (not b_next!517) b_and!963 (not b!15549) (not start!2496))
(check-sat b_and!963 (not b_next!517))
(get-model)

(declare-fun d!2691 () Bool)

(assert (=> d!2691 (= (tail!59 l!1612) (t!2928 l!1612))))

(assert (=> b!15550 d!2691))

(declare-fun d!2695 () Bool)

(declare-fun lt!3816 () Int)

(assert (=> d!2695 (>= lt!3816 0)))

(declare-fun e!9485 () Int)

(assert (=> d!2695 (= lt!3816 e!9485)))

(declare-fun c!1463 () Bool)

(get-info :version)

(assert (=> d!2695 (= c!1463 ((_ is Nil!487) l!1612))))

(assert (=> d!2695 (= (ListPrimitiveSize!31 l!1612) lt!3816)))

(declare-fun b!15580 () Bool)

(assert (=> b!15580 (= e!9485 0)))

(declare-fun b!15581 () Bool)

(assert (=> b!15581 (= e!9485 (+ 1 (ListPrimitiveSize!31 (t!2928 l!1612))))))

(assert (= (and d!2695 c!1463) b!15580))

(assert (= (and d!2695 (not c!1463)) b!15581))

(declare-fun m!10537 () Bool)

(assert (=> b!15581 m!10537))

(assert (=> b!15550 d!2695))

(declare-fun d!2699 () Bool)

(assert (=> d!2699 (= (head!812 l!1612) (h!1052 l!1612))))

(assert (=> b!15550 d!2699))

(declare-fun d!2701 () Bool)

(declare-fun lt!3817 () Int)

(assert (=> d!2701 (>= lt!3817 0)))

(declare-fun e!9486 () Int)

(assert (=> d!2701 (= lt!3817 e!9486)))

(declare-fun c!1464 () Bool)

(assert (=> d!2701 (= c!1464 ((_ is Nil!487) (tail!59 l!1612)))))

(assert (=> d!2701 (= (ListPrimitiveSize!31 (tail!59 l!1612)) lt!3817)))

(declare-fun b!15582 () Bool)

(assert (=> b!15582 (= e!9486 0)))

(declare-fun b!15583 () Bool)

(assert (=> b!15583 (= e!9486 (+ 1 (ListPrimitiveSize!31 (t!2928 (tail!59 l!1612)))))))

(assert (= (and d!2701 c!1464) b!15582))

(assert (= (and d!2701 (not c!1464)) b!15583))

(declare-fun m!10539 () Bool)

(assert (=> b!15583 m!10539))

(assert (=> b!15550 d!2701))

(declare-fun d!2703 () Bool)

(declare-fun lt!3828 () ListLongMap!461)

(declare-fun contains!195 (ListLongMap!461 (_ BitVec 64)) Bool)

(assert (=> d!2703 (not (contains!195 lt!3828 lt!3801))))

(declare-fun removeStrictlySorted!9 (List!489 (_ BitVec 64)) List!489)

(assert (=> d!2703 (= lt!3828 (ListLongMap!462 (removeStrictlySorted!9 (toList!246 lm!238) lt!3801)))))

(assert (=> d!2703 (= (-!21 lm!238 lt!3801) lt!3828)))

(declare-fun bs!692 () Bool)

(assert (= bs!692 d!2703))

(declare-fun m!10547 () Bool)

(assert (=> bs!692 m!10547))

(declare-fun m!10551 () Bool)

(assert (=> bs!692 m!10551))

(assert (=> b!15550 d!2703))

(declare-fun d!2713 () Bool)

(declare-fun res!11763 () Bool)

(declare-fun e!9494 () Bool)

(assert (=> d!2713 (=> res!11763 e!9494)))

(assert (=> d!2713 (= res!11763 ((_ is Nil!486) (toList!246 (-!21 lm!238 lt!3801))))))

(assert (=> d!2713 (= (forall!122 (toList!246 (-!21 lm!238 lt!3801)) p!262) e!9494)))

(declare-fun b!15594 () Bool)

(declare-fun e!9495 () Bool)

(assert (=> b!15594 (= e!9494 e!9495)))

(declare-fun res!11764 () Bool)

(assert (=> b!15594 (=> (not res!11764) (not e!9495))))

(declare-fun dynLambda!108 (Int tuple2!630) Bool)

(assert (=> b!15594 (= res!11764 (dynLambda!108 p!262 (h!1051 (toList!246 (-!21 lm!238 lt!3801)))))))

(declare-fun b!15595 () Bool)

(assert (=> b!15595 (= e!9495 (forall!122 (t!2927 (toList!246 (-!21 lm!238 lt!3801))) p!262))))

(assert (= (and d!2713 (not res!11763)) b!15594))

(assert (= (and b!15594 res!11764) b!15595))

(declare-fun b_lambda!1045 () Bool)

(assert (=> (not b_lambda!1045) (not b!15594)))

(declare-fun t!2936 () Bool)

(declare-fun tb!431 () Bool)

(assert (=> (and start!2496 (= p!262 p!262) t!2936) tb!431))

(declare-fun result!761 () Bool)

(assert (=> tb!431 (= result!761 true)))

(assert (=> b!15594 t!2936))

(declare-fun b_and!971 () Bool)

(assert (= b_and!963 (and (=> t!2936 result!761) b_and!971)))

(declare-fun m!10555 () Bool)

(assert (=> b!15594 m!10555))

(declare-fun m!10557 () Bool)

(assert (=> b!15595 m!10557))

(assert (=> b!15550 d!2713))

(declare-fun d!2717 () Bool)

(assert (=> d!2717 (forall!122 (toList!246 (-!21 lm!238 lt!3801)) p!262)))

(declare-fun lt!3841 () Unit!316)

(declare-fun choose!174 (ListLongMap!461 Int (_ BitVec 64)) Unit!316)

(assert (=> d!2717 (= lt!3841 (choose!174 lm!238 p!262 lt!3801))))

(assert (=> d!2717 (forall!122 (toList!246 lm!238) p!262)))

(assert (=> d!2717 (= (removeValidProp!14 lm!238 p!262 lt!3801) lt!3841)))

(declare-fun bs!696 () Bool)

(assert (= bs!696 d!2717))

(assert (=> bs!696 m!10487))

(assert (=> bs!696 m!10479))

(declare-fun m!10575 () Bool)

(assert (=> bs!696 m!10575))

(assert (=> bs!696 m!10473))

(assert (=> b!15550 d!2717))

(declare-fun d!2731 () Bool)

(declare-fun res!11775 () Bool)

(declare-fun e!9509 () Bool)

(assert (=> d!2731 (=> res!11775 e!9509)))

(assert (=> d!2731 (= res!11775 ((_ is Nil!486) (toList!246 lm!238)))))

(assert (=> d!2731 (= (forall!122 (toList!246 lm!238) p!262) e!9509)))

(declare-fun b!15612 () Bool)

(declare-fun e!9510 () Bool)

(assert (=> b!15612 (= e!9509 e!9510)))

(declare-fun res!11776 () Bool)

(assert (=> b!15612 (=> (not res!11776) (not e!9510))))

(assert (=> b!15612 (= res!11776 (dynLambda!108 p!262 (h!1051 (toList!246 lm!238))))))

(declare-fun b!15613 () Bool)

(assert (=> b!15613 (= e!9510 (forall!122 (t!2927 (toList!246 lm!238)) p!262))))

(assert (= (and d!2731 (not res!11775)) b!15612))

(assert (= (and b!15612 res!11776) b!15613))

(declare-fun b_lambda!1053 () Bool)

(assert (=> (not b_lambda!1053) (not b!15612)))

(declare-fun t!2944 () Bool)

(declare-fun tb!439 () Bool)

(assert (=> (and start!2496 (= p!262 p!262) t!2944) tb!439))

(declare-fun result!769 () Bool)

(assert (=> tb!439 (= result!769 true)))

(assert (=> b!15612 t!2944))

(declare-fun b_and!979 () Bool)

(assert (= b_and!971 (and (=> t!2944 result!769) b_and!979)))

(declare-fun m!10583 () Bool)

(assert (=> b!15612 m!10583))

(declare-fun m!10585 () Bool)

(assert (=> b!15613 m!10585))

(assert (=> start!2496 d!2731))

(declare-fun d!2739 () Bool)

(declare-fun isStrictlySorted!141 (List!489) Bool)

(assert (=> d!2739 (= (inv!824 lm!238) (isStrictlySorted!141 (toList!246 lm!238)))))

(declare-fun bs!698 () Bool)

(assert (= bs!698 d!2739))

(declare-fun m!10591 () Bool)

(assert (=> bs!698 m!10591))

(assert (=> start!2496 d!2739))

(declare-fun d!2745 () Bool)

(assert (=> d!2745 (= (isEmpty!132 l!1612) ((_ is Nil!487) l!1612))))

(assert (=> b!15549 d!2745))

(declare-fun b!15632 () Bool)

(declare-fun e!9521 () Bool)

(declare-fun tp_is_empty!797 () Bool)

(declare-fun tp!2672 () Bool)

(assert (=> b!15632 (= e!9521 (and tp_is_empty!797 tp!2672))))

(assert (=> b!15551 (= tp!2651 e!9521)))

(assert (= (and b!15551 ((_ is Cons!485) (toList!246 lm!238))) b!15632))

(declare-fun b_lambda!1059 () Bool)

(assert (= b_lambda!1045 (or (and start!2496 b_free!517) b_lambda!1059)))

(declare-fun b_lambda!1062 () Bool)

(assert (= b_lambda!1053 (or (and start!2496 b_free!517) b_lambda!1062)))

(check-sat (not b!15613) (not b_lambda!1062) (not b!15581) (not d!2717) (not d!2739) (not b!15632) (not b_next!517) (not b_lambda!1059) b_and!979 tp_is_empty!797 (not b!15595) (not d!2703) (not b!15583))
(check-sat b_and!979 (not b_next!517))
