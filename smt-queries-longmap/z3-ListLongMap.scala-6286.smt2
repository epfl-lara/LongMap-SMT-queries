; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80396 () Bool)

(assert start!80396)

(declare-fun b!944269 () Bool)

(declare-fun b_free!18039 () Bool)

(declare-fun b_next!18039 () Bool)

(assert (=> b!944269 (= b_free!18039 (not b_next!18039))))

(declare-fun tp!62627 () Bool)

(declare-fun b_and!29457 () Bool)

(assert (=> b!944269 (= tp!62627 b_and!29457)))

(declare-fun res!634345 () Bool)

(declare-fun e!530991 () Bool)

(assert (=> start!80396 (=> (not res!634345) (not e!530991))))

(declare-datatypes ((V!32361 0))(
  ( (V!32362 (val!10324 Int)) )
))
(declare-datatypes ((ValueCell!9792 0))(
  ( (ValueCellFull!9792 (v!12856 V!32361)) (EmptyCell!9792) )
))
(declare-datatypes ((array!57062 0))(
  ( (array!57063 (arr!27456 (Array (_ BitVec 32) ValueCell!9792)) (size!27922 (_ BitVec 32))) )
))
(declare-datatypes ((array!57064 0))(
  ( (array!57065 (arr!27457 (Array (_ BitVec 32) (_ BitVec 64))) (size!27923 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4734 0))(
  ( (LongMapFixedSize!4735 (defaultEntry!5662 Int) (mask!27308 (_ BitVec 32)) (extraKeys!5394 (_ BitVec 32)) (zeroValue!5498 V!32361) (minValue!5498 V!32361) (_size!2422 (_ BitVec 32)) (_keys!10540 array!57064) (_values!5685 array!57062) (_vacant!2422 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4734)

(declare-fun valid!1810 (LongMapFixedSize!4734) Bool)

(assert (=> start!80396 (= res!634345 (valid!1810 thiss!1141))))

(assert (=> start!80396 e!530991))

(declare-fun e!530990 () Bool)

(assert (=> start!80396 e!530990))

(assert (=> start!80396 true))

(declare-fun b!944265 () Bool)

(declare-fun e!530986 () Bool)

(declare-fun e!530987 () Bool)

(declare-fun mapRes!32646 () Bool)

(assert (=> b!944265 (= e!530986 (and e!530987 mapRes!32646))))

(declare-fun condMapEmpty!32646 () Bool)

(declare-fun mapDefault!32646 () ValueCell!9792)

(assert (=> b!944265 (= condMapEmpty!32646 (= (arr!27456 (_values!5685 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9792)) mapDefault!32646)))))

(declare-fun b!944266 () Bool)

(declare-fun res!634344 () Bool)

(assert (=> b!944266 (=> (not res!634344) (not e!530991))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13468 0))(
  ( (tuple2!13469 (_1!6745 (_ BitVec 64)) (_2!6745 V!32361)) )
))
(declare-datatypes ((List!19268 0))(
  ( (Nil!19265) (Cons!19264 (h!20415 tuple2!13468) (t!27585 List!19268)) )
))
(declare-datatypes ((ListLongMap!12165 0))(
  ( (ListLongMap!12166 (toList!6098 List!19268)) )
))
(declare-fun contains!5170 (ListLongMap!12165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3332 (array!57064 array!57062 (_ BitVec 32) (_ BitVec 32) V!32361 V!32361 (_ BitVec 32) Int) ListLongMap!12165)

(assert (=> b!944266 (= res!634344 (contains!5170 (getCurrentListMap!3332 (_keys!10540 thiss!1141) (_values!5685 thiss!1141) (mask!27308 thiss!1141) (extraKeys!5394 thiss!1141) (zeroValue!5498 thiss!1141) (minValue!5498 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5662 thiss!1141)) key!756))))

(declare-fun b!944267 () Bool)

(declare-fun e!530989 () Bool)

(assert (=> b!944267 (= e!530989 true)))

(declare-fun lt!425575 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57064 (_ BitVec 32)) Bool)

(assert (=> b!944267 (= lt!425575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10540 thiss!1141) (mask!27308 thiss!1141)))))

(declare-fun b!944268 () Bool)

(assert (=> b!944268 (= e!530991 (not e!530989))))

(declare-fun res!634347 () Bool)

(assert (=> b!944268 (=> res!634347 e!530989)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944268 (= res!634347 (not (validMask!0 (mask!27308 thiss!1141))))))

(declare-fun lt!425576 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57064 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944268 (= lt!425576 (arrayScanForKey!0 (_keys!10540 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944268 (arrayContainsKey!0 (_keys!10540 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31840 0))(
  ( (Unit!31841) )
))
(declare-fun lt!425577 () Unit!31840)

(declare-fun lemmaKeyInListMapIsInArray!300 (array!57064 array!57062 (_ BitVec 32) (_ BitVec 32) V!32361 V!32361 (_ BitVec 64) Int) Unit!31840)

(assert (=> b!944268 (= lt!425577 (lemmaKeyInListMapIsInArray!300 (_keys!10540 thiss!1141) (_values!5685 thiss!1141) (mask!27308 thiss!1141) (extraKeys!5394 thiss!1141) (zeroValue!5498 thiss!1141) (minValue!5498 thiss!1141) key!756 (defaultEntry!5662 thiss!1141)))))

(declare-fun mapNonEmpty!32646 () Bool)

(declare-fun tp!62626 () Bool)

(declare-fun e!530992 () Bool)

(assert (=> mapNonEmpty!32646 (= mapRes!32646 (and tp!62626 e!530992))))

(declare-fun mapValue!32646 () ValueCell!9792)

(declare-fun mapKey!32646 () (_ BitVec 32))

(declare-fun mapRest!32646 () (Array (_ BitVec 32) ValueCell!9792))

(assert (=> mapNonEmpty!32646 (= (arr!27456 (_values!5685 thiss!1141)) (store mapRest!32646 mapKey!32646 mapValue!32646))))

(declare-fun mapIsEmpty!32646 () Bool)

(assert (=> mapIsEmpty!32646 mapRes!32646))

(declare-fun tp_is_empty!20547 () Bool)

(declare-fun array_inv!21332 (array!57064) Bool)

(declare-fun array_inv!21333 (array!57062) Bool)

(assert (=> b!944269 (= e!530990 (and tp!62627 tp_is_empty!20547 (array_inv!21332 (_keys!10540 thiss!1141)) (array_inv!21333 (_values!5685 thiss!1141)) e!530986))))

(declare-fun b!944270 () Bool)

(declare-fun res!634343 () Bool)

(assert (=> b!944270 (=> (not res!634343) (not e!530991))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9063 0))(
  ( (MissingZero!9063 (index!38623 (_ BitVec 32))) (Found!9063 (index!38624 (_ BitVec 32))) (Intermediate!9063 (undefined!9875 Bool) (index!38625 (_ BitVec 32)) (x!81098 (_ BitVec 32))) (Undefined!9063) (MissingVacant!9063 (index!38626 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57064 (_ BitVec 32)) SeekEntryResult!9063)

(assert (=> b!944270 (= res!634343 (not ((_ is Found!9063) (seekEntry!0 key!756 (_keys!10540 thiss!1141) (mask!27308 thiss!1141)))))))

(declare-fun b!944271 () Bool)

(declare-fun res!634342 () Bool)

(assert (=> b!944271 (=> (not res!634342) (not e!530991))))

(assert (=> b!944271 (= res!634342 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944272 () Bool)

(declare-fun res!634346 () Bool)

(assert (=> b!944272 (=> res!634346 e!530989)))

(assert (=> b!944272 (= res!634346 (or (not (= (size!27923 (_keys!10540 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27308 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27923 (_keys!10540 thiss!1141))) (bvslt lt!425576 #b00000000000000000000000000000000) (bvsgt lt!425576 (size!27923 (_keys!10540 thiss!1141)))))))

(declare-fun b!944273 () Bool)

(assert (=> b!944273 (= e!530992 tp_is_empty!20547)))

(declare-fun b!944274 () Bool)

(assert (=> b!944274 (= e!530987 tp_is_empty!20547)))

(assert (= (and start!80396 res!634345) b!944271))

(assert (= (and b!944271 res!634342) b!944270))

(assert (= (and b!944270 res!634343) b!944266))

(assert (= (and b!944266 res!634344) b!944268))

(assert (= (and b!944268 (not res!634347)) b!944272))

(assert (= (and b!944272 (not res!634346)) b!944267))

(assert (= (and b!944265 condMapEmpty!32646) mapIsEmpty!32646))

(assert (= (and b!944265 (not condMapEmpty!32646)) mapNonEmpty!32646))

(assert (= (and mapNonEmpty!32646 ((_ is ValueCellFull!9792) mapValue!32646)) b!944273))

(assert (= (and b!944265 ((_ is ValueCellFull!9792) mapDefault!32646)) b!944274))

(assert (= b!944269 b!944265))

(assert (= start!80396 b!944269))

(declare-fun m!878301 () Bool)

(assert (=> b!944270 m!878301))

(declare-fun m!878303 () Bool)

(assert (=> start!80396 m!878303))

(declare-fun m!878305 () Bool)

(assert (=> b!944267 m!878305))

(declare-fun m!878307 () Bool)

(assert (=> b!944266 m!878307))

(assert (=> b!944266 m!878307))

(declare-fun m!878309 () Bool)

(assert (=> b!944266 m!878309))

(declare-fun m!878311 () Bool)

(assert (=> b!944268 m!878311))

(declare-fun m!878313 () Bool)

(assert (=> b!944268 m!878313))

(declare-fun m!878315 () Bool)

(assert (=> b!944268 m!878315))

(declare-fun m!878317 () Bool)

(assert (=> b!944268 m!878317))

(declare-fun m!878319 () Bool)

(assert (=> mapNonEmpty!32646 m!878319))

(declare-fun m!878321 () Bool)

(assert (=> b!944269 m!878321))

(declare-fun m!878323 () Bool)

(assert (=> b!944269 m!878323))

(check-sat (not b!944267) (not b_next!18039) (not b!944269) (not b!944270) b_and!29457 (not b!944268) (not b!944266) tp_is_empty!20547 (not start!80396) (not mapNonEmpty!32646))
(check-sat b_and!29457 (not b_next!18039))
