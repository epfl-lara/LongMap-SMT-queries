; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134772 () Bool)

(assert start!134772)

(declare-fun b!1571420 () Bool)

(declare-fun res!1073300 () Bool)

(declare-fun e!876155 () Bool)

(assert (=> b!1571420 (=> (not res!1073300) (not e!876155))))

(declare-datatypes ((B!2492 0))(
  ( (B!2493 (val!19608 Int)) )
))
(declare-datatypes ((tuple2!25378 0))(
  ( (tuple2!25379 (_1!12700 (_ BitVec 64)) (_2!12700 B!2492)) )
))
(declare-datatypes ((List!36760 0))(
  ( (Nil!36757) (Cons!36756 (h!38221 tuple2!25378) (t!51660 List!36760)) )
))
(declare-fun l!750 () List!36760)

(declare-fun isStrictlySorted!989 (List!36760) Bool)

(assert (=> b!1571420 (= res!1073300 (isStrictlySorted!989 l!750))))

(declare-fun b!1571421 () Bool)

(declare-fun res!1073302 () Bool)

(assert (=> b!1571421 (=> (not res!1073302) (not e!876155))))

(assert (=> b!1571421 (= res!1073302 (isStrictlySorted!989 (t!51660 l!750)))))

(declare-fun b!1571422 () Bool)

(declare-fun e!876154 () Bool)

(declare-fun tp_is_empty!39043 () Bool)

(declare-fun tp!114075 () Bool)

(assert (=> b!1571422 (= e!876154 (and tp_is_empty!39043 tp!114075))))

(declare-fun v2!10 () B!2492)

(declare-fun b!1571423 () Bool)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun insertStrictlySorted!588 (List!36760 (_ BitVec 64) B!2492) List!36760)

(assert (=> b!1571423 (= e!876155 (not (isStrictlySorted!989 (insertStrictlySorted!588 l!750 key2!21 v2!10))))))

(declare-fun v1!32 () B!2492)

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1571423 (= (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!51999 0))(
  ( (Unit!52000) )
))
(declare-fun lt!674169 () Unit!51999)

(declare-fun lemmaInsertStrictlySortedCommutative!13 (List!36760 (_ BitVec 64) B!2492 (_ BitVec 64) B!2492) Unit!51999)

(assert (=> b!1571423 (= lt!674169 (lemmaInsertStrictlySortedCommutative!13 (t!51660 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1571424 () Bool)

(declare-fun res!1073301 () Bool)

(assert (=> b!1571424 (=> (not res!1073301) (not e!876155))))

(get-info :version)

(assert (=> b!1571424 (= res!1073301 (and ((_ is Cons!36756) l!750) (bvslt (_1!12700 (h!38221 l!750)) key1!37) (bvslt (_1!12700 (h!38221 l!750)) key2!21)))))

(declare-fun res!1073303 () Bool)

(assert (=> start!134772 (=> (not res!1073303) (not e!876155))))

(assert (=> start!134772 (= res!1073303 (not (= key1!37 key2!21)))))

(assert (=> start!134772 e!876155))

(assert (=> start!134772 tp_is_empty!39043))

(assert (=> start!134772 e!876154))

(assert (=> start!134772 true))

(assert (= (and start!134772 res!1073303) b!1571420))

(assert (= (and b!1571420 res!1073300) b!1571424))

(assert (= (and b!1571424 res!1073301) b!1571421))

(assert (= (and b!1571421 res!1073302) b!1571423))

(assert (= (and start!134772 ((_ is Cons!36756) l!750)) b!1571422))

(declare-fun m!1445769 () Bool)

(assert (=> b!1571420 m!1445769))

(declare-fun m!1445771 () Bool)

(assert (=> b!1571421 m!1445771))

(declare-fun m!1445773 () Bool)

(assert (=> b!1571423 m!1445773))

(declare-fun m!1445775 () Bool)

(assert (=> b!1571423 m!1445775))

(declare-fun m!1445777 () Bool)

(assert (=> b!1571423 m!1445777))

(assert (=> b!1571423 m!1445775))

(declare-fun m!1445779 () Bool)

(assert (=> b!1571423 m!1445779))

(declare-fun m!1445781 () Bool)

(assert (=> b!1571423 m!1445781))

(declare-fun m!1445783 () Bool)

(assert (=> b!1571423 m!1445783))

(assert (=> b!1571423 m!1445781))

(assert (=> b!1571423 m!1445773))

(declare-fun m!1445785 () Bool)

(assert (=> b!1571423 m!1445785))

(check-sat tp_is_empty!39043 (not b!1571422) (not b!1571421) (not b!1571423) (not b!1571420))
(check-sat)
(get-model)

(declare-fun d!164519 () Bool)

(assert (=> d!164519 (= (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!674178 () Unit!51999)

(declare-fun choose!2074 (List!36760 (_ BitVec 64) B!2492 (_ BitVec 64) B!2492) Unit!51999)

(assert (=> d!164519 (= lt!674178 (choose!2074 (t!51660 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!164519 (not (= key1!37 key2!21))))

(assert (=> d!164519 (= (lemmaInsertStrictlySortedCommutative!13 (t!51660 l!750) key1!37 v1!32 key2!21 v2!10) lt!674178)))

(declare-fun bs!45214 () Bool)

(assert (= bs!45214 d!164519))

(assert (=> bs!45214 m!1445773))

(assert (=> bs!45214 m!1445785))

(declare-fun m!1445823 () Bool)

(assert (=> bs!45214 m!1445823))

(assert (=> bs!45214 m!1445775))

(assert (=> bs!45214 m!1445777))

(assert (=> bs!45214 m!1445775))

(assert (=> bs!45214 m!1445773))

(assert (=> b!1571423 d!164519))

(declare-fun c!145435 () Bool)

(declare-fun e!876191 () List!36760)

(declare-fun c!145433 () Bool)

(declare-fun b!1571493 () Bool)

(assert (=> b!1571493 (= e!876191 (ite c!145433 (t!51660 l!750) (ite c!145435 (Cons!36756 (h!38221 l!750) (t!51660 l!750)) Nil!36757)))))

(declare-fun call!72167 () List!36760)

(declare-fun c!145434 () Bool)

(declare-fun bm!72160 () Bool)

(declare-fun $colon$colon!988 (List!36760 tuple2!25378) List!36760)

(assert (=> bm!72160 (= call!72167 ($colon$colon!988 e!876191 (ite c!145434 (h!38221 l!750) (tuple2!25379 key2!21 v2!10))))))

(declare-fun c!145436 () Bool)

(assert (=> bm!72160 (= c!145436 c!145434)))

(declare-fun b!1571494 () Bool)

(declare-fun e!876194 () List!36760)

(declare-fun e!876193 () List!36760)

(assert (=> b!1571494 (= e!876194 e!876193)))

(assert (=> b!1571494 (= c!145433 (and ((_ is Cons!36756) l!750) (= (_1!12700 (h!38221 l!750)) key2!21)))))

(declare-fun lt!674189 () List!36760)

(declare-fun e!876190 () Bool)

(declare-fun b!1571495 () Bool)

(declare-fun contains!10463 (List!36760 tuple2!25378) Bool)

(assert (=> b!1571495 (= e!876190 (contains!10463 lt!674189 (tuple2!25379 key2!21 v2!10)))))

(declare-fun b!1571496 () Bool)

(assert (=> b!1571496 (= c!145435 (and ((_ is Cons!36756) l!750) (bvsgt (_1!12700 (h!38221 l!750)) key2!21)))))

(declare-fun e!876192 () List!36760)

(assert (=> b!1571496 (= e!876193 e!876192)))

(declare-fun d!164523 () Bool)

(assert (=> d!164523 e!876190))

(declare-fun res!1073339 () Bool)

(assert (=> d!164523 (=> (not res!1073339) (not e!876190))))

(assert (=> d!164523 (= res!1073339 (isStrictlySorted!989 lt!674189))))

(assert (=> d!164523 (= lt!674189 e!876194)))

(assert (=> d!164523 (= c!145434 (and ((_ is Cons!36756) l!750) (bvslt (_1!12700 (h!38221 l!750)) key2!21)))))

(assert (=> d!164523 (isStrictlySorted!989 l!750)))

(assert (=> d!164523 (= (insertStrictlySorted!588 l!750 key2!21 v2!10) lt!674189)))

(declare-fun b!1571497 () Bool)

(declare-fun res!1073338 () Bool)

(assert (=> b!1571497 (=> (not res!1073338) (not e!876190))))

(declare-fun containsKey!860 (List!36760 (_ BitVec 64)) Bool)

(assert (=> b!1571497 (= res!1073338 (containsKey!860 lt!674189 key2!21))))

(declare-fun b!1571498 () Bool)

(declare-fun call!72166 () List!36760)

(assert (=> b!1571498 (= e!876192 call!72166)))

(declare-fun b!1571499 () Bool)

(assert (=> b!1571499 (= e!876194 call!72167)))

(declare-fun b!1571500 () Bool)

(assert (=> b!1571500 (= e!876192 call!72166)))

(declare-fun b!1571501 () Bool)

(assert (=> b!1571501 (= e!876191 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10))))

(declare-fun bm!72161 () Bool)

(declare-fun call!72165 () List!36760)

(assert (=> bm!72161 (= call!72166 call!72165)))

(declare-fun bm!72162 () Bool)

(assert (=> bm!72162 (= call!72165 call!72167)))

(declare-fun b!1571502 () Bool)

(assert (=> b!1571502 (= e!876193 call!72165)))

(assert (= (and d!164523 c!145434) b!1571499))

(assert (= (and d!164523 (not c!145434)) b!1571494))

(assert (= (and b!1571494 c!145433) b!1571502))

(assert (= (and b!1571494 (not c!145433)) b!1571496))

(assert (= (and b!1571496 c!145435) b!1571500))

(assert (= (and b!1571496 (not c!145435)) b!1571498))

(assert (= (or b!1571500 b!1571498) bm!72161))

(assert (= (or b!1571502 bm!72161) bm!72162))

(assert (= (or b!1571499 bm!72162) bm!72160))

(assert (= (and bm!72160 c!145436) b!1571501))

(assert (= (and bm!72160 (not c!145436)) b!1571493))

(assert (= (and d!164523 res!1073339) b!1571497))

(assert (= (and b!1571497 res!1073338) b!1571495))

(assert (=> b!1571501 m!1445773))

(declare-fun m!1445829 () Bool)

(assert (=> b!1571497 m!1445829))

(declare-fun m!1445831 () Bool)

(assert (=> d!164523 m!1445831))

(assert (=> d!164523 m!1445769))

(declare-fun m!1445833 () Bool)

(assert (=> b!1571495 m!1445833))

(declare-fun m!1445835 () Bool)

(assert (=> bm!72160 m!1445835))

(assert (=> b!1571423 d!164523))

(declare-fun c!145441 () Bool)

(declare-fun b!1571511 () Bool)

(declare-fun c!145439 () Bool)

(declare-fun e!876200 () List!36760)

(assert (=> b!1571511 (= e!876200 (ite c!145439 (t!51660 (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32)) (ite c!145441 (Cons!36756 (h!38221 (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32)) (t!51660 (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32))) Nil!36757)))))

(declare-fun call!72170 () List!36760)

(declare-fun bm!72165 () Bool)

(declare-fun c!145440 () Bool)

(assert (=> bm!72165 (= call!72170 ($colon$colon!988 e!876200 (ite c!145440 (h!38221 (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32)) (tuple2!25379 key2!21 v2!10))))))

(declare-fun c!145442 () Bool)

(assert (=> bm!72165 (= c!145442 c!145440)))

(declare-fun b!1571512 () Bool)

(declare-fun e!876203 () List!36760)

(declare-fun e!876202 () List!36760)

(assert (=> b!1571512 (= e!876203 e!876202)))

(assert (=> b!1571512 (= c!145439 (and ((_ is Cons!36756) (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32)) (= (_1!12700 (h!38221 (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun b!1571513 () Bool)

(declare-fun e!876199 () Bool)

(declare-fun lt!674190 () List!36760)

(assert (=> b!1571513 (= e!876199 (contains!10463 lt!674190 (tuple2!25379 key2!21 v2!10)))))

(declare-fun b!1571514 () Bool)

(assert (=> b!1571514 (= c!145441 (and ((_ is Cons!36756) (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32)) (bvsgt (_1!12700 (h!38221 (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun e!876201 () List!36760)

(assert (=> b!1571514 (= e!876202 e!876201)))

(declare-fun d!164533 () Bool)

(assert (=> d!164533 e!876199))

(declare-fun res!1073345 () Bool)

(assert (=> d!164533 (=> (not res!1073345) (not e!876199))))

(assert (=> d!164533 (= res!1073345 (isStrictlySorted!989 lt!674190))))

(assert (=> d!164533 (= lt!674190 e!876203)))

(assert (=> d!164533 (= c!145440 (and ((_ is Cons!36756) (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32)) (bvslt (_1!12700 (h!38221 (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!164533 (isStrictlySorted!989 (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32))))

(assert (=> d!164533 (= (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32) key2!21 v2!10) lt!674190)))

(declare-fun b!1571515 () Bool)

(declare-fun res!1073344 () Bool)

(assert (=> b!1571515 (=> (not res!1073344) (not e!876199))))

(assert (=> b!1571515 (= res!1073344 (containsKey!860 lt!674190 key2!21))))

(declare-fun b!1571516 () Bool)

(declare-fun call!72169 () List!36760)

(assert (=> b!1571516 (= e!876201 call!72169)))

(declare-fun b!1571517 () Bool)

(assert (=> b!1571517 (= e!876203 call!72170)))

(declare-fun b!1571518 () Bool)

(assert (=> b!1571518 (= e!876201 call!72169)))

(declare-fun b!1571519 () Bool)

(assert (=> b!1571519 (= e!876200 (insertStrictlySorted!588 (t!51660 (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun bm!72166 () Bool)

(declare-fun call!72168 () List!36760)

(assert (=> bm!72166 (= call!72169 call!72168)))

(declare-fun bm!72167 () Bool)

(assert (=> bm!72167 (= call!72168 call!72170)))

(declare-fun b!1571520 () Bool)

(assert (=> b!1571520 (= e!876202 call!72168)))

(assert (= (and d!164533 c!145440) b!1571517))

(assert (= (and d!164533 (not c!145440)) b!1571512))

(assert (= (and b!1571512 c!145439) b!1571520))

(assert (= (and b!1571512 (not c!145439)) b!1571514))

(assert (= (and b!1571514 c!145441) b!1571518))

(assert (= (and b!1571514 (not c!145441)) b!1571516))

(assert (= (or b!1571518 b!1571516) bm!72166))

(assert (= (or b!1571520 bm!72166) bm!72167))

(assert (= (or b!1571517 bm!72167) bm!72165))

(assert (= (and bm!72165 c!145442) b!1571519))

(assert (= (and bm!72165 (not c!145442)) b!1571511))

(assert (= (and d!164533 res!1073345) b!1571515))

(assert (= (and b!1571515 res!1073344) b!1571513))

(declare-fun m!1445837 () Bool)

(assert (=> b!1571519 m!1445837))

(declare-fun m!1445839 () Bool)

(assert (=> b!1571515 m!1445839))

(declare-fun m!1445841 () Bool)

(assert (=> d!164533 m!1445841))

(assert (=> d!164533 m!1445775))

(declare-fun m!1445843 () Bool)

(assert (=> d!164533 m!1445843))

(declare-fun m!1445845 () Bool)

(assert (=> b!1571513 m!1445845))

(declare-fun m!1445847 () Bool)

(assert (=> bm!72165 m!1445847))

(assert (=> b!1571423 d!164533))

(declare-fun e!876205 () List!36760)

(declare-fun c!145443 () Bool)

(declare-fun b!1571521 () Bool)

(declare-fun c!145445 () Bool)

(assert (=> b!1571521 (= e!876205 (ite c!145443 (t!51660 (t!51660 l!750)) (ite c!145445 (Cons!36756 (h!38221 (t!51660 l!750)) (t!51660 (t!51660 l!750))) Nil!36757)))))

(declare-fun call!72173 () List!36760)

(declare-fun c!145444 () Bool)

(declare-fun bm!72168 () Bool)

(assert (=> bm!72168 (= call!72173 ($colon$colon!988 e!876205 (ite c!145444 (h!38221 (t!51660 l!750)) (tuple2!25379 key2!21 v2!10))))))

(declare-fun c!145446 () Bool)

(assert (=> bm!72168 (= c!145446 c!145444)))

(declare-fun b!1571522 () Bool)

(declare-fun e!876208 () List!36760)

(declare-fun e!876207 () List!36760)

(assert (=> b!1571522 (= e!876208 e!876207)))

(assert (=> b!1571522 (= c!145443 (and ((_ is Cons!36756) (t!51660 l!750)) (= (_1!12700 (h!38221 (t!51660 l!750))) key2!21)))))

(declare-fun lt!674191 () List!36760)

(declare-fun b!1571523 () Bool)

(declare-fun e!876204 () Bool)

(assert (=> b!1571523 (= e!876204 (contains!10463 lt!674191 (tuple2!25379 key2!21 v2!10)))))

(declare-fun b!1571524 () Bool)

(assert (=> b!1571524 (= c!145445 (and ((_ is Cons!36756) (t!51660 l!750)) (bvsgt (_1!12700 (h!38221 (t!51660 l!750))) key2!21)))))

(declare-fun e!876206 () List!36760)

(assert (=> b!1571524 (= e!876207 e!876206)))

(declare-fun d!164535 () Bool)

(assert (=> d!164535 e!876204))

(declare-fun res!1073347 () Bool)

(assert (=> d!164535 (=> (not res!1073347) (not e!876204))))

(assert (=> d!164535 (= res!1073347 (isStrictlySorted!989 lt!674191))))

(assert (=> d!164535 (= lt!674191 e!876208)))

(assert (=> d!164535 (= c!145444 (and ((_ is Cons!36756) (t!51660 l!750)) (bvslt (_1!12700 (h!38221 (t!51660 l!750))) key2!21)))))

(assert (=> d!164535 (isStrictlySorted!989 (t!51660 l!750))))

(assert (=> d!164535 (= (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10) lt!674191)))

(declare-fun b!1571525 () Bool)

(declare-fun res!1073346 () Bool)

(assert (=> b!1571525 (=> (not res!1073346) (not e!876204))))

(assert (=> b!1571525 (= res!1073346 (containsKey!860 lt!674191 key2!21))))

(declare-fun b!1571526 () Bool)

(declare-fun call!72172 () List!36760)

(assert (=> b!1571526 (= e!876206 call!72172)))

(declare-fun b!1571527 () Bool)

(assert (=> b!1571527 (= e!876208 call!72173)))

(declare-fun b!1571528 () Bool)

(assert (=> b!1571528 (= e!876206 call!72172)))

(declare-fun b!1571529 () Bool)

(assert (=> b!1571529 (= e!876205 (insertStrictlySorted!588 (t!51660 (t!51660 l!750)) key2!21 v2!10))))

(declare-fun bm!72169 () Bool)

(declare-fun call!72171 () List!36760)

(assert (=> bm!72169 (= call!72172 call!72171)))

(declare-fun bm!72170 () Bool)

(assert (=> bm!72170 (= call!72171 call!72173)))

(declare-fun b!1571530 () Bool)

(assert (=> b!1571530 (= e!876207 call!72171)))

(assert (= (and d!164535 c!145444) b!1571527))

(assert (= (and d!164535 (not c!145444)) b!1571522))

(assert (= (and b!1571522 c!145443) b!1571530))

(assert (= (and b!1571522 (not c!145443)) b!1571524))

(assert (= (and b!1571524 c!145445) b!1571528))

(assert (= (and b!1571524 (not c!145445)) b!1571526))

(assert (= (or b!1571528 b!1571526) bm!72169))

(assert (= (or b!1571530 bm!72169) bm!72170))

(assert (= (or b!1571527 bm!72170) bm!72168))

(assert (= (and bm!72168 c!145446) b!1571529))

(assert (= (and bm!72168 (not c!145446)) b!1571521))

(assert (= (and d!164535 res!1073347) b!1571525))

(assert (= (and b!1571525 res!1073346) b!1571523))

(declare-fun m!1445849 () Bool)

(assert (=> b!1571529 m!1445849))

(declare-fun m!1445851 () Bool)

(assert (=> b!1571525 m!1445851))

(declare-fun m!1445853 () Bool)

(assert (=> d!164535 m!1445853))

(assert (=> d!164535 m!1445771))

(declare-fun m!1445855 () Bool)

(assert (=> b!1571523 m!1445855))

(declare-fun m!1445857 () Bool)

(assert (=> bm!72168 m!1445857))

(assert (=> b!1571423 d!164535))

(declare-fun d!164537 () Bool)

(declare-fun res!1073356 () Bool)

(declare-fun e!876226 () Bool)

(assert (=> d!164537 (=> res!1073356 e!876226)))

(assert (=> d!164537 (= res!1073356 (or ((_ is Nil!36757) (insertStrictlySorted!588 l!750 key2!21 v2!10)) ((_ is Nil!36757) (t!51660 (insertStrictlySorted!588 l!750 key2!21 v2!10)))))))

(assert (=> d!164537 (= (isStrictlySorted!989 (insertStrictlySorted!588 l!750 key2!21 v2!10)) e!876226)))

(declare-fun b!1571563 () Bool)

(declare-fun e!876228 () Bool)

(assert (=> b!1571563 (= e!876226 e!876228)))

(declare-fun res!1073357 () Bool)

(assert (=> b!1571563 (=> (not res!1073357) (not e!876228))))

(assert (=> b!1571563 (= res!1073357 (bvslt (_1!12700 (h!38221 (insertStrictlySorted!588 l!750 key2!21 v2!10))) (_1!12700 (h!38221 (t!51660 (insertStrictlySorted!588 l!750 key2!21 v2!10))))))))

(declare-fun b!1571564 () Bool)

(assert (=> b!1571564 (= e!876228 (isStrictlySorted!989 (t!51660 (insertStrictlySorted!588 l!750 key2!21 v2!10))))))

(assert (= (and d!164537 (not res!1073356)) b!1571563))

(assert (= (and b!1571563 res!1073357) b!1571564))

(declare-fun m!1445873 () Bool)

(assert (=> b!1571564 m!1445873))

(assert (=> b!1571423 d!164537))

(declare-fun b!1571569 () Bool)

(declare-fun e!876232 () List!36760)

(declare-fun c!145461 () Bool)

(declare-fun c!145463 () Bool)

(assert (=> b!1571569 (= e!876232 (ite c!145461 (t!51660 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10)) (ite c!145463 (Cons!36756 (h!38221 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10)) (t!51660 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10))) Nil!36757)))))

(declare-fun bm!72179 () Bool)

(declare-fun call!72184 () List!36760)

(declare-fun c!145462 () Bool)

(assert (=> bm!72179 (= call!72184 ($colon$colon!988 e!876232 (ite c!145462 (h!38221 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10)) (tuple2!25379 key1!37 v1!32))))))

(declare-fun c!145464 () Bool)

(assert (=> bm!72179 (= c!145464 c!145462)))

(declare-fun b!1571570 () Bool)

(declare-fun e!876235 () List!36760)

(declare-fun e!876234 () List!36760)

(assert (=> b!1571570 (= e!876235 e!876234)))

(assert (=> b!1571570 (= c!145461 (and ((_ is Cons!36756) (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10)) (= (_1!12700 (h!38221 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun lt!674196 () List!36760)

(declare-fun b!1571571 () Bool)

(declare-fun e!876231 () Bool)

(assert (=> b!1571571 (= e!876231 (contains!10463 lt!674196 (tuple2!25379 key1!37 v1!32)))))

(declare-fun b!1571572 () Bool)

(assert (=> b!1571572 (= c!145463 (and ((_ is Cons!36756) (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10)) (bvsgt (_1!12700 (h!38221 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun e!876233 () List!36760)

(assert (=> b!1571572 (= e!876234 e!876233)))

(declare-fun d!164541 () Bool)

(assert (=> d!164541 e!876231))

(declare-fun res!1073359 () Bool)

(assert (=> d!164541 (=> (not res!1073359) (not e!876231))))

(assert (=> d!164541 (= res!1073359 (isStrictlySorted!989 lt!674196))))

(assert (=> d!164541 (= lt!674196 e!876235)))

(assert (=> d!164541 (= c!145462 (and ((_ is Cons!36756) (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10)) (bvslt (_1!12700 (h!38221 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!164541 (isStrictlySorted!989 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10))))

(assert (=> d!164541 (= (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10) key1!37 v1!32) lt!674196)))

(declare-fun b!1571573 () Bool)

(declare-fun res!1073358 () Bool)

(assert (=> b!1571573 (=> (not res!1073358) (not e!876231))))

(assert (=> b!1571573 (= res!1073358 (containsKey!860 lt!674196 key1!37))))

(declare-fun b!1571574 () Bool)

(declare-fun call!72183 () List!36760)

(assert (=> b!1571574 (= e!876233 call!72183)))

(declare-fun b!1571575 () Bool)

(assert (=> b!1571575 (= e!876235 call!72184)))

(declare-fun b!1571576 () Bool)

(assert (=> b!1571576 (= e!876233 call!72183)))

(declare-fun b!1571577 () Bool)

(assert (=> b!1571577 (= e!876232 (insertStrictlySorted!588 (t!51660 (insertStrictlySorted!588 (t!51660 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun bm!72180 () Bool)

(declare-fun call!72182 () List!36760)

(assert (=> bm!72180 (= call!72183 call!72182)))

(declare-fun bm!72181 () Bool)

(assert (=> bm!72181 (= call!72182 call!72184)))

(declare-fun b!1571578 () Bool)

(assert (=> b!1571578 (= e!876234 call!72182)))

(assert (= (and d!164541 c!145462) b!1571575))

(assert (= (and d!164541 (not c!145462)) b!1571570))

(assert (= (and b!1571570 c!145461) b!1571578))

(assert (= (and b!1571570 (not c!145461)) b!1571572))

(assert (= (and b!1571572 c!145463) b!1571576))

(assert (= (and b!1571572 (not c!145463)) b!1571574))

(assert (= (or b!1571576 b!1571574) bm!72180))

(assert (= (or b!1571578 bm!72180) bm!72181))

(assert (= (or b!1571575 bm!72181) bm!72179))

(assert (= (and bm!72179 c!145464) b!1571577))

(assert (= (and bm!72179 (not c!145464)) b!1571569))

(assert (= (and d!164541 res!1073359) b!1571573))

(assert (= (and b!1571573 res!1073358) b!1571571))

(declare-fun m!1445885 () Bool)

(assert (=> b!1571577 m!1445885))

(declare-fun m!1445889 () Bool)

(assert (=> b!1571573 m!1445889))

(declare-fun m!1445893 () Bool)

(assert (=> d!164541 m!1445893))

(assert (=> d!164541 m!1445773))

(declare-fun m!1445895 () Bool)

(assert (=> d!164541 m!1445895))

(declare-fun m!1445899 () Bool)

(assert (=> b!1571571 m!1445899))

(declare-fun m!1445901 () Bool)

(assert (=> bm!72179 m!1445901))

(assert (=> b!1571423 d!164541))

(declare-fun e!876242 () List!36760)

(declare-fun b!1571589 () Bool)

(declare-fun c!145469 () Bool)

(declare-fun c!145471 () Bool)

(assert (=> b!1571589 (= e!876242 (ite c!145469 (t!51660 (t!51660 l!750)) (ite c!145471 (Cons!36756 (h!38221 (t!51660 l!750)) (t!51660 (t!51660 l!750))) Nil!36757)))))

(declare-fun c!145470 () Bool)

(declare-fun call!72192 () List!36760)

(declare-fun bm!72187 () Bool)

(assert (=> bm!72187 (= call!72192 ($colon$colon!988 e!876242 (ite c!145470 (h!38221 (t!51660 l!750)) (tuple2!25379 key1!37 v1!32))))))

(declare-fun c!145472 () Bool)

(assert (=> bm!72187 (= c!145472 c!145470)))

(declare-fun b!1571590 () Bool)

(declare-fun e!876245 () List!36760)

(declare-fun e!876244 () List!36760)

(assert (=> b!1571590 (= e!876245 e!876244)))

(assert (=> b!1571590 (= c!145469 (and ((_ is Cons!36756) (t!51660 l!750)) (= (_1!12700 (h!38221 (t!51660 l!750))) key1!37)))))

(declare-fun b!1571591 () Bool)

(declare-fun e!876241 () Bool)

(declare-fun lt!674198 () List!36760)

(assert (=> b!1571591 (= e!876241 (contains!10463 lt!674198 (tuple2!25379 key1!37 v1!32)))))

(declare-fun b!1571592 () Bool)

(assert (=> b!1571592 (= c!145471 (and ((_ is Cons!36756) (t!51660 l!750)) (bvsgt (_1!12700 (h!38221 (t!51660 l!750))) key1!37)))))

(declare-fun e!876243 () List!36760)

(assert (=> b!1571592 (= e!876244 e!876243)))

(declare-fun d!164547 () Bool)

(assert (=> d!164547 e!876241))

(declare-fun res!1073363 () Bool)

(assert (=> d!164547 (=> (not res!1073363) (not e!876241))))

(assert (=> d!164547 (= res!1073363 (isStrictlySorted!989 lt!674198))))

(assert (=> d!164547 (= lt!674198 e!876245)))

(assert (=> d!164547 (= c!145470 (and ((_ is Cons!36756) (t!51660 l!750)) (bvslt (_1!12700 (h!38221 (t!51660 l!750))) key1!37)))))

(assert (=> d!164547 (isStrictlySorted!989 (t!51660 l!750))))

(assert (=> d!164547 (= (insertStrictlySorted!588 (t!51660 l!750) key1!37 v1!32) lt!674198)))

(declare-fun b!1571593 () Bool)

(declare-fun res!1073362 () Bool)

(assert (=> b!1571593 (=> (not res!1073362) (not e!876241))))

(assert (=> b!1571593 (= res!1073362 (containsKey!860 lt!674198 key1!37))))

(declare-fun b!1571594 () Bool)

(declare-fun call!72191 () List!36760)

(assert (=> b!1571594 (= e!876243 call!72191)))

(declare-fun b!1571595 () Bool)

(assert (=> b!1571595 (= e!876245 call!72192)))

(declare-fun b!1571596 () Bool)

(assert (=> b!1571596 (= e!876243 call!72191)))

(declare-fun b!1571597 () Bool)

(assert (=> b!1571597 (= e!876242 (insertStrictlySorted!588 (t!51660 (t!51660 l!750)) key1!37 v1!32))))

(declare-fun bm!72188 () Bool)

(declare-fun call!72190 () List!36760)

(assert (=> bm!72188 (= call!72191 call!72190)))

(declare-fun bm!72189 () Bool)

(assert (=> bm!72189 (= call!72190 call!72192)))

(declare-fun b!1571598 () Bool)

(assert (=> b!1571598 (= e!876244 call!72190)))

(assert (= (and d!164547 c!145470) b!1571595))

(assert (= (and d!164547 (not c!145470)) b!1571590))

(assert (= (and b!1571590 c!145469) b!1571598))

(assert (= (and b!1571590 (not c!145469)) b!1571592))

(assert (= (and b!1571592 c!145471) b!1571596))

(assert (= (and b!1571592 (not c!145471)) b!1571594))

(assert (= (or b!1571596 b!1571594) bm!72188))

(assert (= (or b!1571598 bm!72188) bm!72189))

(assert (= (or b!1571595 bm!72189) bm!72187))

(assert (= (and bm!72187 c!145472) b!1571597))

(assert (= (and bm!72187 (not c!145472)) b!1571589))

(assert (= (and d!164547 res!1073363) b!1571593))

(assert (= (and b!1571593 res!1073362) b!1571591))

(declare-fun m!1445903 () Bool)

(assert (=> b!1571597 m!1445903))

(declare-fun m!1445905 () Bool)

(assert (=> b!1571593 m!1445905))

(declare-fun m!1445907 () Bool)

(assert (=> d!164547 m!1445907))

(assert (=> d!164547 m!1445771))

(declare-fun m!1445909 () Bool)

(assert (=> b!1571591 m!1445909))

(declare-fun m!1445911 () Bool)

(assert (=> bm!72187 m!1445911))

(assert (=> b!1571423 d!164547))

(declare-fun d!164549 () Bool)

(declare-fun res!1073366 () Bool)

(declare-fun e!876250 () Bool)

(assert (=> d!164549 (=> res!1073366 e!876250)))

(assert (=> d!164549 (= res!1073366 (or ((_ is Nil!36757) (t!51660 l!750)) ((_ is Nil!36757) (t!51660 (t!51660 l!750)))))))

(assert (=> d!164549 (= (isStrictlySorted!989 (t!51660 l!750)) e!876250)))

(declare-fun b!1571605 () Bool)

(declare-fun e!876251 () Bool)

(assert (=> b!1571605 (= e!876250 e!876251)))

(declare-fun res!1073369 () Bool)

(assert (=> b!1571605 (=> (not res!1073369) (not e!876251))))

(assert (=> b!1571605 (= res!1073369 (bvslt (_1!12700 (h!38221 (t!51660 l!750))) (_1!12700 (h!38221 (t!51660 (t!51660 l!750))))))))

(declare-fun b!1571606 () Bool)

(assert (=> b!1571606 (= e!876251 (isStrictlySorted!989 (t!51660 (t!51660 l!750))))))

(assert (= (and d!164549 (not res!1073366)) b!1571605))

(assert (= (and b!1571605 res!1073369) b!1571606))

(declare-fun m!1445913 () Bool)

(assert (=> b!1571606 m!1445913))

(assert (=> b!1571421 d!164549))

(declare-fun d!164551 () Bool)

(declare-fun res!1073372 () Bool)

(declare-fun e!876254 () Bool)

(assert (=> d!164551 (=> res!1073372 e!876254)))

(assert (=> d!164551 (= res!1073372 (or ((_ is Nil!36757) l!750) ((_ is Nil!36757) (t!51660 l!750))))))

(assert (=> d!164551 (= (isStrictlySorted!989 l!750) e!876254)))

(declare-fun b!1571611 () Bool)

(declare-fun e!876256 () Bool)

(assert (=> b!1571611 (= e!876254 e!876256)))

(declare-fun res!1073373 () Bool)

(assert (=> b!1571611 (=> (not res!1073373) (not e!876256))))

(assert (=> b!1571611 (= res!1073373 (bvslt (_1!12700 (h!38221 l!750)) (_1!12700 (h!38221 (t!51660 l!750)))))))

(declare-fun b!1571612 () Bool)

(assert (=> b!1571612 (= e!876256 (isStrictlySorted!989 (t!51660 l!750)))))

(assert (= (and d!164551 (not res!1073372)) b!1571611))

(assert (= (and b!1571611 res!1073373) b!1571612))

(assert (=> b!1571612 m!1445771))

(assert (=> b!1571420 d!164551))

(declare-fun b!1571619 () Bool)

(declare-fun e!876260 () Bool)

(declare-fun tp!114084 () Bool)

(assert (=> b!1571619 (= e!876260 (and tp_is_empty!39043 tp!114084))))

(assert (=> b!1571422 (= tp!114075 e!876260)))

(assert (= (and b!1571422 ((_ is Cons!36756) (t!51660 l!750))) b!1571619))

(check-sat tp_is_empty!39043 (not b!1571501) (not b!1571573) (not bm!72187) (not b!1571525) (not d!164541) (not bm!72165) (not b!1571497) (not b!1571606) (not b!1571612) (not b!1571564) (not bm!72168) (not d!164523) (not d!164533) (not d!164535) (not b!1571619) (not bm!72179) (not b!1571597) (not d!164519) (not b!1571513) (not b!1571593) (not bm!72160) (not b!1571529) (not b!1571577) (not b!1571523) (not b!1571591) (not b!1571519) (not b!1571515) (not b!1571495) (not d!164547) (not b!1571571))
(check-sat)
