; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80526 () Bool)

(assert start!80526)

(declare-fun b!945578 () Bool)

(declare-fun b_free!18105 () Bool)

(declare-fun b_next!18105 () Bool)

(assert (=> b!945578 (= b_free!18105 (not b_next!18105))))

(declare-fun tp!62835 () Bool)

(declare-fun b_and!29527 () Bool)

(assert (=> b!945578 (= tp!62835 b_and!29527)))

(declare-fun mapNonEmpty!32756 () Bool)

(declare-fun mapRes!32756 () Bool)

(declare-fun tp!62836 () Bool)

(declare-fun e!531869 () Bool)

(assert (=> mapNonEmpty!32756 (= mapRes!32756 (and tp!62836 e!531869))))

(declare-fun mapKey!32756 () (_ BitVec 32))

(declare-datatypes ((V!32449 0))(
  ( (V!32450 (val!10357 Int)) )
))
(declare-datatypes ((ValueCell!9825 0))(
  ( (ValueCellFull!9825 (v!12891 V!32449)) (EmptyCell!9825) )
))
(declare-datatypes ((array!57200 0))(
  ( (array!57201 (arr!27522 (Array (_ BitVec 32) ValueCell!9825)) (size!27990 (_ BitVec 32))) )
))
(declare-datatypes ((array!57202 0))(
  ( (array!57203 (arr!27523 (Array (_ BitVec 32) (_ BitVec 64))) (size!27991 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4800 0))(
  ( (LongMapFixedSize!4801 (defaultEntry!5697 Int) (mask!27368 (_ BitVec 32)) (extraKeys!5429 (_ BitVec 32)) (zeroValue!5533 V!32449) (minValue!5533 V!32449) (_size!2455 (_ BitVec 32)) (_keys!10578 array!57202) (_values!5720 array!57200) (_vacant!2455 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4800)

(declare-fun mapRest!32756 () (Array (_ BitVec 32) ValueCell!9825))

(declare-fun mapValue!32756 () ValueCell!9825)

(assert (=> mapNonEmpty!32756 (= (arr!27522 (_values!5720 thiss!1141)) (store mapRest!32756 mapKey!32756 mapValue!32756))))

(declare-fun b!945573 () Bool)

(declare-fun e!531868 () Bool)

(declare-datatypes ((SeekEntryResult!9089 0))(
  ( (MissingZero!9089 (index!38727 (_ BitVec 32))) (Found!9089 (index!38728 (_ BitVec 32))) (Intermediate!9089 (undefined!9901 Bool) (index!38729 (_ BitVec 32)) (x!81252 (_ BitVec 32))) (Undefined!9089) (MissingVacant!9089 (index!38730 (_ BitVec 32))) )
))
(declare-fun lt!426051 () SeekEntryResult!9089)

(get-info :version)

(assert (=> b!945573 (= e!531868 (and ((_ is Found!9089) lt!426051) (bvsge (index!38728 lt!426051) #b00000000000000000000000000000000) (bvsge (index!38728 lt!426051) (size!27991 (_keys!10578 thiss!1141)))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57202 (_ BitVec 32)) SeekEntryResult!9089)

(assert (=> b!945573 (= lt!426051 (seekEntry!0 key!756 (_keys!10578 thiss!1141) (mask!27368 thiss!1141)))))

(declare-fun b!945574 () Bool)

(declare-fun tp_is_empty!20613 () Bool)

(assert (=> b!945574 (= e!531869 tp_is_empty!20613)))

(declare-fun b!945575 () Bool)

(declare-fun e!531872 () Bool)

(assert (=> b!945575 (= e!531872 tp_is_empty!20613)))

(declare-fun res!635031 () Bool)

(assert (=> start!80526 (=> (not res!635031) (not e!531868))))

(declare-fun valid!1834 (LongMapFixedSize!4800) Bool)

(assert (=> start!80526 (= res!635031 (valid!1834 thiss!1141))))

(assert (=> start!80526 e!531868))

(declare-fun e!531871 () Bool)

(assert (=> start!80526 e!531871))

(assert (=> start!80526 true))

(declare-fun mapIsEmpty!32756 () Bool)

(assert (=> mapIsEmpty!32756 mapRes!32756))

(declare-fun b!945576 () Bool)

(declare-fun e!531867 () Bool)

(assert (=> b!945576 (= e!531867 (and e!531872 mapRes!32756))))

(declare-fun condMapEmpty!32756 () Bool)

(declare-fun mapDefault!32756 () ValueCell!9825)

(assert (=> b!945576 (= condMapEmpty!32756 (= (arr!27522 (_values!5720 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9825)) mapDefault!32756)))))

(declare-fun b!945577 () Bool)

(declare-fun res!635030 () Bool)

(assert (=> b!945577 (=> (not res!635030) (not e!531868))))

(assert (=> b!945577 (= res!635030 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!21378 (array!57202) Bool)

(declare-fun array_inv!21379 (array!57200) Bool)

(assert (=> b!945578 (= e!531871 (and tp!62835 tp_is_empty!20613 (array_inv!21378 (_keys!10578 thiss!1141)) (array_inv!21379 (_values!5720 thiss!1141)) e!531867))))

(assert (= (and start!80526 res!635031) b!945577))

(assert (= (and b!945577 res!635030) b!945573))

(assert (= (and b!945576 condMapEmpty!32756) mapIsEmpty!32756))

(assert (= (and b!945576 (not condMapEmpty!32756)) mapNonEmpty!32756))

(assert (= (and mapNonEmpty!32756 ((_ is ValueCellFull!9825) mapValue!32756)) b!945574))

(assert (= (and b!945576 ((_ is ValueCellFull!9825) mapDefault!32756)) b!945575))

(assert (= b!945578 b!945576))

(assert (= start!80526 b!945578))

(declare-fun m!879329 () Bool)

(assert (=> mapNonEmpty!32756 m!879329))

(declare-fun m!879331 () Bool)

(assert (=> b!945573 m!879331))

(declare-fun m!879333 () Bool)

(assert (=> start!80526 m!879333))

(declare-fun m!879335 () Bool)

(assert (=> b!945578 m!879335))

(declare-fun m!879337 () Bool)

(assert (=> b!945578 m!879337))

(check-sat (not b!945578) (not mapNonEmpty!32756) b_and!29527 (not start!80526) (not b!945573) (not b_next!18105) tp_is_empty!20613)
(check-sat b_and!29527 (not b_next!18105))
(get-model)

(declare-fun d!114415 () Bool)

(assert (=> d!114415 (= (array_inv!21378 (_keys!10578 thiss!1141)) (bvsge (size!27991 (_keys!10578 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945578 d!114415))

(declare-fun d!114417 () Bool)

(assert (=> d!114417 (= (array_inv!21379 (_values!5720 thiss!1141)) (bvsge (size!27990 (_values!5720 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945578 d!114417))

(declare-fun b!945609 () Bool)

(declare-fun e!531899 () SeekEntryResult!9089)

(declare-fun lt!426065 () SeekEntryResult!9089)

(assert (=> b!945609 (= e!531899 (MissingZero!9089 (index!38729 lt!426065)))))

(declare-fun b!945610 () Bool)

(declare-fun e!531898 () SeekEntryResult!9089)

(assert (=> b!945610 (= e!531898 (Found!9089 (index!38729 lt!426065)))))

(declare-fun d!114419 () Bool)

(declare-fun lt!426063 () SeekEntryResult!9089)

(assert (=> d!114419 (and (or ((_ is MissingVacant!9089) lt!426063) (not ((_ is Found!9089) lt!426063)) (and (bvsge (index!38728 lt!426063) #b00000000000000000000000000000000) (bvslt (index!38728 lt!426063) (size!27991 (_keys!10578 thiss!1141))))) (not ((_ is MissingVacant!9089) lt!426063)) (or (not ((_ is Found!9089) lt!426063)) (= (select (arr!27523 (_keys!10578 thiss!1141)) (index!38728 lt!426063)) key!756)))))

(declare-fun e!531897 () SeekEntryResult!9089)

(assert (=> d!114419 (= lt!426063 e!531897)))

(declare-fun c!98436 () Bool)

(assert (=> d!114419 (= c!98436 (and ((_ is Intermediate!9089) lt!426065) (undefined!9901 lt!426065)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57202 (_ BitVec 32)) SeekEntryResult!9089)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114419 (= lt!426065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27368 thiss!1141)) key!756 (_keys!10578 thiss!1141) (mask!27368 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114419 (validMask!0 (mask!27368 thiss!1141))))

(assert (=> d!114419 (= (seekEntry!0 key!756 (_keys!10578 thiss!1141) (mask!27368 thiss!1141)) lt!426063)))

(declare-fun b!945611 () Bool)

(assert (=> b!945611 (= e!531897 e!531898)))

(declare-fun lt!426066 () (_ BitVec 64))

(assert (=> b!945611 (= lt!426066 (select (arr!27523 (_keys!10578 thiss!1141)) (index!38729 lt!426065)))))

(declare-fun c!98438 () Bool)

(assert (=> b!945611 (= c!98438 (= lt!426066 key!756))))

(declare-fun b!945612 () Bool)

(assert (=> b!945612 (= e!531897 Undefined!9089)))

(declare-fun b!945613 () Bool)

(declare-fun lt!426064 () SeekEntryResult!9089)

(assert (=> b!945613 (= e!531899 (ite ((_ is MissingVacant!9089) lt!426064) (MissingZero!9089 (index!38730 lt!426064)) lt!426064))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57202 (_ BitVec 32)) SeekEntryResult!9089)

(assert (=> b!945613 (= lt!426064 (seekKeyOrZeroReturnVacant!0 (x!81252 lt!426065) (index!38729 lt!426065) (index!38729 lt!426065) key!756 (_keys!10578 thiss!1141) (mask!27368 thiss!1141)))))

(declare-fun b!945614 () Bool)

(declare-fun c!98437 () Bool)

(assert (=> b!945614 (= c!98437 (= lt!426066 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!945614 (= e!531898 e!531899)))

(assert (= (and d!114419 c!98436) b!945612))

(assert (= (and d!114419 (not c!98436)) b!945611))

(assert (= (and b!945611 c!98438) b!945610))

(assert (= (and b!945611 (not c!98438)) b!945614))

(assert (= (and b!945614 c!98437) b!945609))

(assert (= (and b!945614 (not c!98437)) b!945613))

(declare-fun m!879349 () Bool)

(assert (=> d!114419 m!879349))

(declare-fun m!879351 () Bool)

(assert (=> d!114419 m!879351))

(assert (=> d!114419 m!879351))

(declare-fun m!879353 () Bool)

(assert (=> d!114419 m!879353))

(declare-fun m!879355 () Bool)

(assert (=> d!114419 m!879355))

(declare-fun m!879357 () Bool)

(assert (=> b!945611 m!879357))

(declare-fun m!879359 () Bool)

(assert (=> b!945613 m!879359))

(assert (=> b!945573 d!114419))

(declare-fun d!114421 () Bool)

(declare-fun res!635044 () Bool)

(declare-fun e!531902 () Bool)

(assert (=> d!114421 (=> (not res!635044) (not e!531902))))

(declare-fun simpleValid!352 (LongMapFixedSize!4800) Bool)

(assert (=> d!114421 (= res!635044 (simpleValid!352 thiss!1141))))

(assert (=> d!114421 (= (valid!1834 thiss!1141) e!531902)))

(declare-fun b!945621 () Bool)

(declare-fun res!635045 () Bool)

(assert (=> b!945621 (=> (not res!635045) (not e!531902))))

(declare-fun arrayCountValidKeys!0 (array!57202 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945621 (= res!635045 (= (arrayCountValidKeys!0 (_keys!10578 thiss!1141) #b00000000000000000000000000000000 (size!27991 (_keys!10578 thiss!1141))) (_size!2455 thiss!1141)))))

(declare-fun b!945622 () Bool)

(declare-fun res!635046 () Bool)

(assert (=> b!945622 (=> (not res!635046) (not e!531902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57202 (_ BitVec 32)) Bool)

(assert (=> b!945622 (= res!635046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10578 thiss!1141) (mask!27368 thiss!1141)))))

(declare-fun b!945623 () Bool)

(declare-datatypes ((List!19292 0))(
  ( (Nil!19289) (Cons!19288 (h!20439 (_ BitVec 64)) (t!27613 List!19292)) )
))
(declare-fun arrayNoDuplicates!0 (array!57202 (_ BitVec 32) List!19292) Bool)

(assert (=> b!945623 (= e!531902 (arrayNoDuplicates!0 (_keys!10578 thiss!1141) #b00000000000000000000000000000000 Nil!19289))))

(assert (= (and d!114421 res!635044) b!945621))

(assert (= (and b!945621 res!635045) b!945622))

(assert (= (and b!945622 res!635046) b!945623))

(declare-fun m!879361 () Bool)

(assert (=> d!114421 m!879361))

(declare-fun m!879363 () Bool)

(assert (=> b!945621 m!879363))

(declare-fun m!879365 () Bool)

(assert (=> b!945622 m!879365))

(declare-fun m!879367 () Bool)

(assert (=> b!945623 m!879367))

(assert (=> start!80526 d!114421))

(declare-fun b!945631 () Bool)

(declare-fun e!531907 () Bool)

(assert (=> b!945631 (= e!531907 tp_is_empty!20613)))

(declare-fun mapIsEmpty!32762 () Bool)

(declare-fun mapRes!32762 () Bool)

(assert (=> mapIsEmpty!32762 mapRes!32762))

(declare-fun mapNonEmpty!32762 () Bool)

(declare-fun tp!62845 () Bool)

(declare-fun e!531908 () Bool)

(assert (=> mapNonEmpty!32762 (= mapRes!32762 (and tp!62845 e!531908))))

(declare-fun mapValue!32762 () ValueCell!9825)

(declare-fun mapRest!32762 () (Array (_ BitVec 32) ValueCell!9825))

(declare-fun mapKey!32762 () (_ BitVec 32))

(assert (=> mapNonEmpty!32762 (= mapRest!32756 (store mapRest!32762 mapKey!32762 mapValue!32762))))

(declare-fun b!945630 () Bool)

(assert (=> b!945630 (= e!531908 tp_is_empty!20613)))

(declare-fun condMapEmpty!32762 () Bool)

(declare-fun mapDefault!32762 () ValueCell!9825)

(assert (=> mapNonEmpty!32756 (= condMapEmpty!32762 (= mapRest!32756 ((as const (Array (_ BitVec 32) ValueCell!9825)) mapDefault!32762)))))

(assert (=> mapNonEmpty!32756 (= tp!62836 (and e!531907 mapRes!32762))))

(assert (= (and mapNonEmpty!32756 condMapEmpty!32762) mapIsEmpty!32762))

(assert (= (and mapNonEmpty!32756 (not condMapEmpty!32762)) mapNonEmpty!32762))

(assert (= (and mapNonEmpty!32762 ((_ is ValueCellFull!9825) mapValue!32762)) b!945630))

(assert (= (and mapNonEmpty!32756 ((_ is ValueCellFull!9825) mapDefault!32762)) b!945631))

(declare-fun m!879369 () Bool)

(assert (=> mapNonEmpty!32762 m!879369))

(check-sat (not d!114419) (not b!945613) b_and!29527 (not b!945622) (not b!945623) (not b!945621) (not b_next!18105) tp_is_empty!20613 (not mapNonEmpty!32762) (not d!114421))
(check-sat b_and!29527 (not b_next!18105))
