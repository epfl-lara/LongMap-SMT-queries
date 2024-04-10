; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136874 () Bool)

(assert start!136874)

(declare-fun b!1578979 () Bool)

(declare-fun e!880784 () Bool)

(declare-fun tp!114279 () Bool)

(assert (=> b!1578979 (= e!880784 tp!114279)))

(declare-fun b!1578980 () Bool)

(declare-fun res!1078866 () Bool)

(declare-fun e!880783 () Bool)

(assert (=> b!1578980 (=> (not res!1078866) (not e!880783))))

(declare-datatypes ((B!2570 0))(
  ( (B!2571 (val!19647 Int)) )
))
(declare-datatypes ((tuple2!25396 0))(
  ( (tuple2!25397 (_1!12709 (_ BitVec 64)) (_2!12709 B!2570)) )
))
(declare-datatypes ((List!36767 0))(
  ( (Nil!36764) (Cons!36763 (h!38306 tuple2!25396) (t!51681 List!36767)) )
))
(declare-datatypes ((ListLongMap!22735 0))(
  ( (ListLongMap!22736 (toList!11383 List!36767)) )
))
(declare-fun lm!251 () ListLongMap!22735)

(declare-fun isStrictlySorted!1028 (List!36767) Bool)

(assert (=> b!1578980 (= res!1078866 (isStrictlySorted!1028 (toList!11383 lm!251)))))

(declare-fun b!1578981 () Bool)

(declare-fun res!1078865 () Bool)

(assert (=> b!1578981 (=> (not res!1078865) (not e!880783))))

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun containsKey!877 (List!36767 (_ BitVec 64)) Bool)

(assert (=> b!1578981 (= res!1078865 (not (containsKey!877 (toList!11383 lm!251) a0!51)))))

(declare-fun b!1578982 () Bool)

(declare-fun res!1078868 () Bool)

(assert (=> b!1578982 (=> (not res!1078868) (not e!880783))))

(declare-fun a!525 () (_ BitVec 64))

(assert (=> b!1578982 (= res!1078868 (not (= a0!51 a!525)))))

(declare-fun b!1578983 () Bool)

(declare-fun res!1078867 () Bool)

(assert (=> b!1578983 (=> (not res!1078867) (not e!880783))))

(assert (=> b!1578983 (= res!1078867 (not (= a!525 a0!51)))))

(declare-fun b!1578984 () Bool)

(declare-fun b!98 () B!2570)

(declare-fun contains!10439 (ListLongMap!22735 (_ BitVec 64)) Bool)

(declare-fun +!5088 (ListLongMap!22735 tuple2!25396) ListLongMap!22735)

(assert (=> b!1578984 (= e!880783 (not (not (contains!10439 (+!5088 lm!251 (tuple2!25397 a!525 b!98)) a0!51))))))

(declare-fun insertStrictlySorted!602 (List!36767 (_ BitVec 64) B!2570) List!36767)

(assert (=> b!1578984 (not (containsKey!877 (insertStrictlySorted!602 (toList!11383 lm!251) a!525 b!98) a0!51))))

(declare-datatypes ((Unit!52207 0))(
  ( (Unit!52208) )
))
(declare-fun lt!676369 () Unit!52207)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!1 (List!36767 (_ BitVec 64) B!2570 (_ BitVec 64)) Unit!52207)

(assert (=> b!1578984 (= lt!676369 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!1 (toList!11383 lm!251) a!525 b!98 a0!51))))

(declare-fun res!1078869 () Bool)

(assert (=> start!136874 (=> (not res!1078869) (not e!880783))))

(assert (=> start!136874 (= res!1078869 (not (contains!10439 lm!251 a0!51)))))

(assert (=> start!136874 e!880783))

(declare-fun inv!58928 (ListLongMap!22735) Bool)

(assert (=> start!136874 (and (inv!58928 lm!251) e!880784)))

(assert (=> start!136874 true))

(declare-fun tp_is_empty!39115 () Bool)

(assert (=> start!136874 tp_is_empty!39115))

(assert (= (and start!136874 res!1078869) b!1578983))

(assert (= (and b!1578983 res!1078867) b!1578980))

(assert (= (and b!1578980 res!1078866) b!1578981))

(assert (= (and b!1578981 res!1078865) b!1578982))

(assert (= (and b!1578982 res!1078868) b!1578984))

(assert (= start!136874 b!1578979))

(declare-fun m!1450939 () Bool)

(assert (=> b!1578980 m!1450939))

(declare-fun m!1450941 () Bool)

(assert (=> b!1578981 m!1450941))

(declare-fun m!1450943 () Bool)

(assert (=> b!1578984 m!1450943))

(declare-fun m!1450945 () Bool)

(assert (=> b!1578984 m!1450945))

(declare-fun m!1450947 () Bool)

(assert (=> b!1578984 m!1450947))

(assert (=> b!1578984 m!1450943))

(declare-fun m!1450949 () Bool)

(assert (=> b!1578984 m!1450949))

(declare-fun m!1450951 () Bool)

(assert (=> b!1578984 m!1450951))

(assert (=> b!1578984 m!1450945))

(declare-fun m!1450953 () Bool)

(assert (=> start!136874 m!1450953))

(declare-fun m!1450955 () Bool)

(assert (=> start!136874 m!1450955))

(push 1)

(assert (not start!136874))

(assert tp_is_empty!39115)

(assert (not b!1578984))

(assert (not b!1578980))

(assert (not b!1578979))

(assert (not b!1578981))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!72381 () Bool)

(declare-fun call!72386 () List!36767)

(declare-fun call!72384 () List!36767)

(assert (=> bm!72381 (= call!72386 call!72384)))

(declare-fun e!880851 () List!36767)

(declare-fun bm!72383 () Bool)

(declare-fun c!146348 () Bool)

(declare-fun call!72385 () List!36767)

(declare-fun $colon$colon!1006 (List!36767 tuple2!25396) List!36767)

(assert (=> bm!72383 (= call!72385 ($colon$colon!1006 e!880851 (ite c!146348 (h!38306 (toList!11383 lm!251)) (tuple2!25397 a!525 b!98))))))

(declare-fun c!146347 () Bool)

(assert (=> bm!72383 (= c!146347 c!146348)))

(declare-fun lt!676404 () List!36767)

(declare-fun e!880848 () Bool)

(declare-fun b!1579097 () Bool)

(declare-fun contains!10443 (List!36767 tuple2!25396) Bool)

(assert (=> b!1579097 (= e!880848 (contains!10443 lt!676404 (tuple2!25397 a!525 b!98)))))

(declare-fun b!1579098 () Bool)

(declare-fun c!146345 () Bool)

(assert (=> b!1579098 (= c!146345 (and (is-Cons!36763 (toList!11383 lm!251)) (bvsgt (_1!12709 (h!38306 (toList!11383 lm!251))) a!525)))))

(declare-fun e!880850 () List!36767)

(declare-fun e!880849 () List!36767)

(assert (=> b!1579098 (= e!880850 e!880849)))

(declare-fun b!1579099 () Bool)

(assert (=> b!1579099 (= e!880849 call!72386)))

(declare-fun b!1579100 () Bool)

(declare-fun res!1078933 () Bool)

(assert (=> b!1579100 (=> (not res!1078933) (not e!880848))))

(assert (=> b!1579100 (= res!1078933 (containsKey!877 lt!676404 a!525))))

(declare-fun b!1579101 () Bool)

(declare-fun e!880847 () List!36767)

(assert (=> b!1579101 (= e!880847 call!72385)))

(declare-fun b!1579102 () Bool)

(assert (=> b!1579102 (= e!880850 call!72384)))

(declare-fun bm!72382 () Bool)

(assert (=> bm!72382 (= call!72384 call!72385)))

(declare-fun d!166185 () Bool)

(assert (=> d!166185 e!880848))

(declare-fun res!1078932 () Bool)

(assert (=> d!166185 (=> (not res!1078932) (not e!880848))))

(assert (=> d!166185 (= res!1078932 (isStrictlySorted!1028 lt!676404))))

(assert (=> d!166185 (= lt!676404 e!880847)))

(assert (=> d!166185 (= c!146348 (and (is-Cons!36763 (toList!11383 lm!251)) (bvslt (_1!12709 (h!38306 (toList!11383 lm!251))) a!525)))))

(assert (=> d!166185 (isStrictlySorted!1028 (toList!11383 lm!251))))

(assert (=> d!166185 (= (insertStrictlySorted!602 (toList!11383 lm!251) a!525 b!98) lt!676404)))

(declare-fun b!1579103 () Bool)

(assert (=> b!1579103 (= e!880849 call!72386)))

(declare-fun c!146346 () Bool)

(declare-fun b!1579104 () Bool)

(assert (=> b!1579104 (= e!880851 (ite c!146346 (t!51681 (toList!11383 lm!251)) (ite c!146345 (Cons!36763 (h!38306 (toList!11383 lm!251)) (t!51681 (toList!11383 lm!251))) Nil!36764)))))

(declare-fun b!1579105 () Bool)

(assert (=> b!1579105 (= e!880851 (insertStrictlySorted!602 (t!51681 (toList!11383 lm!251)) a!525 b!98))))

(declare-fun b!1579106 () Bool)

(assert (=> b!1579106 (= e!880847 e!880850)))

(assert (=> b!1579106 (= c!146346 (and (is-Cons!36763 (toList!11383 lm!251)) (= (_1!12709 (h!38306 (toList!11383 lm!251))) a!525)))))

(assert (= (and d!166185 c!146348) b!1579101))

(assert (= (and d!166185 (not c!146348)) b!1579106))

(assert (= (and b!1579106 c!146346) b!1579102))

(assert (= (and b!1579106 (not c!146346)) b!1579098))

(assert (= (and b!1579098 c!146345) b!1579099))

(assert (= (and b!1579098 (not c!146345)) b!1579103))

(assert (= (or b!1579099 b!1579103) bm!72381))

(assert (= (or b!1579102 bm!72381) bm!72382))

(assert (= (or b!1579101 bm!72382) bm!72383))

(assert (= (and bm!72383 c!146347) b!1579105))

(assert (= (and bm!72383 (not c!146347)) b!1579104))

(assert (= (and d!166185 res!1078932) b!1579100))

(assert (= (and b!1579100 res!1078933) b!1579097))

(declare-fun m!1451021 () Bool)

(assert (=> b!1579105 m!1451021))

(declare-fun m!1451023 () Bool)

(assert (=> b!1579100 m!1451023))

(declare-fun m!1451025 () Bool)

(assert (=> bm!72383 m!1451025))

(declare-fun m!1451027 () Bool)

(assert (=> d!166185 m!1451027))

(assert (=> d!166185 m!1450939))

(declare-fun m!1451029 () Bool)

(assert (=> b!1579097 m!1451029))

(assert (=> b!1578984 d!166185))

(declare-fun d!166205 () Bool)

(declare-fun res!1078942 () Bool)

(declare-fun e!880863 () Bool)

(assert (=> d!166205 (=> res!1078942 e!880863)))

(assert (=> d!166205 (= res!1078942 (and (is-Cons!36763 (insertStrictlySorted!602 (toList!11383 lm!251) a!525 b!98)) (= (_1!12709 (h!38306 (insertStrictlySorted!602 (toList!11383 lm!251) a!525 b!98))) a0!51)))))

(assert (=> d!166205 (= (containsKey!877 (insertStrictlySorted!602 (toList!11383 lm!251) a!525 b!98) a0!51) e!880863)))

(declare-fun b!1579123 () Bool)

(declare-fun e!880864 () Bool)

(assert (=> b!1579123 (= e!880863 e!880864)))

(declare-fun res!1078943 () Bool)

(assert (=> b!1579123 (=> (not res!1078943) (not e!880864))))

(assert (=> b!1579123 (= res!1078943 (and (or (not (is-Cons!36763 (insertStrictlySorted!602 (toList!11383 lm!251) a!525 b!98))) (bvsle (_1!12709 (h!38306 (insertStrictlySorted!602 (toList!11383 lm!251) a!525 b!98))) a0!51)) (is-Cons!36763 (insertStrictlySorted!602 (toList!11383 lm!251) a!525 b!98)) (bvslt (_1!12709 (h!38306 (insertStrictlySorted!602 (toList!11383 lm!251) a!525 b!98))) a0!51)))))

(declare-fun b!1579124 () Bool)

(assert (=> b!1579124 (= e!880864 (containsKey!877 (t!51681 (insertStrictlySorted!602 (toList!11383 lm!251) a!525 b!98)) a0!51))))

(assert (= (and d!166205 (not res!1078942)) b!1579123))

(assert (= (and b!1579123 res!1078943) b!1579124))

(declare-fun m!1451033 () Bool)

(assert (=> b!1579124 m!1451033))

(assert (=> b!1578984 d!166205))

(declare-fun d!166207 () Bool)

(declare-fun e!880899 () Bool)

(assert (=> d!166207 e!880899))

(declare-fun res!1078974 () Bool)

(assert (=> d!166207 (=> (not res!1078974) (not e!880899))))

(declare-fun lt!676437 () ListLongMap!22735)

(assert (=> d!166207 (= res!1078974 (contains!10439 lt!676437 (_1!12709 (tuple2!25397 a!525 b!98))))))

(declare-fun lt!676439 () List!36767)

(assert (=> d!166207 (= lt!676437 (ListLongMap!22736 lt!676439))))

(declare-fun lt!676436 () Unit!52207)

(declare-fun lt!676438 () Unit!52207)

(assert (=> d!166207 (= lt!676436 lt!676438)))

(declare-datatypes ((Option!880 0))(
  ( (Some!879 (v!22368 B!2570)) (None!878) )
))
(declare-fun getValueByKey!804 (List!36767 (_ BitVec 64)) Option!880)

(assert (=> d!166207 (= (getValueByKey!804 lt!676439 (_1!12709 (tuple2!25397 a!525 b!98))) (Some!879 (_2!12709 (tuple2!25397 a!525 b!98))))))

(declare-fun lemmaContainsTupThenGetReturnValue!389 (List!36767 (_ BitVec 64) B!2570) Unit!52207)

(assert (=> d!166207 (= lt!676438 (lemmaContainsTupThenGetReturnValue!389 lt!676439 (_1!12709 (tuple2!25397 a!525 b!98)) (_2!12709 (tuple2!25397 a!525 b!98))))))

(assert (=> d!166207 (= lt!676439 (insertStrictlySorted!602 (toList!11383 lm!251) (_1!12709 (tuple2!25397 a!525 b!98)) (_2!12709 (tuple2!25397 a!525 b!98))))))

(assert (=> d!166207 (= (+!5088 lm!251 (tuple2!25397 a!525 b!98)) lt!676437)))

(declare-fun b!1579185 () Bool)

(declare-fun res!1078973 () Bool)

(assert (=> b!1579185 (=> (not res!1078973) (not e!880899))))

(assert (=> b!1579185 (= res!1078973 (= (getValueByKey!804 (toList!11383 lt!676437) (_1!12709 (tuple2!25397 a!525 b!98))) (Some!879 (_2!12709 (tuple2!25397 a!525 b!98)))))))

(declare-fun b!1579186 () Bool)

(assert (=> b!1579186 (= e!880899 (contains!10443 (toList!11383 lt!676437) (tuple2!25397 a!525 b!98)))))

(assert (= (and d!166207 res!1078974) b!1579185))

(assert (= (and b!1579185 res!1078973) b!1579186))

(declare-fun m!1451069 () Bool)

(assert (=> d!166207 m!1451069))

(declare-fun m!1451071 () Bool)

(assert (=> d!166207 m!1451071))

(declare-fun m!1451073 () Bool)

(assert (=> d!166207 m!1451073))

(declare-fun m!1451075 () Bool)

(assert (=> d!166207 m!1451075))

(declare-fun m!1451077 () Bool)

(assert (=> b!1579185 m!1451077))

(declare-fun m!1451079 () Bool)

(assert (=> b!1579186 m!1451079))

(assert (=> b!1578984 d!166207))

(declare-fun d!166217 () Bool)

(declare-fun e!880909 () Bool)

(assert (=> d!166217 e!880909))

(declare-fun res!1078983 () Bool)

(assert (=> d!166217 (=> res!1078983 e!880909)))

(declare-fun lt!676458 () Bool)

(assert (=> d!166217 (= res!1078983 (not lt!676458))))

(declare-fun lt!676456 () Bool)

(assert (=> d!166217 (= lt!676458 lt!676456)))

(declare-fun lt!676457 () Unit!52207)

(declare-fun e!880908 () Unit!52207)

(assert (=> d!166217 (= lt!676457 e!880908)))

(declare-fun c!146368 () Bool)

(assert (=> d!166217 (= c!146368 lt!676456)))

(assert (=> d!166217 (= lt!676456 (containsKey!877 (toList!11383 (+!5088 lm!251 (tuple2!25397 a!525 b!98))) a0!51))))

(assert (=> d!166217 (= (contains!10439 (+!5088 lm!251 (tuple2!25397 a!525 b!98)) a0!51) lt!676458)))

(declare-fun b!1579199 () Bool)

(declare-fun lt!676459 () Unit!52207)

(assert (=> b!1579199 (= e!880908 lt!676459)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!545 (List!36767 (_ BitVec 64)) Unit!52207)

(assert (=> b!1579199 (= lt!676459 (lemmaContainsKeyImpliesGetValueByKeyDefined!545 (toList!11383 (+!5088 lm!251 (tuple2!25397 a!525 b!98))) a0!51))))

(declare-fun isDefined!593 (Option!880) Bool)

(assert (=> b!1579199 (isDefined!593 (getValueByKey!804 (toList!11383 (+!5088 lm!251 (tuple2!25397 a!525 b!98))) a0!51))))

(declare-fun b!1579200 () Bool)

(declare-fun Unit!52216 () Unit!52207)

(assert (=> b!1579200 (= e!880908 Unit!52216)))

(declare-fun b!1579201 () Bool)

(assert (=> b!1579201 (= e!880909 (isDefined!593 (getValueByKey!804 (toList!11383 (+!5088 lm!251 (tuple2!25397 a!525 b!98))) a0!51)))))

(assert (= (and d!166217 c!146368) b!1579199))

(assert (= (and d!166217 (not c!146368)) b!1579200))

(assert (= (and d!166217 (not res!1078983)) b!1579201))

(declare-fun m!1451083 () Bool)

(assert (=> d!166217 m!1451083))

(declare-fun m!1451085 () Bool)

(assert (=> b!1579199 m!1451085))

(declare-fun m!1451087 () Bool)

(assert (=> b!1579199 m!1451087))

(assert (=> b!1579199 m!1451087))

(declare-fun m!1451089 () Bool)

(assert (=> b!1579199 m!1451089))

(assert (=> b!1579201 m!1451087))

(assert (=> b!1579201 m!1451087))

(assert (=> b!1579201 m!1451089))

(assert (=> b!1578984 d!166217))

(declare-fun d!166221 () Bool)

(assert (=> d!166221 (not (containsKey!877 (insertStrictlySorted!602 (toList!11383 lm!251) a!525 b!98) a0!51))))

(declare-fun lt!676470 () Unit!52207)

(declare-fun choose!2088 (List!36767 (_ BitVec 64) B!2570 (_ BitVec 64)) Unit!52207)

(assert (=> d!166221 (= lt!676470 (choose!2088 (toList!11383 lm!251) a!525 b!98 a0!51))))

(declare-fun e!880915 () Bool)

(assert (=> d!166221 e!880915))

(declare-fun res!1078991 () Bool)

(assert (=> d!166221 (=> (not res!1078991) (not e!880915))))

(assert (=> d!166221 (= res!1078991 (isStrictlySorted!1028 (toList!11383 lm!251)))))

(assert (=> d!166221 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!1 (toList!11383 lm!251) a!525 b!98 a0!51) lt!676470)))

(declare-fun b!1579211 () Bool)

(declare-fun res!1078992 () Bool)

(assert (=> b!1579211 (=> (not res!1078992) (not e!880915))))

(assert (=> b!1579211 (= res!1078992 (not (containsKey!877 (toList!11383 lm!251) a0!51)))))

(declare-fun b!1579212 () Bool)

(assert (=> b!1579212 (= e!880915 (not (= a0!51 a!525)))))

(assert (= (and d!166221 res!1078991) b!1579211))

(assert (= (and b!1579211 res!1078992) b!1579212))

(assert (=> d!166221 m!1450945))

(assert (=> d!166221 m!1450945))

(assert (=> d!166221 m!1450947))

(declare-fun m!1451111 () Bool)

(assert (=> d!166221 m!1451111))

(assert (=> d!166221 m!1450939))

(assert (=> b!1579211 m!1450941))

(assert (=> b!1578984 d!166221))

(declare-fun d!166227 () Bool)

(declare-fun e!880917 () Bool)

(assert (=> d!166227 e!880917))

(declare-fun res!1078993 () Bool)

(assert (=> d!166227 (=> res!1078993 e!880917)))

(declare-fun lt!676473 () Bool)

(assert (=> d!166227 (= res!1078993 (not lt!676473))))

(declare-fun lt!676471 () Bool)

(assert (=> d!166227 (= lt!676473 lt!676471)))

(declare-fun lt!676472 () Unit!52207)

(declare-fun e!880916 () Unit!52207)

(assert (=> d!166227 (= lt!676472 e!880916)))

(declare-fun c!146370 () Bool)

(assert (=> d!166227 (= c!146370 lt!676471)))

(assert (=> d!166227 (= lt!676471 (containsKey!877 (toList!11383 lm!251) a0!51))))

(assert (=> d!166227 (= (contains!10439 lm!251 a0!51) lt!676473)))

(declare-fun b!1579213 () Bool)

(declare-fun lt!676474 () Unit!52207)

(assert (=> b!1579213 (= e!880916 lt!676474)))

(assert (=> b!1579213 (= lt!676474 (lemmaContainsKeyImpliesGetValueByKeyDefined!545 (toList!11383 lm!251) a0!51))))

(assert (=> b!1579213 (isDefined!593 (getValueByKey!804 (toList!11383 lm!251) a0!51))))

(declare-fun b!1579214 () Bool)

(declare-fun Unit!52218 () Unit!52207)

(assert (=> b!1579214 (= e!880916 Unit!52218)))

(declare-fun b!1579215 () Bool)

(assert (=> b!1579215 (= e!880917 (isDefined!593 (getValueByKey!804 (toList!11383 lm!251) a0!51)))))

(assert (= (and d!166227 c!146370) b!1579213))

(assert (= (and d!166227 (not c!146370)) b!1579214))

(assert (= (and d!166227 (not res!1078993)) b!1579215))

(assert (=> d!166227 m!1450941))

(declare-fun m!1451113 () Bool)

(assert (=> b!1579213 m!1451113))

(declare-fun m!1451115 () Bool)

(assert (=> b!1579213 m!1451115))

(assert (=> b!1579213 m!1451115))

(declare-fun m!1451117 () Bool)

(assert (=> b!1579213 m!1451117))

(assert (=> b!1579215 m!1451115))

(assert (=> b!1579215 m!1451115))

(assert (=> b!1579215 m!1451117))

(assert (=> start!136874 d!166227))

(declare-fun d!166229 () Bool)

(assert (=> d!166229 (= (inv!58928 lm!251) (isStrictlySorted!1028 (toList!11383 lm!251)))))

(declare-fun bs!45728 () Bool)

(assert (= bs!45728 d!166229))

(assert (=> bs!45728 m!1450939))

(assert (=> start!136874 d!166229))

(declare-fun d!166231 () Bool)

(declare-fun res!1079004 () Bool)

(declare-fun e!880928 () Bool)

(assert (=> d!166231 (=> res!1079004 e!880928)))

(assert (=> d!166231 (= res!1079004 (or (is-Nil!36764 (toList!11383 lm!251)) (is-Nil!36764 (t!51681 (toList!11383 lm!251)))))))

(assert (=> d!166231 (= (isStrictlySorted!1028 (toList!11383 lm!251)) e!880928)))

(declare-fun b!1579231 () Bool)

(declare-fun e!880929 () Bool)

(assert (=> b!1579231 (= e!880928 e!880929)))

(declare-fun res!1079005 () Bool)

(assert (=> b!1579231 (=> (not res!1079005) (not e!880929))))

(assert (=> b!1579231 (= res!1079005 (bvslt (_1!12709 (h!38306 (toList!11383 lm!251))) (_1!12709 (h!38306 (t!51681 (toList!11383 lm!251))))))))

(declare-fun b!1579232 () Bool)

(assert (=> b!1579232 (= e!880929 (isStrictlySorted!1028 (t!51681 (toList!11383 lm!251))))))

(assert (= (and d!166231 (not res!1079004)) b!1579231))

(assert (= (and b!1579231 res!1079005) b!1579232))

(declare-fun m!1451121 () Bool)

(assert (=> b!1579232 m!1451121))

(assert (=> b!1578980 d!166231))

(declare-fun d!166233 () Bool)

(declare-fun res!1079006 () Bool)

(declare-fun e!880930 () Bool)

(assert (=> d!166233 (=> res!1079006 e!880930)))

(assert (=> d!166233 (= res!1079006 (and (is-Cons!36763 (toList!11383 lm!251)) (= (_1!12709 (h!38306 (toList!11383 lm!251))) a0!51)))))

(assert (=> d!166233 (= (containsKey!877 (toList!11383 lm!251) a0!51) e!880930)))

(declare-fun b!1579233 () Bool)

(declare-fun e!880931 () Bool)

(assert (=> b!1579233 (= e!880930 e!880931)))

(declare-fun res!1079007 () Bool)

(assert (=> b!1579233 (=> (not res!1079007) (not e!880931))))

(assert (=> b!1579233 (= res!1079007 (and (or (not (is-Cons!36763 (toList!11383 lm!251))) (bvsle (_1!12709 (h!38306 (toList!11383 lm!251))) a0!51)) (is-Cons!36763 (toList!11383 lm!251)) (bvslt (_1!12709 (h!38306 (toList!11383 lm!251))) a0!51)))))

(declare-fun b!1579234 () Bool)

(assert (=> b!1579234 (= e!880931 (containsKey!877 (t!51681 (toList!11383 lm!251)) a0!51))))

(assert (= (and d!166233 (not res!1079006)) b!1579233))

(assert (= (and b!1579233 res!1079007) b!1579234))

(declare-fun m!1451123 () Bool)

(assert (=> b!1579234 m!1451123))

(assert (=> b!1578981 d!166233))

(declare-fun b!1579239 () Bool)

(declare-fun e!880934 () Bool)

(declare-fun tp!114294 () Bool)

(assert (=> b!1579239 (= e!880934 (and tp_is_empty!39115 tp!114294))))

(assert (=> b!1578979 (= tp!114279 e!880934)))

(assert (= (and b!1578979 (is-Cons!36763 (toList!11383 lm!251))) b!1579239))

(push 1)

