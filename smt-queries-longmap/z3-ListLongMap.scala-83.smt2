; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1178 () Bool)

(assert start!1178)

(declare-fun res!8836 () Bool)

(declare-fun e!5849 () Bool)

(assert (=> start!1178 (=> (not res!8836) (not e!5849))))

(declare-datatypes ((B!304 0))(
  ( (B!305 (val!247 Int)) )
))
(declare-datatypes ((tuple2!294 0))(
  ( (tuple2!295 (_1!147 (_ BitVec 64)) (_2!147 B!304)) )
))
(declare-datatypes ((List!299 0))(
  ( (Nil!296) (Cons!295 (h!861 tuple2!294) (t!2446 List!299)) )
))
(declare-datatypes ((ListLongMap!299 0))(
  ( (ListLongMap!300 (toList!165 List!299)) )
))
(declare-fun lm!213 () ListLongMap!299)

(declare-fun isStrictlySorted!23 (List!299) Bool)

(assert (=> start!1178 (= res!8836 (isStrictlySorted!23 (toList!165 lm!213)))))

(assert (=> start!1178 e!5849))

(declare-fun e!5848 () Bool)

(declare-fun inv!459 (ListLongMap!299) Bool)

(assert (=> start!1178 (and (inv!459 lm!213) e!5848)))

(assert (=> start!1178 true))

(declare-fun b!10156 () Bool)

(declare-fun a1!68 () (_ BitVec 64))

(declare-fun a2!56 () (_ BitVec 64))

(declare-fun -!7 (ListLongMap!299 (_ BitVec 64)) ListLongMap!299)

(assert (=> b!10156 (= e!5849 (not (= (-!7 (-!7 lm!213 a1!68) a2!56) (-!7 (-!7 lm!213 a2!56) a1!68))))))

(declare-fun removeStrictlySorted!2 (List!299 (_ BitVec 64)) List!299)

(assert (=> b!10156 (= (removeStrictlySorted!2 (removeStrictlySorted!2 (toList!165 lm!213) a1!68) a2!56) (removeStrictlySorted!2 (removeStrictlySorted!2 (toList!165 lm!213) a2!56) a1!68))))

(declare-datatypes ((Unit!209 0))(
  ( (Unit!210) )
))
(declare-fun lt!2481 () Unit!209)

(declare-fun lemmaRemoveStrictlySortedCommutative!2 (List!299 (_ BitVec 64) (_ BitVec 64)) Unit!209)

(assert (=> b!10156 (= lt!2481 (lemmaRemoveStrictlySortedCommutative!2 (toList!165 lm!213) a1!68 a2!56))))

(declare-fun b!10157 () Bool)

(declare-fun tp!1448 () Bool)

(assert (=> b!10157 (= e!5848 tp!1448)))

(assert (= (and start!1178 res!8836) b!10156))

(assert (= start!1178 b!10157))

(declare-fun m!6495 () Bool)

(assert (=> start!1178 m!6495))

(declare-fun m!6497 () Bool)

(assert (=> start!1178 m!6497))

(declare-fun m!6499 () Bool)

(assert (=> b!10156 m!6499))

(declare-fun m!6501 () Bool)

(assert (=> b!10156 m!6501))

(declare-fun m!6503 () Bool)

(assert (=> b!10156 m!6503))

(declare-fun m!6505 () Bool)

(assert (=> b!10156 m!6505))

(declare-fun m!6507 () Bool)

(assert (=> b!10156 m!6507))

(declare-fun m!6509 () Bool)

(assert (=> b!10156 m!6509))

(declare-fun m!6511 () Bool)

(assert (=> b!10156 m!6511))

(assert (=> b!10156 m!6511))

(declare-fun m!6513 () Bool)

(assert (=> b!10156 m!6513))

(assert (=> b!10156 m!6499))

(declare-fun m!6515 () Bool)

(assert (=> b!10156 m!6515))

(assert (=> b!10156 m!6501))

(assert (=> b!10156 m!6505))

(check-sat (not b!10156) (not start!1178) (not b!10157))
(check-sat)
(get-model)

(declare-fun d!1015 () Bool)

(declare-fun lt!2492 () ListLongMap!299)

(declare-fun contains!138 (ListLongMap!299 (_ BitVec 64)) Bool)

(assert (=> d!1015 (not (contains!138 lt!2492 a1!68))))

(assert (=> d!1015 (= lt!2492 (ListLongMap!300 (removeStrictlySorted!2 (toList!165 (-!7 lm!213 a2!56)) a1!68)))))

(assert (=> d!1015 (= (-!7 (-!7 lm!213 a2!56) a1!68) lt!2492)))

(declare-fun bs!353 () Bool)

(assert (= bs!353 d!1015))

(declare-fun m!6541 () Bool)

(assert (=> bs!353 m!6541))

(declare-fun m!6549 () Bool)

(assert (=> bs!353 m!6549))

(assert (=> b!10156 d!1015))

(declare-fun d!1023 () Bool)

(declare-fun lt!2496 () ListLongMap!299)

(assert (=> d!1023 (not (contains!138 lt!2496 a1!68))))

(assert (=> d!1023 (= lt!2496 (ListLongMap!300 (removeStrictlySorted!2 (toList!165 lm!213) a1!68)))))

(assert (=> d!1023 (= (-!7 lm!213 a1!68) lt!2496)))

(declare-fun bs!356 () Bool)

(assert (= bs!356 d!1023))

(declare-fun m!6555 () Bool)

(assert (=> bs!356 m!6555))

(assert (=> bs!356 m!6499))

(assert (=> b!10156 d!1023))

(declare-fun b!10199 () Bool)

(declare-fun e!5879 () List!299)

(assert (=> b!10199 (= e!5879 Nil!296)))

(declare-fun b!10200 () Bool)

(declare-fun e!5877 () List!299)

(assert (=> b!10200 (= e!5877 e!5879)))

(declare-fun c!893 () Bool)

(get-info :version)

(assert (=> b!10200 (= c!893 (and ((_ is Cons!295) (removeStrictlySorted!2 (toList!165 lm!213) a1!68)) (not (= (_1!147 (h!861 (removeStrictlySorted!2 (toList!165 lm!213) a1!68))) a2!56))))))

(declare-fun b!10201 () Bool)

(declare-fun $colon$colon!7 (List!299 tuple2!294) List!299)

(assert (=> b!10201 (= e!5879 ($colon$colon!7 (removeStrictlySorted!2 (t!2446 (removeStrictlySorted!2 (toList!165 lm!213) a1!68)) a2!56) (h!861 (removeStrictlySorted!2 (toList!165 lm!213) a1!68))))))

(declare-fun b!10203 () Bool)

(declare-fun e!5878 () Bool)

(declare-fun lt!2504 () List!299)

(declare-fun containsKey!12 (List!299 (_ BitVec 64)) Bool)

(assert (=> b!10203 (= e!5878 (not (containsKey!12 lt!2504 a2!56)))))

(declare-fun d!1029 () Bool)

(assert (=> d!1029 e!5878))

(declare-fun res!8847 () Bool)

(assert (=> d!1029 (=> (not res!8847) (not e!5878))))

(assert (=> d!1029 (= res!8847 (isStrictlySorted!23 lt!2504))))

(assert (=> d!1029 (= lt!2504 e!5877)))

(declare-fun c!894 () Bool)

(assert (=> d!1029 (= c!894 (and ((_ is Cons!295) (removeStrictlySorted!2 (toList!165 lm!213) a1!68)) (= (_1!147 (h!861 (removeStrictlySorted!2 (toList!165 lm!213) a1!68))) a2!56)))))

(assert (=> d!1029 (isStrictlySorted!23 (removeStrictlySorted!2 (toList!165 lm!213) a1!68))))

(assert (=> d!1029 (= (removeStrictlySorted!2 (removeStrictlySorted!2 (toList!165 lm!213) a1!68) a2!56) lt!2504)))

(declare-fun b!10202 () Bool)

(assert (=> b!10202 (= e!5877 (t!2446 (removeStrictlySorted!2 (toList!165 lm!213) a1!68)))))

(assert (= (and d!1029 c!894) b!10202))

(assert (= (and d!1029 (not c!894)) b!10200))

(assert (= (and b!10200 c!893) b!10201))

(assert (= (and b!10200 (not c!893)) b!10199))

(assert (= (and d!1029 res!8847) b!10203))

(declare-fun m!6559 () Bool)

(assert (=> b!10201 m!6559))

(assert (=> b!10201 m!6559))

(declare-fun m!6569 () Bool)

(assert (=> b!10201 m!6569))

(declare-fun m!6573 () Bool)

(assert (=> b!10203 m!6573))

(declare-fun m!6579 () Bool)

(assert (=> d!1029 m!6579))

(assert (=> d!1029 m!6499))

(declare-fun m!6583 () Bool)

(assert (=> d!1029 m!6583))

(assert (=> b!10156 d!1029))

(declare-fun d!1033 () Bool)

(assert (=> d!1033 (= (removeStrictlySorted!2 (removeStrictlySorted!2 (toList!165 lm!213) a1!68) a2!56) (removeStrictlySorted!2 (removeStrictlySorted!2 (toList!165 lm!213) a2!56) a1!68))))

(declare-fun lt!2513 () Unit!209)

(declare-fun choose!144 (List!299 (_ BitVec 64) (_ BitVec 64)) Unit!209)

(assert (=> d!1033 (= lt!2513 (choose!144 (toList!165 lm!213) a1!68 a2!56))))

(assert (=> d!1033 (isStrictlySorted!23 (toList!165 lm!213))))

(assert (=> d!1033 (= (lemmaRemoveStrictlySortedCommutative!2 (toList!165 lm!213) a1!68 a2!56) lt!2513)))

(declare-fun bs!358 () Bool)

(assert (= bs!358 d!1033))

(assert (=> bs!358 m!6505))

(assert (=> bs!358 m!6505))

(assert (=> bs!358 m!6507))

(assert (=> bs!358 m!6495))

(assert (=> bs!358 m!6499))

(assert (=> bs!358 m!6515))

(declare-fun m!6591 () Bool)

(assert (=> bs!358 m!6591))

(assert (=> bs!358 m!6499))

(assert (=> b!10156 d!1033))

(declare-fun b!10214 () Bool)

(declare-fun e!5888 () List!299)

(assert (=> b!10214 (= e!5888 Nil!296)))

(declare-fun b!10215 () Bool)

(declare-fun e!5886 () List!299)

(assert (=> b!10215 (= e!5886 e!5888)))

(declare-fun c!899 () Bool)

(assert (=> b!10215 (= c!899 (and ((_ is Cons!295) (toList!165 lm!213)) (not (= (_1!147 (h!861 (toList!165 lm!213))) a1!68))))))

(declare-fun b!10216 () Bool)

(assert (=> b!10216 (= e!5888 ($colon$colon!7 (removeStrictlySorted!2 (t!2446 (toList!165 lm!213)) a1!68) (h!861 (toList!165 lm!213))))))

(declare-fun b!10218 () Bool)

(declare-fun e!5887 () Bool)

(declare-fun lt!2516 () List!299)

(assert (=> b!10218 (= e!5887 (not (containsKey!12 lt!2516 a1!68)))))

(declare-fun d!1039 () Bool)

(assert (=> d!1039 e!5887))

(declare-fun res!8850 () Bool)

(assert (=> d!1039 (=> (not res!8850) (not e!5887))))

(assert (=> d!1039 (= res!8850 (isStrictlySorted!23 lt!2516))))

(assert (=> d!1039 (= lt!2516 e!5886)))

(declare-fun c!900 () Bool)

(assert (=> d!1039 (= c!900 (and ((_ is Cons!295) (toList!165 lm!213)) (= (_1!147 (h!861 (toList!165 lm!213))) a1!68)))))

(assert (=> d!1039 (isStrictlySorted!23 (toList!165 lm!213))))

(assert (=> d!1039 (= (removeStrictlySorted!2 (toList!165 lm!213) a1!68) lt!2516)))

(declare-fun b!10217 () Bool)

(assert (=> b!10217 (= e!5886 (t!2446 (toList!165 lm!213)))))

(assert (= (and d!1039 c!900) b!10217))

(assert (= (and d!1039 (not c!900)) b!10215))

(assert (= (and b!10215 c!899) b!10216))

(assert (= (and b!10215 (not c!899)) b!10214))

(assert (= (and d!1039 res!8850) b!10218))

(declare-fun m!6597 () Bool)

(assert (=> b!10216 m!6597))

(assert (=> b!10216 m!6597))

(declare-fun m!6603 () Bool)

(assert (=> b!10216 m!6603))

(declare-fun m!6607 () Bool)

(assert (=> b!10218 m!6607))

(declare-fun m!6611 () Bool)

(assert (=> d!1039 m!6611))

(assert (=> d!1039 m!6495))

(assert (=> b!10156 d!1039))

(declare-fun b!10229 () Bool)

(declare-fun e!5897 () List!299)

(assert (=> b!10229 (= e!5897 Nil!296)))

(declare-fun b!10230 () Bool)

(declare-fun e!5895 () List!299)

(assert (=> b!10230 (= e!5895 e!5897)))

(declare-fun c!905 () Bool)

(assert (=> b!10230 (= c!905 (and ((_ is Cons!295) (removeStrictlySorted!2 (toList!165 lm!213) a2!56)) (not (= (_1!147 (h!861 (removeStrictlySorted!2 (toList!165 lm!213) a2!56))) a1!68))))))

(declare-fun b!10231 () Bool)

(assert (=> b!10231 (= e!5897 ($colon$colon!7 (removeStrictlySorted!2 (t!2446 (removeStrictlySorted!2 (toList!165 lm!213) a2!56)) a1!68) (h!861 (removeStrictlySorted!2 (toList!165 lm!213) a2!56))))))

(declare-fun b!10233 () Bool)

(declare-fun e!5896 () Bool)

(declare-fun lt!2519 () List!299)

(assert (=> b!10233 (= e!5896 (not (containsKey!12 lt!2519 a1!68)))))

(declare-fun d!1045 () Bool)

(assert (=> d!1045 e!5896))

(declare-fun res!8853 () Bool)

(assert (=> d!1045 (=> (not res!8853) (not e!5896))))

(assert (=> d!1045 (= res!8853 (isStrictlySorted!23 lt!2519))))

(assert (=> d!1045 (= lt!2519 e!5895)))

(declare-fun c!906 () Bool)

(assert (=> d!1045 (= c!906 (and ((_ is Cons!295) (removeStrictlySorted!2 (toList!165 lm!213) a2!56)) (= (_1!147 (h!861 (removeStrictlySorted!2 (toList!165 lm!213) a2!56))) a1!68)))))

(assert (=> d!1045 (isStrictlySorted!23 (removeStrictlySorted!2 (toList!165 lm!213) a2!56))))

(assert (=> d!1045 (= (removeStrictlySorted!2 (removeStrictlySorted!2 (toList!165 lm!213) a2!56) a1!68) lt!2519)))

(declare-fun b!10232 () Bool)

(assert (=> b!10232 (= e!5895 (t!2446 (removeStrictlySorted!2 (toList!165 lm!213) a2!56)))))

(assert (= (and d!1045 c!906) b!10232))

(assert (= (and d!1045 (not c!906)) b!10230))

(assert (= (and b!10230 c!905) b!10231))

(assert (= (and b!10230 (not c!905)) b!10229))

(assert (= (and d!1045 res!8853) b!10233))

(declare-fun m!6621 () Bool)

(assert (=> b!10231 m!6621))

(assert (=> b!10231 m!6621))

(declare-fun m!6627 () Bool)

(assert (=> b!10231 m!6627))

(declare-fun m!6633 () Bool)

(assert (=> b!10233 m!6633))

(declare-fun m!6636 () Bool)

(assert (=> d!1045 m!6636))

(assert (=> d!1045 m!6505))

(declare-fun m!6639 () Bool)

(assert (=> d!1045 m!6639))

(assert (=> b!10156 d!1045))

(declare-fun d!1051 () Bool)

(declare-fun lt!2522 () ListLongMap!299)

(assert (=> d!1051 (not (contains!138 lt!2522 a2!56))))

(assert (=> d!1051 (= lt!2522 (ListLongMap!300 (removeStrictlySorted!2 (toList!165 (-!7 lm!213 a1!68)) a2!56)))))

(assert (=> d!1051 (= (-!7 (-!7 lm!213 a1!68) a2!56) lt!2522)))

(declare-fun bs!361 () Bool)

(assert (= bs!361 d!1051))

(declare-fun m!6651 () Bool)

(assert (=> bs!361 m!6651))

(declare-fun m!6653 () Bool)

(assert (=> bs!361 m!6653))

(assert (=> b!10156 d!1051))

(declare-fun b!10244 () Bool)

(declare-fun e!5906 () List!299)

(assert (=> b!10244 (= e!5906 Nil!296)))

(declare-fun b!10245 () Bool)

(declare-fun e!5904 () List!299)

(assert (=> b!10245 (= e!5904 e!5906)))

(declare-fun c!911 () Bool)

(assert (=> b!10245 (= c!911 (and ((_ is Cons!295) (toList!165 lm!213)) (not (= (_1!147 (h!861 (toList!165 lm!213))) a2!56))))))

(declare-fun b!10246 () Bool)

(assert (=> b!10246 (= e!5906 ($colon$colon!7 (removeStrictlySorted!2 (t!2446 (toList!165 lm!213)) a2!56) (h!861 (toList!165 lm!213))))))

(declare-fun b!10248 () Bool)

(declare-fun e!5905 () Bool)

(declare-fun lt!2525 () List!299)

(assert (=> b!10248 (= e!5905 (not (containsKey!12 lt!2525 a2!56)))))

(declare-fun d!1057 () Bool)

(assert (=> d!1057 e!5905))

(declare-fun res!8856 () Bool)

(assert (=> d!1057 (=> (not res!8856) (not e!5905))))

(assert (=> d!1057 (= res!8856 (isStrictlySorted!23 lt!2525))))

(assert (=> d!1057 (= lt!2525 e!5904)))

(declare-fun c!912 () Bool)

(assert (=> d!1057 (= c!912 (and ((_ is Cons!295) (toList!165 lm!213)) (= (_1!147 (h!861 (toList!165 lm!213))) a2!56)))))

(assert (=> d!1057 (isStrictlySorted!23 (toList!165 lm!213))))

(assert (=> d!1057 (= (removeStrictlySorted!2 (toList!165 lm!213) a2!56) lt!2525)))

(declare-fun b!10247 () Bool)

(assert (=> b!10247 (= e!5904 (t!2446 (toList!165 lm!213)))))

(assert (= (and d!1057 c!912) b!10247))

(assert (= (and d!1057 (not c!912)) b!10245))

(assert (= (and b!10245 c!911) b!10246))

(assert (= (and b!10245 (not c!911)) b!10244))

(assert (= (and d!1057 res!8856) b!10248))

(declare-fun m!6665 () Bool)

(assert (=> b!10246 m!6665))

(assert (=> b!10246 m!6665))

(declare-fun m!6669 () Bool)

(assert (=> b!10246 m!6669))

(declare-fun m!6673 () Bool)

(assert (=> b!10248 m!6673))

(declare-fun m!6677 () Bool)

(assert (=> d!1057 m!6677))

(assert (=> d!1057 m!6495))

(assert (=> b!10156 d!1057))

(declare-fun d!1063 () Bool)

(declare-fun lt!2528 () ListLongMap!299)

(assert (=> d!1063 (not (contains!138 lt!2528 a2!56))))

(assert (=> d!1063 (= lt!2528 (ListLongMap!300 (removeStrictlySorted!2 (toList!165 lm!213) a2!56)))))

(assert (=> d!1063 (= (-!7 lm!213 a2!56) lt!2528)))

(declare-fun bs!364 () Bool)

(assert (= bs!364 d!1063))

(declare-fun m!6685 () Bool)

(assert (=> bs!364 m!6685))

(assert (=> bs!364 m!6505))

(assert (=> b!10156 d!1063))

(declare-fun d!1069 () Bool)

(declare-fun res!8872 () Bool)

(declare-fun e!5924 () Bool)

(assert (=> d!1069 (=> res!8872 e!5924)))

(assert (=> d!1069 (= res!8872 (or ((_ is Nil!296) (toList!165 lm!213)) ((_ is Nil!296) (t!2446 (toList!165 lm!213)))))))

(assert (=> d!1069 (= (isStrictlySorted!23 (toList!165 lm!213)) e!5924)))

(declare-fun b!10268 () Bool)

(declare-fun e!5925 () Bool)

(assert (=> b!10268 (= e!5924 e!5925)))

(declare-fun res!8873 () Bool)

(assert (=> b!10268 (=> (not res!8873) (not e!5925))))

(assert (=> b!10268 (= res!8873 (bvslt (_1!147 (h!861 (toList!165 lm!213))) (_1!147 (h!861 (t!2446 (toList!165 lm!213))))))))

(declare-fun b!10269 () Bool)

(assert (=> b!10269 (= e!5925 (isStrictlySorted!23 (t!2446 (toList!165 lm!213))))))

(assert (= (and d!1069 (not res!8872)) b!10268))

(assert (= (and b!10268 res!8873) b!10269))

(declare-fun m!6691 () Bool)

(assert (=> b!10269 m!6691))

(assert (=> start!1178 d!1069))

(declare-fun d!1075 () Bool)

(assert (=> d!1075 (= (inv!459 lm!213) (isStrictlySorted!23 (toList!165 lm!213)))))

(declare-fun bs!367 () Bool)

(assert (= bs!367 d!1075))

(assert (=> bs!367 m!6495))

(assert (=> start!1178 d!1075))

(declare-fun b!10285 () Bool)

(declare-fun e!5935 () Bool)

(declare-fun tp_is_empty!477 () Bool)

(declare-fun tp!1459 () Bool)

(assert (=> b!10285 (= e!5935 (and tp_is_empty!477 tp!1459))))

(assert (=> b!10157 (= tp!1448 e!5935)))

(assert (= (and b!10157 ((_ is Cons!295) (toList!165 lm!213))) b!10285))

(check-sat (not b!10203) (not d!1039) (not d!1075) (not b!10231) (not d!1023) (not b!10216) (not d!1051) (not d!1045) (not d!1029) (not b!10201) (not b!10246) (not b!10248) (not b!10269) (not b!10233) (not d!1063) (not b!10285) (not b!10218) (not d!1033) (not d!1015) (not d!1057) tp_is_empty!477)
(check-sat)
