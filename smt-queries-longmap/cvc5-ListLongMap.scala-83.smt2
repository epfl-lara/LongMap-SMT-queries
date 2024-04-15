; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1180 () Bool)

(assert start!1180)

(declare-fun res!8839 () Bool)

(declare-fun e!5854 () Bool)

(assert (=> start!1180 (=> (not res!8839) (not e!5854))))

(declare-datatypes ((B!306 0))(
  ( (B!307 (val!248 Int)) )
))
(declare-datatypes ((tuple2!292 0))(
  ( (tuple2!293 (_1!146 (_ BitVec 64)) (_2!146 B!306)) )
))
(declare-datatypes ((List!296 0))(
  ( (Nil!293) (Cons!292 (h!858 tuple2!292) (t!2443 List!296)) )
))
(declare-datatypes ((ListLongMap!297 0))(
  ( (ListLongMap!298 (toList!164 List!296)) )
))
(declare-fun lm!213 () ListLongMap!297)

(declare-fun isStrictlySorted!24 (List!296) Bool)

(assert (=> start!1180 (= res!8839 (isStrictlySorted!24 (toList!164 lm!213)))))

(assert (=> start!1180 e!5854))

(declare-fun e!5855 () Bool)

(declare-fun inv!460 (ListLongMap!297) Bool)

(assert (=> start!1180 (and (inv!460 lm!213) e!5855)))

(assert (=> start!1180 true))

(declare-fun a1!68 () (_ BitVec 64))

(declare-fun a2!56 () (_ BitVec 64))

(declare-fun b!10162 () Bool)

(declare-fun -!8 (ListLongMap!297 (_ BitVec 64)) ListLongMap!297)

(assert (=> b!10162 (= e!5854 (not (= (-!8 (-!8 lm!213 a1!68) a2!56) (-!8 (-!8 lm!213 a2!56) a1!68))))))

(declare-fun removeStrictlySorted!3 (List!296 (_ BitVec 64)) List!296)

(assert (=> b!10162 (= (removeStrictlySorted!3 (removeStrictlySorted!3 (toList!164 lm!213) a1!68) a2!56) (removeStrictlySorted!3 (removeStrictlySorted!3 (toList!164 lm!213) a2!56) a1!68))))

(declare-datatypes ((Unit!221 0))(
  ( (Unit!222) )
))
(declare-fun lt!2484 () Unit!221)

(declare-fun lemmaRemoveStrictlySortedCommutative!3 (List!296 (_ BitVec 64) (_ BitVec 64)) Unit!221)

(assert (=> b!10162 (= lt!2484 (lemmaRemoveStrictlySortedCommutative!3 (toList!164 lm!213) a1!68 a2!56))))

(declare-fun b!10163 () Bool)

(declare-fun tp!1451 () Bool)

(assert (=> b!10163 (= e!5855 tp!1451)))

(assert (= (and start!1180 res!8839) b!10162))

(assert (= start!1180 b!10163))

(declare-fun m!6517 () Bool)

(assert (=> start!1180 m!6517))

(declare-fun m!6519 () Bool)

(assert (=> start!1180 m!6519))

(declare-fun m!6521 () Bool)

(assert (=> b!10162 m!6521))

(declare-fun m!6523 () Bool)

(assert (=> b!10162 m!6523))

(declare-fun m!6525 () Bool)

(assert (=> b!10162 m!6525))

(declare-fun m!6527 () Bool)

(assert (=> b!10162 m!6527))

(declare-fun m!6529 () Bool)

(assert (=> b!10162 m!6529))

(declare-fun m!6531 () Bool)

(assert (=> b!10162 m!6531))

(declare-fun m!6533 () Bool)

(assert (=> b!10162 m!6533))

(assert (=> b!10162 m!6533))

(declare-fun m!6535 () Bool)

(assert (=> b!10162 m!6535))

(assert (=> b!10162 m!6521))

(declare-fun m!6537 () Bool)

(assert (=> b!10162 m!6537))

(assert (=> b!10162 m!6523))

(assert (=> b!10162 m!6527))

(push 1)

(assert (not b!10162))

(assert (not start!1180))

(assert (not b!10163))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1013 () Bool)

(declare-fun lt!2489 () ListLongMap!297)

(declare-fun contains!136 (ListLongMap!297 (_ BitVec 64)) Bool)

(assert (=> d!1013 (not (contains!136 lt!2489 a1!68))))

(assert (=> d!1013 (= lt!2489 (ListLongMap!298 (removeStrictlySorted!3 (toList!164 (-!8 lm!213 a2!56)) a1!68)))))

(assert (=> d!1013 (= (-!8 (-!8 lm!213 a2!56) a1!68) lt!2489)))

(declare-fun bs!351 () Bool)

(assert (= bs!351 d!1013))

(declare-fun m!6541 () Bool)

(assert (=> bs!351 m!6541))

(declare-fun m!6545 () Bool)

(assert (=> bs!351 m!6545))

(assert (=> b!10162 d!1013))

(declare-fun d!1019 () Bool)

(declare-fun lt!2492 () ListLongMap!297)

(assert (=> d!1019 (not (contains!136 lt!2492 a1!68))))

(assert (=> d!1019 (= lt!2492 (ListLongMap!298 (removeStrictlySorted!3 (toList!164 lm!213) a1!68)))))

(assert (=> d!1019 (= (-!8 lm!213 a1!68) lt!2492)))

(declare-fun bs!354 () Bool)

(assert (= bs!354 d!1019))

(declare-fun m!6549 () Bool)

(assert (=> bs!354 m!6549))

(assert (=> bs!354 m!6521))

(assert (=> b!10162 d!1019))

(declare-fun e!5876 () List!296)

(declare-fun b!10190 () Bool)

(declare-fun $colon$colon!6 (List!296 tuple2!292) List!296)

(assert (=> b!10190 (= e!5876 ($colon$colon!6 (removeStrictlySorted!3 (t!2443 (removeStrictlySorted!3 (toList!164 lm!213) a1!68)) a2!56) (h!858 (removeStrictlySorted!3 (toList!164 lm!213) a1!68))))))

(declare-fun b!10191 () Bool)

(declare-fun e!5875 () List!296)

(assert (=> b!10191 (= e!5875 (t!2443 (removeStrictlySorted!3 (toList!164 lm!213) a1!68)))))

(declare-fun d!1023 () Bool)

(declare-fun e!5874 () Bool)

(assert (=> d!1023 e!5874))

(declare-fun res!8850 () Bool)

(assert (=> d!1023 (=> (not res!8850) (not e!5874))))

(declare-fun lt!2497 () List!296)

(assert (=> d!1023 (= res!8850 (isStrictlySorted!24 lt!2497))))

(assert (=> d!1023 (= lt!2497 e!5875)))

(declare-fun c!887 () Bool)

(assert (=> d!1023 (= c!887 (and (is-Cons!292 (removeStrictlySorted!3 (toList!164 lm!213) a1!68)) (= (_1!146 (h!858 (removeStrictlySorted!3 (toList!164 lm!213) a1!68))) a2!56)))))

(assert (=> d!1023 (isStrictlySorted!24 (removeStrictlySorted!3 (toList!164 lm!213) a1!68))))

(assert (=> d!1023 (= (removeStrictlySorted!3 (removeStrictlySorted!3 (toList!164 lm!213) a1!68) a2!56) lt!2497)))

(declare-fun b!10192 () Bool)

(assert (=> b!10192 (= e!5876 Nil!293)))

(declare-fun b!10193 () Bool)

(declare-fun containsKey!11 (List!296 (_ BitVec 64)) Bool)

(assert (=> b!10193 (= e!5874 (not (containsKey!11 lt!2497 a2!56)))))

(declare-fun b!10194 () Bool)

(assert (=> b!10194 (= e!5875 e!5876)))

(declare-fun c!888 () Bool)

(assert (=> b!10194 (= c!888 (and (is-Cons!292 (removeStrictlySorted!3 (toList!164 lm!213) a1!68)) (not (= (_1!146 (h!858 (removeStrictlySorted!3 (toList!164 lm!213) a1!68))) a2!56))))))

(assert (= (and d!1023 c!887) b!10191))

(assert (= (and d!1023 (not c!887)) b!10194))

(assert (= (and b!10194 c!888) b!10190))

(assert (= (and b!10194 (not c!888)) b!10192))

(assert (= (and d!1023 res!8850) b!10193))

(declare-fun m!6553 () Bool)

(assert (=> b!10190 m!6553))

(assert (=> b!10190 m!6553))

(declare-fun m!6559 () Bool)

(assert (=> b!10190 m!6559))

(declare-fun m!6563 () Bool)

(assert (=> d!1023 m!6563))

(assert (=> d!1023 m!6521))

(declare-fun m!6565 () Bool)

(assert (=> d!1023 m!6565))

(declare-fun m!6569 () Bool)

(assert (=> b!10193 m!6569))

(assert (=> b!10162 d!1023))

(declare-fun d!1031 () Bool)

(assert (=> d!1031 (= (removeStrictlySorted!3 (removeStrictlySorted!3 (toList!164 lm!213) a1!68) a2!56) (removeStrictlySorted!3 (removeStrictlySorted!3 (toList!164 lm!213) a2!56) a1!68))))

(declare-fun lt!2506 () Unit!221)

(declare-fun choose!144 (List!296 (_ BitVec 64) (_ BitVec 64)) Unit!221)

(assert (=> d!1031 (= lt!2506 (choose!144 (toList!164 lm!213) a1!68 a2!56))))

(assert (=> d!1031 (isStrictlySorted!24 (toList!164 lm!213))))

(assert (=> d!1031 (= (lemmaRemoveStrictlySortedCommutative!3 (toList!164 lm!213) a1!68 a2!56) lt!2506)))

(declare-fun bs!356 () Bool)

(assert (= bs!356 d!1031))

(assert (=> bs!356 m!6521))

(declare-fun m!6573 () Bool)

(assert (=> bs!356 m!6573))

(assert (=> bs!356 m!6517))

(assert (=> bs!356 m!6527))

(assert (=> bs!356 m!6529))

(assert (=> bs!356 m!6527))

(assert (=> bs!356 m!6521))

(assert (=> bs!356 m!6537))

(assert (=> b!10162 d!1031))

(declare-fun b!10200 () Bool)

(declare-fun e!5882 () List!296)

(assert (=> b!10200 (= e!5882 ($colon$colon!6 (removeStrictlySorted!3 (t!2443 (toList!164 lm!213)) a1!68) (h!858 (toList!164 lm!213))))))

(declare-fun b!10201 () Bool)

(declare-fun e!5881 () List!296)

(assert (=> b!10201 (= e!5881 (t!2443 (toList!164 lm!213)))))

(declare-fun d!1037 () Bool)

(declare-fun e!5880 () Bool)

(assert (=> d!1037 e!5880))

(declare-fun res!8852 () Bool)

(assert (=> d!1037 (=> (not res!8852) (not e!5880))))

(declare-fun lt!2509 () List!296)

(assert (=> d!1037 (= res!8852 (isStrictlySorted!24 lt!2509))))

(assert (=> d!1037 (= lt!2509 e!5881)))

(declare-fun c!891 () Bool)

(assert (=> d!1037 (= c!891 (and (is-Cons!292 (toList!164 lm!213)) (= (_1!146 (h!858 (toList!164 lm!213))) a1!68)))))

(assert (=> d!1037 (isStrictlySorted!24 (toList!164 lm!213))))

(assert (=> d!1037 (= (removeStrictlySorted!3 (toList!164 lm!213) a1!68) lt!2509)))

(declare-fun b!10202 () Bool)

(assert (=> b!10202 (= e!5882 Nil!293)))

(declare-fun b!10203 () Bool)

(assert (=> b!10203 (= e!5880 (not (containsKey!11 lt!2509 a1!68)))))

(declare-fun b!10204 () Bool)

(assert (=> b!10204 (= e!5881 e!5882)))

(declare-fun c!892 () Bool)

(assert (=> b!10204 (= c!892 (and (is-Cons!292 (toList!164 lm!213)) (not (= (_1!146 (h!858 (toList!164 lm!213))) a1!68))))))

(assert (= (and d!1037 c!891) b!10201))

(assert (= (and d!1037 (not c!891)) b!10204))

(assert (= (and b!10204 c!892) b!10200))

(assert (= (and b!10204 (not c!892)) b!10202))

(assert (= (and d!1037 res!8852) b!10203))

(declare-fun m!6583 () Bool)

(assert (=> b!10200 m!6583))

(assert (=> b!10200 m!6583))

(declare-fun m!6586 () Bool)

(assert (=> b!10200 m!6586))

(declare-fun m!6589 () Bool)

(assert (=> d!1037 m!6589))

(assert (=> d!1037 m!6517))

(declare-fun m!6593 () Bool)

(assert (=> b!10203 m!6593))

(assert (=> b!10162 d!1037))

(declare-fun e!5888 () List!296)

(declare-fun b!10210 () Bool)

(assert (=> b!10210 (= e!5888 ($colon$colon!6 (removeStrictlySorted!3 (t!2443 (removeStrictlySorted!3 (toList!164 lm!213) a2!56)) a1!68) (h!858 (removeStrictlySorted!3 (toList!164 lm!213) a2!56))))))

(declare-fun b!10211 () Bool)

(declare-fun e!5887 () List!296)

(assert (=> b!10211 (= e!5887 (t!2443 (removeStrictlySorted!3 (toList!164 lm!213) a2!56)))))

(declare-fun d!1043 () Bool)

(declare-fun e!5886 () Bool)

(assert (=> d!1043 e!5886))

(declare-fun res!8854 () Bool)

(assert (=> d!1043 (=> (not res!8854) (not e!5886))))

(declare-fun lt!2511 () List!296)

(assert (=> d!1043 (= res!8854 (isStrictlySorted!24 lt!2511))))

(assert (=> d!1043 (= lt!2511 e!5887)))

(declare-fun c!895 () Bool)

(assert (=> d!1043 (= c!895 (and (is-Cons!292 (removeStrictlySorted!3 (toList!164 lm!213) a2!56)) (= (_1!146 (h!858 (removeStrictlySorted!3 (toList!164 lm!213) a2!56))) a1!68)))))

(assert (=> d!1043 (isStrictlySorted!24 (removeStrictlySorted!3 (toList!164 lm!213) a2!56))))

(assert (=> d!1043 (= (removeStrictlySorted!3 (removeStrictlySorted!3 (toList!164 lm!213) a2!56) a1!68) lt!2511)))

(declare-fun b!10212 () Bool)

(assert (=> b!10212 (= e!5888 Nil!293)))

(declare-fun b!10213 () Bool)

(assert (=> b!10213 (= e!5886 (not (containsKey!11 lt!2511 a1!68)))))

(declare-fun b!10214 () Bool)

(assert (=> b!10214 (= e!5887 e!5888)))

(declare-fun c!896 () Bool)

(assert (=> b!10214 (= c!896 (and (is-Cons!292 (removeStrictlySorted!3 (toList!164 lm!213) a2!56)) (not (= (_1!146 (h!858 (removeStrictlySorted!3 (toList!164 lm!213) a2!56))) a1!68))))))

(assert (= (and d!1043 c!895) b!10211))

(assert (= (and d!1043 (not c!895)) b!10214))

(assert (= (and b!10214 c!896) b!10210))

(assert (= (and b!10214 (not c!896)) b!10212))

(assert (= (and d!1043 res!8854) b!10213))

(declare-fun m!6599 () Bool)

(assert (=> b!10210 m!6599))

(assert (=> b!10210 m!6599))

(declare-fun m!6601 () Bool)

(assert (=> b!10210 m!6601))

(declare-fun m!6605 () Bool)

(assert (=> d!1043 m!6605))

(assert (=> d!1043 m!6527))

(declare-fun m!6609 () Bool)

(assert (=> d!1043 m!6609))

(declare-fun m!6613 () Bool)

(assert (=> b!10213 m!6613))

(assert (=> b!10162 d!1043))

(declare-fun d!1049 () Bool)

(declare-fun lt!2514 () ListLongMap!297)

(assert (=> d!1049 (not (contains!136 lt!2514 a2!56))))

(assert (=> d!1049 (= lt!2514 (ListLongMap!298 (removeStrictlySorted!3 (toList!164 (-!8 lm!213 a1!68)) a2!56)))))

(assert (=> d!1049 (= (-!8 (-!8 lm!213 a1!68) a2!56) lt!2514)))

(declare-fun bs!361 () Bool)

(assert (= bs!361 d!1049))

(declare-fun m!6621 () Bool)

(assert (=> bs!361 m!6621))

(declare-fun m!6625 () Bool)

(assert (=> bs!361 m!6625))

(assert (=> b!10162 d!1049))

(declare-fun b!10225 () Bool)

(declare-fun e!5897 () List!296)

(assert (=> b!10225 (= e!5897 ($colon$colon!6 (removeStrictlySorted!3 (t!2443 (toList!164 lm!213)) a2!56) (h!858 (toList!164 lm!213))))))

(declare-fun b!10226 () Bool)

(declare-fun e!5896 () List!296)

(assert (=> b!10226 (= e!5896 (t!2443 (toList!164 lm!213)))))

(declare-fun d!1053 () Bool)

(declare-fun e!5895 () Bool)

(assert (=> d!1053 e!5895))

(declare-fun res!8857 () Bool)

(assert (=> d!1053 (=> (not res!8857) (not e!5895))))

(declare-fun lt!2516 () List!296)

(assert (=> d!1053 (= res!8857 (isStrictlySorted!24 lt!2516))))

(assert (=> d!1053 (= lt!2516 e!5896)))

(declare-fun c!901 () Bool)

(assert (=> d!1053 (= c!901 (and (is-Cons!292 (toList!164 lm!213)) (= (_1!146 (h!858 (toList!164 lm!213))) a2!56)))))

(assert (=> d!1053 (isStrictlySorted!24 (toList!164 lm!213))))

(assert (=> d!1053 (= (removeStrictlySorted!3 (toList!164 lm!213) a2!56) lt!2516)))

(declare-fun b!10227 () Bool)

(assert (=> b!10227 (= e!5897 Nil!293)))

(declare-fun b!10228 () Bool)

(assert (=> b!10228 (= e!5895 (not (containsKey!11 lt!2516 a2!56)))))

(declare-fun b!10229 () Bool)

(assert (=> b!10229 (= e!5896 e!5897)))

(declare-fun c!902 () Bool)

(assert (=> b!10229 (= c!902 (and (is-Cons!292 (toList!164 lm!213)) (not (= (_1!146 (h!858 (toList!164 lm!213))) a2!56))))))

(assert (= (and d!1053 c!901) b!10226))

(assert (= (and d!1053 (not c!901)) b!10229))

(assert (= (and b!10229 c!902) b!10225))

(assert (= (and b!10229 (not c!902)) b!10227))

(assert (= (and d!1053 res!8857) b!10228))

(declare-fun m!6629 () Bool)

(assert (=> b!10225 m!6629))

(assert (=> b!10225 m!6629))

(declare-fun m!6633 () Bool)

(assert (=> b!10225 m!6633))

(declare-fun m!6637 () Bool)

(assert (=> d!1053 m!6637))

(assert (=> d!1053 m!6517))

(declare-fun m!6641 () Bool)

(assert (=> b!10228 m!6641))

(assert (=> b!10162 d!1053))

(declare-fun d!1057 () Bool)

(declare-fun lt!2518 () ListLongMap!297)

(assert (=> d!1057 (not (contains!136 lt!2518 a2!56))))

(assert (=> d!1057 (= lt!2518 (ListLongMap!298 (removeStrictlySorted!3 (toList!164 lm!213) a2!56)))))

(assert (=> d!1057 (= (-!8 lm!213 a2!56) lt!2518)))

(declare-fun bs!363 () Bool)

(assert (= bs!363 d!1057))

(declare-fun m!6645 () Bool)

(assert (=> bs!363 m!6645))

(assert (=> bs!363 m!6527))

(assert (=> b!10162 d!1057))

(declare-fun d!1061 () Bool)

(declare-fun res!8866 () Bool)

(declare-fun e!5906 () Bool)

(assert (=> d!1061 (=> res!8866 e!5906)))

(assert (=> d!1061 (= res!8866 (or (is-Nil!293 (toList!164 lm!213)) (is-Nil!293 (t!2443 (toList!164 lm!213)))))))

(assert (=> d!1061 (= (isStrictlySorted!24 (toList!164 lm!213)) e!5906)))

(declare-fun b!10238 () Bool)

(declare-fun e!5907 () Bool)

(assert (=> b!10238 (= e!5906 e!5907)))

(declare-fun res!8867 () Bool)

(assert (=> b!10238 (=> (not res!8867) (not e!5907))))

(assert (=> b!10238 (= res!8867 (bvslt (_1!146 (h!858 (toList!164 lm!213))) (_1!146 (h!858 (t!2443 (toList!164 lm!213))))))))

(declare-fun b!10239 () Bool)

(assert (=> b!10239 (= e!5907 (isStrictlySorted!24 (t!2443 (toList!164 lm!213))))))

(assert (= (and d!1061 (not res!8866)) b!10238))

(assert (= (and b!10238 res!8867) b!10239))

(declare-fun m!6647 () Bool)

(assert (=> b!10239 m!6647))

(assert (=> start!1180 d!1061))

(declare-fun d!1063 () Bool)

(assert (=> d!1063 (= (inv!460 lm!213) (isStrictlySorted!24 (toList!164 lm!213)))))

(declare-fun bs!364 () Bool)

(assert (= bs!364 d!1063))

(assert (=> bs!364 m!6517))

(assert (=> start!1180 d!1063))

(declare-fun b!10261 () Bool)

(declare-fun e!5921 () Bool)

(declare-fun tp_is_empty!476 () Bool)

(declare-fun tp!1457 () Bool)

(assert (=> b!10261 (= e!5921 (and tp_is_empty!476 tp!1457))))

(assert (=> b!10163 (= tp!1451 e!5921)))

(assert (= (and b!10163 (is-Cons!292 (toList!164 lm!213))) b!10261))

(push 1)

(assert (not b!10200))

(assert (not d!1037))

(assert (not b!10228))

(assert (not b!10213))

(assert (not b!10239))

(assert (not d!1063))

(assert (not d!1013))

(assert (not b!10261))

(assert (not b!10190))

(assert (not d!1049))

(assert (not d!1019))

(assert (not b!10225))

(assert (not b!10203))

(assert (not b!10193))

(assert (not d!1043))

(assert (not b!10210))

(assert tp_is_empty!476)

(assert (not d!1057))

(assert (not d!1053))

(assert (not d!1031))

(assert (not d!1023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

