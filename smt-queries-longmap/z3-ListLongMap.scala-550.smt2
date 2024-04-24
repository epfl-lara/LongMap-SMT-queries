; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14590 () Bool)

(assert start!14590)

(declare-fun b!138240 () Bool)

(declare-fun b_free!2989 () Bool)

(declare-fun b_next!2989 () Bool)

(assert (=> b!138240 (= b_free!2989 (not b_next!2989))))

(declare-fun tp!11427 () Bool)

(declare-fun b_and!8613 () Bool)

(assert (=> b!138240 (= tp!11427 b_and!8613)))

(declare-fun b!138229 () Bool)

(declare-fun b_free!2991 () Bool)

(declare-fun b_next!2991 () Bool)

(assert (=> b!138229 (= b_free!2991 (not b_next!2991))))

(declare-fun tp!11429 () Bool)

(declare-fun b_and!8615 () Bool)

(assert (=> b!138229 (= tp!11429 b_and!8615)))

(declare-fun b!138228 () Bool)

(declare-fun res!66181 () Bool)

(declare-fun e!90094 () Bool)

(assert (=> b!138228 (=> (not res!66181) (not e!90094))))

(declare-datatypes ((V!3529 0))(
  ( (V!3530 (val!1500 Int)) )
))
(declare-datatypes ((array!4839 0))(
  ( (array!4840 (arr!2288 (Array (_ BitVec 32) (_ BitVec 64))) (size!2559 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1112 0))(
  ( (ValueCellFull!1112 (v!3253 V!3529)) (EmptyCell!1112) )
))
(declare-datatypes ((array!4841 0))(
  ( (array!4842 (arr!2289 (Array (_ BitVec 32) ValueCell!1112)) (size!2560 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1132 0))(
  ( (LongMapFixedSize!1133 (defaultEntry!2918 Int) (mask!7248 (_ BitVec 32)) (extraKeys!2675 (_ BitVec 32)) (zeroValue!2769 V!3529) (minValue!2769 V!3529) (_size!615 (_ BitVec 32)) (_keys!4675 array!4839) (_values!2901 array!4841) (_vacant!615 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1132)

(declare-fun valid!558 (LongMapFixedSize!1132) Bool)

(assert (=> b!138228 (= res!66181 (valid!558 newMap!16))))

(declare-fun e!90090 () Bool)

(declare-fun tp_is_empty!2911 () Bool)

(declare-fun e!90086 () Bool)

(declare-fun array_inv!1429 (array!4839) Bool)

(declare-fun array_inv!1430 (array!4841) Bool)

(assert (=> b!138229 (= e!90086 (and tp!11429 tp_is_empty!2911 (array_inv!1429 (_keys!4675 newMap!16)) (array_inv!1430 (_values!2901 newMap!16)) e!90090))))

(declare-fun b!138230 () Bool)

(declare-fun e!90084 () Bool)

(assert (=> b!138230 (= e!90094 e!90084)))

(declare-fun res!66182 () Bool)

(assert (=> b!138230 (=> (not res!66182) (not e!90084))))

(declare-datatypes ((Cell!920 0))(
  ( (Cell!921 (v!3254 LongMapFixedSize!1132)) )
))
(declare-datatypes ((LongMap!920 0))(
  ( (LongMap!921 (underlying!471 Cell!920)) )
))
(declare-fun thiss!992 () LongMap!920)

(declare-datatypes ((tuple2!2606 0))(
  ( (tuple2!2607 (_1!1314 (_ BitVec 64)) (_2!1314 V!3529)) )
))
(declare-datatypes ((List!1709 0))(
  ( (Nil!1706) (Cons!1705 (h!2312 tuple2!2606) (t!6245 List!1709)) )
))
(declare-datatypes ((ListLongMap!1677 0))(
  ( (ListLongMap!1678 (toList!854 List!1709)) )
))
(declare-fun lt!72227 () ListLongMap!1677)

(declare-fun lt!72226 () ListLongMap!1677)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!138230 (= res!66182 (and (= lt!72227 lt!72226) (not (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1419 (LongMapFixedSize!1132) ListLongMap!1677)

(assert (=> b!138230 (= lt!72226 (map!1419 newMap!16))))

(declare-fun getCurrentListMap!527 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) Int) ListLongMap!1677)

(assert (=> b!138230 (= lt!72227 (getCurrentListMap!527 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun b!138232 () Bool)

(declare-fun e!90087 () Bool)

(declare-datatypes ((List!1710 0))(
  ( (Nil!1707) (Cons!1706 (h!2313 (_ BitVec 64)) (t!6246 List!1710)) )
))
(declare-fun arrayNoDuplicates!0 (array!4839 (_ BitVec 32) List!1710) Bool)

(assert (=> b!138232 (= e!90087 (arrayNoDuplicates!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000000 Nil!1707))))

(declare-fun mapIsEmpty!4763 () Bool)

(declare-fun mapRes!4763 () Bool)

(assert (=> mapIsEmpty!4763 mapRes!4763))

(declare-fun b!138233 () Bool)

(declare-fun e!90096 () Bool)

(declare-fun e!90088 () Bool)

(assert (=> b!138233 (= e!90096 e!90088)))

(declare-fun mapNonEmpty!4763 () Bool)

(declare-fun tp!11430 () Bool)

(declare-fun e!90098 () Bool)

(assert (=> mapNonEmpty!4763 (= mapRes!4763 (and tp!11430 e!90098))))

(declare-fun mapRest!4764 () (Array (_ BitVec 32) ValueCell!1112))

(declare-fun mapKey!4764 () (_ BitVec 32))

(declare-fun mapValue!4763 () ValueCell!1112)

(assert (=> mapNonEmpty!4763 (= (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) (store mapRest!4764 mapKey!4764 mapValue!4763))))

(declare-fun b!138234 () Bool)

(declare-fun e!90091 () Bool)

(assert (=> b!138234 (= e!90091 e!90096)))

(declare-fun b!138235 () Bool)

(assert (=> b!138235 (= e!90098 tp_is_empty!2911)))

(declare-fun b!138236 () Bool)

(declare-fun e!90092 () Bool)

(assert (=> b!138236 (= e!90084 e!90092)))

(declare-fun res!66185 () Bool)

(assert (=> b!138236 (=> (not res!66185) (not e!90092))))

(declare-fun contains!897 (ListLongMap!1677 (_ BitVec 64)) Bool)

(assert (=> b!138236 (= res!66185 (contains!897 lt!72226 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2608 0))(
  ( (tuple2!2609 (_1!1315 Bool) (_2!1315 LongMapFixedSize!1132)) )
))
(declare-fun lt!72224 () tuple2!2608)

(declare-fun update!205 (LongMapFixedSize!1132 (_ BitVec 64) V!3529) tuple2!2608)

(declare-fun get!1516 (ValueCell!1112 V!3529) V!3529)

(declare-fun dynLambda!435 (Int (_ BitVec 64)) V!3529)

(assert (=> b!138236 (= lt!72224 (update!205 newMap!16 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!138237 () Bool)

(declare-fun e!90097 () Bool)

(assert (=> b!138237 (= e!90097 tp_is_empty!2911)))

(declare-fun b!138238 () Bool)

(declare-fun mapRes!4764 () Bool)

(assert (=> b!138238 (= e!90090 (and e!90097 mapRes!4764))))

(declare-fun condMapEmpty!4763 () Bool)

(declare-fun mapDefault!4764 () ValueCell!1112)

(assert (=> b!138238 (= condMapEmpty!4763 (= (arr!2289 (_values!2901 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1112)) mapDefault!4764)))))

(declare-fun b!138239 () Bool)

(declare-fun e!90085 () Bool)

(declare-fun e!90089 () Bool)

(assert (=> b!138239 (= e!90085 (and e!90089 mapRes!4763))))

(declare-fun condMapEmpty!4764 () Bool)

(declare-fun mapDefault!4763 () ValueCell!1112)

(assert (=> b!138239 (= condMapEmpty!4764 (= (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1112)) mapDefault!4763)))))

(assert (=> b!138240 (= e!90088 (and tp!11427 tp_is_empty!2911 (array_inv!1429 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (array_inv!1430 (_values!2901 (v!3254 (underlying!471 thiss!992)))) e!90085))))

(declare-fun b!138241 () Bool)

(declare-fun e!90093 () Bool)

(assert (=> b!138241 (= e!90093 tp_is_empty!2911)))

(declare-fun mapNonEmpty!4764 () Bool)

(declare-fun tp!11428 () Bool)

(assert (=> mapNonEmpty!4764 (= mapRes!4764 (and tp!11428 e!90093))))

(declare-fun mapValue!4764 () ValueCell!1112)

(declare-fun mapKey!4763 () (_ BitVec 32))

(declare-fun mapRest!4763 () (Array (_ BitVec 32) ValueCell!1112))

(assert (=> mapNonEmpty!4764 (= (arr!2289 (_values!2901 newMap!16)) (store mapRest!4763 mapKey!4763 mapValue!4764))))

(declare-fun res!66187 () Bool)

(assert (=> start!14590 (=> (not res!66187) (not e!90094))))

(declare-fun valid!559 (LongMap!920) Bool)

(assert (=> start!14590 (= res!66187 (valid!559 thiss!992))))

(assert (=> start!14590 e!90094))

(assert (=> start!14590 e!90091))

(assert (=> start!14590 true))

(assert (=> start!14590 e!90086))

(declare-fun b!138231 () Bool)

(assert (=> b!138231 (= e!90092 (not e!90087))))

(declare-fun res!66184 () Bool)

(assert (=> b!138231 (=> res!66184 e!90087)))

(assert (=> b!138231 (= res!66184 (or (bvsge (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))) (bvsgt from!355 (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!4839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138231 (arrayContainsKey!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4353 0))(
  ( (Unit!4354) )
))
(declare-fun lt!72225 () Unit!4353)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!133 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) (_ BitVec 32) Int) Unit!4353)

(assert (=> b!138231 (= lt!72225 (lemmaListMapContainsThenArrayContainsFrom!133 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun b!138242 () Bool)

(declare-fun res!66186 () Bool)

(assert (=> b!138242 (=> (not res!66186) (not e!90094))))

(assert (=> b!138242 (= res!66186 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7248 newMap!16)) (_size!615 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun mapIsEmpty!4764 () Bool)

(assert (=> mapIsEmpty!4764 mapRes!4764))

(declare-fun b!138243 () Bool)

(declare-fun res!66183 () Bool)

(assert (=> b!138243 (=> (not res!66183) (not e!90094))))

(assert (=> b!138243 (= res!66183 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992)))))))))

(declare-fun b!138244 () Bool)

(assert (=> b!138244 (= e!90089 tp_is_empty!2911)))

(assert (= (and start!14590 res!66187) b!138243))

(assert (= (and b!138243 res!66183) b!138228))

(assert (= (and b!138228 res!66181) b!138242))

(assert (= (and b!138242 res!66186) b!138230))

(assert (= (and b!138230 res!66182) b!138236))

(assert (= (and b!138236 res!66185) b!138231))

(assert (= (and b!138231 (not res!66184)) b!138232))

(assert (= (and b!138239 condMapEmpty!4764) mapIsEmpty!4763))

(assert (= (and b!138239 (not condMapEmpty!4764)) mapNonEmpty!4763))

(get-info :version)

(assert (= (and mapNonEmpty!4763 ((_ is ValueCellFull!1112) mapValue!4763)) b!138235))

(assert (= (and b!138239 ((_ is ValueCellFull!1112) mapDefault!4763)) b!138244))

(assert (= b!138240 b!138239))

(assert (= b!138233 b!138240))

(assert (= b!138234 b!138233))

(assert (= start!14590 b!138234))

(assert (= (and b!138238 condMapEmpty!4763) mapIsEmpty!4764))

(assert (= (and b!138238 (not condMapEmpty!4763)) mapNonEmpty!4764))

(assert (= (and mapNonEmpty!4764 ((_ is ValueCellFull!1112) mapValue!4764)) b!138241))

(assert (= (and b!138238 ((_ is ValueCellFull!1112) mapDefault!4764)) b!138237))

(assert (= b!138229 b!138238))

(assert (= start!14590 b!138229))

(declare-fun b_lambda!6205 () Bool)

(assert (=> (not b_lambda!6205) (not b!138236)))

(declare-fun t!6242 () Bool)

(declare-fun tb!2497 () Bool)

(assert (=> (and b!138240 (= (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))) t!6242) tb!2497))

(declare-fun result!4105 () Bool)

(assert (=> tb!2497 (= result!4105 tp_is_empty!2911)))

(assert (=> b!138236 t!6242))

(declare-fun b_and!8617 () Bool)

(assert (= b_and!8613 (and (=> t!6242 result!4105) b_and!8617)))

(declare-fun tb!2499 () Bool)

(declare-fun t!6244 () Bool)

(assert (=> (and b!138229 (= (defaultEntry!2918 newMap!16) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))) t!6244) tb!2499))

(declare-fun result!4109 () Bool)

(assert (= result!4109 result!4105))

(assert (=> b!138236 t!6244))

(declare-fun b_and!8619 () Bool)

(assert (= b_and!8615 (and (=> t!6244 result!4109) b_and!8619)))

(declare-fun m!165363 () Bool)

(assert (=> b!138230 m!165363))

(declare-fun m!165365 () Bool)

(assert (=> b!138230 m!165365))

(declare-fun m!165367 () Bool)

(assert (=> b!138230 m!165367))

(declare-fun m!165369 () Bool)

(assert (=> b!138232 m!165369))

(declare-fun m!165371 () Bool)

(assert (=> mapNonEmpty!4764 m!165371))

(assert (=> b!138231 m!165363))

(assert (=> b!138231 m!165363))

(declare-fun m!165373 () Bool)

(assert (=> b!138231 m!165373))

(assert (=> b!138231 m!165363))

(declare-fun m!165375 () Bool)

(assert (=> b!138231 m!165375))

(declare-fun m!165377 () Bool)

(assert (=> b!138229 m!165377))

(declare-fun m!165379 () Bool)

(assert (=> b!138229 m!165379))

(declare-fun m!165381 () Bool)

(assert (=> b!138240 m!165381))

(declare-fun m!165383 () Bool)

(assert (=> b!138240 m!165383))

(declare-fun m!165385 () Bool)

(assert (=> start!14590 m!165385))

(declare-fun m!165387 () Bool)

(assert (=> b!138228 m!165387))

(assert (=> b!138236 m!165363))

(declare-fun m!165389 () Bool)

(assert (=> b!138236 m!165389))

(declare-fun m!165391 () Bool)

(assert (=> b!138236 m!165391))

(declare-fun m!165393 () Bool)

(assert (=> b!138236 m!165393))

(declare-fun m!165395 () Bool)

(assert (=> b!138236 m!165395))

(assert (=> b!138236 m!165363))

(assert (=> b!138236 m!165393))

(assert (=> b!138236 m!165363))

(assert (=> b!138236 m!165395))

(declare-fun m!165397 () Bool)

(assert (=> b!138236 m!165397))

(assert (=> b!138236 m!165391))

(declare-fun m!165399 () Bool)

(assert (=> mapNonEmpty!4763 m!165399))

(check-sat (not b_next!2991) b_and!8619 (not b!138228) (not b!138240) (not mapNonEmpty!4763) (not b!138232) (not b_lambda!6205) (not b!138236) (not b!138230) (not b!138231) b_and!8617 (not b_next!2989) (not b!138229) tp_is_empty!2911 (not mapNonEmpty!4764) (not start!14590))
(check-sat b_and!8617 b_and!8619 (not b_next!2989) (not b_next!2991))
(get-model)

(declare-fun b_lambda!6211 () Bool)

(assert (= b_lambda!6205 (or (and b!138240 b_free!2989) (and b!138229 b_free!2991 (= (defaultEntry!2918 newMap!16) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))))) b_lambda!6211)))

(check-sat (not b_next!2991) b_and!8619 (not b!138228) (not b!138240) (not mapNonEmpty!4763) (not b_lambda!6211) (not b!138232) (not b!138236) (not b!138230) (not b!138231) b_and!8617 (not b_next!2989) (not b!138229) tp_is_empty!2911 (not mapNonEmpty!4764) (not start!14590))
(check-sat b_and!8617 b_and!8619 (not b_next!2989) (not b_next!2991))
(get-model)

(declare-fun d!43339 () Bool)

(assert (=> d!43339 (= (array_inv!1429 (_keys!4675 newMap!16)) (bvsge (size!2559 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138229 d!43339))

(declare-fun d!43341 () Bool)

(assert (=> d!43341 (= (array_inv!1430 (_values!2901 newMap!16)) (bvsge (size!2560 (_values!2901 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138229 d!43341))

(declare-fun d!43343 () Bool)

(declare-fun e!90200 () Bool)

(assert (=> d!43343 e!90200))

(declare-fun res!66232 () Bool)

(assert (=> d!43343 (=> res!66232 e!90200)))

(declare-fun lt!72262 () Bool)

(assert (=> d!43343 (= res!66232 (not lt!72262))))

(declare-fun lt!72261 () Bool)

(assert (=> d!43343 (= lt!72262 lt!72261)))

(declare-fun lt!72263 () Unit!4353)

(declare-fun e!90199 () Unit!4353)

(assert (=> d!43343 (= lt!72263 e!90199)))

(declare-fun c!25881 () Bool)

(assert (=> d!43343 (= c!25881 lt!72261)))

(declare-fun containsKey!178 (List!1709 (_ BitVec 64)) Bool)

(assert (=> d!43343 (= lt!72261 (containsKey!178 (toList!854 lt!72226) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> d!43343 (= (contains!897 lt!72226 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) lt!72262)))

(declare-fun b!138359 () Bool)

(declare-fun lt!72260 () Unit!4353)

(assert (=> b!138359 (= e!90199 lt!72260)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!126 (List!1709 (_ BitVec 64)) Unit!4353)

(assert (=> b!138359 (= lt!72260 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!854 lt!72226) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-datatypes ((Option!181 0))(
  ( (Some!180 (v!3259 V!3529)) (None!179) )
))
(declare-fun isDefined!127 (Option!181) Bool)

(declare-fun getValueByKey!175 (List!1709 (_ BitVec 64)) Option!181)

(assert (=> b!138359 (isDefined!127 (getValueByKey!175 (toList!854 lt!72226) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun b!138360 () Bool)

(declare-fun Unit!4355 () Unit!4353)

(assert (=> b!138360 (= e!90199 Unit!4355)))

(declare-fun b!138361 () Bool)

(assert (=> b!138361 (= e!90200 (isDefined!127 (getValueByKey!175 (toList!854 lt!72226) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355))))))

(assert (= (and d!43343 c!25881) b!138359))

(assert (= (and d!43343 (not c!25881)) b!138360))

(assert (= (and d!43343 (not res!66232)) b!138361))

(assert (=> d!43343 m!165363))

(declare-fun m!165477 () Bool)

(assert (=> d!43343 m!165477))

(assert (=> b!138359 m!165363))

(declare-fun m!165479 () Bool)

(assert (=> b!138359 m!165479))

(assert (=> b!138359 m!165363))

(declare-fun m!165481 () Bool)

(assert (=> b!138359 m!165481))

(assert (=> b!138359 m!165481))

(declare-fun m!165483 () Bool)

(assert (=> b!138359 m!165483))

(assert (=> b!138361 m!165363))

(assert (=> b!138361 m!165481))

(assert (=> b!138361 m!165481))

(assert (=> b!138361 m!165483))

(assert (=> b!138236 d!43343))

(declare-fun c!25915 () Bool)

(declare-fun c!25918 () Bool)

(declare-fun call!15218 () ListLongMap!1677)

(declare-fun call!15211 () ListLongMap!1677)

(declare-fun call!15216 () ListLongMap!1677)

(declare-fun bm!15204 () Bool)

(declare-fun +!171 (ListLongMap!1677 tuple2!2606) ListLongMap!1677)

(assert (=> bm!15204 (= call!15211 (+!171 (ite c!25915 call!15218 call!15216) (ite c!25915 (ite c!25918 (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!138442 () Bool)

(declare-fun res!66262 () Bool)

(declare-fun e!90263 () Bool)

(assert (=> b!138442 (=> (not res!66262) (not e!90263))))

(declare-datatypes ((SeekEntryResult!271 0))(
  ( (MissingZero!271 (index!3246 (_ BitVec 32))) (Found!271 (index!3247 (_ BitVec 32))) (Intermediate!271 (undefined!1083 Bool) (index!3248 (_ BitVec 32)) (x!15985 (_ BitVec 32))) (Undefined!271) (MissingVacant!271 (index!3249 (_ BitVec 32))) )
))
(declare-fun lt!72337 () SeekEntryResult!271)

(assert (=> b!138442 (= res!66262 (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3246 lt!72337)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15205 () Bool)

(declare-fun call!15213 () ListLongMap!1677)

(assert (=> bm!15205 (= call!15213 call!15216)))

(declare-fun b!138443 () Bool)

(declare-fun res!66271 () Bool)

(assert (=> b!138443 (= res!66271 (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3249 lt!72337)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!90244 () Bool)

(assert (=> b!138443 (=> (not res!66271) (not e!90244))))

(declare-fun b!138444 () Bool)

(declare-fun call!15229 () Bool)

(assert (=> b!138444 (= e!90244 (not call!15229))))

(declare-fun b!138445 () Bool)

(assert (=> b!138445 (= e!90263 (not call!15229))))

(declare-fun b!138446 () Bool)

(declare-fun e!90243 () Bool)

(assert (=> b!138446 (= e!90243 e!90244)))

(declare-fun res!66263 () Bool)

(declare-fun call!15214 () Bool)

(assert (=> b!138446 (= res!66263 call!15214)))

(assert (=> b!138446 (=> (not res!66263) (not e!90244))))

(declare-fun b!138447 () Bool)

(declare-fun e!90252 () Bool)

(declare-fun e!90251 () Bool)

(assert (=> b!138447 (= e!90252 e!90251)))

(declare-fun res!66269 () Bool)

(declare-fun call!15221 () ListLongMap!1677)

(assert (=> b!138447 (= res!66269 (contains!897 call!15221 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> b!138447 (=> (not res!66269) (not e!90251))))

(declare-fun bm!15206 () Bool)

(declare-fun c!25912 () Bool)

(declare-fun c!25914 () Bool)

(assert (=> bm!15206 (= c!25912 c!25914)))

(declare-fun e!90258 () ListLongMap!1677)

(declare-fun lt!72322 () SeekEntryResult!271)

(declare-fun call!15228 () Bool)

(assert (=> bm!15206 (= call!15228 (contains!897 e!90258 (ite c!25914 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (select (arr!2288 (_keys!4675 newMap!16)) (index!3247 lt!72322)))))))

(declare-fun b!138448 () Bool)

(declare-fun e!90261 () tuple2!2608)

(declare-fun e!90245 () tuple2!2608)

(assert (=> b!138448 (= e!90261 e!90245)))

(assert (=> b!138448 (= c!25918 (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138449 () Bool)

(declare-fun res!66264 () Bool)

(declare-fun e!90255 () Bool)

(assert (=> b!138449 (=> (not res!66264) (not e!90255))))

(declare-fun call!15219 () Bool)

(assert (=> b!138449 (= res!66264 call!15219)))

(declare-fun e!90250 () Bool)

(assert (=> b!138449 (= e!90250 e!90255)))

(declare-fun bm!15207 () Bool)

(declare-fun call!15212 () Bool)

(assert (=> bm!15207 (= call!15229 call!15212)))

(declare-fun b!138450 () Bool)

(declare-fun e!90256 () Unit!4353)

(declare-fun lt!72332 () Unit!4353)

(assert (=> b!138450 (= e!90256 lt!72332)))

(declare-fun call!15208 () Unit!4353)

(assert (=> b!138450 (= lt!72332 call!15208)))

(declare-fun call!15210 () SeekEntryResult!271)

(assert (=> b!138450 (= lt!72337 call!15210)))

(declare-fun c!25913 () Bool)

(assert (=> b!138450 (= c!25913 ((_ is MissingZero!271) lt!72337))))

(declare-fun e!90248 () Bool)

(assert (=> b!138450 e!90248))

(declare-fun b!138451 () Bool)

(declare-fun res!66267 () Bool)

(declare-fun call!15207 () Bool)

(assert (=> b!138451 (= res!66267 call!15207)))

(declare-fun e!90262 () Bool)

(assert (=> b!138451 (=> (not res!66267) (not e!90262))))

(declare-fun bm!15208 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!63 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) Int) Unit!4353)

(assert (=> bm!15208 (= call!15208 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!63 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)))))

(declare-fun b!138452 () Bool)

(assert (=> b!138452 (= e!90243 ((_ is Undefined!271) lt!72337))))

(declare-fun call!15225 () SeekEntryResult!271)

(declare-fun bm!15209 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4839 (_ BitVec 32)) SeekEntryResult!271)

(assert (=> bm!15209 (= call!15225 (seekEntryOrOpen!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (_keys!4675 newMap!16) (mask!7248 newMap!16)))))

(declare-fun c!25911 () Bool)

(declare-fun lt!72319 () SeekEntryResult!271)

(declare-fun bm!15210 () Bool)

(declare-fun c!25909 () Bool)

(declare-fun c!25919 () Bool)

(declare-fun lt!72334 () SeekEntryResult!271)

(declare-fun lt!72328 () SeekEntryResult!271)

(declare-fun call!15215 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!15210 (= call!15215 (inRange!0 (ite c!25914 (ite c!25919 (index!3247 lt!72328) (ite c!25913 (index!3246 lt!72337) (index!3249 lt!72337))) (ite c!25911 (index!3247 lt!72334) (ite c!25909 (index!3246 lt!72319) (index!3249 lt!72319)))) (mask!7248 newMap!16)))))

(declare-fun b!138453 () Bool)

(declare-fun e!90246 () Bool)

(assert (=> b!138453 (= e!90246 e!90252)))

(declare-fun c!25920 () Bool)

(declare-fun lt!72329 () tuple2!2608)

(assert (=> b!138453 (= c!25920 (_1!1315 lt!72329))))

(declare-fun b!138454 () Bool)

(declare-fun e!90253 () tuple2!2608)

(declare-fun e!90249 () tuple2!2608)

(assert (=> b!138454 (= e!90253 e!90249)))

(declare-fun c!25910 () Bool)

(assert (=> b!138454 (= c!25910 ((_ is MissingZero!271) lt!72322))))

(declare-fun b!138455 () Bool)

(declare-fun lt!72335 () tuple2!2608)

(assert (=> b!138455 (= e!90253 (tuple2!2609 (_1!1315 lt!72335) (_2!1315 lt!72335)))))

(declare-fun call!15209 () tuple2!2608)

(assert (=> b!138455 (= lt!72335 call!15209)))

(declare-fun bm!15211 () Bool)

(assert (=> bm!15211 (= call!15214 call!15207)))

(declare-fun b!138456 () Bool)

(declare-fun res!66273 () Bool)

(assert (=> b!138456 (=> (not res!66273) (not e!90255))))

(assert (=> b!138456 (= res!66273 (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3246 lt!72319)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138457 () Bool)

(declare-fun e!90260 () Unit!4353)

(declare-fun lt!72344 () Unit!4353)

(assert (=> b!138457 (= e!90260 lt!72344)))

(declare-fun call!15230 () Unit!4353)

(assert (=> b!138457 (= lt!72344 call!15230)))

(declare-fun call!15227 () SeekEntryResult!271)

(assert (=> b!138457 (= lt!72334 call!15227)))

(declare-fun res!66274 () Bool)

(assert (=> b!138457 (= res!66274 ((_ is Found!271) lt!72334))))

(declare-fun e!90259 () Bool)

(assert (=> b!138457 (=> (not res!66274) (not e!90259))))

(assert (=> b!138457 e!90259))

(declare-fun b!138458 () Bool)

(declare-fun call!15220 () Bool)

(assert (=> b!138458 (= e!90255 (not call!15220))))

(declare-fun lt!72326 () (_ BitVec 32))

(declare-fun bm!15212 () Bool)

(declare-fun lt!72331 () (_ BitVec 32))

(assert (=> bm!15212 (= call!15216 (getCurrentListMap!527 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun b!138459 () Bool)

(declare-fun c!25917 () Bool)

(assert (=> b!138459 (= c!25917 ((_ is MissingVacant!271) lt!72322))))

(declare-fun e!90257 () tuple2!2608)

(assert (=> b!138459 (= e!90257 e!90253)))

(declare-fun b!138460 () Bool)

(declare-fun call!15224 () ListLongMap!1677)

(assert (=> b!138460 (= e!90258 call!15224)))

(declare-fun b!138461 () Bool)

(declare-fun e!90254 () Bool)

(assert (=> b!138461 (= e!90254 ((_ is Undefined!271) lt!72319))))

(declare-fun d!43345 () Bool)

(assert (=> d!43345 e!90246))

(declare-fun res!66270 () Bool)

(assert (=> d!43345 (=> (not res!66270) (not e!90246))))

(assert (=> d!43345 (= res!66270 (valid!558 (_2!1315 lt!72329)))))

(assert (=> d!43345 (= lt!72329 e!90261)))

(assert (=> d!43345 (= c!25915 (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvneg (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355))))))

(assert (=> d!43345 (valid!558 newMap!16)))

(assert (=> d!43345 (= (update!205 newMap!16 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!72329)))

(declare-fun b!138462 () Bool)

(declare-fun call!15226 () ListLongMap!1677)

(assert (=> b!138462 (= e!90252 (= call!15221 call!15226))))

(declare-fun bm!15213 () Bool)

(assert (=> bm!15213 (= call!15207 call!15215)))

(declare-fun bm!15214 () Bool)

(assert (=> bm!15214 (= call!15220 call!15212)))

(declare-fun bm!15215 () Bool)

(declare-fun call!15217 () ListLongMap!1677)

(assert (=> bm!15215 (= call!15217 call!15211)))

(declare-fun b!138463 () Bool)

(declare-fun lt!72325 () tuple2!2608)

(assert (=> b!138463 (= lt!72325 call!15209)))

(assert (=> b!138463 (= e!90249 (tuple2!2609 (_1!1315 lt!72325) (_2!1315 lt!72325)))))

(declare-fun b!138464 () Bool)

(assert (=> b!138464 (= e!90251 (= call!15221 (+!171 call!15226 (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!138465 () Bool)

(declare-fun res!66266 () Bool)

(declare-fun call!15222 () Bool)

(assert (=> b!138465 (= res!66266 call!15222)))

(assert (=> b!138465 (=> (not res!66266) (not e!90259))))

(declare-fun call!15223 () ListLongMap!1677)

(declare-fun bm!15216 () Bool)

(assert (=> bm!15216 (= call!15223 (getCurrentListMap!527 (_keys!4675 newMap!16) (ite (or c!25915 c!25914) (_values!2901 newMap!16) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (index!3247 lt!72322) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16)))) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun b!138466 () Bool)

(assert (=> b!138466 (= e!90262 (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3247 lt!72328)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun b!138467 () Bool)

(assert (=> b!138467 (= e!90261 e!90257)))

(assert (=> b!138467 (= lt!72322 (seekEntryOrOpen!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (_keys!4675 newMap!16) (mask!7248 newMap!16)))))

(assert (=> b!138467 (= c!25914 ((_ is Undefined!271) lt!72322))))

(declare-fun b!138468 () Bool)

(declare-fun e!90247 () Bool)

(assert (=> b!138468 (= e!90247 (not call!15220))))

(declare-fun bm!15217 () Bool)

(assert (=> bm!15217 (= call!15222 call!15215)))

(declare-fun bm!15218 () Bool)

(assert (=> bm!15218 (= call!15219 call!15222)))

(declare-fun b!138469 () Bool)

(declare-fun Unit!4356 () Unit!4353)

(assert (=> b!138469 (= e!90256 Unit!4356)))

(declare-fun lt!72338 () Unit!4353)

(assert (=> b!138469 (= lt!72338 call!15230)))

(assert (=> b!138469 (= lt!72328 call!15210)))

(declare-fun res!66265 () Bool)

(assert (=> b!138469 (= res!66265 ((_ is Found!271) lt!72328))))

(assert (=> b!138469 (=> (not res!66265) (not e!90262))))

(assert (=> b!138469 e!90262))

(declare-fun lt!72324 () Unit!4353)

(assert (=> b!138469 (= lt!72324 lt!72338)))

(assert (=> b!138469 false))

(declare-fun bm!15219 () Bool)

(assert (=> bm!15219 (= call!15210 call!15225)))

(declare-fun b!138470 () Bool)

(declare-fun c!25908 () Bool)

(assert (=> b!138470 (= c!25908 ((_ is MissingVacant!271) lt!72337))))

(assert (=> b!138470 (= e!90248 e!90243)))

(declare-fun b!138471 () Bool)

(declare-fun c!25916 () Bool)

(assert (=> b!138471 (= c!25916 ((_ is MissingVacant!271) lt!72319))))

(assert (=> b!138471 (= e!90250 e!90254)))

(declare-fun b!138472 () Bool)

(declare-fun lt!72330 () Unit!4353)

(declare-fun lt!72320 () Unit!4353)

(assert (=> b!138472 (= lt!72330 lt!72320)))

(assert (=> b!138472 call!15228))

(declare-fun lt!72339 () array!4841)

(declare-fun lemmaValidKeyInArrayIsInListMap!123 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) Int) Unit!4353)

(assert (=> b!138472 (= lt!72320 (lemmaValidKeyInArrayIsInListMap!123 (_keys!4675 newMap!16) lt!72339 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (index!3247 lt!72322) (defaultEntry!2918 newMap!16)))))

(assert (=> b!138472 (= lt!72339 (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (index!3247 lt!72322) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16))))))

(declare-fun lt!72341 () Unit!4353)

(declare-fun lt!72318 () Unit!4353)

(assert (=> b!138472 (= lt!72341 lt!72318)))

(assert (=> b!138472 (= call!15211 call!15224)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!63 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) (_ BitVec 64) V!3529 Int) Unit!4353)

(assert (=> b!138472 (= lt!72318 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!63 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (index!3247 lt!72322) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72343 () Unit!4353)

(assert (=> b!138472 (= lt!72343 e!90260)))

(assert (=> b!138472 (= c!25911 (contains!897 call!15216 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> b!138472 (= e!90249 (tuple2!2609 true (LongMapFixedSize!1133 (defaultEntry!2918 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (_size!615 newMap!16) (_keys!4675 newMap!16) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (index!3247 lt!72322) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16))) (_vacant!615 newMap!16))))))

(declare-fun bm!15220 () Bool)

(declare-fun updateHelperNewKey!63 (LongMapFixedSize!1132 (_ BitVec 64) V!3529 (_ BitVec 32)) tuple2!2608)

(assert (=> bm!15220 (= call!15209 (updateHelperNewKey!63 newMap!16 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322))))))

(declare-fun bm!15221 () Bool)

(assert (=> bm!15221 (= call!15221 (map!1419 (_2!1315 lt!72329)))))

(declare-fun b!138473 () Bool)

(declare-fun lt!72342 () Unit!4353)

(declare-fun lt!72333 () Unit!4353)

(assert (=> b!138473 (= lt!72342 lt!72333)))

(assert (=> b!138473 (= call!15217 call!15213)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!63 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 V!3529 Int) Unit!4353)

(assert (=> b!138473 (= lt!72333 (lemmaChangeZeroKeyThenAddPairToListMap!63 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) lt!72331 (zeroValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2769 newMap!16) (defaultEntry!2918 newMap!16)))))

(assert (=> b!138473 (= lt!72331 (bvor (extraKeys!2675 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!138473 (= e!90245 (tuple2!2609 true (LongMapFixedSize!1133 (defaultEntry!2918 newMap!16) (mask!7248 newMap!16) (bvor (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2769 newMap!16) (_size!615 newMap!16) (_keys!4675 newMap!16) (_values!2901 newMap!16) (_vacant!615 newMap!16))))))

(declare-fun bm!15222 () Bool)

(assert (=> bm!15222 (= call!15227 call!15225)))

(declare-fun b!138474 () Bool)

(declare-fun res!66268 () Bool)

(assert (=> b!138474 (= res!66268 (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3249 lt!72319)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138474 (=> (not res!66268) (not e!90247))))

(declare-fun b!138475 () Bool)

(declare-fun res!66272 () Bool)

(assert (=> b!138475 (=> (not res!66272) (not e!90263))))

(assert (=> b!138475 (= res!66272 call!15214)))

(assert (=> b!138475 (= e!90248 e!90263)))

(declare-fun bm!15223 () Bool)

(assert (=> bm!15223 (= call!15212 (arrayContainsKey!0 (_keys!4675 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!138476 () Bool)

(assert (=> b!138476 (= e!90254 e!90247)))

(declare-fun res!66261 () Bool)

(assert (=> b!138476 (= res!66261 call!15219)))

(assert (=> b!138476 (=> (not res!66261) (not e!90247))))

(declare-fun bm!15224 () Bool)

(assert (=> bm!15224 (= call!15226 (map!1419 newMap!16))))

(declare-fun bm!15225 () Bool)

(assert (=> bm!15225 (= call!15218 call!15223)))

(declare-fun bm!15226 () Bool)

(assert (=> bm!15226 (= call!15224 call!15223)))

(declare-fun b!138477 () Bool)

(declare-fun Unit!4357 () Unit!4353)

(assert (=> b!138477 (= e!90260 Unit!4357)))

(declare-fun lt!72327 () Unit!4353)

(assert (=> b!138477 (= lt!72327 call!15208)))

(assert (=> b!138477 (= lt!72319 call!15227)))

(assert (=> b!138477 (= c!25909 ((_ is MissingZero!271) lt!72319))))

(assert (=> b!138477 e!90250))

(declare-fun lt!72323 () Unit!4353)

(assert (=> b!138477 (= lt!72323 lt!72327)))

(assert (=> b!138477 false))

(declare-fun b!138478 () Bool)

(declare-fun lt!72336 () Unit!4353)

(declare-fun lt!72340 () Unit!4353)

(assert (=> b!138478 (= lt!72336 lt!72340)))

(assert (=> b!138478 (= call!15217 call!15213)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!63 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 V!3529 Int) Unit!4353)

(assert (=> b!138478 (= lt!72340 (lemmaChangeLongMinValueKeyThenAddPairToListMap!63 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) lt!72326 (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)))))

(assert (=> b!138478 (= lt!72326 (bvor (extraKeys!2675 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!138478 (= e!90245 (tuple2!2609 true (LongMapFixedSize!1133 (defaultEntry!2918 newMap!16) (mask!7248 newMap!16) (bvor (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) (zeroValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!615 newMap!16) (_keys!4675 newMap!16) (_values!2901 newMap!16) (_vacant!615 newMap!16))))))

(declare-fun b!138479 () Bool)

(assert (=> b!138479 (= e!90259 (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3247 lt!72334)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun b!138480 () Bool)

(assert (=> b!138480 (= e!90258 (getCurrentListMap!527 (_keys!4675 newMap!16) lt!72339 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun b!138481 () Bool)

(declare-fun lt!72321 () Unit!4353)

(assert (=> b!138481 (= lt!72321 e!90256)))

(assert (=> b!138481 (= c!25919 call!15228)))

(assert (=> b!138481 (= e!90257 (tuple2!2609 false newMap!16))))

(declare-fun bm!15227 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!63 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) Int) Unit!4353)

(assert (=> bm!15227 (= call!15230 (lemmaInListMapThenSeekEntryOrOpenFindsIt!63 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)))))

(assert (= (and d!43345 c!25915) b!138448))

(assert (= (and d!43345 (not c!25915)) b!138467))

(assert (= (and b!138448 c!25918) b!138473))

(assert (= (and b!138448 (not c!25918)) b!138478))

(assert (= (or b!138473 b!138478) bm!15205))

(assert (= (or b!138473 b!138478) bm!15225))

(assert (= (or b!138473 b!138478) bm!15215))

(assert (= (and b!138467 c!25914) b!138481))

(assert (= (and b!138467 (not c!25914)) b!138459))

(assert (= (and b!138481 c!25919) b!138469))

(assert (= (and b!138481 (not c!25919)) b!138450))

(assert (= (and b!138469 res!66265) b!138451))

(assert (= (and b!138451 res!66267) b!138466))

(assert (= (and b!138450 c!25913) b!138475))

(assert (= (and b!138450 (not c!25913)) b!138470))

(assert (= (and b!138475 res!66272) b!138442))

(assert (= (and b!138442 res!66262) b!138445))

(assert (= (and b!138470 c!25908) b!138446))

(assert (= (and b!138470 (not c!25908)) b!138452))

(assert (= (and b!138446 res!66263) b!138443))

(assert (= (and b!138443 res!66271) b!138444))

(assert (= (or b!138475 b!138446) bm!15211))

(assert (= (or b!138445 b!138444) bm!15207))

(assert (= (or b!138451 bm!15211) bm!15213))

(assert (= (or b!138469 b!138450) bm!15219))

(assert (= (and b!138459 c!25917) b!138455))

(assert (= (and b!138459 (not c!25917)) b!138454))

(assert (= (and b!138454 c!25910) b!138463))

(assert (= (and b!138454 (not c!25910)) b!138472))

(assert (= (and b!138472 c!25911) b!138457))

(assert (= (and b!138472 (not c!25911)) b!138477))

(assert (= (and b!138457 res!66274) b!138465))

(assert (= (and b!138465 res!66266) b!138479))

(assert (= (and b!138477 c!25909) b!138449))

(assert (= (and b!138477 (not c!25909)) b!138471))

(assert (= (and b!138449 res!66264) b!138456))

(assert (= (and b!138456 res!66273) b!138458))

(assert (= (and b!138471 c!25916) b!138476))

(assert (= (and b!138471 (not c!25916)) b!138461))

(assert (= (and b!138476 res!66261) b!138474))

(assert (= (and b!138474 res!66268) b!138468))

(assert (= (or b!138449 b!138476) bm!15218))

(assert (= (or b!138458 b!138468) bm!15214))

(assert (= (or b!138465 bm!15218) bm!15217))

(assert (= (or b!138457 b!138477) bm!15222))

(assert (= (or b!138455 b!138463) bm!15220))

(assert (= (or b!138469 b!138457) bm!15227))

(assert (= (or b!138481 b!138472) bm!15226))

(assert (= (or bm!15207 bm!15214) bm!15223))

(assert (= (or b!138450 b!138477) bm!15208))

(assert (= (or bm!15213 bm!15217) bm!15210))

(assert (= (or bm!15219 bm!15222) bm!15209))

(assert (= (or b!138481 b!138472) bm!15206))

(assert (= (and bm!15206 c!25912) b!138460))

(assert (= (and bm!15206 (not c!25912)) b!138480))

(assert (= (or bm!15225 bm!15226) bm!15216))

(assert (= (or bm!15205 b!138472) bm!15212))

(assert (= (or bm!15215 b!138472) bm!15204))

(assert (= (and d!43345 res!66270) b!138453))

(assert (= (and b!138453 c!25920) b!138447))

(assert (= (and b!138453 (not c!25920)) b!138462))

(assert (= (and b!138447 res!66269) b!138464))

(assert (= (or b!138447 b!138464 b!138462) bm!15221))

(assert (= (or b!138464 b!138462) bm!15224))

(declare-fun m!165485 () Bool)

(assert (=> b!138466 m!165485))

(declare-fun m!165487 () Bool)

(assert (=> b!138464 m!165487))

(declare-fun m!165489 () Bool)

(assert (=> b!138472 m!165489))

(declare-fun m!165491 () Bool)

(assert (=> b!138472 m!165491))

(assert (=> b!138472 m!165363))

(assert (=> b!138472 m!165395))

(declare-fun m!165493 () Bool)

(assert (=> b!138472 m!165493))

(assert (=> b!138472 m!165363))

(declare-fun m!165495 () Bool)

(assert (=> b!138472 m!165495))

(assert (=> bm!15227 m!165363))

(declare-fun m!165497 () Bool)

(assert (=> bm!15227 m!165497))

(declare-fun m!165499 () Bool)

(assert (=> b!138456 m!165499))

(assert (=> b!138478 m!165395))

(declare-fun m!165501 () Bool)

(assert (=> b!138478 m!165501))

(assert (=> bm!15224 m!165365))

(declare-fun m!165503 () Bool)

(assert (=> bm!15221 m!165503))

(assert (=> bm!15223 m!165363))

(declare-fun m!165505 () Bool)

(assert (=> bm!15223 m!165505))

(assert (=> bm!15208 m!165363))

(declare-fun m!165507 () Bool)

(assert (=> bm!15208 m!165507))

(declare-fun m!165509 () Bool)

(assert (=> b!138474 m!165509))

(assert (=> b!138473 m!165395))

(declare-fun m!165511 () Bool)

(assert (=> b!138473 m!165511))

(assert (=> b!138467 m!165363))

(declare-fun m!165513 () Bool)

(assert (=> b!138467 m!165513))

(declare-fun m!165515 () Bool)

(assert (=> b!138443 m!165515))

(declare-fun m!165517 () Bool)

(assert (=> bm!15206 m!165517))

(declare-fun m!165519 () Bool)

(assert (=> bm!15206 m!165519))

(assert (=> bm!15209 m!165363))

(assert (=> bm!15209 m!165513))

(declare-fun m!165521 () Bool)

(assert (=> bm!15204 m!165521))

(declare-fun m!165523 () Bool)

(assert (=> b!138479 m!165523))

(declare-fun m!165525 () Bool)

(assert (=> bm!15212 m!165525))

(declare-fun m!165527 () Bool)

(assert (=> b!138442 m!165527))

(assert (=> bm!15216 m!165491))

(declare-fun m!165529 () Bool)

(assert (=> bm!15216 m!165529))

(declare-fun m!165531 () Bool)

(assert (=> bm!15210 m!165531))

(assert (=> b!138447 m!165363))

(declare-fun m!165533 () Bool)

(assert (=> b!138447 m!165533))

(declare-fun m!165535 () Bool)

(assert (=> d!43345 m!165535))

(assert (=> d!43345 m!165387))

(declare-fun m!165537 () Bool)

(assert (=> b!138480 m!165537))

(assert (=> bm!15220 m!165363))

(assert (=> bm!15220 m!165395))

(declare-fun m!165539 () Bool)

(assert (=> bm!15220 m!165539))

(assert (=> b!138236 d!43345))

(declare-fun d!43347 () Bool)

(declare-fun c!25923 () Bool)

(assert (=> d!43347 (= c!25923 ((_ is ValueCellFull!1112) (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun e!90266 () V!3529)

(assert (=> d!43347 (= (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!90266)))

(declare-fun b!138486 () Bool)

(declare-fun get!1517 (ValueCell!1112 V!3529) V!3529)

(assert (=> b!138486 (= e!90266 (get!1517 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!138487 () Bool)

(declare-fun get!1518 (ValueCell!1112 V!3529) V!3529)

(assert (=> b!138487 (= e!90266 (get!1518 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43347 c!25923) b!138486))

(assert (= (and d!43347 (not c!25923)) b!138487))

(assert (=> b!138486 m!165391))

(assert (=> b!138486 m!165393))

(declare-fun m!165541 () Bool)

(assert (=> b!138486 m!165541))

(assert (=> b!138487 m!165391))

(assert (=> b!138487 m!165393))

(declare-fun m!165543 () Bool)

(assert (=> b!138487 m!165543))

(assert (=> b!138236 d!43347))

(declare-fun d!43349 () Bool)

(declare-fun res!66281 () Bool)

(declare-fun e!90269 () Bool)

(assert (=> d!43349 (=> (not res!66281) (not e!90269))))

(declare-fun simpleValid!94 (LongMapFixedSize!1132) Bool)

(assert (=> d!43349 (= res!66281 (simpleValid!94 newMap!16))))

(assert (=> d!43349 (= (valid!558 newMap!16) e!90269)))

(declare-fun b!138494 () Bool)

(declare-fun res!66282 () Bool)

(assert (=> b!138494 (=> (not res!66282) (not e!90269))))

(declare-fun arrayCountValidKeys!0 (array!4839 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!138494 (= res!66282 (= (arrayCountValidKeys!0 (_keys!4675 newMap!16) #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))) (_size!615 newMap!16)))))

(declare-fun b!138495 () Bool)

(declare-fun res!66283 () Bool)

(assert (=> b!138495 (=> (not res!66283) (not e!90269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4839 (_ BitVec 32)) Bool)

(assert (=> b!138495 (= res!66283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4675 newMap!16) (mask!7248 newMap!16)))))

(declare-fun b!138496 () Bool)

(assert (=> b!138496 (= e!90269 (arrayNoDuplicates!0 (_keys!4675 newMap!16) #b00000000000000000000000000000000 Nil!1707))))

(assert (= (and d!43349 res!66281) b!138494))

(assert (= (and b!138494 res!66282) b!138495))

(assert (= (and b!138495 res!66283) b!138496))

(declare-fun m!165545 () Bool)

(assert (=> d!43349 m!165545))

(declare-fun m!165547 () Bool)

(assert (=> b!138494 m!165547))

(declare-fun m!165549 () Bool)

(assert (=> b!138495 m!165549))

(declare-fun m!165551 () Bool)

(assert (=> b!138496 m!165551))

(assert (=> b!138228 d!43349))

(declare-fun d!43351 () Bool)

(assert (=> d!43351 (= (array_inv!1429 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvsge (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!138240 d!43351))

(declare-fun d!43353 () Bool)

(assert (=> d!43353 (= (array_inv!1430 (_values!2901 (v!3254 (underlying!471 thiss!992)))) (bvsge (size!2560 (_values!2901 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!138240 d!43353))

(declare-fun b!138507 () Bool)

(declare-fun e!90278 () Bool)

(declare-fun e!90280 () Bool)

(assert (=> b!138507 (= e!90278 e!90280)))

(declare-fun c!25926 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!138507 (= c!25926 (validKeyInArray!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!138508 () Bool)

(declare-fun call!15233 () Bool)

(assert (=> b!138508 (= e!90280 call!15233)))

(declare-fun b!138509 () Bool)

(declare-fun e!90281 () Bool)

(declare-fun contains!898 (List!1710 (_ BitVec 64)) Bool)

(assert (=> b!138509 (= e!90281 (contains!898 Nil!1707 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!138510 () Bool)

(assert (=> b!138510 (= e!90280 call!15233)))

(declare-fun b!138511 () Bool)

(declare-fun e!90279 () Bool)

(assert (=> b!138511 (= e!90279 e!90278)))

(declare-fun res!66290 () Bool)

(assert (=> b!138511 (=> (not res!66290) (not e!90278))))

(assert (=> b!138511 (= res!66290 (not e!90281))))

(declare-fun res!66291 () Bool)

(assert (=> b!138511 (=> (not res!66291) (not e!90281))))

(assert (=> b!138511 (= res!66291 (validKeyInArray!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!43355 () Bool)

(declare-fun res!66292 () Bool)

(assert (=> d!43355 (=> res!66292 e!90279)))

(assert (=> d!43355 (= res!66292 (bvsge #b00000000000000000000000000000000 (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(assert (=> d!43355 (= (arrayNoDuplicates!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000000 Nil!1707) e!90279)))

(declare-fun bm!15230 () Bool)

(assert (=> bm!15230 (= call!15233 (arrayNoDuplicates!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!25926 (Cons!1706 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000) Nil!1707) Nil!1707)))))

(assert (= (and d!43355 (not res!66292)) b!138511))

(assert (= (and b!138511 res!66291) b!138509))

(assert (= (and b!138511 res!66290) b!138507))

(assert (= (and b!138507 c!25926) b!138510))

(assert (= (and b!138507 (not c!25926)) b!138508))

(assert (= (or b!138510 b!138508) bm!15230))

(declare-fun m!165553 () Bool)

(assert (=> b!138507 m!165553))

(assert (=> b!138507 m!165553))

(declare-fun m!165555 () Bool)

(assert (=> b!138507 m!165555))

(assert (=> b!138509 m!165553))

(assert (=> b!138509 m!165553))

(declare-fun m!165557 () Bool)

(assert (=> b!138509 m!165557))

(assert (=> b!138511 m!165553))

(assert (=> b!138511 m!165553))

(assert (=> b!138511 m!165555))

(assert (=> bm!15230 m!165553))

(declare-fun m!165559 () Bool)

(assert (=> bm!15230 m!165559))

(assert (=> b!138232 d!43355))

(declare-fun d!43357 () Bool)

(assert (=> d!43357 (= (map!1419 newMap!16) (getCurrentListMap!527 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun bs!5816 () Bool)

(assert (= bs!5816 d!43357))

(declare-fun m!165561 () Bool)

(assert (=> bs!5816 m!165561))

(assert (=> b!138230 d!43357))

(declare-fun b!138554 () Bool)

(declare-fun e!90312 () ListLongMap!1677)

(declare-fun call!15254 () ListLongMap!1677)

(assert (=> b!138554 (= e!90312 call!15254)))

(declare-fun b!138555 () Bool)

(declare-fun e!90315 () Unit!4353)

(declare-fun Unit!4358 () Unit!4353)

(assert (=> b!138555 (= e!90315 Unit!4358)))

(declare-fun b!138556 () Bool)

(declare-fun c!25942 () Bool)

(assert (=> b!138556 (= c!25942 (and (not (= (bvand (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!90310 () ListLongMap!1677)

(assert (=> b!138556 (= e!90310 e!90312)))

(declare-fun bm!15245 () Bool)

(declare-fun call!15253 () ListLongMap!1677)

(declare-fun getCurrentListMapNoExtraKeys!138 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) Int) ListLongMap!1677)

(assert (=> bm!15245 (= call!15253 (getCurrentListMapNoExtraKeys!138 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun b!138557 () Bool)

(declare-fun e!90318 () Bool)

(declare-fun e!90317 () Bool)

(assert (=> b!138557 (= e!90318 e!90317)))

(declare-fun res!66317 () Bool)

(assert (=> b!138557 (=> (not res!66317) (not e!90317))))

(declare-fun lt!72394 () ListLongMap!1677)

(assert (=> b!138557 (= res!66317 (contains!897 lt!72394 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!138557 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(declare-fun b!138558 () Bool)

(declare-fun res!66319 () Bool)

(declare-fun e!90320 () Bool)

(assert (=> b!138558 (=> (not res!66319) (not e!90320))))

(declare-fun e!90314 () Bool)

(assert (=> b!138558 (= res!66319 e!90314)))

(declare-fun c!25940 () Bool)

(assert (=> b!138558 (= c!25940 (not (= (bvand (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!138559 () Bool)

(declare-fun call!15252 () ListLongMap!1677)

(assert (=> b!138559 (= e!90312 call!15252)))

(declare-fun b!138560 () Bool)

(declare-fun e!90311 () Bool)

(declare-fun apply!118 (ListLongMap!1677 (_ BitVec 64)) V!3529)

(assert (=> b!138560 (= e!90311 (= (apply!118 lt!72394 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun call!15249 () ListLongMap!1677)

(declare-fun bm!15246 () Bool)

(declare-fun call!15248 () ListLongMap!1677)

(declare-fun c!25941 () Bool)

(declare-fun c!25943 () Bool)

(assert (=> bm!15246 (= call!15248 (+!171 (ite c!25943 call!15253 (ite c!25941 call!15249 call!15252)) (ite (or c!25943 c!25941) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(declare-fun b!138561 () Bool)

(declare-fun e!90319 () Bool)

(assert (=> b!138561 (= e!90319 (validKeyInArray!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!15247 () Bool)

(assert (=> bm!15247 (= call!15252 call!15249)))

(declare-fun b!138562 () Bool)

(declare-fun res!66318 () Bool)

(assert (=> b!138562 (=> (not res!66318) (not e!90320))))

(assert (=> b!138562 (= res!66318 e!90318)))

(declare-fun res!66315 () Bool)

(assert (=> b!138562 (=> res!66315 e!90318)))

(assert (=> b!138562 (= res!66315 (not e!90319))))

(declare-fun res!66311 () Bool)

(assert (=> b!138562 (=> (not res!66311) (not e!90319))))

(assert (=> b!138562 (= res!66311 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(declare-fun b!138563 () Bool)

(declare-fun e!90316 () Bool)

(assert (=> b!138563 (= e!90320 e!90316)))

(declare-fun c!25939 () Bool)

(assert (=> b!138563 (= c!25939 (not (= (bvand (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!43359 () Bool)

(assert (=> d!43359 e!90320))

(declare-fun res!66316 () Bool)

(assert (=> d!43359 (=> (not res!66316) (not e!90320))))

(assert (=> d!43359 (= res!66316 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))))

(declare-fun lt!72397 () ListLongMap!1677)

(assert (=> d!43359 (= lt!72394 lt!72397)))

(declare-fun lt!72390 () Unit!4353)

(assert (=> d!43359 (= lt!72390 e!90315)))

(declare-fun c!25944 () Bool)

(declare-fun e!90313 () Bool)

(assert (=> d!43359 (= c!25944 e!90313)))

(declare-fun res!66314 () Bool)

(assert (=> d!43359 (=> (not res!66314) (not e!90313))))

(assert (=> d!43359 (= res!66314 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(declare-fun e!90309 () ListLongMap!1677)

(assert (=> d!43359 (= lt!72397 e!90309)))

(assert (=> d!43359 (= c!25943 (and (not (= (bvand (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!43359 (validMask!0 (mask!7248 (v!3254 (underlying!471 thiss!992))))))

(assert (=> d!43359 (= (getCurrentListMap!527 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))) lt!72394)))

(declare-fun b!138564 () Bool)

(declare-fun lt!72392 () Unit!4353)

(assert (=> b!138564 (= e!90315 lt!72392)))

(declare-fun lt!72401 () ListLongMap!1677)

(assert (=> b!138564 (= lt!72401 (getCurrentListMapNoExtraKeys!138 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun lt!72406 () (_ BitVec 64))

(assert (=> b!138564 (= lt!72406 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72391 () (_ BitVec 64))

(assert (=> b!138564 (= lt!72391 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72400 () Unit!4353)

(declare-fun addStillContains!94 (ListLongMap!1677 (_ BitVec 64) V!3529 (_ BitVec 64)) Unit!4353)

(assert (=> b!138564 (= lt!72400 (addStillContains!94 lt!72401 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) lt!72391))))

(assert (=> b!138564 (contains!897 (+!171 lt!72401 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72391)))

(declare-fun lt!72399 () Unit!4353)

(assert (=> b!138564 (= lt!72399 lt!72400)))

(declare-fun lt!72396 () ListLongMap!1677)

(assert (=> b!138564 (= lt!72396 (getCurrentListMapNoExtraKeys!138 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun lt!72409 () (_ BitVec 64))

(assert (=> b!138564 (= lt!72409 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72402 () (_ BitVec 64))

(assert (=> b!138564 (= lt!72402 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72407 () Unit!4353)

(declare-fun addApplyDifferent!94 (ListLongMap!1677 (_ BitVec 64) V!3529 (_ BitVec 64)) Unit!4353)

(assert (=> b!138564 (= lt!72407 (addApplyDifferent!94 lt!72396 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992))) lt!72402))))

(assert (=> b!138564 (= (apply!118 (+!171 lt!72396 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72402) (apply!118 lt!72396 lt!72402))))

(declare-fun lt!72395 () Unit!4353)

(assert (=> b!138564 (= lt!72395 lt!72407)))

(declare-fun lt!72389 () ListLongMap!1677)

(assert (=> b!138564 (= lt!72389 (getCurrentListMapNoExtraKeys!138 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun lt!72403 () (_ BitVec 64))

(assert (=> b!138564 (= lt!72403 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72405 () (_ BitVec 64))

(assert (=> b!138564 (= lt!72405 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72398 () Unit!4353)

(assert (=> b!138564 (= lt!72398 (addApplyDifferent!94 lt!72389 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) lt!72405))))

(assert (=> b!138564 (= (apply!118 (+!171 lt!72389 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72405) (apply!118 lt!72389 lt!72405))))

(declare-fun lt!72404 () Unit!4353)

(assert (=> b!138564 (= lt!72404 lt!72398)))

(declare-fun lt!72410 () ListLongMap!1677)

(assert (=> b!138564 (= lt!72410 (getCurrentListMapNoExtraKeys!138 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun lt!72393 () (_ BitVec 64))

(assert (=> b!138564 (= lt!72393 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72408 () (_ BitVec 64))

(assert (=> b!138564 (= lt!72408 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!138564 (= lt!72392 (addApplyDifferent!94 lt!72410 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992))) lt!72408))))

(assert (=> b!138564 (= (apply!118 (+!171 lt!72410 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72408) (apply!118 lt!72410 lt!72408))))

(declare-fun b!138565 () Bool)

(declare-fun e!90308 () Bool)

(assert (=> b!138565 (= e!90308 (= (apply!118 lt!72394 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun b!138566 () Bool)

(assert (=> b!138566 (= e!90316 e!90311)))

(declare-fun res!66312 () Bool)

(declare-fun call!15250 () Bool)

(assert (=> b!138566 (= res!66312 call!15250)))

(assert (=> b!138566 (=> (not res!66312) (not e!90311))))

(declare-fun b!138567 () Bool)

(assert (=> b!138567 (= e!90309 e!90310)))

(assert (=> b!138567 (= c!25941 (and (not (= (bvand (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15248 () Bool)

(declare-fun call!15251 () Bool)

(assert (=> bm!15248 (= call!15251 (contains!897 lt!72394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138568 () Bool)

(assert (=> b!138568 (= e!90317 (= (apply!118 lt!72394 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138568 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2560 (_values!2901 (v!3254 (underlying!471 thiss!992))))))))

(assert (=> b!138568 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(declare-fun b!138569 () Bool)

(assert (=> b!138569 (= e!90314 e!90308)))

(declare-fun res!66313 () Bool)

(assert (=> b!138569 (= res!66313 call!15251)))

(assert (=> b!138569 (=> (not res!66313) (not e!90308))))

(declare-fun bm!15249 () Bool)

(assert (=> bm!15249 (= call!15249 call!15253)))

(declare-fun bm!15250 () Bool)

(assert (=> bm!15250 (= call!15250 (contains!897 lt!72394 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138570 () Bool)

(assert (=> b!138570 (= e!90316 (not call!15250))))

(declare-fun bm!15251 () Bool)

(assert (=> bm!15251 (= call!15254 call!15248)))

(declare-fun b!138571 () Bool)

(assert (=> b!138571 (= e!90313 (validKeyInArray!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!138572 () Bool)

(assert (=> b!138572 (= e!90314 (not call!15251))))

(declare-fun b!138573 () Bool)

(assert (=> b!138573 (= e!90309 (+!171 call!15248 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))))

(declare-fun b!138574 () Bool)

(assert (=> b!138574 (= e!90310 call!15254)))

(assert (= (and d!43359 c!25943) b!138573))

(assert (= (and d!43359 (not c!25943)) b!138567))

(assert (= (and b!138567 c!25941) b!138574))

(assert (= (and b!138567 (not c!25941)) b!138556))

(assert (= (and b!138556 c!25942) b!138554))

(assert (= (and b!138556 (not c!25942)) b!138559))

(assert (= (or b!138554 b!138559) bm!15247))

(assert (= (or b!138574 bm!15247) bm!15249))

(assert (= (or b!138574 b!138554) bm!15251))

(assert (= (or b!138573 bm!15249) bm!15245))

(assert (= (or b!138573 bm!15251) bm!15246))

(assert (= (and d!43359 res!66314) b!138571))

(assert (= (and d!43359 c!25944) b!138564))

(assert (= (and d!43359 (not c!25944)) b!138555))

(assert (= (and d!43359 res!66316) b!138562))

(assert (= (and b!138562 res!66311) b!138561))

(assert (= (and b!138562 (not res!66315)) b!138557))

(assert (= (and b!138557 res!66317) b!138568))

(assert (= (and b!138562 res!66318) b!138558))

(assert (= (and b!138558 c!25940) b!138569))

(assert (= (and b!138558 (not c!25940)) b!138572))

(assert (= (and b!138569 res!66313) b!138565))

(assert (= (or b!138569 b!138572) bm!15248))

(assert (= (and b!138558 res!66319) b!138563))

(assert (= (and b!138563 c!25939) b!138566))

(assert (= (and b!138563 (not c!25939)) b!138570))

(assert (= (and b!138566 res!66312) b!138560))

(assert (= (or b!138566 b!138570) bm!15250))

(declare-fun b_lambda!6213 () Bool)

(assert (=> (not b_lambda!6213) (not b!138568)))

(assert (=> b!138568 t!6242))

(declare-fun b_and!8637 () Bool)

(assert (= b_and!8617 (and (=> t!6242 result!4105) b_and!8637)))

(assert (=> b!138568 t!6244))

(declare-fun b_and!8639 () Bool)

(assert (= b_and!8619 (and (=> t!6244 result!4109) b_and!8639)))

(declare-fun m!165563 () Bool)

(assert (=> b!138565 m!165563))

(declare-fun m!165565 () Bool)

(assert (=> b!138561 m!165565))

(assert (=> b!138561 m!165565))

(declare-fun m!165567 () Bool)

(assert (=> b!138561 m!165567))

(declare-fun m!165569 () Bool)

(assert (=> bm!15248 m!165569))

(declare-fun m!165571 () Bool)

(assert (=> b!138564 m!165571))

(assert (=> b!138564 m!165565))

(declare-fun m!165573 () Bool)

(assert (=> b!138564 m!165573))

(declare-fun m!165575 () Bool)

(assert (=> b!138564 m!165575))

(declare-fun m!165577 () Bool)

(assert (=> b!138564 m!165577))

(declare-fun m!165579 () Bool)

(assert (=> b!138564 m!165579))

(declare-fun m!165581 () Bool)

(assert (=> b!138564 m!165581))

(declare-fun m!165583 () Bool)

(assert (=> b!138564 m!165583))

(declare-fun m!165585 () Bool)

(assert (=> b!138564 m!165585))

(assert (=> b!138564 m!165579))

(declare-fun m!165587 () Bool)

(assert (=> b!138564 m!165587))

(assert (=> b!138564 m!165573))

(declare-fun m!165589 () Bool)

(assert (=> b!138564 m!165589))

(declare-fun m!165591 () Bool)

(assert (=> b!138564 m!165591))

(declare-fun m!165593 () Bool)

(assert (=> b!138564 m!165593))

(declare-fun m!165595 () Bool)

(assert (=> b!138564 m!165595))

(assert (=> b!138564 m!165587))

(declare-fun m!165597 () Bool)

(assert (=> b!138564 m!165597))

(declare-fun m!165599 () Bool)

(assert (=> b!138564 m!165599))

(assert (=> b!138564 m!165595))

(declare-fun m!165601 () Bool)

(assert (=> b!138564 m!165601))

(assert (=> b!138568 m!165565))

(assert (=> b!138568 m!165393))

(declare-fun m!165603 () Bool)

(assert (=> b!138568 m!165603))

(assert (=> b!138568 m!165565))

(declare-fun m!165605 () Bool)

(assert (=> b!138568 m!165605))

(assert (=> b!138568 m!165603))

(assert (=> b!138568 m!165393))

(declare-fun m!165607 () Bool)

(assert (=> b!138568 m!165607))

(assert (=> b!138557 m!165565))

(assert (=> b!138557 m!165565))

(declare-fun m!165609 () Bool)

(assert (=> b!138557 m!165609))

(assert (=> bm!15245 m!165599))

(assert (=> b!138571 m!165565))

(assert (=> b!138571 m!165565))

(assert (=> b!138571 m!165567))

(declare-fun m!165611 () Bool)

(assert (=> d!43359 m!165611))

(declare-fun m!165613 () Bool)

(assert (=> b!138560 m!165613))

(declare-fun m!165615 () Bool)

(assert (=> bm!15250 m!165615))

(declare-fun m!165617 () Bool)

(assert (=> b!138573 m!165617))

(declare-fun m!165619 () Bool)

(assert (=> bm!15246 m!165619))

(assert (=> b!138230 d!43359))

(declare-fun d!43361 () Bool)

(assert (=> d!43361 (= (valid!559 thiss!992) (valid!558 (v!3254 (underlying!471 thiss!992))))))

(declare-fun bs!5817 () Bool)

(assert (= bs!5817 d!43361))

(declare-fun m!165621 () Bool)

(assert (=> bs!5817 m!165621))

(assert (=> start!14590 d!43361))

(declare-fun d!43363 () Bool)

(declare-fun res!66324 () Bool)

(declare-fun e!90325 () Bool)

(assert (=> d!43363 (=> res!66324 e!90325)))

(assert (=> d!43363 (= res!66324 (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> d!43363 (= (arrayContainsKey!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!90325)))

(declare-fun b!138579 () Bool)

(declare-fun e!90326 () Bool)

(assert (=> b!138579 (= e!90325 e!90326)))

(declare-fun res!66325 () Bool)

(assert (=> b!138579 (=> (not res!66325) (not e!90326))))

(assert (=> b!138579 (= res!66325 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(declare-fun b!138580 () Bool)

(assert (=> b!138580 (= e!90326 (arrayContainsKey!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!43363 (not res!66324)) b!138579))

(assert (= (and b!138579 res!66325) b!138580))

(assert (=> d!43363 m!165565))

(assert (=> b!138580 m!165363))

(declare-fun m!165623 () Bool)

(assert (=> b!138580 m!165623))

(assert (=> b!138231 d!43363))

(declare-fun d!43365 () Bool)

(declare-fun e!90329 () Bool)

(assert (=> d!43365 e!90329))

(declare-fun c!25947 () Bool)

(assert (=> d!43365 (= c!25947 (and (not (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!72413 () Unit!4353)

(declare-fun choose!851 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) (_ BitVec 32) Int) Unit!4353)

(assert (=> d!43365 (= lt!72413 (choose!851 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))))))

(assert (=> d!43365 (validMask!0 (mask!7248 (v!3254 (underlying!471 thiss!992))))))

(assert (=> d!43365 (= (lemmaListMapContainsThenArrayContainsFrom!133 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))) lt!72413)))

(declare-fun b!138585 () Bool)

(assert (=> b!138585 (= e!90329 (arrayContainsKey!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!138586 () Bool)

(assert (=> b!138586 (= e!90329 (ite (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!43365 c!25947) b!138585))

(assert (= (and d!43365 (not c!25947)) b!138586))

(assert (=> d!43365 m!165363))

(declare-fun m!165625 () Bool)

(assert (=> d!43365 m!165625))

(assert (=> d!43365 m!165611))

(assert (=> b!138585 m!165363))

(assert (=> b!138585 m!165373))

(assert (=> b!138231 d!43365))

(declare-fun mapIsEmpty!4779 () Bool)

(declare-fun mapRes!4779 () Bool)

(assert (=> mapIsEmpty!4779 mapRes!4779))

(declare-fun b!138594 () Bool)

(declare-fun e!90335 () Bool)

(assert (=> b!138594 (= e!90335 tp_is_empty!2911)))

(declare-fun condMapEmpty!4779 () Bool)

(declare-fun mapDefault!4779 () ValueCell!1112)

(assert (=> mapNonEmpty!4763 (= condMapEmpty!4779 (= mapRest!4764 ((as const (Array (_ BitVec 32) ValueCell!1112)) mapDefault!4779)))))

(assert (=> mapNonEmpty!4763 (= tp!11430 (and e!90335 mapRes!4779))))

(declare-fun mapNonEmpty!4779 () Bool)

(declare-fun tp!11457 () Bool)

(declare-fun e!90334 () Bool)

(assert (=> mapNonEmpty!4779 (= mapRes!4779 (and tp!11457 e!90334))))

(declare-fun mapRest!4779 () (Array (_ BitVec 32) ValueCell!1112))

(declare-fun mapKey!4779 () (_ BitVec 32))

(declare-fun mapValue!4779 () ValueCell!1112)

(assert (=> mapNonEmpty!4779 (= mapRest!4764 (store mapRest!4779 mapKey!4779 mapValue!4779))))

(declare-fun b!138593 () Bool)

(assert (=> b!138593 (= e!90334 tp_is_empty!2911)))

(assert (= (and mapNonEmpty!4763 condMapEmpty!4779) mapIsEmpty!4779))

(assert (= (and mapNonEmpty!4763 (not condMapEmpty!4779)) mapNonEmpty!4779))

(assert (= (and mapNonEmpty!4779 ((_ is ValueCellFull!1112) mapValue!4779)) b!138593))

(assert (= (and mapNonEmpty!4763 ((_ is ValueCellFull!1112) mapDefault!4779)) b!138594))

(declare-fun m!165627 () Bool)

(assert (=> mapNonEmpty!4779 m!165627))

(declare-fun mapIsEmpty!4780 () Bool)

(declare-fun mapRes!4780 () Bool)

(assert (=> mapIsEmpty!4780 mapRes!4780))

(declare-fun b!138596 () Bool)

(declare-fun e!90337 () Bool)

(assert (=> b!138596 (= e!90337 tp_is_empty!2911)))

(declare-fun condMapEmpty!4780 () Bool)

(declare-fun mapDefault!4780 () ValueCell!1112)

(assert (=> mapNonEmpty!4764 (= condMapEmpty!4780 (= mapRest!4763 ((as const (Array (_ BitVec 32) ValueCell!1112)) mapDefault!4780)))))

(assert (=> mapNonEmpty!4764 (= tp!11428 (and e!90337 mapRes!4780))))

(declare-fun mapNonEmpty!4780 () Bool)

(declare-fun tp!11458 () Bool)

(declare-fun e!90336 () Bool)

(assert (=> mapNonEmpty!4780 (= mapRes!4780 (and tp!11458 e!90336))))

(declare-fun mapValue!4780 () ValueCell!1112)

(declare-fun mapKey!4780 () (_ BitVec 32))

(declare-fun mapRest!4780 () (Array (_ BitVec 32) ValueCell!1112))

(assert (=> mapNonEmpty!4780 (= mapRest!4763 (store mapRest!4780 mapKey!4780 mapValue!4780))))

(declare-fun b!138595 () Bool)

(assert (=> b!138595 (= e!90336 tp_is_empty!2911)))

(assert (= (and mapNonEmpty!4764 condMapEmpty!4780) mapIsEmpty!4780))

(assert (= (and mapNonEmpty!4764 (not condMapEmpty!4780)) mapNonEmpty!4780))

(assert (= (and mapNonEmpty!4780 ((_ is ValueCellFull!1112) mapValue!4780)) b!138595))

(assert (= (and mapNonEmpty!4764 ((_ is ValueCellFull!1112) mapDefault!4780)) b!138596))

(declare-fun m!165629 () Bool)

(assert (=> mapNonEmpty!4780 m!165629))

(declare-fun b_lambda!6215 () Bool)

(assert (= b_lambda!6213 (or (and b!138240 b_free!2989) (and b!138229 b_free!2991 (= (defaultEntry!2918 newMap!16) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))))) b_lambda!6215)))

(check-sat (not b!138496) (not b!138447) (not bm!15220) b_and!8639 (not b_lambda!6211) (not bm!15206) (not bm!15223) (not b!138561) (not bm!15210) (not d!43359) (not d!43357) (not bm!15208) (not b_next!2991) (not b!138494) (not b_next!2989) (not bm!15230) (not b!138487) (not d!43365) (not b!138478) (not mapNonEmpty!4780) (not bm!15212) (not bm!15246) (not b!138564) (not d!43361) (not bm!15204) (not b!138560) (not b!138467) (not b!138565) (not b!138573) (not b!138568) tp_is_empty!2911 (not b!138557) (not bm!15245) (not bm!15250) (not b_lambda!6215) (not b!138509) (not bm!15209) (not bm!15248) (not bm!15216) (not b!138580) (not b!138571) (not bm!15227) (not b!138472) (not bm!15224) (not b!138473) (not b!138511) (not b!138464) (not mapNonEmpty!4779) (not b!138507) b_and!8637 (not d!43343) (not bm!15221) (not b!138361) (not b!138495) (not b!138585) (not d!43345) (not b!138359) (not b!138486) (not b!138480) (not d!43349))
(check-sat b_and!8637 b_and!8639 (not b_next!2989) (not b_next!2991))
(get-model)

(declare-fun d!43367 () Bool)

(assert (=> d!43367 (= (validKeyInArray!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138507 d!43367))

(declare-fun d!43369 () Bool)

(declare-fun lt!72416 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!137 (List!1710) (InoxSet (_ BitVec 64)))

(assert (=> d!43369 (= lt!72416 (select (content!137 Nil!1707) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!90343 () Bool)

(assert (=> d!43369 (= lt!72416 e!90343)))

(declare-fun res!66330 () Bool)

(assert (=> d!43369 (=> (not res!66330) (not e!90343))))

(assert (=> d!43369 (= res!66330 ((_ is Cons!1706) Nil!1707))))

(assert (=> d!43369 (= (contains!898 Nil!1707 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000)) lt!72416)))

(declare-fun b!138601 () Bool)

(declare-fun e!90342 () Bool)

(assert (=> b!138601 (= e!90343 e!90342)))

(declare-fun res!66331 () Bool)

(assert (=> b!138601 (=> res!66331 e!90342)))

(assert (=> b!138601 (= res!66331 (= (h!2313 Nil!1707) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!138602 () Bool)

(assert (=> b!138602 (= e!90342 (contains!898 (t!6246 Nil!1707) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!43369 res!66330) b!138601))

(assert (= (and b!138601 (not res!66331)) b!138602))

(declare-fun m!165631 () Bool)

(assert (=> d!43369 m!165631))

(assert (=> d!43369 m!165553))

(declare-fun m!165633 () Bool)

(assert (=> d!43369 m!165633))

(assert (=> b!138602 m!165553))

(declare-fun m!165635 () Bool)

(assert (=> b!138602 m!165635))

(assert (=> b!138509 d!43369))

(declare-fun d!43371 () Bool)

(declare-fun get!1519 (Option!181) V!3529)

(assert (=> d!43371 (= (apply!118 lt!72394 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1519 (getValueByKey!175 (toList!854 lt!72394) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5818 () Bool)

(assert (= bs!5818 d!43371))

(assert (=> bs!5818 m!165565))

(declare-fun m!165637 () Bool)

(assert (=> bs!5818 m!165637))

(assert (=> bs!5818 m!165637))

(declare-fun m!165639 () Bool)

(assert (=> bs!5818 m!165639))

(assert (=> b!138568 d!43371))

(declare-fun d!43373 () Bool)

(declare-fun c!25948 () Bool)

(assert (=> d!43373 (= c!25948 ((_ is ValueCellFull!1112) (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!90344 () V!3529)

(assert (=> d!43373 (= (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!90344)))

(declare-fun b!138603 () Bool)

(assert (=> b!138603 (= e!90344 (get!1517 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!138604 () Bool)

(assert (=> b!138604 (= e!90344 (get!1518 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43373 c!25948) b!138603))

(assert (= (and d!43373 (not c!25948)) b!138604))

(assert (=> b!138603 m!165603))

(assert (=> b!138603 m!165393))

(declare-fun m!165641 () Bool)

(assert (=> b!138603 m!165641))

(assert (=> b!138604 m!165603))

(assert (=> b!138604 m!165393))

(declare-fun m!165643 () Bool)

(assert (=> b!138604 m!165643))

(assert (=> b!138568 d!43373))

(declare-fun d!43375 () Bool)

(assert (=> d!43375 (= (validMask!0 (mask!7248 (v!3254 (underlying!471 thiss!992)))) (and (or (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000001111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000011111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000001111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000011111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000001111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000011111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000001111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000011111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000000111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000001111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000011111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000000111111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000001111111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000011111111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000000111111111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000001111111111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000011111111111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000000111111111111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000001111111111111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000011111111111111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00000111111111111111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00001111111111111111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00011111111111111111111111111111) (= (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7248 (v!3254 (underlying!471 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!43359 d!43375))

(declare-fun b!138621 () Bool)

(declare-fun lt!72422 () SeekEntryResult!271)

(assert (=> b!138621 (and (bvsge (index!3246 lt!72422) #b00000000000000000000000000000000) (bvslt (index!3246 lt!72422) (size!2559 (_keys!4675 newMap!16))))))

(declare-fun res!66343 () Bool)

(assert (=> b!138621 (= res!66343 (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3246 lt!72422)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!90355 () Bool)

(assert (=> b!138621 (=> (not res!66343) (not e!90355))))

(declare-fun b!138622 () Bool)

(declare-fun e!90353 () Bool)

(assert (=> b!138622 (= e!90353 e!90355)))

(declare-fun res!66340 () Bool)

(declare-fun call!15259 () Bool)

(assert (=> b!138622 (= res!66340 call!15259)))

(assert (=> b!138622 (=> (not res!66340) (not e!90355))))

(declare-fun b!138623 () Bool)

(declare-fun call!15260 () Bool)

(assert (=> b!138623 (= e!90355 (not call!15260))))

(declare-fun b!138624 () Bool)

(declare-fun res!66342 () Bool)

(declare-fun e!90354 () Bool)

(assert (=> b!138624 (=> (not res!66342) (not e!90354))))

(assert (=> b!138624 (= res!66342 (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3249 lt!72422)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138624 (and (bvsge (index!3249 lt!72422) #b00000000000000000000000000000000) (bvslt (index!3249 lt!72422) (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138625 () Bool)

(declare-fun res!66341 () Bool)

(assert (=> b!138625 (=> (not res!66341) (not e!90354))))

(assert (=> b!138625 (= res!66341 call!15259)))

(declare-fun e!90356 () Bool)

(assert (=> b!138625 (= e!90356 e!90354)))

(declare-fun d!43377 () Bool)

(assert (=> d!43377 e!90353))

(declare-fun c!25953 () Bool)

(assert (=> d!43377 (= c!25953 ((_ is MissingZero!271) lt!72422))))

(assert (=> d!43377 (= lt!72422 (seekEntryOrOpen!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (_keys!4675 newMap!16) (mask!7248 newMap!16)))))

(declare-fun lt!72421 () Unit!4353)

(declare-fun choose!852 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) Int) Unit!4353)

(assert (=> d!43377 (= lt!72421 (choose!852 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43377 (validMask!0 (mask!7248 newMap!16))))

(assert (=> d!43377 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!63 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)) lt!72421)))

(declare-fun b!138626 () Bool)

(assert (=> b!138626 (= e!90353 e!90356)))

(declare-fun c!25954 () Bool)

(assert (=> b!138626 (= c!25954 ((_ is MissingVacant!271) lt!72422))))

(declare-fun b!138627 () Bool)

(assert (=> b!138627 (= e!90356 ((_ is Undefined!271) lt!72422))))

(declare-fun bm!15256 () Bool)

(assert (=> bm!15256 (= call!15259 (inRange!0 (ite c!25953 (index!3246 lt!72422) (index!3249 lt!72422)) (mask!7248 newMap!16)))))

(declare-fun b!138628 () Bool)

(assert (=> b!138628 (= e!90354 (not call!15260))))

(declare-fun bm!15257 () Bool)

(assert (=> bm!15257 (= call!15260 (arrayContainsKey!0 (_keys!4675 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(assert (= (and d!43377 c!25953) b!138622))

(assert (= (and d!43377 (not c!25953)) b!138626))

(assert (= (and b!138622 res!66340) b!138621))

(assert (= (and b!138621 res!66343) b!138623))

(assert (= (and b!138626 c!25954) b!138625))

(assert (= (and b!138626 (not c!25954)) b!138627))

(assert (= (and b!138625 res!66341) b!138624))

(assert (= (and b!138624 res!66342) b!138628))

(assert (= (or b!138622 b!138625) bm!15256))

(assert (= (or b!138623 b!138628) bm!15257))

(declare-fun m!165645 () Bool)

(assert (=> b!138621 m!165645))

(assert (=> d!43377 m!165363))

(assert (=> d!43377 m!165513))

(assert (=> d!43377 m!165363))

(declare-fun m!165647 () Bool)

(assert (=> d!43377 m!165647))

(declare-fun m!165649 () Bool)

(assert (=> d!43377 m!165649))

(declare-fun m!165651 () Bool)

(assert (=> b!138624 m!165651))

(declare-fun m!165653 () Bool)

(assert (=> bm!15256 m!165653))

(assert (=> bm!15257 m!165363))

(assert (=> bm!15257 m!165505))

(assert (=> bm!15208 d!43377))

(declare-fun d!43379 () Bool)

(declare-fun res!66344 () Bool)

(declare-fun e!90357 () Bool)

(assert (=> d!43379 (=> (not res!66344) (not e!90357))))

(assert (=> d!43379 (= res!66344 (simpleValid!94 (_2!1315 lt!72329)))))

(assert (=> d!43379 (= (valid!558 (_2!1315 lt!72329)) e!90357)))

(declare-fun b!138629 () Bool)

(declare-fun res!66345 () Bool)

(assert (=> b!138629 (=> (not res!66345) (not e!90357))))

(assert (=> b!138629 (= res!66345 (= (arrayCountValidKeys!0 (_keys!4675 (_2!1315 lt!72329)) #b00000000000000000000000000000000 (size!2559 (_keys!4675 (_2!1315 lt!72329)))) (_size!615 (_2!1315 lt!72329))))))

(declare-fun b!138630 () Bool)

(declare-fun res!66346 () Bool)

(assert (=> b!138630 (=> (not res!66346) (not e!90357))))

(assert (=> b!138630 (= res!66346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4675 (_2!1315 lt!72329)) (mask!7248 (_2!1315 lt!72329))))))

(declare-fun b!138631 () Bool)

(assert (=> b!138631 (= e!90357 (arrayNoDuplicates!0 (_keys!4675 (_2!1315 lt!72329)) #b00000000000000000000000000000000 Nil!1707))))

(assert (= (and d!43379 res!66344) b!138629))

(assert (= (and b!138629 res!66345) b!138630))

(assert (= (and b!138630 res!66346) b!138631))

(declare-fun m!165655 () Bool)

(assert (=> d!43379 m!165655))

(declare-fun m!165657 () Bool)

(assert (=> b!138629 m!165657))

(declare-fun m!165659 () Bool)

(assert (=> b!138630 m!165659))

(declare-fun m!165661 () Bool)

(assert (=> b!138631 m!165661))

(assert (=> d!43345 d!43379))

(assert (=> d!43345 d!43349))

(declare-fun b!138644 () Bool)

(declare-fun e!90365 () SeekEntryResult!271)

(declare-fun lt!72431 () SeekEntryResult!271)

(assert (=> b!138644 (= e!90365 (MissingZero!271 (index!3248 lt!72431)))))

(declare-fun b!138645 () Bool)

(declare-fun e!90366 () SeekEntryResult!271)

(assert (=> b!138645 (= e!90366 Undefined!271)))

(declare-fun b!138646 () Bool)

(declare-fun c!25963 () Bool)

(declare-fun lt!72430 () (_ BitVec 64))

(assert (=> b!138646 (= c!25963 (= lt!72430 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!90364 () SeekEntryResult!271)

(assert (=> b!138646 (= e!90364 e!90365)))

(declare-fun lt!72429 () SeekEntryResult!271)

(declare-fun d!43381 () Bool)

(assert (=> d!43381 (and (or ((_ is Undefined!271) lt!72429) (not ((_ is Found!271) lt!72429)) (and (bvsge (index!3247 lt!72429) #b00000000000000000000000000000000) (bvslt (index!3247 lt!72429) (size!2559 (_keys!4675 newMap!16))))) (or ((_ is Undefined!271) lt!72429) ((_ is Found!271) lt!72429) (not ((_ is MissingZero!271) lt!72429)) (and (bvsge (index!3246 lt!72429) #b00000000000000000000000000000000) (bvslt (index!3246 lt!72429) (size!2559 (_keys!4675 newMap!16))))) (or ((_ is Undefined!271) lt!72429) ((_ is Found!271) lt!72429) ((_ is MissingZero!271) lt!72429) (not ((_ is MissingVacant!271) lt!72429)) (and (bvsge (index!3249 lt!72429) #b00000000000000000000000000000000) (bvslt (index!3249 lt!72429) (size!2559 (_keys!4675 newMap!16))))) (or ((_ is Undefined!271) lt!72429) (ite ((_ is Found!271) lt!72429) (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3247 lt!72429)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) (ite ((_ is MissingZero!271) lt!72429) (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3246 lt!72429)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!271) lt!72429) (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3249 lt!72429)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!43381 (= lt!72429 e!90366)))

(declare-fun c!25962 () Bool)

(assert (=> d!43381 (= c!25962 (and ((_ is Intermediate!271) lt!72431) (undefined!1083 lt!72431)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4839 (_ BitVec 32)) SeekEntryResult!271)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!43381 (= lt!72431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (mask!7248 newMap!16)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (_keys!4675 newMap!16) (mask!7248 newMap!16)))))

(assert (=> d!43381 (validMask!0 (mask!7248 newMap!16))))

(assert (=> d!43381 (= (seekEntryOrOpen!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (_keys!4675 newMap!16) (mask!7248 newMap!16)) lt!72429)))

(declare-fun b!138647 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4839 (_ BitVec 32)) SeekEntryResult!271)

(assert (=> b!138647 (= e!90365 (seekKeyOrZeroReturnVacant!0 (x!15985 lt!72431) (index!3248 lt!72431) (index!3248 lt!72431) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (_keys!4675 newMap!16) (mask!7248 newMap!16)))))

(declare-fun b!138648 () Bool)

(assert (=> b!138648 (= e!90366 e!90364)))

(assert (=> b!138648 (= lt!72430 (select (arr!2288 (_keys!4675 newMap!16)) (index!3248 lt!72431)))))

(declare-fun c!25961 () Bool)

(assert (=> b!138648 (= c!25961 (= lt!72430 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun b!138649 () Bool)

(assert (=> b!138649 (= e!90364 (Found!271 (index!3248 lt!72431)))))

(assert (= (and d!43381 c!25962) b!138645))

(assert (= (and d!43381 (not c!25962)) b!138648))

(assert (= (and b!138648 c!25961) b!138649))

(assert (= (and b!138648 (not c!25961)) b!138646))

(assert (= (and b!138646 c!25963) b!138644))

(assert (= (and b!138646 (not c!25963)) b!138647))

(declare-fun m!165663 () Bool)

(assert (=> d!43381 m!165663))

(assert (=> d!43381 m!165649))

(declare-fun m!165665 () Bool)

(assert (=> d!43381 m!165665))

(assert (=> d!43381 m!165363))

(declare-fun m!165667 () Bool)

(assert (=> d!43381 m!165667))

(assert (=> d!43381 m!165363))

(assert (=> d!43381 m!165665))

(declare-fun m!165669 () Bool)

(assert (=> d!43381 m!165669))

(declare-fun m!165671 () Bool)

(assert (=> d!43381 m!165671))

(assert (=> b!138647 m!165363))

(declare-fun m!165673 () Bool)

(assert (=> b!138647 m!165673))

(declare-fun m!165675 () Bool)

(assert (=> b!138648 m!165675))

(assert (=> bm!15209 d!43381))

(declare-fun b!138658 () Bool)

(declare-fun e!90371 () (_ BitVec 32))

(declare-fun call!15263 () (_ BitVec 32))

(assert (=> b!138658 (= e!90371 call!15263)))

(declare-fun bm!15260 () Bool)

(assert (=> bm!15260 (= call!15263 (arrayCountValidKeys!0 (_keys!4675 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2559 (_keys!4675 newMap!16))))))

(declare-fun d!43383 () Bool)

(declare-fun lt!72434 () (_ BitVec 32))

(assert (=> d!43383 (and (bvsge lt!72434 #b00000000000000000000000000000000) (bvsle lt!72434 (bvsub (size!2559 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!90372 () (_ BitVec 32))

(assert (=> d!43383 (= lt!72434 e!90372)))

(declare-fun c!25969 () Bool)

(assert (=> d!43383 (= c!25969 (bvsge #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(assert (=> d!43383 (and (bvsle #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2559 (_keys!4675 newMap!16)) (size!2559 (_keys!4675 newMap!16))))))

(assert (=> d!43383 (= (arrayCountValidKeys!0 (_keys!4675 newMap!16) #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))) lt!72434)))

(declare-fun b!138659 () Bool)

(assert (=> b!138659 (= e!90372 e!90371)))

(declare-fun c!25968 () Bool)

(assert (=> b!138659 (= c!25968 (validKeyInArray!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138660 () Bool)

(assert (=> b!138660 (= e!90371 (bvadd #b00000000000000000000000000000001 call!15263))))

(declare-fun b!138661 () Bool)

(assert (=> b!138661 (= e!90372 #b00000000000000000000000000000000)))

(assert (= (and d!43383 c!25969) b!138661))

(assert (= (and d!43383 (not c!25969)) b!138659))

(assert (= (and b!138659 c!25968) b!138660))

(assert (= (and b!138659 (not c!25968)) b!138658))

(assert (= (or b!138660 b!138658) bm!15260))

(declare-fun m!165677 () Bool)

(assert (=> bm!15260 m!165677))

(declare-fun m!165679 () Bool)

(assert (=> b!138659 m!165679))

(assert (=> b!138659 m!165679))

(declare-fun m!165681 () Bool)

(assert (=> b!138659 m!165681))

(assert (=> b!138494 d!43383))

(declare-fun b!138662 () Bool)

(declare-fun e!90373 () Bool)

(declare-fun e!90375 () Bool)

(assert (=> b!138662 (= e!90373 e!90375)))

(declare-fun c!25970 () Bool)

(assert (=> b!138662 (= c!25970 (validKeyInArray!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138663 () Bool)

(declare-fun call!15264 () Bool)

(assert (=> b!138663 (= e!90375 call!15264)))

(declare-fun b!138664 () Bool)

(declare-fun e!90376 () Bool)

(assert (=> b!138664 (= e!90376 (contains!898 Nil!1707 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138665 () Bool)

(assert (=> b!138665 (= e!90375 call!15264)))

(declare-fun b!138666 () Bool)

(declare-fun e!90374 () Bool)

(assert (=> b!138666 (= e!90374 e!90373)))

(declare-fun res!66347 () Bool)

(assert (=> b!138666 (=> (not res!66347) (not e!90373))))

(assert (=> b!138666 (= res!66347 (not e!90376))))

(declare-fun res!66348 () Bool)

(assert (=> b!138666 (=> (not res!66348) (not e!90376))))

(assert (=> b!138666 (= res!66348 (validKeyInArray!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!43385 () Bool)

(declare-fun res!66349 () Bool)

(assert (=> d!43385 (=> res!66349 e!90374)))

(assert (=> d!43385 (= res!66349 (bvsge #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(assert (=> d!43385 (= (arrayNoDuplicates!0 (_keys!4675 newMap!16) #b00000000000000000000000000000000 Nil!1707) e!90374)))

(declare-fun bm!15261 () Bool)

(assert (=> bm!15261 (= call!15264 (arrayNoDuplicates!0 (_keys!4675 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!25970 (Cons!1706 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000) Nil!1707) Nil!1707)))))

(assert (= (and d!43385 (not res!66349)) b!138666))

(assert (= (and b!138666 res!66348) b!138664))

(assert (= (and b!138666 res!66347) b!138662))

(assert (= (and b!138662 c!25970) b!138665))

(assert (= (and b!138662 (not c!25970)) b!138663))

(assert (= (or b!138665 b!138663) bm!15261))

(assert (=> b!138662 m!165679))

(assert (=> b!138662 m!165679))

(assert (=> b!138662 m!165681))

(assert (=> b!138664 m!165679))

(assert (=> b!138664 m!165679))

(declare-fun m!165683 () Bool)

(assert (=> b!138664 m!165683))

(assert (=> b!138666 m!165679))

(assert (=> b!138666 m!165679))

(assert (=> b!138666 m!165681))

(assert (=> bm!15261 m!165679))

(declare-fun m!165685 () Bool)

(assert (=> bm!15261 m!165685))

(assert (=> b!138496 d!43385))

(assert (=> b!138511 d!43367))

(declare-fun d!43387 () Bool)

(assert (=> d!43387 (= (get!1517 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3253 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> b!138486 d!43387))

(declare-fun d!43389 () Bool)

(declare-fun e!90378 () Bool)

(assert (=> d!43389 e!90378))

(declare-fun res!66350 () Bool)

(assert (=> d!43389 (=> res!66350 e!90378)))

(declare-fun lt!72437 () Bool)

(assert (=> d!43389 (= res!66350 (not lt!72437))))

(declare-fun lt!72436 () Bool)

(assert (=> d!43389 (= lt!72437 lt!72436)))

(declare-fun lt!72438 () Unit!4353)

(declare-fun e!90377 () Unit!4353)

(assert (=> d!43389 (= lt!72438 e!90377)))

(declare-fun c!25971 () Bool)

(assert (=> d!43389 (= c!25971 lt!72436)))

(assert (=> d!43389 (= lt!72436 (containsKey!178 (toList!854 e!90258) (ite c!25914 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (select (arr!2288 (_keys!4675 newMap!16)) (index!3247 lt!72322)))))))

(assert (=> d!43389 (= (contains!897 e!90258 (ite c!25914 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (select (arr!2288 (_keys!4675 newMap!16)) (index!3247 lt!72322)))) lt!72437)))

(declare-fun b!138667 () Bool)

(declare-fun lt!72435 () Unit!4353)

(assert (=> b!138667 (= e!90377 lt!72435)))

(assert (=> b!138667 (= lt!72435 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!854 e!90258) (ite c!25914 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (select (arr!2288 (_keys!4675 newMap!16)) (index!3247 lt!72322)))))))

(assert (=> b!138667 (isDefined!127 (getValueByKey!175 (toList!854 e!90258) (ite c!25914 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (select (arr!2288 (_keys!4675 newMap!16)) (index!3247 lt!72322)))))))

(declare-fun b!138668 () Bool)

(declare-fun Unit!4359 () Unit!4353)

(assert (=> b!138668 (= e!90377 Unit!4359)))

(declare-fun b!138669 () Bool)

(assert (=> b!138669 (= e!90378 (isDefined!127 (getValueByKey!175 (toList!854 e!90258) (ite c!25914 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (select (arr!2288 (_keys!4675 newMap!16)) (index!3247 lt!72322))))))))

(assert (= (and d!43389 c!25971) b!138667))

(assert (= (and d!43389 (not c!25971)) b!138668))

(assert (= (and d!43389 (not res!66350)) b!138669))

(declare-fun m!165687 () Bool)

(assert (=> d!43389 m!165687))

(declare-fun m!165689 () Bool)

(assert (=> b!138667 m!165689))

(declare-fun m!165691 () Bool)

(assert (=> b!138667 m!165691))

(assert (=> b!138667 m!165691))

(declare-fun m!165693 () Bool)

(assert (=> b!138667 m!165693))

(assert (=> b!138669 m!165691))

(assert (=> b!138669 m!165691))

(assert (=> b!138669 m!165693))

(assert (=> bm!15206 d!43389))

(declare-fun d!43391 () Bool)

(assert (=> d!43391 (= (apply!118 lt!72394 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1519 (getValueByKey!175 (toList!854 lt!72394) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5819 () Bool)

(assert (= bs!5819 d!43391))

(declare-fun m!165695 () Bool)

(assert (=> bs!5819 m!165695))

(assert (=> bs!5819 m!165695))

(declare-fun m!165697 () Bool)

(assert (=> bs!5819 m!165697))

(assert (=> b!138565 d!43391))

(declare-fun d!43393 () Bool)

(declare-fun e!90381 () Bool)

(assert (=> d!43393 e!90381))

(declare-fun res!66355 () Bool)

(assert (=> d!43393 (=> (not res!66355) (not e!90381))))

(declare-fun lt!72447 () ListLongMap!1677)

(assert (=> d!43393 (= res!66355 (contains!897 lt!72447 (_1!1314 (ite (or c!25943 c!25941) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))))))

(declare-fun lt!72450 () List!1709)

(assert (=> d!43393 (= lt!72447 (ListLongMap!1678 lt!72450))))

(declare-fun lt!72448 () Unit!4353)

(declare-fun lt!72449 () Unit!4353)

(assert (=> d!43393 (= lt!72448 lt!72449)))

(assert (=> d!43393 (= (getValueByKey!175 lt!72450 (_1!1314 (ite (or c!25943 c!25941) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))) (Some!180 (_2!1314 (ite (or c!25943 c!25941) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!90 (List!1709 (_ BitVec 64) V!3529) Unit!4353)

(assert (=> d!43393 (= lt!72449 (lemmaContainsTupThenGetReturnValue!90 lt!72450 (_1!1314 (ite (or c!25943 c!25941) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))) (_2!1314 (ite (or c!25943 c!25941) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))))))

(declare-fun insertStrictlySorted!93 (List!1709 (_ BitVec 64) V!3529) List!1709)

(assert (=> d!43393 (= lt!72450 (insertStrictlySorted!93 (toList!854 (ite c!25943 call!15253 (ite c!25941 call!15249 call!15252))) (_1!1314 (ite (or c!25943 c!25941) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))) (_2!1314 (ite (or c!25943 c!25941) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))))))

(assert (=> d!43393 (= (+!171 (ite c!25943 call!15253 (ite c!25941 call!15249 call!15252)) (ite (or c!25943 c!25941) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))) lt!72447)))

(declare-fun b!138674 () Bool)

(declare-fun res!66356 () Bool)

(assert (=> b!138674 (=> (not res!66356) (not e!90381))))

(assert (=> b!138674 (= res!66356 (= (getValueByKey!175 (toList!854 lt!72447) (_1!1314 (ite (or c!25943 c!25941) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))) (Some!180 (_2!1314 (ite (or c!25943 c!25941) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))))

(declare-fun b!138675 () Bool)

(declare-fun contains!899 (List!1709 tuple2!2606) Bool)

(assert (=> b!138675 (= e!90381 (contains!899 (toList!854 lt!72447) (ite (or c!25943 c!25941) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (= (and d!43393 res!66355) b!138674))

(assert (= (and b!138674 res!66356) b!138675))

(declare-fun m!165699 () Bool)

(assert (=> d!43393 m!165699))

(declare-fun m!165701 () Bool)

(assert (=> d!43393 m!165701))

(declare-fun m!165703 () Bool)

(assert (=> d!43393 m!165703))

(declare-fun m!165705 () Bool)

(assert (=> d!43393 m!165705))

(declare-fun m!165707 () Bool)

(assert (=> b!138674 m!165707))

(declare-fun m!165709 () Bool)

(assert (=> b!138675 m!165709))

(assert (=> bm!15246 d!43393))

(declare-fun b!138676 () Bool)

(declare-fun e!90386 () ListLongMap!1677)

(declare-fun call!15271 () ListLongMap!1677)

(assert (=> b!138676 (= e!90386 call!15271)))

(declare-fun b!138677 () Bool)

(declare-fun e!90389 () Unit!4353)

(declare-fun Unit!4360 () Unit!4353)

(assert (=> b!138677 (= e!90389 Unit!4360)))

(declare-fun c!25975 () Bool)

(declare-fun b!138678 () Bool)

(assert (=> b!138678 (= c!25975 (and (not (= (bvand (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!90384 () ListLongMap!1677)

(assert (=> b!138678 (= e!90384 e!90386)))

(declare-fun call!15270 () ListLongMap!1677)

(declare-fun bm!15262 () Bool)

(assert (=> bm!15262 (= call!15270 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun b!138679 () Bool)

(declare-fun e!90392 () Bool)

(declare-fun e!90391 () Bool)

(assert (=> b!138679 (= e!90392 e!90391)))

(declare-fun res!66363 () Bool)

(assert (=> b!138679 (=> (not res!66363) (not e!90391))))

(declare-fun lt!72456 () ListLongMap!1677)

(assert (=> b!138679 (= res!66363 (contains!897 lt!72456 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!138679 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138680 () Bool)

(declare-fun res!66365 () Bool)

(declare-fun e!90394 () Bool)

(assert (=> b!138680 (=> (not res!66365) (not e!90394))))

(declare-fun e!90388 () Bool)

(assert (=> b!138680 (= res!66365 e!90388)))

(declare-fun c!25973 () Bool)

(assert (=> b!138680 (= c!25973 (not (= (bvand (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!138681 () Bool)

(declare-fun call!15269 () ListLongMap!1677)

(assert (=> b!138681 (= e!90386 call!15269)))

(declare-fun b!138682 () Bool)

(declare-fun e!90385 () Bool)

(assert (=> b!138682 (= e!90385 (= (apply!118 lt!72456 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16))))))

(declare-fun bm!15263 () Bool)

(declare-fun call!15266 () ListLongMap!1677)

(declare-fun c!25976 () Bool)

(declare-fun call!15265 () ListLongMap!1677)

(declare-fun c!25974 () Bool)

(assert (=> bm!15263 (= call!15265 (+!171 (ite c!25976 call!15270 (ite c!25974 call!15266 call!15269)) (ite (or c!25976 c!25974) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16))))))))

(declare-fun b!138683 () Bool)

(declare-fun e!90393 () Bool)

(assert (=> b!138683 (= e!90393 (validKeyInArray!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15264 () Bool)

(assert (=> bm!15264 (= call!15269 call!15266)))

(declare-fun b!138684 () Bool)

(declare-fun res!66364 () Bool)

(assert (=> b!138684 (=> (not res!66364) (not e!90394))))

(assert (=> b!138684 (= res!66364 e!90392)))

(declare-fun res!66361 () Bool)

(assert (=> b!138684 (=> res!66361 e!90392)))

(assert (=> b!138684 (= res!66361 (not e!90393))))

(declare-fun res!66357 () Bool)

(assert (=> b!138684 (=> (not res!66357) (not e!90393))))

(assert (=> b!138684 (= res!66357 (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138685 () Bool)

(declare-fun e!90390 () Bool)

(assert (=> b!138685 (= e!90394 e!90390)))

(declare-fun c!25972 () Bool)

(assert (=> b!138685 (= c!25972 (not (= (bvand (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!43395 () Bool)

(assert (=> d!43395 e!90394))

(declare-fun res!66362 () Bool)

(assert (=> d!43395 (=> (not res!66362) (not e!90394))))

(assert (=> d!43395 (= res!66362 (or (bvsge #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))))

(declare-fun lt!72459 () ListLongMap!1677)

(assert (=> d!43395 (= lt!72456 lt!72459)))

(declare-fun lt!72452 () Unit!4353)

(assert (=> d!43395 (= lt!72452 e!90389)))

(declare-fun c!25977 () Bool)

(declare-fun e!90387 () Bool)

(assert (=> d!43395 (= c!25977 e!90387)))

(declare-fun res!66360 () Bool)

(assert (=> d!43395 (=> (not res!66360) (not e!90387))))

(assert (=> d!43395 (= res!66360 (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun e!90383 () ListLongMap!1677)

(assert (=> d!43395 (= lt!72459 e!90383)))

(assert (=> d!43395 (= c!25976 (and (not (= (bvand (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43395 (validMask!0 (mask!7248 newMap!16))))

(assert (=> d!43395 (= (getCurrentListMap!527 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) lt!72456)))

(declare-fun b!138686 () Bool)

(declare-fun lt!72454 () Unit!4353)

(assert (=> b!138686 (= e!90389 lt!72454)))

(declare-fun lt!72463 () ListLongMap!1677)

(assert (=> b!138686 (= lt!72463 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72468 () (_ BitVec 64))

(assert (=> b!138686 (= lt!72468 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72453 () (_ BitVec 64))

(assert (=> b!138686 (= lt!72453 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72462 () Unit!4353)

(assert (=> b!138686 (= lt!72462 (addStillContains!94 lt!72463 lt!72468 (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) lt!72453))))

(assert (=> b!138686 (contains!897 (+!171 lt!72463 (tuple2!2607 lt!72468 (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)))) lt!72453)))

(declare-fun lt!72461 () Unit!4353)

(assert (=> b!138686 (= lt!72461 lt!72462)))

(declare-fun lt!72458 () ListLongMap!1677)

(assert (=> b!138686 (= lt!72458 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72471 () (_ BitVec 64))

(assert (=> b!138686 (= lt!72471 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72464 () (_ BitVec 64))

(assert (=> b!138686 (= lt!72464 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72469 () Unit!4353)

(assert (=> b!138686 (= lt!72469 (addApplyDifferent!94 lt!72458 lt!72471 (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) lt!72464))))

(assert (=> b!138686 (= (apply!118 (+!171 lt!72458 (tuple2!2607 lt!72471 (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)))) lt!72464) (apply!118 lt!72458 lt!72464))))

(declare-fun lt!72457 () Unit!4353)

(assert (=> b!138686 (= lt!72457 lt!72469)))

(declare-fun lt!72451 () ListLongMap!1677)

(assert (=> b!138686 (= lt!72451 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72465 () (_ BitVec 64))

(assert (=> b!138686 (= lt!72465 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72467 () (_ BitVec 64))

(assert (=> b!138686 (= lt!72467 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72460 () Unit!4353)

(assert (=> b!138686 (= lt!72460 (addApplyDifferent!94 lt!72451 lt!72465 (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) lt!72467))))

(assert (=> b!138686 (= (apply!118 (+!171 lt!72451 (tuple2!2607 lt!72465 (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)))) lt!72467) (apply!118 lt!72451 lt!72467))))

(declare-fun lt!72466 () Unit!4353)

(assert (=> b!138686 (= lt!72466 lt!72460)))

(declare-fun lt!72472 () ListLongMap!1677)

(assert (=> b!138686 (= lt!72472 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16)) (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72455 () (_ BitVec 64))

(assert (=> b!138686 (= lt!72455 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72470 () (_ BitVec 64))

(assert (=> b!138686 (= lt!72470 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138686 (= lt!72454 (addApplyDifferent!94 lt!72472 lt!72455 (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)) lt!72470))))

(assert (=> b!138686 (= (apply!118 (+!171 lt!72472 (tuple2!2607 lt!72455 (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)))) lt!72470) (apply!118 lt!72472 lt!72470))))

(declare-fun b!138687 () Bool)

(declare-fun e!90382 () Bool)

(assert (=> b!138687 (= e!90382 (= (apply!118 lt!72456 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!25915 c!25918) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2769 newMap!16))))))

(declare-fun b!138688 () Bool)

(assert (=> b!138688 (= e!90390 e!90385)))

(declare-fun res!66358 () Bool)

(declare-fun call!15267 () Bool)

(assert (=> b!138688 (= res!66358 call!15267)))

(assert (=> b!138688 (=> (not res!66358) (not e!90385))))

(declare-fun b!138689 () Bool)

(assert (=> b!138689 (= e!90383 e!90384)))

(assert (=> b!138689 (= c!25974 (and (not (= (bvand (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!25915 (ite c!25918 lt!72331 lt!72326) (extraKeys!2675 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15265 () Bool)

(declare-fun call!15268 () Bool)

(assert (=> bm!15265 (= call!15268 (contains!897 lt!72456 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138690 () Bool)

(assert (=> b!138690 (= e!90391 (= (apply!118 lt!72456 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)) (get!1516 (select (arr!2289 (_values!2901 newMap!16)) #b00000000000000000000000000000000) (dynLambda!435 (defaultEntry!2918 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2560 (_values!2901 newMap!16))))))

(assert (=> b!138690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138691 () Bool)

(assert (=> b!138691 (= e!90388 e!90382)))

(declare-fun res!66359 () Bool)

(assert (=> b!138691 (= res!66359 call!15268)))

(assert (=> b!138691 (=> (not res!66359) (not e!90382))))

(declare-fun bm!15266 () Bool)

(assert (=> bm!15266 (= call!15266 call!15270)))

(declare-fun bm!15267 () Bool)

(assert (=> bm!15267 (= call!15267 (contains!897 lt!72456 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138692 () Bool)

(assert (=> b!138692 (= e!90390 (not call!15267))))

(declare-fun bm!15268 () Bool)

(assert (=> bm!15268 (= call!15271 call!15265)))

(declare-fun b!138693 () Bool)

(assert (=> b!138693 (= e!90387 (validKeyInArray!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138694 () Bool)

(assert (=> b!138694 (= e!90388 (not call!15268))))

(declare-fun b!138695 () Bool)

(assert (=> b!138695 (= e!90383 (+!171 call!15265 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25915 (ite c!25918 (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2769 newMap!16)))))))

(declare-fun b!138696 () Bool)

(assert (=> b!138696 (= e!90384 call!15271)))

(assert (= (and d!43395 c!25976) b!138695))

(assert (= (and d!43395 (not c!25976)) b!138689))

(assert (= (and b!138689 c!25974) b!138696))

(assert (= (and b!138689 (not c!25974)) b!138678))

(assert (= (and b!138678 c!25975) b!138676))

(assert (= (and b!138678 (not c!25975)) b!138681))

(assert (= (or b!138676 b!138681) bm!15264))

(assert (= (or b!138696 bm!15264) bm!15266))

(assert (= (or b!138696 b!138676) bm!15268))

(assert (= (or b!138695 bm!15266) bm!15262))

(assert (= (or b!138695 bm!15268) bm!15263))

(assert (= (and d!43395 res!66360) b!138693))

(assert (= (and d!43395 c!25977) b!138686))

(assert (= (and d!43395 (not c!25977)) b!138677))

(assert (= (and d!43395 res!66362) b!138684))

(assert (= (and b!138684 res!66357) b!138683))

(assert (= (and b!138684 (not res!66361)) b!138679))

(assert (= (and b!138679 res!66363) b!138690))

(assert (= (and b!138684 res!66364) b!138680))

(assert (= (and b!138680 c!25973) b!138691))

(assert (= (and b!138680 (not c!25973)) b!138694))

(assert (= (and b!138691 res!66359) b!138687))

(assert (= (or b!138691 b!138694) bm!15265))

(assert (= (and b!138680 res!66365) b!138685))

(assert (= (and b!138685 c!25972) b!138688))

(assert (= (and b!138685 (not c!25972)) b!138692))

(assert (= (and b!138688 res!66358) b!138682))

(assert (= (or b!138688 b!138692) bm!15267))

(declare-fun b_lambda!6217 () Bool)

(assert (=> (not b_lambda!6217) (not b!138690)))

(declare-fun tb!2509 () Bool)

(declare-fun t!6256 () Bool)

(assert (=> (and b!138240 (= (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) (defaultEntry!2918 newMap!16)) t!6256) tb!2509))

(declare-fun result!4125 () Bool)

(assert (=> tb!2509 (= result!4125 tp_is_empty!2911)))

(assert (=> b!138690 t!6256))

(declare-fun b_and!8641 () Bool)

(assert (= b_and!8637 (and (=> t!6256 result!4125) b_and!8641)))

(declare-fun t!6258 () Bool)

(declare-fun tb!2511 () Bool)

(assert (=> (and b!138229 (= (defaultEntry!2918 newMap!16) (defaultEntry!2918 newMap!16)) t!6258) tb!2511))

(declare-fun result!4127 () Bool)

(assert (= result!4127 result!4125))

(assert (=> b!138690 t!6258))

(declare-fun b_and!8643 () Bool)

(assert (= b_and!8639 (and (=> t!6258 result!4127) b_and!8643)))

(declare-fun m!165711 () Bool)

(assert (=> b!138687 m!165711))

(assert (=> b!138683 m!165679))

(assert (=> b!138683 m!165679))

(assert (=> b!138683 m!165681))

(declare-fun m!165713 () Bool)

(assert (=> bm!15265 m!165713))

(declare-fun m!165715 () Bool)

(assert (=> b!138686 m!165715))

(assert (=> b!138686 m!165679))

(declare-fun m!165717 () Bool)

(assert (=> b!138686 m!165717))

(declare-fun m!165719 () Bool)

(assert (=> b!138686 m!165719))

(declare-fun m!165721 () Bool)

(assert (=> b!138686 m!165721))

(declare-fun m!165723 () Bool)

(assert (=> b!138686 m!165723))

(declare-fun m!165725 () Bool)

(assert (=> b!138686 m!165725))

(declare-fun m!165727 () Bool)

(assert (=> b!138686 m!165727))

(declare-fun m!165729 () Bool)

(assert (=> b!138686 m!165729))

(assert (=> b!138686 m!165723))

(declare-fun m!165731 () Bool)

(assert (=> b!138686 m!165731))

(assert (=> b!138686 m!165717))

(declare-fun m!165733 () Bool)

(assert (=> b!138686 m!165733))

(declare-fun m!165735 () Bool)

(assert (=> b!138686 m!165735))

(declare-fun m!165737 () Bool)

(assert (=> b!138686 m!165737))

(declare-fun m!165739 () Bool)

(assert (=> b!138686 m!165739))

(assert (=> b!138686 m!165731))

(declare-fun m!165741 () Bool)

(assert (=> b!138686 m!165741))

(declare-fun m!165743 () Bool)

(assert (=> b!138686 m!165743))

(assert (=> b!138686 m!165739))

(declare-fun m!165745 () Bool)

(assert (=> b!138686 m!165745))

(assert (=> b!138690 m!165679))

(declare-fun m!165747 () Bool)

(assert (=> b!138690 m!165747))

(declare-fun m!165749 () Bool)

(assert (=> b!138690 m!165749))

(assert (=> b!138690 m!165679))

(declare-fun m!165751 () Bool)

(assert (=> b!138690 m!165751))

(assert (=> b!138690 m!165749))

(assert (=> b!138690 m!165747))

(declare-fun m!165753 () Bool)

(assert (=> b!138690 m!165753))

(assert (=> b!138679 m!165679))

(assert (=> b!138679 m!165679))

(declare-fun m!165755 () Bool)

(assert (=> b!138679 m!165755))

(assert (=> bm!15262 m!165743))

(assert (=> b!138693 m!165679))

(assert (=> b!138693 m!165679))

(assert (=> b!138693 m!165681))

(assert (=> d!43395 m!165649))

(declare-fun m!165757 () Bool)

(assert (=> b!138682 m!165757))

(declare-fun m!165759 () Bool)

(assert (=> bm!15267 m!165759))

(declare-fun m!165761 () Bool)

(assert (=> b!138695 m!165761))

(declare-fun m!165763 () Bool)

(assert (=> bm!15263 m!165763))

(assert (=> bm!15212 d!43395))

(declare-fun d!43397 () Bool)

(declare-fun e!90397 () Bool)

(assert (=> d!43397 e!90397))

(declare-fun res!66368 () Bool)

(assert (=> d!43397 (=> (not res!66368) (not e!90397))))

(assert (=> d!43397 (= res!66368 (and (bvsge (index!3247 lt!72322) #b00000000000000000000000000000000) (bvslt (index!3247 lt!72322) (size!2559 (_keys!4675 newMap!16)))))))

(declare-fun lt!72475 () Unit!4353)

(declare-fun choose!853 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) Int) Unit!4353)

(assert (=> d!43397 (= lt!72475 (choose!853 (_keys!4675 newMap!16) lt!72339 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (index!3247 lt!72322) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43397 (validMask!0 (mask!7248 newMap!16))))

(assert (=> d!43397 (= (lemmaValidKeyInArrayIsInListMap!123 (_keys!4675 newMap!16) lt!72339 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (index!3247 lt!72322) (defaultEntry!2918 newMap!16)) lt!72475)))

(declare-fun b!138699 () Bool)

(assert (=> b!138699 (= e!90397 (contains!897 (getCurrentListMap!527 (_keys!4675 newMap!16) lt!72339 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (select (arr!2288 (_keys!4675 newMap!16)) (index!3247 lt!72322))))))

(assert (= (and d!43397 res!66368) b!138699))

(declare-fun m!165765 () Bool)

(assert (=> d!43397 m!165765))

(assert (=> d!43397 m!165649))

(assert (=> b!138699 m!165537))

(assert (=> b!138699 m!165517))

(assert (=> b!138699 m!165537))

(assert (=> b!138699 m!165517))

(declare-fun m!165767 () Bool)

(assert (=> b!138699 m!165767))

(assert (=> b!138472 d!43397))

(declare-fun d!43399 () Bool)

(declare-fun e!90400 () Bool)

(assert (=> d!43399 e!90400))

(declare-fun res!66371 () Bool)

(assert (=> d!43399 (=> (not res!66371) (not e!90400))))

(assert (=> d!43399 (= res!66371 (and (bvsge (index!3247 lt!72322) #b00000000000000000000000000000000) (bvslt (index!3247 lt!72322) (size!2560 (_values!2901 newMap!16)))))))

(declare-fun lt!72478 () Unit!4353)

(declare-fun choose!854 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) (_ BitVec 64) V!3529 Int) Unit!4353)

(assert (=> d!43399 (= lt!72478 (choose!854 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (index!3247 lt!72322) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43399 (validMask!0 (mask!7248 newMap!16))))

(assert (=> d!43399 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!63 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (index!3247 lt!72322) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)) lt!72478)))

(declare-fun b!138702 () Bool)

(assert (=> b!138702 (= e!90400 (= (+!171 (getCurrentListMap!527 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!527 (_keys!4675 newMap!16) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (index!3247 lt!72322) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16))) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16))))))

(assert (= (and d!43399 res!66371) b!138702))

(assert (=> d!43399 m!165363))

(assert (=> d!43399 m!165395))

(declare-fun m!165769 () Bool)

(assert (=> d!43399 m!165769))

(assert (=> d!43399 m!165649))

(assert (=> b!138702 m!165561))

(assert (=> b!138702 m!165561))

(declare-fun m!165771 () Bool)

(assert (=> b!138702 m!165771))

(assert (=> b!138702 m!165491))

(declare-fun m!165773 () Bool)

(assert (=> b!138702 m!165773))

(assert (=> b!138472 d!43399))

(declare-fun d!43401 () Bool)

(declare-fun e!90402 () Bool)

(assert (=> d!43401 e!90402))

(declare-fun res!66372 () Bool)

(assert (=> d!43401 (=> res!66372 e!90402)))

(declare-fun lt!72481 () Bool)

(assert (=> d!43401 (= res!66372 (not lt!72481))))

(declare-fun lt!72480 () Bool)

(assert (=> d!43401 (= lt!72481 lt!72480)))

(declare-fun lt!72482 () Unit!4353)

(declare-fun e!90401 () Unit!4353)

(assert (=> d!43401 (= lt!72482 e!90401)))

(declare-fun c!25978 () Bool)

(assert (=> d!43401 (= c!25978 lt!72480)))

(assert (=> d!43401 (= lt!72480 (containsKey!178 (toList!854 call!15216) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> d!43401 (= (contains!897 call!15216 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) lt!72481)))

(declare-fun b!138703 () Bool)

(declare-fun lt!72479 () Unit!4353)

(assert (=> b!138703 (= e!90401 lt!72479)))

(assert (=> b!138703 (= lt!72479 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!854 call!15216) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> b!138703 (isDefined!127 (getValueByKey!175 (toList!854 call!15216) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun b!138704 () Bool)

(declare-fun Unit!4361 () Unit!4353)

(assert (=> b!138704 (= e!90401 Unit!4361)))

(declare-fun b!138705 () Bool)

(assert (=> b!138705 (= e!90402 (isDefined!127 (getValueByKey!175 (toList!854 call!15216) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355))))))

(assert (= (and d!43401 c!25978) b!138703))

(assert (= (and d!43401 (not c!25978)) b!138704))

(assert (= (and d!43401 (not res!66372)) b!138705))

(assert (=> d!43401 m!165363))

(declare-fun m!165775 () Bool)

(assert (=> d!43401 m!165775))

(assert (=> b!138703 m!165363))

(declare-fun m!165777 () Bool)

(assert (=> b!138703 m!165777))

(assert (=> b!138703 m!165363))

(declare-fun m!165779 () Bool)

(assert (=> b!138703 m!165779))

(assert (=> b!138703 m!165779))

(declare-fun m!165781 () Bool)

(assert (=> b!138703 m!165781))

(assert (=> b!138705 m!165363))

(assert (=> b!138705 m!165779))

(assert (=> b!138705 m!165779))

(assert (=> b!138705 m!165781))

(assert (=> b!138472 d!43401))

(declare-fun d!43403 () Bool)

(assert (=> d!43403 (= (map!1419 (_2!1315 lt!72329)) (getCurrentListMap!527 (_keys!4675 (_2!1315 lt!72329)) (_values!2901 (_2!1315 lt!72329)) (mask!7248 (_2!1315 lt!72329)) (extraKeys!2675 (_2!1315 lt!72329)) (zeroValue!2769 (_2!1315 lt!72329)) (minValue!2769 (_2!1315 lt!72329)) #b00000000000000000000000000000000 (defaultEntry!2918 (_2!1315 lt!72329))))))

(declare-fun bs!5820 () Bool)

(assert (= bs!5820 d!43403))

(declare-fun m!165783 () Bool)

(assert (=> bs!5820 m!165783))

(assert (=> bm!15221 d!43403))

(declare-fun d!43405 () Bool)

(declare-fun isEmpty!421 (Option!181) Bool)

(assert (=> d!43405 (= (isDefined!127 (getValueByKey!175 (toList!854 lt!72226) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355))) (not (isEmpty!421 (getValueByKey!175 (toList!854 lt!72226) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))))

(declare-fun bs!5821 () Bool)

(assert (= bs!5821 d!43405))

(assert (=> bs!5821 m!165481))

(declare-fun m!165785 () Bool)

(assert (=> bs!5821 m!165785))

(assert (=> b!138361 d!43405))

(declare-fun e!90408 () Option!181)

(declare-fun b!138716 () Bool)

(assert (=> b!138716 (= e!90408 (getValueByKey!175 (t!6245 (toList!854 lt!72226)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun d!43407 () Bool)

(declare-fun c!25983 () Bool)

(assert (=> d!43407 (= c!25983 (and ((_ is Cons!1705) (toList!854 lt!72226)) (= (_1!1314 (h!2312 (toList!854 lt!72226))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355))))))

(declare-fun e!90407 () Option!181)

(assert (=> d!43407 (= (getValueByKey!175 (toList!854 lt!72226) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) e!90407)))

(declare-fun b!138715 () Bool)

(assert (=> b!138715 (= e!90407 e!90408)))

(declare-fun c!25984 () Bool)

(assert (=> b!138715 (= c!25984 (and ((_ is Cons!1705) (toList!854 lt!72226)) (not (= (_1!1314 (h!2312 (toList!854 lt!72226))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))))

(declare-fun b!138714 () Bool)

(assert (=> b!138714 (= e!90407 (Some!180 (_2!1314 (h!2312 (toList!854 lt!72226)))))))

(declare-fun b!138717 () Bool)

(assert (=> b!138717 (= e!90408 None!179)))

(assert (= (and d!43407 c!25983) b!138714))

(assert (= (and d!43407 (not c!25983)) b!138715))

(assert (= (and b!138715 c!25984) b!138716))

(assert (= (and b!138715 (not c!25984)) b!138717))

(assert (=> b!138716 m!165363))

(declare-fun m!165787 () Bool)

(assert (=> b!138716 m!165787))

(assert (=> b!138361 d!43407))

(declare-fun d!43409 () Bool)

(assert (=> d!43409 (isDefined!127 (getValueByKey!175 (toList!854 lt!72226) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun lt!72485 () Unit!4353)

(declare-fun choose!855 (List!1709 (_ BitVec 64)) Unit!4353)

(assert (=> d!43409 (= lt!72485 (choose!855 (toList!854 lt!72226) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun e!90411 () Bool)

(assert (=> d!43409 e!90411))

(declare-fun res!66375 () Bool)

(assert (=> d!43409 (=> (not res!66375) (not e!90411))))

(declare-fun isStrictlySorted!311 (List!1709) Bool)

(assert (=> d!43409 (= res!66375 (isStrictlySorted!311 (toList!854 lt!72226)))))

(assert (=> d!43409 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!854 lt!72226) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) lt!72485)))

(declare-fun b!138720 () Bool)

(assert (=> b!138720 (= e!90411 (containsKey!178 (toList!854 lt!72226) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (= (and d!43409 res!66375) b!138720))

(assert (=> d!43409 m!165363))

(assert (=> d!43409 m!165481))

(assert (=> d!43409 m!165481))

(assert (=> d!43409 m!165483))

(assert (=> d!43409 m!165363))

(declare-fun m!165789 () Bool)

(assert (=> d!43409 m!165789))

(declare-fun m!165791 () Bool)

(assert (=> d!43409 m!165791))

(assert (=> b!138720 m!165363))

(assert (=> b!138720 m!165477))

(assert (=> b!138359 d!43409))

(assert (=> b!138359 d!43405))

(assert (=> b!138359 d!43407))

(declare-fun b!138721 () Bool)

(declare-fun e!90416 () ListLongMap!1677)

(declare-fun call!15278 () ListLongMap!1677)

(assert (=> b!138721 (= e!90416 call!15278)))

(declare-fun b!138722 () Bool)

(declare-fun e!90419 () Unit!4353)

(declare-fun Unit!4362 () Unit!4353)

(assert (=> b!138722 (= e!90419 Unit!4362)))

(declare-fun b!138723 () Bool)

(declare-fun c!25988 () Bool)

(assert (=> b!138723 (= c!25988 (and (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!90414 () ListLongMap!1677)

(assert (=> b!138723 (= e!90414 e!90416)))

(declare-fun bm!15269 () Bool)

(declare-fun call!15277 () ListLongMap!1677)

(assert (=> bm!15269 (= call!15277 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun b!138724 () Bool)

(declare-fun e!90422 () Bool)

(declare-fun e!90421 () Bool)

(assert (=> b!138724 (= e!90422 e!90421)))

(declare-fun res!66382 () Bool)

(assert (=> b!138724 (=> (not res!66382) (not e!90421))))

(declare-fun lt!72491 () ListLongMap!1677)

(assert (=> b!138724 (= res!66382 (contains!897 lt!72491 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!138724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138725 () Bool)

(declare-fun res!66384 () Bool)

(declare-fun e!90424 () Bool)

(assert (=> b!138725 (=> (not res!66384) (not e!90424))))

(declare-fun e!90418 () Bool)

(assert (=> b!138725 (= res!66384 e!90418)))

(declare-fun c!25986 () Bool)

(assert (=> b!138725 (= c!25986 (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!138726 () Bool)

(declare-fun call!15276 () ListLongMap!1677)

(assert (=> b!138726 (= e!90416 call!15276)))

(declare-fun b!138727 () Bool)

(declare-fun e!90415 () Bool)

(assert (=> b!138727 (= e!90415 (= (apply!118 lt!72491 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2769 newMap!16)))))

(declare-fun bm!15270 () Bool)

(declare-fun c!25989 () Bool)

(declare-fun call!15272 () ListLongMap!1677)

(declare-fun call!15273 () ListLongMap!1677)

(declare-fun c!25987 () Bool)

(assert (=> bm!15270 (= call!15272 (+!171 (ite c!25989 call!15277 (ite c!25987 call!15273 call!15276)) (ite (or c!25989 c!25987) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 newMap!16)) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 newMap!16)))))))

(declare-fun b!138728 () Bool)

(declare-fun e!90423 () Bool)

(assert (=> b!138728 (= e!90423 (validKeyInArray!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15271 () Bool)

(assert (=> bm!15271 (= call!15276 call!15273)))

(declare-fun b!138729 () Bool)

(declare-fun res!66383 () Bool)

(assert (=> b!138729 (=> (not res!66383) (not e!90424))))

(assert (=> b!138729 (= res!66383 e!90422)))

(declare-fun res!66380 () Bool)

(assert (=> b!138729 (=> res!66380 e!90422)))

(assert (=> b!138729 (= res!66380 (not e!90423))))

(declare-fun res!66376 () Bool)

(assert (=> b!138729 (=> (not res!66376) (not e!90423))))

(assert (=> b!138729 (= res!66376 (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138730 () Bool)

(declare-fun e!90420 () Bool)

(assert (=> b!138730 (= e!90424 e!90420)))

(declare-fun c!25985 () Bool)

(assert (=> b!138730 (= c!25985 (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!43411 () Bool)

(assert (=> d!43411 e!90424))

(declare-fun res!66381 () Bool)

(assert (=> d!43411 (=> (not res!66381) (not e!90424))))

(assert (=> d!43411 (= res!66381 (or (bvsge #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))))

(declare-fun lt!72494 () ListLongMap!1677)

(assert (=> d!43411 (= lt!72491 lt!72494)))

(declare-fun lt!72487 () Unit!4353)

(assert (=> d!43411 (= lt!72487 e!90419)))

(declare-fun c!25990 () Bool)

(declare-fun e!90417 () Bool)

(assert (=> d!43411 (= c!25990 e!90417)))

(declare-fun res!66379 () Bool)

(assert (=> d!43411 (=> (not res!66379) (not e!90417))))

(assert (=> d!43411 (= res!66379 (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun e!90413 () ListLongMap!1677)

(assert (=> d!43411 (= lt!72494 e!90413)))

(assert (=> d!43411 (= c!25989 (and (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43411 (validMask!0 (mask!7248 newMap!16))))

(assert (=> d!43411 (= (getCurrentListMap!527 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) lt!72491)))

(declare-fun b!138731 () Bool)

(declare-fun lt!72489 () Unit!4353)

(assert (=> b!138731 (= e!90419 lt!72489)))

(declare-fun lt!72498 () ListLongMap!1677)

(assert (=> b!138731 (= lt!72498 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72503 () (_ BitVec 64))

(assert (=> b!138731 (= lt!72503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72488 () (_ BitVec 64))

(assert (=> b!138731 (= lt!72488 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72497 () Unit!4353)

(assert (=> b!138731 (= lt!72497 (addStillContains!94 lt!72498 lt!72503 (zeroValue!2769 newMap!16) lt!72488))))

(assert (=> b!138731 (contains!897 (+!171 lt!72498 (tuple2!2607 lt!72503 (zeroValue!2769 newMap!16))) lt!72488)))

(declare-fun lt!72496 () Unit!4353)

(assert (=> b!138731 (= lt!72496 lt!72497)))

(declare-fun lt!72493 () ListLongMap!1677)

(assert (=> b!138731 (= lt!72493 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72506 () (_ BitVec 64))

(assert (=> b!138731 (= lt!72506 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72499 () (_ BitVec 64))

(assert (=> b!138731 (= lt!72499 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72504 () Unit!4353)

(assert (=> b!138731 (= lt!72504 (addApplyDifferent!94 lt!72493 lt!72506 (minValue!2769 newMap!16) lt!72499))))

(assert (=> b!138731 (= (apply!118 (+!171 lt!72493 (tuple2!2607 lt!72506 (minValue!2769 newMap!16))) lt!72499) (apply!118 lt!72493 lt!72499))))

(declare-fun lt!72492 () Unit!4353)

(assert (=> b!138731 (= lt!72492 lt!72504)))

(declare-fun lt!72486 () ListLongMap!1677)

(assert (=> b!138731 (= lt!72486 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72500 () (_ BitVec 64))

(assert (=> b!138731 (= lt!72500 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72502 () (_ BitVec 64))

(assert (=> b!138731 (= lt!72502 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72495 () Unit!4353)

(assert (=> b!138731 (= lt!72495 (addApplyDifferent!94 lt!72486 lt!72500 (zeroValue!2769 newMap!16) lt!72502))))

(assert (=> b!138731 (= (apply!118 (+!171 lt!72486 (tuple2!2607 lt!72500 (zeroValue!2769 newMap!16))) lt!72502) (apply!118 lt!72486 lt!72502))))

(declare-fun lt!72501 () Unit!4353)

(assert (=> b!138731 (= lt!72501 lt!72495)))

(declare-fun lt!72507 () ListLongMap!1677)

(assert (=> b!138731 (= lt!72507 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72490 () (_ BitVec 64))

(assert (=> b!138731 (= lt!72490 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72505 () (_ BitVec 64))

(assert (=> b!138731 (= lt!72505 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138731 (= lt!72489 (addApplyDifferent!94 lt!72507 lt!72490 (minValue!2769 newMap!16) lt!72505))))

(assert (=> b!138731 (= (apply!118 (+!171 lt!72507 (tuple2!2607 lt!72490 (minValue!2769 newMap!16))) lt!72505) (apply!118 lt!72507 lt!72505))))

(declare-fun b!138732 () Bool)

(declare-fun e!90412 () Bool)

(assert (=> b!138732 (= e!90412 (= (apply!118 lt!72491 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2769 newMap!16)))))

(declare-fun b!138733 () Bool)

(assert (=> b!138733 (= e!90420 e!90415)))

(declare-fun res!66377 () Bool)

(declare-fun call!15274 () Bool)

(assert (=> b!138733 (= res!66377 call!15274)))

(assert (=> b!138733 (=> (not res!66377) (not e!90415))))

(declare-fun b!138734 () Bool)

(assert (=> b!138734 (= e!90413 e!90414)))

(assert (=> b!138734 (= c!25987 (and (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15272 () Bool)

(declare-fun call!15275 () Bool)

(assert (=> bm!15272 (= call!15275 (contains!897 lt!72491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138735 () Bool)

(assert (=> b!138735 (= e!90421 (= (apply!118 lt!72491 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)) (get!1516 (select (arr!2289 (_values!2901 newMap!16)) #b00000000000000000000000000000000) (dynLambda!435 (defaultEntry!2918 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138735 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2560 (_values!2901 newMap!16))))))

(assert (=> b!138735 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138736 () Bool)

(assert (=> b!138736 (= e!90418 e!90412)))

(declare-fun res!66378 () Bool)

(assert (=> b!138736 (= res!66378 call!15275)))

(assert (=> b!138736 (=> (not res!66378) (not e!90412))))

(declare-fun bm!15273 () Bool)

(assert (=> bm!15273 (= call!15273 call!15277)))

(declare-fun bm!15274 () Bool)

(assert (=> bm!15274 (= call!15274 (contains!897 lt!72491 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138737 () Bool)

(assert (=> b!138737 (= e!90420 (not call!15274))))

(declare-fun bm!15275 () Bool)

(assert (=> bm!15275 (= call!15278 call!15272)))

(declare-fun b!138738 () Bool)

(assert (=> b!138738 (= e!90417 (validKeyInArray!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138739 () Bool)

(assert (=> b!138739 (= e!90418 (not call!15275))))

(declare-fun b!138740 () Bool)

(assert (=> b!138740 (= e!90413 (+!171 call!15272 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 newMap!16))))))

(declare-fun b!138741 () Bool)

(assert (=> b!138741 (= e!90414 call!15278)))

(assert (= (and d!43411 c!25989) b!138740))

(assert (= (and d!43411 (not c!25989)) b!138734))

(assert (= (and b!138734 c!25987) b!138741))

(assert (= (and b!138734 (not c!25987)) b!138723))

(assert (= (and b!138723 c!25988) b!138721))

(assert (= (and b!138723 (not c!25988)) b!138726))

(assert (= (or b!138721 b!138726) bm!15271))

(assert (= (or b!138741 bm!15271) bm!15273))

(assert (= (or b!138741 b!138721) bm!15275))

(assert (= (or b!138740 bm!15273) bm!15269))

(assert (= (or b!138740 bm!15275) bm!15270))

(assert (= (and d!43411 res!66379) b!138738))

(assert (= (and d!43411 c!25990) b!138731))

(assert (= (and d!43411 (not c!25990)) b!138722))

(assert (= (and d!43411 res!66381) b!138729))

(assert (= (and b!138729 res!66376) b!138728))

(assert (= (and b!138729 (not res!66380)) b!138724))

(assert (= (and b!138724 res!66382) b!138735))

(assert (= (and b!138729 res!66383) b!138725))

(assert (= (and b!138725 c!25986) b!138736))

(assert (= (and b!138725 (not c!25986)) b!138739))

(assert (= (and b!138736 res!66378) b!138732))

(assert (= (or b!138736 b!138739) bm!15272))

(assert (= (and b!138725 res!66384) b!138730))

(assert (= (and b!138730 c!25985) b!138733))

(assert (= (and b!138730 (not c!25985)) b!138737))

(assert (= (and b!138733 res!66377) b!138727))

(assert (= (or b!138733 b!138737) bm!15274))

(declare-fun b_lambda!6219 () Bool)

(assert (=> (not b_lambda!6219) (not b!138735)))

(assert (=> b!138735 t!6256))

(declare-fun b_and!8645 () Bool)

(assert (= b_and!8641 (and (=> t!6256 result!4125) b_and!8645)))

(assert (=> b!138735 t!6258))

(declare-fun b_and!8647 () Bool)

(assert (= b_and!8643 (and (=> t!6258 result!4127) b_and!8647)))

(declare-fun m!165793 () Bool)

(assert (=> b!138732 m!165793))

(assert (=> b!138728 m!165679))

(assert (=> b!138728 m!165679))

(assert (=> b!138728 m!165681))

(declare-fun m!165795 () Bool)

(assert (=> bm!15272 m!165795))

(declare-fun m!165797 () Bool)

(assert (=> b!138731 m!165797))

(assert (=> b!138731 m!165679))

(declare-fun m!165799 () Bool)

(assert (=> b!138731 m!165799))

(declare-fun m!165801 () Bool)

(assert (=> b!138731 m!165801))

(declare-fun m!165803 () Bool)

(assert (=> b!138731 m!165803))

(declare-fun m!165805 () Bool)

(assert (=> b!138731 m!165805))

(declare-fun m!165807 () Bool)

(assert (=> b!138731 m!165807))

(declare-fun m!165809 () Bool)

(assert (=> b!138731 m!165809))

(declare-fun m!165811 () Bool)

(assert (=> b!138731 m!165811))

(assert (=> b!138731 m!165805))

(declare-fun m!165813 () Bool)

(assert (=> b!138731 m!165813))

(assert (=> b!138731 m!165799))

(declare-fun m!165815 () Bool)

(assert (=> b!138731 m!165815))

(declare-fun m!165817 () Bool)

(assert (=> b!138731 m!165817))

(declare-fun m!165819 () Bool)

(assert (=> b!138731 m!165819))

(declare-fun m!165821 () Bool)

(assert (=> b!138731 m!165821))

(assert (=> b!138731 m!165813))

(declare-fun m!165823 () Bool)

(assert (=> b!138731 m!165823))

(declare-fun m!165825 () Bool)

(assert (=> b!138731 m!165825))

(assert (=> b!138731 m!165821))

(declare-fun m!165827 () Bool)

(assert (=> b!138731 m!165827))

(assert (=> b!138735 m!165679))

(assert (=> b!138735 m!165747))

(assert (=> b!138735 m!165749))

(assert (=> b!138735 m!165679))

(declare-fun m!165829 () Bool)

(assert (=> b!138735 m!165829))

(assert (=> b!138735 m!165749))

(assert (=> b!138735 m!165747))

(assert (=> b!138735 m!165753))

(assert (=> b!138724 m!165679))

(assert (=> b!138724 m!165679))

(declare-fun m!165831 () Bool)

(assert (=> b!138724 m!165831))

(assert (=> bm!15269 m!165825))

(assert (=> b!138738 m!165679))

(assert (=> b!138738 m!165679))

(assert (=> b!138738 m!165681))

(assert (=> d!43411 m!165649))

(declare-fun m!165833 () Bool)

(assert (=> b!138727 m!165833))

(declare-fun m!165835 () Bool)

(assert (=> bm!15274 m!165835))

(declare-fun m!165837 () Bool)

(assert (=> b!138740 m!165837))

(declare-fun m!165839 () Bool)

(assert (=> bm!15270 m!165839))

(assert (=> d!43357 d!43411))

(declare-fun b!138742 () Bool)

(declare-fun e!90429 () ListLongMap!1677)

(declare-fun call!15285 () ListLongMap!1677)

(assert (=> b!138742 (= e!90429 call!15285)))

(declare-fun b!138743 () Bool)

(declare-fun e!90432 () Unit!4353)

(declare-fun Unit!4363 () Unit!4353)

(assert (=> b!138743 (= e!90432 Unit!4363)))

(declare-fun b!138744 () Bool)

(declare-fun c!25994 () Bool)

(assert (=> b!138744 (= c!25994 (and (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!90427 () ListLongMap!1677)

(assert (=> b!138744 (= e!90427 e!90429)))

(declare-fun bm!15276 () Bool)

(declare-fun call!15284 () ListLongMap!1677)

(assert (=> bm!15276 (= call!15284 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) lt!72339 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun b!138745 () Bool)

(declare-fun e!90435 () Bool)

(declare-fun e!90434 () Bool)

(assert (=> b!138745 (= e!90435 e!90434)))

(declare-fun res!66391 () Bool)

(assert (=> b!138745 (=> (not res!66391) (not e!90434))))

(declare-fun lt!72513 () ListLongMap!1677)

(assert (=> b!138745 (= res!66391 (contains!897 lt!72513 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!138745 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138746 () Bool)

(declare-fun res!66393 () Bool)

(declare-fun e!90437 () Bool)

(assert (=> b!138746 (=> (not res!66393) (not e!90437))))

(declare-fun e!90431 () Bool)

(assert (=> b!138746 (= res!66393 e!90431)))

(declare-fun c!25992 () Bool)

(assert (=> b!138746 (= c!25992 (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!138747 () Bool)

(declare-fun call!15283 () ListLongMap!1677)

(assert (=> b!138747 (= e!90429 call!15283)))

(declare-fun b!138748 () Bool)

(declare-fun e!90428 () Bool)

(assert (=> b!138748 (= e!90428 (= (apply!118 lt!72513 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2769 newMap!16)))))

(declare-fun bm!15277 () Bool)

(declare-fun call!15279 () ListLongMap!1677)

(declare-fun call!15280 () ListLongMap!1677)

(declare-fun c!25993 () Bool)

(declare-fun c!25995 () Bool)

(assert (=> bm!15277 (= call!15279 (+!171 (ite c!25995 call!15284 (ite c!25993 call!15280 call!15283)) (ite (or c!25995 c!25993) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 newMap!16)) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 newMap!16)))))))

(declare-fun b!138749 () Bool)

(declare-fun e!90436 () Bool)

(assert (=> b!138749 (= e!90436 (validKeyInArray!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15278 () Bool)

(assert (=> bm!15278 (= call!15283 call!15280)))

(declare-fun b!138750 () Bool)

(declare-fun res!66392 () Bool)

(assert (=> b!138750 (=> (not res!66392) (not e!90437))))

(assert (=> b!138750 (= res!66392 e!90435)))

(declare-fun res!66389 () Bool)

(assert (=> b!138750 (=> res!66389 e!90435)))

(assert (=> b!138750 (= res!66389 (not e!90436))))

(declare-fun res!66385 () Bool)

(assert (=> b!138750 (=> (not res!66385) (not e!90436))))

(assert (=> b!138750 (= res!66385 (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138751 () Bool)

(declare-fun e!90433 () Bool)

(assert (=> b!138751 (= e!90437 e!90433)))

(declare-fun c!25991 () Bool)

(assert (=> b!138751 (= c!25991 (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!43413 () Bool)

(assert (=> d!43413 e!90437))

(declare-fun res!66390 () Bool)

(assert (=> d!43413 (=> (not res!66390) (not e!90437))))

(assert (=> d!43413 (= res!66390 (or (bvsge #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))))

(declare-fun lt!72516 () ListLongMap!1677)

(assert (=> d!43413 (= lt!72513 lt!72516)))

(declare-fun lt!72509 () Unit!4353)

(assert (=> d!43413 (= lt!72509 e!90432)))

(declare-fun c!25996 () Bool)

(declare-fun e!90430 () Bool)

(assert (=> d!43413 (= c!25996 e!90430)))

(declare-fun res!66388 () Bool)

(assert (=> d!43413 (=> (not res!66388) (not e!90430))))

(assert (=> d!43413 (= res!66388 (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun e!90426 () ListLongMap!1677)

(assert (=> d!43413 (= lt!72516 e!90426)))

(assert (=> d!43413 (= c!25995 (and (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43413 (validMask!0 (mask!7248 newMap!16))))

(assert (=> d!43413 (= (getCurrentListMap!527 (_keys!4675 newMap!16) lt!72339 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) lt!72513)))

(declare-fun b!138752 () Bool)

(declare-fun lt!72511 () Unit!4353)

(assert (=> b!138752 (= e!90432 lt!72511)))

(declare-fun lt!72520 () ListLongMap!1677)

(assert (=> b!138752 (= lt!72520 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) lt!72339 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72525 () (_ BitVec 64))

(assert (=> b!138752 (= lt!72525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72510 () (_ BitVec 64))

(assert (=> b!138752 (= lt!72510 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72519 () Unit!4353)

(assert (=> b!138752 (= lt!72519 (addStillContains!94 lt!72520 lt!72525 (zeroValue!2769 newMap!16) lt!72510))))

(assert (=> b!138752 (contains!897 (+!171 lt!72520 (tuple2!2607 lt!72525 (zeroValue!2769 newMap!16))) lt!72510)))

(declare-fun lt!72518 () Unit!4353)

(assert (=> b!138752 (= lt!72518 lt!72519)))

(declare-fun lt!72515 () ListLongMap!1677)

(assert (=> b!138752 (= lt!72515 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) lt!72339 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72528 () (_ BitVec 64))

(assert (=> b!138752 (= lt!72528 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72521 () (_ BitVec 64))

(assert (=> b!138752 (= lt!72521 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72526 () Unit!4353)

(assert (=> b!138752 (= lt!72526 (addApplyDifferent!94 lt!72515 lt!72528 (minValue!2769 newMap!16) lt!72521))))

(assert (=> b!138752 (= (apply!118 (+!171 lt!72515 (tuple2!2607 lt!72528 (minValue!2769 newMap!16))) lt!72521) (apply!118 lt!72515 lt!72521))))

(declare-fun lt!72514 () Unit!4353)

(assert (=> b!138752 (= lt!72514 lt!72526)))

(declare-fun lt!72508 () ListLongMap!1677)

(assert (=> b!138752 (= lt!72508 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) lt!72339 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72522 () (_ BitVec 64))

(assert (=> b!138752 (= lt!72522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72524 () (_ BitVec 64))

(assert (=> b!138752 (= lt!72524 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72517 () Unit!4353)

(assert (=> b!138752 (= lt!72517 (addApplyDifferent!94 lt!72508 lt!72522 (zeroValue!2769 newMap!16) lt!72524))))

(assert (=> b!138752 (= (apply!118 (+!171 lt!72508 (tuple2!2607 lt!72522 (zeroValue!2769 newMap!16))) lt!72524) (apply!118 lt!72508 lt!72524))))

(declare-fun lt!72523 () Unit!4353)

(assert (=> b!138752 (= lt!72523 lt!72517)))

(declare-fun lt!72529 () ListLongMap!1677)

(assert (=> b!138752 (= lt!72529 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) lt!72339 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72512 () (_ BitVec 64))

(assert (=> b!138752 (= lt!72512 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72527 () (_ BitVec 64))

(assert (=> b!138752 (= lt!72527 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138752 (= lt!72511 (addApplyDifferent!94 lt!72529 lt!72512 (minValue!2769 newMap!16) lt!72527))))

(assert (=> b!138752 (= (apply!118 (+!171 lt!72529 (tuple2!2607 lt!72512 (minValue!2769 newMap!16))) lt!72527) (apply!118 lt!72529 lt!72527))))

(declare-fun b!138753 () Bool)

(declare-fun e!90425 () Bool)

(assert (=> b!138753 (= e!90425 (= (apply!118 lt!72513 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2769 newMap!16)))))

(declare-fun b!138754 () Bool)

(assert (=> b!138754 (= e!90433 e!90428)))

(declare-fun res!66386 () Bool)

(declare-fun call!15281 () Bool)

(assert (=> b!138754 (= res!66386 call!15281)))

(assert (=> b!138754 (=> (not res!66386) (not e!90428))))

(declare-fun b!138755 () Bool)

(assert (=> b!138755 (= e!90426 e!90427)))

(assert (=> b!138755 (= c!25993 (and (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15279 () Bool)

(declare-fun call!15282 () Bool)

(assert (=> bm!15279 (= call!15282 (contains!897 lt!72513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138756 () Bool)

(assert (=> b!138756 (= e!90434 (= (apply!118 lt!72513 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)) (get!1516 (select (arr!2289 lt!72339) #b00000000000000000000000000000000) (dynLambda!435 (defaultEntry!2918 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2560 lt!72339)))))

(assert (=> b!138756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138757 () Bool)

(assert (=> b!138757 (= e!90431 e!90425)))

(declare-fun res!66387 () Bool)

(assert (=> b!138757 (= res!66387 call!15282)))

(assert (=> b!138757 (=> (not res!66387) (not e!90425))))

(declare-fun bm!15280 () Bool)

(assert (=> bm!15280 (= call!15280 call!15284)))

(declare-fun bm!15281 () Bool)

(assert (=> bm!15281 (= call!15281 (contains!897 lt!72513 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138758 () Bool)

(assert (=> b!138758 (= e!90433 (not call!15281))))

(declare-fun bm!15282 () Bool)

(assert (=> bm!15282 (= call!15285 call!15279)))

(declare-fun b!138759 () Bool)

(assert (=> b!138759 (= e!90430 (validKeyInArray!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138760 () Bool)

(assert (=> b!138760 (= e!90431 (not call!15282))))

(declare-fun b!138761 () Bool)

(assert (=> b!138761 (= e!90426 (+!171 call!15279 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 newMap!16))))))

(declare-fun b!138762 () Bool)

(assert (=> b!138762 (= e!90427 call!15285)))

(assert (= (and d!43413 c!25995) b!138761))

(assert (= (and d!43413 (not c!25995)) b!138755))

(assert (= (and b!138755 c!25993) b!138762))

(assert (= (and b!138755 (not c!25993)) b!138744))

(assert (= (and b!138744 c!25994) b!138742))

(assert (= (and b!138744 (not c!25994)) b!138747))

(assert (= (or b!138742 b!138747) bm!15278))

(assert (= (or b!138762 bm!15278) bm!15280))

(assert (= (or b!138762 b!138742) bm!15282))

(assert (= (or b!138761 bm!15280) bm!15276))

(assert (= (or b!138761 bm!15282) bm!15277))

(assert (= (and d!43413 res!66388) b!138759))

(assert (= (and d!43413 c!25996) b!138752))

(assert (= (and d!43413 (not c!25996)) b!138743))

(assert (= (and d!43413 res!66390) b!138750))

(assert (= (and b!138750 res!66385) b!138749))

(assert (= (and b!138750 (not res!66389)) b!138745))

(assert (= (and b!138745 res!66391) b!138756))

(assert (= (and b!138750 res!66392) b!138746))

(assert (= (and b!138746 c!25992) b!138757))

(assert (= (and b!138746 (not c!25992)) b!138760))

(assert (= (and b!138757 res!66387) b!138753))

(assert (= (or b!138757 b!138760) bm!15279))

(assert (= (and b!138746 res!66393) b!138751))

(assert (= (and b!138751 c!25991) b!138754))

(assert (= (and b!138751 (not c!25991)) b!138758))

(assert (= (and b!138754 res!66386) b!138748))

(assert (= (or b!138754 b!138758) bm!15281))

(declare-fun b_lambda!6221 () Bool)

(assert (=> (not b_lambda!6221) (not b!138756)))

(assert (=> b!138756 t!6256))

(declare-fun b_and!8649 () Bool)

(assert (= b_and!8645 (and (=> t!6256 result!4125) b_and!8649)))

(assert (=> b!138756 t!6258))

(declare-fun b_and!8651 () Bool)

(assert (= b_and!8647 (and (=> t!6258 result!4127) b_and!8651)))

(declare-fun m!165841 () Bool)

(assert (=> b!138753 m!165841))

(assert (=> b!138749 m!165679))

(assert (=> b!138749 m!165679))

(assert (=> b!138749 m!165681))

(declare-fun m!165843 () Bool)

(assert (=> bm!15279 m!165843))

(declare-fun m!165845 () Bool)

(assert (=> b!138752 m!165845))

(assert (=> b!138752 m!165679))

(declare-fun m!165847 () Bool)

(assert (=> b!138752 m!165847))

(declare-fun m!165849 () Bool)

(assert (=> b!138752 m!165849))

(declare-fun m!165851 () Bool)

(assert (=> b!138752 m!165851))

(declare-fun m!165853 () Bool)

(assert (=> b!138752 m!165853))

(declare-fun m!165855 () Bool)

(assert (=> b!138752 m!165855))

(declare-fun m!165857 () Bool)

(assert (=> b!138752 m!165857))

(declare-fun m!165859 () Bool)

(assert (=> b!138752 m!165859))

(assert (=> b!138752 m!165853))

(declare-fun m!165861 () Bool)

(assert (=> b!138752 m!165861))

(assert (=> b!138752 m!165847))

(declare-fun m!165863 () Bool)

(assert (=> b!138752 m!165863))

(declare-fun m!165865 () Bool)

(assert (=> b!138752 m!165865))

(declare-fun m!165867 () Bool)

(assert (=> b!138752 m!165867))

(declare-fun m!165869 () Bool)

(assert (=> b!138752 m!165869))

(assert (=> b!138752 m!165861))

(declare-fun m!165871 () Bool)

(assert (=> b!138752 m!165871))

(declare-fun m!165873 () Bool)

(assert (=> b!138752 m!165873))

(assert (=> b!138752 m!165869))

(declare-fun m!165875 () Bool)

(assert (=> b!138752 m!165875))

(assert (=> b!138756 m!165679))

(assert (=> b!138756 m!165747))

(declare-fun m!165877 () Bool)

(assert (=> b!138756 m!165877))

(assert (=> b!138756 m!165679))

(declare-fun m!165879 () Bool)

(assert (=> b!138756 m!165879))

(assert (=> b!138756 m!165877))

(assert (=> b!138756 m!165747))

(declare-fun m!165881 () Bool)

(assert (=> b!138756 m!165881))

(assert (=> b!138745 m!165679))

(assert (=> b!138745 m!165679))

(declare-fun m!165883 () Bool)

(assert (=> b!138745 m!165883))

(assert (=> bm!15276 m!165873))

(assert (=> b!138759 m!165679))

(assert (=> b!138759 m!165679))

(assert (=> b!138759 m!165681))

(assert (=> d!43413 m!165649))

(declare-fun m!165885 () Bool)

(assert (=> b!138748 m!165885))

(declare-fun m!165887 () Bool)

(assert (=> bm!15281 m!165887))

(declare-fun m!165889 () Bool)

(assert (=> b!138761 m!165889))

(declare-fun m!165891 () Bool)

(assert (=> bm!15277 m!165891))

(assert (=> b!138480 d!43413))

(declare-fun d!43415 () Bool)

(declare-fun e!90440 () Bool)

(assert (=> d!43415 e!90440))

(declare-fun res!66398 () Bool)

(assert (=> d!43415 (=> (not res!66398) (not e!90440))))

(declare-fun lt!72535 () SeekEntryResult!271)

(assert (=> d!43415 (= res!66398 ((_ is Found!271) lt!72535))))

(assert (=> d!43415 (= lt!72535 (seekEntryOrOpen!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (_keys!4675 newMap!16) (mask!7248 newMap!16)))))

(declare-fun lt!72534 () Unit!4353)

(declare-fun choose!856 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) Int) Unit!4353)

(assert (=> d!43415 (= lt!72534 (choose!856 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43415 (validMask!0 (mask!7248 newMap!16))))

(assert (=> d!43415 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!63 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)) lt!72534)))

(declare-fun b!138767 () Bool)

(declare-fun res!66399 () Bool)

(assert (=> b!138767 (=> (not res!66399) (not e!90440))))

(assert (=> b!138767 (= res!66399 (inRange!0 (index!3247 lt!72535) (mask!7248 newMap!16)))))

(declare-fun b!138768 () Bool)

(assert (=> b!138768 (= e!90440 (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3247 lt!72535)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> b!138768 (and (bvsge (index!3247 lt!72535) #b00000000000000000000000000000000) (bvslt (index!3247 lt!72535) (size!2559 (_keys!4675 newMap!16))))))

(assert (= (and d!43415 res!66398) b!138767))

(assert (= (and b!138767 res!66399) b!138768))

(assert (=> d!43415 m!165363))

(assert (=> d!43415 m!165513))

(assert (=> d!43415 m!165363))

(declare-fun m!165893 () Bool)

(assert (=> d!43415 m!165893))

(assert (=> d!43415 m!165649))

(declare-fun m!165895 () Bool)

(assert (=> b!138767 m!165895))

(declare-fun m!165897 () Bool)

(assert (=> b!138768 m!165897))

(assert (=> bm!15227 d!43415))

(declare-fun d!43417 () Bool)

(declare-fun e!90442 () Bool)

(assert (=> d!43417 e!90442))

(declare-fun res!66400 () Bool)

(assert (=> d!43417 (=> res!66400 e!90442)))

(declare-fun lt!72538 () Bool)

(assert (=> d!43417 (= res!66400 (not lt!72538))))

(declare-fun lt!72537 () Bool)

(assert (=> d!43417 (= lt!72538 lt!72537)))

(declare-fun lt!72539 () Unit!4353)

(declare-fun e!90441 () Unit!4353)

(assert (=> d!43417 (= lt!72539 e!90441)))

(declare-fun c!25997 () Bool)

(assert (=> d!43417 (= c!25997 lt!72537)))

(assert (=> d!43417 (= lt!72537 (containsKey!178 (toList!854 lt!72394) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!43417 (= (contains!897 lt!72394 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!72538)))

(declare-fun b!138769 () Bool)

(declare-fun lt!72536 () Unit!4353)

(assert (=> b!138769 (= e!90441 lt!72536)))

(assert (=> b!138769 (= lt!72536 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!854 lt!72394) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!138769 (isDefined!127 (getValueByKey!175 (toList!854 lt!72394) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!138770 () Bool)

(declare-fun Unit!4364 () Unit!4353)

(assert (=> b!138770 (= e!90441 Unit!4364)))

(declare-fun b!138771 () Bool)

(assert (=> b!138771 (= e!90442 (isDefined!127 (getValueByKey!175 (toList!854 lt!72394) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!43417 c!25997) b!138769))

(assert (= (and d!43417 (not c!25997)) b!138770))

(assert (= (and d!43417 (not res!66400)) b!138771))

(assert (=> d!43417 m!165565))

(declare-fun m!165899 () Bool)

(assert (=> d!43417 m!165899))

(assert (=> b!138769 m!165565))

(declare-fun m!165901 () Bool)

(assert (=> b!138769 m!165901))

(assert (=> b!138769 m!165565))

(assert (=> b!138769 m!165637))

(assert (=> b!138769 m!165637))

(declare-fun m!165903 () Bool)

(assert (=> b!138769 m!165903))

(assert (=> b!138771 m!165565))

(assert (=> b!138771 m!165637))

(assert (=> b!138771 m!165637))

(assert (=> b!138771 m!165903))

(assert (=> b!138557 d!43417))

(assert (=> b!138585 d!43363))

(declare-fun d!43419 () Bool)

(declare-fun e!90443 () Bool)

(assert (=> d!43419 e!90443))

(declare-fun res!66401 () Bool)

(assert (=> d!43419 (=> (not res!66401) (not e!90443))))

(declare-fun lt!72540 () ListLongMap!1677)

(assert (=> d!43419 (= res!66401 (contains!897 lt!72540 (_1!1314 (ite c!25915 (ite c!25918 (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!72543 () List!1709)

(assert (=> d!43419 (= lt!72540 (ListLongMap!1678 lt!72543))))

(declare-fun lt!72541 () Unit!4353)

(declare-fun lt!72542 () Unit!4353)

(assert (=> d!43419 (= lt!72541 lt!72542)))

(assert (=> d!43419 (= (getValueByKey!175 lt!72543 (_1!1314 (ite c!25915 (ite c!25918 (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!180 (_2!1314 (ite c!25915 (ite c!25918 (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!43419 (= lt!72542 (lemmaContainsTupThenGetReturnValue!90 lt!72543 (_1!1314 (ite c!25915 (ite c!25918 (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1314 (ite c!25915 (ite c!25918 (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!43419 (= lt!72543 (insertStrictlySorted!93 (toList!854 (ite c!25915 call!15218 call!15216)) (_1!1314 (ite c!25915 (ite c!25918 (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1314 (ite c!25915 (ite c!25918 (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!43419 (= (+!171 (ite c!25915 call!15218 call!15216) (ite c!25915 (ite c!25918 (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!72540)))

(declare-fun b!138772 () Bool)

(declare-fun res!66402 () Bool)

(assert (=> b!138772 (=> (not res!66402) (not e!90443))))

(assert (=> b!138772 (= res!66402 (= (getValueByKey!175 (toList!854 lt!72540) (_1!1314 (ite c!25915 (ite c!25918 (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!180 (_2!1314 (ite c!25915 (ite c!25918 (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!138773 () Bool)

(assert (=> b!138773 (= e!90443 (contains!899 (toList!854 lt!72540) (ite c!25915 (ite c!25918 (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!43419 res!66401) b!138772))

(assert (= (and b!138772 res!66402) b!138773))

(declare-fun m!165905 () Bool)

(assert (=> d!43419 m!165905))

(declare-fun m!165907 () Bool)

(assert (=> d!43419 m!165907))

(declare-fun m!165909 () Bool)

(assert (=> d!43419 m!165909))

(declare-fun m!165911 () Bool)

(assert (=> d!43419 m!165911))

(declare-fun m!165913 () Bool)

(assert (=> b!138772 m!165913))

(declare-fun m!165915 () Bool)

(assert (=> b!138773 m!165915))

(assert (=> bm!15204 d!43419))

(declare-fun d!43421 () Bool)

(declare-fun res!66403 () Bool)

(declare-fun e!90444 () Bool)

(assert (=> d!43421 (=> res!66403 e!90444)))

(assert (=> d!43421 (= res!66403 (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> d!43421 (= (arrayContainsKey!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!90444)))

(declare-fun b!138774 () Bool)

(declare-fun e!90445 () Bool)

(assert (=> b!138774 (= e!90444 e!90445)))

(declare-fun res!66404 () Bool)

(assert (=> b!138774 (=> (not res!66404) (not e!90445))))

(assert (=> b!138774 (= res!66404 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(declare-fun b!138775 () Bool)

(assert (=> b!138775 (= e!90445 (arrayContainsKey!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!43421 (not res!66403)) b!138774))

(assert (= (and b!138774 res!66404) b!138775))

(declare-fun m!165917 () Bool)

(assert (=> d!43421 m!165917))

(assert (=> b!138775 m!165363))

(declare-fun m!165919 () Bool)

(assert (=> b!138775 m!165919))

(assert (=> b!138580 d!43421))

(declare-fun d!43423 () Bool)

(declare-fun e!90447 () Bool)

(assert (=> d!43423 e!90447))

(declare-fun res!66405 () Bool)

(assert (=> d!43423 (=> res!66405 e!90447)))

(declare-fun lt!72546 () Bool)

(assert (=> d!43423 (= res!66405 (not lt!72546))))

(declare-fun lt!72545 () Bool)

(assert (=> d!43423 (= lt!72546 lt!72545)))

(declare-fun lt!72547 () Unit!4353)

(declare-fun e!90446 () Unit!4353)

(assert (=> d!43423 (= lt!72547 e!90446)))

(declare-fun c!25998 () Bool)

(assert (=> d!43423 (= c!25998 lt!72545)))

(assert (=> d!43423 (= lt!72545 (containsKey!178 (toList!854 lt!72394) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!43423 (= (contains!897 lt!72394 #b0000000000000000000000000000000000000000000000000000000000000000) lt!72546)))

(declare-fun b!138776 () Bool)

(declare-fun lt!72544 () Unit!4353)

(assert (=> b!138776 (= e!90446 lt!72544)))

(assert (=> b!138776 (= lt!72544 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!854 lt!72394) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138776 (isDefined!127 (getValueByKey!175 (toList!854 lt!72394) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138777 () Bool)

(declare-fun Unit!4365 () Unit!4353)

(assert (=> b!138777 (= e!90446 Unit!4365)))

(declare-fun b!138778 () Bool)

(assert (=> b!138778 (= e!90447 (isDefined!127 (getValueByKey!175 (toList!854 lt!72394) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43423 c!25998) b!138776))

(assert (= (and d!43423 (not c!25998)) b!138777))

(assert (= (and d!43423 (not res!66405)) b!138778))

(declare-fun m!165921 () Bool)

(assert (=> d!43423 m!165921))

(declare-fun m!165923 () Bool)

(assert (=> b!138776 m!165923))

(assert (=> b!138776 m!165695))

(assert (=> b!138776 m!165695))

(declare-fun m!165925 () Bool)

(assert (=> b!138776 m!165925))

(assert (=> b!138778 m!165695))

(assert (=> b!138778 m!165695))

(assert (=> b!138778 m!165925))

(assert (=> bm!15248 d!43423))

(declare-fun d!43425 () Bool)

(declare-fun e!90448 () Bool)

(assert (=> d!43425 e!90448))

(declare-fun res!66406 () Bool)

(assert (=> d!43425 (=> (not res!66406) (not e!90448))))

(declare-fun lt!72548 () ListLongMap!1677)

(assert (=> d!43425 (= res!66406 (contains!897 lt!72548 (_1!1314 (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!72551 () List!1709)

(assert (=> d!43425 (= lt!72548 (ListLongMap!1678 lt!72551))))

(declare-fun lt!72549 () Unit!4353)

(declare-fun lt!72550 () Unit!4353)

(assert (=> d!43425 (= lt!72549 lt!72550)))

(assert (=> d!43425 (= (getValueByKey!175 lt!72551 (_1!1314 (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!180 (_2!1314 (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!43425 (= lt!72550 (lemmaContainsTupThenGetReturnValue!90 lt!72551 (_1!1314 (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1314 (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!43425 (= lt!72551 (insertStrictlySorted!93 (toList!854 call!15226) (_1!1314 (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1314 (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!43425 (= (+!171 call!15226 (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!72548)))

(declare-fun b!138779 () Bool)

(declare-fun res!66407 () Bool)

(assert (=> b!138779 (=> (not res!66407) (not e!90448))))

(assert (=> b!138779 (= res!66407 (= (getValueByKey!175 (toList!854 lt!72548) (_1!1314 (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!180 (_2!1314 (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!138780 () Bool)

(assert (=> b!138780 (= e!90448 (contains!899 (toList!854 lt!72548) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!43425 res!66406) b!138779))

(assert (= (and b!138779 res!66407) b!138780))

(declare-fun m!165927 () Bool)

(assert (=> d!43425 m!165927))

(declare-fun m!165929 () Bool)

(assert (=> d!43425 m!165929))

(declare-fun m!165931 () Bool)

(assert (=> d!43425 m!165931))

(declare-fun m!165933 () Bool)

(assert (=> d!43425 m!165933))

(declare-fun m!165935 () Bool)

(assert (=> b!138779 m!165935))

(declare-fun m!165937 () Bool)

(assert (=> b!138780 m!165937))

(assert (=> b!138464 d!43425))

(declare-fun d!43427 () Bool)

(declare-fun res!66412 () Bool)

(declare-fun e!90453 () Bool)

(assert (=> d!43427 (=> res!66412 e!90453)))

(assert (=> d!43427 (= res!66412 (and ((_ is Cons!1705) (toList!854 lt!72226)) (= (_1!1314 (h!2312 (toList!854 lt!72226))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355))))))

(assert (=> d!43427 (= (containsKey!178 (toList!854 lt!72226) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) e!90453)))

(declare-fun b!138785 () Bool)

(declare-fun e!90454 () Bool)

(assert (=> b!138785 (= e!90453 e!90454)))

(declare-fun res!66413 () Bool)

(assert (=> b!138785 (=> (not res!66413) (not e!90454))))

(assert (=> b!138785 (= res!66413 (and (or (not ((_ is Cons!1705) (toList!854 lt!72226))) (bvsle (_1!1314 (h!2312 (toList!854 lt!72226))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355))) ((_ is Cons!1705) (toList!854 lt!72226)) (bvslt (_1!1314 (h!2312 (toList!854 lt!72226))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355))))))

(declare-fun b!138786 () Bool)

(assert (=> b!138786 (= e!90454 (containsKey!178 (t!6245 (toList!854 lt!72226)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (= (and d!43427 (not res!66412)) b!138785))

(assert (= (and b!138785 res!66413) b!138786))

(assert (=> b!138786 m!165363))

(declare-fun m!165939 () Bool)

(assert (=> b!138786 m!165939))

(assert (=> d!43343 d!43427))

(declare-fun b!138796 () Bool)

(declare-fun res!66422 () Bool)

(declare-fun e!90457 () Bool)

(assert (=> b!138796 (=> (not res!66422) (not e!90457))))

(declare-fun size!2565 (LongMapFixedSize!1132) (_ BitVec 32))

(assert (=> b!138796 (= res!66422 (bvsge (size!2565 newMap!16) (_size!615 newMap!16)))))

(declare-fun b!138798 () Bool)

(assert (=> b!138798 (= e!90457 (and (bvsge (extraKeys!2675 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2675 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!615 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!138795 () Bool)

(declare-fun res!66425 () Bool)

(assert (=> b!138795 (=> (not res!66425) (not e!90457))))

(assert (=> b!138795 (= res!66425 (and (= (size!2560 (_values!2901 newMap!16)) (bvadd (mask!7248 newMap!16) #b00000000000000000000000000000001)) (= (size!2559 (_keys!4675 newMap!16)) (size!2560 (_values!2901 newMap!16))) (bvsge (_size!615 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!615 newMap!16) (bvadd (mask!7248 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!138797 () Bool)

(declare-fun res!66424 () Bool)

(assert (=> b!138797 (=> (not res!66424) (not e!90457))))

(assert (=> b!138797 (= res!66424 (= (size!2565 newMap!16) (bvadd (_size!615 newMap!16) (bvsdiv (bvadd (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!43429 () Bool)

(declare-fun res!66423 () Bool)

(assert (=> d!43429 (=> (not res!66423) (not e!90457))))

(assert (=> d!43429 (= res!66423 (validMask!0 (mask!7248 newMap!16)))))

(assert (=> d!43429 (= (simpleValid!94 newMap!16) e!90457)))

(assert (= (and d!43429 res!66423) b!138795))

(assert (= (and b!138795 res!66425) b!138796))

(assert (= (and b!138796 res!66422) b!138797))

(assert (= (and b!138797 res!66424) b!138798))

(declare-fun m!165941 () Bool)

(assert (=> b!138796 m!165941))

(assert (=> b!138797 m!165941))

(assert (=> d!43429 m!165649))

(assert (=> d!43349 d!43429))

(declare-fun b!138799 () Bool)

(declare-fun e!90462 () ListLongMap!1677)

(declare-fun call!15292 () ListLongMap!1677)

(assert (=> b!138799 (= e!90462 call!15292)))

(declare-fun b!138800 () Bool)

(declare-fun e!90465 () Unit!4353)

(declare-fun Unit!4366 () Unit!4353)

(assert (=> b!138800 (= e!90465 Unit!4366)))

(declare-fun b!138801 () Bool)

(declare-fun c!26002 () Bool)

(assert (=> b!138801 (= c!26002 (and (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!90460 () ListLongMap!1677)

(assert (=> b!138801 (= e!90460 e!90462)))

(declare-fun bm!15283 () Bool)

(declare-fun call!15291 () ListLongMap!1677)

(assert (=> bm!15283 (= call!15291 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (ite (or c!25915 c!25914) (_values!2901 newMap!16) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (index!3247 lt!72322) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16)))) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun b!138802 () Bool)

(declare-fun e!90468 () Bool)

(declare-fun e!90467 () Bool)

(assert (=> b!138802 (= e!90468 e!90467)))

(declare-fun res!66432 () Bool)

(assert (=> b!138802 (=> (not res!66432) (not e!90467))))

(declare-fun lt!72557 () ListLongMap!1677)

(assert (=> b!138802 (= res!66432 (contains!897 lt!72557 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!138802 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138803 () Bool)

(declare-fun res!66434 () Bool)

(declare-fun e!90470 () Bool)

(assert (=> b!138803 (=> (not res!66434) (not e!90470))))

(declare-fun e!90464 () Bool)

(assert (=> b!138803 (= res!66434 e!90464)))

(declare-fun c!26000 () Bool)

(assert (=> b!138803 (= c!26000 (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!138804 () Bool)

(declare-fun call!15290 () ListLongMap!1677)

(assert (=> b!138804 (= e!90462 call!15290)))

(declare-fun b!138805 () Bool)

(declare-fun e!90461 () Bool)

(assert (=> b!138805 (= e!90461 (= (apply!118 lt!72557 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2769 newMap!16)))))

(declare-fun c!26003 () Bool)

(declare-fun call!15286 () ListLongMap!1677)

(declare-fun bm!15284 () Bool)

(declare-fun call!15287 () ListLongMap!1677)

(declare-fun c!26001 () Bool)

(assert (=> bm!15284 (= call!15286 (+!171 (ite c!26003 call!15291 (ite c!26001 call!15287 call!15290)) (ite (or c!26003 c!26001) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2769 newMap!16)) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 newMap!16)))))))

(declare-fun b!138806 () Bool)

(declare-fun e!90469 () Bool)

(assert (=> b!138806 (= e!90469 (validKeyInArray!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15285 () Bool)

(assert (=> bm!15285 (= call!15290 call!15287)))

(declare-fun b!138807 () Bool)

(declare-fun res!66433 () Bool)

(assert (=> b!138807 (=> (not res!66433) (not e!90470))))

(assert (=> b!138807 (= res!66433 e!90468)))

(declare-fun res!66430 () Bool)

(assert (=> b!138807 (=> res!66430 e!90468)))

(assert (=> b!138807 (= res!66430 (not e!90469))))

(declare-fun res!66426 () Bool)

(assert (=> b!138807 (=> (not res!66426) (not e!90469))))

(assert (=> b!138807 (= res!66426 (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138808 () Bool)

(declare-fun e!90466 () Bool)

(assert (=> b!138808 (= e!90470 e!90466)))

(declare-fun c!25999 () Bool)

(assert (=> b!138808 (= c!25999 (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!43431 () Bool)

(assert (=> d!43431 e!90470))

(declare-fun res!66431 () Bool)

(assert (=> d!43431 (=> (not res!66431) (not e!90470))))

(assert (=> d!43431 (= res!66431 (or (bvsge #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))))

(declare-fun lt!72560 () ListLongMap!1677)

(assert (=> d!43431 (= lt!72557 lt!72560)))

(declare-fun lt!72553 () Unit!4353)

(assert (=> d!43431 (= lt!72553 e!90465)))

(declare-fun c!26004 () Bool)

(declare-fun e!90463 () Bool)

(assert (=> d!43431 (= c!26004 e!90463)))

(declare-fun res!66429 () Bool)

(assert (=> d!43431 (=> (not res!66429) (not e!90463))))

(assert (=> d!43431 (= res!66429 (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun e!90459 () ListLongMap!1677)

(assert (=> d!43431 (= lt!72560 e!90459)))

(assert (=> d!43431 (= c!26003 (and (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43431 (validMask!0 (mask!7248 newMap!16))))

(assert (=> d!43431 (= (getCurrentListMap!527 (_keys!4675 newMap!16) (ite (or c!25915 c!25914) (_values!2901 newMap!16) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (index!3247 lt!72322) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16)))) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) lt!72557)))

(declare-fun b!138809 () Bool)

(declare-fun lt!72555 () Unit!4353)

(assert (=> b!138809 (= e!90465 lt!72555)))

(declare-fun lt!72564 () ListLongMap!1677)

(assert (=> b!138809 (= lt!72564 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (ite (or c!25915 c!25914) (_values!2901 newMap!16) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (index!3247 lt!72322) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16)))) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72569 () (_ BitVec 64))

(assert (=> b!138809 (= lt!72569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72554 () (_ BitVec 64))

(assert (=> b!138809 (= lt!72554 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72563 () Unit!4353)

(assert (=> b!138809 (= lt!72563 (addStillContains!94 lt!72564 lt!72569 (zeroValue!2769 newMap!16) lt!72554))))

(assert (=> b!138809 (contains!897 (+!171 lt!72564 (tuple2!2607 lt!72569 (zeroValue!2769 newMap!16))) lt!72554)))

(declare-fun lt!72562 () Unit!4353)

(assert (=> b!138809 (= lt!72562 lt!72563)))

(declare-fun lt!72559 () ListLongMap!1677)

(assert (=> b!138809 (= lt!72559 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (ite (or c!25915 c!25914) (_values!2901 newMap!16) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (index!3247 lt!72322) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16)))) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72572 () (_ BitVec 64))

(assert (=> b!138809 (= lt!72572 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72565 () (_ BitVec 64))

(assert (=> b!138809 (= lt!72565 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72570 () Unit!4353)

(assert (=> b!138809 (= lt!72570 (addApplyDifferent!94 lt!72559 lt!72572 (minValue!2769 newMap!16) lt!72565))))

(assert (=> b!138809 (= (apply!118 (+!171 lt!72559 (tuple2!2607 lt!72572 (minValue!2769 newMap!16))) lt!72565) (apply!118 lt!72559 lt!72565))))

(declare-fun lt!72558 () Unit!4353)

(assert (=> b!138809 (= lt!72558 lt!72570)))

(declare-fun lt!72552 () ListLongMap!1677)

(assert (=> b!138809 (= lt!72552 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (ite (or c!25915 c!25914) (_values!2901 newMap!16) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (index!3247 lt!72322) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16)))) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72566 () (_ BitVec 64))

(assert (=> b!138809 (= lt!72566 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72568 () (_ BitVec 64))

(assert (=> b!138809 (= lt!72568 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72561 () Unit!4353)

(assert (=> b!138809 (= lt!72561 (addApplyDifferent!94 lt!72552 lt!72566 (zeroValue!2769 newMap!16) lt!72568))))

(assert (=> b!138809 (= (apply!118 (+!171 lt!72552 (tuple2!2607 lt!72566 (zeroValue!2769 newMap!16))) lt!72568) (apply!118 lt!72552 lt!72568))))

(declare-fun lt!72567 () Unit!4353)

(assert (=> b!138809 (= lt!72567 lt!72561)))

(declare-fun lt!72573 () ListLongMap!1677)

(assert (=> b!138809 (= lt!72573 (getCurrentListMapNoExtraKeys!138 (_keys!4675 newMap!16) (ite (or c!25915 c!25914) (_values!2901 newMap!16) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (index!3247 lt!72322) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16)))) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72556 () (_ BitVec 64))

(assert (=> b!138809 (= lt!72556 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72571 () (_ BitVec 64))

(assert (=> b!138809 (= lt!72571 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138809 (= lt!72555 (addApplyDifferent!94 lt!72573 lt!72556 (minValue!2769 newMap!16) lt!72571))))

(assert (=> b!138809 (= (apply!118 (+!171 lt!72573 (tuple2!2607 lt!72556 (minValue!2769 newMap!16))) lt!72571) (apply!118 lt!72573 lt!72571))))

(declare-fun b!138810 () Bool)

(declare-fun e!90458 () Bool)

(assert (=> b!138810 (= e!90458 (= (apply!118 lt!72557 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2769 newMap!16)))))

(declare-fun b!138811 () Bool)

(assert (=> b!138811 (= e!90466 e!90461)))

(declare-fun res!66427 () Bool)

(declare-fun call!15288 () Bool)

(assert (=> b!138811 (= res!66427 call!15288)))

(assert (=> b!138811 (=> (not res!66427) (not e!90461))))

(declare-fun b!138812 () Bool)

(assert (=> b!138812 (= e!90459 e!90460)))

(assert (=> b!138812 (= c!26001 (and (not (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2675 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15286 () Bool)

(declare-fun call!15289 () Bool)

(assert (=> bm!15286 (= call!15289 (contains!897 lt!72557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138813 () Bool)

(assert (=> b!138813 (= e!90467 (= (apply!118 lt!72557 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)) (get!1516 (select (arr!2289 (ite (or c!25915 c!25914) (_values!2901 newMap!16) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (index!3247 lt!72322) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!435 (defaultEntry!2918 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2560 (ite (or c!25915 c!25914) (_values!2901 newMap!16) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (index!3247 lt!72322) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16)))))))))

(assert (=> b!138813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138814 () Bool)

(assert (=> b!138814 (= e!90464 e!90458)))

(declare-fun res!66428 () Bool)

(assert (=> b!138814 (= res!66428 call!15289)))

(assert (=> b!138814 (=> (not res!66428) (not e!90458))))

(declare-fun bm!15287 () Bool)

(assert (=> bm!15287 (= call!15287 call!15291)))

(declare-fun bm!15288 () Bool)

(assert (=> bm!15288 (= call!15288 (contains!897 lt!72557 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138815 () Bool)

(assert (=> b!138815 (= e!90466 (not call!15288))))

(declare-fun bm!15289 () Bool)

(assert (=> bm!15289 (= call!15292 call!15286)))

(declare-fun b!138816 () Bool)

(assert (=> b!138816 (= e!90463 (validKeyInArray!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138817 () Bool)

(assert (=> b!138817 (= e!90464 (not call!15289))))

(declare-fun b!138818 () Bool)

(assert (=> b!138818 (= e!90459 (+!171 call!15286 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 newMap!16))))))

(declare-fun b!138819 () Bool)

(assert (=> b!138819 (= e!90460 call!15292)))

(assert (= (and d!43431 c!26003) b!138818))

(assert (= (and d!43431 (not c!26003)) b!138812))

(assert (= (and b!138812 c!26001) b!138819))

(assert (= (and b!138812 (not c!26001)) b!138801))

(assert (= (and b!138801 c!26002) b!138799))

(assert (= (and b!138801 (not c!26002)) b!138804))

(assert (= (or b!138799 b!138804) bm!15285))

(assert (= (or b!138819 bm!15285) bm!15287))

(assert (= (or b!138819 b!138799) bm!15289))

(assert (= (or b!138818 bm!15287) bm!15283))

(assert (= (or b!138818 bm!15289) bm!15284))

(assert (= (and d!43431 res!66429) b!138816))

(assert (= (and d!43431 c!26004) b!138809))

(assert (= (and d!43431 (not c!26004)) b!138800))

(assert (= (and d!43431 res!66431) b!138807))

(assert (= (and b!138807 res!66426) b!138806))

(assert (= (and b!138807 (not res!66430)) b!138802))

(assert (= (and b!138802 res!66432) b!138813))

(assert (= (and b!138807 res!66433) b!138803))

(assert (= (and b!138803 c!26000) b!138814))

(assert (= (and b!138803 (not c!26000)) b!138817))

(assert (= (and b!138814 res!66428) b!138810))

(assert (= (or b!138814 b!138817) bm!15286))

(assert (= (and b!138803 res!66434) b!138808))

(assert (= (and b!138808 c!25999) b!138811))

(assert (= (and b!138808 (not c!25999)) b!138815))

(assert (= (and b!138811 res!66427) b!138805))

(assert (= (or b!138811 b!138815) bm!15288))

(declare-fun b_lambda!6223 () Bool)

(assert (=> (not b_lambda!6223) (not b!138813)))

(assert (=> b!138813 t!6256))

(declare-fun b_and!8653 () Bool)

(assert (= b_and!8649 (and (=> t!6256 result!4125) b_and!8653)))

(assert (=> b!138813 t!6258))

(declare-fun b_and!8655 () Bool)

(assert (= b_and!8651 (and (=> t!6258 result!4127) b_and!8655)))

(declare-fun m!165943 () Bool)

(assert (=> b!138810 m!165943))

(assert (=> b!138806 m!165679))

(assert (=> b!138806 m!165679))

(assert (=> b!138806 m!165681))

(declare-fun m!165945 () Bool)

(assert (=> bm!15286 m!165945))

(declare-fun m!165947 () Bool)

(assert (=> b!138809 m!165947))

(assert (=> b!138809 m!165679))

(declare-fun m!165949 () Bool)

(assert (=> b!138809 m!165949))

(declare-fun m!165951 () Bool)

(assert (=> b!138809 m!165951))

(declare-fun m!165953 () Bool)

(assert (=> b!138809 m!165953))

(declare-fun m!165955 () Bool)

(assert (=> b!138809 m!165955))

(declare-fun m!165957 () Bool)

(assert (=> b!138809 m!165957))

(declare-fun m!165959 () Bool)

(assert (=> b!138809 m!165959))

(declare-fun m!165961 () Bool)

(assert (=> b!138809 m!165961))

(assert (=> b!138809 m!165955))

(declare-fun m!165963 () Bool)

(assert (=> b!138809 m!165963))

(assert (=> b!138809 m!165949))

(declare-fun m!165965 () Bool)

(assert (=> b!138809 m!165965))

(declare-fun m!165967 () Bool)

(assert (=> b!138809 m!165967))

(declare-fun m!165969 () Bool)

(assert (=> b!138809 m!165969))

(declare-fun m!165971 () Bool)

(assert (=> b!138809 m!165971))

(assert (=> b!138809 m!165963))

(declare-fun m!165973 () Bool)

(assert (=> b!138809 m!165973))

(declare-fun m!165975 () Bool)

(assert (=> b!138809 m!165975))

(assert (=> b!138809 m!165971))

(declare-fun m!165977 () Bool)

(assert (=> b!138809 m!165977))

(assert (=> b!138813 m!165679))

(assert (=> b!138813 m!165747))

(declare-fun m!165979 () Bool)

(assert (=> b!138813 m!165979))

(assert (=> b!138813 m!165679))

(declare-fun m!165981 () Bool)

(assert (=> b!138813 m!165981))

(assert (=> b!138813 m!165979))

(assert (=> b!138813 m!165747))

(declare-fun m!165983 () Bool)

(assert (=> b!138813 m!165983))

(assert (=> b!138802 m!165679))

(assert (=> b!138802 m!165679))

(declare-fun m!165985 () Bool)

(assert (=> b!138802 m!165985))

(assert (=> bm!15283 m!165975))

(assert (=> b!138816 m!165679))

(assert (=> b!138816 m!165679))

(assert (=> b!138816 m!165681))

(assert (=> d!43431 m!165649))

(declare-fun m!165987 () Bool)

(assert (=> b!138805 m!165987))

(declare-fun m!165989 () Bool)

(assert (=> bm!15288 m!165989))

(declare-fun m!165991 () Bool)

(assert (=> b!138818 m!165991))

(declare-fun m!165993 () Bool)

(assert (=> bm!15284 m!165993))

(assert (=> bm!15216 d!43431))

(declare-fun d!43433 () Bool)

(assert (=> d!43433 (= (+!171 (getCurrentListMap!527 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!527 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) lt!72326 (zeroValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72576 () Unit!4353)

(declare-fun choose!857 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 V!3529 Int) Unit!4353)

(assert (=> d!43433 (= lt!72576 (choose!857 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) lt!72326 (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43433 (validMask!0 (mask!7248 newMap!16))))

(assert (=> d!43433 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!63 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) lt!72326 (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)) lt!72576)))

(declare-fun bs!5822 () Bool)

(assert (= bs!5822 d!43433))

(assert (=> bs!5822 m!165649))

(assert (=> bs!5822 m!165395))

(declare-fun m!165995 () Bool)

(assert (=> bs!5822 m!165995))

(assert (=> bs!5822 m!165561))

(declare-fun m!165997 () Bool)

(assert (=> bs!5822 m!165997))

(assert (=> bs!5822 m!165561))

(assert (=> bs!5822 m!165395))

(declare-fun m!165999 () Bool)

(assert (=> bs!5822 m!165999))

(assert (=> b!138478 d!43433))

(declare-fun d!43435 () Bool)

(declare-fun e!90473 () Bool)

(assert (=> d!43435 e!90473))

(declare-fun c!26007 () Bool)

(assert (=> d!43435 (= c!26007 (and (not (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!43435 true))

(declare-fun _$29!162 () Unit!4353)

(assert (=> d!43435 (= (choose!851 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))) _$29!162)))

(declare-fun b!138824 () Bool)

(assert (=> b!138824 (= e!90473 (arrayContainsKey!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!138825 () Bool)

(assert (=> b!138825 (= e!90473 (ite (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!43435 c!26007) b!138824))

(assert (= (and d!43435 (not c!26007)) b!138825))

(assert (=> b!138824 m!165363))

(assert (=> b!138824 m!165373))

(assert (=> d!43365 d!43435))

(assert (=> d!43365 d!43375))

(declare-fun b!138826 () Bool)

(declare-fun e!90474 () Bool)

(declare-fun e!90476 () Bool)

(assert (=> b!138826 (= e!90474 e!90476)))

(declare-fun c!26008 () Bool)

(assert (=> b!138826 (= c!26008 (validKeyInArray!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!138827 () Bool)

(declare-fun call!15293 () Bool)

(assert (=> b!138827 (= e!90476 call!15293)))

(declare-fun b!138828 () Bool)

(declare-fun e!90477 () Bool)

(assert (=> b!138828 (= e!90477 (contains!898 (ite c!25926 (Cons!1706 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000) Nil!1707) Nil!1707) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!138829 () Bool)

(assert (=> b!138829 (= e!90476 call!15293)))

(declare-fun b!138830 () Bool)

(declare-fun e!90475 () Bool)

(assert (=> b!138830 (= e!90475 e!90474)))

(declare-fun res!66435 () Bool)

(assert (=> b!138830 (=> (not res!66435) (not e!90474))))

(assert (=> b!138830 (= res!66435 (not e!90477))))

(declare-fun res!66436 () Bool)

(assert (=> b!138830 (=> (not res!66436) (not e!90477))))

(assert (=> b!138830 (= res!66436 (validKeyInArray!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!43437 () Bool)

(declare-fun res!66437 () Bool)

(assert (=> d!43437 (=> res!66437 e!90475)))

(assert (=> d!43437 (= res!66437 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(assert (=> d!43437 (= (arrayNoDuplicates!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!25926 (Cons!1706 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000) Nil!1707) Nil!1707)) e!90475)))

(declare-fun bm!15290 () Bool)

(assert (=> bm!15290 (= call!15293 (arrayNoDuplicates!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!26008 (Cons!1706 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!25926 (Cons!1706 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000) Nil!1707) Nil!1707)) (ite c!25926 (Cons!1706 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) #b00000000000000000000000000000000) Nil!1707) Nil!1707))))))

(assert (= (and d!43437 (not res!66437)) b!138830))

(assert (= (and b!138830 res!66436) b!138828))

(assert (= (and b!138830 res!66435) b!138826))

(assert (= (and b!138826 c!26008) b!138829))

(assert (= (and b!138826 (not c!26008)) b!138827))

(assert (= (or b!138829 b!138827) bm!15290))

(declare-fun m!166001 () Bool)

(assert (=> b!138826 m!166001))

(assert (=> b!138826 m!166001))

(declare-fun m!166003 () Bool)

(assert (=> b!138826 m!166003))

(assert (=> b!138828 m!166001))

(assert (=> b!138828 m!166001))

(declare-fun m!166005 () Bool)

(assert (=> b!138828 m!166005))

(assert (=> b!138830 m!166001))

(assert (=> b!138830 m!166001))

(assert (=> b!138830 m!166003))

(assert (=> bm!15290 m!166001))

(declare-fun m!166007 () Bool)

(assert (=> bm!15290 m!166007))

(assert (=> bm!15230 d!43437))

(declare-fun d!43439 () Bool)

(declare-fun e!90479 () Bool)

(assert (=> d!43439 e!90479))

(declare-fun res!66438 () Bool)

(assert (=> d!43439 (=> res!66438 e!90479)))

(declare-fun lt!72579 () Bool)

(assert (=> d!43439 (= res!66438 (not lt!72579))))

(declare-fun lt!72578 () Bool)

(assert (=> d!43439 (= lt!72579 lt!72578)))

(declare-fun lt!72580 () Unit!4353)

(declare-fun e!90478 () Unit!4353)

(assert (=> d!43439 (= lt!72580 e!90478)))

(declare-fun c!26009 () Bool)

(assert (=> d!43439 (= c!26009 lt!72578)))

(assert (=> d!43439 (= lt!72578 (containsKey!178 (toList!854 lt!72394) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!43439 (= (contains!897 lt!72394 #b1000000000000000000000000000000000000000000000000000000000000000) lt!72579)))

(declare-fun b!138831 () Bool)

(declare-fun lt!72577 () Unit!4353)

(assert (=> b!138831 (= e!90478 lt!72577)))

(assert (=> b!138831 (= lt!72577 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!854 lt!72394) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138831 (isDefined!127 (getValueByKey!175 (toList!854 lt!72394) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138832 () Bool)

(declare-fun Unit!4367 () Unit!4353)

(assert (=> b!138832 (= e!90478 Unit!4367)))

(declare-fun b!138833 () Bool)

(assert (=> b!138833 (= e!90479 (isDefined!127 (getValueByKey!175 (toList!854 lt!72394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43439 c!26009) b!138831))

(assert (= (and d!43439 (not c!26009)) b!138832))

(assert (= (and d!43439 (not res!66438)) b!138833))

(declare-fun m!166009 () Bool)

(assert (=> d!43439 m!166009))

(declare-fun m!166011 () Bool)

(assert (=> b!138831 m!166011))

(declare-fun m!166013 () Bool)

(assert (=> b!138831 m!166013))

(assert (=> b!138831 m!166013))

(declare-fun m!166015 () Bool)

(assert (=> b!138831 m!166015))

(assert (=> b!138833 m!166013))

(assert (=> b!138833 m!166013))

(assert (=> b!138833 m!166015))

(assert (=> bm!15250 d!43439))

(declare-fun d!43441 () Bool)

(assert (=> d!43441 (= (inRange!0 (ite c!25914 (ite c!25919 (index!3247 lt!72328) (ite c!25913 (index!3246 lt!72337) (index!3249 lt!72337))) (ite c!25911 (index!3247 lt!72334) (ite c!25909 (index!3246 lt!72319) (index!3249 lt!72319)))) (mask!7248 newMap!16)) (and (bvsge (ite c!25914 (ite c!25919 (index!3247 lt!72328) (ite c!25913 (index!3246 lt!72337) (index!3249 lt!72337))) (ite c!25911 (index!3247 lt!72334) (ite c!25909 (index!3246 lt!72319) (index!3249 lt!72319)))) #b00000000000000000000000000000000) (bvslt (ite c!25914 (ite c!25919 (index!3247 lt!72328) (ite c!25913 (index!3246 lt!72337) (index!3249 lt!72337))) (ite c!25911 (index!3247 lt!72334) (ite c!25909 (index!3246 lt!72319) (index!3249 lt!72319)))) (bvadd (mask!7248 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!15210 d!43441))

(declare-fun b!138843 () Bool)

(declare-fun e!90488 () Bool)

(declare-fun e!90486 () Bool)

(assert (=> b!138843 (= e!90488 e!90486)))

(declare-fun c!26012 () Bool)

(assert (=> b!138843 (= c!26012 (validKeyInArray!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138844 () Bool)

(declare-fun e!90487 () Bool)

(assert (=> b!138844 (= e!90486 e!90487)))

(declare-fun lt!72589 () (_ BitVec 64))

(assert (=> b!138844 (= lt!72589 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72588 () Unit!4353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4839 (_ BitVec 64) (_ BitVec 32)) Unit!4353)

(assert (=> b!138844 (= lt!72588 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4675 newMap!16) lt!72589 #b00000000000000000000000000000000))))

(assert (=> b!138844 (arrayContainsKey!0 (_keys!4675 newMap!16) lt!72589 #b00000000000000000000000000000000)))

(declare-fun lt!72587 () Unit!4353)

(assert (=> b!138844 (= lt!72587 lt!72588)))

(declare-fun res!66444 () Bool)

(assert (=> b!138844 (= res!66444 (= (seekEntryOrOpen!0 (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000) (_keys!4675 newMap!16) (mask!7248 newMap!16)) (Found!271 #b00000000000000000000000000000000)))))

(assert (=> b!138844 (=> (not res!66444) (not e!90487))))

(declare-fun bm!15293 () Bool)

(declare-fun call!15296 () Bool)

(assert (=> bm!15293 (= call!15296 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4675 newMap!16) (mask!7248 newMap!16)))))

(declare-fun b!138845 () Bool)

(assert (=> b!138845 (= e!90487 call!15296)))

(declare-fun d!43443 () Bool)

(declare-fun res!66443 () Bool)

(assert (=> d!43443 (=> res!66443 e!90488)))

(assert (=> d!43443 (= res!66443 (bvsge #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))))))

(assert (=> d!43443 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4675 newMap!16) (mask!7248 newMap!16)) e!90488)))

(declare-fun b!138842 () Bool)

(assert (=> b!138842 (= e!90486 call!15296)))

(assert (= (and d!43443 (not res!66443)) b!138843))

(assert (= (and b!138843 c!26012) b!138844))

(assert (= (and b!138843 (not c!26012)) b!138842))

(assert (= (and b!138844 res!66444) b!138845))

(assert (= (or b!138845 b!138842) bm!15293))

(assert (=> b!138843 m!165679))

(assert (=> b!138843 m!165679))

(assert (=> b!138843 m!165681))

(assert (=> b!138844 m!165679))

(declare-fun m!166017 () Bool)

(assert (=> b!138844 m!166017))

(declare-fun m!166019 () Bool)

(assert (=> b!138844 m!166019))

(assert (=> b!138844 m!165679))

(declare-fun m!166021 () Bool)

(assert (=> b!138844 m!166021))

(declare-fun m!166023 () Bool)

(assert (=> bm!15293 m!166023))

(assert (=> b!138495 d!43443))

(assert (=> b!138467 d!43381))

(declare-fun d!43445 () Bool)

(declare-fun e!90489 () Bool)

(assert (=> d!43445 e!90489))

(declare-fun res!66445 () Bool)

(assert (=> d!43445 (=> (not res!66445) (not e!90489))))

(declare-fun lt!72590 () ListLongMap!1677)

(assert (=> d!43445 (= res!66445 (contains!897 lt!72590 (_1!1314 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(declare-fun lt!72593 () List!1709)

(assert (=> d!43445 (= lt!72590 (ListLongMap!1678 lt!72593))))

(declare-fun lt!72591 () Unit!4353)

(declare-fun lt!72592 () Unit!4353)

(assert (=> d!43445 (= lt!72591 lt!72592)))

(assert (=> d!43445 (= (getValueByKey!175 lt!72593 (_1!1314 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))) (Some!180 (_2!1314 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43445 (= lt!72592 (lemmaContainsTupThenGetReturnValue!90 lt!72593 (_1!1314 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) (_2!1314 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43445 (= lt!72593 (insertStrictlySorted!93 (toList!854 lt!72410) (_1!1314 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) (_2!1314 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43445 (= (+!171 lt!72410 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72590)))

(declare-fun b!138846 () Bool)

(declare-fun res!66446 () Bool)

(assert (=> b!138846 (=> (not res!66446) (not e!90489))))

(assert (=> b!138846 (= res!66446 (= (getValueByKey!175 (toList!854 lt!72590) (_1!1314 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))) (Some!180 (_2!1314 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))))))

(declare-fun b!138847 () Bool)

(assert (=> b!138847 (= e!90489 (contains!899 (toList!854 lt!72590) (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))))

(assert (= (and d!43445 res!66445) b!138846))

(assert (= (and b!138846 res!66446) b!138847))

(declare-fun m!166025 () Bool)

(assert (=> d!43445 m!166025))

(declare-fun m!166027 () Bool)

(assert (=> d!43445 m!166027))

(declare-fun m!166029 () Bool)

(assert (=> d!43445 m!166029))

(declare-fun m!166031 () Bool)

(assert (=> d!43445 m!166031))

(declare-fun m!166033 () Bool)

(assert (=> b!138846 m!166033))

(declare-fun m!166035 () Bool)

(assert (=> b!138847 m!166035))

(assert (=> b!138564 d!43445))

(declare-fun d!43447 () Bool)

(declare-fun e!90490 () Bool)

(assert (=> d!43447 e!90490))

(declare-fun res!66447 () Bool)

(assert (=> d!43447 (=> (not res!66447) (not e!90490))))

(declare-fun lt!72594 () ListLongMap!1677)

(assert (=> d!43447 (= res!66447 (contains!897 lt!72594 (_1!1314 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(declare-fun lt!72597 () List!1709)

(assert (=> d!43447 (= lt!72594 (ListLongMap!1678 lt!72597))))

(declare-fun lt!72595 () Unit!4353)

(declare-fun lt!72596 () Unit!4353)

(assert (=> d!43447 (= lt!72595 lt!72596)))

(assert (=> d!43447 (= (getValueByKey!175 lt!72597 (_1!1314 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))) (Some!180 (_2!1314 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43447 (= lt!72596 (lemmaContainsTupThenGetReturnValue!90 lt!72597 (_1!1314 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))) (_2!1314 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43447 (= lt!72597 (insertStrictlySorted!93 (toList!854 lt!72401) (_1!1314 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))) (_2!1314 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43447 (= (+!171 lt!72401 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72594)))

(declare-fun b!138848 () Bool)

(declare-fun res!66448 () Bool)

(assert (=> b!138848 (=> (not res!66448) (not e!90490))))

(assert (=> b!138848 (= res!66448 (= (getValueByKey!175 (toList!854 lt!72594) (_1!1314 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))) (Some!180 (_2!1314 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))))))))

(declare-fun b!138849 () Bool)

(assert (=> b!138849 (= e!90490 (contains!899 (toList!854 lt!72594) (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))))))

(assert (= (and d!43447 res!66447) b!138848))

(assert (= (and b!138848 res!66448) b!138849))

(declare-fun m!166037 () Bool)

(assert (=> d!43447 m!166037))

(declare-fun m!166039 () Bool)

(assert (=> d!43447 m!166039))

(declare-fun m!166041 () Bool)

(assert (=> d!43447 m!166041))

(declare-fun m!166043 () Bool)

(assert (=> d!43447 m!166043))

(declare-fun m!166045 () Bool)

(assert (=> b!138848 m!166045))

(declare-fun m!166047 () Bool)

(assert (=> b!138849 m!166047))

(assert (=> b!138564 d!43447))

(declare-fun d!43449 () Bool)

(assert (=> d!43449 (= (apply!118 (+!171 lt!72410 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72408) (get!1519 (getValueByKey!175 (toList!854 (+!171 lt!72410 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))) lt!72408)))))

(declare-fun bs!5823 () Bool)

(assert (= bs!5823 d!43449))

(declare-fun m!166049 () Bool)

(assert (=> bs!5823 m!166049))

(assert (=> bs!5823 m!166049))

(declare-fun m!166051 () Bool)

(assert (=> bs!5823 m!166051))

(assert (=> b!138564 d!43449))

(declare-fun d!43451 () Bool)

(assert (=> d!43451 (= (apply!118 lt!72410 lt!72408) (get!1519 (getValueByKey!175 (toList!854 lt!72410) lt!72408)))))

(declare-fun bs!5824 () Bool)

(assert (= bs!5824 d!43451))

(declare-fun m!166053 () Bool)

(assert (=> bs!5824 m!166053))

(assert (=> bs!5824 m!166053))

(declare-fun m!166055 () Bool)

(assert (=> bs!5824 m!166055))

(assert (=> b!138564 d!43451))

(declare-fun d!43453 () Bool)

(assert (=> d!43453 (= (apply!118 (+!171 lt!72389 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72405) (apply!118 lt!72389 lt!72405))))

(declare-fun lt!72600 () Unit!4353)

(declare-fun choose!858 (ListLongMap!1677 (_ BitVec 64) V!3529 (_ BitVec 64)) Unit!4353)

(assert (=> d!43453 (= lt!72600 (choose!858 lt!72389 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) lt!72405))))

(declare-fun e!90493 () Bool)

(assert (=> d!43453 e!90493))

(declare-fun res!66451 () Bool)

(assert (=> d!43453 (=> (not res!66451) (not e!90493))))

(assert (=> d!43453 (= res!66451 (contains!897 lt!72389 lt!72405))))

(assert (=> d!43453 (= (addApplyDifferent!94 lt!72389 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) lt!72405) lt!72600)))

(declare-fun b!138853 () Bool)

(assert (=> b!138853 (= e!90493 (not (= lt!72405 lt!72403)))))

(assert (= (and d!43453 res!66451) b!138853))

(assert (=> d!43453 m!165595))

(assert (=> d!43453 m!165601))

(assert (=> d!43453 m!165595))

(declare-fun m!166057 () Bool)

(assert (=> d!43453 m!166057))

(declare-fun m!166059 () Bool)

(assert (=> d!43453 m!166059))

(assert (=> d!43453 m!165591))

(assert (=> b!138564 d!43453))

(declare-fun d!43455 () Bool)

(assert (=> d!43455 (contains!897 (+!171 lt!72401 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72391)))

(declare-fun lt!72603 () Unit!4353)

(declare-fun choose!859 (ListLongMap!1677 (_ BitVec 64) V!3529 (_ BitVec 64)) Unit!4353)

(assert (=> d!43455 (= lt!72603 (choose!859 lt!72401 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) lt!72391))))

(assert (=> d!43455 (contains!897 lt!72401 lt!72391)))

(assert (=> d!43455 (= (addStillContains!94 lt!72401 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) lt!72391) lt!72603)))

(declare-fun bs!5825 () Bool)

(assert (= bs!5825 d!43455))

(assert (=> bs!5825 m!165573))

(assert (=> bs!5825 m!165573))

(assert (=> bs!5825 m!165575))

(declare-fun m!166061 () Bool)

(assert (=> bs!5825 m!166061))

(declare-fun m!166063 () Bool)

(assert (=> bs!5825 m!166063))

(assert (=> b!138564 d!43455))

(declare-fun d!43457 () Bool)

(assert (=> d!43457 (= (apply!118 (+!171 lt!72396 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72402) (apply!118 lt!72396 lt!72402))))

(declare-fun lt!72604 () Unit!4353)

(assert (=> d!43457 (= lt!72604 (choose!858 lt!72396 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992))) lt!72402))))

(declare-fun e!90494 () Bool)

(assert (=> d!43457 e!90494))

(declare-fun res!66452 () Bool)

(assert (=> d!43457 (=> (not res!66452) (not e!90494))))

(assert (=> d!43457 (= res!66452 (contains!897 lt!72396 lt!72402))))

(assert (=> d!43457 (= (addApplyDifferent!94 lt!72396 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992))) lt!72402) lt!72604)))

(declare-fun b!138855 () Bool)

(assert (=> b!138855 (= e!90494 (not (= lt!72402 lt!72409)))))

(assert (= (and d!43457 res!66452) b!138855))

(assert (=> d!43457 m!165579))

(assert (=> d!43457 m!165581))

(assert (=> d!43457 m!165579))

(declare-fun m!166065 () Bool)

(assert (=> d!43457 m!166065))

(declare-fun m!166067 () Bool)

(assert (=> d!43457 m!166067))

(assert (=> d!43457 m!165593))

(assert (=> b!138564 d!43457))

(declare-fun d!43459 () Bool)

(assert (=> d!43459 (= (apply!118 (+!171 lt!72410 (tuple2!2607 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72408) (apply!118 lt!72410 lt!72408))))

(declare-fun lt!72605 () Unit!4353)

(assert (=> d!43459 (= lt!72605 (choose!858 lt!72410 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992))) lt!72408))))

(declare-fun e!90495 () Bool)

(assert (=> d!43459 e!90495))

(declare-fun res!66453 () Bool)

(assert (=> d!43459 (=> (not res!66453) (not e!90495))))

(assert (=> d!43459 (= res!66453 (contains!897 lt!72410 lt!72408))))

(assert (=> d!43459 (= (addApplyDifferent!94 lt!72410 lt!72393 (minValue!2769 (v!3254 (underlying!471 thiss!992))) lt!72408) lt!72605)))

(declare-fun b!138856 () Bool)

(assert (=> b!138856 (= e!90495 (not (= lt!72408 lt!72393)))))

(assert (= (and d!43459 res!66453) b!138856))

(assert (=> d!43459 m!165587))

(assert (=> d!43459 m!165597))

(assert (=> d!43459 m!165587))

(declare-fun m!166069 () Bool)

(assert (=> d!43459 m!166069))

(declare-fun m!166071 () Bool)

(assert (=> d!43459 m!166071))

(assert (=> d!43459 m!165571))

(assert (=> b!138564 d!43459))

(declare-fun d!43461 () Bool)

(declare-fun e!90496 () Bool)

(assert (=> d!43461 e!90496))

(declare-fun res!66454 () Bool)

(assert (=> d!43461 (=> (not res!66454) (not e!90496))))

(declare-fun lt!72606 () ListLongMap!1677)

(assert (=> d!43461 (= res!66454 (contains!897 lt!72606 (_1!1314 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(declare-fun lt!72609 () List!1709)

(assert (=> d!43461 (= lt!72606 (ListLongMap!1678 lt!72609))))

(declare-fun lt!72607 () Unit!4353)

(declare-fun lt!72608 () Unit!4353)

(assert (=> d!43461 (= lt!72607 lt!72608)))

(assert (=> d!43461 (= (getValueByKey!175 lt!72609 (_1!1314 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))) (Some!180 (_2!1314 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43461 (= lt!72608 (lemmaContainsTupThenGetReturnValue!90 lt!72609 (_1!1314 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))) (_2!1314 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43461 (= lt!72609 (insertStrictlySorted!93 (toList!854 lt!72389) (_1!1314 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))) (_2!1314 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43461 (= (+!171 lt!72389 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72606)))

(declare-fun b!138857 () Bool)

(declare-fun res!66455 () Bool)

(assert (=> b!138857 (=> (not res!66455) (not e!90496))))

(assert (=> b!138857 (= res!66455 (= (getValueByKey!175 (toList!854 lt!72606) (_1!1314 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))) (Some!180 (_2!1314 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))))))))

(declare-fun b!138858 () Bool)

(assert (=> b!138858 (= e!90496 (contains!899 (toList!854 lt!72606) (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))))))

(assert (= (and d!43461 res!66454) b!138857))

(assert (= (and b!138857 res!66455) b!138858))

(declare-fun m!166073 () Bool)

(assert (=> d!43461 m!166073))

(declare-fun m!166075 () Bool)

(assert (=> d!43461 m!166075))

(declare-fun m!166077 () Bool)

(assert (=> d!43461 m!166077))

(declare-fun m!166079 () Bool)

(assert (=> d!43461 m!166079))

(declare-fun m!166081 () Bool)

(assert (=> b!138857 m!166081))

(declare-fun m!166083 () Bool)

(assert (=> b!138858 m!166083))

(assert (=> b!138564 d!43461))

(declare-fun d!43463 () Bool)

(declare-fun e!90515 () Bool)

(assert (=> d!43463 e!90515))

(declare-fun res!66464 () Bool)

(assert (=> d!43463 (=> (not res!66464) (not e!90515))))

(declare-fun lt!72628 () ListLongMap!1677)

(assert (=> d!43463 (= res!66464 (not (contains!897 lt!72628 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!90517 () ListLongMap!1677)

(assert (=> d!43463 (= lt!72628 e!90517)))

(declare-fun c!26022 () Bool)

(assert (=> d!43463 (= c!26022 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(assert (=> d!43463 (validMask!0 (mask!7248 (v!3254 (underlying!471 thiss!992))))))

(assert (=> d!43463 (= (getCurrentListMapNoExtraKeys!138 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))) lt!72628)))

(declare-fun b!138883 () Bool)

(declare-fun e!90512 () Bool)

(declare-fun e!90513 () Bool)

(assert (=> b!138883 (= e!90512 e!90513)))

(assert (=> b!138883 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(declare-fun res!66466 () Bool)

(assert (=> b!138883 (= res!66466 (contains!897 lt!72628 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!138883 (=> (not res!66466) (not e!90513))))

(declare-fun b!138884 () Bool)

(declare-fun e!90516 () Bool)

(assert (=> b!138884 (= e!90516 (validKeyInArray!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!138884 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!138885 () Bool)

(assert (=> b!138885 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(assert (=> b!138885 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2560 (_values!2901 (v!3254 (underlying!471 thiss!992))))))))

(assert (=> b!138885 (= e!90513 (= (apply!118 lt!72628 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!138886 () Bool)

(declare-fun e!90514 () Bool)

(declare-fun isEmpty!422 (ListLongMap!1677) Bool)

(assert (=> b!138886 (= e!90514 (isEmpty!422 lt!72628))))

(declare-fun b!138887 () Bool)

(assert (=> b!138887 (= e!90517 (ListLongMap!1678 Nil!1706))))

(declare-fun bm!15296 () Bool)

(declare-fun call!15299 () ListLongMap!1677)

(assert (=> bm!15296 (= call!15299 (getCurrentListMapNoExtraKeys!138 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun b!138888 () Bool)

(declare-fun res!66465 () Bool)

(assert (=> b!138888 (=> (not res!66465) (not e!90515))))

(assert (=> b!138888 (= res!66465 (not (contains!897 lt!72628 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!138889 () Bool)

(declare-fun lt!72625 () Unit!4353)

(declare-fun lt!72624 () Unit!4353)

(assert (=> b!138889 (= lt!72625 lt!72624)))

(declare-fun lt!72627 () V!3529)

(declare-fun lt!72630 () (_ BitVec 64))

(declare-fun lt!72626 () (_ BitVec 64))

(declare-fun lt!72629 () ListLongMap!1677)

(assert (=> b!138889 (not (contains!897 (+!171 lt!72629 (tuple2!2607 lt!72626 lt!72627)) lt!72630))))

(declare-fun addStillNotContains!65 (ListLongMap!1677 (_ BitVec 64) V!3529 (_ BitVec 64)) Unit!4353)

(assert (=> b!138889 (= lt!72624 (addStillNotContains!65 lt!72629 lt!72626 lt!72627 lt!72630))))

(assert (=> b!138889 (= lt!72630 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!138889 (= lt!72627 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138889 (= lt!72626 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!138889 (= lt!72629 call!15299)))

(declare-fun e!90511 () ListLongMap!1677)

(assert (=> b!138889 (= e!90511 (+!171 call!15299 (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!138890 () Bool)

(assert (=> b!138890 (= e!90517 e!90511)))

(declare-fun c!26021 () Bool)

(assert (=> b!138890 (= c!26021 (validKeyInArray!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!138891 () Bool)

(assert (=> b!138891 (= e!90515 e!90512)))

(declare-fun c!26024 () Bool)

(assert (=> b!138891 (= c!26024 e!90516)))

(declare-fun res!66467 () Bool)

(assert (=> b!138891 (=> (not res!66467) (not e!90516))))

(assert (=> b!138891 (= res!66467 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(declare-fun b!138892 () Bool)

(assert (=> b!138892 (= e!90511 call!15299)))

(declare-fun b!138893 () Bool)

(assert (=> b!138893 (= e!90512 e!90514)))

(declare-fun c!26023 () Bool)

(assert (=> b!138893 (= c!26023 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))))))

(declare-fun b!138894 () Bool)

(assert (=> b!138894 (= e!90514 (= lt!72628 (getCurrentListMapNoExtraKeys!138 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (_values!2901 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992))) (extraKeys!2675 (v!3254 (underlying!471 thiss!992))) (zeroValue!2769 (v!3254 (underlying!471 thiss!992))) (minValue!2769 (v!3254 (underlying!471 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))))))))

(assert (= (and d!43463 c!26022) b!138887))

(assert (= (and d!43463 (not c!26022)) b!138890))

(assert (= (and b!138890 c!26021) b!138889))

(assert (= (and b!138890 (not c!26021)) b!138892))

(assert (= (or b!138889 b!138892) bm!15296))

(assert (= (and d!43463 res!66464) b!138888))

(assert (= (and b!138888 res!66465) b!138891))

(assert (= (and b!138891 res!66467) b!138884))

(assert (= (and b!138891 c!26024) b!138883))

(assert (= (and b!138891 (not c!26024)) b!138893))

(assert (= (and b!138883 res!66466) b!138885))

(assert (= (and b!138893 c!26023) b!138894))

(assert (= (and b!138893 (not c!26023)) b!138886))

(declare-fun b_lambda!6225 () Bool)

(assert (=> (not b_lambda!6225) (not b!138885)))

(assert (=> b!138885 t!6242))

(declare-fun b_and!8657 () Bool)

(assert (= b_and!8653 (and (=> t!6242 result!4105) b_and!8657)))

(assert (=> b!138885 t!6244))

(declare-fun b_and!8659 () Bool)

(assert (= b_and!8655 (and (=> t!6244 result!4109) b_and!8659)))

(declare-fun b_lambda!6227 () Bool)

(assert (=> (not b_lambda!6227) (not b!138889)))

(assert (=> b!138889 t!6242))

(declare-fun b_and!8661 () Bool)

(assert (= b_and!8657 (and (=> t!6242 result!4105) b_and!8661)))

(assert (=> b!138889 t!6244))

(declare-fun b_and!8663 () Bool)

(assert (= b_and!8659 (and (=> t!6244 result!4109) b_and!8663)))

(declare-fun m!166085 () Bool)

(assert (=> b!138886 m!166085))

(assert (=> b!138883 m!165565))

(assert (=> b!138883 m!165565))

(declare-fun m!166087 () Bool)

(assert (=> b!138883 m!166087))

(assert (=> b!138884 m!165565))

(assert (=> b!138884 m!165565))

(assert (=> b!138884 m!165567))

(assert (=> b!138890 m!165565))

(assert (=> b!138890 m!165565))

(assert (=> b!138890 m!165567))

(declare-fun m!166089 () Bool)

(assert (=> b!138894 m!166089))

(declare-fun m!166091 () Bool)

(assert (=> b!138888 m!166091))

(assert (=> b!138885 m!165565))

(declare-fun m!166093 () Bool)

(assert (=> b!138885 m!166093))

(assert (=> b!138885 m!165565))

(assert (=> b!138885 m!165603))

(assert (=> b!138885 m!165393))

(assert (=> b!138885 m!165607))

(assert (=> b!138885 m!165393))

(assert (=> b!138885 m!165603))

(declare-fun m!166095 () Bool)

(assert (=> b!138889 m!166095))

(declare-fun m!166097 () Bool)

(assert (=> b!138889 m!166097))

(declare-fun m!166099 () Bool)

(assert (=> b!138889 m!166099))

(assert (=> b!138889 m!165565))

(assert (=> b!138889 m!165603))

(assert (=> b!138889 m!165393))

(assert (=> b!138889 m!165607))

(assert (=> b!138889 m!165393))

(assert (=> b!138889 m!165603))

(declare-fun m!166101 () Bool)

(assert (=> b!138889 m!166101))

(assert (=> b!138889 m!166097))

(declare-fun m!166103 () Bool)

(assert (=> d!43463 m!166103))

(assert (=> d!43463 m!165611))

(assert (=> bm!15296 m!166089))

(assert (=> b!138564 d!43463))

(declare-fun d!43465 () Bool)

(declare-fun e!90518 () Bool)

(assert (=> d!43465 e!90518))

(declare-fun res!66468 () Bool)

(assert (=> d!43465 (=> (not res!66468) (not e!90518))))

(declare-fun lt!72631 () ListLongMap!1677)

(assert (=> d!43465 (= res!66468 (contains!897 lt!72631 (_1!1314 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(declare-fun lt!72634 () List!1709)

(assert (=> d!43465 (= lt!72631 (ListLongMap!1678 lt!72634))))

(declare-fun lt!72632 () Unit!4353)

(declare-fun lt!72633 () Unit!4353)

(assert (=> d!43465 (= lt!72632 lt!72633)))

(assert (=> d!43465 (= (getValueByKey!175 lt!72634 (_1!1314 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))) (Some!180 (_2!1314 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43465 (= lt!72633 (lemmaContainsTupThenGetReturnValue!90 lt!72634 (_1!1314 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) (_2!1314 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43465 (= lt!72634 (insertStrictlySorted!93 (toList!854 lt!72396) (_1!1314 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) (_2!1314 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43465 (= (+!171 lt!72396 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72631)))

(declare-fun b!138895 () Bool)

(declare-fun res!66469 () Bool)

(assert (=> b!138895 (=> (not res!66469) (not e!90518))))

(assert (=> b!138895 (= res!66469 (= (getValueByKey!175 (toList!854 lt!72631) (_1!1314 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))) (Some!180 (_2!1314 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))))))

(declare-fun b!138896 () Bool)

(assert (=> b!138896 (= e!90518 (contains!899 (toList!854 lt!72631) (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))))

(assert (= (and d!43465 res!66468) b!138895))

(assert (= (and b!138895 res!66469) b!138896))

(declare-fun m!166105 () Bool)

(assert (=> d!43465 m!166105))

(declare-fun m!166107 () Bool)

(assert (=> d!43465 m!166107))

(declare-fun m!166109 () Bool)

(assert (=> d!43465 m!166109))

(declare-fun m!166111 () Bool)

(assert (=> d!43465 m!166111))

(declare-fun m!166113 () Bool)

(assert (=> b!138895 m!166113))

(declare-fun m!166115 () Bool)

(assert (=> b!138896 m!166115))

(assert (=> b!138564 d!43465))

(declare-fun d!43467 () Bool)

(assert (=> d!43467 (= (apply!118 (+!171 lt!72389 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72405) (get!1519 (getValueByKey!175 (toList!854 (+!171 lt!72389 (tuple2!2607 lt!72403 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))) lt!72405)))))

(declare-fun bs!5826 () Bool)

(assert (= bs!5826 d!43467))

(declare-fun m!166117 () Bool)

(assert (=> bs!5826 m!166117))

(assert (=> bs!5826 m!166117))

(declare-fun m!166119 () Bool)

(assert (=> bs!5826 m!166119))

(assert (=> b!138564 d!43467))

(declare-fun d!43469 () Bool)

(assert (=> d!43469 (= (apply!118 (+!171 lt!72396 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72402) (get!1519 (getValueByKey!175 (toList!854 (+!171 lt!72396 (tuple2!2607 lt!72409 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))) lt!72402)))))

(declare-fun bs!5827 () Bool)

(assert (= bs!5827 d!43469))

(declare-fun m!166121 () Bool)

(assert (=> bs!5827 m!166121))

(assert (=> bs!5827 m!166121))

(declare-fun m!166123 () Bool)

(assert (=> bs!5827 m!166123))

(assert (=> b!138564 d!43469))

(declare-fun d!43471 () Bool)

(assert (=> d!43471 (= (apply!118 lt!72389 lt!72405) (get!1519 (getValueByKey!175 (toList!854 lt!72389) lt!72405)))))

(declare-fun bs!5828 () Bool)

(assert (= bs!5828 d!43471))

(declare-fun m!166125 () Bool)

(assert (=> bs!5828 m!166125))

(assert (=> bs!5828 m!166125))

(declare-fun m!166127 () Bool)

(assert (=> bs!5828 m!166127))

(assert (=> b!138564 d!43471))

(declare-fun d!43473 () Bool)

(declare-fun e!90520 () Bool)

(assert (=> d!43473 e!90520))

(declare-fun res!66470 () Bool)

(assert (=> d!43473 (=> res!66470 e!90520)))

(declare-fun lt!72637 () Bool)

(assert (=> d!43473 (= res!66470 (not lt!72637))))

(declare-fun lt!72636 () Bool)

(assert (=> d!43473 (= lt!72637 lt!72636)))

(declare-fun lt!72638 () Unit!4353)

(declare-fun e!90519 () Unit!4353)

(assert (=> d!43473 (= lt!72638 e!90519)))

(declare-fun c!26025 () Bool)

(assert (=> d!43473 (= c!26025 lt!72636)))

(assert (=> d!43473 (= lt!72636 (containsKey!178 (toList!854 (+!171 lt!72401 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))) lt!72391))))

(assert (=> d!43473 (= (contains!897 (+!171 lt!72401 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72391) lt!72637)))

(declare-fun b!138897 () Bool)

(declare-fun lt!72635 () Unit!4353)

(assert (=> b!138897 (= e!90519 lt!72635)))

(assert (=> b!138897 (= lt!72635 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!854 (+!171 lt!72401 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))) lt!72391))))

(assert (=> b!138897 (isDefined!127 (getValueByKey!175 (toList!854 (+!171 lt!72401 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))) lt!72391))))

(declare-fun b!138898 () Bool)

(declare-fun Unit!4368 () Unit!4353)

(assert (=> b!138898 (= e!90519 Unit!4368)))

(declare-fun b!138899 () Bool)

(assert (=> b!138899 (= e!90520 (isDefined!127 (getValueByKey!175 (toList!854 (+!171 lt!72401 (tuple2!2607 lt!72406 (zeroValue!2769 (v!3254 (underlying!471 thiss!992)))))) lt!72391)))))

(assert (= (and d!43473 c!26025) b!138897))

(assert (= (and d!43473 (not c!26025)) b!138898))

(assert (= (and d!43473 (not res!66470)) b!138899))

(declare-fun m!166129 () Bool)

(assert (=> d!43473 m!166129))

(declare-fun m!166131 () Bool)

(assert (=> b!138897 m!166131))

(declare-fun m!166133 () Bool)

(assert (=> b!138897 m!166133))

(assert (=> b!138897 m!166133))

(declare-fun m!166135 () Bool)

(assert (=> b!138897 m!166135))

(assert (=> b!138899 m!166133))

(assert (=> b!138899 m!166133))

(assert (=> b!138899 m!166135))

(assert (=> b!138564 d!43473))

(declare-fun d!43475 () Bool)

(assert (=> d!43475 (= (apply!118 lt!72396 lt!72402) (get!1519 (getValueByKey!175 (toList!854 lt!72396) lt!72402)))))

(declare-fun bs!5829 () Bool)

(assert (= bs!5829 d!43475))

(declare-fun m!166137 () Bool)

(assert (=> bs!5829 m!166137))

(assert (=> bs!5829 m!166137))

(declare-fun m!166139 () Bool)

(assert (=> bs!5829 m!166139))

(assert (=> b!138564 d!43475))

(declare-fun d!43477 () Bool)

(assert (=> d!43477 (= (get!1518 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138487 d!43477))

(declare-fun d!43479 () Bool)

(declare-fun res!66471 () Bool)

(declare-fun e!90521 () Bool)

(assert (=> d!43479 (=> res!66471 e!90521)))

(assert (=> d!43479 (= res!66471 (= (select (arr!2288 (_keys!4675 newMap!16)) #b00000000000000000000000000000000) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> d!43479 (= (arrayContainsKey!0 (_keys!4675 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b00000000000000000000000000000000) e!90521)))

(declare-fun b!138900 () Bool)

(declare-fun e!90522 () Bool)

(assert (=> b!138900 (= e!90521 e!90522)))

(declare-fun res!66472 () Bool)

(assert (=> b!138900 (=> (not res!66472) (not e!90522))))

(assert (=> b!138900 (= res!66472 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2559 (_keys!4675 newMap!16))))))

(declare-fun b!138901 () Bool)

(assert (=> b!138901 (= e!90522 (arrayContainsKey!0 (_keys!4675 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!43479 (not res!66471)) b!138900))

(assert (= (and b!138900 res!66472) b!138901))

(assert (=> d!43479 m!165679))

(assert (=> b!138901 m!165363))

(declare-fun m!166141 () Bool)

(assert (=> b!138901 m!166141))

(assert (=> bm!15223 d!43479))

(assert (=> bm!15224 d!43357))

(declare-fun bm!15305 () Bool)

(declare-fun call!15311 () SeekEntryResult!271)

(assert (=> bm!15305 (= call!15311 (seekEntryOrOpen!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (_keys!4675 newMap!16) (mask!7248 newMap!16)))))

(declare-fun b!138936 () Bool)

(declare-fun e!90545 () Bool)

(declare-fun lt!72725 () SeekEntryResult!271)

(assert (=> b!138936 (= e!90545 ((_ is Undefined!271) lt!72725))))

(declare-fun d!43481 () Bool)

(declare-fun e!90541 () Bool)

(assert (=> d!43481 e!90541))

(declare-fun res!66496 () Bool)

(assert (=> d!43481 (=> (not res!66496) (not e!90541))))

(declare-fun lt!72711 () tuple2!2608)

(assert (=> d!43481 (= res!66496 (_1!1315 lt!72711))))

(assert (=> d!43481 (= lt!72711 (tuple2!2609 true (LongMapFixedSize!1133 (defaultEntry!2918 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (bvadd (_size!615 newMap!16) #b00000000000000000000000000000001) (array!4840 (store (arr!2288 (_keys!4675 newMap!16)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) (size!2559 (_keys!4675 newMap!16))) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16))) (_vacant!615 newMap!16))))))

(declare-fun lt!72701 () Unit!4353)

(declare-fun lt!72723 () Unit!4353)

(assert (=> d!43481 (= lt!72701 lt!72723)))

(declare-fun lt!72718 () array!4841)

(declare-fun lt!72728 () array!4839)

(assert (=> d!43481 (contains!897 (getCurrentListMap!527 lt!72728 lt!72718 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (select (store (arr!2288 (_keys!4675 newMap!16)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322))))))

(assert (=> d!43481 (= lt!72723 (lemmaValidKeyInArrayIsInListMap!123 lt!72728 lt!72718 (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43481 (= lt!72718 (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16))))))

(assert (=> d!43481 (= lt!72728 (array!4840 (store (arr!2288 (_keys!4675 newMap!16)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) (size!2559 (_keys!4675 newMap!16))))))

(declare-fun lt!72708 () Unit!4353)

(declare-fun lt!72724 () Unit!4353)

(assert (=> d!43481 (= lt!72708 lt!72724)))

(declare-fun lt!72717 () array!4839)

(assert (=> d!43481 (= (arrayCountValidKeys!0 lt!72717 (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (bvadd (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4839 (_ BitVec 32)) Unit!4353)

(assert (=> d!43481 (= lt!72724 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!72717 (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322))))))

(assert (=> d!43481 (= lt!72717 (array!4840 (store (arr!2288 (_keys!4675 newMap!16)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) (size!2559 (_keys!4675 newMap!16))))))

(declare-fun lt!72703 () Unit!4353)

(declare-fun lt!72715 () Unit!4353)

(assert (=> d!43481 (= lt!72703 lt!72715)))

(declare-fun lt!72706 () array!4839)

(assert (=> d!43481 (arrayContainsKey!0 lt!72706 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!43481 (= lt!72715 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!72706 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322))))))

(assert (=> d!43481 (= lt!72706 (array!4840 (store (arr!2288 (_keys!4675 newMap!16)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) (size!2559 (_keys!4675 newMap!16))))))

(declare-fun lt!72716 () Unit!4353)

(declare-fun lt!72712 () Unit!4353)

(assert (=> d!43481 (= lt!72716 lt!72712)))

(assert (=> d!43481 (= (+!171 (getCurrentListMap!527 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!527 (array!4840 (store (arr!2288 (_keys!4675 newMap!16)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) (size!2559 (_keys!4675 newMap!16))) (array!4842 (store (arr!2289 (_values!2901 newMap!16)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (ValueCellFull!1112 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2560 (_values!2901 newMap!16))) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!44 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 32) (_ BitVec 64) V!3529 Int) Unit!4353)

(assert (=> d!43481 (= lt!72712 (lemmaAddValidKeyToArrayThenAddPairToListMap!44 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72721 () Unit!4353)

(declare-fun lt!72709 () Unit!4353)

(assert (=> d!43481 (= lt!72721 lt!72709)))

(assert (=> d!43481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4840 (store (arr!2288 (_keys!4675 newMap!16)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) (size!2559 (_keys!4675 newMap!16))) (mask!7248 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4839 (_ BitVec 32) (_ BitVec 32)) Unit!4353)

(assert (=> d!43481 (= lt!72709 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (_keys!4675 newMap!16) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (mask!7248 newMap!16)))))

(declare-fun lt!72699 () Unit!4353)

(declare-fun lt!72702 () Unit!4353)

(assert (=> d!43481 (= lt!72699 lt!72702)))

(assert (=> d!43481 (= (arrayCountValidKeys!0 (array!4840 (store (arr!2288 (_keys!4675 newMap!16)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) (size!2559 (_keys!4675 newMap!16))) #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4675 newMap!16) #b00000000000000000000000000000000 (size!2559 (_keys!4675 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4839 (_ BitVec 32) (_ BitVec 64)) Unit!4353)

(assert (=> d!43481 (= lt!72702 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4675 newMap!16) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun lt!72720 () Unit!4353)

(declare-fun lt!72727 () Unit!4353)

(assert (=> d!43481 (= lt!72720 lt!72727)))

(declare-fun lt!72714 () (_ BitVec 32))

(declare-fun lt!72700 () List!1710)

(assert (=> d!43481 (arrayNoDuplicates!0 (array!4840 (store (arr!2288 (_keys!4675 newMap!16)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) (size!2559 (_keys!4675 newMap!16))) lt!72714 lt!72700)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4839 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1710) Unit!4353)

(assert (=> d!43481 (= lt!72727 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4675 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322)) lt!72714 lt!72700))))

(assert (=> d!43481 (= lt!72700 Nil!1707)))

(assert (=> d!43481 (= lt!72714 #b00000000000000000000000000000000)))

(declare-fun lt!72705 () Unit!4353)

(declare-fun e!90540 () Unit!4353)

(assert (=> d!43481 (= lt!72705 e!90540)))

(declare-fun c!26037 () Bool)

(assert (=> d!43481 (= c!26037 (arrayContainsKey!0 (_keys!4675 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!72713 () Unit!4353)

(declare-fun e!90546 () Unit!4353)

(assert (=> d!43481 (= lt!72713 e!90546)))

(declare-fun c!26035 () Bool)

(assert (=> d!43481 (= c!26035 (contains!897 (getCurrentListMap!527 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> d!43481 (valid!558 newMap!16)))

(assert (=> d!43481 (= (updateHelperNewKey!63 newMap!16 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!25917 (index!3249 lt!72322) (index!3246 lt!72322))) lt!72711)))

(declare-fun b!138937 () Bool)

(declare-fun res!66491 () Bool)

(assert (=> b!138937 (=> (not res!66491) (not e!90541))))

(assert (=> b!138937 (= res!66491 (valid!558 (_2!1315 lt!72711)))))

(declare-fun lt!72704 () SeekEntryResult!271)

(declare-fun e!90543 () Bool)

(declare-fun b!138938 () Bool)

(assert (=> b!138938 (= e!90543 (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3247 lt!72704)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun b!138939 () Bool)

(declare-fun e!90539 () Bool)

(assert (=> b!138939 (= e!90545 e!90539)))

(declare-fun res!66497 () Bool)

(declare-fun call!15309 () Bool)

(assert (=> b!138939 (= res!66497 call!15309)))

(assert (=> b!138939 (=> (not res!66497) (not e!90539))))

(declare-fun b!138940 () Bool)

(declare-fun Unit!4369 () Unit!4353)

(assert (=> b!138940 (= e!90540 Unit!4369)))

(declare-fun b!138941 () Bool)

(declare-fun res!66495 () Bool)

(assert (=> b!138941 (=> (not res!66495) (not e!90541))))

(assert (=> b!138941 (= res!66495 (contains!897 (map!1419 (_2!1315 lt!72711)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun b!138942 () Bool)

(declare-fun e!90542 () Bool)

(declare-fun call!15310 () Bool)

(assert (=> b!138942 (= e!90542 (not call!15310))))

(declare-fun b!138943 () Bool)

(declare-fun Unit!4370 () Unit!4353)

(assert (=> b!138943 (= e!90540 Unit!4370)))

(declare-fun lt!72710 () Unit!4353)

(declare-fun lemmaArrayContainsKeyThenInListMap!44 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 (_ BitVec 64) (_ BitVec 32) Int) Unit!4353)

(assert (=> b!138943 (= lt!72710 (lemmaArrayContainsKeyThenInListMap!44 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(assert (=> b!138943 (contains!897 (getCurrentListMap!527 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355))))

(declare-fun lt!72707 () Unit!4353)

(assert (=> b!138943 (= lt!72707 lt!72710)))

(assert (=> b!138943 false))

(declare-fun b!138944 () Bool)

(assert (=> b!138944 (= e!90541 (= (map!1419 (_2!1315 lt!72711)) (+!171 (map!1419 newMap!16) (tuple2!2607 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!138945 () Bool)

(declare-fun res!66494 () Bool)

(declare-fun call!15308 () Bool)

(assert (=> b!138945 (= res!66494 call!15308)))

(assert (=> b!138945 (=> (not res!66494) (not e!90543))))

(declare-fun bm!15306 () Bool)

(assert (=> bm!15306 (= call!15309 call!15308)))

(declare-fun b!138946 () Bool)

(declare-fun res!66498 () Bool)

(assert (=> b!138946 (= res!66498 (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3249 lt!72725)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138946 (=> (not res!66498) (not e!90539))))

(declare-fun b!138947 () Bool)

(declare-fun res!66499 () Bool)

(assert (=> b!138947 (=> (not res!66499) (not e!90542))))

(assert (=> b!138947 (= res!66499 call!15309)))

(declare-fun e!90544 () Bool)

(assert (=> b!138947 (= e!90544 e!90542)))

(declare-fun b!138948 () Bool)

(declare-fun c!26036 () Bool)

(assert (=> b!138948 (= c!26036 ((_ is MissingVacant!271) lt!72725))))

(assert (=> b!138948 (= e!90544 e!90545)))

(declare-fun b!138949 () Bool)

(declare-fun res!66492 () Bool)

(assert (=> b!138949 (=> (not res!66492) (not e!90542))))

(assert (=> b!138949 (= res!66492 (= (select (arr!2288 (_keys!4675 newMap!16)) (index!3246 lt!72725)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138950 () Bool)

(declare-fun Unit!4371 () Unit!4353)

(assert (=> b!138950 (= e!90546 Unit!4371)))

(declare-fun lt!72722 () Unit!4353)

(assert (=> b!138950 (= lt!72722 (lemmaInListMapThenSeekEntryOrOpenFindsIt!63 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)))))

(assert (=> b!138950 (= lt!72704 call!15311)))

(declare-fun res!66493 () Bool)

(assert (=> b!138950 (= res!66493 ((_ is Found!271) lt!72704))))

(assert (=> b!138950 (=> (not res!66493) (not e!90543))))

(assert (=> b!138950 e!90543))

(declare-fun lt!72726 () Unit!4353)

(assert (=> b!138950 (= lt!72726 lt!72722)))

(assert (=> b!138950 false))

(declare-fun c!26034 () Bool)

(declare-fun bm!15307 () Bool)

(assert (=> bm!15307 (= call!15308 (inRange!0 (ite c!26035 (index!3247 lt!72704) (ite c!26034 (index!3246 lt!72725) (index!3249 lt!72725))) (mask!7248 newMap!16)))))

(declare-fun b!138951 () Bool)

(declare-fun lt!72719 () Unit!4353)

(assert (=> b!138951 (= e!90546 lt!72719)))

(assert (=> b!138951 (= lt!72719 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!63 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) (defaultEntry!2918 newMap!16)))))

(assert (=> b!138951 (= lt!72725 call!15311)))

(assert (=> b!138951 (= c!26034 ((_ is MissingZero!271) lt!72725))))

(assert (=> b!138951 e!90544))

(declare-fun bm!15308 () Bool)

(assert (=> bm!15308 (= call!15310 (arrayContainsKey!0 (_keys!4675 newMap!16) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!138952 () Bool)

(assert (=> b!138952 (= e!90539 (not call!15310))))

(assert (= (and d!43481 c!26035) b!138950))

(assert (= (and d!43481 (not c!26035)) b!138951))

(assert (= (and b!138950 res!66493) b!138945))

(assert (= (and b!138945 res!66494) b!138938))

(assert (= (and b!138951 c!26034) b!138947))

(assert (= (and b!138951 (not c!26034)) b!138948))

(assert (= (and b!138947 res!66499) b!138949))

(assert (= (and b!138949 res!66492) b!138942))

(assert (= (and b!138948 c!26036) b!138939))

(assert (= (and b!138948 (not c!26036)) b!138936))

(assert (= (and b!138939 res!66497) b!138946))

(assert (= (and b!138946 res!66498) b!138952))

(assert (= (or b!138947 b!138939) bm!15306))

(assert (= (or b!138942 b!138952) bm!15308))

(assert (= (or b!138945 bm!15306) bm!15307))

(assert (= (or b!138950 b!138951) bm!15305))

(assert (= (and d!43481 c!26037) b!138943))

(assert (= (and d!43481 (not c!26037)) b!138940))

(assert (= (and d!43481 res!66496) b!138937))

(assert (= (and b!138937 res!66491) b!138941))

(assert (= (and b!138941 res!66495) b!138944))

(declare-fun m!166143 () Bool)

(assert (=> b!138937 m!166143))

(declare-fun m!166145 () Bool)

(assert (=> b!138944 m!166145))

(assert (=> b!138944 m!165365))

(assert (=> b!138944 m!165365))

(declare-fun m!166147 () Bool)

(assert (=> b!138944 m!166147))

(declare-fun m!166149 () Bool)

(assert (=> b!138949 m!166149))

(assert (=> b!138943 m!165363))

(declare-fun m!166151 () Bool)

(assert (=> b!138943 m!166151))

(assert (=> b!138943 m!165561))

(assert (=> b!138943 m!165561))

(assert (=> b!138943 m!165363))

(declare-fun m!166153 () Bool)

(assert (=> b!138943 m!166153))

(assert (=> bm!15305 m!165363))

(assert (=> bm!15305 m!165513))

(declare-fun m!166155 () Bool)

(assert (=> d!43481 m!166155))

(assert (=> d!43481 m!165363))

(declare-fun m!166157 () Bool)

(assert (=> d!43481 m!166157))

(assert (=> d!43481 m!165363))

(declare-fun m!166159 () Bool)

(assert (=> d!43481 m!166159))

(declare-fun m!166161 () Bool)

(assert (=> d!43481 m!166161))

(assert (=> d!43481 m!165561))

(assert (=> d!43481 m!165771))

(assert (=> d!43481 m!165547))

(assert (=> d!43481 m!165561))

(assert (=> d!43481 m!165363))

(assert (=> d!43481 m!166153))

(declare-fun m!166163 () Bool)

(assert (=> d!43481 m!166163))

(declare-fun m!166165 () Bool)

(assert (=> d!43481 m!166165))

(declare-fun m!166167 () Bool)

(assert (=> d!43481 m!166167))

(assert (=> d!43481 m!165363))

(declare-fun m!166169 () Bool)

(assert (=> d!43481 m!166169))

(declare-fun m!166171 () Bool)

(assert (=> d!43481 m!166171))

(assert (=> d!43481 m!166165))

(assert (=> d!43481 m!165363))

(assert (=> d!43481 m!165395))

(declare-fun m!166173 () Bool)

(assert (=> d!43481 m!166173))

(declare-fun m!166175 () Bool)

(assert (=> d!43481 m!166175))

(assert (=> d!43481 m!165363))

(assert (=> d!43481 m!165505))

(declare-fun m!166177 () Bool)

(assert (=> d!43481 m!166177))

(declare-fun m!166179 () Bool)

(assert (=> d!43481 m!166179))

(assert (=> d!43481 m!165561))

(declare-fun m!166181 () Bool)

(assert (=> d!43481 m!166181))

(assert (=> d!43481 m!165387))

(assert (=> d!43481 m!166163))

(declare-fun m!166183 () Bool)

(assert (=> d!43481 m!166183))

(assert (=> d!43481 m!165363))

(declare-fun m!166185 () Bool)

(assert (=> d!43481 m!166185))

(assert (=> d!43481 m!165363))

(declare-fun m!166187 () Bool)

(assert (=> d!43481 m!166187))

(declare-fun m!166189 () Bool)

(assert (=> d!43481 m!166189))

(declare-fun m!166191 () Bool)

(assert (=> b!138938 m!166191))

(declare-fun m!166193 () Bool)

(assert (=> bm!15307 m!166193))

(assert (=> b!138950 m!165363))

(assert (=> b!138950 m!165497))

(assert (=> bm!15308 m!165363))

(assert (=> bm!15308 m!165505))

(assert (=> b!138951 m!165363))

(assert (=> b!138951 m!165507))

(assert (=> b!138941 m!166145))

(assert (=> b!138941 m!166145))

(assert (=> b!138941 m!165363))

(declare-fun m!166195 () Bool)

(assert (=> b!138941 m!166195))

(declare-fun m!166197 () Bool)

(assert (=> b!138946 m!166197))

(assert (=> bm!15220 d!43481))

(declare-fun d!43483 () Bool)

(declare-fun res!66500 () Bool)

(declare-fun e!90547 () Bool)

(assert (=> d!43483 (=> (not res!66500) (not e!90547))))

(assert (=> d!43483 (= res!66500 (simpleValid!94 (v!3254 (underlying!471 thiss!992))))))

(assert (=> d!43483 (= (valid!558 (v!3254 (underlying!471 thiss!992))) e!90547)))

(declare-fun b!138953 () Bool)

(declare-fun res!66501 () Bool)

(assert (=> b!138953 (=> (not res!66501) (not e!90547))))

(assert (=> b!138953 (= res!66501 (= (arrayCountValidKeys!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000000 (size!2559 (_keys!4675 (v!3254 (underlying!471 thiss!992))))) (_size!615 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun b!138954 () Bool)

(declare-fun res!66502 () Bool)

(assert (=> b!138954 (=> (not res!66502) (not e!90547))))

(assert (=> b!138954 (= res!66502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4675 (v!3254 (underlying!471 thiss!992))) (mask!7248 (v!3254 (underlying!471 thiss!992)))))))

(declare-fun b!138955 () Bool)

(assert (=> b!138955 (= e!90547 (arrayNoDuplicates!0 (_keys!4675 (v!3254 (underlying!471 thiss!992))) #b00000000000000000000000000000000 Nil!1707))))

(assert (= (and d!43483 res!66500) b!138953))

(assert (= (and b!138953 res!66501) b!138954))

(assert (= (and b!138954 res!66502) b!138955))

(declare-fun m!166199 () Bool)

(assert (=> d!43483 m!166199))

(declare-fun m!166201 () Bool)

(assert (=> b!138953 m!166201))

(declare-fun m!166203 () Bool)

(assert (=> b!138954 m!166203))

(assert (=> b!138955 m!165369))

(assert (=> d!43361 d!43483))

(declare-fun d!43485 () Bool)

(assert (=> d!43485 (= (apply!118 lt!72394 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1519 (getValueByKey!175 (toList!854 lt!72394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5830 () Bool)

(assert (= bs!5830 d!43485))

(assert (=> bs!5830 m!166013))

(assert (=> bs!5830 m!166013))

(declare-fun m!166205 () Bool)

(assert (=> bs!5830 m!166205))

(assert (=> b!138560 d!43485))

(declare-fun d!43487 () Bool)

(assert (=> d!43487 (= (validKeyInArray!0 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138561 d!43487))

(declare-fun d!43489 () Bool)

(declare-fun e!90549 () Bool)

(assert (=> d!43489 e!90549))

(declare-fun res!66503 () Bool)

(assert (=> d!43489 (=> res!66503 e!90549)))

(declare-fun lt!72731 () Bool)

(assert (=> d!43489 (= res!66503 (not lt!72731))))

(declare-fun lt!72730 () Bool)

(assert (=> d!43489 (= lt!72731 lt!72730)))

(declare-fun lt!72732 () Unit!4353)

(declare-fun e!90548 () Unit!4353)

(assert (=> d!43489 (= lt!72732 e!90548)))

(declare-fun c!26038 () Bool)

(assert (=> d!43489 (= c!26038 lt!72730)))

(assert (=> d!43489 (= lt!72730 (containsKey!178 (toList!854 call!15221) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> d!43489 (= (contains!897 call!15221 (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)) lt!72731)))

(declare-fun b!138956 () Bool)

(declare-fun lt!72729 () Unit!4353)

(assert (=> b!138956 (= e!90548 lt!72729)))

(assert (=> b!138956 (= lt!72729 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!854 call!15221) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(assert (=> b!138956 (isDefined!127 (getValueByKey!175 (toList!854 call!15221) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355)))))

(declare-fun b!138957 () Bool)

(declare-fun Unit!4372 () Unit!4353)

(assert (=> b!138957 (= e!90548 Unit!4372)))

(declare-fun b!138958 () Bool)

(assert (=> b!138958 (= e!90549 (isDefined!127 (getValueByKey!175 (toList!854 call!15221) (select (arr!2288 (_keys!4675 (v!3254 (underlying!471 thiss!992)))) from!355))))))

(assert (= (and d!43489 c!26038) b!138956))

(assert (= (and d!43489 (not c!26038)) b!138957))

(assert (= (and d!43489 (not res!66503)) b!138958))

(assert (=> d!43489 m!165363))

(declare-fun m!166207 () Bool)

(assert (=> d!43489 m!166207))

(assert (=> b!138956 m!165363))

(declare-fun m!166209 () Bool)

(assert (=> b!138956 m!166209))

(assert (=> b!138956 m!165363))

(declare-fun m!166211 () Bool)

(assert (=> b!138956 m!166211))

(assert (=> b!138956 m!166211))

(declare-fun m!166213 () Bool)

(assert (=> b!138956 m!166213))

(assert (=> b!138958 m!165363))

(assert (=> b!138958 m!166211))

(assert (=> b!138958 m!166211))

(assert (=> b!138958 m!166213))

(assert (=> b!138447 d!43489))

(declare-fun d!43491 () Bool)

(assert (=> d!43491 (= (+!171 (getCurrentListMap!527 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) (zeroValue!2769 newMap!16) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)) (tuple2!2607 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!527 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) lt!72331 (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2769 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2918 newMap!16)))))

(declare-fun lt!72735 () Unit!4353)

(declare-fun choose!860 (array!4839 array!4841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3529 V!3529 V!3529 Int) Unit!4353)

(assert (=> d!43491 (= lt!72735 (choose!860 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) lt!72331 (zeroValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2769 newMap!16) (defaultEntry!2918 newMap!16)))))

(assert (=> d!43491 (validMask!0 (mask!7248 newMap!16))))

(assert (=> d!43491 (= (lemmaChangeZeroKeyThenAddPairToListMap!63 (_keys!4675 newMap!16) (_values!2901 newMap!16) (mask!7248 newMap!16) (extraKeys!2675 newMap!16) lt!72331 (zeroValue!2769 newMap!16) (get!1516 (select (arr!2289 (_values!2901 (v!3254 (underlying!471 thiss!992)))) from!355) (dynLambda!435 (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2769 newMap!16) (defaultEntry!2918 newMap!16)) lt!72735)))

(declare-fun bs!5831 () Bool)

(assert (= bs!5831 d!43491))

(assert (=> bs!5831 m!165561))

(declare-fun m!166215 () Bool)

(assert (=> bs!5831 m!166215))

(assert (=> bs!5831 m!165561))

(assert (=> bs!5831 m!165395))

(declare-fun m!166217 () Bool)

(assert (=> bs!5831 m!166217))

(assert (=> bs!5831 m!165649))

(assert (=> bs!5831 m!165395))

(declare-fun m!166219 () Bool)

(assert (=> bs!5831 m!166219))

(assert (=> b!138473 d!43491))

(assert (=> b!138571 d!43487))

(assert (=> bm!15245 d!43463))

(declare-fun d!43493 () Bool)

(declare-fun e!90550 () Bool)

(assert (=> d!43493 e!90550))

(declare-fun res!66504 () Bool)

(assert (=> d!43493 (=> (not res!66504) (not e!90550))))

(declare-fun lt!72736 () ListLongMap!1677)

(assert (=> d!43493 (= res!66504 (contains!897 lt!72736 (_1!1314 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(declare-fun lt!72739 () List!1709)

(assert (=> d!43493 (= lt!72736 (ListLongMap!1678 lt!72739))))

(declare-fun lt!72737 () Unit!4353)

(declare-fun lt!72738 () Unit!4353)

(assert (=> d!43493 (= lt!72737 lt!72738)))

(assert (=> d!43493 (= (getValueByKey!175 lt!72739 (_1!1314 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))) (Some!180 (_2!1314 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43493 (= lt!72738 (lemmaContainsTupThenGetReturnValue!90 lt!72739 (_1!1314 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) (_2!1314 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43493 (= lt!72739 (insertStrictlySorted!93 (toList!854 call!15248) (_1!1314 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) (_2!1314 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))))))

(assert (=> d!43493 (= (+!171 call!15248 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992))))) lt!72736)))

(declare-fun b!138959 () Bool)

(declare-fun res!66505 () Bool)

(assert (=> b!138959 (=> (not res!66505) (not e!90550))))

(assert (=> b!138959 (= res!66505 (= (getValueByKey!175 (toList!854 lt!72736) (_1!1314 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992)))))) (Some!180 (_2!1314 (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))))))

(declare-fun b!138960 () Bool)

(assert (=> b!138960 (= e!90550 (contains!899 (toList!854 lt!72736) (tuple2!2607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2769 (v!3254 (underlying!471 thiss!992))))))))

(assert (= (and d!43493 res!66504) b!138959))

(assert (= (and b!138959 res!66505) b!138960))

(declare-fun m!166221 () Bool)

(assert (=> d!43493 m!166221))

(declare-fun m!166223 () Bool)

(assert (=> d!43493 m!166223))

(declare-fun m!166225 () Bool)

(assert (=> d!43493 m!166225))

(declare-fun m!166227 () Bool)

(assert (=> d!43493 m!166227))

(declare-fun m!166229 () Bool)

(assert (=> b!138959 m!166229))

(declare-fun m!166231 () Bool)

(assert (=> b!138960 m!166231))

(assert (=> b!138573 d!43493))

(declare-fun mapIsEmpty!4781 () Bool)

(declare-fun mapRes!4781 () Bool)

(assert (=> mapIsEmpty!4781 mapRes!4781))

(declare-fun b!138962 () Bool)

(declare-fun e!90552 () Bool)

(assert (=> b!138962 (= e!90552 tp_is_empty!2911)))

(declare-fun condMapEmpty!4781 () Bool)

(declare-fun mapDefault!4781 () ValueCell!1112)

(assert (=> mapNonEmpty!4780 (= condMapEmpty!4781 (= mapRest!4780 ((as const (Array (_ BitVec 32) ValueCell!1112)) mapDefault!4781)))))

(assert (=> mapNonEmpty!4780 (= tp!11458 (and e!90552 mapRes!4781))))

(declare-fun mapNonEmpty!4781 () Bool)

(declare-fun tp!11459 () Bool)

(declare-fun e!90551 () Bool)

(assert (=> mapNonEmpty!4781 (= mapRes!4781 (and tp!11459 e!90551))))

(declare-fun mapKey!4781 () (_ BitVec 32))

(declare-fun mapValue!4781 () ValueCell!1112)

(declare-fun mapRest!4781 () (Array (_ BitVec 32) ValueCell!1112))

(assert (=> mapNonEmpty!4781 (= mapRest!4780 (store mapRest!4781 mapKey!4781 mapValue!4781))))

(declare-fun b!138961 () Bool)

(assert (=> b!138961 (= e!90551 tp_is_empty!2911)))

(assert (= (and mapNonEmpty!4780 condMapEmpty!4781) mapIsEmpty!4781))

(assert (= (and mapNonEmpty!4780 (not condMapEmpty!4781)) mapNonEmpty!4781))

(assert (= (and mapNonEmpty!4781 ((_ is ValueCellFull!1112) mapValue!4781)) b!138961))

(assert (= (and mapNonEmpty!4780 ((_ is ValueCellFull!1112) mapDefault!4781)) b!138962))

(declare-fun m!166233 () Bool)

(assert (=> mapNonEmpty!4781 m!166233))

(declare-fun mapIsEmpty!4782 () Bool)

(declare-fun mapRes!4782 () Bool)

(assert (=> mapIsEmpty!4782 mapRes!4782))

(declare-fun b!138964 () Bool)

(declare-fun e!90554 () Bool)

(assert (=> b!138964 (= e!90554 tp_is_empty!2911)))

(declare-fun condMapEmpty!4782 () Bool)

(declare-fun mapDefault!4782 () ValueCell!1112)

(assert (=> mapNonEmpty!4779 (= condMapEmpty!4782 (= mapRest!4779 ((as const (Array (_ BitVec 32) ValueCell!1112)) mapDefault!4782)))))

(assert (=> mapNonEmpty!4779 (= tp!11457 (and e!90554 mapRes!4782))))

(declare-fun mapNonEmpty!4782 () Bool)

(declare-fun tp!11460 () Bool)

(declare-fun e!90553 () Bool)

(assert (=> mapNonEmpty!4782 (= mapRes!4782 (and tp!11460 e!90553))))

(declare-fun mapRest!4782 () (Array (_ BitVec 32) ValueCell!1112))

(declare-fun mapKey!4782 () (_ BitVec 32))

(declare-fun mapValue!4782 () ValueCell!1112)

(assert (=> mapNonEmpty!4782 (= mapRest!4779 (store mapRest!4782 mapKey!4782 mapValue!4782))))

(declare-fun b!138963 () Bool)

(assert (=> b!138963 (= e!90553 tp_is_empty!2911)))

(assert (= (and mapNonEmpty!4779 condMapEmpty!4782) mapIsEmpty!4782))

(assert (= (and mapNonEmpty!4779 (not condMapEmpty!4782)) mapNonEmpty!4782))

(assert (= (and mapNonEmpty!4782 ((_ is ValueCellFull!1112) mapValue!4782)) b!138963))

(assert (= (and mapNonEmpty!4779 ((_ is ValueCellFull!1112) mapDefault!4782)) b!138964))

(declare-fun m!166235 () Bool)

(assert (=> mapNonEmpty!4782 m!166235))

(declare-fun b_lambda!6229 () Bool)

(assert (= b_lambda!6219 (or (and b!138240 b_free!2989 (= (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) (defaultEntry!2918 newMap!16))) (and b!138229 b_free!2991) b_lambda!6229)))

(declare-fun b_lambda!6231 () Bool)

(assert (= b_lambda!6217 (or (and b!138240 b_free!2989 (= (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) (defaultEntry!2918 newMap!16))) (and b!138229 b_free!2991) b_lambda!6231)))

(declare-fun b_lambda!6233 () Bool)

(assert (= b_lambda!6225 (or (and b!138240 b_free!2989) (and b!138229 b_free!2991 (= (defaultEntry!2918 newMap!16) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))))) b_lambda!6233)))

(declare-fun b_lambda!6235 () Bool)

(assert (= b_lambda!6221 (or (and b!138240 b_free!2989 (= (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) (defaultEntry!2918 newMap!16))) (and b!138229 b_free!2991) b_lambda!6235)))

(declare-fun b_lambda!6237 () Bool)

(assert (= b_lambda!6223 (or (and b!138240 b_free!2989 (= (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))) (defaultEntry!2918 newMap!16))) (and b!138229 b_free!2991) b_lambda!6237)))

(declare-fun b_lambda!6239 () Bool)

(assert (= b_lambda!6227 (or (and b!138240 b_free!2989) (and b!138229 b_free!2991 (= (defaultEntry!2918 newMap!16) (defaultEntry!2918 (v!3254 (underlying!471 thiss!992))))) b_lambda!6239)))

(check-sat (not bm!15256) (not mapNonEmpty!4781) (not b!138738) (not d!43401) (not b!138847) (not d!43457) (not bm!15296) (not b_next!2991) (not d!43453) (not b!138604) (not b!138943) (not bm!15262) (not d!43389) (not b!138818) (not b_next!2989) (not d!43465) (not b_lambda!6235) (not b!138824) (not d!43445) (not d!43391) (not b!138727) (not b!138806) (not b!138828) (not b!138883) (not b!138779) (not b!138944) (not bm!15284) (not d!43371) (not b!138629) (not b!138888) (not b!138667) (not b!138659) (not b!138896) (not d!43405) (not b!138848) (not d!43397) (not b!138664) (not d!43439) (not b!138960) (not d!43377) (not b!138833) (not bm!15272) (not b_lambda!6237) (not b!138955) (not b!138602) (not bm!15269) (not d!43379) (not b!138857) (not bm!15277) (not bm!15270) (not b!138695) (not b!138749) (not d!43447) (not b!138805) (not b!138775) (not b!138830) (not b!138937) (not d!43409) (not b!138772) (not b!138716) (not d!43393) (not b!138780) (not b!138950) (not b!138771) (not b!138675) (not bm!15283) (not b!138740) (not d!43423) (not d!43369) (not d!43483) (not b!138724) (not b!138674) (not b!138769) (not b!138858) (not b!138752) (not d!43481) (not d!43431) (not d!43419) (not bm!15308) (not b!138889) (not b!138941) (not b_lambda!6233) (not mapNonEmpty!4782) (not d!43491) (not d!43469) (not b!138886) (not bm!15257) (not bm!15281) (not b!138683) (not b_lambda!6211) (not b!138773) (not b!138759) (not d!43451) (not b!138956) (not b_lambda!6231) (not b!138687) tp_is_empty!2911 (not b!138753) (not b!138666) (not d!43455) (not b!138826) (not b!138731) (not b!138702) (not b!138894) (not b!138720) (not b!138745) (not b!138761) (not b_lambda!6215) (not b_lambda!6239) (not b!138699) (not b!138703) (not bm!15290) (not b!138899) (not bm!15286) (not d!43411) (not b!138809) (not d!43467) (not d!43429) (not bm!15305) (not b!138690) (not bm!15274) (not b!138735) (not bm!15276) (not b!138954) (not b!138810) (not d!43403) b_and!8661 (not b!138885) (not b!138786) (not d!43461) (not b!138603) (not b!138831) (not d!43471) (not d!43381) (not bm!15267) (not bm!15265) (not b!138895) (not b!138631) (not bm!15263) (not b!138748) (not b!138797) (not b!138732) (not d!43433) (not d!43417) (not b!138728) (not d!43395) (not bm!15279) (not bm!15260) (not b!138686) (not b!138884) (not b!138669) (not b!138662) (not b!138846) (not d!43415) (not d!43449) (not b!138813) (not b!138682) (not bm!15307) (not b_lambda!6229) (not b!138679) (not b!138953) (not b!138693) (not b!138796) (not b!138901) (not d!43473) (not b!138951) (not d!43463) (not d!43475) (not b!138816) (not b!138776) (not b!138647) (not d!43485) (not d!43493) (not b!138897) (not b!138630) b_and!8663 (not b!138959) (not b!138778) (not b!138843) (not d!43399) (not bm!15261) (not d!43413) (not b!138844) (not bm!15288) (not b!138756) (not d!43425) (not bm!15293) (not b!138890) (not b!138802) (not d!43489) (not b!138958) (not b!138767) (not b!138849) (not d!43459) (not b!138705))
(check-sat b_and!8661 b_and!8663 (not b_next!2989) (not b_next!2991))
