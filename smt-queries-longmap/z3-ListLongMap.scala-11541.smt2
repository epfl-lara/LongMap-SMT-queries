; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134332 () Bool)

(assert start!134332)

(declare-fun b!1568654 () Bool)

(declare-fun res!1072311 () Bool)

(declare-fun e!874471 () Bool)

(assert (=> b!1568654 (=> (not res!1072311) (not e!874471))))

(declare-datatypes ((B!2482 0))(
  ( (B!2483 (val!19603 Int)) )
))
(declare-datatypes ((tuple2!25308 0))(
  ( (tuple2!25309 (_1!12665 (_ BitVec 64)) (_2!12665 B!2482)) )
))
(declare-datatypes ((List!36723 0))(
  ( (Nil!36720) (Cons!36719 (h!38166 tuple2!25308) (t!51631 List!36723)) )
))
(declare-fun l!750 () List!36723)

(declare-fun isStrictlySorted!996 (List!36723) Bool)

(assert (=> b!1568654 (= res!1072311 (isStrictlySorted!996 (t!51631 l!750)))))

(declare-fun b!1568655 () Bool)

(declare-fun res!1072308 () Bool)

(assert (=> b!1568655 (=> (not res!1072308) (not e!874471))))

(assert (=> b!1568655 (= res!1072308 (isStrictlySorted!996 l!750))))

(declare-fun b!1568656 () Bool)

(declare-fun e!874472 () Bool)

(declare-fun tp_is_empty!39033 () Bool)

(declare-fun tp!114051 () Bool)

(assert (=> b!1568656 (= e!874472 (and tp_is_empty!39033 tp!114051))))

(declare-fun res!1072309 () Bool)

(assert (=> start!134332 (=> (not res!1072309) (not e!874471))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134332 (= res!1072309 (not (= key1!37 key2!21)))))

(assert (=> start!134332 e!874471))

(assert (=> start!134332 tp_is_empty!39033))

(assert (=> start!134332 e!874472))

(assert (=> start!134332 true))

(declare-fun v1!32 () B!2482)

(declare-fun b!1568657 () Bool)

(declare-fun insertStrictlySorted!582 (List!36723 (_ BitVec 64) B!2482) List!36723)

(assert (=> b!1568657 (= e!874471 (not (isStrictlySorted!996 (insertStrictlySorted!582 l!750 key1!37 v1!32))))))

(declare-fun v2!10 () B!2482)

(assert (=> b!1568657 (= (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52080 0))(
  ( (Unit!52081) )
))
(declare-fun lt!673216 () Unit!52080)

(declare-fun lemmaInsertStrictlySortedCommutative!8 (List!36723 (_ BitVec 64) B!2482 (_ BitVec 64) B!2482) Unit!52080)

(assert (=> b!1568657 (= lt!673216 (lemmaInsertStrictlySortedCommutative!8 (t!51631 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1568658 () Bool)

(declare-fun res!1072310 () Bool)

(assert (=> b!1568658 (=> (not res!1072310) (not e!874471))))

(get-info :version)

(assert (=> b!1568658 (= res!1072310 (and ((_ is Cons!36719) l!750) (bvslt (_1!12665 (h!38166 l!750)) key1!37) (bvslt (_1!12665 (h!38166 l!750)) key2!21)))))

(assert (= (and start!134332 res!1072309) b!1568655))

(assert (= (and b!1568655 res!1072308) b!1568658))

(assert (= (and b!1568658 res!1072310) b!1568654))

(assert (= (and b!1568654 res!1072311) b!1568657))

(assert (= (and start!134332 ((_ is Cons!36719) l!750)) b!1568656))

(declare-fun m!1443259 () Bool)

(assert (=> b!1568654 m!1443259))

(declare-fun m!1443261 () Bool)

(assert (=> b!1568655 m!1443261))

(declare-fun m!1443263 () Bool)

(assert (=> b!1568657 m!1443263))

(assert (=> b!1568657 m!1443263))

(declare-fun m!1443265 () Bool)

(assert (=> b!1568657 m!1443265))

(declare-fun m!1443267 () Bool)

(assert (=> b!1568657 m!1443267))

(declare-fun m!1443269 () Bool)

(assert (=> b!1568657 m!1443269))

(assert (=> b!1568657 m!1443267))

(declare-fun m!1443271 () Bool)

(assert (=> b!1568657 m!1443271))

(declare-fun m!1443273 () Bool)

(assert (=> b!1568657 m!1443273))

(assert (=> b!1568657 m!1443273))

(declare-fun m!1443275 () Bool)

(assert (=> b!1568657 m!1443275))

(check-sat (not b!1568654) (not b!1568655) tp_is_empty!39033 (not b!1568657) (not b!1568656))
(check-sat)
(get-model)

(declare-fun d!163759 () Bool)

(declare-fun res!1072328 () Bool)

(declare-fun e!874483 () Bool)

(assert (=> d!163759 (=> res!1072328 e!874483)))

(assert (=> d!163759 (= res!1072328 (or ((_ is Nil!36720) (t!51631 l!750)) ((_ is Nil!36720) (t!51631 (t!51631 l!750)))))))

(assert (=> d!163759 (= (isStrictlySorted!996 (t!51631 l!750)) e!874483)))

(declare-fun b!1568678 () Bool)

(declare-fun e!874484 () Bool)

(assert (=> b!1568678 (= e!874483 e!874484)))

(declare-fun res!1072329 () Bool)

(assert (=> b!1568678 (=> (not res!1072329) (not e!874484))))

(assert (=> b!1568678 (= res!1072329 (bvslt (_1!12665 (h!38166 (t!51631 l!750))) (_1!12665 (h!38166 (t!51631 (t!51631 l!750))))))))

(declare-fun b!1568679 () Bool)

(assert (=> b!1568679 (= e!874484 (isStrictlySorted!996 (t!51631 (t!51631 l!750))))))

(assert (= (and d!163759 (not res!1072328)) b!1568678))

(assert (= (and b!1568678 res!1072329) b!1568679))

(declare-fun m!1443295 () Bool)

(assert (=> b!1568679 m!1443295))

(assert (=> b!1568654 d!163759))

(declare-fun d!163761 () Bool)

(declare-fun res!1072330 () Bool)

(declare-fun e!874485 () Bool)

(assert (=> d!163761 (=> res!1072330 e!874485)))

(assert (=> d!163761 (= res!1072330 (or ((_ is Nil!36720) l!750) ((_ is Nil!36720) (t!51631 l!750))))))

(assert (=> d!163761 (= (isStrictlySorted!996 l!750) e!874485)))

(declare-fun b!1568680 () Bool)

(declare-fun e!874486 () Bool)

(assert (=> b!1568680 (= e!874485 e!874486)))

(declare-fun res!1072331 () Bool)

(assert (=> b!1568680 (=> (not res!1072331) (not e!874486))))

(assert (=> b!1568680 (= res!1072331 (bvslt (_1!12665 (h!38166 l!750)) (_1!12665 (h!38166 (t!51631 l!750)))))))

(declare-fun b!1568681 () Bool)

(assert (=> b!1568681 (= e!874486 (isStrictlySorted!996 (t!51631 l!750)))))

(assert (= (and d!163761 (not res!1072330)) b!1568680))

(assert (= (and b!1568680 res!1072331) b!1568681))

(assert (=> b!1568681 m!1443259))

(assert (=> b!1568655 d!163761))

(declare-fun d!163763 () Bool)

(assert (=> d!163763 (= (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!673222 () Unit!52080)

(declare-fun choose!2079 (List!36723 (_ BitVec 64) B!2482 (_ BitVec 64) B!2482) Unit!52080)

(assert (=> d!163763 (= lt!673222 (choose!2079 (t!51631 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!163763 (not (= key1!37 key2!21))))

(assert (=> d!163763 (= (lemmaInsertStrictlySortedCommutative!8 (t!51631 l!750) key1!37 v1!32 key2!21 v2!10) lt!673222)))

(declare-fun bs!45187 () Bool)

(assert (= bs!45187 d!163763))

(assert (=> bs!45187 m!1443263))

(assert (=> bs!45187 m!1443265))

(assert (=> bs!45187 m!1443267))

(assert (=> bs!45187 m!1443267))

(assert (=> bs!45187 m!1443269))

(assert (=> bs!45187 m!1443263))

(declare-fun m!1443297 () Bool)

(assert (=> bs!45187 m!1443297))

(assert (=> b!1568657 d!163763))

(declare-fun d!163767 () Bool)

(declare-fun res!1072332 () Bool)

(declare-fun e!874487 () Bool)

(assert (=> d!163767 (=> res!1072332 e!874487)))

(assert (=> d!163767 (= res!1072332 (or ((_ is Nil!36720) (insertStrictlySorted!582 l!750 key1!37 v1!32)) ((_ is Nil!36720) (t!51631 (insertStrictlySorted!582 l!750 key1!37 v1!32)))))))

(assert (=> d!163767 (= (isStrictlySorted!996 (insertStrictlySorted!582 l!750 key1!37 v1!32)) e!874487)))

(declare-fun b!1568682 () Bool)

(declare-fun e!874488 () Bool)

(assert (=> b!1568682 (= e!874487 e!874488)))

(declare-fun res!1072333 () Bool)

(assert (=> b!1568682 (=> (not res!1072333) (not e!874488))))

(assert (=> b!1568682 (= res!1072333 (bvslt (_1!12665 (h!38166 (insertStrictlySorted!582 l!750 key1!37 v1!32))) (_1!12665 (h!38166 (t!51631 (insertStrictlySorted!582 l!750 key1!37 v1!32))))))))

(declare-fun b!1568683 () Bool)

(assert (=> b!1568683 (= e!874488 (isStrictlySorted!996 (t!51631 (insertStrictlySorted!582 l!750 key1!37 v1!32))))))

(assert (= (and d!163767 (not res!1072332)) b!1568682))

(assert (= (and b!1568682 res!1072333) b!1568683))

(declare-fun m!1443299 () Bool)

(assert (=> b!1568683 m!1443299))

(assert (=> b!1568657 d!163767))

(declare-fun bm!71949 () Bool)

(declare-fun call!71953 () List!36723)

(declare-fun call!71954 () List!36723)

(assert (=> bm!71949 (= call!71953 call!71954)))

(declare-fun b!1568740 () Bool)

(declare-fun e!874526 () List!36723)

(declare-fun call!71952 () List!36723)

(assert (=> b!1568740 (= e!874526 call!71952)))

(declare-fun b!1568741 () Bool)

(assert (=> b!1568741 (= e!874526 call!71952)))

(declare-fun b!1568742 () Bool)

(declare-fun c!144552 () Bool)

(assert (=> b!1568742 (= c!144552 (and ((_ is Cons!36719) l!750) (bvsgt (_1!12665 (h!38166 l!750)) key1!37)))))

(declare-fun e!874529 () List!36723)

(assert (=> b!1568742 (= e!874529 e!874526)))

(declare-fun b!1568743 () Bool)

(declare-fun e!874528 () List!36723)

(assert (=> b!1568743 (= e!874528 call!71954)))

(declare-fun bm!71950 () Bool)

(assert (=> bm!71950 (= call!71952 call!71953)))

(declare-fun b!1568744 () Bool)

(assert (=> b!1568744 (= e!874529 call!71953)))

(declare-fun bm!71951 () Bool)

(declare-fun c!144551 () Bool)

(declare-fun e!874527 () List!36723)

(declare-fun $colon$colon!989 (List!36723 tuple2!25308) List!36723)

(assert (=> bm!71951 (= call!71954 ($colon$colon!989 e!874527 (ite c!144551 (h!38166 l!750) (tuple2!25309 key1!37 v1!32))))))

(declare-fun c!144554 () Bool)

(assert (=> bm!71951 (= c!144554 c!144551)))

(declare-fun b!1568745 () Bool)

(declare-fun lt!673233 () List!36723)

(declare-fun e!874525 () Bool)

(declare-fun contains!10416 (List!36723 tuple2!25308) Bool)

(assert (=> b!1568745 (= e!874525 (contains!10416 lt!673233 (tuple2!25309 key1!37 v1!32)))))

(declare-fun d!163769 () Bool)

(assert (=> d!163769 e!874525))

(declare-fun res!1072359 () Bool)

(assert (=> d!163769 (=> (not res!1072359) (not e!874525))))

(assert (=> d!163769 (= res!1072359 (isStrictlySorted!996 lt!673233))))

(assert (=> d!163769 (= lt!673233 e!874528)))

(assert (=> d!163769 (= c!144551 (and ((_ is Cons!36719) l!750) (bvslt (_1!12665 (h!38166 l!750)) key1!37)))))

(assert (=> d!163769 (isStrictlySorted!996 l!750)))

(assert (=> d!163769 (= (insertStrictlySorted!582 l!750 key1!37 v1!32) lt!673233)))

(declare-fun b!1568746 () Bool)

(declare-fun res!1072358 () Bool)

(assert (=> b!1568746 (=> (not res!1072358) (not e!874525))))

(declare-fun containsKey!858 (List!36723 (_ BitVec 64)) Bool)

(assert (=> b!1568746 (= res!1072358 (containsKey!858 lt!673233 key1!37))))

(declare-fun b!1568747 () Bool)

(declare-fun c!144553 () Bool)

(assert (=> b!1568747 (= e!874527 (ite c!144553 (t!51631 l!750) (ite c!144552 (Cons!36719 (h!38166 l!750) (t!51631 l!750)) Nil!36720)))))

(declare-fun b!1568748 () Bool)

(assert (=> b!1568748 (= e!874527 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32))))

(declare-fun b!1568749 () Bool)

(assert (=> b!1568749 (= e!874528 e!874529)))

(assert (=> b!1568749 (= c!144553 (and ((_ is Cons!36719) l!750) (= (_1!12665 (h!38166 l!750)) key1!37)))))

(assert (= (and d!163769 c!144551) b!1568743))

(assert (= (and d!163769 (not c!144551)) b!1568749))

(assert (= (and b!1568749 c!144553) b!1568744))

(assert (= (and b!1568749 (not c!144553)) b!1568742))

(assert (= (and b!1568742 c!144552) b!1568740))

(assert (= (and b!1568742 (not c!144552)) b!1568741))

(assert (= (or b!1568740 b!1568741) bm!71950))

(assert (= (or b!1568744 bm!71950) bm!71949))

(assert (= (or b!1568743 bm!71949) bm!71951))

(assert (= (and bm!71951 c!144554) b!1568748))

(assert (= (and bm!71951 (not c!144554)) b!1568747))

(assert (= (and d!163769 res!1072359) b!1568746))

(assert (= (and b!1568746 res!1072358) b!1568745))

(declare-fun m!1443319 () Bool)

(assert (=> bm!71951 m!1443319))

(declare-fun m!1443321 () Bool)

(assert (=> b!1568746 m!1443321))

(declare-fun m!1443323 () Bool)

(assert (=> d!163769 m!1443323))

(assert (=> d!163769 m!1443261))

(assert (=> b!1568748 m!1443267))

(declare-fun m!1443325 () Bool)

(assert (=> b!1568745 m!1443325))

(assert (=> b!1568657 d!163769))

(declare-fun bm!71958 () Bool)

(declare-fun call!71962 () List!36723)

(declare-fun call!71963 () List!36723)

(assert (=> bm!71958 (= call!71962 call!71963)))

(declare-fun b!1568770 () Bool)

(declare-fun e!874541 () List!36723)

(declare-fun call!71961 () List!36723)

(assert (=> b!1568770 (= e!874541 call!71961)))

(declare-fun b!1568771 () Bool)

(assert (=> b!1568771 (= e!874541 call!71961)))

(declare-fun c!144564 () Bool)

(declare-fun b!1568772 () Bool)

(assert (=> b!1568772 (= c!144564 (and ((_ is Cons!36719) (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32)) (bvsgt (_1!12665 (h!38166 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun e!874544 () List!36723)

(assert (=> b!1568772 (= e!874544 e!874541)))

(declare-fun b!1568773 () Bool)

(declare-fun e!874543 () List!36723)

(assert (=> b!1568773 (= e!874543 call!71963)))

(declare-fun bm!71959 () Bool)

(assert (=> bm!71959 (= call!71961 call!71962)))

(declare-fun b!1568774 () Bool)

(assert (=> b!1568774 (= e!874544 call!71962)))

(declare-fun e!874542 () List!36723)

(declare-fun bm!71960 () Bool)

(declare-fun c!144563 () Bool)

(assert (=> bm!71960 (= call!71963 ($colon$colon!989 e!874542 (ite c!144563 (h!38166 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32)) (tuple2!25309 key2!21 v2!10))))))

(declare-fun c!144566 () Bool)

(assert (=> bm!71960 (= c!144566 c!144563)))

(declare-fun b!1568775 () Bool)

(declare-fun lt!673236 () List!36723)

(declare-fun e!874540 () Bool)

(assert (=> b!1568775 (= e!874540 (contains!10416 lt!673236 (tuple2!25309 key2!21 v2!10)))))

(declare-fun d!163787 () Bool)

(assert (=> d!163787 e!874540))

(declare-fun res!1072365 () Bool)

(assert (=> d!163787 (=> (not res!1072365) (not e!874540))))

(assert (=> d!163787 (= res!1072365 (isStrictlySorted!996 lt!673236))))

(assert (=> d!163787 (= lt!673236 e!874543)))

(assert (=> d!163787 (= c!144563 (and ((_ is Cons!36719) (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32)) (bvslt (_1!12665 (h!38166 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!163787 (isStrictlySorted!996 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32))))

(assert (=> d!163787 (= (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32) key2!21 v2!10) lt!673236)))

(declare-fun b!1568776 () Bool)

(declare-fun res!1072364 () Bool)

(assert (=> b!1568776 (=> (not res!1072364) (not e!874540))))

(assert (=> b!1568776 (= res!1072364 (containsKey!858 lt!673236 key2!21))))

(declare-fun c!144565 () Bool)

(declare-fun b!1568777 () Bool)

(assert (=> b!1568777 (= e!874542 (ite c!144565 (t!51631 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32)) (ite c!144564 (Cons!36719 (h!38166 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32)) (t!51631 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32))) Nil!36720)))))

(declare-fun b!1568778 () Bool)

(assert (=> b!1568778 (= e!874542 (insertStrictlySorted!582 (t!51631 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun b!1568779 () Bool)

(assert (=> b!1568779 (= e!874543 e!874544)))

(assert (=> b!1568779 (= c!144565 (and ((_ is Cons!36719) (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32)) (= (_1!12665 (h!38166 (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32))) key2!21)))))

(assert (= (and d!163787 c!144563) b!1568773))

(assert (= (and d!163787 (not c!144563)) b!1568779))

(assert (= (and b!1568779 c!144565) b!1568774))

(assert (= (and b!1568779 (not c!144565)) b!1568772))

(assert (= (and b!1568772 c!144564) b!1568770))

(assert (= (and b!1568772 (not c!144564)) b!1568771))

(assert (= (or b!1568770 b!1568771) bm!71959))

(assert (= (or b!1568774 bm!71959) bm!71958))

(assert (= (or b!1568773 bm!71958) bm!71960))

(assert (= (and bm!71960 c!144566) b!1568778))

(assert (= (and bm!71960 (not c!144566)) b!1568777))

(assert (= (and d!163787 res!1072365) b!1568776))

(assert (= (and b!1568776 res!1072364) b!1568775))

(declare-fun m!1443349 () Bool)

(assert (=> bm!71960 m!1443349))

(declare-fun m!1443351 () Bool)

(assert (=> b!1568776 m!1443351))

(declare-fun m!1443353 () Bool)

(assert (=> d!163787 m!1443353))

(assert (=> d!163787 m!1443267))

(declare-fun m!1443355 () Bool)

(assert (=> d!163787 m!1443355))

(declare-fun m!1443357 () Bool)

(assert (=> b!1568778 m!1443357))

(declare-fun m!1443359 () Bool)

(assert (=> b!1568775 m!1443359))

(assert (=> b!1568657 d!163787))

(declare-fun bm!71967 () Bool)

(declare-fun call!71971 () List!36723)

(declare-fun call!71972 () List!36723)

(assert (=> bm!71967 (= call!71971 call!71972)))

(declare-fun b!1568800 () Bool)

(declare-fun e!874556 () List!36723)

(declare-fun call!71970 () List!36723)

(assert (=> b!1568800 (= e!874556 call!71970)))

(declare-fun b!1568801 () Bool)

(assert (=> b!1568801 (= e!874556 call!71970)))

(declare-fun b!1568802 () Bool)

(declare-fun c!144576 () Bool)

(assert (=> b!1568802 (= c!144576 (and ((_ is Cons!36719) (t!51631 l!750)) (bvsgt (_1!12665 (h!38166 (t!51631 l!750))) key2!21)))))

(declare-fun e!874559 () List!36723)

(assert (=> b!1568802 (= e!874559 e!874556)))

(declare-fun b!1568803 () Bool)

(declare-fun e!874558 () List!36723)

(assert (=> b!1568803 (= e!874558 call!71972)))

(declare-fun bm!71968 () Bool)

(assert (=> bm!71968 (= call!71970 call!71971)))

(declare-fun b!1568804 () Bool)

(assert (=> b!1568804 (= e!874559 call!71971)))

(declare-fun e!874557 () List!36723)

(declare-fun c!144575 () Bool)

(declare-fun bm!71969 () Bool)

(assert (=> bm!71969 (= call!71972 ($colon$colon!989 e!874557 (ite c!144575 (h!38166 (t!51631 l!750)) (tuple2!25309 key2!21 v2!10))))))

(declare-fun c!144578 () Bool)

(assert (=> bm!71969 (= c!144578 c!144575)))

(declare-fun lt!673239 () List!36723)

(declare-fun b!1568805 () Bool)

(declare-fun e!874555 () Bool)

(assert (=> b!1568805 (= e!874555 (contains!10416 lt!673239 (tuple2!25309 key2!21 v2!10)))))

(declare-fun d!163793 () Bool)

(assert (=> d!163793 e!874555))

(declare-fun res!1072371 () Bool)

(assert (=> d!163793 (=> (not res!1072371) (not e!874555))))

(assert (=> d!163793 (= res!1072371 (isStrictlySorted!996 lt!673239))))

(assert (=> d!163793 (= lt!673239 e!874558)))

(assert (=> d!163793 (= c!144575 (and ((_ is Cons!36719) (t!51631 l!750)) (bvslt (_1!12665 (h!38166 (t!51631 l!750))) key2!21)))))

(assert (=> d!163793 (isStrictlySorted!996 (t!51631 l!750))))

(assert (=> d!163793 (= (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10) lt!673239)))

(declare-fun b!1568806 () Bool)

(declare-fun res!1072370 () Bool)

(assert (=> b!1568806 (=> (not res!1072370) (not e!874555))))

(assert (=> b!1568806 (= res!1072370 (containsKey!858 lt!673239 key2!21))))

(declare-fun c!144577 () Bool)

(declare-fun b!1568807 () Bool)

(assert (=> b!1568807 (= e!874557 (ite c!144577 (t!51631 (t!51631 l!750)) (ite c!144576 (Cons!36719 (h!38166 (t!51631 l!750)) (t!51631 (t!51631 l!750))) Nil!36720)))))

(declare-fun b!1568808 () Bool)

(assert (=> b!1568808 (= e!874557 (insertStrictlySorted!582 (t!51631 (t!51631 l!750)) key2!21 v2!10))))

(declare-fun b!1568809 () Bool)

(assert (=> b!1568809 (= e!874558 e!874559)))

(assert (=> b!1568809 (= c!144577 (and ((_ is Cons!36719) (t!51631 l!750)) (= (_1!12665 (h!38166 (t!51631 l!750))) key2!21)))))

(assert (= (and d!163793 c!144575) b!1568803))

(assert (= (and d!163793 (not c!144575)) b!1568809))

(assert (= (and b!1568809 c!144577) b!1568804))

(assert (= (and b!1568809 (not c!144577)) b!1568802))

(assert (= (and b!1568802 c!144576) b!1568800))

(assert (= (and b!1568802 (not c!144576)) b!1568801))

(assert (= (or b!1568800 b!1568801) bm!71968))

(assert (= (or b!1568804 bm!71968) bm!71967))

(assert (= (or b!1568803 bm!71967) bm!71969))

(assert (= (and bm!71969 c!144578) b!1568808))

(assert (= (and bm!71969 (not c!144578)) b!1568807))

(assert (= (and d!163793 res!1072371) b!1568806))

(assert (= (and b!1568806 res!1072370) b!1568805))

(declare-fun m!1443373 () Bool)

(assert (=> bm!71969 m!1443373))

(declare-fun m!1443377 () Bool)

(assert (=> b!1568806 m!1443377))

(declare-fun m!1443383 () Bool)

(assert (=> d!163793 m!1443383))

(assert (=> d!163793 m!1443259))

(declare-fun m!1443388 () Bool)

(assert (=> b!1568808 m!1443388))

(declare-fun m!1443391 () Bool)

(assert (=> b!1568805 m!1443391))

(assert (=> b!1568657 d!163793))

(declare-fun bm!71973 () Bool)

(declare-fun call!71977 () List!36723)

(declare-fun call!71978 () List!36723)

(assert (=> bm!71973 (= call!71977 call!71978)))

(declare-fun b!1568824 () Bool)

(declare-fun e!874568 () List!36723)

(declare-fun call!71976 () List!36723)

(assert (=> b!1568824 (= e!874568 call!71976)))

(declare-fun b!1568825 () Bool)

(assert (=> b!1568825 (= e!874568 call!71976)))

(declare-fun b!1568826 () Bool)

(declare-fun c!144584 () Bool)

(assert (=> b!1568826 (= c!144584 (and ((_ is Cons!36719) (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10)) (bvsgt (_1!12665 (h!38166 (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun e!874571 () List!36723)

(assert (=> b!1568826 (= e!874571 e!874568)))

(declare-fun b!1568827 () Bool)

(declare-fun e!874570 () List!36723)

(assert (=> b!1568827 (= e!874570 call!71978)))

(declare-fun bm!71974 () Bool)

(assert (=> bm!71974 (= call!71976 call!71977)))

(declare-fun b!1568828 () Bool)

(assert (=> b!1568828 (= e!874571 call!71977)))

(declare-fun e!874569 () List!36723)

(declare-fun bm!71975 () Bool)

(declare-fun c!144583 () Bool)

(assert (=> bm!71975 (= call!71978 ($colon$colon!989 e!874569 (ite c!144583 (h!38166 (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10)) (tuple2!25309 key1!37 v1!32))))))

(declare-fun c!144586 () Bool)

(assert (=> bm!71975 (= c!144586 c!144583)))

(declare-fun b!1568829 () Bool)

(declare-fun e!874567 () Bool)

(declare-fun lt!673241 () List!36723)

(assert (=> b!1568829 (= e!874567 (contains!10416 lt!673241 (tuple2!25309 key1!37 v1!32)))))

(declare-fun d!163797 () Bool)

(assert (=> d!163797 e!874567))

(declare-fun res!1072375 () Bool)

(assert (=> d!163797 (=> (not res!1072375) (not e!874567))))

(assert (=> d!163797 (= res!1072375 (isStrictlySorted!996 lt!673241))))

(assert (=> d!163797 (= lt!673241 e!874570)))

(assert (=> d!163797 (= c!144583 (and ((_ is Cons!36719) (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10)) (bvslt (_1!12665 (h!38166 (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!163797 (isStrictlySorted!996 (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10))))

(assert (=> d!163797 (= (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10) key1!37 v1!32) lt!673241)))

(declare-fun b!1568830 () Bool)

(declare-fun res!1072374 () Bool)

(assert (=> b!1568830 (=> (not res!1072374) (not e!874567))))

(assert (=> b!1568830 (= res!1072374 (containsKey!858 lt!673241 key1!37))))

(declare-fun c!144585 () Bool)

(declare-fun b!1568831 () Bool)

(assert (=> b!1568831 (= e!874569 (ite c!144585 (t!51631 (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10)) (ite c!144584 (Cons!36719 (h!38166 (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10)) (t!51631 (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10))) Nil!36720)))))

(declare-fun b!1568832 () Bool)

(assert (=> b!1568832 (= e!874569 (insertStrictlySorted!582 (t!51631 (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun b!1568833 () Bool)

(assert (=> b!1568833 (= e!874570 e!874571)))

(assert (=> b!1568833 (= c!144585 (and ((_ is Cons!36719) (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10)) (= (_1!12665 (h!38166 (insertStrictlySorted!582 (t!51631 l!750) key2!21 v2!10))) key1!37)))))

(assert (= (and d!163797 c!144583) b!1568827))

(assert (= (and d!163797 (not c!144583)) b!1568833))

(assert (= (and b!1568833 c!144585) b!1568828))

(assert (= (and b!1568833 (not c!144585)) b!1568826))

(assert (= (and b!1568826 c!144584) b!1568824))

(assert (= (and b!1568826 (not c!144584)) b!1568825))

(assert (= (or b!1568824 b!1568825) bm!71974))

(assert (= (or b!1568828 bm!71974) bm!71973))

(assert (= (or b!1568827 bm!71973) bm!71975))

(assert (= (and bm!71975 c!144586) b!1568832))

(assert (= (and bm!71975 (not c!144586)) b!1568831))

(assert (= (and d!163797 res!1072375) b!1568830))

(assert (= (and b!1568830 res!1072374) b!1568829))

(declare-fun m!1443393 () Bool)

(assert (=> bm!71975 m!1443393))

(declare-fun m!1443395 () Bool)

(assert (=> b!1568830 m!1443395))

(declare-fun m!1443397 () Bool)

(assert (=> d!163797 m!1443397))

(assert (=> d!163797 m!1443263))

(declare-fun m!1443399 () Bool)

(assert (=> d!163797 m!1443399))

(declare-fun m!1443401 () Bool)

(assert (=> b!1568832 m!1443401))

(declare-fun m!1443403 () Bool)

(assert (=> b!1568829 m!1443403))

(assert (=> b!1568657 d!163797))

(declare-fun bm!71976 () Bool)

(declare-fun call!71980 () List!36723)

(declare-fun call!71981 () List!36723)

(assert (=> bm!71976 (= call!71980 call!71981)))

(declare-fun b!1568847 () Bool)

(declare-fun e!874580 () List!36723)

(declare-fun call!71979 () List!36723)

(assert (=> b!1568847 (= e!874580 call!71979)))

(declare-fun b!1568848 () Bool)

(assert (=> b!1568848 (= e!874580 call!71979)))

(declare-fun b!1568849 () Bool)

(declare-fun c!144594 () Bool)

(assert (=> b!1568849 (= c!144594 (and ((_ is Cons!36719) (t!51631 l!750)) (bvsgt (_1!12665 (h!38166 (t!51631 l!750))) key1!37)))))

(declare-fun e!874583 () List!36723)

(assert (=> b!1568849 (= e!874583 e!874580)))

(declare-fun b!1568850 () Bool)

(declare-fun e!874582 () List!36723)

(assert (=> b!1568850 (= e!874582 call!71981)))

(declare-fun bm!71977 () Bool)

(assert (=> bm!71977 (= call!71979 call!71980)))

(declare-fun b!1568851 () Bool)

(assert (=> b!1568851 (= e!874583 call!71980)))

(declare-fun bm!71978 () Bool)

(declare-fun c!144593 () Bool)

(declare-fun e!874581 () List!36723)

(assert (=> bm!71978 (= call!71981 ($colon$colon!989 e!874581 (ite c!144593 (h!38166 (t!51631 l!750)) (tuple2!25309 key1!37 v1!32))))))

(declare-fun c!144596 () Bool)

(assert (=> bm!71978 (= c!144596 c!144593)))

(declare-fun b!1568852 () Bool)

(declare-fun e!874579 () Bool)

(declare-fun lt!673244 () List!36723)

(assert (=> b!1568852 (= e!874579 (contains!10416 lt!673244 (tuple2!25309 key1!37 v1!32)))))

(declare-fun d!163799 () Bool)

(assert (=> d!163799 e!874579))

(declare-fun res!1072377 () Bool)

(assert (=> d!163799 (=> (not res!1072377) (not e!874579))))

(assert (=> d!163799 (= res!1072377 (isStrictlySorted!996 lt!673244))))

(assert (=> d!163799 (= lt!673244 e!874582)))

(assert (=> d!163799 (= c!144593 (and ((_ is Cons!36719) (t!51631 l!750)) (bvslt (_1!12665 (h!38166 (t!51631 l!750))) key1!37)))))

(assert (=> d!163799 (isStrictlySorted!996 (t!51631 l!750))))

(assert (=> d!163799 (= (insertStrictlySorted!582 (t!51631 l!750) key1!37 v1!32) lt!673244)))

(declare-fun b!1568853 () Bool)

(declare-fun res!1072376 () Bool)

(assert (=> b!1568853 (=> (not res!1072376) (not e!874579))))

(assert (=> b!1568853 (= res!1072376 (containsKey!858 lt!673244 key1!37))))

(declare-fun b!1568854 () Bool)

(declare-fun c!144595 () Bool)

(assert (=> b!1568854 (= e!874581 (ite c!144595 (t!51631 (t!51631 l!750)) (ite c!144594 (Cons!36719 (h!38166 (t!51631 l!750)) (t!51631 (t!51631 l!750))) Nil!36720)))))

(declare-fun b!1568855 () Bool)

(assert (=> b!1568855 (= e!874581 (insertStrictlySorted!582 (t!51631 (t!51631 l!750)) key1!37 v1!32))))

(declare-fun b!1568856 () Bool)

(assert (=> b!1568856 (= e!874582 e!874583)))

(assert (=> b!1568856 (= c!144595 (and ((_ is Cons!36719) (t!51631 l!750)) (= (_1!12665 (h!38166 (t!51631 l!750))) key1!37)))))

(assert (= (and d!163799 c!144593) b!1568850))

(assert (= (and d!163799 (not c!144593)) b!1568856))

(assert (= (and b!1568856 c!144595) b!1568851))

(assert (= (and b!1568856 (not c!144595)) b!1568849))

(assert (= (and b!1568849 c!144594) b!1568847))

(assert (= (and b!1568849 (not c!144594)) b!1568848))

(assert (= (or b!1568847 b!1568848) bm!71977))

(assert (= (or b!1568851 bm!71977) bm!71976))

(assert (= (or b!1568850 bm!71976) bm!71978))

(assert (= (and bm!71978 c!144596) b!1568855))

(assert (= (and bm!71978 (not c!144596)) b!1568854))

(assert (= (and d!163799 res!1072377) b!1568853))

(assert (= (and b!1568853 res!1072376) b!1568852))

(declare-fun m!1443405 () Bool)

(assert (=> bm!71978 m!1443405))

(declare-fun m!1443407 () Bool)

(assert (=> b!1568853 m!1443407))

(declare-fun m!1443409 () Bool)

(assert (=> d!163799 m!1443409))

(assert (=> d!163799 m!1443259))

(declare-fun m!1443411 () Bool)

(assert (=> b!1568855 m!1443411))

(declare-fun m!1443413 () Bool)

(assert (=> b!1568852 m!1443413))

(assert (=> b!1568657 d!163799))

(declare-fun b!1568864 () Bool)

(declare-fun e!874586 () Bool)

(declare-fun tp!114060 () Bool)

(assert (=> b!1568864 (= e!874586 (and tp_is_empty!39033 tp!114060))))

(assert (=> b!1568656 (= tp!114051 e!874586)))

(assert (= (and b!1568656 ((_ is Cons!36719) (t!51631 l!750))) b!1568864))

(check-sat (not b!1568745) (not b!1568746) (not b!1568778) (not b!1568683) (not b!1568805) (not bm!71960) (not d!163787) (not b!1568681) (not b!1568830) (not d!163797) (not bm!71951) (not b!1568679) (not b!1568776) (not d!163793) (not b!1568852) (not b!1568808) (not bm!71969) (not b!1568832) (not b!1568775) (not bm!71978) (not d!163799) tp_is_empty!39033 (not bm!71975) (not b!1568864) (not b!1568855) (not b!1568829) (not b!1568748) (not b!1568806) (not d!163769) (not b!1568853) (not d!163763))
(check-sat)
