; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2550 () Bool)

(assert start!2550)

(declare-fun b_free!523 () Bool)

(declare-fun b_next!523 () Bool)

(assert (=> start!2550 (= b_free!523 (not b_next!523))))

(declare-fun tp!2678 () Bool)

(declare-fun b_and!981 () Bool)

(assert (=> start!2550 (= tp!2678 b_and!981)))

(declare-fun res!11781 () Bool)

(declare-fun e!9526 () Bool)

(assert (=> start!2550 (=> (not res!11781) (not e!9526))))

(declare-datatypes ((B!644 0))(
  ( (B!645 (val!420 Int)) )
))
(declare-datatypes ((tuple2!640 0))(
  ( (tuple2!641 (_1!320 (_ BitVec 64)) (_2!320 B!644)) )
))
(declare-datatypes ((List!499 0))(
  ( (Nil!496) (Cons!495 (h!1061 tuple2!640) (t!2949 List!499)) )
))
(declare-datatypes ((ListLongMap!471 0))(
  ( (ListLongMap!472 (toList!251 List!499)) )
))
(declare-fun lm!238 () ListLongMap!471)

(declare-fun p!262 () Int)

(declare-fun forall!125 (List!499 Int) Bool)

(assert (=> start!2550 (= res!11781 (forall!125 (toList!251 lm!238) p!262))))

(assert (=> start!2550 e!9526))

(declare-fun e!9527 () Bool)

(declare-fun inv!832 (ListLongMap!471) Bool)

(assert (=> start!2550 (and (inv!832 lm!238) e!9527)))

(assert (=> start!2550 tp!2678))

(assert (=> start!2550 true))

(declare-fun b!15639 () Bool)

(declare-fun res!11782 () Bool)

(assert (=> b!15639 (=> (not res!11782) (not e!9526))))

(declare-datatypes ((List!500 0))(
  ( (Nil!497) (Cons!496 (h!1062 (_ BitVec 64)) (t!2950 List!500)) )
))
(declare-fun l!1612 () List!500)

(declare-fun isEmpty!135 (List!500) Bool)

(assert (=> b!15639 (= res!11782 (not (isEmpty!135 l!1612)))))

(declare-fun b!15640 () Bool)

(declare-fun --!4 (ListLongMap!471 List!500) ListLongMap!471)

(assert (=> b!15640 (= e!9526 (not (forall!125 (toList!251 (--!4 lm!238 l!1612)) p!262)))))

(declare-fun lt!3855 () ListLongMap!471)

(declare-fun lt!3856 () List!500)

(assert (=> b!15640 (forall!125 (toList!251 (--!4 lt!3855 lt!3856)) p!262)))

(declare-datatypes ((Unit!312 0))(
  ( (Unit!313) )
))
(declare-fun lt!3858 () Unit!312)

(declare-fun removeAllValidProp!2 (ListLongMap!471 List!500 Int) Unit!312)

(assert (=> b!15640 (= lt!3858 (removeAllValidProp!2 lt!3855 lt!3856 p!262))))

(declare-fun tail!62 (List!500) List!500)

(assert (=> b!15640 (= lt!3856 (tail!62 l!1612))))

(assert (=> b!15640 (forall!125 (toList!251 lt!3855) p!262)))

(declare-fun lt!3854 () (_ BitVec 64))

(declare-fun -!24 (ListLongMap!471 (_ BitVec 64)) ListLongMap!471)

(assert (=> b!15640 (= lt!3855 (-!24 lm!238 lt!3854))))

(declare-fun lt!3857 () Unit!312)

(declare-fun removeValidProp!17 (ListLongMap!471 Int (_ BitVec 64)) Unit!312)

(assert (=> b!15640 (= lt!3857 (removeValidProp!17 lm!238 p!262 lt!3854))))

(declare-fun head!815 (List!500) (_ BitVec 64))

(assert (=> b!15640 (= lt!3854 (head!815 l!1612))))

(declare-fun b!15641 () Bool)

(declare-fun tp!2677 () Bool)

(assert (=> b!15641 (= e!9527 tp!2677)))

(assert (= (and start!2550 res!11781) b!15639))

(assert (= (and b!15639 res!11782) b!15640))

(assert (= start!2550 b!15641))

(declare-fun m!10601 () Bool)

(assert (=> start!2550 m!10601))

(declare-fun m!10603 () Bool)

(assert (=> start!2550 m!10603))

(declare-fun m!10605 () Bool)

(assert (=> b!15639 m!10605))

(declare-fun m!10607 () Bool)

(assert (=> b!15640 m!10607))

(declare-fun m!10609 () Bool)

(assert (=> b!15640 m!10609))

(declare-fun m!10611 () Bool)

(assert (=> b!15640 m!10611))

(declare-fun m!10613 () Bool)

(assert (=> b!15640 m!10613))

(declare-fun m!10615 () Bool)

(assert (=> b!15640 m!10615))

(declare-fun m!10617 () Bool)

(assert (=> b!15640 m!10617))

(declare-fun m!10619 () Bool)

(assert (=> b!15640 m!10619))

(declare-fun m!10621 () Bool)

(assert (=> b!15640 m!10621))

(declare-fun m!10623 () Bool)

(assert (=> b!15640 m!10623))

(declare-fun m!10625 () Bool)

(assert (=> b!15640 m!10625))

(push 1)

(assert (not b!15641))

(assert (not b!15639))

(assert (not b!15640))

(assert (not b_next!523))

(assert b_and!981)

(assert (not start!2550))

(check-sat)

(pop 1)

(push 1)

(assert b_and!981)

(assert (not b_next!523))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2749 () Bool)

(declare-fun res!11804 () Bool)

(declare-fun e!9549 () Bool)

(assert (=> d!2749 (=> res!11804 e!9549)))

(assert (=> d!2749 (= res!11804 (is-Nil!496 (toList!251 lm!238)))))

(assert (=> d!2749 (= (forall!125 (toList!251 lm!238) p!262) e!9549)))

(declare-fun b!15669 () Bool)

(declare-fun e!9551 () Bool)

(assert (=> b!15669 (= e!9549 e!9551)))

(declare-fun res!11806 () Bool)

(assert (=> b!15669 (=> (not res!11806) (not e!9551))))

(declare-fun dynLambda!111 (Int tuple2!640) Bool)

(assert (=> b!15669 (= res!11806 (dynLambda!111 p!262 (h!1061 (toList!251 lm!238))))))

(declare-fun b!15671 () Bool)

(assert (=> b!15671 (= e!9551 (forall!125 (t!2949 (toList!251 lm!238)) p!262))))

(assert (= (and d!2749 (not res!11804)) b!15669))

(assert (= (and b!15669 res!11806) b!15671))

(declare-fun b_lambda!1069 () Bool)

(assert (=> (not b_lambda!1069) (not b!15669)))

(declare-fun t!2957 () Bool)

(declare-fun tb!441 () Bool)

(assert (=> (and start!2550 (= p!262 p!262) t!2957) tb!441))

(declare-fun result!779 () Bool)

(assert (=> tb!441 (= result!779 true)))

(assert (=> b!15669 t!2957))

(declare-fun b_and!988 () Bool)

(assert (= b_and!981 (and (=> t!2957 result!779) b_and!988)))

(declare-fun m!10681 () Bool)

(assert (=> b!15669 m!10681))

(declare-fun m!10685 () Bool)

(assert (=> b!15671 m!10685))

(assert (=> start!2550 d!2749))

(declare-fun d!2757 () Bool)

(declare-fun isStrictlySorted!150 (List!499) Bool)

(assert (=> d!2757 (= (inv!832 lm!238) (isStrictlySorted!150 (toList!251 lm!238)))))

(declare-fun bs!702 () Bool)

(assert (= bs!702 d!2757))

(declare-fun m!10693 () Bool)

(assert (=> bs!702 m!10693))

(assert (=> start!2550 d!2757))

(declare-fun d!2762 () Bool)

(assert (=> d!2762 (= (tail!62 l!1612) (t!2950 l!1612))))

(assert (=> b!15640 d!2762))

(declare-fun d!2765 () Bool)

(declare-fun res!11813 () Bool)

(declare-fun e!9558 () Bool)

(assert (=> d!2765 (=> res!11813 e!9558)))

(assert (=> d!2765 (= res!11813 (is-Nil!496 (toList!251 lt!3855)))))

(assert (=> d!2765 (= (forall!125 (toList!251 lt!3855) p!262) e!9558)))

(declare-fun b!15678 () Bool)

(declare-fun e!9559 () Bool)

(assert (=> b!15678 (= e!9558 e!9559)))

(declare-fun res!11814 () Bool)

(assert (=> b!15678 (=> (not res!11814) (not e!9559))))

(assert (=> b!15678 (= res!11814 (dynLambda!111 p!262 (h!1061 (toList!251 lt!3855))))))

(declare-fun b!15679 () Bool)

(assert (=> b!15679 (= e!9559 (forall!125 (t!2949 (toList!251 lt!3855)) p!262))))

(assert (= (and d!2765 (not res!11813)) b!15678))

(assert (= (and b!15678 res!11814) b!15679))

(declare-fun b_lambda!1073 () Bool)

(assert (=> (not b_lambda!1073) (not b!15678)))

(declare-fun t!2962 () Bool)

(declare-fun tb!447 () Bool)

(assert (=> (and start!2550 (= p!262 p!262) t!2962) tb!447))

(declare-fun result!783 () Bool)

(assert (=> tb!447 (= result!783 true)))

(assert (=> b!15678 t!2962))

(declare-fun b_and!993 () Bool)

(assert (= b_and!988 (and (=> t!2962 result!783) b_and!993)))

(declare-fun m!10697 () Bool)

(assert (=> b!15678 m!10697))

(declare-fun m!10699 () Bool)

(assert (=> b!15679 m!10699))

(assert (=> b!15640 d!2765))

(declare-fun d!2771 () Bool)

(declare-fun c!1477 () Bool)

(assert (=> d!2771 (= c!1477 (is-Nil!497 l!1612))))

(declare-fun e!9568 () ListLongMap!471)

(assert (=> d!2771 (= (--!4 lm!238 l!1612) e!9568)))

(declare-fun b!15692 () Bool)

(assert (=> b!15692 (= e!9568 lm!238)))

(declare-fun b!15693 () Bool)

(assert (=> b!15693 (= e!9568 (--!4 (-!24 lm!238 (h!1062 l!1612)) (t!2950 l!1612)))))

(assert (= (and d!2771 c!1477) b!15692))

(assert (= (and d!2771 (not c!1477)) b!15693))

(declare-fun m!10709 () Bool)

(assert (=> b!15693 m!10709))

(assert (=> b!15693 m!10709))

(declare-fun m!10711 () Bool)

(assert (=> b!15693 m!10711))

(assert (=> b!15640 d!2771))

(declare-fun d!2785 () Bool)

(declare-fun lt!3893 () ListLongMap!471)

(declare-fun contains!201 (ListLongMap!471 (_ BitVec 64)) Bool)

(assert (=> d!2785 (not (contains!201 lt!3893 lt!3854))))

(declare-fun removeStrictlySorted!13 (List!499 (_ BitVec 64)) List!499)

(assert (=> d!2785 (= lt!3893 (ListLongMap!472 (removeStrictlySorted!13 (toList!251 lm!238) lt!3854)))))

(assert (=> d!2785 (= (-!24 lm!238 lt!3854) lt!3893)))

(declare-fun bs!705 () Bool)

(assert (= bs!705 d!2785))

(declare-fun m!10725 () Bool)

(assert (=> bs!705 m!10725))

(declare-fun m!10727 () Bool)

(assert (=> bs!705 m!10727))

(assert (=> b!15640 d!2785))

(declare-fun d!2793 () Bool)

(assert (=> d!2793 (forall!125 (toList!251 (-!24 lm!238 lt!3854)) p!262)))

(declare-fun lt!3900 () Unit!312)

(declare-fun choose!178 (ListLongMap!471 Int (_ BitVec 64)) Unit!312)

(assert (=> d!2793 (= lt!3900 (choose!178 lm!238 p!262 lt!3854))))

(assert (=> d!2793 (forall!125 (toList!251 lm!238) p!262)))

(assert (=> d!2793 (= (removeValidProp!17 lm!238 p!262 lt!3854) lt!3900)))

(declare-fun bs!708 () Bool)

(assert (= bs!708 d!2793))

(assert (=> bs!708 m!10607))

(declare-fun m!10753 () Bool)

(assert (=> bs!708 m!10753))

(declare-fun m!10755 () Bool)

(assert (=> bs!708 m!10755))

(assert (=> bs!708 m!10601))

(assert (=> b!15640 d!2793))

(declare-fun d!2811 () Bool)

(assert (=> d!2811 (= (head!815 l!1612) (h!1062 l!1612))))

(assert (=> b!15640 d!2811))

(declare-fun d!2813 () Bool)

(declare-fun res!11827 () Bool)

(declare-fun e!9583 () Bool)

(assert (=> d!2813 (=> res!11827 e!9583)))

(assert (=> d!2813 (= res!11827 (is-Nil!496 (toList!251 (--!4 lt!3855 lt!3856))))))

(assert (=> d!2813 (= (forall!125 (toList!251 (--!4 lt!3855 lt!3856)) p!262) e!9583)))

(declare-fun b!15714 () Bool)

(declare-fun e!9584 () Bool)

(assert (=> b!15714 (= e!9583 e!9584)))

(declare-fun res!11828 () Bool)

(assert (=> b!15714 (=> (not res!11828) (not e!9584))))

(assert (=> b!15714 (= res!11828 (dynLambda!111 p!262 (h!1061 (toList!251 (--!4 lt!3855 lt!3856)))))))

(declare-fun b!15715 () Bool)

(assert (=> b!15715 (= e!9584 (forall!125 (t!2949 (toList!251 (--!4 lt!3855 lt!3856))) p!262))))

(assert (= (and d!2813 (not res!11827)) b!15714))

(assert (= (and b!15714 res!11828) b!15715))

(declare-fun b_lambda!1087 () Bool)

(assert (=> (not b_lambda!1087) (not b!15714)))

(declare-fun t!2976 () Bool)

(declare-fun tb!461 () Bool)

(assert (=> (and start!2550 (= p!262 p!262) t!2976) tb!461))

(declare-fun result!797 () Bool)

(assert (=> tb!461 (= result!797 true)))

(assert (=> b!15714 t!2976))

(declare-fun b_and!1007 () Bool)

(assert (= b_and!993 (and (=> t!2976 result!797) b_and!1007)))

(declare-fun m!10757 () Bool)

(assert (=> b!15714 m!10757))

(declare-fun m!10759 () Bool)

(assert (=> b!15715 m!10759))

(assert (=> b!15640 d!2813))

(declare-fun d!2815 () Bool)

(declare-fun c!1484 () Bool)

(assert (=> d!2815 (= c!1484 (is-Nil!497 lt!3856))))

(declare-fun e!9585 () ListLongMap!471)

(assert (=> d!2815 (= (--!4 lt!3855 lt!3856) e!9585)))

(declare-fun b!15716 () Bool)

(assert (=> b!15716 (= e!9585 lt!3855)))

(declare-fun b!15717 () Bool)

(assert (=> b!15717 (= e!9585 (--!4 (-!24 lt!3855 (h!1062 lt!3856)) (t!2950 lt!3856)))))

(assert (= (and d!2815 c!1484) b!15716))

(assert (= (and d!2815 (not c!1484)) b!15717))

(declare-fun m!10761 () Bool)

(assert (=> b!15717 m!10761))

(assert (=> b!15717 m!10761))

(declare-fun m!10763 () Bool)

(assert (=> b!15717 m!10763))

(assert (=> b!15640 d!2815))

(declare-fun d!2817 () Bool)

(declare-fun res!11829 () Bool)

(declare-fun e!9586 () Bool)

(assert (=> d!2817 (=> res!11829 e!9586)))

(assert (=> d!2817 (= res!11829 (is-Nil!496 (toList!251 (--!4 lm!238 l!1612))))))

(assert (=> d!2817 (= (forall!125 (toList!251 (--!4 lm!238 l!1612)) p!262) e!9586)))

(declare-fun b!15718 () Bool)

(declare-fun e!9587 () Bool)

(assert (=> b!15718 (= e!9586 e!9587)))

(declare-fun res!11830 () Bool)

(assert (=> b!15718 (=> (not res!11830) (not e!9587))))

(assert (=> b!15718 (= res!11830 (dynLambda!111 p!262 (h!1061 (toList!251 (--!4 lm!238 l!1612)))))))

(declare-fun b!15719 () Bool)

(assert (=> b!15719 (= e!9587 (forall!125 (t!2949 (toList!251 (--!4 lm!238 l!1612))) p!262))))

(assert (= (and d!2817 (not res!11829)) b!15718))

(assert (= (and b!15718 res!11830) b!15719))

(declare-fun b_lambda!1089 () Bool)

(assert (=> (not b_lambda!1089) (not b!15718)))

(declare-fun t!2978 () Bool)

(declare-fun tb!463 () Bool)

(assert (=> (and start!2550 (= p!262 p!262) t!2978) tb!463))

(declare-fun result!799 () Bool)

(assert (=> tb!463 (= result!799 true)))

(assert (=> b!15718 t!2978))

(declare-fun b_and!1009 () Bool)

(assert (= b_and!1007 (and (=> t!2978 result!799) b_and!1009)))

(declare-fun m!10765 () Bool)

(assert (=> b!15718 m!10765))

(declare-fun m!10767 () Bool)

(assert (=> b!15719 m!10767))

(assert (=> b!15640 d!2817))

