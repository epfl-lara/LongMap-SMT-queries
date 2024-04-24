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

(declare-fun res!11737 () Bool)

(declare-fun e!9460 () Bool)

(assert (=> start!2496 (=> (not res!11737) (not e!9460))))

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

(assert (=> start!2496 (= res!11737 (forall!122 (toList!246 lm!238) p!262))))

(assert (=> start!2496 e!9460))

(declare-fun e!9459 () Bool)

(declare-fun inv!824 (ListLongMap!461) Bool)

(assert (=> start!2496 (and (inv!824 lm!238) e!9459)))

(assert (=> start!2496 tp!2650))

(assert (=> start!2496 true))

(declare-fun b!15543 () Bool)

(declare-fun res!11738 () Bool)

(assert (=> b!15543 (=> (not res!11738) (not e!9460))))

(declare-datatypes ((List!490 0))(
  ( (Nil!487) (Cons!486 (h!1052 (_ BitVec 64)) (t!2928 List!490)) )
))
(declare-fun l!1612 () List!490)

(declare-fun isEmpty!132 (List!490) Bool)

(assert (=> b!15543 (= res!11738 (not (isEmpty!132 l!1612)))))

(declare-fun b!15544 () Bool)

(declare-fun ListPrimitiveSize!31 (List!490) Int)

(declare-fun tail!59 (List!490) List!490)

(assert (=> b!15544 (= e!9460 (not (< (ListPrimitiveSize!31 (tail!59 l!1612)) (ListPrimitiveSize!31 l!1612))))))

(declare-fun lt!3800 () (_ BitVec 64))

(declare-fun -!21 (ListLongMap!461 (_ BitVec 64)) ListLongMap!461)

(assert (=> b!15544 (forall!122 (toList!246 (-!21 lm!238 lt!3800)) p!262)))

(declare-datatypes ((Unit!316 0))(
  ( (Unit!317) )
))
(declare-fun lt!3801 () Unit!316)

(declare-fun removeValidProp!14 (ListLongMap!461 Int (_ BitVec 64)) Unit!316)

(assert (=> b!15544 (= lt!3801 (removeValidProp!14 lm!238 p!262 lt!3800))))

(declare-fun head!810 (List!490) (_ BitVec 64))

(assert (=> b!15544 (= lt!3800 (head!810 l!1612))))

(declare-fun b!15545 () Bool)

(declare-fun tp!2651 () Bool)

(assert (=> b!15545 (= e!9459 tp!2651)))

(assert (= (and start!2496 res!11737) b!15543))

(assert (= (and b!15543 res!11738) b!15544))

(assert (= start!2496 b!15545))

(declare-fun m!10473 () Bool)

(assert (=> start!2496 m!10473))

(declare-fun m!10475 () Bool)

(assert (=> start!2496 m!10475))

(declare-fun m!10477 () Bool)

(assert (=> b!15543 m!10477))

(declare-fun m!10479 () Bool)

(assert (=> b!15544 m!10479))

(declare-fun m!10481 () Bool)

(assert (=> b!15544 m!10481))

(declare-fun m!10483 () Bool)

(assert (=> b!15544 m!10483))

(declare-fun m!10485 () Bool)

(assert (=> b!15544 m!10485))

(declare-fun m!10487 () Bool)

(assert (=> b!15544 m!10487))

(declare-fun m!10489 () Bool)

(assert (=> b!15544 m!10489))

(declare-fun m!10491 () Bool)

(assert (=> b!15544 m!10491))

(assert (=> b!15544 m!10489))

(check-sat (not b!15543) (not b!15544) (not b_next!517) (not b!15545) b_and!963 (not start!2496))
(check-sat b_and!963 (not b_next!517))
(get-model)

(declare-fun d!2685 () Bool)

(get-info :version)

(assert (=> d!2685 (= (isEmpty!132 l!1612) ((_ is Nil!487) l!1612))))

(assert (=> b!15543 d!2685))

(declare-fun d!2687 () Bool)

(declare-fun res!11761 () Bool)

(declare-fun e!9483 () Bool)

(assert (=> d!2687 (=> res!11761 e!9483)))

(assert (=> d!2687 (= res!11761 ((_ is Nil!486) (toList!246 lm!238)))))

(assert (=> d!2687 (= (forall!122 (toList!246 lm!238) p!262) e!9483)))

(declare-fun b!15574 () Bool)

(declare-fun e!9484 () Bool)

(assert (=> b!15574 (= e!9483 e!9484)))

(declare-fun res!11762 () Bool)

(assert (=> b!15574 (=> (not res!11762) (not e!9484))))

(declare-fun dynLambda!106 (Int tuple2!630) Bool)

(assert (=> b!15574 (= res!11762 (dynLambda!106 p!262 (h!1051 (toList!246 lm!238))))))

(declare-fun b!15575 () Bool)

(assert (=> b!15575 (= e!9484 (forall!122 (t!2927 (toList!246 lm!238)) p!262))))

(assert (= (and d!2687 (not res!11761)) b!15574))

(assert (= (and b!15574 res!11762) b!15575))

(declare-fun b_lambda!1045 () Bool)

(assert (=> (not b_lambda!1045) (not b!15574)))

(declare-fun t!2936 () Bool)

(declare-fun tb!431 () Bool)

(assert (=> (and start!2496 (= p!262 p!262) t!2936) tb!431))

(declare-fun result!761 () Bool)

(assert (=> tb!431 (= result!761 true)))

(assert (=> b!15574 t!2936))

(declare-fun b_and!971 () Bool)

(assert (= b_and!963 (and (=> t!2936 result!761) b_and!971)))

(declare-fun m!10537 () Bool)

(assert (=> b!15574 m!10537))

(declare-fun m!10539 () Bool)

(assert (=> b!15575 m!10539))

(assert (=> start!2496 d!2687))

(declare-fun d!2691 () Bool)

(declare-fun isStrictlySorted!137 (List!489) Bool)

(assert (=> d!2691 (= (inv!824 lm!238) (isStrictlySorted!137 (toList!246 lm!238)))))

(declare-fun bs!691 () Bool)

(assert (= bs!691 d!2691))

(declare-fun m!10543 () Bool)

(assert (=> bs!691 m!10543))

(assert (=> start!2496 d!2691))

(declare-fun d!2697 () Bool)

(assert (=> d!2697 (forall!122 (toList!246 (-!21 lm!238 lt!3800)) p!262)))

(declare-fun lt!3819 () Unit!316)

(declare-fun choose!174 (ListLongMap!461 Int (_ BitVec 64)) Unit!316)

(assert (=> d!2697 (= lt!3819 (choose!174 lm!238 p!262 lt!3800))))

(assert (=> d!2697 (forall!122 (toList!246 lm!238) p!262)))

(assert (=> d!2697 (= (removeValidProp!14 lm!238 p!262 lt!3800) lt!3819)))

(declare-fun bs!692 () Bool)

(assert (= bs!692 d!2697))

(assert (=> bs!692 m!10485))

(assert (=> bs!692 m!10481))

(declare-fun m!10551 () Bool)

(assert (=> bs!692 m!10551))

(assert (=> bs!692 m!10473))

(assert (=> b!15544 d!2697))

(declare-fun d!2713 () Bool)

(declare-fun lt!3824 () Int)

(assert (=> d!2713 (>= lt!3824 0)))

(declare-fun e!9494 () Int)

(assert (=> d!2713 (= lt!3824 e!9494)))

(declare-fun c!1466 () Bool)

(assert (=> d!2713 (= c!1466 ((_ is Nil!487) l!1612))))

(assert (=> d!2713 (= (ListPrimitiveSize!31 l!1612) lt!3824)))

(declare-fun b!15592 () Bool)

(assert (=> b!15592 (= e!9494 0)))

(declare-fun b!15593 () Bool)

(assert (=> b!15593 (= e!9494 (+ 1 (ListPrimitiveSize!31 (t!2928 l!1612))))))

(assert (= (and d!2713 c!1466) b!15592))

(assert (= (and d!2713 (not c!1466)) b!15593))

(declare-fun m!10553 () Bool)

(assert (=> b!15593 m!10553))

(assert (=> b!15544 d!2713))

(declare-fun d!2717 () Bool)

(assert (=> d!2717 (= (head!810 l!1612) (h!1052 l!1612))))

(assert (=> b!15544 d!2717))

(declare-fun d!2721 () Bool)

(declare-fun lt!3826 () Int)

(assert (=> d!2721 (>= lt!3826 0)))

(declare-fun e!9496 () Int)

(assert (=> d!2721 (= lt!3826 e!9496)))

(declare-fun c!1468 () Bool)

(assert (=> d!2721 (= c!1468 ((_ is Nil!487) (tail!59 l!1612)))))

(assert (=> d!2721 (= (ListPrimitiveSize!31 (tail!59 l!1612)) lt!3826)))

(declare-fun b!15596 () Bool)

(assert (=> b!15596 (= e!9496 0)))

(declare-fun b!15597 () Bool)

(assert (=> b!15597 (= e!9496 (+ 1 (ListPrimitiveSize!31 (t!2928 (tail!59 l!1612)))))))

(assert (= (and d!2721 c!1468) b!15596))

(assert (= (and d!2721 (not c!1468)) b!15597))

(declare-fun m!10557 () Bool)

(assert (=> b!15597 m!10557))

(assert (=> b!15544 d!2721))

(declare-fun d!2723 () Bool)

(declare-fun res!11765 () Bool)

(declare-fun e!9497 () Bool)

(assert (=> d!2723 (=> res!11765 e!9497)))

(assert (=> d!2723 (= res!11765 ((_ is Nil!486) (toList!246 (-!21 lm!238 lt!3800))))))

(assert (=> d!2723 (= (forall!122 (toList!246 (-!21 lm!238 lt!3800)) p!262) e!9497)))

(declare-fun b!15598 () Bool)

(declare-fun e!9498 () Bool)

(assert (=> b!15598 (= e!9497 e!9498)))

(declare-fun res!11766 () Bool)

(assert (=> b!15598 (=> (not res!11766) (not e!9498))))

(assert (=> b!15598 (= res!11766 (dynLambda!106 p!262 (h!1051 (toList!246 (-!21 lm!238 lt!3800)))))))

(declare-fun b!15599 () Bool)

(assert (=> b!15599 (= e!9498 (forall!122 (t!2927 (toList!246 (-!21 lm!238 lt!3800))) p!262))))

(assert (= (and d!2723 (not res!11765)) b!15598))

(assert (= (and b!15598 res!11766) b!15599))

(declare-fun b_lambda!1049 () Bool)

(assert (=> (not b_lambda!1049) (not b!15598)))

(declare-fun t!2940 () Bool)

(declare-fun tb!435 () Bool)

(assert (=> (and start!2496 (= p!262 p!262) t!2940) tb!435))

(declare-fun result!765 () Bool)

(assert (=> tb!435 (= result!765 true)))

(assert (=> b!15598 t!2940))

(declare-fun b_and!975 () Bool)

(assert (= b_and!971 (and (=> t!2940 result!765) b_and!975)))

(declare-fun m!10559 () Bool)

(assert (=> b!15598 m!10559))

(declare-fun m!10561 () Bool)

(assert (=> b!15599 m!10561))

(assert (=> b!15544 d!2723))

(declare-fun d!2725 () Bool)

(assert (=> d!2725 (= (tail!59 l!1612) (t!2928 l!1612))))

(assert (=> b!15544 d!2725))

(declare-fun d!2727 () Bool)

(declare-fun lt!3835 () ListLongMap!461)

(declare-fun contains!194 (ListLongMap!461 (_ BitVec 64)) Bool)

(assert (=> d!2727 (not (contains!194 lt!3835 lt!3800))))

(declare-fun removeStrictlySorted!8 (List!489 (_ BitVec 64)) List!489)

(assert (=> d!2727 (= lt!3835 (ListLongMap!462 (removeStrictlySorted!8 (toList!246 lm!238) lt!3800)))))

(assert (=> d!2727 (= (-!21 lm!238 lt!3800) lt!3835)))

(declare-fun bs!694 () Bool)

(assert (= bs!694 d!2727))

(declare-fun m!10573 () Bool)

(assert (=> bs!694 m!10573))

(declare-fun m!10575 () Bool)

(assert (=> bs!694 m!10575))

(assert (=> b!15544 d!2727))

(declare-fun b!15616 () Bool)

(declare-fun e!9510 () Bool)

(declare-fun tp_is_empty!793 () Bool)

(declare-fun tp!2668 () Bool)

(assert (=> b!15616 (= e!9510 (and tp_is_empty!793 tp!2668))))

(assert (=> b!15545 (= tp!2651 e!9510)))

(assert (= (and b!15545 ((_ is Cons!485) (toList!246 lm!238))) b!15616))

(declare-fun b_lambda!1053 () Bool)

(assert (= b_lambda!1045 (or (and start!2496 b_free!517) b_lambda!1053)))

(declare-fun b_lambda!1055 () Bool)

(assert (= b_lambda!1049 (or (and start!2496 b_free!517) b_lambda!1055)))

(check-sat (not b_next!517) (not b!15593) (not b_lambda!1053) b_and!975 (not d!2697) (not b!15597) (not b!15616) (not b_lambda!1055) (not b!15599) (not b!15575) tp_is_empty!793 (not d!2691) (not d!2727))
(check-sat b_and!975 (not b_next!517))
