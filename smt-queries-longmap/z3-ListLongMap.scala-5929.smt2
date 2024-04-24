; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77430 () Bool)

(assert start!77430)

(declare-fun b!902282 () Bool)

(declare-fun b_free!16075 () Bool)

(declare-fun b_next!16075 () Bool)

(assert (=> b!902282 (= b_free!16075 (not b_next!16075))))

(declare-fun tp!56325 () Bool)

(declare-fun b_and!26413 () Bool)

(assert (=> b!902282 (= tp!56325 b_and!26413)))

(declare-fun mapIsEmpty!29290 () Bool)

(declare-fun mapRes!29290 () Bool)

(assert (=> mapIsEmpty!29290 mapRes!29290))

(declare-datatypes ((array!52901 0))(
  ( (array!52902 (arr!25414 (Array (_ BitVec 32) (_ BitVec 64))) (size!25874 (_ BitVec 32))) )
))
(declare-datatypes ((V!29503 0))(
  ( (V!29504 (val!9252 Int)) )
))
(declare-datatypes ((ValueCell!8720 0))(
  ( (ValueCellFull!8720 (v!11749 V!29503)) (EmptyCell!8720) )
))
(declare-datatypes ((array!52903 0))(
  ( (array!52904 (arr!25415 (Array (_ BitVec 32) ValueCell!8720)) (size!25875 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4456 0))(
  ( (LongMapFixedSize!4457 (defaultEntry!5468 Int) (mask!26321 (_ BitVec 32)) (extraKeys!5197 (_ BitVec 32)) (zeroValue!5301 V!29503) (minValue!5301 V!29503) (_size!2283 (_ BitVec 32)) (_keys!10309 array!52901) (_values!5488 array!52903) (_vacant!2283 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4456)

(declare-fun e!505200 () Bool)

(declare-fun tp_is_empty!18403 () Bool)

(declare-fun e!505202 () Bool)

(declare-fun array_inv!19994 (array!52901) Bool)

(declare-fun array_inv!19995 (array!52903) Bool)

(assert (=> b!902282 (= e!505202 (and tp!56325 tp_is_empty!18403 (array_inv!19994 (_keys!10309 thiss!1181)) (array_inv!19995 (_values!5488 thiss!1181)) e!505200))))

(declare-fun b!902283 () Bool)

(declare-fun e!505207 () Bool)

(assert (=> b!902283 (= e!505207 tp_is_empty!18403)))

(declare-fun b!902284 () Bool)

(declare-fun res!608943 () Bool)

(declare-fun e!505201 () Bool)

(assert (=> b!902284 (=> (not res!608943) (not e!505201))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!902284 (= res!608943 (not (= key!785 (bvneg key!785))))))

(declare-fun b!902285 () Bool)

(declare-fun e!505203 () Bool)

(assert (=> b!902285 (= e!505203 tp_is_empty!18403)))

(declare-fun bm!40161 () Bool)

(declare-fun call!40165 () V!29503)

(declare-datatypes ((tuple2!11994 0))(
  ( (tuple2!11995 (_1!6008 (_ BitVec 64)) (_2!6008 V!29503)) )
))
(declare-datatypes ((List!17826 0))(
  ( (Nil!17823) (Cons!17822 (h!18974 tuple2!11994) (t!25179 List!17826)) )
))
(declare-datatypes ((ListLongMap!10693 0))(
  ( (ListLongMap!10694 (toList!5362 List!17826)) )
))
(declare-fun lt!407762 () ListLongMap!10693)

(declare-fun apply!415 (ListLongMap!10693 (_ BitVec 64)) V!29503)

(assert (=> bm!40161 (= call!40165 (apply!415 lt!407762 key!785))))

(declare-fun b!902286 () Bool)

(declare-fun e!505199 () Bool)

(assert (=> b!902286 (= e!505199 (= call!40165 (zeroValue!5301 thiss!1181)))))

(declare-fun b!902287 () Bool)

(declare-fun e!505209 () Bool)

(declare-datatypes ((SeekEntryResult!8905 0))(
  ( (MissingZero!8905 (index!37991 (_ BitVec 32))) (Found!8905 (index!37992 (_ BitVec 32))) (Intermediate!8905 (undefined!9717 Bool) (index!37993 (_ BitVec 32)) (x!76770 (_ BitVec 32))) (Undefined!8905) (MissingVacant!8905 (index!37994 (_ BitVec 32))) )
))
(declare-fun lt!407759 () SeekEntryResult!8905)

(assert (=> b!902287 (= e!505209 (and (bvsge (index!37992 lt!407759) #b00000000000000000000000000000000) (bvslt (index!37992 lt!407759) (size!25875 (_values!5488 thiss!1181)))))))

(declare-fun e!505206 () Bool)

(assert (=> b!902287 e!505206))

(declare-fun c!95743 () Bool)

(assert (=> b!902287 (= c!95743 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!30616 0))(
  ( (Unit!30617) )
))
(declare-fun lt!407760 () Unit!30616)

(declare-fun lemmaKeyInListMapThenSameValueInArray!10 (array!52901 array!52903 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 64) (_ BitVec 32) Int) Unit!30616)

(assert (=> b!902287 (= lt!407760 (lemmaKeyInListMapThenSameValueInArray!10 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785 (index!37992 lt!407759) (defaultEntry!5468 thiss!1181)))))

(declare-fun contains!4414 (ListLongMap!10693 (_ BitVec 64)) Bool)

(assert (=> b!902287 (contains!4414 lt!407762 (select (arr!25414 (_keys!10309 thiss!1181)) (index!37992 lt!407759)))))

(declare-fun getCurrentListMap!2634 (array!52901 array!52903 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 32) Int) ListLongMap!10693)

(assert (=> b!902287 (= lt!407762 (getCurrentListMap!2634 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun lt!407761 () Unit!30616)

(declare-fun lemmaValidKeyInArrayIsInListMap!264 (array!52901 array!52903 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 32) Int) Unit!30616)

(assert (=> b!902287 (= lt!407761 (lemmaValidKeyInArrayIsInListMap!264 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) (index!37992 lt!407759) (defaultEntry!5468 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!902287 (arrayContainsKey!0 (_keys!10309 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407763 () Unit!30616)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52901 (_ BitVec 64) (_ BitVec 32)) Unit!30616)

(assert (=> b!902287 (= lt!407763 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10309 thiss!1181) key!785 (index!37992 lt!407759)))))

(declare-fun b!902288 () Bool)

(assert (=> b!902288 (= e!505201 (not e!505209))))

(declare-fun res!608948 () Bool)

(assert (=> b!902288 (=> res!608948 e!505209)))

(get-info :version)

(assert (=> b!902288 (= res!608948 (not ((_ is Found!8905) lt!407759)))))

(declare-fun e!505204 () Bool)

(assert (=> b!902288 e!505204))

(declare-fun res!608946 () Bool)

(assert (=> b!902288 (=> res!608946 e!505204)))

(assert (=> b!902288 (= res!608946 (not ((_ is Found!8905) lt!407759)))))

(declare-fun lt!407758 () Unit!30616)

(declare-fun lemmaSeekEntryGivesInRangeIndex!122 (array!52901 array!52903 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 64)) Unit!30616)

(assert (=> b!902288 (= lt!407758 (lemmaSeekEntryGivesInRangeIndex!122 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52901 (_ BitVec 32)) SeekEntryResult!8905)

(assert (=> b!902288 (= lt!407759 (seekEntry!0 key!785 (_keys!10309 thiss!1181) (mask!26321 thiss!1181)))))

(declare-fun b!902289 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!902289 (= e!505204 (inRange!0 (index!37992 lt!407759) (mask!26321 thiss!1181)))))

(declare-fun b!902290 () Bool)

(assert (=> b!902290 (= e!505206 e!505199)))

(declare-fun res!608947 () Bool)

(assert (=> b!902290 (= res!608947 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!902290 (=> (not res!608947) (not e!505199))))

(declare-fun mapNonEmpty!29290 () Bool)

(declare-fun tp!56326 () Bool)

(assert (=> mapNonEmpty!29290 (= mapRes!29290 (and tp!56326 e!505207))))

(declare-fun mapValue!29290 () ValueCell!8720)

(declare-fun mapKey!29290 () (_ BitVec 32))

(declare-fun mapRest!29290 () (Array (_ BitVec 32) ValueCell!8720))

(assert (=> mapNonEmpty!29290 (= (arr!25415 (_values!5488 thiss!1181)) (store mapRest!29290 mapKey!29290 mapValue!29290))))

(declare-fun b!902291 () Bool)

(declare-fun res!608945 () Bool)

(declare-fun e!505210 () Bool)

(assert (=> b!902291 (=> (not res!608945) (not e!505210))))

(assert (=> b!902291 (= res!608945 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!505208 () Bool)

(assert (=> b!902291 (= e!505208 e!505210)))

(declare-fun b!902292 () Bool)

(declare-fun call!40164 () V!29503)

(assert (=> b!902292 (= e!505210 (= call!40164 (minValue!5301 thiss!1181)))))

(declare-fun b!902293 () Bool)

(assert (=> b!902293 (= e!505200 (and e!505203 mapRes!29290))))

(declare-fun condMapEmpty!29290 () Bool)

(declare-fun mapDefault!29290 () ValueCell!8720)

(assert (=> b!902293 (= condMapEmpty!29290 (= (arr!25415 (_values!5488 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8720)) mapDefault!29290)))))

(declare-fun b!902294 () Bool)

(assert (=> b!902294 (= e!505206 e!505208)))

(declare-fun c!95744 () Bool)

(assert (=> b!902294 (= c!95744 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902295 () Bool)

(declare-fun get!13384 (ValueCell!8720 V!29503) V!29503)

(declare-fun dynLambda!1330 (Int (_ BitVec 64)) V!29503)

(assert (=> b!902295 (= e!505208 (= call!40164 (get!13384 (select (arr!25415 (_values!5488 thiss!1181)) (index!37992 lt!407759)) (dynLambda!1330 (defaultEntry!5468 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!40162 () Bool)

(assert (=> bm!40162 (= call!40164 call!40165)))

(declare-fun res!608944 () Bool)

(assert (=> start!77430 (=> (not res!608944) (not e!505201))))

(declare-fun valid!1722 (LongMapFixedSize!4456) Bool)

(assert (=> start!77430 (= res!608944 (valid!1722 thiss!1181))))

(assert (=> start!77430 e!505201))

(assert (=> start!77430 e!505202))

(assert (=> start!77430 true))

(assert (= (and start!77430 res!608944) b!902284))

(assert (= (and b!902284 res!608943) b!902288))

(assert (= (and b!902288 (not res!608946)) b!902289))

(assert (= (and b!902288 (not res!608948)) b!902287))

(assert (= (and b!902287 c!95743) b!902290))

(assert (= (and b!902287 (not c!95743)) b!902294))

(assert (= (and b!902290 res!608947) b!902286))

(assert (= (and b!902294 c!95744) b!902291))

(assert (= (and b!902294 (not c!95744)) b!902295))

(assert (= (and b!902291 res!608945) b!902292))

(assert (= (or b!902292 b!902295) bm!40162))

(assert (= (or b!902286 bm!40162) bm!40161))

(assert (= (and b!902293 condMapEmpty!29290) mapIsEmpty!29290))

(assert (= (and b!902293 (not condMapEmpty!29290)) mapNonEmpty!29290))

(assert (= (and mapNonEmpty!29290 ((_ is ValueCellFull!8720) mapValue!29290)) b!902283))

(assert (= (and b!902293 ((_ is ValueCellFull!8720) mapDefault!29290)) b!902285))

(assert (= b!902282 b!902293))

(assert (= start!77430 b!902282))

(declare-fun b_lambda!13045 () Bool)

(assert (=> (not b_lambda!13045) (not b!902295)))

(declare-fun t!25178 () Bool)

(declare-fun tb!5203 () Bool)

(assert (=> (and b!902282 (= (defaultEntry!5468 thiss!1181) (defaultEntry!5468 thiss!1181)) t!25178) tb!5203))

(declare-fun result!10197 () Bool)

(assert (=> tb!5203 (= result!10197 tp_is_empty!18403)))

(assert (=> b!902295 t!25178))

(declare-fun b_and!26415 () Bool)

(assert (= b_and!26413 (and (=> t!25178 result!10197) b_and!26415)))

(declare-fun m!838945 () Bool)

(assert (=> b!902287 m!838945))

(declare-fun m!838947 () Bool)

(assert (=> b!902287 m!838947))

(declare-fun m!838949 () Bool)

(assert (=> b!902287 m!838949))

(declare-fun m!838951 () Bool)

(assert (=> b!902287 m!838951))

(declare-fun m!838953 () Bool)

(assert (=> b!902287 m!838953))

(assert (=> b!902287 m!838945))

(declare-fun m!838955 () Bool)

(assert (=> b!902287 m!838955))

(declare-fun m!838957 () Bool)

(assert (=> b!902287 m!838957))

(declare-fun m!838959 () Bool)

(assert (=> b!902295 m!838959))

(declare-fun m!838961 () Bool)

(assert (=> b!902295 m!838961))

(assert (=> b!902295 m!838959))

(assert (=> b!902295 m!838961))

(declare-fun m!838963 () Bool)

(assert (=> b!902295 m!838963))

(declare-fun m!838965 () Bool)

(assert (=> b!902288 m!838965))

(declare-fun m!838967 () Bool)

(assert (=> b!902288 m!838967))

(declare-fun m!838969 () Bool)

(assert (=> mapNonEmpty!29290 m!838969))

(declare-fun m!838971 () Bool)

(assert (=> b!902289 m!838971))

(declare-fun m!838973 () Bool)

(assert (=> start!77430 m!838973))

(declare-fun m!838975 () Bool)

(assert (=> b!902282 m!838975))

(declare-fun m!838977 () Bool)

(assert (=> b!902282 m!838977))

(declare-fun m!838979 () Bool)

(assert (=> bm!40161 m!838979))

(check-sat (not b!902288) (not b!902289) (not mapNonEmpty!29290) b_and!26415 (not b!902282) (not bm!40161) (not start!77430) (not b_lambda!13045) (not b_next!16075) (not b!902295) (not b!902287) tp_is_empty!18403)
(check-sat b_and!26415 (not b_next!16075))
(get-model)

(declare-fun b_lambda!13051 () Bool)

(assert (= b_lambda!13045 (or (and b!902282 b_free!16075) b_lambda!13051)))

(check-sat (not b!902288) (not b!902289) (not mapNonEmpty!29290) b_and!26415 (not bm!40161) (not start!77430) (not b!902282) (not b_lambda!13051) (not b_next!16075) (not b!902295) (not b!902287) tp_is_empty!18403)
(check-sat b_and!26415 (not b_next!16075))
(get-model)

(declare-fun d!112151 () Bool)

(assert (=> d!112151 (arrayContainsKey!0 (_keys!10309 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407802 () Unit!30616)

(declare-fun choose!13 (array!52901 (_ BitVec 64) (_ BitVec 32)) Unit!30616)

(assert (=> d!112151 (= lt!407802 (choose!13 (_keys!10309 thiss!1181) key!785 (index!37992 lt!407759)))))

(assert (=> d!112151 (bvsge (index!37992 lt!407759) #b00000000000000000000000000000000)))

(assert (=> d!112151 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10309 thiss!1181) key!785 (index!37992 lt!407759)) lt!407802)))

(declare-fun bs!25318 () Bool)

(assert (= bs!25318 d!112151))

(assert (=> bs!25318 m!838951))

(declare-fun m!839053 () Bool)

(assert (=> bs!25318 m!839053))

(assert (=> b!902287 d!112151))

(declare-fun d!112153 () Bool)

(declare-fun e!505287 () Bool)

(assert (=> d!112153 e!505287))

(declare-fun res!608987 () Bool)

(assert (=> d!112153 (=> res!608987 e!505287)))

(declare-fun lt!407811 () Bool)

(assert (=> d!112153 (= res!608987 (not lt!407811))))

(declare-fun lt!407814 () Bool)

(assert (=> d!112153 (= lt!407811 lt!407814)))

(declare-fun lt!407812 () Unit!30616)

(declare-fun e!505288 () Unit!30616)

(assert (=> d!112153 (= lt!407812 e!505288)))

(declare-fun c!95759 () Bool)

(assert (=> d!112153 (= c!95759 lt!407814)))

(declare-fun containsKey!436 (List!17826 (_ BitVec 64)) Bool)

(assert (=> d!112153 (= lt!407814 (containsKey!436 (toList!5362 lt!407762) (select (arr!25414 (_keys!10309 thiss!1181)) (index!37992 lt!407759))))))

(assert (=> d!112153 (= (contains!4414 lt!407762 (select (arr!25414 (_keys!10309 thiss!1181)) (index!37992 lt!407759))) lt!407811)))

(declare-fun b!902392 () Bool)

(declare-fun lt!407813 () Unit!30616)

(assert (=> b!902392 (= e!505288 lt!407813)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!330 (List!17826 (_ BitVec 64)) Unit!30616)

(assert (=> b!902392 (= lt!407813 (lemmaContainsKeyImpliesGetValueByKeyDefined!330 (toList!5362 lt!407762) (select (arr!25414 (_keys!10309 thiss!1181)) (index!37992 lt!407759))))))

(declare-datatypes ((Option!469 0))(
  ( (Some!468 (v!11752 V!29503)) (None!467) )
))
(declare-fun isDefined!338 (Option!469) Bool)

(declare-fun getValueByKey!463 (List!17826 (_ BitVec 64)) Option!469)

(assert (=> b!902392 (isDefined!338 (getValueByKey!463 (toList!5362 lt!407762) (select (arr!25414 (_keys!10309 thiss!1181)) (index!37992 lt!407759))))))

(declare-fun b!902393 () Bool)

(declare-fun Unit!30620 () Unit!30616)

(assert (=> b!902393 (= e!505288 Unit!30620)))

(declare-fun b!902394 () Bool)

(assert (=> b!902394 (= e!505287 (isDefined!338 (getValueByKey!463 (toList!5362 lt!407762) (select (arr!25414 (_keys!10309 thiss!1181)) (index!37992 lt!407759)))))))

(assert (= (and d!112153 c!95759) b!902392))

(assert (= (and d!112153 (not c!95759)) b!902393))

(assert (= (and d!112153 (not res!608987)) b!902394))

(assert (=> d!112153 m!838945))

(declare-fun m!839055 () Bool)

(assert (=> d!112153 m!839055))

(assert (=> b!902392 m!838945))

(declare-fun m!839057 () Bool)

(assert (=> b!902392 m!839057))

(assert (=> b!902392 m!838945))

(declare-fun m!839059 () Bool)

(assert (=> b!902392 m!839059))

(assert (=> b!902392 m!839059))

(declare-fun m!839061 () Bool)

(assert (=> b!902392 m!839061))

(assert (=> b!902394 m!838945))

(assert (=> b!902394 m!839059))

(assert (=> b!902394 m!839059))

(assert (=> b!902394 m!839061))

(assert (=> b!902287 d!112153))

(declare-fun d!112155 () Bool)

(declare-fun res!608992 () Bool)

(declare-fun e!505293 () Bool)

(assert (=> d!112155 (=> res!608992 e!505293)))

(assert (=> d!112155 (= res!608992 (= (select (arr!25414 (_keys!10309 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!112155 (= (arrayContainsKey!0 (_keys!10309 thiss!1181) key!785 #b00000000000000000000000000000000) e!505293)))

(declare-fun b!902399 () Bool)

(declare-fun e!505294 () Bool)

(assert (=> b!902399 (= e!505293 e!505294)))

(declare-fun res!608993 () Bool)

(assert (=> b!902399 (=> (not res!608993) (not e!505294))))

(assert (=> b!902399 (= res!608993 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25874 (_keys!10309 thiss!1181))))))

(declare-fun b!902400 () Bool)

(assert (=> b!902400 (= e!505294 (arrayContainsKey!0 (_keys!10309 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112155 (not res!608992)) b!902399))

(assert (= (and b!902399 res!608993) b!902400))

(declare-fun m!839063 () Bool)

(assert (=> d!112155 m!839063))

(declare-fun m!839065 () Bool)

(assert (=> b!902400 m!839065))

(assert (=> b!902287 d!112155))

(declare-fun bm!40183 () Bool)

(declare-fun call!40186 () ListLongMap!10693)

(declare-fun call!40188 () V!29503)

(declare-fun c!95765 () Bool)

(declare-fun call!40187 () ListLongMap!10693)

(assert (=> bm!40183 (= call!40188 (apply!415 (ite c!95765 call!40187 call!40186) key!785))))

(declare-fun b!902415 () Bool)

(declare-fun e!505307 () Bool)

(declare-fun e!505306 () Bool)

(assert (=> b!902415 (= e!505307 e!505306)))

(declare-fun res!609001 () Bool)

(assert (=> b!902415 (= res!609001 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!902415 (=> (not res!609001) (not e!505306))))

(declare-fun b!902416 () Bool)

(declare-fun res!609002 () Bool)

(declare-fun e!505309 () Bool)

(assert (=> b!902416 (=> (not res!609002) (not e!505309))))

(assert (=> b!902416 (= res!609002 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!505308 () Bool)

(assert (=> b!902416 (= e!505308 e!505309)))

(declare-fun b!902417 () Bool)

(assert (=> b!902417 (= e!505306 (= call!40188 (zeroValue!5301 thiss!1181)))))

(declare-fun d!112157 () Bool)

(assert (=> d!112157 e!505307))

(assert (=> d!112157 (= c!95765 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!407817 () Unit!30616)

(declare-fun choose!1526 (array!52901 array!52903 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 64) (_ BitVec 32) Int) Unit!30616)

(assert (=> d!112157 (= lt!407817 (choose!1526 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785 (index!37992 lt!407759) (defaultEntry!5468 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!112157 (validMask!0 (mask!26321 thiss!1181))))

(assert (=> d!112157 (= (lemmaKeyInListMapThenSameValueInArray!10 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785 (index!37992 lt!407759) (defaultEntry!5468 thiss!1181)) lt!407817)))

(declare-fun bm!40184 () Bool)

(declare-fun call!40189 () V!29503)

(assert (=> bm!40184 (= call!40189 call!40188)))

(declare-fun bm!40185 () Bool)

(assert (=> bm!40185 (= call!40187 (getCurrentListMap!2634 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun e!505305 () Bool)

(declare-fun b!902418 () Bool)

(assert (=> b!902418 (= e!505305 (= call!40189 (get!13384 (select (arr!25415 (_values!5488 thiss!1181)) (index!37992 lt!407759)) (dynLambda!1330 (defaultEntry!5468 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!902418 (and (bvsge (index!37992 lt!407759) #b00000000000000000000000000000000) (bvslt (index!37992 lt!407759) (size!25875 (_values!5488 thiss!1181))))))

(declare-fun b!902419 () Bool)

(assert (=> b!902419 (= e!505309 (= call!40189 (minValue!5301 thiss!1181)))))

(declare-fun b!902420 () Bool)

(assert (=> b!902420 (= e!505307 e!505308)))

(declare-fun c!95764 () Bool)

(assert (=> b!902420 (= c!95764 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902421 () Bool)

(declare-fun res!609000 () Bool)

(assert (=> b!902421 (=> (not res!609000) (not e!505305))))

(assert (=> b!902421 (= res!609000 (arrayContainsKey!0 (_keys!10309 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (=> b!902421 (= e!505308 e!505305)))

(declare-fun bm!40186 () Bool)

(assert (=> bm!40186 (= call!40186 call!40187)))

(assert (= (and d!112157 c!95765) b!902415))

(assert (= (and d!112157 (not c!95765)) b!902420))

(assert (= (and b!902415 res!609001) b!902417))

(assert (= (and b!902420 c!95764) b!902416))

(assert (= (and b!902420 (not c!95764)) b!902421))

(assert (= (and b!902416 res!609002) b!902419))

(assert (= (and b!902421 res!609000) b!902418))

(assert (= (or b!902419 b!902418) bm!40186))

(assert (= (or b!902419 b!902418) bm!40184))

(assert (= (or b!902417 bm!40186) bm!40185))

(assert (= (or b!902417 bm!40184) bm!40183))

(declare-fun b_lambda!13053 () Bool)

(assert (=> (not b_lambda!13053) (not b!902418)))

(assert (=> b!902418 t!25178))

(declare-fun b_and!26425 () Bool)

(assert (= b_and!26415 (and (=> t!25178 result!10197) b_and!26425)))

(assert (=> bm!40185 m!838957))

(assert (=> b!902418 m!838959))

(assert (=> b!902418 m!838961))

(assert (=> b!902418 m!838959))

(assert (=> b!902418 m!838961))

(assert (=> b!902418 m!838963))

(declare-fun m!839067 () Bool)

(assert (=> bm!40183 m!839067))

(declare-fun m!839069 () Bool)

(assert (=> d!112157 m!839069))

(declare-fun m!839071 () Bool)

(assert (=> d!112157 m!839071))

(assert (=> b!902421 m!838951))

(assert (=> b!902287 d!112157))

(declare-fun b!902464 () Bool)

(declare-fun e!505337 () ListLongMap!10693)

(declare-fun call!40207 () ListLongMap!10693)

(assert (=> b!902464 (= e!505337 call!40207)))

(declare-fun bm!40201 () Bool)

(declare-fun call!40210 () ListLongMap!10693)

(assert (=> bm!40201 (= call!40207 call!40210)))

(declare-fun b!902465 () Bool)

(declare-fun e!505338 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!902465 (= e!505338 (validKeyInArray!0 (select (arr!25414 (_keys!10309 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40202 () Bool)

(declare-fun call!40205 () ListLongMap!10693)

(assert (=> bm!40202 (= call!40210 call!40205)))

(declare-fun b!902466 () Bool)

(declare-fun e!505348 () Unit!30616)

(declare-fun lt!407873 () Unit!30616)

(assert (=> b!902466 (= e!505348 lt!407873)))

(declare-fun lt!407878 () ListLongMap!10693)

(declare-fun getCurrentListMapNoExtraKeys!3331 (array!52901 array!52903 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 32) Int) ListLongMap!10693)

(assert (=> b!902466 (= lt!407878 (getCurrentListMapNoExtraKeys!3331 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun lt!407867 () (_ BitVec 64))

(assert (=> b!902466 (= lt!407867 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407866 () (_ BitVec 64))

(assert (=> b!902466 (= lt!407866 (select (arr!25414 (_keys!10309 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407865 () Unit!30616)

(declare-fun addStillContains!341 (ListLongMap!10693 (_ BitVec 64) V!29503 (_ BitVec 64)) Unit!30616)

(assert (=> b!902466 (= lt!407865 (addStillContains!341 lt!407878 lt!407867 (zeroValue!5301 thiss!1181) lt!407866))))

(declare-fun +!2610 (ListLongMap!10693 tuple2!11994) ListLongMap!10693)

(assert (=> b!902466 (contains!4414 (+!2610 lt!407878 (tuple2!11995 lt!407867 (zeroValue!5301 thiss!1181))) lt!407866)))

(declare-fun lt!407871 () Unit!30616)

(assert (=> b!902466 (= lt!407871 lt!407865)))

(declare-fun lt!407868 () ListLongMap!10693)

(assert (=> b!902466 (= lt!407868 (getCurrentListMapNoExtraKeys!3331 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun lt!407874 () (_ BitVec 64))

(assert (=> b!902466 (= lt!407874 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407882 () (_ BitVec 64))

(assert (=> b!902466 (= lt!407882 (select (arr!25414 (_keys!10309 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407883 () Unit!30616)

(declare-fun addApplyDifferent!341 (ListLongMap!10693 (_ BitVec 64) V!29503 (_ BitVec 64)) Unit!30616)

(assert (=> b!902466 (= lt!407883 (addApplyDifferent!341 lt!407868 lt!407874 (minValue!5301 thiss!1181) lt!407882))))

(assert (=> b!902466 (= (apply!415 (+!2610 lt!407868 (tuple2!11995 lt!407874 (minValue!5301 thiss!1181))) lt!407882) (apply!415 lt!407868 lt!407882))))

(declare-fun lt!407864 () Unit!30616)

(assert (=> b!902466 (= lt!407864 lt!407883)))

(declare-fun lt!407870 () ListLongMap!10693)

(assert (=> b!902466 (= lt!407870 (getCurrentListMapNoExtraKeys!3331 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun lt!407863 () (_ BitVec 64))

(assert (=> b!902466 (= lt!407863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407875 () (_ BitVec 64))

(assert (=> b!902466 (= lt!407875 (select (arr!25414 (_keys!10309 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407872 () Unit!30616)

(assert (=> b!902466 (= lt!407872 (addApplyDifferent!341 lt!407870 lt!407863 (zeroValue!5301 thiss!1181) lt!407875))))

(assert (=> b!902466 (= (apply!415 (+!2610 lt!407870 (tuple2!11995 lt!407863 (zeroValue!5301 thiss!1181))) lt!407875) (apply!415 lt!407870 lt!407875))))

(declare-fun lt!407880 () Unit!30616)

(assert (=> b!902466 (= lt!407880 lt!407872)))

(declare-fun lt!407869 () ListLongMap!10693)

(assert (=> b!902466 (= lt!407869 (getCurrentListMapNoExtraKeys!3331 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun lt!407876 () (_ BitVec 64))

(assert (=> b!902466 (= lt!407876 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407862 () (_ BitVec 64))

(assert (=> b!902466 (= lt!407862 (select (arr!25414 (_keys!10309 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902466 (= lt!407873 (addApplyDifferent!341 lt!407869 lt!407876 (minValue!5301 thiss!1181) lt!407862))))

(assert (=> b!902466 (= (apply!415 (+!2610 lt!407869 (tuple2!11995 lt!407876 (minValue!5301 thiss!1181))) lt!407862) (apply!415 lt!407869 lt!407862))))

(declare-fun bm!40203 () Bool)

(declare-fun call!40209 () Bool)

(declare-fun lt!407877 () ListLongMap!10693)

(assert (=> bm!40203 (= call!40209 (contains!4414 lt!407877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902467 () Bool)

(declare-fun call!40204 () ListLongMap!10693)

(assert (=> b!902467 (= e!505337 call!40204)))

(declare-fun b!902468 () Bool)

(declare-fun Unit!30621 () Unit!30616)

(assert (=> b!902468 (= e!505348 Unit!30621)))

(declare-fun b!902469 () Bool)

(declare-fun e!505345 () Bool)

(assert (=> b!902469 (= e!505345 (= (apply!415 lt!407877 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5301 thiss!1181)))))

(declare-fun b!902470 () Bool)

(declare-fun e!505336 () Bool)

(declare-fun e!505341 () Bool)

(assert (=> b!902470 (= e!505336 e!505341)))

(declare-fun res!609024 () Bool)

(assert (=> b!902470 (= res!609024 call!40209)))

(assert (=> b!902470 (=> (not res!609024) (not e!505341))))

(declare-fun b!902471 () Bool)

(declare-fun e!505347 () Bool)

(assert (=> b!902471 (= e!505347 (validKeyInArray!0 (select (arr!25414 (_keys!10309 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!902472 () Bool)

(assert (=> b!902472 (= e!505336 (not call!40209))))

(declare-fun b!902473 () Bool)

(declare-fun e!505346 () Bool)

(declare-fun call!40208 () Bool)

(assert (=> b!902473 (= e!505346 (not call!40208))))

(declare-fun b!902474 () Bool)

(declare-fun e!505343 () Bool)

(declare-fun e!505342 () Bool)

(assert (=> b!902474 (= e!505343 e!505342)))

(declare-fun res!609026 () Bool)

(assert (=> b!902474 (=> (not res!609026) (not e!505342))))

(assert (=> b!902474 (= res!609026 (contains!4414 lt!407877 (select (arr!25414 (_keys!10309 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!902474 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25874 (_keys!10309 thiss!1181))))))

(declare-fun bm!40204 () Bool)

(declare-fun call!40206 () ListLongMap!10693)

(declare-fun c!95778 () Bool)

(declare-fun c!95781 () Bool)

(assert (=> bm!40204 (= call!40206 (+!2610 (ite c!95778 call!40205 (ite c!95781 call!40210 call!40207)) (ite (or c!95778 c!95781) (tuple2!11995 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5301 thiss!1181)) (tuple2!11995 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5301 thiss!1181)))))))

(declare-fun b!902475 () Bool)

(assert (=> b!902475 (= e!505346 e!505345)))

(declare-fun res!609027 () Bool)

(assert (=> b!902475 (= res!609027 call!40208)))

(assert (=> b!902475 (=> (not res!609027) (not e!505345))))

(declare-fun b!902476 () Bool)

(declare-fun e!505339 () Bool)

(assert (=> b!902476 (= e!505339 e!505346)))

(declare-fun c!95782 () Bool)

(assert (=> b!902476 (= c!95782 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40205 () Bool)

(assert (=> bm!40205 (= call!40204 call!40206)))

(declare-fun b!902477 () Bool)

(declare-fun res!609023 () Bool)

(assert (=> b!902477 (=> (not res!609023) (not e!505339))))

(assert (=> b!902477 (= res!609023 e!505343)))

(declare-fun res!609021 () Bool)

(assert (=> b!902477 (=> res!609021 e!505343)))

(assert (=> b!902477 (= res!609021 (not e!505347))))

(declare-fun res!609028 () Bool)

(assert (=> b!902477 (=> (not res!609028) (not e!505347))))

(assert (=> b!902477 (= res!609028 (bvslt #b00000000000000000000000000000000 (size!25874 (_keys!10309 thiss!1181))))))

(declare-fun b!902478 () Bool)

(declare-fun res!609025 () Bool)

(assert (=> b!902478 (=> (not res!609025) (not e!505339))))

(assert (=> b!902478 (= res!609025 e!505336)))

(declare-fun c!95779 () Bool)

(assert (=> b!902478 (= c!95779 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!902479 () Bool)

(declare-fun e!505340 () ListLongMap!10693)

(assert (=> b!902479 (= e!505340 (+!2610 call!40206 (tuple2!11995 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5301 thiss!1181))))))

(declare-fun d!112159 () Bool)

(assert (=> d!112159 e!505339))

(declare-fun res!609029 () Bool)

(assert (=> d!112159 (=> (not res!609029) (not e!505339))))

(assert (=> d!112159 (= res!609029 (or (bvsge #b00000000000000000000000000000000 (size!25874 (_keys!10309 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25874 (_keys!10309 thiss!1181))))))))

(declare-fun lt!407881 () ListLongMap!10693)

(assert (=> d!112159 (= lt!407877 lt!407881)))

(declare-fun lt!407879 () Unit!30616)

(assert (=> d!112159 (= lt!407879 e!505348)))

(declare-fun c!95780 () Bool)

(assert (=> d!112159 (= c!95780 e!505338)))

(declare-fun res!609022 () Bool)

(assert (=> d!112159 (=> (not res!609022) (not e!505338))))

(assert (=> d!112159 (= res!609022 (bvslt #b00000000000000000000000000000000 (size!25874 (_keys!10309 thiss!1181))))))

(assert (=> d!112159 (= lt!407881 e!505340)))

(assert (=> d!112159 (= c!95778 (and (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112159 (validMask!0 (mask!26321 thiss!1181))))

(assert (=> d!112159 (= (getCurrentListMap!2634 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)) lt!407877)))

(declare-fun b!902480 () Bool)

(assert (=> b!902480 (= e!505341 (= (apply!415 lt!407877 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5301 thiss!1181)))))

(declare-fun b!902481 () Bool)

(declare-fun e!505344 () ListLongMap!10693)

(assert (=> b!902481 (= e!505340 e!505344)))

(assert (=> b!902481 (= c!95781 (and (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!902482 () Bool)

(assert (=> b!902482 (= e!505344 call!40204)))

(declare-fun bm!40206 () Bool)

(assert (=> bm!40206 (= call!40208 (contains!4414 lt!407877 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902483 () Bool)

(declare-fun c!95783 () Bool)

(assert (=> b!902483 (= c!95783 (and (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!902483 (= e!505344 e!505337)))

(declare-fun b!902484 () Bool)

(assert (=> b!902484 (= e!505342 (= (apply!415 lt!407877 (select (arr!25414 (_keys!10309 thiss!1181)) #b00000000000000000000000000000000)) (get!13384 (select (arr!25415 (_values!5488 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1330 (defaultEntry!5468 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!902484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25875 (_values!5488 thiss!1181))))))

(assert (=> b!902484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25874 (_keys!10309 thiss!1181))))))

(declare-fun bm!40207 () Bool)

(assert (=> bm!40207 (= call!40205 (getCurrentListMapNoExtraKeys!3331 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(assert (= (and d!112159 c!95778) b!902479))

(assert (= (and d!112159 (not c!95778)) b!902481))

(assert (= (and b!902481 c!95781) b!902482))

(assert (= (and b!902481 (not c!95781)) b!902483))

(assert (= (and b!902483 c!95783) b!902467))

(assert (= (and b!902483 (not c!95783)) b!902464))

(assert (= (or b!902467 b!902464) bm!40201))

(assert (= (or b!902482 bm!40201) bm!40202))

(assert (= (or b!902482 b!902467) bm!40205))

(assert (= (or b!902479 bm!40202) bm!40207))

(assert (= (or b!902479 bm!40205) bm!40204))

(assert (= (and d!112159 res!609022) b!902465))

(assert (= (and d!112159 c!95780) b!902466))

(assert (= (and d!112159 (not c!95780)) b!902468))

(assert (= (and d!112159 res!609029) b!902477))

(assert (= (and b!902477 res!609028) b!902471))

(assert (= (and b!902477 (not res!609021)) b!902474))

(assert (= (and b!902474 res!609026) b!902484))

(assert (= (and b!902477 res!609023) b!902478))

(assert (= (and b!902478 c!95779) b!902470))

(assert (= (and b!902478 (not c!95779)) b!902472))

(assert (= (and b!902470 res!609024) b!902480))

(assert (= (or b!902470 b!902472) bm!40203))

(assert (= (and b!902478 res!609025) b!902476))

(assert (= (and b!902476 c!95782) b!902475))

(assert (= (and b!902476 (not c!95782)) b!902473))

(assert (= (and b!902475 res!609027) b!902469))

(assert (= (or b!902475 b!902473) bm!40206))

(declare-fun b_lambda!13055 () Bool)

(assert (=> (not b_lambda!13055) (not b!902484)))

(assert (=> b!902484 t!25178))

(declare-fun b_and!26427 () Bool)

(assert (= b_and!26425 (and (=> t!25178 result!10197) b_and!26427)))

(declare-fun m!839073 () Bool)

(assert (=> bm!40206 m!839073))

(assert (=> b!902465 m!839063))

(assert (=> b!902465 m!839063))

(declare-fun m!839075 () Bool)

(assert (=> b!902465 m!839075))

(declare-fun m!839077 () Bool)

(assert (=> bm!40203 m!839077))

(assert (=> b!902474 m!839063))

(assert (=> b!902474 m!839063))

(declare-fun m!839079 () Bool)

(assert (=> b!902474 m!839079))

(declare-fun m!839081 () Bool)

(assert (=> b!902466 m!839081))

(declare-fun m!839083 () Bool)

(assert (=> b!902466 m!839083))

(declare-fun m!839085 () Bool)

(assert (=> b!902466 m!839085))

(assert (=> b!902466 m!839081))

(declare-fun m!839087 () Bool)

(assert (=> b!902466 m!839087))

(declare-fun m!839089 () Bool)

(assert (=> b!902466 m!839089))

(declare-fun m!839091 () Bool)

(assert (=> b!902466 m!839091))

(declare-fun m!839093 () Bool)

(assert (=> b!902466 m!839093))

(declare-fun m!839095 () Bool)

(assert (=> b!902466 m!839095))

(assert (=> b!902466 m!839095))

(declare-fun m!839097 () Bool)

(assert (=> b!902466 m!839097))

(declare-fun m!839099 () Bool)

(assert (=> b!902466 m!839099))

(declare-fun m!839101 () Bool)

(assert (=> b!902466 m!839101))

(declare-fun m!839103 () Bool)

(assert (=> b!902466 m!839103))

(declare-fun m!839105 () Bool)

(assert (=> b!902466 m!839105))

(assert (=> b!902466 m!839093))

(declare-fun m!839107 () Bool)

(assert (=> b!902466 m!839107))

(assert (=> b!902466 m!839099))

(declare-fun m!839109 () Bool)

(assert (=> b!902466 m!839109))

(assert (=> b!902466 m!839063))

(declare-fun m!839111 () Bool)

(assert (=> b!902466 m!839111))

(declare-fun m!839113 () Bool)

(assert (=> b!902480 m!839113))

(declare-fun m!839115 () Bool)

(assert (=> b!902484 m!839115))

(assert (=> b!902484 m!839063))

(declare-fun m!839117 () Bool)

(assert (=> b!902484 m!839117))

(assert (=> b!902484 m!838961))

(assert (=> b!902484 m!839063))

(assert (=> b!902484 m!839115))

(assert (=> b!902484 m!838961))

(declare-fun m!839119 () Bool)

(assert (=> b!902484 m!839119))

(declare-fun m!839121 () Bool)

(assert (=> b!902469 m!839121))

(assert (=> d!112159 m!839071))

(declare-fun m!839123 () Bool)

(assert (=> bm!40204 m!839123))

(assert (=> bm!40207 m!839105))

(assert (=> b!902471 m!839063))

(assert (=> b!902471 m!839063))

(assert (=> b!902471 m!839075))

(declare-fun m!839125 () Bool)

(assert (=> b!902479 m!839125))

(assert (=> b!902287 d!112159))

(declare-fun d!112161 () Bool)

(declare-fun e!505351 () Bool)

(assert (=> d!112161 e!505351))

(declare-fun res!609032 () Bool)

(assert (=> d!112161 (=> (not res!609032) (not e!505351))))

(assert (=> d!112161 (= res!609032 (and (bvsge (index!37992 lt!407759) #b00000000000000000000000000000000) (bvslt (index!37992 lt!407759) (size!25874 (_keys!10309 thiss!1181)))))))

(declare-fun lt!407886 () Unit!30616)

(declare-fun choose!1527 (array!52901 array!52903 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 32) Int) Unit!30616)

(assert (=> d!112161 (= lt!407886 (choose!1527 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) (index!37992 lt!407759) (defaultEntry!5468 thiss!1181)))))

(assert (=> d!112161 (validMask!0 (mask!26321 thiss!1181))))

(assert (=> d!112161 (= (lemmaValidKeyInArrayIsInListMap!264 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) (index!37992 lt!407759) (defaultEntry!5468 thiss!1181)) lt!407886)))

(declare-fun b!902487 () Bool)

(assert (=> b!902487 (= e!505351 (contains!4414 (getCurrentListMap!2634 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)) (select (arr!25414 (_keys!10309 thiss!1181)) (index!37992 lt!407759))))))

(assert (= (and d!112161 res!609032) b!902487))

(declare-fun m!839127 () Bool)

(assert (=> d!112161 m!839127))

(assert (=> d!112161 m!839071))

(assert (=> b!902487 m!838957))

(assert (=> b!902487 m!838945))

(assert (=> b!902487 m!838957))

(assert (=> b!902487 m!838945))

(declare-fun m!839129 () Bool)

(assert (=> b!902487 m!839129))

(assert (=> b!902287 d!112161))

(declare-fun d!112163 () Bool)

(declare-fun res!609039 () Bool)

(declare-fun e!505354 () Bool)

(assert (=> d!112163 (=> (not res!609039) (not e!505354))))

(declare-fun simpleValid!333 (LongMapFixedSize!4456) Bool)

(assert (=> d!112163 (= res!609039 (simpleValid!333 thiss!1181))))

(assert (=> d!112163 (= (valid!1722 thiss!1181) e!505354)))

(declare-fun b!902494 () Bool)

(declare-fun res!609040 () Bool)

(assert (=> b!902494 (=> (not res!609040) (not e!505354))))

(declare-fun arrayCountValidKeys!0 (array!52901 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!902494 (= res!609040 (= (arrayCountValidKeys!0 (_keys!10309 thiss!1181) #b00000000000000000000000000000000 (size!25874 (_keys!10309 thiss!1181))) (_size!2283 thiss!1181)))))

(declare-fun b!902495 () Bool)

(declare-fun res!609041 () Bool)

(assert (=> b!902495 (=> (not res!609041) (not e!505354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52901 (_ BitVec 32)) Bool)

(assert (=> b!902495 (= res!609041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10309 thiss!1181) (mask!26321 thiss!1181)))))

(declare-fun b!902496 () Bool)

(declare-datatypes ((List!17829 0))(
  ( (Nil!17826) (Cons!17825 (h!18977 (_ BitVec 64)) (t!25186 List!17829)) )
))
(declare-fun arrayNoDuplicates!0 (array!52901 (_ BitVec 32) List!17829) Bool)

(assert (=> b!902496 (= e!505354 (arrayNoDuplicates!0 (_keys!10309 thiss!1181) #b00000000000000000000000000000000 Nil!17826))))

(assert (= (and d!112163 res!609039) b!902494))

(assert (= (and b!902494 res!609040) b!902495))

(assert (= (and b!902495 res!609041) b!902496))

(declare-fun m!839131 () Bool)

(assert (=> d!112163 m!839131))

(declare-fun m!839133 () Bool)

(assert (=> b!902494 m!839133))

(declare-fun m!839135 () Bool)

(assert (=> b!902495 m!839135))

(declare-fun m!839137 () Bool)

(assert (=> b!902496 m!839137))

(assert (=> start!77430 d!112163))

(declare-fun d!112165 () Bool)

(declare-fun c!95786 () Bool)

(assert (=> d!112165 (= c!95786 ((_ is ValueCellFull!8720) (select (arr!25415 (_values!5488 thiss!1181)) (index!37992 lt!407759))))))

(declare-fun e!505357 () V!29503)

(assert (=> d!112165 (= (get!13384 (select (arr!25415 (_values!5488 thiss!1181)) (index!37992 lt!407759)) (dynLambda!1330 (defaultEntry!5468 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!505357)))

(declare-fun b!902501 () Bool)

(declare-fun get!13387 (ValueCell!8720 V!29503) V!29503)

(assert (=> b!902501 (= e!505357 (get!13387 (select (arr!25415 (_values!5488 thiss!1181)) (index!37992 lt!407759)) (dynLambda!1330 (defaultEntry!5468 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!902502 () Bool)

(declare-fun get!13388 (ValueCell!8720 V!29503) V!29503)

(assert (=> b!902502 (= e!505357 (get!13388 (select (arr!25415 (_values!5488 thiss!1181)) (index!37992 lt!407759)) (dynLambda!1330 (defaultEntry!5468 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112165 c!95786) b!902501))

(assert (= (and d!112165 (not c!95786)) b!902502))

(assert (=> b!902501 m!838959))

(assert (=> b!902501 m!838961))

(declare-fun m!839139 () Bool)

(assert (=> b!902501 m!839139))

(assert (=> b!902502 m!838959))

(assert (=> b!902502 m!838961))

(declare-fun m!839141 () Bool)

(assert (=> b!902502 m!839141))

(assert (=> b!902295 d!112165))

(declare-fun d!112167 () Bool)

(assert (=> d!112167 (= (array_inv!19994 (_keys!10309 thiss!1181)) (bvsge (size!25874 (_keys!10309 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902282 d!112167))

(declare-fun d!112169 () Bool)

(assert (=> d!112169 (= (array_inv!19995 (_values!5488 thiss!1181)) (bvsge (size!25875 (_values!5488 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902282 d!112169))

(declare-fun d!112171 () Bool)

(declare-fun get!13389 (Option!469) V!29503)

(assert (=> d!112171 (= (apply!415 lt!407762 key!785) (get!13389 (getValueByKey!463 (toList!5362 lt!407762) key!785)))))

(declare-fun bs!25319 () Bool)

(assert (= bs!25319 d!112171))

(declare-fun m!839143 () Bool)

(assert (=> bs!25319 m!839143))

(assert (=> bs!25319 m!839143))

(declare-fun m!839145 () Bool)

(assert (=> bs!25319 m!839145))

(assert (=> bm!40161 d!112171))

(declare-fun d!112173 () Bool)

(declare-fun e!505360 () Bool)

(assert (=> d!112173 e!505360))

(declare-fun res!609044 () Bool)

(assert (=> d!112173 (=> res!609044 e!505360)))

(declare-fun lt!407892 () SeekEntryResult!8905)

(assert (=> d!112173 (= res!609044 (not ((_ is Found!8905) lt!407892)))))

(assert (=> d!112173 (= lt!407892 (seekEntry!0 key!785 (_keys!10309 thiss!1181) (mask!26321 thiss!1181)))))

(declare-fun lt!407891 () Unit!30616)

(declare-fun choose!1528 (array!52901 array!52903 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 64)) Unit!30616)

(assert (=> d!112173 (= lt!407891 (choose!1528 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785))))

(assert (=> d!112173 (validMask!0 (mask!26321 thiss!1181))))

(assert (=> d!112173 (= (lemmaSeekEntryGivesInRangeIndex!122 (_keys!10309 thiss!1181) (_values!5488 thiss!1181) (mask!26321 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785) lt!407891)))

(declare-fun b!902505 () Bool)

(assert (=> b!902505 (= e!505360 (inRange!0 (index!37992 lt!407892) (mask!26321 thiss!1181)))))

(assert (= (and d!112173 (not res!609044)) b!902505))

(assert (=> d!112173 m!838967))

(declare-fun m!839147 () Bool)

(assert (=> d!112173 m!839147))

(assert (=> d!112173 m!839071))

(declare-fun m!839149 () Bool)

(assert (=> b!902505 m!839149))

(assert (=> b!902288 d!112173))

(declare-fun b!902518 () Bool)

(declare-fun e!505367 () SeekEntryResult!8905)

(declare-fun lt!407901 () SeekEntryResult!8905)

(assert (=> b!902518 (= e!505367 (MissingZero!8905 (index!37993 lt!407901)))))

(declare-fun b!902519 () Bool)

(declare-fun e!505368 () SeekEntryResult!8905)

(declare-fun e!505369 () SeekEntryResult!8905)

(assert (=> b!902519 (= e!505368 e!505369)))

(declare-fun lt!407902 () (_ BitVec 64))

(assert (=> b!902519 (= lt!407902 (select (arr!25414 (_keys!10309 thiss!1181)) (index!37993 lt!407901)))))

(declare-fun c!95795 () Bool)

(assert (=> b!902519 (= c!95795 (= lt!407902 key!785))))

(declare-fun b!902520 () Bool)

(assert (=> b!902520 (= e!505368 Undefined!8905)))

(declare-fun b!902521 () Bool)

(declare-fun lt!407903 () SeekEntryResult!8905)

(assert (=> b!902521 (= e!505367 (ite ((_ is MissingVacant!8905) lt!407903) (MissingZero!8905 (index!37994 lt!407903)) lt!407903))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52901 (_ BitVec 32)) SeekEntryResult!8905)

(assert (=> b!902521 (= lt!407903 (seekKeyOrZeroReturnVacant!0 (x!76770 lt!407901) (index!37993 lt!407901) (index!37993 lt!407901) key!785 (_keys!10309 thiss!1181) (mask!26321 thiss!1181)))))

(declare-fun d!112175 () Bool)

(declare-fun lt!407904 () SeekEntryResult!8905)

(assert (=> d!112175 (and (or ((_ is MissingVacant!8905) lt!407904) (not ((_ is Found!8905) lt!407904)) (and (bvsge (index!37992 lt!407904) #b00000000000000000000000000000000) (bvslt (index!37992 lt!407904) (size!25874 (_keys!10309 thiss!1181))))) (not ((_ is MissingVacant!8905) lt!407904)) (or (not ((_ is Found!8905) lt!407904)) (= (select (arr!25414 (_keys!10309 thiss!1181)) (index!37992 lt!407904)) key!785)))))

(assert (=> d!112175 (= lt!407904 e!505368)))

(declare-fun c!95794 () Bool)

(assert (=> d!112175 (= c!95794 (and ((_ is Intermediate!8905) lt!407901) (undefined!9717 lt!407901)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52901 (_ BitVec 32)) SeekEntryResult!8905)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112175 (= lt!407901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26321 thiss!1181)) key!785 (_keys!10309 thiss!1181) (mask!26321 thiss!1181)))))

(assert (=> d!112175 (validMask!0 (mask!26321 thiss!1181))))

(assert (=> d!112175 (= (seekEntry!0 key!785 (_keys!10309 thiss!1181) (mask!26321 thiss!1181)) lt!407904)))

(declare-fun b!902522 () Bool)

(declare-fun c!95793 () Bool)

(assert (=> b!902522 (= c!95793 (= lt!407902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!902522 (= e!505369 e!505367)))

(declare-fun b!902523 () Bool)

(assert (=> b!902523 (= e!505369 (Found!8905 (index!37993 lt!407901)))))

(assert (= (and d!112175 c!95794) b!902520))

(assert (= (and d!112175 (not c!95794)) b!902519))

(assert (= (and b!902519 c!95795) b!902523))

(assert (= (and b!902519 (not c!95795)) b!902522))

(assert (= (and b!902522 c!95793) b!902518))

(assert (= (and b!902522 (not c!95793)) b!902521))

(declare-fun m!839151 () Bool)

(assert (=> b!902519 m!839151))

(declare-fun m!839153 () Bool)

(assert (=> b!902521 m!839153))

(declare-fun m!839155 () Bool)

(assert (=> d!112175 m!839155))

(declare-fun m!839157 () Bool)

(assert (=> d!112175 m!839157))

(assert (=> d!112175 m!839157))

(declare-fun m!839159 () Bool)

(assert (=> d!112175 m!839159))

(assert (=> d!112175 m!839071))

(assert (=> b!902288 d!112175))

(declare-fun d!112177 () Bool)

(assert (=> d!112177 (= (inRange!0 (index!37992 lt!407759) (mask!26321 thiss!1181)) (and (bvsge (index!37992 lt!407759) #b00000000000000000000000000000000) (bvslt (index!37992 lt!407759) (bvadd (mask!26321 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!902289 d!112177))

(declare-fun b!902530 () Bool)

(declare-fun e!505374 () Bool)

(assert (=> b!902530 (= e!505374 tp_is_empty!18403)))

(declare-fun b!902531 () Bool)

(declare-fun e!505375 () Bool)

(assert (=> b!902531 (= e!505375 tp_is_empty!18403)))

(declare-fun mapIsEmpty!29299 () Bool)

(declare-fun mapRes!29299 () Bool)

(assert (=> mapIsEmpty!29299 mapRes!29299))

(declare-fun condMapEmpty!29299 () Bool)

(declare-fun mapDefault!29299 () ValueCell!8720)

(assert (=> mapNonEmpty!29290 (= condMapEmpty!29299 (= mapRest!29290 ((as const (Array (_ BitVec 32) ValueCell!8720)) mapDefault!29299)))))

(assert (=> mapNonEmpty!29290 (= tp!56326 (and e!505375 mapRes!29299))))

(declare-fun mapNonEmpty!29299 () Bool)

(declare-fun tp!56341 () Bool)

(assert (=> mapNonEmpty!29299 (= mapRes!29299 (and tp!56341 e!505374))))

(declare-fun mapRest!29299 () (Array (_ BitVec 32) ValueCell!8720))

(declare-fun mapKey!29299 () (_ BitVec 32))

(declare-fun mapValue!29299 () ValueCell!8720)

(assert (=> mapNonEmpty!29299 (= mapRest!29290 (store mapRest!29299 mapKey!29299 mapValue!29299))))

(assert (= (and mapNonEmpty!29290 condMapEmpty!29299) mapIsEmpty!29299))

(assert (= (and mapNonEmpty!29290 (not condMapEmpty!29299)) mapNonEmpty!29299))

(assert (= (and mapNonEmpty!29299 ((_ is ValueCellFull!8720) mapValue!29299)) b!902530))

(assert (= (and mapNonEmpty!29290 ((_ is ValueCellFull!8720) mapDefault!29299)) b!902531))

(declare-fun m!839161 () Bool)

(assert (=> mapNonEmpty!29299 m!839161))

(declare-fun b_lambda!13057 () Bool)

(assert (= b_lambda!13053 (or (and b!902282 b_free!16075) b_lambda!13057)))

(declare-fun b_lambda!13059 () Bool)

(assert (= b_lambda!13055 (or (and b!902282 b_free!16075) b_lambda!13059)))

(check-sat (not b!902418) (not b!902496) (not b!902469) (not b_lambda!13051) (not b!902494) (not b!902400) (not d!112153) b_and!26427 (not b!902505) (not b!902471) (not b!902466) (not bm!40204) (not b!902392) (not bm!40206) (not b!902480) (not bm!40203) (not d!112171) (not b!902394) (not bm!40207) (not b!902421) (not d!112157) (not b!902465) (not b!902521) (not b_next!16075) (not b!902474) (not b!902487) (not d!112159) (not b!902501) (not b!902502) (not d!112173) (not bm!40185) (not bm!40183) (not b!902484) (not d!112163) (not d!112175) (not b!902479) (not mapNonEmpty!29299) (not b!902495) (not d!112161) tp_is_empty!18403 (not b_lambda!13057) (not b_lambda!13059) (not d!112151))
(check-sat b_and!26427 (not b_next!16075))
