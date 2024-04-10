; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1176 () Bool)

(assert start!1176)

(declare-fun res!8833 () Bool)

(declare-fun e!5843 () Bool)

(assert (=> start!1176 (=> (not res!8833) (not e!5843))))

(declare-datatypes ((B!302 0))(
  ( (B!303 (val!246 Int)) )
))
(declare-datatypes ((tuple2!292 0))(
  ( (tuple2!293 (_1!146 (_ BitVec 64)) (_2!146 B!302)) )
))
(declare-datatypes ((List!298 0))(
  ( (Nil!295) (Cons!294 (h!860 tuple2!292) (t!2445 List!298)) )
))
(declare-datatypes ((ListLongMap!297 0))(
  ( (ListLongMap!298 (toList!164 List!298)) )
))
(declare-fun lm!213 () ListLongMap!297)

(declare-fun isStrictlySorted!22 (List!298) Bool)

(assert (=> start!1176 (= res!8833 (isStrictlySorted!22 (toList!164 lm!213)))))

(assert (=> start!1176 e!5843))

(declare-fun e!5842 () Bool)

(declare-fun inv!458 (ListLongMap!297) Bool)

(assert (=> start!1176 (and (inv!458 lm!213) e!5842)))

(assert (=> start!1176 true))

(declare-fun b!10150 () Bool)

(declare-fun a1!68 () (_ BitVec 64))

(declare-fun a2!56 () (_ BitVec 64))

(declare-fun -!6 (ListLongMap!297 (_ BitVec 64)) ListLongMap!297)

(assert (=> b!10150 (= e!5843 (not (= (-!6 (-!6 lm!213 a1!68) a2!56) (-!6 (-!6 lm!213 a2!56) a1!68))))))

(declare-fun removeStrictlySorted!1 (List!298 (_ BitVec 64)) List!298)

(assert (=> b!10150 (= (removeStrictlySorted!1 (removeStrictlySorted!1 (toList!164 lm!213) a1!68) a2!56) (removeStrictlySorted!1 (removeStrictlySorted!1 (toList!164 lm!213) a2!56) a1!68))))

(declare-datatypes ((Unit!207 0))(
  ( (Unit!208) )
))
(declare-fun lt!2478 () Unit!207)

(declare-fun lemmaRemoveStrictlySortedCommutative!1 (List!298 (_ BitVec 64) (_ BitVec 64)) Unit!207)

(assert (=> b!10150 (= lt!2478 (lemmaRemoveStrictlySortedCommutative!1 (toList!164 lm!213) a1!68 a2!56))))

(declare-fun b!10151 () Bool)

(declare-fun tp!1445 () Bool)

(assert (=> b!10151 (= e!5842 tp!1445)))

(assert (= (and start!1176 res!8833) b!10150))

(assert (= start!1176 b!10151))

(declare-fun m!6473 () Bool)

(assert (=> start!1176 m!6473))

(declare-fun m!6475 () Bool)

(assert (=> start!1176 m!6475))

(declare-fun m!6477 () Bool)

(assert (=> b!10150 m!6477))

(declare-fun m!6479 () Bool)

(assert (=> b!10150 m!6479))

(declare-fun m!6481 () Bool)

(assert (=> b!10150 m!6481))

(declare-fun m!6483 () Bool)

(assert (=> b!10150 m!6483))

(declare-fun m!6485 () Bool)

(assert (=> b!10150 m!6485))

(declare-fun m!6487 () Bool)

(assert (=> b!10150 m!6487))

(declare-fun m!6489 () Bool)

(assert (=> b!10150 m!6489))

(assert (=> b!10150 m!6489))

(declare-fun m!6491 () Bool)

(assert (=> b!10150 m!6491))

(assert (=> b!10150 m!6477))

(declare-fun m!6493 () Bool)

(assert (=> b!10150 m!6493))

(assert (=> b!10150 m!6479))

(assert (=> b!10150 m!6483))

(push 1)

(assert (not b!10150))

(assert (not start!1176))

(assert (not b!10151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1017 () Bool)

(declare-fun lt!2493 () ListLongMap!297)

(declare-fun contains!139 (ListLongMap!297 (_ BitVec 64)) Bool)

(assert (=> d!1017 (not (contains!139 lt!2493 a1!68))))

(assert (=> d!1017 (= lt!2493 (ListLongMap!298 (removeStrictlySorted!1 (toList!164 (-!6 lm!213 a2!56)) a1!68)))))

(assert (=> d!1017 (= (-!6 (-!6 lm!213 a2!56) a1!68) lt!2493)))

(declare-fun bs!351 () Bool)

(assert (= bs!351 d!1017))

(declare-fun m!6543 () Bool)

(assert (=> bs!351 m!6543))

(declare-fun m!6545 () Bool)

(assert (=> bs!351 m!6545))

(assert (=> b!10150 d!1017))

(declare-fun d!1019 () Bool)

(declare-fun lt!2494 () ListLongMap!297)

(assert (=> d!1019 (not (contains!139 lt!2494 a1!68))))

(assert (=> d!1019 (= lt!2494 (ListLongMap!298 (removeStrictlySorted!1 (toList!164 lm!213) a1!68)))))

(assert (=> d!1019 (= (-!6 lm!213 a1!68) lt!2494)))

(declare-fun bs!354 () Bool)

(assert (= bs!354 d!1019))

(declare-fun m!6551 () Bool)

(assert (=> bs!354 m!6551))

(assert (=> bs!354 m!6477))

(assert (=> b!10150 d!1019))

(declare-fun e!5875 () List!298)

(declare-fun b!10194 () Bool)

(declare-fun $colon$colon!6 (List!298 tuple2!292) List!298)

(assert (=> b!10194 (= e!5875 ($colon$colon!6 (removeStrictlySorted!1 (t!2445 (removeStrictlySorted!1 (toList!164 lm!213) a1!68)) a2!56) (h!860 (removeStrictlySorted!1 (toList!164 lm!213) a1!68))))))

(declare-fun b!10195 () Bool)

(declare-fun e!5874 () Bool)

(declare-fun lt!2503 () List!298)

(declare-fun containsKey!11 (List!298 (_ BitVec 64)) Bool)

(assert (=> b!10195 (= e!5874 (not (containsKey!11 lt!2503 a2!56)))))

(declare-fun b!10196 () Bool)

(declare-fun e!5876 () List!298)

(assert (=> b!10196 (= e!5876 e!5875)))

(declare-fun c!892 () Bool)

(assert (=> b!10196 (= c!892 (and (is-Cons!294 (removeStrictlySorted!1 (toList!164 lm!213) a1!68)) (not (= (_1!146 (h!860 (removeStrictlySorted!1 (toList!164 lm!213) a1!68))) a2!56))))))

(declare-fun b!10197 () Bool)

(assert (=> b!10197 (= e!5876 (t!2445 (removeStrictlySorted!1 (toList!164 lm!213) a1!68)))))

(declare-fun d!1025 () Bool)

(assert (=> d!1025 e!5874))

(declare-fun res!8846 () Bool)

(assert (=> d!1025 (=> (not res!8846) (not e!5874))))

(assert (=> d!1025 (= res!8846 (isStrictlySorted!22 lt!2503))))

(assert (=> d!1025 (= lt!2503 e!5876)))

(declare-fun c!891 () Bool)

(assert (=> d!1025 (= c!891 (and (is-Cons!294 (removeStrictlySorted!1 (toList!164 lm!213) a1!68)) (= (_1!146 (h!860 (removeStrictlySorted!1 (toList!164 lm!213) a1!68))) a2!56)))))

(assert (=> d!1025 (isStrictlySorted!22 (removeStrictlySorted!1 (toList!164 lm!213) a1!68))))

(assert (=> d!1025 (= (removeStrictlySorted!1 (removeStrictlySorted!1 (toList!164 lm!213) a1!68) a2!56) lt!2503)))

(declare-fun b!10198 () Bool)

(assert (=> b!10198 (= e!5875 Nil!295)))

(assert (= (and d!1025 c!891) b!10197))

(assert (= (and d!1025 (not c!891)) b!10196))

(assert (= (and b!10196 c!892) b!10194))

(assert (= (and b!10196 (not c!892)) b!10198))

(assert (= (and d!1025 res!8846) b!10195))

(declare-fun m!6557 () Bool)

(assert (=> b!10194 m!6557))

(assert (=> b!10194 m!6557))

(declare-fun m!6563 () Bool)

(assert (=> b!10194 m!6563))

(declare-fun m!6567 () Bool)

(assert (=> b!10195 m!6567))

(declare-fun m!6571 () Bool)

(assert (=> d!1025 m!6571))

(assert (=> d!1025 m!6477))

(declare-fun m!6578 () Bool)

(assert (=> d!1025 m!6578))

(assert (=> b!10150 d!1025))

(declare-fun d!1031 () Bool)

(assert (=> d!1031 (= (removeStrictlySorted!1 (removeStrictlySorted!1 (toList!164 lm!213) a1!68) a2!56) (removeStrictlySorted!1 (removeStrictlySorted!1 (toList!164 lm!213) a2!56) a1!68))))

(declare-fun lt!2512 () Unit!207)

(declare-fun choose!145 (List!298 (_ BitVec 64) (_ BitVec 64)) Unit!207)

(assert (=> d!1031 (= lt!2512 (choose!145 (toList!164 lm!213) a1!68 a2!56))))

(assert (=> d!1031 (isStrictlySorted!22 (toList!164 lm!213))))

(assert (=> d!1031 (= (lemmaRemoveStrictlySortedCommutative!1 (toList!164 lm!213) a1!68 a2!56) lt!2512)))

(declare-fun bs!357 () Bool)

(assert (= bs!357 d!1031))

(assert (=> bs!357 m!6483))

(assert (=> bs!357 m!6485))

(assert (=> bs!357 m!6483))

(assert (=> bs!357 m!6477))

(assert (=> bs!357 m!6473))

(declare-fun m!6587 () Bool)

(assert (=> bs!357 m!6587))

(assert (=> bs!357 m!6477))

(assert (=> bs!357 m!6493))

(assert (=> b!10150 d!1031))

(declare-fun b!10209 () Bool)

(declare-fun e!5884 () List!298)

(assert (=> b!10209 (= e!5884 ($colon$colon!6 (removeStrictlySorted!1 (t!2445 (toList!164 lm!213)) a1!68) (h!860 (toList!164 lm!213))))))

(declare-fun b!10210 () Bool)

(declare-fun e!5883 () Bool)

(declare-fun lt!2515 () List!298)

(assert (=> b!10210 (= e!5883 (not (containsKey!11 lt!2515 a1!68)))))

(declare-fun b!10211 () Bool)

(declare-fun e!5885 () List!298)

(assert (=> b!10211 (= e!5885 e!5884)))

(declare-fun c!898 () Bool)

(assert (=> b!10211 (= c!898 (and (is-Cons!294 (toList!164 lm!213)) (not (= (_1!146 (h!860 (toList!164 lm!213))) a1!68))))))

(declare-fun b!10212 () Bool)

(assert (=> b!10212 (= e!5885 (t!2445 (toList!164 lm!213)))))

(declare-fun d!1037 () Bool)

(assert (=> d!1037 e!5883))

(declare-fun res!8849 () Bool)

(assert (=> d!1037 (=> (not res!8849) (not e!5883))))

(assert (=> d!1037 (= res!8849 (isStrictlySorted!22 lt!2515))))

(assert (=> d!1037 (= lt!2515 e!5885)))

(declare-fun c!897 () Bool)

(assert (=> d!1037 (= c!897 (and (is-Cons!294 (toList!164 lm!213)) (= (_1!146 (h!860 (toList!164 lm!213))) a1!68)))))

(assert (=> d!1037 (isStrictlySorted!22 (toList!164 lm!213))))

(assert (=> d!1037 (= (removeStrictlySorted!1 (toList!164 lm!213) a1!68) lt!2515)))

(declare-fun b!10213 () Bool)

(assert (=> b!10213 (= e!5884 Nil!295)))

(assert (= (and d!1037 c!897) b!10212))

(assert (= (and d!1037 (not c!897)) b!10211))

(assert (= (and b!10211 c!898) b!10209))

(assert (= (and b!10211 (not c!898)) b!10213))

(assert (= (and d!1037 res!8849) b!10210))

(declare-fun m!6593 () Bool)

(assert (=> b!10209 m!6593))

(assert (=> b!10209 m!6593))

(declare-fun m!6595 () Bool)

(assert (=> b!10209 m!6595))

(declare-fun m!6599 () Bool)

(assert (=> b!10210 m!6599))

(declare-fun m!6601 () Bool)

(assert (=> d!1037 m!6601))

(assert (=> d!1037 m!6473))

(assert (=> b!10150 d!1037))

(declare-fun e!5893 () List!298)

(declare-fun b!10224 () Bool)

(assert (=> b!10224 (= e!5893 ($colon$colon!6 (removeStrictlySorted!1 (t!2445 (removeStrictlySorted!1 (toList!164 lm!213) a2!56)) a1!68) (h!860 (removeStrictlySorted!1 (toList!164 lm!213) a2!56))))))

(declare-fun b!10225 () Bool)

(declare-fun e!5892 () Bool)

(declare-fun lt!2518 () List!298)

(assert (=> b!10225 (= e!5892 (not (containsKey!11 lt!2518 a1!68)))))

(declare-fun b!10226 () Bool)

(declare-fun e!5894 () List!298)

(assert (=> b!10226 (= e!5894 e!5893)))

(declare-fun c!904 () Bool)

(assert (=> b!10226 (= c!904 (and (is-Cons!294 (removeStrictlySorted!1 (toList!164 lm!213) a2!56)) (not (= (_1!146 (h!860 (removeStrictlySorted!1 (toList!164 lm!213) a2!56))) a1!68))))))

(declare-fun b!10227 () Bool)

(assert (=> b!10227 (= e!5894 (t!2445 (removeStrictlySorted!1 (toList!164 lm!213) a2!56)))))

(declare-fun d!1043 () Bool)

(assert (=> d!1043 e!5892))

(declare-fun res!8852 () Bool)

(assert (=> d!1043 (=> (not res!8852) (not e!5892))))

(assert (=> d!1043 (= res!8852 (isStrictlySorted!22 lt!2518))))

(assert (=> d!1043 (= lt!2518 e!5894)))

(declare-fun c!903 () Bool)

(assert (=> d!1043 (= c!903 (and (is-Cons!294 (removeStrictlySorted!1 (toList!164 lm!213) a2!56)) (= (_1!146 (h!860 (removeStrictlySorted!1 (toList!164 lm!213) a2!56))) a1!68)))))

(assert (=> d!1043 (isStrictlySorted!22 (removeStrictlySorted!1 (toList!164 lm!213) a2!56))))

(assert (=> d!1043 (= (removeStrictlySorted!1 (removeStrictlySorted!1 (toList!164 lm!213) a2!56) a1!68) lt!2518)))

(declare-fun b!10228 () Bool)

(assert (=> b!10228 (= e!5893 Nil!295)))

(assert (= (and d!1043 c!903) b!10227))

(assert (= (and d!1043 (not c!903)) b!10226))

(assert (= (and b!10226 c!904) b!10224))

(assert (= (and b!10226 (not c!904)) b!10228))

(assert (= (and d!1043 res!8852) b!10225))

(declare-fun m!6617 () Bool)

(assert (=> b!10224 m!6617))

(assert (=> b!10224 m!6617))

(declare-fun m!6619 () Bool)

(assert (=> b!10224 m!6619))

(declare-fun m!6623 () Bool)

(assert (=> b!10225 m!6623))

(declare-fun m!6625 () Bool)

(assert (=> d!1043 m!6625))

(assert (=> d!1043 m!6483))

(declare-fun m!6630 () Bool)

(assert (=> d!1043 m!6630))

(assert (=> b!10150 d!1043))

(declare-fun d!1049 () Bool)

(declare-fun lt!2521 () ListLongMap!297)

(assert (=> d!1049 (not (contains!139 lt!2521 a2!56))))

(assert (=> d!1049 (= lt!2521 (ListLongMap!298 (removeStrictlySorted!1 (toList!164 (-!6 lm!213 a1!68)) a2!56)))))

(assert (=> d!1049 (= (-!6 (-!6 lm!213 a1!68) a2!56) lt!2521)))

(declare-fun bs!360 () Bool)

(assert (= bs!360 d!1049))

(declare-fun m!6647 () Bool)

(assert (=> bs!360 m!6647))

(declare-fun m!6649 () Bool)

(assert (=> bs!360 m!6649))

(assert (=> b!10150 d!1049))

(declare-fun b!10239 () Bool)

(declare-fun e!5902 () List!298)

(assert (=> b!10239 (= e!5902 ($colon$colon!6 (removeStrictlySorted!1 (t!2445 (toList!164 lm!213)) a2!56) (h!860 (toList!164 lm!213))))))

(declare-fun b!10240 () Bool)

(declare-fun e!5901 () Bool)

(declare-fun lt!2524 () List!298)

(assert (=> b!10240 (= e!5901 (not (containsKey!11 lt!2524 a2!56)))))

(declare-fun b!10241 () Bool)

(declare-fun e!5903 () List!298)

(assert (=> b!10241 (= e!5903 e!5902)))

(declare-fun c!910 () Bool)

(assert (=> b!10241 (= c!910 (and (is-Cons!294 (toList!164 lm!213)) (not (= (_1!146 (h!860 (toList!164 lm!213))) a2!56))))))

(declare-fun b!10242 () Bool)

(assert (=> b!10242 (= e!5903 (t!2445 (toList!164 lm!213)))))

(declare-fun d!1055 () Bool)

(assert (=> d!1055 e!5901))

(declare-fun res!8855 () Bool)

(assert (=> d!1055 (=> (not res!8855) (not e!5901))))

(assert (=> d!1055 (= res!8855 (isStrictlySorted!22 lt!2524))))

(assert (=> d!1055 (= lt!2524 e!5903)))

(declare-fun c!909 () Bool)

(assert (=> d!1055 (= c!909 (and (is-Cons!294 (toList!164 lm!213)) (= (_1!146 (h!860 (toList!164 lm!213))) a2!56)))))

(assert (=> d!1055 (isStrictlySorted!22 (toList!164 lm!213))))

(assert (=> d!1055 (= (removeStrictlySorted!1 (toList!164 lm!213) a2!56) lt!2524)))

(declare-fun b!10243 () Bool)

(assert (=> b!10243 (= e!5902 Nil!295)))

(assert (= (and d!1055 c!909) b!10242))

(assert (= (and d!1055 (not c!909)) b!10241))

(assert (= (and b!10241 c!910) b!10239))

(assert (= (and b!10241 (not c!910)) b!10243))

(assert (= (and d!1055 res!8855) b!10240))

(declare-fun m!6659 () Bool)

(assert (=> b!10239 m!6659))

(assert (=> b!10239 m!6659))

(declare-fun m!6661 () Bool)

(assert (=> b!10239 m!6661))

(declare-fun m!6663 () Bool)

(assert (=> b!10240 m!6663))

(declare-fun m!6667 () Bool)

(assert (=> d!1055 m!6667))

(assert (=> d!1055 m!6473))

(assert (=> b!10150 d!1055))

(declare-fun d!1061 () Bool)

(declare-fun lt!2527 () ListLongMap!297)

(assert (=> d!1061 (not (contains!139 lt!2527 a2!56))))

(assert (=> d!1061 (= lt!2527 (ListLongMap!298 (removeStrictlySorted!1 (toList!164 lm!213) a2!56)))))

(assert (=> d!1061 (= (-!6 lm!213 a2!56) lt!2527)))

(declare-fun bs!363 () Bool)

(assert (= bs!363 d!1061))

(declare-fun m!6683 () Bool)

(assert (=> bs!363 m!6683))

(assert (=> bs!363 m!6483))

(assert (=> b!10150 d!1061))

(declare-fun d!1067 () Bool)

(declare-fun res!8870 () Bool)

(declare-fun e!5922 () Bool)

(assert (=> d!1067 (=> res!8870 e!5922)))

(assert (=> d!1067 (= res!8870 (or (is-Nil!295 (toList!164 lm!213)) (is-Nil!295 (t!2445 (toList!164 lm!213)))))))

(assert (=> d!1067 (= (isStrictlySorted!22 (toList!164 lm!213)) e!5922)))

(declare-fun b!10266 () Bool)

(declare-fun e!5923 () Bool)

(assert (=> b!10266 (= e!5922 e!5923)))

(declare-fun res!8871 () Bool)

(assert (=> b!10266 (=> (not res!8871) (not e!5923))))

(assert (=> b!10266 (= res!8871 (bvslt (_1!146 (h!860 (toList!164 lm!213))) (_1!146 (h!860 (t!2445 (toList!164 lm!213))))))))

(declare-fun b!10267 () Bool)

(assert (=> b!10267 (= e!5923 (isStrictlySorted!22 (t!2445 (toList!164 lm!213))))))

(assert (= (and d!1067 (not res!8870)) b!10266))

(assert (= (and b!10266 res!8871) b!10267))

(declare-fun m!6689 () Bool)

(assert (=> b!10267 m!6689))

(assert (=> start!1176 d!1067))

(declare-fun d!1073 () Bool)

(assert (=> d!1073 (= (inv!458 lm!213) (isStrictlySorted!22 (toList!164 lm!213)))))

(declare-fun bs!366 () Bool)

(assert (= bs!366 d!1073))

(assert (=> bs!366 m!6473))

(assert (=> start!1176 d!1073))

(declare-fun b!10284 () Bool)

(declare-fun e!5934 () Bool)

(declare-fun tp_is_empty!475 () Bool)

(declare-fun tp!1458 () Bool)

(assert (=> b!10284 (= e!5934 (and tp_is_empty!475 tp!1458))))

(assert (=> b!10151 (= tp!1445 e!5934)))

(assert (= (and b!10151 (is-Cons!294 (toList!164 lm!213))) b!10284))

(push 1)

