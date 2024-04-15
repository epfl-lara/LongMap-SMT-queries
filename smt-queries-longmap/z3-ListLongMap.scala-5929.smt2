; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77244 () Bool)

(assert start!77244)

(declare-fun b!901150 () Bool)

(declare-fun b_free!16075 () Bool)

(declare-fun b_next!16075 () Bool)

(assert (=> b!901150 (= b_free!16075 (not b_next!16075))))

(declare-fun tp!56326 () Bool)

(declare-fun b_and!26377 () Bool)

(assert (=> b!901150 (= tp!56326 b_and!26377)))

(declare-datatypes ((SeekEntryResult!8950 0))(
  ( (MissingZero!8950 (index!38171 (_ BitVec 32))) (Found!8950 (index!38172 (_ BitVec 32))) (Intermediate!8950 (undefined!9762 Bool) (index!38173 (_ BitVec 32)) (x!76796 (_ BitVec 32))) (Undefined!8950) (MissingVacant!8950 (index!38174 (_ BitVec 32))) )
))
(declare-fun lt!407165 () SeekEntryResult!8950)

(declare-datatypes ((array!52845 0))(
  ( (array!52846 (arr!25391 (Array (_ BitVec 32) (_ BitVec 64))) (size!25852 (_ BitVec 32))) )
))
(declare-datatypes ((V!29503 0))(
  ( (V!29504 (val!9252 Int)) )
))
(declare-datatypes ((ValueCell!8720 0))(
  ( (ValueCellFull!8720 (v!11749 V!29503)) (EmptyCell!8720) )
))
(declare-datatypes ((array!52847 0))(
  ( (array!52848 (arr!25392 (Array (_ BitVec 32) ValueCell!8720)) (size!25853 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4456 0))(
  ( (LongMapFixedSize!4457 (defaultEntry!5468 Int) (mask!26271 (_ BitVec 32)) (extraKeys!5197 (_ BitVec 32)) (zeroValue!5301 V!29503) (minValue!5301 V!29503) (_size!2283 (_ BitVec 32)) (_keys!10276 array!52845) (_values!5488 array!52847) (_vacant!2283 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4456)

(declare-fun e!504473 () Bool)

(declare-fun b!901140 () Bool)

(declare-fun call!40093 () V!29503)

(declare-fun get!13362 (ValueCell!8720 V!29503) V!29503)

(declare-fun dynLambda!1309 (Int (_ BitVec 64)) V!29503)

(assert (=> b!901140 (= e!504473 (= call!40093 (get!13362 (select (arr!25392 (_values!5488 thiss!1181)) (index!38172 lt!407165)) (dynLambda!1309 (defaultEntry!5468 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!901141 () Bool)

(declare-fun res!608489 () Bool)

(declare-fun e!504480 () Bool)

(assert (=> b!901141 (=> (not res!608489) (not e!504480))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!901141 (= res!608489 (not (= key!785 (bvneg key!785))))))

(declare-fun b!901142 () Bool)

(declare-fun e!504472 () Bool)

(declare-fun tp_is_empty!18403 () Bool)

(assert (=> b!901142 (= e!504472 tp_is_empty!18403)))

(declare-fun bm!40090 () Bool)

(declare-fun call!40094 () V!29503)

(assert (=> bm!40090 (= call!40093 call!40094)))

(declare-fun b!901143 () Bool)

(declare-fun e!504477 () Bool)

(assert (=> b!901143 (= e!504477 (and (bvsge (index!38172 lt!407165) #b00000000000000000000000000000000) (bvslt (index!38172 lt!407165) (size!25853 (_values!5488 thiss!1181)))))))

(declare-fun e!504471 () Bool)

(assert (=> b!901143 e!504471))

(declare-fun c!95397 () Bool)

(assert (=> b!901143 (= c!95397 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!30556 0))(
  ( (Unit!30557) )
))
(declare-fun lt!407163 () Unit!30556)

(declare-fun lemmaKeyInListMapThenSameValueInArray!10 (array!52845 array!52847 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 64) (_ BitVec 32) Int) Unit!30556)

(assert (=> b!901143 (= lt!407163 (lemmaKeyInListMapThenSameValueInArray!10 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785 (index!38172 lt!407165) (defaultEntry!5468 thiss!1181)))))

(declare-datatypes ((tuple2!12096 0))(
  ( (tuple2!12097 (_1!6059 (_ BitVec 64)) (_2!6059 V!29503)) )
))
(declare-datatypes ((List!17885 0))(
  ( (Nil!17882) (Cons!17881 (h!19027 tuple2!12096) (t!25237 List!17885)) )
))
(declare-datatypes ((ListLongMap!10783 0))(
  ( (ListLongMap!10784 (toList!5407 List!17885)) )
))
(declare-fun lt!407162 () ListLongMap!10783)

(declare-fun contains!4413 (ListLongMap!10783 (_ BitVec 64)) Bool)

(assert (=> b!901143 (contains!4413 lt!407162 (select (arr!25391 (_keys!10276 thiss!1181)) (index!38172 lt!407165)))))

(declare-fun getCurrentListMap!2625 (array!52845 array!52847 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 32) Int) ListLongMap!10783)

(assert (=> b!901143 (= lt!407162 (getCurrentListMap!2625 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun lt!407164 () Unit!30556)

(declare-fun lemmaValidKeyInArrayIsInListMap!261 (array!52845 array!52847 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 32) Int) Unit!30556)

(assert (=> b!901143 (= lt!407164 (lemmaValidKeyInArrayIsInListMap!261 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) (index!38172 lt!407165) (defaultEntry!5468 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901143 (arrayContainsKey!0 (_keys!10276 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407161 () Unit!30556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52845 (_ BitVec 64) (_ BitVec 32)) Unit!30556)

(assert (=> b!901143 (= lt!407161 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10276 thiss!1181) key!785 (index!38172 lt!407165)))))

(declare-fun b!901144 () Bool)

(assert (=> b!901144 (= e!504480 (not e!504477))))

(declare-fun res!608490 () Bool)

(assert (=> b!901144 (=> res!608490 e!504477)))

(get-info :version)

(assert (=> b!901144 (= res!608490 (not ((_ is Found!8950) lt!407165)))))

(declare-fun e!504470 () Bool)

(assert (=> b!901144 e!504470))

(declare-fun res!608493 () Bool)

(assert (=> b!901144 (=> res!608493 e!504470)))

(assert (=> b!901144 (= res!608493 (not ((_ is Found!8950) lt!407165)))))

(declare-fun lt!407166 () Unit!30556)

(declare-fun lemmaSeekEntryGivesInRangeIndex!112 (array!52845 array!52847 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 64)) Unit!30556)

(assert (=> b!901144 (= lt!407166 (lemmaSeekEntryGivesInRangeIndex!112 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52845 (_ BitVec 32)) SeekEntryResult!8950)

(assert (=> b!901144 (= lt!407165 (seekEntry!0 key!785 (_keys!10276 thiss!1181) (mask!26271 thiss!1181)))))

(declare-fun b!901145 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901145 (= e!504470 (inRange!0 (index!38172 lt!407165) (mask!26271 thiss!1181)))))

(declare-fun b!901146 () Bool)

(declare-fun e!504476 () Bool)

(assert (=> b!901146 (= e!504476 (= call!40093 (minValue!5301 thiss!1181)))))

(declare-fun b!901147 () Bool)

(declare-fun res!608492 () Bool)

(assert (=> b!901147 (=> (not res!608492) (not e!504476))))

(assert (=> b!901147 (= res!608492 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!901147 (= e!504473 e!504476)))

(declare-fun b!901148 () Bool)

(declare-fun e!504478 () Bool)

(declare-fun mapRes!29290 () Bool)

(assert (=> b!901148 (= e!504478 (and e!504472 mapRes!29290))))

(declare-fun condMapEmpty!29290 () Bool)

(declare-fun mapDefault!29290 () ValueCell!8720)

(assert (=> b!901148 (= condMapEmpty!29290 (= (arr!25392 (_values!5488 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8720)) mapDefault!29290)))))

(declare-fun b!901149 () Bool)

(assert (=> b!901149 (= e!504471 e!504473)))

(declare-fun c!95396 () Bool)

(assert (=> b!901149 (= c!95396 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!504475 () Bool)

(declare-fun array_inv!19970 (array!52845) Bool)

(declare-fun array_inv!19971 (array!52847) Bool)

(assert (=> b!901150 (= e!504475 (and tp!56326 tp_is_empty!18403 (array_inv!19970 (_keys!10276 thiss!1181)) (array_inv!19971 (_values!5488 thiss!1181)) e!504478))))

(declare-fun mapNonEmpty!29290 () Bool)

(declare-fun tp!56325 () Bool)

(declare-fun e!504479 () Bool)

(assert (=> mapNonEmpty!29290 (= mapRes!29290 (and tp!56325 e!504479))))

(declare-fun mapKey!29290 () (_ BitVec 32))

(declare-fun mapRest!29290 () (Array (_ BitVec 32) ValueCell!8720))

(declare-fun mapValue!29290 () ValueCell!8720)

(assert (=> mapNonEmpty!29290 (= (arr!25392 (_values!5488 thiss!1181)) (store mapRest!29290 mapKey!29290 mapValue!29290))))

(declare-fun mapIsEmpty!29290 () Bool)

(assert (=> mapIsEmpty!29290 mapRes!29290))

(declare-fun b!901151 () Bool)

(assert (=> b!901151 (= e!504479 tp_is_empty!18403)))

(declare-fun bm!40091 () Bool)

(declare-fun apply!415 (ListLongMap!10783 (_ BitVec 64)) V!29503)

(assert (=> bm!40091 (= call!40094 (apply!415 lt!407162 key!785))))

(declare-fun res!608491 () Bool)

(assert (=> start!77244 (=> (not res!608491) (not e!504480))))

(declare-fun valid!1718 (LongMapFixedSize!4456) Bool)

(assert (=> start!77244 (= res!608491 (valid!1718 thiss!1181))))

(assert (=> start!77244 e!504480))

(assert (=> start!77244 e!504475))

(assert (=> start!77244 true))

(declare-fun b!901152 () Bool)

(declare-fun e!504469 () Bool)

(assert (=> b!901152 (= e!504469 (= call!40094 (zeroValue!5301 thiss!1181)))))

(declare-fun b!901153 () Bool)

(assert (=> b!901153 (= e!504471 e!504469)))

(declare-fun res!608494 () Bool)

(assert (=> b!901153 (= res!608494 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901153 (=> (not res!608494) (not e!504469))))

(assert (= (and start!77244 res!608491) b!901141))

(assert (= (and b!901141 res!608489) b!901144))

(assert (= (and b!901144 (not res!608493)) b!901145))

(assert (= (and b!901144 (not res!608490)) b!901143))

(assert (= (and b!901143 c!95397) b!901153))

(assert (= (and b!901143 (not c!95397)) b!901149))

(assert (= (and b!901153 res!608494) b!901152))

(assert (= (and b!901149 c!95396) b!901147))

(assert (= (and b!901149 (not c!95396)) b!901140))

(assert (= (and b!901147 res!608492) b!901146))

(assert (= (or b!901146 b!901140) bm!40090))

(assert (= (or b!901152 bm!40090) bm!40091))

(assert (= (and b!901148 condMapEmpty!29290) mapIsEmpty!29290))

(assert (= (and b!901148 (not condMapEmpty!29290)) mapNonEmpty!29290))

(assert (= (and mapNonEmpty!29290 ((_ is ValueCellFull!8720) mapValue!29290)) b!901151))

(assert (= (and b!901148 ((_ is ValueCellFull!8720) mapDefault!29290)) b!901142))

(assert (= b!901150 b!901148))

(assert (= start!77244 b!901150))

(declare-fun b_lambda!13013 () Bool)

(assert (=> (not b_lambda!13013) (not b!901140)))

(declare-fun t!25236 () Bool)

(declare-fun tb!5203 () Bool)

(assert (=> (and b!901150 (= (defaultEntry!5468 thiss!1181) (defaultEntry!5468 thiss!1181)) t!25236) tb!5203))

(declare-fun result!10197 () Bool)

(assert (=> tb!5203 (= result!10197 tp_is_empty!18403)))

(assert (=> b!901140 t!25236))

(declare-fun b_and!26379 () Bool)

(assert (= b_and!26377 (and (=> t!25236 result!10197) b_and!26379)))

(declare-fun m!836893 () Bool)

(assert (=> bm!40091 m!836893))

(declare-fun m!836895 () Bool)

(assert (=> b!901145 m!836895))

(declare-fun m!836897 () Bool)

(assert (=> b!901150 m!836897))

(declare-fun m!836899 () Bool)

(assert (=> b!901150 m!836899))

(declare-fun m!836901 () Bool)

(assert (=> b!901140 m!836901))

(declare-fun m!836903 () Bool)

(assert (=> b!901140 m!836903))

(assert (=> b!901140 m!836901))

(assert (=> b!901140 m!836903))

(declare-fun m!836905 () Bool)

(assert (=> b!901140 m!836905))

(declare-fun m!836907 () Bool)

(assert (=> b!901143 m!836907))

(declare-fun m!836909 () Bool)

(assert (=> b!901143 m!836909))

(declare-fun m!836911 () Bool)

(assert (=> b!901143 m!836911))

(declare-fun m!836913 () Bool)

(assert (=> b!901143 m!836913))

(declare-fun m!836915 () Bool)

(assert (=> b!901143 m!836915))

(declare-fun m!836917 () Bool)

(assert (=> b!901143 m!836917))

(assert (=> b!901143 m!836915))

(declare-fun m!836919 () Bool)

(assert (=> b!901143 m!836919))

(declare-fun m!836921 () Bool)

(assert (=> mapNonEmpty!29290 m!836921))

(declare-fun m!836923 () Bool)

(assert (=> b!901144 m!836923))

(declare-fun m!836925 () Bool)

(assert (=> b!901144 m!836925))

(declare-fun m!836927 () Bool)

(assert (=> start!77244 m!836927))

(check-sat (not b_lambda!13013) (not b!901144) (not b!901143) (not start!77244) (not bm!40091) tp_is_empty!18403 (not b!901145) (not b_next!16075) (not b!901150) (not b!901140) b_and!26379 (not mapNonEmpty!29290))
(check-sat b_and!26379 (not b_next!16075))
(get-model)

(declare-fun b_lambda!13019 () Bool)

(assert (= b_lambda!13013 (or (and b!901150 b_free!16075) b_lambda!13019)))

(check-sat (not b!901144) (not start!77244) (not bm!40091) tp_is_empty!18403 (not b!901145) (not b_next!16075) (not b!901150) (not b!901140) (not b!901143) (not b_lambda!13019) b_and!26379 (not mapNonEmpty!29290))
(check-sat b_and!26379 (not b_next!16075))
(get-model)

(declare-fun d!111631 () Bool)

(declare-datatypes ((Option!472 0))(
  ( (Some!471 (v!11752 V!29503)) (None!470) )
))
(declare-fun get!13364 (Option!472) V!29503)

(declare-fun getValueByKey!466 (List!17885 (_ BitVec 64)) Option!472)

(assert (=> d!111631 (= (apply!415 lt!407162 key!785) (get!13364 (getValueByKey!466 (toList!5407 lt!407162) key!785)))))

(declare-fun bs!25272 () Bool)

(assert (= bs!25272 d!111631))

(declare-fun m!837001 () Bool)

(assert (=> bs!25272 m!837001))

(assert (=> bs!25272 m!837001))

(declare-fun m!837003 () Bool)

(assert (=> bs!25272 m!837003))

(assert (=> bm!40091 d!111631))

(declare-fun d!111633 () Bool)

(declare-fun e!504555 () Bool)

(assert (=> d!111633 e!504555))

(declare-fun res!608533 () Bool)

(assert (=> d!111633 (=> (not res!608533) (not e!504555))))

(assert (=> d!111633 (= res!608533 (and (bvsge (index!38172 lt!407165) #b00000000000000000000000000000000) (bvslt (index!38172 lt!407165) (size!25852 (_keys!10276 thiss!1181)))))))

(declare-fun lt!407205 () Unit!30556)

(declare-fun choose!1529 (array!52845 array!52847 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 32) Int) Unit!30556)

(assert (=> d!111633 (= lt!407205 (choose!1529 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) (index!38172 lt!407165) (defaultEntry!5468 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!111633 (validMask!0 (mask!26271 thiss!1181))))

(assert (=> d!111633 (= (lemmaValidKeyInArrayIsInListMap!261 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) (index!38172 lt!407165) (defaultEntry!5468 thiss!1181)) lt!407205)))

(declare-fun b!901246 () Bool)

(assert (=> b!901246 (= e!504555 (contains!4413 (getCurrentListMap!2625 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)) (select (arr!25391 (_keys!10276 thiss!1181)) (index!38172 lt!407165))))))

(assert (= (and d!111633 res!608533) b!901246))

(declare-fun m!837005 () Bool)

(assert (=> d!111633 m!837005))

(declare-fun m!837007 () Bool)

(assert (=> d!111633 m!837007))

(assert (=> b!901246 m!836913))

(assert (=> b!901246 m!836915))

(assert (=> b!901246 m!836913))

(assert (=> b!901246 m!836915))

(declare-fun m!837009 () Bool)

(assert (=> b!901246 m!837009))

(assert (=> b!901143 d!111633))

(declare-fun d!111635 () Bool)

(declare-fun e!504560 () Bool)

(assert (=> d!111635 e!504560))

(declare-fun res!608536 () Bool)

(assert (=> d!111635 (=> res!608536 e!504560)))

(declare-fun lt!407216 () Bool)

(assert (=> d!111635 (= res!608536 (not lt!407216))))

(declare-fun lt!407214 () Bool)

(assert (=> d!111635 (= lt!407216 lt!407214)))

(declare-fun lt!407215 () Unit!30556)

(declare-fun e!504561 () Unit!30556)

(assert (=> d!111635 (= lt!407215 e!504561)))

(declare-fun c!95412 () Bool)

(assert (=> d!111635 (= c!95412 lt!407214)))

(declare-fun containsKey!434 (List!17885 (_ BitVec 64)) Bool)

(assert (=> d!111635 (= lt!407214 (containsKey!434 (toList!5407 lt!407162) (select (arr!25391 (_keys!10276 thiss!1181)) (index!38172 lt!407165))))))

(assert (=> d!111635 (= (contains!4413 lt!407162 (select (arr!25391 (_keys!10276 thiss!1181)) (index!38172 lt!407165))) lt!407216)))

(declare-fun b!901253 () Bool)

(declare-fun lt!407217 () Unit!30556)

(assert (=> b!901253 (= e!504561 lt!407217)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!329 (List!17885 (_ BitVec 64)) Unit!30556)

(assert (=> b!901253 (= lt!407217 (lemmaContainsKeyImpliesGetValueByKeyDefined!329 (toList!5407 lt!407162) (select (arr!25391 (_keys!10276 thiss!1181)) (index!38172 lt!407165))))))

(declare-fun isDefined!342 (Option!472) Bool)

(assert (=> b!901253 (isDefined!342 (getValueByKey!466 (toList!5407 lt!407162) (select (arr!25391 (_keys!10276 thiss!1181)) (index!38172 lt!407165))))))

(declare-fun b!901254 () Bool)

(declare-fun Unit!30560 () Unit!30556)

(assert (=> b!901254 (= e!504561 Unit!30560)))

(declare-fun b!901255 () Bool)

(assert (=> b!901255 (= e!504560 (isDefined!342 (getValueByKey!466 (toList!5407 lt!407162) (select (arr!25391 (_keys!10276 thiss!1181)) (index!38172 lt!407165)))))))

(assert (= (and d!111635 c!95412) b!901253))

(assert (= (and d!111635 (not c!95412)) b!901254))

(assert (= (and d!111635 (not res!608536)) b!901255))

(assert (=> d!111635 m!836915))

(declare-fun m!837011 () Bool)

(assert (=> d!111635 m!837011))

(assert (=> b!901253 m!836915))

(declare-fun m!837013 () Bool)

(assert (=> b!901253 m!837013))

(assert (=> b!901253 m!836915))

(declare-fun m!837015 () Bool)

(assert (=> b!901253 m!837015))

(assert (=> b!901253 m!837015))

(declare-fun m!837017 () Bool)

(assert (=> b!901253 m!837017))

(assert (=> b!901255 m!836915))

(assert (=> b!901255 m!837015))

(assert (=> b!901255 m!837015))

(assert (=> b!901255 m!837017))

(assert (=> b!901143 d!111635))

(declare-fun d!111637 () Bool)

(declare-fun e!504573 () Bool)

(assert (=> d!111637 e!504573))

(declare-fun c!95418 () Bool)

(assert (=> d!111637 (= c!95418 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!407220 () Unit!30556)

(declare-fun choose!1530 (array!52845 array!52847 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 64) (_ BitVec 32) Int) Unit!30556)

(assert (=> d!111637 (= lt!407220 (choose!1530 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785 (index!38172 lt!407165) (defaultEntry!5468 thiss!1181)))))

(assert (=> d!111637 (validMask!0 (mask!26271 thiss!1181))))

(assert (=> d!111637 (= (lemmaKeyInListMapThenSameValueInArray!10 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785 (index!38172 lt!407165) (defaultEntry!5468 thiss!1181)) lt!407220)))

(declare-fun call!40118 () ListLongMap!10783)

(declare-fun call!40117 () V!29503)

(declare-fun call!40115 () ListLongMap!10783)

(declare-fun bm!40112 () Bool)

(assert (=> bm!40112 (= call!40117 (apply!415 (ite c!95418 call!40118 call!40115) key!785))))

(declare-fun b!901270 () Bool)

(declare-fun e!504574 () Bool)

(assert (=> b!901270 (= e!504574 (= call!40117 (zeroValue!5301 thiss!1181)))))

(declare-fun bm!40113 () Bool)

(assert (=> bm!40113 (= call!40115 call!40118)))

(declare-fun b!901271 () Bool)

(declare-fun e!504575 () Bool)

(declare-fun call!40116 () V!29503)

(assert (=> b!901271 (= e!504575 (= call!40116 (minValue!5301 thiss!1181)))))

(declare-fun bm!40114 () Bool)

(assert (=> bm!40114 (= call!40118 (getCurrentListMap!2625 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun b!901272 () Bool)

(declare-fun res!608543 () Bool)

(assert (=> b!901272 (=> (not res!608543) (not e!504575))))

(assert (=> b!901272 (= res!608543 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!504576 () Bool)

(assert (=> b!901272 (= e!504576 e!504575)))

(declare-fun b!901273 () Bool)

(declare-fun e!504572 () Bool)

(assert (=> b!901273 (= e!504572 (= call!40116 (get!13362 (select (arr!25392 (_values!5488 thiss!1181)) (index!38172 lt!407165)) (dynLambda!1309 (defaultEntry!5468 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901273 (and (bvsge (index!38172 lt!407165) #b00000000000000000000000000000000) (bvslt (index!38172 lt!407165) (size!25853 (_values!5488 thiss!1181))))))

(declare-fun b!901274 () Bool)

(assert (=> b!901274 (= e!504573 e!504574)))

(declare-fun res!608545 () Bool)

(assert (=> b!901274 (= res!608545 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901274 (=> (not res!608545) (not e!504574))))

(declare-fun b!901275 () Bool)

(assert (=> b!901275 (= e!504573 e!504576)))

(declare-fun c!95417 () Bool)

(assert (=> b!901275 (= c!95417 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40115 () Bool)

(assert (=> bm!40115 (= call!40116 call!40117)))

(declare-fun b!901276 () Bool)

(declare-fun res!608544 () Bool)

(assert (=> b!901276 (=> (not res!608544) (not e!504572))))

(assert (=> b!901276 (= res!608544 (arrayContainsKey!0 (_keys!10276 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (=> b!901276 (= e!504576 e!504572)))

(assert (= (and d!111637 c!95418) b!901274))

(assert (= (and d!111637 (not c!95418)) b!901275))

(assert (= (and b!901274 res!608545) b!901270))

(assert (= (and b!901275 c!95417) b!901272))

(assert (= (and b!901275 (not c!95417)) b!901276))

(assert (= (and b!901272 res!608543) b!901271))

(assert (= (and b!901276 res!608544) b!901273))

(assert (= (or b!901271 b!901273) bm!40113))

(assert (= (or b!901271 b!901273) bm!40115))

(assert (= (or b!901270 bm!40113) bm!40114))

(assert (= (or b!901270 bm!40115) bm!40112))

(declare-fun b_lambda!13021 () Bool)

(assert (=> (not b_lambda!13021) (not b!901273)))

(assert (=> b!901273 t!25236))

(declare-fun b_and!26389 () Bool)

(assert (= b_and!26379 (and (=> t!25236 result!10197) b_and!26389)))

(assert (=> bm!40114 m!836913))

(declare-fun m!837019 () Bool)

(assert (=> d!111637 m!837019))

(assert (=> d!111637 m!837007))

(declare-fun m!837021 () Bool)

(assert (=> bm!40112 m!837021))

(assert (=> b!901276 m!836911))

(assert (=> b!901273 m!836901))

(assert (=> b!901273 m!836903))

(assert (=> b!901273 m!836901))

(assert (=> b!901273 m!836903))

(assert (=> b!901273 m!836905))

(assert (=> b!901143 d!111637))

(declare-fun d!111639 () Bool)

(assert (=> d!111639 (arrayContainsKey!0 (_keys!10276 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407223 () Unit!30556)

(declare-fun choose!13 (array!52845 (_ BitVec 64) (_ BitVec 32)) Unit!30556)

(assert (=> d!111639 (= lt!407223 (choose!13 (_keys!10276 thiss!1181) key!785 (index!38172 lt!407165)))))

(assert (=> d!111639 (bvsge (index!38172 lt!407165) #b00000000000000000000000000000000)))

(assert (=> d!111639 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10276 thiss!1181) key!785 (index!38172 lt!407165)) lt!407223)))

(declare-fun bs!25273 () Bool)

(assert (= bs!25273 d!111639))

(assert (=> bs!25273 m!836911))

(declare-fun m!837023 () Bool)

(assert (=> bs!25273 m!837023))

(assert (=> b!901143 d!111639))

(declare-fun d!111641 () Bool)

(declare-fun res!608550 () Bool)

(declare-fun e!504581 () Bool)

(assert (=> d!111641 (=> res!608550 e!504581)))

(assert (=> d!111641 (= res!608550 (= (select (arr!25391 (_keys!10276 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111641 (= (arrayContainsKey!0 (_keys!10276 thiss!1181) key!785 #b00000000000000000000000000000000) e!504581)))

(declare-fun b!901281 () Bool)

(declare-fun e!504582 () Bool)

(assert (=> b!901281 (= e!504581 e!504582)))

(declare-fun res!608551 () Bool)

(assert (=> b!901281 (=> (not res!608551) (not e!504582))))

(assert (=> b!901281 (= res!608551 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25852 (_keys!10276 thiss!1181))))))

(declare-fun b!901282 () Bool)

(assert (=> b!901282 (= e!504582 (arrayContainsKey!0 (_keys!10276 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111641 (not res!608550)) b!901281))

(assert (= (and b!901281 res!608551) b!901282))

(declare-fun m!837025 () Bool)

(assert (=> d!111641 m!837025))

(declare-fun m!837027 () Bool)

(assert (=> b!901282 m!837027))

(assert (=> b!901143 d!111641))

(declare-fun b!901325 () Bool)

(declare-fun e!504621 () Unit!30556)

(declare-fun Unit!30561 () Unit!30556)

(assert (=> b!901325 (= e!504621 Unit!30561)))

(declare-fun b!901326 () Bool)

(declare-fun e!504620 () Bool)

(declare-fun lt!407271 () ListLongMap!10783)

(assert (=> b!901326 (= e!504620 (= (apply!415 lt!407271 (select (arr!25391 (_keys!10276 thiss!1181)) #b00000000000000000000000000000000)) (get!13362 (select (arr!25392 (_values!5488 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1309 (defaultEntry!5468 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901326 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25853 (_values!5488 thiss!1181))))))

(assert (=> b!901326 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25852 (_keys!10276 thiss!1181))))))

(declare-fun b!901327 () Bool)

(declare-fun e!504612 () Bool)

(assert (=> b!901327 (= e!504612 e!504620)))

(declare-fun res!608578 () Bool)

(assert (=> b!901327 (=> (not res!608578) (not e!504620))))

(assert (=> b!901327 (= res!608578 (contains!4413 lt!407271 (select (arr!25391 (_keys!10276 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!901327 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25852 (_keys!10276 thiss!1181))))))

(declare-fun b!901328 () Bool)

(declare-fun e!504618 () ListLongMap!10783)

(declare-fun call!40138 () ListLongMap!10783)

(assert (=> b!901328 (= e!504618 call!40138)))

(declare-fun d!111643 () Bool)

(declare-fun e!504615 () Bool)

(assert (=> d!111643 e!504615))

(declare-fun res!608575 () Bool)

(assert (=> d!111643 (=> (not res!608575) (not e!504615))))

(assert (=> d!111643 (= res!608575 (or (bvsge #b00000000000000000000000000000000 (size!25852 (_keys!10276 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25852 (_keys!10276 thiss!1181))))))))

(declare-fun lt!407285 () ListLongMap!10783)

(assert (=> d!111643 (= lt!407271 lt!407285)))

(declare-fun lt!407269 () Unit!30556)

(assert (=> d!111643 (= lt!407269 e!504621)))

(declare-fun c!95432 () Bool)

(declare-fun e!504619 () Bool)

(assert (=> d!111643 (= c!95432 e!504619)))

(declare-fun res!608577 () Bool)

(assert (=> d!111643 (=> (not res!608577) (not e!504619))))

(assert (=> d!111643 (= res!608577 (bvslt #b00000000000000000000000000000000 (size!25852 (_keys!10276 thiss!1181))))))

(declare-fun e!504613 () ListLongMap!10783)

(assert (=> d!111643 (= lt!407285 e!504613)))

(declare-fun c!95433 () Bool)

(assert (=> d!111643 (= c!95433 (and (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111643 (validMask!0 (mask!26271 thiss!1181))))

(assert (=> d!111643 (= (getCurrentListMap!2625 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)) lt!407271)))

(declare-fun b!901329 () Bool)

(declare-fun e!504616 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!901329 (= e!504616 (validKeyInArray!0 (select (arr!25391 (_keys!10276 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901330 () Bool)

(declare-fun e!504610 () Bool)

(declare-fun e!504617 () Bool)

(assert (=> b!901330 (= e!504610 e!504617)))

(declare-fun res!608573 () Bool)

(declare-fun call!40134 () Bool)

(assert (=> b!901330 (= res!608573 call!40134)))

(assert (=> b!901330 (=> (not res!608573) (not e!504617))))

(declare-fun b!901331 () Bool)

(declare-fun e!504609 () ListLongMap!10783)

(assert (=> b!901331 (= e!504609 call!40138)))

(declare-fun b!901332 () Bool)

(assert (=> b!901332 (= e!504610 (not call!40134))))

(declare-fun b!901333 () Bool)

(declare-fun lt!407286 () Unit!30556)

(assert (=> b!901333 (= e!504621 lt!407286)))

(declare-fun lt!407283 () ListLongMap!10783)

(declare-fun getCurrentListMapNoExtraKeys!3323 (array!52845 array!52847 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 32) Int) ListLongMap!10783)

(assert (=> b!901333 (= lt!407283 (getCurrentListMapNoExtraKeys!3323 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun lt!407282 () (_ BitVec 64))

(assert (=> b!901333 (= lt!407282 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407280 () (_ BitVec 64))

(assert (=> b!901333 (= lt!407280 (select (arr!25391 (_keys!10276 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407276 () Unit!30556)

(declare-fun addStillContains!341 (ListLongMap!10783 (_ BitVec 64) V!29503 (_ BitVec 64)) Unit!30556)

(assert (=> b!901333 (= lt!407276 (addStillContains!341 lt!407283 lt!407282 (zeroValue!5301 thiss!1181) lt!407280))))

(declare-fun +!2626 (ListLongMap!10783 tuple2!12096) ListLongMap!10783)

(assert (=> b!901333 (contains!4413 (+!2626 lt!407283 (tuple2!12097 lt!407282 (zeroValue!5301 thiss!1181))) lt!407280)))

(declare-fun lt!407268 () Unit!30556)

(assert (=> b!901333 (= lt!407268 lt!407276)))

(declare-fun lt!407284 () ListLongMap!10783)

(assert (=> b!901333 (= lt!407284 (getCurrentListMapNoExtraKeys!3323 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun lt!407277 () (_ BitVec 64))

(assert (=> b!901333 (= lt!407277 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407273 () (_ BitVec 64))

(assert (=> b!901333 (= lt!407273 (select (arr!25391 (_keys!10276 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407288 () Unit!30556)

(declare-fun addApplyDifferent!341 (ListLongMap!10783 (_ BitVec 64) V!29503 (_ BitVec 64)) Unit!30556)

(assert (=> b!901333 (= lt!407288 (addApplyDifferent!341 lt!407284 lt!407277 (minValue!5301 thiss!1181) lt!407273))))

(assert (=> b!901333 (= (apply!415 (+!2626 lt!407284 (tuple2!12097 lt!407277 (minValue!5301 thiss!1181))) lt!407273) (apply!415 lt!407284 lt!407273))))

(declare-fun lt!407275 () Unit!30556)

(assert (=> b!901333 (= lt!407275 lt!407288)))

(declare-fun lt!407281 () ListLongMap!10783)

(assert (=> b!901333 (= lt!407281 (getCurrentListMapNoExtraKeys!3323 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun lt!407272 () (_ BitVec 64))

(assert (=> b!901333 (= lt!407272 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407279 () (_ BitVec 64))

(assert (=> b!901333 (= lt!407279 (select (arr!25391 (_keys!10276 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407270 () Unit!30556)

(assert (=> b!901333 (= lt!407270 (addApplyDifferent!341 lt!407281 lt!407272 (zeroValue!5301 thiss!1181) lt!407279))))

(assert (=> b!901333 (= (apply!415 (+!2626 lt!407281 (tuple2!12097 lt!407272 (zeroValue!5301 thiss!1181))) lt!407279) (apply!415 lt!407281 lt!407279))))

(declare-fun lt!407274 () Unit!30556)

(assert (=> b!901333 (= lt!407274 lt!407270)))

(declare-fun lt!407278 () ListLongMap!10783)

(assert (=> b!901333 (= lt!407278 (getCurrentListMapNoExtraKeys!3323 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun lt!407287 () (_ BitVec 64))

(assert (=> b!901333 (= lt!407287 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407289 () (_ BitVec 64))

(assert (=> b!901333 (= lt!407289 (select (arr!25391 (_keys!10276 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901333 (= lt!407286 (addApplyDifferent!341 lt!407278 lt!407287 (minValue!5301 thiss!1181) lt!407289))))

(assert (=> b!901333 (= (apply!415 (+!2626 lt!407278 (tuple2!12097 lt!407287 (minValue!5301 thiss!1181))) lt!407289) (apply!415 lt!407278 lt!407289))))

(declare-fun b!901334 () Bool)

(assert (=> b!901334 (= e!504619 (validKeyInArray!0 (select (arr!25391 (_keys!10276 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901335 () Bool)

(declare-fun e!504611 () Bool)

(assert (=> b!901335 (= e!504611 (= (apply!415 lt!407271 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5301 thiss!1181)))))

(declare-fun b!901336 () Bool)

(declare-fun res!608572 () Bool)

(assert (=> b!901336 (=> (not res!608572) (not e!504615))))

(declare-fun e!504614 () Bool)

(assert (=> b!901336 (= res!608572 e!504614)))

(declare-fun c!95435 () Bool)

(assert (=> b!901336 (= c!95435 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!901337 () Bool)

(declare-fun c!95431 () Bool)

(assert (=> b!901337 (= c!95431 (and (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901337 (= e!504618 e!504609)))

(declare-fun bm!40130 () Bool)

(declare-fun call!40139 () ListLongMap!10783)

(assert (=> bm!40130 (= call!40139 (getCurrentListMapNoExtraKeys!3323 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun b!901338 () Bool)

(assert (=> b!901338 (= e!504615 e!504610)))

(declare-fun c!95434 () Bool)

(assert (=> b!901338 (= c!95434 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901339 () Bool)

(declare-fun res!608570 () Bool)

(assert (=> b!901339 (=> (not res!608570) (not e!504615))))

(assert (=> b!901339 (= res!608570 e!504612)))

(declare-fun res!608574 () Bool)

(assert (=> b!901339 (=> res!608574 e!504612)))

(assert (=> b!901339 (= res!608574 (not e!504616))))

(declare-fun res!608571 () Bool)

(assert (=> b!901339 (=> (not res!608571) (not e!504616))))

(assert (=> b!901339 (= res!608571 (bvslt #b00000000000000000000000000000000 (size!25852 (_keys!10276 thiss!1181))))))

(declare-fun bm!40131 () Bool)

(assert (=> bm!40131 (= call!40134 (contains!4413 lt!407271 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40132 () Bool)

(declare-fun call!40137 () ListLongMap!10783)

(declare-fun call!40133 () ListLongMap!10783)

(declare-fun c!95436 () Bool)

(declare-fun call!40136 () ListLongMap!10783)

(assert (=> bm!40132 (= call!40136 (+!2626 (ite c!95433 call!40139 (ite c!95436 call!40133 call!40137)) (ite (or c!95433 c!95436) (tuple2!12097 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5301 thiss!1181)) (tuple2!12097 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5301 thiss!1181)))))))

(declare-fun b!901340 () Bool)

(assert (=> b!901340 (= e!504614 e!504611)))

(declare-fun res!608576 () Bool)

(declare-fun call!40135 () Bool)

(assert (=> b!901340 (= res!608576 call!40135)))

(assert (=> b!901340 (=> (not res!608576) (not e!504611))))

(declare-fun bm!40133 () Bool)

(assert (=> bm!40133 (= call!40133 call!40139)))

(declare-fun b!901341 () Bool)

(assert (=> b!901341 (= e!504614 (not call!40135))))

(declare-fun bm!40134 () Bool)

(assert (=> bm!40134 (= call!40138 call!40136)))

(declare-fun b!901342 () Bool)

(assert (=> b!901342 (= e!504613 (+!2626 call!40136 (tuple2!12097 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5301 thiss!1181))))))

(declare-fun b!901343 () Bool)

(assert (=> b!901343 (= e!504609 call!40137)))

(declare-fun bm!40135 () Bool)

(assert (=> bm!40135 (= call!40135 (contains!4413 lt!407271 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901344 () Bool)

(assert (=> b!901344 (= e!504617 (= (apply!415 lt!407271 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5301 thiss!1181)))))

(declare-fun b!901345 () Bool)

(assert (=> b!901345 (= e!504613 e!504618)))

(assert (=> b!901345 (= c!95436 (and (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40136 () Bool)

(assert (=> bm!40136 (= call!40137 call!40133)))

(assert (= (and d!111643 c!95433) b!901342))

(assert (= (and d!111643 (not c!95433)) b!901345))

(assert (= (and b!901345 c!95436) b!901328))

(assert (= (and b!901345 (not c!95436)) b!901337))

(assert (= (and b!901337 c!95431) b!901331))

(assert (= (and b!901337 (not c!95431)) b!901343))

(assert (= (or b!901331 b!901343) bm!40136))

(assert (= (or b!901328 bm!40136) bm!40133))

(assert (= (or b!901328 b!901331) bm!40134))

(assert (= (or b!901342 bm!40133) bm!40130))

(assert (= (or b!901342 bm!40134) bm!40132))

(assert (= (and d!111643 res!608577) b!901334))

(assert (= (and d!111643 c!95432) b!901333))

(assert (= (and d!111643 (not c!95432)) b!901325))

(assert (= (and d!111643 res!608575) b!901339))

(assert (= (and b!901339 res!608571) b!901329))

(assert (= (and b!901339 (not res!608574)) b!901327))

(assert (= (and b!901327 res!608578) b!901326))

(assert (= (and b!901339 res!608570) b!901336))

(assert (= (and b!901336 c!95435) b!901340))

(assert (= (and b!901336 (not c!95435)) b!901341))

(assert (= (and b!901340 res!608576) b!901335))

(assert (= (or b!901340 b!901341) bm!40135))

(assert (= (and b!901336 res!608572) b!901338))

(assert (= (and b!901338 c!95434) b!901330))

(assert (= (and b!901338 (not c!95434)) b!901332))

(assert (= (and b!901330 res!608573) b!901344))

(assert (= (or b!901330 b!901332) bm!40131))

(declare-fun b_lambda!13023 () Bool)

(assert (=> (not b_lambda!13023) (not b!901326)))

(assert (=> b!901326 t!25236))

(declare-fun b_and!26391 () Bool)

(assert (= b_and!26389 (and (=> t!25236 result!10197) b_and!26391)))

(assert (=> d!111643 m!837007))

(assert (=> b!901327 m!837025))

(assert (=> b!901327 m!837025))

(declare-fun m!837029 () Bool)

(assert (=> b!901327 m!837029))

(declare-fun m!837031 () Bool)

(assert (=> b!901333 m!837031))

(assert (=> b!901333 m!837025))

(declare-fun m!837033 () Bool)

(assert (=> b!901333 m!837033))

(declare-fun m!837035 () Bool)

(assert (=> b!901333 m!837035))

(declare-fun m!837037 () Bool)

(assert (=> b!901333 m!837037))

(declare-fun m!837039 () Bool)

(assert (=> b!901333 m!837039))

(declare-fun m!837041 () Bool)

(assert (=> b!901333 m!837041))

(declare-fun m!837043 () Bool)

(assert (=> b!901333 m!837043))

(declare-fun m!837045 () Bool)

(assert (=> b!901333 m!837045))

(declare-fun m!837047 () Bool)

(assert (=> b!901333 m!837047))

(declare-fun m!837049 () Bool)

(assert (=> b!901333 m!837049))

(assert (=> b!901333 m!837043))

(declare-fun m!837051 () Bool)

(assert (=> b!901333 m!837051))

(declare-fun m!837053 () Bool)

(assert (=> b!901333 m!837053))

(declare-fun m!837055 () Bool)

(assert (=> b!901333 m!837055))

(assert (=> b!901333 m!837035))

(declare-fun m!837057 () Bool)

(assert (=> b!901333 m!837057))

(assert (=> b!901333 m!837033))

(declare-fun m!837059 () Bool)

(assert (=> b!901333 m!837059))

(assert (=> b!901333 m!837039))

(declare-fun m!837061 () Bool)

(assert (=> b!901333 m!837061))

(declare-fun m!837063 () Bool)

(assert (=> bm!40132 m!837063))

(assert (=> bm!40130 m!837045))

(assert (=> b!901329 m!837025))

(assert (=> b!901329 m!837025))

(declare-fun m!837065 () Bool)

(assert (=> b!901329 m!837065))

(assert (=> b!901326 m!836903))

(assert (=> b!901326 m!837025))

(declare-fun m!837067 () Bool)

(assert (=> b!901326 m!837067))

(assert (=> b!901326 m!836903))

(declare-fun m!837069 () Bool)

(assert (=> b!901326 m!837069))

(assert (=> b!901326 m!837025))

(declare-fun m!837071 () Bool)

(assert (=> b!901326 m!837071))

(assert (=> b!901326 m!837067))

(declare-fun m!837073 () Bool)

(assert (=> b!901335 m!837073))

(declare-fun m!837075 () Bool)

(assert (=> bm!40131 m!837075))

(assert (=> b!901334 m!837025))

(assert (=> b!901334 m!837025))

(assert (=> b!901334 m!837065))

(declare-fun m!837077 () Bool)

(assert (=> bm!40135 m!837077))

(declare-fun m!837079 () Bool)

(assert (=> b!901344 m!837079))

(declare-fun m!837081 () Bool)

(assert (=> b!901342 m!837081))

(assert (=> b!901143 d!111643))

(declare-fun d!111645 () Bool)

(declare-fun e!504624 () Bool)

(assert (=> d!111645 e!504624))

(declare-fun res!608581 () Bool)

(assert (=> d!111645 (=> res!608581 e!504624)))

(declare-fun lt!407295 () SeekEntryResult!8950)

(assert (=> d!111645 (= res!608581 (not ((_ is Found!8950) lt!407295)))))

(assert (=> d!111645 (= lt!407295 (seekEntry!0 key!785 (_keys!10276 thiss!1181) (mask!26271 thiss!1181)))))

(declare-fun lt!407294 () Unit!30556)

(declare-fun choose!1531 (array!52845 array!52847 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 64)) Unit!30556)

(assert (=> d!111645 (= lt!407294 (choose!1531 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785))))

(assert (=> d!111645 (validMask!0 (mask!26271 thiss!1181))))

(assert (=> d!111645 (= (lemmaSeekEntryGivesInRangeIndex!112 (_keys!10276 thiss!1181) (_values!5488 thiss!1181) (mask!26271 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785) lt!407294)))

(declare-fun b!901348 () Bool)

(assert (=> b!901348 (= e!504624 (inRange!0 (index!38172 lt!407295) (mask!26271 thiss!1181)))))

(assert (= (and d!111645 (not res!608581)) b!901348))

(assert (=> d!111645 m!836925))

(declare-fun m!837083 () Bool)

(assert (=> d!111645 m!837083))

(assert (=> d!111645 m!837007))

(declare-fun m!837085 () Bool)

(assert (=> b!901348 m!837085))

(assert (=> b!901144 d!111645))

(declare-fun b!901361 () Bool)

(declare-fun e!504632 () SeekEntryResult!8950)

(declare-fun lt!407307 () SeekEntryResult!8950)

(assert (=> b!901361 (= e!504632 (Found!8950 (index!38173 lt!407307)))))

(declare-fun b!901362 () Bool)

(declare-fun e!504633 () SeekEntryResult!8950)

(assert (=> b!901362 (= e!504633 (MissingZero!8950 (index!38173 lt!407307)))))

(declare-fun b!901363 () Bool)

(declare-fun lt!407305 () SeekEntryResult!8950)

(assert (=> b!901363 (= e!504633 (ite ((_ is MissingVacant!8950) lt!407305) (MissingZero!8950 (index!38174 lt!407305)) lt!407305))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52845 (_ BitVec 32)) SeekEntryResult!8950)

(assert (=> b!901363 (= lt!407305 (seekKeyOrZeroReturnVacant!0 (x!76796 lt!407307) (index!38173 lt!407307) (index!38173 lt!407307) key!785 (_keys!10276 thiss!1181) (mask!26271 thiss!1181)))))

(declare-fun b!901364 () Bool)

(declare-fun e!504631 () SeekEntryResult!8950)

(assert (=> b!901364 (= e!504631 e!504632)))

(declare-fun lt!407304 () (_ BitVec 64))

(assert (=> b!901364 (= lt!407304 (select (arr!25391 (_keys!10276 thiss!1181)) (index!38173 lt!407307)))))

(declare-fun c!95444 () Bool)

(assert (=> b!901364 (= c!95444 (= lt!407304 key!785))))

(declare-fun b!901365 () Bool)

(declare-fun c!95445 () Bool)

(assert (=> b!901365 (= c!95445 (= lt!407304 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!901365 (= e!504632 e!504633)))

(declare-fun d!111647 () Bool)

(declare-fun lt!407306 () SeekEntryResult!8950)

(assert (=> d!111647 (and (or ((_ is MissingVacant!8950) lt!407306) (not ((_ is Found!8950) lt!407306)) (and (bvsge (index!38172 lt!407306) #b00000000000000000000000000000000) (bvslt (index!38172 lt!407306) (size!25852 (_keys!10276 thiss!1181))))) (not ((_ is MissingVacant!8950) lt!407306)) (or (not ((_ is Found!8950) lt!407306)) (= (select (arr!25391 (_keys!10276 thiss!1181)) (index!38172 lt!407306)) key!785)))))

(assert (=> d!111647 (= lt!407306 e!504631)))

(declare-fun c!95443 () Bool)

(assert (=> d!111647 (= c!95443 (and ((_ is Intermediate!8950) lt!407307) (undefined!9762 lt!407307)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52845 (_ BitVec 32)) SeekEntryResult!8950)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111647 (= lt!407307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26271 thiss!1181)) key!785 (_keys!10276 thiss!1181) (mask!26271 thiss!1181)))))

(assert (=> d!111647 (validMask!0 (mask!26271 thiss!1181))))

(assert (=> d!111647 (= (seekEntry!0 key!785 (_keys!10276 thiss!1181) (mask!26271 thiss!1181)) lt!407306)))

(declare-fun b!901366 () Bool)

(assert (=> b!901366 (= e!504631 Undefined!8950)))

(assert (= (and d!111647 c!95443) b!901366))

(assert (= (and d!111647 (not c!95443)) b!901364))

(assert (= (and b!901364 c!95444) b!901361))

(assert (= (and b!901364 (not c!95444)) b!901365))

(assert (= (and b!901365 c!95445) b!901362))

(assert (= (and b!901365 (not c!95445)) b!901363))

(declare-fun m!837087 () Bool)

(assert (=> b!901363 m!837087))

(declare-fun m!837089 () Bool)

(assert (=> b!901364 m!837089))

(declare-fun m!837091 () Bool)

(assert (=> d!111647 m!837091))

(declare-fun m!837093 () Bool)

(assert (=> d!111647 m!837093))

(assert (=> d!111647 m!837093))

(declare-fun m!837095 () Bool)

(assert (=> d!111647 m!837095))

(assert (=> d!111647 m!837007))

(assert (=> b!901144 d!111647))

(declare-fun d!111649 () Bool)

(declare-fun c!95448 () Bool)

(assert (=> d!111649 (= c!95448 ((_ is ValueCellFull!8720) (select (arr!25392 (_values!5488 thiss!1181)) (index!38172 lt!407165))))))

(declare-fun e!504636 () V!29503)

(assert (=> d!111649 (= (get!13362 (select (arr!25392 (_values!5488 thiss!1181)) (index!38172 lt!407165)) (dynLambda!1309 (defaultEntry!5468 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!504636)))

(declare-fun b!901371 () Bool)

(declare-fun get!13365 (ValueCell!8720 V!29503) V!29503)

(assert (=> b!901371 (= e!504636 (get!13365 (select (arr!25392 (_values!5488 thiss!1181)) (index!38172 lt!407165)) (dynLambda!1309 (defaultEntry!5468 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!901372 () Bool)

(declare-fun get!13366 (ValueCell!8720 V!29503) V!29503)

(assert (=> b!901372 (= e!504636 (get!13366 (select (arr!25392 (_values!5488 thiss!1181)) (index!38172 lt!407165)) (dynLambda!1309 (defaultEntry!5468 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111649 c!95448) b!901371))

(assert (= (and d!111649 (not c!95448)) b!901372))

(assert (=> b!901371 m!836901))

(assert (=> b!901371 m!836903))

(declare-fun m!837097 () Bool)

(assert (=> b!901371 m!837097))

(assert (=> b!901372 m!836901))

(assert (=> b!901372 m!836903))

(declare-fun m!837099 () Bool)

(assert (=> b!901372 m!837099))

(assert (=> b!901140 d!111649))

(declare-fun d!111651 () Bool)

(declare-fun res!608588 () Bool)

(declare-fun e!504639 () Bool)

(assert (=> d!111651 (=> (not res!608588) (not e!504639))))

(declare-fun simpleValid!333 (LongMapFixedSize!4456) Bool)

(assert (=> d!111651 (= res!608588 (simpleValid!333 thiss!1181))))

(assert (=> d!111651 (= (valid!1718 thiss!1181) e!504639)))

(declare-fun b!901379 () Bool)

(declare-fun res!608589 () Bool)

(assert (=> b!901379 (=> (not res!608589) (not e!504639))))

(declare-fun arrayCountValidKeys!0 (array!52845 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901379 (= res!608589 (= (arrayCountValidKeys!0 (_keys!10276 thiss!1181) #b00000000000000000000000000000000 (size!25852 (_keys!10276 thiss!1181))) (_size!2283 thiss!1181)))))

(declare-fun b!901380 () Bool)

(declare-fun res!608590 () Bool)

(assert (=> b!901380 (=> (not res!608590) (not e!504639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52845 (_ BitVec 32)) Bool)

(assert (=> b!901380 (= res!608590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10276 thiss!1181) (mask!26271 thiss!1181)))))

(declare-fun b!901381 () Bool)

(declare-datatypes ((List!17887 0))(
  ( (Nil!17884) (Cons!17883 (h!19029 (_ BitVec 64)) (t!25243 List!17887)) )
))
(declare-fun arrayNoDuplicates!0 (array!52845 (_ BitVec 32) List!17887) Bool)

(assert (=> b!901381 (= e!504639 (arrayNoDuplicates!0 (_keys!10276 thiss!1181) #b00000000000000000000000000000000 Nil!17884))))

(assert (= (and d!111651 res!608588) b!901379))

(assert (= (and b!901379 res!608589) b!901380))

(assert (= (and b!901380 res!608590) b!901381))

(declare-fun m!837101 () Bool)

(assert (=> d!111651 m!837101))

(declare-fun m!837103 () Bool)

(assert (=> b!901379 m!837103))

(declare-fun m!837105 () Bool)

(assert (=> b!901380 m!837105))

(declare-fun m!837107 () Bool)

(assert (=> b!901381 m!837107))

(assert (=> start!77244 d!111651))

(declare-fun d!111653 () Bool)

(assert (=> d!111653 (= (array_inv!19970 (_keys!10276 thiss!1181)) (bvsge (size!25852 (_keys!10276 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901150 d!111653))

(declare-fun d!111655 () Bool)

(assert (=> d!111655 (= (array_inv!19971 (_values!5488 thiss!1181)) (bvsge (size!25853 (_values!5488 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901150 d!111655))

(declare-fun d!111657 () Bool)

(assert (=> d!111657 (= (inRange!0 (index!38172 lt!407165) (mask!26271 thiss!1181)) (and (bvsge (index!38172 lt!407165) #b00000000000000000000000000000000) (bvslt (index!38172 lt!407165) (bvadd (mask!26271 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!901145 d!111657))

(declare-fun mapNonEmpty!29299 () Bool)

(declare-fun mapRes!29299 () Bool)

(declare-fun tp!56341 () Bool)

(declare-fun e!504644 () Bool)

(assert (=> mapNonEmpty!29299 (= mapRes!29299 (and tp!56341 e!504644))))

(declare-fun mapValue!29299 () ValueCell!8720)

(declare-fun mapRest!29299 () (Array (_ BitVec 32) ValueCell!8720))

(declare-fun mapKey!29299 () (_ BitVec 32))

(assert (=> mapNonEmpty!29299 (= mapRest!29290 (store mapRest!29299 mapKey!29299 mapValue!29299))))

(declare-fun b!901388 () Bool)

(assert (=> b!901388 (= e!504644 tp_is_empty!18403)))

(declare-fun b!901389 () Bool)

(declare-fun e!504645 () Bool)

(assert (=> b!901389 (= e!504645 tp_is_empty!18403)))

(declare-fun condMapEmpty!29299 () Bool)

(declare-fun mapDefault!29299 () ValueCell!8720)

(assert (=> mapNonEmpty!29290 (= condMapEmpty!29299 (= mapRest!29290 ((as const (Array (_ BitVec 32) ValueCell!8720)) mapDefault!29299)))))

(assert (=> mapNonEmpty!29290 (= tp!56325 (and e!504645 mapRes!29299))))

(declare-fun mapIsEmpty!29299 () Bool)

(assert (=> mapIsEmpty!29299 mapRes!29299))

(assert (= (and mapNonEmpty!29290 condMapEmpty!29299) mapIsEmpty!29299))

(assert (= (and mapNonEmpty!29290 (not condMapEmpty!29299)) mapNonEmpty!29299))

(assert (= (and mapNonEmpty!29299 ((_ is ValueCellFull!8720) mapValue!29299)) b!901388))

(assert (= (and mapNonEmpty!29290 ((_ is ValueCellFull!8720) mapDefault!29299)) b!901389))

(declare-fun m!837109 () Bool)

(assert (=> mapNonEmpty!29299 m!837109))

(declare-fun b_lambda!13025 () Bool)

(assert (= b_lambda!13023 (or (and b!901150 b_free!16075) b_lambda!13025)))

(declare-fun b_lambda!13027 () Bool)

(assert (= b_lambda!13021 (or (and b!901150 b_free!16075) b_lambda!13027)))

(check-sat (not b!901273) (not b!901348) (not d!111639) (not b!901334) (not bm!40132) (not b_lambda!13027) (not b_lambda!13025) (not b_lambda!13019) (not b!901255) (not b!901372) (not d!111637) (not b!901253) (not b!901327) (not b!901379) (not b!901276) (not bm!40130) (not b!901246) (not b!901342) (not d!111635) (not b!901326) (not b!901282) (not d!111647) (not bm!40114) (not mapNonEmpty!29299) (not b!901333) (not b!901381) (not bm!40135) (not b!901371) (not b!901335) (not b!901344) (not d!111633) b_and!26391 (not b!901329) (not d!111645) (not b!901380) (not d!111651) tp_is_empty!18403 (not bm!40131) (not bm!40112) (not b!901363) (not d!111643) (not d!111631) (not b_next!16075))
(check-sat b_and!26391 (not b_next!16075))
