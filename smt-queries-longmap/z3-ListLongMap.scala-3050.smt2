; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42982 () Bool)

(assert start!42982)

(declare-fun b_free!12109 () Bool)

(declare-fun b_next!12109 () Bool)

(assert (=> start!42982 (= b_free!12109 (not b_next!12109))))

(declare-fun tp!42429 () Bool)

(declare-fun b_and!20829 () Bool)

(assert (=> start!42982 (= tp!42429 b_and!20829)))

(declare-fun b!477656 () Bool)

(declare-fun e!280695 () Bool)

(declare-fun e!280694 () Bool)

(assert (=> b!477656 (= e!280695 e!280694)))

(declare-fun res!285101 () Bool)

(assert (=> b!477656 (=> (not res!285101) (not e!280694))))

(declare-fun p!166 () Int)

(declare-datatypes ((B!1058 0))(
  ( (B!1059 (val!6813 Int)) )
))
(declare-datatypes ((tuple2!8922 0))(
  ( (tuple2!8923 (_1!4472 (_ BitVec 64)) (_2!4472 B!1058)) )
))
(declare-fun lt!217587 () tuple2!8922)

(declare-fun dynLambda!944 (Int tuple2!8922) Bool)

(assert (=> b!477656 (= res!285101 (dynLambda!944 p!166 lt!217587))))

(declare-fun a!501 () (_ BitVec 64))

(declare-fun b!85 () B!1058)

(assert (=> b!477656 (= lt!217587 (tuple2!8923 a!501 b!85))))

(declare-fun res!285102 () Bool)

(assert (=> start!42982 (=> (not res!285102) (not e!280695))))

(declare-datatypes ((List!8965 0))(
  ( (Nil!8962) (Cons!8961 (h!9817 tuple2!8922) (t!15120 List!8965)) )
))
(declare-datatypes ((ListLongMap!7837 0))(
  ( (ListLongMap!7838 (toList!3934 List!8965)) )
))
(declare-fun lm!215 () ListLongMap!7837)

(declare-fun forall!200 (List!8965 Int) Bool)

(assert (=> start!42982 (= res!285102 (forall!200 (toList!3934 lm!215) p!166))))

(assert (=> start!42982 e!280695))

(declare-fun e!280696 () Bool)

(declare-fun inv!15503 (ListLongMap!7837) Bool)

(assert (=> start!42982 (and (inv!15503 lm!215) e!280696)))

(assert (=> start!42982 tp!42429))

(declare-fun tp_is_empty!13531 () Bool)

(assert (=> start!42982 tp_is_empty!13531))

(assert (=> start!42982 true))

(declare-fun b!477658 () Bool)

(declare-fun +!1775 (ListLongMap!7837 tuple2!8922) ListLongMap!7837)

(assert (=> b!477658 (= e!280694 (not (forall!200 (toList!3934 (+!1775 lm!215 lt!217587)) p!166)))))

(declare-fun b!477659 () Bool)

(declare-fun tp!42430 () Bool)

(assert (=> b!477659 (= e!280696 tp!42430)))

(declare-fun b!477657 () Bool)

(declare-fun res!285100 () Bool)

(assert (=> b!477657 (=> (not res!285100) (not e!280694))))

(declare-fun isEmpty!616 (ListLongMap!7837) Bool)

(assert (=> b!477657 (= res!285100 (isEmpty!616 lm!215))))

(assert (= (and start!42982 res!285102) b!477656))

(assert (= (and b!477656 res!285101) b!477657))

(assert (= (and b!477657 res!285100) b!477658))

(assert (= start!42982 b!477659))

(declare-fun b_lambda!10721 () Bool)

(assert (=> (not b_lambda!10721) (not b!477656)))

(declare-fun t!15119 () Bool)

(declare-fun tb!4109 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15119) tb!4109))

(declare-fun result!7677 () Bool)

(assert (=> tb!4109 (= result!7677 true)))

(assert (=> b!477656 t!15119))

(declare-fun b_and!20831 () Bool)

(assert (= b_and!20829 (and (=> t!15119 result!7677) b_and!20831)))

(declare-fun m!460335 () Bool)

(assert (=> b!477656 m!460335))

(declare-fun m!460337 () Bool)

(assert (=> start!42982 m!460337))

(declare-fun m!460339 () Bool)

(assert (=> start!42982 m!460339))

(declare-fun m!460341 () Bool)

(assert (=> b!477658 m!460341))

(declare-fun m!460343 () Bool)

(assert (=> b!477658 m!460343))

(declare-fun m!460345 () Bool)

(assert (=> b!477657 m!460345))

(check-sat (not b!477658) b_and!20831 (not b!477657) (not b_lambda!10721) tp_is_empty!13531 (not start!42982) (not b_next!12109) (not b!477659))
(check-sat b_and!20831 (not b_next!12109))
(get-model)

(declare-fun b_lambda!10731 () Bool)

(assert (= b_lambda!10721 (or (and start!42982 b_free!12109) b_lambda!10731)))

(check-sat (not b!477658) b_and!20831 (not b!477657) tp_is_empty!13531 (not b_lambda!10731) (not start!42982) (not b_next!12109) (not b!477659))
(check-sat b_and!20831 (not b_next!12109))
(get-model)

(declare-fun d!76407 () Bool)

(declare-fun res!285139 () Bool)

(declare-fun e!280733 () Bool)

(assert (=> d!76407 (=> res!285139 e!280733)))

(get-info :version)

(assert (=> d!76407 (= res!285139 ((_ is Nil!8962) (toList!3934 lm!215)))))

(assert (=> d!76407 (= (forall!200 (toList!3934 lm!215) p!166) e!280733)))

(declare-fun b!477702 () Bool)

(declare-fun e!280734 () Bool)

(assert (=> b!477702 (= e!280733 e!280734)))

(declare-fun res!285140 () Bool)

(assert (=> b!477702 (=> (not res!285140) (not e!280734))))

(assert (=> b!477702 (= res!285140 (dynLambda!944 p!166 (h!9817 (toList!3934 lm!215))))))

(declare-fun b!477703 () Bool)

(assert (=> b!477703 (= e!280734 (forall!200 (t!15120 (toList!3934 lm!215)) p!166))))

(assert (= (and d!76407 (not res!285139)) b!477702))

(assert (= (and b!477702 res!285140) b!477703))

(declare-fun b_lambda!10739 () Bool)

(assert (=> (not b_lambda!10739) (not b!477702)))

(declare-fun t!15134 () Bool)

(declare-fun tb!4121 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15134) tb!4121))

(declare-fun result!7689 () Bool)

(assert (=> tb!4121 (= result!7689 true)))

(assert (=> b!477702 t!15134))

(declare-fun b_and!20847 () Bool)

(assert (= b_and!20831 (and (=> t!15134 result!7689) b_and!20847)))

(declare-fun m!460387 () Bool)

(assert (=> b!477702 m!460387))

(declare-fun m!460389 () Bool)

(assert (=> b!477703 m!460389))

(assert (=> start!42982 d!76407))

(declare-fun d!76417 () Bool)

(declare-fun isStrictlySorted!380 (List!8965) Bool)

(assert (=> d!76417 (= (inv!15503 lm!215) (isStrictlySorted!380 (toList!3934 lm!215)))))

(declare-fun bs!15206 () Bool)

(assert (= bs!15206 d!76417))

(declare-fun m!460399 () Bool)

(assert (=> bs!15206 m!460399))

(assert (=> start!42982 d!76417))

(declare-fun d!76425 () Bool)

(declare-fun isEmpty!621 (List!8965) Bool)

(assert (=> d!76425 (= (isEmpty!616 lm!215) (isEmpty!621 (toList!3934 lm!215)))))

(declare-fun bs!15207 () Bool)

(assert (= bs!15207 d!76425))

(declare-fun m!460401 () Bool)

(assert (=> bs!15207 m!460401))

(assert (=> b!477657 d!76425))

(declare-fun d!76427 () Bool)

(declare-fun res!285143 () Bool)

(declare-fun e!280737 () Bool)

(assert (=> d!76427 (=> res!285143 e!280737)))

(assert (=> d!76427 (= res!285143 ((_ is Nil!8962) (toList!3934 (+!1775 lm!215 lt!217587))))))

(assert (=> d!76427 (= (forall!200 (toList!3934 (+!1775 lm!215 lt!217587)) p!166) e!280737)))

(declare-fun b!477706 () Bool)

(declare-fun e!280738 () Bool)

(assert (=> b!477706 (= e!280737 e!280738)))

(declare-fun res!285144 () Bool)

(assert (=> b!477706 (=> (not res!285144) (not e!280738))))

(assert (=> b!477706 (= res!285144 (dynLambda!944 p!166 (h!9817 (toList!3934 (+!1775 lm!215 lt!217587)))))))

(declare-fun b!477707 () Bool)

(assert (=> b!477707 (= e!280738 (forall!200 (t!15120 (toList!3934 (+!1775 lm!215 lt!217587))) p!166))))

(assert (= (and d!76427 (not res!285143)) b!477706))

(assert (= (and b!477706 res!285144) b!477707))

(declare-fun b_lambda!10743 () Bool)

(assert (=> (not b_lambda!10743) (not b!477706)))

(declare-fun t!15138 () Bool)

(declare-fun tb!4125 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15138) tb!4125))

(declare-fun result!7693 () Bool)

(assert (=> tb!4125 (= result!7693 true)))

(assert (=> b!477706 t!15138))

(declare-fun b_and!20851 () Bool)

(assert (= b_and!20847 (and (=> t!15138 result!7693) b_and!20851)))

(declare-fun m!460403 () Bool)

(assert (=> b!477706 m!460403))

(declare-fun m!460405 () Bool)

(assert (=> b!477707 m!460405))

(assert (=> b!477658 d!76427))

(declare-fun d!76429 () Bool)

(declare-fun e!280753 () Bool)

(assert (=> d!76429 e!280753))

(declare-fun res!285161 () Bool)

(assert (=> d!76429 (=> (not res!285161) (not e!280753))))

(declare-fun lt!217626 () ListLongMap!7837)

(declare-fun contains!2557 (ListLongMap!7837 (_ BitVec 64)) Bool)

(assert (=> d!76429 (= res!285161 (contains!2557 lt!217626 (_1!4472 lt!217587)))))

(declare-fun lt!217628 () List!8965)

(assert (=> d!76429 (= lt!217626 (ListLongMap!7838 lt!217628))))

(declare-datatypes ((Unit!14022 0))(
  ( (Unit!14023) )
))
(declare-fun lt!217629 () Unit!14022)

(declare-fun lt!217627 () Unit!14022)

(assert (=> d!76429 (= lt!217629 lt!217627)))

(declare-datatypes ((Option!397 0))(
  ( (Some!396 (v!9100 B!1058)) (None!395) )
))
(declare-fun getValueByKey!391 (List!8965 (_ BitVec 64)) Option!397)

(assert (=> d!76429 (= (getValueByKey!391 lt!217628 (_1!4472 lt!217587)) (Some!396 (_2!4472 lt!217587)))))

(declare-fun lemmaContainsTupThenGetReturnValue!213 (List!8965 (_ BitVec 64) B!1058) Unit!14022)

(assert (=> d!76429 (= lt!217627 (lemmaContainsTupThenGetReturnValue!213 lt!217628 (_1!4472 lt!217587) (_2!4472 lt!217587)))))

(declare-fun insertStrictlySorted!216 (List!8965 (_ BitVec 64) B!1058) List!8965)

(assert (=> d!76429 (= lt!217628 (insertStrictlySorted!216 (toList!3934 lm!215) (_1!4472 lt!217587) (_2!4472 lt!217587)))))

(assert (=> d!76429 (= (+!1775 lm!215 lt!217587) lt!217626)))

(declare-fun b!477734 () Bool)

(declare-fun res!285162 () Bool)

(assert (=> b!477734 (=> (not res!285162) (not e!280753))))

(assert (=> b!477734 (= res!285162 (= (getValueByKey!391 (toList!3934 lt!217626) (_1!4472 lt!217587)) (Some!396 (_2!4472 lt!217587))))))

(declare-fun b!477735 () Bool)

(declare-fun contains!2559 (List!8965 tuple2!8922) Bool)

(assert (=> b!477735 (= e!280753 (contains!2559 (toList!3934 lt!217626) lt!217587))))

(assert (= (and d!76429 res!285161) b!477734))

(assert (= (and b!477734 res!285162) b!477735))

(declare-fun m!460431 () Bool)

(assert (=> d!76429 m!460431))

(declare-fun m!460433 () Bool)

(assert (=> d!76429 m!460433))

(declare-fun m!460435 () Bool)

(assert (=> d!76429 m!460435))

(declare-fun m!460437 () Bool)

(assert (=> d!76429 m!460437))

(declare-fun m!460439 () Bool)

(assert (=> b!477734 m!460439))

(declare-fun m!460441 () Bool)

(assert (=> b!477735 m!460441))

(assert (=> b!477658 d!76429))

(declare-fun b!477740 () Bool)

(declare-fun e!280756 () Bool)

(declare-fun tp!42451 () Bool)

(assert (=> b!477740 (= e!280756 (and tp_is_empty!13531 tp!42451))))

(assert (=> b!477659 (= tp!42430 e!280756)))

(assert (= (and b!477659 ((_ is Cons!8961) (toList!3934 lm!215))) b!477740))

(declare-fun b_lambda!10753 () Bool)

(assert (= b_lambda!10739 (or (and start!42982 b_free!12109) b_lambda!10753)))

(declare-fun b_lambda!10755 () Bool)

(assert (= b_lambda!10743 (or (and start!42982 b_free!12109) b_lambda!10755)))

(check-sat (not b!477703) b_and!20851 (not d!76417) (not b!477734) (not b_lambda!10753) (not b_next!12109) (not d!76425) (not b_lambda!10755) (not b!477707) tp_is_empty!13531 (not d!76429) (not b!477740) (not b_lambda!10731) (not b!477735))
(check-sat b_and!20851 (not b_next!12109))
(get-model)

(declare-fun d!76437 () Bool)

(declare-fun res!285165 () Bool)

(declare-fun e!280759 () Bool)

(assert (=> d!76437 (=> res!285165 e!280759)))

(assert (=> d!76437 (= res!285165 ((_ is Nil!8962) (t!15120 (toList!3934 (+!1775 lm!215 lt!217587)))))))

(assert (=> d!76437 (= (forall!200 (t!15120 (toList!3934 (+!1775 lm!215 lt!217587))) p!166) e!280759)))

(declare-fun b!477743 () Bool)

(declare-fun e!280760 () Bool)

(assert (=> b!477743 (= e!280759 e!280760)))

(declare-fun res!285166 () Bool)

(assert (=> b!477743 (=> (not res!285166) (not e!280760))))

(assert (=> b!477743 (= res!285166 (dynLambda!944 p!166 (h!9817 (t!15120 (toList!3934 (+!1775 lm!215 lt!217587))))))))

(declare-fun b!477744 () Bool)

(assert (=> b!477744 (= e!280760 (forall!200 (t!15120 (t!15120 (toList!3934 (+!1775 lm!215 lt!217587)))) p!166))))

(assert (= (and d!76437 (not res!285165)) b!477743))

(assert (= (and b!477743 res!285166) b!477744))

(declare-fun b_lambda!10759 () Bool)

(assert (=> (not b_lambda!10759) (not b!477743)))

(declare-fun t!15142 () Bool)

(declare-fun tb!4129 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15142) tb!4129))

(declare-fun result!7703 () Bool)

(assert (=> tb!4129 (= result!7703 true)))

(assert (=> b!477743 t!15142))

(declare-fun b_and!20855 () Bool)

(assert (= b_and!20851 (and (=> t!15142 result!7703) b_and!20855)))

(declare-fun m!460447 () Bool)

(assert (=> b!477743 m!460447))

(declare-fun m!460449 () Bool)

(assert (=> b!477744 m!460449))

(assert (=> b!477707 d!76437))

(declare-fun d!76439 () Bool)

(declare-fun e!280773 () Bool)

(assert (=> d!76439 e!280773))

(declare-fun res!285171 () Bool)

(assert (=> d!76439 (=> res!285171 e!280773)))

(declare-fun lt!217638 () Bool)

(assert (=> d!76439 (= res!285171 (not lt!217638))))

(declare-fun lt!217639 () Bool)

(assert (=> d!76439 (= lt!217638 lt!217639)))

(declare-fun lt!217641 () Unit!14022)

(declare-fun e!280774 () Unit!14022)

(assert (=> d!76439 (= lt!217641 e!280774)))

(declare-fun c!57538 () Bool)

(assert (=> d!76439 (= c!57538 lt!217639)))

(declare-fun containsKey!351 (List!8965 (_ BitVec 64)) Bool)

(assert (=> d!76439 (= lt!217639 (containsKey!351 (toList!3934 lt!217626) (_1!4472 lt!217587)))))

(assert (=> d!76439 (= (contains!2557 lt!217626 (_1!4472 lt!217587)) lt!217638)))

(declare-fun b!477765 () Bool)

(declare-fun lt!217640 () Unit!14022)

(assert (=> b!477765 (= e!280774 lt!217640)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!299 (List!8965 (_ BitVec 64)) Unit!14022)

(assert (=> b!477765 (= lt!217640 (lemmaContainsKeyImpliesGetValueByKeyDefined!299 (toList!3934 lt!217626) (_1!4472 lt!217587)))))

(declare-fun isDefined!300 (Option!397) Bool)

(assert (=> b!477765 (isDefined!300 (getValueByKey!391 (toList!3934 lt!217626) (_1!4472 lt!217587)))))

(declare-fun b!477766 () Bool)

(declare-fun Unit!14026 () Unit!14022)

(assert (=> b!477766 (= e!280774 Unit!14026)))

(declare-fun b!477767 () Bool)

(assert (=> b!477767 (= e!280773 (isDefined!300 (getValueByKey!391 (toList!3934 lt!217626) (_1!4472 lt!217587))))))

(assert (= (and d!76439 c!57538) b!477765))

(assert (= (and d!76439 (not c!57538)) b!477766))

(assert (= (and d!76439 (not res!285171)) b!477767))

(declare-fun m!460457 () Bool)

(assert (=> d!76439 m!460457))

(declare-fun m!460459 () Bool)

(assert (=> b!477765 m!460459))

(assert (=> b!477765 m!460439))

(assert (=> b!477765 m!460439))

(declare-fun m!460461 () Bool)

(assert (=> b!477765 m!460461))

(assert (=> b!477767 m!460439))

(assert (=> b!477767 m!460439))

(assert (=> b!477767 m!460461))

(assert (=> d!76429 d!76439))

(declare-fun b!477792 () Bool)

(declare-fun e!280790 () Option!397)

(assert (=> b!477792 (= e!280790 None!395)))

(declare-fun b!477789 () Bool)

(declare-fun e!280789 () Option!397)

(assert (=> b!477789 (= e!280789 (Some!396 (_2!4472 (h!9817 lt!217628))))))

(declare-fun b!477791 () Bool)

(assert (=> b!477791 (= e!280790 (getValueByKey!391 (t!15120 lt!217628) (_1!4472 lt!217587)))))

(declare-fun d!76445 () Bool)

(declare-fun c!57546 () Bool)

(assert (=> d!76445 (= c!57546 (and ((_ is Cons!8961) lt!217628) (= (_1!4472 (h!9817 lt!217628)) (_1!4472 lt!217587))))))

(assert (=> d!76445 (= (getValueByKey!391 lt!217628 (_1!4472 lt!217587)) e!280789)))

(declare-fun b!477790 () Bool)

(assert (=> b!477790 (= e!280789 e!280790)))

(declare-fun c!57547 () Bool)

(assert (=> b!477790 (= c!57547 (and ((_ is Cons!8961) lt!217628) (not (= (_1!4472 (h!9817 lt!217628)) (_1!4472 lt!217587)))))))

(assert (= (and d!76445 c!57546) b!477789))

(assert (= (and d!76445 (not c!57546)) b!477790))

(assert (= (and b!477790 c!57547) b!477791))

(assert (= (and b!477790 (not c!57547)) b!477792))

(declare-fun m!460475 () Bool)

(assert (=> b!477791 m!460475))

(assert (=> d!76429 d!76445))

(declare-fun d!76453 () Bool)

(assert (=> d!76453 (= (getValueByKey!391 lt!217628 (_1!4472 lt!217587)) (Some!396 (_2!4472 lt!217587)))))

(declare-fun lt!217658 () Unit!14022)

(declare-fun choose!1376 (List!8965 (_ BitVec 64) B!1058) Unit!14022)

(assert (=> d!76453 (= lt!217658 (choose!1376 lt!217628 (_1!4472 lt!217587) (_2!4472 lt!217587)))))

(declare-fun e!280803 () Bool)

(assert (=> d!76453 e!280803))

(declare-fun res!285187 () Bool)

(assert (=> d!76453 (=> (not res!285187) (not e!280803))))

(assert (=> d!76453 (= res!285187 (isStrictlySorted!380 lt!217628))))

(assert (=> d!76453 (= (lemmaContainsTupThenGetReturnValue!213 lt!217628 (_1!4472 lt!217587) (_2!4472 lt!217587)) lt!217658)))

(declare-fun b!477817 () Bool)

(declare-fun res!285188 () Bool)

(assert (=> b!477817 (=> (not res!285188) (not e!280803))))

(assert (=> b!477817 (= res!285188 (containsKey!351 lt!217628 (_1!4472 lt!217587)))))

(declare-fun b!477818 () Bool)

(assert (=> b!477818 (= e!280803 (contains!2559 lt!217628 (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587))))))

(assert (= (and d!76453 res!285187) b!477817))

(assert (= (and b!477817 res!285188) b!477818))

(assert (=> d!76453 m!460433))

(declare-fun m!460483 () Bool)

(assert (=> d!76453 m!460483))

(declare-fun m!460485 () Bool)

(assert (=> d!76453 m!460485))

(declare-fun m!460487 () Bool)

(assert (=> b!477817 m!460487))

(declare-fun m!460489 () Bool)

(assert (=> b!477818 m!460489))

(assert (=> d!76429 d!76453))

(declare-fun b!477879 () Bool)

(declare-fun c!57575 () Bool)

(assert (=> b!477879 (= c!57575 (and ((_ is Cons!8961) (toList!3934 lm!215)) (bvsgt (_1!4472 (h!9817 (toList!3934 lm!215))) (_1!4472 lt!217587))))))

(declare-fun e!280842 () List!8965)

(declare-fun e!280841 () List!8965)

(assert (=> b!477879 (= e!280842 e!280841)))

(declare-fun b!477880 () Bool)

(declare-fun e!280844 () List!8965)

(assert (=> b!477880 (= e!280844 (insertStrictlySorted!216 (t!15120 (toList!3934 lm!215)) (_1!4472 lt!217587) (_2!4472 lt!217587)))))

(declare-fun b!477881 () Bool)

(declare-fun e!280845 () List!8965)

(declare-fun call!30793 () List!8965)

(assert (=> b!477881 (= e!280845 call!30793)))

(declare-fun b!477882 () Bool)

(declare-fun res!285213 () Bool)

(declare-fun e!280843 () Bool)

(assert (=> b!477882 (=> (not res!285213) (not e!280843))))

(declare-fun lt!217675 () List!8965)

(assert (=> b!477882 (= res!285213 (containsKey!351 lt!217675 (_1!4472 lt!217587)))))

(declare-fun b!477883 () Bool)

(declare-fun call!30792 () List!8965)

(assert (=> b!477883 (= e!280841 call!30792)))

(declare-fun b!477884 () Bool)

(assert (=> b!477884 (= e!280843 (contains!2559 lt!217675 (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587))))))

(declare-fun bm!30789 () Bool)

(declare-fun call!30794 () List!8965)

(assert (=> bm!30789 (= call!30792 call!30794)))

(declare-fun c!57574 () Bool)

(declare-fun bm!30790 () Bool)

(declare-fun $colon$colon!112 (List!8965 tuple2!8922) List!8965)

(assert (=> bm!30790 (= call!30793 ($colon$colon!112 e!280844 (ite c!57574 (h!9817 (toList!3934 lm!215)) (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587)))))))

(declare-fun c!57577 () Bool)

(assert (=> bm!30790 (= c!57577 c!57574)))

(declare-fun b!477885 () Bool)

(assert (=> b!477885 (= e!280845 e!280842)))

(declare-fun c!57576 () Bool)

(assert (=> b!477885 (= c!57576 (and ((_ is Cons!8961) (toList!3934 lm!215)) (= (_1!4472 (h!9817 (toList!3934 lm!215))) (_1!4472 lt!217587))))))

(declare-fun b!477886 () Bool)

(assert (=> b!477886 (= e!280841 call!30792)))

(declare-fun d!76461 () Bool)

(assert (=> d!76461 e!280843))

(declare-fun res!285214 () Bool)

(assert (=> d!76461 (=> (not res!285214) (not e!280843))))

(assert (=> d!76461 (= res!285214 (isStrictlySorted!380 lt!217675))))

(assert (=> d!76461 (= lt!217675 e!280845)))

(assert (=> d!76461 (= c!57574 (and ((_ is Cons!8961) (toList!3934 lm!215)) (bvslt (_1!4472 (h!9817 (toList!3934 lm!215))) (_1!4472 lt!217587))))))

(assert (=> d!76461 (isStrictlySorted!380 (toList!3934 lm!215))))

(assert (=> d!76461 (= (insertStrictlySorted!216 (toList!3934 lm!215) (_1!4472 lt!217587) (_2!4472 lt!217587)) lt!217675)))

(declare-fun b!477887 () Bool)

(assert (=> b!477887 (= e!280842 call!30794)))

(declare-fun b!477888 () Bool)

(assert (=> b!477888 (= e!280844 (ite c!57576 (t!15120 (toList!3934 lm!215)) (ite c!57575 (Cons!8961 (h!9817 (toList!3934 lm!215)) (t!15120 (toList!3934 lm!215))) Nil!8962)))))

(declare-fun bm!30791 () Bool)

(assert (=> bm!30791 (= call!30794 call!30793)))

(assert (= (and d!76461 c!57574) b!477881))

(assert (= (and d!76461 (not c!57574)) b!477885))

(assert (= (and b!477885 c!57576) b!477887))

(assert (= (and b!477885 (not c!57576)) b!477879))

(assert (= (and b!477879 c!57575) b!477883))

(assert (= (and b!477879 (not c!57575)) b!477886))

(assert (= (or b!477883 b!477886) bm!30789))

(assert (= (or b!477887 bm!30789) bm!30791))

(assert (= (or b!477881 bm!30791) bm!30790))

(assert (= (and bm!30790 c!57577) b!477880))

(assert (= (and bm!30790 (not c!57577)) b!477888))

(assert (= (and d!76461 res!285214) b!477882))

(assert (= (and b!477882 res!285213) b!477884))

(declare-fun m!460513 () Bool)

(assert (=> d!76461 m!460513))

(assert (=> d!76461 m!460399))

(declare-fun m!460515 () Bool)

(assert (=> bm!30790 m!460515))

(declare-fun m!460517 () Bool)

(assert (=> b!477882 m!460517))

(declare-fun m!460519 () Bool)

(assert (=> b!477880 m!460519))

(declare-fun m!460521 () Bool)

(assert (=> b!477884 m!460521))

(assert (=> d!76429 d!76461))

(declare-fun b!477909 () Bool)

(declare-fun e!280856 () Option!397)

(assert (=> b!477909 (= e!280856 None!395)))

(declare-fun b!477906 () Bool)

(declare-fun e!280855 () Option!397)

(assert (=> b!477906 (= e!280855 (Some!396 (_2!4472 (h!9817 (toList!3934 lt!217626)))))))

(declare-fun b!477908 () Bool)

(assert (=> b!477908 (= e!280856 (getValueByKey!391 (t!15120 (toList!3934 lt!217626)) (_1!4472 lt!217587)))))

(declare-fun d!76473 () Bool)

(declare-fun c!57585 () Bool)

(assert (=> d!76473 (= c!57585 (and ((_ is Cons!8961) (toList!3934 lt!217626)) (= (_1!4472 (h!9817 (toList!3934 lt!217626))) (_1!4472 lt!217587))))))

(assert (=> d!76473 (= (getValueByKey!391 (toList!3934 lt!217626) (_1!4472 lt!217587)) e!280855)))

(declare-fun b!477907 () Bool)

(assert (=> b!477907 (= e!280855 e!280856)))

(declare-fun c!57586 () Bool)

(assert (=> b!477907 (= c!57586 (and ((_ is Cons!8961) (toList!3934 lt!217626)) (not (= (_1!4472 (h!9817 (toList!3934 lt!217626))) (_1!4472 lt!217587)))))))

(assert (= (and d!76473 c!57585) b!477906))

(assert (= (and d!76473 (not c!57585)) b!477907))

(assert (= (and b!477907 c!57586) b!477908))

(assert (= (and b!477907 (not c!57586)) b!477909))

(declare-fun m!460525 () Bool)

(assert (=> b!477908 m!460525))

(assert (=> b!477734 d!76473))

(declare-fun d!76477 () Bool)

(declare-fun lt!217685 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!211 (List!8965) (InoxSet tuple2!8922))

(assert (=> d!76477 (= lt!217685 (select (content!211 (toList!3934 lt!217626)) lt!217587))))

(declare-fun e!280870 () Bool)

(assert (=> d!76477 (= lt!217685 e!280870)))

(declare-fun res!285233 () Bool)

(assert (=> d!76477 (=> (not res!285233) (not e!280870))))

(assert (=> d!76477 (= res!285233 ((_ is Cons!8961) (toList!3934 lt!217626)))))

(assert (=> d!76477 (= (contains!2559 (toList!3934 lt!217626) lt!217587) lt!217685)))

(declare-fun b!477924 () Bool)

(declare-fun e!280869 () Bool)

(assert (=> b!477924 (= e!280870 e!280869)))

(declare-fun res!285232 () Bool)

(assert (=> b!477924 (=> res!285232 e!280869)))

(assert (=> b!477924 (= res!285232 (= (h!9817 (toList!3934 lt!217626)) lt!217587))))

(declare-fun b!477925 () Bool)

(assert (=> b!477925 (= e!280869 (contains!2559 (t!15120 (toList!3934 lt!217626)) lt!217587))))

(assert (= (and d!76477 res!285233) b!477924))

(assert (= (and b!477924 (not res!285232)) b!477925))

(declare-fun m!460539 () Bool)

(assert (=> d!76477 m!460539))

(declare-fun m!460541 () Bool)

(assert (=> d!76477 m!460541))

(declare-fun m!460543 () Bool)

(assert (=> b!477925 m!460543))

(assert (=> b!477735 d!76477))

(declare-fun d!76483 () Bool)

(assert (=> d!76483 (= (isEmpty!621 (toList!3934 lm!215)) ((_ is Nil!8962) (toList!3934 lm!215)))))

(assert (=> d!76425 d!76483))

(declare-fun d!76487 () Bool)

(declare-fun res!285246 () Bool)

(declare-fun e!280883 () Bool)

(assert (=> d!76487 (=> res!285246 e!280883)))

(assert (=> d!76487 (= res!285246 (or ((_ is Nil!8962) (toList!3934 lm!215)) ((_ is Nil!8962) (t!15120 (toList!3934 lm!215)))))))

(assert (=> d!76487 (= (isStrictlySorted!380 (toList!3934 lm!215)) e!280883)))

(declare-fun b!477939 () Bool)

(declare-fun e!280884 () Bool)

(assert (=> b!477939 (= e!280883 e!280884)))

(declare-fun res!285247 () Bool)

(assert (=> b!477939 (=> (not res!285247) (not e!280884))))

(assert (=> b!477939 (= res!285247 (bvslt (_1!4472 (h!9817 (toList!3934 lm!215))) (_1!4472 (h!9817 (t!15120 (toList!3934 lm!215))))))))

(declare-fun b!477940 () Bool)

(assert (=> b!477940 (= e!280884 (isStrictlySorted!380 (t!15120 (toList!3934 lm!215))))))

(assert (= (and d!76487 (not res!285246)) b!477939))

(assert (= (and b!477939 res!285247) b!477940))

(declare-fun m!460559 () Bool)

(assert (=> b!477940 m!460559))

(assert (=> d!76417 d!76487))

(declare-fun d!76489 () Bool)

(declare-fun res!285248 () Bool)

(declare-fun e!280885 () Bool)

(assert (=> d!76489 (=> res!285248 e!280885)))

(assert (=> d!76489 (= res!285248 ((_ is Nil!8962) (t!15120 (toList!3934 lm!215))))))

(assert (=> d!76489 (= (forall!200 (t!15120 (toList!3934 lm!215)) p!166) e!280885)))

(declare-fun b!477941 () Bool)

(declare-fun e!280886 () Bool)

(assert (=> b!477941 (= e!280885 e!280886)))

(declare-fun res!285249 () Bool)

(assert (=> b!477941 (=> (not res!285249) (not e!280886))))

(assert (=> b!477941 (= res!285249 (dynLambda!944 p!166 (h!9817 (t!15120 (toList!3934 lm!215)))))))

(declare-fun b!477942 () Bool)

(assert (=> b!477942 (= e!280886 (forall!200 (t!15120 (t!15120 (toList!3934 lm!215))) p!166))))

(assert (= (and d!76489 (not res!285248)) b!477941))

(assert (= (and b!477941 res!285249) b!477942))

(declare-fun b_lambda!10771 () Bool)

(assert (=> (not b_lambda!10771) (not b!477941)))

(declare-fun t!15150 () Bool)

(declare-fun tb!4137 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15150) tb!4137))

(declare-fun result!7711 () Bool)

(assert (=> tb!4137 (= result!7711 true)))

(assert (=> b!477941 t!15150))

(declare-fun b_and!20863 () Bool)

(assert (= b_and!20855 (and (=> t!15150 result!7711) b_and!20863)))

(declare-fun m!460561 () Bool)

(assert (=> b!477941 m!460561))

(declare-fun m!460563 () Bool)

(assert (=> b!477942 m!460563))

(assert (=> b!477703 d!76489))

(declare-fun b!477943 () Bool)

(declare-fun e!280887 () Bool)

(declare-fun tp!42453 () Bool)

(assert (=> b!477943 (= e!280887 (and tp_is_empty!13531 tp!42453))))

(assert (=> b!477740 (= tp!42451 e!280887)))

(assert (= (and b!477740 ((_ is Cons!8961) (t!15120 (toList!3934 lm!215)))) b!477943))

(declare-fun b_lambda!10773 () Bool)

(assert (= b_lambda!10771 (or (and start!42982 b_free!12109) b_lambda!10773)))

(declare-fun b_lambda!10775 () Bool)

(assert (= b_lambda!10759 (or (and start!42982 b_free!12109) b_lambda!10775)))

(check-sat b_and!20863 (not b_lambda!10775) (not bm!30790) (not b!477925) (not b!477882) (not b_lambda!10753) (not d!76453) (not b!477942) tp_is_empty!13531 (not b_lambda!10731) (not b!477943) (not b!477818) (not b!477908) (not b_next!12109) (not b!477744) (not d!76477) (not b_lambda!10755) (not b!477765) (not b!477880) (not d!76439) (not b!477940) (not b!477884) (not b!477817) (not b_lambda!10773) (not b!477791) (not d!76461) (not b!477767))
(check-sat b_and!20863 (not b_next!12109))
(get-model)

(declare-fun d!76491 () Bool)

(assert (=> d!76491 (= ($colon$colon!112 e!280844 (ite c!57574 (h!9817 (toList!3934 lm!215)) (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587)))) (Cons!8961 (ite c!57574 (h!9817 (toList!3934 lm!215)) (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587))) e!280844))))

(assert (=> bm!30790 d!76491))

(declare-fun d!76493 () Bool)

(declare-fun res!285256 () Bool)

(declare-fun e!280904 () Bool)

(assert (=> d!76493 (=> res!285256 e!280904)))

(assert (=> d!76493 (= res!285256 (or ((_ is Nil!8962) (t!15120 (toList!3934 lm!215))) ((_ is Nil!8962) (t!15120 (t!15120 (toList!3934 lm!215))))))))

(assert (=> d!76493 (= (isStrictlySorted!380 (t!15120 (toList!3934 lm!215))) e!280904)))

(declare-fun b!477975 () Bool)

(declare-fun e!280905 () Bool)

(assert (=> b!477975 (= e!280904 e!280905)))

(declare-fun res!285257 () Bool)

(assert (=> b!477975 (=> (not res!285257) (not e!280905))))

(assert (=> b!477975 (= res!285257 (bvslt (_1!4472 (h!9817 (t!15120 (toList!3934 lm!215)))) (_1!4472 (h!9817 (t!15120 (t!15120 (toList!3934 lm!215)))))))))

(declare-fun b!477976 () Bool)

(assert (=> b!477976 (= e!280905 (isStrictlySorted!380 (t!15120 (t!15120 (toList!3934 lm!215)))))))

(assert (= (and d!76493 (not res!285256)) b!477975))

(assert (= (and b!477975 res!285257) b!477976))

(declare-fun m!460575 () Bool)

(assert (=> b!477976 m!460575))

(assert (=> b!477940 d!76493))

(declare-fun d!76495 () Bool)

(declare-fun res!285258 () Bool)

(declare-fun e!280906 () Bool)

(assert (=> d!76495 (=> res!285258 e!280906)))

(assert (=> d!76495 (= res!285258 ((_ is Nil!8962) (t!15120 (t!15120 (toList!3934 lm!215)))))))

(assert (=> d!76495 (= (forall!200 (t!15120 (t!15120 (toList!3934 lm!215))) p!166) e!280906)))

(declare-fun b!477977 () Bool)

(declare-fun e!280907 () Bool)

(assert (=> b!477977 (= e!280906 e!280907)))

(declare-fun res!285259 () Bool)

(assert (=> b!477977 (=> (not res!285259) (not e!280907))))

(assert (=> b!477977 (= res!285259 (dynLambda!944 p!166 (h!9817 (t!15120 (t!15120 (toList!3934 lm!215))))))))

(declare-fun b!477978 () Bool)

(assert (=> b!477978 (= e!280907 (forall!200 (t!15120 (t!15120 (t!15120 (toList!3934 lm!215)))) p!166))))

(assert (= (and d!76495 (not res!285258)) b!477977))

(assert (= (and b!477977 res!285259) b!477978))

(declare-fun b_lambda!10781 () Bool)

(assert (=> (not b_lambda!10781) (not b!477977)))

(declare-fun t!15153 () Bool)

(declare-fun tb!4139 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15153) tb!4139))

(declare-fun result!7713 () Bool)

(assert (=> tb!4139 (= result!7713 true)))

(assert (=> b!477977 t!15153))

(declare-fun b_and!20865 () Bool)

(assert (= b_and!20863 (and (=> t!15153 result!7713) b_and!20865)))

(declare-fun m!460577 () Bool)

(assert (=> b!477977 m!460577))

(declare-fun m!460579 () Bool)

(assert (=> b!477978 m!460579))

(assert (=> b!477942 d!76495))

(declare-fun d!76497 () Bool)

(declare-fun lt!217693 () Bool)

(assert (=> d!76497 (= lt!217693 (select (content!211 lt!217675) (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587))))))

(declare-fun e!280909 () Bool)

(assert (=> d!76497 (= lt!217693 e!280909)))

(declare-fun res!285261 () Bool)

(assert (=> d!76497 (=> (not res!285261) (not e!280909))))

(assert (=> d!76497 (= res!285261 ((_ is Cons!8961) lt!217675))))

(assert (=> d!76497 (= (contains!2559 lt!217675 (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587))) lt!217693)))

(declare-fun b!477979 () Bool)

(declare-fun e!280908 () Bool)

(assert (=> b!477979 (= e!280909 e!280908)))

(declare-fun res!285260 () Bool)

(assert (=> b!477979 (=> res!285260 e!280908)))

(assert (=> b!477979 (= res!285260 (= (h!9817 lt!217675) (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587))))))

(declare-fun b!477980 () Bool)

(assert (=> b!477980 (= e!280908 (contains!2559 (t!15120 lt!217675) (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587))))))

(assert (= (and d!76497 res!285261) b!477979))

(assert (= (and b!477979 (not res!285260)) b!477980))

(declare-fun m!460581 () Bool)

(assert (=> d!76497 m!460581))

(declare-fun m!460583 () Bool)

(assert (=> d!76497 m!460583))

(declare-fun m!460585 () Bool)

(assert (=> b!477980 m!460585))

(assert (=> b!477884 d!76497))

(declare-fun b!477984 () Bool)

(declare-fun e!280911 () Option!397)

(assert (=> b!477984 (= e!280911 None!395)))

(declare-fun b!477981 () Bool)

(declare-fun e!280910 () Option!397)

(assert (=> b!477981 (= e!280910 (Some!396 (_2!4472 (h!9817 (t!15120 (toList!3934 lt!217626))))))))

(declare-fun b!477983 () Bool)

(assert (=> b!477983 (= e!280911 (getValueByKey!391 (t!15120 (t!15120 (toList!3934 lt!217626))) (_1!4472 lt!217587)))))

(declare-fun d!76499 () Bool)

(declare-fun c!57599 () Bool)

(assert (=> d!76499 (= c!57599 (and ((_ is Cons!8961) (t!15120 (toList!3934 lt!217626))) (= (_1!4472 (h!9817 (t!15120 (toList!3934 lt!217626)))) (_1!4472 lt!217587))))))

(assert (=> d!76499 (= (getValueByKey!391 (t!15120 (toList!3934 lt!217626)) (_1!4472 lt!217587)) e!280910)))

(declare-fun b!477982 () Bool)

(assert (=> b!477982 (= e!280910 e!280911)))

(declare-fun c!57600 () Bool)

(assert (=> b!477982 (= c!57600 (and ((_ is Cons!8961) (t!15120 (toList!3934 lt!217626))) (not (= (_1!4472 (h!9817 (t!15120 (toList!3934 lt!217626)))) (_1!4472 lt!217587)))))))

(assert (= (and d!76499 c!57599) b!477981))

(assert (= (and d!76499 (not c!57599)) b!477982))

(assert (= (and b!477982 c!57600) b!477983))

(assert (= (and b!477982 (not c!57600)) b!477984))

(declare-fun m!460587 () Bool)

(assert (=> b!477983 m!460587))

(assert (=> b!477908 d!76499))

(declare-fun d!76501 () Bool)

(declare-fun lt!217694 () Bool)

(assert (=> d!76501 (= lt!217694 (select (content!211 (t!15120 (toList!3934 lt!217626))) lt!217587))))

(declare-fun e!280913 () Bool)

(assert (=> d!76501 (= lt!217694 e!280913)))

(declare-fun res!285263 () Bool)

(assert (=> d!76501 (=> (not res!285263) (not e!280913))))

(assert (=> d!76501 (= res!285263 ((_ is Cons!8961) (t!15120 (toList!3934 lt!217626))))))

(assert (=> d!76501 (= (contains!2559 (t!15120 (toList!3934 lt!217626)) lt!217587) lt!217694)))

(declare-fun b!477985 () Bool)

(declare-fun e!280912 () Bool)

(assert (=> b!477985 (= e!280913 e!280912)))

(declare-fun res!285262 () Bool)

(assert (=> b!477985 (=> res!285262 e!280912)))

(assert (=> b!477985 (= res!285262 (= (h!9817 (t!15120 (toList!3934 lt!217626))) lt!217587))))

(declare-fun b!477986 () Bool)

(assert (=> b!477986 (= e!280912 (contains!2559 (t!15120 (t!15120 (toList!3934 lt!217626))) lt!217587))))

(assert (= (and d!76501 res!285263) b!477985))

(assert (= (and b!477985 (not res!285262)) b!477986))

(declare-fun m!460589 () Bool)

(assert (=> d!76501 m!460589))

(declare-fun m!460591 () Bool)

(assert (=> d!76501 m!460591))

(declare-fun m!460593 () Bool)

(assert (=> b!477986 m!460593))

(assert (=> b!477925 d!76501))

(declare-fun d!76503 () Bool)

(declare-fun res!285268 () Bool)

(declare-fun e!280918 () Bool)

(assert (=> d!76503 (=> res!285268 e!280918)))

(assert (=> d!76503 (= res!285268 (and ((_ is Cons!8961) lt!217675) (= (_1!4472 (h!9817 lt!217675)) (_1!4472 lt!217587))))))

(assert (=> d!76503 (= (containsKey!351 lt!217675 (_1!4472 lt!217587)) e!280918)))

(declare-fun b!477991 () Bool)

(declare-fun e!280919 () Bool)

(assert (=> b!477991 (= e!280918 e!280919)))

(declare-fun res!285269 () Bool)

(assert (=> b!477991 (=> (not res!285269) (not e!280919))))

(assert (=> b!477991 (= res!285269 (and (or (not ((_ is Cons!8961) lt!217675)) (bvsle (_1!4472 (h!9817 lt!217675)) (_1!4472 lt!217587))) ((_ is Cons!8961) lt!217675) (bvslt (_1!4472 (h!9817 lt!217675)) (_1!4472 lt!217587))))))

(declare-fun b!477992 () Bool)

(assert (=> b!477992 (= e!280919 (containsKey!351 (t!15120 lt!217675) (_1!4472 lt!217587)))))

(assert (= (and d!76503 (not res!285268)) b!477991))

(assert (= (and b!477991 res!285269) b!477992))

(declare-fun m!460595 () Bool)

(assert (=> b!477992 m!460595))

(assert (=> b!477882 d!76503))

(declare-fun b!477996 () Bool)

(declare-fun e!280921 () Option!397)

(assert (=> b!477996 (= e!280921 None!395)))

(declare-fun b!477993 () Bool)

(declare-fun e!280920 () Option!397)

(assert (=> b!477993 (= e!280920 (Some!396 (_2!4472 (h!9817 (t!15120 lt!217628)))))))

(declare-fun b!477995 () Bool)

(assert (=> b!477995 (= e!280921 (getValueByKey!391 (t!15120 (t!15120 lt!217628)) (_1!4472 lt!217587)))))

(declare-fun d!76505 () Bool)

(declare-fun c!57601 () Bool)

(assert (=> d!76505 (= c!57601 (and ((_ is Cons!8961) (t!15120 lt!217628)) (= (_1!4472 (h!9817 (t!15120 lt!217628))) (_1!4472 lt!217587))))))

(assert (=> d!76505 (= (getValueByKey!391 (t!15120 lt!217628) (_1!4472 lt!217587)) e!280920)))

(declare-fun b!477994 () Bool)

(assert (=> b!477994 (= e!280920 e!280921)))

(declare-fun c!57602 () Bool)

(assert (=> b!477994 (= c!57602 (and ((_ is Cons!8961) (t!15120 lt!217628)) (not (= (_1!4472 (h!9817 (t!15120 lt!217628))) (_1!4472 lt!217587)))))))

(assert (= (and d!76505 c!57601) b!477993))

(assert (= (and d!76505 (not c!57601)) b!477994))

(assert (= (and b!477994 c!57602) b!477995))

(assert (= (and b!477994 (not c!57602)) b!477996))

(declare-fun m!460597 () Bool)

(assert (=> b!477995 m!460597))

(assert (=> b!477791 d!76505))

(declare-fun d!76507 () Bool)

(declare-fun res!285270 () Bool)

(declare-fun e!280922 () Bool)

(assert (=> d!76507 (=> res!285270 e!280922)))

(assert (=> d!76507 (= res!285270 (and ((_ is Cons!8961) (toList!3934 lt!217626)) (= (_1!4472 (h!9817 (toList!3934 lt!217626))) (_1!4472 lt!217587))))))

(assert (=> d!76507 (= (containsKey!351 (toList!3934 lt!217626) (_1!4472 lt!217587)) e!280922)))

(declare-fun b!477997 () Bool)

(declare-fun e!280923 () Bool)

(assert (=> b!477997 (= e!280922 e!280923)))

(declare-fun res!285271 () Bool)

(assert (=> b!477997 (=> (not res!285271) (not e!280923))))

(assert (=> b!477997 (= res!285271 (and (or (not ((_ is Cons!8961) (toList!3934 lt!217626))) (bvsle (_1!4472 (h!9817 (toList!3934 lt!217626))) (_1!4472 lt!217587))) ((_ is Cons!8961) (toList!3934 lt!217626)) (bvslt (_1!4472 (h!9817 (toList!3934 lt!217626))) (_1!4472 lt!217587))))))

(declare-fun b!477998 () Bool)

(assert (=> b!477998 (= e!280923 (containsKey!351 (t!15120 (toList!3934 lt!217626)) (_1!4472 lt!217587)))))

(assert (= (and d!76507 (not res!285270)) b!477997))

(assert (= (and b!477997 res!285271) b!477998))

(declare-fun m!460599 () Bool)

(assert (=> b!477998 m!460599))

(assert (=> d!76439 d!76507))

(declare-fun d!76509 () Bool)

(declare-fun res!285272 () Bool)

(declare-fun e!280924 () Bool)

(assert (=> d!76509 (=> res!285272 e!280924)))

(assert (=> d!76509 (= res!285272 (or ((_ is Nil!8962) lt!217675) ((_ is Nil!8962) (t!15120 lt!217675))))))

(assert (=> d!76509 (= (isStrictlySorted!380 lt!217675) e!280924)))

(declare-fun b!477999 () Bool)

(declare-fun e!280925 () Bool)

(assert (=> b!477999 (= e!280924 e!280925)))

(declare-fun res!285273 () Bool)

(assert (=> b!477999 (=> (not res!285273) (not e!280925))))

(assert (=> b!477999 (= res!285273 (bvslt (_1!4472 (h!9817 lt!217675)) (_1!4472 (h!9817 (t!15120 lt!217675)))))))

(declare-fun b!478000 () Bool)

(assert (=> b!478000 (= e!280925 (isStrictlySorted!380 (t!15120 lt!217675)))))

(assert (= (and d!76509 (not res!285272)) b!477999))

(assert (= (and b!477999 res!285273) b!478000))

(declare-fun m!460601 () Bool)

(assert (=> b!478000 m!460601))

(assert (=> d!76461 d!76509))

(assert (=> d!76461 d!76487))

(assert (=> d!76453 d!76445))

(declare-fun d!76511 () Bool)

(assert (=> d!76511 (= (getValueByKey!391 lt!217628 (_1!4472 lt!217587)) (Some!396 (_2!4472 lt!217587)))))

(assert (=> d!76511 true))

(declare-fun _$22!559 () Unit!14022)

(assert (=> d!76511 (= (choose!1376 lt!217628 (_1!4472 lt!217587) (_2!4472 lt!217587)) _$22!559)))

(declare-fun bs!15208 () Bool)

(assert (= bs!15208 d!76511))

(assert (=> bs!15208 m!460433))

(assert (=> d!76453 d!76511))

(declare-fun d!76513 () Bool)

(declare-fun res!285274 () Bool)

(declare-fun e!280926 () Bool)

(assert (=> d!76513 (=> res!285274 e!280926)))

(assert (=> d!76513 (= res!285274 (or ((_ is Nil!8962) lt!217628) ((_ is Nil!8962) (t!15120 lt!217628))))))

(assert (=> d!76513 (= (isStrictlySorted!380 lt!217628) e!280926)))

(declare-fun b!478001 () Bool)

(declare-fun e!280927 () Bool)

(assert (=> b!478001 (= e!280926 e!280927)))

(declare-fun res!285275 () Bool)

(assert (=> b!478001 (=> (not res!285275) (not e!280927))))

(assert (=> b!478001 (= res!285275 (bvslt (_1!4472 (h!9817 lt!217628)) (_1!4472 (h!9817 (t!15120 lt!217628)))))))

(declare-fun b!478002 () Bool)

(assert (=> b!478002 (= e!280927 (isStrictlySorted!380 (t!15120 lt!217628)))))

(assert (= (and d!76513 (not res!285274)) b!478001))

(assert (= (and b!478001 res!285275) b!478002))

(declare-fun m!460603 () Bool)

(assert (=> b!478002 m!460603))

(assert (=> d!76453 d!76513))

(declare-fun b!478003 () Bool)

(declare-fun c!57604 () Bool)

(assert (=> b!478003 (= c!57604 (and ((_ is Cons!8961) (t!15120 (toList!3934 lm!215))) (bvsgt (_1!4472 (h!9817 (t!15120 (toList!3934 lm!215)))) (_1!4472 lt!217587))))))

(declare-fun e!280929 () List!8965)

(declare-fun e!280928 () List!8965)

(assert (=> b!478003 (= e!280929 e!280928)))

(declare-fun b!478004 () Bool)

(declare-fun e!280931 () List!8965)

(assert (=> b!478004 (= e!280931 (insertStrictlySorted!216 (t!15120 (t!15120 (toList!3934 lm!215))) (_1!4472 lt!217587) (_2!4472 lt!217587)))))

(declare-fun b!478005 () Bool)

(declare-fun e!280932 () List!8965)

(declare-fun call!30808 () List!8965)

(assert (=> b!478005 (= e!280932 call!30808)))

(declare-fun b!478006 () Bool)

(declare-fun res!285276 () Bool)

(declare-fun e!280930 () Bool)

(assert (=> b!478006 (=> (not res!285276) (not e!280930))))

(declare-fun lt!217695 () List!8965)

(assert (=> b!478006 (= res!285276 (containsKey!351 lt!217695 (_1!4472 lt!217587)))))

(declare-fun b!478007 () Bool)

(declare-fun call!30807 () List!8965)

(assert (=> b!478007 (= e!280928 call!30807)))

(declare-fun b!478008 () Bool)

(assert (=> b!478008 (= e!280930 (contains!2559 lt!217695 (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587))))))

(declare-fun bm!30804 () Bool)

(declare-fun call!30809 () List!8965)

(assert (=> bm!30804 (= call!30807 call!30809)))

(declare-fun c!57603 () Bool)

(declare-fun bm!30805 () Bool)

(assert (=> bm!30805 (= call!30808 ($colon$colon!112 e!280931 (ite c!57603 (h!9817 (t!15120 (toList!3934 lm!215))) (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587)))))))

(declare-fun c!57606 () Bool)

(assert (=> bm!30805 (= c!57606 c!57603)))

(declare-fun b!478009 () Bool)

(assert (=> b!478009 (= e!280932 e!280929)))

(declare-fun c!57605 () Bool)

(assert (=> b!478009 (= c!57605 (and ((_ is Cons!8961) (t!15120 (toList!3934 lm!215))) (= (_1!4472 (h!9817 (t!15120 (toList!3934 lm!215)))) (_1!4472 lt!217587))))))

(declare-fun b!478010 () Bool)

(assert (=> b!478010 (= e!280928 call!30807)))

(declare-fun d!76515 () Bool)

(assert (=> d!76515 e!280930))

(declare-fun res!285277 () Bool)

(assert (=> d!76515 (=> (not res!285277) (not e!280930))))

(assert (=> d!76515 (= res!285277 (isStrictlySorted!380 lt!217695))))

(assert (=> d!76515 (= lt!217695 e!280932)))

(assert (=> d!76515 (= c!57603 (and ((_ is Cons!8961) (t!15120 (toList!3934 lm!215))) (bvslt (_1!4472 (h!9817 (t!15120 (toList!3934 lm!215)))) (_1!4472 lt!217587))))))

(assert (=> d!76515 (isStrictlySorted!380 (t!15120 (toList!3934 lm!215)))))

(assert (=> d!76515 (= (insertStrictlySorted!216 (t!15120 (toList!3934 lm!215)) (_1!4472 lt!217587) (_2!4472 lt!217587)) lt!217695)))

(declare-fun b!478011 () Bool)

(assert (=> b!478011 (= e!280929 call!30809)))

(declare-fun b!478012 () Bool)

(assert (=> b!478012 (= e!280931 (ite c!57605 (t!15120 (t!15120 (toList!3934 lm!215))) (ite c!57604 (Cons!8961 (h!9817 (t!15120 (toList!3934 lm!215))) (t!15120 (t!15120 (toList!3934 lm!215)))) Nil!8962)))))

(declare-fun bm!30806 () Bool)

(assert (=> bm!30806 (= call!30809 call!30808)))

(assert (= (and d!76515 c!57603) b!478005))

(assert (= (and d!76515 (not c!57603)) b!478009))

(assert (= (and b!478009 c!57605) b!478011))

(assert (= (and b!478009 (not c!57605)) b!478003))

(assert (= (and b!478003 c!57604) b!478007))

(assert (= (and b!478003 (not c!57604)) b!478010))

(assert (= (or b!478007 b!478010) bm!30804))

(assert (= (or b!478011 bm!30804) bm!30806))

(assert (= (or b!478005 bm!30806) bm!30805))

(assert (= (and bm!30805 c!57606) b!478004))

(assert (= (and bm!30805 (not c!57606)) b!478012))

(assert (= (and d!76515 res!285277) b!478006))

(assert (= (and b!478006 res!285276) b!478008))

(declare-fun m!460605 () Bool)

(assert (=> d!76515 m!460605))

(assert (=> d!76515 m!460559))

(declare-fun m!460607 () Bool)

(assert (=> bm!30805 m!460607))

(declare-fun m!460609 () Bool)

(assert (=> b!478006 m!460609))

(declare-fun m!460611 () Bool)

(assert (=> b!478004 m!460611))

(declare-fun m!460613 () Bool)

(assert (=> b!478008 m!460613))

(assert (=> b!477880 d!76515))

(declare-fun d!76517 () Bool)

(declare-fun lt!217696 () Bool)

(assert (=> d!76517 (= lt!217696 (select (content!211 lt!217628) (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587))))))

(declare-fun e!280934 () Bool)

(assert (=> d!76517 (= lt!217696 e!280934)))

(declare-fun res!285279 () Bool)

(assert (=> d!76517 (=> (not res!285279) (not e!280934))))

(assert (=> d!76517 (= res!285279 ((_ is Cons!8961) lt!217628))))

(assert (=> d!76517 (= (contains!2559 lt!217628 (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587))) lt!217696)))

(declare-fun b!478013 () Bool)

(declare-fun e!280933 () Bool)

(assert (=> b!478013 (= e!280934 e!280933)))

(declare-fun res!285278 () Bool)

(assert (=> b!478013 (=> res!285278 e!280933)))

(assert (=> b!478013 (= res!285278 (= (h!9817 lt!217628) (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587))))))

(declare-fun b!478014 () Bool)

(assert (=> b!478014 (= e!280933 (contains!2559 (t!15120 lt!217628) (tuple2!8923 (_1!4472 lt!217587) (_2!4472 lt!217587))))))

(assert (= (and d!76517 res!285279) b!478013))

(assert (= (and b!478013 (not res!285278)) b!478014))

(declare-fun m!460615 () Bool)

(assert (=> d!76517 m!460615))

(declare-fun m!460617 () Bool)

(assert (=> d!76517 m!460617))

(declare-fun m!460619 () Bool)

(assert (=> b!478014 m!460619))

(assert (=> b!477818 d!76517))

(declare-fun d!76519 () Bool)

(declare-fun res!285280 () Bool)

(declare-fun e!280935 () Bool)

(assert (=> d!76519 (=> res!285280 e!280935)))

(assert (=> d!76519 (= res!285280 (and ((_ is Cons!8961) lt!217628) (= (_1!4472 (h!9817 lt!217628)) (_1!4472 lt!217587))))))

(assert (=> d!76519 (= (containsKey!351 lt!217628 (_1!4472 lt!217587)) e!280935)))

(declare-fun b!478015 () Bool)

(declare-fun e!280936 () Bool)

(assert (=> b!478015 (= e!280935 e!280936)))

(declare-fun res!285281 () Bool)

(assert (=> b!478015 (=> (not res!285281) (not e!280936))))

(assert (=> b!478015 (= res!285281 (and (or (not ((_ is Cons!8961) lt!217628)) (bvsle (_1!4472 (h!9817 lt!217628)) (_1!4472 lt!217587))) ((_ is Cons!8961) lt!217628) (bvslt (_1!4472 (h!9817 lt!217628)) (_1!4472 lt!217587))))))

(declare-fun b!478016 () Bool)

(assert (=> b!478016 (= e!280936 (containsKey!351 (t!15120 lt!217628) (_1!4472 lt!217587)))))

(assert (= (and d!76519 (not res!285280)) b!478015))

(assert (= (and b!478015 res!285281) b!478016))

(declare-fun m!460621 () Bool)

(assert (=> b!478016 m!460621))

(assert (=> b!477817 d!76519))

(declare-fun d!76521 () Bool)

(declare-fun c!57609 () Bool)

(assert (=> d!76521 (= c!57609 ((_ is Nil!8962) (toList!3934 lt!217626)))))

(declare-fun e!280939 () (InoxSet tuple2!8922))

(assert (=> d!76521 (= (content!211 (toList!3934 lt!217626)) e!280939)))

(declare-fun b!478021 () Bool)

(assert (=> b!478021 (= e!280939 ((as const (Array tuple2!8922 Bool)) false))))

(declare-fun b!478022 () Bool)

(assert (=> b!478022 (= e!280939 ((_ map or) (store ((as const (Array tuple2!8922 Bool)) false) (h!9817 (toList!3934 lt!217626)) true) (content!211 (t!15120 (toList!3934 lt!217626)))))))

(assert (= (and d!76521 c!57609) b!478021))

(assert (= (and d!76521 (not c!57609)) b!478022))

(declare-fun m!460623 () Bool)

(assert (=> b!478022 m!460623))

(assert (=> b!478022 m!460589))

(assert (=> d!76477 d!76521))

(declare-fun d!76523 () Bool)

(assert (=> d!76523 (isDefined!300 (getValueByKey!391 (toList!3934 lt!217626) (_1!4472 lt!217587)))))

(declare-fun lt!217699 () Unit!14022)

(declare-fun choose!1379 (List!8965 (_ BitVec 64)) Unit!14022)

(assert (=> d!76523 (= lt!217699 (choose!1379 (toList!3934 lt!217626) (_1!4472 lt!217587)))))

(declare-fun e!280942 () Bool)

(assert (=> d!76523 e!280942))

(declare-fun res!285284 () Bool)

(assert (=> d!76523 (=> (not res!285284) (not e!280942))))

(assert (=> d!76523 (= res!285284 (isStrictlySorted!380 (toList!3934 lt!217626)))))

(assert (=> d!76523 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!299 (toList!3934 lt!217626) (_1!4472 lt!217587)) lt!217699)))

(declare-fun b!478025 () Bool)

(assert (=> b!478025 (= e!280942 (containsKey!351 (toList!3934 lt!217626) (_1!4472 lt!217587)))))

(assert (= (and d!76523 res!285284) b!478025))

(assert (=> d!76523 m!460439))

(assert (=> d!76523 m!460439))

(assert (=> d!76523 m!460461))

(declare-fun m!460625 () Bool)

(assert (=> d!76523 m!460625))

(declare-fun m!460627 () Bool)

(assert (=> d!76523 m!460627))

(assert (=> b!478025 m!460457))

(assert (=> b!477765 d!76523))

(declare-fun d!76525 () Bool)

(declare-fun isEmpty!622 (Option!397) Bool)

(assert (=> d!76525 (= (isDefined!300 (getValueByKey!391 (toList!3934 lt!217626) (_1!4472 lt!217587))) (not (isEmpty!622 (getValueByKey!391 (toList!3934 lt!217626) (_1!4472 lt!217587)))))))

(declare-fun bs!15209 () Bool)

(assert (= bs!15209 d!76525))

(assert (=> bs!15209 m!460439))

(declare-fun m!460629 () Bool)

(assert (=> bs!15209 m!460629))

(assert (=> b!477765 d!76525))

(assert (=> b!477765 d!76473))

(declare-fun d!76527 () Bool)

(declare-fun res!285285 () Bool)

(declare-fun e!280943 () Bool)

(assert (=> d!76527 (=> res!285285 e!280943)))

(assert (=> d!76527 (= res!285285 ((_ is Nil!8962) (t!15120 (t!15120 (toList!3934 (+!1775 lm!215 lt!217587))))))))

(assert (=> d!76527 (= (forall!200 (t!15120 (t!15120 (toList!3934 (+!1775 lm!215 lt!217587)))) p!166) e!280943)))

(declare-fun b!478026 () Bool)

(declare-fun e!280944 () Bool)

(assert (=> b!478026 (= e!280943 e!280944)))

(declare-fun res!285286 () Bool)

(assert (=> b!478026 (=> (not res!285286) (not e!280944))))

(assert (=> b!478026 (= res!285286 (dynLambda!944 p!166 (h!9817 (t!15120 (t!15120 (toList!3934 (+!1775 lm!215 lt!217587)))))))))

(declare-fun b!478027 () Bool)

(assert (=> b!478027 (= e!280944 (forall!200 (t!15120 (t!15120 (t!15120 (toList!3934 (+!1775 lm!215 lt!217587))))) p!166))))

(assert (= (and d!76527 (not res!285285)) b!478026))

(assert (= (and b!478026 res!285286) b!478027))

(declare-fun b_lambda!10783 () Bool)

(assert (=> (not b_lambda!10783) (not b!478026)))

(declare-fun t!15155 () Bool)

(declare-fun tb!4141 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15155) tb!4141))

(declare-fun result!7715 () Bool)

(assert (=> tb!4141 (= result!7715 true)))

(assert (=> b!478026 t!15155))

(declare-fun b_and!20867 () Bool)

(assert (= b_and!20865 (and (=> t!15155 result!7715) b_and!20867)))

(declare-fun m!460631 () Bool)

(assert (=> b!478026 m!460631))

(declare-fun m!460633 () Bool)

(assert (=> b!478027 m!460633))

(assert (=> b!477744 d!76527))

(assert (=> b!477767 d!76525))

(assert (=> b!477767 d!76473))

(declare-fun b!478028 () Bool)

(declare-fun e!280945 () Bool)

(declare-fun tp!42455 () Bool)

(assert (=> b!478028 (= e!280945 (and tp_is_empty!13531 tp!42455))))

(assert (=> b!477943 (= tp!42453 e!280945)))

(assert (= (and b!477943 ((_ is Cons!8961) (t!15120 (t!15120 (toList!3934 lm!215))))) b!478028))

(declare-fun b_lambda!10785 () Bool)

(assert (= b_lambda!10783 (or (and start!42982 b_free!12109) b_lambda!10785)))

(declare-fun b_lambda!10787 () Bool)

(assert (= b_lambda!10781 (or (and start!42982 b_free!12109) b_lambda!10787)))

(check-sat (not b!478016) (not b!477978) b_and!20867 (not b_next!12109) (not b!477976) (not d!76517) (not b!478014) (not b_lambda!10731) (not b_lambda!10785) (not d!76497) (not b!478025) (not b_lambda!10775) (not b!477983) (not b!477980) (not b!478028) (not b!477998) (not b_lambda!10787) (not d!76523) (not b_lambda!10753) (not d!76515) (not b!478027) (not bm!30805) (not b!478002) (not b_lambda!10755) (not b!478022) (not b!478004) (not d!76511) tp_is_empty!13531 (not b!477992) (not b!478008) (not d!76525) (not d!76501) (not b!478000) (not b_lambda!10773) (not b!477995) (not b!478006) (not b!477986))
(check-sat b_and!20867 (not b_next!12109))
