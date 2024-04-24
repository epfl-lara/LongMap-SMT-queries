; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2550 () Bool)

(assert start!2550)

(declare-fun b_free!523 () Bool)

(declare-fun b_next!523 () Bool)

(assert (=> start!2550 (= b_free!523 (not b_next!523))))

(declare-fun tp!2677 () Bool)

(declare-fun b_and!981 () Bool)

(assert (=> start!2550 (= tp!2677 b_and!981)))

(declare-fun res!11780 () Bool)

(declare-fun e!9522 () Bool)

(assert (=> start!2550 (=> (not res!11780) (not e!9522))))

(declare-datatypes ((B!644 0))(
  ( (B!645 (val!420 Int)) )
))
(declare-datatypes ((tuple2!636 0))(
  ( (tuple2!637 (_1!318 (_ BitVec 64)) (_2!318 B!644)) )
))
(declare-datatypes ((List!495 0))(
  ( (Nil!492) (Cons!491 (h!1057 tuple2!636) (t!2945 List!495)) )
))
(declare-datatypes ((ListLongMap!467 0))(
  ( (ListLongMap!468 (toList!249 List!495)) )
))
(declare-fun lm!238 () ListLongMap!467)

(declare-fun p!262 () Int)

(declare-fun forall!125 (List!495 Int) Bool)

(assert (=> start!2550 (= res!11780 (forall!125 (toList!249 lm!238) p!262))))

(assert (=> start!2550 e!9522))

(declare-fun e!9523 () Bool)

(declare-fun inv!832 (ListLongMap!467) Bool)

(assert (=> start!2550 (and (inv!832 lm!238) e!9523)))

(assert (=> start!2550 tp!2677))

(assert (=> start!2550 true))

(declare-fun b!15633 () Bool)

(declare-fun res!11779 () Bool)

(assert (=> b!15633 (=> (not res!11779) (not e!9522))))

(declare-datatypes ((List!496 0))(
  ( (Nil!493) (Cons!492 (h!1058 (_ BitVec 64)) (t!2946 List!496)) )
))
(declare-fun l!1612 () List!496)

(declare-fun isEmpty!135 (List!496) Bool)

(assert (=> b!15633 (= res!11779 (not (isEmpty!135 l!1612)))))

(declare-fun b!15634 () Bool)

(declare-fun --!4 (ListLongMap!467 List!496) ListLongMap!467)

(assert (=> b!15634 (= e!9522 (not (forall!125 (toList!249 (--!4 lm!238 l!1612)) p!262)))))

(declare-fun lt!3855 () ListLongMap!467)

(declare-fun lt!3857 () List!496)

(assert (=> b!15634 (forall!125 (toList!249 (--!4 lt!3855 lt!3857)) p!262)))

(declare-datatypes ((Unit!322 0))(
  ( (Unit!323) )
))
(declare-fun lt!3858 () Unit!322)

(declare-fun removeAllValidProp!2 (ListLongMap!467 List!496 Int) Unit!322)

(assert (=> b!15634 (= lt!3858 (removeAllValidProp!2 lt!3855 lt!3857 p!262))))

(declare-fun tail!62 (List!496) List!496)

(assert (=> b!15634 (= lt!3857 (tail!62 l!1612))))

(assert (=> b!15634 (forall!125 (toList!249 lt!3855) p!262)))

(declare-fun lt!3856 () (_ BitVec 64))

(declare-fun -!24 (ListLongMap!467 (_ BitVec 64)) ListLongMap!467)

(assert (=> b!15634 (= lt!3855 (-!24 lm!238 lt!3856))))

(declare-fun lt!3854 () Unit!322)

(declare-fun removeValidProp!17 (ListLongMap!467 Int (_ BitVec 64)) Unit!322)

(assert (=> b!15634 (= lt!3854 (removeValidProp!17 lm!238 p!262 lt!3856))))

(declare-fun head!813 (List!496) (_ BitVec 64))

(assert (=> b!15634 (= lt!3856 (head!813 l!1612))))

(declare-fun b!15635 () Bool)

(declare-fun tp!2678 () Bool)

(assert (=> b!15635 (= e!9523 tp!2678)))

(assert (= (and start!2550 res!11780) b!15633))

(assert (= (and b!15633 res!11779) b!15634))

(assert (= start!2550 b!15635))

(declare-fun m!10593 () Bool)

(assert (=> start!2550 m!10593))

(declare-fun m!10595 () Bool)

(assert (=> start!2550 m!10595))

(declare-fun m!10597 () Bool)

(assert (=> b!15633 m!10597))

(declare-fun m!10599 () Bool)

(assert (=> b!15634 m!10599))

(declare-fun m!10601 () Bool)

(assert (=> b!15634 m!10601))

(declare-fun m!10603 () Bool)

(assert (=> b!15634 m!10603))

(declare-fun m!10605 () Bool)

(assert (=> b!15634 m!10605))

(declare-fun m!10607 () Bool)

(assert (=> b!15634 m!10607))

(declare-fun m!10609 () Bool)

(assert (=> b!15634 m!10609))

(declare-fun m!10611 () Bool)

(assert (=> b!15634 m!10611))

(declare-fun m!10613 () Bool)

(assert (=> b!15634 m!10613))

(declare-fun m!10615 () Bool)

(assert (=> b!15634 m!10615))

(declare-fun m!10617 () Bool)

(assert (=> b!15634 m!10617))

(check-sat b_and!981 (not b!15634) (not b_next!523) (not b!15635) (not start!2550) (not b!15633))
(check-sat b_and!981 (not b_next!523))
(get-model)

(declare-fun d!2747 () Bool)

(declare-fun res!11797 () Bool)

(declare-fun e!9540 () Bool)

(assert (=> d!2747 (=> res!11797 e!9540)))

(get-info :version)

(assert (=> d!2747 (= res!11797 ((_ is Nil!492) (toList!249 lm!238)))))

(assert (=> d!2747 (= (forall!125 (toList!249 lm!238) p!262) e!9540)))

(declare-fun b!15658 () Bool)

(declare-fun e!9541 () Bool)

(assert (=> b!15658 (= e!9540 e!9541)))

(declare-fun res!11798 () Bool)

(assert (=> b!15658 (=> (not res!11798) (not e!9541))))

(declare-fun dynLambda!108 (Int tuple2!636) Bool)

(assert (=> b!15658 (= res!11798 (dynLambda!108 p!262 (h!1057 (toList!249 lm!238))))))

(declare-fun b!15659 () Bool)

(assert (=> b!15659 (= e!9541 (forall!125 (t!2945 (toList!249 lm!238)) p!262))))

(assert (= (and d!2747 (not res!11797)) b!15658))

(assert (= (and b!15658 res!11798) b!15659))

(declare-fun b_lambda!1067 () Bool)

(assert (=> (not b_lambda!1067) (not b!15658)))

(declare-fun t!2952 () Bool)

(declare-fun tb!441 () Bool)

(assert (=> (and start!2550 (= p!262 p!262) t!2952) tb!441))

(declare-fun result!777 () Bool)

(assert (=> tb!441 (= result!777 true)))

(assert (=> b!15658 t!2952))

(declare-fun b_and!987 () Bool)

(assert (= b_and!981 (and (=> t!2952 result!777) b_and!987)))

(declare-fun m!10673 () Bool)

(assert (=> b!15658 m!10673))

(declare-fun m!10675 () Bool)

(assert (=> b!15659 m!10675))

(assert (=> start!2550 d!2747))

(declare-fun d!2755 () Bool)

(declare-fun isStrictlySorted!139 (List!495) Bool)

(assert (=> d!2755 (= (inv!832 lm!238) (isStrictlySorted!139 (toList!249 lm!238)))))

(declare-fun bs!703 () Bool)

(assert (= bs!703 d!2755))

(declare-fun m!10677 () Bool)

(assert (=> bs!703 m!10677))

(assert (=> start!2550 d!2755))

(declare-fun d!2757 () Bool)

(declare-fun c!1473 () Bool)

(assert (=> d!2757 (= c!1473 ((_ is Nil!493) l!1612))))

(declare-fun e!9544 () ListLongMap!467)

(assert (=> d!2757 (= (--!4 lm!238 l!1612) e!9544)))

(declare-fun b!15664 () Bool)

(assert (=> b!15664 (= e!9544 lm!238)))

(declare-fun b!15665 () Bool)

(assert (=> b!15665 (= e!9544 (--!4 (-!24 lm!238 (h!1058 l!1612)) (t!2946 l!1612)))))

(assert (= (and d!2757 c!1473) b!15664))

(assert (= (and d!2757 (not c!1473)) b!15665))

(declare-fun m!10679 () Bool)

(assert (=> b!15665 m!10679))

(assert (=> b!15665 m!10679))

(declare-fun m!10681 () Bool)

(assert (=> b!15665 m!10681))

(assert (=> b!15634 d!2757))

(declare-fun d!2759 () Bool)

(assert (=> d!2759 (forall!125 (toList!249 (-!24 lm!238 lt!3856)) p!262)))

(declare-fun lt!3900 () Unit!322)

(declare-fun choose!177 (ListLongMap!467 Int (_ BitVec 64)) Unit!322)

(assert (=> d!2759 (= lt!3900 (choose!177 lm!238 p!262 lt!3856))))

(assert (=> d!2759 (forall!125 (toList!249 lm!238) p!262)))

(assert (=> d!2759 (= (removeValidProp!17 lm!238 p!262 lt!3856) lt!3900)))

(declare-fun bs!706 () Bool)

(assert (= bs!706 d!2759))

(assert (=> bs!706 m!10615))

(declare-fun m!10699 () Bool)

(assert (=> bs!706 m!10699))

(declare-fun m!10701 () Bool)

(assert (=> bs!706 m!10701))

(assert (=> bs!706 m!10593))

(assert (=> b!15634 d!2759))

(declare-fun d!2771 () Bool)

(declare-fun res!11799 () Bool)

(declare-fun e!9549 () Bool)

(assert (=> d!2771 (=> res!11799 e!9549)))

(assert (=> d!2771 (= res!11799 ((_ is Nil!492) (toList!249 (--!4 lt!3855 lt!3857))))))

(assert (=> d!2771 (= (forall!125 (toList!249 (--!4 lt!3855 lt!3857)) p!262) e!9549)))

(declare-fun b!15674 () Bool)

(declare-fun e!9550 () Bool)

(assert (=> b!15674 (= e!9549 e!9550)))

(declare-fun res!11800 () Bool)

(assert (=> b!15674 (=> (not res!11800) (not e!9550))))

(assert (=> b!15674 (= res!11800 (dynLambda!108 p!262 (h!1057 (toList!249 (--!4 lt!3855 lt!3857)))))))

(declare-fun b!15675 () Bool)

(assert (=> b!15675 (= e!9550 (forall!125 (t!2945 (toList!249 (--!4 lt!3855 lt!3857))) p!262))))

(assert (= (and d!2771 (not res!11799)) b!15674))

(assert (= (and b!15674 res!11800) b!15675))

(declare-fun b_lambda!1069 () Bool)

(assert (=> (not b_lambda!1069) (not b!15674)))

(declare-fun t!2954 () Bool)

(declare-fun tb!443 () Bool)

(assert (=> (and start!2550 (= p!262 p!262) t!2954) tb!443))

(declare-fun result!779 () Bool)

(assert (=> tb!443 (= result!779 true)))

(assert (=> b!15674 t!2954))

(declare-fun b_and!989 () Bool)

(assert (= b_and!987 (and (=> t!2954 result!779) b_and!989)))

(declare-fun m!10703 () Bool)

(assert (=> b!15674 m!10703))

(declare-fun m!10705 () Bool)

(assert (=> b!15675 m!10705))

(assert (=> b!15634 d!2771))

(declare-fun d!2773 () Bool)

(assert (=> d!2773 (= (head!813 l!1612) (h!1058 l!1612))))

(assert (=> b!15634 d!2773))

(declare-fun d!2775 () Bool)

(declare-fun lt!3903 () ListLongMap!467)

(declare-fun contains!199 (ListLongMap!467 (_ BitVec 64)) Bool)

(assert (=> d!2775 (not (contains!199 lt!3903 lt!3856))))

(declare-fun removeStrictlySorted!13 (List!495 (_ BitVec 64)) List!495)

(assert (=> d!2775 (= lt!3903 (ListLongMap!468 (removeStrictlySorted!13 (toList!249 lm!238) lt!3856)))))

(assert (=> d!2775 (= (-!24 lm!238 lt!3856) lt!3903)))

(declare-fun bs!707 () Bool)

(assert (= bs!707 d!2775))

(declare-fun m!10719 () Bool)

(assert (=> bs!707 m!10719))

(declare-fun m!10721 () Bool)

(assert (=> bs!707 m!10721))

(assert (=> b!15634 d!2775))

(declare-fun d!2783 () Bool)

(declare-fun res!11807 () Bool)

(declare-fun e!9561 () Bool)

(assert (=> d!2783 (=> res!11807 e!9561)))

(assert (=> d!2783 (= res!11807 ((_ is Nil!492) (toList!249 lt!3855)))))

(assert (=> d!2783 (= (forall!125 (toList!249 lt!3855) p!262) e!9561)))

(declare-fun b!15690 () Bool)

(declare-fun e!9562 () Bool)

(assert (=> b!15690 (= e!9561 e!9562)))

(declare-fun res!11808 () Bool)

(assert (=> b!15690 (=> (not res!11808) (not e!9562))))

(assert (=> b!15690 (= res!11808 (dynLambda!108 p!262 (h!1057 (toList!249 lt!3855))))))

(declare-fun b!15691 () Bool)

(assert (=> b!15691 (= e!9562 (forall!125 (t!2945 (toList!249 lt!3855)) p!262))))

(assert (= (and d!2783 (not res!11807)) b!15690))

(assert (= (and b!15690 res!11808) b!15691))

(declare-fun b_lambda!1073 () Bool)

(assert (=> (not b_lambda!1073) (not b!15690)))

(declare-fun t!2958 () Bool)

(declare-fun tb!447 () Bool)

(assert (=> (and start!2550 (= p!262 p!262) t!2958) tb!447))

(declare-fun result!783 () Bool)

(assert (=> tb!447 (= result!783 true)))

(assert (=> b!15690 t!2958))

(declare-fun b_and!993 () Bool)

(assert (= b_and!989 (and (=> t!2958 result!783) b_and!993)))

(declare-fun m!10723 () Bool)

(assert (=> b!15690 m!10723))

(declare-fun m!10725 () Bool)

(assert (=> b!15691 m!10725))

(assert (=> b!15634 d!2783))

(declare-fun d!2785 () Bool)

(declare-fun c!1482 () Bool)

(assert (=> d!2785 (= c!1482 ((_ is Nil!493) lt!3857))))

(declare-fun e!9563 () ListLongMap!467)

(assert (=> d!2785 (= (--!4 lt!3855 lt!3857) e!9563)))

(declare-fun b!15692 () Bool)

(assert (=> b!15692 (= e!9563 lt!3855)))

(declare-fun b!15693 () Bool)

(assert (=> b!15693 (= e!9563 (--!4 (-!24 lt!3855 (h!1058 lt!3857)) (t!2946 lt!3857)))))

(assert (= (and d!2785 c!1482) b!15692))

(assert (= (and d!2785 (not c!1482)) b!15693))

(declare-fun m!10731 () Bool)

(assert (=> b!15693 m!10731))

(assert (=> b!15693 m!10731))

(declare-fun m!10733 () Bool)

(assert (=> b!15693 m!10733))

(assert (=> b!15634 d!2785))

(declare-fun d!2789 () Bool)

(declare-fun res!11811 () Bool)

(declare-fun e!9566 () Bool)

(assert (=> d!2789 (=> res!11811 e!9566)))

(assert (=> d!2789 (= res!11811 ((_ is Nil!492) (toList!249 (--!4 lm!238 l!1612))))))

(assert (=> d!2789 (= (forall!125 (toList!249 (--!4 lm!238 l!1612)) p!262) e!9566)))

(declare-fun b!15696 () Bool)

(declare-fun e!9567 () Bool)

(assert (=> b!15696 (= e!9566 e!9567)))

(declare-fun res!11812 () Bool)

(assert (=> b!15696 (=> (not res!11812) (not e!9567))))

(assert (=> b!15696 (= res!11812 (dynLambda!108 p!262 (h!1057 (toList!249 (--!4 lm!238 l!1612)))))))

(declare-fun b!15697 () Bool)

(assert (=> b!15697 (= e!9567 (forall!125 (t!2945 (toList!249 (--!4 lm!238 l!1612))) p!262))))

(assert (= (and d!2789 (not res!11811)) b!15696))

(assert (= (and b!15696 res!11812) b!15697))

(declare-fun b_lambda!1077 () Bool)

(assert (=> (not b_lambda!1077) (not b!15696)))

(declare-fun t!2962 () Bool)

(declare-fun tb!451 () Bool)

(assert (=> (and start!2550 (= p!262 p!262) t!2962) tb!451))

(declare-fun result!787 () Bool)

(assert (=> tb!451 (= result!787 true)))

(assert (=> b!15696 t!2962))

(declare-fun b_and!997 () Bool)

(assert (= b_and!993 (and (=> t!2962 result!787) b_and!997)))

(declare-fun m!10739 () Bool)

(assert (=> b!15696 m!10739))

(declare-fun m!10741 () Bool)

(assert (=> b!15697 m!10741))

(assert (=> b!15634 d!2789))

(declare-fun d!2793 () Bool)

(assert (=> d!2793 (= (tail!62 l!1612) (t!2946 l!1612))))

(assert (=> b!15634 d!2793))

(declare-fun d!2797 () Bool)

(assert (=> d!2797 (forall!125 (toList!249 (--!4 lt!3855 lt!3857)) p!262)))

(declare-fun lt!3914 () Unit!322)

(declare-fun choose!181 (ListLongMap!467 List!496 Int) Unit!322)

(assert (=> d!2797 (= lt!3914 (choose!181 lt!3855 lt!3857 p!262))))

(assert (=> d!2797 (forall!125 (toList!249 lt!3855) p!262)))

(assert (=> d!2797 (= (removeAllValidProp!2 lt!3855 lt!3857 p!262) lt!3914)))

(declare-fun bs!711 () Bool)

(assert (= bs!711 d!2797))

(assert (=> bs!711 m!10603))

(assert (=> bs!711 m!10607))

(declare-fun m!10757 () Bool)

(assert (=> bs!711 m!10757))

(assert (=> bs!711 m!10605))

(assert (=> b!15634 d!2797))

(declare-fun d!2809 () Bool)

(assert (=> d!2809 (= (isEmpty!135 l!1612) ((_ is Nil!493) l!1612))))

(assert (=> b!15633 d!2809))

(declare-fun b!15711 () Bool)

(declare-fun e!9577 () Bool)

(declare-fun tp_is_empty!801 () Bool)

(declare-fun tp!2696 () Bool)

(assert (=> b!15711 (= e!9577 (and tp_is_empty!801 tp!2696))))

(assert (=> b!15635 (= tp!2678 e!9577)))

(assert (= (and b!15635 ((_ is Cons!491) (toList!249 lm!238))) b!15711))

(declare-fun b_lambda!1091 () Bool)

(assert (= b_lambda!1073 (or (and start!2550 b_free!523) b_lambda!1091)))

(declare-fun b_lambda!1093 () Bool)

(assert (= b_lambda!1069 (or (and start!2550 b_free!523) b_lambda!1093)))

(declare-fun b_lambda!1095 () Bool)

(assert (= b_lambda!1077 (or (and start!2550 b_free!523) b_lambda!1095)))

(declare-fun b_lambda!1097 () Bool)

(assert (= b_lambda!1067 (or (and start!2550 b_free!523) b_lambda!1097)))

(check-sat (not b_lambda!1097) tp_is_empty!801 (not b!15659) (not d!2755) (not b!15697) (not d!2775) (not b!15665) (not b_next!523) (not d!2797) (not b!15693) b_and!997 (not b!15711) (not b!15675) (not b!15691) (not d!2759) (not b_lambda!1093) (not b_lambda!1095) (not b_lambda!1091))
(check-sat b_and!997 (not b_next!523))
