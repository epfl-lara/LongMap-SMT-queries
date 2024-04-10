; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6470 () Bool)

(assert start!6470)

(declare-fun b_free!1505 () Bool)

(declare-fun b_next!1505 () Bool)

(assert (=> start!6470 (= b_free!1505 (not b_next!1505))))

(declare-fun tp!5945 () Bool)

(declare-fun b_and!2659 () Bool)

(assert (=> start!6470 (= tp!5945 b_and!2659)))

(declare-fun b!43017 () Bool)

(declare-fun res!25567 () Bool)

(declare-fun e!27259 () Bool)

(assert (=> b!43017 (=> res!25567 e!27259)))

(declare-datatypes ((V!2313 0))(
  ( (V!2314 (val!986 Int)) )
))
(declare-datatypes ((tuple2!1626 0))(
  ( (tuple2!1627 (_1!824 (_ BitVec 64)) (_2!824 V!2313)) )
))
(declare-datatypes ((List!1200 0))(
  ( (Nil!1197) (Cons!1196 (h!1773 tuple2!1626) (t!4201 List!1200)) )
))
(declare-datatypes ((ListLongMap!1203 0))(
  ( (ListLongMap!1204 (toList!617 List!1200)) )
))
(declare-fun lt!18396 () ListLongMap!1203)

(declare-fun isEmpty!279 (List!1200) Bool)

(assert (=> b!43017 (= res!25567 (isEmpty!279 (toList!617 lt!18396)))))

(declare-fun b!43016 () Bool)

(declare-fun e!27258 () Bool)

(assert (=> b!43016 (= e!27258 (not e!27259))))

(declare-fun res!25569 () Bool)

(assert (=> b!43016 (=> res!25569 e!27259)))

(assert (=> b!43016 (= res!25569 (= lt!18396 (ListLongMap!1204 Nil!1197)))))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!18399 () V!2313)

(declare-datatypes ((ValueCell!700 0))(
  ( (ValueCellFull!700 (v!2076 V!2313)) (EmptyCell!700) )
))
(declare-datatypes ((array!2935 0))(
  ( (array!2936 (arr!1411 (Array (_ BitVec 32) ValueCell!700)) (size!1596 (_ BitVec 32))) )
))
(declare-fun lt!18401 () array!2935)

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((array!2937 0))(
  ( (array!2938 (arr!1412 (Array (_ BitVec 32) (_ BitVec 64))) (size!1597 (_ BitVec 32))) )
))
(declare-fun lt!18397 () array!2937)

(declare-datatypes ((LongMapFixedSize!380 0))(
  ( (LongMapFixedSize!381 (defaultEntry!1883 Int) (mask!5432 (_ BitVec 32)) (extraKeys!1774 (_ BitVec 32)) (zeroValue!1801 V!2313) (minValue!1801 V!2313) (_size!239 (_ BitVec 32)) (_keys!3432 array!2937) (_values!1866 array!2935) (_vacant!239 (_ BitVec 32))) )
))
(declare-fun map!834 (LongMapFixedSize!380) ListLongMap!1203)

(assert (=> b!43016 (= lt!18396 (map!834 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1201 0))(
  ( (Nil!1198) (Cons!1197 (h!1774 (_ BitVec 64)) (t!4202 List!1201)) )
))
(declare-fun arrayNoDuplicates!0 (array!2937 (_ BitVec 32) List!1201) Bool)

(assert (=> b!43016 (arrayNoDuplicates!0 lt!18397 #b00000000000000000000000000000000 Nil!1198)))

(declare-datatypes ((Unit!1201 0))(
  ( (Unit!1202) )
))
(declare-fun lt!18398 () Unit!1201)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2937 (_ BitVec 32) (_ BitVec 32) List!1201) Unit!1201)

(assert (=> b!43016 (= lt!18398 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2937 (_ BitVec 32)) Bool)

(assert (=> b!43016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18397 mask!853)))

(declare-fun lt!18395 () Unit!1201)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2937 (_ BitVec 32) (_ BitVec 32)) Unit!1201)

(assert (=> b!43016 (= lt!18395 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18397 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2937 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43016 (= (arrayCountValidKeys!0 lt!18397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18400 () Unit!1201)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2937 (_ BitVec 32) (_ BitVec 32)) Unit!1201)

(assert (=> b!43016 (= lt!18400 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43016 (= lt!18401 (array!2936 ((as const (Array (_ BitVec 32) ValueCell!700)) EmptyCell!700) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43016 (= lt!18397 (array!2938 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!261 (Int (_ BitVec 64)) V!2313)

(assert (=> b!43016 (= lt!18399 (dynLambda!261 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!25568 () Bool)

(assert (=> start!6470 (=> (not res!25568) (not e!27258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6470 (= res!25568 (validMask!0 mask!853))))

(assert (=> start!6470 e!27258))

(assert (=> start!6470 true))

(assert (=> start!6470 tp!5945))

(declare-fun b!43019 () Bool)

(declare-fun contains!564 (ListLongMap!1203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!351 (array!2937 array!2935 (_ BitVec 32) (_ BitVec 32) V!2313 V!2313 (_ BitVec 32) Int) ListLongMap!1203)

(declare-fun head!889 (List!1200) tuple2!1626)

(assert (=> b!43019 (= e!27259 (contains!564 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470) (_1!824 (head!889 (toList!617 lt!18396)))))))

(declare-fun b!43018 () Bool)

(declare-fun res!25566 () Bool)

(assert (=> b!43018 (=> res!25566 e!27259)))

(assert (=> b!43018 (= res!25566 (bvslt mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!6470 res!25568) b!43016))

(assert (= (and b!43016 (not res!25569)) b!43017))

(assert (= (and b!43017 (not res!25567)) b!43018))

(assert (= (and b!43018 (not res!25566)) b!43019))

(declare-fun b_lambda!2247 () Bool)

(assert (=> (not b_lambda!2247) (not b!43016)))

(declare-fun t!4200 () Bool)

(declare-fun tb!987 () Bool)

(assert (=> (and start!6470 (= defaultEntry!470 defaultEntry!470) t!4200) tb!987))

(declare-fun result!1725 () Bool)

(declare-fun tp_is_empty!1895 () Bool)

(assert (=> tb!987 (= result!1725 tp_is_empty!1895)))

(assert (=> b!43016 t!4200))

(declare-fun b_and!2661 () Bool)

(assert (= b_and!2659 (and (=> t!4200 result!1725) b_and!2661)))

(declare-fun m!36939 () Bool)

(assert (=> b!43017 m!36939))

(declare-fun m!36941 () Bool)

(assert (=> b!43016 m!36941))

(declare-fun m!36943 () Bool)

(assert (=> b!43016 m!36943))

(declare-fun m!36945 () Bool)

(assert (=> b!43016 m!36945))

(declare-fun m!36947 () Bool)

(assert (=> b!43016 m!36947))

(declare-fun m!36949 () Bool)

(assert (=> b!43016 m!36949))

(declare-fun m!36951 () Bool)

(assert (=> b!43016 m!36951))

(declare-fun m!36953 () Bool)

(assert (=> b!43016 m!36953))

(declare-fun m!36955 () Bool)

(assert (=> b!43016 m!36955))

(declare-fun m!36957 () Bool)

(assert (=> start!6470 m!36957))

(declare-fun m!36959 () Bool)

(assert (=> b!43019 m!36959))

(declare-fun m!36961 () Bool)

(assert (=> b!43019 m!36961))

(assert (=> b!43019 m!36959))

(declare-fun m!36963 () Bool)

(assert (=> b!43019 m!36963))

(push 1)

(assert (not b!43016))

(assert tp_is_empty!1895)

(assert (not b!43019))

(assert b_and!2661)

(assert (not start!6470))

(assert (not b_next!1505))

(assert (not b_lambda!2247))

(assert (not b!43017))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2661)

(assert (not b_next!1505))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2253 () Bool)

(assert (= b_lambda!2247 (or (and start!6470 b_free!1505) b_lambda!2253)))

(push 1)

(assert (not b!43016))

(assert tp_is_empty!1895)

(assert (not b!43019))

(assert b_and!2661)

(assert (not start!6470))

(assert (not b_next!1505))

(assert (not b!43017))

(assert (not b_lambda!2253))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2661)

(assert (not b_next!1505))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7877 () Bool)

(declare-fun e!27264 () Bool)

(assert (=> d!7877 e!27264))

(declare-fun res!25572 () Bool)

(assert (=> d!7877 (=> res!25572 e!27264)))

(declare-fun lt!18417 () Bool)

(assert (=> d!7877 (= res!25572 (not lt!18417))))

(declare-fun lt!18418 () Bool)

(assert (=> d!7877 (= lt!18417 lt!18418)))

(declare-fun lt!18419 () Unit!1201)

(declare-fun e!27265 () Unit!1201)

(assert (=> d!7877 (= lt!18419 e!27265)))

(declare-fun c!5450 () Bool)

(assert (=> d!7877 (= c!5450 lt!18418)))

(declare-fun containsKey!72 (List!1200 (_ BitVec 64)) Bool)

(assert (=> d!7877 (= lt!18418 (containsKey!72 (toList!617 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!889 (toList!617 lt!18396)))))))

(assert (=> d!7877 (= (contains!564 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470) (_1!824 (head!889 (toList!617 lt!18396)))) lt!18417)))

(declare-fun b!43028 () Bool)

(declare-fun lt!18416 () Unit!1201)

(assert (=> b!43028 (= e!27265 lt!18416)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!61 (List!1200 (_ BitVec 64)) Unit!1201)

(assert (=> b!43028 (= lt!18416 (lemmaContainsKeyImpliesGetValueByKeyDefined!61 (toList!617 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!889 (toList!617 lt!18396)))))))

(declare-datatypes ((Option!111 0))(
  ( (Some!110 (v!2078 V!2313)) (None!109) )
))
(declare-fun isDefined!62 (Option!111) Bool)

(declare-fun getValueByKey!105 (List!1200 (_ BitVec 64)) Option!111)

(assert (=> b!43028 (isDefined!62 (getValueByKey!105 (toList!617 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!889 (toList!617 lt!18396)))))))

(declare-fun b!43029 () Bool)

(declare-fun Unit!1204 () Unit!1201)

(assert (=> b!43029 (= e!27265 Unit!1204)))

(declare-fun b!43030 () Bool)

(assert (=> b!43030 (= e!27264 (isDefined!62 (getValueByKey!105 (toList!617 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!889 (toList!617 lt!18396))))))))

(assert (= (and d!7877 c!5450) b!43028))

(assert (= (and d!7877 (not c!5450)) b!43029))

(assert (= (and d!7877 (not res!25572)) b!43030))

(declare-fun m!36969 () Bool)

(assert (=> d!7877 m!36969))

(declare-fun m!36971 () Bool)

(assert (=> b!43028 m!36971))

(declare-fun m!36973 () Bool)

(assert (=> b!43028 m!36973))

(assert (=> b!43028 m!36973))

(declare-fun m!36975 () Bool)

(assert (=> b!43028 m!36975))

(assert (=> b!43030 m!36973))

(assert (=> b!43030 m!36973))

(assert (=> b!43030 m!36975))

(assert (=> b!43019 d!7877))

(declare-fun b!43172 () Bool)

(declare-fun e!27368 () Bool)

(declare-fun call!3438 () Bool)

(assert (=> b!43172 (= e!27368 (not call!3438))))

(declare-fun b!43173 () Bool)

(declare-fun e!27364 () ListLongMap!1203)

(declare-fun call!3439 () ListLongMap!1203)

(assert (=> b!43173 (= e!27364 call!3439)))

(declare-fun bm!3430 () Bool)

(declare-fun call!3433 () Bool)

(declare-fun lt!18550 () ListLongMap!1203)

(assert (=> bm!3430 (= call!3433 (contains!564 lt!18550 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!3431 () Bool)

(declare-fun call!3435 () ListLongMap!1203)

(declare-fun call!3437 () ListLongMap!1203)

(assert (=> bm!3431 (= call!3435 call!3437)))

(declare-fun b!43174 () Bool)

(declare-fun e!27365 () Bool)

(declare-fun apply!58 (ListLongMap!1203 (_ BitVec 64)) V!2313)

(declare-fun get!785 (ValueCell!700 V!2313) V!2313)

(assert (=> b!43174 (= e!27365 (= (apply!58 lt!18550 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)) (get!785 (select (arr!1411 lt!18401) #b00000000000000000000000000000000) (dynLambda!261 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43174 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1596 lt!18401)))))

(assert (=> b!43174 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1597 lt!18397)))))

(declare-fun b!43175 () Bool)

(declare-fun e!27363 () Bool)

(declare-fun e!27366 () Bool)

(assert (=> b!43175 (= e!27363 e!27366)))

(declare-fun c!5496 () Bool)

(assert (=> b!43175 (= c!5496 (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43176 () Bool)

(declare-fun e!27360 () ListLongMap!1203)

(declare-fun call!3436 () ListLongMap!1203)

(declare-fun +!68 (ListLongMap!1203 tuple2!1626) ListLongMap!1203)

(assert (=> b!43176 (= e!27360 (+!68 call!3436 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18399)))))

(declare-fun bm!3432 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!37 (array!2937 array!2935 (_ BitVec 32) (_ BitVec 32) V!2313 V!2313 (_ BitVec 32) Int) ListLongMap!1203)

(assert (=> bm!3432 (= call!3437 (getCurrentListMapNoExtraKeys!37 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun b!43177 () Bool)

(declare-fun e!27367 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!43177 (= e!27367 (validKeyInArray!0 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(declare-fun d!7887 () Bool)

(assert (=> d!7887 e!27363))

(declare-fun res!25635 () Bool)

(assert (=> d!7887 (=> (not res!25635) (not e!27363))))

(assert (=> d!7887 (= res!25635 (or (bvsge #b00000000000000000000000000000000 (size!1597 lt!18397)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1597 lt!18397)))))))

(declare-fun lt!18549 () ListLongMap!1203)

(assert (=> d!7887 (= lt!18550 lt!18549)))

(declare-fun lt!18548 () Unit!1201)

(declare-fun e!27362 () Unit!1201)

(assert (=> d!7887 (= lt!18548 e!27362)))

(declare-fun c!5498 () Bool)

(declare-fun e!27357 () Bool)

(assert (=> d!7887 (= c!5498 e!27357)))

(declare-fun res!25636 () Bool)

(assert (=> d!7887 (=> (not res!25636) (not e!27357))))

(assert (=> d!7887 (= res!25636 (bvslt #b00000000000000000000000000000000 (size!1597 lt!18397)))))

(assert (=> d!7887 (= lt!18549 e!27360)))

(declare-fun c!5497 () Bool)

(assert (=> d!7887 (= c!5497 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!7887 (validMask!0 mask!853)))

(assert (=> d!7887 (= (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470) lt!18550)))

(declare-fun b!43178 () Bool)

(declare-fun c!5495 () Bool)

(assert (=> b!43178 (= c!5495 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!27361 () ListLongMap!1203)

(assert (=> b!43178 (= e!27364 e!27361)))

(declare-fun bm!3433 () Bool)

(assert (=> bm!3433 (= call!3438 (contains!564 lt!18550 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!3434 () Bool)

(assert (=> bm!3434 (= call!3439 call!3436)))

(declare-fun b!43179 () Bool)

(assert (=> b!43179 (= e!27357 (validKeyInArray!0 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(declare-fun b!43180 () Bool)

(declare-fun lt!18555 () Unit!1201)

(assert (=> b!43180 (= e!27362 lt!18555)))

(declare-fun lt!18562 () ListLongMap!1203)

(assert (=> b!43180 (= lt!18562 (getCurrentListMapNoExtraKeys!37 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18565 () (_ BitVec 64))

(assert (=> b!43180 (= lt!18565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18547 () (_ BitVec 64))

(assert (=> b!43180 (= lt!18547 (select (arr!1412 lt!18397) #b00000000000000000000000000000000))))

(declare-fun lt!18556 () Unit!1201)

(declare-fun addStillContains!35 (ListLongMap!1203 (_ BitVec 64) V!2313 (_ BitVec 64)) Unit!1201)

(assert (=> b!43180 (= lt!18556 (addStillContains!35 lt!18562 lt!18565 lt!18399 lt!18547))))

(assert (=> b!43180 (contains!564 (+!68 lt!18562 (tuple2!1627 lt!18565 lt!18399)) lt!18547)))

(declare-fun lt!18560 () Unit!1201)

(assert (=> b!43180 (= lt!18560 lt!18556)))

(declare-fun lt!18558 () ListLongMap!1203)

(assert (=> b!43180 (= lt!18558 (getCurrentListMapNoExtraKeys!37 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18551 () (_ BitVec 64))

(assert (=> b!43180 (= lt!18551 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18553 () (_ BitVec 64))

(assert (=> b!43180 (= lt!18553 (select (arr!1412 lt!18397) #b00000000000000000000000000000000))))

(declare-fun lt!18563 () Unit!1201)

(declare-fun addApplyDifferent!35 (ListLongMap!1203 (_ BitVec 64) V!2313 (_ BitVec 64)) Unit!1201)

(assert (=> b!43180 (= lt!18563 (addApplyDifferent!35 lt!18558 lt!18551 lt!18399 lt!18553))))

(assert (=> b!43180 (= (apply!58 (+!68 lt!18558 (tuple2!1627 lt!18551 lt!18399)) lt!18553) (apply!58 lt!18558 lt!18553))))

(declare-fun lt!18554 () Unit!1201)

(assert (=> b!43180 (= lt!18554 lt!18563)))

(declare-fun lt!18567 () ListLongMap!1203)

(assert (=> b!43180 (= lt!18567 (getCurrentListMapNoExtraKeys!37 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18568 () (_ BitVec 64))

(assert (=> b!43180 (= lt!18568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18559 () (_ BitVec 64))

(assert (=> b!43180 (= lt!18559 (select (arr!1412 lt!18397) #b00000000000000000000000000000000))))

(declare-fun lt!18566 () Unit!1201)

(assert (=> b!43180 (= lt!18566 (addApplyDifferent!35 lt!18567 lt!18568 lt!18399 lt!18559))))

(assert (=> b!43180 (= (apply!58 (+!68 lt!18567 (tuple2!1627 lt!18568 lt!18399)) lt!18559) (apply!58 lt!18567 lt!18559))))

(declare-fun lt!18564 () Unit!1201)

(assert (=> b!43180 (= lt!18564 lt!18566)))

(declare-fun lt!18561 () ListLongMap!1203)

(assert (=> b!43180 (= lt!18561 (getCurrentListMapNoExtraKeys!37 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18557 () (_ BitVec 64))

(assert (=> b!43180 (= lt!18557 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18552 () (_ BitVec 64))

(assert (=> b!43180 (= lt!18552 (select (arr!1412 lt!18397) #b00000000000000000000000000000000))))

(assert (=> b!43180 (= lt!18555 (addApplyDifferent!35 lt!18561 lt!18557 lt!18399 lt!18552))))

(assert (=> b!43180 (= (apply!58 (+!68 lt!18561 (tuple2!1627 lt!18557 lt!18399)) lt!18552) (apply!58 lt!18561 lt!18552))))

(declare-fun b!43181 () Bool)

(declare-fun e!27359 () Bool)

(assert (=> b!43181 (= e!27359 e!27365)))

(declare-fun res!25632 () Bool)

(assert (=> b!43181 (=> (not res!25632) (not e!27365))))

(assert (=> b!43181 (= res!25632 (contains!564 lt!18550 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(assert (=> b!43181 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1597 lt!18397)))))

(declare-fun b!43182 () Bool)

(declare-fun e!27358 () Bool)

(assert (=> b!43182 (= e!27366 e!27358)))

(declare-fun res!25630 () Bool)

(assert (=> b!43182 (= res!25630 call!3433)))

(assert (=> b!43182 (=> (not res!25630) (not e!27358))))

(declare-fun b!43183 () Bool)

(declare-fun e!27369 () Bool)

(assert (=> b!43183 (= e!27369 (= (apply!58 lt!18550 #b0000000000000000000000000000000000000000000000000000000000000000) lt!18399))))

(declare-fun b!43184 () Bool)

(declare-fun res!25634 () Bool)

(assert (=> b!43184 (=> (not res!25634) (not e!27363))))

(assert (=> b!43184 (= res!25634 e!27368)))

(declare-fun c!5494 () Bool)

(assert (=> b!43184 (= c!5494 (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!43185 () Bool)

(declare-fun res!25631 () Bool)

(assert (=> b!43185 (=> (not res!25631) (not e!27363))))

(assert (=> b!43185 (= res!25631 e!27359)))

(declare-fun res!25633 () Bool)

(assert (=> b!43185 (=> res!25633 e!27359)))

(assert (=> b!43185 (= res!25633 (not e!27367))))

(declare-fun res!25638 () Bool)

(assert (=> b!43185 (=> (not res!25638) (not e!27367))))

(assert (=> b!43185 (= res!25638 (bvslt #b00000000000000000000000000000000 (size!1597 lt!18397)))))

(declare-fun b!43186 () Bool)

(assert (=> b!43186 (= e!27366 (not call!3433))))

(declare-fun b!43187 () Bool)

(declare-fun Unit!1207 () Unit!1201)

(assert (=> b!43187 (= e!27362 Unit!1207)))

(declare-fun b!43188 () Bool)

(assert (=> b!43188 (= e!27368 e!27369)))

(declare-fun res!25637 () Bool)

(assert (=> b!43188 (= res!25637 call!3438)))

(assert (=> b!43188 (=> (not res!25637) (not e!27369))))

(declare-fun b!43189 () Bool)

(declare-fun call!3434 () ListLongMap!1203)

(assert (=> b!43189 (= e!27361 call!3434)))

(declare-fun b!43190 () Bool)

(assert (=> b!43190 (= e!27361 call!3439)))

(declare-fun bm!3435 () Bool)

(assert (=> bm!3435 (= call!3434 call!3435)))

(declare-fun bm!3436 () Bool)

(declare-fun c!5493 () Bool)

(assert (=> bm!3436 (= call!3436 (+!68 (ite c!5497 call!3437 (ite c!5493 call!3435 call!3434)) (ite (or c!5497 c!5493) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18399) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18399))))))

(declare-fun b!43191 () Bool)

(assert (=> b!43191 (= e!27360 e!27364)))

(assert (=> b!43191 (= c!5493 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43192 () Bool)

(assert (=> b!43192 (= e!27358 (= (apply!58 lt!18550 #b1000000000000000000000000000000000000000000000000000000000000000) lt!18399))))

(assert (= (and d!7887 c!5497) b!43176))

(assert (= (and d!7887 (not c!5497)) b!43191))

(assert (= (and b!43191 c!5493) b!43173))

(assert (= (and b!43191 (not c!5493)) b!43178))

(assert (= (and b!43178 c!5495) b!43190))

(assert (= (and b!43178 (not c!5495)) b!43189))

(assert (= (or b!43190 b!43189) bm!3435))

(assert (= (or b!43173 bm!3435) bm!3431))

(assert (= (or b!43173 b!43190) bm!3434))

(assert (= (or b!43176 bm!3431) bm!3432))

(assert (= (or b!43176 bm!3434) bm!3436))

(assert (= (and d!7887 res!25636) b!43179))

(assert (= (and d!7887 c!5498) b!43180))

(assert (= (and d!7887 (not c!5498)) b!43187))

(assert (= (and d!7887 res!25635) b!43185))

(assert (= (and b!43185 res!25638) b!43177))

(assert (= (and b!43185 (not res!25633)) b!43181))

(assert (= (and b!43181 res!25632) b!43174))

(assert (= (and b!43185 res!25631) b!43184))

(assert (= (and b!43184 c!5494) b!43188))

(assert (= (and b!43184 (not c!5494)) b!43172))

(assert (= (and b!43188 res!25637) b!43183))

(assert (= (or b!43188 b!43172) bm!3433))

(assert (= (and b!43184 res!25634) b!43175))

(assert (= (and b!43175 c!5496) b!43182))

(assert (= (and b!43175 (not c!5496)) b!43186))

(assert (= (and b!43182 res!25630) b!43192))

(assert (= (or b!43182 b!43186) bm!3430))

(declare-fun b_lambda!2255 () Bool)

(assert (=> (not b_lambda!2255) (not b!43174)))

(assert (=> b!43174 t!4200))

(declare-fun b_and!2663 () Bool)

(assert (= b_and!2661 (and (=> t!4200 result!1725) b_and!2663)))

(declare-fun m!37015 () Bool)

(assert (=> b!43192 m!37015))

(declare-fun m!37017 () Bool)

(assert (=> b!43179 m!37017))

(assert (=> b!43179 m!37017))

(declare-fun m!37019 () Bool)

(assert (=> b!43179 m!37019))

(assert (=> d!7887 m!36957))

(declare-fun m!37021 () Bool)

(assert (=> bm!3432 m!37021))

(assert (=> b!43177 m!37017))

(assert (=> b!43177 m!37017))

(assert (=> b!43177 m!37019))

(declare-fun m!37023 () Bool)

(assert (=> b!43180 m!37023))

(declare-fun m!37025 () Bool)

(assert (=> b!43180 m!37025))

(declare-fun m!37027 () Bool)

(assert (=> b!43180 m!37027))

(assert (=> b!43180 m!37021))

(assert (=> b!43180 m!37025))

(assert (=> b!43180 m!37017))

(declare-fun m!37029 () Bool)

(assert (=> b!43180 m!37029))

(declare-fun m!37031 () Bool)

(assert (=> b!43180 m!37031))

(assert (=> b!43180 m!37029))

(declare-fun m!37033 () Bool)

(assert (=> b!43180 m!37033))

(declare-fun m!37035 () Bool)

(assert (=> b!43180 m!37035))

(assert (=> b!43180 m!37035))

(declare-fun m!37037 () Bool)

(assert (=> b!43180 m!37037))

(declare-fun m!37039 () Bool)

(assert (=> b!43180 m!37039))

(declare-fun m!37041 () Bool)

(assert (=> b!43180 m!37041))

(declare-fun m!37043 () Bool)

(assert (=> b!43180 m!37043))

(declare-fun m!37045 () Bool)

(assert (=> b!43180 m!37045))

(declare-fun m!37047 () Bool)

(assert (=> b!43180 m!37047))

(assert (=> b!43180 m!37043))

(declare-fun m!37049 () Bool)

(assert (=> b!43180 m!37049))

(declare-fun m!37051 () Bool)

(assert (=> b!43180 m!37051))

(declare-fun m!37053 () Bool)

(assert (=> bm!3436 m!37053))

(declare-fun m!37055 () Bool)

(assert (=> b!43176 m!37055))

(declare-fun m!37057 () Bool)

(assert (=> b!43183 m!37057))

(declare-fun m!37059 () Bool)

(assert (=> bm!3433 m!37059))

(assert (=> b!43181 m!37017))

(assert (=> b!43181 m!37017))

(declare-fun m!37061 () Bool)

(assert (=> b!43181 m!37061))

(declare-fun m!37063 () Bool)

(assert (=> bm!3430 m!37063))

(assert (=> b!43174 m!37017))

(declare-fun m!37065 () Bool)

(assert (=> b!43174 m!37065))

(assert (=> b!43174 m!37017))

(declare-fun m!37067 () Bool)

(assert (=> b!43174 m!37067))

(assert (=> b!43174 m!36943))

(declare-fun m!37069 () Bool)

(assert (=> b!43174 m!37069))

(assert (=> b!43174 m!36943))

(assert (=> b!43174 m!37067))

(assert (=> b!43019 d!7887))

(declare-fun d!7909 () Bool)

(assert (=> d!7909 (= (head!889 (toList!617 lt!18396)) (h!1773 (toList!617 lt!18396)))))

(assert (=> b!43019 d!7909))

(declare-fun b!43222 () Bool)

(declare-fun e!27389 () Bool)

(declare-fun call!3449 () Bool)

(assert (=> b!43222 (= e!27389 call!3449)))

(declare-fun d!7911 () Bool)

(declare-fun res!25652 () Bool)

(declare-fun e!27390 () Bool)

(assert (=> d!7911 (=> res!25652 e!27390)))

(assert (=> d!7911 (= res!25652 (bvsge #b00000000000000000000000000000000 (size!1597 lt!18397)))))

(assert (=> d!7911 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18397 mask!853) e!27390)))

(declare-fun bm!3446 () Bool)

(assert (=> bm!3446 (= call!3449 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18397 mask!853))))

(declare-fun b!43223 () Bool)

(declare-fun e!27391 () Bool)

(assert (=> b!43223 (= e!27391 call!3449)))

(declare-fun b!43224 () Bool)

(assert (=> b!43224 (= e!27390 e!27389)))

(declare-fun c!5507 () Bool)

(assert (=> b!43224 (= c!5507 (validKeyInArray!0 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(declare-fun b!43225 () Bool)

(assert (=> b!43225 (= e!27389 e!27391)))

(declare-fun lt!18597 () (_ BitVec 64))

(assert (=> b!43225 (= lt!18597 (select (arr!1412 lt!18397) #b00000000000000000000000000000000))))

(declare-fun lt!18598 () Unit!1201)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2937 (_ BitVec 64) (_ BitVec 32)) Unit!1201)

(assert (=> b!43225 (= lt!18598 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18397 lt!18597 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!43225 (arrayContainsKey!0 lt!18397 lt!18597 #b00000000000000000000000000000000)))

(declare-fun lt!18599 () Unit!1201)

(assert (=> b!43225 (= lt!18599 lt!18598)))

(declare-fun res!25653 () Bool)

(declare-datatypes ((SeekEntryResult!198 0))(
  ( (MissingZero!198 (index!2914 (_ BitVec 32))) (Found!198 (index!2915 (_ BitVec 32))) (Intermediate!198 (undefined!1010 Bool) (index!2916 (_ BitVec 32)) (x!8287 (_ BitVec 32))) (Undefined!198) (MissingVacant!198 (index!2917 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2937 (_ BitVec 32)) SeekEntryResult!198)

(assert (=> b!43225 (= res!25653 (= (seekEntryOrOpen!0 (select (arr!1412 lt!18397) #b00000000000000000000000000000000) lt!18397 mask!853) (Found!198 #b00000000000000000000000000000000)))))

(assert (=> b!43225 (=> (not res!25653) (not e!27391))))

(assert (= (and d!7911 (not res!25652)) b!43224))

(assert (= (and b!43224 c!5507) b!43225))

(assert (= (and b!43224 (not c!5507)) b!43222))

(assert (= (and b!43225 res!25653) b!43223))

(assert (= (or b!43223 b!43222) bm!3446))

(declare-fun m!37127 () Bool)

(assert (=> bm!3446 m!37127))

(assert (=> b!43224 m!37017))

(assert (=> b!43224 m!37017))

(assert (=> b!43224 m!37019))

(assert (=> b!43225 m!37017))

(declare-fun m!37129 () Bool)

(assert (=> b!43225 m!37129))

(declare-fun m!37131 () Bool)

(assert (=> b!43225 m!37131))

(assert (=> b!43225 m!37017))

(declare-fun m!37133 () Bool)

(assert (=> b!43225 m!37133))

(assert (=> b!43016 d!7911))

(declare-fun d!7917 () Bool)

(assert (=> d!7917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18397 mask!853)))

(declare-fun lt!18602 () Unit!1201)

(declare-fun choose!34 (array!2937 (_ BitVec 32) (_ BitVec 32)) Unit!1201)

(assert (=> d!7917 (= lt!18602 (choose!34 lt!18397 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7917 (validMask!0 mask!853)))

(assert (=> d!7917 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18397 mask!853 #b00000000000000000000000000000000) lt!18602)))

(declare-fun bs!1933 () Bool)

(assert (= bs!1933 d!7917))

(assert (=> bs!1933 m!36947))

(declare-fun m!37135 () Bool)

(assert (=> bs!1933 m!37135))

(assert (=> bs!1933 m!36957))

(assert (=> b!43016 d!7917))

(declare-fun d!7919 () Bool)

(assert (=> d!7919 (= (map!834 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (getCurrentListMap!351 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (_values!1866 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (mask!5432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1883 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))))))

(declare-fun bs!1934 () Bool)

(assert (= bs!1934 d!7919))

(declare-fun m!37141 () Bool)

(assert (=> bs!1934 m!37141))

(assert (=> b!43016 d!7919))

(declare-fun d!7923 () Bool)

(assert (=> d!7923 (arrayNoDuplicates!0 lt!18397 #b00000000000000000000000000000000 Nil!1198)))

(declare-fun lt!18610 () Unit!1201)

(declare-fun choose!111 (array!2937 (_ BitVec 32) (_ BitVec 32) List!1201) Unit!1201)

(assert (=> d!7923 (= lt!18610 (choose!111 lt!18397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1198))))

(assert (=> d!7923 (= (size!1597 lt!18397) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7923 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!18397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1198) lt!18610)))

(declare-fun bs!1935 () Bool)

(assert (= bs!1935 d!7923))

(assert (=> bs!1935 m!36953))

(declare-fun m!37145 () Bool)

(assert (=> bs!1935 m!37145))

(assert (=> b!43016 d!7923))

(declare-fun d!7927 () Bool)

(assert (=> d!7927 (= (arrayCountValidKeys!0 lt!18397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18618 () Unit!1201)

(declare-fun choose!59 (array!2937 (_ BitVec 32) (_ BitVec 32)) Unit!1201)

(assert (=> d!7927 (= lt!18618 (choose!59 lt!18397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7927 (bvslt (size!1597 lt!18397) #b01111111111111111111111111111111)))

(assert (=> d!7927 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18618)))

(declare-fun bs!1937 () Bool)

(assert (= bs!1937 d!7927))

(assert (=> bs!1937 m!36955))

(declare-fun m!37149 () Bool)

(assert (=> bs!1937 m!37149))

(assert (=> b!43016 d!7927))

(declare-fun b!43287 () Bool)

(declare-fun e!27433 () (_ BitVec 32))

(assert (=> b!43287 (= e!27433 #b00000000000000000000000000000000)))

(declare-fun b!43288 () Bool)

(declare-fun e!27432 () (_ BitVec 32))

(declare-fun call!3468 () (_ BitVec 32))

(assert (=> b!43288 (= e!27432 call!3468)))

(declare-fun b!43289 () Bool)

(assert (=> b!43289 (= e!27433 e!27432)))

(declare-fun c!5530 () Bool)

(assert (=> b!43289 (= c!5530 (validKeyInArray!0 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(declare-fun bm!3465 () Bool)

(assert (=> bm!3465 (= call!3468 (arrayCountValidKeys!0 lt!18397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!7931 () Bool)

(declare-fun lt!18661 () (_ BitVec 32))

(assert (=> d!7931 (and (bvsge lt!18661 #b00000000000000000000000000000000) (bvsle lt!18661 (bvsub (size!1597 lt!18397) #b00000000000000000000000000000000)))))

(assert (=> d!7931 (= lt!18661 e!27433)))

(declare-fun c!5529 () Bool)

(assert (=> d!7931 (= c!5529 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7931 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1597 lt!18397)))))

(assert (=> d!7931 (= (arrayCountValidKeys!0 lt!18397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18661)))

(declare-fun b!43290 () Bool)

(assert (=> b!43290 (= e!27432 (bvadd #b00000000000000000000000000000001 call!3468))))

(assert (= (and d!7931 c!5529) b!43287))

(assert (= (and d!7931 (not c!5529)) b!43289))

(assert (= (and b!43289 c!5530) b!43290))

(assert (= (and b!43289 (not c!5530)) b!43288))

(assert (= (or b!43290 b!43288) bm!3465))

(assert (=> b!43289 m!37017))

(assert (=> b!43289 m!37017))

(assert (=> b!43289 m!37019))

(declare-fun m!37153 () Bool)

(assert (=> bm!3465 m!37153))

(assert (=> b!43016 d!7931))

(declare-fun b!43317 () Bool)

(declare-fun e!27450 () Bool)

(declare-fun call!3475 () Bool)

(assert (=> b!43317 (= e!27450 call!3475)))

(declare-fun b!43318 () Bool)

(declare-fun e!27451 () Bool)

(assert (=> b!43318 (= e!27451 e!27450)))

(declare-fun c!5537 () Bool)

(assert (=> b!43318 (= c!5537 (validKeyInArray!0 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(declare-fun bm!3472 () Bool)

(assert (=> bm!3472 (= call!3475 (arrayNoDuplicates!0 lt!18397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5537 (Cons!1197 (select (arr!1412 lt!18397) #b00000000000000000000000000000000) Nil!1198) Nil!1198)))))

(declare-fun d!7935 () Bool)

(declare-fun res!25689 () Bool)

(declare-fun e!27452 () Bool)

(assert (=> d!7935 (=> res!25689 e!27452)))

(assert (=> d!7935 (= res!25689 (bvsge #b00000000000000000000000000000000 (size!1597 lt!18397)))))

(assert (=> d!7935 (= (arrayNoDuplicates!0 lt!18397 #b00000000000000000000000000000000 Nil!1198) e!27452)))

(declare-fun b!43319 () Bool)

(assert (=> b!43319 (= e!27452 e!27451)))

(declare-fun res!25687 () Bool)

(assert (=> b!43319 (=> (not res!25687) (not e!27451))))

(declare-fun e!27453 () Bool)

(assert (=> b!43319 (= res!25687 (not e!27453))))

(declare-fun res!25688 () Bool)

(assert (=> b!43319 (=> (not res!25688) (not e!27453))))

(assert (=> b!43319 (= res!25688 (validKeyInArray!0 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(declare-fun b!43320 () Bool)

(declare-fun contains!567 (List!1201 (_ BitVec 64)) Bool)

(assert (=> b!43320 (= e!27453 (contains!567 Nil!1198 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(declare-fun b!43321 () Bool)

(assert (=> b!43321 (= e!27450 call!3475)))

(assert (= (and d!7935 (not res!25689)) b!43319))

(assert (= (and b!43319 res!25688) b!43320))

(assert (= (and b!43319 res!25687) b!43318))

(assert (= (and b!43318 c!5537) b!43317))

(assert (= (and b!43318 (not c!5537)) b!43321))

(assert (= (or b!43317 b!43321) bm!3472))

(assert (=> b!43318 m!37017))

(assert (=> b!43318 m!37017))

(assert (=> b!43318 m!37019))

(assert (=> bm!3472 m!37017))

(declare-fun m!37157 () Bool)

(assert (=> bm!3472 m!37157))

(assert (=> b!43319 m!37017))

(assert (=> b!43319 m!37017))

(assert (=> b!43319 m!37019))

(assert (=> b!43320 m!37017))

(assert (=> b!43320 m!37017))

(declare-fun m!37159 () Bool)

(assert (=> b!43320 m!37159))

(assert (=> b!43016 d!7935))

(declare-fun d!7939 () Bool)

(assert (=> d!7939 (= (isEmpty!279 (toList!617 lt!18396)) (is-Nil!1197 (toList!617 lt!18396)))))

(assert (=> b!43017 d!7939))

(declare-fun d!7941 () Bool)

(assert (=> d!7941 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6470 d!7941))

(declare-fun b_lambda!2263 () Bool)

(assert (= b_lambda!2255 (or (and start!6470 b_free!1505) b_lambda!2263)))

(push 1)

(assert (not bm!3465))

(assert (not b!43177))

(assert (not b_next!1505))

(assert (not b_lambda!2263))

(assert (not b!43179))

(assert (not bm!3436))

(assert (not b!43183))

(assert (not b_lambda!2253))

(assert (not d!7923))

(assert (not d!7877))

(assert (not b!43030))

(assert tp_is_empty!1895)

(assert (not b!43224))

(assert (not b!43319))

(assert b_and!2663)

(assert (not b!43181))

(assert (not b!43320))

(assert (not b!43289))

(assert (not b!43174))

(assert (not b!43176))

(assert (not d!7887))

(assert (not bm!3472))

(assert (not d!7927))

(assert (not bm!3432))

(assert (not d!7919))

(assert (not bm!3433))

(assert (not bm!3446))

(assert (not b!43225))

(assert (not b!43180))

(assert (not b!43028))

(assert (not d!7917))

(assert (not b!43192))

(assert (not b!43318))

(assert (not bm!3430))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2663)

(assert (not b_next!1505))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7971 () Bool)

(declare-fun e!27490 () Bool)

(assert (=> d!7971 e!27490))

(declare-fun res!25721 () Bool)

(assert (=> d!7971 (=> res!25721 e!27490)))

(declare-fun lt!18726 () Bool)

(assert (=> d!7971 (= res!25721 (not lt!18726))))

(declare-fun lt!18727 () Bool)

(assert (=> d!7971 (= lt!18726 lt!18727)))

(declare-fun lt!18728 () Unit!1201)

(declare-fun e!27491 () Unit!1201)

(assert (=> d!7971 (= lt!18728 e!27491)))

(declare-fun c!5548 () Bool)

(assert (=> d!7971 (= c!5548 lt!18727)))

(assert (=> d!7971 (= lt!18727 (containsKey!72 (toList!617 lt!18550) (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(assert (=> d!7971 (= (contains!564 lt!18550 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)) lt!18726)))

(declare-fun b!43375 () Bool)

(declare-fun lt!18725 () Unit!1201)

(assert (=> b!43375 (= e!27491 lt!18725)))

(assert (=> b!43375 (= lt!18725 (lemmaContainsKeyImpliesGetValueByKeyDefined!61 (toList!617 lt!18550) (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(assert (=> b!43375 (isDefined!62 (getValueByKey!105 (toList!617 lt!18550) (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(declare-fun b!43376 () Bool)

(declare-fun Unit!1210 () Unit!1201)

(assert (=> b!43376 (= e!27491 Unit!1210)))

(declare-fun b!43377 () Bool)

(assert (=> b!43377 (= e!27490 (isDefined!62 (getValueByKey!105 (toList!617 lt!18550) (select (arr!1412 lt!18397) #b00000000000000000000000000000000))))))

(assert (= (and d!7971 c!5548) b!43375))

(assert (= (and d!7971 (not c!5548)) b!43376))

(assert (= (and d!7971 (not res!25721)) b!43377))

(assert (=> d!7971 m!37017))

(declare-fun m!37261 () Bool)

(assert (=> d!7971 m!37261))

(assert (=> b!43375 m!37017))

(declare-fun m!37263 () Bool)

(assert (=> b!43375 m!37263))

(assert (=> b!43375 m!37017))

(declare-fun m!37265 () Bool)

(assert (=> b!43375 m!37265))

(assert (=> b!43375 m!37265))

(declare-fun m!37267 () Bool)

(assert (=> b!43375 m!37267))

(assert (=> b!43377 m!37017))

(assert (=> b!43377 m!37265))

(assert (=> b!43377 m!37265))

(assert (=> b!43377 m!37267))

(assert (=> b!43181 d!7971))

(declare-fun d!7973 () Bool)

(declare-fun get!790 (Option!111) V!2313)

(assert (=> d!7973 (= (apply!58 (+!68 lt!18558 (tuple2!1627 lt!18551 lt!18399)) lt!18553) (get!790 (getValueByKey!105 (toList!617 (+!68 lt!18558 (tuple2!1627 lt!18551 lt!18399))) lt!18553)))))

(declare-fun bs!1945 () Bool)

(assert (= bs!1945 d!7973))

(declare-fun m!37269 () Bool)

(assert (=> bs!1945 m!37269))

(assert (=> bs!1945 m!37269))

(declare-fun m!37271 () Bool)

(assert (=> bs!1945 m!37271))

(assert (=> b!43180 d!7973))

(declare-fun d!7975 () Bool)

(assert (=> d!7975 (= (apply!58 lt!18567 lt!18559) (get!790 (getValueByKey!105 (toList!617 lt!18567) lt!18559)))))

(declare-fun bs!1946 () Bool)

(assert (= bs!1946 d!7975))

(declare-fun m!37273 () Bool)

(assert (=> bs!1946 m!37273))

(assert (=> bs!1946 m!37273))

(declare-fun m!37275 () Bool)

(assert (=> bs!1946 m!37275))

(assert (=> b!43180 d!7975))

(declare-fun d!7977 () Bool)

(declare-fun e!27514 () Bool)

(assert (=> d!7977 e!27514))

(declare-fun res!25734 () Bool)

(assert (=> d!7977 (=> (not res!25734) (not e!27514))))

(declare-fun lt!18755 () ListLongMap!1203)

(assert (=> d!7977 (= res!25734 (contains!564 lt!18755 (_1!824 (tuple2!1627 lt!18565 lt!18399))))))

(declare-fun lt!18756 () List!1200)

(assert (=> d!7977 (= lt!18755 (ListLongMap!1204 lt!18756))))

(declare-fun lt!18753 () Unit!1201)

(declare-fun lt!18754 () Unit!1201)

(assert (=> d!7977 (= lt!18753 lt!18754)))

(assert (=> d!7977 (= (getValueByKey!105 lt!18756 (_1!824 (tuple2!1627 lt!18565 lt!18399))) (Some!110 (_2!824 (tuple2!1627 lt!18565 lt!18399))))))

(declare-fun lemmaContainsTupThenGetReturnValue!29 (List!1200 (_ BitVec 64) V!2313) Unit!1201)

(assert (=> d!7977 (= lt!18754 (lemmaContainsTupThenGetReturnValue!29 lt!18756 (_1!824 (tuple2!1627 lt!18565 lt!18399)) (_2!824 (tuple2!1627 lt!18565 lt!18399))))))

(declare-fun insertStrictlySorted!26 (List!1200 (_ BitVec 64) V!2313) List!1200)

(assert (=> d!7977 (= lt!18756 (insertStrictlySorted!26 (toList!617 lt!18562) (_1!824 (tuple2!1627 lt!18565 lt!18399)) (_2!824 (tuple2!1627 lt!18565 lt!18399))))))

(assert (=> d!7977 (= (+!68 lt!18562 (tuple2!1627 lt!18565 lt!18399)) lt!18755)))

(declare-fun b!43417 () Bool)

(declare-fun res!25733 () Bool)

(assert (=> b!43417 (=> (not res!25733) (not e!27514))))

(assert (=> b!43417 (= res!25733 (= (getValueByKey!105 (toList!617 lt!18755) (_1!824 (tuple2!1627 lt!18565 lt!18399))) (Some!110 (_2!824 (tuple2!1627 lt!18565 lt!18399)))))))

(declare-fun b!43418 () Bool)

(declare-fun contains!569 (List!1200 tuple2!1626) Bool)

(assert (=> b!43418 (= e!27514 (contains!569 (toList!617 lt!18755) (tuple2!1627 lt!18565 lt!18399)))))

(assert (= (and d!7977 res!25734) b!43417))

(assert (= (and b!43417 res!25733) b!43418))

(declare-fun m!37327 () Bool)

(assert (=> d!7977 m!37327))

(declare-fun m!37329 () Bool)

(assert (=> d!7977 m!37329))

(declare-fun m!37331 () Bool)

(assert (=> d!7977 m!37331))

(declare-fun m!37333 () Bool)

(assert (=> d!7977 m!37333))

(declare-fun m!37335 () Bool)

(assert (=> b!43417 m!37335))

(declare-fun m!37337 () Bool)

(assert (=> b!43418 m!37337))

(assert (=> b!43180 d!7977))

(declare-fun d!7993 () Bool)

(assert (=> d!7993 (= (apply!58 (+!68 lt!18558 (tuple2!1627 lt!18551 lt!18399)) lt!18553) (apply!58 lt!18558 lt!18553))))

(declare-fun lt!18759 () Unit!1201)

(declare-fun choose!254 (ListLongMap!1203 (_ BitVec 64) V!2313 (_ BitVec 64)) Unit!1201)

(assert (=> d!7993 (= lt!18759 (choose!254 lt!18558 lt!18551 lt!18399 lt!18553))))

(declare-fun e!27523 () Bool)

(assert (=> d!7993 e!27523))

(declare-fun res!25737 () Bool)

(assert (=> d!7993 (=> (not res!25737) (not e!27523))))

(assert (=> d!7993 (= res!25737 (contains!564 lt!18558 lt!18553))))

(assert (=> d!7993 (= (addApplyDifferent!35 lt!18558 lt!18551 lt!18399 lt!18553) lt!18759)))

(declare-fun b!43434 () Bool)

(assert (=> b!43434 (= e!27523 (not (= lt!18553 lt!18551)))))

(assert (= (and d!7993 res!25737) b!43434))

(assert (=> d!7993 m!37051))

(assert (=> d!7993 m!37035))

(declare-fun m!37341 () Bool)

(assert (=> d!7993 m!37341))

(assert (=> d!7993 m!37035))

(assert (=> d!7993 m!37037))

(declare-fun m!37343 () Bool)

(assert (=> d!7993 m!37343))

(assert (=> b!43180 d!7993))

(declare-fun d!7997 () Bool)

(assert (=> d!7997 (contains!564 (+!68 lt!18562 (tuple2!1627 lt!18565 lt!18399)) lt!18547)))

(declare-fun lt!18762 () Unit!1201)

(declare-fun choose!255 (ListLongMap!1203 (_ BitVec 64) V!2313 (_ BitVec 64)) Unit!1201)

(assert (=> d!7997 (= lt!18762 (choose!255 lt!18562 lt!18565 lt!18399 lt!18547))))

(assert (=> d!7997 (contains!564 lt!18562 lt!18547)))

(assert (=> d!7997 (= (addStillContains!35 lt!18562 lt!18565 lt!18399 lt!18547) lt!18762)))

(declare-fun bs!1949 () Bool)

(assert (= bs!1949 d!7997))

(assert (=> bs!1949 m!37029))

(assert (=> bs!1949 m!37029))

(assert (=> bs!1949 m!37033))

(declare-fun m!37345 () Bool)

(assert (=> bs!1949 m!37345))

(declare-fun m!37347 () Bool)

(assert (=> bs!1949 m!37347))

(assert (=> b!43180 d!7997))

(declare-fun d!7999 () Bool)

(assert (=> d!7999 (= (apply!58 (+!68 lt!18567 (tuple2!1627 lt!18568 lt!18399)) lt!18559) (apply!58 lt!18567 lt!18559))))

(declare-fun lt!18763 () Unit!1201)

(assert (=> d!7999 (= lt!18763 (choose!254 lt!18567 lt!18568 lt!18399 lt!18559))))

(declare-fun e!27524 () Bool)

(assert (=> d!7999 e!27524))

(declare-fun res!25738 () Bool)

(assert (=> d!7999 (=> (not res!25738) (not e!27524))))

(assert (=> d!7999 (= res!25738 (contains!564 lt!18567 lt!18559))))

(assert (=> d!7999 (= (addApplyDifferent!35 lt!18567 lt!18568 lt!18399 lt!18559) lt!18763)))

(declare-fun b!43436 () Bool)

(assert (=> b!43436 (= e!27524 (not (= lt!18559 lt!18568)))))

(assert (= (and d!7999 res!25738) b!43436))

(assert (=> d!7999 m!37023))

(assert (=> d!7999 m!37025))

(declare-fun m!37349 () Bool)

(assert (=> d!7999 m!37349))

(assert (=> d!7999 m!37025))

(assert (=> d!7999 m!37027))

(declare-fun m!37351 () Bool)

(assert (=> d!7999 m!37351))

(assert (=> b!43180 d!7999))

(declare-fun d!8001 () Bool)

(declare-fun e!27525 () Bool)

(assert (=> d!8001 e!27525))

(declare-fun res!25739 () Bool)

(assert (=> d!8001 (=> res!25739 e!27525)))

(declare-fun lt!18765 () Bool)

(assert (=> d!8001 (= res!25739 (not lt!18765))))

(declare-fun lt!18766 () Bool)

(assert (=> d!8001 (= lt!18765 lt!18766)))

(declare-fun lt!18767 () Unit!1201)

(declare-fun e!27526 () Unit!1201)

(assert (=> d!8001 (= lt!18767 e!27526)))

(declare-fun c!5570 () Bool)

(assert (=> d!8001 (= c!5570 lt!18766)))

(assert (=> d!8001 (= lt!18766 (containsKey!72 (toList!617 (+!68 lt!18562 (tuple2!1627 lt!18565 lt!18399))) lt!18547))))

(assert (=> d!8001 (= (contains!564 (+!68 lt!18562 (tuple2!1627 lt!18565 lt!18399)) lt!18547) lt!18765)))

(declare-fun b!43437 () Bool)

(declare-fun lt!18764 () Unit!1201)

(assert (=> b!43437 (= e!27526 lt!18764)))

(assert (=> b!43437 (= lt!18764 (lemmaContainsKeyImpliesGetValueByKeyDefined!61 (toList!617 (+!68 lt!18562 (tuple2!1627 lt!18565 lt!18399))) lt!18547))))

(assert (=> b!43437 (isDefined!62 (getValueByKey!105 (toList!617 (+!68 lt!18562 (tuple2!1627 lt!18565 lt!18399))) lt!18547))))

(declare-fun b!43438 () Bool)

(declare-fun Unit!1211 () Unit!1201)

(assert (=> b!43438 (= e!27526 Unit!1211)))

(declare-fun b!43439 () Bool)

(assert (=> b!43439 (= e!27525 (isDefined!62 (getValueByKey!105 (toList!617 (+!68 lt!18562 (tuple2!1627 lt!18565 lt!18399))) lt!18547)))))

(assert (= (and d!8001 c!5570) b!43437))

(assert (= (and d!8001 (not c!5570)) b!43438))

(assert (= (and d!8001 (not res!25739)) b!43439))

(declare-fun m!37353 () Bool)

(assert (=> d!8001 m!37353))

(declare-fun m!37355 () Bool)

(assert (=> b!43437 m!37355))

(declare-fun m!37357 () Bool)

(assert (=> b!43437 m!37357))

(assert (=> b!43437 m!37357))

(declare-fun m!37359 () Bool)

(assert (=> b!43437 m!37359))

(assert (=> b!43439 m!37357))

(assert (=> b!43439 m!37357))

(assert (=> b!43439 m!37359))

(assert (=> b!43180 d!8001))

(declare-fun d!8003 () Bool)

(declare-fun e!27527 () Bool)

(assert (=> d!8003 e!27527))

(declare-fun res!25741 () Bool)

(assert (=> d!8003 (=> (not res!25741) (not e!27527))))

(declare-fun lt!18770 () ListLongMap!1203)

(assert (=> d!8003 (= res!25741 (contains!564 lt!18770 (_1!824 (tuple2!1627 lt!18551 lt!18399))))))

(declare-fun lt!18771 () List!1200)

(assert (=> d!8003 (= lt!18770 (ListLongMap!1204 lt!18771))))

(declare-fun lt!18768 () Unit!1201)

(declare-fun lt!18769 () Unit!1201)

(assert (=> d!8003 (= lt!18768 lt!18769)))

(assert (=> d!8003 (= (getValueByKey!105 lt!18771 (_1!824 (tuple2!1627 lt!18551 lt!18399))) (Some!110 (_2!824 (tuple2!1627 lt!18551 lt!18399))))))

(assert (=> d!8003 (= lt!18769 (lemmaContainsTupThenGetReturnValue!29 lt!18771 (_1!824 (tuple2!1627 lt!18551 lt!18399)) (_2!824 (tuple2!1627 lt!18551 lt!18399))))))

(assert (=> d!8003 (= lt!18771 (insertStrictlySorted!26 (toList!617 lt!18558) (_1!824 (tuple2!1627 lt!18551 lt!18399)) (_2!824 (tuple2!1627 lt!18551 lt!18399))))))

(assert (=> d!8003 (= (+!68 lt!18558 (tuple2!1627 lt!18551 lt!18399)) lt!18770)))

(declare-fun b!43440 () Bool)

(declare-fun res!25740 () Bool)

(assert (=> b!43440 (=> (not res!25740) (not e!27527))))

(assert (=> b!43440 (= res!25740 (= (getValueByKey!105 (toList!617 lt!18770) (_1!824 (tuple2!1627 lt!18551 lt!18399))) (Some!110 (_2!824 (tuple2!1627 lt!18551 lt!18399)))))))

(declare-fun b!43441 () Bool)

(assert (=> b!43441 (= e!27527 (contains!569 (toList!617 lt!18770) (tuple2!1627 lt!18551 lt!18399)))))

(assert (= (and d!8003 res!25741) b!43440))

(assert (= (and b!43440 res!25740) b!43441))

(declare-fun m!37361 () Bool)

(assert (=> d!8003 m!37361))

(declare-fun m!37363 () Bool)

(assert (=> d!8003 m!37363))

(declare-fun m!37365 () Bool)

(assert (=> d!8003 m!37365))

(declare-fun m!37367 () Bool)

(assert (=> d!8003 m!37367))

(declare-fun m!37369 () Bool)

(assert (=> b!43440 m!37369))

(declare-fun m!37371 () Bool)

(assert (=> b!43441 m!37371))

(assert (=> b!43180 d!8003))

(declare-fun d!8005 () Bool)

(assert (=> d!8005 (= (apply!58 lt!18561 lt!18552) (get!790 (getValueByKey!105 (toList!617 lt!18561) lt!18552)))))

(declare-fun bs!1950 () Bool)

(assert (= bs!1950 d!8005))

(declare-fun m!37373 () Bool)

(assert (=> bs!1950 m!37373))

(assert (=> bs!1950 m!37373))

(declare-fun m!37375 () Bool)

(assert (=> bs!1950 m!37375))

(assert (=> b!43180 d!8005))

(declare-fun d!8007 () Bool)

(assert (=> d!8007 (= (apply!58 (+!68 lt!18567 (tuple2!1627 lt!18568 lt!18399)) lt!18559) (get!790 (getValueByKey!105 (toList!617 (+!68 lt!18567 (tuple2!1627 lt!18568 lt!18399))) lt!18559)))))

(declare-fun bs!1951 () Bool)

(assert (= bs!1951 d!8007))

(declare-fun m!37377 () Bool)

(assert (=> bs!1951 m!37377))

(assert (=> bs!1951 m!37377))

(declare-fun m!37379 () Bool)

(assert (=> bs!1951 m!37379))

(assert (=> b!43180 d!8007))

(declare-fun d!8009 () Bool)

(declare-fun e!27528 () Bool)

(assert (=> d!8009 e!27528))

(declare-fun res!25743 () Bool)

(assert (=> d!8009 (=> (not res!25743) (not e!27528))))

(declare-fun lt!18774 () ListLongMap!1203)

(assert (=> d!8009 (= res!25743 (contains!564 lt!18774 (_1!824 (tuple2!1627 lt!18568 lt!18399))))))

(declare-fun lt!18775 () List!1200)

(assert (=> d!8009 (= lt!18774 (ListLongMap!1204 lt!18775))))

(declare-fun lt!18772 () Unit!1201)

(declare-fun lt!18773 () Unit!1201)

(assert (=> d!8009 (= lt!18772 lt!18773)))

(assert (=> d!8009 (= (getValueByKey!105 lt!18775 (_1!824 (tuple2!1627 lt!18568 lt!18399))) (Some!110 (_2!824 (tuple2!1627 lt!18568 lt!18399))))))

(assert (=> d!8009 (= lt!18773 (lemmaContainsTupThenGetReturnValue!29 lt!18775 (_1!824 (tuple2!1627 lt!18568 lt!18399)) (_2!824 (tuple2!1627 lt!18568 lt!18399))))))

(assert (=> d!8009 (= lt!18775 (insertStrictlySorted!26 (toList!617 lt!18567) (_1!824 (tuple2!1627 lt!18568 lt!18399)) (_2!824 (tuple2!1627 lt!18568 lt!18399))))))

(assert (=> d!8009 (= (+!68 lt!18567 (tuple2!1627 lt!18568 lt!18399)) lt!18774)))

(declare-fun b!43442 () Bool)

(declare-fun res!25742 () Bool)

(assert (=> b!43442 (=> (not res!25742) (not e!27528))))

(assert (=> b!43442 (= res!25742 (= (getValueByKey!105 (toList!617 lt!18774) (_1!824 (tuple2!1627 lt!18568 lt!18399))) (Some!110 (_2!824 (tuple2!1627 lt!18568 lt!18399)))))))

(declare-fun b!43443 () Bool)

(assert (=> b!43443 (= e!27528 (contains!569 (toList!617 lt!18774) (tuple2!1627 lt!18568 lt!18399)))))

(assert (= (and d!8009 res!25743) b!43442))

(assert (= (and b!43442 res!25742) b!43443))

(declare-fun m!37381 () Bool)

(assert (=> d!8009 m!37381))

(declare-fun m!37383 () Bool)

(assert (=> d!8009 m!37383))

(declare-fun m!37385 () Bool)

(assert (=> d!8009 m!37385))

(declare-fun m!37387 () Bool)

(assert (=> d!8009 m!37387))

(declare-fun m!37389 () Bool)

(assert (=> b!43442 m!37389))

(declare-fun m!37391 () Bool)

(assert (=> b!43443 m!37391))

(assert (=> b!43180 d!8009))

(declare-fun d!8011 () Bool)

(assert (=> d!8011 (= (apply!58 (+!68 lt!18561 (tuple2!1627 lt!18557 lt!18399)) lt!18552) (get!790 (getValueByKey!105 (toList!617 (+!68 lt!18561 (tuple2!1627 lt!18557 lt!18399))) lt!18552)))))

(declare-fun bs!1952 () Bool)

(assert (= bs!1952 d!8011))

(declare-fun m!37393 () Bool)

(assert (=> bs!1952 m!37393))

(assert (=> bs!1952 m!37393))

(declare-fun m!37395 () Bool)

(assert (=> bs!1952 m!37395))

(assert (=> b!43180 d!8011))

(declare-fun call!3495 () ListLongMap!1203)

(declare-fun bm!3492 () Bool)

(assert (=> bm!3492 (= call!3495 (getCurrentListMapNoExtraKeys!37 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!470))))

(declare-fun b!43565 () Bool)

(declare-fun e!27608 () ListLongMap!1203)

(declare-fun e!27607 () ListLongMap!1203)

(assert (=> b!43565 (= e!27608 e!27607)))

(declare-fun c!5608 () Bool)

(assert (=> b!43565 (= c!5608 (validKeyInArray!0 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(declare-fun b!43566 () Bool)

(assert (=> b!43566 (= e!27608 (ListLongMap!1204 Nil!1197))))

(declare-fun b!43567 () Bool)

(declare-fun res!25793 () Bool)

(declare-fun e!27606 () Bool)

(assert (=> b!43567 (=> (not res!25793) (not e!27606))))

(declare-fun lt!18865 () ListLongMap!1203)

(assert (=> b!43567 (= res!25793 (not (contains!564 lt!18865 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!43569 () Bool)

(declare-fun e!27604 () Bool)

(declare-fun e!27603 () Bool)

(assert (=> b!43569 (= e!27604 e!27603)))

(assert (=> b!43569 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1597 lt!18397)))))

(declare-fun res!25795 () Bool)

(assert (=> b!43569 (= res!25795 (contains!564 lt!18865 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(assert (=> b!43569 (=> (not res!25795) (not e!27603))))

(declare-fun b!43570 () Bool)

(assert (=> b!43570 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1597 lt!18397)))))

(assert (=> b!43570 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1596 lt!18401)))))

(assert (=> b!43570 (= e!27603 (= (apply!58 lt!18865 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)) (get!785 (select (arr!1411 lt!18401) #b00000000000000000000000000000000) (dynLambda!261 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!43571 () Bool)

(declare-fun e!27609 () Bool)

(declare-fun isEmpty!284 (ListLongMap!1203) Bool)

(assert (=> b!43571 (= e!27609 (isEmpty!284 lt!18865))))

(declare-fun b!43572 () Bool)

(assert (=> b!43572 (= e!27609 (= lt!18865 (getCurrentListMapNoExtraKeys!37 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!470)))))

(declare-fun b!43573 () Bool)

(declare-fun e!27605 () Bool)

(assert (=> b!43573 (= e!27605 (validKeyInArray!0 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(assert (=> b!43573 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!43574 () Bool)

(assert (=> b!43574 (= e!27606 e!27604)))

(declare-fun c!5606 () Bool)

(assert (=> b!43574 (= c!5606 e!27605)))

(declare-fun res!25796 () Bool)

(assert (=> b!43574 (=> (not res!25796) (not e!27605))))

(assert (=> b!43574 (= res!25796 (bvslt #b00000000000000000000000000000000 (size!1597 lt!18397)))))

(declare-fun b!43568 () Bool)

(assert (=> b!43568 (= e!27604 e!27609)))

(declare-fun c!5607 () Bool)

(assert (=> b!43568 (= c!5607 (bvslt #b00000000000000000000000000000000 (size!1597 lt!18397)))))

(declare-fun d!8013 () Bool)

(assert (=> d!8013 e!27606))

(declare-fun res!25794 () Bool)

(assert (=> d!8013 (=> (not res!25794) (not e!27606))))

(assert (=> d!8013 (= res!25794 (not (contains!564 lt!18865 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8013 (= lt!18865 e!27608)))

(declare-fun c!5609 () Bool)

(assert (=> d!8013 (= c!5609 (bvsge #b00000000000000000000000000000000 (size!1597 lt!18397)))))

(assert (=> d!8013 (validMask!0 mask!853)))

(assert (=> d!8013 (= (getCurrentListMapNoExtraKeys!37 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470) lt!18865)))

(declare-fun b!43575 () Bool)

(declare-fun lt!18866 () Unit!1201)

(declare-fun lt!18868 () Unit!1201)

(assert (=> b!43575 (= lt!18866 lt!18868)))

(declare-fun lt!18869 () ListLongMap!1203)

(declare-fun lt!18863 () (_ BitVec 64))

(declare-fun lt!18864 () (_ BitVec 64))

(declare-fun lt!18867 () V!2313)

(assert (=> b!43575 (not (contains!564 (+!68 lt!18869 (tuple2!1627 lt!18863 lt!18867)) lt!18864))))

(declare-fun addStillNotContains!11 (ListLongMap!1203 (_ BitVec 64) V!2313 (_ BitVec 64)) Unit!1201)

(assert (=> b!43575 (= lt!18868 (addStillNotContains!11 lt!18869 lt!18863 lt!18867 lt!18864))))

(assert (=> b!43575 (= lt!18864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!43575 (= lt!18867 (get!785 (select (arr!1411 lt!18401) #b00000000000000000000000000000000) (dynLambda!261 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43575 (= lt!18863 (select (arr!1412 lt!18397) #b00000000000000000000000000000000))))

(assert (=> b!43575 (= lt!18869 call!3495)))

(assert (=> b!43575 (= e!27607 (+!68 call!3495 (tuple2!1627 (select (arr!1412 lt!18397) #b00000000000000000000000000000000) (get!785 (select (arr!1411 lt!18401) #b00000000000000000000000000000000) (dynLambda!261 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!43576 () Bool)

(assert (=> b!43576 (= e!27607 call!3495)))

(assert (= (and d!8013 c!5609) b!43566))

(assert (= (and d!8013 (not c!5609)) b!43565))

(assert (= (and b!43565 c!5608) b!43575))

(assert (= (and b!43565 (not c!5608)) b!43576))

(assert (= (or b!43575 b!43576) bm!3492))

(assert (= (and d!8013 res!25794) b!43567))

(assert (= (and b!43567 res!25793) b!43574))

(assert (= (and b!43574 res!25796) b!43573))

(assert (= (and b!43574 c!5606) b!43569))

(assert (= (and b!43574 (not c!5606)) b!43568))

(assert (= (and b!43569 res!25795) b!43570))

(assert (= (and b!43568 c!5607) b!43572))

(assert (= (and b!43568 (not c!5607)) b!43571))

(declare-fun b_lambda!2275 () Bool)

(assert (=> (not b_lambda!2275) (not b!43570)))

(assert (=> b!43570 t!4200))

(declare-fun b_and!2677 () Bool)

(assert (= b_and!2663 (and (=> t!4200 result!1725) b_and!2677)))

(declare-fun b_lambda!2277 () Bool)

(assert (=> (not b_lambda!2277) (not b!43575)))

(assert (=> b!43575 t!4200))

(declare-fun b_and!2679 () Bool)

(assert (= b_and!2677 (and (=> t!4200 result!1725) b_and!2679)))

(declare-fun m!37531 () Bool)

(assert (=> b!43567 m!37531))

(assert (=> b!43575 m!36943))

(declare-fun m!37533 () Bool)

(assert (=> b!43575 m!37533))

(assert (=> b!43575 m!37067))

(assert (=> b!43575 m!37017))

(declare-fun m!37535 () Bool)

(assert (=> b!43575 m!37535))

(declare-fun m!37537 () Bool)

(assert (=> b!43575 m!37537))

(declare-fun m!37539 () Bool)

(assert (=> b!43575 m!37539))

(assert (=> b!43575 m!37067))

(assert (=> b!43575 m!36943))

(assert (=> b!43575 m!37069))

(assert (=> b!43575 m!37535))

(assert (=> b!43569 m!37017))

(assert (=> b!43569 m!37017))

(declare-fun m!37543 () Bool)

(assert (=> b!43569 m!37543))

(declare-fun m!37547 () Bool)

(assert (=> b!43571 m!37547))

(declare-fun m!37551 () Bool)

(assert (=> b!43572 m!37551))

(assert (=> b!43570 m!36943))

(assert (=> b!43570 m!37067))

(assert (=> b!43570 m!36943))

(assert (=> b!43570 m!37069))

(assert (=> b!43570 m!37017))

(assert (=> b!43570 m!37067))

(assert (=> b!43570 m!37017))

(declare-fun m!37555 () Bool)

(assert (=> b!43570 m!37555))

(declare-fun m!37557 () Bool)

(assert (=> d!8013 m!37557))

(assert (=> d!8013 m!36957))

(assert (=> b!43573 m!37017))

(assert (=> b!43573 m!37017))

(assert (=> b!43573 m!37019))

(assert (=> bm!3492 m!37551))

(assert (=> b!43565 m!37017))

(assert (=> b!43565 m!37017))

(assert (=> b!43565 m!37019))

(assert (=> b!43180 d!8013))

(declare-fun d!8055 () Bool)

(declare-fun e!27620 () Bool)

(assert (=> d!8055 e!27620))

(declare-fun res!25807 () Bool)

(assert (=> d!8055 (=> (not res!25807) (not e!27620))))

(declare-fun lt!18878 () ListLongMap!1203)

(assert (=> d!8055 (= res!25807 (contains!564 lt!18878 (_1!824 (tuple2!1627 lt!18557 lt!18399))))))

(declare-fun lt!18879 () List!1200)

(assert (=> d!8055 (= lt!18878 (ListLongMap!1204 lt!18879))))

(declare-fun lt!18876 () Unit!1201)

(declare-fun lt!18877 () Unit!1201)

(assert (=> d!8055 (= lt!18876 lt!18877)))

(assert (=> d!8055 (= (getValueByKey!105 lt!18879 (_1!824 (tuple2!1627 lt!18557 lt!18399))) (Some!110 (_2!824 (tuple2!1627 lt!18557 lt!18399))))))

(assert (=> d!8055 (= lt!18877 (lemmaContainsTupThenGetReturnValue!29 lt!18879 (_1!824 (tuple2!1627 lt!18557 lt!18399)) (_2!824 (tuple2!1627 lt!18557 lt!18399))))))

(assert (=> d!8055 (= lt!18879 (insertStrictlySorted!26 (toList!617 lt!18561) (_1!824 (tuple2!1627 lt!18557 lt!18399)) (_2!824 (tuple2!1627 lt!18557 lt!18399))))))

(assert (=> d!8055 (= (+!68 lt!18561 (tuple2!1627 lt!18557 lt!18399)) lt!18878)))

(declare-fun b!43588 () Bool)

(declare-fun res!25806 () Bool)

(assert (=> b!43588 (=> (not res!25806) (not e!27620))))

(assert (=> b!43588 (= res!25806 (= (getValueByKey!105 (toList!617 lt!18878) (_1!824 (tuple2!1627 lt!18557 lt!18399))) (Some!110 (_2!824 (tuple2!1627 lt!18557 lt!18399)))))))

(declare-fun b!43589 () Bool)

(assert (=> b!43589 (= e!27620 (contains!569 (toList!617 lt!18878) (tuple2!1627 lt!18557 lt!18399)))))

(assert (= (and d!8055 res!25807) b!43588))

(assert (= (and b!43588 res!25806) b!43589))

(declare-fun m!37561 () Bool)

(assert (=> d!8055 m!37561))

(declare-fun m!37563 () Bool)

(assert (=> d!8055 m!37563))

(declare-fun m!37565 () Bool)

(assert (=> d!8055 m!37565))

(declare-fun m!37567 () Bool)

(assert (=> d!8055 m!37567))

(declare-fun m!37569 () Bool)

(assert (=> b!43588 m!37569))

(declare-fun m!37571 () Bool)

(assert (=> b!43589 m!37571))

(assert (=> b!43180 d!8055))

(declare-fun d!8059 () Bool)

(assert (=> d!8059 (= (apply!58 lt!18558 lt!18553) (get!790 (getValueByKey!105 (toList!617 lt!18558) lt!18553)))))

(declare-fun bs!1961 () Bool)

(assert (= bs!1961 d!8059))

(declare-fun m!37573 () Bool)

(assert (=> bs!1961 m!37573))

(assert (=> bs!1961 m!37573))

(declare-fun m!37575 () Bool)

(assert (=> bs!1961 m!37575))

(assert (=> b!43180 d!8059))

(declare-fun d!8061 () Bool)

(assert (=> d!8061 (= (apply!58 (+!68 lt!18561 (tuple2!1627 lt!18557 lt!18399)) lt!18552) (apply!58 lt!18561 lt!18552))))

(declare-fun lt!18880 () Unit!1201)

(assert (=> d!8061 (= lt!18880 (choose!254 lt!18561 lt!18557 lt!18399 lt!18552))))

(declare-fun e!27621 () Bool)

(assert (=> d!8061 e!27621))

(declare-fun res!25808 () Bool)

(assert (=> d!8061 (=> (not res!25808) (not e!27621))))

(assert (=> d!8061 (= res!25808 (contains!564 lt!18561 lt!18552))))

(assert (=> d!8061 (= (addApplyDifferent!35 lt!18561 lt!18557 lt!18399 lt!18552) lt!18880)))

(declare-fun b!43590 () Bool)

(assert (=> b!43590 (= e!27621 (not (= lt!18552 lt!18557)))))

(assert (= (and d!8061 res!25808) b!43590))

(assert (=> d!8061 m!37039))

(assert (=> d!8061 m!37043))

(declare-fun m!37577 () Bool)

(assert (=> d!8061 m!37577))

(assert (=> d!8061 m!37043))

(assert (=> d!8061 m!37049))

(declare-fun m!37579 () Bool)

(assert (=> d!8061 m!37579))

(assert (=> b!43180 d!8061))

(declare-fun b!43591 () Bool)

(declare-fun e!27633 () Bool)

(declare-fun call!3501 () Bool)

(assert (=> b!43591 (= e!27633 (not call!3501))))

(declare-fun b!43592 () Bool)

(declare-fun e!27629 () ListLongMap!1203)

(declare-fun call!3502 () ListLongMap!1203)

(assert (=> b!43592 (= e!27629 call!3502)))

(declare-fun bm!3493 () Bool)

(declare-fun call!3496 () Bool)

(declare-fun lt!18884 () ListLongMap!1203)

(assert (=> bm!3493 (= call!3496 (contains!564 lt!18884 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!3494 () Bool)

(declare-fun call!3498 () ListLongMap!1203)

(declare-fun call!3500 () ListLongMap!1203)

(assert (=> bm!3494 (= call!3498 call!3500)))

(declare-fun e!27630 () Bool)

(declare-fun b!43593 () Bool)

(assert (=> b!43593 (= e!27630 (= (apply!58 lt!18884 (select (arr!1412 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (get!785 (select (arr!1411 (_values!1866 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (dynLambda!261 (defaultEntry!1883 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43593 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1596 (_values!1866 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))))))

(assert (=> b!43593 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1597 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))))))

(declare-fun b!43594 () Bool)

(declare-fun e!27628 () Bool)

(declare-fun e!27631 () Bool)

(assert (=> b!43594 (= e!27628 e!27631)))

(declare-fun c!5614 () Bool)

(assert (=> b!43594 (= c!5614 (not (= (bvand (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!27625 () ListLongMap!1203)

(declare-fun call!3499 () ListLongMap!1203)

(declare-fun b!43595 () Bool)

(assert (=> b!43595 (= e!27625 (+!68 call!3499 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))))))

(declare-fun bm!3495 () Bool)

(assert (=> bm!3495 (= call!3500 (getCurrentListMapNoExtraKeys!37 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (_values!1866 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (mask!5432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1883 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))))))

(declare-fun e!27632 () Bool)

(declare-fun b!43596 () Bool)

(assert (=> b!43596 (= e!27632 (validKeyInArray!0 (select (arr!1412 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun d!8063 () Bool)

(assert (=> d!8063 e!27628))

(declare-fun res!25814 () Bool)

(assert (=> d!8063 (=> (not res!25814) (not e!27628))))

(assert (=> d!8063 (= res!25814 (or (bvsge #b00000000000000000000000000000000 (size!1597 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1597 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))))))))

(declare-fun lt!18883 () ListLongMap!1203)

(assert (=> d!8063 (= lt!18884 lt!18883)))

(declare-fun lt!18882 () Unit!1201)

(declare-fun e!27627 () Unit!1201)

(assert (=> d!8063 (= lt!18882 e!27627)))

(declare-fun c!5616 () Bool)

(declare-fun e!27622 () Bool)

(assert (=> d!8063 (= c!5616 e!27622)))

(declare-fun res!25815 () Bool)

(assert (=> d!8063 (=> (not res!25815) (not e!27622))))

(assert (=> d!8063 (= res!25815 (bvslt #b00000000000000000000000000000000 (size!1597 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))))))

(assert (=> d!8063 (= lt!18883 e!27625)))

(declare-fun c!5615 () Bool)

(assert (=> d!8063 (= c!5615 (and (not (= (bvand (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!8063 (validMask!0 (mask!5432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))))

(assert (=> d!8063 (= (getCurrentListMap!351 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (_values!1866 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (mask!5432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1883 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))) lt!18884)))

(declare-fun b!43597 () Bool)

(declare-fun c!5613 () Bool)

(assert (=> b!43597 (= c!5613 (and (not (= (bvand (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!27626 () ListLongMap!1203)

(assert (=> b!43597 (= e!27629 e!27626)))

(declare-fun bm!3496 () Bool)

(assert (=> bm!3496 (= call!3501 (contains!564 lt!18884 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!3497 () Bool)

(assert (=> bm!3497 (= call!3502 call!3499)))

(declare-fun b!43598 () Bool)

(assert (=> b!43598 (= e!27622 (validKeyInArray!0 (select (arr!1412 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!43599 () Bool)

(declare-fun lt!18889 () Unit!1201)

(assert (=> b!43599 (= e!27627 lt!18889)))

(declare-fun lt!18896 () ListLongMap!1203)

(assert (=> b!43599 (= lt!18896 (getCurrentListMapNoExtraKeys!37 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (_values!1866 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (mask!5432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1883 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))))))

(declare-fun lt!18899 () (_ BitVec 64))

(assert (=> b!43599 (= lt!18899 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18881 () (_ BitVec 64))

(assert (=> b!43599 (= lt!18881 (select (arr!1412 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!18890 () Unit!1201)

(assert (=> b!43599 (= lt!18890 (addStillContains!35 lt!18896 lt!18899 (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) lt!18881))))

(assert (=> b!43599 (contains!564 (+!68 lt!18896 (tuple2!1627 lt!18899 (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))) lt!18881)))

(declare-fun lt!18894 () Unit!1201)

(assert (=> b!43599 (= lt!18894 lt!18890)))

(declare-fun lt!18892 () ListLongMap!1203)

(assert (=> b!43599 (= lt!18892 (getCurrentListMapNoExtraKeys!37 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (_values!1866 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (mask!5432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1883 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))))))

(declare-fun lt!18885 () (_ BitVec 64))

(assert (=> b!43599 (= lt!18885 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18887 () (_ BitVec 64))

(assert (=> b!43599 (= lt!18887 (select (arr!1412 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!18897 () Unit!1201)

(assert (=> b!43599 (= lt!18897 (addApplyDifferent!35 lt!18892 lt!18885 (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) lt!18887))))

(assert (=> b!43599 (= (apply!58 (+!68 lt!18892 (tuple2!1627 lt!18885 (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))) lt!18887) (apply!58 lt!18892 lt!18887))))

(declare-fun lt!18888 () Unit!1201)

(assert (=> b!43599 (= lt!18888 lt!18897)))

(declare-fun lt!18901 () ListLongMap!1203)

(assert (=> b!43599 (= lt!18901 (getCurrentListMapNoExtraKeys!37 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (_values!1866 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (mask!5432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1883 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))))))

(declare-fun lt!18902 () (_ BitVec 64))

(assert (=> b!43599 (= lt!18902 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18893 () (_ BitVec 64))

(assert (=> b!43599 (= lt!18893 (select (arr!1412 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!18900 () Unit!1201)

(assert (=> b!43599 (= lt!18900 (addApplyDifferent!35 lt!18901 lt!18902 (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) lt!18893))))

(assert (=> b!43599 (= (apply!58 (+!68 lt!18901 (tuple2!1627 lt!18902 (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))) lt!18893) (apply!58 lt!18901 lt!18893))))

(declare-fun lt!18898 () Unit!1201)

(assert (=> b!43599 (= lt!18898 lt!18900)))

(declare-fun lt!18895 () ListLongMap!1203)

(assert (=> b!43599 (= lt!18895 (getCurrentListMapNoExtraKeys!37 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (_values!1866 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (mask!5432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1883 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))))))

(declare-fun lt!18891 () (_ BitVec 64))

(assert (=> b!43599 (= lt!18891 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18886 () (_ BitVec 64))

(assert (=> b!43599 (= lt!18886 (select (arr!1412 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(assert (=> b!43599 (= lt!18889 (addApplyDifferent!35 lt!18895 lt!18891 (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) lt!18886))))

(assert (=> b!43599 (= (apply!58 (+!68 lt!18895 (tuple2!1627 lt!18891 (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))) lt!18886) (apply!58 lt!18895 lt!18886))))

(declare-fun b!43600 () Bool)

(declare-fun e!27624 () Bool)

(assert (=> b!43600 (= e!27624 e!27630)))

(declare-fun res!25811 () Bool)

(assert (=> b!43600 (=> (not res!25811) (not e!27630))))

(assert (=> b!43600 (= res!25811 (contains!564 lt!18884 (select (arr!1412 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (=> b!43600 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1597 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))))))

(declare-fun b!43601 () Bool)

(declare-fun e!27623 () Bool)

(assert (=> b!43601 (= e!27631 e!27623)))

(declare-fun res!25809 () Bool)

(assert (=> b!43601 (= res!25809 call!3496)))

(assert (=> b!43601 (=> (not res!25809) (not e!27623))))

(declare-fun b!43602 () Bool)

(declare-fun e!27634 () Bool)

(assert (=> b!43602 (= e!27634 (= (apply!58 lt!18884 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))))))

(declare-fun b!43603 () Bool)

(declare-fun res!25813 () Bool)

(assert (=> b!43603 (=> (not res!25813) (not e!27628))))

(assert (=> b!43603 (= res!25813 e!27633)))

(declare-fun c!5612 () Bool)

(assert (=> b!43603 (= c!5612 (not (= (bvand (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!43604 () Bool)

(declare-fun res!25810 () Bool)

(assert (=> b!43604 (=> (not res!25810) (not e!27628))))

(assert (=> b!43604 (= res!25810 e!27624)))

(declare-fun res!25812 () Bool)

(assert (=> b!43604 (=> res!25812 e!27624)))

(assert (=> b!43604 (= res!25812 (not e!27632))))

(declare-fun res!25817 () Bool)

(assert (=> b!43604 (=> (not res!25817) (not e!27632))))

(assert (=> b!43604 (= res!25817 (bvslt #b00000000000000000000000000000000 (size!1597 (_keys!3432 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)))))))

(declare-fun b!43605 () Bool)

(assert (=> b!43605 (= e!27631 (not call!3496))))

(declare-fun b!43606 () Bool)

(declare-fun Unit!1219 () Unit!1201)

(assert (=> b!43606 (= e!27627 Unit!1219)))

(declare-fun b!43607 () Bool)

(assert (=> b!43607 (= e!27633 e!27634)))

(declare-fun res!25816 () Bool)

(assert (=> b!43607 (= res!25816 call!3501)))

(assert (=> b!43607 (=> (not res!25816) (not e!27634))))

(declare-fun b!43608 () Bool)

(declare-fun call!3497 () ListLongMap!1203)

(assert (=> b!43608 (= e!27626 call!3497)))

(declare-fun b!43609 () Bool)

(assert (=> b!43609 (= e!27626 call!3502)))

(declare-fun bm!3498 () Bool)

(assert (=> bm!3498 (= call!3497 call!3498)))

(declare-fun bm!3499 () Bool)

(declare-fun c!5611 () Bool)

(assert (=> bm!3499 (= call!3499 (+!68 (ite c!5615 call!3500 (ite c!5611 call!3498 call!3497)) (ite (or c!5615 c!5611) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))))))))

(declare-fun b!43610 () Bool)

(assert (=> b!43610 (= e!27625 e!27629)))

(assert (=> b!43610 (= c!5611 (and (not (= (bvand (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1774 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43611 () Bool)

(assert (=> b!43611 (= e!27623 (= (apply!58 lt!18884 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1801 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))))))

(assert (= (and d!8063 c!5615) b!43595))

(assert (= (and d!8063 (not c!5615)) b!43610))

(assert (= (and b!43610 c!5611) b!43592))

(assert (= (and b!43610 (not c!5611)) b!43597))

(assert (= (and b!43597 c!5613) b!43609))

(assert (= (and b!43597 (not c!5613)) b!43608))

(assert (= (or b!43609 b!43608) bm!3498))

(assert (= (or b!43592 bm!3498) bm!3494))

(assert (= (or b!43592 b!43609) bm!3497))

(assert (= (or b!43595 bm!3494) bm!3495))

(assert (= (or b!43595 bm!3497) bm!3499))

(assert (= (and d!8063 res!25815) b!43598))

(assert (= (and d!8063 c!5616) b!43599))

(assert (= (and d!8063 (not c!5616)) b!43606))

(assert (= (and d!8063 res!25814) b!43604))

(assert (= (and b!43604 res!25817) b!43596))

(assert (= (and b!43604 (not res!25812)) b!43600))

(assert (= (and b!43600 res!25811) b!43593))

(assert (= (and b!43604 res!25810) b!43603))

(assert (= (and b!43603 c!5612) b!43607))

(assert (= (and b!43603 (not c!5612)) b!43591))

(assert (= (and b!43607 res!25816) b!43602))

(assert (= (or b!43607 b!43591) bm!3496))

(assert (= (and b!43603 res!25813) b!43594))

(assert (= (and b!43594 c!5614) b!43601))

(assert (= (and b!43594 (not c!5614)) b!43605))

(assert (= (and b!43601 res!25809) b!43611))

(assert (= (or b!43601 b!43605) bm!3493))

(declare-fun b_lambda!2279 () Bool)

(assert (=> (not b_lambda!2279) (not b!43593)))

(declare-fun t!4204 () Bool)

(declare-fun tb!989 () Bool)

(assert (=> (and start!6470 (= defaultEntry!470 (defaultEntry!1883 (LongMapFixedSize!381 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 lt!18397 lt!18401 #b00000000000000000000000000000000))) t!4204) tb!989))

(declare-fun result!1729 () Bool)

(assert (=> tb!989 (= result!1729 tp_is_empty!1895)))

(assert (=> b!43593 t!4204))

(declare-fun b_and!2681 () Bool)

(assert (= b_and!2679 (and (=> t!4204 result!1729) b_and!2681)))

(declare-fun m!37581 () Bool)

(assert (=> b!43611 m!37581))

(declare-fun m!37583 () Bool)

(assert (=> b!43598 m!37583))

(assert (=> b!43598 m!37583))

(declare-fun m!37585 () Bool)

(assert (=> b!43598 m!37585))

(declare-fun m!37587 () Bool)

(assert (=> d!8063 m!37587))

(declare-fun m!37589 () Bool)

(assert (=> bm!3495 m!37589))

(assert (=> b!43596 m!37583))

(assert (=> b!43596 m!37583))

(assert (=> b!43596 m!37585))

(declare-fun m!37591 () Bool)

(assert (=> b!43599 m!37591))

(declare-fun m!37593 () Bool)

(assert (=> b!43599 m!37593))

(declare-fun m!37595 () Bool)

(assert (=> b!43599 m!37595))

(assert (=> b!43599 m!37589))

(assert (=> b!43599 m!37593))

(assert (=> b!43599 m!37583))

(declare-fun m!37597 () Bool)

(assert (=> b!43599 m!37597))

(declare-fun m!37599 () Bool)

(assert (=> b!43599 m!37599))

(assert (=> b!43599 m!37597))

(declare-fun m!37601 () Bool)

(assert (=> b!43599 m!37601))

(declare-fun m!37603 () Bool)

(assert (=> b!43599 m!37603))

(assert (=> b!43599 m!37603))

(declare-fun m!37605 () Bool)

(assert (=> b!43599 m!37605))

(declare-fun m!37607 () Bool)

(assert (=> b!43599 m!37607))

(declare-fun m!37609 () Bool)

(assert (=> b!43599 m!37609))

(declare-fun m!37611 () Bool)

(assert (=> b!43599 m!37611))

(declare-fun m!37613 () Bool)

(assert (=> b!43599 m!37613))

(declare-fun m!37615 () Bool)

(assert (=> b!43599 m!37615))

(assert (=> b!43599 m!37611))

(declare-fun m!37617 () Bool)

(assert (=> b!43599 m!37617))

(declare-fun m!37619 () Bool)

(assert (=> b!43599 m!37619))

(declare-fun m!37621 () Bool)

(assert (=> bm!3499 m!37621))

(declare-fun m!37623 () Bool)

(assert (=> b!43595 m!37623))

(declare-fun m!37625 () Bool)

(assert (=> b!43602 m!37625))

(declare-fun m!37627 () Bool)

(assert (=> bm!3496 m!37627))

(assert (=> b!43600 m!37583))

(assert (=> b!43600 m!37583))

(declare-fun m!37629 () Bool)

(assert (=> b!43600 m!37629))

(declare-fun m!37631 () Bool)

(assert (=> bm!3493 m!37631))

(assert (=> b!43593 m!37583))

(declare-fun m!37633 () Bool)

(assert (=> b!43593 m!37633))

(assert (=> b!43593 m!37583))

(declare-fun m!37635 () Bool)

(assert (=> b!43593 m!37635))

(declare-fun m!37637 () Bool)

(assert (=> b!43593 m!37637))

(declare-fun m!37639 () Bool)

(assert (=> b!43593 m!37639))

(assert (=> b!43593 m!37637))

(assert (=> b!43593 m!37635))

(assert (=> d!7919 d!8063))

(declare-fun d!8065 () Bool)

(assert (=> d!8065 (= (validKeyInArray!0 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)) (and (not (= (select (arr!1412 lt!18397) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1412 lt!18397) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43179 d!8065))

(declare-fun d!8069 () Bool)

(declare-fun res!25830 () Bool)

(declare-fun e!27643 () Bool)

(assert (=> d!8069 (=> res!25830 e!27643)))

(assert (=> d!8069 (= res!25830 (and (is-Cons!1196 (toList!617 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470))) (= (_1!824 (h!1773 (toList!617 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!824 (head!889 (toList!617 lt!18396))))))))

(assert (=> d!8069 (= (containsKey!72 (toList!617 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!889 (toList!617 lt!18396)))) e!27643)))

(declare-fun b!43624 () Bool)

(declare-fun e!27644 () Bool)

(assert (=> b!43624 (= e!27643 e!27644)))

(declare-fun res!25831 () Bool)

(assert (=> b!43624 (=> (not res!25831) (not e!27644))))

(assert (=> b!43624 (= res!25831 (and (or (not (is-Cons!1196 (toList!617 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470)))) (bvsle (_1!824 (h!1773 (toList!617 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!824 (head!889 (toList!617 lt!18396))))) (is-Cons!1196 (toList!617 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470))) (bvslt (_1!824 (h!1773 (toList!617 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!824 (head!889 (toList!617 lt!18396))))))))

(declare-fun b!43625 () Bool)

(assert (=> b!43625 (= e!27644 (containsKey!72 (t!4201 (toList!617 (getCurrentListMap!351 lt!18397 lt!18401 mask!853 #b00000000000000000000000000000000 lt!18399 lt!18399 #b00000000000000000000000000000000 defaultEntry!470))) (_1!824 (head!889 (toList!617 lt!18396)))))))

(assert (= (and d!8069 (not res!25830)) b!43624))

(assert (= (and b!43624 res!25831) b!43625))

(declare-fun m!37669 () Bool)

(assert (=> b!43625 m!37669))

(assert (=> d!7877 d!8069))

(declare-fun d!8075 () Bool)

(declare-fun lt!18930 () Bool)

(declare-fun content!41 (List!1201) (Set (_ BitVec 64)))

(assert (=> d!8075 (= lt!18930 (member (select (arr!1412 lt!18397) #b00000000000000000000000000000000) (content!41 Nil!1198)))))

(declare-fun e!27659 () Bool)

(assert (=> d!8075 (= lt!18930 e!27659)))

(declare-fun res!25840 () Bool)

(assert (=> d!8075 (=> (not res!25840) (not e!27659))))

(assert (=> d!8075 (= res!25840 (is-Cons!1197 Nil!1198))))

(assert (=> d!8075 (= (contains!567 Nil!1198 (select (arr!1412 lt!18397) #b00000000000000000000000000000000)) lt!18930)))

(declare-fun b!43646 () Bool)

(declare-fun e!27658 () Bool)

(assert (=> b!43646 (= e!27659 e!27658)))

(declare-fun res!25839 () Bool)

(assert (=> b!43646 (=> res!25839 e!27658)))

(assert (=> b!43646 (= res!25839 (= (h!1774 Nil!1198) (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(declare-fun b!43647 () Bool)

(assert (=> b!43647 (= e!27658 (contains!567 (t!4202 Nil!1198) (select (arr!1412 lt!18397) #b00000000000000000000000000000000)))))

(assert (= (and d!8075 res!25840) b!43646))

(assert (= (and b!43646 (not res!25839)) b!43647))

(declare-fun m!37675 () Bool)

(assert (=> d!8075 m!37675))

(assert (=> d!8075 m!37017))

(declare-fun m!37677 () Bool)

(assert (=> d!8075 m!37677))

(assert (=> b!43647 m!37017))

(declare-fun m!37679 () Bool)

(assert (=> b!43647 m!37679))

(assert (=> b!43320 d!8075))

(declare-fun d!8079 () Bool)

(declare-fun e!27660 () Bool)

(assert (=> d!8079 e!27660))

(declare-fun res!25841 () Bool)

(assert (=> d!8079 (=> res!25841 e!27660)))

(declare-fun lt!18932 () Bool)

(assert (=> d!8079 (= res!25841 (not lt!18932))))

(declare-fun lt!18933 () Bool)

(assert (=> d!8079 (= lt!18932 lt!18933)))

(declare-fun lt!18934 () Unit!1201)

(declare-fun e!27661 () Unit!1201)

(assert (=> d!8079 (= lt!18934 e!27661)))

(declare-fun c!5623 () Bool)

(assert (=> d!8079 (= c!5623 lt!18933)))

(assert (=> d!8079 (= lt!18933 (containsKey!72 (toList!617 lt!18550) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8079 (= (contains!564 lt!18550 #b0000000000000000000000000000000000000000000000000000000000000000) lt!18932)))

(declare-fun b!43648 () Bool)

(declare-fun lt!18931 () Unit!1201)

(assert (=> b!43648 (= e!27661 lt!18931)))

(assert (=> b!43648 (= lt!18931 (lemmaContainsKeyImpliesGetValueByKeyDefined!61 (toList!617 lt!18550) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43648 (isDefined!62 (getValueByKey!105 (toList!617 lt!18550) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43649 () Bool)

(declare-fun Unit!1221 () Unit!1201)

(assert (=> b!43649 (= e!27661 Unit!1221)))

(declare-fun b!43650 () Bool)

(assert (=> b!43650 (= e!27660 (isDefined!62 (getValueByKey!105 (toList!617 lt!18550) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8079 c!5623) b!43648))

(assert (= (and d!8079 (not c!5623)) b!43649))

(assert (= (and d!8079 (not res!25841)) b!43650))

(declare-fun m!37681 () Bool)

(assert (=> d!8079 m!37681))

(declare-fun m!37683 () Bool)

(assert (=> b!43648 m!37683))

(declare-fun m!37685 () Bool)

(assert (=> b!43648 m!37685))

