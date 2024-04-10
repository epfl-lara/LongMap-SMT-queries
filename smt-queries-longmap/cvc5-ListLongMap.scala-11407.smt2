; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132818 () Bool)

(assert start!132818)

(declare-fun b!1555801 () Bool)

(declare-fun e!866447 () Bool)

(declare-datatypes ((B!2318 0))(
  ( (B!2319 (val!19245 Int)) )
))
(declare-datatypes ((tuple2!24866 0))(
  ( (tuple2!24867 (_1!12444 (_ BitVec 64)) (_2!12444 B!2318)) )
))
(declare-datatypes ((List!36279 0))(
  ( (Nil!36276) (Cons!36275 (h!37721 tuple2!24866) (t!51000 List!36279)) )
))
(declare-fun lt!670346 () List!36279)

(declare-fun isStrictlySorted!932 (List!36279) Bool)

(assert (=> b!1555801 (= e!866447 (not (isStrictlySorted!932 lt!670346)))))

(declare-fun b!1555799 () Bool)

(declare-fun res!1064465 () Bool)

(declare-fun e!866446 () Bool)

(assert (=> b!1555799 (=> (not res!1064465) (not e!866446))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun l!1177 () List!36279)

(assert (=> b!1555799 (= res!1064465 (and (not (= newKey!105 otherKey!50)) (or (not (is-Cons!36275 l!1177)) (= (_1!12444 (h!37721 l!1177)) otherKey!50))))))

(declare-fun res!1064467 () Bool)

(assert (=> start!132818 (=> (not res!1064467) (not e!866446))))

(assert (=> start!132818 (= res!1064467 (isStrictlySorted!932 l!1177))))

(assert (=> start!132818 e!866446))

(declare-fun e!866445 () Bool)

(assert (=> start!132818 e!866445))

(assert (=> start!132818 true))

(declare-fun tp_is_empty!38329 () Bool)

(assert (=> start!132818 tp_is_empty!38329))

(declare-fun b!1555800 () Bool)

(assert (=> b!1555800 (= e!866446 e!866447)))

(declare-fun res!1064466 () Bool)

(assert (=> b!1555800 (=> (not res!1064466) (not e!866447))))

(declare-fun containsKey!803 (List!36279 (_ BitVec 64)) Bool)

(assert (=> b!1555800 (= res!1064466 (= (containsKey!803 lt!670346 otherKey!50) (containsKey!803 l!1177 otherKey!50)))))

(declare-fun newValue!105 () B!2318)

(declare-fun insertStrictlySorted!543 (List!36279 (_ BitVec 64) B!2318) List!36279)

(assert (=> b!1555800 (= lt!670346 (insertStrictlySorted!543 l!1177 newKey!105 newValue!105))))

(declare-fun b!1555802 () Bool)

(declare-fun tp!112344 () Bool)

(assert (=> b!1555802 (= e!866445 (and tp_is_empty!38329 tp!112344))))

(assert (= (and start!132818 res!1064467) b!1555799))

(assert (= (and b!1555799 res!1064465) b!1555800))

(assert (= (and b!1555800 res!1064466) b!1555801))

(assert (= (and start!132818 (is-Cons!36275 l!1177)) b!1555802))

(declare-fun m!1433649 () Bool)

(assert (=> b!1555801 m!1433649))

(declare-fun m!1433651 () Bool)

(assert (=> start!132818 m!1433651))

(declare-fun m!1433653 () Bool)

(assert (=> b!1555800 m!1433653))

(declare-fun m!1433655 () Bool)

(assert (=> b!1555800 m!1433655))

(declare-fun m!1433657 () Bool)

(assert (=> b!1555800 m!1433657))

(push 1)

(assert (not b!1555802))

(assert tp_is_empty!38329)

(assert (not b!1555801))

(assert (not start!132818))

(assert (not b!1555800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162017 () Bool)

(declare-fun res!1064504 () Bool)

(declare-fun e!866484 () Bool)

(assert (=> d!162017 (=> res!1064504 e!866484)))

(assert (=> d!162017 (= res!1064504 (or (is-Nil!36276 lt!670346) (is-Nil!36276 (t!51000 lt!670346))))))

(assert (=> d!162017 (= (isStrictlySorted!932 lt!670346) e!866484)))

(declare-fun b!1555843 () Bool)

(declare-fun e!866485 () Bool)

(assert (=> b!1555843 (= e!866484 e!866485)))

(declare-fun res!1064505 () Bool)

(assert (=> b!1555843 (=> (not res!1064505) (not e!866485))))

(assert (=> b!1555843 (= res!1064505 (bvslt (_1!12444 (h!37721 lt!670346)) (_1!12444 (h!37721 (t!51000 lt!670346)))))))

(declare-fun b!1555844 () Bool)

(assert (=> b!1555844 (= e!866485 (isStrictlySorted!932 (t!51000 lt!670346)))))

(assert (= (and d!162017 (not res!1064504)) b!1555843))

(assert (= (and b!1555843 res!1064505) b!1555844))

(declare-fun m!1433683 () Bool)

(assert (=> b!1555844 m!1433683))

(assert (=> b!1555801 d!162017))

(declare-fun d!162025 () Bool)

(declare-fun res!1064508 () Bool)

(declare-fun e!866488 () Bool)

(assert (=> d!162025 (=> res!1064508 e!866488)))

(assert (=> d!162025 (= res!1064508 (or (is-Nil!36276 l!1177) (is-Nil!36276 (t!51000 l!1177))))))

(assert (=> d!162025 (= (isStrictlySorted!932 l!1177) e!866488)))

(declare-fun b!1555849 () Bool)

(declare-fun e!866489 () Bool)

(assert (=> b!1555849 (= e!866488 e!866489)))

(declare-fun res!1064509 () Bool)

(assert (=> b!1555849 (=> (not res!1064509) (not e!866489))))

(assert (=> b!1555849 (= res!1064509 (bvslt (_1!12444 (h!37721 l!1177)) (_1!12444 (h!37721 (t!51000 l!1177)))))))

(declare-fun b!1555850 () Bool)

(assert (=> b!1555850 (= e!866489 (isStrictlySorted!932 (t!51000 l!1177)))))

(assert (= (and d!162025 (not res!1064508)) b!1555849))

(assert (= (and b!1555849 res!1064509) b!1555850))

(declare-fun m!1433685 () Bool)

(assert (=> b!1555850 m!1433685))

(assert (=> start!132818 d!162025))

(declare-fun d!162027 () Bool)

(declare-fun res!1064522 () Bool)

(declare-fun e!866502 () Bool)

(assert (=> d!162027 (=> res!1064522 e!866502)))

(assert (=> d!162027 (= res!1064522 (and (is-Cons!36275 lt!670346) (= (_1!12444 (h!37721 lt!670346)) otherKey!50)))))

(assert (=> d!162027 (= (containsKey!803 lt!670346 otherKey!50) e!866502)))

(declare-fun b!1555863 () Bool)

(declare-fun e!866503 () Bool)

(assert (=> b!1555863 (= e!866502 e!866503)))

(declare-fun res!1064523 () Bool)

(assert (=> b!1555863 (=> (not res!1064523) (not e!866503))))

(assert (=> b!1555863 (= res!1064523 (and (or (not (is-Cons!36275 lt!670346)) (bvsle (_1!12444 (h!37721 lt!670346)) otherKey!50)) (is-Cons!36275 lt!670346) (bvslt (_1!12444 (h!37721 lt!670346)) otherKey!50)))))

(declare-fun b!1555864 () Bool)

(assert (=> b!1555864 (= e!866503 (containsKey!803 (t!51000 lt!670346) otherKey!50))))

(assert (= (and d!162027 (not res!1064522)) b!1555863))

(assert (= (and b!1555863 res!1064523) b!1555864))

(declare-fun m!1433695 () Bool)

(assert (=> b!1555864 m!1433695))

(assert (=> b!1555800 d!162027))

(declare-fun d!162037 () Bool)

(declare-fun res!1064524 () Bool)

(declare-fun e!866504 () Bool)

(assert (=> d!162037 (=> res!1064524 e!866504)))

(assert (=> d!162037 (= res!1064524 (and (is-Cons!36275 l!1177) (= (_1!12444 (h!37721 l!1177)) otherKey!50)))))

(assert (=> d!162037 (= (containsKey!803 l!1177 otherKey!50) e!866504)))

(declare-fun b!1555865 () Bool)

(declare-fun e!866505 () Bool)

(assert (=> b!1555865 (= e!866504 e!866505)))

(declare-fun res!1064525 () Bool)

(assert (=> b!1555865 (=> (not res!1064525) (not e!866505))))

(assert (=> b!1555865 (= res!1064525 (and (or (not (is-Cons!36275 l!1177)) (bvsle (_1!12444 (h!37721 l!1177)) otherKey!50)) (is-Cons!36275 l!1177) (bvslt (_1!12444 (h!37721 l!1177)) otherKey!50)))))

(declare-fun b!1555866 () Bool)

(assert (=> b!1555866 (= e!866505 (containsKey!803 (t!51000 l!1177) otherKey!50))))

(assert (= (and d!162037 (not res!1064524)) b!1555865))

(assert (= (and b!1555865 res!1064525) b!1555866))

(declare-fun m!1433697 () Bool)

(assert (=> b!1555866 m!1433697))

(assert (=> b!1555800 d!162037))

(declare-fun b!1555952 () Bool)

(declare-fun e!866551 () List!36279)

(declare-fun call!71578 () List!36279)

(assert (=> b!1555952 (= e!866551 call!71578)))

(declare-fun b!1555954 () Bool)

(declare-fun res!1064542 () Bool)

(declare-fun e!866549 () Bool)

(assert (=> b!1555954 (=> (not res!1064542) (not e!866549))))

(declare-fun lt!670361 () List!36279)

(assert (=> b!1555954 (= res!1064542 (containsKey!803 lt!670361 newKey!105))))

(declare-fun bm!71575 () Bool)

(declare-fun e!866552 () List!36279)

(declare-fun c!143704 () Bool)

(declare-fun $colon$colon!964 (List!36279 tuple2!24866) List!36279)

(assert (=> bm!71575 (= call!71578 ($colon$colon!964 e!866552 (ite c!143704 (h!37721 l!1177) (tuple2!24867 newKey!105 newValue!105))))))

(declare-fun c!143702 () Bool)

(assert (=> bm!71575 (= c!143702 c!143704)))

(declare-fun bm!71576 () Bool)

(declare-fun call!71579 () List!36279)

(declare-fun call!71580 () List!36279)

(assert (=> bm!71576 (= call!71579 call!71580)))

(declare-fun b!1555955 () Bool)

(assert (=> b!1555955 (= e!866552 (insertStrictlySorted!543 (t!51000 l!1177) newKey!105 newValue!105))))

(declare-fun b!1555956 () Bool)

(declare-fun contains!10181 (List!36279 tuple2!24866) Bool)

(assert (=> b!1555956 (= e!866549 (contains!10181 lt!670361 (tuple2!24867 newKey!105 newValue!105)))))

(declare-fun b!1555957 () Bool)

(declare-fun e!866550 () List!36279)

(assert (=> b!1555957 (= e!866550 call!71579)))

(declare-fun bm!71577 () Bool)

(assert (=> bm!71577 (= call!71580 call!71578)))

(declare-fun b!1555953 () Bool)

(assert (=> b!1555953 (= e!866550 call!71579)))

(declare-fun d!162039 () Bool)

(assert (=> d!162039 e!866549))

(declare-fun res!1064543 () Bool)

(assert (=> d!162039 (=> (not res!1064543) (not e!866549))))

(assert (=> d!162039 (= res!1064543 (isStrictlySorted!932 lt!670361))))

(assert (=> d!162039 (= lt!670361 e!866551)))

(assert (=> d!162039 (= c!143704 (and (is-Cons!36275 l!1177) (bvslt (_1!12444 (h!37721 l!1177)) newKey!105)))))

(assert (=> d!162039 (isStrictlySorted!932 l!1177)))

(assert (=> d!162039 (= (insertStrictlySorted!543 l!1177 newKey!105 newValue!105) lt!670361)))

(declare-fun b!1555958 () Bool)

(declare-fun e!866553 () List!36279)

(assert (=> b!1555958 (= e!866551 e!866553)))

(declare-fun c!143705 () Bool)

(assert (=> b!1555958 (= c!143705 (and (is-Cons!36275 l!1177) (= (_1!12444 (h!37721 l!1177)) newKey!105)))))

(declare-fun b!1555959 () Bool)

(assert (=> b!1555959 (= e!866553 call!71580)))

(declare-fun c!143703 () Bool)

(declare-fun b!1555960 () Bool)

(assert (=> b!1555960 (= e!866552 (ite c!143705 (t!51000 l!1177) (ite c!143703 (Cons!36275 (h!37721 l!1177) (t!51000 l!1177)) Nil!36276)))))

(declare-fun b!1555961 () Bool)

(assert (=> b!1555961 (= c!143703 (and (is-Cons!36275 l!1177) (bvsgt (_1!12444 (h!37721 l!1177)) newKey!105)))))

(assert (=> b!1555961 (= e!866553 e!866550)))

(assert (= (and d!162039 c!143704) b!1555952))

(assert (= (and d!162039 (not c!143704)) b!1555958))

(assert (= (and b!1555958 c!143705) b!1555959))

(assert (= (and b!1555958 (not c!143705)) b!1555961))

(assert (= (and b!1555961 c!143703) b!1555953))

(assert (= (and b!1555961 (not c!143703)) b!1555957))

(assert (= (or b!1555953 b!1555957) bm!71576))

(assert (= (or b!1555959 bm!71576) bm!71577))

(assert (= (or b!1555952 bm!71577) bm!71575))

(assert (= (and bm!71575 c!143702) b!1555955))

(assert (= (and bm!71575 (not c!143702)) b!1555960))

(assert (= (and d!162039 res!1064543) b!1555954))

(assert (= (and b!1555954 res!1064542) b!1555956))

