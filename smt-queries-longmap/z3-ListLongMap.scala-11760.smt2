; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137952 () Bool)

(assert start!137952)

(declare-fun b!1583634 () Bool)

(declare-fun e!883968 () Bool)

(declare-fun tp_is_empty!39433 () Bool)

(declare-fun tp!115049 () Bool)

(assert (=> b!1583634 (= e!883968 (and tp_is_empty!39433 tp!115049))))

(declare-fun res!1081802 () Bool)

(declare-fun e!883969 () Bool)

(assert (=> start!137952 (=> (not res!1081802) (not e!883969))))

(declare-datatypes ((B!2900 0))(
  ( (B!2901 (val!19812 Int)) )
))
(declare-datatypes ((tuple2!25860 0))(
  ( (tuple2!25861 (_1!12941 (_ BitVec 64)) (_2!12941 B!2900)) )
))
(declare-datatypes ((List!36973 0))(
  ( (Nil!36970) (Cons!36969 (h!38513 tuple2!25860) (t!51879 List!36973)) )
))
(declare-fun l!1251 () List!36973)

(declare-fun isStrictlySorted!1155 (List!36973) Bool)

(assert (=> start!137952 (= res!1081802 (isStrictlySorted!1155 l!1251))))

(assert (=> start!137952 e!883969))

(assert (=> start!137952 e!883968))

(assert (=> start!137952 true))

(assert (=> start!137952 tp_is_empty!39433))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun b!1583633 () Bool)

(declare-fun newValue!123 () B!2900)

(declare-fun insertStrictlySorted!624 (List!36973 (_ BitVec 64) B!2900) List!36973)

(assert (=> b!1583633 (= e!883969 (not (isStrictlySorted!1155 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123))))))

(declare-fun b!1583632 () Bool)

(declare-fun res!1081801 () Bool)

(assert (=> b!1583632 (=> (not res!1081801) (not e!883969))))

(declare-fun otherKey!56 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1583632 (= res!1081801 (and (not (= otherKey!56 newKey!123)) (not ((_ is Cons!36969) l!1251))))))

(declare-fun b!1583631 () Bool)

(declare-fun res!1081800 () Bool)

(assert (=> b!1583631 (=> (not res!1081800) (not e!883969))))

(declare-fun containsKey!989 (List!36973 (_ BitVec 64)) Bool)

(assert (=> b!1583631 (= res!1081800 (not (containsKey!989 l!1251 otherKey!56)))))

(assert (= (and start!137952 res!1081802) b!1583631))

(assert (= (and b!1583631 res!1081800) b!1583632))

(assert (= (and b!1583632 res!1081801) b!1583633))

(assert (= (and start!137952 ((_ is Cons!36969) l!1251)) b!1583634))

(declare-fun m!1452661 () Bool)

(assert (=> start!137952 m!1452661))

(declare-fun m!1452663 () Bool)

(assert (=> b!1583633 m!1452663))

(assert (=> b!1583633 m!1452663))

(declare-fun m!1452665 () Bool)

(assert (=> b!1583633 m!1452665))

(declare-fun m!1452667 () Bool)

(assert (=> b!1583631 m!1452667))

(check-sat (not b!1583633) tp_is_empty!39433 (not b!1583634) (not start!137952) (not b!1583631))
(check-sat)
(get-model)

(declare-fun d!167091 () Bool)

(declare-fun res!1081829 () Bool)

(declare-fun e!883990 () Bool)

(assert (=> d!167091 (=> res!1081829 e!883990)))

(assert (=> d!167091 (= res!1081829 (or ((_ is Nil!36970) l!1251) ((_ is Nil!36970) (t!51879 l!1251))))))

(assert (=> d!167091 (= (isStrictlySorted!1155 l!1251) e!883990)))

(declare-fun b!1583667 () Bool)

(declare-fun e!883991 () Bool)

(assert (=> b!1583667 (= e!883990 e!883991)))

(declare-fun res!1081830 () Bool)

(assert (=> b!1583667 (=> (not res!1081830) (not e!883991))))

(assert (=> b!1583667 (= res!1081830 (bvslt (_1!12941 (h!38513 l!1251)) (_1!12941 (h!38513 (t!51879 l!1251)))))))

(declare-fun b!1583668 () Bool)

(assert (=> b!1583668 (= e!883991 (isStrictlySorted!1155 (t!51879 l!1251)))))

(assert (= (and d!167091 (not res!1081829)) b!1583667))

(assert (= (and b!1583667 res!1081830) b!1583668))

(declare-fun m!1452685 () Bool)

(assert (=> b!1583668 m!1452685))

(assert (=> start!137952 d!167091))

(declare-fun d!167095 () Bool)

(declare-fun res!1081831 () Bool)

(declare-fun e!883992 () Bool)

(assert (=> d!167095 (=> res!1081831 e!883992)))

(assert (=> d!167095 (= res!1081831 (or ((_ is Nil!36970) (insertStrictlySorted!624 l!1251 newKey!123 newValue!123)) ((_ is Nil!36970) (t!51879 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123)))))))

(assert (=> d!167095 (= (isStrictlySorted!1155 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123)) e!883992)))

(declare-fun b!1583669 () Bool)

(declare-fun e!883993 () Bool)

(assert (=> b!1583669 (= e!883992 e!883993)))

(declare-fun res!1081832 () Bool)

(assert (=> b!1583669 (=> (not res!1081832) (not e!883993))))

(assert (=> b!1583669 (= res!1081832 (bvslt (_1!12941 (h!38513 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123))) (_1!12941 (h!38513 (t!51879 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123))))))))

(declare-fun b!1583670 () Bool)

(assert (=> b!1583670 (= e!883993 (isStrictlySorted!1155 (t!51879 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123))))))

(assert (= (and d!167095 (not res!1081831)) b!1583669))

(assert (= (and b!1583669 res!1081832) b!1583670))

(declare-fun m!1452687 () Bool)

(assert (=> b!1583670 m!1452687))

(assert (=> b!1583633 d!167095))

(declare-fun b!1583735 () Bool)

(declare-fun e!884037 () List!36973)

(declare-fun call!72495 () List!36973)

(assert (=> b!1583735 (= e!884037 call!72495)))

(declare-fun b!1583736 () Bool)

(declare-fun e!884040 () List!36973)

(assert (=> b!1583736 (= e!884040 e!884037)))

(declare-fun c!146728 () Bool)

(assert (=> b!1583736 (= c!146728 (and ((_ is Cons!36969) l!1251) (= (_1!12941 (h!38513 l!1251)) newKey!123)))))

(declare-fun e!884038 () List!36973)

(declare-fun b!1583737 () Bool)

(declare-fun c!146727 () Bool)

(assert (=> b!1583737 (= e!884038 (ite c!146728 (t!51879 l!1251) (ite c!146727 (Cons!36969 (h!38513 l!1251) (t!51879 l!1251)) Nil!36970)))))

(declare-fun b!1583738 () Bool)

(declare-fun e!884039 () List!36973)

(declare-fun call!72493 () List!36973)

(assert (=> b!1583738 (= e!884039 call!72493)))

(declare-fun b!1583739 () Bool)

(declare-fun e!884036 () Bool)

(declare-fun lt!676950 () List!36973)

(declare-fun contains!10478 (List!36973 tuple2!25860) Bool)

(assert (=> b!1583739 (= e!884036 (contains!10478 lt!676950 (tuple2!25861 newKey!123 newValue!123)))))

(declare-fun b!1583740 () Bool)

(declare-fun call!72494 () List!36973)

(assert (=> b!1583740 (= e!884040 call!72494)))

(declare-fun b!1583741 () Bool)

(assert (=> b!1583741 (= c!146727 (and ((_ is Cons!36969) l!1251) (bvsgt (_1!12941 (h!38513 l!1251)) newKey!123)))))

(assert (=> b!1583741 (= e!884037 e!884039)))

(declare-fun bm!72490 () Bool)

(assert (=> bm!72490 (= call!72493 call!72495)))

(declare-fun b!1583742 () Bool)

(assert (=> b!1583742 (= e!884039 call!72493)))

(declare-fun b!1583743 () Bool)

(assert (=> b!1583743 (= e!884038 (insertStrictlySorted!624 (t!51879 l!1251) newKey!123 newValue!123))))

(declare-fun bm!72491 () Bool)

(assert (=> bm!72491 (= call!72495 call!72494)))

(declare-fun d!167097 () Bool)

(assert (=> d!167097 e!884036))

(declare-fun res!1081863 () Bool)

(assert (=> d!167097 (=> (not res!1081863) (not e!884036))))

(assert (=> d!167097 (= res!1081863 (isStrictlySorted!1155 lt!676950))))

(assert (=> d!167097 (= lt!676950 e!884040)))

(declare-fun c!146726 () Bool)

(assert (=> d!167097 (= c!146726 (and ((_ is Cons!36969) l!1251) (bvslt (_1!12941 (h!38513 l!1251)) newKey!123)))))

(assert (=> d!167097 (isStrictlySorted!1155 l!1251)))

(assert (=> d!167097 (= (insertStrictlySorted!624 l!1251 newKey!123 newValue!123) lt!676950)))

(declare-fun b!1583744 () Bool)

(declare-fun res!1081864 () Bool)

(assert (=> b!1583744 (=> (not res!1081864) (not e!884036))))

(assert (=> b!1583744 (= res!1081864 (containsKey!989 lt!676950 newKey!123))))

(declare-fun bm!72492 () Bool)

(declare-fun $colon$colon!1023 (List!36973 tuple2!25860) List!36973)

(assert (=> bm!72492 (= call!72494 ($colon$colon!1023 e!884038 (ite c!146726 (h!38513 l!1251) (tuple2!25861 newKey!123 newValue!123))))))

(declare-fun c!146729 () Bool)

(assert (=> bm!72492 (= c!146729 c!146726)))

(assert (= (and d!167097 c!146726) b!1583740))

(assert (= (and d!167097 (not c!146726)) b!1583736))

(assert (= (and b!1583736 c!146728) b!1583735))

(assert (= (and b!1583736 (not c!146728)) b!1583741))

(assert (= (and b!1583741 c!146727) b!1583738))

(assert (= (and b!1583741 (not c!146727)) b!1583742))

(assert (= (or b!1583738 b!1583742) bm!72490))

(assert (= (or b!1583735 bm!72490) bm!72491))

(assert (= (or b!1583740 bm!72491) bm!72492))

(assert (= (and bm!72492 c!146729) b!1583743))

(assert (= (and bm!72492 (not c!146729)) b!1583737))

(assert (= (and d!167097 res!1081863) b!1583744))

(assert (= (and b!1583744 res!1081864) b!1583739))

(declare-fun m!1452699 () Bool)

(assert (=> d!167097 m!1452699))

(assert (=> d!167097 m!1452661))

(declare-fun m!1452701 () Bool)

(assert (=> b!1583743 m!1452701))

(declare-fun m!1452703 () Bool)

(assert (=> bm!72492 m!1452703))

(declare-fun m!1452705 () Bool)

(assert (=> b!1583739 m!1452705))

(declare-fun m!1452707 () Bool)

(assert (=> b!1583744 m!1452707))

(assert (=> b!1583633 d!167097))

(declare-fun d!167111 () Bool)

(declare-fun res!1081875 () Bool)

(declare-fun e!884060 () Bool)

(assert (=> d!167111 (=> res!1081875 e!884060)))

(assert (=> d!167111 (= res!1081875 (and ((_ is Cons!36969) l!1251) (= (_1!12941 (h!38513 l!1251)) otherKey!56)))))

(assert (=> d!167111 (= (containsKey!989 l!1251 otherKey!56) e!884060)))

(declare-fun b!1583779 () Bool)

(declare-fun e!884061 () Bool)

(assert (=> b!1583779 (= e!884060 e!884061)))

(declare-fun res!1081876 () Bool)

(assert (=> b!1583779 (=> (not res!1081876) (not e!884061))))

(assert (=> b!1583779 (= res!1081876 (and (or (not ((_ is Cons!36969) l!1251)) (bvsle (_1!12941 (h!38513 l!1251)) otherKey!56)) ((_ is Cons!36969) l!1251) (bvslt (_1!12941 (h!38513 l!1251)) otherKey!56)))))

(declare-fun b!1583780 () Bool)

(assert (=> b!1583780 (= e!884061 (containsKey!989 (t!51879 l!1251) otherKey!56))))

(assert (= (and d!167111 (not res!1081875)) b!1583779))

(assert (= (and b!1583779 res!1081876) b!1583780))

(declare-fun m!1452719 () Bool)

(assert (=> b!1583780 m!1452719))

(assert (=> b!1583631 d!167111))

(declare-fun b!1583788 () Bool)

(declare-fun e!884067 () Bool)

(declare-fun tp!115061 () Bool)

(assert (=> b!1583788 (= e!884067 (and tp_is_empty!39433 tp!115061))))

(assert (=> b!1583634 (= tp!115049 e!884067)))

(assert (= (and b!1583634 ((_ is Cons!36969) (t!51879 l!1251))) b!1583788))

(check-sat (not d!167097) (not b!1583668) (not bm!72492) tp_is_empty!39433 (not b!1583739) (not b!1583670) (not b!1583744) (not b!1583780) (not b!1583788) (not b!1583743))
(check-sat)
