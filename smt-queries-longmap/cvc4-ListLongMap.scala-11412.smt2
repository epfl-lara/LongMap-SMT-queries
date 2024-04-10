; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132900 () Bool)

(assert start!132900)

(declare-fun b!1556298 () Bool)

(declare-fun e!866788 () Bool)

(declare-fun tp_is_empty!38363 () Bool)

(declare-fun tp!112431 () Bool)

(assert (=> b!1556298 (= e!866788 (and tp_is_empty!38363 tp!112431))))

(declare-fun b!1556300 () Bool)

(declare-fun res!1064743 () Bool)

(declare-fun e!866789 () Bool)

(assert (=> b!1556300 (=> (not res!1064743) (not e!866789))))

(declare-datatypes ((B!2352 0))(
  ( (B!2353 (val!19262 Int)) )
))
(declare-datatypes ((tuple2!24900 0))(
  ( (tuple2!24901 (_1!12461 (_ BitVec 64)) (_2!12461 B!2352)) )
))
(declare-datatypes ((List!36296 0))(
  ( (Nil!36293) (Cons!36292 (h!37738 tuple2!24900) (t!51017 List!36296)) )
))
(declare-fun l!1177 () List!36296)

(declare-fun isStrictlySorted!949 (List!36296) Bool)

(assert (=> b!1556300 (= res!1064743 (isStrictlySorted!949 (t!51017 l!1177)))))

(declare-fun b!1556301 () Bool)

(declare-fun res!1064739 () Bool)

(assert (=> b!1556301 (=> (not res!1064739) (not e!866789))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1556301 (= res!1064739 (and (not (= newKey!105 otherKey!50)) (is-Cons!36292 l!1177) (not (= (_1!12461 (h!37738 l!1177)) otherKey!50))))))

(declare-fun b!1556302 () Bool)

(declare-fun e!866786 () Bool)

(assert (=> b!1556302 (= e!866789 (not e!866786))))

(declare-fun res!1064742 () Bool)

(assert (=> b!1556302 (=> (not res!1064742) (not e!866786))))

(declare-fun lt!670416 () List!36296)

(declare-fun containsKey!811 (List!36296 (_ BitVec 64)) Bool)

(assert (=> b!1556302 (= res!1064742 (= (containsKey!811 lt!670416 otherKey!50) (containsKey!811 l!1177 otherKey!50)))))

(declare-fun newValue!105 () B!2352)

(declare-fun insertStrictlySorted!551 (List!36296 (_ BitVec 64) B!2352) List!36296)

(assert (=> b!1556302 (= lt!670416 (insertStrictlySorted!551 l!1177 newKey!105 newValue!105))))

(declare-fun e!866787 () Bool)

(assert (=> b!1556302 e!866787))

(declare-fun res!1064741 () Bool)

(assert (=> b!1556302 (=> (not res!1064741) (not e!866787))))

(declare-fun lt!670418 () List!36296)

(assert (=> b!1556302 (= res!1064741 (= (containsKey!811 lt!670418 otherKey!50) (containsKey!811 (t!51017 l!1177) otherKey!50)))))

(assert (=> b!1556302 (= lt!670418 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51842 0))(
  ( (Unit!51843) )
))
(declare-fun lt!670417 () Unit!51842)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!36 (List!36296 (_ BitVec 64) B!2352 (_ BitVec 64)) Unit!51842)

(assert (=> b!1556302 (= lt!670417 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!36 (t!51017 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1556303 () Bool)

(declare-datatypes ((Option!853 0))(
  ( (Some!852 (v!22037 B!2352)) (None!851) )
))
(declare-fun getValueByKey!777 (List!36296 (_ BitVec 64)) Option!853)

(assert (=> b!1556303 (= e!866787 (= (getValueByKey!777 lt!670418 otherKey!50) (getValueByKey!777 (t!51017 l!1177) otherKey!50)))))

(declare-fun res!1064740 () Bool)

(assert (=> start!132900 (=> (not res!1064740) (not e!866789))))

(assert (=> start!132900 (= res!1064740 (isStrictlySorted!949 l!1177))))

(assert (=> start!132900 e!866789))

(assert (=> start!132900 e!866788))

(assert (=> start!132900 true))

(assert (=> start!132900 tp_is_empty!38363))

(declare-fun b!1556299 () Bool)

(assert (=> b!1556299 (= e!866786 (= (getValueByKey!777 lt!670416 otherKey!50) (getValueByKey!777 l!1177 otherKey!50)))))

(assert (= (and start!132900 res!1064740) b!1556301))

(assert (= (and b!1556301 res!1064739) b!1556300))

(assert (= (and b!1556300 res!1064743) b!1556302))

(assert (= (and b!1556302 res!1064741) b!1556303))

(assert (= (and b!1556302 res!1064742) b!1556299))

(assert (= (and start!132900 (is-Cons!36292 l!1177)) b!1556298))

(declare-fun m!1433881 () Bool)

(assert (=> b!1556299 m!1433881))

(declare-fun m!1433883 () Bool)

(assert (=> b!1556299 m!1433883))

(declare-fun m!1433885 () Bool)

(assert (=> b!1556302 m!1433885))

(declare-fun m!1433887 () Bool)

(assert (=> b!1556302 m!1433887))

(declare-fun m!1433889 () Bool)

(assert (=> b!1556302 m!1433889))

(declare-fun m!1433891 () Bool)

(assert (=> b!1556302 m!1433891))

(declare-fun m!1433893 () Bool)

(assert (=> b!1556302 m!1433893))

(declare-fun m!1433895 () Bool)

(assert (=> b!1556302 m!1433895))

(declare-fun m!1433897 () Bool)

(assert (=> b!1556302 m!1433897))

(declare-fun m!1433899 () Bool)

(assert (=> b!1556300 m!1433899))

(declare-fun m!1433901 () Bool)

(assert (=> b!1556303 m!1433901))

(declare-fun m!1433903 () Bool)

(assert (=> b!1556303 m!1433903))

(declare-fun m!1433905 () Bool)

(assert (=> start!132900 m!1433905))

(push 1)

(assert (not b!1556300))

(assert (not b!1556303))

(assert (not start!132900))

(assert (not b!1556299))

(assert tp_is_empty!38363)

(assert (not b!1556298))

(assert (not b!1556302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162105 () Bool)

(declare-fun res!1064748 () Bool)

(declare-fun e!866806 () Bool)

(assert (=> d!162105 (=> res!1064748 e!866806)))

(assert (=> d!162105 (= res!1064748 (or (is-Nil!36293 (t!51017 l!1177)) (is-Nil!36293 (t!51017 (t!51017 l!1177)))))))

(assert (=> d!162105 (= (isStrictlySorted!949 (t!51017 l!1177)) e!866806)))

(declare-fun b!1556332 () Bool)

(declare-fun e!866807 () Bool)

(assert (=> b!1556332 (= e!866806 e!866807)))

(declare-fun res!1064749 () Bool)

(assert (=> b!1556332 (=> (not res!1064749) (not e!866807))))

(assert (=> b!1556332 (= res!1064749 (bvslt (_1!12461 (h!37738 (t!51017 l!1177))) (_1!12461 (h!37738 (t!51017 (t!51017 l!1177))))))))

(declare-fun b!1556333 () Bool)

(assert (=> b!1556333 (= e!866807 (isStrictlySorted!949 (t!51017 (t!51017 l!1177))))))

(assert (= (and d!162105 (not res!1064748)) b!1556332))

(assert (= (and b!1556332 res!1064749) b!1556333))

(declare-fun m!1433913 () Bool)

(assert (=> b!1556333 m!1433913))

(assert (=> b!1556300 d!162105))

(declare-fun b!1556402 () Bool)

(declare-fun e!866855 () List!36296)

(declare-fun call!71601 () List!36296)

(assert (=> b!1556402 (= e!866855 call!71601)))

(declare-fun b!1556403 () Bool)

(declare-fun c!143766 () Bool)

(declare-fun e!866852 () List!36296)

(declare-fun c!143767 () Bool)

(assert (=> b!1556403 (= e!866852 (ite c!143767 (t!51017 l!1177) (ite c!143766 (Cons!36292 (h!37738 l!1177) (t!51017 l!1177)) Nil!36293)))))

(declare-fun c!143764 () Bool)

(declare-fun call!71603 () List!36296)

(declare-fun bm!71597 () Bool)

(declare-fun $colon$colon!967 (List!36296 tuple2!24900) List!36296)

(assert (=> bm!71597 (= call!71603 ($colon$colon!967 e!866852 (ite c!143764 (h!37738 l!1177) (tuple2!24901 newKey!105 newValue!105))))))

(declare-fun c!143769 () Bool)

(assert (=> bm!71597 (= c!143769 c!143764)))

(declare-fun b!1556406 () Bool)

(declare-fun e!866853 () List!36296)

(declare-fun e!866846 () List!36296)

(assert (=> b!1556406 (= e!866853 e!866846)))

(assert (=> b!1556406 (= c!143767 (and (is-Cons!36292 l!1177) (= (_1!12461 (h!37738 l!1177)) newKey!105)))))

(declare-fun b!1556407 () Bool)

(declare-fun call!71599 () List!36296)

(assert (=> b!1556407 (= e!866846 call!71599)))

(declare-fun bm!71601 () Bool)

(assert (=> bm!71601 (= call!71599 call!71603)))

(declare-fun b!1556410 () Bool)

(assert (=> b!1556410 (= e!866852 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105))))

(declare-fun b!1556412 () Bool)

(assert (=> b!1556412 (= c!143766 (and (is-Cons!36292 l!1177) (bvsgt (_1!12461 (h!37738 l!1177)) newKey!105)))))

(assert (=> b!1556412 (= e!866846 e!866855)))

(declare-fun b!1556414 () Bool)

(declare-fun res!1064771 () Bool)

(declare-fun e!866849 () Bool)

(assert (=> b!1556414 (=> (not res!1064771) (not e!866849))))

(declare-fun lt!670425 () List!36296)

(assert (=> b!1556414 (= res!1064771 (containsKey!811 lt!670425 newKey!105))))

(declare-fun b!1556416 () Bool)

(assert (=> b!1556416 (= e!866853 call!71603)))

(declare-fun b!1556418 () Bool)

(assert (=> b!1556418 (= e!866855 call!71601)))

(declare-fun b!1556420 () Bool)

(declare-fun contains!10183 (List!36296 tuple2!24900) Bool)

(assert (=> b!1556420 (= e!866849 (contains!10183 lt!670425 (tuple2!24901 newKey!105 newValue!105)))))

(declare-fun d!162117 () Bool)

(assert (=> d!162117 e!866849))

(declare-fun res!1064770 () Bool)

(assert (=> d!162117 (=> (not res!1064770) (not e!866849))))

(assert (=> d!162117 (= res!1064770 (isStrictlySorted!949 lt!670425))))

(assert (=> d!162117 (= lt!670425 e!866853)))

(assert (=> d!162117 (= c!143764 (and (is-Cons!36292 l!1177) (bvslt (_1!12461 (h!37738 l!1177)) newKey!105)))))

(assert (=> d!162117 (isStrictlySorted!949 l!1177)))

(assert (=> d!162117 (= (insertStrictlySorted!551 l!1177 newKey!105 newValue!105) lt!670425)))

(declare-fun bm!71598 () Bool)

(assert (=> bm!71598 (= call!71601 call!71599)))

(assert (= (and d!162117 c!143764) b!1556416))

(assert (= (and d!162117 (not c!143764)) b!1556406))

(assert (= (and b!1556406 c!143767) b!1556407))

(assert (= (and b!1556406 (not c!143767)) b!1556412))

(assert (= (and b!1556412 c!143766) b!1556418))

(assert (= (and b!1556412 (not c!143766)) b!1556402))

(assert (= (or b!1556418 b!1556402) bm!71598))

(assert (= (or b!1556407 bm!71598) bm!71601))

(assert (= (or b!1556416 bm!71601) bm!71597))

(assert (= (and bm!71597 c!143769) b!1556410))

(assert (= (and bm!71597 (not c!143769)) b!1556403))

(assert (= (and d!162117 res!1064770) b!1556414))

(assert (= (and b!1556414 res!1064771) b!1556420))

(declare-fun m!1433919 () Bool)

(assert (=> bm!71597 m!1433919))

(assert (=> b!1556410 m!1433891))

(declare-fun m!1433923 () Bool)

(assert (=> d!162117 m!1433923))

(assert (=> d!162117 m!1433905))

(declare-fun m!1433927 () Bool)

(assert (=> b!1556414 m!1433927))

(declare-fun m!1433931 () Bool)

(assert (=> b!1556420 m!1433931))

(assert (=> b!1556302 d!162117))

(declare-fun d!162125 () Bool)

(declare-fun e!866872 () Bool)

(assert (=> d!162125 e!866872))

(declare-fun res!1064787 () Bool)

(assert (=> d!162125 (=> (not res!1064787) (not e!866872))))

(assert (=> d!162125 (= res!1064787 (= (containsKey!811 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!811 (t!51017 l!1177) otherKey!50)))))

(declare-fun lt!670430 () Unit!51842)

(declare-fun choose!2062 (List!36296 (_ BitVec 64) B!2352 (_ BitVec 64)) Unit!51842)

(assert (=> d!162125 (= lt!670430 (choose!2062 (t!51017 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!866871 () Bool)

(assert (=> d!162125 e!866871))

(declare-fun res!1064786 () Bool)

(assert (=> d!162125 (=> (not res!1064786) (not e!866871))))

(assert (=> d!162125 (= res!1064786 (isStrictlySorted!949 (t!51017 l!1177)))))

(assert (=> d!162125 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!36 (t!51017 l!1177) newKey!105 newValue!105 otherKey!50) lt!670430)))

(declare-fun b!1556442 () Bool)

(assert (=> b!1556442 (= e!866871 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1556443 () Bool)

(assert (=> b!1556443 (= e!866872 (= (getValueByKey!777 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!777 (t!51017 l!1177) otherKey!50)))))

(assert (= (and d!162125 res!1064786) b!1556442))

(assert (= (and d!162125 res!1064787) b!1556443))

(assert (=> d!162125 m!1433891))

(declare-fun m!1433943 () Bool)

(assert (=> d!162125 m!1433943))

(assert (=> d!162125 m!1433893))

(assert (=> d!162125 m!1433899))

(declare-fun m!1433945 () Bool)

(assert (=> d!162125 m!1433945))

(assert (=> d!162125 m!1433891))

(assert (=> b!1556443 m!1433891))

(assert (=> b!1556443 m!1433891))

(declare-fun m!1433947 () Bool)

(assert (=> b!1556443 m!1433947))

(assert (=> b!1556443 m!1433903))

(assert (=> b!1556302 d!162125))

(declare-fun d!162131 () Bool)

(declare-fun res!1064804 () Bool)

(declare-fun e!866889 () Bool)

(assert (=> d!162131 (=> res!1064804 e!866889)))

(assert (=> d!162131 (= res!1064804 (and (is-Cons!36292 lt!670418) (= (_1!12461 (h!37738 lt!670418)) otherKey!50)))))

(assert (=> d!162131 (= (containsKey!811 lt!670418 otherKey!50) e!866889)))

(declare-fun b!1556460 () Bool)

(declare-fun e!866890 () Bool)

(assert (=> b!1556460 (= e!866889 e!866890)))

(declare-fun res!1064805 () Bool)

(assert (=> b!1556460 (=> (not res!1064805) (not e!866890))))

(assert (=> b!1556460 (= res!1064805 (and (or (not (is-Cons!36292 lt!670418)) (bvsle (_1!12461 (h!37738 lt!670418)) otherKey!50)) (is-Cons!36292 lt!670418) (bvslt (_1!12461 (h!37738 lt!670418)) otherKey!50)))))

(declare-fun b!1556461 () Bool)

(assert (=> b!1556461 (= e!866890 (containsKey!811 (t!51017 lt!670418) otherKey!50))))

(assert (= (and d!162131 (not res!1064804)) b!1556460))

(assert (= (and b!1556460 res!1064805) b!1556461))

(declare-fun m!1433959 () Bool)

(assert (=> b!1556461 m!1433959))

(assert (=> b!1556302 d!162131))

(declare-fun d!162135 () Bool)

(declare-fun res!1064806 () Bool)

(declare-fun e!866891 () Bool)

(assert (=> d!162135 (=> res!1064806 e!866891)))

(assert (=> d!162135 (= res!1064806 (and (is-Cons!36292 lt!670416) (= (_1!12461 (h!37738 lt!670416)) otherKey!50)))))

(assert (=> d!162135 (= (containsKey!811 lt!670416 otherKey!50) e!866891)))

(declare-fun b!1556462 () Bool)

(declare-fun e!866892 () Bool)

(assert (=> b!1556462 (= e!866891 e!866892)))

(declare-fun res!1064807 () Bool)

(assert (=> b!1556462 (=> (not res!1064807) (not e!866892))))

(assert (=> b!1556462 (= res!1064807 (and (or (not (is-Cons!36292 lt!670416)) (bvsle (_1!12461 (h!37738 lt!670416)) otherKey!50)) (is-Cons!36292 lt!670416) (bvslt (_1!12461 (h!37738 lt!670416)) otherKey!50)))))

(declare-fun b!1556463 () Bool)

(assert (=> b!1556463 (= e!866892 (containsKey!811 (t!51017 lt!670416) otherKey!50))))

(assert (= (and d!162135 (not res!1064806)) b!1556462))

(assert (= (and b!1556462 res!1064807) b!1556463))

(declare-fun m!1433963 () Bool)

(assert (=> b!1556463 m!1433963))

(assert (=> b!1556302 d!162135))

(declare-fun d!162139 () Bool)

(declare-fun res!1064810 () Bool)

(declare-fun e!866895 () Bool)

(assert (=> d!162139 (=> res!1064810 e!866895)))

(assert (=> d!162139 (= res!1064810 (and (is-Cons!36292 l!1177) (= (_1!12461 (h!37738 l!1177)) otherKey!50)))))

(assert (=> d!162139 (= (containsKey!811 l!1177 otherKey!50) e!866895)))

(declare-fun b!1556466 () Bool)

(declare-fun e!866896 () Bool)

(assert (=> b!1556466 (= e!866895 e!866896)))

(declare-fun res!1064811 () Bool)

(assert (=> b!1556466 (=> (not res!1064811) (not e!866896))))

(assert (=> b!1556466 (= res!1064811 (and (or (not (is-Cons!36292 l!1177)) (bvsle (_1!12461 (h!37738 l!1177)) otherKey!50)) (is-Cons!36292 l!1177) (bvslt (_1!12461 (h!37738 l!1177)) otherKey!50)))))

(declare-fun b!1556467 () Bool)

(assert (=> b!1556467 (= e!866896 (containsKey!811 (t!51017 l!1177) otherKey!50))))

(assert (= (and d!162139 (not res!1064810)) b!1556466))

(assert (= (and b!1556466 res!1064811) b!1556467))

(assert (=> b!1556467 m!1433893))

(assert (=> b!1556302 d!162139))

(declare-fun b!1556478 () Bool)

(declare-fun e!866906 () List!36296)

(declare-fun call!71612 () List!36296)

(assert (=> b!1556478 (= e!866906 call!71612)))

(declare-fun e!866904 () List!36296)

(declare-fun c!143780 () Bool)

(declare-fun b!1556479 () Bool)

(declare-fun c!143781 () Bool)

(assert (=> b!1556479 (= e!866904 (ite c!143781 (t!51017 (t!51017 l!1177)) (ite c!143780 (Cons!36292 (h!37738 (t!51017 l!1177)) (t!51017 (t!51017 l!1177))) Nil!36293)))))

(declare-fun c!143779 () Bool)

(declare-fun call!71613 () List!36296)

(declare-fun bm!71608 () Bool)

(assert (=> bm!71608 (= call!71613 ($colon$colon!967 e!866904 (ite c!143779 (h!37738 (t!51017 l!1177)) (tuple2!24901 newKey!105 newValue!105))))))

(declare-fun c!143782 () Bool)

(assert (=> bm!71608 (= c!143782 c!143779)))

(declare-fun b!1556480 () Bool)

(declare-fun e!866905 () List!36296)

(declare-fun e!866902 () List!36296)

(assert (=> b!1556480 (= e!866905 e!866902)))

(assert (=> b!1556480 (= c!143781 (and (is-Cons!36292 (t!51017 l!1177)) (= (_1!12461 (h!37738 (t!51017 l!1177))) newKey!105)))))

(declare-fun b!1556481 () Bool)

(declare-fun call!71611 () List!36296)

(assert (=> b!1556481 (= e!866902 call!71611)))

(declare-fun bm!71610 () Bool)

(assert (=> bm!71610 (= call!71611 call!71613)))

(declare-fun b!1556482 () Bool)

(assert (=> b!1556482 (= e!866904 (insertStrictlySorted!551 (t!51017 (t!51017 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1556483 () Bool)

(assert (=> b!1556483 (= c!143780 (and (is-Cons!36292 (t!51017 l!1177)) (bvsgt (_1!12461 (h!37738 (t!51017 l!1177))) newKey!105)))))

(assert (=> b!1556483 (= e!866902 e!866906)))

(declare-fun b!1556484 () Bool)

(declare-fun res!1064815 () Bool)

(declare-fun e!866903 () Bool)

(assert (=> b!1556484 (=> (not res!1064815) (not e!866903))))

(declare-fun lt!670438 () List!36296)

(assert (=> b!1556484 (= res!1064815 (containsKey!811 lt!670438 newKey!105))))

(declare-fun b!1556485 () Bool)

(assert (=> b!1556485 (= e!866905 call!71613)))

(declare-fun b!1556486 () Bool)

(assert (=> b!1556486 (= e!866906 call!71612)))

(declare-fun b!1556487 () Bool)

(assert (=> b!1556487 (= e!866903 (contains!10183 lt!670438 (tuple2!24901 newKey!105 newValue!105)))))

(declare-fun d!162143 () Bool)

(assert (=> d!162143 e!866903))

(declare-fun res!1064814 () Bool)

(assert (=> d!162143 (=> (not res!1064814) (not e!866903))))

(assert (=> d!162143 (= res!1064814 (isStrictlySorted!949 lt!670438))))

(assert (=> d!162143 (= lt!670438 e!866905)))

(assert (=> d!162143 (= c!143779 (and (is-Cons!36292 (t!51017 l!1177)) (bvslt (_1!12461 (h!37738 (t!51017 l!1177))) newKey!105)))))

(assert (=> d!162143 (isStrictlySorted!949 (t!51017 l!1177))))

(assert (=> d!162143 (= (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105) lt!670438)))

(declare-fun bm!71609 () Bool)

(assert (=> bm!71609 (= call!71612 call!71611)))

(assert (= (and d!162143 c!143779) b!1556485))

(assert (= (and d!162143 (not c!143779)) b!1556480))

(assert (= (and b!1556480 c!143781) b!1556481))

(assert (= (and b!1556480 (not c!143781)) b!1556483))

(assert (= (and b!1556483 c!143780) b!1556486))

(assert (= (and b!1556483 (not c!143780)) b!1556478))

(assert (= (or b!1556486 b!1556478) bm!71609))

(assert (= (or b!1556481 bm!71609) bm!71610))

(assert (= (or b!1556485 bm!71610) bm!71608))

(assert (= (and bm!71608 c!143782) b!1556482))

(assert (= (and bm!71608 (not c!143782)) b!1556479))

(assert (= (and d!162143 res!1064814) b!1556484))

(assert (= (and b!1556484 res!1064815) b!1556487))

(declare-fun m!1433975 () Bool)

(assert (=> bm!71608 m!1433975))

(declare-fun m!1433977 () Bool)

(assert (=> b!1556482 m!1433977))

(declare-fun m!1433979 () Bool)

(assert (=> d!162143 m!1433979))

(assert (=> d!162143 m!1433899))

(declare-fun m!1433981 () Bool)

(assert (=> b!1556484 m!1433981))

(declare-fun m!1433983 () Bool)

(assert (=> b!1556487 m!1433983))

(assert (=> b!1556302 d!162143))

(declare-fun d!162147 () Bool)

(declare-fun res!1064822 () Bool)

(declare-fun e!866913 () Bool)

(assert (=> d!162147 (=> res!1064822 e!866913)))

(assert (=> d!162147 (= res!1064822 (and (is-Cons!36292 (t!51017 l!1177)) (= (_1!12461 (h!37738 (t!51017 l!1177))) otherKey!50)))))

(assert (=> d!162147 (= (containsKey!811 (t!51017 l!1177) otherKey!50) e!866913)))

(declare-fun b!1556494 () Bool)

(declare-fun e!866914 () Bool)

(assert (=> b!1556494 (= e!866913 e!866914)))

(declare-fun res!1064823 () Bool)

(assert (=> b!1556494 (=> (not res!1064823) (not e!866914))))

(assert (=> b!1556494 (= res!1064823 (and (or (not (is-Cons!36292 (t!51017 l!1177))) (bvsle (_1!12461 (h!37738 (t!51017 l!1177))) otherKey!50)) (is-Cons!36292 (t!51017 l!1177)) (bvslt (_1!12461 (h!37738 (t!51017 l!1177))) otherKey!50)))))

(declare-fun b!1556495 () Bool)

(assert (=> b!1556495 (= e!866914 (containsKey!811 (t!51017 (t!51017 l!1177)) otherKey!50))))

(assert (= (and d!162147 (not res!1064822)) b!1556494))

(assert (= (and b!1556494 res!1064823) b!1556495))

(declare-fun m!1433987 () Bool)

(assert (=> b!1556495 m!1433987))

(assert (=> b!1556302 d!162147))

(declare-fun b!1556543 () Bool)

(declare-fun e!866944 () Option!853)

(assert (=> b!1556543 (= e!866944 (getValueByKey!777 (t!51017 lt!670418) otherKey!50))))

(declare-fun b!1556544 () Bool)

(assert (=> b!1556544 (= e!866944 None!851)))

(declare-fun d!162151 () Bool)

(declare-fun c!143797 () Bool)

(assert (=> d!162151 (= c!143797 (and (is-Cons!36292 lt!670418) (= (_1!12461 (h!37738 lt!670418)) otherKey!50)))))

(declare-fun e!866943 () Option!853)

(assert (=> d!162151 (= (getValueByKey!777 lt!670418 otherKey!50) e!866943)))

(declare-fun b!1556542 () Bool)

(assert (=> b!1556542 (= e!866943 e!866944)))

(declare-fun c!143798 () Bool)

(assert (=> b!1556542 (= c!143798 (and (is-Cons!36292 lt!670418) (not (= (_1!12461 (h!37738 lt!670418)) otherKey!50))))))

(declare-fun b!1556541 () Bool)

(assert (=> b!1556541 (= e!866943 (Some!852 (_2!12461 (h!37738 lt!670418))))))

(assert (= (and d!162151 c!143797) b!1556541))

(assert (= (and d!162151 (not c!143797)) b!1556542))

(assert (= (and b!1556542 c!143798) b!1556543))

(assert (= (and b!1556542 (not c!143798)) b!1556544))

(declare-fun m!1434009 () Bool)

(assert (=> b!1556543 m!1434009))

(assert (=> b!1556303 d!162151))

(declare-fun b!1556551 () Bool)

(declare-fun e!866948 () Option!853)

(assert (=> b!1556551 (= e!866948 (getValueByKey!777 (t!51017 (t!51017 l!1177)) otherKey!50))))

(declare-fun b!1556552 () Bool)

(assert (=> b!1556552 (= e!866948 None!851)))

(declare-fun d!162165 () Bool)

(declare-fun c!143801 () Bool)

(assert (=> d!162165 (= c!143801 (and (is-Cons!36292 (t!51017 l!1177)) (= (_1!12461 (h!37738 (t!51017 l!1177))) otherKey!50)))))

(declare-fun e!866947 () Option!853)

(assert (=> d!162165 (= (getValueByKey!777 (t!51017 l!1177) otherKey!50) e!866947)))

(declare-fun b!1556550 () Bool)

(assert (=> b!1556550 (= e!866947 e!866948)))

(declare-fun c!143802 () Bool)

(assert (=> b!1556550 (= c!143802 (and (is-Cons!36292 (t!51017 l!1177)) (not (= (_1!12461 (h!37738 (t!51017 l!1177))) otherKey!50))))))

(declare-fun b!1556549 () Bool)

(assert (=> b!1556549 (= e!866947 (Some!852 (_2!12461 (h!37738 (t!51017 l!1177)))))))

(assert (= (and d!162165 c!143801) b!1556549))

(assert (= (and d!162165 (not c!143801)) b!1556550))

(assert (= (and b!1556550 c!143802) b!1556551))

(assert (= (and b!1556550 (not c!143802)) b!1556552))

(declare-fun m!1434013 () Bool)

(assert (=> b!1556551 m!1434013))

(assert (=> b!1556303 d!162165))

(declare-fun d!162169 () Bool)

(declare-fun res!1064836 () Bool)

(declare-fun e!866949 () Bool)

(assert (=> d!162169 (=> res!1064836 e!866949)))

(assert (=> d!162169 (= res!1064836 (or (is-Nil!36293 l!1177) (is-Nil!36293 (t!51017 l!1177))))))

(assert (=> d!162169 (= (isStrictlySorted!949 l!1177) e!866949)))

(declare-fun b!1556553 () Bool)

(declare-fun e!866950 () Bool)

(assert (=> b!1556553 (= e!866949 e!866950)))

(declare-fun res!1064837 () Bool)

(assert (=> b!1556553 (=> (not res!1064837) (not e!866950))))

(assert (=> b!1556553 (= res!1064837 (bvslt (_1!12461 (h!37738 l!1177)) (_1!12461 (h!37738 (t!51017 l!1177)))))))

(declare-fun b!1556554 () Bool)

(assert (=> b!1556554 (= e!866950 (isStrictlySorted!949 (t!51017 l!1177)))))

(assert (= (and d!162169 (not res!1064836)) b!1556553))

(assert (= (and b!1556553 res!1064837) b!1556554))

(assert (=> b!1556554 m!1433899))

(assert (=> start!132900 d!162169))

(declare-fun b!1556557 () Bool)

(declare-fun e!866952 () Option!853)

(assert (=> b!1556557 (= e!866952 (getValueByKey!777 (t!51017 lt!670416) otherKey!50))))

(declare-fun b!1556558 () Bool)

(assert (=> b!1556558 (= e!866952 None!851)))

(declare-fun d!162171 () Bool)

(declare-fun c!143803 () Bool)

(assert (=> d!162171 (= c!143803 (and (is-Cons!36292 lt!670416) (= (_1!12461 (h!37738 lt!670416)) otherKey!50)))))

(declare-fun e!866951 () Option!853)

(assert (=> d!162171 (= (getValueByKey!777 lt!670416 otherKey!50) e!866951)))

(declare-fun b!1556556 () Bool)

(assert (=> b!1556556 (= e!866951 e!866952)))

(declare-fun c!143804 () Bool)

(assert (=> b!1556556 (= c!143804 (and (is-Cons!36292 lt!670416) (not (= (_1!12461 (h!37738 lt!670416)) otherKey!50))))))

(declare-fun b!1556555 () Bool)

(assert (=> b!1556555 (= e!866951 (Some!852 (_2!12461 (h!37738 lt!670416))))))

(assert (= (and d!162171 c!143803) b!1556555))

(assert (= (and d!162171 (not c!143803)) b!1556556))

(assert (= (and b!1556556 c!143804) b!1556557))

(assert (= (and b!1556556 (not c!143804)) b!1556558))

(declare-fun m!1434015 () Bool)

(assert (=> b!1556557 m!1434015))

(assert (=> b!1556299 d!162171))

(declare-fun b!1556561 () Bool)

(declare-fun e!866954 () Option!853)

(assert (=> b!1556561 (= e!866954 (getValueByKey!777 (t!51017 l!1177) otherKey!50))))

(declare-fun b!1556562 () Bool)

(assert (=> b!1556562 (= e!866954 None!851)))

(declare-fun d!162173 () Bool)

(declare-fun c!143805 () Bool)

(assert (=> d!162173 (= c!143805 (and (is-Cons!36292 l!1177) (= (_1!12461 (h!37738 l!1177)) otherKey!50)))))

(declare-fun e!866953 () Option!853)

(assert (=> d!162173 (= (getValueByKey!777 l!1177 otherKey!50) e!866953)))

(declare-fun b!1556560 () Bool)

(assert (=> b!1556560 (= e!866953 e!866954)))

(declare-fun c!143806 () Bool)

(assert (=> b!1556560 (= c!143806 (and (is-Cons!36292 l!1177) (not (= (_1!12461 (h!37738 l!1177)) otherKey!50))))))

(declare-fun b!1556559 () Bool)

(assert (=> b!1556559 (= e!866953 (Some!852 (_2!12461 (h!37738 l!1177))))))

(assert (= (and d!162173 c!143805) b!1556559))

(assert (= (and d!162173 (not c!143805)) b!1556560))

(assert (= (and b!1556560 c!143806) b!1556561))

(assert (= (and b!1556560 (not c!143806)) b!1556562))

(assert (=> b!1556561 m!1433903))

(assert (=> b!1556299 d!162173))

(declare-fun b!1556571 () Bool)

(declare-fun e!866961 () Bool)

(declare-fun tp!112437 () Bool)

(assert (=> b!1556571 (= e!866961 (and tp_is_empty!38363 tp!112437))))

(assert (=> b!1556298 (= tp!112431 e!866961)))

(assert (= (and b!1556298 (is-Cons!36292 (t!51017 l!1177))) b!1556571))

(push 1)

(assert (not b!1556463))

(assert (not b!1556561))

(assert (not b!1556495))

(assert (not b!1556487))

(assert (not b!1556554))

(assert (not d!162125))

(assert (not b!1556484))

(assert (not b!1556467))

(assert (not b!1556461))

(assert (not b!1556443))

(assert (not b!1556410))

(assert (not d!162143))

(assert (not b!1556571))

(assert (not b!1556551))

(assert (not b!1556333))

(assert (not b!1556482))

(assert (not b!1556543))

(assert tp_is_empty!38363)

(assert (not b!1556557))

(assert (not b!1556414))

(assert (not bm!71597))

(assert (not b!1556420))

(assert (not bm!71608))

(assert (not d!162117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162257 () Bool)

(declare-fun res!1064908 () Bool)

(declare-fun e!867059 () Bool)

(assert (=> d!162257 (=> res!1064908 e!867059)))

(assert (=> d!162257 (= res!1064908 (and (is-Cons!36292 (t!51017 lt!670416)) (= (_1!12461 (h!37738 (t!51017 lt!670416))) otherKey!50)))))

(assert (=> d!162257 (= (containsKey!811 (t!51017 lt!670416) otherKey!50) e!867059)))

(declare-fun b!1556701 () Bool)

(declare-fun e!867060 () Bool)

(assert (=> b!1556701 (= e!867059 e!867060)))

(declare-fun res!1064909 () Bool)

(assert (=> b!1556701 (=> (not res!1064909) (not e!867060))))

(assert (=> b!1556701 (= res!1064909 (and (or (not (is-Cons!36292 (t!51017 lt!670416))) (bvsle (_1!12461 (h!37738 (t!51017 lt!670416))) otherKey!50)) (is-Cons!36292 (t!51017 lt!670416)) (bvslt (_1!12461 (h!37738 (t!51017 lt!670416))) otherKey!50)))))

(declare-fun b!1556702 () Bool)

(assert (=> b!1556702 (= e!867060 (containsKey!811 (t!51017 (t!51017 lt!670416)) otherKey!50))))

(assert (= (and d!162257 (not res!1064908)) b!1556701))

(assert (= (and b!1556701 res!1064909) b!1556702))

(declare-fun m!1434117 () Bool)

(assert (=> b!1556702 m!1434117))

(assert (=> b!1556463 d!162257))

(declare-fun d!162259 () Bool)

(declare-fun res!1064910 () Bool)

(declare-fun e!867061 () Bool)

(assert (=> d!162259 (=> res!1064910 e!867061)))

(assert (=> d!162259 (= res!1064910 (or (is-Nil!36293 lt!670425) (is-Nil!36293 (t!51017 lt!670425))))))

(assert (=> d!162259 (= (isStrictlySorted!949 lt!670425) e!867061)))

(declare-fun b!1556703 () Bool)

(declare-fun e!867062 () Bool)

(assert (=> b!1556703 (= e!867061 e!867062)))

(declare-fun res!1064911 () Bool)

(assert (=> b!1556703 (=> (not res!1064911) (not e!867062))))

(assert (=> b!1556703 (= res!1064911 (bvslt (_1!12461 (h!37738 lt!670425)) (_1!12461 (h!37738 (t!51017 lt!670425)))))))

(declare-fun b!1556704 () Bool)

(assert (=> b!1556704 (= e!867062 (isStrictlySorted!949 (t!51017 lt!670425)))))

(assert (= (and d!162259 (not res!1064910)) b!1556703))

(assert (= (and b!1556703 res!1064911) b!1556704))

(declare-fun m!1434119 () Bool)

(assert (=> b!1556704 m!1434119))

(assert (=> d!162117 d!162259))

(assert (=> d!162117 d!162169))

(declare-fun b!1556707 () Bool)

(declare-fun e!867064 () Option!853)

(assert (=> b!1556707 (= e!867064 (getValueByKey!777 (t!51017 (t!51017 lt!670416)) otherKey!50))))

(declare-fun b!1556708 () Bool)

(assert (=> b!1556708 (= e!867064 None!851)))

(declare-fun d!162261 () Bool)

(declare-fun c!143835 () Bool)

(assert (=> d!162261 (= c!143835 (and (is-Cons!36292 (t!51017 lt!670416)) (= (_1!12461 (h!37738 (t!51017 lt!670416))) otherKey!50)))))

(declare-fun e!867063 () Option!853)

(assert (=> d!162261 (= (getValueByKey!777 (t!51017 lt!670416) otherKey!50) e!867063)))

(declare-fun b!1556706 () Bool)

(assert (=> b!1556706 (= e!867063 e!867064)))

(declare-fun c!143836 () Bool)

(assert (=> b!1556706 (= c!143836 (and (is-Cons!36292 (t!51017 lt!670416)) (not (= (_1!12461 (h!37738 (t!51017 lt!670416))) otherKey!50))))))

(declare-fun b!1556705 () Bool)

(assert (=> b!1556705 (= e!867063 (Some!852 (_2!12461 (h!37738 (t!51017 lt!670416)))))))

(assert (= (and d!162261 c!143835) b!1556705))

(assert (= (and d!162261 (not c!143835)) b!1556706))

(assert (= (and b!1556706 c!143836) b!1556707))

(assert (= (and b!1556706 (not c!143836)) b!1556708))

(declare-fun m!1434121 () Bool)

(assert (=> b!1556707 m!1434121))

(assert (=> b!1556557 d!162261))

(assert (=> b!1556561 d!162165))

(declare-fun b!1556709 () Bool)

(declare-fun e!867069 () List!36296)

(declare-fun call!71624 () List!36296)

(assert (=> b!1556709 (= e!867069 call!71624)))

(declare-fun c!143838 () Bool)

(declare-fun b!1556710 () Bool)

(declare-fun e!867067 () List!36296)

(declare-fun c!143839 () Bool)

(assert (=> b!1556710 (= e!867067 (ite c!143839 (t!51017 (t!51017 (t!51017 l!1177))) (ite c!143838 (Cons!36292 (h!37738 (t!51017 (t!51017 l!1177))) (t!51017 (t!51017 (t!51017 l!1177)))) Nil!36293)))))

(declare-fun c!143837 () Bool)

(declare-fun call!71625 () List!36296)

(declare-fun bm!71620 () Bool)

(assert (=> bm!71620 (= call!71625 ($colon$colon!967 e!867067 (ite c!143837 (h!37738 (t!51017 (t!51017 l!1177))) (tuple2!24901 newKey!105 newValue!105))))))

(declare-fun c!143840 () Bool)

(assert (=> bm!71620 (= c!143840 c!143837)))

(declare-fun b!1556711 () Bool)

(declare-fun e!867068 () List!36296)

(declare-fun e!867065 () List!36296)

(assert (=> b!1556711 (= e!867068 e!867065)))

(assert (=> b!1556711 (= c!143839 (and (is-Cons!36292 (t!51017 (t!51017 l!1177))) (= (_1!12461 (h!37738 (t!51017 (t!51017 l!1177)))) newKey!105)))))

(declare-fun b!1556712 () Bool)

(declare-fun call!71623 () List!36296)

(assert (=> b!1556712 (= e!867065 call!71623)))

(declare-fun bm!71622 () Bool)

(assert (=> bm!71622 (= call!71623 call!71625)))

(declare-fun b!1556713 () Bool)

(assert (=> b!1556713 (= e!867067 (insertStrictlySorted!551 (t!51017 (t!51017 (t!51017 l!1177))) newKey!105 newValue!105))))

(declare-fun b!1556714 () Bool)

(assert (=> b!1556714 (= c!143838 (and (is-Cons!36292 (t!51017 (t!51017 l!1177))) (bvsgt (_1!12461 (h!37738 (t!51017 (t!51017 l!1177)))) newKey!105)))))

(assert (=> b!1556714 (= e!867065 e!867069)))

(declare-fun b!1556715 () Bool)

(declare-fun res!1064913 () Bool)

(declare-fun e!867066 () Bool)

(assert (=> b!1556715 (=> (not res!1064913) (not e!867066))))

(declare-fun lt!670450 () List!36296)

(assert (=> b!1556715 (= res!1064913 (containsKey!811 lt!670450 newKey!105))))

(declare-fun b!1556716 () Bool)

(assert (=> b!1556716 (= e!867068 call!71625)))

(declare-fun b!1556717 () Bool)

(assert (=> b!1556717 (= e!867069 call!71624)))

(declare-fun b!1556718 () Bool)

(assert (=> b!1556718 (= e!867066 (contains!10183 lt!670450 (tuple2!24901 newKey!105 newValue!105)))))

(declare-fun d!162263 () Bool)

(assert (=> d!162263 e!867066))

(declare-fun res!1064912 () Bool)

(assert (=> d!162263 (=> (not res!1064912) (not e!867066))))

(assert (=> d!162263 (= res!1064912 (isStrictlySorted!949 lt!670450))))

(assert (=> d!162263 (= lt!670450 e!867068)))

(assert (=> d!162263 (= c!143837 (and (is-Cons!36292 (t!51017 (t!51017 l!1177))) (bvslt (_1!12461 (h!37738 (t!51017 (t!51017 l!1177)))) newKey!105)))))

(assert (=> d!162263 (isStrictlySorted!949 (t!51017 (t!51017 l!1177)))))

(assert (=> d!162263 (= (insertStrictlySorted!551 (t!51017 (t!51017 l!1177)) newKey!105 newValue!105) lt!670450)))

(declare-fun bm!71621 () Bool)

(assert (=> bm!71621 (= call!71624 call!71623)))

(assert (= (and d!162263 c!143837) b!1556716))

(assert (= (and d!162263 (not c!143837)) b!1556711))

(assert (= (and b!1556711 c!143839) b!1556712))

(assert (= (and b!1556711 (not c!143839)) b!1556714))

(assert (= (and b!1556714 c!143838) b!1556717))

(assert (= (and b!1556714 (not c!143838)) b!1556709))

(assert (= (or b!1556717 b!1556709) bm!71621))

(assert (= (or b!1556712 bm!71621) bm!71622))

(assert (= (or b!1556716 bm!71622) bm!71620))

(assert (= (and bm!71620 c!143840) b!1556713))

(assert (= (and bm!71620 (not c!143840)) b!1556710))

(assert (= (and d!162263 res!1064912) b!1556715))

(assert (= (and b!1556715 res!1064913) b!1556718))

(declare-fun m!1434123 () Bool)

(assert (=> bm!71620 m!1434123))

(declare-fun m!1434125 () Bool)

(assert (=> b!1556713 m!1434125))

(declare-fun m!1434127 () Bool)

(assert (=> d!162263 m!1434127))

(assert (=> d!162263 m!1433913))

(declare-fun m!1434129 () Bool)

(assert (=> b!1556715 m!1434129))

(declare-fun m!1434131 () Bool)

(assert (=> b!1556718 m!1434131))

(assert (=> b!1556482 d!162263))

(assert (=> b!1556554 d!162105))

(declare-fun d!162265 () Bool)

(declare-fun res!1064914 () Bool)

(declare-fun e!867070 () Bool)

(assert (=> d!162265 (=> res!1064914 e!867070)))

(assert (=> d!162265 (= res!1064914 (or (is-Nil!36293 (t!51017 (t!51017 l!1177))) (is-Nil!36293 (t!51017 (t!51017 (t!51017 l!1177))))))))

(assert (=> d!162265 (= (isStrictlySorted!949 (t!51017 (t!51017 l!1177))) e!867070)))

(declare-fun b!1556719 () Bool)

(declare-fun e!867071 () Bool)

(assert (=> b!1556719 (= e!867070 e!867071)))

(declare-fun res!1064915 () Bool)

(assert (=> b!1556719 (=> (not res!1064915) (not e!867071))))

(assert (=> b!1556719 (= res!1064915 (bvslt (_1!12461 (h!37738 (t!51017 (t!51017 l!1177)))) (_1!12461 (h!37738 (t!51017 (t!51017 (t!51017 l!1177)))))))))

(declare-fun b!1556720 () Bool)

(assert (=> b!1556720 (= e!867071 (isStrictlySorted!949 (t!51017 (t!51017 (t!51017 l!1177)))))))

(assert (= (and d!162265 (not res!1064914)) b!1556719))

(assert (= (and b!1556719 res!1064915) b!1556720))

(declare-fun m!1434133 () Bool)

(assert (=> b!1556720 m!1434133))

(assert (=> b!1556333 d!162265))

(declare-fun lt!670453 () Bool)

(declare-fun d!162267 () Bool)

(declare-fun content!798 (List!36296) (Set tuple2!24900))

(assert (=> d!162267 (= lt!670453 (member (tuple2!24901 newKey!105 newValue!105) (content!798 lt!670425)))))

(declare-fun e!867076 () Bool)

(assert (=> d!162267 (= lt!670453 e!867076)))

(declare-fun res!1064920 () Bool)

(assert (=> d!162267 (=> (not res!1064920) (not e!867076))))

(assert (=> d!162267 (= res!1064920 (is-Cons!36292 lt!670425))))

(assert (=> d!162267 (= (contains!10183 lt!670425 (tuple2!24901 newKey!105 newValue!105)) lt!670453)))

(declare-fun b!1556725 () Bool)

(declare-fun e!867077 () Bool)

(assert (=> b!1556725 (= e!867076 e!867077)))

(declare-fun res!1064921 () Bool)

(assert (=> b!1556725 (=> res!1064921 e!867077)))

(assert (=> b!1556725 (= res!1064921 (= (h!37738 lt!670425) (tuple2!24901 newKey!105 newValue!105)))))

(declare-fun b!1556726 () Bool)

(assert (=> b!1556726 (= e!867077 (contains!10183 (t!51017 lt!670425) (tuple2!24901 newKey!105 newValue!105)))))

(assert (= (and d!162267 res!1064920) b!1556725))

(assert (= (and b!1556725 (not res!1064921)) b!1556726))

(declare-fun m!1434135 () Bool)

(assert (=> d!162267 m!1434135))

(declare-fun m!1434137 () Bool)

(assert (=> d!162267 m!1434137))

(declare-fun m!1434139 () Bool)

(assert (=> b!1556726 m!1434139))

(assert (=> b!1556420 d!162267))

(assert (=> d!162125 d!162105))

(assert (=> d!162125 d!162143))

(assert (=> d!162125 d!162147))

(declare-fun d!162269 () Bool)

(declare-fun res!1064922 () Bool)

(declare-fun e!867078 () Bool)

(assert (=> d!162269 (=> res!1064922 e!867078)))

(assert (=> d!162269 (= res!1064922 (and (is-Cons!36292 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105)) (= (_1!12461 (h!37738 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(assert (=> d!162269 (= (containsKey!811 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105) otherKey!50) e!867078)))

(declare-fun b!1556727 () Bool)

(declare-fun e!867079 () Bool)

(assert (=> b!1556727 (= e!867078 e!867079)))

(declare-fun res!1064923 () Bool)

(assert (=> b!1556727 (=> (not res!1064923) (not e!867079))))

(assert (=> b!1556727 (= res!1064923 (and (or (not (is-Cons!36292 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105))) (bvsle (_1!12461 (h!37738 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105))) otherKey!50)) (is-Cons!36292 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105)) (bvslt (_1!12461 (h!37738 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(declare-fun b!1556728 () Bool)

(assert (=> b!1556728 (= e!867079 (containsKey!811 (t!51017 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105)) otherKey!50))))

(assert (= (and d!162269 (not res!1064922)) b!1556727))

(assert (= (and b!1556727 res!1064923) b!1556728))

(declare-fun m!1434141 () Bool)

(assert (=> b!1556728 m!1434141))

(assert (=> d!162125 d!162269))

(declare-fun d!162271 () Bool)

(declare-fun e!867082 () Bool)

(assert (=> d!162271 e!867082))

(declare-fun res!1064926 () Bool)

(assert (=> d!162271 (=> (not res!1064926) (not e!867082))))

(assert (=> d!162271 (= res!1064926 (= (containsKey!811 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!811 (t!51017 l!1177) otherKey!50)))))

(assert (=> d!162271 true))

(declare-fun _$16!196 () Unit!51842)

(assert (=> d!162271 (= (choose!2062 (t!51017 l!1177) newKey!105 newValue!105 otherKey!50) _$16!196)))

(declare-fun b!1556731 () Bool)

(assert (=> b!1556731 (= e!867082 (= (getValueByKey!777 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!777 (t!51017 l!1177) otherKey!50)))))

(assert (= (and d!162271 res!1064926) b!1556731))

(assert (=> d!162271 m!1433891))

(assert (=> d!162271 m!1433891))

(assert (=> d!162271 m!1433943))

(assert (=> d!162271 m!1433893))

(assert (=> b!1556731 m!1433891))

(assert (=> b!1556731 m!1433891))

(assert (=> b!1556731 m!1433947))

(assert (=> b!1556731 m!1433903))

(assert (=> d!162125 d!162271))

(assert (=> b!1556410 d!162143))

(declare-fun d!162273 () Bool)

(declare-fun res!1064927 () Bool)

(declare-fun e!867083 () Bool)

(assert (=> d!162273 (=> res!1064927 e!867083)))

(assert (=> d!162273 (= res!1064927 (and (is-Cons!36292 lt!670438) (= (_1!12461 (h!37738 lt!670438)) newKey!105)))))

(assert (=> d!162273 (= (containsKey!811 lt!670438 newKey!105) e!867083)))

(declare-fun b!1556732 () Bool)

(declare-fun e!867084 () Bool)

(assert (=> b!1556732 (= e!867083 e!867084)))

(declare-fun res!1064928 () Bool)

(assert (=> b!1556732 (=> (not res!1064928) (not e!867084))))

(assert (=> b!1556732 (= res!1064928 (and (or (not (is-Cons!36292 lt!670438)) (bvsle (_1!12461 (h!37738 lt!670438)) newKey!105)) (is-Cons!36292 lt!670438) (bvslt (_1!12461 (h!37738 lt!670438)) newKey!105)))))

(declare-fun b!1556733 () Bool)

(assert (=> b!1556733 (= e!867084 (containsKey!811 (t!51017 lt!670438) newKey!105))))

(assert (= (and d!162273 (not res!1064927)) b!1556732))

(assert (= (and b!1556732 res!1064928) b!1556733))

(declare-fun m!1434143 () Bool)

(assert (=> b!1556733 m!1434143))

(assert (=> b!1556484 d!162273))

(declare-fun d!162275 () Bool)

(assert (=> d!162275 (= ($colon$colon!967 e!866852 (ite c!143764 (h!37738 l!1177) (tuple2!24901 newKey!105 newValue!105))) (Cons!36292 (ite c!143764 (h!37738 l!1177) (tuple2!24901 newKey!105 newValue!105)) e!866852))))

(assert (=> bm!71597 d!162275))

(declare-fun d!162277 () Bool)

(declare-fun res!1064929 () Bool)

(declare-fun e!867085 () Bool)

(assert (=> d!162277 (=> res!1064929 e!867085)))

(assert (=> d!162277 (= res!1064929 (and (is-Cons!36292 (t!51017 lt!670418)) (= (_1!12461 (h!37738 (t!51017 lt!670418))) otherKey!50)))))

(assert (=> d!162277 (= (containsKey!811 (t!51017 lt!670418) otherKey!50) e!867085)))

(declare-fun b!1556734 () Bool)

(declare-fun e!867086 () Bool)

(assert (=> b!1556734 (= e!867085 e!867086)))

(declare-fun res!1064930 () Bool)

(assert (=> b!1556734 (=> (not res!1064930) (not e!867086))))

(assert (=> b!1556734 (= res!1064930 (and (or (not (is-Cons!36292 (t!51017 lt!670418))) (bvsle (_1!12461 (h!37738 (t!51017 lt!670418))) otherKey!50)) (is-Cons!36292 (t!51017 lt!670418)) (bvslt (_1!12461 (h!37738 (t!51017 lt!670418))) otherKey!50)))))

(declare-fun b!1556735 () Bool)

(assert (=> b!1556735 (= e!867086 (containsKey!811 (t!51017 (t!51017 lt!670418)) otherKey!50))))

(assert (= (and d!162277 (not res!1064929)) b!1556734))

(assert (= (and b!1556734 res!1064930) b!1556735))

(declare-fun m!1434145 () Bool)

(assert (=> b!1556735 m!1434145))

(assert (=> b!1556461 d!162277))

(declare-fun d!162279 () Bool)

(declare-fun res!1064931 () Bool)

(declare-fun e!867087 () Bool)

(assert (=> d!162279 (=> res!1064931 e!867087)))

(assert (=> d!162279 (= res!1064931 (and (is-Cons!36292 (t!51017 (t!51017 l!1177))) (= (_1!12461 (h!37738 (t!51017 (t!51017 l!1177)))) otherKey!50)))))

(assert (=> d!162279 (= (containsKey!811 (t!51017 (t!51017 l!1177)) otherKey!50) e!867087)))

(declare-fun b!1556736 () Bool)

(declare-fun e!867088 () Bool)

(assert (=> b!1556736 (= e!867087 e!867088)))

(declare-fun res!1064932 () Bool)

(assert (=> b!1556736 (=> (not res!1064932) (not e!867088))))

(assert (=> b!1556736 (= res!1064932 (and (or (not (is-Cons!36292 (t!51017 (t!51017 l!1177)))) (bvsle (_1!12461 (h!37738 (t!51017 (t!51017 l!1177)))) otherKey!50)) (is-Cons!36292 (t!51017 (t!51017 l!1177))) (bvslt (_1!12461 (h!37738 (t!51017 (t!51017 l!1177)))) otherKey!50)))))

(declare-fun b!1556737 () Bool)

(assert (=> b!1556737 (= e!867088 (containsKey!811 (t!51017 (t!51017 (t!51017 l!1177))) otherKey!50))))

(assert (= (and d!162279 (not res!1064931)) b!1556736))

(assert (= (and b!1556736 res!1064932) b!1556737))

(declare-fun m!1434147 () Bool)

(assert (=> b!1556737 m!1434147))

(assert (=> b!1556495 d!162279))

(declare-fun b!1556740 () Bool)

(declare-fun e!867090 () Option!853)

(assert (=> b!1556740 (= e!867090 (getValueByKey!777 (t!51017 (t!51017 lt!670418)) otherKey!50))))

(declare-fun b!1556741 () Bool)

(assert (=> b!1556741 (= e!867090 None!851)))

(declare-fun d!162281 () Bool)

(declare-fun c!143841 () Bool)

(assert (=> d!162281 (= c!143841 (and (is-Cons!36292 (t!51017 lt!670418)) (= (_1!12461 (h!37738 (t!51017 lt!670418))) otherKey!50)))))

(declare-fun e!867089 () Option!853)

(assert (=> d!162281 (= (getValueByKey!777 (t!51017 lt!670418) otherKey!50) e!867089)))

(declare-fun b!1556739 () Bool)

(assert (=> b!1556739 (= e!867089 e!867090)))

(declare-fun c!143842 () Bool)

(assert (=> b!1556739 (= c!143842 (and (is-Cons!36292 (t!51017 lt!670418)) (not (= (_1!12461 (h!37738 (t!51017 lt!670418))) otherKey!50))))))

(declare-fun b!1556738 () Bool)

(assert (=> b!1556738 (= e!867089 (Some!852 (_2!12461 (h!37738 (t!51017 lt!670418)))))))

(assert (= (and d!162281 c!143841) b!1556738))

(assert (= (and d!162281 (not c!143841)) b!1556739))

(assert (= (and b!1556739 c!143842) b!1556740))

(assert (= (and b!1556739 (not c!143842)) b!1556741))

(declare-fun m!1434149 () Bool)

(assert (=> b!1556740 m!1434149))

(assert (=> b!1556543 d!162281))

(assert (=> b!1556467 d!162147))

(declare-fun lt!670454 () Bool)

(declare-fun d!162283 () Bool)

(assert (=> d!162283 (= lt!670454 (member (tuple2!24901 newKey!105 newValue!105) (content!798 lt!670438)))))

(declare-fun e!867091 () Bool)

(assert (=> d!162283 (= lt!670454 e!867091)))

(declare-fun res!1064933 () Bool)

(assert (=> d!162283 (=> (not res!1064933) (not e!867091))))

(assert (=> d!162283 (= res!1064933 (is-Cons!36292 lt!670438))))

(assert (=> d!162283 (= (contains!10183 lt!670438 (tuple2!24901 newKey!105 newValue!105)) lt!670454)))

(declare-fun b!1556742 () Bool)

(declare-fun e!867092 () Bool)

(assert (=> b!1556742 (= e!867091 e!867092)))

(declare-fun res!1064934 () Bool)

(assert (=> b!1556742 (=> res!1064934 e!867092)))

(assert (=> b!1556742 (= res!1064934 (= (h!37738 lt!670438) (tuple2!24901 newKey!105 newValue!105)))))

(declare-fun b!1556743 () Bool)

(assert (=> b!1556743 (= e!867092 (contains!10183 (t!51017 lt!670438) (tuple2!24901 newKey!105 newValue!105)))))

(assert (= (and d!162283 res!1064933) b!1556742))

(assert (= (and b!1556742 (not res!1064934)) b!1556743))

(declare-fun m!1434151 () Bool)

(assert (=> d!162283 m!1434151))

(declare-fun m!1434153 () Bool)

(assert (=> d!162283 m!1434153))

(declare-fun m!1434155 () Bool)

(assert (=> b!1556743 m!1434155))

(assert (=> b!1556487 d!162283))

(declare-fun d!162285 () Bool)

(declare-fun res!1064935 () Bool)

(declare-fun e!867093 () Bool)

(assert (=> d!162285 (=> res!1064935 e!867093)))

(assert (=> d!162285 (= res!1064935 (or (is-Nil!36293 lt!670438) (is-Nil!36293 (t!51017 lt!670438))))))

(assert (=> d!162285 (= (isStrictlySorted!949 lt!670438) e!867093)))

(declare-fun b!1556744 () Bool)

(declare-fun e!867094 () Bool)

(assert (=> b!1556744 (= e!867093 e!867094)))

(declare-fun res!1064936 () Bool)

(assert (=> b!1556744 (=> (not res!1064936) (not e!867094))))

(assert (=> b!1556744 (= res!1064936 (bvslt (_1!12461 (h!37738 lt!670438)) (_1!12461 (h!37738 (t!51017 lt!670438)))))))

(declare-fun b!1556745 () Bool)

(assert (=> b!1556745 (= e!867094 (isStrictlySorted!949 (t!51017 lt!670438)))))

(assert (= (and d!162285 (not res!1064935)) b!1556744))

(assert (= (and b!1556744 res!1064936) b!1556745))

(declare-fun m!1434157 () Bool)

(assert (=> b!1556745 m!1434157))

(assert (=> d!162143 d!162285))

(assert (=> d!162143 d!162105))

(declare-fun d!162287 () Bool)

(assert (=> d!162287 (= ($colon$colon!967 e!866904 (ite c!143779 (h!37738 (t!51017 l!1177)) (tuple2!24901 newKey!105 newValue!105))) (Cons!36292 (ite c!143779 (h!37738 (t!51017 l!1177)) (tuple2!24901 newKey!105 newValue!105)) e!866904))))

(assert (=> bm!71608 d!162287))

(declare-fun d!162289 () Bool)

(declare-fun res!1064937 () Bool)

(declare-fun e!867095 () Bool)

(assert (=> d!162289 (=> res!1064937 e!867095)))

(assert (=> d!162289 (= res!1064937 (and (is-Cons!36292 lt!670425) (= (_1!12461 (h!37738 lt!670425)) newKey!105)))))

(assert (=> d!162289 (= (containsKey!811 lt!670425 newKey!105) e!867095)))

(declare-fun b!1556746 () Bool)

(declare-fun e!867096 () Bool)

(assert (=> b!1556746 (= e!867095 e!867096)))

(declare-fun res!1064938 () Bool)

(assert (=> b!1556746 (=> (not res!1064938) (not e!867096))))

(assert (=> b!1556746 (= res!1064938 (and (or (not (is-Cons!36292 lt!670425)) (bvsle (_1!12461 (h!37738 lt!670425)) newKey!105)) (is-Cons!36292 lt!670425) (bvslt (_1!12461 (h!37738 lt!670425)) newKey!105)))))

(declare-fun b!1556747 () Bool)

(assert (=> b!1556747 (= e!867096 (containsKey!811 (t!51017 lt!670425) newKey!105))))

(assert (= (and d!162289 (not res!1064937)) b!1556746))

(assert (= (and b!1556746 res!1064938) b!1556747))

(declare-fun m!1434159 () Bool)

(assert (=> b!1556747 m!1434159))

(assert (=> b!1556414 d!162289))

(declare-fun b!1556750 () Bool)

(declare-fun e!867098 () Option!853)

(assert (=> b!1556750 (= e!867098 (getValueByKey!777 (t!51017 (t!51017 (t!51017 l!1177))) otherKey!50))))

(declare-fun b!1556751 () Bool)

(assert (=> b!1556751 (= e!867098 None!851)))

(declare-fun d!162291 () Bool)

(declare-fun c!143843 () Bool)

(assert (=> d!162291 (= c!143843 (and (is-Cons!36292 (t!51017 (t!51017 l!1177))) (= (_1!12461 (h!37738 (t!51017 (t!51017 l!1177)))) otherKey!50)))))

(declare-fun e!867097 () Option!853)

(assert (=> d!162291 (= (getValueByKey!777 (t!51017 (t!51017 l!1177)) otherKey!50) e!867097)))

(declare-fun b!1556749 () Bool)

(assert (=> b!1556749 (= e!867097 e!867098)))

(declare-fun c!143844 () Bool)

(assert (=> b!1556749 (= c!143844 (and (is-Cons!36292 (t!51017 (t!51017 l!1177))) (not (= (_1!12461 (h!37738 (t!51017 (t!51017 l!1177)))) otherKey!50))))))

(declare-fun b!1556748 () Bool)

(assert (=> b!1556748 (= e!867097 (Some!852 (_2!12461 (h!37738 (t!51017 (t!51017 l!1177))))))))

(assert (= (and d!162291 c!143843) b!1556748))

(assert (= (and d!162291 (not c!143843)) b!1556749))

(assert (= (and b!1556749 c!143844) b!1556750))

(assert (= (and b!1556749 (not c!143844)) b!1556751))

(declare-fun m!1434161 () Bool)

(assert (=> b!1556750 m!1434161))

(assert (=> b!1556551 d!162291))

(declare-fun e!867100 () Option!853)

(declare-fun b!1556754 () Bool)

(assert (=> b!1556754 (= e!867100 (getValueByKey!777 (t!51017 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105)) otherKey!50))))

(declare-fun b!1556755 () Bool)

(assert (=> b!1556755 (= e!867100 None!851)))

(declare-fun d!162293 () Bool)

(declare-fun c!143845 () Bool)

(assert (=> d!162293 (= c!143845 (and (is-Cons!36292 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105)) (= (_1!12461 (h!37738 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(declare-fun e!867099 () Option!853)

(assert (=> d!162293 (= (getValueByKey!777 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105) otherKey!50) e!867099)))

(declare-fun b!1556753 () Bool)

(assert (=> b!1556753 (= e!867099 e!867100)))

(declare-fun c!143846 () Bool)

(assert (=> b!1556753 (= c!143846 (and (is-Cons!36292 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105)) (not (= (_1!12461 (h!37738 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105))) otherKey!50))))))

(declare-fun b!1556752 () Bool)

(assert (=> b!1556752 (= e!867099 (Some!852 (_2!12461 (h!37738 (insertStrictlySorted!551 (t!51017 l!1177) newKey!105 newValue!105)))))))

(assert (= (and d!162293 c!143845) b!1556752))

(assert (= (and d!162293 (not c!143845)) b!1556753))

(assert (= (and b!1556753 c!143846) b!1556754))

(assert (= (and b!1556753 (not c!143846)) b!1556755))

(declare-fun m!1434163 () Bool)

(assert (=> b!1556754 m!1434163))

(assert (=> b!1556443 d!162293))

(assert (=> b!1556443 d!162143))

(assert (=> b!1556443 d!162165))

(declare-fun b!1556756 () Bool)

(declare-fun e!867101 () Bool)

(declare-fun tp!112443 () Bool)

(assert (=> b!1556756 (= e!867101 (and tp_is_empty!38363 tp!112443))))

(assert (=> b!1556571 (= tp!112437 e!867101)))

(assert (= (and b!1556571 (is-Cons!36292 (t!51017 (t!51017 l!1177)))) b!1556756))

(push 1)

(assert (not b!1556731))

(assert (not b!1556702))

(assert (not b!1556756))

(assert (not b!1556745))

(assert (not b!1556718))

(assert (not b!1556728))

(assert (not b!1556743))

(assert (not b!1556754))

(assert (not b!1556747))

(assert (not b!1556735))

(assert (not bm!71620))

(assert (not b!1556750))

(assert (not b!1556715))

(assert (not b!1556740))

(assert (not b!1556733))

(assert (not b!1556737))

(assert (not b!1556704))

(assert (not b!1556713))

(assert tp_is_empty!38363)

(assert (not d!162267))

(assert (not b!1556707))

(assert (not d!162263))

(assert (not d!162283))

(assert (not b!1556726))

(assert (not d!162271))

(assert (not b!1556720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

