; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88862 () Bool)

(assert start!88862)

(declare-fun res!683624 () Bool)

(declare-fun e!573997 () Bool)

(assert (=> start!88862 (=> (not res!683624) (not e!573997))))

(declare-datatypes ((B!1700 0))(
  ( (B!1701 (val!11934 Int)) )
))
(declare-datatypes ((tuple2!15494 0))(
  ( (tuple2!15495 (_1!7758 (_ BitVec 64)) (_2!7758 B!1700)) )
))
(declare-datatypes ((List!21657 0))(
  ( (Nil!21654) (Cons!21653 (h!22851 tuple2!15494) (t!30658 List!21657)) )
))
(declare-fun l!996 () List!21657)

(declare-fun isStrictlySorted!683 (List!21657) Bool)

(assert (=> start!88862 (= res!683624 (isStrictlySorted!683 l!996))))

(assert (=> start!88862 e!573997))

(declare-fun e!573996 () Bool)

(assert (=> start!88862 e!573996))

(assert (=> start!88862 true))

(declare-fun tp_is_empty!23767 () Bool)

(assert (=> start!88862 tp_is_empty!23767))

(declare-fun b!1019858 () Bool)

(declare-fun e!573998 () Bool)

(assert (=> b!1019858 (= e!573997 e!573998)))

(declare-fun res!683625 () Bool)

(assert (=> b!1019858 (=> (not res!683625) (not e!573998))))

(declare-fun key!261 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1019858 (= res!683625 (and (or (not ((_ is Cons!21653) l!996)) (bvsge (_1!7758 (h!22851 l!996)) key!261)) (or (not ((_ is Cons!21653) l!996)) (not (= (_1!7758 (h!22851 l!996)) key!261)))))))

(declare-fun value!172 () B!1700)

(declare-fun lt!449572 () List!21657)

(declare-fun insertStrictlySorted!366 (List!21657 (_ BitVec 64) B!1700) List!21657)

(assert (=> b!1019858 (= lt!449572 (insertStrictlySorted!366 l!996 key!261 value!172))))

(declare-fun b!1019857 () Bool)

(declare-fun res!683626 () Bool)

(assert (=> b!1019857 (=> (not res!683626) (not e!573997))))

(declare-fun containsKey!547 (List!21657 (_ BitVec 64)) Bool)

(assert (=> b!1019857 (= res!683626 (containsKey!547 l!996 key!261))))

(declare-fun b!1019859 () Bool)

(declare-fun length!50 (List!21657) Int)

(assert (=> b!1019859 (= e!573998 (not (= (length!50 lt!449572) (length!50 l!996))))))

(declare-fun b!1019860 () Bool)

(declare-fun tp!71191 () Bool)

(assert (=> b!1019860 (= e!573996 (and tp_is_empty!23767 tp!71191))))

(assert (= (and start!88862 res!683624) b!1019857))

(assert (= (and b!1019857 res!683626) b!1019858))

(assert (= (and b!1019858 res!683625) b!1019859))

(assert (= (and start!88862 ((_ is Cons!21653) l!996)) b!1019860))

(declare-fun m!939527 () Bool)

(assert (=> start!88862 m!939527))

(declare-fun m!939529 () Bool)

(assert (=> b!1019858 m!939529))

(declare-fun m!939531 () Bool)

(assert (=> b!1019857 m!939531))

(declare-fun m!939533 () Bool)

(assert (=> b!1019859 m!939533))

(declare-fun m!939535 () Bool)

(assert (=> b!1019859 m!939535))

(check-sat (not b!1019860) tp_is_empty!23767 (not start!88862) (not b!1019859) (not b!1019857) (not b!1019858))
(check-sat)
(get-model)

(declare-fun d!122141 () Bool)

(declare-fun res!683649 () Bool)

(declare-fun e!574021 () Bool)

(assert (=> d!122141 (=> res!683649 e!574021)))

(assert (=> d!122141 (= res!683649 (and ((_ is Cons!21653) l!996) (= (_1!7758 (h!22851 l!996)) key!261)))))

(assert (=> d!122141 (= (containsKey!547 l!996 key!261) e!574021)))

(declare-fun b!1019889 () Bool)

(declare-fun e!574022 () Bool)

(assert (=> b!1019889 (= e!574021 e!574022)))

(declare-fun res!683650 () Bool)

(assert (=> b!1019889 (=> (not res!683650) (not e!574022))))

(assert (=> b!1019889 (= res!683650 (and (or (not ((_ is Cons!21653) l!996)) (bvsle (_1!7758 (h!22851 l!996)) key!261)) ((_ is Cons!21653) l!996) (bvslt (_1!7758 (h!22851 l!996)) key!261)))))

(declare-fun b!1019890 () Bool)

(assert (=> b!1019890 (= e!574022 (containsKey!547 (t!30658 l!996) key!261))))

(assert (= (and d!122141 (not res!683649)) b!1019889))

(assert (= (and b!1019889 res!683650) b!1019890))

(declare-fun m!939561 () Bool)

(assert (=> b!1019890 m!939561))

(assert (=> b!1019857 d!122141))

(declare-fun e!574071 () Bool)

(declare-fun b!1019961 () Bool)

(declare-fun lt!449585 () List!21657)

(declare-fun contains!5889 (List!21657 tuple2!15494) Bool)

(assert (=> b!1019961 (= e!574071 (contains!5889 lt!449585 (tuple2!15495 key!261 value!172)))))

(declare-fun e!574067 () List!21657)

(declare-fun b!1019962 () Bool)

(declare-fun c!103446 () Bool)

(declare-fun c!103445 () Bool)

(assert (=> b!1019962 (= e!574067 (ite c!103446 (t!30658 l!996) (ite c!103445 (Cons!21653 (h!22851 l!996) (t!30658 l!996)) Nil!21654)))))

(declare-fun b!1019963 () Bool)

(assert (=> b!1019963 (= e!574067 (insertStrictlySorted!366 (t!30658 l!996) key!261 value!172))))

(declare-fun bm!43146 () Bool)

(declare-fun call!43149 () List!21657)

(declare-fun call!43151 () List!21657)

(assert (=> bm!43146 (= call!43149 call!43151)))

(declare-fun b!1019964 () Bool)

(declare-fun e!574069 () List!21657)

(declare-fun e!574068 () List!21657)

(assert (=> b!1019964 (= e!574069 e!574068)))

(assert (=> b!1019964 (= c!103446 (and ((_ is Cons!21653) l!996) (= (_1!7758 (h!22851 l!996)) key!261)))))

(declare-fun b!1019965 () Bool)

(declare-fun res!683678 () Bool)

(assert (=> b!1019965 (=> (not res!683678) (not e!574071))))

(assert (=> b!1019965 (= res!683678 (containsKey!547 lt!449585 key!261))))

(declare-fun d!122151 () Bool)

(assert (=> d!122151 e!574071))

(declare-fun res!683677 () Bool)

(assert (=> d!122151 (=> (not res!683677) (not e!574071))))

(assert (=> d!122151 (= res!683677 (isStrictlySorted!683 lt!449585))))

(assert (=> d!122151 (= lt!449585 e!574069)))

(declare-fun c!103444 () Bool)

(assert (=> d!122151 (= c!103444 (and ((_ is Cons!21653) l!996) (bvslt (_1!7758 (h!22851 l!996)) key!261)))))

(assert (=> d!122151 (isStrictlySorted!683 l!996)))

(assert (=> d!122151 (= (insertStrictlySorted!366 l!996 key!261 value!172) lt!449585)))

(declare-fun bm!43147 () Bool)

(declare-fun call!43150 () List!21657)

(assert (=> bm!43147 (= call!43151 call!43150)))

(declare-fun b!1019966 () Bool)

(declare-fun e!574070 () List!21657)

(assert (=> b!1019966 (= e!574070 call!43149)))

(declare-fun b!1019967 () Bool)

(assert (=> b!1019967 (= e!574068 call!43151)))

(declare-fun b!1019968 () Bool)

(assert (=> b!1019968 (= e!574069 call!43150)))

(declare-fun b!1019969 () Bool)

(assert (=> b!1019969 (= c!103445 (and ((_ is Cons!21653) l!996) (bvsgt (_1!7758 (h!22851 l!996)) key!261)))))

(assert (=> b!1019969 (= e!574068 e!574070)))

(declare-fun bm!43148 () Bool)

(declare-fun $colon$colon!597 (List!21657 tuple2!15494) List!21657)

(assert (=> bm!43148 (= call!43150 ($colon$colon!597 e!574067 (ite c!103444 (h!22851 l!996) (tuple2!15495 key!261 value!172))))))

(declare-fun c!103443 () Bool)

(assert (=> bm!43148 (= c!103443 c!103444)))

(declare-fun b!1019970 () Bool)

(assert (=> b!1019970 (= e!574070 call!43149)))

(assert (= (and d!122151 c!103444) b!1019968))

(assert (= (and d!122151 (not c!103444)) b!1019964))

(assert (= (and b!1019964 c!103446) b!1019967))

(assert (= (and b!1019964 (not c!103446)) b!1019969))

(assert (= (and b!1019969 c!103445) b!1019966))

(assert (= (and b!1019969 (not c!103445)) b!1019970))

(assert (= (or b!1019966 b!1019970) bm!43146))

(assert (= (or b!1019967 bm!43146) bm!43147))

(assert (= (or b!1019968 bm!43147) bm!43148))

(assert (= (and bm!43148 c!103443) b!1019963))

(assert (= (and bm!43148 (not c!103443)) b!1019962))

(assert (= (and d!122151 res!683677) b!1019965))

(assert (= (and b!1019965 res!683678) b!1019961))

(declare-fun m!939569 () Bool)

(assert (=> b!1019961 m!939569))

(declare-fun m!939571 () Bool)

(assert (=> b!1019963 m!939571))

(declare-fun m!939573 () Bool)

(assert (=> d!122151 m!939573))

(assert (=> d!122151 m!939527))

(declare-fun m!939575 () Bool)

(assert (=> bm!43148 m!939575))

(declare-fun m!939577 () Bool)

(assert (=> b!1019965 m!939577))

(assert (=> b!1019858 d!122151))

(declare-fun d!122159 () Bool)

(declare-fun size!31135 (List!21657) Int)

(assert (=> d!122159 (= (length!50 lt!449572) (size!31135 lt!449572))))

(declare-fun bs!29689 () Bool)

(assert (= bs!29689 d!122159))

(declare-fun m!939579 () Bool)

(assert (=> bs!29689 m!939579))

(assert (=> b!1019859 d!122159))

(declare-fun d!122161 () Bool)

(assert (=> d!122161 (= (length!50 l!996) (size!31135 l!996))))

(declare-fun bs!29690 () Bool)

(assert (= bs!29690 d!122161))

(declare-fun m!939581 () Bool)

(assert (=> bs!29690 m!939581))

(assert (=> b!1019859 d!122161))

(declare-fun d!122163 () Bool)

(declare-fun res!683689 () Bool)

(declare-fun e!574085 () Bool)

(assert (=> d!122163 (=> res!683689 e!574085)))

(assert (=> d!122163 (= res!683689 (or ((_ is Nil!21654) l!996) ((_ is Nil!21654) (t!30658 l!996))))))

(assert (=> d!122163 (= (isStrictlySorted!683 l!996) e!574085)))

(declare-fun b!1019993 () Bool)

(declare-fun e!574086 () Bool)

(assert (=> b!1019993 (= e!574085 e!574086)))

(declare-fun res!683690 () Bool)

(assert (=> b!1019993 (=> (not res!683690) (not e!574086))))

(assert (=> b!1019993 (= res!683690 (bvslt (_1!7758 (h!22851 l!996)) (_1!7758 (h!22851 (t!30658 l!996)))))))

(declare-fun b!1019994 () Bool)

(assert (=> b!1019994 (= e!574086 (isStrictlySorted!683 (t!30658 l!996)))))

(assert (= (and d!122163 (not res!683689)) b!1019993))

(assert (= (and b!1019993 res!683690) b!1019994))

(declare-fun m!939597 () Bool)

(assert (=> b!1019994 m!939597))

(assert (=> start!88862 d!122163))

(declare-fun b!1020013 () Bool)

(declare-fun e!574098 () Bool)

(declare-fun tp!71200 () Bool)

(assert (=> b!1020013 (= e!574098 (and tp_is_empty!23767 tp!71200))))

(assert (=> b!1019860 (= tp!71191 e!574098)))

(assert (= (and b!1019860 ((_ is Cons!21653) (t!30658 l!996))) b!1020013))

(check-sat (not d!122159) (not b!1019994) (not d!122161) (not bm!43148) tp_is_empty!23767 (not b!1019890) (not b!1020013) (not b!1019961) (not b!1019963) (not d!122151) (not b!1019965))
(check-sat)
