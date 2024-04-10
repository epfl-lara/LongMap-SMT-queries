; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133118 () Bool)

(assert start!133118)

(declare-datatypes ((B!2402 0))(
  ( (B!2403 (val!19287 Int)) )
))
(declare-fun newValue!135 () B!2402)

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun b!1557687 () Bool)

(declare-fun e!867692 () Bool)

(declare-datatypes ((tuple2!24950 0))(
  ( (tuple2!24951 (_1!12486 (_ BitVec 64)) (_2!12486 B!2402)) )
))
(declare-datatypes ((List!36321 0))(
  ( (Nil!36318) (Cons!36317 (h!37763 tuple2!24950) (t!51048 List!36321)) )
))
(declare-fun l!1292 () List!36321)

(declare-fun isStrictlySorted!964 (List!36321) Bool)

(declare-fun insertStrictlySorted!564 (List!36321 (_ BitVec 64) B!2402) List!36321)

(assert (=> b!1557687 (= e!867692 (not (isStrictlySorted!964 (insertStrictlySorted!564 l!1292 newKey!135 newValue!135))))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!827 (List!36321 (_ BitVec 64)) Bool)

(assert (=> b!1557687 (containsKey!827 (insertStrictlySorted!564 (t!51048 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51882 0))(
  ( (Unit!51883) )
))
(declare-fun lt!670727 () Unit!51882)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!7 (List!36321 (_ BitVec 64) B!2402 (_ BitVec 64)) Unit!51882)

(assert (=> b!1557687 (= lt!670727 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!7 (t!51048 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun b!1557688 () Bool)

(declare-fun res!1065428 () Bool)

(assert (=> b!1557688 (=> (not res!1065428) (not e!867692))))

(assert (=> b!1557688 (= res!1065428 (isStrictlySorted!964 (t!51048 l!1292)))))

(declare-fun res!1065430 () Bool)

(assert (=> start!133118 (=> (not res!1065430) (not e!867692))))

(assert (=> start!133118 (= res!1065430 (isStrictlySorted!964 l!1292))))

(assert (=> start!133118 e!867692))

(declare-fun e!867691 () Bool)

(assert (=> start!133118 e!867691))

(assert (=> start!133118 true))

(declare-fun tp_is_empty!38407 () Bool)

(assert (=> start!133118 tp_is_empty!38407))

(declare-fun b!1557689 () Bool)

(declare-fun res!1065427 () Bool)

(assert (=> b!1557689 (=> (not res!1065427) (not e!867692))))

(assert (=> b!1557689 (= res!1065427 (containsKey!827 (t!51048 l!1292) otherKey!62))))

(declare-fun b!1557690 () Bool)

(declare-fun res!1065426 () Bool)

(assert (=> b!1557690 (=> (not res!1065426) (not e!867692))))

(assert (=> b!1557690 (= res!1065426 (containsKey!827 l!1292 otherKey!62))))

(declare-fun b!1557691 () Bool)

(declare-fun tp!112557 () Bool)

(assert (=> b!1557691 (= e!867691 (and tp_is_empty!38407 tp!112557))))

(declare-fun b!1557692 () Bool)

(declare-fun res!1065429 () Bool)

(assert (=> b!1557692 (=> (not res!1065429) (not e!867692))))

(assert (=> b!1557692 (= res!1065429 (and (not (= otherKey!62 newKey!135)) (is-Cons!36317 l!1292) (not (= (_1!12486 (h!37763 l!1292)) otherKey!62))))))

(assert (= (and start!133118 res!1065430) b!1557690))

(assert (= (and b!1557690 res!1065426) b!1557692))

(assert (= (and b!1557692 res!1065429) b!1557688))

(assert (= (and b!1557688 res!1065428) b!1557689))

(assert (= (and b!1557689 res!1065427) b!1557687))

(assert (= (and start!133118 (is-Cons!36317 l!1292)) b!1557691))

(declare-fun m!1434759 () Bool)

(assert (=> b!1557687 m!1434759))

(declare-fun m!1434761 () Bool)

(assert (=> b!1557687 m!1434761))

(assert (=> b!1557687 m!1434759))

(declare-fun m!1434763 () Bool)

(assert (=> b!1557687 m!1434763))

(declare-fun m!1434765 () Bool)

(assert (=> b!1557687 m!1434765))

(assert (=> b!1557687 m!1434763))

(declare-fun m!1434767 () Bool)

(assert (=> b!1557687 m!1434767))

(declare-fun m!1434769 () Bool)

(assert (=> b!1557690 m!1434769))

(declare-fun m!1434771 () Bool)

(assert (=> start!133118 m!1434771))

(declare-fun m!1434773 () Bool)

(assert (=> b!1557688 m!1434773))

(declare-fun m!1434775 () Bool)

(assert (=> b!1557689 m!1434775))

(push 1)

(assert (not b!1557690))

(assert (not b!1557688))

(assert (not start!133118))

(assert (not b!1557691))

(assert (not b!1557687))

(assert (not b!1557689))

(assert tp_is_empty!38407)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162515 () Bool)

(declare-fun res!1065479 () Bool)

(declare-fun e!867723 () Bool)

(assert (=> d!162515 (=> res!1065479 e!867723)))

(assert (=> d!162515 (= res!1065479 (and (is-Cons!36317 (t!51048 l!1292)) (= (_1!12486 (h!37763 (t!51048 l!1292))) otherKey!62)))))

(assert (=> d!162515 (= (containsKey!827 (t!51048 l!1292) otherKey!62) e!867723)))

(declare-fun b!1557747 () Bool)

(declare-fun e!867724 () Bool)

(assert (=> b!1557747 (= e!867723 e!867724)))

(declare-fun res!1065480 () Bool)

(assert (=> b!1557747 (=> (not res!1065480) (not e!867724))))

(assert (=> b!1557747 (= res!1065480 (and (or (not (is-Cons!36317 (t!51048 l!1292))) (bvsle (_1!12486 (h!37763 (t!51048 l!1292))) otherKey!62)) (is-Cons!36317 (t!51048 l!1292)) (bvslt (_1!12486 (h!37763 (t!51048 l!1292))) otherKey!62)))))

(declare-fun b!1557748 () Bool)

(assert (=> b!1557748 (= e!867724 (containsKey!827 (t!51048 (t!51048 l!1292)) otherKey!62))))

(assert (= (and d!162515 (not res!1065479)) b!1557747))

(assert (= (and b!1557747 res!1065480) b!1557748))

(declare-fun m!1434817 () Bool)

(assert (=> b!1557748 m!1434817))

(assert (=> b!1557689 d!162515))

(declare-fun d!162523 () Bool)

(declare-fun res!1065481 () Bool)

(declare-fun e!867725 () Bool)

(assert (=> d!162523 (=> res!1065481 e!867725)))

(assert (=> d!162523 (= res!1065481 (and (is-Cons!36317 l!1292) (= (_1!12486 (h!37763 l!1292)) otherKey!62)))))

(assert (=> d!162523 (= (containsKey!827 l!1292 otherKey!62) e!867725)))

(declare-fun b!1557749 () Bool)

(declare-fun e!867726 () Bool)

(assert (=> b!1557749 (= e!867725 e!867726)))

(declare-fun res!1065482 () Bool)

(assert (=> b!1557749 (=> (not res!1065482) (not e!867726))))

(assert (=> b!1557749 (= res!1065482 (and (or (not (is-Cons!36317 l!1292)) (bvsle (_1!12486 (h!37763 l!1292)) otherKey!62)) (is-Cons!36317 l!1292) (bvslt (_1!12486 (h!37763 l!1292)) otherKey!62)))))

(declare-fun b!1557750 () Bool)

(assert (=> b!1557750 (= e!867726 (containsKey!827 (t!51048 l!1292) otherKey!62))))

(assert (= (and d!162523 (not res!1065481)) b!1557749))

(assert (= (and b!1557749 res!1065482) b!1557750))

(assert (=> b!1557750 m!1434775))

(assert (=> b!1557690 d!162523))

(declare-fun d!162525 () Bool)

(declare-fun res!1065485 () Bool)

(declare-fun e!867729 () Bool)

(assert (=> d!162525 (=> res!1065485 e!867729)))

(assert (=> d!162525 (= res!1065485 (and (is-Cons!36317 (insertStrictlySorted!564 (t!51048 l!1292) newKey!135 newValue!135)) (= (_1!12486 (h!37763 (insertStrictlySorted!564 (t!51048 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162525 (= (containsKey!827 (insertStrictlySorted!564 (t!51048 l!1292) newKey!135 newValue!135) otherKey!62) e!867729)))

(declare-fun b!1557753 () Bool)

(declare-fun e!867730 () Bool)

(assert (=> b!1557753 (= e!867729 e!867730)))

(declare-fun res!1065486 () Bool)

(assert (=> b!1557753 (=> (not res!1065486) (not e!867730))))

(assert (=> b!1557753 (= res!1065486 (and (or (not (is-Cons!36317 (insertStrictlySorted!564 (t!51048 l!1292) newKey!135 newValue!135))) (bvsle (_1!12486 (h!37763 (insertStrictlySorted!564 (t!51048 l!1292) newKey!135 newValue!135))) otherKey!62)) (is-Cons!36317 (insertStrictlySorted!564 (t!51048 l!1292) newKey!135 newValue!135)) (bvslt (_1!12486 (h!37763 (insertStrictlySorted!564 (t!51048 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1557754 () Bool)

(assert (=> b!1557754 (= e!867730 (containsKey!827 (t!51048 (insertStrictlySorted!564 (t!51048 l!1292) newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162525 (not res!1065485)) b!1557753))

(assert (= (and b!1557753 res!1065486) b!1557754))

(declare-fun m!1434819 () Bool)

(assert (=> b!1557754 m!1434819))

(assert (=> b!1557687 d!162525))

(declare-fun e!867778 () List!36321)

(declare-fun b!1557833 () Bool)

(assert (=> b!1557833 (= e!867778 (insertStrictlySorted!564 (t!51048 l!1292) newKey!135 newValue!135))))

(declare-fun b!1557834 () Bool)

(declare-fun c!144031 () Bool)

(assert (=> b!1557834 (= c!144031 (and (is-Cons!36317 l!1292) (bvsgt (_1!12486 (h!37763 l!1292)) newKey!135)))))

(declare-fun e!867777 () List!36321)

(declare-fun e!867776 () List!36321)

(assert (=> b!1557834 (= e!867777 e!867776)))

(declare-fun bm!71707 () Bool)

(declare-fun call!71712 () List!36321)

(declare-fun c!144029 () Bool)

(declare-fun $colon$colon!976 (List!36321 tuple2!24950) List!36321)

(assert (=> bm!71707 (= call!71712 ($colon$colon!976 e!867778 (ite c!144029 (h!37763 l!1292) (tuple2!24951 newKey!135 newValue!135))))))

(declare-fun c!144030 () Bool)

(assert (=> bm!71707 (= c!144030 c!144029)))

(declare-fun lt!670741 () List!36321)

(declare-fun e!867775 () Bool)

(declare-fun b!1557835 () Bool)

(declare-fun contains!10207 (List!36321 tuple2!24950) Bool)

(assert (=> b!1557835 (= e!867775 (contains!10207 lt!670741 (tuple2!24951 newKey!135 newValue!135)))))

(declare-fun b!1557837 () Bool)

(declare-fun res!1065509 () Bool)

(assert (=> b!1557837 (=> (not res!1065509) (not e!867775))))

(assert (=> b!1557837 (= res!1065509 (containsKey!827 lt!670741 newKey!135))))

(declare-fun b!1557838 () Bool)

(declare-fun e!867774 () List!36321)

(assert (=> b!1557838 (= e!867774 call!71712)))

(declare-fun b!1557839 () Bool)

(declare-fun call!71710 () List!36321)

(assert (=> b!1557839 (= e!867776 call!71710)))

(declare-fun bm!71708 () Bool)

(declare-fun call!71711 () List!36321)

(assert (=> bm!71708 (= call!71710 call!71711)))

(declare-fun b!1557840 () Bool)

(assert (=> b!1557840 (= e!867777 call!71711)))

(declare-fun b!1557841 () Bool)

(assert (=> b!1557841 (= e!867776 call!71710)))

(declare-fun b!1557842 () Bool)

(declare-fun c!144028 () Bool)

(assert (=> b!1557842 (= e!867778 (ite c!144028 (t!51048 l!1292) (ite c!144031 (Cons!36317 (h!37763 l!1292) (t!51048 l!1292)) Nil!36318)))))

(declare-fun bm!71709 () Bool)

(assert (=> bm!71709 (= call!71711 call!71712)))

(declare-fun b!1557836 () Bool)

(assert (=> b!1557836 (= e!867774 e!867777)))

(assert (=> b!1557836 (= c!144028 (and (is-Cons!36317 l!1292) (= (_1!12486 (h!37763 l!1292)) newKey!135)))))

(declare-fun d!162527 () Bool)

(assert (=> d!162527 e!867775))

(declare-fun res!1065510 () Bool)

(assert (=> d!162527 (=> (not res!1065510) (not e!867775))))

(assert (=> d!162527 (= res!1065510 (isStrictlySorted!964 lt!670741))))

(assert (=> d!162527 (= lt!670741 e!867774)))

(assert (=> d!162527 (= c!144029 (and (is-Cons!36317 l!1292) (bvslt (_1!12486 (h!37763 l!1292)) newKey!135)))))

(assert (=> d!162527 (isStrictlySorted!964 l!1292)))

(assert (=> d!162527 (= (insertStrictlySorted!564 l!1292 newKey!135 newValue!135) lt!670741)))

(assert (= (and d!162527 c!144029) b!1557838))

(assert (= (and d!162527 (not c!144029)) b!1557836))

(assert (= (and b!1557836 c!144028) b!1557840))

(assert (= (and b!1557836 (not c!144028)) b!1557834))

(assert (= (and b!1557834 c!144031) b!1557839))

(assert (= (and b!1557834 (not c!144031)) b!1557841))

(assert (= (or b!1557839 b!1557841) bm!71708))

(assert (= (or b!1557840 bm!71708) bm!71709))

(assert (= (or b!1557838 bm!71709) bm!71707))

(assert (= (and bm!71707 c!144030) b!1557833))

(assert (= (and bm!71707 (not c!144030)) b!1557842))

(assert (= (and d!162527 res!1065510) b!1557837))

(assert (= (and b!1557837 res!1065509) b!1557835))

(assert (=> b!1557833 m!1434759))

(declare-fun m!1434833 () Bool)

(assert (=> b!1557837 m!1434833))

(declare-fun m!1434835 () Bool)

(assert (=> b!1557835 m!1434835))

(declare-fun m!1434837 () Bool)

(assert (=> d!162527 m!1434837))

(assert (=> d!162527 m!1434771))

(declare-fun m!1434839 () Bool)

(assert (=> bm!71707 m!1434839))

(assert (=> b!1557687 d!162527))

(declare-fun d!162537 () Bool)

(assert (=> d!162537 (containsKey!827 (insertStrictlySorted!564 (t!51048 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-fun lt!670748 () Unit!51882)

(declare-fun choose!2068 (List!36321 (_ BitVec 64) B!2402 (_ BitVec 64)) Unit!51882)

(assert (=> d!162537 (= lt!670748 (choose!2068 (t!51048 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun e!867795 () Bool)

(assert (=> d!162537 e!867795))

(declare-fun res!1065529 () Bool)

(assert (=> d!162537 (=> (not res!1065529) (not e!867795))))

(assert (=> d!162537 (= res!1065529 (isStrictlySorted!964 (t!51048 l!1292)))))

(assert (=> d!162537 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!7 (t!51048 l!1292) newKey!135 newValue!135 otherKey!62) lt!670748)))

(declare-fun b!1557869 () Bool)

(declare-fun res!1065530 () Bool)

(assert (=> b!1557869 (=> (not res!1065530) (not e!867795))))

(assert (=> b!1557869 (= res!1065530 (containsKey!827 (t!51048 l!1292) otherKey!62))))

(declare-fun b!1557870 () Bool)

(assert (=> b!1557870 (= e!867795 (not (= otherKey!62 newKey!135)))))

(assert (= (and d!162537 res!1065529) b!1557869))

(assert (= (and b!1557869 res!1065530) b!1557870))

(assert (=> d!162537 m!1434759))

(assert (=> d!162537 m!1434759))

(assert (=> d!162537 m!1434761))

(declare-fun m!1434853 () Bool)

(assert (=> d!162537 m!1434853))

(assert (=> d!162537 m!1434773))

(assert (=> b!1557869 m!1434775))

(assert (=> b!1557687 d!162537))

(declare-fun d!162545 () Bool)

(declare-fun res!1065555 () Bool)

(declare-fun e!867825 () Bool)

(assert (=> d!162545 (=> res!1065555 e!867825)))

(assert (=> d!162545 (= res!1065555 (or (is-Nil!36318 (insertStrictlySorted!564 l!1292 newKey!135 newValue!135)) (is-Nil!36318 (t!51048 (insertStrictlySorted!564 l!1292 newKey!135 newValue!135)))))))

(assert (=> d!162545 (= (isStrictlySorted!964 (insertStrictlySorted!564 l!1292 newKey!135 newValue!135)) e!867825)))

(declare-fun b!1557915 () Bool)

(declare-fun e!867826 () Bool)

(assert (=> b!1557915 (= e!867825 e!867826)))

(declare-fun res!1065556 () Bool)

(assert (=> b!1557915 (=> (not res!1065556) (not e!867826))))

(assert (=> b!1557915 (= res!1065556 (bvslt (_1!12486 (h!37763 (insertStrictlySorted!564 l!1292 newKey!135 newValue!135))) (_1!12486 (h!37763 (t!51048 (insertStrictlySorted!564 l!1292 newKey!135 newValue!135))))))))

(declare-fun b!1557916 () Bool)

(assert (=> b!1557916 (= e!867826 (isStrictlySorted!964 (t!51048 (insertStrictlySorted!564 l!1292 newKey!135 newValue!135))))))

(assert (= (and d!162545 (not res!1065555)) b!1557915))

(assert (= (and b!1557915 res!1065556) b!1557916))

(declare-fun m!1434873 () Bool)

(assert (=> b!1557916 m!1434873))

(assert (=> b!1557687 d!162545))

(declare-fun e!867832 () List!36321)

(declare-fun b!1557918 () Bool)

(assert (=> b!1557918 (= e!867832 (insertStrictlySorted!564 (t!51048 (t!51048 l!1292)) newKey!135 newValue!135))))

(declare-fun b!1557919 () Bool)

(declare-fun c!144047 () Bool)

(assert (=> b!1557919 (= c!144047 (and (is-Cons!36317 (t!51048 l!1292)) (bvsgt (_1!12486 (h!37763 (t!51048 l!1292))) newKey!135)))))

(declare-fun e!867831 () List!36321)

(declare-fun e!867830 () List!36321)

(assert (=> b!1557919 (= e!867831 e!867830)))

(declare-fun call!71724 () List!36321)

(declare-fun c!144045 () Bool)

(declare-fun bm!71719 () Bool)

(assert (=> bm!71719 (= call!71724 ($colon$colon!976 e!867832 (ite c!144045 (h!37763 (t!51048 l!1292)) (tuple2!24951 newKey!135 newValue!135))))))

(declare-fun c!144046 () Bool)

(assert (=> bm!71719 (= c!144046 c!144045)))

(declare-fun lt!670754 () List!36321)

(declare-fun b!1557920 () Bool)

(declare-fun e!867829 () Bool)

(assert (=> b!1557920 (= e!867829 (contains!10207 lt!670754 (tuple2!24951 newKey!135 newValue!135)))))

(declare-fun b!1557922 () Bool)

(declare-fun res!1065557 () Bool)

(assert (=> b!1557922 (=> (not res!1065557) (not e!867829))))

(assert (=> b!1557922 (= res!1065557 (containsKey!827 lt!670754 newKey!135))))

(declare-fun b!1557923 () Bool)

(declare-fun e!867828 () List!36321)

(assert (=> b!1557923 (= e!867828 call!71724)))

(declare-fun b!1557924 () Bool)

(declare-fun call!71722 () List!36321)

(assert (=> b!1557924 (= e!867830 call!71722)))

(declare-fun bm!71720 () Bool)

(declare-fun call!71723 () List!36321)

(assert (=> bm!71720 (= call!71722 call!71723)))

(declare-fun b!1557925 () Bool)

(assert (=> b!1557925 (= e!867831 call!71723)))

(declare-fun b!1557926 () Bool)

(assert (=> b!1557926 (= e!867830 call!71722)))

(declare-fun c!144044 () Bool)

(declare-fun b!1557927 () Bool)

(assert (=> b!1557927 (= e!867832 (ite c!144044 (t!51048 (t!51048 l!1292)) (ite c!144047 (Cons!36317 (h!37763 (t!51048 l!1292)) (t!51048 (t!51048 l!1292))) Nil!36318)))))

(declare-fun bm!71721 () Bool)

(assert (=> bm!71721 (= call!71723 call!71724)))

(declare-fun b!1557921 () Bool)

(assert (=> b!1557921 (= e!867828 e!867831)))

(assert (=> b!1557921 (= c!144044 (and (is-Cons!36317 (t!51048 l!1292)) (= (_1!12486 (h!37763 (t!51048 l!1292))) newKey!135)))))

(declare-fun d!162559 () Bool)

(assert (=> d!162559 e!867829))

(declare-fun res!1065558 () Bool)

(assert (=> d!162559 (=> (not res!1065558) (not e!867829))))

(assert (=> d!162559 (= res!1065558 (isStrictlySorted!964 lt!670754))))

(assert (=> d!162559 (= lt!670754 e!867828)))

(assert (=> d!162559 (= c!144045 (and (is-Cons!36317 (t!51048 l!1292)) (bvslt (_1!12486 (h!37763 (t!51048 l!1292))) newKey!135)))))

(assert (=> d!162559 (isStrictlySorted!964 (t!51048 l!1292))))

(assert (=> d!162559 (= (insertStrictlySorted!564 (t!51048 l!1292) newKey!135 newValue!135) lt!670754)))

(assert (= (and d!162559 c!144045) b!1557923))

(assert (= (and d!162559 (not c!144045)) b!1557921))

(assert (= (and b!1557921 c!144044) b!1557925))

(assert (= (and b!1557921 (not c!144044)) b!1557919))

(assert (= (and b!1557919 c!144047) b!1557924))

(assert (= (and b!1557919 (not c!144047)) b!1557926))

(assert (= (or b!1557924 b!1557926) bm!71720))

(assert (= (or b!1557925 bm!71720) bm!71721))

(assert (= (or b!1557923 bm!71721) bm!71719))

(assert (= (and bm!71719 c!144046) b!1557918))

(assert (= (and bm!71719 (not c!144046)) b!1557927))

(assert (= (and d!162559 res!1065558) b!1557922))

(assert (= (and b!1557922 res!1065557) b!1557920))

(declare-fun m!1434885 () Bool)

(assert (=> b!1557918 m!1434885))

(declare-fun m!1434887 () Bool)

(assert (=> b!1557922 m!1434887))

(declare-fun m!1434889 () Bool)

(assert (=> b!1557920 m!1434889))

(declare-fun m!1434891 () Bool)

(assert (=> d!162559 m!1434891))

(assert (=> d!162559 m!1434773))

(declare-fun m!1434893 () Bool)

(assert (=> bm!71719 m!1434893))

(assert (=> b!1557687 d!162559))

(declare-fun d!162561 () Bool)

(declare-fun res!1065559 () Bool)

(declare-fun e!867835 () Bool)

(assert (=> d!162561 (=> res!1065559 e!867835)))

(assert (=> d!162561 (= res!1065559 (or (is-Nil!36318 (t!51048 l!1292)) (is-Nil!36318 (t!51048 (t!51048 l!1292)))))))

(assert (=> d!162561 (= (isStrictlySorted!964 (t!51048 l!1292)) e!867835)))

(declare-fun b!1557932 () Bool)

(declare-fun e!867836 () Bool)

(assert (=> b!1557932 (= e!867835 e!867836)))

(declare-fun res!1065560 () Bool)

(assert (=> b!1557932 (=> (not res!1065560) (not e!867836))))

(assert (=> b!1557932 (= res!1065560 (bvslt (_1!12486 (h!37763 (t!51048 l!1292))) (_1!12486 (h!37763 (t!51048 (t!51048 l!1292))))))))

(declare-fun b!1557933 () Bool)

(assert (=> b!1557933 (= e!867836 (isStrictlySorted!964 (t!51048 (t!51048 l!1292))))))

(assert (= (and d!162561 (not res!1065559)) b!1557932))

(assert (= (and b!1557932 res!1065560) b!1557933))

(declare-fun m!1434895 () Bool)

(assert (=> b!1557933 m!1434895))

(assert (=> b!1557688 d!162561))

(declare-fun d!162563 () Bool)

(declare-fun res!1065561 () Bool)

(declare-fun e!867838 () Bool)

(assert (=> d!162563 (=> res!1065561 e!867838)))

(assert (=> d!162563 (= res!1065561 (or (is-Nil!36318 l!1292) (is-Nil!36318 (t!51048 l!1292))))))

(assert (=> d!162563 (= (isStrictlySorted!964 l!1292) e!867838)))

(declare-fun b!1557935 () Bool)

(declare-fun e!867839 () Bool)

(assert (=> b!1557935 (= e!867838 e!867839)))

(declare-fun res!1065562 () Bool)

(assert (=> b!1557935 (=> (not res!1065562) (not e!867839))))

(assert (=> b!1557935 (= res!1065562 (bvslt (_1!12486 (h!37763 l!1292)) (_1!12486 (h!37763 (t!51048 l!1292)))))))

(declare-fun b!1557936 () Bool)

(assert (=> b!1557936 (= e!867839 (isStrictlySorted!964 (t!51048 l!1292)))))

(assert (= (and d!162563 (not res!1065561)) b!1557935))

(assert (= (and b!1557935 res!1065562) b!1557936))

(assert (=> b!1557936 m!1434773))

(assert (=> start!133118 d!162563))

(declare-fun b!1557941 () Bool)

(declare-fun e!867842 () Bool)

(declare-fun tp!112572 () Bool)

(assert (=> b!1557941 (= e!867842 (and tp_is_empty!38407 tp!112572))))

(assert (=> b!1557691 (= tp!112557 e!867842)))

(assert (= (and b!1557691 (is-Cons!36317 (t!51048 l!1292))) b!1557941))

(push 1)

