; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132896 () Bool)

(assert start!132896)

(declare-fun b!1556262 () Bool)

(declare-fun res!1064712 () Bool)

(declare-fun e!866763 () Bool)

(assert (=> b!1556262 (=> (not res!1064712) (not e!866763))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2348 0))(
  ( (B!2349 (val!19260 Int)) )
))
(declare-datatypes ((tuple2!24896 0))(
  ( (tuple2!24897 (_1!12459 (_ BitVec 64)) (_2!12459 B!2348)) )
))
(declare-datatypes ((List!36294 0))(
  ( (Nil!36291) (Cons!36290 (h!37736 tuple2!24896) (t!51015 List!36294)) )
))
(declare-fun l!1177 () List!36294)

(assert (=> b!1556262 (= res!1064712 (and (not (= newKey!105 otherKey!50)) (is-Cons!36290 l!1177) (not (= (_1!12459 (h!37736 l!1177)) otherKey!50))))))

(declare-fun b!1556263 () Bool)

(declare-fun res!1064713 () Bool)

(assert (=> b!1556263 (=> (not res!1064713) (not e!866763))))

(declare-fun isStrictlySorted!947 (List!36294) Bool)

(assert (=> b!1556263 (= res!1064713 (isStrictlySorted!947 (t!51015 l!1177)))))

(declare-fun b!1556264 () Bool)

(declare-fun e!866764 () Bool)

(declare-fun lt!670399 () List!36294)

(declare-datatypes ((Option!851 0))(
  ( (Some!850 (v!22035 B!2348)) (None!849) )
))
(declare-fun getValueByKey!775 (List!36294 (_ BitVec 64)) Option!851)

(assert (=> b!1556264 (= e!866764 (= (getValueByKey!775 lt!670399 otherKey!50) (getValueByKey!775 l!1177 otherKey!50)))))

(declare-fun b!1556265 () Bool)

(declare-fun e!866765 () Bool)

(declare-fun tp_is_empty!38359 () Bool)

(declare-fun tp!112425 () Bool)

(assert (=> b!1556265 (= e!866765 (and tp_is_empty!38359 tp!112425))))

(declare-fun b!1556266 () Bool)

(assert (=> b!1556266 (= e!866763 (not e!866764))))

(declare-fun res!1064709 () Bool)

(assert (=> b!1556266 (=> (not res!1064709) (not e!866764))))

(declare-fun containsKey!809 (List!36294 (_ BitVec 64)) Bool)

(assert (=> b!1556266 (= res!1064709 (= (containsKey!809 lt!670399 otherKey!50) (containsKey!809 l!1177 otherKey!50)))))

(declare-fun newValue!105 () B!2348)

(declare-fun insertStrictlySorted!549 (List!36294 (_ BitVec 64) B!2348) List!36294)

(assert (=> b!1556266 (= lt!670399 (insertStrictlySorted!549 l!1177 newKey!105 newValue!105))))

(declare-fun e!866762 () Bool)

(assert (=> b!1556266 e!866762))

(declare-fun res!1064710 () Bool)

(assert (=> b!1556266 (=> (not res!1064710) (not e!866762))))

(declare-fun lt!670400 () List!36294)

(assert (=> b!1556266 (= res!1064710 (= (containsKey!809 lt!670400 otherKey!50) (containsKey!809 (t!51015 l!1177) otherKey!50)))))

(assert (=> b!1556266 (= lt!670400 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51838 0))(
  ( (Unit!51839) )
))
(declare-fun lt!670398 () Unit!51838)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!34 (List!36294 (_ BitVec 64) B!2348 (_ BitVec 64)) Unit!51838)

(assert (=> b!1556266 (= lt!670398 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!34 (t!51015 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun res!1064711 () Bool)

(assert (=> start!132896 (=> (not res!1064711) (not e!866763))))

(assert (=> start!132896 (= res!1064711 (isStrictlySorted!947 l!1177))))

(assert (=> start!132896 e!866763))

(assert (=> start!132896 e!866765))

(assert (=> start!132896 true))

(assert (=> start!132896 tp_is_empty!38359))

(declare-fun b!1556267 () Bool)

(assert (=> b!1556267 (= e!866762 (= (getValueByKey!775 lt!670400 otherKey!50) (getValueByKey!775 (t!51015 l!1177) otherKey!50)))))

(assert (= (and start!132896 res!1064711) b!1556262))

(assert (= (and b!1556262 res!1064712) b!1556263))

(assert (= (and b!1556263 res!1064713) b!1556266))

(assert (= (and b!1556266 res!1064710) b!1556267))

(assert (= (and b!1556266 res!1064709) b!1556264))

(assert (= (and start!132896 (is-Cons!36290 l!1177)) b!1556265))

(declare-fun m!1433829 () Bool)

(assert (=> b!1556263 m!1433829))

(declare-fun m!1433831 () Bool)

(assert (=> b!1556267 m!1433831))

(declare-fun m!1433833 () Bool)

(assert (=> b!1556267 m!1433833))

(declare-fun m!1433835 () Bool)

(assert (=> b!1556264 m!1433835))

(declare-fun m!1433837 () Bool)

(assert (=> b!1556264 m!1433837))

(declare-fun m!1433839 () Bool)

(assert (=> b!1556266 m!1433839))

(declare-fun m!1433841 () Bool)

(assert (=> b!1556266 m!1433841))

(declare-fun m!1433843 () Bool)

(assert (=> b!1556266 m!1433843))

(declare-fun m!1433845 () Bool)

(assert (=> b!1556266 m!1433845))

(declare-fun m!1433847 () Bool)

(assert (=> b!1556266 m!1433847))

(declare-fun m!1433849 () Bool)

(assert (=> b!1556266 m!1433849))

(declare-fun m!1433851 () Bool)

(assert (=> b!1556266 m!1433851))

(declare-fun m!1433853 () Bool)

(assert (=> start!132896 m!1433853))

(push 1)

(assert (not b!1556266))

(assert (not b!1556267))

(assert (not start!132896))

(assert (not b!1556263))

(assert tp_is_empty!38359)

(assert (not b!1556265))

(assert (not b!1556264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!866854 () List!36294)

(declare-fun call!71600 () List!36294)

(declare-fun c!143765 () Bool)

(declare-fun bm!71596 () Bool)

(declare-fun $colon$colon!966 (List!36294 tuple2!24896) List!36294)

(assert (=> bm!71596 (= call!71600 ($colon$colon!966 e!866854 (ite c!143765 (h!37736 l!1177) (tuple2!24897 newKey!105 newValue!105))))))

(declare-fun c!143768 () Bool)

(assert (=> bm!71596 (= c!143768 c!143765)))

(declare-fun b!1556404 () Bool)

(declare-fun res!1064773 () Bool)

(declare-fun e!866848 () Bool)

(assert (=> b!1556404 (=> (not res!1064773) (not e!866848))))

(declare-fun lt!670426 () List!36294)

(assert (=> b!1556404 (= res!1064773 (containsKey!809 lt!670426 newKey!105))))

(declare-fun b!1556405 () Bool)

(assert (=> b!1556405 (= e!866854 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105))))

(declare-fun bm!71599 () Bool)

(declare-fun call!71602 () List!36294)

(declare-fun call!71604 () List!36294)

(assert (=> bm!71599 (= call!71602 call!71604)))

(declare-fun bm!71600 () Bool)

(assert (=> bm!71600 (= call!71604 call!71600)))

(declare-fun b!1556408 () Bool)

(declare-fun c!143763 () Bool)

(assert (=> b!1556408 (= c!143763 (and (is-Cons!36290 l!1177) (bvsgt (_1!12459 (h!37736 l!1177)) newKey!105)))))

(declare-fun e!866847 () List!36294)

(declare-fun e!866850 () List!36294)

(assert (=> b!1556408 (= e!866847 e!866850)))

(declare-fun b!1556411 () Bool)

(declare-fun c!143770 () Bool)

(assert (=> b!1556411 (= e!866854 (ite c!143770 (t!51015 l!1177) (ite c!143763 (Cons!36290 (h!37736 l!1177) (t!51015 l!1177)) Nil!36291)))))

(declare-fun b!1556413 () Bool)

(assert (=> b!1556413 (= e!866850 call!71602)))

(declare-fun b!1556415 () Bool)

(assert (=> b!1556415 (= e!866847 call!71604)))

(declare-fun b!1556417 () Bool)

(declare-fun e!866851 () List!36294)

(assert (=> b!1556417 (= e!866851 e!866847)))

(assert (=> b!1556417 (= c!143770 (and (is-Cons!36290 l!1177) (= (_1!12459 (h!37736 l!1177)) newKey!105)))))

(declare-fun b!1556419 () Bool)

(assert (=> b!1556419 (= e!866850 call!71602)))

(declare-fun b!1556421 () Bool)

(declare-fun contains!10182 (List!36294 tuple2!24896) Bool)

(assert (=> b!1556421 (= e!866848 (contains!10182 lt!670426 (tuple2!24897 newKey!105 newValue!105)))))

(declare-fun d!162115 () Bool)

(assert (=> d!162115 e!866848))

(declare-fun res!1064772 () Bool)

(assert (=> d!162115 (=> (not res!1064772) (not e!866848))))

(assert (=> d!162115 (= res!1064772 (isStrictlySorted!947 lt!670426))))

(assert (=> d!162115 (= lt!670426 e!866851)))

(assert (=> d!162115 (= c!143765 (and (is-Cons!36290 l!1177) (bvslt (_1!12459 (h!37736 l!1177)) newKey!105)))))

(assert (=> d!162115 (isStrictlySorted!947 l!1177)))

(assert (=> d!162115 (= (insertStrictlySorted!549 l!1177 newKey!105 newValue!105) lt!670426)))

(declare-fun b!1556409 () Bool)

(assert (=> b!1556409 (= e!866851 call!71600)))

(assert (= (and d!162115 c!143765) b!1556409))

(assert (= (and d!162115 (not c!143765)) b!1556417))

(assert (= (and b!1556417 c!143770) b!1556415))

(assert (= (and b!1556417 (not c!143770)) b!1556408))

(assert (= (and b!1556408 c!143763) b!1556419))

(assert (= (and b!1556408 (not c!143763)) b!1556413))

(assert (= (or b!1556419 b!1556413) bm!71599))

(assert (= (or b!1556415 bm!71599) bm!71600))

(assert (= (or b!1556409 bm!71600) bm!71596))

(assert (= (and bm!71596 c!143768) b!1556405))

(assert (= (and bm!71596 (not c!143768)) b!1556411))

(assert (= (and d!162115 res!1064772) b!1556404))

(assert (= (and b!1556404 res!1064773) b!1556421))

(declare-fun m!1433917 () Bool)

(assert (=> b!1556404 m!1433917))

(declare-fun m!1433921 () Bool)

(assert (=> bm!71596 m!1433921))

(declare-fun m!1433925 () Bool)

(assert (=> b!1556421 m!1433925))

(assert (=> b!1556405 m!1433841))

(declare-fun m!1433929 () Bool)

(assert (=> d!162115 m!1433929))

(assert (=> d!162115 m!1433853))

(assert (=> b!1556266 d!162115))

(declare-fun d!162123 () Bool)

(declare-fun res!1064780 () Bool)

(declare-fun e!866865 () Bool)

(assert (=> d!162123 (=> res!1064780 e!866865)))

(assert (=> d!162123 (= res!1064780 (and (is-Cons!36290 lt!670400) (= (_1!12459 (h!37736 lt!670400)) otherKey!50)))))

(assert (=> d!162123 (= (containsKey!809 lt!670400 otherKey!50) e!866865)))

(declare-fun b!1556436 () Bool)

(declare-fun e!866866 () Bool)

(assert (=> b!1556436 (= e!866865 e!866866)))

(declare-fun res!1064781 () Bool)

(assert (=> b!1556436 (=> (not res!1064781) (not e!866866))))

(assert (=> b!1556436 (= res!1064781 (and (or (not (is-Cons!36290 lt!670400)) (bvsle (_1!12459 (h!37736 lt!670400)) otherKey!50)) (is-Cons!36290 lt!670400) (bvslt (_1!12459 (h!37736 lt!670400)) otherKey!50)))))

(declare-fun b!1556437 () Bool)

(assert (=> b!1556437 (= e!866866 (containsKey!809 (t!51015 lt!670400) otherKey!50))))

(assert (= (and d!162123 (not res!1064780)) b!1556436))

(assert (= (and b!1556436 res!1064781) b!1556437))

(declare-fun m!1433941 () Bool)

(assert (=> b!1556437 m!1433941))

(assert (=> b!1556266 d!162123))

(declare-fun d!162129 () Bool)

(declare-fun e!866888 () Bool)

(assert (=> d!162129 e!866888))

(declare-fun res!1064802 () Bool)

(assert (=> d!162129 (=> (not res!1064802) (not e!866888))))

(assert (=> d!162129 (= res!1064802 (= (containsKey!809 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!809 (t!51015 l!1177) otherKey!50)))))

(declare-fun lt!670436 () Unit!51838)

(declare-fun choose!2061 (List!36294 (_ BitVec 64) B!2348 (_ BitVec 64)) Unit!51838)

(assert (=> d!162129 (= lt!670436 (choose!2061 (t!51015 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!866887 () Bool)

(assert (=> d!162129 e!866887))

(declare-fun res!1064803 () Bool)

(assert (=> d!162129 (=> (not res!1064803) (not e!866887))))

(assert (=> d!162129 (= res!1064803 (isStrictlySorted!947 (t!51015 l!1177)))))

(assert (=> d!162129 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!34 (t!51015 l!1177) newKey!105 newValue!105 otherKey!50) lt!670436)))

(declare-fun b!1556458 () Bool)

(assert (=> b!1556458 (= e!866887 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1556459 () Bool)

(assert (=> b!1556459 (= e!866888 (= (getValueByKey!775 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!775 (t!51015 l!1177) otherKey!50)))))

(assert (= (and d!162129 res!1064803) b!1556458))

(assert (= (and d!162129 res!1064802) b!1556459))

(assert (=> d!162129 m!1433841))

(declare-fun m!1433955 () Bool)

(assert (=> d!162129 m!1433955))

(assert (=> d!162129 m!1433843))

(declare-fun m!1433957 () Bool)

(assert (=> d!162129 m!1433957))

(assert (=> d!162129 m!1433841))

(assert (=> d!162129 m!1433829))

(assert (=> b!1556459 m!1433841))

(assert (=> b!1556459 m!1433841))

(declare-fun m!1433961 () Bool)

(assert (=> b!1556459 m!1433961))

(assert (=> b!1556459 m!1433833))

(assert (=> b!1556266 d!162129))

(declare-fun d!162137 () Bool)

(declare-fun res!1064808 () Bool)

(declare-fun e!866893 () Bool)

(assert (=> d!162137 (=> res!1064808 e!866893)))

(assert (=> d!162137 (= res!1064808 (and (is-Cons!36290 l!1177) (= (_1!12459 (h!37736 l!1177)) otherKey!50)))))

(assert (=> d!162137 (= (containsKey!809 l!1177 otherKey!50) e!866893)))

(declare-fun b!1556464 () Bool)

(declare-fun e!866894 () Bool)

(assert (=> b!1556464 (= e!866893 e!866894)))

(declare-fun res!1064809 () Bool)

(assert (=> b!1556464 (=> (not res!1064809) (not e!866894))))

(assert (=> b!1556464 (= res!1064809 (and (or (not (is-Cons!36290 l!1177)) (bvsle (_1!12459 (h!37736 l!1177)) otherKey!50)) (is-Cons!36290 l!1177) (bvslt (_1!12459 (h!37736 l!1177)) otherKey!50)))))

(declare-fun b!1556465 () Bool)

(assert (=> b!1556465 (= e!866894 (containsKey!809 (t!51015 l!1177) otherKey!50))))

(assert (= (and d!162137 (not res!1064808)) b!1556464))

(assert (= (and b!1556464 res!1064809) b!1556465))

(assert (=> b!1556465 m!1433843))

(assert (=> b!1556266 d!162137))

(declare-fun bm!71605 () Bool)

(declare-fun c!143776 () Bool)

(declare-fun e!866901 () List!36294)

(declare-fun call!71608 () List!36294)

(assert (=> bm!71605 (= call!71608 ($colon$colon!966 e!866901 (ite c!143776 (h!37736 (t!51015 l!1177)) (tuple2!24897 newKey!105 newValue!105))))))

(declare-fun c!143777 () Bool)

(assert (=> bm!71605 (= c!143777 c!143776)))

(declare-fun b!1556468 () Bool)

(declare-fun res!1064813 () Bool)

(declare-fun e!866898 () Bool)

(assert (=> b!1556468 (=> (not res!1064813) (not e!866898))))

(declare-fun lt!670437 () List!36294)

(assert (=> b!1556468 (= res!1064813 (containsKey!809 lt!670437 newKey!105))))

(declare-fun b!1556469 () Bool)

(assert (=> b!1556469 (= e!866901 (insertStrictlySorted!549 (t!51015 (t!51015 l!1177)) newKey!105 newValue!105))))

(declare-fun bm!71606 () Bool)

(declare-fun call!71609 () List!36294)

(declare-fun call!71610 () List!36294)

(assert (=> bm!71606 (= call!71609 call!71610)))

(declare-fun bm!71607 () Bool)

(assert (=> bm!71607 (= call!71610 call!71608)))

(declare-fun b!1556470 () Bool)

(declare-fun c!143775 () Bool)

(assert (=> b!1556470 (= c!143775 (and (is-Cons!36290 (t!51015 l!1177)) (bvsgt (_1!12459 (h!37736 (t!51015 l!1177))) newKey!105)))))

(declare-fun e!866897 () List!36294)

(declare-fun e!866899 () List!36294)

(assert (=> b!1556470 (= e!866897 e!866899)))

(declare-fun b!1556472 () Bool)

(declare-fun c!143778 () Bool)

(assert (=> b!1556472 (= e!866901 (ite c!143778 (t!51015 (t!51015 l!1177)) (ite c!143775 (Cons!36290 (h!37736 (t!51015 l!1177)) (t!51015 (t!51015 l!1177))) Nil!36291)))))

(declare-fun b!1556473 () Bool)

(assert (=> b!1556473 (= e!866899 call!71609)))

(declare-fun b!1556474 () Bool)

(assert (=> b!1556474 (= e!866897 call!71610)))

(declare-fun b!1556475 () Bool)

(declare-fun e!866900 () List!36294)

(assert (=> b!1556475 (= e!866900 e!866897)))

(assert (=> b!1556475 (= c!143778 (and (is-Cons!36290 (t!51015 l!1177)) (= (_1!12459 (h!37736 (t!51015 l!1177))) newKey!105)))))

(declare-fun b!1556476 () Bool)

(assert (=> b!1556476 (= e!866899 call!71609)))

(declare-fun b!1556477 () Bool)

(assert (=> b!1556477 (= e!866898 (contains!10182 lt!670437 (tuple2!24897 newKey!105 newValue!105)))))

(declare-fun d!162141 () Bool)

(assert (=> d!162141 e!866898))

(declare-fun res!1064812 () Bool)

(assert (=> d!162141 (=> (not res!1064812) (not e!866898))))

(assert (=> d!162141 (= res!1064812 (isStrictlySorted!947 lt!670437))))

(assert (=> d!162141 (= lt!670437 e!866900)))

(assert (=> d!162141 (= c!143776 (and (is-Cons!36290 (t!51015 l!1177)) (bvslt (_1!12459 (h!37736 (t!51015 l!1177))) newKey!105)))))

(assert (=> d!162141 (isStrictlySorted!947 (t!51015 l!1177))))

(assert (=> d!162141 (= (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105) lt!670437)))

(declare-fun b!1556471 () Bool)

(assert (=> b!1556471 (= e!866900 call!71608)))

(assert (= (and d!162141 c!143776) b!1556471))

(assert (= (and d!162141 (not c!143776)) b!1556475))

(assert (= (and b!1556475 c!143778) b!1556474))

(assert (= (and b!1556475 (not c!143778)) b!1556470))

(assert (= (and b!1556470 c!143775) b!1556476))

(assert (= (and b!1556470 (not c!143775)) b!1556473))

(assert (= (or b!1556476 b!1556473) bm!71606))

(assert (= (or b!1556474 bm!71606) bm!71607))

(assert (= (or b!1556471 bm!71607) bm!71605))

(assert (= (and bm!71605 c!143777) b!1556469))

(assert (= (and bm!71605 (not c!143777)) b!1556472))

(assert (= (and d!162141 res!1064812) b!1556468))

(assert (= (and b!1556468 res!1064813) b!1556477))

(declare-fun m!1433965 () Bool)

(assert (=> b!1556468 m!1433965))

(declare-fun m!1433967 () Bool)

(assert (=> bm!71605 m!1433967))

(declare-fun m!1433969 () Bool)

(assert (=> b!1556477 m!1433969))

(declare-fun m!1433971 () Bool)

(assert (=> b!1556469 m!1433971))

(declare-fun m!1433973 () Bool)

(assert (=> d!162141 m!1433973))

(assert (=> d!162141 m!1433829))

(assert (=> b!1556266 d!162141))

(declare-fun d!162145 () Bool)

(declare-fun res!1064820 () Bool)

(declare-fun e!866911 () Bool)

(assert (=> d!162145 (=> res!1064820 e!866911)))

(assert (=> d!162145 (= res!1064820 (and (is-Cons!36290 (t!51015 l!1177)) (= (_1!12459 (h!37736 (t!51015 l!1177))) otherKey!50)))))

(assert (=> d!162145 (= (containsKey!809 (t!51015 l!1177) otherKey!50) e!866911)))

(declare-fun b!1556492 () Bool)

(declare-fun e!866912 () Bool)

(assert (=> b!1556492 (= e!866911 e!866912)))

(declare-fun res!1064821 () Bool)

(assert (=> b!1556492 (=> (not res!1064821) (not e!866912))))

(assert (=> b!1556492 (= res!1064821 (and (or (not (is-Cons!36290 (t!51015 l!1177))) (bvsle (_1!12459 (h!37736 (t!51015 l!1177))) otherKey!50)) (is-Cons!36290 (t!51015 l!1177)) (bvslt (_1!12459 (h!37736 (t!51015 l!1177))) otherKey!50)))))

(declare-fun b!1556493 () Bool)

(assert (=> b!1556493 (= e!866912 (containsKey!809 (t!51015 (t!51015 l!1177)) otherKey!50))))

(assert (= (and d!162145 (not res!1064820)) b!1556492))

(assert (= (and b!1556492 res!1064821) b!1556493))

(declare-fun m!1433985 () Bool)

(assert (=> b!1556493 m!1433985))

(assert (=> b!1556266 d!162145))

(declare-fun d!162149 () Bool)

(declare-fun res!1064824 () Bool)

(declare-fun e!866915 () Bool)

(assert (=> d!162149 (=> res!1064824 e!866915)))

(assert (=> d!162149 (= res!1064824 (and (is-Cons!36290 lt!670399) (= (_1!12459 (h!37736 lt!670399)) otherKey!50)))))

(assert (=> d!162149 (= (containsKey!809 lt!670399 otherKey!50) e!866915)))

(declare-fun b!1556496 () Bool)

(declare-fun e!866916 () Bool)

(assert (=> b!1556496 (= e!866915 e!866916)))

(declare-fun res!1064825 () Bool)

(assert (=> b!1556496 (=> (not res!1064825) (not e!866916))))

(assert (=> b!1556496 (= res!1064825 (and (or (not (is-Cons!36290 lt!670399)) (bvsle (_1!12459 (h!37736 lt!670399)) otherKey!50)) (is-Cons!36290 lt!670399) (bvslt (_1!12459 (h!37736 lt!670399)) otherKey!50)))))

(declare-fun b!1556497 () Bool)

(assert (=> b!1556497 (= e!866916 (containsKey!809 (t!51015 lt!670399) otherKey!50))))

(assert (= (and d!162149 (not res!1064824)) b!1556496))

(assert (= (and b!1556496 res!1064825) b!1556497))

(declare-fun m!1433989 () Bool)

(assert (=> b!1556497 m!1433989))

(assert (=> b!1556266 d!162149))

(declare-fun b!1556540 () Bool)

(declare-fun e!866942 () Option!851)

(assert (=> b!1556540 (= e!866942 None!849)))

(declare-fun d!162153 () Bool)

(declare-fun c!143795 () Bool)

(assert (=> d!162153 (= c!143795 (and (is-Cons!36290 lt!670400) (= (_1!12459 (h!37736 lt!670400)) otherKey!50)))))

(declare-fun e!866941 () Option!851)

(assert (=> d!162153 (= (getValueByKey!775 lt!670400 otherKey!50) e!866941)))

(declare-fun b!1556538 () Bool)

(assert (=> b!1556538 (= e!866941 e!866942)))

(declare-fun c!143796 () Bool)

(assert (=> b!1556538 (= c!143796 (and (is-Cons!36290 lt!670400) (not (= (_1!12459 (h!37736 lt!670400)) otherKey!50))))))

(declare-fun b!1556537 () Bool)

(assert (=> b!1556537 (= e!866941 (Some!850 (_2!12459 (h!37736 lt!670400))))))

(declare-fun b!1556539 () Bool)

(assert (=> b!1556539 (= e!866942 (getValueByKey!775 (t!51015 lt!670400) otherKey!50))))

(assert (= (and d!162153 c!143795) b!1556537))

(assert (= (and d!162153 (not c!143795)) b!1556538))

(assert (= (and b!1556538 c!143796) b!1556539))

(assert (= (and b!1556538 (not c!143796)) b!1556540))

(declare-fun m!1434007 () Bool)

(assert (=> b!1556539 m!1434007))

(assert (=> b!1556267 d!162153))

(declare-fun b!1556548 () Bool)

(declare-fun e!866946 () Option!851)

(assert (=> b!1556548 (= e!866946 None!849)))

(declare-fun d!162163 () Bool)

(declare-fun c!143799 () Bool)

(assert (=> d!162163 (= c!143799 (and (is-Cons!36290 (t!51015 l!1177)) (= (_1!12459 (h!37736 (t!51015 l!1177))) otherKey!50)))))

(declare-fun e!866945 () Option!851)

(assert (=> d!162163 (= (getValueByKey!775 (t!51015 l!1177) otherKey!50) e!866945)))

(declare-fun b!1556546 () Bool)

(assert (=> b!1556546 (= e!866945 e!866946)))

(declare-fun c!143800 () Bool)

(assert (=> b!1556546 (= c!143800 (and (is-Cons!36290 (t!51015 l!1177)) (not (= (_1!12459 (h!37736 (t!51015 l!1177))) otherKey!50))))))

(declare-fun b!1556545 () Bool)

(assert (=> b!1556545 (= e!866945 (Some!850 (_2!12459 (h!37736 (t!51015 l!1177)))))))

(declare-fun b!1556547 () Bool)

(assert (=> b!1556547 (= e!866946 (getValueByKey!775 (t!51015 (t!51015 l!1177)) otherKey!50))))

(assert (= (and d!162163 c!143799) b!1556545))

(assert (= (and d!162163 (not c!143799)) b!1556546))

(assert (= (and b!1556546 c!143800) b!1556547))

(assert (= (and b!1556546 (not c!143800)) b!1556548))

(declare-fun m!1434011 () Bool)

(assert (=> b!1556547 m!1434011))

(assert (=> b!1556267 d!162163))

(declare-fun d!162167 () Bool)

(declare-fun res!1064842 () Bool)

(declare-fun e!866962 () Bool)

(assert (=> d!162167 (=> res!1064842 e!866962)))

(assert (=> d!162167 (= res!1064842 (or (is-Nil!36291 l!1177) (is-Nil!36291 (t!51015 l!1177))))))

(assert (=> d!162167 (= (isStrictlySorted!947 l!1177) e!866962)))

(declare-fun b!1556572 () Bool)

(declare-fun e!866963 () Bool)

(assert (=> b!1556572 (= e!866962 e!866963)))

(declare-fun res!1064843 () Bool)

(assert (=> b!1556572 (=> (not res!1064843) (not e!866963))))

(assert (=> b!1556572 (= res!1064843 (bvslt (_1!12459 (h!37736 l!1177)) (_1!12459 (h!37736 (t!51015 l!1177)))))))

(declare-fun b!1556573 () Bool)

(assert (=> b!1556573 (= e!866963 (isStrictlySorted!947 (t!51015 l!1177)))))

(assert (= (and d!162167 (not res!1064842)) b!1556572))

(assert (= (and b!1556572 res!1064843) b!1556573))

(assert (=> b!1556573 m!1433829))

(assert (=> start!132896 d!162167))

(declare-fun d!162175 () Bool)

(declare-fun res!1064844 () Bool)

(declare-fun e!866964 () Bool)

(assert (=> d!162175 (=> res!1064844 e!866964)))

(assert (=> d!162175 (= res!1064844 (or (is-Nil!36291 (t!51015 l!1177)) (is-Nil!36291 (t!51015 (t!51015 l!1177)))))))

(assert (=> d!162175 (= (isStrictlySorted!947 (t!51015 l!1177)) e!866964)))

(declare-fun b!1556574 () Bool)

(declare-fun e!866965 () Bool)

(assert (=> b!1556574 (= e!866964 e!866965)))

(declare-fun res!1064845 () Bool)

(assert (=> b!1556574 (=> (not res!1064845) (not e!866965))))

(assert (=> b!1556574 (= res!1064845 (bvslt (_1!12459 (h!37736 (t!51015 l!1177))) (_1!12459 (h!37736 (t!51015 (t!51015 l!1177))))))))

(declare-fun b!1556575 () Bool)

(assert (=> b!1556575 (= e!866965 (isStrictlySorted!947 (t!51015 (t!51015 l!1177))))))

(assert (= (and d!162175 (not res!1064844)) b!1556574))

(assert (= (and b!1556574 res!1064845) b!1556575))

(declare-fun m!1434017 () Bool)

(assert (=> b!1556575 m!1434017))

(assert (=> b!1556263 d!162175))

(declare-fun b!1556579 () Bool)

(declare-fun e!866967 () Option!851)

(assert (=> b!1556579 (= e!866967 None!849)))

(declare-fun d!162177 () Bool)

(declare-fun c!143807 () Bool)

(assert (=> d!162177 (= c!143807 (and (is-Cons!36290 lt!670399) (= (_1!12459 (h!37736 lt!670399)) otherKey!50)))))

(declare-fun e!866966 () Option!851)

(assert (=> d!162177 (= (getValueByKey!775 lt!670399 otherKey!50) e!866966)))

(declare-fun b!1556577 () Bool)

(assert (=> b!1556577 (= e!866966 e!866967)))

(declare-fun c!143808 () Bool)

(assert (=> b!1556577 (= c!143808 (and (is-Cons!36290 lt!670399) (not (= (_1!12459 (h!37736 lt!670399)) otherKey!50))))))

(declare-fun b!1556576 () Bool)

(assert (=> b!1556576 (= e!866966 (Some!850 (_2!12459 (h!37736 lt!670399))))))

(declare-fun b!1556578 () Bool)

(assert (=> b!1556578 (= e!866967 (getValueByKey!775 (t!51015 lt!670399) otherKey!50))))

(assert (= (and d!162177 c!143807) b!1556576))

(assert (= (and d!162177 (not c!143807)) b!1556577))

(assert (= (and b!1556577 c!143808) b!1556578))

(assert (= (and b!1556577 (not c!143808)) b!1556579))

(declare-fun m!1434019 () Bool)

(assert (=> b!1556578 m!1434019))

(assert (=> b!1556264 d!162177))

(declare-fun b!1556583 () Bool)

(declare-fun e!866969 () Option!851)

(assert (=> b!1556583 (= e!866969 None!849)))

(declare-fun d!162179 () Bool)

(declare-fun c!143809 () Bool)

(assert (=> d!162179 (= c!143809 (and (is-Cons!36290 l!1177) (= (_1!12459 (h!37736 l!1177)) otherKey!50)))))

(declare-fun e!866968 () Option!851)

(assert (=> d!162179 (= (getValueByKey!775 l!1177 otherKey!50) e!866968)))

(declare-fun b!1556581 () Bool)

(assert (=> b!1556581 (= e!866968 e!866969)))

(declare-fun c!143810 () Bool)

(assert (=> b!1556581 (= c!143810 (and (is-Cons!36290 l!1177) (not (= (_1!12459 (h!37736 l!1177)) otherKey!50))))))

(declare-fun b!1556580 () Bool)

(assert (=> b!1556580 (= e!866968 (Some!850 (_2!12459 (h!37736 l!1177))))))

(declare-fun b!1556582 () Bool)

(assert (=> b!1556582 (= e!866969 (getValueByKey!775 (t!51015 l!1177) otherKey!50))))

(assert (= (and d!162179 c!143809) b!1556580))

(assert (= (and d!162179 (not c!143809)) b!1556581))

(assert (= (and b!1556581 c!143810) b!1556582))

(assert (= (and b!1556581 (not c!143810)) b!1556583))

(assert (=> b!1556582 m!1433833))

(assert (=> b!1556264 d!162179))

(declare-fun b!1556588 () Bool)

(declare-fun e!866972 () Bool)

(declare-fun tp!112440 () Bool)

(assert (=> b!1556588 (= e!866972 (and tp_is_empty!38359 tp!112440))))

(assert (=> b!1556265 (= tp!112425 e!866972)))

(assert (= (and b!1556265 (is-Cons!36290 (t!51015 l!1177))) b!1556588))

(push 1)

(assert (not b!1556459))

(assert (not b!1556578))

(assert (not bm!71605))

(assert (not b!1556469))

(assert (not b!1556573))

(assert (not bm!71596))

(assert (not b!1556405))

(assert (not b!1556477))

(assert (not b!1556468))

(assert (not d!162129))

(assert (not b!1556575))

(assert tp_is_empty!38359)

(assert (not d!162141))

(assert (not b!1556539))

(assert (not b!1556465))

(assert (not b!1556497))

(assert (not d!162115))

(assert (not b!1556404))

(assert (not b!1556421))

(assert (not b!1556437))

(assert (not b!1556493))

(assert (not b!1556547))

(assert (not b!1556588))

(assert (not b!1556582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162219 () Bool)

(declare-fun res!1064877 () Bool)

(declare-fun e!867016 () Bool)

(assert (=> d!162219 (=> res!1064877 e!867016)))

(assert (=> d!162219 (= res!1064877 (and (is-Cons!36290 (t!51015 lt!670400)) (= (_1!12459 (h!37736 (t!51015 lt!670400))) otherKey!50)))))

(assert (=> d!162219 (= (containsKey!809 (t!51015 lt!670400) otherKey!50) e!867016)))

(declare-fun b!1556645 () Bool)

(declare-fun e!867017 () Bool)

(assert (=> b!1556645 (= e!867016 e!867017)))

(declare-fun res!1064878 () Bool)

(assert (=> b!1556645 (=> (not res!1064878) (not e!867017))))

(assert (=> b!1556645 (= res!1064878 (and (or (not (is-Cons!36290 (t!51015 lt!670400))) (bvsle (_1!12459 (h!37736 (t!51015 lt!670400))) otherKey!50)) (is-Cons!36290 (t!51015 lt!670400)) (bvslt (_1!12459 (h!37736 (t!51015 lt!670400))) otherKey!50)))))

(declare-fun b!1556646 () Bool)

(assert (=> b!1556646 (= e!867017 (containsKey!809 (t!51015 (t!51015 lt!670400)) otherKey!50))))

(assert (= (and d!162219 (not res!1064877)) b!1556645))

(assert (= (and b!1556645 res!1064878) b!1556646))

(declare-fun m!1434069 () Bool)

(assert (=> b!1556646 m!1434069))

(assert (=> b!1556437 d!162219))

(declare-fun b!1556650 () Bool)

(declare-fun e!867019 () Option!851)

(assert (=> b!1556650 (= e!867019 None!849)))

(declare-fun d!162221 () Bool)

(declare-fun c!143823 () Bool)

(assert (=> d!162221 (= c!143823 (and (is-Cons!36290 (t!51015 (t!51015 l!1177))) (= (_1!12459 (h!37736 (t!51015 (t!51015 l!1177)))) otherKey!50)))))

(declare-fun e!867018 () Option!851)

(assert (=> d!162221 (= (getValueByKey!775 (t!51015 (t!51015 l!1177)) otherKey!50) e!867018)))

(declare-fun b!1556648 () Bool)

(assert (=> b!1556648 (= e!867018 e!867019)))

(declare-fun c!143824 () Bool)

(assert (=> b!1556648 (= c!143824 (and (is-Cons!36290 (t!51015 (t!51015 l!1177))) (not (= (_1!12459 (h!37736 (t!51015 (t!51015 l!1177)))) otherKey!50))))))

(declare-fun b!1556647 () Bool)

(assert (=> b!1556647 (= e!867018 (Some!850 (_2!12459 (h!37736 (t!51015 (t!51015 l!1177))))))))

(declare-fun b!1556649 () Bool)

(assert (=> b!1556649 (= e!867019 (getValueByKey!775 (t!51015 (t!51015 (t!51015 l!1177))) otherKey!50))))

(assert (= (and d!162221 c!143823) b!1556647))

(assert (= (and d!162221 (not c!143823)) b!1556648))

(assert (= (and b!1556648 c!143824) b!1556649))

(assert (= (and b!1556648 (not c!143824)) b!1556650))

(declare-fun m!1434071 () Bool)

(assert (=> b!1556649 m!1434071))

(assert (=> b!1556547 d!162221))

(declare-fun d!162223 () Bool)

(declare-fun res!1064879 () Bool)

(declare-fun e!867020 () Bool)

(assert (=> d!162223 (=> res!1064879 e!867020)))

(assert (=> d!162223 (= res!1064879 (and (is-Cons!36290 (t!51015 lt!670399)) (= (_1!12459 (h!37736 (t!51015 lt!670399))) otherKey!50)))))

(assert (=> d!162223 (= (containsKey!809 (t!51015 lt!670399) otherKey!50) e!867020)))

(declare-fun b!1556651 () Bool)

(declare-fun e!867021 () Bool)

(assert (=> b!1556651 (= e!867020 e!867021)))

(declare-fun res!1064880 () Bool)

(assert (=> b!1556651 (=> (not res!1064880) (not e!867021))))

(assert (=> b!1556651 (= res!1064880 (and (or (not (is-Cons!36290 (t!51015 lt!670399))) (bvsle (_1!12459 (h!37736 (t!51015 lt!670399))) otherKey!50)) (is-Cons!36290 (t!51015 lt!670399)) (bvslt (_1!12459 (h!37736 (t!51015 lt!670399))) otherKey!50)))))

(declare-fun b!1556652 () Bool)

(assert (=> b!1556652 (= e!867021 (containsKey!809 (t!51015 (t!51015 lt!670399)) otherKey!50))))

(assert (= (and d!162223 (not res!1064879)) b!1556651))

(assert (= (and b!1556651 res!1064880) b!1556652))

(declare-fun m!1434073 () Bool)

(assert (=> b!1556652 m!1434073))

(assert (=> b!1556497 d!162223))

(declare-fun d!162225 () Bool)

(assert (=> d!162225 (= ($colon$colon!966 e!866854 (ite c!143765 (h!37736 l!1177) (tuple2!24897 newKey!105 newValue!105))) (Cons!36290 (ite c!143765 (h!37736 l!1177) (tuple2!24897 newKey!105 newValue!105)) e!866854))))

(assert (=> bm!71596 d!162225))

(declare-fun d!162227 () Bool)

(assert (=> d!162227 (= ($colon$colon!966 e!866901 (ite c!143776 (h!37736 (t!51015 l!1177)) (tuple2!24897 newKey!105 newValue!105))) (Cons!36290 (ite c!143776 (h!37736 (t!51015 l!1177)) (tuple2!24897 newKey!105 newValue!105)) e!866901))))

(assert (=> bm!71605 d!162227))

(assert (=> d!162129 d!162175))

(assert (=> d!162129 d!162141))

(assert (=> d!162129 d!162145))

(declare-fun d!162229 () Bool)

(declare-fun res!1064881 () Bool)

(declare-fun e!867022 () Bool)

(assert (=> d!162229 (=> res!1064881 e!867022)))

(assert (=> d!162229 (= res!1064881 (and (is-Cons!36290 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105)) (= (_1!12459 (h!37736 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(assert (=> d!162229 (= (containsKey!809 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105) otherKey!50) e!867022)))

(declare-fun b!1556653 () Bool)

(declare-fun e!867023 () Bool)

(assert (=> b!1556653 (= e!867022 e!867023)))

(declare-fun res!1064882 () Bool)

(assert (=> b!1556653 (=> (not res!1064882) (not e!867023))))

(assert (=> b!1556653 (= res!1064882 (and (or (not (is-Cons!36290 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105))) (bvsle (_1!12459 (h!37736 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105))) otherKey!50)) (is-Cons!36290 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105)) (bvslt (_1!12459 (h!37736 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(declare-fun b!1556654 () Bool)

(assert (=> b!1556654 (= e!867023 (containsKey!809 (t!51015 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105)) otherKey!50))))

(assert (= (and d!162229 (not res!1064881)) b!1556653))

(assert (= (and b!1556653 res!1064882) b!1556654))

(declare-fun m!1434075 () Bool)

(assert (=> b!1556654 m!1434075))

(assert (=> d!162129 d!162229))

(declare-fun d!162231 () Bool)

(declare-fun e!867026 () Bool)

(assert (=> d!162231 e!867026))

(declare-fun res!1064885 () Bool)

(assert (=> d!162231 (=> (not res!1064885) (not e!867026))))

(assert (=> d!162231 (= res!1064885 (= (containsKey!809 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!809 (t!51015 l!1177) otherKey!50)))))

(assert (=> d!162231 true))

(declare-fun _$16!193 () Unit!51838)

(assert (=> d!162231 (= (choose!2061 (t!51015 l!1177) newKey!105 newValue!105 otherKey!50) _$16!193)))

(declare-fun b!1556657 () Bool)

(assert (=> b!1556657 (= e!867026 (= (getValueByKey!775 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!775 (t!51015 l!1177) otherKey!50)))))

(assert (= (and d!162231 res!1064885) b!1556657))

(assert (=> d!162231 m!1433841))

(assert (=> d!162231 m!1433841))

(assert (=> d!162231 m!1433955))

(assert (=> d!162231 m!1433843))

(assert (=> b!1556657 m!1433841))

(assert (=> b!1556657 m!1433841))

(assert (=> b!1556657 m!1433961))

(assert (=> b!1556657 m!1433833))

(assert (=> d!162129 d!162231))

(declare-fun b!1556661 () Bool)

(declare-fun e!867028 () Option!851)

(assert (=> b!1556661 (= e!867028 None!849)))

(declare-fun d!162233 () Bool)

(declare-fun c!143825 () Bool)

(assert (=> d!162233 (= c!143825 (and (is-Cons!36290 (t!51015 lt!670399)) (= (_1!12459 (h!37736 (t!51015 lt!670399))) otherKey!50)))))

(declare-fun e!867027 () Option!851)

(assert (=> d!162233 (= (getValueByKey!775 (t!51015 lt!670399) otherKey!50) e!867027)))

(declare-fun b!1556659 () Bool)

(assert (=> b!1556659 (= e!867027 e!867028)))

(declare-fun c!143826 () Bool)

(assert (=> b!1556659 (= c!143826 (and (is-Cons!36290 (t!51015 lt!670399)) (not (= (_1!12459 (h!37736 (t!51015 lt!670399))) otherKey!50))))))

(declare-fun b!1556658 () Bool)

(assert (=> b!1556658 (= e!867027 (Some!850 (_2!12459 (h!37736 (t!51015 lt!670399)))))))

(declare-fun b!1556660 () Bool)

(assert (=> b!1556660 (= e!867028 (getValueByKey!775 (t!51015 (t!51015 lt!670399)) otherKey!50))))

(assert (= (and d!162233 c!143825) b!1556658))

(assert (= (and d!162233 (not c!143825)) b!1556659))

(assert (= (and b!1556659 c!143826) b!1556660))

(assert (= (and b!1556659 (not c!143826)) b!1556661))

(declare-fun m!1434077 () Bool)

(assert (=> b!1556660 m!1434077))

(assert (=> b!1556578 d!162233))

(declare-fun d!162235 () Bool)

(declare-fun res!1064886 () Bool)

(declare-fun e!867029 () Bool)

(assert (=> d!162235 (=> res!1064886 e!867029)))

(assert (=> d!162235 (= res!1064886 (and (is-Cons!36290 lt!670426) (= (_1!12459 (h!37736 lt!670426)) newKey!105)))))

(assert (=> d!162235 (= (containsKey!809 lt!670426 newKey!105) e!867029)))

(declare-fun b!1556662 () Bool)

(declare-fun e!867030 () Bool)

(assert (=> b!1556662 (= e!867029 e!867030)))

(declare-fun res!1064887 () Bool)

(assert (=> b!1556662 (=> (not res!1064887) (not e!867030))))

(assert (=> b!1556662 (= res!1064887 (and (or (not (is-Cons!36290 lt!670426)) (bvsle (_1!12459 (h!37736 lt!670426)) newKey!105)) (is-Cons!36290 lt!670426) (bvslt (_1!12459 (h!37736 lt!670426)) newKey!105)))))

(declare-fun b!1556663 () Bool)

(assert (=> b!1556663 (= e!867030 (containsKey!809 (t!51015 lt!670426) newKey!105))))

(assert (= (and d!162235 (not res!1064886)) b!1556662))

(assert (= (and b!1556662 res!1064887) b!1556663))

(declare-fun m!1434079 () Bool)

(assert (=> b!1556663 m!1434079))

(assert (=> b!1556404 d!162235))

(declare-fun d!162237 () Bool)

(declare-fun res!1064888 () Bool)

(declare-fun e!867031 () Bool)

(assert (=> d!162237 (=> res!1064888 e!867031)))

(assert (=> d!162237 (= res!1064888 (or (is-Nil!36291 (t!51015 (t!51015 l!1177))) (is-Nil!36291 (t!51015 (t!51015 (t!51015 l!1177))))))))

(assert (=> d!162237 (= (isStrictlySorted!947 (t!51015 (t!51015 l!1177))) e!867031)))

(declare-fun b!1556664 () Bool)

(declare-fun e!867032 () Bool)

(assert (=> b!1556664 (= e!867031 e!867032)))

(declare-fun res!1064889 () Bool)

(assert (=> b!1556664 (=> (not res!1064889) (not e!867032))))

(assert (=> b!1556664 (= res!1064889 (bvslt (_1!12459 (h!37736 (t!51015 (t!51015 l!1177)))) (_1!12459 (h!37736 (t!51015 (t!51015 (t!51015 l!1177)))))))))

(declare-fun b!1556665 () Bool)

(assert (=> b!1556665 (= e!867032 (isStrictlySorted!947 (t!51015 (t!51015 (t!51015 l!1177)))))))

(assert (= (and d!162237 (not res!1064888)) b!1556664))

(assert (= (and b!1556664 res!1064889) b!1556665))

(declare-fun m!1434081 () Bool)

(assert (=> b!1556665 m!1434081))

(assert (=> b!1556575 d!162237))

(declare-fun lt!670447 () Bool)

(declare-fun d!162239 () Bool)

(declare-fun content!797 (List!36294) (Set tuple2!24896))

(assert (=> d!162239 (= lt!670447 (set.member (tuple2!24897 newKey!105 newValue!105) (content!797 lt!670437)))))

(declare-fun e!867037 () Bool)

(assert (=> d!162239 (= lt!670447 e!867037)))

(declare-fun res!1064895 () Bool)

(assert (=> d!162239 (=> (not res!1064895) (not e!867037))))

(assert (=> d!162239 (= res!1064895 (is-Cons!36290 lt!670437))))

(assert (=> d!162239 (= (contains!10182 lt!670437 (tuple2!24897 newKey!105 newValue!105)) lt!670447)))

(declare-fun b!1556670 () Bool)

(declare-fun e!867038 () Bool)

(assert (=> b!1556670 (= e!867037 e!867038)))

(declare-fun res!1064894 () Bool)

(assert (=> b!1556670 (=> res!1064894 e!867038)))

(assert (=> b!1556670 (= res!1064894 (= (h!37736 lt!670437) (tuple2!24897 newKey!105 newValue!105)))))

(declare-fun b!1556671 () Bool)

(assert (=> b!1556671 (= e!867038 (contains!10182 (t!51015 lt!670437) (tuple2!24897 newKey!105 newValue!105)))))

(assert (= (and d!162239 res!1064895) b!1556670))

(assert (= (and b!1556670 (not res!1064894)) b!1556671))

(declare-fun m!1434083 () Bool)

(assert (=> d!162239 m!1434083))

(declare-fun m!1434085 () Bool)

(assert (=> d!162239 m!1434085))

(declare-fun m!1434087 () Bool)

(assert (=> b!1556671 m!1434087))

(assert (=> b!1556477 d!162239))

(declare-fun d!162241 () Bool)

(declare-fun res!1064896 () Bool)

(declare-fun e!867039 () Bool)

(assert (=> d!162241 (=> res!1064896 e!867039)))

(assert (=> d!162241 (= res!1064896 (and (is-Cons!36290 (t!51015 (t!51015 l!1177))) (= (_1!12459 (h!37736 (t!51015 (t!51015 l!1177)))) otherKey!50)))))

(assert (=> d!162241 (= (containsKey!809 (t!51015 (t!51015 l!1177)) otherKey!50) e!867039)))

(declare-fun b!1556672 () Bool)

(declare-fun e!867040 () Bool)

(assert (=> b!1556672 (= e!867039 e!867040)))

(declare-fun res!1064897 () Bool)

(assert (=> b!1556672 (=> (not res!1064897) (not e!867040))))

(assert (=> b!1556672 (= res!1064897 (and (or (not (is-Cons!36290 (t!51015 (t!51015 l!1177)))) (bvsle (_1!12459 (h!37736 (t!51015 (t!51015 l!1177)))) otherKey!50)) (is-Cons!36290 (t!51015 (t!51015 l!1177))) (bvslt (_1!12459 (h!37736 (t!51015 (t!51015 l!1177)))) otherKey!50)))))

(declare-fun b!1556673 () Bool)

(assert (=> b!1556673 (= e!867040 (containsKey!809 (t!51015 (t!51015 (t!51015 l!1177))) otherKey!50))))

(assert (= (and d!162241 (not res!1064896)) b!1556672))

(assert (= (and b!1556672 res!1064897) b!1556673))

(declare-fun m!1434089 () Bool)

(assert (=> b!1556673 m!1434089))

(assert (=> b!1556493 d!162241))

(declare-fun d!162243 () Bool)

(declare-fun lt!670448 () Bool)

(assert (=> d!162243 (= lt!670448 (set.member (tuple2!24897 newKey!105 newValue!105) (content!797 lt!670426)))))

(declare-fun e!867041 () Bool)

(assert (=> d!162243 (= lt!670448 e!867041)))

(declare-fun res!1064899 () Bool)

(assert (=> d!162243 (=> (not res!1064899) (not e!867041))))

(assert (=> d!162243 (= res!1064899 (is-Cons!36290 lt!670426))))

(assert (=> d!162243 (= (contains!10182 lt!670426 (tuple2!24897 newKey!105 newValue!105)) lt!670448)))

(declare-fun b!1556674 () Bool)

(declare-fun e!867042 () Bool)

(assert (=> b!1556674 (= e!867041 e!867042)))

(declare-fun res!1064898 () Bool)

(assert (=> b!1556674 (=> res!1064898 e!867042)))

(assert (=> b!1556674 (= res!1064898 (= (h!37736 lt!670426) (tuple2!24897 newKey!105 newValue!105)))))

(declare-fun b!1556675 () Bool)

(assert (=> b!1556675 (= e!867042 (contains!10182 (t!51015 lt!670426) (tuple2!24897 newKey!105 newValue!105)))))

(assert (= (and d!162243 res!1064899) b!1556674))

(assert (= (and b!1556674 (not res!1064898)) b!1556675))

(declare-fun m!1434091 () Bool)

(assert (=> d!162243 m!1434091))

(declare-fun m!1434093 () Bool)

(assert (=> d!162243 m!1434093))

(declare-fun m!1434095 () Bool)

(assert (=> b!1556675 m!1434095))

(assert (=> b!1556421 d!162243))

(declare-fun d!162245 () Bool)

(declare-fun res!1064900 () Bool)

(declare-fun e!867043 () Bool)

(assert (=> d!162245 (=> res!1064900 e!867043)))

(assert (=> d!162245 (= res!1064900 (and (is-Cons!36290 lt!670437) (= (_1!12459 (h!37736 lt!670437)) newKey!105)))))

(assert (=> d!162245 (= (containsKey!809 lt!670437 newKey!105) e!867043)))

(declare-fun b!1556676 () Bool)

(declare-fun e!867044 () Bool)

(assert (=> b!1556676 (= e!867043 e!867044)))

(declare-fun res!1064901 () Bool)

(assert (=> b!1556676 (=> (not res!1064901) (not e!867044))))

(assert (=> b!1556676 (= res!1064901 (and (or (not (is-Cons!36290 lt!670437)) (bvsle (_1!12459 (h!37736 lt!670437)) newKey!105)) (is-Cons!36290 lt!670437) (bvslt (_1!12459 (h!37736 lt!670437)) newKey!105)))))

(declare-fun b!1556677 () Bool)

(assert (=> b!1556677 (= e!867044 (containsKey!809 (t!51015 lt!670437) newKey!105))))

(assert (= (and d!162245 (not res!1064900)) b!1556676))

(assert (= (and b!1556676 res!1064901) b!1556677))

(declare-fun m!1434097 () Bool)

(assert (=> b!1556677 m!1434097))

(assert (=> b!1556468 d!162245))

(declare-fun bm!71617 () Bool)

(declare-fun c!143828 () Bool)

(declare-fun e!867049 () List!36294)

(declare-fun call!71620 () List!36294)

(assert (=> bm!71617 (= call!71620 ($colon$colon!966 e!867049 (ite c!143828 (h!37736 (t!51015 (t!51015 l!1177))) (tuple2!24897 newKey!105 newValue!105))))))

(declare-fun c!143829 () Bool)

(assert (=> bm!71617 (= c!143829 c!143828)))

(declare-fun b!1556678 () Bool)

(declare-fun res!1064903 () Bool)

(declare-fun e!867046 () Bool)

(assert (=> b!1556678 (=> (not res!1064903) (not e!867046))))

(declare-fun lt!670449 () List!36294)

(assert (=> b!1556678 (= res!1064903 (containsKey!809 lt!670449 newKey!105))))

(declare-fun b!1556679 () Bool)

(assert (=> b!1556679 (= e!867049 (insertStrictlySorted!549 (t!51015 (t!51015 (t!51015 l!1177))) newKey!105 newValue!105))))

(declare-fun bm!71618 () Bool)

(declare-fun call!71621 () List!36294)

(declare-fun call!71622 () List!36294)

(assert (=> bm!71618 (= call!71621 call!71622)))

(declare-fun bm!71619 () Bool)

(assert (=> bm!71619 (= call!71622 call!71620)))

(declare-fun b!1556680 () Bool)

(declare-fun c!143827 () Bool)

(assert (=> b!1556680 (= c!143827 (and (is-Cons!36290 (t!51015 (t!51015 l!1177))) (bvsgt (_1!12459 (h!37736 (t!51015 (t!51015 l!1177)))) newKey!105)))))

(declare-fun e!867045 () List!36294)

(declare-fun e!867047 () List!36294)

(assert (=> b!1556680 (= e!867045 e!867047)))

(declare-fun c!143830 () Bool)

(declare-fun b!1556682 () Bool)

(assert (=> b!1556682 (= e!867049 (ite c!143830 (t!51015 (t!51015 (t!51015 l!1177))) (ite c!143827 (Cons!36290 (h!37736 (t!51015 (t!51015 l!1177))) (t!51015 (t!51015 (t!51015 l!1177)))) Nil!36291)))))

(declare-fun b!1556683 () Bool)

(assert (=> b!1556683 (= e!867047 call!71621)))

(declare-fun b!1556684 () Bool)

(assert (=> b!1556684 (= e!867045 call!71622)))

(declare-fun b!1556685 () Bool)

(declare-fun e!867048 () List!36294)

(assert (=> b!1556685 (= e!867048 e!867045)))

(assert (=> b!1556685 (= c!143830 (and (is-Cons!36290 (t!51015 (t!51015 l!1177))) (= (_1!12459 (h!37736 (t!51015 (t!51015 l!1177)))) newKey!105)))))

(declare-fun b!1556686 () Bool)

(assert (=> b!1556686 (= e!867047 call!71621)))

(declare-fun b!1556687 () Bool)

(assert (=> b!1556687 (= e!867046 (contains!10182 lt!670449 (tuple2!24897 newKey!105 newValue!105)))))

(declare-fun d!162247 () Bool)

(assert (=> d!162247 e!867046))

(declare-fun res!1064902 () Bool)

(assert (=> d!162247 (=> (not res!1064902) (not e!867046))))

(assert (=> d!162247 (= res!1064902 (isStrictlySorted!947 lt!670449))))

(assert (=> d!162247 (= lt!670449 e!867048)))

(assert (=> d!162247 (= c!143828 (and (is-Cons!36290 (t!51015 (t!51015 l!1177))) (bvslt (_1!12459 (h!37736 (t!51015 (t!51015 l!1177)))) newKey!105)))))

(assert (=> d!162247 (isStrictlySorted!947 (t!51015 (t!51015 l!1177)))))

(assert (=> d!162247 (= (insertStrictlySorted!549 (t!51015 (t!51015 l!1177)) newKey!105 newValue!105) lt!670449)))

(declare-fun b!1556681 () Bool)

(assert (=> b!1556681 (= e!867048 call!71620)))

(assert (= (and d!162247 c!143828) b!1556681))

(assert (= (and d!162247 (not c!143828)) b!1556685))

(assert (= (and b!1556685 c!143830) b!1556684))

(assert (= (and b!1556685 (not c!143830)) b!1556680))

(assert (= (and b!1556680 c!143827) b!1556686))

(assert (= (and b!1556680 (not c!143827)) b!1556683))

(assert (= (or b!1556686 b!1556683) bm!71618))

(assert (= (or b!1556684 bm!71618) bm!71619))

(assert (= (or b!1556681 bm!71619) bm!71617))

(assert (= (and bm!71617 c!143829) b!1556679))

(assert (= (and bm!71617 (not c!143829)) b!1556682))

(assert (= (and d!162247 res!1064902) b!1556678))

(assert (= (and b!1556678 res!1064903) b!1556687))

(declare-fun m!1434099 () Bool)

(assert (=> b!1556678 m!1434099))

(declare-fun m!1434101 () Bool)

(assert (=> bm!71617 m!1434101))

(declare-fun m!1434103 () Bool)

(assert (=> b!1556687 m!1434103))

(declare-fun m!1434105 () Bool)

(assert (=> b!1556679 m!1434105))

(declare-fun m!1434107 () Bool)

(assert (=> d!162247 m!1434107))

(assert (=> d!162247 m!1434017))

(assert (=> b!1556469 d!162247))

(assert (=> b!1556582 d!162163))

(assert (=> b!1556405 d!162141))

(declare-fun d!162249 () Bool)

(declare-fun res!1064904 () Bool)

(declare-fun e!867050 () Bool)

(assert (=> d!162249 (=> res!1064904 e!867050)))

(assert (=> d!162249 (= res!1064904 (or (is-Nil!36291 lt!670426) (is-Nil!36291 (t!51015 lt!670426))))))

(assert (=> d!162249 (= (isStrictlySorted!947 lt!670426) e!867050)))

(declare-fun b!1556688 () Bool)

(declare-fun e!867051 () Bool)

(assert (=> b!1556688 (= e!867050 e!867051)))

(declare-fun res!1064905 () Bool)

(assert (=> b!1556688 (=> (not res!1064905) (not e!867051))))

(assert (=> b!1556688 (= res!1064905 (bvslt (_1!12459 (h!37736 lt!670426)) (_1!12459 (h!37736 (t!51015 lt!670426)))))))

(declare-fun b!1556689 () Bool)

(assert (=> b!1556689 (= e!867051 (isStrictlySorted!947 (t!51015 lt!670426)))))

(assert (= (and d!162249 (not res!1064904)) b!1556688))

(assert (= (and b!1556688 res!1064905) b!1556689))

(declare-fun m!1434109 () Bool)

(assert (=> b!1556689 m!1434109))

(assert (=> d!162115 d!162249))

(assert (=> d!162115 d!162167))

(assert (=> b!1556573 d!162175))

(assert (=> b!1556465 d!162145))

(declare-fun b!1556693 () Bool)

(declare-fun e!867053 () Option!851)

(assert (=> b!1556693 (= e!867053 None!849)))

(declare-fun d!162251 () Bool)

(declare-fun c!143831 () Bool)

(assert (=> d!162251 (= c!143831 (and (is-Cons!36290 (t!51015 lt!670400)) (= (_1!12459 (h!37736 (t!51015 lt!670400))) otherKey!50)))))

(declare-fun e!867052 () Option!851)

(assert (=> d!162251 (= (getValueByKey!775 (t!51015 lt!670400) otherKey!50) e!867052)))

(declare-fun b!1556691 () Bool)

(assert (=> b!1556691 (= e!867052 e!867053)))

(declare-fun c!143832 () Bool)

(assert (=> b!1556691 (= c!143832 (and (is-Cons!36290 (t!51015 lt!670400)) (not (= (_1!12459 (h!37736 (t!51015 lt!670400))) otherKey!50))))))

(declare-fun b!1556690 () Bool)

(assert (=> b!1556690 (= e!867052 (Some!850 (_2!12459 (h!37736 (t!51015 lt!670400)))))))

(declare-fun b!1556692 () Bool)

(assert (=> b!1556692 (= e!867053 (getValueByKey!775 (t!51015 (t!51015 lt!670400)) otherKey!50))))

(assert (= (and d!162251 c!143831) b!1556690))

(assert (= (and d!162251 (not c!143831)) b!1556691))

(assert (= (and b!1556691 c!143832) b!1556692))

(assert (= (and b!1556691 (not c!143832)) b!1556693))

(declare-fun m!1434111 () Bool)

(assert (=> b!1556692 m!1434111))

(assert (=> b!1556539 d!162251))

(declare-fun d!162253 () Bool)

(declare-fun res!1064906 () Bool)

(declare-fun e!867054 () Bool)

(assert (=> d!162253 (=> res!1064906 e!867054)))

(assert (=> d!162253 (= res!1064906 (or (is-Nil!36291 lt!670437) (is-Nil!36291 (t!51015 lt!670437))))))

(assert (=> d!162253 (= (isStrictlySorted!947 lt!670437) e!867054)))

(declare-fun b!1556694 () Bool)

(declare-fun e!867055 () Bool)

(assert (=> b!1556694 (= e!867054 e!867055)))

(declare-fun res!1064907 () Bool)

(assert (=> b!1556694 (=> (not res!1064907) (not e!867055))))

(assert (=> b!1556694 (= res!1064907 (bvslt (_1!12459 (h!37736 lt!670437)) (_1!12459 (h!37736 (t!51015 lt!670437)))))))

(declare-fun b!1556695 () Bool)

(assert (=> b!1556695 (= e!867055 (isStrictlySorted!947 (t!51015 lt!670437)))))

(assert (= (and d!162253 (not res!1064906)) b!1556694))

(assert (= (and b!1556694 res!1064907) b!1556695))

(declare-fun m!1434113 () Bool)

(assert (=> b!1556695 m!1434113))

(assert (=> d!162141 d!162253))

(assert (=> d!162141 d!162175))

(declare-fun b!1556699 () Bool)

(declare-fun e!867057 () Option!851)

(assert (=> b!1556699 (= e!867057 None!849)))

(declare-fun c!143833 () Bool)

(declare-fun d!162255 () Bool)

(assert (=> d!162255 (= c!143833 (and (is-Cons!36290 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105)) (= (_1!12459 (h!37736 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(declare-fun e!867056 () Option!851)

(assert (=> d!162255 (= (getValueByKey!775 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105) otherKey!50) e!867056)))

(declare-fun b!1556697 () Bool)

(assert (=> b!1556697 (= e!867056 e!867057)))

(declare-fun c!143834 () Bool)

(assert (=> b!1556697 (= c!143834 (and (is-Cons!36290 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105)) (not (= (_1!12459 (h!37736 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105))) otherKey!50))))))

(declare-fun b!1556696 () Bool)

(assert (=> b!1556696 (= e!867056 (Some!850 (_2!12459 (h!37736 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105)))))))

(declare-fun b!1556698 () Bool)

(assert (=> b!1556698 (= e!867057 (getValueByKey!775 (t!51015 (insertStrictlySorted!549 (t!51015 l!1177) newKey!105 newValue!105)) otherKey!50))))

(assert (= (and d!162255 c!143833) b!1556696))

(assert (= (and d!162255 (not c!143833)) b!1556697))

(assert (= (and b!1556697 c!143834) b!1556698))

(assert (= (and b!1556697 (not c!143834)) b!1556699))

(declare-fun m!1434115 () Bool)

(assert (=> b!1556698 m!1434115))

(assert (=> b!1556459 d!162255))

(assert (=> b!1556459 d!162141))

(assert (=> b!1556459 d!162163))

(declare-fun b!1556700 () Bool)

(declare-fun e!867058 () Bool)

(declare-fun tp!112442 () Bool)

(assert (=> b!1556700 (= e!867058 (and tp_is_empty!38359 tp!112442))))

(assert (=> b!1556588 (= tp!112440 e!867058)))

(assert (= (and b!1556588 (is-Cons!36290 (t!51015 (t!51015 l!1177)))) b!1556700))

(push 1)

(assert (not b!1556695))

(assert (not b!1556677))

(assert (not b!1556657))

(assert (not b!1556692))

(assert (not b!1556671))

(assert (not b!1556652))

(assert (not b!1556673))

(assert (not b!1556649))

(assert (not d!162247))

(assert (not b!1556665))

(assert (not b!1556678))

(assert (not b!1556698))

(assert (not b!1556646))

(assert (not b!1556687))

(assert (not b!1556679))

(assert (not b!1556700))

(assert (not bm!71617))

(assert tp_is_empty!38359)

(assert (not d!162231))

(assert (not b!1556689))

(assert (not b!1556675))

(assert (not b!1556654))

(assert (not b!1556663))

(assert (not d!162239))

(assert (not b!1556660))

(assert (not d!162243))

(check-sat)

(pop 1)

(push 1)

(check-sat)

