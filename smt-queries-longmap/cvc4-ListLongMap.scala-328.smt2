; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5946 () Bool)

(assert start!5946)

(declare-fun b_free!1431 () Bool)

(declare-fun b_next!1431 () Bool)

(assert (=> start!5946 (= b_free!1431 (not b_next!1431))))

(declare-fun tp!5834 () Bool)

(declare-fun b_and!2513 () Bool)

(assert (=> start!5946 (= tp!5834 b_and!2513)))

(declare-fun b!41686 () Bool)

(declare-fun e!26339 () Bool)

(declare-fun e!26337 () Bool)

(assert (=> b!41686 (= e!26339 (not e!26337))))

(declare-fun res!24869 () Bool)

(assert (=> b!41686 (=> res!24869 e!26337)))

(declare-datatypes ((V!2187 0))(
  ( (V!2188 (val!949 Int)) )
))
(declare-datatypes ((tuple2!1556 0))(
  ( (tuple2!1557 (_1!789 (_ BitVec 64)) (_2!789 V!2187)) )
))
(declare-datatypes ((List!1113 0))(
  ( (Nil!1110) (Cons!1109 (h!1686 tuple2!1556) (t!4039 List!1113)) )
))
(declare-datatypes ((ListLongMap!1121 0))(
  ( (ListLongMap!1122 (toList!576 List!1113)) )
))
(declare-fun lt!16916 () ListLongMap!1121)

(assert (=> b!41686 (= res!24869 (= lt!16916 (ListLongMap!1122 Nil!1110)))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16912 () V!2187)

(declare-datatypes ((ValueCell!663 0))(
  ( (ValueCellFull!663 (v!2031 V!2187)) (EmptyCell!663) )
))
(declare-datatypes ((array!2701 0))(
  ( (array!2702 (arr!1294 (Array (_ BitVec 32) ValueCell!663)) (size!1446 (_ BitVec 32))) )
))
(declare-fun lt!16915 () array!2701)

(declare-datatypes ((array!2703 0))(
  ( (array!2704 (arr!1295 (Array (_ BitVec 32) (_ BitVec 64))) (size!1447 (_ BitVec 32))) )
))
(declare-fun lt!16913 () array!2703)

(declare-datatypes ((LongMapFixedSize!306 0))(
  ( (LongMapFixedSize!307 (defaultEntry!1843 Int) (mask!5261 (_ BitVec 32)) (extraKeys!1734 (_ BitVec 32)) (zeroValue!1761 V!2187) (minValue!1761 V!2187) (_size!202 (_ BitVec 32)) (_keys!3349 array!2703) (_values!1826 array!2701) (_vacant!202 (_ BitVec 32))) )
))
(declare-fun map!746 (LongMapFixedSize!306) ListLongMap!1121)

(assert (=> b!41686 (= lt!16916 (map!746 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16912 lt!16912 #b00000000000000000000000000000000 lt!16913 lt!16915 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1114 0))(
  ( (Nil!1111) (Cons!1110 (h!1687 (_ BitVec 64)) (t!4040 List!1114)) )
))
(declare-fun arrayNoDuplicates!0 (array!2703 (_ BitVec 32) List!1114) Bool)

(assert (=> b!41686 (arrayNoDuplicates!0 lt!16913 #b00000000000000000000000000000000 Nil!1111)))

(declare-datatypes ((Unit!1068 0))(
  ( (Unit!1069) )
))
(declare-fun lt!16918 () Unit!1068)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2703 (_ BitVec 32) (_ BitVec 32) List!1114) Unit!1068)

(assert (=> b!41686 (= lt!16918 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16913 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2703 (_ BitVec 32)) Bool)

(assert (=> b!41686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16913 mask!853)))

(declare-fun lt!16917 () Unit!1068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2703 (_ BitVec 32) (_ BitVec 32)) Unit!1068)

(assert (=> b!41686 (= lt!16917 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16913 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2703 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41686 (= (arrayCountValidKeys!0 lt!16913 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16919 () Unit!1068)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2703 (_ BitVec 32) (_ BitVec 32)) Unit!1068)

(assert (=> b!41686 (= lt!16919 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16913 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41686 (= lt!16915 (array!2702 ((as const (Array (_ BitVec 32) ValueCell!663)) EmptyCell!663) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41686 (= lt!16913 (array!2704 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!223 (Int (_ BitVec 64)) V!2187)

(assert (=> b!41686 (= lt!16912 (dynLambda!223 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!24868 () Bool)

(assert (=> start!5946 (=> (not res!24868) (not e!26339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5946 (= res!24868 (validMask!0 mask!853))))

(assert (=> start!5946 e!26339))

(assert (=> start!5946 true))

(assert (=> start!5946 tp!5834))

(declare-fun b!41688 () Bool)

(assert (=> b!41688 (= e!26337 (and (bvslt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvslt (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111)))))

(declare-fun e!26338 () Bool)

(assert (=> b!41688 e!26338))

(declare-fun res!24871 () Bool)

(assert (=> b!41688 (=> (not res!24871) (not e!26338))))

(declare-fun lt!16911 () tuple2!1556)

(assert (=> b!41688 (= res!24871 (and (not (= (_1!789 lt!16911) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!789 lt!16911) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!16914 () Unit!1068)

(declare-fun lemmaKeyInListMapIsInArray!101 (array!2703 array!2701 (_ BitVec 32) (_ BitVec 32) V!2187 V!2187 (_ BitVec 64) Int) Unit!1068)

(assert (=> b!41688 (= lt!16914 (lemmaKeyInListMapIsInArray!101 lt!16913 lt!16915 mask!853 #b00000000000000000000000000000000 lt!16912 lt!16912 (_1!789 lt!16911) defaultEntry!470))))

(declare-fun head!879 (List!1113) tuple2!1556)

(assert (=> b!41688 (= lt!16911 (head!879 (toList!576 lt!16916)))))

(declare-fun b!41687 () Bool)

(declare-fun res!24870 () Bool)

(assert (=> b!41687 (=> res!24870 e!26337)))

(declare-fun isEmpty!268 (List!1113) Bool)

(assert (=> b!41687 (= res!24870 (isEmpty!268 (toList!576 lt!16916)))))

(declare-fun b!41689 () Bool)

(declare-fun arrayContainsKey!0 (array!2703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41689 (= e!26338 (arrayContainsKey!0 lt!16913 (_1!789 lt!16911) #b00000000000000000000000000000000))))

(assert (= (and start!5946 res!24868) b!41686))

(assert (= (and b!41686 (not res!24869)) b!41687))

(assert (= (and b!41687 (not res!24870)) b!41688))

(assert (= (and b!41688 res!24871) b!41689))

(declare-fun b_lambda!2159 () Bool)

(assert (=> (not b_lambda!2159) (not b!41686)))

(declare-fun t!4038 () Bool)

(declare-fun tb!913 () Bool)

(assert (=> (and start!5946 (= defaultEntry!470 defaultEntry!470) t!4038) tb!913))

(declare-fun result!1577 () Bool)

(declare-fun tp_is_empty!1821 () Bool)

(assert (=> tb!913 (= result!1577 tp_is_empty!1821)))

(assert (=> b!41686 t!4038))

(declare-fun b_and!2515 () Bool)

(assert (= b_and!2513 (and (=> t!4038 result!1577) b_and!2515)))

(declare-fun m!35215 () Bool)

(assert (=> b!41686 m!35215))

(declare-fun m!35217 () Bool)

(assert (=> b!41686 m!35217))

(declare-fun m!35219 () Bool)

(assert (=> b!41686 m!35219))

(declare-fun m!35221 () Bool)

(assert (=> b!41686 m!35221))

(declare-fun m!35223 () Bool)

(assert (=> b!41686 m!35223))

(declare-fun m!35225 () Bool)

(assert (=> b!41686 m!35225))

(declare-fun m!35227 () Bool)

(assert (=> b!41686 m!35227))

(declare-fun m!35229 () Bool)

(assert (=> b!41686 m!35229))

(declare-fun m!35231 () Bool)

(assert (=> b!41688 m!35231))

(declare-fun m!35233 () Bool)

(assert (=> b!41688 m!35233))

(declare-fun m!35235 () Bool)

(assert (=> start!5946 m!35235))

(declare-fun m!35237 () Bool)

(assert (=> b!41687 m!35237))

(declare-fun m!35239 () Bool)

(assert (=> b!41689 m!35239))

(push 1)

(assert (not b!41687))

(assert (not b!41689))

(assert (not b_next!1431))

(assert (not b_lambda!2159))

(assert (not b!41686))

(assert (not b!41688))

(assert (not start!5946))

(assert tp_is_empty!1821)

(assert b_and!2515)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2515)

(assert (not b_next!1431))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2167 () Bool)

(assert (= b_lambda!2159 (or (and start!5946 b_free!1431) b_lambda!2167)))

(push 1)

(assert (not b!41687))

(assert (not b!41689))

(assert (not b_next!1431))

(assert (not b!41686))

(assert (not b_lambda!2167))

(assert (not b!41688))

(assert (not start!5946))

(assert tp_is_empty!1821)

(assert b_and!2515)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2515)

(assert (not b_next!1431))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7413 () Bool)

(declare-fun e!26351 () Bool)

(assert (=> d!7413 e!26351))

(declare-fun c!5171 () Bool)

(assert (=> d!7413 (= c!5171 (and (not (= (_1!789 lt!16911) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!789 lt!16911) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!16949 () Unit!1068)

(declare-fun choose!255 (array!2703 array!2701 (_ BitVec 32) (_ BitVec 32) V!2187 V!2187 (_ BitVec 64) Int) Unit!1068)

(assert (=> d!7413 (= lt!16949 (choose!255 lt!16913 lt!16915 mask!853 #b00000000000000000000000000000000 lt!16912 lt!16912 (_1!789 lt!16911) defaultEntry!470))))

(assert (=> d!7413 (validMask!0 mask!853)))

(assert (=> d!7413 (= (lemmaKeyInListMapIsInArray!101 lt!16913 lt!16915 mask!853 #b00000000000000000000000000000000 lt!16912 lt!16912 (_1!789 lt!16911) defaultEntry!470) lt!16949)))

(declare-fun b!41710 () Bool)

(assert (=> b!41710 (= e!26351 (arrayContainsKey!0 lt!16913 (_1!789 lt!16911) #b00000000000000000000000000000000))))

(declare-fun b!41711 () Bool)

(assert (=> b!41711 (= e!26351 (ite (= (_1!789 lt!16911) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!7413 c!5171) b!41710))

(assert (= (and d!7413 (not c!5171)) b!41711))

(declare-fun m!35267 () Bool)

(assert (=> d!7413 m!35267))

(assert (=> d!7413 m!35235))

(assert (=> b!41710 m!35239))

(assert (=> b!41688 d!7413))

(declare-fun d!7419 () Bool)

(assert (=> d!7419 (= (head!879 (toList!576 lt!16916)) (h!1686 (toList!576 lt!16916)))))

(assert (=> b!41688 d!7419))

(declare-fun d!7421 () Bool)

(assert (=> d!7421 (= (isEmpty!268 (toList!576 lt!16916)) (is-Nil!1110 (toList!576 lt!16916)))))

(assert (=> b!41687 d!7421))

(declare-fun b!41734 () Bool)

(declare-fun e!26365 () (_ BitVec 32))

(declare-fun e!26366 () (_ BitVec 32))

(assert (=> b!41734 (= e!26365 e!26366)))

(declare-fun c!5182 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!41734 (= c!5182 (validKeyInArray!0 (select (arr!1295 lt!16913) #b00000000000000000000000000000000)))))

(declare-fun d!7423 () Bool)

(declare-fun lt!16961 () (_ BitVec 32))

(assert (=> d!7423 (and (bvsge lt!16961 #b00000000000000000000000000000000) (bvsle lt!16961 (bvsub (size!1447 lt!16913) #b00000000000000000000000000000000)))))

(assert (=> d!7423 (= lt!16961 e!26365)))

(declare-fun c!5181 () Bool)

(assert (=> d!7423 (= c!5181 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7423 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1447 lt!16913)))))

(assert (=> d!7423 (= (arrayCountValidKeys!0 lt!16913 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!16961)))

(declare-fun b!41735 () Bool)

(declare-fun call!3235 () (_ BitVec 32))

(assert (=> b!41735 (= e!26366 call!3235)))

(declare-fun b!41736 () Bool)

(assert (=> b!41736 (= e!26365 #b00000000000000000000000000000000)))

(declare-fun bm!3232 () Bool)

(assert (=> bm!3232 (= call!3235 (arrayCountValidKeys!0 lt!16913 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!41737 () Bool)

(assert (=> b!41737 (= e!26366 (bvadd #b00000000000000000000000000000001 call!3235))))

(assert (= (and d!7423 c!5181) b!41736))

(assert (= (and d!7423 (not c!5181)) b!41734))

(assert (= (and b!41734 c!5182) b!41737))

(assert (= (and b!41734 (not c!5182)) b!41735))

(assert (= (or b!41737 b!41735) bm!3232))

(declare-fun m!35271 () Bool)

(assert (=> b!41734 m!35271))

(assert (=> b!41734 m!35271))

(declare-fun m!35273 () Bool)

(assert (=> b!41734 m!35273))

(declare-fun m!35275 () Bool)

(assert (=> bm!3232 m!35275))

(assert (=> b!41686 d!7423))

(declare-fun b!41750 () Bool)

(declare-fun e!26376 () Bool)

(declare-fun e!26377 () Bool)

(assert (=> b!41750 (= e!26376 e!26377)))

(declare-fun c!5186 () Bool)

(assert (=> b!41750 (= c!5186 (validKeyInArray!0 (select (arr!1295 lt!16913) #b00000000000000000000000000000000)))))

(declare-fun bm!3236 () Bool)

(declare-fun call!3239 () Bool)

(assert (=> bm!3236 (= call!3239 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!16913 mask!853))))

(declare-fun b!41751 () Bool)

(assert (=> b!41751 (= e!26377 call!3239)))

(declare-fun d!7431 () Bool)

(declare-fun res!24894 () Bool)

(assert (=> d!7431 (=> res!24894 e!26376)))

(assert (=> d!7431 (= res!24894 (bvsge #b00000000000000000000000000000000 (size!1447 lt!16913)))))

(assert (=> d!7431 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16913 mask!853) e!26376)))

(declare-fun b!41752 () Bool)

(declare-fun e!26378 () Bool)

(assert (=> b!41752 (= e!26377 e!26378)))

(declare-fun lt!16977 () (_ BitVec 64))

(assert (=> b!41752 (= lt!16977 (select (arr!1295 lt!16913) #b00000000000000000000000000000000))))

(declare-fun lt!16978 () Unit!1068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2703 (_ BitVec 64) (_ BitVec 32)) Unit!1068)

(assert (=> b!41752 (= lt!16978 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!16913 lt!16977 #b00000000000000000000000000000000))))

(assert (=> b!41752 (arrayContainsKey!0 lt!16913 lt!16977 #b00000000000000000000000000000000)))

(declare-fun lt!16979 () Unit!1068)

(assert (=> b!41752 (= lt!16979 lt!16978)))

(declare-fun res!24895 () Bool)

(declare-datatypes ((SeekEntryResult!181 0))(
  ( (MissingZero!181 (index!2846 (_ BitVec 32))) (Found!181 (index!2847 (_ BitVec 32))) (Intermediate!181 (undefined!993 Bool) (index!2848 (_ BitVec 32)) (x!7950 (_ BitVec 32))) (Undefined!181) (MissingVacant!181 (index!2849 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2703 (_ BitVec 32)) SeekEntryResult!181)

(assert (=> b!41752 (= res!24895 (= (seekEntryOrOpen!0 (select (arr!1295 lt!16913) #b00000000000000000000000000000000) lt!16913 mask!853) (Found!181 #b00000000000000000000000000000000)))))

(assert (=> b!41752 (=> (not res!24895) (not e!26378))))

(declare-fun b!41753 () Bool)

(assert (=> b!41753 (= e!26378 call!3239)))

(assert (= (and d!7431 (not res!24894)) b!41750))

(assert (= (and b!41750 c!5186) b!41752))

(assert (= (and b!41750 (not c!5186)) b!41751))

(assert (= (and b!41752 res!24895) b!41753))

(assert (= (or b!41753 b!41751) bm!3236))

(assert (=> b!41750 m!35271))

(assert (=> b!41750 m!35271))

(assert (=> b!41750 m!35273))

(declare-fun m!35293 () Bool)

(assert (=> bm!3236 m!35293))

(assert (=> b!41752 m!35271))

(declare-fun m!35295 () Bool)

(assert (=> b!41752 m!35295))

(declare-fun m!35297 () Bool)

(assert (=> b!41752 m!35297))

(assert (=> b!41752 m!35271))

(declare-fun m!35299 () Bool)

(assert (=> b!41752 m!35299))

(assert (=> b!41686 d!7431))

(declare-fun d!7439 () Bool)

(declare-fun getCurrentListMap!330 (array!2703 array!2701 (_ BitVec 32) (_ BitVec 32) V!2187 V!2187 (_ BitVec 32) Int) ListLongMap!1121)

(assert (=> d!7439 (= (map!746 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16912 lt!16912 #b00000000000000000000000000000000 lt!16913 lt!16915 #b00000000000000000000000000000000)) (getCurrentListMap!330 (_keys!3349 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16912 lt!16912 #b00000000000000000000000000000000 lt!16913 lt!16915 #b00000000000000000000000000000000)) (_values!1826 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16912 lt!16912 #b00000000000000000000000000000000 lt!16913 lt!16915 #b00000000000000000000000000000000)) (mask!5261 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16912 lt!16912 #b00000000000000000000000000000000 lt!16913 lt!16915 #b00000000000000000000000000000000)) (extraKeys!1734 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16912 lt!16912 #b00000000000000000000000000000000 lt!16913 lt!16915 #b00000000000000000000000000000000)) (zeroValue!1761 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16912 lt!16912 #b00000000000000000000000000000000 lt!16913 lt!16915 #b00000000000000000000000000000000)) (minValue!1761 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16912 lt!16912 #b00000000000000000000000000000000 lt!16913 lt!16915 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1843 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16912 lt!16912 #b00000000000000000000000000000000 lt!16913 lt!16915 #b00000000000000000000000000000000))))))

(declare-fun bs!1788 () Bool)

(assert (= bs!1788 d!7439))

(declare-fun m!35309 () Bool)

(assert (=> bs!1788 m!35309))

(assert (=> b!41686 d!7439))

(declare-fun d!7443 () Bool)

(assert (=> d!7443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16913 mask!853)))

(declare-fun lt!16985 () Unit!1068)

(declare-fun choose!34 (array!2703 (_ BitVec 32) (_ BitVec 32)) Unit!1068)

(assert (=> d!7443 (= lt!16985 (choose!34 lt!16913 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7443 (validMask!0 mask!853)))

(assert (=> d!7443 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16913 mask!853 #b00000000000000000000000000000000) lt!16985)))

(declare-fun bs!1791 () Bool)

(assert (= bs!1791 d!7443))

(assert (=> bs!1791 m!35215))

(declare-fun m!35315 () Bool)

(assert (=> bs!1791 m!35315))

(assert (=> bs!1791 m!35235))

(assert (=> b!41686 d!7443))

(declare-fun b!41802 () Bool)

(declare-fun e!26417 () Bool)

(declare-fun e!26418 () Bool)

(assert (=> b!41802 (= e!26417 e!26418)))

(declare-fun c!5199 () Bool)

(assert (=> b!41802 (= c!5199 (validKeyInArray!0 (select (arr!1295 lt!16913) #b00000000000000000000000000000000)))))

(declare-fun b!41803 () Bool)

(declare-fun call!3250 () Bool)

(assert (=> b!41803 (= e!26418 call!3250)))

(declare-fun b!41804 () Bool)

(assert (=> b!41804 (= e!26418 call!3250)))

(declare-fun bm!3247 () Bool)

(assert (=> bm!3247 (= call!3250 (arrayNoDuplicates!0 lt!16913 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5199 (Cons!1110 (select (arr!1295 lt!16913) #b00000000000000000000000000000000) Nil!1111) Nil!1111)))))

(declare-fun d!7449 () Bool)

(declare-fun res!24921 () Bool)

(declare-fun e!26416 () Bool)

(assert (=> d!7449 (=> res!24921 e!26416)))

(assert (=> d!7449 (= res!24921 (bvsge #b00000000000000000000000000000000 (size!1447 lt!16913)))))

(assert (=> d!7449 (= (arrayNoDuplicates!0 lt!16913 #b00000000000000000000000000000000 Nil!1111) e!26416)))

(declare-fun b!41805 () Bool)

(declare-fun e!26415 () Bool)

(declare-fun contains!545 (List!1114 (_ BitVec 64)) Bool)

(assert (=> b!41805 (= e!26415 (contains!545 Nil!1111 (select (arr!1295 lt!16913) #b00000000000000000000000000000000)))))

(declare-fun b!41806 () Bool)

(assert (=> b!41806 (= e!26416 e!26417)))

(declare-fun res!24922 () Bool)

(assert (=> b!41806 (=> (not res!24922) (not e!26417))))

(assert (=> b!41806 (= res!24922 (not e!26415))))

(declare-fun res!24920 () Bool)

(assert (=> b!41806 (=> (not res!24920) (not e!26415))))

(assert (=> b!41806 (= res!24920 (validKeyInArray!0 (select (arr!1295 lt!16913) #b00000000000000000000000000000000)))))

(assert (= (and d!7449 (not res!24921)) b!41806))

(assert (= (and b!41806 res!24920) b!41805))

(assert (= (and b!41806 res!24922) b!41802))

(assert (= (and b!41802 c!5199) b!41803))

(assert (= (and b!41802 (not c!5199)) b!41804))

(assert (= (or b!41803 b!41804) bm!3247))

(assert (=> b!41802 m!35271))

(assert (=> b!41802 m!35271))

(assert (=> b!41802 m!35273))

(assert (=> bm!3247 m!35271))

(declare-fun m!35319 () Bool)

(assert (=> bm!3247 m!35319))

(assert (=> b!41805 m!35271))

(assert (=> b!41805 m!35271))

(declare-fun m!35321 () Bool)

(assert (=> b!41805 m!35321))

(assert (=> b!41806 m!35271))

(assert (=> b!41806 m!35271))

(assert (=> b!41806 m!35273))

(assert (=> b!41686 d!7449))

(declare-fun d!7451 () Bool)

(assert (=> d!7451 (= (arrayCountValidKeys!0 lt!16913 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16990 () Unit!1068)

(declare-fun choose!59 (array!2703 (_ BitVec 32) (_ BitVec 32)) Unit!1068)

(assert (=> d!7451 (= lt!16990 (choose!59 lt!16913 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7451 (bvslt (size!1447 lt!16913) #b01111111111111111111111111111111)))

(assert (=> d!7451 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16913 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!16990)))

(declare-fun bs!1792 () Bool)

(assert (= bs!1792 d!7451))

(assert (=> bs!1792 m!35225))

(declare-fun m!35325 () Bool)

(assert (=> bs!1792 m!35325))

(assert (=> b!41686 d!7451))

(declare-fun d!7455 () Bool)

(assert (=> d!7455 (arrayNoDuplicates!0 lt!16913 #b00000000000000000000000000000000 Nil!1111)))

(declare-fun lt!16997 () Unit!1068)

(declare-fun choose!111 (array!2703 (_ BitVec 32) (_ BitVec 32) List!1114) Unit!1068)

(assert (=> d!7455 (= lt!16997 (choose!111 lt!16913 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1111))))

(assert (=> d!7455 (= (size!1447 lt!16913) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7455 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!16913 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1111) lt!16997)))

(declare-fun bs!1794 () Bool)

(assert (= bs!1794 d!7455))

(assert (=> bs!1794 m!35229))

(declare-fun m!35331 () Bool)

(assert (=> bs!1794 m!35331))

(assert (=> b!41686 d!7455))

(declare-fun d!7461 () Bool)

(assert (=> d!7461 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5946 d!7461))

(declare-fun d!7465 () Bool)

(declare-fun res!24931 () Bool)

(declare-fun e!26437 () Bool)

(assert (=> d!7465 (=> res!24931 e!26437)))

(assert (=> d!7465 (= res!24931 (= (select (arr!1295 lt!16913) #b00000000000000000000000000000000) (_1!789 lt!16911)))))

(assert (=> d!7465 (= (arrayContainsKey!0 lt!16913 (_1!789 lt!16911) #b00000000000000000000000000000000) e!26437)))

(declare-fun b!41835 () Bool)

(declare-fun e!26438 () Bool)

(assert (=> b!41835 (= e!26437 e!26438)))

(declare-fun res!24932 () Bool)

(assert (=> b!41835 (=> (not res!24932) (not e!26438))))

(assert (=> b!41835 (= res!24932 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1447 lt!16913)))))

(declare-fun b!41836 () Bool)

(assert (=> b!41836 (= e!26438 (arrayContainsKey!0 lt!16913 (_1!789 lt!16911) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7465 (not res!24931)) b!41835))

(assert (= (and b!41835 res!24932) b!41836))

(assert (=> d!7465 m!35271))

(declare-fun m!35337 () Bool)

(assert (=> b!41836 m!35337))

(assert (=> b!41689 d!7465))

(push 1)

(assert (not b!41806))

(assert (not b!41710))

(assert (not d!7455))

(assert (not d!7443))

(assert (not b_lambda!2167))

(assert (not b!41805))

(assert (not d!7413))

(assert (not b_next!1431))

(assert (not b!41750))

(assert (not d!7451))

(assert (not bm!3236))

(assert (not bm!3247))

(assert tp_is_empty!1821)

(assert b_and!2515)

(assert (not b!41734))

(assert (not b!41802))

(assert (not b!41836))

(assert (not b!41752))

(assert (not d!7439))

(assert (not bm!3232))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2515)

(assert (not b_next!1431))

(check-sat)

(pop 1)

