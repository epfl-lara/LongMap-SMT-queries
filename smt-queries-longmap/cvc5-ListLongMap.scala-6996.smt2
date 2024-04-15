; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88728 () Bool)

(assert start!88728)

(declare-fun b!1019024 () Bool)

(declare-fun e!573446 () Bool)

(declare-datatypes ((B!1686 0))(
  ( (B!1687 (val!11927 Int)) )
))
(declare-datatypes ((tuple2!15480 0))(
  ( (tuple2!15481 (_1!7751 (_ BitVec 64)) (_2!7751 B!1686)) )
))
(declare-datatypes ((List!21650 0))(
  ( (Nil!21647) (Cons!21646 (h!22844 tuple2!15480) (t!30645 List!21650)) )
))
(declare-fun l!996 () List!21650)

(declare-fun ListPrimitiveSize!138 (List!21650) Int)

(assert (=> b!1019024 (= e!573446 (>= (ListPrimitiveSize!138 (t!30645 l!996)) (ListPrimitiveSize!138 l!996)))))

(declare-fun b!1019025 () Bool)

(declare-fun e!573445 () Bool)

(declare-fun tp_is_empty!23753 () Bool)

(declare-fun tp!71137 () Bool)

(assert (=> b!1019025 (= e!573445 (and tp_is_empty!23753 tp!71137))))

(declare-fun res!683238 () Bool)

(declare-fun e!573444 () Bool)

(assert (=> start!88728 (=> (not res!683238) (not e!573444))))

(declare-fun isStrictlySorted!676 (List!21650) Bool)

(assert (=> start!88728 (= res!683238 (isStrictlySorted!676 l!996))))

(assert (=> start!88728 e!573444))

(assert (=> start!88728 e!573445))

(assert (=> start!88728 true))

(assert (=> start!88728 tp_is_empty!23753))

(declare-fun b!1019026 () Bool)

(declare-fun res!683235 () Bool)

(assert (=> b!1019026 (=> (not res!683235) (not e!573444))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!540 (List!21650 (_ BitVec 64)) Bool)

(assert (=> b!1019026 (= res!683235 (containsKey!540 l!996 key!261))))

(declare-fun b!1019027 () Bool)

(declare-fun res!683237 () Bool)

(assert (=> b!1019027 (=> (not res!683237) (not e!573446))))

(assert (=> b!1019027 (= res!683237 (isStrictlySorted!676 (t!30645 l!996)))))

(declare-fun b!1019028 () Bool)

(assert (=> b!1019028 (= e!573444 e!573446)))

(declare-fun res!683236 () Bool)

(assert (=> b!1019028 (=> (not res!683236) (not e!573446))))

(assert (=> b!1019028 (= res!683236 (and (is-Cons!21646 l!996) (bvslt (_1!7751 (h!22844 l!996)) key!261)))))

(declare-fun value!172 () B!1686)

(declare-fun lt!449434 () List!21650)

(declare-fun insertStrictlySorted!359 (List!21650 (_ BitVec 64) B!1686) List!21650)

(assert (=> b!1019028 (= lt!449434 (insertStrictlySorted!359 l!996 key!261 value!172))))

(declare-fun b!1019029 () Bool)

(declare-fun res!683239 () Bool)

(assert (=> b!1019029 (=> (not res!683239) (not e!573446))))

(assert (=> b!1019029 (= res!683239 (containsKey!540 (t!30645 l!996) key!261))))

(assert (= (and start!88728 res!683238) b!1019026))

(assert (= (and b!1019026 res!683235) b!1019028))

(assert (= (and b!1019028 res!683236) b!1019027))

(assert (= (and b!1019027 res!683237) b!1019029))

(assert (= (and b!1019029 res!683239) b!1019024))

(assert (= (and start!88728 (is-Cons!21646 l!996)) b!1019025))

(declare-fun m!939017 () Bool)

(assert (=> b!1019024 m!939017))

(declare-fun m!939019 () Bool)

(assert (=> b!1019024 m!939019))

(declare-fun m!939021 () Bool)

(assert (=> b!1019027 m!939021))

(declare-fun m!939023 () Bool)

(assert (=> b!1019028 m!939023))

(declare-fun m!939025 () Bool)

(assert (=> start!88728 m!939025))

(declare-fun m!939027 () Bool)

(assert (=> b!1019026 m!939027))

(declare-fun m!939029 () Bool)

(assert (=> b!1019029 m!939029))

(push 1)

(assert (not b!1019028))

(assert (not b!1019025))

(assert tp_is_empty!23753)

(assert (not b!1019024))

(assert (not b!1019029))

(assert (not start!88728))

(assert (not b!1019026))

(assert (not b!1019027))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!573486 () List!21650)

(declare-fun b!1019084 () Bool)

(assert (=> b!1019084 (= e!573486 (insertStrictlySorted!359 (t!30645 l!996) key!261 value!172))))

(declare-fun d!121849 () Bool)

(declare-fun e!573484 () Bool)

(assert (=> d!121849 e!573484))

(declare-fun res!683265 () Bool)

(assert (=> d!121849 (=> (not res!683265) (not e!573484))))

(declare-fun lt!449444 () List!21650)

(assert (=> d!121849 (= res!683265 (isStrictlySorted!676 lt!449444))))

(declare-fun e!573488 () List!21650)

(assert (=> d!121849 (= lt!449444 e!573488)))

(declare-fun c!103252 () Bool)

(assert (=> d!121849 (= c!103252 (and (is-Cons!21646 l!996) (bvslt (_1!7751 (h!22844 l!996)) key!261)))))

(assert (=> d!121849 (isStrictlySorted!676 l!996)))

(assert (=> d!121849 (= (insertStrictlySorted!359 l!996 key!261 value!172) lt!449444)))

(declare-fun c!103251 () Bool)

(declare-fun b!1019085 () Bool)

(declare-fun c!103250 () Bool)

(assert (=> b!1019085 (= e!573486 (ite c!103250 (t!30645 l!996) (ite c!103251 (Cons!21646 (h!22844 l!996) (t!30645 l!996)) Nil!21647)))))

(declare-fun bm!43028 () Bool)

(declare-fun call!43033 () List!21650)

(declare-fun call!43032 () List!21650)

(assert (=> bm!43028 (= call!43033 call!43032)))

(declare-fun b!1019086 () Bool)

(declare-fun e!573487 () List!21650)

(assert (=> b!1019086 (= e!573488 e!573487)))

(assert (=> b!1019086 (= c!103250 (and (is-Cons!21646 l!996) (= (_1!7751 (h!22844 l!996)) key!261)))))

(declare-fun b!1019087 () Bool)

(assert (=> b!1019087 (= e!573487 call!43033)))

(declare-fun b!1019088 () Bool)

(declare-fun res!683264 () Bool)

(assert (=> b!1019088 (=> (not res!683264) (not e!573484))))

(assert (=> b!1019088 (= res!683264 (containsKey!540 lt!449444 key!261))))

(declare-fun b!1019089 () Bool)

(assert (=> b!1019089 (= e!573488 call!43032)))

(declare-fun bm!43029 () Bool)

(declare-fun call!43031 () List!21650)

(assert (=> bm!43029 (= call!43031 call!43033)))

(declare-fun b!1019090 () Bool)

(declare-fun e!573485 () List!21650)

(assert (=> b!1019090 (= e!573485 call!43031)))

(declare-fun b!1019091 () Bool)

(assert (=> b!1019091 (= e!573485 call!43031)))

(declare-fun bm!43030 () Bool)

(declare-fun $colon$colon!588 (List!21650 tuple2!15480) List!21650)

(assert (=> bm!43030 (= call!43032 ($colon$colon!588 e!573486 (ite c!103252 (h!22844 l!996) (tuple2!15481 key!261 value!172))))))

(declare-fun c!103253 () Bool)

(assert (=> bm!43030 (= c!103253 c!103252)))

(declare-fun b!1019092 () Bool)

(declare-fun contains!5880 (List!21650 tuple2!15480) Bool)

(assert (=> b!1019092 (= e!573484 (contains!5880 lt!449444 (tuple2!15481 key!261 value!172)))))

(declare-fun b!1019093 () Bool)

(assert (=> b!1019093 (= c!103251 (and (is-Cons!21646 l!996) (bvsgt (_1!7751 (h!22844 l!996)) key!261)))))

(assert (=> b!1019093 (= e!573487 e!573485)))

(assert (= (and d!121849 c!103252) b!1019089))

(assert (= (and d!121849 (not c!103252)) b!1019086))

(assert (= (and b!1019086 c!103250) b!1019087))

(assert (= (and b!1019086 (not c!103250)) b!1019093))

(assert (= (and b!1019093 c!103251) b!1019091))

(assert (= (and b!1019093 (not c!103251)) b!1019090))

(assert (= (or b!1019091 b!1019090) bm!43029))

(assert (= (or b!1019087 bm!43029) bm!43028))

(assert (= (or b!1019089 bm!43028) bm!43030))

(assert (= (and bm!43030 c!103253) b!1019084))

(assert (= (and bm!43030 (not c!103253)) b!1019085))

(assert (= (and d!121849 res!683265) b!1019088))

(assert (= (and b!1019088 res!683264) b!1019092))

(declare-fun m!939039 () Bool)

(assert (=> b!1019084 m!939039))

(declare-fun m!939041 () Bool)

(assert (=> b!1019088 m!939041))

(declare-fun m!939043 () Bool)

(assert (=> d!121849 m!939043))

(assert (=> d!121849 m!939025))

(declare-fun m!939045 () Bool)

(assert (=> b!1019092 m!939045))

(declare-fun m!939047 () Bool)

(assert (=> bm!43030 m!939047))

(assert (=> b!1019028 d!121849))

(declare-fun d!121871 () Bool)

(declare-fun res!683272 () Bool)

(declare-fun e!573496 () Bool)

(assert (=> d!121871 (=> res!683272 e!573496)))

(assert (=> d!121871 (= res!683272 (and (is-Cons!21646 (t!30645 l!996)) (= (_1!7751 (h!22844 (t!30645 l!996))) key!261)))))

(assert (=> d!121871 (= (containsKey!540 (t!30645 l!996) key!261) e!573496)))

(declare-fun b!1019102 () Bool)

(declare-fun e!573497 () Bool)

(assert (=> b!1019102 (= e!573496 e!573497)))

(declare-fun res!683273 () Bool)

(assert (=> b!1019102 (=> (not res!683273) (not e!573497))))

(assert (=> b!1019102 (= res!683273 (and (or (not (is-Cons!21646 (t!30645 l!996))) (bvsle (_1!7751 (h!22844 (t!30645 l!996))) key!261)) (is-Cons!21646 (t!30645 l!996)) (bvslt (_1!7751 (h!22844 (t!30645 l!996))) key!261)))))

(declare-fun b!1019103 () Bool)

(assert (=> b!1019103 (= e!573497 (containsKey!540 (t!30645 (t!30645 l!996)) key!261))))

(assert (= (and d!121871 (not res!683272)) b!1019102))

(assert (= (and b!1019102 res!683273) b!1019103))

(declare-fun m!939049 () Bool)

(assert (=> b!1019103 m!939049))

(assert (=> b!1019029 d!121871))

(declare-fun d!121873 () Bool)

(declare-fun res!683278 () Bool)

(declare-fun e!573510 () Bool)

(assert (=> d!121873 (=> res!683278 e!573510)))

(assert (=> d!121873 (= res!683278 (or (is-Nil!21647 (t!30645 l!996)) (is-Nil!21647 (t!30645 (t!30645 l!996)))))))

(assert (=> d!121873 (= (isStrictlySorted!676 (t!30645 l!996)) e!573510)))

(declare-fun b!1019124 () Bool)

(declare-fun e!573511 () Bool)

(assert (=> b!1019124 (= e!573510 e!573511)))

(declare-fun res!683279 () Bool)

(assert (=> b!1019124 (=> (not res!683279) (not e!573511))))

(assert (=> b!1019124 (= res!683279 (bvslt (_1!7751 (h!22844 (t!30645 l!996))) (_1!7751 (h!22844 (t!30645 (t!30645 l!996))))))))

(declare-fun b!1019125 () Bool)

(assert (=> b!1019125 (= e!573511 (isStrictlySorted!676 (t!30645 (t!30645 l!996))))))

(assert (= (and d!121873 (not res!683278)) b!1019124))

(assert (= (and b!1019124 res!683279) b!1019125))

(declare-fun m!939051 () Bool)

(assert (=> b!1019125 m!939051))

(assert (=> b!1019027 d!121873))

(declare-fun d!121875 () Bool)

(declare-fun res!683280 () Bool)

(declare-fun e!573512 () Bool)

(assert (=> d!121875 (=> res!683280 e!573512)))

(assert (=> d!121875 (= res!683280 (or (is-Nil!21647 l!996) (is-Nil!21647 (t!30645 l!996))))))

(assert (=> d!121875 (= (isStrictlySorted!676 l!996) e!573512)))

(declare-fun b!1019126 () Bool)

(declare-fun e!573513 () Bool)

(assert (=> b!1019126 (= e!573512 e!573513)))

(declare-fun res!683281 () Bool)

(assert (=> b!1019126 (=> (not res!683281) (not e!573513))))

(assert (=> b!1019126 (= res!683281 (bvslt (_1!7751 (h!22844 l!996)) (_1!7751 (h!22844 (t!30645 l!996)))))))

(declare-fun b!1019127 () Bool)

(assert (=> b!1019127 (= e!573513 (isStrictlySorted!676 (t!30645 l!996)))))

(assert (= (and d!121875 (not res!683280)) b!1019126))

(assert (= (and b!1019126 res!683281) b!1019127))

(assert (=> b!1019127 m!939021))

(assert (=> start!88728 d!121875))

(declare-fun d!121877 () Bool)

(declare-fun res!683286 () Bool)

(declare-fun e!573516 () Bool)

(assert (=> d!121877 (=> res!683286 e!573516)))

(assert (=> d!121877 (= res!683286 (and (is-Cons!21646 l!996) (= (_1!7751 (h!22844 l!996)) key!261)))))

(assert (=> d!121877 (= (containsKey!540 l!996 key!261) e!573516)))

(declare-fun b!1019132 () Bool)

(declare-fun e!573517 () Bool)

(assert (=> b!1019132 (= e!573516 e!573517)))

(declare-fun res!683287 () Bool)

(assert (=> b!1019132 (=> (not res!683287) (not e!573517))))

(assert (=> b!1019132 (= res!683287 (and (or (not (is-Cons!21646 l!996)) (bvsle (_1!7751 (h!22844 l!996)) key!261)) (is-Cons!21646 l!996) (bvslt (_1!7751 (h!22844 l!996)) key!261)))))

(declare-fun b!1019133 () Bool)

(assert (=> b!1019133 (= e!573517 (containsKey!540 (t!30645 l!996) key!261))))

(assert (= (and d!121877 (not res!683286)) b!1019132))

(assert (= (and b!1019132 res!683287) b!1019133))

(assert (=> b!1019133 m!939029))

(assert (=> b!1019026 d!121877))

(declare-fun d!121879 () Bool)

(declare-fun lt!449452 () Int)

(assert (=> d!121879 (>= lt!449452 0)))

(declare-fun e!573526 () Int)

(assert (=> d!121879 (= lt!449452 e!573526)))

(declare-fun c!103271 () Bool)

(assert (=> d!121879 (= c!103271 (is-Nil!21647 (t!30645 l!996)))))

(assert (=> d!121879 (= (ListPrimitiveSize!138 (t!30645 l!996)) lt!449452)))

(declare-fun b!1019150 () Bool)

(assert (=> b!1019150 (= e!573526 0)))

(declare-fun b!1019151 () Bool)

(assert (=> b!1019151 (= e!573526 (+ 1 (ListPrimitiveSize!138 (t!30645 (t!30645 l!996)))))))

(assert (= (and d!121879 c!103271) b!1019150))

(assert (= (and d!121879 (not c!103271)) b!1019151))

(declare-fun m!939053 () Bool)

(assert (=> b!1019151 m!939053))

(assert (=> b!1019024 d!121879))

(declare-fun d!121881 () Bool)

(declare-fun lt!449453 () Int)

(assert (=> d!121881 (>= lt!449453 0)))

(declare-fun e!573527 () Int)

(assert (=> d!121881 (= lt!449453 e!573527)))

(declare-fun c!103272 () Bool)

(assert (=> d!121881 (= c!103272 (is-Nil!21647 l!996))))

(assert (=> d!121881 (= (ListPrimitiveSize!138 l!996) lt!449453)))

(declare-fun b!1019152 () Bool)

(assert (=> b!1019152 (= e!573527 0)))

(declare-fun b!1019153 () Bool)

(assert (=> b!1019153 (= e!573527 (+ 1 (ListPrimitiveSize!138 (t!30645 l!996))))))

(assert (= (and d!121881 c!103272) b!1019152))

(assert (= (and d!121881 (not c!103272)) b!1019153))

(assert (=> b!1019153 m!939017))

(assert (=> b!1019024 d!121881))

(declare-fun b!1019174 () Bool)

(declare-fun e!573539 () Bool)

(declare-fun tp!71140 () Bool)

(assert (=> b!1019174 (= e!573539 (and tp_is_empty!23753 tp!71140))))

(assert (=> b!1019025 (= tp!71137 e!573539)))

(assert (= (and b!1019025 (is-Cons!21646 (t!30645 l!996))) b!1019174))

(push 1)

(assert (not b!1019125))

(assert (not b!1019092))

(assert tp_is_empty!23753)

(assert (not bm!43030))

(assert (not b!1019127))

(assert (not b!1019088))

(assert (not b!1019153))

(assert (not b!1019174))

(assert (not b!1019151))

(assert (not b!1019084))

(assert (not d!121849))

(assert (not b!1019133))

(assert (not b!1019103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

