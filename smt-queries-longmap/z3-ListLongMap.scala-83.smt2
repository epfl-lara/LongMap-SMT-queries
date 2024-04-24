; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1176 () Bool)

(assert start!1176)

(declare-fun res!8833 () Bool)

(declare-fun e!5843 () Bool)

(assert (=> start!1176 (=> (not res!8833) (not e!5843))))

(declare-datatypes ((B!302 0))(
  ( (B!303 (val!246 Int)) )
))
(declare-datatypes ((tuple2!288 0))(
  ( (tuple2!289 (_1!144 (_ BitVec 64)) (_2!144 B!302)) )
))
(declare-datatypes ((List!294 0))(
  ( (Nil!291) (Cons!290 (h!856 tuple2!288) (t!2441 List!294)) )
))
(declare-datatypes ((ListLongMap!293 0))(
  ( (ListLongMap!294 (toList!162 List!294)) )
))
(declare-fun lm!213 () ListLongMap!293)

(declare-fun isStrictlySorted!21 (List!294) Bool)

(assert (=> start!1176 (= res!8833 (isStrictlySorted!21 (toList!162 lm!213)))))

(assert (=> start!1176 e!5843))

(declare-fun e!5842 () Bool)

(declare-fun inv!458 (ListLongMap!293) Bool)

(assert (=> start!1176 (and (inv!458 lm!213) e!5842)))

(assert (=> start!1176 true))

(declare-fun b!10150 () Bool)

(declare-fun a1!68 () (_ BitVec 64))

(declare-fun a2!56 () (_ BitVec 64))

(declare-fun -!6 (ListLongMap!293 (_ BitVec 64)) ListLongMap!293)

(assert (=> b!10150 (= e!5843 (not (= (-!6 (-!6 lm!213 a1!68) a2!56) (-!6 (-!6 lm!213 a2!56) a1!68))))))

(declare-fun removeStrictlySorted!1 (List!294 (_ BitVec 64)) List!294)

(assert (=> b!10150 (= (removeStrictlySorted!1 (removeStrictlySorted!1 (toList!162 lm!213) a1!68) a2!56) (removeStrictlySorted!1 (removeStrictlySorted!1 (toList!162 lm!213) a2!56) a1!68))))

(declare-datatypes ((Unit!217 0))(
  ( (Unit!218) )
))
(declare-fun lt!2478 () Unit!217)

(declare-fun lemmaRemoveStrictlySortedCommutative!1 (List!294 (_ BitVec 64) (_ BitVec 64)) Unit!217)

(assert (=> b!10150 (= lt!2478 (lemmaRemoveStrictlySortedCommutative!1 (toList!162 lm!213) a1!68 a2!56))))

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

(check-sat (not start!1176) (not b!10150) (not b!10151))
(check-sat)
(get-model)

(declare-fun d!1017 () Bool)

(declare-fun res!8844 () Bool)

(declare-fun e!5860 () Bool)

(assert (=> d!1017 (=> res!8844 e!5860)))

(get-info :version)

(assert (=> d!1017 (= res!8844 (or ((_ is Nil!291) (toList!162 lm!213)) ((_ is Nil!291) (t!2441 (toList!162 lm!213)))))))

(assert (=> d!1017 (= (isStrictlySorted!21 (toList!162 lm!213)) e!5860)))

(declare-fun b!10168 () Bool)

(declare-fun e!5861 () Bool)

(assert (=> b!10168 (= e!5860 e!5861)))

(declare-fun res!8845 () Bool)

(assert (=> b!10168 (=> (not res!8845) (not e!5861))))

(assert (=> b!10168 (= res!8845 (bvslt (_1!144 (h!856 (toList!162 lm!213))) (_1!144 (h!856 (t!2441 (toList!162 lm!213))))))))

(declare-fun b!10169 () Bool)

(assert (=> b!10169 (= e!5861 (isStrictlySorted!21 (t!2441 (toList!162 lm!213))))))

(assert (= (and d!1017 (not res!8844)) b!10168))

(assert (= (and b!10168 res!8845) b!10169))

(declare-fun m!6549 () Bool)

(assert (=> b!10169 m!6549))

(assert (=> start!1176 d!1017))

(declare-fun d!1025 () Bool)

(assert (=> d!1025 (= (inv!458 lm!213) (isStrictlySorted!21 (toList!162 lm!213)))))

(declare-fun bs!355 () Bool)

(assert (= bs!355 d!1025))

(assert (=> bs!355 m!6473))

(assert (=> start!1176 d!1025))

(declare-fun d!1029 () Bool)

(declare-fun lt!2497 () ListLongMap!293)

(declare-fun contains!138 (ListLongMap!293 (_ BitVec 64)) Bool)

(assert (=> d!1029 (not (contains!138 lt!2497 a1!68))))

(assert (=> d!1029 (= lt!2497 (ListLongMap!294 (removeStrictlySorted!1 (toList!162 (-!6 lm!213 a2!56)) a1!68)))))

(assert (=> d!1029 (= (-!6 (-!6 lm!213 a2!56) a1!68) lt!2497)))

(declare-fun bs!356 () Bool)

(assert (= bs!356 d!1029))

(declare-fun m!6553 () Bool)

(assert (=> bs!356 m!6553))

(declare-fun m!6555 () Bool)

(assert (=> bs!356 m!6555))

(assert (=> b!10150 d!1029))

(declare-fun d!1031 () Bool)

(declare-fun lt!2500 () ListLongMap!293)

(assert (=> d!1031 (not (contains!138 lt!2500 a1!68))))

(assert (=> d!1031 (= lt!2500 (ListLongMap!294 (removeStrictlySorted!1 (toList!162 lm!213) a1!68)))))

(assert (=> d!1031 (= (-!6 lm!213 a1!68) lt!2500)))

(declare-fun bs!357 () Bool)

(assert (= bs!357 d!1031))

(declare-fun m!6557 () Bool)

(assert (=> bs!357 m!6557))

(assert (=> bs!357 m!6477))

(assert (=> b!10150 d!1031))

(declare-fun b!10220 () Bool)

(declare-fun e!5892 () List!294)

(declare-fun $colon$colon!8 (List!294 tuple2!288) List!294)

(assert (=> b!10220 (= e!5892 ($colon$colon!8 (removeStrictlySorted!1 (t!2441 (removeStrictlySorted!1 (toList!162 lm!213) a1!68)) a2!56) (h!856 (removeStrictlySorted!1 (toList!162 lm!213) a1!68))))))

(declare-fun b!10221 () Bool)

(declare-fun e!5894 () List!294)

(assert (=> b!10221 (= e!5894 e!5892)))

(declare-fun c!899 () Bool)

(assert (=> b!10221 (= c!899 (and ((_ is Cons!290) (removeStrictlySorted!1 (toList!162 lm!213) a1!68)) (not (= (_1!144 (h!856 (removeStrictlySorted!1 (toList!162 lm!213) a1!68))) a2!56))))))

(declare-fun d!1033 () Bool)

(declare-fun e!5893 () Bool)

(assert (=> d!1033 e!5893))

(declare-fun res!8856 () Bool)

(assert (=> d!1033 (=> (not res!8856) (not e!5893))))

(declare-fun lt!2513 () List!294)

(assert (=> d!1033 (= res!8856 (isStrictlySorted!21 lt!2513))))

(assert (=> d!1033 (= lt!2513 e!5894)))

(declare-fun c!900 () Bool)

(assert (=> d!1033 (= c!900 (and ((_ is Cons!290) (removeStrictlySorted!1 (toList!162 lm!213) a1!68)) (= (_1!144 (h!856 (removeStrictlySorted!1 (toList!162 lm!213) a1!68))) a2!56)))))

(assert (=> d!1033 (isStrictlySorted!21 (removeStrictlySorted!1 (toList!162 lm!213) a1!68))))

(assert (=> d!1033 (= (removeStrictlySorted!1 (removeStrictlySorted!1 (toList!162 lm!213) a1!68) a2!56) lt!2513)))

(declare-fun b!10222 () Bool)

(declare-fun containsKey!13 (List!294 (_ BitVec 64)) Bool)

(assert (=> b!10222 (= e!5893 (not (containsKey!13 lt!2513 a2!56)))))

(declare-fun b!10223 () Bool)

(assert (=> b!10223 (= e!5892 Nil!291)))

(declare-fun b!10224 () Bool)

(assert (=> b!10224 (= e!5894 (t!2441 (removeStrictlySorted!1 (toList!162 lm!213) a1!68)))))

(assert (= (and d!1033 c!900) b!10224))

(assert (= (and d!1033 (not c!900)) b!10221))

(assert (= (and b!10221 c!899) b!10220))

(assert (= (and b!10221 (not c!899)) b!10223))

(assert (= (and d!1033 res!8856) b!10222))

(declare-fun m!6599 () Bool)

(assert (=> b!10220 m!6599))

(assert (=> b!10220 m!6599))

(declare-fun m!6605 () Bool)

(assert (=> b!10220 m!6605))

(declare-fun m!6609 () Bool)

(assert (=> d!1033 m!6609))

(assert (=> d!1033 m!6477))

(declare-fun m!6613 () Bool)

(assert (=> d!1033 m!6613))

(declare-fun m!6618 () Bool)

(assert (=> b!10222 m!6618))

(assert (=> b!10150 d!1033))

(declare-fun d!1047 () Bool)

(assert (=> d!1047 (= (removeStrictlySorted!1 (removeStrictlySorted!1 (toList!162 lm!213) a1!68) a2!56) (removeStrictlySorted!1 (removeStrictlySorted!1 (toList!162 lm!213) a2!56) a1!68))))

(declare-fun lt!2524 () Unit!217)

(declare-fun choose!146 (List!294 (_ BitVec 64) (_ BitVec 64)) Unit!217)

(assert (=> d!1047 (= lt!2524 (choose!146 (toList!162 lm!213) a1!68 a2!56))))

(assert (=> d!1047 (isStrictlySorted!21 (toList!162 lm!213))))

(assert (=> d!1047 (= (lemmaRemoveStrictlySortedCommutative!1 (toList!162 lm!213) a1!68 a2!56) lt!2524)))

(declare-fun bs!364 () Bool)

(assert (= bs!364 d!1047))

(assert (=> bs!364 m!6483))

(assert (=> bs!364 m!6485))

(assert (=> bs!364 m!6473))

(assert (=> bs!364 m!6483))

(assert (=> bs!364 m!6477))

(assert (=> bs!364 m!6477))

(assert (=> bs!364 m!6493))

(declare-fun m!6657 () Bool)

(assert (=> bs!364 m!6657))

(assert (=> b!10150 d!1047))

(declare-fun b!10251 () Bool)

(declare-fun e!5913 () List!294)

(assert (=> b!10251 (= e!5913 ($colon$colon!8 (removeStrictlySorted!1 (t!2441 (toList!162 lm!213)) a1!68) (h!856 (toList!162 lm!213))))))

(declare-fun b!10252 () Bool)

(declare-fun e!5915 () List!294)

(assert (=> b!10252 (= e!5915 e!5913)))

(declare-fun c!909 () Bool)

(assert (=> b!10252 (= c!909 (and ((_ is Cons!290) (toList!162 lm!213)) (not (= (_1!144 (h!856 (toList!162 lm!213))) a1!68))))))

(declare-fun d!1065 () Bool)

(declare-fun e!5914 () Bool)

(assert (=> d!1065 e!5914))

(declare-fun res!8867 () Bool)

(assert (=> d!1065 (=> (not res!8867) (not e!5914))))

(declare-fun lt!2525 () List!294)

(assert (=> d!1065 (= res!8867 (isStrictlySorted!21 lt!2525))))

(assert (=> d!1065 (= lt!2525 e!5915)))

(declare-fun c!910 () Bool)

(assert (=> d!1065 (= c!910 (and ((_ is Cons!290) (toList!162 lm!213)) (= (_1!144 (h!856 (toList!162 lm!213))) a1!68)))))

(assert (=> d!1065 (isStrictlySorted!21 (toList!162 lm!213))))

(assert (=> d!1065 (= (removeStrictlySorted!1 (toList!162 lm!213) a1!68) lt!2525)))

(declare-fun b!10253 () Bool)

(assert (=> b!10253 (= e!5914 (not (containsKey!13 lt!2525 a1!68)))))

(declare-fun b!10254 () Bool)

(assert (=> b!10254 (= e!5913 Nil!291)))

(declare-fun b!10255 () Bool)

(assert (=> b!10255 (= e!5915 (t!2441 (toList!162 lm!213)))))

(assert (= (and d!1065 c!910) b!10255))

(assert (= (and d!1065 (not c!910)) b!10252))

(assert (= (and b!10252 c!909) b!10251))

(assert (= (and b!10252 (not c!909)) b!10254))

(assert (= (and d!1065 res!8867) b!10253))

(declare-fun m!6659 () Bool)

(assert (=> b!10251 m!6659))

(assert (=> b!10251 m!6659))

(declare-fun m!6661 () Bool)

(assert (=> b!10251 m!6661))

(declare-fun m!6663 () Bool)

(assert (=> d!1065 m!6663))

(assert (=> d!1065 m!6473))

(declare-fun m!6665 () Bool)

(assert (=> b!10253 m!6665))

(assert (=> b!10150 d!1065))

(declare-fun e!5918 () List!294)

(declare-fun b!10258 () Bool)

(assert (=> b!10258 (= e!5918 ($colon$colon!8 (removeStrictlySorted!1 (t!2441 (removeStrictlySorted!1 (toList!162 lm!213) a2!56)) a1!68) (h!856 (removeStrictlySorted!1 (toList!162 lm!213) a2!56))))))

(declare-fun b!10259 () Bool)

(declare-fun e!5920 () List!294)

(assert (=> b!10259 (= e!5920 e!5918)))

(declare-fun c!911 () Bool)

(assert (=> b!10259 (= c!911 (and ((_ is Cons!290) (removeStrictlySorted!1 (toList!162 lm!213) a2!56)) (not (= (_1!144 (h!856 (removeStrictlySorted!1 (toList!162 lm!213) a2!56))) a1!68))))))

(declare-fun d!1067 () Bool)

(declare-fun e!5919 () Bool)

(assert (=> d!1067 e!5919))

(declare-fun res!8870 () Bool)

(assert (=> d!1067 (=> (not res!8870) (not e!5919))))

(declare-fun lt!2526 () List!294)

(assert (=> d!1067 (= res!8870 (isStrictlySorted!21 lt!2526))))

(assert (=> d!1067 (= lt!2526 e!5920)))

(declare-fun c!912 () Bool)

(assert (=> d!1067 (= c!912 (and ((_ is Cons!290) (removeStrictlySorted!1 (toList!162 lm!213) a2!56)) (= (_1!144 (h!856 (removeStrictlySorted!1 (toList!162 lm!213) a2!56))) a1!68)))))

(assert (=> d!1067 (isStrictlySorted!21 (removeStrictlySorted!1 (toList!162 lm!213) a2!56))))

(assert (=> d!1067 (= (removeStrictlySorted!1 (removeStrictlySorted!1 (toList!162 lm!213) a2!56) a1!68) lt!2526)))

(declare-fun b!10260 () Bool)

(assert (=> b!10260 (= e!5919 (not (containsKey!13 lt!2526 a1!68)))))

(declare-fun b!10261 () Bool)

(assert (=> b!10261 (= e!5918 Nil!291)))

(declare-fun b!10263 () Bool)

(assert (=> b!10263 (= e!5920 (t!2441 (removeStrictlySorted!1 (toList!162 lm!213) a2!56)))))

(assert (= (and d!1067 c!912) b!10263))

(assert (= (and d!1067 (not c!912)) b!10259))

(assert (= (and b!10259 c!911) b!10258))

(assert (= (and b!10259 (not c!911)) b!10261))

(assert (= (and d!1067 res!8870) b!10260))

(declare-fun m!6671 () Bool)

(assert (=> b!10258 m!6671))

(assert (=> b!10258 m!6671))

(declare-fun m!6673 () Bool)

(assert (=> b!10258 m!6673))

(declare-fun m!6675 () Bool)

(assert (=> d!1067 m!6675))

(assert (=> d!1067 m!6483))

(declare-fun m!6677 () Bool)

(assert (=> d!1067 m!6677))

(declare-fun m!6679 () Bool)

(assert (=> b!10260 m!6679))

(assert (=> b!10150 d!1067))

(declare-fun d!1073 () Bool)

(declare-fun lt!2527 () ListLongMap!293)

(assert (=> d!1073 (not (contains!138 lt!2527 a2!56))))

(assert (=> d!1073 (= lt!2527 (ListLongMap!294 (removeStrictlySorted!1 (toList!162 (-!6 lm!213 a1!68)) a2!56)))))

(assert (=> d!1073 (= (-!6 (-!6 lm!213 a1!68) a2!56) lt!2527)))

(declare-fun bs!365 () Bool)

(assert (= bs!365 d!1073))

(declare-fun m!6681 () Bool)

(assert (=> bs!365 m!6681))

(declare-fun m!6683 () Bool)

(assert (=> bs!365 m!6683))

(assert (=> b!10150 d!1073))

(declare-fun b!10267 () Bool)

(declare-fun e!5925 () List!294)

(assert (=> b!10267 (= e!5925 ($colon$colon!8 (removeStrictlySorted!1 (t!2441 (toList!162 lm!213)) a2!56) (h!856 (toList!162 lm!213))))))

(declare-fun b!10268 () Bool)

(declare-fun e!5927 () List!294)

(assert (=> b!10268 (= e!5927 e!5925)))

(declare-fun c!913 () Bool)

(assert (=> b!10268 (= c!913 (and ((_ is Cons!290) (toList!162 lm!213)) (not (= (_1!144 (h!856 (toList!162 lm!213))) a2!56))))))

(declare-fun d!1075 () Bool)

(declare-fun e!5926 () Bool)

(assert (=> d!1075 e!5926))

(declare-fun res!8875 () Bool)

(assert (=> d!1075 (=> (not res!8875) (not e!5926))))

(declare-fun lt!2528 () List!294)

(assert (=> d!1075 (= res!8875 (isStrictlySorted!21 lt!2528))))

(assert (=> d!1075 (= lt!2528 e!5927)))

(declare-fun c!914 () Bool)

(assert (=> d!1075 (= c!914 (and ((_ is Cons!290) (toList!162 lm!213)) (= (_1!144 (h!856 (toList!162 lm!213))) a2!56)))))

(assert (=> d!1075 (isStrictlySorted!21 (toList!162 lm!213))))

(assert (=> d!1075 (= (removeStrictlySorted!1 (toList!162 lm!213) a2!56) lt!2528)))

(declare-fun b!10269 () Bool)

(assert (=> b!10269 (= e!5926 (not (containsKey!13 lt!2528 a2!56)))))

(declare-fun b!10270 () Bool)

(assert (=> b!10270 (= e!5925 Nil!291)))

(declare-fun b!10271 () Bool)

(assert (=> b!10271 (= e!5927 (t!2441 (toList!162 lm!213)))))

(assert (= (and d!1075 c!914) b!10271))

(assert (= (and d!1075 (not c!914)) b!10268))

(assert (= (and b!10268 c!913) b!10267))

(assert (= (and b!10268 (not c!913)) b!10270))

(assert (= (and d!1075 res!8875) b!10269))

(declare-fun m!6685 () Bool)

(assert (=> b!10267 m!6685))

(assert (=> b!10267 m!6685))

(declare-fun m!6687 () Bool)

(assert (=> b!10267 m!6687))

(declare-fun m!6689 () Bool)

(assert (=> d!1075 m!6689))

(assert (=> d!1075 m!6473))

(declare-fun m!6691 () Bool)

(assert (=> b!10269 m!6691))

(assert (=> b!10150 d!1075))

(declare-fun d!1077 () Bool)

(declare-fun lt!2529 () ListLongMap!293)

(assert (=> d!1077 (not (contains!138 lt!2529 a2!56))))

(assert (=> d!1077 (= lt!2529 (ListLongMap!294 (removeStrictlySorted!1 (toList!162 lm!213) a2!56)))))

(assert (=> d!1077 (= (-!6 lm!213 a2!56) lt!2529)))

(declare-fun bs!368 () Bool)

(assert (= bs!368 d!1077))

(declare-fun m!6693 () Bool)

(assert (=> bs!368 m!6693))

(assert (=> bs!368 m!6483))

(assert (=> b!10150 d!1077))

(declare-fun b!10286 () Bool)

(declare-fun e!5936 () Bool)

(declare-fun tp_is_empty!479 () Bool)

(declare-fun tp!1460 () Bool)

(assert (=> b!10286 (= e!5936 (and tp_is_empty!479 tp!1460))))

(assert (=> b!10151 (= tp!1445 e!5936)))

(assert (= (and b!10151 ((_ is Cons!290) (toList!162 lm!213))) b!10286))

(check-sat (not d!1025) (not b!10253) (not b!10222) tp_is_empty!479 (not b!10169) (not b!10260) (not b!10286) (not b!10251) (not d!1073) (not b!10220) (not d!1065) (not d!1031) (not b!10269) (not d!1033) (not b!10267) (not d!1075) (not d!1077) (not d!1067) (not d!1029) (not d!1047) (not b!10258))
(check-sat)
