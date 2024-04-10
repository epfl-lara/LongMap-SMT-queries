; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137468 () Bool)

(assert start!137468)

(declare-fun b!1581706 () Bool)

(declare-fun res!1080612 () Bool)

(declare-fun e!882595 () Bool)

(assert (=> b!1581706 (=> (not res!1080612) (not e!882595))))

(declare-datatypes ((B!2704 0))(
  ( (B!2705 (val!19714 Int)) )
))
(declare-datatypes ((tuple2!25592 0))(
  ( (tuple2!25593 (_1!12807 (_ BitVec 64)) (_2!12807 B!2704)) )
))
(declare-datatypes ((List!36834 0))(
  ( (Nil!36831) (Cons!36830 (h!38373 tuple2!25592) (t!51748 List!36834)) )
))
(declare-fun l!1390 () List!36834)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!938 (List!36834 (_ BitVec 64)) Bool)

(assert (=> b!1581706 (= res!1080612 (containsKey!938 l!1390 key!405))))

(declare-fun b!1581707 () Bool)

(declare-fun res!1080613 () Bool)

(assert (=> b!1581707 (=> (not res!1080613) (not e!882595))))

(declare-fun value!194 () B!2704)

(declare-fun contains!10506 (List!36834 tuple2!25592) Bool)

(assert (=> b!1581707 (= res!1080613 (contains!10506 l!1390 (tuple2!25593 key!405 value!194)))))

(declare-fun b!1581708 () Bool)

(declare-fun e!882593 () Bool)

(declare-fun tp_is_empty!39249 () Bool)

(declare-fun tp!114599 () Bool)

(assert (=> b!1581708 (= e!882593 (and tp_is_empty!39249 tp!114599))))

(declare-fun res!1080610 () Bool)

(assert (=> start!137468 (=> (not res!1080610) (not e!882595))))

(declare-fun isStrictlySorted!1092 (List!36834) Bool)

(assert (=> start!137468 (= res!1080610 (isStrictlySorted!1092 l!1390))))

(assert (=> start!137468 e!882595))

(assert (=> start!137468 e!882593))

(assert (=> start!137468 true))

(assert (=> start!137468 tp_is_empty!39249))

(declare-fun b!1581709 () Bool)

(declare-fun res!1080614 () Bool)

(declare-fun e!882594 () Bool)

(assert (=> b!1581709 (=> (not res!1080614) (not e!882594))))

(get-info :version)

(assert (=> b!1581709 (= res!1080614 (not ((_ is Cons!36830) l!1390)))))

(declare-fun b!1581710 () Bool)

(declare-datatypes ((Option!931 0))(
  ( (Some!930 (v!22449 B!2704)) (None!929) )
))
(declare-fun getValueByKey!824 (List!36834 (_ BitVec 64)) Option!931)

(assert (=> b!1581710 (= e!882594 (not (= (getValueByKey!824 l!1390 key!405) (Some!930 value!194))))))

(declare-fun b!1581711 () Bool)

(assert (=> b!1581711 (= e!882595 e!882594)))

(declare-fun res!1080615 () Bool)

(assert (=> b!1581711 (=> (not res!1080615) (not e!882594))))

(declare-fun e!882596 () Bool)

(assert (=> b!1581711 (= res!1080615 e!882596)))

(declare-fun res!1080611 () Bool)

(assert (=> b!1581711 (=> res!1080611 e!882596)))

(declare-datatypes ((tuple2!25594 0))(
  ( (tuple2!25595 (_1!12808 tuple2!25592) (_2!12808 List!36834)) )
))
(declare-datatypes ((Option!932 0))(
  ( (Some!931 (v!22450 tuple2!25594)) (None!930) )
))
(declare-fun lt!677004 () Option!932)

(declare-fun isEmpty!1185 (Option!932) Bool)

(assert (=> b!1581711 (= res!1080611 (isEmpty!1185 lt!677004))))

(declare-fun unapply!101 (List!36834) Option!932)

(assert (=> b!1581711 (= lt!677004 (unapply!101 l!1390))))

(declare-fun b!1581712 () Bool)

(declare-fun get!26824 (Option!932) tuple2!25594)

(assert (=> b!1581712 (= e!882596 (not ((_ is Nil!36831) (_2!12808 (get!26824 lt!677004)))))))

(assert (= (and start!137468 res!1080610) b!1581706))

(assert (= (and b!1581706 res!1080612) b!1581707))

(assert (= (and b!1581707 res!1080613) b!1581711))

(assert (= (and b!1581711 (not res!1080611)) b!1581712))

(assert (= (and b!1581711 res!1080615) b!1581709))

(assert (= (and b!1581709 res!1080614) b!1581710))

(assert (= (and start!137468 ((_ is Cons!36830) l!1390)) b!1581708))

(declare-fun m!1452559 () Bool)

(assert (=> b!1581712 m!1452559))

(declare-fun m!1452561 () Bool)

(assert (=> b!1581710 m!1452561))

(declare-fun m!1452563 () Bool)

(assert (=> start!137468 m!1452563))

(declare-fun m!1452565 () Bool)

(assert (=> b!1581706 m!1452565))

(declare-fun m!1452567 () Bool)

(assert (=> b!1581711 m!1452567))

(declare-fun m!1452569 () Bool)

(assert (=> b!1581711 m!1452569))

(declare-fun m!1452571 () Bool)

(assert (=> b!1581707 m!1452571))

(check-sat (not b!1581710) tp_is_empty!39249 (not b!1581706) (not start!137468) (not b!1581711) (not b!1581708) (not b!1581707) (not b!1581712))
(check-sat)
(get-model)

(declare-fun b!1581743 () Bool)

(declare-fun e!882613 () Option!931)

(declare-fun e!882614 () Option!931)

(assert (=> b!1581743 (= e!882613 e!882614)))

(declare-fun c!146620 () Bool)

(assert (=> b!1581743 (= c!146620 (and ((_ is Cons!36830) l!1390) (not (= (_1!12807 (h!38373 l!1390)) key!405))))))

(declare-fun d!166815 () Bool)

(declare-fun c!146619 () Bool)

(assert (=> d!166815 (= c!146619 (and ((_ is Cons!36830) l!1390) (= (_1!12807 (h!38373 l!1390)) key!405)))))

(assert (=> d!166815 (= (getValueByKey!824 l!1390 key!405) e!882613)))

(declare-fun b!1581742 () Bool)

(assert (=> b!1581742 (= e!882613 (Some!930 (_2!12807 (h!38373 l!1390))))))

(declare-fun b!1581745 () Bool)

(assert (=> b!1581745 (= e!882614 None!929)))

(declare-fun b!1581744 () Bool)

(assert (=> b!1581744 (= e!882614 (getValueByKey!824 (t!51748 l!1390) key!405))))

(assert (= (and d!166815 c!146619) b!1581742))

(assert (= (and d!166815 (not c!146619)) b!1581743))

(assert (= (and b!1581743 c!146620) b!1581744))

(assert (= (and b!1581743 (not c!146620)) b!1581745))

(declare-fun m!1452587 () Bool)

(assert (=> b!1581744 m!1452587))

(assert (=> b!1581710 d!166815))

(declare-fun d!166821 () Bool)

(assert (=> d!166821 (= (isEmpty!1185 lt!677004) (not ((_ is Some!931) lt!677004)))))

(assert (=> b!1581711 d!166821))

(declare-fun d!166823 () Bool)

(assert (=> d!166823 (= (unapply!101 l!1390) (ite ((_ is Nil!36831) l!1390) None!930 (Some!931 (tuple2!25595 (h!38373 l!1390) (t!51748 l!1390)))))))

(assert (=> b!1581711 d!166823))

(declare-fun d!166827 () Bool)

(declare-fun res!1080656 () Bool)

(declare-fun e!882637 () Bool)

(assert (=> d!166827 (=> res!1080656 e!882637)))

(assert (=> d!166827 (= res!1080656 (or ((_ is Nil!36831) l!1390) ((_ is Nil!36831) (t!51748 l!1390))))))

(assert (=> d!166827 (= (isStrictlySorted!1092 l!1390) e!882637)))

(declare-fun b!1581768 () Bool)

(declare-fun e!882638 () Bool)

(assert (=> b!1581768 (= e!882637 e!882638)))

(declare-fun res!1080657 () Bool)

(assert (=> b!1581768 (=> (not res!1080657) (not e!882638))))

(assert (=> b!1581768 (= res!1080657 (bvslt (_1!12807 (h!38373 l!1390)) (_1!12807 (h!38373 (t!51748 l!1390)))))))

(declare-fun b!1581769 () Bool)

(assert (=> b!1581769 (= e!882638 (isStrictlySorted!1092 (t!51748 l!1390)))))

(assert (= (and d!166827 (not res!1080656)) b!1581768))

(assert (= (and b!1581768 res!1080657) b!1581769))

(declare-fun m!1452603 () Bool)

(assert (=> b!1581769 m!1452603))

(assert (=> start!137468 d!166827))

(declare-fun d!166833 () Bool)

(declare-fun res!1080668 () Bool)

(declare-fun e!882659 () Bool)

(assert (=> d!166833 (=> res!1080668 e!882659)))

(assert (=> d!166833 (= res!1080668 (and ((_ is Cons!36830) l!1390) (= (_1!12807 (h!38373 l!1390)) key!405)))))

(assert (=> d!166833 (= (containsKey!938 l!1390 key!405) e!882659)))

(declare-fun b!1581800 () Bool)

(declare-fun e!882660 () Bool)

(assert (=> b!1581800 (= e!882659 e!882660)))

(declare-fun res!1080669 () Bool)

(assert (=> b!1581800 (=> (not res!1080669) (not e!882660))))

(assert (=> b!1581800 (= res!1080669 (and (or (not ((_ is Cons!36830) l!1390)) (bvsle (_1!12807 (h!38373 l!1390)) key!405)) ((_ is Cons!36830) l!1390) (bvslt (_1!12807 (h!38373 l!1390)) key!405)))))

(declare-fun b!1581801 () Bool)

(assert (=> b!1581801 (= e!882660 (containsKey!938 (t!51748 l!1390) key!405))))

(assert (= (and d!166833 (not res!1080668)) b!1581800))

(assert (= (and b!1581800 res!1080669) b!1581801))

(declare-fun m!1452609 () Bool)

(assert (=> b!1581801 m!1452609))

(assert (=> b!1581706 d!166833))

(declare-fun lt!677016 () Bool)

(declare-fun d!166839 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!854 (List!36834) (InoxSet tuple2!25592))

(assert (=> d!166839 (= lt!677016 (select (content!854 l!1390) (tuple2!25593 key!405 value!194)))))

(declare-fun e!882677 () Bool)

(assert (=> d!166839 (= lt!677016 e!882677)))

(declare-fun res!1080680 () Bool)

(assert (=> d!166839 (=> (not res!1080680) (not e!882677))))

(assert (=> d!166839 (= res!1080680 ((_ is Cons!36830) l!1390))))

(assert (=> d!166839 (= (contains!10506 l!1390 (tuple2!25593 key!405 value!194)) lt!677016)))

(declare-fun b!1581821 () Bool)

(declare-fun e!882676 () Bool)

(assert (=> b!1581821 (= e!882677 e!882676)))

(declare-fun res!1080681 () Bool)

(assert (=> b!1581821 (=> res!1080681 e!882676)))

(assert (=> b!1581821 (= res!1080681 (= (h!38373 l!1390) (tuple2!25593 key!405 value!194)))))

(declare-fun b!1581822 () Bool)

(assert (=> b!1581822 (= e!882676 (contains!10506 (t!51748 l!1390) (tuple2!25593 key!405 value!194)))))

(assert (= (and d!166839 res!1080680) b!1581821))

(assert (= (and b!1581821 (not res!1080681)) b!1581822))

(declare-fun m!1452615 () Bool)

(assert (=> d!166839 m!1452615))

(declare-fun m!1452617 () Bool)

(assert (=> d!166839 m!1452617))

(declare-fun m!1452619 () Bool)

(assert (=> b!1581822 m!1452619))

(assert (=> b!1581707 d!166839))

(declare-fun d!166849 () Bool)

(assert (=> d!166849 (= (get!26824 lt!677004) (v!22450 lt!677004))))

(assert (=> b!1581712 d!166849))

(declare-fun b!1581831 () Bool)

(declare-fun e!882684 () Bool)

(declare-fun tp!114608 () Bool)

(assert (=> b!1581831 (= e!882684 (and tp_is_empty!39249 tp!114608))))

(assert (=> b!1581708 (= tp!114599 e!882684)))

(assert (= (and b!1581708 ((_ is Cons!36830) (t!51748 l!1390))) b!1581831))

(check-sat (not b!1581769) (not b!1581801) tp_is_empty!39249 (not d!166839) (not b!1581744) (not b!1581831) (not b!1581822))
(check-sat)
