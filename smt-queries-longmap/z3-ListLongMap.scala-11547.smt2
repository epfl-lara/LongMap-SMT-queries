; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134826 () Bool)

(assert start!134826)

(declare-fun b!1571902 () Bool)

(declare-fun res!1073477 () Bool)

(declare-fun e!876431 () Bool)

(assert (=> b!1571902 (=> (not res!1073477) (not e!876431))))

(declare-datatypes ((B!2516 0))(
  ( (B!2517 (val!19620 Int)) )
))
(declare-datatypes ((tuple2!25402 0))(
  ( (tuple2!25403 (_1!12712 (_ BitVec 64)) (_2!12712 B!2516)) )
))
(declare-datatypes ((List!36772 0))(
  ( (Nil!36769) (Cons!36768 (h!38233 tuple2!25402) (t!51672 List!36772)) )
))
(declare-fun l!750 () List!36772)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1571902 (= res!1073477 (or (not ((_ is Cons!36768) l!750)) (bvsge (_1!12712 (h!38233 l!750)) key1!37) (bvsge (_1!12712 (h!38233 l!750)) key2!21)))))

(declare-fun b!1571901 () Bool)

(declare-fun res!1073476 () Bool)

(assert (=> b!1571901 (=> (not res!1073476) (not e!876431))))

(declare-fun isStrictlySorted!995 (List!36772) Bool)

(assert (=> b!1571901 (= res!1073476 (isStrictlySorted!995 l!750))))

(declare-fun v2!10 () B!2516)

(declare-fun b!1571903 () Bool)

(declare-fun insertStrictlySorted!594 (List!36772 (_ BitVec 64) B!2516) List!36772)

(assert (=> b!1571903 (= e!876431 (not (isStrictlySorted!995 (insertStrictlySorted!594 l!750 key2!21 v2!10))))))

(declare-fun b!1571904 () Bool)

(declare-fun e!876430 () Bool)

(declare-fun tp_is_empty!39067 () Bool)

(declare-fun tp!114129 () Bool)

(assert (=> b!1571904 (= e!876430 (and tp_is_empty!39067 tp!114129))))

(declare-fun res!1073475 () Bool)

(assert (=> start!134826 (=> (not res!1073475) (not e!876431))))

(assert (=> start!134826 (= res!1073475 (not (= key1!37 key2!21)))))

(assert (=> start!134826 e!876431))

(assert (=> start!134826 true))

(assert (=> start!134826 e!876430))

(assert (=> start!134826 tp_is_empty!39067))

(assert (= (and start!134826 res!1073475) b!1571901))

(assert (= (and b!1571901 res!1073476) b!1571902))

(assert (= (and b!1571902 res!1073477) b!1571903))

(assert (= (and start!134826 ((_ is Cons!36768) l!750)) b!1571904))

(declare-fun m!1446057 () Bool)

(assert (=> b!1571901 m!1446057))

(declare-fun m!1446059 () Bool)

(assert (=> b!1571903 m!1446059))

(assert (=> b!1571903 m!1446059))

(declare-fun m!1446061 () Bool)

(assert (=> b!1571903 m!1446061))

(check-sat (not b!1571901) (not b!1571903) (not b!1571904) tp_is_empty!39067)
(check-sat)
(get-model)

(declare-fun d!164599 () Bool)

(declare-fun res!1073504 () Bool)

(declare-fun e!876452 () Bool)

(assert (=> d!164599 (=> res!1073504 e!876452)))

(assert (=> d!164599 (= res!1073504 (or ((_ is Nil!36769) l!750) ((_ is Nil!36769) (t!51672 l!750))))))

(assert (=> d!164599 (= (isStrictlySorted!995 l!750) e!876452)))

(declare-fun b!1571937 () Bool)

(declare-fun e!876453 () Bool)

(assert (=> b!1571937 (= e!876452 e!876453)))

(declare-fun res!1073505 () Bool)

(assert (=> b!1571937 (=> (not res!1073505) (not e!876453))))

(assert (=> b!1571937 (= res!1073505 (bvslt (_1!12712 (h!38233 l!750)) (_1!12712 (h!38233 (t!51672 l!750)))))))

(declare-fun b!1571938 () Bool)

(assert (=> b!1571938 (= e!876453 (isStrictlySorted!995 (t!51672 l!750)))))

(assert (= (and d!164599 (not res!1073504)) b!1571937))

(assert (= (and b!1571937 res!1073505) b!1571938))

(declare-fun m!1446075 () Bool)

(assert (=> b!1571938 m!1446075))

(assert (=> b!1571901 d!164599))

(declare-fun d!164605 () Bool)

(declare-fun res!1073506 () Bool)

(declare-fun e!876454 () Bool)

(assert (=> d!164605 (=> res!1073506 e!876454)))

(assert (=> d!164605 (= res!1073506 (or ((_ is Nil!36769) (insertStrictlySorted!594 l!750 key2!21 v2!10)) ((_ is Nil!36769) (t!51672 (insertStrictlySorted!594 l!750 key2!21 v2!10)))))))

(assert (=> d!164605 (= (isStrictlySorted!995 (insertStrictlySorted!594 l!750 key2!21 v2!10)) e!876454)))

(declare-fun b!1571939 () Bool)

(declare-fun e!876455 () Bool)

(assert (=> b!1571939 (= e!876454 e!876455)))

(declare-fun res!1073507 () Bool)

(assert (=> b!1571939 (=> (not res!1073507) (not e!876455))))

(assert (=> b!1571939 (= res!1073507 (bvslt (_1!12712 (h!38233 (insertStrictlySorted!594 l!750 key2!21 v2!10))) (_1!12712 (h!38233 (t!51672 (insertStrictlySorted!594 l!750 key2!21 v2!10))))))))

(declare-fun b!1571940 () Bool)

(assert (=> b!1571940 (= e!876455 (isStrictlySorted!995 (t!51672 (insertStrictlySorted!594 l!750 key2!21 v2!10))))))

(assert (= (and d!164605 (not res!1073506)) b!1571939))

(assert (= (and b!1571939 res!1073507) b!1571940))

(declare-fun m!1446077 () Bool)

(assert (=> b!1571940 m!1446077))

(assert (=> b!1571903 d!164605))

(declare-fun bm!72258 () Bool)

(declare-fun c!145565 () Bool)

(declare-fun e!876500 () List!36772)

(declare-fun call!72261 () List!36772)

(declare-fun $colon$colon!994 (List!36772 tuple2!25402) List!36772)

(assert (=> bm!72258 (= call!72261 ($colon$colon!994 e!876500 (ite c!145565 (h!38233 l!750) (tuple2!25403 key2!21 v2!10))))))

(declare-fun c!145566 () Bool)

(assert (=> bm!72258 (= c!145566 c!145565)))

(declare-fun b!1572011 () Bool)

(declare-fun res!1073531 () Bool)

(declare-fun e!876497 () Bool)

(assert (=> b!1572011 (=> (not res!1073531) (not e!876497))))

(declare-fun lt!674221 () List!36772)

(declare-fun containsKey!866 (List!36772 (_ BitVec 64)) Bool)

(assert (=> b!1572011 (= res!1073531 (containsKey!866 lt!674221 key2!21))))

(declare-fun b!1572012 () Bool)

(declare-fun e!876498 () List!36772)

(assert (=> b!1572012 (= e!876498 call!72261)))

(declare-fun b!1572013 () Bool)

(declare-fun contains!10469 (List!36772 tuple2!25402) Bool)

(assert (=> b!1572013 (= e!876497 (contains!10469 lt!674221 (tuple2!25403 key2!21 v2!10)))))

(declare-fun b!1572014 () Bool)

(declare-fun c!145563 () Bool)

(assert (=> b!1572014 (= c!145563 (and ((_ is Cons!36768) l!750) (bvsgt (_1!12712 (h!38233 l!750)) key2!21)))))

(declare-fun e!876499 () List!36772)

(declare-fun e!876496 () List!36772)

(assert (=> b!1572014 (= e!876499 e!876496)))

(declare-fun b!1572015 () Bool)

(declare-fun call!72263 () List!36772)

(assert (=> b!1572015 (= e!876499 call!72263)))

(declare-fun b!1572016 () Bool)

(assert (=> b!1572016 (= e!876498 e!876499)))

(declare-fun c!145564 () Bool)

(assert (=> b!1572016 (= c!145564 (and ((_ is Cons!36768) l!750) (= (_1!12712 (h!38233 l!750)) key2!21)))))

(declare-fun bm!72260 () Bool)

(declare-fun call!72262 () List!36772)

(assert (=> bm!72260 (= call!72262 call!72263)))

(declare-fun d!164607 () Bool)

(assert (=> d!164607 e!876497))

(declare-fun res!1073530 () Bool)

(assert (=> d!164607 (=> (not res!1073530) (not e!876497))))

(assert (=> d!164607 (= res!1073530 (isStrictlySorted!995 lt!674221))))

(assert (=> d!164607 (= lt!674221 e!876498)))

(assert (=> d!164607 (= c!145565 (and ((_ is Cons!36768) l!750) (bvslt (_1!12712 (h!38233 l!750)) key2!21)))))

(assert (=> d!164607 (isStrictlySorted!995 l!750)))

(assert (=> d!164607 (= (insertStrictlySorted!594 l!750 key2!21 v2!10) lt!674221)))

(declare-fun bm!72259 () Bool)

(assert (=> bm!72259 (= call!72263 call!72261)))

(declare-fun b!1572017 () Bool)

(assert (=> b!1572017 (= e!876496 call!72262)))

(declare-fun b!1572018 () Bool)

(assert (=> b!1572018 (= e!876496 call!72262)))

(declare-fun b!1572019 () Bool)

(assert (=> b!1572019 (= e!876500 (ite c!145564 (t!51672 l!750) (ite c!145563 (Cons!36768 (h!38233 l!750) (t!51672 l!750)) Nil!36769)))))

(declare-fun b!1572020 () Bool)

(assert (=> b!1572020 (= e!876500 (insertStrictlySorted!594 (t!51672 l!750) key2!21 v2!10))))

(assert (= (and d!164607 c!145565) b!1572012))

(assert (= (and d!164607 (not c!145565)) b!1572016))

(assert (= (and b!1572016 c!145564) b!1572015))

(assert (= (and b!1572016 (not c!145564)) b!1572014))

(assert (= (and b!1572014 c!145563) b!1572017))

(assert (= (and b!1572014 (not c!145563)) b!1572018))

(assert (= (or b!1572017 b!1572018) bm!72260))

(assert (= (or b!1572015 bm!72260) bm!72259))

(assert (= (or b!1572012 bm!72259) bm!72258))

(assert (= (and bm!72258 c!145566) b!1572020))

(assert (= (and bm!72258 (not c!145566)) b!1572019))

(assert (= (and d!164607 res!1073530) b!1572011))

(assert (= (and b!1572011 res!1073531) b!1572013))

(declare-fun m!1446085 () Bool)

(assert (=> bm!72258 m!1446085))

(declare-fun m!1446087 () Bool)

(assert (=> d!164607 m!1446087))

(assert (=> d!164607 m!1446057))

(declare-fun m!1446089 () Bool)

(assert (=> b!1572013 m!1446089))

(declare-fun m!1446091 () Bool)

(assert (=> b!1572011 m!1446091))

(declare-fun m!1446093 () Bool)

(assert (=> b!1572020 m!1446093))

(assert (=> b!1571903 d!164607))

(declare-fun b!1572049 () Bool)

(declare-fun e!876515 () Bool)

(declare-fun tp!114140 () Bool)

(assert (=> b!1572049 (= e!876515 (and tp_is_empty!39067 tp!114140))))

(assert (=> b!1571904 (= tp!114129 e!876515)))

(assert (= (and b!1571904 ((_ is Cons!36768) (t!51672 l!750))) b!1572049))

(check-sat (not b!1572011) (not b!1572013) (not b!1571940) (not b!1572020) (not d!164607) (not b!1571938) (not bm!72258) (not b!1572049) tp_is_empty!39067)
(check-sat)
