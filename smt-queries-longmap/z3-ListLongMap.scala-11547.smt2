; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134364 () Bool)

(assert start!134364)

(declare-fun b!1569153 () Bool)

(declare-fun res!1072487 () Bool)

(declare-fun e!874723 () Bool)

(assert (=> b!1569153 (=> (not res!1072487) (not e!874723))))

(declare-datatypes ((B!2516 0))(
  ( (B!2517 (val!19620 Int)) )
))
(declare-datatypes ((tuple2!25410 0))(
  ( (tuple2!25411 (_1!12716 (_ BitVec 64)) (_2!12716 B!2516)) )
))
(declare-datatypes ((List!36781 0))(
  ( (Nil!36778) (Cons!36777 (h!38225 tuple2!25410) (t!51681 List!36781)) )
))
(declare-fun l!750 () List!36781)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1569153 (= res!1072487 (or (not ((_ is Cons!36777) l!750)) (bvsge (_1!12716 (h!38225 l!750)) key1!37) (bvsge (_1!12716 (h!38225 l!750)) key2!21)))))

(declare-fun v2!10 () B!2516)

(declare-fun b!1569154 () Bool)

(declare-fun isStrictlySorted!1005 (List!36781) Bool)

(declare-fun insertStrictlySorted!594 (List!36781 (_ BitVec 64) B!2516) List!36781)

(assert (=> b!1569154 (= e!874723 (not (isStrictlySorted!1005 (insertStrictlySorted!594 l!750 key2!21 v2!10))))))

(declare-fun b!1569152 () Bool)

(declare-fun res!1072488 () Bool)

(assert (=> b!1569152 (=> (not res!1072488) (not e!874723))))

(assert (=> b!1569152 (= res!1072488 (isStrictlySorted!1005 l!750))))

(declare-fun res!1072486 () Bool)

(assert (=> start!134364 (=> (not res!1072486) (not e!874723))))

(assert (=> start!134364 (= res!1072486 (not (= key1!37 key2!21)))))

(assert (=> start!134364 e!874723))

(assert (=> start!134364 true))

(declare-fun e!874724 () Bool)

(assert (=> start!134364 e!874724))

(declare-fun tp_is_empty!39067 () Bool)

(assert (=> start!134364 tp_is_empty!39067))

(declare-fun b!1569155 () Bool)

(declare-fun tp!114130 () Bool)

(assert (=> b!1569155 (= e!874724 (and tp_is_empty!39067 tp!114130))))

(assert (= (and start!134364 res!1072486) b!1569152))

(assert (= (and b!1569152 res!1072488) b!1569153))

(assert (= (and b!1569153 res!1072487) b!1569154))

(assert (= (and start!134364 ((_ is Cons!36777) l!750)) b!1569155))

(declare-fun m!1442907 () Bool)

(assert (=> b!1569154 m!1442907))

(assert (=> b!1569154 m!1442907))

(declare-fun m!1442909 () Bool)

(assert (=> b!1569154 m!1442909))

(declare-fun m!1442911 () Bool)

(assert (=> b!1569152 m!1442911))

(check-sat (not b!1569152) (not b!1569154) (not b!1569155) tp_is_empty!39067)
(check-sat)
(get-model)

(declare-fun d!163645 () Bool)

(declare-fun res!1072519 () Bool)

(declare-fun e!874749 () Bool)

(assert (=> d!163645 (=> res!1072519 e!874749)))

(assert (=> d!163645 (= res!1072519 (or ((_ is Nil!36778) l!750) ((_ is Nil!36778) (t!51681 l!750))))))

(assert (=> d!163645 (= (isStrictlySorted!1005 l!750) e!874749)))

(declare-fun b!1569192 () Bool)

(declare-fun e!874750 () Bool)

(assert (=> b!1569192 (= e!874749 e!874750)))

(declare-fun res!1072520 () Bool)

(assert (=> b!1569192 (=> (not res!1072520) (not e!874750))))

(assert (=> b!1569192 (= res!1072520 (bvslt (_1!12716 (h!38225 l!750)) (_1!12716 (h!38225 (t!51681 l!750)))))))

(declare-fun b!1569193 () Bool)

(assert (=> b!1569193 (= e!874750 (isStrictlySorted!1005 (t!51681 l!750)))))

(assert (= (and d!163645 (not res!1072519)) b!1569192))

(assert (= (and b!1569192 res!1072520) b!1569193))

(declare-fun m!1442929 () Bool)

(assert (=> b!1569193 m!1442929))

(assert (=> b!1569152 d!163645))

(declare-fun d!163653 () Bool)

(declare-fun res!1072521 () Bool)

(declare-fun e!874751 () Bool)

(assert (=> d!163653 (=> res!1072521 e!874751)))

(assert (=> d!163653 (= res!1072521 (or ((_ is Nil!36778) (insertStrictlySorted!594 l!750 key2!21 v2!10)) ((_ is Nil!36778) (t!51681 (insertStrictlySorted!594 l!750 key2!21 v2!10)))))))

(assert (=> d!163653 (= (isStrictlySorted!1005 (insertStrictlySorted!594 l!750 key2!21 v2!10)) e!874751)))

(declare-fun b!1569194 () Bool)

(declare-fun e!874752 () Bool)

(assert (=> b!1569194 (= e!874751 e!874752)))

(declare-fun res!1072522 () Bool)

(assert (=> b!1569194 (=> (not res!1072522) (not e!874752))))

(assert (=> b!1569194 (= res!1072522 (bvslt (_1!12716 (h!38225 (insertStrictlySorted!594 l!750 key2!21 v2!10))) (_1!12716 (h!38225 (t!51681 (insertStrictlySorted!594 l!750 key2!21 v2!10))))))))

(declare-fun b!1569195 () Bool)

(assert (=> b!1569195 (= e!874752 (isStrictlySorted!1005 (t!51681 (insertStrictlySorted!594 l!750 key2!21 v2!10))))))

(assert (= (and d!163653 (not res!1072521)) b!1569194))

(assert (= (and b!1569194 res!1072522) b!1569195))

(declare-fun m!1442931 () Bool)

(assert (=> b!1569195 m!1442931))

(assert (=> b!1569154 d!163653))

(declare-fun b!1569274 () Bool)

(declare-fun res!1072546 () Bool)

(declare-fun e!874800 () Bool)

(assert (=> b!1569274 (=> (not res!1072546) (not e!874800))))

(declare-fun lt!673028 () List!36781)

(declare-fun containsKey!863 (List!36781 (_ BitVec 64)) Bool)

(assert (=> b!1569274 (= res!1072546 (containsKey!863 lt!673028 key2!21))))

(declare-fun b!1569275 () Bool)

(declare-fun e!874799 () List!36781)

(declare-fun call!72079 () List!36781)

(assert (=> b!1569275 (= e!874799 call!72079)))

(declare-fun c!144680 () Bool)

(declare-fun call!72080 () List!36781)

(declare-fun e!874796 () List!36781)

(declare-fun bm!72076 () Bool)

(declare-fun $colon$colon!999 (List!36781 tuple2!25410) List!36781)

(assert (=> bm!72076 (= call!72080 ($colon$colon!999 e!874796 (ite c!144680 (h!38225 l!750) (tuple2!25411 key2!21 v2!10))))))

(declare-fun c!144681 () Bool)

(assert (=> bm!72076 (= c!144681 c!144680)))

(declare-fun bm!72077 () Bool)

(declare-fun call!72081 () List!36781)

(assert (=> bm!72077 (= call!72079 call!72081)))

(declare-fun b!1569276 () Bool)

(assert (=> b!1569276 (= e!874796 (insertStrictlySorted!594 (t!51681 l!750) key2!21 v2!10))))

(declare-fun b!1569277 () Bool)

(declare-fun contains!10379 (List!36781 tuple2!25410) Bool)

(assert (=> b!1569277 (= e!874800 (contains!10379 lt!673028 (tuple2!25411 key2!21 v2!10)))))

(declare-fun d!163655 () Bool)

(assert (=> d!163655 e!874800))

(declare-fun res!1072545 () Bool)

(assert (=> d!163655 (=> (not res!1072545) (not e!874800))))

(assert (=> d!163655 (= res!1072545 (isStrictlySorted!1005 lt!673028))))

(declare-fun e!874798 () List!36781)

(assert (=> d!163655 (= lt!673028 e!874798)))

(assert (=> d!163655 (= c!144680 (and ((_ is Cons!36777) l!750) (bvslt (_1!12716 (h!38225 l!750)) key2!21)))))

(assert (=> d!163655 (isStrictlySorted!1005 l!750)))

(assert (=> d!163655 (= (insertStrictlySorted!594 l!750 key2!21 v2!10) lt!673028)))

(declare-fun bm!72078 () Bool)

(assert (=> bm!72078 (= call!72081 call!72080)))

(declare-fun b!1569278 () Bool)

(declare-fun c!144679 () Bool)

(declare-fun c!144678 () Bool)

(assert (=> b!1569278 (= e!874796 (ite c!144679 (t!51681 l!750) (ite c!144678 (Cons!36777 (h!38225 l!750) (t!51681 l!750)) Nil!36778)))))

(declare-fun b!1569279 () Bool)

(assert (=> b!1569279 (= c!144678 (and ((_ is Cons!36777) l!750) (bvsgt (_1!12716 (h!38225 l!750)) key2!21)))))

(declare-fun e!874797 () List!36781)

(assert (=> b!1569279 (= e!874797 e!874799)))

(declare-fun b!1569280 () Bool)

(assert (=> b!1569280 (= e!874797 call!72081)))

(declare-fun b!1569281 () Bool)

(assert (=> b!1569281 (= e!874799 call!72079)))

(declare-fun b!1569282 () Bool)

(assert (=> b!1569282 (= e!874798 call!72080)))

(declare-fun b!1569283 () Bool)

(assert (=> b!1569283 (= e!874798 e!874797)))

(assert (=> b!1569283 (= c!144679 (and ((_ is Cons!36777) l!750) (= (_1!12716 (h!38225 l!750)) key2!21)))))

(assert (= (and d!163655 c!144680) b!1569282))

(assert (= (and d!163655 (not c!144680)) b!1569283))

(assert (= (and b!1569283 c!144679) b!1569280))

(assert (= (and b!1569283 (not c!144679)) b!1569279))

(assert (= (and b!1569279 c!144678) b!1569281))

(assert (= (and b!1569279 (not c!144678)) b!1569275))

(assert (= (or b!1569281 b!1569275) bm!72077))

(assert (= (or b!1569280 bm!72077) bm!72078))

(assert (= (or b!1569282 bm!72078) bm!72076))

(assert (= (and bm!72076 c!144681) b!1569276))

(assert (= (and bm!72076 (not c!144681)) b!1569278))

(assert (= (and d!163655 res!1072545) b!1569274))

(assert (= (and b!1569274 res!1072546) b!1569277))

(declare-fun m!1442947 () Bool)

(assert (=> b!1569274 m!1442947))

(declare-fun m!1442949 () Bool)

(assert (=> bm!72076 m!1442949))

(declare-fun m!1442951 () Bool)

(assert (=> b!1569277 m!1442951))

(declare-fun m!1442953 () Bool)

(assert (=> b!1569276 m!1442953))

(declare-fun m!1442955 () Bool)

(assert (=> d!163655 m!1442955))

(assert (=> d!163655 m!1442911))

(assert (=> b!1569154 d!163655))

(declare-fun b!1569293 () Bool)

(declare-fun e!874806 () Bool)

(declare-fun tp!114142 () Bool)

(assert (=> b!1569293 (= e!874806 (and tp_is_empty!39067 tp!114142))))

(assert (=> b!1569155 (= tp!114130 e!874806)))

(assert (= (and b!1569155 ((_ is Cons!36777) (t!51681 l!750))) b!1569293))

(check-sat (not b!1569276) (not b!1569274) (not b!1569293) (not b!1569277) (not b!1569195) (not bm!72076) tp_is_empty!39067 (not b!1569193) (not d!163655))
(check-sat)
