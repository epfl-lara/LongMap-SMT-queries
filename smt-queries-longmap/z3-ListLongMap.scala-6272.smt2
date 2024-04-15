; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80236 () Bool)

(assert start!80236)

(declare-fun b!942378 () Bool)

(declare-fun b_free!17953 () Bool)

(declare-fun b_next!17953 () Bool)

(assert (=> b!942378 (= b_free!17953 (not b_next!17953))))

(declare-fun tp!62366 () Bool)

(declare-fun b_and!29339 () Bool)

(assert (=> b!942378 (= tp!62366 b_and!29339)))

(declare-fun mapIsEmpty!32513 () Bool)

(declare-fun mapRes!32513 () Bool)

(assert (=> mapIsEmpty!32513 mapRes!32513))

(declare-fun b!942368 () Bool)

(declare-fun e!529841 () Bool)

(declare-fun tp_is_empty!20461 () Bool)

(assert (=> b!942368 (= e!529841 tp_is_empty!20461)))

(declare-fun b!942369 () Bool)

(declare-fun res!633290 () Bool)

(declare-fun e!529842 () Bool)

(assert (=> b!942369 (=> (not res!633290) (not e!529842))))

(declare-datatypes ((V!32247 0))(
  ( (V!32248 (val!10281 Int)) )
))
(declare-datatypes ((ValueCell!9749 0))(
  ( (ValueCellFull!9749 (v!12811 V!32247)) (EmptyCell!9749) )
))
(declare-datatypes ((array!56853 0))(
  ( (array!56854 (arr!27353 (Array (_ BitVec 32) ValueCell!9749)) (size!27820 (_ BitVec 32))) )
))
(declare-datatypes ((array!56855 0))(
  ( (array!56856 (arr!27354 (Array (_ BitVec 32) (_ BitVec 64))) (size!27821 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4648 0))(
  ( (LongMapFixedSize!4649 (defaultEntry!5615 Int) (mask!27220 (_ BitVec 32)) (extraKeys!5347 (_ BitVec 32)) (zeroValue!5451 V!32247) (minValue!5451 V!32247) (_size!2379 (_ BitVec 32)) (_keys!10484 array!56855) (_values!5638 array!56853) (_vacant!2379 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4648)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13456 0))(
  ( (tuple2!13457 (_1!6739 (_ BitVec 64)) (_2!6739 V!32247)) )
))
(declare-datatypes ((List!19226 0))(
  ( (Nil!19223) (Cons!19222 (h!20372 tuple2!13456) (t!27532 List!19226)) )
))
(declare-datatypes ((ListLongMap!12143 0))(
  ( (ListLongMap!12144 (toList!6087 List!19226)) )
))
(declare-fun contains!5100 (ListLongMap!12143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3250 (array!56855 array!56853 (_ BitVec 32) (_ BitVec 32) V!32247 V!32247 (_ BitVec 32) Int) ListLongMap!12143)

(assert (=> b!942369 (= res!633290 (contains!5100 (getCurrentListMap!3250 (_keys!10484 thiss!1141) (_values!5638 thiss!1141) (mask!27220 thiss!1141) (extraKeys!5347 thiss!1141) (zeroValue!5451 thiss!1141) (minValue!5451 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5615 thiss!1141)) key!756))))

(declare-fun b!942370 () Bool)

(declare-fun e!529840 () Bool)

(declare-fun e!529844 () Bool)

(assert (=> b!942370 (= e!529840 (and e!529844 mapRes!32513))))

(declare-fun condMapEmpty!32513 () Bool)

(declare-fun mapDefault!32513 () ValueCell!9749)

(assert (=> b!942370 (= condMapEmpty!32513 (= (arr!27353 (_values!5638 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9749)) mapDefault!32513)))))

(declare-fun mapNonEmpty!32513 () Bool)

(declare-fun tp!62365 () Bool)

(assert (=> mapNonEmpty!32513 (= mapRes!32513 (and tp!62365 e!529841))))

(declare-fun mapValue!32513 () ValueCell!9749)

(declare-fun mapKey!32513 () (_ BitVec 32))

(declare-fun mapRest!32513 () (Array (_ BitVec 32) ValueCell!9749))

(assert (=> mapNonEmpty!32513 (= (arr!27353 (_values!5638 thiss!1141)) (store mapRest!32513 mapKey!32513 mapValue!32513))))

(declare-fun b!942371 () Bool)

(assert (=> b!942371 (= e!529844 tp_is_empty!20461)))

(declare-fun b!942372 () Bool)

(declare-fun res!633285 () Bool)

(assert (=> b!942372 (=> (not res!633285) (not e!529842))))

(assert (=> b!942372 (= res!633285 (and (= (size!27820 (_values!5638 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27220 thiss!1141))) (= (size!27821 (_keys!10484 thiss!1141)) (size!27820 (_values!5638 thiss!1141))) (bvsge (mask!27220 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5347 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5347 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942373 () Bool)

(declare-fun res!633291 () Bool)

(assert (=> b!942373 (=> (not res!633291) (not e!529842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56855 (_ BitVec 32)) Bool)

(assert (=> b!942373 (= res!633291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10484 thiss!1141) (mask!27220 thiss!1141)))))

(declare-fun b!942374 () Bool)

(declare-fun res!633289 () Bool)

(assert (=> b!942374 (=> (not res!633289) (not e!529842))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9035 0))(
  ( (MissingZero!9035 (index!38511 (_ BitVec 32))) (Found!9035 (index!38512 (_ BitVec 32))) (Intermediate!9035 (undefined!9847 Bool) (index!38513 (_ BitVec 32)) (x!80935 (_ BitVec 32))) (Undefined!9035) (MissingVacant!9035 (index!38514 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56855 (_ BitVec 32)) SeekEntryResult!9035)

(assert (=> b!942374 (= res!633289 (not ((_ is Found!9035) (seekEntry!0 key!756 (_keys!10484 thiss!1141) (mask!27220 thiss!1141)))))))

(declare-fun b!942375 () Bool)

(declare-fun res!633288 () Bool)

(assert (=> b!942375 (=> (not res!633288) (not e!529842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942375 (= res!633288 (validMask!0 (mask!27220 thiss!1141)))))

(declare-fun b!942376 () Bool)

(declare-fun res!633286 () Bool)

(assert (=> b!942376 (=> (not res!633286) (not e!529842))))

(assert (=> b!942376 (= res!633286 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!633287 () Bool)

(assert (=> start!80236 (=> (not res!633287) (not e!529842))))

(declare-fun valid!1789 (LongMapFixedSize!4648) Bool)

(assert (=> start!80236 (= res!633287 (valid!1789 thiss!1141))))

(assert (=> start!80236 e!529842))

(declare-fun e!529839 () Bool)

(assert (=> start!80236 e!529839))

(assert (=> start!80236 true))

(declare-fun b!942377 () Bool)

(assert (=> b!942377 (= e!529842 false)))

(declare-fun lt!424943 () Bool)

(declare-datatypes ((List!19227 0))(
  ( (Nil!19224) (Cons!19223 (h!20373 (_ BitVec 64)) (t!27533 List!19227)) )
))
(declare-fun arrayNoDuplicates!0 (array!56855 (_ BitVec 32) List!19227) Bool)

(assert (=> b!942377 (= lt!424943 (arrayNoDuplicates!0 (_keys!10484 thiss!1141) #b00000000000000000000000000000000 Nil!19224))))

(declare-fun array_inv!21322 (array!56855) Bool)

(declare-fun array_inv!21323 (array!56853) Bool)

(assert (=> b!942378 (= e!529839 (and tp!62366 tp_is_empty!20461 (array_inv!21322 (_keys!10484 thiss!1141)) (array_inv!21323 (_values!5638 thiss!1141)) e!529840))))

(assert (= (and start!80236 res!633287) b!942376))

(assert (= (and b!942376 res!633286) b!942374))

(assert (= (and b!942374 res!633289) b!942369))

(assert (= (and b!942369 res!633290) b!942375))

(assert (= (and b!942375 res!633288) b!942372))

(assert (= (and b!942372 res!633285) b!942373))

(assert (= (and b!942373 res!633291) b!942377))

(assert (= (and b!942370 condMapEmpty!32513) mapIsEmpty!32513))

(assert (= (and b!942370 (not condMapEmpty!32513)) mapNonEmpty!32513))

(assert (= (and mapNonEmpty!32513 ((_ is ValueCellFull!9749) mapValue!32513)) b!942368))

(assert (= (and b!942370 ((_ is ValueCellFull!9749) mapDefault!32513)) b!942371))

(assert (= b!942378 b!942370))

(assert (= start!80236 b!942378))

(declare-fun m!876341 () Bool)

(assert (=> mapNonEmpty!32513 m!876341))

(declare-fun m!876343 () Bool)

(assert (=> b!942373 m!876343))

(declare-fun m!876345 () Bool)

(assert (=> b!942374 m!876345))

(declare-fun m!876347 () Bool)

(assert (=> b!942369 m!876347))

(assert (=> b!942369 m!876347))

(declare-fun m!876349 () Bool)

(assert (=> b!942369 m!876349))

(declare-fun m!876351 () Bool)

(assert (=> b!942377 m!876351))

(declare-fun m!876353 () Bool)

(assert (=> start!80236 m!876353))

(declare-fun m!876355 () Bool)

(assert (=> b!942378 m!876355))

(declare-fun m!876357 () Bool)

(assert (=> b!942378 m!876357))

(declare-fun m!876359 () Bool)

(assert (=> b!942375 m!876359))

(check-sat (not b!942378) (not start!80236) tp_is_empty!20461 (not b!942377) (not b!942374) (not b!942375) (not b_next!17953) b_and!29339 (not b!942369) (not mapNonEmpty!32513) (not b!942373))
(check-sat b_and!29339 (not b_next!17953))
