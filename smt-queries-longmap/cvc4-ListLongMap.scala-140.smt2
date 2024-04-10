; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2500 () Bool)

(assert start!2500)

(declare-fun b_free!521 () Bool)

(declare-fun b_next!521 () Bool)

(assert (=> start!2500 (= b_free!521 (not b_next!521))))

(declare-fun tp!2663 () Bool)

(declare-fun b_and!967 () Bool)

(assert (=> start!2500 (= tp!2663 b_and!967)))

(declare-fun res!11751 () Bool)

(declare-fun e!9476 () Bool)

(assert (=> start!2500 (=> (not res!11751) (not e!9476))))

(declare-datatypes ((B!642 0))(
  ( (B!643 (val!419 Int)) )
))
(declare-datatypes ((tuple2!638 0))(
  ( (tuple2!639 (_1!319 (_ BitVec 64)) (_2!319 B!642)) )
))
(declare-datatypes ((List!497 0))(
  ( (Nil!494) (Cons!493 (h!1059 tuple2!638) (t!2935 List!497)) )
))
(declare-datatypes ((ListLongMap!469 0))(
  ( (ListLongMap!470 (toList!250 List!497)) )
))
(declare-fun lm!238 () ListLongMap!469)

(declare-fun p!262 () Int)

(declare-fun forall!124 (List!497 Int) Bool)

(assert (=> start!2500 (= res!11751 (forall!124 (toList!250 lm!238) p!262))))

(assert (=> start!2500 e!9476))

(declare-fun e!9475 () Bool)

(declare-fun inv!826 (ListLongMap!469) Bool)

(assert (=> start!2500 (and (inv!826 lm!238) e!9475)))

(assert (=> start!2500 tp!2663))

(assert (=> start!2500 true))

(declare-fun b!15567 () Bool)

(declare-fun res!11752 () Bool)

(assert (=> b!15567 (=> (not res!11752) (not e!9476))))

(declare-datatypes ((List!498 0))(
  ( (Nil!495) (Cons!494 (h!1060 (_ BitVec 64)) (t!2936 List!498)) )
))
(declare-fun l!1612 () List!498)

(declare-fun isEmpty!134 (List!498) Bool)

(assert (=> b!15567 (= res!11752 (not (isEmpty!134 l!1612)))))

(declare-fun b!15568 () Bool)

(declare-fun ListPrimitiveSize!33 (List!498) Int)

(declare-fun tail!61 (List!498) List!498)

(assert (=> b!15568 (= e!9476 (not (< (ListPrimitiveSize!33 (tail!61 l!1612)) (ListPrimitiveSize!33 l!1612))))))

(declare-fun lt!3812 () (_ BitVec 64))

(declare-fun -!23 (ListLongMap!469 (_ BitVec 64)) ListLongMap!469)

(assert (=> b!15568 (forall!124 (toList!250 (-!23 lm!238 lt!3812)) p!262)))

(declare-datatypes ((Unit!310 0))(
  ( (Unit!311) )
))
(declare-fun lt!3813 () Unit!310)

(declare-fun removeValidProp!16 (ListLongMap!469 Int (_ BitVec 64)) Unit!310)

(assert (=> b!15568 (= lt!3813 (removeValidProp!16 lm!238 p!262 lt!3812))))

(declare-fun head!814 (List!498) (_ BitVec 64))

(assert (=> b!15568 (= lt!3812 (head!814 l!1612))))

(declare-fun b!15569 () Bool)

(declare-fun tp!2662 () Bool)

(assert (=> b!15569 (= e!9475 tp!2662)))

(assert (= (and start!2500 res!11751) b!15567))

(assert (= (and b!15567 res!11752) b!15568))

(assert (= start!2500 b!15569))

(declare-fun m!10521 () Bool)

(assert (=> start!2500 m!10521))

(declare-fun m!10523 () Bool)

(assert (=> start!2500 m!10523))

(declare-fun m!10525 () Bool)

(assert (=> b!15567 m!10525))

(declare-fun m!10527 () Bool)

(assert (=> b!15568 m!10527))

(declare-fun m!10529 () Bool)

(assert (=> b!15568 m!10529))

(declare-fun m!10531 () Bool)

(assert (=> b!15568 m!10531))

(declare-fun m!10533 () Bool)

(assert (=> b!15568 m!10533))

(declare-fun m!10535 () Bool)

(assert (=> b!15568 m!10535))

(assert (=> b!15568 m!10533))

(declare-fun m!10537 () Bool)

(assert (=> b!15568 m!10537))

(declare-fun m!10539 () Bool)

(assert (=> b!15568 m!10539))

(push 1)

(assert (not start!2500))

(assert (not b!15569))

(assert (not b!15567))

(assert (not b_next!521))

(assert (not b!15568))

(assert b_and!967)

(check-sat)

(pop 1)

(push 1)

(assert b_and!967)

(assert (not b_next!521))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2690 () Bool)

(declare-fun res!11761 () Bool)

(declare-fun e!9485 () Bool)

(assert (=> d!2690 (=> res!11761 e!9485)))

(assert (=> d!2690 (= res!11761 (is-Nil!494 (toList!250 lm!238)))))

(assert (=> d!2690 (= (forall!124 (toList!250 lm!238) p!262) e!9485)))

(declare-fun b!15578 () Bool)

(declare-fun e!9486 () Bool)

(assert (=> b!15578 (= e!9485 e!9486)))

(declare-fun res!11762 () Bool)

(assert (=> b!15578 (=> (not res!11762) (not e!9486))))

(declare-fun dynLambda!109 (Int tuple2!638) Bool)

(assert (=> b!15578 (= res!11762 (dynLambda!109 p!262 (h!1059 (toList!250 lm!238))))))

(declare-fun b!15579 () Bool)

(assert (=> b!15579 (= e!9486 (forall!124 (t!2935 (toList!250 lm!238)) p!262))))

(assert (= (and d!2690 (not res!11761)) b!15578))

(assert (= (and b!15578 res!11762) b!15579))

(declare-fun b_lambda!1043 () Bool)

(assert (=> (not b_lambda!1043) (not b!15578)))

(declare-fun t!2938 () Bool)

(declare-fun tb!429 () Bool)

(assert (=> (and start!2500 (= p!262 p!262) t!2938) tb!429))

(declare-fun result!759 () Bool)

(assert (=> tb!429 (= result!759 true)))

(assert (=> b!15578 t!2938))

(declare-fun b_and!969 () Bool)

(assert (= b_and!967 (and (=> t!2938 result!759) b_and!969)))

(declare-fun m!10541 () Bool)

(assert (=> b!15578 m!10541))

(declare-fun m!10543 () Bool)

(assert (=> b!15579 m!10543))

(assert (=> start!2500 d!2690))

(declare-fun d!2695 () Bool)

(declare-fun isStrictlySorted!146 (List!497) Bool)

(assert (=> d!2695 (= (inv!826 lm!238) (isStrictlySorted!146 (toList!250 lm!238)))))

(declare-fun bs!691 () Bool)

(assert (= bs!691 d!2695))

(declare-fun m!10553 () Bool)

(assert (=> bs!691 m!10553))

(assert (=> start!2500 d!2695))

(declare-fun d!2701 () Bool)

(assert (=> d!2701 (forall!124 (toList!250 (-!23 lm!238 lt!3812)) p!262)))

(declare-fun lt!3824 () Unit!310)

(declare-fun choose!175 (ListLongMap!469 Int (_ BitVec 64)) Unit!310)

(assert (=> d!2701 (= lt!3824 (choose!175 lm!238 p!262 lt!3812))))

(assert (=> d!2701 (forall!124 (toList!250 lm!238) p!262)))

(assert (=> d!2701 (= (removeValidProp!16 lm!238 p!262 lt!3812) lt!3824)))

(declare-fun bs!693 () Bool)

(assert (= bs!693 d!2701))

(assert (=> bs!693 m!10531))

(assert (=> bs!693 m!10539))

(declare-fun m!10559 () Bool)

(assert (=> bs!693 m!10559))

(assert (=> bs!693 m!10521))

(assert (=> b!15568 d!2701))

(declare-fun d!2707 () Bool)

(assert (=> d!2707 (= (tail!61 l!1612) (t!2936 l!1612))))

(assert (=> b!15568 d!2707))

(declare-fun d!2711 () Bool)

(declare-fun lt!3835 () Int)

(assert (=> d!2711 (>= lt!3835 0)))

(declare-fun e!9498 () Int)

(assert (=> d!2711 (= lt!3835 e!9498)))

(declare-fun c!1470 () Bool)

(assert (=> d!2711 (= c!1470 (is-Nil!495 l!1612))))

(assert (=> d!2711 (= (ListPrimitiveSize!33 l!1612) lt!3835)))

(declare-fun b!15600 () Bool)

(assert (=> b!15600 (= e!9498 0)))

(declare-fun b!15601 () Bool)

(assert (=> b!15601 (= e!9498 (+ 1 (ListPrimitiveSize!33 (t!2936 l!1612))))))

(assert (= (and d!2711 c!1470) b!15600))

(assert (= (and d!2711 (not c!1470)) b!15601))

(declare-fun m!10569 () Bool)

(assert (=> b!15601 m!10569))

(assert (=> b!15568 d!2711))

(declare-fun d!2721 () Bool)

(assert (=> d!2721 (= (head!814 l!1612) (h!1060 l!1612))))

(assert (=> b!15568 d!2721))

(declare-fun d!2723 () Bool)

(declare-fun res!11767 () Bool)

(declare-fun e!9501 () Bool)

(assert (=> d!2723 (=> res!11767 e!9501)))

(assert (=> d!2723 (= res!11767 (is-Nil!494 (toList!250 (-!23 lm!238 lt!3812))))))

(assert (=> d!2723 (= (forall!124 (toList!250 (-!23 lm!238 lt!3812)) p!262) e!9501)))

(declare-fun b!15602 () Bool)

(declare-fun e!9502 () Bool)

(assert (=> b!15602 (= e!9501 e!9502)))

(declare-fun res!11768 () Bool)

(assert (=> b!15602 (=> (not res!11768) (not e!9502))))

(assert (=> b!15602 (= res!11768 (dynLambda!109 p!262 (h!1059 (toList!250 (-!23 lm!238 lt!3812)))))))

(declare-fun b!15603 () Bool)

(assert (=> b!15603 (= e!9502 (forall!124 (t!2935 (toList!250 (-!23 lm!238 lt!3812))) p!262))))

(assert (= (and d!2723 (not res!11767)) b!15602))

(assert (= (and b!15602 res!11768) b!15603))

(declare-fun b_lambda!1047 () Bool)

(assert (=> (not b_lambda!1047) (not b!15602)))

(declare-fun t!2942 () Bool)

(declare-fun tb!433 () Bool)

(assert (=> (and start!2500 (= p!262 p!262) t!2942) tb!433))

(declare-fun result!763 () Bool)

(assert (=> tb!433 (= result!763 true)))

(assert (=> b!15602 t!2942))

(declare-fun b_and!973 () Bool)

(assert (= b_and!969 (and (=> t!2942 result!763) b_and!973)))

(declare-fun m!10571 () Bool)

(assert (=> b!15602 m!10571))

(declare-fun m!10573 () Bool)

(assert (=> b!15603 m!10573))

(assert (=> b!15568 d!2723))

(declare-fun d!2725 () Bool)

(declare-fun lt!3842 () ListLongMap!469)

(declare-fun contains!200 (ListLongMap!469 (_ BitVec 64)) Bool)

(assert (=> d!2725 (not (contains!200 lt!3842 lt!3812))))

