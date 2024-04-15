; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134310 () Bool)

(assert start!134310)

(declare-fun b!1568671 () Bool)

(declare-fun res!1072312 () Bool)

(declare-fun e!874447 () Bool)

(assert (=> b!1568671 (=> (not res!1072312) (not e!874447))))

(declare-datatypes ((B!2492 0))(
  ( (B!2493 (val!19608 Int)) )
))
(declare-datatypes ((tuple2!25386 0))(
  ( (tuple2!25387 (_1!12704 (_ BitVec 64)) (_2!12704 B!2492)) )
))
(declare-datatypes ((List!36769 0))(
  ( (Nil!36766) (Cons!36765 (h!38213 tuple2!25386) (t!51669 List!36769)) )
))
(declare-fun l!750 () List!36769)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1568671 (= res!1072312 (and ((_ is Cons!36765) l!750) (bvslt (_1!12704 (h!38213 l!750)) key1!37) (bvslt (_1!12704 (h!38213 l!750)) key2!21)))))

(declare-fun b!1568672 () Bool)

(declare-fun res!1072313 () Bool)

(assert (=> b!1568672 (=> (not res!1072313) (not e!874447))))

(declare-fun isStrictlySorted!999 (List!36769) Bool)

(assert (=> b!1568672 (= res!1072313 (isStrictlySorted!999 l!750))))

(declare-fun v2!10 () B!2492)

(declare-fun b!1568673 () Bool)

(declare-fun insertStrictlySorted!588 (List!36769 (_ BitVec 64) B!2492) List!36769)

(assert (=> b!1568673 (= e!874447 (not (isStrictlySorted!999 (insertStrictlySorted!588 l!750 key2!21 v2!10))))))

(declare-fun v1!32 () B!2492)

(assert (=> b!1568673 (= (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!51899 0))(
  ( (Unit!51900) )
))
(declare-fun lt!672975 () Unit!51899)

(declare-fun lemmaInsertStrictlySortedCommutative!13 (List!36769 (_ BitVec 64) B!2492 (_ BitVec 64) B!2492) Unit!51899)

(assert (=> b!1568673 (= lt!672975 (lemmaInsertStrictlySortedCommutative!13 (t!51669 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1568674 () Bool)

(declare-fun res!1072311 () Bool)

(assert (=> b!1568674 (=> (not res!1072311) (not e!874447))))

(assert (=> b!1568674 (= res!1072311 (isStrictlySorted!999 (t!51669 l!750)))))

(declare-fun b!1568675 () Bool)

(declare-fun e!874448 () Bool)

(declare-fun tp_is_empty!39043 () Bool)

(declare-fun tp!114076 () Bool)

(assert (=> b!1568675 (= e!874448 (and tp_is_empty!39043 tp!114076))))

(declare-fun res!1072314 () Bool)

(assert (=> start!134310 (=> (not res!1072314) (not e!874447))))

(assert (=> start!134310 (= res!1072314 (not (= key1!37 key2!21)))))

(assert (=> start!134310 e!874447))

(assert (=> start!134310 tp_is_empty!39043))

(assert (=> start!134310 e!874448))

(assert (=> start!134310 true))

(assert (= (and start!134310 res!1072314) b!1568672))

(assert (= (and b!1568672 res!1072313) b!1568671))

(assert (= (and b!1568671 res!1072312) b!1568674))

(assert (= (and b!1568674 res!1072311) b!1568673))

(assert (= (and start!134310 ((_ is Cons!36765) l!750)) b!1568675))

(declare-fun m!1442619 () Bool)

(assert (=> b!1568672 m!1442619))

(declare-fun m!1442621 () Bool)

(assert (=> b!1568673 m!1442621))

(declare-fun m!1442623 () Bool)

(assert (=> b!1568673 m!1442623))

(declare-fun m!1442625 () Bool)

(assert (=> b!1568673 m!1442625))

(assert (=> b!1568673 m!1442623))

(declare-fun m!1442627 () Bool)

(assert (=> b!1568673 m!1442627))

(declare-fun m!1442629 () Bool)

(assert (=> b!1568673 m!1442629))

(declare-fun m!1442631 () Bool)

(assert (=> b!1568673 m!1442631))

(assert (=> b!1568673 m!1442629))

(assert (=> b!1568673 m!1442621))

(declare-fun m!1442633 () Bool)

(assert (=> b!1568673 m!1442633))

(declare-fun m!1442635 () Bool)

(assert (=> b!1568674 m!1442635))

(check-sat (not b!1568673) (not b!1568674) (not b!1568672) (not b!1568675) tp_is_empty!39043)
(check-sat)
(get-model)

(declare-fun d!163563 () Bool)

(declare-fun res!1072343 () Bool)

(declare-fun e!874465 () Bool)

(assert (=> d!163563 (=> res!1072343 e!874465)))

(assert (=> d!163563 (= res!1072343 (or ((_ is Nil!36766) (t!51669 l!750)) ((_ is Nil!36766) (t!51669 (t!51669 l!750)))))))

(assert (=> d!163563 (= (isStrictlySorted!999 (t!51669 l!750)) e!874465)))

(declare-fun b!1568710 () Bool)

(declare-fun e!874466 () Bool)

(assert (=> b!1568710 (= e!874465 e!874466)))

(declare-fun res!1072344 () Bool)

(assert (=> b!1568710 (=> (not res!1072344) (not e!874466))))

(assert (=> b!1568710 (= res!1072344 (bvslt (_1!12704 (h!38213 (t!51669 l!750))) (_1!12704 (h!38213 (t!51669 (t!51669 l!750))))))))

(declare-fun b!1568711 () Bool)

(assert (=> b!1568711 (= e!874466 (isStrictlySorted!999 (t!51669 (t!51669 l!750))))))

(assert (= (and d!163563 (not res!1072343)) b!1568710))

(assert (= (and b!1568710 res!1072344) b!1568711))

(declare-fun m!1442673 () Bool)

(assert (=> b!1568711 m!1442673))

(assert (=> b!1568674 d!163563))

(declare-fun d!163565 () Bool)

(assert (=> d!163565 (= (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!672984 () Unit!51899)

(declare-fun choose!2090 (List!36769 (_ BitVec 64) B!2492 (_ BitVec 64) B!2492) Unit!51899)

(assert (=> d!163565 (= lt!672984 (choose!2090 (t!51669 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!163565 (not (= key1!37 key2!21))))

(assert (=> d!163565 (= (lemmaInsertStrictlySortedCommutative!13 (t!51669 l!750) key1!37 v1!32 key2!21 v2!10) lt!672984)))

(declare-fun bs!45150 () Bool)

(assert (= bs!45150 d!163565))

(assert (=> bs!45150 m!1442621))

(declare-fun m!1442675 () Bool)

(assert (=> bs!45150 m!1442675))

(assert (=> bs!45150 m!1442621))

(assert (=> bs!45150 m!1442633))

(assert (=> bs!45150 m!1442623))

(assert (=> bs!45150 m!1442625))

(assert (=> bs!45150 m!1442623))

(assert (=> b!1568673 d!163565))

(declare-fun b!1568744 () Bool)

(declare-fun e!874490 () List!36769)

(declare-fun call!71974 () List!36769)

(assert (=> b!1568744 (= e!874490 call!71974)))

(declare-fun b!1568745 () Bool)

(declare-fun e!874489 () List!36769)

(declare-fun call!71975 () List!36769)

(assert (=> b!1568745 (= e!874489 call!71975)))

(declare-fun bm!71971 () Bool)

(declare-fun call!71976 () List!36769)

(assert (=> bm!71971 (= call!71974 call!71976)))

(declare-fun b!1568746 () Bool)

(declare-fun e!874492 () List!36769)

(assert (=> b!1568746 (= e!874492 call!71976)))

(declare-fun b!1568747 () Bool)

(declare-fun lt!672993 () List!36769)

(declare-fun e!874493 () Bool)

(declare-fun contains!10373 (List!36769 tuple2!25386) Bool)

(assert (=> b!1568747 (= e!874493 (contains!10373 lt!672993 (tuple2!25387 key2!21 v2!10)))))

(declare-fun b!1568748 () Bool)

(assert (=> b!1568748 (= e!874489 e!874492)))

(declare-fun c!144539 () Bool)

(assert (=> b!1568748 (= c!144539 (and ((_ is Cons!36765) l!750) (= (_1!12704 (h!38213 l!750)) key2!21)))))

(declare-fun b!1568749 () Bool)

(assert (=> b!1568749 (= e!874490 call!71974)))

(declare-fun e!874491 () List!36769)

(declare-fun b!1568750 () Bool)

(declare-fun c!144540 () Bool)

(assert (=> b!1568750 (= e!874491 (ite c!144539 (t!51669 l!750) (ite c!144540 (Cons!36765 (h!38213 l!750) (t!51669 l!750)) Nil!36766)))))

(declare-fun b!1568751 () Bool)

(assert (=> b!1568751 (= e!874491 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10))))

(declare-fun b!1568752 () Bool)

(assert (=> b!1568752 (= c!144540 (and ((_ is Cons!36765) l!750) (bvsgt (_1!12704 (h!38213 l!750)) key2!21)))))

(assert (=> b!1568752 (= e!874492 e!874490)))

(declare-fun bm!71972 () Bool)

(assert (=> bm!71972 (= call!71976 call!71975)))

(declare-fun bm!71973 () Bool)

(declare-fun c!144538 () Bool)

(declare-fun $colon$colon!993 (List!36769 tuple2!25386) List!36769)

(assert (=> bm!71973 (= call!71975 ($colon$colon!993 e!874491 (ite c!144538 (h!38213 l!750) (tuple2!25387 key2!21 v2!10))))))

(declare-fun c!144541 () Bool)

(assert (=> bm!71973 (= c!144541 c!144538)))

(declare-fun b!1568753 () Bool)

(declare-fun res!1072361 () Bool)

(assert (=> b!1568753 (=> (not res!1072361) (not e!874493))))

(declare-fun containsKey!857 (List!36769 (_ BitVec 64)) Bool)

(assert (=> b!1568753 (= res!1072361 (containsKey!857 lt!672993 key2!21))))

(declare-fun d!163569 () Bool)

(assert (=> d!163569 e!874493))

(declare-fun res!1072362 () Bool)

(assert (=> d!163569 (=> (not res!1072362) (not e!874493))))

(assert (=> d!163569 (= res!1072362 (isStrictlySorted!999 lt!672993))))

(assert (=> d!163569 (= lt!672993 e!874489)))

(assert (=> d!163569 (= c!144538 (and ((_ is Cons!36765) l!750) (bvslt (_1!12704 (h!38213 l!750)) key2!21)))))

(assert (=> d!163569 (isStrictlySorted!999 l!750)))

(assert (=> d!163569 (= (insertStrictlySorted!588 l!750 key2!21 v2!10) lt!672993)))

(assert (= (and d!163569 c!144538) b!1568745))

(assert (= (and d!163569 (not c!144538)) b!1568748))

(assert (= (and b!1568748 c!144539) b!1568746))

(assert (= (and b!1568748 (not c!144539)) b!1568752))

(assert (= (and b!1568752 c!144540) b!1568744))

(assert (= (and b!1568752 (not c!144540)) b!1568749))

(assert (= (or b!1568744 b!1568749) bm!71971))

(assert (= (or b!1568746 bm!71971) bm!71972))

(assert (= (or b!1568745 bm!71972) bm!71973))

(assert (= (and bm!71973 c!144541) b!1568751))

(assert (= (and bm!71973 (not c!144541)) b!1568750))

(assert (= (and d!163569 res!1072362) b!1568753))

(assert (= (and b!1568753 res!1072361) b!1568747))

(declare-fun m!1442683 () Bool)

(assert (=> b!1568753 m!1442683))

(declare-fun m!1442685 () Bool)

(assert (=> d!163569 m!1442685))

(assert (=> d!163569 m!1442619))

(declare-fun m!1442687 () Bool)

(assert (=> b!1568747 m!1442687))

(declare-fun m!1442689 () Bool)

(assert (=> bm!71973 m!1442689))

(assert (=> b!1568751 m!1442621))

(assert (=> b!1568673 d!163569))

(declare-fun b!1568754 () Bool)

(declare-fun e!874495 () List!36769)

(declare-fun call!71977 () List!36769)

(assert (=> b!1568754 (= e!874495 call!71977)))

(declare-fun b!1568755 () Bool)

(declare-fun e!874494 () List!36769)

(declare-fun call!71978 () List!36769)

(assert (=> b!1568755 (= e!874494 call!71978)))

(declare-fun bm!71974 () Bool)

(declare-fun call!71979 () List!36769)

(assert (=> bm!71974 (= call!71977 call!71979)))

(declare-fun b!1568756 () Bool)

(declare-fun e!874497 () List!36769)

(assert (=> b!1568756 (= e!874497 call!71979)))

(declare-fun lt!672994 () List!36769)

(declare-fun b!1568757 () Bool)

(declare-fun e!874498 () Bool)

(assert (=> b!1568757 (= e!874498 (contains!10373 lt!672994 (tuple2!25387 key2!21 v2!10)))))

(declare-fun b!1568758 () Bool)

(assert (=> b!1568758 (= e!874494 e!874497)))

(declare-fun c!144543 () Bool)

(assert (=> b!1568758 (= c!144543 (and ((_ is Cons!36765) (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32)) (= (_1!12704 (h!38213 (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun b!1568759 () Bool)

(assert (=> b!1568759 (= e!874495 call!71977)))

(declare-fun b!1568760 () Bool)

(declare-fun e!874496 () List!36769)

(declare-fun c!144544 () Bool)

(assert (=> b!1568760 (= e!874496 (ite c!144543 (t!51669 (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32)) (ite c!144544 (Cons!36765 (h!38213 (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32)) (t!51669 (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32))) Nil!36766)))))

(declare-fun b!1568761 () Bool)

(assert (=> b!1568761 (= e!874496 (insertStrictlySorted!588 (t!51669 (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun b!1568762 () Bool)

(assert (=> b!1568762 (= c!144544 (and ((_ is Cons!36765) (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32)) (bvsgt (_1!12704 (h!38213 (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> b!1568762 (= e!874497 e!874495)))

(declare-fun bm!71975 () Bool)

(assert (=> bm!71975 (= call!71979 call!71978)))

(declare-fun bm!71976 () Bool)

(declare-fun c!144542 () Bool)

(assert (=> bm!71976 (= call!71978 ($colon$colon!993 e!874496 (ite c!144542 (h!38213 (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32)) (tuple2!25387 key2!21 v2!10))))))

(declare-fun c!144545 () Bool)

(assert (=> bm!71976 (= c!144545 c!144542)))

(declare-fun b!1568763 () Bool)

(declare-fun res!1072363 () Bool)

(assert (=> b!1568763 (=> (not res!1072363) (not e!874498))))

(assert (=> b!1568763 (= res!1072363 (containsKey!857 lt!672994 key2!21))))

(declare-fun d!163581 () Bool)

(assert (=> d!163581 e!874498))

(declare-fun res!1072364 () Bool)

(assert (=> d!163581 (=> (not res!1072364) (not e!874498))))

(assert (=> d!163581 (= res!1072364 (isStrictlySorted!999 lt!672994))))

(assert (=> d!163581 (= lt!672994 e!874494)))

(assert (=> d!163581 (= c!144542 (and ((_ is Cons!36765) (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32)) (bvslt (_1!12704 (h!38213 (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!163581 (isStrictlySorted!999 (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32))))

(assert (=> d!163581 (= (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32) key2!21 v2!10) lt!672994)))

(assert (= (and d!163581 c!144542) b!1568755))

(assert (= (and d!163581 (not c!144542)) b!1568758))

(assert (= (and b!1568758 c!144543) b!1568756))

(assert (= (and b!1568758 (not c!144543)) b!1568762))

(assert (= (and b!1568762 c!144544) b!1568754))

(assert (= (and b!1568762 (not c!144544)) b!1568759))

(assert (= (or b!1568754 b!1568759) bm!71974))

(assert (= (or b!1568756 bm!71974) bm!71975))

(assert (= (or b!1568755 bm!71975) bm!71976))

(assert (= (and bm!71976 c!144545) b!1568761))

(assert (= (and bm!71976 (not c!144545)) b!1568760))

(assert (= (and d!163581 res!1072364) b!1568763))

(assert (= (and b!1568763 res!1072363) b!1568757))

(declare-fun m!1442691 () Bool)

(assert (=> b!1568763 m!1442691))

(declare-fun m!1442693 () Bool)

(assert (=> d!163581 m!1442693))

(assert (=> d!163581 m!1442623))

(declare-fun m!1442695 () Bool)

(assert (=> d!163581 m!1442695))

(declare-fun m!1442697 () Bool)

(assert (=> b!1568757 m!1442697))

(declare-fun m!1442699 () Bool)

(assert (=> bm!71976 m!1442699))

(declare-fun m!1442701 () Bool)

(assert (=> b!1568761 m!1442701))

(assert (=> b!1568673 d!163581))

(declare-fun b!1568764 () Bool)

(declare-fun e!874500 () List!36769)

(declare-fun call!71980 () List!36769)

(assert (=> b!1568764 (= e!874500 call!71980)))

(declare-fun b!1568765 () Bool)

(declare-fun e!874499 () List!36769)

(declare-fun call!71981 () List!36769)

(assert (=> b!1568765 (= e!874499 call!71981)))

(declare-fun bm!71977 () Bool)

(declare-fun call!71982 () List!36769)

(assert (=> bm!71977 (= call!71980 call!71982)))

(declare-fun b!1568766 () Bool)

(declare-fun e!874502 () List!36769)

(assert (=> b!1568766 (= e!874502 call!71982)))

(declare-fun e!874503 () Bool)

(declare-fun lt!672995 () List!36769)

(declare-fun b!1568767 () Bool)

(assert (=> b!1568767 (= e!874503 (contains!10373 lt!672995 (tuple2!25387 key2!21 v2!10)))))

(declare-fun b!1568768 () Bool)

(assert (=> b!1568768 (= e!874499 e!874502)))

(declare-fun c!144547 () Bool)

(assert (=> b!1568768 (= c!144547 (and ((_ is Cons!36765) (t!51669 l!750)) (= (_1!12704 (h!38213 (t!51669 l!750))) key2!21)))))

(declare-fun b!1568769 () Bool)

(assert (=> b!1568769 (= e!874500 call!71980)))

(declare-fun b!1568770 () Bool)

(declare-fun c!144548 () Bool)

(declare-fun e!874501 () List!36769)

(assert (=> b!1568770 (= e!874501 (ite c!144547 (t!51669 (t!51669 l!750)) (ite c!144548 (Cons!36765 (h!38213 (t!51669 l!750)) (t!51669 (t!51669 l!750))) Nil!36766)))))

(declare-fun b!1568771 () Bool)

(assert (=> b!1568771 (= e!874501 (insertStrictlySorted!588 (t!51669 (t!51669 l!750)) key2!21 v2!10))))

(declare-fun b!1568772 () Bool)

(assert (=> b!1568772 (= c!144548 (and ((_ is Cons!36765) (t!51669 l!750)) (bvsgt (_1!12704 (h!38213 (t!51669 l!750))) key2!21)))))

(assert (=> b!1568772 (= e!874502 e!874500)))

(declare-fun bm!71978 () Bool)

(assert (=> bm!71978 (= call!71982 call!71981)))

(declare-fun c!144546 () Bool)

(declare-fun bm!71979 () Bool)

(assert (=> bm!71979 (= call!71981 ($colon$colon!993 e!874501 (ite c!144546 (h!38213 (t!51669 l!750)) (tuple2!25387 key2!21 v2!10))))))

(declare-fun c!144549 () Bool)

(assert (=> bm!71979 (= c!144549 c!144546)))

(declare-fun b!1568773 () Bool)

(declare-fun res!1072365 () Bool)

(assert (=> b!1568773 (=> (not res!1072365) (not e!874503))))

(assert (=> b!1568773 (= res!1072365 (containsKey!857 lt!672995 key2!21))))

(declare-fun d!163583 () Bool)

(assert (=> d!163583 e!874503))

(declare-fun res!1072366 () Bool)

(assert (=> d!163583 (=> (not res!1072366) (not e!874503))))

(assert (=> d!163583 (= res!1072366 (isStrictlySorted!999 lt!672995))))

(assert (=> d!163583 (= lt!672995 e!874499)))

(assert (=> d!163583 (= c!144546 (and ((_ is Cons!36765) (t!51669 l!750)) (bvslt (_1!12704 (h!38213 (t!51669 l!750))) key2!21)))))

(assert (=> d!163583 (isStrictlySorted!999 (t!51669 l!750))))

(assert (=> d!163583 (= (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10) lt!672995)))

(assert (= (and d!163583 c!144546) b!1568765))

(assert (= (and d!163583 (not c!144546)) b!1568768))

(assert (= (and b!1568768 c!144547) b!1568766))

(assert (= (and b!1568768 (not c!144547)) b!1568772))

(assert (= (and b!1568772 c!144548) b!1568764))

(assert (= (and b!1568772 (not c!144548)) b!1568769))

(assert (= (or b!1568764 b!1568769) bm!71977))

(assert (= (or b!1568766 bm!71977) bm!71978))

(assert (= (or b!1568765 bm!71978) bm!71979))

(assert (= (and bm!71979 c!144549) b!1568771))

(assert (= (and bm!71979 (not c!144549)) b!1568770))

(assert (= (and d!163583 res!1072366) b!1568773))

(assert (= (and b!1568773 res!1072365) b!1568767))

(declare-fun m!1442703 () Bool)

(assert (=> b!1568773 m!1442703))

(declare-fun m!1442705 () Bool)

(assert (=> d!163583 m!1442705))

(assert (=> d!163583 m!1442635))

(declare-fun m!1442707 () Bool)

(assert (=> b!1568767 m!1442707))

(declare-fun m!1442709 () Bool)

(assert (=> bm!71979 m!1442709))

(declare-fun m!1442711 () Bool)

(assert (=> b!1568771 m!1442711))

(assert (=> b!1568673 d!163583))

(declare-fun d!163585 () Bool)

(declare-fun res!1072367 () Bool)

(declare-fun e!874504 () Bool)

(assert (=> d!163585 (=> res!1072367 e!874504)))

(assert (=> d!163585 (= res!1072367 (or ((_ is Nil!36766) (insertStrictlySorted!588 l!750 key2!21 v2!10)) ((_ is Nil!36766) (t!51669 (insertStrictlySorted!588 l!750 key2!21 v2!10)))))))

(assert (=> d!163585 (= (isStrictlySorted!999 (insertStrictlySorted!588 l!750 key2!21 v2!10)) e!874504)))

(declare-fun b!1568774 () Bool)

(declare-fun e!874505 () Bool)

(assert (=> b!1568774 (= e!874504 e!874505)))

(declare-fun res!1072368 () Bool)

(assert (=> b!1568774 (=> (not res!1072368) (not e!874505))))

(assert (=> b!1568774 (= res!1072368 (bvslt (_1!12704 (h!38213 (insertStrictlySorted!588 l!750 key2!21 v2!10))) (_1!12704 (h!38213 (t!51669 (insertStrictlySorted!588 l!750 key2!21 v2!10))))))))

(declare-fun b!1568775 () Bool)

(assert (=> b!1568775 (= e!874505 (isStrictlySorted!999 (t!51669 (insertStrictlySorted!588 l!750 key2!21 v2!10))))))

(assert (= (and d!163585 (not res!1072367)) b!1568774))

(assert (= (and b!1568774 res!1072368) b!1568775))

(declare-fun m!1442713 () Bool)

(assert (=> b!1568775 m!1442713))

(assert (=> b!1568673 d!163585))

(declare-fun b!1568776 () Bool)

(declare-fun e!874507 () List!36769)

(declare-fun call!71983 () List!36769)

(assert (=> b!1568776 (= e!874507 call!71983)))

(declare-fun b!1568777 () Bool)

(declare-fun e!874506 () List!36769)

(declare-fun call!71984 () List!36769)

(assert (=> b!1568777 (= e!874506 call!71984)))

(declare-fun bm!71980 () Bool)

(declare-fun call!71985 () List!36769)

(assert (=> bm!71980 (= call!71983 call!71985)))

(declare-fun b!1568778 () Bool)

(declare-fun e!874509 () List!36769)

(assert (=> b!1568778 (= e!874509 call!71985)))

(declare-fun lt!672996 () List!36769)

(declare-fun b!1568779 () Bool)

(declare-fun e!874510 () Bool)

(assert (=> b!1568779 (= e!874510 (contains!10373 lt!672996 (tuple2!25387 key1!37 v1!32)))))

(declare-fun b!1568780 () Bool)

(assert (=> b!1568780 (= e!874506 e!874509)))

(declare-fun c!144551 () Bool)

(assert (=> b!1568780 (= c!144551 (and ((_ is Cons!36765) (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10)) (= (_1!12704 (h!38213 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun b!1568781 () Bool)

(assert (=> b!1568781 (= e!874507 call!71983)))

(declare-fun e!874508 () List!36769)

(declare-fun b!1568782 () Bool)

(declare-fun c!144552 () Bool)

(assert (=> b!1568782 (= e!874508 (ite c!144551 (t!51669 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10)) (ite c!144552 (Cons!36765 (h!38213 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10)) (t!51669 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10))) Nil!36766)))))

(declare-fun b!1568783 () Bool)

(assert (=> b!1568783 (= e!874508 (insertStrictlySorted!588 (t!51669 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun b!1568784 () Bool)

(assert (=> b!1568784 (= c!144552 (and ((_ is Cons!36765) (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10)) (bvsgt (_1!12704 (h!38213 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> b!1568784 (= e!874509 e!874507)))

(declare-fun bm!71981 () Bool)

(assert (=> bm!71981 (= call!71985 call!71984)))

(declare-fun c!144550 () Bool)

(declare-fun bm!71982 () Bool)

(assert (=> bm!71982 (= call!71984 ($colon$colon!993 e!874508 (ite c!144550 (h!38213 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10)) (tuple2!25387 key1!37 v1!32))))))

(declare-fun c!144553 () Bool)

(assert (=> bm!71982 (= c!144553 c!144550)))

(declare-fun b!1568785 () Bool)

(declare-fun res!1072369 () Bool)

(assert (=> b!1568785 (=> (not res!1072369) (not e!874510))))

(assert (=> b!1568785 (= res!1072369 (containsKey!857 lt!672996 key1!37))))

(declare-fun d!163587 () Bool)

(assert (=> d!163587 e!874510))

(declare-fun res!1072370 () Bool)

(assert (=> d!163587 (=> (not res!1072370) (not e!874510))))

(assert (=> d!163587 (= res!1072370 (isStrictlySorted!999 lt!672996))))

(assert (=> d!163587 (= lt!672996 e!874506)))

(assert (=> d!163587 (= c!144550 (and ((_ is Cons!36765) (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10)) (bvslt (_1!12704 (h!38213 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!163587 (isStrictlySorted!999 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10))))

(assert (=> d!163587 (= (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51669 l!750) key2!21 v2!10) key1!37 v1!32) lt!672996)))

(assert (= (and d!163587 c!144550) b!1568777))

(assert (= (and d!163587 (not c!144550)) b!1568780))

(assert (= (and b!1568780 c!144551) b!1568778))

(assert (= (and b!1568780 (not c!144551)) b!1568784))

(assert (= (and b!1568784 c!144552) b!1568776))

(assert (= (and b!1568784 (not c!144552)) b!1568781))

(assert (= (or b!1568776 b!1568781) bm!71980))

(assert (= (or b!1568778 bm!71980) bm!71981))

(assert (= (or b!1568777 bm!71981) bm!71982))

(assert (= (and bm!71982 c!144553) b!1568783))

(assert (= (and bm!71982 (not c!144553)) b!1568782))

(assert (= (and d!163587 res!1072370) b!1568785))

(assert (= (and b!1568785 res!1072369) b!1568779))

(declare-fun m!1442715 () Bool)

(assert (=> b!1568785 m!1442715))

(declare-fun m!1442717 () Bool)

(assert (=> d!163587 m!1442717))

(assert (=> d!163587 m!1442621))

(declare-fun m!1442719 () Bool)

(assert (=> d!163587 m!1442719))

(declare-fun m!1442721 () Bool)

(assert (=> b!1568779 m!1442721))

(declare-fun m!1442723 () Bool)

(assert (=> bm!71982 m!1442723))

(declare-fun m!1442725 () Bool)

(assert (=> b!1568783 m!1442725))

(assert (=> b!1568673 d!163587))

(declare-fun b!1568786 () Bool)

(declare-fun e!874512 () List!36769)

(declare-fun call!71986 () List!36769)

(assert (=> b!1568786 (= e!874512 call!71986)))

(declare-fun b!1568787 () Bool)

(declare-fun e!874511 () List!36769)

(declare-fun call!71987 () List!36769)

(assert (=> b!1568787 (= e!874511 call!71987)))

(declare-fun bm!71983 () Bool)

(declare-fun call!71988 () List!36769)

(assert (=> bm!71983 (= call!71986 call!71988)))

(declare-fun b!1568788 () Bool)

(declare-fun e!874514 () List!36769)

(assert (=> b!1568788 (= e!874514 call!71988)))

(declare-fun b!1568789 () Bool)

(declare-fun e!874515 () Bool)

(declare-fun lt!672997 () List!36769)

(assert (=> b!1568789 (= e!874515 (contains!10373 lt!672997 (tuple2!25387 key1!37 v1!32)))))

(declare-fun b!1568790 () Bool)

(assert (=> b!1568790 (= e!874511 e!874514)))

(declare-fun c!144555 () Bool)

(assert (=> b!1568790 (= c!144555 (and ((_ is Cons!36765) (t!51669 l!750)) (= (_1!12704 (h!38213 (t!51669 l!750))) key1!37)))))

(declare-fun b!1568791 () Bool)

(assert (=> b!1568791 (= e!874512 call!71986)))

(declare-fun e!874513 () List!36769)

(declare-fun c!144556 () Bool)

(declare-fun b!1568792 () Bool)

(assert (=> b!1568792 (= e!874513 (ite c!144555 (t!51669 (t!51669 l!750)) (ite c!144556 (Cons!36765 (h!38213 (t!51669 l!750)) (t!51669 (t!51669 l!750))) Nil!36766)))))

(declare-fun b!1568793 () Bool)

(assert (=> b!1568793 (= e!874513 (insertStrictlySorted!588 (t!51669 (t!51669 l!750)) key1!37 v1!32))))

(declare-fun b!1568794 () Bool)

(assert (=> b!1568794 (= c!144556 (and ((_ is Cons!36765) (t!51669 l!750)) (bvsgt (_1!12704 (h!38213 (t!51669 l!750))) key1!37)))))

(assert (=> b!1568794 (= e!874514 e!874512)))

(declare-fun bm!71984 () Bool)

(assert (=> bm!71984 (= call!71988 call!71987)))

(declare-fun bm!71985 () Bool)

(declare-fun c!144554 () Bool)

(assert (=> bm!71985 (= call!71987 ($colon$colon!993 e!874513 (ite c!144554 (h!38213 (t!51669 l!750)) (tuple2!25387 key1!37 v1!32))))))

(declare-fun c!144557 () Bool)

(assert (=> bm!71985 (= c!144557 c!144554)))

(declare-fun b!1568795 () Bool)

(declare-fun res!1072371 () Bool)

(assert (=> b!1568795 (=> (not res!1072371) (not e!874515))))

(assert (=> b!1568795 (= res!1072371 (containsKey!857 lt!672997 key1!37))))

(declare-fun d!163589 () Bool)

(assert (=> d!163589 e!874515))

(declare-fun res!1072372 () Bool)

(assert (=> d!163589 (=> (not res!1072372) (not e!874515))))

(assert (=> d!163589 (= res!1072372 (isStrictlySorted!999 lt!672997))))

(assert (=> d!163589 (= lt!672997 e!874511)))

(assert (=> d!163589 (= c!144554 (and ((_ is Cons!36765) (t!51669 l!750)) (bvslt (_1!12704 (h!38213 (t!51669 l!750))) key1!37)))))

(assert (=> d!163589 (isStrictlySorted!999 (t!51669 l!750))))

(assert (=> d!163589 (= (insertStrictlySorted!588 (t!51669 l!750) key1!37 v1!32) lt!672997)))

(assert (= (and d!163589 c!144554) b!1568787))

(assert (= (and d!163589 (not c!144554)) b!1568790))

(assert (= (and b!1568790 c!144555) b!1568788))

(assert (= (and b!1568790 (not c!144555)) b!1568794))

(assert (= (and b!1568794 c!144556) b!1568786))

(assert (= (and b!1568794 (not c!144556)) b!1568791))

(assert (= (or b!1568786 b!1568791) bm!71983))

(assert (= (or b!1568788 bm!71983) bm!71984))

(assert (= (or b!1568787 bm!71984) bm!71985))

(assert (= (and bm!71985 c!144557) b!1568793))

(assert (= (and bm!71985 (not c!144557)) b!1568792))

(assert (= (and d!163589 res!1072372) b!1568795))

(assert (= (and b!1568795 res!1072371) b!1568789))

(declare-fun m!1442727 () Bool)

(assert (=> b!1568795 m!1442727))

(declare-fun m!1442729 () Bool)

(assert (=> d!163589 m!1442729))

(assert (=> d!163589 m!1442635))

(declare-fun m!1442731 () Bool)

(assert (=> b!1568789 m!1442731))

(declare-fun m!1442733 () Bool)

(assert (=> bm!71985 m!1442733))

(declare-fun m!1442735 () Bool)

(assert (=> b!1568793 m!1442735))

(assert (=> b!1568673 d!163589))

(declare-fun d!163591 () Bool)

(declare-fun res!1072373 () Bool)

(declare-fun e!874516 () Bool)

(assert (=> d!163591 (=> res!1072373 e!874516)))

(assert (=> d!163591 (= res!1072373 (or ((_ is Nil!36766) l!750) ((_ is Nil!36766) (t!51669 l!750))))))

(assert (=> d!163591 (= (isStrictlySorted!999 l!750) e!874516)))

(declare-fun b!1568796 () Bool)

(declare-fun e!874517 () Bool)

(assert (=> b!1568796 (= e!874516 e!874517)))

(declare-fun res!1072374 () Bool)

(assert (=> b!1568796 (=> (not res!1072374) (not e!874517))))

(assert (=> b!1568796 (= res!1072374 (bvslt (_1!12704 (h!38213 l!750)) (_1!12704 (h!38213 (t!51669 l!750)))))))

(declare-fun b!1568797 () Bool)

(assert (=> b!1568797 (= e!874517 (isStrictlySorted!999 (t!51669 l!750)))))

(assert (= (and d!163591 (not res!1072373)) b!1568796))

(assert (= (and b!1568796 res!1072374) b!1568797))

(assert (=> b!1568797 m!1442635))

(assert (=> b!1568672 d!163591))

(declare-fun b!1568802 () Bool)

(declare-fun e!874520 () Bool)

(declare-fun tp!114085 () Bool)

(assert (=> b!1568802 (= e!874520 (and tp_is_empty!39043 tp!114085))))

(assert (=> b!1568675 (= tp!114076 e!874520)))

(assert (= (and b!1568675 ((_ is Cons!36765) (t!51669 l!750))) b!1568802))

(check-sat (not b!1568795) (not b!1568771) (not b!1568779) (not b!1568797) (not b!1568753) (not bm!71973) (not b!1568789) (not bm!71982) (not bm!71976) (not bm!71979) (not b!1568793) (not d!163565) tp_is_empty!39043 (not b!1568747) (not b!1568767) (not b!1568773) (not b!1568775) (not b!1568783) (not b!1568757) (not b!1568802) (not b!1568751) (not b!1568761) (not d!163581) (not d!163583) (not bm!71985) (not d!163589) (not b!1568711) (not b!1568763) (not d!163587) (not d!163569) (not b!1568785))
(check-sat)
