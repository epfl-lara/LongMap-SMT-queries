; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133294 () Bool)

(assert start!133294)

(declare-fun b!1558881 () Bool)

(declare-fun res!1066131 () Bool)

(declare-fun e!868466 () Bool)

(assert (=> b!1558881 (=> (not res!1066131) (not e!868466))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(declare-datatypes ((B!2446 0))(
  ( (B!2447 (val!19309 Int)) )
))
(declare-datatypes ((tuple2!24994 0))(
  ( (tuple2!24995 (_1!12508 (_ BitVec 64)) (_2!12508 B!2446)) )
))
(declare-datatypes ((List!36343 0))(
  ( (Nil!36340) (Cons!36339 (h!37785 tuple2!24994) (t!51073 List!36343)) )
))
(declare-fun l!1292 () List!36343)

(get-info :version)

(assert (=> b!1558881 (= res!1066131 (and (not (= otherKey!62 newKey!135)) (or (not ((_ is Cons!36339) l!1292)) (= (_1!12508 (h!37785 l!1292)) otherKey!62))))))

(declare-fun b!1558880 () Bool)

(declare-fun res!1066130 () Bool)

(assert (=> b!1558880 (=> (not res!1066130) (not e!868466))))

(declare-fun containsKey!846 (List!36343 (_ BitVec 64)) Bool)

(assert (=> b!1558880 (= res!1066130 (containsKey!846 l!1292 otherKey!62))))

(declare-fun b!1558882 () Bool)

(declare-fun newValue!135 () B!2446)

(declare-fun insertStrictlySorted!574 (List!36343 (_ BitVec 64) B!2446) List!36343)

(assert (=> b!1558882 (= e!868466 (not (containsKey!846 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135) otherKey!62)))))

(declare-fun res!1066132 () Bool)

(assert (=> start!133294 (=> (not res!1066132) (not e!868466))))

(declare-fun isStrictlySorted!983 (List!36343) Bool)

(assert (=> start!133294 (= res!1066132 (isStrictlySorted!983 l!1292))))

(assert (=> start!133294 e!868466))

(declare-fun e!868465 () Bool)

(assert (=> start!133294 e!868465))

(assert (=> start!133294 true))

(declare-fun tp_is_empty!38451 () Bool)

(assert (=> start!133294 tp_is_empty!38451))

(declare-fun b!1558883 () Bool)

(declare-fun tp!112680 () Bool)

(assert (=> b!1558883 (= e!868465 (and tp_is_empty!38451 tp!112680))))

(assert (= (and start!133294 res!1066132) b!1558880))

(assert (= (and b!1558880 res!1066130) b!1558881))

(assert (= (and b!1558881 res!1066131) b!1558882))

(assert (= (and start!133294 ((_ is Cons!36339) l!1292)) b!1558883))

(declare-fun m!1435355 () Bool)

(assert (=> b!1558880 m!1435355))

(declare-fun m!1435357 () Bool)

(assert (=> b!1558882 m!1435357))

(assert (=> b!1558882 m!1435357))

(declare-fun m!1435359 () Bool)

(assert (=> b!1558882 m!1435359))

(declare-fun m!1435361 () Bool)

(assert (=> start!133294 m!1435361))

(check-sat (not b!1558883) (not b!1558882) (not start!133294) (not b!1558880) tp_is_empty!38451)
(check-sat)
(get-model)

(declare-fun d!162819 () Bool)

(declare-fun res!1066146 () Bool)

(declare-fun e!868477 () Bool)

(assert (=> d!162819 (=> res!1066146 e!868477)))

(assert (=> d!162819 (= res!1066146 (and ((_ is Cons!36339) (insertStrictlySorted!574 l!1292 newKey!135 newValue!135)) (= (_1!12508 (h!37785 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162819 (= (containsKey!846 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135) otherKey!62) e!868477)))

(declare-fun b!1558900 () Bool)

(declare-fun e!868478 () Bool)

(assert (=> b!1558900 (= e!868477 e!868478)))

(declare-fun res!1066147 () Bool)

(assert (=> b!1558900 (=> (not res!1066147) (not e!868478))))

(assert (=> b!1558900 (= res!1066147 (and (or (not ((_ is Cons!36339) (insertStrictlySorted!574 l!1292 newKey!135 newValue!135))) (bvsle (_1!12508 (h!37785 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135))) otherKey!62)) ((_ is Cons!36339) (insertStrictlySorted!574 l!1292 newKey!135 newValue!135)) (bvslt (_1!12508 (h!37785 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1558901 () Bool)

(assert (=> b!1558901 (= e!868478 (containsKey!846 (t!51073 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162819 (not res!1066146)) b!1558900))

(assert (= (and b!1558900 res!1066147) b!1558901))

(declare-fun m!1435371 () Bool)

(assert (=> b!1558901 m!1435371))

(assert (=> b!1558882 d!162819))

(declare-fun b!1558948 () Bool)

(declare-fun e!868516 () List!36343)

(assert (=> b!1558948 (= e!868516 (insertStrictlySorted!574 (t!51073 l!1292) newKey!135 newValue!135))))

(declare-fun b!1558949 () Bool)

(declare-fun c!144175 () Bool)

(assert (=> b!1558949 (= c!144175 (and ((_ is Cons!36339) l!1292) (bvsgt (_1!12508 (h!37785 l!1292)) newKey!135)))))

(declare-fun e!868515 () List!36343)

(declare-fun e!868519 () List!36343)

(assert (=> b!1558949 (= e!868515 e!868519)))

(declare-fun b!1558950 () Bool)

(declare-fun call!71804 () List!36343)

(assert (=> b!1558950 (= e!868519 call!71804)))

(declare-fun bm!71800 () Bool)

(declare-fun call!71803 () List!36343)

(declare-fun call!71805 () List!36343)

(assert (=> bm!71800 (= call!71803 call!71805)))

(declare-fun bm!71801 () Bool)

(assert (=> bm!71801 (= call!71804 call!71803)))

(declare-fun c!144176 () Bool)

(declare-fun bm!71802 () Bool)

(declare-fun $colon$colon!984 (List!36343 tuple2!24994) List!36343)

(assert (=> bm!71802 (= call!71805 ($colon$colon!984 e!868516 (ite c!144176 (h!37785 l!1292) (tuple2!24995 newKey!135 newValue!135))))))

(declare-fun c!144174 () Bool)

(assert (=> bm!71802 (= c!144174 c!144176)))

(declare-fun b!1558952 () Bool)

(declare-fun e!868517 () List!36343)

(assert (=> b!1558952 (= e!868517 call!71805)))

(declare-fun b!1558953 () Bool)

(declare-fun res!1066179 () Bool)

(declare-fun e!868518 () Bool)

(assert (=> b!1558953 (=> (not res!1066179) (not e!868518))))

(declare-fun lt!670832 () List!36343)

(assert (=> b!1558953 (= res!1066179 (containsKey!846 lt!670832 newKey!135))))

(declare-fun b!1558954 () Bool)

(assert (=> b!1558954 (= e!868519 call!71804)))

(declare-fun b!1558955 () Bool)

(assert (=> b!1558955 (= e!868515 call!71803)))

(declare-fun b!1558956 () Bool)

(declare-fun contains!10215 (List!36343 tuple2!24994) Bool)

(assert (=> b!1558956 (= e!868518 (contains!10215 lt!670832 (tuple2!24995 newKey!135 newValue!135)))))

(declare-fun b!1558957 () Bool)

(assert (=> b!1558957 (= e!868517 e!868515)))

(declare-fun c!144173 () Bool)

(assert (=> b!1558957 (= c!144173 (and ((_ is Cons!36339) l!1292) (= (_1!12508 (h!37785 l!1292)) newKey!135)))))

(declare-fun b!1558951 () Bool)

(assert (=> b!1558951 (= e!868516 (ite c!144173 (t!51073 l!1292) (ite c!144175 (Cons!36339 (h!37785 l!1292) (t!51073 l!1292)) Nil!36340)))))

(declare-fun d!162821 () Bool)

(assert (=> d!162821 e!868518))

(declare-fun res!1066178 () Bool)

(assert (=> d!162821 (=> (not res!1066178) (not e!868518))))

(assert (=> d!162821 (= res!1066178 (isStrictlySorted!983 lt!670832))))

(assert (=> d!162821 (= lt!670832 e!868517)))

(assert (=> d!162821 (= c!144176 (and ((_ is Cons!36339) l!1292) (bvslt (_1!12508 (h!37785 l!1292)) newKey!135)))))

(assert (=> d!162821 (isStrictlySorted!983 l!1292)))

(assert (=> d!162821 (= (insertStrictlySorted!574 l!1292 newKey!135 newValue!135) lt!670832)))

(assert (= (and d!162821 c!144176) b!1558952))

(assert (= (and d!162821 (not c!144176)) b!1558957))

(assert (= (and b!1558957 c!144173) b!1558955))

(assert (= (and b!1558957 (not c!144173)) b!1558949))

(assert (= (and b!1558949 c!144175) b!1558950))

(assert (= (and b!1558949 (not c!144175)) b!1558954))

(assert (= (or b!1558950 b!1558954) bm!71801))

(assert (= (or b!1558955 bm!71801) bm!71800))

(assert (= (or b!1558952 bm!71800) bm!71802))

(assert (= (and bm!71802 c!144174) b!1558948))

(assert (= (and bm!71802 (not c!144174)) b!1558951))

(assert (= (and d!162821 res!1066178) b!1558953))

(assert (= (and b!1558953 res!1066179) b!1558956))

(declare-fun m!1435383 () Bool)

(assert (=> bm!71802 m!1435383))

(declare-fun m!1435385 () Bool)

(assert (=> b!1558956 m!1435385))

(declare-fun m!1435387 () Bool)

(assert (=> b!1558948 m!1435387))

(declare-fun m!1435389 () Bool)

(assert (=> d!162821 m!1435389))

(assert (=> d!162821 m!1435361))

(declare-fun m!1435391 () Bool)

(assert (=> b!1558953 m!1435391))

(assert (=> b!1558882 d!162821))

(declare-fun d!162837 () Bool)

(declare-fun res!1066180 () Bool)

(declare-fun e!868522 () Bool)

(assert (=> d!162837 (=> res!1066180 e!868522)))

(assert (=> d!162837 (= res!1066180 (and ((_ is Cons!36339) l!1292) (= (_1!12508 (h!37785 l!1292)) otherKey!62)))))

(assert (=> d!162837 (= (containsKey!846 l!1292 otherKey!62) e!868522)))

(declare-fun b!1558962 () Bool)

(declare-fun e!868523 () Bool)

(assert (=> b!1558962 (= e!868522 e!868523)))

(declare-fun res!1066181 () Bool)

(assert (=> b!1558962 (=> (not res!1066181) (not e!868523))))

(assert (=> b!1558962 (= res!1066181 (and (or (not ((_ is Cons!36339) l!1292)) (bvsle (_1!12508 (h!37785 l!1292)) otherKey!62)) ((_ is Cons!36339) l!1292) (bvslt (_1!12508 (h!37785 l!1292)) otherKey!62)))))

(declare-fun b!1558963 () Bool)

(assert (=> b!1558963 (= e!868523 (containsKey!846 (t!51073 l!1292) otherKey!62))))

(assert (= (and d!162837 (not res!1066180)) b!1558962))

(assert (= (and b!1558962 res!1066181) b!1558963))

(declare-fun m!1435393 () Bool)

(assert (=> b!1558963 m!1435393))

(assert (=> b!1558880 d!162837))

(declare-fun d!162839 () Bool)

(declare-fun res!1066190 () Bool)

(declare-fun e!868544 () Bool)

(assert (=> d!162839 (=> res!1066190 e!868544)))

(assert (=> d!162839 (= res!1066190 (or ((_ is Nil!36340) l!1292) ((_ is Nil!36340) (t!51073 l!1292))))))

(assert (=> d!162839 (= (isStrictlySorted!983 l!1292) e!868544)))

(declare-fun b!1559000 () Bool)

(declare-fun e!868545 () Bool)

(assert (=> b!1559000 (= e!868544 e!868545)))

(declare-fun res!1066191 () Bool)

(assert (=> b!1559000 (=> (not res!1066191) (not e!868545))))

(assert (=> b!1559000 (= res!1066191 (bvslt (_1!12508 (h!37785 l!1292)) (_1!12508 (h!37785 (t!51073 l!1292)))))))

(declare-fun b!1559001 () Bool)

(assert (=> b!1559001 (= e!868545 (isStrictlySorted!983 (t!51073 l!1292)))))

(assert (= (and d!162839 (not res!1066190)) b!1559000))

(assert (= (and b!1559000 res!1066191) b!1559001))

(declare-fun m!1435395 () Bool)

(assert (=> b!1559001 m!1435395))

(assert (=> start!133294 d!162839))

(declare-fun b!1559010 () Bool)

(declare-fun e!868550 () Bool)

(declare-fun tp!112686 () Bool)

(assert (=> b!1559010 (= e!868550 (and tp_is_empty!38451 tp!112686))))

(assert (=> b!1558883 (= tp!112680 e!868550)))

(assert (= (and b!1558883 ((_ is Cons!36339) (t!51073 l!1292))) b!1559010))

(check-sat (not b!1559010) (not d!162821) (not b!1558948) (not b!1559001) (not bm!71802) (not b!1558901) (not b!1558953) (not b!1558956) tp_is_empty!38451 (not b!1558963))
(check-sat)
(get-model)

(declare-fun d!162859 () Bool)

(declare-fun res!1066220 () Bool)

(declare-fun e!868591 () Bool)

(assert (=> d!162859 (=> res!1066220 e!868591)))

(assert (=> d!162859 (= res!1066220 (or ((_ is Nil!36340) (t!51073 l!1292)) ((_ is Nil!36340) (t!51073 (t!51073 l!1292)))))))

(assert (=> d!162859 (= (isStrictlySorted!983 (t!51073 l!1292)) e!868591)))

(declare-fun b!1559070 () Bool)

(declare-fun e!868592 () Bool)

(assert (=> b!1559070 (= e!868591 e!868592)))

(declare-fun res!1066221 () Bool)

(assert (=> b!1559070 (=> (not res!1066221) (not e!868592))))

(assert (=> b!1559070 (= res!1066221 (bvslt (_1!12508 (h!37785 (t!51073 l!1292))) (_1!12508 (h!37785 (t!51073 (t!51073 l!1292))))))))

(declare-fun b!1559071 () Bool)

(assert (=> b!1559071 (= e!868592 (isStrictlySorted!983 (t!51073 (t!51073 l!1292))))))

(assert (= (and d!162859 (not res!1066220)) b!1559070))

(assert (= (and b!1559070 res!1066221) b!1559071))

(declare-fun m!1435445 () Bool)

(assert (=> b!1559071 m!1435445))

(assert (=> b!1559001 d!162859))

(declare-fun d!162861 () Bool)

(declare-fun res!1066222 () Bool)

(declare-fun e!868593 () Bool)

(assert (=> d!162861 (=> res!1066222 e!868593)))

(assert (=> d!162861 (= res!1066222 (and ((_ is Cons!36339) (t!51073 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135))) (= (_1!12508 (h!37785 (t!51073 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!162861 (= (containsKey!846 (t!51073 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135)) otherKey!62) e!868593)))

(declare-fun b!1559072 () Bool)

(declare-fun e!868594 () Bool)

(assert (=> b!1559072 (= e!868593 e!868594)))

(declare-fun res!1066223 () Bool)

(assert (=> b!1559072 (=> (not res!1066223) (not e!868594))))

(assert (=> b!1559072 (= res!1066223 (and (or (not ((_ is Cons!36339) (t!51073 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135)))) (bvsle (_1!12508 (h!37785 (t!51073 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135)))) otherKey!62)) ((_ is Cons!36339) (t!51073 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135))) (bvslt (_1!12508 (h!37785 (t!51073 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1559073 () Bool)

(assert (=> b!1559073 (= e!868594 (containsKey!846 (t!51073 (t!51073 (insertStrictlySorted!574 l!1292 newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!162861 (not res!1066222)) b!1559072))

(assert (= (and b!1559072 res!1066223) b!1559073))

(declare-fun m!1435447 () Bool)

(assert (=> b!1559073 m!1435447))

(assert (=> b!1558901 d!162861))

(declare-fun lt!670845 () Bool)

(declare-fun d!162863 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!805 (List!36343) (InoxSet tuple2!24994))

(assert (=> d!162863 (= lt!670845 (select (content!805 lt!670832) (tuple2!24995 newKey!135 newValue!135)))))

(declare-fun e!868600 () Bool)

(assert (=> d!162863 (= lt!670845 e!868600)))

(declare-fun res!1066228 () Bool)

(assert (=> d!162863 (=> (not res!1066228) (not e!868600))))

(assert (=> d!162863 (= res!1066228 ((_ is Cons!36339) lt!670832))))

(assert (=> d!162863 (= (contains!10215 lt!670832 (tuple2!24995 newKey!135 newValue!135)) lt!670845)))

(declare-fun b!1559078 () Bool)

(declare-fun e!868599 () Bool)

(assert (=> b!1559078 (= e!868600 e!868599)))

(declare-fun res!1066229 () Bool)

(assert (=> b!1559078 (=> res!1066229 e!868599)))

(assert (=> b!1559078 (= res!1066229 (= (h!37785 lt!670832) (tuple2!24995 newKey!135 newValue!135)))))

(declare-fun b!1559079 () Bool)

(assert (=> b!1559079 (= e!868599 (contains!10215 (t!51073 lt!670832) (tuple2!24995 newKey!135 newValue!135)))))

(assert (= (and d!162863 res!1066228) b!1559078))

(assert (= (and b!1559078 (not res!1066229)) b!1559079))

(declare-fun m!1435449 () Bool)

(assert (=> d!162863 m!1435449))

(declare-fun m!1435451 () Bool)

(assert (=> d!162863 m!1435451))

(declare-fun m!1435453 () Bool)

(assert (=> b!1559079 m!1435453))

(assert (=> b!1558956 d!162863))

(declare-fun b!1559080 () Bool)

(declare-fun e!868602 () List!36343)

(assert (=> b!1559080 (= e!868602 (insertStrictlySorted!574 (t!51073 (t!51073 l!1292)) newKey!135 newValue!135))))

(declare-fun b!1559081 () Bool)

(declare-fun c!144207 () Bool)

(assert (=> b!1559081 (= c!144207 (and ((_ is Cons!36339) (t!51073 l!1292)) (bvsgt (_1!12508 (h!37785 (t!51073 l!1292))) newKey!135)))))

(declare-fun e!868601 () List!36343)

(declare-fun e!868605 () List!36343)

(assert (=> b!1559081 (= e!868601 e!868605)))

(declare-fun b!1559082 () Bool)

(declare-fun call!71828 () List!36343)

(assert (=> b!1559082 (= e!868605 call!71828)))

(declare-fun bm!71824 () Bool)

(declare-fun call!71827 () List!36343)

(declare-fun call!71829 () List!36343)

(assert (=> bm!71824 (= call!71827 call!71829)))

(declare-fun bm!71825 () Bool)

(assert (=> bm!71825 (= call!71828 call!71827)))

(declare-fun bm!71826 () Bool)

(declare-fun c!144208 () Bool)

(assert (=> bm!71826 (= call!71829 ($colon$colon!984 e!868602 (ite c!144208 (h!37785 (t!51073 l!1292)) (tuple2!24995 newKey!135 newValue!135))))))

(declare-fun c!144206 () Bool)

(assert (=> bm!71826 (= c!144206 c!144208)))

(declare-fun b!1559084 () Bool)

(declare-fun e!868603 () List!36343)

(assert (=> b!1559084 (= e!868603 call!71829)))

(declare-fun b!1559085 () Bool)

(declare-fun res!1066231 () Bool)

(declare-fun e!868604 () Bool)

(assert (=> b!1559085 (=> (not res!1066231) (not e!868604))))

(declare-fun lt!670846 () List!36343)

(assert (=> b!1559085 (= res!1066231 (containsKey!846 lt!670846 newKey!135))))

(declare-fun b!1559086 () Bool)

(assert (=> b!1559086 (= e!868605 call!71828)))

(declare-fun b!1559087 () Bool)

(assert (=> b!1559087 (= e!868601 call!71827)))

(declare-fun b!1559088 () Bool)

(assert (=> b!1559088 (= e!868604 (contains!10215 lt!670846 (tuple2!24995 newKey!135 newValue!135)))))

(declare-fun b!1559089 () Bool)

(assert (=> b!1559089 (= e!868603 e!868601)))

(declare-fun c!144205 () Bool)

(assert (=> b!1559089 (= c!144205 (and ((_ is Cons!36339) (t!51073 l!1292)) (= (_1!12508 (h!37785 (t!51073 l!1292))) newKey!135)))))

(declare-fun b!1559083 () Bool)

(assert (=> b!1559083 (= e!868602 (ite c!144205 (t!51073 (t!51073 l!1292)) (ite c!144207 (Cons!36339 (h!37785 (t!51073 l!1292)) (t!51073 (t!51073 l!1292))) Nil!36340)))))

(declare-fun d!162865 () Bool)

(assert (=> d!162865 e!868604))

(declare-fun res!1066230 () Bool)

(assert (=> d!162865 (=> (not res!1066230) (not e!868604))))

(assert (=> d!162865 (= res!1066230 (isStrictlySorted!983 lt!670846))))

(assert (=> d!162865 (= lt!670846 e!868603)))

(assert (=> d!162865 (= c!144208 (and ((_ is Cons!36339) (t!51073 l!1292)) (bvslt (_1!12508 (h!37785 (t!51073 l!1292))) newKey!135)))))

(assert (=> d!162865 (isStrictlySorted!983 (t!51073 l!1292))))

(assert (=> d!162865 (= (insertStrictlySorted!574 (t!51073 l!1292) newKey!135 newValue!135) lt!670846)))

(assert (= (and d!162865 c!144208) b!1559084))

(assert (= (and d!162865 (not c!144208)) b!1559089))

(assert (= (and b!1559089 c!144205) b!1559087))

(assert (= (and b!1559089 (not c!144205)) b!1559081))

(assert (= (and b!1559081 c!144207) b!1559082))

(assert (= (and b!1559081 (not c!144207)) b!1559086))

(assert (= (or b!1559082 b!1559086) bm!71825))

(assert (= (or b!1559087 bm!71825) bm!71824))

(assert (= (or b!1559084 bm!71824) bm!71826))

(assert (= (and bm!71826 c!144206) b!1559080))

(assert (= (and bm!71826 (not c!144206)) b!1559083))

(assert (= (and d!162865 res!1066230) b!1559085))

(assert (= (and b!1559085 res!1066231) b!1559088))

(declare-fun m!1435455 () Bool)

(assert (=> bm!71826 m!1435455))

(declare-fun m!1435457 () Bool)

(assert (=> b!1559088 m!1435457))

(declare-fun m!1435459 () Bool)

(assert (=> b!1559080 m!1435459))

(declare-fun m!1435461 () Bool)

(assert (=> d!162865 m!1435461))

(assert (=> d!162865 m!1435395))

(declare-fun m!1435463 () Bool)

(assert (=> b!1559085 m!1435463))

(assert (=> b!1558948 d!162865))

(declare-fun d!162867 () Bool)

(assert (=> d!162867 (= ($colon$colon!984 e!868516 (ite c!144176 (h!37785 l!1292) (tuple2!24995 newKey!135 newValue!135))) (Cons!36339 (ite c!144176 (h!37785 l!1292) (tuple2!24995 newKey!135 newValue!135)) e!868516))))

(assert (=> bm!71802 d!162867))

(declare-fun d!162869 () Bool)

(declare-fun res!1066232 () Bool)

(declare-fun e!868606 () Bool)

(assert (=> d!162869 (=> res!1066232 e!868606)))

(assert (=> d!162869 (= res!1066232 (or ((_ is Nil!36340) lt!670832) ((_ is Nil!36340) (t!51073 lt!670832))))))

(assert (=> d!162869 (= (isStrictlySorted!983 lt!670832) e!868606)))

(declare-fun b!1559090 () Bool)

(declare-fun e!868607 () Bool)

(assert (=> b!1559090 (= e!868606 e!868607)))

(declare-fun res!1066233 () Bool)

(assert (=> b!1559090 (=> (not res!1066233) (not e!868607))))

(assert (=> b!1559090 (= res!1066233 (bvslt (_1!12508 (h!37785 lt!670832)) (_1!12508 (h!37785 (t!51073 lt!670832)))))))

(declare-fun b!1559091 () Bool)

(assert (=> b!1559091 (= e!868607 (isStrictlySorted!983 (t!51073 lt!670832)))))

(assert (= (and d!162869 (not res!1066232)) b!1559090))

(assert (= (and b!1559090 res!1066233) b!1559091))

(declare-fun m!1435465 () Bool)

(assert (=> b!1559091 m!1435465))

(assert (=> d!162821 d!162869))

(assert (=> d!162821 d!162839))

(declare-fun d!162871 () Bool)

(declare-fun res!1066234 () Bool)

(declare-fun e!868608 () Bool)

(assert (=> d!162871 (=> res!1066234 e!868608)))

(assert (=> d!162871 (= res!1066234 (and ((_ is Cons!36339) (t!51073 l!1292)) (= (_1!12508 (h!37785 (t!51073 l!1292))) otherKey!62)))))

(assert (=> d!162871 (= (containsKey!846 (t!51073 l!1292) otherKey!62) e!868608)))

(declare-fun b!1559092 () Bool)

(declare-fun e!868609 () Bool)

(assert (=> b!1559092 (= e!868608 e!868609)))

(declare-fun res!1066235 () Bool)

(assert (=> b!1559092 (=> (not res!1066235) (not e!868609))))

(assert (=> b!1559092 (= res!1066235 (and (or (not ((_ is Cons!36339) (t!51073 l!1292))) (bvsle (_1!12508 (h!37785 (t!51073 l!1292))) otherKey!62)) ((_ is Cons!36339) (t!51073 l!1292)) (bvslt (_1!12508 (h!37785 (t!51073 l!1292))) otherKey!62)))))

(declare-fun b!1559093 () Bool)

(assert (=> b!1559093 (= e!868609 (containsKey!846 (t!51073 (t!51073 l!1292)) otherKey!62))))

(assert (= (and d!162871 (not res!1066234)) b!1559092))

(assert (= (and b!1559092 res!1066235) b!1559093))

(declare-fun m!1435467 () Bool)

(assert (=> b!1559093 m!1435467))

(assert (=> b!1558963 d!162871))

(declare-fun d!162873 () Bool)

(declare-fun res!1066236 () Bool)

(declare-fun e!868610 () Bool)

(assert (=> d!162873 (=> res!1066236 e!868610)))

(assert (=> d!162873 (= res!1066236 (and ((_ is Cons!36339) lt!670832) (= (_1!12508 (h!37785 lt!670832)) newKey!135)))))

(assert (=> d!162873 (= (containsKey!846 lt!670832 newKey!135) e!868610)))

(declare-fun b!1559094 () Bool)

(declare-fun e!868611 () Bool)

(assert (=> b!1559094 (= e!868610 e!868611)))

(declare-fun res!1066237 () Bool)

(assert (=> b!1559094 (=> (not res!1066237) (not e!868611))))

(assert (=> b!1559094 (= res!1066237 (and (or (not ((_ is Cons!36339) lt!670832)) (bvsle (_1!12508 (h!37785 lt!670832)) newKey!135)) ((_ is Cons!36339) lt!670832) (bvslt (_1!12508 (h!37785 lt!670832)) newKey!135)))))

(declare-fun b!1559095 () Bool)

(assert (=> b!1559095 (= e!868611 (containsKey!846 (t!51073 lt!670832) newKey!135))))

(assert (= (and d!162873 (not res!1066236)) b!1559094))

(assert (= (and b!1559094 res!1066237) b!1559095))

(declare-fun m!1435469 () Bool)

(assert (=> b!1559095 m!1435469))

(assert (=> b!1558953 d!162873))

(declare-fun b!1559096 () Bool)

(declare-fun e!868612 () Bool)

(declare-fun tp!112694 () Bool)

(assert (=> b!1559096 (= e!868612 (and tp_is_empty!38451 tp!112694))))

(assert (=> b!1559010 (= tp!112686 e!868612)))

(assert (= (and b!1559010 ((_ is Cons!36339) (t!51073 (t!51073 l!1292)))) b!1559096))

(check-sat (not b!1559093) (not b!1559080) (not b!1559096) (not b!1559071) (not b!1559085) (not bm!71826) (not b!1559073) (not d!162863) (not b!1559091) tp_is_empty!38451 (not b!1559079) (not b!1559088) (not d!162865) (not b!1559095))
(check-sat)
