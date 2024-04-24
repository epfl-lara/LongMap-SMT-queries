; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13074 () Bool)

(assert start!13074)

(declare-fun b!114052 () Bool)

(declare-fun b_free!2617 () Bool)

(declare-fun b_next!2617 () Bool)

(assert (=> b!114052 (= b_free!2617 (not b_next!2617))))

(declare-fun tp!10212 () Bool)

(declare-fun b_and!7021 () Bool)

(assert (=> b!114052 (= tp!10212 b_and!7021)))

(declare-fun b!114044 () Bool)

(declare-fun b_free!2619 () Bool)

(declare-fun b_next!2619 () Bool)

(assert (=> b!114044 (= b_free!2619 (not b_next!2619))))

(declare-fun tp!10209 () Bool)

(declare-fun b_and!7023 () Bool)

(assert (=> b!114044 (= tp!10209 b_and!7023)))

(declare-fun b!114040 () Bool)

(declare-fun e!74175 () Bool)

(declare-fun tp_is_empty!2725 () Bool)

(assert (=> b!114040 (= e!74175 tp_is_empty!2725)))

(declare-fun b!114041 () Bool)

(declare-fun e!74171 () Bool)

(declare-fun e!74163 () Bool)

(assert (=> b!114041 (= e!74171 e!74163)))

(declare-fun mapIsEmpty!4103 () Bool)

(declare-fun mapRes!4103 () Bool)

(assert (=> mapIsEmpty!4103 mapRes!4103))

(declare-fun mapNonEmpty!4103 () Bool)

(declare-fun tp!10210 () Bool)

(declare-fun e!74167 () Bool)

(assert (=> mapNonEmpty!4103 (= mapRes!4103 (and tp!10210 e!74167))))

(declare-fun mapKey!4103 () (_ BitVec 32))

(declare-datatypes ((V!3281 0))(
  ( (V!3282 (val!1407 Int)) )
))
(declare-datatypes ((ValueCell!1019 0))(
  ( (ValueCellFull!1019 (v!2983 V!3281)) (EmptyCell!1019) )
))
(declare-fun mapRest!4104 () (Array (_ BitVec 32) ValueCell!1019))

(declare-fun mapValue!4103 () ValueCell!1019)

(declare-datatypes ((array!4437 0))(
  ( (array!4438 (arr!2102 (Array (_ BitVec 32) (_ BitVec 64))) (size!2362 (_ BitVec 32))) )
))
(declare-datatypes ((array!4439 0))(
  ( (array!4440 (arr!2103 (Array (_ BitVec 32) ValueCell!1019)) (size!2363 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!946 0))(
  ( (LongMapFixedSize!947 (defaultEntry!2679 Int) (mask!6873 (_ BitVec 32)) (extraKeys!2468 (_ BitVec 32)) (zeroValue!2546 V!3281) (minValue!2546 V!3281) (_size!522 (_ BitVec 32)) (_keys!4401 array!4437) (_values!2662 array!4439) (_vacant!522 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!946)

(assert (=> mapNonEmpty!4103 (= (arr!2103 (_values!2662 newMap!16)) (store mapRest!4104 mapKey!4103 mapValue!4103))))

(declare-fun b!114042 () Bool)

(declare-fun e!74172 () Bool)

(assert (=> b!114042 (= e!74172 (not true))))

(declare-fun lt!59270 () Bool)

(declare-datatypes ((tuple2!2430 0))(
  ( (tuple2!2431 (_1!1226 Bool) (_2!1226 LongMapFixedSize!946)) )
))
(declare-fun lt!59256 () tuple2!2430)

(declare-fun valid!449 (LongMapFixedSize!946) Bool)

(assert (=> b!114042 (= lt!59270 (valid!449 (_2!1226 lt!59256)))))

(declare-datatypes ((tuple2!2432 0))(
  ( (tuple2!2433 (_1!1227 (_ BitVec 64)) (_2!1227 V!3281)) )
))
(declare-fun lt!59263 () tuple2!2432)

(declare-fun lt!59258 () tuple2!2432)

(declare-datatypes ((List!1629 0))(
  ( (Nil!1626) (Cons!1625 (h!2225 tuple2!2432) (t!5835 List!1629)) )
))
(declare-datatypes ((ListLongMap!1571 0))(
  ( (ListLongMap!1572 (toList!801 List!1629)) )
))
(declare-fun lt!59254 () ListLongMap!1571)

(declare-fun lt!59257 () ListLongMap!1571)

(declare-fun +!154 (ListLongMap!1571 tuple2!2432) ListLongMap!1571)

(assert (=> b!114042 (= (+!154 lt!59257 lt!59258) (+!154 (+!154 lt!59254 lt!59258) lt!59263))))

(declare-datatypes ((Cell!748 0))(
  ( (Cell!749 (v!2984 LongMapFixedSize!946)) )
))
(declare-datatypes ((LongMap!748 0))(
  ( (LongMap!749 (underlying!385 Cell!748)) )
))
(declare-fun thiss!992 () LongMap!748)

(assert (=> b!114042 (= lt!59258 (tuple2!2433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2546 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((Unit!3543 0))(
  ( (Unit!3544) )
))
(declare-fun lt!59265 () Unit!3543)

(declare-fun lt!59264 () V!3281)

(declare-fun addCommutativeForDiffKeys!67 (ListLongMap!1571 (_ BitVec 64) V!3281 (_ BitVec 64) V!3281) Unit!3543)

(assert (=> b!114042 (= lt!59265 (addCommutativeForDiffKeys!67 lt!59254 (select (arr!2102 (_keys!4401 (v!2984 (underlying!385 thiss!992)))) from!355) lt!59264 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2546 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun lt!59252 () ListLongMap!1571)

(assert (=> b!114042 (= lt!59252 lt!59257)))

(assert (=> b!114042 (= lt!59257 (+!154 lt!59254 lt!59263))))

(declare-fun lt!59266 () ListLongMap!1571)

(declare-fun lt!59260 () tuple2!2432)

(assert (=> b!114042 (= lt!59252 (+!154 lt!59266 lt!59260))))

(declare-fun lt!59262 () ListLongMap!1571)

(assert (=> b!114042 (= lt!59254 (+!154 lt!59262 lt!59260))))

(assert (=> b!114042 (= lt!59260 (tuple2!2433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2546 (v!2984 (underlying!385 thiss!992)))))))

(assert (=> b!114042 (= lt!59266 (+!154 lt!59262 lt!59263))))

(assert (=> b!114042 (= lt!59263 (tuple2!2433 (select (arr!2102 (_keys!4401 (v!2984 (underlying!385 thiss!992)))) from!355) lt!59264))))

(declare-fun lt!59261 () Unit!3543)

(assert (=> b!114042 (= lt!59261 (addCommutativeForDiffKeys!67 lt!59262 (select (arr!2102 (_keys!4401 (v!2984 (underlying!385 thiss!992)))) from!355) lt!59264 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2546 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!121 (array!4437 array!4439 (_ BitVec 32) (_ BitVec 32) V!3281 V!3281 (_ BitVec 32) Int) ListLongMap!1571)

(assert (=> b!114042 (= lt!59262 (getCurrentListMapNoExtraKeys!121 (_keys!4401 (v!2984 (underlying!385 thiss!992))) (_values!2662 (v!2984 (underlying!385 thiss!992))) (mask!6873 (v!2984 (underlying!385 thiss!992))) (extraKeys!2468 (v!2984 (underlying!385 thiss!992))) (zeroValue!2546 (v!2984 (underlying!385 thiss!992))) (minValue!2546 (v!2984 (underlying!385 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2679 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun b!114043 () Bool)

(declare-fun e!74168 () Bool)

(declare-fun e!74174 () Bool)

(assert (=> b!114043 (= e!74168 e!74174)))

(declare-fun res!56163 () Bool)

(assert (=> b!114043 (=> (not res!56163) (not e!74174))))

(assert (=> b!114043 (= res!56163 (and (not (= (select (arr!2102 (_keys!4401 (v!2984 (underlying!385 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2102 (_keys!4401 (v!2984 (underlying!385 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1381 (ValueCell!1019 V!3281) V!3281)

(declare-fun dynLambda!399 (Int (_ BitVec 64)) V!3281)

(assert (=> b!114043 (= lt!59264 (get!1381 (select (arr!2103 (_values!2662 (v!2984 (underlying!385 thiss!992)))) from!355) (dynLambda!399 (defaultEntry!2679 (v!2984 (underlying!385 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!74173 () Bool)

(declare-fun e!74165 () Bool)

(declare-fun array_inv!1305 (array!4437) Bool)

(declare-fun array_inv!1306 (array!4439) Bool)

(assert (=> b!114044 (= e!74165 (and tp!10209 tp_is_empty!2725 (array_inv!1305 (_keys!4401 newMap!16)) (array_inv!1306 (_values!2662 newMap!16)) e!74173))))

(declare-fun mapIsEmpty!4104 () Bool)

(declare-fun mapRes!4104 () Bool)

(assert (=> mapIsEmpty!4104 mapRes!4104))

(declare-fun b!114045 () Bool)

(assert (=> b!114045 (= e!74174 e!74172)))

(declare-fun res!56164 () Bool)

(assert (=> b!114045 (=> (not res!56164) (not e!74172))))

(assert (=> b!114045 (= res!56164 (and (_1!1226 lt!59256) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!59268 () Unit!3543)

(declare-fun e!74164 () Unit!3543)

(assert (=> b!114045 (= lt!59268 e!74164)))

(declare-fun lt!59267 () ListLongMap!1571)

(declare-fun c!20388 () Bool)

(declare-fun contains!840 (ListLongMap!1571 (_ BitVec 64)) Bool)

(assert (=> b!114045 (= c!20388 (contains!840 lt!59267 (select (arr!2102 (_keys!4401 (v!2984 (underlying!385 thiss!992)))) from!355)))))

(declare-fun update!175 (LongMapFixedSize!946 (_ BitVec 64) V!3281) tuple2!2430)

(assert (=> b!114045 (= lt!59256 (update!175 newMap!16 (select (arr!2102 (_keys!4401 (v!2984 (underlying!385 thiss!992)))) from!355) lt!59264))))

(declare-fun b!114046 () Bool)

(declare-fun e!74178 () Bool)

(assert (=> b!114046 (= e!74173 (and e!74178 mapRes!4103))))

(declare-fun condMapEmpty!4104 () Bool)

(declare-fun mapDefault!4103 () ValueCell!1019)

(assert (=> b!114046 (= condMapEmpty!4104 (= (arr!2103 (_values!2662 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1019)) mapDefault!4103)))))

(declare-fun b!114047 () Bool)

(declare-fun e!74166 () Bool)

(assert (=> b!114047 (= e!74166 e!74168)))

(declare-fun res!56168 () Bool)

(assert (=> b!114047 (=> (not res!56168) (not e!74168))))

(declare-fun lt!59269 () ListLongMap!1571)

(assert (=> b!114047 (= res!56168 (= lt!59269 lt!59267))))

(declare-fun map!1314 (LongMapFixedSize!946) ListLongMap!1571)

(assert (=> b!114047 (= lt!59267 (map!1314 newMap!16))))

(declare-fun getCurrentListMap!484 (array!4437 array!4439 (_ BitVec 32) (_ BitVec 32) V!3281 V!3281 (_ BitVec 32) Int) ListLongMap!1571)

(assert (=> b!114047 (= lt!59269 (getCurrentListMap!484 (_keys!4401 (v!2984 (underlying!385 thiss!992))) (_values!2662 (v!2984 (underlying!385 thiss!992))) (mask!6873 (v!2984 (underlying!385 thiss!992))) (extraKeys!2468 (v!2984 (underlying!385 thiss!992))) (zeroValue!2546 (v!2984 (underlying!385 thiss!992))) (minValue!2546 (v!2984 (underlying!385 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2679 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun mapNonEmpty!4104 () Bool)

(declare-fun tp!10211 () Bool)

(declare-fun e!74169 () Bool)

(assert (=> mapNonEmpty!4104 (= mapRes!4104 (and tp!10211 e!74169))))

(declare-fun mapRest!4103 () (Array (_ BitVec 32) ValueCell!1019))

(declare-fun mapValue!4104 () ValueCell!1019)

(declare-fun mapKey!4104 () (_ BitVec 32))

(assert (=> mapNonEmpty!4104 (= (arr!2103 (_values!2662 (v!2984 (underlying!385 thiss!992)))) (store mapRest!4103 mapKey!4104 mapValue!4104))))

(declare-fun b!114048 () Bool)

(declare-fun e!74176 () Bool)

(assert (=> b!114048 (= e!74176 (and e!74175 mapRes!4104))))

(declare-fun condMapEmpty!4103 () Bool)

(declare-fun mapDefault!4104 () ValueCell!1019)

(assert (=> b!114048 (= condMapEmpty!4103 (= (arr!2103 (_values!2662 (v!2984 (underlying!385 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1019)) mapDefault!4104)))))

(declare-fun b!114049 () Bool)

(declare-fun Unit!3545 () Unit!3543)

(assert (=> b!114049 (= e!74164 Unit!3545)))

(declare-fun b!114050 () Bool)

(assert (=> b!114050 (= e!74178 tp_is_empty!2725)))

(declare-fun res!56166 () Bool)

(assert (=> start!13074 (=> (not res!56166) (not e!74166))))

(declare-fun valid!450 (LongMap!748) Bool)

(assert (=> start!13074 (= res!56166 (valid!450 thiss!992))))

(assert (=> start!13074 e!74166))

(assert (=> start!13074 e!74171))

(assert (=> start!13074 true))

(assert (=> start!13074 e!74165))

(declare-fun b!114051 () Bool)

(declare-fun Unit!3546 () Unit!3543)

(assert (=> b!114051 (= e!74164 Unit!3546)))

(declare-fun lt!59259 () Unit!3543)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!112 (array!4437 array!4439 (_ BitVec 32) (_ BitVec 32) V!3281 V!3281 (_ BitVec 64) (_ BitVec 32) Int) Unit!3543)

(assert (=> b!114051 (= lt!59259 (lemmaListMapContainsThenArrayContainsFrom!112 (_keys!4401 (v!2984 (underlying!385 thiss!992))) (_values!2662 (v!2984 (underlying!385 thiss!992))) (mask!6873 (v!2984 (underlying!385 thiss!992))) (extraKeys!2468 (v!2984 (underlying!385 thiss!992))) (zeroValue!2546 (v!2984 (underlying!385 thiss!992))) (minValue!2546 (v!2984 (underlying!385 thiss!992))) (select (arr!2102 (_keys!4401 (v!2984 (underlying!385 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2679 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114051 (arrayContainsKey!0 (_keys!4401 (v!2984 (underlying!385 thiss!992))) (select (arr!2102 (_keys!4401 (v!2984 (underlying!385 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59255 () Unit!3543)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4437 (_ BitVec 32) (_ BitVec 32)) Unit!3543)

(assert (=> b!114051 (= lt!59255 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4401 (v!2984 (underlying!385 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1630 0))(
  ( (Nil!1627) (Cons!1626 (h!2226 (_ BitVec 64)) (t!5836 List!1630)) )
))
(declare-fun arrayNoDuplicates!0 (array!4437 (_ BitVec 32) List!1630) Bool)

(assert (=> b!114051 (arrayNoDuplicates!0 (_keys!4401 (v!2984 (underlying!385 thiss!992))) from!355 Nil!1627)))

(declare-fun lt!59253 () Unit!3543)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4437 (_ BitVec 32) (_ BitVec 64) List!1630) Unit!3543)

(assert (=> b!114051 (= lt!59253 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4401 (v!2984 (underlying!385 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2102 (_keys!4401 (v!2984 (underlying!385 thiss!992)))) from!355) (Cons!1626 (select (arr!2102 (_keys!4401 (v!2984 (underlying!385 thiss!992)))) from!355) Nil!1627)))))

(assert (=> b!114051 false))

(declare-fun e!74170 () Bool)

(assert (=> b!114052 (= e!74170 (and tp!10212 tp_is_empty!2725 (array_inv!1305 (_keys!4401 (v!2984 (underlying!385 thiss!992)))) (array_inv!1306 (_values!2662 (v!2984 (underlying!385 thiss!992)))) e!74176))))

(declare-fun b!114053 () Bool)

(declare-fun res!56165 () Bool)

(assert (=> b!114053 (=> (not res!56165) (not e!74166))))

(assert (=> b!114053 (= res!56165 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2362 (_keys!4401 (v!2984 (underlying!385 thiss!992)))))))))

(declare-fun b!114054 () Bool)

(assert (=> b!114054 (= e!74167 tp_is_empty!2725)))

(declare-fun b!114055 () Bool)

(declare-fun res!56162 () Bool)

(assert (=> b!114055 (=> (not res!56162) (not e!74166))))

(assert (=> b!114055 (= res!56162 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6873 newMap!16)) (_size!522 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun b!114056 () Bool)

(assert (=> b!114056 (= e!74169 tp_is_empty!2725)))

(declare-fun b!114057 () Bool)

(declare-fun res!56167 () Bool)

(assert (=> b!114057 (=> (not res!56167) (not e!74166))))

(assert (=> b!114057 (= res!56167 (valid!449 newMap!16))))

(declare-fun b!114058 () Bool)

(assert (=> b!114058 (= e!74163 e!74170)))

(assert (= (and start!13074 res!56166) b!114053))

(assert (= (and b!114053 res!56165) b!114057))

(assert (= (and b!114057 res!56167) b!114055))

(assert (= (and b!114055 res!56162) b!114047))

(assert (= (and b!114047 res!56168) b!114043))

(assert (= (and b!114043 res!56163) b!114045))

(assert (= (and b!114045 c!20388) b!114051))

(assert (= (and b!114045 (not c!20388)) b!114049))

(assert (= (and b!114045 res!56164) b!114042))

(assert (= (and b!114048 condMapEmpty!4103) mapIsEmpty!4104))

(assert (= (and b!114048 (not condMapEmpty!4103)) mapNonEmpty!4104))

(get-info :version)

(assert (= (and mapNonEmpty!4104 ((_ is ValueCellFull!1019) mapValue!4104)) b!114056))

(assert (= (and b!114048 ((_ is ValueCellFull!1019) mapDefault!4104)) b!114040))

(assert (= b!114052 b!114048))

(assert (= b!114058 b!114052))

(assert (= b!114041 b!114058))

(assert (= start!13074 b!114041))

(assert (= (and b!114046 condMapEmpty!4104) mapIsEmpty!4103))

(assert (= (and b!114046 (not condMapEmpty!4104)) mapNonEmpty!4103))

(assert (= (and mapNonEmpty!4103 ((_ is ValueCellFull!1019) mapValue!4103)) b!114054))

(assert (= (and b!114046 ((_ is ValueCellFull!1019) mapDefault!4103)) b!114050))

(assert (= b!114044 b!114046))

(assert (= start!13074 b!114044))

(declare-fun b_lambda!5103 () Bool)

(assert (=> (not b_lambda!5103) (not b!114043)))

(declare-fun t!5832 () Bool)

(declare-fun tb!2169 () Bool)

(assert (=> (and b!114052 (= (defaultEntry!2679 (v!2984 (underlying!385 thiss!992))) (defaultEntry!2679 (v!2984 (underlying!385 thiss!992)))) t!5832) tb!2169))

(declare-fun result!3625 () Bool)

(assert (=> tb!2169 (= result!3625 tp_is_empty!2725)))

(assert (=> b!114043 t!5832))

(declare-fun b_and!7025 () Bool)

(assert (= b_and!7021 (and (=> t!5832 result!3625) b_and!7025)))

(declare-fun tb!2171 () Bool)

(declare-fun t!5834 () Bool)

(assert (=> (and b!114044 (= (defaultEntry!2679 newMap!16) (defaultEntry!2679 (v!2984 (underlying!385 thiss!992)))) t!5834) tb!2171))

(declare-fun result!3629 () Bool)

(assert (= result!3629 result!3625))

(assert (=> b!114043 t!5834))

(declare-fun b_and!7027 () Bool)

(assert (= b_and!7023 (and (=> t!5834 result!3629) b_and!7027)))

(declare-fun m!130291 () Bool)

(assert (=> start!13074 m!130291))

(declare-fun m!130293 () Bool)

(assert (=> b!114052 m!130293))

(declare-fun m!130295 () Bool)

(assert (=> b!114052 m!130295))

(declare-fun m!130297 () Bool)

(assert (=> mapNonEmpty!4104 m!130297))

(declare-fun m!130299 () Bool)

(assert (=> b!114057 m!130299))

(declare-fun m!130301 () Bool)

(assert (=> b!114042 m!130301))

(declare-fun m!130303 () Bool)

(assert (=> b!114042 m!130303))

(declare-fun m!130305 () Bool)

(assert (=> b!114042 m!130305))

(declare-fun m!130307 () Bool)

(assert (=> b!114042 m!130307))

(declare-fun m!130309 () Bool)

(assert (=> b!114042 m!130309))

(assert (=> b!114042 m!130305))

(assert (=> b!114042 m!130305))

(declare-fun m!130311 () Bool)

(assert (=> b!114042 m!130311))

(declare-fun m!130313 () Bool)

(assert (=> b!114042 m!130313))

(declare-fun m!130315 () Bool)

(assert (=> b!114042 m!130315))

(declare-fun m!130317 () Bool)

(assert (=> b!114042 m!130317))

(declare-fun m!130319 () Bool)

(assert (=> b!114042 m!130319))

(declare-fun m!130321 () Bool)

(assert (=> b!114042 m!130321))

(assert (=> b!114042 m!130317))

(declare-fun m!130323 () Bool)

(assert (=> b!114042 m!130323))

(assert (=> b!114045 m!130305))

(assert (=> b!114045 m!130305))

(declare-fun m!130325 () Bool)

(assert (=> b!114045 m!130325))

(assert (=> b!114045 m!130305))

(declare-fun m!130327 () Bool)

(assert (=> b!114045 m!130327))

(declare-fun m!130329 () Bool)

(assert (=> b!114047 m!130329))

(declare-fun m!130331 () Bool)

(assert (=> b!114047 m!130331))

(assert (=> b!114043 m!130305))

(declare-fun m!130333 () Bool)

(assert (=> b!114043 m!130333))

(declare-fun m!130335 () Bool)

(assert (=> b!114043 m!130335))

(assert (=> b!114043 m!130333))

(assert (=> b!114043 m!130335))

(declare-fun m!130337 () Bool)

(assert (=> b!114043 m!130337))

(declare-fun m!130339 () Bool)

(assert (=> b!114044 m!130339))

(declare-fun m!130341 () Bool)

(assert (=> b!114044 m!130341))

(declare-fun m!130343 () Bool)

(assert (=> b!114051 m!130343))

(declare-fun m!130345 () Bool)

(assert (=> b!114051 m!130345))

(assert (=> b!114051 m!130305))

(declare-fun m!130347 () Bool)

(assert (=> b!114051 m!130347))

(assert (=> b!114051 m!130305))

(assert (=> b!114051 m!130305))

(declare-fun m!130349 () Bool)

(assert (=> b!114051 m!130349))

(assert (=> b!114051 m!130305))

(declare-fun m!130351 () Bool)

(assert (=> b!114051 m!130351))

(declare-fun m!130353 () Bool)

(assert (=> mapNonEmpty!4103 m!130353))

(check-sat (not b!114044) (not b!114057) tp_is_empty!2725 b_and!7027 (not b!114052) (not b!114051) (not b!114047) (not b!114042) (not mapNonEmpty!4104) (not b_next!2619) b_and!7025 (not b!114045) (not b!114043) (not mapNonEmpty!4103) (not b_next!2617) (not start!13074) (not b_lambda!5103))
(check-sat b_and!7025 b_and!7027 (not b_next!2617) (not b_next!2619))
