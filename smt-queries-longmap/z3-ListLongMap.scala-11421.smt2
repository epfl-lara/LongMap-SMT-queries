; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133120 () Bool)

(assert start!133120)

(declare-fun b!1557705 () Bool)

(declare-fun res!1065441 () Bool)

(declare-fun e!867698 () Bool)

(assert (=> b!1557705 (=> (not res!1065441) (not e!867698))))

(declare-datatypes ((B!2404 0))(
  ( (B!2405 (val!19288 Int)) )
))
(declare-datatypes ((tuple2!24952 0))(
  ( (tuple2!24953 (_1!12487 (_ BitVec 64)) (_2!12487 B!2404)) )
))
(declare-datatypes ((List!36322 0))(
  ( (Nil!36319) (Cons!36318 (h!37764 tuple2!24952) (t!51049 List!36322)) )
))
(declare-fun l!1292 () List!36322)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!828 (List!36322 (_ BitVec 64)) Bool)

(assert (=> b!1557705 (= res!1065441 (containsKey!828 (t!51049 l!1292) otherKey!62))))

(declare-fun b!1557706 () Bool)

(declare-fun res!1065445 () Bool)

(assert (=> b!1557706 (=> (not res!1065445) (not e!867698))))

(declare-fun isStrictlySorted!965 (List!36322) Bool)

(assert (=> b!1557706 (= res!1065445 (isStrictlySorted!965 (t!51049 l!1292)))))

(declare-fun b!1557707 () Bool)

(declare-fun e!867697 () Bool)

(declare-fun tp_is_empty!38409 () Bool)

(declare-fun tp!112560 () Bool)

(assert (=> b!1557707 (= e!867697 (and tp_is_empty!38409 tp!112560))))

(declare-fun newValue!135 () B!2404)

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun b!1557708 () Bool)

(declare-fun insertStrictlySorted!565 (List!36322 (_ BitVec 64) B!2404) List!36322)

(assert (=> b!1557708 (= e!867698 (not (isStrictlySorted!965 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135))))))

(assert (=> b!1557708 (containsKey!828 (insertStrictlySorted!565 (t!51049 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51884 0))(
  ( (Unit!51885) )
))
(declare-fun lt!670730 () Unit!51884)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!8 (List!36322 (_ BitVec 64) B!2404 (_ BitVec 64)) Unit!51884)

(assert (=> b!1557708 (= lt!670730 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!8 (t!51049 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun res!1065443 () Bool)

(assert (=> start!133120 (=> (not res!1065443) (not e!867698))))

(assert (=> start!133120 (= res!1065443 (isStrictlySorted!965 l!1292))))

(assert (=> start!133120 e!867698))

(assert (=> start!133120 e!867697))

(assert (=> start!133120 true))

(assert (=> start!133120 tp_is_empty!38409))

(declare-fun b!1557709 () Bool)

(declare-fun res!1065444 () Bool)

(assert (=> b!1557709 (=> (not res!1065444) (not e!867698))))

(get-info :version)

(assert (=> b!1557709 (= res!1065444 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36318) l!1292) (not (= (_1!12487 (h!37764 l!1292)) otherKey!62))))))

(declare-fun b!1557710 () Bool)

(declare-fun res!1065442 () Bool)

(assert (=> b!1557710 (=> (not res!1065442) (not e!867698))))

(assert (=> b!1557710 (= res!1065442 (containsKey!828 l!1292 otherKey!62))))

(assert (= (and start!133120 res!1065443) b!1557710))

(assert (= (and b!1557710 res!1065442) b!1557709))

(assert (= (and b!1557709 res!1065444) b!1557706))

(assert (= (and b!1557706 res!1065445) b!1557705))

(assert (= (and b!1557705 res!1065441) b!1557708))

(assert (= (and start!133120 ((_ is Cons!36318) l!1292)) b!1557707))

(declare-fun m!1434777 () Bool)

(assert (=> b!1557705 m!1434777))

(declare-fun m!1434779 () Bool)

(assert (=> b!1557710 m!1434779))

(declare-fun m!1434781 () Bool)

(assert (=> b!1557708 m!1434781))

(declare-fun m!1434783 () Bool)

(assert (=> b!1557708 m!1434783))

(assert (=> b!1557708 m!1434781))

(declare-fun m!1434785 () Bool)

(assert (=> b!1557708 m!1434785))

(declare-fun m!1434787 () Bool)

(assert (=> b!1557708 m!1434787))

(assert (=> b!1557708 m!1434785))

(declare-fun m!1434789 () Bool)

(assert (=> b!1557708 m!1434789))

(declare-fun m!1434791 () Bool)

(assert (=> start!133120 m!1434791))

(declare-fun m!1434793 () Bool)

(assert (=> b!1557706 m!1434793))

(check-sat (not b!1557707) (not b!1557705) (not start!133120) (not b!1557708) tp_is_empty!38409 (not b!1557710) (not b!1557706))
(check-sat)
(get-model)

(declare-fun d!162511 () Bool)

(declare-fun res!1065465 () Bool)

(declare-fun e!867709 () Bool)

(assert (=> d!162511 (=> res!1065465 e!867709)))

(assert (=> d!162511 (= res!1065465 (and ((_ is Cons!36318) (insertStrictlySorted!565 (t!51049 l!1292) newKey!135 newValue!135)) (= (_1!12487 (h!37764 (insertStrictlySorted!565 (t!51049 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162511 (= (containsKey!828 (insertStrictlySorted!565 (t!51049 l!1292) newKey!135 newValue!135) otherKey!62) e!867709)))

(declare-fun b!1557733 () Bool)

(declare-fun e!867710 () Bool)

(assert (=> b!1557733 (= e!867709 e!867710)))

(declare-fun res!1065466 () Bool)

(assert (=> b!1557733 (=> (not res!1065466) (not e!867710))))

(assert (=> b!1557733 (= res!1065466 (and (or (not ((_ is Cons!36318) (insertStrictlySorted!565 (t!51049 l!1292) newKey!135 newValue!135))) (bvsle (_1!12487 (h!37764 (insertStrictlySorted!565 (t!51049 l!1292) newKey!135 newValue!135))) otherKey!62)) ((_ is Cons!36318) (insertStrictlySorted!565 (t!51049 l!1292) newKey!135 newValue!135)) (bvslt (_1!12487 (h!37764 (insertStrictlySorted!565 (t!51049 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1557734 () Bool)

(assert (=> b!1557734 (= e!867710 (containsKey!828 (t!51049 (insertStrictlySorted!565 (t!51049 l!1292) newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162511 (not res!1065465)) b!1557733))

(assert (= (and b!1557733 res!1065466) b!1557734))

(declare-fun m!1434813 () Bool)

(assert (=> b!1557734 m!1434813))

(assert (=> b!1557708 d!162511))

(declare-fun b!1557811 () Bool)

(declare-fun e!867764 () List!36322)

(declare-fun call!71704 () List!36322)

(assert (=> b!1557811 (= e!867764 call!71704)))

(declare-fun b!1557812 () Bool)

(declare-fun e!867768 () List!36322)

(declare-fun call!71705 () List!36322)

(assert (=> b!1557812 (= e!867768 call!71705)))

(declare-fun bm!71700 () Bool)

(declare-fun call!71703 () List!36322)

(declare-fun e!867763 () List!36322)

(declare-fun c!144022 () Bool)

(declare-fun $colon$colon!975 (List!36322 tuple2!24952) List!36322)

(assert (=> bm!71700 (= call!71703 ($colon$colon!975 e!867763 (ite c!144022 (h!37764 l!1292) (tuple2!24953 newKey!135 newValue!135))))))

(declare-fun c!144025 () Bool)

(assert (=> bm!71700 (= c!144025 c!144022)))

(declare-fun d!162517 () Bool)

(declare-fun e!867767 () Bool)

(assert (=> d!162517 e!867767))

(declare-fun res!1065499 () Bool)

(assert (=> d!162517 (=> (not res!1065499) (not e!867767))))

(declare-fun lt!670740 () List!36322)

(assert (=> d!162517 (= res!1065499 (isStrictlySorted!965 lt!670740))))

(declare-fun e!867769 () List!36322)

(assert (=> d!162517 (= lt!670740 e!867769)))

(assert (=> d!162517 (= c!144022 (and ((_ is Cons!36318) l!1292) (bvslt (_1!12487 (h!37764 l!1292)) newKey!135)))))

(assert (=> d!162517 (isStrictlySorted!965 l!1292)))

(assert (=> d!162517 (= (insertStrictlySorted!565 l!1292 newKey!135 newValue!135) lt!670740)))

(declare-fun c!144023 () Bool)

(declare-fun c!144024 () Bool)

(declare-fun b!1557813 () Bool)

(assert (=> b!1557813 (= e!867763 (ite c!144023 (t!51049 l!1292) (ite c!144024 (Cons!36318 (h!37764 l!1292) (t!51049 l!1292)) Nil!36319)))))

(declare-fun b!1557814 () Bool)

(declare-fun contains!10206 (List!36322 tuple2!24952) Bool)

(assert (=> b!1557814 (= e!867767 (contains!10206 lt!670740 (tuple2!24953 newKey!135 newValue!135)))))

(declare-fun b!1557815 () Bool)

(assert (=> b!1557815 (= e!867763 (insertStrictlySorted!565 (t!51049 l!1292) newKey!135 newValue!135))))

(declare-fun bm!71701 () Bool)

(assert (=> bm!71701 (= call!71704 call!71705)))

(declare-fun b!1557816 () Bool)

(assert (=> b!1557816 (= e!867769 call!71703)))

(declare-fun b!1557817 () Bool)

(assert (=> b!1557817 (= e!867769 e!867768)))

(assert (=> b!1557817 (= c!144023 (and ((_ is Cons!36318) l!1292) (= (_1!12487 (h!37764 l!1292)) newKey!135)))))

(declare-fun b!1557818 () Bool)

(declare-fun res!1065502 () Bool)

(assert (=> b!1557818 (=> (not res!1065502) (not e!867767))))

(assert (=> b!1557818 (= res!1065502 (containsKey!828 lt!670740 newKey!135))))

(declare-fun b!1557820 () Bool)

(assert (=> b!1557820 (= c!144024 (and ((_ is Cons!36318) l!1292) (bvsgt (_1!12487 (h!37764 l!1292)) newKey!135)))))

(assert (=> b!1557820 (= e!867768 e!867764)))

(declare-fun bm!71702 () Bool)

(assert (=> bm!71702 (= call!71705 call!71703)))

(declare-fun b!1557822 () Bool)

(assert (=> b!1557822 (= e!867764 call!71704)))

(assert (= (and d!162517 c!144022) b!1557816))

(assert (= (and d!162517 (not c!144022)) b!1557817))

(assert (= (and b!1557817 c!144023) b!1557812))

(assert (= (and b!1557817 (not c!144023)) b!1557820))

(assert (= (and b!1557820 c!144024) b!1557811))

(assert (= (and b!1557820 (not c!144024)) b!1557822))

(assert (= (or b!1557811 b!1557822) bm!71701))

(assert (= (or b!1557812 bm!71701) bm!71702))

(assert (= (or b!1557816 bm!71702) bm!71700))

(assert (= (and bm!71700 c!144025) b!1557815))

(assert (= (and bm!71700 (not c!144025)) b!1557813))

(assert (= (and d!162517 res!1065499) b!1557818))

(assert (= (and b!1557818 res!1065502) b!1557814))

(assert (=> b!1557815 m!1434781))

(declare-fun m!1434825 () Bool)

(assert (=> d!162517 m!1434825))

(assert (=> d!162517 m!1434791))

(declare-fun m!1434827 () Bool)

(assert (=> b!1557818 m!1434827))

(declare-fun m!1434829 () Bool)

(assert (=> bm!71700 m!1434829))

(declare-fun m!1434831 () Bool)

(assert (=> b!1557814 m!1434831))

(assert (=> b!1557708 d!162517))

(declare-fun d!162535 () Bool)

(assert (=> d!162535 (containsKey!828 (insertStrictlySorted!565 (t!51049 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-fun lt!670744 () Unit!51884)

(declare-fun choose!2067 (List!36322 (_ BitVec 64) B!2404 (_ BitVec 64)) Unit!51884)

(assert (=> d!162535 (= lt!670744 (choose!2067 (t!51049 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun e!867781 () Bool)

(assert (=> d!162535 e!867781))

(declare-fun res!1065515 () Bool)

(assert (=> d!162535 (=> (not res!1065515) (not e!867781))))

(assert (=> d!162535 (= res!1065515 (isStrictlySorted!965 (t!51049 l!1292)))))

(assert (=> d!162535 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!8 (t!51049 l!1292) newKey!135 newValue!135 otherKey!62) lt!670744)))

(declare-fun b!1557847 () Bool)

(declare-fun res!1065516 () Bool)

(assert (=> b!1557847 (=> (not res!1065516) (not e!867781))))

(assert (=> b!1557847 (= res!1065516 (containsKey!828 (t!51049 l!1292) otherKey!62))))

(declare-fun b!1557848 () Bool)

(assert (=> b!1557848 (= e!867781 (not (= otherKey!62 newKey!135)))))

(assert (= (and d!162535 res!1065515) b!1557847))

(assert (= (and b!1557847 res!1065516) b!1557848))

(assert (=> d!162535 m!1434781))

(assert (=> d!162535 m!1434781))

(assert (=> d!162535 m!1434783))

(declare-fun m!1434841 () Bool)

(assert (=> d!162535 m!1434841))

(assert (=> d!162535 m!1434793))

(assert (=> b!1557847 m!1434777))

(assert (=> b!1557708 d!162535))

(declare-fun d!162539 () Bool)

(declare-fun res!1065527 () Bool)

(declare-fun e!867793 () Bool)

(assert (=> d!162539 (=> res!1065527 e!867793)))

(assert (=> d!162539 (= res!1065527 (or ((_ is Nil!36319) (insertStrictlySorted!565 l!1292 newKey!135 newValue!135)) ((_ is Nil!36319) (t!51049 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135)))))))

(assert (=> d!162539 (= (isStrictlySorted!965 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135)) e!867793)))

(declare-fun b!1557867 () Bool)

(declare-fun e!867794 () Bool)

(assert (=> b!1557867 (= e!867793 e!867794)))

(declare-fun res!1065528 () Bool)

(assert (=> b!1557867 (=> (not res!1065528) (not e!867794))))

(assert (=> b!1557867 (= res!1065528 (bvslt (_1!12487 (h!37764 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135))) (_1!12487 (h!37764 (t!51049 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135))))))))

(declare-fun b!1557868 () Bool)

(assert (=> b!1557868 (= e!867794 (isStrictlySorted!965 (t!51049 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135))))))

(assert (= (and d!162539 (not res!1065527)) b!1557867))

(assert (= (and b!1557867 res!1065528) b!1557868))

(declare-fun m!1434851 () Bool)

(assert (=> b!1557868 m!1434851))

(assert (=> b!1557708 d!162539))

(declare-fun b!1557871 () Bool)

(declare-fun e!867797 () List!36322)

(declare-fun call!71717 () List!36322)

(assert (=> b!1557871 (= e!867797 call!71717)))

(declare-fun b!1557872 () Bool)

(declare-fun e!867799 () List!36322)

(declare-fun call!71718 () List!36322)

(assert (=> b!1557872 (= e!867799 call!71718)))

(declare-fun call!71716 () List!36322)

(declare-fun c!144036 () Bool)

(declare-fun bm!71713 () Bool)

(declare-fun e!867796 () List!36322)

(assert (=> bm!71713 (= call!71716 ($colon$colon!975 e!867796 (ite c!144036 (h!37764 (t!51049 l!1292)) (tuple2!24953 newKey!135 newValue!135))))))

(declare-fun c!144039 () Bool)

(assert (=> bm!71713 (= c!144039 c!144036)))

(declare-fun d!162543 () Bool)

(declare-fun e!867798 () Bool)

(assert (=> d!162543 e!867798))

(declare-fun res!1065531 () Bool)

(assert (=> d!162543 (=> (not res!1065531) (not e!867798))))

(declare-fun lt!670749 () List!36322)

(assert (=> d!162543 (= res!1065531 (isStrictlySorted!965 lt!670749))))

(declare-fun e!867800 () List!36322)

(assert (=> d!162543 (= lt!670749 e!867800)))

(assert (=> d!162543 (= c!144036 (and ((_ is Cons!36318) (t!51049 l!1292)) (bvslt (_1!12487 (h!37764 (t!51049 l!1292))) newKey!135)))))

(assert (=> d!162543 (isStrictlySorted!965 (t!51049 l!1292))))

(assert (=> d!162543 (= (insertStrictlySorted!565 (t!51049 l!1292) newKey!135 newValue!135) lt!670749)))

(declare-fun b!1557873 () Bool)

(declare-fun c!144038 () Bool)

(declare-fun c!144037 () Bool)

(assert (=> b!1557873 (= e!867796 (ite c!144037 (t!51049 (t!51049 l!1292)) (ite c!144038 (Cons!36318 (h!37764 (t!51049 l!1292)) (t!51049 (t!51049 l!1292))) Nil!36319)))))

(declare-fun b!1557874 () Bool)

(assert (=> b!1557874 (= e!867798 (contains!10206 lt!670749 (tuple2!24953 newKey!135 newValue!135)))))

(declare-fun b!1557875 () Bool)

(assert (=> b!1557875 (= e!867796 (insertStrictlySorted!565 (t!51049 (t!51049 l!1292)) newKey!135 newValue!135))))

(declare-fun bm!71714 () Bool)

(assert (=> bm!71714 (= call!71717 call!71718)))

(declare-fun b!1557876 () Bool)

(assert (=> b!1557876 (= e!867800 call!71716)))

(declare-fun b!1557877 () Bool)

(assert (=> b!1557877 (= e!867800 e!867799)))

(assert (=> b!1557877 (= c!144037 (and ((_ is Cons!36318) (t!51049 l!1292)) (= (_1!12487 (h!37764 (t!51049 l!1292))) newKey!135)))))

(declare-fun b!1557878 () Bool)

(declare-fun res!1065532 () Bool)

(assert (=> b!1557878 (=> (not res!1065532) (not e!867798))))

(assert (=> b!1557878 (= res!1065532 (containsKey!828 lt!670749 newKey!135))))

(declare-fun b!1557879 () Bool)

(assert (=> b!1557879 (= c!144038 (and ((_ is Cons!36318) (t!51049 l!1292)) (bvsgt (_1!12487 (h!37764 (t!51049 l!1292))) newKey!135)))))

(assert (=> b!1557879 (= e!867799 e!867797)))

(declare-fun bm!71715 () Bool)

(assert (=> bm!71715 (= call!71718 call!71716)))

(declare-fun b!1557880 () Bool)

(assert (=> b!1557880 (= e!867797 call!71717)))

(assert (= (and d!162543 c!144036) b!1557876))

(assert (= (and d!162543 (not c!144036)) b!1557877))

(assert (= (and b!1557877 c!144037) b!1557872))

(assert (= (and b!1557877 (not c!144037)) b!1557879))

(assert (= (and b!1557879 c!144038) b!1557871))

(assert (= (and b!1557879 (not c!144038)) b!1557880))

(assert (= (or b!1557871 b!1557880) bm!71714))

(assert (= (or b!1557872 bm!71714) bm!71715))

(assert (= (or b!1557876 bm!71715) bm!71713))

(assert (= (and bm!71713 c!144039) b!1557875))

(assert (= (and bm!71713 (not c!144039)) b!1557873))

(assert (= (and d!162543 res!1065531) b!1557878))

(assert (= (and b!1557878 res!1065532) b!1557874))

(declare-fun m!1434855 () Bool)

(assert (=> b!1557875 m!1434855))

(declare-fun m!1434857 () Bool)

(assert (=> d!162543 m!1434857))

(assert (=> d!162543 m!1434793))

(declare-fun m!1434859 () Bool)

(assert (=> b!1557878 m!1434859))

(declare-fun m!1434861 () Bool)

(assert (=> bm!71713 m!1434861))

(declare-fun m!1434863 () Bool)

(assert (=> b!1557874 m!1434863))

(assert (=> b!1557708 d!162543))

(declare-fun d!162547 () Bool)

(declare-fun res!1065537 () Bool)

(declare-fun e!867803 () Bool)

(assert (=> d!162547 (=> res!1065537 e!867803)))

(assert (=> d!162547 (= res!1065537 (and ((_ is Cons!36318) (t!51049 l!1292)) (= (_1!12487 (h!37764 (t!51049 l!1292))) otherKey!62)))))

(assert (=> d!162547 (= (containsKey!828 (t!51049 l!1292) otherKey!62) e!867803)))

(declare-fun b!1557885 () Bool)

(declare-fun e!867804 () Bool)

(assert (=> b!1557885 (= e!867803 e!867804)))

(declare-fun res!1065538 () Bool)

(assert (=> b!1557885 (=> (not res!1065538) (not e!867804))))

(assert (=> b!1557885 (= res!1065538 (and (or (not ((_ is Cons!36318) (t!51049 l!1292))) (bvsle (_1!12487 (h!37764 (t!51049 l!1292))) otherKey!62)) ((_ is Cons!36318) (t!51049 l!1292)) (bvslt (_1!12487 (h!37764 (t!51049 l!1292))) otherKey!62)))))

(declare-fun b!1557886 () Bool)

(assert (=> b!1557886 (= e!867804 (containsKey!828 (t!51049 (t!51049 l!1292)) otherKey!62))))

(assert (= (and d!162547 (not res!1065537)) b!1557885))

(assert (= (and b!1557885 res!1065538) b!1557886))

(declare-fun m!1434865 () Bool)

(assert (=> b!1557886 m!1434865))

(assert (=> b!1557705 d!162547))

(declare-fun d!162549 () Bool)

(declare-fun res!1065539 () Bool)

(declare-fun e!867805 () Bool)

(assert (=> d!162549 (=> res!1065539 e!867805)))

(assert (=> d!162549 (= res!1065539 (and ((_ is Cons!36318) l!1292) (= (_1!12487 (h!37764 l!1292)) otherKey!62)))))

(assert (=> d!162549 (= (containsKey!828 l!1292 otherKey!62) e!867805)))

(declare-fun b!1557887 () Bool)

(declare-fun e!867806 () Bool)

(assert (=> b!1557887 (= e!867805 e!867806)))

(declare-fun res!1065540 () Bool)

(assert (=> b!1557887 (=> (not res!1065540) (not e!867806))))

(assert (=> b!1557887 (= res!1065540 (and (or (not ((_ is Cons!36318) l!1292)) (bvsle (_1!12487 (h!37764 l!1292)) otherKey!62)) ((_ is Cons!36318) l!1292) (bvslt (_1!12487 (h!37764 l!1292)) otherKey!62)))))

(declare-fun b!1557888 () Bool)

(assert (=> b!1557888 (= e!867806 (containsKey!828 (t!51049 l!1292) otherKey!62))))

(assert (= (and d!162549 (not res!1065539)) b!1557887))

(assert (= (and b!1557887 res!1065540) b!1557888))

(assert (=> b!1557888 m!1434777))

(assert (=> b!1557710 d!162549))

(declare-fun d!162551 () Bool)

(declare-fun res!1065543 () Bool)

(declare-fun e!867809 () Bool)

(assert (=> d!162551 (=> res!1065543 e!867809)))

(assert (=> d!162551 (= res!1065543 (or ((_ is Nil!36319) (t!51049 l!1292)) ((_ is Nil!36319) (t!51049 (t!51049 l!1292)))))))

(assert (=> d!162551 (= (isStrictlySorted!965 (t!51049 l!1292)) e!867809)))

(declare-fun b!1557891 () Bool)

(declare-fun e!867810 () Bool)

(assert (=> b!1557891 (= e!867809 e!867810)))

(declare-fun res!1065544 () Bool)

(assert (=> b!1557891 (=> (not res!1065544) (not e!867810))))

(assert (=> b!1557891 (= res!1065544 (bvslt (_1!12487 (h!37764 (t!51049 l!1292))) (_1!12487 (h!37764 (t!51049 (t!51049 l!1292))))))))

(declare-fun b!1557892 () Bool)

(assert (=> b!1557892 (= e!867810 (isStrictlySorted!965 (t!51049 (t!51049 l!1292))))))

(assert (= (and d!162551 (not res!1065543)) b!1557891))

(assert (= (and b!1557891 res!1065544) b!1557892))

(declare-fun m!1434867 () Bool)

(assert (=> b!1557892 m!1434867))

(assert (=> b!1557706 d!162551))

(declare-fun d!162553 () Bool)

(declare-fun res!1065549 () Bool)

(declare-fun e!867814 () Bool)

(assert (=> d!162553 (=> res!1065549 e!867814)))

(assert (=> d!162553 (= res!1065549 (or ((_ is Nil!36319) l!1292) ((_ is Nil!36319) (t!51049 l!1292))))))

(assert (=> d!162553 (= (isStrictlySorted!965 l!1292) e!867814)))

(declare-fun b!1557897 () Bool)

(declare-fun e!867815 () Bool)

(assert (=> b!1557897 (= e!867814 e!867815)))

(declare-fun res!1065550 () Bool)

(assert (=> b!1557897 (=> (not res!1065550) (not e!867815))))

(assert (=> b!1557897 (= res!1065550 (bvslt (_1!12487 (h!37764 l!1292)) (_1!12487 (h!37764 (t!51049 l!1292)))))))

(declare-fun b!1557898 () Bool)

(assert (=> b!1557898 (= e!867815 (isStrictlySorted!965 (t!51049 l!1292)))))

(assert (= (and d!162553 (not res!1065549)) b!1557897))

(assert (= (and b!1557897 res!1065550) b!1557898))

(assert (=> b!1557898 m!1434793))

(assert (=> start!133120 d!162553))

(declare-fun b!1557917 () Bool)

(declare-fun e!867827 () Bool)

(declare-fun tp!112566 () Bool)

(assert (=> b!1557917 (= e!867827 (and tp_is_empty!38409 tp!112566))))

(assert (=> b!1557707 (= tp!112560 e!867827)))

(assert (= (and b!1557707 ((_ is Cons!36318) (t!51049 l!1292))) b!1557917))

(check-sat (not b!1557878) (not b!1557875) (not d!162535) (not b!1557847) (not d!162517) (not b!1557818) (not b!1557888) (not bm!71700) (not d!162543) (not b!1557814) (not b!1557868) (not b!1557898) (not b!1557917) (not bm!71713) (not b!1557734) (not b!1557886) (not b!1557874) tp_is_empty!38409 (not b!1557815) (not b!1557892))
(check-sat)
