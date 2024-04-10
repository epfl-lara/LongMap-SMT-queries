; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80298 () Bool)

(assert start!80298)

(declare-fun b!943336 () Bool)

(declare-fun b_free!17997 () Bool)

(declare-fun b_next!17997 () Bool)

(assert (=> b!943336 (= b_free!17997 (not b_next!17997))))

(declare-fun tp!62496 () Bool)

(declare-fun b_and!29409 () Bool)

(assert (=> b!943336 (= tp!62496 b_and!29409)))

(declare-fun b!943333 () Bool)

(declare-fun res!633861 () Bool)

(declare-fun e!530385 () Bool)

(assert (=> b!943333 (=> (not res!633861) (not e!530385))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!943333 (= res!633861 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943334 () Bool)

(declare-fun e!530387 () Bool)

(declare-fun tp_is_empty!20505 () Bool)

(assert (=> b!943334 (= e!530387 tp_is_empty!20505)))

(declare-fun b!943335 () Bool)

(declare-fun res!633858 () Bool)

(assert (=> b!943335 (=> (not res!633858) (not e!530385))))

(declare-datatypes ((V!32305 0))(
  ( (V!32306 (val!10303 Int)) )
))
(declare-datatypes ((ValueCell!9771 0))(
  ( (ValueCellFull!9771 (v!12834 V!32305)) (EmptyCell!9771) )
))
(declare-datatypes ((array!56976 0))(
  ( (array!56977 (arr!27414 (Array (_ BitVec 32) ValueCell!9771)) (size!27879 (_ BitVec 32))) )
))
(declare-datatypes ((array!56978 0))(
  ( (array!56979 (arr!27415 (Array (_ BitVec 32) (_ BitVec 64))) (size!27880 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4692 0))(
  ( (LongMapFixedSize!4693 (defaultEntry!5637 Int) (mask!27263 (_ BitVec 32)) (extraKeys!5369 (_ BitVec 32)) (zeroValue!5473 V!32305) (minValue!5473 V!32305) (_size!2401 (_ BitVec 32)) (_keys!10511 array!56978) (_values!5660 array!56976) (_vacant!2401 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4692)

(assert (=> b!943335 (= res!633858 (and (= (size!27879 (_values!5660 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27263 thiss!1141))) (= (size!27880 (_keys!10511 thiss!1141)) (size!27879 (_values!5660 thiss!1141))) (bvsge (mask!27263 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5369 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5369 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun e!530384 () Bool)

(declare-fun e!530386 () Bool)

(declare-fun array_inv!21302 (array!56978) Bool)

(declare-fun array_inv!21303 (array!56976) Bool)

(assert (=> b!943336 (= e!530386 (and tp!62496 tp_is_empty!20505 (array_inv!21302 (_keys!10511 thiss!1141)) (array_inv!21303 (_values!5660 thiss!1141)) e!530384))))

(declare-fun mapNonEmpty!32579 () Bool)

(declare-fun mapRes!32579 () Bool)

(declare-fun tp!62497 () Bool)

(assert (=> mapNonEmpty!32579 (= mapRes!32579 (and tp!62497 e!530387))))

(declare-fun mapValue!32579 () ValueCell!9771)

(declare-fun mapRest!32579 () (Array (_ BitVec 32) ValueCell!9771))

(declare-fun mapKey!32579 () (_ BitVec 32))

(assert (=> mapNonEmpty!32579 (= (arr!27414 (_values!5660 thiss!1141)) (store mapRest!32579 mapKey!32579 mapValue!32579))))

(declare-fun b!943337 () Bool)

(declare-fun res!633860 () Bool)

(assert (=> b!943337 (=> (not res!633860) (not e!530385))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9049 0))(
  ( (MissingZero!9049 (index!38567 (_ BitVec 32))) (Found!9049 (index!38568 (_ BitVec 32))) (Intermediate!9049 (undefined!9861 Bool) (index!38569 (_ BitVec 32)) (x!81010 (_ BitVec 32))) (Undefined!9049) (MissingVacant!9049 (index!38570 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56978 (_ BitVec 32)) SeekEntryResult!9049)

(assert (=> b!943337 (= res!633860 (not ((_ is Found!9049) (seekEntry!0 key!756 (_keys!10511 thiss!1141) (mask!27263 thiss!1141)))))))

(declare-fun b!943338 () Bool)

(assert (=> b!943338 (= e!530385 false)))

(declare-fun lt!425245 () Bool)

(declare-datatypes ((List!19247 0))(
  ( (Nil!19244) (Cons!19243 (h!20393 (_ BitVec 64)) (t!27562 List!19247)) )
))
(declare-fun arrayNoDuplicates!0 (array!56978 (_ BitVec 32) List!19247) Bool)

(assert (=> b!943338 (= lt!425245 (arrayNoDuplicates!0 (_keys!10511 thiss!1141) #b00000000000000000000000000000000 Nil!19244))))

(declare-fun mapIsEmpty!32579 () Bool)

(assert (=> mapIsEmpty!32579 mapRes!32579))

(declare-fun b!943339 () Bool)

(declare-fun res!633863 () Bool)

(assert (=> b!943339 (=> (not res!633863) (not e!530385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943339 (= res!633863 (validMask!0 (mask!27263 thiss!1141)))))

(declare-fun b!943341 () Bool)

(declare-fun res!633859 () Bool)

(assert (=> b!943341 (=> (not res!633859) (not e!530385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56978 (_ BitVec 32)) Bool)

(assert (=> b!943341 (= res!633859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10511 thiss!1141) (mask!27263 thiss!1141)))))

(declare-fun b!943342 () Bool)

(declare-fun res!633862 () Bool)

(assert (=> b!943342 (=> (not res!633862) (not e!530385))))

(declare-datatypes ((tuple2!13436 0))(
  ( (tuple2!13437 (_1!6729 (_ BitVec 64)) (_2!6729 V!32305)) )
))
(declare-datatypes ((List!19248 0))(
  ( (Nil!19245) (Cons!19244 (h!20394 tuple2!13436) (t!27563 List!19248)) )
))
(declare-datatypes ((ListLongMap!12133 0))(
  ( (ListLongMap!12134 (toList!6082 List!19248)) )
))
(declare-fun contains!5152 (ListLongMap!12133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3316 (array!56978 array!56976 (_ BitVec 32) (_ BitVec 32) V!32305 V!32305 (_ BitVec 32) Int) ListLongMap!12133)

(assert (=> b!943342 (= res!633862 (contains!5152 (getCurrentListMap!3316 (_keys!10511 thiss!1141) (_values!5660 thiss!1141) (mask!27263 thiss!1141) (extraKeys!5369 thiss!1141) (zeroValue!5473 thiss!1141) (minValue!5473 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5637 thiss!1141)) key!756))))

(declare-fun b!943343 () Bool)

(declare-fun e!530383 () Bool)

(assert (=> b!943343 (= e!530383 tp_is_empty!20505)))

(declare-fun b!943340 () Bool)

(assert (=> b!943340 (= e!530384 (and e!530383 mapRes!32579))))

(declare-fun condMapEmpty!32579 () Bool)

(declare-fun mapDefault!32579 () ValueCell!9771)

(assert (=> b!943340 (= condMapEmpty!32579 (= (arr!27414 (_values!5660 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9771)) mapDefault!32579)))))

(declare-fun res!633857 () Bool)

(assert (=> start!80298 (=> (not res!633857) (not e!530385))))

(declare-fun valid!1793 (LongMapFixedSize!4692) Bool)

(assert (=> start!80298 (= res!633857 (valid!1793 thiss!1141))))

(assert (=> start!80298 e!530385))

(assert (=> start!80298 e!530386))

(assert (=> start!80298 true))

(assert (= (and start!80298 res!633857) b!943333))

(assert (= (and b!943333 res!633861) b!943337))

(assert (= (and b!943337 res!633860) b!943342))

(assert (= (and b!943342 res!633862) b!943339))

(assert (= (and b!943339 res!633863) b!943335))

(assert (= (and b!943335 res!633858) b!943341))

(assert (= (and b!943341 res!633859) b!943338))

(assert (= (and b!943340 condMapEmpty!32579) mapIsEmpty!32579))

(assert (= (and b!943340 (not condMapEmpty!32579)) mapNonEmpty!32579))

(assert (= (and mapNonEmpty!32579 ((_ is ValueCellFull!9771) mapValue!32579)) b!943334))

(assert (= (and b!943340 ((_ is ValueCellFull!9771) mapDefault!32579)) b!943343))

(assert (= b!943336 b!943340))

(assert (= start!80298 b!943336))

(declare-fun m!877539 () Bool)

(assert (=> b!943338 m!877539))

(declare-fun m!877541 () Bool)

(assert (=> start!80298 m!877541))

(declare-fun m!877543 () Bool)

(assert (=> b!943336 m!877543))

(declare-fun m!877545 () Bool)

(assert (=> b!943336 m!877545))

(declare-fun m!877547 () Bool)

(assert (=> b!943337 m!877547))

(declare-fun m!877549 () Bool)

(assert (=> mapNonEmpty!32579 m!877549))

(declare-fun m!877551 () Bool)

(assert (=> b!943339 m!877551))

(declare-fun m!877553 () Bool)

(assert (=> b!943342 m!877553))

(assert (=> b!943342 m!877553))

(declare-fun m!877555 () Bool)

(assert (=> b!943342 m!877555))

(declare-fun m!877557 () Bool)

(assert (=> b!943341 m!877557))

(check-sat b_and!29409 (not mapNonEmpty!32579) (not b!943341) (not b_next!17997) (not b!943337) (not b!943338) (not b!943342) (not b!943339) (not b!943336) (not start!80298) tp_is_empty!20505)
(check-sat b_and!29409 (not b_next!17997))
