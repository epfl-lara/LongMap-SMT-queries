; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88618 () Bool)

(assert start!88618)

(declare-fun res!682904 () Bool)

(declare-fun e!573020 () Bool)

(assert (=> start!88618 (=> (not res!682904) (not e!573020))))

(declare-datatypes ((B!1658 0))(
  ( (B!1659 (val!11913 Int)) )
))
(declare-datatypes ((tuple2!15372 0))(
  ( (tuple2!15373 (_1!7697 (_ BitVec 64)) (_2!7697 B!1658)) )
))
(declare-datatypes ((List!21601 0))(
  ( (Nil!21598) (Cons!21597 (h!22795 tuple2!15372) (t!30602 List!21601)) )
))
(declare-fun l!996 () List!21601)

(declare-fun isStrictlySorted!666 (List!21601) Bool)

(assert (=> start!88618 (= res!682904 (isStrictlySorted!666 l!996))))

(assert (=> start!88618 e!573020))

(declare-fun e!573021 () Bool)

(assert (=> start!88618 e!573021))

(assert (=> start!88618 true))

(declare-fun tp_is_empty!23725 () Bool)

(assert (=> start!88618 tp_is_empty!23725))

(declare-fun b!1018407 () Bool)

(declare-fun res!682903 () Bool)

(assert (=> b!1018407 (=> (not res!682903) (not e!573020))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!526 (List!21601 (_ BitVec 64)) Bool)

(assert (=> b!1018407 (= res!682903 (containsKey!526 l!996 key!261))))

(declare-fun value!172 () B!1658)

(declare-fun b!1018408 () Bool)

(declare-fun lt!449553 () List!21601)

(assert (=> b!1018408 (= e!573020 (and (is-Cons!21597 l!996) (= (_1!7697 (h!22795 l!996)) key!261) (not (= lt!449553 (Cons!21597 (tuple2!15373 key!261 value!172) (t!30602 l!996))))))))

(declare-fun insertStrictlySorted!347 (List!21601 (_ BitVec 64) B!1658) List!21601)

(assert (=> b!1018408 (= lt!449553 (insertStrictlySorted!347 l!996 key!261 value!172))))

(declare-fun b!1018409 () Bool)

(declare-fun tp!71056 () Bool)

(assert (=> b!1018409 (= e!573021 (and tp_is_empty!23725 tp!71056))))

(assert (= (and start!88618 res!682904) b!1018407))

(assert (= (and b!1018407 res!682903) b!1018408))

(assert (= (and start!88618 (is-Cons!21597 l!996)) b!1018409))

(declare-fun m!939301 () Bool)

(assert (=> start!88618 m!939301))

(declare-fun m!939303 () Bool)

(assert (=> b!1018407 m!939303))

(declare-fun m!939305 () Bool)

(assert (=> b!1018408 m!939305))

(push 1)

(assert (not start!88618))

(assert (not b!1018408))

(assert (not b!1018407))

(assert (not b!1018409))

(assert tp_is_empty!23725)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1018492 () Bool)

(declare-fun res!682932 () Bool)

(declare-fun e!573067 () Bool)

(assert (=> b!1018492 (=> (not res!682932) (not e!573067))))

(declare-fun lt!449567 () List!21601)

(assert (=> b!1018492 (= res!682932 (containsKey!526 lt!449567 key!261))))

(declare-fun c!103170 () Bool)

(declare-fun e!573072 () List!21601)

(declare-fun b!1018494 () Bool)

(declare-fun c!103172 () Bool)

(assert (=> b!1018494 (= e!573072 (ite c!103172 (t!30602 l!996) (ite c!103170 (Cons!21597 (h!22795 l!996) (t!30602 l!996)) Nil!21598)))))

(declare-fun d!121859 () Bool)

(assert (=> d!121859 e!573067))

(declare-fun res!682929 () Bool)

(assert (=> d!121859 (=> (not res!682929) (not e!573067))))

(assert (=> d!121859 (= res!682929 (isStrictlySorted!666 lt!449567))))

(declare-fun e!573069 () List!21601)

(assert (=> d!121859 (= lt!449567 e!573069)))

(declare-fun c!103168 () Bool)

(assert (=> d!121859 (= c!103168 (and (is-Cons!21597 l!996) (bvslt (_1!7697 (h!22795 l!996)) key!261)))))

(assert (=> d!121859 (isStrictlySorted!666 l!996)))

(assert (=> d!121859 (= (insertStrictlySorted!347 l!996 key!261 value!172) lt!449567)))

(declare-fun b!1018496 () Bool)

(declare-fun e!573073 () List!21601)

(assert (=> b!1018496 (= e!573069 e!573073)))

(assert (=> b!1018496 (= c!103172 (and (is-Cons!21597 l!996) (= (_1!7697 (h!22795 l!996)) key!261)))))

(declare-fun b!1018498 () Bool)

(declare-fun contains!5899 (List!21601 tuple2!15372) Bool)

(assert (=> b!1018498 (= e!573067 (contains!5899 lt!449567 (tuple2!15373 key!261 value!172)))))

(declare-fun b!1018500 () Bool)

(declare-fun call!42979 () List!21601)

(assert (=> b!1018500 (= e!573073 call!42979)))

(declare-fun b!1018501 () Bool)

(assert (=> b!1018501 (= c!103170 (and (is-Cons!21597 l!996) (bvsgt (_1!7697 (h!22795 l!996)) key!261)))))

(declare-fun e!573065 () List!21601)

(assert (=> b!1018501 (= e!573073 e!573065)))

(declare-fun b!1018502 () Bool)

(declare-fun call!42981 () List!21601)

(assert (=> b!1018502 (= e!573065 call!42981)))

(declare-fun bm!42976 () Bool)

(declare-fun call!42977 () List!21601)

(declare-fun $colon$colon!580 (List!21601 tuple2!15372) List!21601)

(assert (=> bm!42976 (= call!42977 ($colon$colon!580 e!573072 (ite c!103168 (h!22795 l!996) (tuple2!15373 key!261 value!172))))))

(declare-fun c!103173 () Bool)

(assert (=> bm!42976 (= c!103173 c!103168)))

(declare-fun bm!42977 () Bool)

(assert (=> bm!42977 (= call!42981 call!42979)))

(declare-fun bm!42978 () Bool)

(assert (=> bm!42978 (= call!42979 call!42977)))

(declare-fun b!1018505 () Bool)

(assert (=> b!1018505 (= e!573069 call!42977)))

(declare-fun b!1018506 () Bool)

(assert (=> b!1018506 (= e!573072 (insertStrictlySorted!347 (t!30602 l!996) key!261 value!172))))

(declare-fun b!1018507 () Bool)

(assert (=> b!1018507 (= e!573065 call!42981)))

(assert (= (and d!121859 c!103168) b!1018505))

(assert (= (and d!121859 (not c!103168)) b!1018496))

(assert (= (and b!1018496 c!103172) b!1018500))

(assert (= (and b!1018496 (not c!103172)) b!1018501))

(assert (= (and b!1018501 c!103170) b!1018502))

(assert (= (and b!1018501 (not c!103170)) b!1018507))

(assert (= (or b!1018502 b!1018507) bm!42977))

(assert (= (or b!1018500 bm!42977) bm!42978))

(assert (= (or b!1018505 bm!42978) bm!42976))

(assert (= (and bm!42976 c!103173) b!1018506))

(assert (= (and bm!42976 (not c!103173)) b!1018494))

(assert (= (and d!121859 res!682929) b!1018492))

(assert (= (and b!1018492 res!682932) b!1018498))

(declare-fun m!939319 () Bool)

(assert (=> b!1018492 m!939319))

(declare-fun m!939323 () Bool)

(assert (=> bm!42976 m!939323))

(declare-fun m!939329 () Bool)

(assert (=> b!1018498 m!939329))

(declare-fun m!939331 () Bool)

(assert (=> b!1018506 m!939331))

(declare-fun m!939335 () Bool)

(assert (=> d!121859 m!939335))

(assert (=> d!121859 m!939301))

(assert (=> b!1018408 d!121859))

(declare-fun d!121865 () Bool)

(declare-fun res!682949 () Bool)

(declare-fun e!573093 () Bool)

(assert (=> d!121865 (=> res!682949 e!573093)))

(assert (=> d!121865 (= res!682949 (and (is-Cons!21597 l!996) (= (_1!7697 (h!22795 l!996)) key!261)))))

(assert (=> d!121865 (= (containsKey!526 l!996 key!261) e!573093)))

(declare-fun b!1018532 () Bool)

(declare-fun e!573094 () Bool)

(assert (=> b!1018532 (= e!573093 e!573094)))

(declare-fun res!682950 () Bool)

(assert (=> b!1018532 (=> (not res!682950) (not e!573094))))

(assert (=> b!1018532 (= res!682950 (and (or (not (is-Cons!21597 l!996)) (bvsle (_1!7697 (h!22795 l!996)) key!261)) (is-Cons!21597 l!996) (bvslt (_1!7697 (h!22795 l!996)) key!261)))))

(declare-fun b!1018533 () Bool)

(assert (=> b!1018533 (= e!573094 (containsKey!526 (t!30602 l!996) key!261))))

(assert (= (and d!121865 (not res!682949)) b!1018532))

(assert (= (and b!1018532 res!682950) b!1018533))

(declare-fun m!939351 () Bool)

(assert (=> b!1018533 m!939351))

(assert (=> b!1018407 d!121865))

(declare-fun d!121871 () Bool)

(declare-fun res!682967 () Bool)

(declare-fun e!573111 () Bool)

(assert (=> d!121871 (=> res!682967 e!573111)))

(assert (=> d!121871 (= res!682967 (or (is-Nil!21598 l!996) (is-Nil!21598 (t!30602 l!996))))))

(assert (=> d!121871 (= (isStrictlySorted!666 l!996) e!573111)))

(declare-fun b!1018550 () Bool)

(declare-fun e!573112 () Bool)

(assert (=> b!1018550 (= e!573111 e!573112)))

(declare-fun res!682968 () Bool)

(assert (=> b!1018550 (=> (not res!682968) (not e!573112))))

(assert (=> b!1018550 (= res!682968 (bvslt (_1!7697 (h!22795 l!996)) (_1!7697 (h!22795 (t!30602 l!996)))))))

(declare-fun b!1018551 () Bool)

(assert (=> b!1018551 (= e!573112 (isStrictlySorted!666 (t!30602 l!996)))))

(assert (= (and d!121871 (not res!682967)) b!1018550))

(assert (= (and b!1018550 res!682968) b!1018551))

(declare-fun m!939357 () Bool)

(assert (=> b!1018551 m!939357))

(assert (=> start!88618 d!121871))

(declare-fun b!1018567 () Bool)

(declare-fun e!573122 () Bool)

(declare-fun tp!71070 () Bool)

(assert (=> b!1018567 (= e!573122 (and tp_is_empty!23725 tp!71070))))

(assert (=> b!1018409 (= tp!71056 e!573122)))

(assert (= (and b!1018409 (is-Cons!21597 (t!30602 l!996))) b!1018567))

(push 1)

(assert (not b!1018567))

(assert (not bm!42976))

(assert (not b!1018506))

(assert (not b!1018533))

(assert (not b!1018492))

(assert tp_is_empty!23725)

(assert (not b!1018551))

(assert (not b!1018498))

(assert (not d!121859))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121889 () Bool)

(declare-fun res!682987 () Bool)

(declare-fun e!573144 () Bool)

(assert (=> d!121889 (=> res!682987 e!573144)))

(assert (=> d!121889 (= res!682987 (or (is-Nil!21598 (t!30602 l!996)) (is-Nil!21598 (t!30602 (t!30602 l!996)))))))

(assert (=> d!121889 (= (isStrictlySorted!666 (t!30602 l!996)) e!573144)))

(declare-fun b!1018594 () Bool)

(declare-fun e!573145 () Bool)

(assert (=> b!1018594 (= e!573144 e!573145)))

(declare-fun res!682988 () Bool)

(assert (=> b!1018594 (=> (not res!682988) (not e!573145))))

(assert (=> b!1018594 (= res!682988 (bvslt (_1!7697 (h!22795 (t!30602 l!996))) (_1!7697 (h!22795 (t!30602 (t!30602 l!996))))))))

(declare-fun b!1018595 () Bool)

(assert (=> b!1018595 (= e!573145 (isStrictlySorted!666 (t!30602 (t!30602 l!996))))))

(assert (= (and d!121889 (not res!682987)) b!1018594))

(assert (= (and b!1018594 res!682988) b!1018595))

(declare-fun m!939385 () Bool)

(assert (=> b!1018595 m!939385))

(assert (=> b!1018551 d!121889))

(declare-fun d!121891 () Bool)

(declare-fun res!682989 () Bool)

(declare-fun e!573146 () Bool)

(assert (=> d!121891 (=> res!682989 e!573146)))

(assert (=> d!121891 (= res!682989 (and (is-Cons!21597 (t!30602 l!996)) (= (_1!7697 (h!22795 (t!30602 l!996))) key!261)))))

(assert (=> d!121891 (= (containsKey!526 (t!30602 l!996) key!261) e!573146)))

(declare-fun b!1018596 () Bool)

(declare-fun e!573147 () Bool)

(assert (=> b!1018596 (= e!573146 e!573147)))

(declare-fun res!682990 () Bool)

(assert (=> b!1018596 (=> (not res!682990) (not e!573147))))

(assert (=> b!1018596 (= res!682990 (and (or (not (is-Cons!21597 (t!30602 l!996))) (bvsle (_1!7697 (h!22795 (t!30602 l!996))) key!261)) (is-Cons!21597 (t!30602 l!996)) (bvslt (_1!7697 (h!22795 (t!30602 l!996))) key!261)))))

(declare-fun b!1018597 () Bool)

(assert (=> b!1018597 (= e!573147 (containsKey!526 (t!30602 (t!30602 l!996)) key!261))))

(assert (= (and d!121891 (not res!682989)) b!1018596))

(assert (= (and b!1018596 res!682990) b!1018597))

(declare-fun m!939387 () Bool)

(assert (=> b!1018597 m!939387))

(assert (=> b!1018533 d!121891))

(declare-fun d!121893 () Bool)

(declare-fun res!682991 () Bool)

(declare-fun e!573148 () Bool)

(assert (=> d!121893 (=> res!682991 e!573148)))

(assert (=> d!121893 (= res!682991 (and (is-Cons!21597 lt!449567) (= (_1!7697 (h!22795 lt!449567)) key!261)))))

(assert (=> d!121893 (= (containsKey!526 lt!449567 key!261) e!573148)))

(declare-fun b!1018598 () Bool)

(declare-fun e!573149 () Bool)

(assert (=> b!1018598 (= e!573148 e!573149)))

(declare-fun res!682992 () Bool)

(assert (=> b!1018598 (=> (not res!682992) (not e!573149))))

(assert (=> b!1018598 (= res!682992 (and (or (not (is-Cons!21597 lt!449567)) (bvsle (_1!7697 (h!22795 lt!449567)) key!261)) (is-Cons!21597 lt!449567) (bvslt (_1!7697 (h!22795 lt!449567)) key!261)))))

(declare-fun b!1018599 () Bool)

(assert (=> b!1018599 (= e!573149 (containsKey!526 (t!30602 lt!449567) key!261))))

(assert (= (and d!121893 (not res!682991)) b!1018598))

(assert (= (and b!1018598 res!682992) b!1018599))

(declare-fun m!939389 () Bool)

(assert (=> b!1018599 m!939389))

(assert (=> b!1018492 d!121893))

(declare-fun d!121895 () Bool)

(declare-fun lt!449575 () Bool)

(declare-fun content!486 (List!21601) (Set tuple2!15372))

(assert (=> d!121895 (= lt!449575 (set.member (tuple2!15373 key!261 value!172) (content!486 lt!449567)))))

(declare-fun e!573154 () Bool)

(assert (=> d!121895 (= lt!449575 e!573154)))

(declare-fun res!682998 () Bool)

(assert (=> d!121895 (=> (not res!682998) (not e!573154))))

(assert (=> d!121895 (= res!682998 (is-Cons!21597 lt!449567))))

(assert (=> d!121895 (= (contains!5899 lt!449567 (tuple2!15373 key!261 value!172)) lt!449575)))

(declare-fun b!1018604 () Bool)

(declare-fun e!573155 () Bool)

(assert (=> b!1018604 (= e!573154 e!573155)))

(declare-fun res!682997 () Bool)

(assert (=> b!1018604 (=> res!682997 e!573155)))

(assert (=> b!1018604 (= res!682997 (= (h!22795 lt!449567) (tuple2!15373 key!261 value!172)))))

(declare-fun b!1018605 () Bool)

(assert (=> b!1018605 (= e!573155 (contains!5899 (t!30602 lt!449567) (tuple2!15373 key!261 value!172)))))

(assert (= (and d!121895 res!682998) b!1018604))

(assert (= (and b!1018604 (not res!682997)) b!1018605))

(declare-fun m!939391 () Bool)

(assert (=> d!121895 m!939391))

(declare-fun m!939393 () Bool)

(assert (=> d!121895 m!939393))

(declare-fun m!939395 () Bool)

(assert (=> b!1018605 m!939395))

(assert (=> b!1018498 d!121895))

(declare-fun b!1018606 () Bool)

(declare-fun res!683000 () Bool)

(declare-fun e!573157 () Bool)

(assert (=> b!1018606 (=> (not res!683000) (not e!573157))))

(declare-fun lt!449576 () List!21601)

(assert (=> b!1018606 (= res!683000 (containsKey!526 lt!449576 key!261))))

(declare-fun c!103183 () Bool)

(declare-fun c!103184 () Bool)

(declare-fun e!573159 () List!21601)

(declare-fun b!1018607 () Bool)

(assert (=> b!1018607 (= e!573159 (ite c!103184 (t!30602 (t!30602 l!996)) (ite c!103183 (Cons!21597 (h!22795 (t!30602 l!996)) (t!30602 (t!30602 l!996))) Nil!21598)))))

(declare-fun d!121897 () Bool)

(assert (=> d!121897 e!573157))

(declare-fun res!682999 () Bool)

(assert (=> d!121897 (=> (not res!682999) (not e!573157))))

(assert (=> d!121897 (= res!682999 (isStrictlySorted!666 lt!449576))))

(declare-fun e!573158 () List!21601)

(assert (=> d!121897 (= lt!449576 e!573158)))

(declare-fun c!103182 () Bool)

(assert (=> d!121897 (= c!103182 (and (is-Cons!21597 (t!30602 l!996)) (bvslt (_1!7697 (h!22795 (t!30602 l!996))) key!261)))))

(assert (=> d!121897 (isStrictlySorted!666 (t!30602 l!996))))

(assert (=> d!121897 (= (insertStrictlySorted!347 (t!30602 l!996) key!261 value!172) lt!449576)))

(declare-fun b!1018608 () Bool)

(declare-fun e!573160 () List!21601)

(assert (=> b!1018608 (= e!573158 e!573160)))

(assert (=> b!1018608 (= c!103184 (and (is-Cons!21597 (t!30602 l!996)) (= (_1!7697 (h!22795 (t!30602 l!996))) key!261)))))

(declare-fun b!1018609 () Bool)

(assert (=> b!1018609 (= e!573157 (contains!5899 lt!449576 (tuple2!15373 key!261 value!172)))))

(declare-fun b!1018610 () Bool)

(declare-fun call!42989 () List!21601)

(assert (=> b!1018610 (= e!573160 call!42989)))

(declare-fun b!1018611 () Bool)

(assert (=> b!1018611 (= c!103183 (and (is-Cons!21597 (t!30602 l!996)) (bvsgt (_1!7697 (h!22795 (t!30602 l!996))) key!261)))))

(declare-fun e!573156 () List!21601)

(assert (=> b!1018611 (= e!573160 e!573156)))

(declare-fun b!1018612 () Bool)

(declare-fun call!42990 () List!21601)

(assert (=> b!1018612 (= e!573156 call!42990)))

(declare-fun call!42988 () List!21601)

(declare-fun bm!42985 () Bool)

(assert (=> bm!42985 (= call!42988 ($colon$colon!580 e!573159 (ite c!103182 (h!22795 (t!30602 l!996)) (tuple2!15373 key!261 value!172))))))

(declare-fun c!103185 () Bool)

(assert (=> bm!42985 (= c!103185 c!103182)))

(declare-fun bm!42986 () Bool)

(assert (=> bm!42986 (= call!42990 call!42989)))

(declare-fun bm!42987 () Bool)

(assert (=> bm!42987 (= call!42989 call!42988)))

(declare-fun b!1018613 () Bool)

(assert (=> b!1018613 (= e!573158 call!42988)))

(declare-fun b!1018614 () Bool)

(assert (=> b!1018614 (= e!573159 (insertStrictlySorted!347 (t!30602 (t!30602 l!996)) key!261 value!172))))

(declare-fun b!1018615 () Bool)

(assert (=> b!1018615 (= e!573156 call!42990)))

(assert (= (and d!121897 c!103182) b!1018613))

(assert (= (and d!121897 (not c!103182)) b!1018608))

(assert (= (and b!1018608 c!103184) b!1018610))

(assert (= (and b!1018608 (not c!103184)) b!1018611))

(assert (= (and b!1018611 c!103183) b!1018612))

(assert (= (and b!1018611 (not c!103183)) b!1018615))

(assert (= (or b!1018612 b!1018615) bm!42986))

(assert (= (or b!1018610 bm!42986) bm!42987))

(assert (= (or b!1018613 bm!42987) bm!42985))

(assert (= (and bm!42985 c!103185) b!1018614))

(assert (= (and bm!42985 (not c!103185)) b!1018607))

(assert (= (and d!121897 res!682999) b!1018606))

(assert (= (and b!1018606 res!683000) b!1018609))

(declare-fun m!939397 () Bool)

(assert (=> b!1018606 m!939397))

(declare-fun m!939399 () Bool)

(assert (=> bm!42985 m!939399))

(declare-fun m!939401 () Bool)

(assert (=> b!1018609 m!939401))

(declare-fun m!939403 () Bool)

(assert (=> b!1018614 m!939403))

(declare-fun m!939405 () Bool)

(assert (=> d!121897 m!939405))

(assert (=> d!121897 m!939357))

(assert (=> b!1018506 d!121897))

(declare-fun d!121899 () Bool)

(declare-fun res!683001 () Bool)

(declare-fun e!573161 () Bool)

(assert (=> d!121899 (=> res!683001 e!573161)))

(assert (=> d!121899 (= res!683001 (or (is-Nil!21598 lt!449567) (is-Nil!21598 (t!30602 lt!449567))))))

(assert (=> d!121899 (= (isStrictlySorted!666 lt!449567) e!573161)))

(declare-fun b!1018616 () Bool)

(declare-fun e!573162 () Bool)

(assert (=> b!1018616 (= e!573161 e!573162)))

(declare-fun res!683002 () Bool)

(assert (=> b!1018616 (=> (not res!683002) (not e!573162))))

(assert (=> b!1018616 (= res!683002 (bvslt (_1!7697 (h!22795 lt!449567)) (_1!7697 (h!22795 (t!30602 lt!449567)))))))

(declare-fun b!1018617 () Bool)

(assert (=> b!1018617 (= e!573162 (isStrictlySorted!666 (t!30602 lt!449567)))))

(assert (= (and d!121899 (not res!683001)) b!1018616))

(assert (= (and b!1018616 res!683002) b!1018617))

(declare-fun m!939407 () Bool)

(assert (=> b!1018617 m!939407))

(assert (=> d!121859 d!121899))

(assert (=> d!121859 d!121871))

(declare-fun d!121901 () Bool)

(assert (=> d!121901 (= ($colon$colon!580 e!573072 (ite c!103168 (h!22795 l!996) (tuple2!15373 key!261 value!172))) (Cons!21597 (ite c!103168 (h!22795 l!996) (tuple2!15373 key!261 value!172)) e!573072))))

(assert (=> bm!42976 d!121901))

(declare-fun b!1018618 () Bool)

(declare-fun e!573163 () Bool)

(declare-fun tp!71073 () Bool)

(assert (=> b!1018618 (= e!573163 (and tp_is_empty!23725 tp!71073))))

(assert (=> b!1018567 (= tp!71070 e!573163)))

(assert (= (and b!1018567 (is-Cons!21597 (t!30602 (t!30602 l!996)))) b!1018618))

(push 1)

(assert (not b!1018606))

(assert (not d!121895))

(assert (not b!1018618))

(assert (not bm!42985))

(assert (not b!1018597))

(assert (not d!121897))

(assert (not b!1018595))

(assert (not b!1018614))

(assert (not b!1018599))

(assert (not b!1018617))

(assert (not b!1018605))

(assert (not b!1018609))

(assert tp_is_empty!23725)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

