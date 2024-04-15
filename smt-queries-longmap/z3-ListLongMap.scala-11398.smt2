; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132642 () Bool)

(assert start!132642)

(declare-fun e!865630 () Bool)

(declare-datatypes ((B!2264 0))(
  ( (B!2265 (val!19218 Int)) )
))
(declare-datatypes ((tuple2!24884 0))(
  ( (tuple2!24885 (_1!12453 (_ BitVec 64)) (_2!12453 B!2264)) )
))
(declare-datatypes ((List!36297 0))(
  ( (Nil!36294) (Cons!36293 (h!37740 tuple2!24884) (t!51010 List!36297)) )
))
(declare-fun lt!669885 () List!36297)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun b!1554531 () Bool)

(declare-fun l!1177 () List!36297)

(declare-datatypes ((Option!838 0))(
  ( (Some!837 (v!22016 B!2264)) (None!836) )
))
(declare-fun getValueByKey!763 (List!36297 (_ BitVec 64)) Option!838)

(assert (=> b!1554531 (= e!865630 (= (getValueByKey!763 lt!669885 otherKey!50) (getValueByKey!763 (t!51010 l!1177) otherKey!50)))))

(declare-fun res!1063869 () Bool)

(declare-fun e!865631 () Bool)

(assert (=> start!132642 (=> (not res!1063869) (not e!865631))))

(declare-fun isStrictlySorted!909 (List!36297) Bool)

(assert (=> start!132642 (= res!1063869 (isStrictlySorted!909 l!1177))))

(assert (=> start!132642 e!865631))

(declare-fun e!865629 () Bool)

(assert (=> start!132642 e!865629))

(assert (=> start!132642 true))

(declare-fun tp_is_empty!38275 () Bool)

(assert (=> start!132642 tp_is_empty!38275))

(declare-fun b!1554532 () Bool)

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2264)

(declare-fun insertStrictlySorted!523 (List!36297 (_ BitVec 64) B!2264) List!36297)

(assert (=> b!1554532 (= e!865631 (not (isStrictlySorted!909 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105))))))

(assert (=> b!1554532 e!865630))

(declare-fun res!1063868 () Bool)

(assert (=> b!1554532 (=> (not res!1063868) (not e!865630))))

(declare-fun containsKey!780 (List!36297 (_ BitVec 64)) Bool)

(assert (=> b!1554532 (= res!1063868 (= (containsKey!780 lt!669885 otherKey!50) (containsKey!780 (t!51010 l!1177) otherKey!50)))))

(assert (=> b!1554532 (= lt!669885 (insertStrictlySorted!523 (t!51010 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51624 0))(
  ( (Unit!51625) )
))
(declare-fun lt!669886 () Unit!51624)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!19 (List!36297 (_ BitVec 64) B!2264 (_ BitVec 64)) Unit!51624)

(assert (=> b!1554532 (= lt!669886 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!19 (t!51010 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1554533 () Bool)

(declare-fun res!1063870 () Bool)

(assert (=> b!1554533 (=> (not res!1063870) (not e!865631))))

(assert (=> b!1554533 (= res!1063870 (isStrictlySorted!909 (t!51010 l!1177)))))

(declare-fun b!1554534 () Bool)

(declare-fun tp!112237 () Bool)

(assert (=> b!1554534 (= e!865629 (and tp_is_empty!38275 tp!112237))))

(declare-fun b!1554535 () Bool)

(declare-fun res!1063867 () Bool)

(assert (=> b!1554535 (=> (not res!1063867) (not e!865631))))

(get-info :version)

(assert (=> b!1554535 (= res!1063867 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36293) l!1177) (not (= (_1!12453 (h!37740 l!1177)) otherKey!50))))))

(assert (= (and start!132642 res!1063869) b!1554535))

(assert (= (and b!1554535 res!1063867) b!1554533))

(assert (= (and b!1554533 res!1063870) b!1554532))

(assert (= (and b!1554532 res!1063868) b!1554531))

(assert (= (and start!132642 ((_ is Cons!36293) l!1177)) b!1554534))

(declare-fun m!1432157 () Bool)

(assert (=> b!1554531 m!1432157))

(declare-fun m!1432159 () Bool)

(assert (=> b!1554531 m!1432159))

(declare-fun m!1432161 () Bool)

(assert (=> start!132642 m!1432161))

(declare-fun m!1432163 () Bool)

(assert (=> b!1554532 m!1432163))

(declare-fun m!1432165 () Bool)

(assert (=> b!1554532 m!1432165))

(declare-fun m!1432167 () Bool)

(assert (=> b!1554532 m!1432167))

(assert (=> b!1554532 m!1432163))

(declare-fun m!1432169 () Bool)

(assert (=> b!1554532 m!1432169))

(declare-fun m!1432171 () Bool)

(assert (=> b!1554532 m!1432171))

(declare-fun m!1432173 () Bool)

(assert (=> b!1554532 m!1432173))

(declare-fun m!1432175 () Bool)

(assert (=> b!1554533 m!1432175))

(check-sat tp_is_empty!38275 (not b!1554534) (not start!132642) (not b!1554533) (not b!1554531) (not b!1554532))
(check-sat)
(get-model)

(declare-fun b!1554624 () Bool)

(declare-fun e!865682 () List!36297)

(declare-fun e!865684 () List!36297)

(assert (=> b!1554624 (= e!865682 e!865684)))

(declare-fun c!143427 () Bool)

(assert (=> b!1554624 (= c!143427 (and ((_ is Cons!36293) l!1177) (= (_1!12453 (h!37740 l!1177)) newKey!105)))))

(declare-fun e!865686 () List!36297)

(declare-fun b!1554625 () Bool)

(declare-fun c!143428 () Bool)

(assert (=> b!1554625 (= e!865686 (ite c!143427 (t!51010 l!1177) (ite c!143428 (Cons!36293 (h!37740 l!1177) (t!51010 l!1177)) Nil!36294)))))

(declare-fun b!1554626 () Bool)

(declare-fun res!1063906 () Bool)

(declare-fun e!865683 () Bool)

(assert (=> b!1554626 (=> (not res!1063906) (not e!865683))))

(declare-fun lt!669901 () List!36297)

(assert (=> b!1554626 (= res!1063906 (containsKey!780 lt!669901 newKey!105))))

(declare-fun b!1554627 () Bool)

(declare-fun call!71428 () List!36297)

(assert (=> b!1554627 (= e!865684 call!71428)))

(declare-fun b!1554628 () Bool)

(assert (=> b!1554628 (= e!865686 (insertStrictlySorted!523 (t!51010 l!1177) newKey!105 newValue!105))))

(declare-fun b!1554629 () Bool)

(declare-fun call!71426 () List!36297)

(assert (=> b!1554629 (= e!865682 call!71426)))

(declare-fun d!161593 () Bool)

(assert (=> d!161593 e!865683))

(declare-fun res!1063905 () Bool)

(assert (=> d!161593 (=> (not res!1063905) (not e!865683))))

(assert (=> d!161593 (= res!1063905 (isStrictlySorted!909 lt!669901))))

(assert (=> d!161593 (= lt!669901 e!865682)))

(declare-fun c!143426 () Bool)

(assert (=> d!161593 (= c!143426 (and ((_ is Cons!36293) l!1177) (bvslt (_1!12453 (h!37740 l!1177)) newKey!105)))))

(assert (=> d!161593 (isStrictlySorted!909 l!1177)))

(assert (=> d!161593 (= (insertStrictlySorted!523 l!1177 newKey!105 newValue!105) lt!669901)))

(declare-fun b!1554630 () Bool)

(declare-fun e!865685 () List!36297)

(declare-fun call!71427 () List!36297)

(assert (=> b!1554630 (= e!865685 call!71427)))

(declare-fun bm!71423 () Bool)

(assert (=> bm!71423 (= call!71427 call!71428)))

(declare-fun b!1554631 () Bool)

(assert (=> b!1554631 (= c!143428 (and ((_ is Cons!36293) l!1177) (bvsgt (_1!12453 (h!37740 l!1177)) newKey!105)))))

(assert (=> b!1554631 (= e!865684 e!865685)))

(declare-fun bm!71424 () Bool)

(declare-fun $colon$colon!956 (List!36297 tuple2!24884) List!36297)

(assert (=> bm!71424 (= call!71426 ($colon$colon!956 e!865686 (ite c!143426 (h!37740 l!1177) (tuple2!24885 newKey!105 newValue!105))))))

(declare-fun c!143425 () Bool)

(assert (=> bm!71424 (= c!143425 c!143426)))

(declare-fun b!1554632 () Bool)

(assert (=> b!1554632 (= e!865685 call!71427)))

(declare-fun bm!71425 () Bool)

(assert (=> bm!71425 (= call!71428 call!71426)))

(declare-fun b!1554633 () Bool)

(declare-fun contains!10128 (List!36297 tuple2!24884) Bool)

(assert (=> b!1554633 (= e!865683 (contains!10128 lt!669901 (tuple2!24885 newKey!105 newValue!105)))))

(assert (= (and d!161593 c!143426) b!1554629))

(assert (= (and d!161593 (not c!143426)) b!1554624))

(assert (= (and b!1554624 c!143427) b!1554627))

(assert (= (and b!1554624 (not c!143427)) b!1554631))

(assert (= (and b!1554631 c!143428) b!1554630))

(assert (= (and b!1554631 (not c!143428)) b!1554632))

(assert (= (or b!1554630 b!1554632) bm!71423))

(assert (= (or b!1554627 bm!71423) bm!71425))

(assert (= (or b!1554629 bm!71425) bm!71424))

(assert (= (and bm!71424 c!143425) b!1554628))

(assert (= (and bm!71424 (not c!143425)) b!1554625))

(assert (= (and d!161593 res!1063905) b!1554626))

(assert (= (and b!1554626 res!1063906) b!1554633))

(declare-fun m!1432227 () Bool)

(assert (=> b!1554626 m!1432227))

(assert (=> b!1554628 m!1432169))

(declare-fun m!1432229 () Bool)

(assert (=> d!161593 m!1432229))

(assert (=> d!161593 m!1432161))

(declare-fun m!1432231 () Bool)

(assert (=> bm!71424 m!1432231))

(declare-fun m!1432233 () Bool)

(assert (=> b!1554633 m!1432233))

(assert (=> b!1554532 d!161593))

(declare-fun d!161611 () Bool)

(declare-fun e!865694 () Bool)

(assert (=> d!161611 e!865694))

(declare-fun res!1063913 () Bool)

(assert (=> d!161611 (=> (not res!1063913) (not e!865694))))

(assert (=> d!161611 (= res!1063913 (= (containsKey!780 (insertStrictlySorted!523 (t!51010 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!780 (t!51010 l!1177) otherKey!50)))))

(declare-fun lt!669904 () Unit!51624)

(declare-fun choose!2064 (List!36297 (_ BitVec 64) B!2264 (_ BitVec 64)) Unit!51624)

(assert (=> d!161611 (= lt!669904 (choose!2064 (t!51010 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!865693 () Bool)

(assert (=> d!161611 e!865693))

(declare-fun res!1063914 () Bool)

(assert (=> d!161611 (=> (not res!1063914) (not e!865693))))

(assert (=> d!161611 (= res!1063914 (isStrictlySorted!909 (t!51010 l!1177)))))

(assert (=> d!161611 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!19 (t!51010 l!1177) newKey!105 newValue!105 otherKey!50) lt!669904)))

(declare-fun b!1554640 () Bool)

(assert (=> b!1554640 (= e!865693 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1554641 () Bool)

(assert (=> b!1554641 (= e!865694 (= (getValueByKey!763 (insertStrictlySorted!523 (t!51010 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!763 (t!51010 l!1177) otherKey!50)))))

(assert (= (and d!161611 res!1063914) b!1554640))

(assert (= (and d!161611 res!1063913) b!1554641))

(assert (=> d!161611 m!1432175))

(assert (=> d!161611 m!1432169))

(declare-fun m!1432235 () Bool)

(assert (=> d!161611 m!1432235))

(declare-fun m!1432237 () Bool)

(assert (=> d!161611 m!1432237))

(assert (=> d!161611 m!1432169))

(assert (=> d!161611 m!1432171))

(assert (=> b!1554641 m!1432169))

(assert (=> b!1554641 m!1432169))

(declare-fun m!1432239 () Bool)

(assert (=> b!1554641 m!1432239))

(assert (=> b!1554641 m!1432159))

(assert (=> b!1554532 d!161611))

(declare-fun b!1554642 () Bool)

(declare-fun e!865695 () List!36297)

(declare-fun e!865697 () List!36297)

(assert (=> b!1554642 (= e!865695 e!865697)))

(declare-fun c!143431 () Bool)

(assert (=> b!1554642 (= c!143431 (and ((_ is Cons!36293) (t!51010 l!1177)) (= (_1!12453 (h!37740 (t!51010 l!1177))) newKey!105)))))

(declare-fun c!143432 () Bool)

(declare-fun b!1554643 () Bool)

(declare-fun e!865699 () List!36297)

(assert (=> b!1554643 (= e!865699 (ite c!143431 (t!51010 (t!51010 l!1177)) (ite c!143432 (Cons!36293 (h!37740 (t!51010 l!1177)) (t!51010 (t!51010 l!1177))) Nil!36294)))))

(declare-fun b!1554644 () Bool)

(declare-fun res!1063916 () Bool)

(declare-fun e!865696 () Bool)

(assert (=> b!1554644 (=> (not res!1063916) (not e!865696))))

(declare-fun lt!669905 () List!36297)

(assert (=> b!1554644 (= res!1063916 (containsKey!780 lt!669905 newKey!105))))

(declare-fun b!1554645 () Bool)

(declare-fun call!71431 () List!36297)

(assert (=> b!1554645 (= e!865697 call!71431)))

(declare-fun b!1554646 () Bool)

(assert (=> b!1554646 (= e!865699 (insertStrictlySorted!523 (t!51010 (t!51010 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1554647 () Bool)

(declare-fun call!71429 () List!36297)

(assert (=> b!1554647 (= e!865695 call!71429)))

(declare-fun d!161613 () Bool)

(assert (=> d!161613 e!865696))

(declare-fun res!1063915 () Bool)

(assert (=> d!161613 (=> (not res!1063915) (not e!865696))))

(assert (=> d!161613 (= res!1063915 (isStrictlySorted!909 lt!669905))))

(assert (=> d!161613 (= lt!669905 e!865695)))

(declare-fun c!143430 () Bool)

(assert (=> d!161613 (= c!143430 (and ((_ is Cons!36293) (t!51010 l!1177)) (bvslt (_1!12453 (h!37740 (t!51010 l!1177))) newKey!105)))))

(assert (=> d!161613 (isStrictlySorted!909 (t!51010 l!1177))))

(assert (=> d!161613 (= (insertStrictlySorted!523 (t!51010 l!1177) newKey!105 newValue!105) lt!669905)))

(declare-fun b!1554648 () Bool)

(declare-fun e!865698 () List!36297)

(declare-fun call!71430 () List!36297)

(assert (=> b!1554648 (= e!865698 call!71430)))

(declare-fun bm!71426 () Bool)

(assert (=> bm!71426 (= call!71430 call!71431)))

(declare-fun b!1554649 () Bool)

(assert (=> b!1554649 (= c!143432 (and ((_ is Cons!36293) (t!51010 l!1177)) (bvsgt (_1!12453 (h!37740 (t!51010 l!1177))) newKey!105)))))

(assert (=> b!1554649 (= e!865697 e!865698)))

(declare-fun bm!71427 () Bool)

(assert (=> bm!71427 (= call!71429 ($colon$colon!956 e!865699 (ite c!143430 (h!37740 (t!51010 l!1177)) (tuple2!24885 newKey!105 newValue!105))))))

(declare-fun c!143429 () Bool)

(assert (=> bm!71427 (= c!143429 c!143430)))

(declare-fun b!1554650 () Bool)

(assert (=> b!1554650 (= e!865698 call!71430)))

(declare-fun bm!71428 () Bool)

(assert (=> bm!71428 (= call!71431 call!71429)))

(declare-fun b!1554651 () Bool)

(assert (=> b!1554651 (= e!865696 (contains!10128 lt!669905 (tuple2!24885 newKey!105 newValue!105)))))

(assert (= (and d!161613 c!143430) b!1554647))

(assert (= (and d!161613 (not c!143430)) b!1554642))

(assert (= (and b!1554642 c!143431) b!1554645))

(assert (= (and b!1554642 (not c!143431)) b!1554649))

(assert (= (and b!1554649 c!143432) b!1554648))

(assert (= (and b!1554649 (not c!143432)) b!1554650))

(assert (= (or b!1554648 b!1554650) bm!71426))

(assert (= (or b!1554645 bm!71426) bm!71428))

(assert (= (or b!1554647 bm!71428) bm!71427))

(assert (= (and bm!71427 c!143429) b!1554646))

(assert (= (and bm!71427 (not c!143429)) b!1554643))

(assert (= (and d!161613 res!1063915) b!1554644))

(assert (= (and b!1554644 res!1063916) b!1554651))

(declare-fun m!1432241 () Bool)

(assert (=> b!1554644 m!1432241))

(declare-fun m!1432243 () Bool)

(assert (=> b!1554646 m!1432243))

(declare-fun m!1432245 () Bool)

(assert (=> d!161613 m!1432245))

(assert (=> d!161613 m!1432175))

(declare-fun m!1432247 () Bool)

(assert (=> bm!71427 m!1432247))

(declare-fun m!1432249 () Bool)

(assert (=> b!1554651 m!1432249))

(assert (=> b!1554532 d!161613))

(declare-fun d!161615 () Bool)

(declare-fun res!1063929 () Bool)

(declare-fun e!865724 () Bool)

(assert (=> d!161615 (=> res!1063929 e!865724)))

(assert (=> d!161615 (= res!1063929 (and ((_ is Cons!36293) (t!51010 l!1177)) (= (_1!12453 (h!37740 (t!51010 l!1177))) otherKey!50)))))

(assert (=> d!161615 (= (containsKey!780 (t!51010 l!1177) otherKey!50) e!865724)))

(declare-fun b!1554696 () Bool)

(declare-fun e!865725 () Bool)

(assert (=> b!1554696 (= e!865724 e!865725)))

(declare-fun res!1063930 () Bool)

(assert (=> b!1554696 (=> (not res!1063930) (not e!865725))))

(assert (=> b!1554696 (= res!1063930 (and (or (not ((_ is Cons!36293) (t!51010 l!1177))) (bvsle (_1!12453 (h!37740 (t!51010 l!1177))) otherKey!50)) ((_ is Cons!36293) (t!51010 l!1177)) (bvslt (_1!12453 (h!37740 (t!51010 l!1177))) otherKey!50)))))

(declare-fun b!1554697 () Bool)

(assert (=> b!1554697 (= e!865725 (containsKey!780 (t!51010 (t!51010 l!1177)) otherKey!50))))

(assert (= (and d!161615 (not res!1063929)) b!1554696))

(assert (= (and b!1554696 res!1063930) b!1554697))

(declare-fun m!1432251 () Bool)

(assert (=> b!1554697 m!1432251))

(assert (=> b!1554532 d!161615))

(declare-fun d!161617 () Bool)

(declare-fun res!1063931 () Bool)

(declare-fun e!865726 () Bool)

(assert (=> d!161617 (=> res!1063931 e!865726)))

(assert (=> d!161617 (= res!1063931 (and ((_ is Cons!36293) lt!669885) (= (_1!12453 (h!37740 lt!669885)) otherKey!50)))))

(assert (=> d!161617 (= (containsKey!780 lt!669885 otherKey!50) e!865726)))

(declare-fun b!1554698 () Bool)

(declare-fun e!865727 () Bool)

(assert (=> b!1554698 (= e!865726 e!865727)))

(declare-fun res!1063932 () Bool)

(assert (=> b!1554698 (=> (not res!1063932) (not e!865727))))

(assert (=> b!1554698 (= res!1063932 (and (or (not ((_ is Cons!36293) lt!669885)) (bvsle (_1!12453 (h!37740 lt!669885)) otherKey!50)) ((_ is Cons!36293) lt!669885) (bvslt (_1!12453 (h!37740 lt!669885)) otherKey!50)))))

(declare-fun b!1554699 () Bool)

(assert (=> b!1554699 (= e!865727 (containsKey!780 (t!51010 lt!669885) otherKey!50))))

(assert (= (and d!161617 (not res!1063931)) b!1554698))

(assert (= (and b!1554698 res!1063932) b!1554699))

(declare-fun m!1432253 () Bool)

(assert (=> b!1554699 m!1432253))

(assert (=> b!1554532 d!161617))

(declare-fun d!161619 () Bool)

(declare-fun res!1063941 () Bool)

(declare-fun e!865742 () Bool)

(assert (=> d!161619 (=> res!1063941 e!865742)))

(assert (=> d!161619 (= res!1063941 (or ((_ is Nil!36294) (insertStrictlySorted!523 l!1177 newKey!105 newValue!105)) ((_ is Nil!36294) (t!51010 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105)))))))

(assert (=> d!161619 (= (isStrictlySorted!909 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105)) e!865742)))

(declare-fun b!1554724 () Bool)

(declare-fun e!865743 () Bool)

(assert (=> b!1554724 (= e!865742 e!865743)))

(declare-fun res!1063942 () Bool)

(assert (=> b!1554724 (=> (not res!1063942) (not e!865743))))

(assert (=> b!1554724 (= res!1063942 (bvslt (_1!12453 (h!37740 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105))) (_1!12453 (h!37740 (t!51010 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105))))))))

(declare-fun b!1554725 () Bool)

(assert (=> b!1554725 (= e!865743 (isStrictlySorted!909 (t!51010 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105))))))

(assert (= (and d!161619 (not res!1063941)) b!1554724))

(assert (= (and b!1554724 res!1063942) b!1554725))

(declare-fun m!1432263 () Bool)

(assert (=> b!1554725 m!1432263))

(assert (=> b!1554532 d!161619))

(declare-fun d!161623 () Bool)

(declare-fun res!1063943 () Bool)

(declare-fun e!865744 () Bool)

(assert (=> d!161623 (=> res!1063943 e!865744)))

(assert (=> d!161623 (= res!1063943 (or ((_ is Nil!36294) l!1177) ((_ is Nil!36294) (t!51010 l!1177))))))

(assert (=> d!161623 (= (isStrictlySorted!909 l!1177) e!865744)))

(declare-fun b!1554726 () Bool)

(declare-fun e!865745 () Bool)

(assert (=> b!1554726 (= e!865744 e!865745)))

(declare-fun res!1063944 () Bool)

(assert (=> b!1554726 (=> (not res!1063944) (not e!865745))))

(assert (=> b!1554726 (= res!1063944 (bvslt (_1!12453 (h!37740 l!1177)) (_1!12453 (h!37740 (t!51010 l!1177)))))))

(declare-fun b!1554727 () Bool)

(assert (=> b!1554727 (= e!865745 (isStrictlySorted!909 (t!51010 l!1177)))))

(assert (= (and d!161623 (not res!1063943)) b!1554726))

(assert (= (and b!1554726 res!1063944) b!1554727))

(assert (=> b!1554727 m!1432175))

(assert (=> start!132642 d!161623))

(declare-fun b!1554737 () Bool)

(declare-fun e!865750 () Option!838)

(declare-fun e!865751 () Option!838)

(assert (=> b!1554737 (= e!865750 e!865751)))

(declare-fun c!143462 () Bool)

(assert (=> b!1554737 (= c!143462 (and ((_ is Cons!36293) lt!669885) (not (= (_1!12453 (h!37740 lt!669885)) otherKey!50))))))

(declare-fun d!161627 () Bool)

(declare-fun c!143461 () Bool)

(assert (=> d!161627 (= c!143461 (and ((_ is Cons!36293) lt!669885) (= (_1!12453 (h!37740 lt!669885)) otherKey!50)))))

(assert (=> d!161627 (= (getValueByKey!763 lt!669885 otherKey!50) e!865750)))

(declare-fun b!1554738 () Bool)

(assert (=> b!1554738 (= e!865751 (getValueByKey!763 (t!51010 lt!669885) otherKey!50))))

(declare-fun b!1554739 () Bool)

(assert (=> b!1554739 (= e!865751 None!836)))

(declare-fun b!1554736 () Bool)

(assert (=> b!1554736 (= e!865750 (Some!837 (_2!12453 (h!37740 lt!669885))))))

(assert (= (and d!161627 c!143461) b!1554736))

(assert (= (and d!161627 (not c!143461)) b!1554737))

(assert (= (and b!1554737 c!143462) b!1554738))

(assert (= (and b!1554737 (not c!143462)) b!1554739))

(declare-fun m!1432273 () Bool)

(assert (=> b!1554738 m!1432273))

(assert (=> b!1554531 d!161627))

(declare-fun b!1554743 () Bool)

(declare-fun e!865756 () Option!838)

(declare-fun e!865757 () Option!838)

(assert (=> b!1554743 (= e!865756 e!865757)))

(declare-fun c!143464 () Bool)

(assert (=> b!1554743 (= c!143464 (and ((_ is Cons!36293) (t!51010 l!1177)) (not (= (_1!12453 (h!37740 (t!51010 l!1177))) otherKey!50))))))

(declare-fun d!161629 () Bool)

(declare-fun c!143463 () Bool)

(assert (=> d!161629 (= c!143463 (and ((_ is Cons!36293) (t!51010 l!1177)) (= (_1!12453 (h!37740 (t!51010 l!1177))) otherKey!50)))))

(assert (=> d!161629 (= (getValueByKey!763 (t!51010 l!1177) otherKey!50) e!865756)))

(declare-fun b!1554744 () Bool)

(assert (=> b!1554744 (= e!865757 (getValueByKey!763 (t!51010 (t!51010 l!1177)) otherKey!50))))

(declare-fun b!1554745 () Bool)

(assert (=> b!1554745 (= e!865757 None!836)))

(declare-fun b!1554742 () Bool)

(assert (=> b!1554742 (= e!865756 (Some!837 (_2!12453 (h!37740 (t!51010 l!1177)))))))

(assert (= (and d!161629 c!143463) b!1554742))

(assert (= (and d!161629 (not c!143463)) b!1554743))

(assert (= (and b!1554743 c!143464) b!1554744))

(assert (= (and b!1554743 (not c!143464)) b!1554745))

(declare-fun m!1432275 () Bool)

(assert (=> b!1554744 m!1432275))

(assert (=> b!1554531 d!161629))

(declare-fun d!161631 () Bool)

(declare-fun res!1063953 () Bool)

(declare-fun e!865762 () Bool)

(assert (=> d!161631 (=> res!1063953 e!865762)))

(assert (=> d!161631 (= res!1063953 (or ((_ is Nil!36294) (t!51010 l!1177)) ((_ is Nil!36294) (t!51010 (t!51010 l!1177)))))))

(assert (=> d!161631 (= (isStrictlySorted!909 (t!51010 l!1177)) e!865762)))

(declare-fun b!1554752 () Bool)

(declare-fun e!865763 () Bool)

(assert (=> b!1554752 (= e!865762 e!865763)))

(declare-fun res!1063954 () Bool)

(assert (=> b!1554752 (=> (not res!1063954) (not e!865763))))

(assert (=> b!1554752 (= res!1063954 (bvslt (_1!12453 (h!37740 (t!51010 l!1177))) (_1!12453 (h!37740 (t!51010 (t!51010 l!1177))))))))

(declare-fun b!1554753 () Bool)

(assert (=> b!1554753 (= e!865763 (isStrictlySorted!909 (t!51010 (t!51010 l!1177))))))

(assert (= (and d!161631 (not res!1063953)) b!1554752))

(assert (= (and b!1554752 res!1063954) b!1554753))

(declare-fun m!1432277 () Bool)

(assert (=> b!1554753 m!1432277))

(assert (=> b!1554533 d!161631))

(declare-fun b!1554758 () Bool)

(declare-fun e!865766 () Bool)

(declare-fun tp!112246 () Bool)

(assert (=> b!1554758 (= e!865766 (and tp_is_empty!38275 tp!112246))))

(assert (=> b!1554534 (= tp!112237 e!865766)))

(assert (= (and b!1554534 ((_ is Cons!36293) (t!51010 l!1177))) b!1554758))

(check-sat (not b!1554641) (not b!1554753) (not b!1554744) (not bm!71424) (not b!1554697) (not b!1554725) (not b!1554644) (not b!1554758) (not b!1554727) (not bm!71427) tp_is_empty!38275 (not b!1554738) (not b!1554626) (not b!1554651) (not b!1554628) (not d!161593) (not d!161613) (not b!1554699) (not b!1554646) (not b!1554633) (not d!161611))
(check-sat)
