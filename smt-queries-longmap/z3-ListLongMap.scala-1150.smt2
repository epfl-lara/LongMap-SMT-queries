; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24142 () Bool)

(assert start!24142)

(declare-fun b!252458 () Bool)

(declare-fun b_free!6649 () Bool)

(declare-fun b_next!6649 () Bool)

(assert (=> b!252458 (= b_free!6649 (not b_next!6649))))

(declare-fun tp!23225 () Bool)

(declare-fun b_and!13699 () Bool)

(assert (=> b!252458 (= tp!23225 b_and!13699)))

(declare-fun c!42543 () Bool)

(declare-datatypes ((V!8329 0))(
  ( (V!8330 (val!3300 Int)) )
))
(declare-datatypes ((ValueCell!2912 0))(
  ( (ValueCellFull!2912 (v!5372 V!8329)) (EmptyCell!2912) )
))
(declare-datatypes ((array!12345 0))(
  ( (array!12346 (arr!5851 (Array (_ BitVec 32) ValueCell!2912)) (size!6198 (_ BitVec 32))) )
))
(declare-datatypes ((array!12347 0))(
  ( (array!12348 (arr!5852 (Array (_ BitVec 32) (_ BitVec 64))) (size!6199 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3724 0))(
  ( (LongMapFixedSize!3725 (defaultEntry!4663 Int) (mask!10882 (_ BitVec 32)) (extraKeys!4400 (_ BitVec 32)) (zeroValue!4504 V!8329) (minValue!4504 V!8329) (_size!1911 (_ BitVec 32)) (_keys!6811 array!12347) (_values!4646 array!12345) (_vacant!1911 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3724)

(declare-fun bm!23760 () Bool)

(declare-fun call!23763 () Bool)

(declare-datatypes ((SeekEntryResult!1097 0))(
  ( (MissingZero!1097 (index!6558 (_ BitVec 32))) (Found!1097 (index!6559 (_ BitVec 32))) (Intermediate!1097 (undefined!1909 Bool) (index!6560 (_ BitVec 32)) (x!24735 (_ BitVec 32))) (Undefined!1097) (MissingVacant!1097 (index!6561 (_ BitVec 32))) )
))
(declare-fun lt!126575 () SeekEntryResult!1097)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23760 (= call!23763 (inRange!0 (ite c!42543 (index!6558 lt!126575) (index!6561 lt!126575)) (mask!10882 thiss!1504)))))

(declare-fun b!252442 () Bool)

(declare-datatypes ((Unit!7784 0))(
  ( (Unit!7785) )
))
(declare-fun e!163699 () Unit!7784)

(declare-fun Unit!7786 () Unit!7784)

(assert (=> b!252442 (= e!163699 Unit!7786)))

(declare-fun lt!126581 () Unit!7784)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!400 (array!12347 array!12345 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) Int) Unit!7784)

(assert (=> b!252442 (= lt!126581 (lemmaInListMapThenSeekEntryOrOpenFindsIt!400 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)))))

(assert (=> b!252442 false))

(declare-fun b!252443 () Bool)

(declare-fun e!163700 () Bool)

(declare-fun e!163692 () Bool)

(assert (=> b!252443 (= e!163700 e!163692)))

(declare-fun res!123569 () Bool)

(assert (=> b!252443 (=> (not res!123569) (not e!163692))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!252443 (= res!123569 (or (= lt!126575 (MissingZero!1097 index!297)) (= lt!126575 (MissingVacant!1097 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12347 (_ BitVec 32)) SeekEntryResult!1097)

(assert (=> b!252443 (= lt!126575 (seekEntryOrOpen!0 key!932 (_keys!6811 thiss!1504) (mask!10882 thiss!1504)))))

(declare-fun b!252444 () Bool)

(declare-fun e!163704 () Bool)

(declare-fun tp_is_empty!6511 () Bool)

(assert (=> b!252444 (= e!163704 tp_is_empty!6511)))

(declare-fun bm!23761 () Bool)

(declare-fun call!23764 () Bool)

(declare-fun arrayContainsKey!0 (array!12347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23761 (= call!23764 (arrayContainsKey!0 (_keys!6811 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252445 () Bool)

(declare-fun e!163696 () Bool)

(declare-datatypes ((List!3655 0))(
  ( (Nil!3652) (Cons!3651 (h!4313 (_ BitVec 64)) (t!8688 List!3655)) )
))
(declare-fun arrayNoDuplicates!0 (array!12347 (_ BitVec 32) List!3655) Bool)

(assert (=> b!252445 (= e!163696 (arrayNoDuplicates!0 (_keys!6811 thiss!1504) #b00000000000000000000000000000000 Nil!3652))))

(declare-fun mapIsEmpty!11073 () Bool)

(declare-fun mapRes!11073 () Bool)

(assert (=> mapIsEmpty!11073 mapRes!11073))

(declare-fun b!252446 () Bool)

(declare-fun e!163695 () Bool)

(assert (=> b!252446 (= e!163695 (not call!23764))))

(declare-fun b!252447 () Bool)

(declare-fun e!163697 () Bool)

(assert (=> b!252447 (= e!163697 (not e!163696))))

(declare-fun res!123572 () Bool)

(assert (=> b!252447 (=> res!123572 e!163696)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!252447 (= res!123572 (not (validMask!0 (mask!10882 thiss!1504))))))

(declare-fun lt!126578 () array!12347)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12347 (_ BitVec 32)) Bool)

(assert (=> b!252447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126578 (mask!10882 thiss!1504))))

(declare-fun lt!126574 () Unit!7784)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12347 (_ BitVec 32) (_ BitVec 32)) Unit!7784)

(assert (=> b!252447 (= lt!126574 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6811 thiss!1504) index!297 (mask!10882 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12347 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!252447 (= (arrayCountValidKeys!0 lt!126578 #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6811 thiss!1504) #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504)))))))

(declare-fun lt!126582 () Unit!7784)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12347 (_ BitVec 32) (_ BitVec 64)) Unit!7784)

(assert (=> b!252447 (= lt!126582 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6811 thiss!1504) index!297 key!932))))

(assert (=> b!252447 (arrayNoDuplicates!0 lt!126578 #b00000000000000000000000000000000 Nil!3652)))

(assert (=> b!252447 (= lt!126578 (array!12348 (store (arr!5852 (_keys!6811 thiss!1504)) index!297 key!932) (size!6199 (_keys!6811 thiss!1504))))))

(declare-fun lt!126580 () Unit!7784)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3655) Unit!7784)

(assert (=> b!252447 (= lt!126580 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6811 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3652))))

(declare-fun lt!126576 () Unit!7784)

(declare-fun e!163693 () Unit!7784)

(assert (=> b!252447 (= lt!126576 e!163693)))

(declare-fun c!42540 () Bool)

(assert (=> b!252447 (= c!42540 (arrayContainsKey!0 (_keys!6811 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252448 () Bool)

(declare-fun Unit!7787 () Unit!7784)

(assert (=> b!252448 (= e!163693 Unit!7787)))

(declare-fun b!252449 () Bool)

(declare-fun res!123574 () Bool)

(assert (=> b!252449 (=> res!123574 e!163696)))

(assert (=> b!252449 (= res!123574 (or (not (= (size!6198 (_values!4646 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10882 thiss!1504)))) (not (= (size!6199 (_keys!6811 thiss!1504)) (size!6198 (_values!4646 thiss!1504)))) (bvslt (mask!10882 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4400 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4400 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!252450 () Bool)

(declare-fun e!163705 () Bool)

(assert (=> b!252450 (= e!163705 tp_is_empty!6511)))

(declare-fun b!252451 () Bool)

(assert (=> b!252451 (= e!163692 e!163697)))

(declare-fun res!123566 () Bool)

(assert (=> b!252451 (=> (not res!123566) (not e!163697))))

(assert (=> b!252451 (= res!123566 (inRange!0 index!297 (mask!10882 thiss!1504)))))

(declare-fun lt!126579 () Unit!7784)

(assert (=> b!252451 (= lt!126579 e!163699)))

(declare-fun c!42541 () Bool)

(declare-datatypes ((tuple2!4776 0))(
  ( (tuple2!4777 (_1!2399 (_ BitVec 64)) (_2!2399 V!8329)) )
))
(declare-datatypes ((List!3656 0))(
  ( (Nil!3653) (Cons!3652 (h!4314 tuple2!4776) (t!8689 List!3656)) )
))
(declare-datatypes ((ListLongMap!3691 0))(
  ( (ListLongMap!3692 (toList!1861 List!3656)) )
))
(declare-fun contains!1804 (ListLongMap!3691 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1393 (array!12347 array!12345 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 32) Int) ListLongMap!3691)

(assert (=> b!252451 (= c!42541 (contains!1804 (getCurrentListMap!1393 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!11073 () Bool)

(declare-fun tp!23226 () Bool)

(assert (=> mapNonEmpty!11073 (= mapRes!11073 (and tp!23226 e!163704))))

(declare-fun mapKey!11073 () (_ BitVec 32))

(declare-fun mapRest!11073 () (Array (_ BitVec 32) ValueCell!2912))

(declare-fun mapValue!11073 () ValueCell!2912)

(assert (=> mapNonEmpty!11073 (= (arr!5851 (_values!4646 thiss!1504)) (store mapRest!11073 mapKey!11073 mapValue!11073))))

(declare-fun b!252453 () Bool)

(declare-fun res!123570 () Bool)

(assert (=> b!252453 (=> (not res!123570) (not e!163695))))

(assert (=> b!252453 (= res!123570 call!23763)))

(declare-fun e!163691 () Bool)

(assert (=> b!252453 (= e!163691 e!163695)))

(declare-fun b!252454 () Bool)

(declare-fun c!42542 () Bool)

(get-info :version)

(assert (=> b!252454 (= c!42542 ((_ is MissingVacant!1097) lt!126575))))

(declare-fun e!163698 () Bool)

(assert (=> b!252454 (= e!163691 e!163698)))

(declare-fun b!252455 () Bool)

(declare-fun e!163694 () Bool)

(assert (=> b!252455 (= e!163694 (and e!163705 mapRes!11073))))

(declare-fun condMapEmpty!11073 () Bool)

(declare-fun mapDefault!11073 () ValueCell!2912)

(assert (=> b!252455 (= condMapEmpty!11073 (= (arr!5851 (_values!4646 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2912)) mapDefault!11073)))))

(declare-fun b!252456 () Bool)

(assert (=> b!252456 (= e!163698 ((_ is Undefined!1097) lt!126575))))

(declare-fun b!252457 () Bool)

(declare-fun e!163702 () Bool)

(assert (=> b!252457 (= e!163702 (not call!23764))))

(declare-fun e!163701 () Bool)

(declare-fun array_inv!3847 (array!12347) Bool)

(declare-fun array_inv!3848 (array!12345) Bool)

(assert (=> b!252458 (= e!163701 (and tp!23225 tp_is_empty!6511 (array_inv!3847 (_keys!6811 thiss!1504)) (array_inv!3848 (_values!4646 thiss!1504)) e!163694))))

(declare-fun b!252459 () Bool)

(declare-fun res!123568 () Bool)

(assert (=> b!252459 (= res!123568 (= (select (arr!5852 (_keys!6811 thiss!1504)) (index!6561 lt!126575)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252459 (=> (not res!123568) (not e!163702))))

(declare-fun b!252460 () Bool)

(declare-fun res!123571 () Bool)

(assert (=> b!252460 (=> res!123571 e!163696)))

(assert (=> b!252460 (= res!123571 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6811 thiss!1504) (mask!10882 thiss!1504))))))

(declare-fun b!252461 () Bool)

(declare-fun res!123575 () Bool)

(assert (=> b!252461 (=> (not res!123575) (not e!163700))))

(assert (=> b!252461 (= res!123575 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!252462 () Bool)

(declare-fun lt!126577 () Unit!7784)

(assert (=> b!252462 (= e!163699 lt!126577)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!394 (array!12347 array!12345 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) Int) Unit!7784)

(assert (=> b!252462 (= lt!126577 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!394 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)))))

(assert (=> b!252462 (= c!42543 ((_ is MissingZero!1097) lt!126575))))

(assert (=> b!252462 e!163691))

(declare-fun b!252463 () Bool)

(assert (=> b!252463 (= e!163698 e!163702)))

(declare-fun res!123576 () Bool)

(assert (=> b!252463 (= res!123576 call!23763)))

(assert (=> b!252463 (=> (not res!123576) (not e!163702))))

(declare-fun b!252464 () Bool)

(declare-fun res!123573 () Bool)

(assert (=> b!252464 (=> (not res!123573) (not e!163695))))

(assert (=> b!252464 (= res!123573 (= (select (arr!5852 (_keys!6811 thiss!1504)) (index!6558 lt!126575)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252452 () Bool)

(declare-fun Unit!7788 () Unit!7784)

(assert (=> b!252452 (= e!163693 Unit!7788)))

(declare-fun lt!126583 () Unit!7784)

(declare-fun lemmaArrayContainsKeyThenInListMap!220 (array!12347 array!12345 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) (_ BitVec 32) Int) Unit!7784)

(assert (=> b!252452 (= lt!126583 (lemmaArrayContainsKeyThenInListMap!220 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(assert (=> b!252452 false))

(declare-fun res!123567 () Bool)

(assert (=> start!24142 (=> (not res!123567) (not e!163700))))

(declare-fun valid!1463 (LongMapFixedSize!3724) Bool)

(assert (=> start!24142 (= res!123567 (valid!1463 thiss!1504))))

(assert (=> start!24142 e!163700))

(assert (=> start!24142 e!163701))

(assert (=> start!24142 true))

(assert (= (and start!24142 res!123567) b!252461))

(assert (= (and b!252461 res!123575) b!252443))

(assert (= (and b!252443 res!123569) b!252451))

(assert (= (and b!252451 c!42541) b!252442))

(assert (= (and b!252451 (not c!42541)) b!252462))

(assert (= (and b!252462 c!42543) b!252453))

(assert (= (and b!252462 (not c!42543)) b!252454))

(assert (= (and b!252453 res!123570) b!252464))

(assert (= (and b!252464 res!123573) b!252446))

(assert (= (and b!252454 c!42542) b!252463))

(assert (= (and b!252454 (not c!42542)) b!252456))

(assert (= (and b!252463 res!123576) b!252459))

(assert (= (and b!252459 res!123568) b!252457))

(assert (= (or b!252453 b!252463) bm!23760))

(assert (= (or b!252446 b!252457) bm!23761))

(assert (= (and b!252451 res!123566) b!252447))

(assert (= (and b!252447 c!42540) b!252452))

(assert (= (and b!252447 (not c!42540)) b!252448))

(assert (= (and b!252447 (not res!123572)) b!252449))

(assert (= (and b!252449 (not res!123574)) b!252460))

(assert (= (and b!252460 (not res!123571)) b!252445))

(assert (= (and b!252455 condMapEmpty!11073) mapIsEmpty!11073))

(assert (= (and b!252455 (not condMapEmpty!11073)) mapNonEmpty!11073))

(assert (= (and mapNonEmpty!11073 ((_ is ValueCellFull!2912) mapValue!11073)) b!252444))

(assert (= (and b!252455 ((_ is ValueCellFull!2912) mapDefault!11073)) b!252450))

(assert (= b!252458 b!252455))

(assert (= start!24142 b!252458))

(declare-fun m!268711 () Bool)

(assert (=> b!252447 m!268711))

(declare-fun m!268713 () Bool)

(assert (=> b!252447 m!268713))

(declare-fun m!268715 () Bool)

(assert (=> b!252447 m!268715))

(declare-fun m!268717 () Bool)

(assert (=> b!252447 m!268717))

(declare-fun m!268719 () Bool)

(assert (=> b!252447 m!268719))

(declare-fun m!268721 () Bool)

(assert (=> b!252447 m!268721))

(declare-fun m!268723 () Bool)

(assert (=> b!252447 m!268723))

(declare-fun m!268725 () Bool)

(assert (=> b!252447 m!268725))

(declare-fun m!268727 () Bool)

(assert (=> b!252447 m!268727))

(declare-fun m!268729 () Bool)

(assert (=> b!252447 m!268729))

(declare-fun m!268731 () Bool)

(assert (=> b!252451 m!268731))

(declare-fun m!268733 () Bool)

(assert (=> b!252451 m!268733))

(assert (=> b!252451 m!268733))

(declare-fun m!268735 () Bool)

(assert (=> b!252451 m!268735))

(declare-fun m!268737 () Bool)

(assert (=> b!252460 m!268737))

(declare-fun m!268739 () Bool)

(assert (=> b!252443 m!268739))

(declare-fun m!268741 () Bool)

(assert (=> b!252462 m!268741))

(declare-fun m!268743 () Bool)

(assert (=> b!252445 m!268743))

(declare-fun m!268745 () Bool)

(assert (=> start!24142 m!268745))

(declare-fun m!268747 () Bool)

(assert (=> mapNonEmpty!11073 m!268747))

(declare-fun m!268749 () Bool)

(assert (=> b!252464 m!268749))

(declare-fun m!268751 () Bool)

(assert (=> b!252442 m!268751))

(declare-fun m!268753 () Bool)

(assert (=> b!252459 m!268753))

(declare-fun m!268755 () Bool)

(assert (=> b!252452 m!268755))

(assert (=> bm!23761 m!268727))

(declare-fun m!268757 () Bool)

(assert (=> b!252458 m!268757))

(declare-fun m!268759 () Bool)

(assert (=> b!252458 m!268759))

(declare-fun m!268761 () Bool)

(assert (=> bm!23760 m!268761))

(check-sat (not bm!23760) (not b!252458) (not b!252451) (not b!252460) tp_is_empty!6511 (not b_next!6649) (not b!252442) (not b!252445) (not b!252447) (not start!24142) (not b!252443) (not b!252452) (not mapNonEmpty!11073) b_and!13699 (not bm!23761) (not b!252462))
(check-sat b_and!13699 (not b_next!6649))
(get-model)

(declare-fun b!252611 () Bool)

(declare-fun e!163802 () Bool)

(declare-fun call!23779 () Bool)

(assert (=> b!252611 (= e!163802 call!23779)))

(declare-fun b!252612 () Bool)

(declare-fun e!163804 () Bool)

(declare-fun e!163803 () Bool)

(assert (=> b!252612 (= e!163804 e!163803)))

(declare-fun c!42570 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!252612 (= c!42570 (validKeyInArray!0 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252613 () Bool)

(assert (=> b!252613 (= e!163803 e!163802)))

(declare-fun lt!126652 () (_ BitVec 64))

(assert (=> b!252613 (= lt!126652 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126650 () Unit!7784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12347 (_ BitVec 64) (_ BitVec 32)) Unit!7784)

(assert (=> b!252613 (= lt!126650 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6811 thiss!1504) lt!126652 #b00000000000000000000000000000000))))

(assert (=> b!252613 (arrayContainsKey!0 (_keys!6811 thiss!1504) lt!126652 #b00000000000000000000000000000000)))

(declare-fun lt!126651 () Unit!7784)

(assert (=> b!252613 (= lt!126651 lt!126650)))

(declare-fun res!123648 () Bool)

(assert (=> b!252613 (= res!123648 (= (seekEntryOrOpen!0 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000) (_keys!6811 thiss!1504) (mask!10882 thiss!1504)) (Found!1097 #b00000000000000000000000000000000)))))

(assert (=> b!252613 (=> (not res!123648) (not e!163802))))

(declare-fun bm!23776 () Bool)

(assert (=> bm!23776 (= call!23779 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6811 thiss!1504) (mask!10882 thiss!1504)))))

(declare-fun b!252614 () Bool)

(assert (=> b!252614 (= e!163803 call!23779)))

(declare-fun d!61411 () Bool)

(declare-fun res!123647 () Bool)

(assert (=> d!61411 (=> res!123647 e!163804)))

(assert (=> d!61411 (= res!123647 (bvsge #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))))))

(assert (=> d!61411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6811 thiss!1504) (mask!10882 thiss!1504)) e!163804)))

(assert (= (and d!61411 (not res!123647)) b!252612))

(assert (= (and b!252612 c!42570) b!252613))

(assert (= (and b!252612 (not c!42570)) b!252614))

(assert (= (and b!252613 res!123648) b!252611))

(assert (= (or b!252611 b!252614) bm!23776))

(declare-fun m!268867 () Bool)

(assert (=> b!252612 m!268867))

(assert (=> b!252612 m!268867))

(declare-fun m!268869 () Bool)

(assert (=> b!252612 m!268869))

(assert (=> b!252613 m!268867))

(declare-fun m!268871 () Bool)

(assert (=> b!252613 m!268871))

(declare-fun m!268873 () Bool)

(assert (=> b!252613 m!268873))

(assert (=> b!252613 m!268867))

(declare-fun m!268875 () Bool)

(assert (=> b!252613 m!268875))

(declare-fun m!268877 () Bool)

(assert (=> bm!23776 m!268877))

(assert (=> b!252460 d!61411))

(declare-fun d!61413 () Bool)

(declare-fun e!163807 () Bool)

(assert (=> d!61413 e!163807))

(declare-fun res!123654 () Bool)

(assert (=> d!61413 (=> (not res!123654) (not e!163807))))

(declare-fun lt!126657 () SeekEntryResult!1097)

(assert (=> d!61413 (= res!123654 ((_ is Found!1097) lt!126657))))

(assert (=> d!61413 (= lt!126657 (seekEntryOrOpen!0 key!932 (_keys!6811 thiss!1504) (mask!10882 thiss!1504)))))

(declare-fun lt!126658 () Unit!7784)

(declare-fun choose!1210 (array!12347 array!12345 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) Int) Unit!7784)

(assert (=> d!61413 (= lt!126658 (choose!1210 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)))))

(assert (=> d!61413 (validMask!0 (mask!10882 thiss!1504))))

(assert (=> d!61413 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!400 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)) lt!126658)))

(declare-fun b!252619 () Bool)

(declare-fun res!123653 () Bool)

(assert (=> b!252619 (=> (not res!123653) (not e!163807))))

(assert (=> b!252619 (= res!123653 (inRange!0 (index!6559 lt!126657) (mask!10882 thiss!1504)))))

(declare-fun b!252620 () Bool)

(assert (=> b!252620 (= e!163807 (= (select (arr!5852 (_keys!6811 thiss!1504)) (index!6559 lt!126657)) key!932))))

(assert (=> b!252620 (and (bvsge (index!6559 lt!126657) #b00000000000000000000000000000000) (bvslt (index!6559 lt!126657) (size!6199 (_keys!6811 thiss!1504))))))

(assert (= (and d!61413 res!123654) b!252619))

(assert (= (and b!252619 res!123653) b!252620))

(assert (=> d!61413 m!268739))

(declare-fun m!268879 () Bool)

(assert (=> d!61413 m!268879))

(assert (=> d!61413 m!268711))

(declare-fun m!268881 () Bool)

(assert (=> b!252619 m!268881))

(declare-fun m!268883 () Bool)

(assert (=> b!252620 m!268883))

(assert (=> b!252442 d!61413))

(declare-fun d!61415 () Bool)

(assert (=> d!61415 (= (inRange!0 index!297 (mask!10882 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10882 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!252451 d!61415))

(declare-fun d!61417 () Bool)

(declare-fun e!163813 () Bool)

(assert (=> d!61417 e!163813))

(declare-fun res!123657 () Bool)

(assert (=> d!61417 (=> res!123657 e!163813)))

(declare-fun lt!126670 () Bool)

(assert (=> d!61417 (= res!123657 (not lt!126670))))

(declare-fun lt!126668 () Bool)

(assert (=> d!61417 (= lt!126670 lt!126668)))

(declare-fun lt!126667 () Unit!7784)

(declare-fun e!163812 () Unit!7784)

(assert (=> d!61417 (= lt!126667 e!163812)))

(declare-fun c!42573 () Bool)

(assert (=> d!61417 (= c!42573 lt!126668)))

(declare-fun containsKey!294 (List!3656 (_ BitVec 64)) Bool)

(assert (=> d!61417 (= lt!126668 (containsKey!294 (toList!1861 (getCurrentListMap!1393 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504))) key!932))))

(assert (=> d!61417 (= (contains!1804 (getCurrentListMap!1393 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)) key!932) lt!126670)))

(declare-fun b!252627 () Bool)

(declare-fun lt!126669 () Unit!7784)

(assert (=> b!252627 (= e!163812 lt!126669)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!242 (List!3656 (_ BitVec 64)) Unit!7784)

(assert (=> b!252627 (= lt!126669 (lemmaContainsKeyImpliesGetValueByKeyDefined!242 (toList!1861 (getCurrentListMap!1393 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504))) key!932))))

(declare-datatypes ((Option!309 0))(
  ( (Some!308 (v!5375 V!8329)) (None!307) )
))
(declare-fun isDefined!243 (Option!309) Bool)

(declare-fun getValueByKey!303 (List!3656 (_ BitVec 64)) Option!309)

(assert (=> b!252627 (isDefined!243 (getValueByKey!303 (toList!1861 (getCurrentListMap!1393 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504))) key!932))))

(declare-fun b!252628 () Bool)

(declare-fun Unit!7791 () Unit!7784)

(assert (=> b!252628 (= e!163812 Unit!7791)))

(declare-fun b!252629 () Bool)

(assert (=> b!252629 (= e!163813 (isDefined!243 (getValueByKey!303 (toList!1861 (getCurrentListMap!1393 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504))) key!932)))))

(assert (= (and d!61417 c!42573) b!252627))

(assert (= (and d!61417 (not c!42573)) b!252628))

(assert (= (and d!61417 (not res!123657)) b!252629))

(declare-fun m!268885 () Bool)

(assert (=> d!61417 m!268885))

(declare-fun m!268887 () Bool)

(assert (=> b!252627 m!268887))

(declare-fun m!268889 () Bool)

(assert (=> b!252627 m!268889))

(assert (=> b!252627 m!268889))

(declare-fun m!268891 () Bool)

(assert (=> b!252627 m!268891))

(assert (=> b!252629 m!268889))

(assert (=> b!252629 m!268889))

(assert (=> b!252629 m!268891))

(assert (=> b!252451 d!61417))

(declare-fun b!252672 () Bool)

(declare-fun c!42586 () Bool)

(assert (=> b!252672 (= c!42586 (and (not (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!163851 () ListLongMap!3691)

(declare-fun e!163848 () ListLongMap!3691)

(assert (=> b!252672 (= e!163851 e!163848)))

(declare-fun b!252673 () Bool)

(declare-fun call!23799 () ListLongMap!3691)

(assert (=> b!252673 (= e!163848 call!23799)))

(declare-fun b!252674 () Bool)

(declare-fun res!123683 () Bool)

(declare-fun e!163850 () Bool)

(assert (=> b!252674 (=> (not res!123683) (not e!163850))))

(declare-fun e!163840 () Bool)

(assert (=> b!252674 (= res!123683 e!163840)))

(declare-fun c!42587 () Bool)

(assert (=> b!252674 (= c!42587 (not (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!23791 () Bool)

(declare-fun call!23800 () ListLongMap!3691)

(declare-fun call!23796 () ListLongMap!3691)

(assert (=> bm!23791 (= call!23800 call!23796)))

(declare-fun bm!23792 () Bool)

(declare-fun call!23795 () Bool)

(declare-fun lt!126724 () ListLongMap!3691)

(assert (=> bm!23792 (= call!23795 (contains!1804 lt!126724 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252675 () Bool)

(assert (=> b!252675 (= e!163848 call!23800)))

(declare-fun b!252676 () Bool)

(declare-fun e!163849 () Bool)

(assert (=> b!252676 (= e!163849 (validKeyInArray!0 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23794 () Bool)

(declare-fun call!23794 () Bool)

(assert (=> bm!23794 (= call!23794 (contains!1804 lt!126724 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252677 () Bool)

(declare-fun e!163841 () Bool)

(assert (=> b!252677 (= e!163841 (not call!23794))))

(declare-fun b!252678 () Bool)

(declare-fun e!163844 () Bool)

(assert (=> b!252678 (= e!163844 (validKeyInArray!0 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252679 () Bool)

(declare-fun e!163845 () Unit!7784)

(declare-fun Unit!7792 () Unit!7784)

(assert (=> b!252679 (= e!163845 Unit!7792)))

(declare-fun b!252680 () Bool)

(declare-fun e!163843 () Bool)

(assert (=> b!252680 (= e!163841 e!163843)))

(declare-fun res!123679 () Bool)

(assert (=> b!252680 (= res!123679 call!23794)))

(assert (=> b!252680 (=> (not res!123679) (not e!163843))))

(declare-fun b!252681 () Bool)

(declare-fun res!123684 () Bool)

(assert (=> b!252681 (=> (not res!123684) (not e!163850))))

(declare-fun e!163842 () Bool)

(assert (=> b!252681 (= res!123684 e!163842)))

(declare-fun res!123678 () Bool)

(assert (=> b!252681 (=> res!123678 e!163842)))

(assert (=> b!252681 (= res!123678 (not e!163844))))

(declare-fun res!123681 () Bool)

(assert (=> b!252681 (=> (not res!123681) (not e!163844))))

(assert (=> b!252681 (= res!123681 (bvslt #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))))))

(declare-fun b!252682 () Bool)

(declare-fun apply!244 (ListLongMap!3691 (_ BitVec 64)) V!8329)

(assert (=> b!252682 (= e!163843 (= (apply!244 lt!126724 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4504 thiss!1504)))))

(declare-fun bm!23795 () Bool)

(declare-fun call!23798 () ListLongMap!3691)

(declare-fun call!23797 () ListLongMap!3691)

(assert (=> bm!23795 (= call!23798 call!23797)))

(declare-fun b!252683 () Bool)

(assert (=> b!252683 (= e!163840 (not call!23795))))

(declare-fun b!252684 () Bool)

(declare-fun e!163852 () Bool)

(assert (=> b!252684 (= e!163840 e!163852)))

(declare-fun res!123680 () Bool)

(assert (=> b!252684 (= res!123680 call!23795)))

(assert (=> b!252684 (=> (not res!123680) (not e!163852))))

(declare-fun bm!23793 () Bool)

(assert (=> bm!23793 (= call!23799 call!23798)))

(declare-fun d!61419 () Bool)

(assert (=> d!61419 e!163850))

(declare-fun res!123677 () Bool)

(assert (=> d!61419 (=> (not res!123677) (not e!163850))))

(assert (=> d!61419 (= res!123677 (or (bvsge #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))))))))

(declare-fun lt!126720 () ListLongMap!3691)

(assert (=> d!61419 (= lt!126724 lt!126720)))

(declare-fun lt!126719 () Unit!7784)

(assert (=> d!61419 (= lt!126719 e!163845)))

(declare-fun c!42590 () Bool)

(assert (=> d!61419 (= c!42590 e!163849)))

(declare-fun res!123676 () Bool)

(assert (=> d!61419 (=> (not res!123676) (not e!163849))))

(assert (=> d!61419 (= res!123676 (bvslt #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))))))

(declare-fun e!163847 () ListLongMap!3691)

(assert (=> d!61419 (= lt!126720 e!163847)))

(declare-fun c!42589 () Bool)

(assert (=> d!61419 (= c!42589 (and (not (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61419 (validMask!0 (mask!10882 thiss!1504))))

(assert (=> d!61419 (= (getCurrentListMap!1393 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)) lt!126724)))

(declare-fun c!42588 () Bool)

(declare-fun bm!23796 () Bool)

(declare-fun +!671 (ListLongMap!3691 tuple2!4776) ListLongMap!3691)

(assert (=> bm!23796 (= call!23796 (+!671 (ite c!42589 call!23797 (ite c!42588 call!23798 call!23799)) (ite (or c!42589 c!42588) (tuple2!4777 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4504 thiss!1504)) (tuple2!4777 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4504 thiss!1504)))))))

(declare-fun b!252685 () Bool)

(declare-fun e!163846 () Bool)

(declare-fun get!3021 (ValueCell!2912 V!8329) V!8329)

(declare-fun dynLambda!587 (Int (_ BitVec 64)) V!8329)

(assert (=> b!252685 (= e!163846 (= (apply!244 lt!126724 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000)) (get!3021 (select (arr!5851 (_values!4646 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!587 (defaultEntry!4663 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!252685 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6198 (_values!4646 thiss!1504))))))

(assert (=> b!252685 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))))))

(declare-fun bm!23797 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!560 (array!12347 array!12345 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 32) Int) ListLongMap!3691)

(assert (=> bm!23797 (= call!23797 (getCurrentListMapNoExtraKeys!560 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(declare-fun b!252686 () Bool)

(declare-fun lt!126732 () Unit!7784)

(assert (=> b!252686 (= e!163845 lt!126732)))

(declare-fun lt!126721 () ListLongMap!3691)

(assert (=> b!252686 (= lt!126721 (getCurrentListMapNoExtraKeys!560 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(declare-fun lt!126731 () (_ BitVec 64))

(assert (=> b!252686 (= lt!126731 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126717 () (_ BitVec 64))

(assert (=> b!252686 (= lt!126717 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126726 () Unit!7784)

(declare-fun addStillContains!220 (ListLongMap!3691 (_ BitVec 64) V!8329 (_ BitVec 64)) Unit!7784)

(assert (=> b!252686 (= lt!126726 (addStillContains!220 lt!126721 lt!126731 (zeroValue!4504 thiss!1504) lt!126717))))

(assert (=> b!252686 (contains!1804 (+!671 lt!126721 (tuple2!4777 lt!126731 (zeroValue!4504 thiss!1504))) lt!126717)))

(declare-fun lt!126715 () Unit!7784)

(assert (=> b!252686 (= lt!126715 lt!126726)))

(declare-fun lt!126723 () ListLongMap!3691)

(assert (=> b!252686 (= lt!126723 (getCurrentListMapNoExtraKeys!560 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(declare-fun lt!126728 () (_ BitVec 64))

(assert (=> b!252686 (= lt!126728 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126733 () (_ BitVec 64))

(assert (=> b!252686 (= lt!126733 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126734 () Unit!7784)

(declare-fun addApplyDifferent!220 (ListLongMap!3691 (_ BitVec 64) V!8329 (_ BitVec 64)) Unit!7784)

(assert (=> b!252686 (= lt!126734 (addApplyDifferent!220 lt!126723 lt!126728 (minValue!4504 thiss!1504) lt!126733))))

(assert (=> b!252686 (= (apply!244 (+!671 lt!126723 (tuple2!4777 lt!126728 (minValue!4504 thiss!1504))) lt!126733) (apply!244 lt!126723 lt!126733))))

(declare-fun lt!126716 () Unit!7784)

(assert (=> b!252686 (= lt!126716 lt!126734)))

(declare-fun lt!126718 () ListLongMap!3691)

(assert (=> b!252686 (= lt!126718 (getCurrentListMapNoExtraKeys!560 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(declare-fun lt!126722 () (_ BitVec 64))

(assert (=> b!252686 (= lt!126722 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126729 () (_ BitVec 64))

(assert (=> b!252686 (= lt!126729 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126736 () Unit!7784)

(assert (=> b!252686 (= lt!126736 (addApplyDifferent!220 lt!126718 lt!126722 (zeroValue!4504 thiss!1504) lt!126729))))

(assert (=> b!252686 (= (apply!244 (+!671 lt!126718 (tuple2!4777 lt!126722 (zeroValue!4504 thiss!1504))) lt!126729) (apply!244 lt!126718 lt!126729))))

(declare-fun lt!126730 () Unit!7784)

(assert (=> b!252686 (= lt!126730 lt!126736)))

(declare-fun lt!126725 () ListLongMap!3691)

(assert (=> b!252686 (= lt!126725 (getCurrentListMapNoExtraKeys!560 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(declare-fun lt!126727 () (_ BitVec 64))

(assert (=> b!252686 (= lt!126727 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126735 () (_ BitVec 64))

(assert (=> b!252686 (= lt!126735 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252686 (= lt!126732 (addApplyDifferent!220 lt!126725 lt!126727 (minValue!4504 thiss!1504) lt!126735))))

(assert (=> b!252686 (= (apply!244 (+!671 lt!126725 (tuple2!4777 lt!126727 (minValue!4504 thiss!1504))) lt!126735) (apply!244 lt!126725 lt!126735))))

(declare-fun b!252687 () Bool)

(assert (=> b!252687 (= e!163847 e!163851)))

(assert (=> b!252687 (= c!42588 (and (not (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!252688 () Bool)

(assert (=> b!252688 (= e!163851 call!23800)))

(declare-fun b!252689 () Bool)

(assert (=> b!252689 (= e!163847 (+!671 call!23796 (tuple2!4777 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4504 thiss!1504))))))

(declare-fun b!252690 () Bool)

(assert (=> b!252690 (= e!163842 e!163846)))

(declare-fun res!123682 () Bool)

(assert (=> b!252690 (=> (not res!123682) (not e!163846))))

(assert (=> b!252690 (= res!123682 (contains!1804 lt!126724 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!252690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))))))

(declare-fun b!252691 () Bool)

(assert (=> b!252691 (= e!163852 (= (apply!244 lt!126724 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4504 thiss!1504)))))

(declare-fun b!252692 () Bool)

(assert (=> b!252692 (= e!163850 e!163841)))

(declare-fun c!42591 () Bool)

(assert (=> b!252692 (= c!42591 (not (= (bvand (extraKeys!4400 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61419 c!42589) b!252689))

(assert (= (and d!61419 (not c!42589)) b!252687))

(assert (= (and b!252687 c!42588) b!252688))

(assert (= (and b!252687 (not c!42588)) b!252672))

(assert (= (and b!252672 c!42586) b!252675))

(assert (= (and b!252672 (not c!42586)) b!252673))

(assert (= (or b!252675 b!252673) bm!23793))

(assert (= (or b!252688 bm!23793) bm!23795))

(assert (= (or b!252688 b!252675) bm!23791))

(assert (= (or b!252689 bm!23795) bm!23797))

(assert (= (or b!252689 bm!23791) bm!23796))

(assert (= (and d!61419 res!123676) b!252676))

(assert (= (and d!61419 c!42590) b!252686))

(assert (= (and d!61419 (not c!42590)) b!252679))

(assert (= (and d!61419 res!123677) b!252681))

(assert (= (and b!252681 res!123681) b!252678))

(assert (= (and b!252681 (not res!123678)) b!252690))

(assert (= (and b!252690 res!123682) b!252685))

(assert (= (and b!252681 res!123684) b!252674))

(assert (= (and b!252674 c!42587) b!252684))

(assert (= (and b!252674 (not c!42587)) b!252683))

(assert (= (and b!252684 res!123680) b!252691))

(assert (= (or b!252684 b!252683) bm!23792))

(assert (= (and b!252674 res!123683) b!252692))

(assert (= (and b!252692 c!42591) b!252680))

(assert (= (and b!252692 (not c!42591)) b!252677))

(assert (= (and b!252680 res!123679) b!252682))

(assert (= (or b!252680 b!252677) bm!23794))

(declare-fun b_lambda!8141 () Bool)

(assert (=> (not b_lambda!8141) (not b!252685)))

(declare-fun t!8692 () Bool)

(declare-fun tb!2993 () Bool)

(assert (=> (and b!252458 (= (defaultEntry!4663 thiss!1504) (defaultEntry!4663 thiss!1504)) t!8692) tb!2993))

(declare-fun result!5317 () Bool)

(assert (=> tb!2993 (= result!5317 tp_is_empty!6511)))

(assert (=> b!252685 t!8692))

(declare-fun b_and!13705 () Bool)

(assert (= b_and!13699 (and (=> t!8692 result!5317) b_and!13705)))

(declare-fun m!268893 () Bool)

(assert (=> b!252689 m!268893))

(assert (=> b!252690 m!268867))

(assert (=> b!252690 m!268867))

(declare-fun m!268895 () Bool)

(assert (=> b!252690 m!268895))

(declare-fun m!268897 () Bool)

(assert (=> b!252691 m!268897))

(declare-fun m!268899 () Bool)

(assert (=> bm!23792 m!268899))

(assert (=> d!61419 m!268711))

(assert (=> b!252676 m!268867))

(assert (=> b!252676 m!268867))

(assert (=> b!252676 m!268869))

(declare-fun m!268901 () Bool)

(assert (=> bm!23794 m!268901))

(declare-fun m!268903 () Bool)

(assert (=> bm!23796 m!268903))

(declare-fun m!268905 () Bool)

(assert (=> b!252682 m!268905))

(declare-fun m!268907 () Bool)

(assert (=> b!252685 m!268907))

(declare-fun m!268909 () Bool)

(assert (=> b!252685 m!268909))

(declare-fun m!268911 () Bool)

(assert (=> b!252685 m!268911))

(assert (=> b!252685 m!268867))

(assert (=> b!252685 m!268907))

(assert (=> b!252685 m!268909))

(assert (=> b!252685 m!268867))

(declare-fun m!268913 () Bool)

(assert (=> b!252685 m!268913))

(declare-fun m!268915 () Bool)

(assert (=> bm!23797 m!268915))

(assert (=> b!252678 m!268867))

(assert (=> b!252678 m!268867))

(assert (=> b!252678 m!268869))

(declare-fun m!268917 () Bool)

(assert (=> b!252686 m!268917))

(declare-fun m!268919 () Bool)

(assert (=> b!252686 m!268919))

(declare-fun m!268921 () Bool)

(assert (=> b!252686 m!268921))

(declare-fun m!268923 () Bool)

(assert (=> b!252686 m!268923))

(assert (=> b!252686 m!268923))

(declare-fun m!268925 () Bool)

(assert (=> b!252686 m!268925))

(assert (=> b!252686 m!268915))

(declare-fun m!268927 () Bool)

(assert (=> b!252686 m!268927))

(assert (=> b!252686 m!268867))

(declare-fun m!268929 () Bool)

(assert (=> b!252686 m!268929))

(declare-fun m!268931 () Bool)

(assert (=> b!252686 m!268931))

(declare-fun m!268933 () Bool)

(assert (=> b!252686 m!268933))

(declare-fun m!268935 () Bool)

(assert (=> b!252686 m!268935))

(assert (=> b!252686 m!268919))

(declare-fun m!268937 () Bool)

(assert (=> b!252686 m!268937))

(declare-fun m!268939 () Bool)

(assert (=> b!252686 m!268939))

(assert (=> b!252686 m!268937))

(assert (=> b!252686 m!268935))

(declare-fun m!268941 () Bool)

(assert (=> b!252686 m!268941))

(declare-fun m!268943 () Bool)

(assert (=> b!252686 m!268943))

(declare-fun m!268945 () Bool)

(assert (=> b!252686 m!268945))

(assert (=> b!252451 d!61419))

(declare-fun d!61421 () Bool)

(assert (=> d!61421 (= (inRange!0 (ite c!42543 (index!6558 lt!126575) (index!6561 lt!126575)) (mask!10882 thiss!1504)) (and (bvsge (ite c!42543 (index!6558 lt!126575) (index!6561 lt!126575)) #b00000000000000000000000000000000) (bvslt (ite c!42543 (index!6558 lt!126575) (index!6561 lt!126575)) (bvadd (mask!10882 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23760 d!61421))

(declare-fun d!61423 () Bool)

(assert (=> d!61423 (= (array_inv!3847 (_keys!6811 thiss!1504)) (bvsge (size!6199 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252458 d!61423))

(declare-fun d!61425 () Bool)

(assert (=> d!61425 (= (array_inv!3848 (_values!4646 thiss!1504)) (bvsge (size!6198 (_values!4646 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252458 d!61425))

(declare-fun b!252703 () Bool)

(declare-fun res!123693 () Bool)

(declare-fun e!163858 () Bool)

(assert (=> b!252703 (=> (not res!123693) (not e!163858))))

(assert (=> b!252703 (= res!123693 (not (validKeyInArray!0 (select (arr!5852 (_keys!6811 thiss!1504)) index!297))))))

(declare-fun b!252706 () Bool)

(declare-fun e!163857 () Bool)

(assert (=> b!252706 (= e!163857 (= (arrayCountValidKeys!0 (array!12348 (store (arr!5852 (_keys!6811 thiss!1504)) index!297 key!932) (size!6199 (_keys!6811 thiss!1504))) #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6811 thiss!1504) #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!252705 () Bool)

(assert (=> b!252705 (= e!163858 (bvslt (size!6199 (_keys!6811 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!252704 () Bool)

(declare-fun res!123695 () Bool)

(assert (=> b!252704 (=> (not res!123695) (not e!163858))))

(assert (=> b!252704 (= res!123695 (validKeyInArray!0 key!932))))

(declare-fun d!61427 () Bool)

(assert (=> d!61427 e!163857))

(declare-fun res!123696 () Bool)

(assert (=> d!61427 (=> (not res!123696) (not e!163857))))

(assert (=> d!61427 (= res!123696 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6199 (_keys!6811 thiss!1504)))))))

(declare-fun lt!126739 () Unit!7784)

(declare-fun choose!1 (array!12347 (_ BitVec 32) (_ BitVec 64)) Unit!7784)

(assert (=> d!61427 (= lt!126739 (choose!1 (_keys!6811 thiss!1504) index!297 key!932))))

(assert (=> d!61427 e!163858))

(declare-fun res!123694 () Bool)

(assert (=> d!61427 (=> (not res!123694) (not e!163858))))

(assert (=> d!61427 (= res!123694 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6199 (_keys!6811 thiss!1504)))))))

(assert (=> d!61427 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6811 thiss!1504) index!297 key!932) lt!126739)))

(assert (= (and d!61427 res!123694) b!252703))

(assert (= (and b!252703 res!123693) b!252704))

(assert (= (and b!252704 res!123695) b!252705))

(assert (= (and d!61427 res!123696) b!252706))

(declare-fun m!268947 () Bool)

(assert (=> b!252703 m!268947))

(assert (=> b!252703 m!268947))

(declare-fun m!268949 () Bool)

(assert (=> b!252703 m!268949))

(assert (=> b!252706 m!268721))

(declare-fun m!268951 () Bool)

(assert (=> b!252706 m!268951))

(assert (=> b!252706 m!268723))

(declare-fun m!268953 () Bool)

(assert (=> b!252704 m!268953))

(declare-fun m!268955 () Bool)

(assert (=> d!61427 m!268955))

(assert (=> b!252447 d!61427))

(declare-fun d!61429 () Bool)

(declare-fun res!123704 () Bool)

(declare-fun e!163867 () Bool)

(assert (=> d!61429 (=> res!123704 e!163867)))

(assert (=> d!61429 (= res!123704 (bvsge #b00000000000000000000000000000000 (size!6199 lt!126578)))))

(assert (=> d!61429 (= (arrayNoDuplicates!0 lt!126578 #b00000000000000000000000000000000 Nil!3652) e!163867)))

(declare-fun bm!23800 () Bool)

(declare-fun call!23803 () Bool)

(declare-fun c!42594 () Bool)

(assert (=> bm!23800 (= call!23803 (arrayNoDuplicates!0 lt!126578 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42594 (Cons!3651 (select (arr!5852 lt!126578) #b00000000000000000000000000000000) Nil!3652) Nil!3652)))))

(declare-fun b!252717 () Bool)

(declare-fun e!163870 () Bool)

(declare-fun contains!1806 (List!3655 (_ BitVec 64)) Bool)

(assert (=> b!252717 (= e!163870 (contains!1806 Nil!3652 (select (arr!5852 lt!126578) #b00000000000000000000000000000000)))))

(declare-fun b!252718 () Bool)

(declare-fun e!163869 () Bool)

(assert (=> b!252718 (= e!163869 call!23803)))

(declare-fun b!252719 () Bool)

(declare-fun e!163868 () Bool)

(assert (=> b!252719 (= e!163867 e!163868)))

(declare-fun res!123705 () Bool)

(assert (=> b!252719 (=> (not res!123705) (not e!163868))))

(assert (=> b!252719 (= res!123705 (not e!163870))))

(declare-fun res!123703 () Bool)

(assert (=> b!252719 (=> (not res!123703) (not e!163870))))

(assert (=> b!252719 (= res!123703 (validKeyInArray!0 (select (arr!5852 lt!126578) #b00000000000000000000000000000000)))))

(declare-fun b!252720 () Bool)

(assert (=> b!252720 (= e!163869 call!23803)))

(declare-fun b!252721 () Bool)

(assert (=> b!252721 (= e!163868 e!163869)))

(assert (=> b!252721 (= c!42594 (validKeyInArray!0 (select (arr!5852 lt!126578) #b00000000000000000000000000000000)))))

(assert (= (and d!61429 (not res!123704)) b!252719))

(assert (= (and b!252719 res!123703) b!252717))

(assert (= (and b!252719 res!123705) b!252721))

(assert (= (and b!252721 c!42594) b!252718))

(assert (= (and b!252721 (not c!42594)) b!252720))

(assert (= (or b!252718 b!252720) bm!23800))

(declare-fun m!268957 () Bool)

(assert (=> bm!23800 m!268957))

(declare-fun m!268959 () Bool)

(assert (=> bm!23800 m!268959))

(assert (=> b!252717 m!268957))

(assert (=> b!252717 m!268957))

(declare-fun m!268961 () Bool)

(assert (=> b!252717 m!268961))

(assert (=> b!252719 m!268957))

(assert (=> b!252719 m!268957))

(declare-fun m!268963 () Bool)

(assert (=> b!252719 m!268963))

(assert (=> b!252721 m!268957))

(assert (=> b!252721 m!268957))

(assert (=> b!252721 m!268963))

(assert (=> b!252447 d!61429))

(declare-fun b!252730 () Bool)

(declare-fun e!163875 () (_ BitVec 32))

(declare-fun call!23806 () (_ BitVec 32))

(assert (=> b!252730 (= e!163875 (bvadd #b00000000000000000000000000000001 call!23806))))

(declare-fun d!61431 () Bool)

(declare-fun lt!126742 () (_ BitVec 32))

(assert (=> d!61431 (and (bvsge lt!126742 #b00000000000000000000000000000000) (bvsle lt!126742 (bvsub (size!6199 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!163876 () (_ BitVec 32))

(assert (=> d!61431 (= lt!126742 e!163876)))

(declare-fun c!42599 () Bool)

(assert (=> d!61431 (= c!42599 (bvsge #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))))))

(assert (=> d!61431 (and (bvsle #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6199 (_keys!6811 thiss!1504)) (size!6199 (_keys!6811 thiss!1504))))))

(assert (=> d!61431 (= (arrayCountValidKeys!0 (_keys!6811 thiss!1504) #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))) lt!126742)))

(declare-fun b!252731 () Bool)

(assert (=> b!252731 (= e!163876 #b00000000000000000000000000000000)))

(declare-fun b!252732 () Bool)

(assert (=> b!252732 (= e!163875 call!23806)))

(declare-fun b!252733 () Bool)

(assert (=> b!252733 (= e!163876 e!163875)))

(declare-fun c!42600 () Bool)

(assert (=> b!252733 (= c!42600 (validKeyInArray!0 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23803 () Bool)

(assert (=> bm!23803 (= call!23806 (arrayCountValidKeys!0 (_keys!6811 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6199 (_keys!6811 thiss!1504))))))

(assert (= (and d!61431 c!42599) b!252731))

(assert (= (and d!61431 (not c!42599)) b!252733))

(assert (= (and b!252733 c!42600) b!252730))

(assert (= (and b!252733 (not c!42600)) b!252732))

(assert (= (or b!252730 b!252732) bm!23803))

(assert (=> b!252733 m!268867))

(assert (=> b!252733 m!268867))

(assert (=> b!252733 m!268869))

(declare-fun m!268965 () Bool)

(assert (=> bm!23803 m!268965))

(assert (=> b!252447 d!61431))

(declare-fun d!61433 () Bool)

(assert (=> d!61433 (= (validMask!0 (mask!10882 thiss!1504)) (and (or (= (mask!10882 thiss!1504) #b00000000000000000000000000000111) (= (mask!10882 thiss!1504) #b00000000000000000000000000001111) (= (mask!10882 thiss!1504) #b00000000000000000000000000011111) (= (mask!10882 thiss!1504) #b00000000000000000000000000111111) (= (mask!10882 thiss!1504) #b00000000000000000000000001111111) (= (mask!10882 thiss!1504) #b00000000000000000000000011111111) (= (mask!10882 thiss!1504) #b00000000000000000000000111111111) (= (mask!10882 thiss!1504) #b00000000000000000000001111111111) (= (mask!10882 thiss!1504) #b00000000000000000000011111111111) (= (mask!10882 thiss!1504) #b00000000000000000000111111111111) (= (mask!10882 thiss!1504) #b00000000000000000001111111111111) (= (mask!10882 thiss!1504) #b00000000000000000011111111111111) (= (mask!10882 thiss!1504) #b00000000000000000111111111111111) (= (mask!10882 thiss!1504) #b00000000000000001111111111111111) (= (mask!10882 thiss!1504) #b00000000000000011111111111111111) (= (mask!10882 thiss!1504) #b00000000000000111111111111111111) (= (mask!10882 thiss!1504) #b00000000000001111111111111111111) (= (mask!10882 thiss!1504) #b00000000000011111111111111111111) (= (mask!10882 thiss!1504) #b00000000000111111111111111111111) (= (mask!10882 thiss!1504) #b00000000001111111111111111111111) (= (mask!10882 thiss!1504) #b00000000011111111111111111111111) (= (mask!10882 thiss!1504) #b00000000111111111111111111111111) (= (mask!10882 thiss!1504) #b00000001111111111111111111111111) (= (mask!10882 thiss!1504) #b00000011111111111111111111111111) (= (mask!10882 thiss!1504) #b00000111111111111111111111111111) (= (mask!10882 thiss!1504) #b00001111111111111111111111111111) (= (mask!10882 thiss!1504) #b00011111111111111111111111111111) (= (mask!10882 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10882 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!252447 d!61433))

(declare-fun d!61435 () Bool)

(declare-fun e!163879 () Bool)

(assert (=> d!61435 e!163879))

(declare-fun res!123708 () Bool)

(assert (=> d!61435 (=> (not res!123708) (not e!163879))))

(assert (=> d!61435 (= res!123708 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6199 (_keys!6811 thiss!1504)))))))

(declare-fun lt!126745 () Unit!7784)

(declare-fun choose!41 (array!12347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3655) Unit!7784)

(assert (=> d!61435 (= lt!126745 (choose!41 (_keys!6811 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3652))))

(assert (=> d!61435 (bvslt (size!6199 (_keys!6811 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61435 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6811 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3652) lt!126745)))

(declare-fun b!252736 () Bool)

(assert (=> b!252736 (= e!163879 (arrayNoDuplicates!0 (array!12348 (store (arr!5852 (_keys!6811 thiss!1504)) index!297 key!932) (size!6199 (_keys!6811 thiss!1504))) #b00000000000000000000000000000000 Nil!3652))))

(assert (= (and d!61435 res!123708) b!252736))

(declare-fun m!268967 () Bool)

(assert (=> d!61435 m!268967))

(assert (=> b!252736 m!268721))

(declare-fun m!268969 () Bool)

(assert (=> b!252736 m!268969))

(assert (=> b!252447 d!61435))

(declare-fun b!252737 () Bool)

(declare-fun e!163880 () Bool)

(declare-fun call!23807 () Bool)

(assert (=> b!252737 (= e!163880 call!23807)))

(declare-fun b!252738 () Bool)

(declare-fun e!163882 () Bool)

(declare-fun e!163881 () Bool)

(assert (=> b!252738 (= e!163882 e!163881)))

(declare-fun c!42601 () Bool)

(assert (=> b!252738 (= c!42601 (validKeyInArray!0 (select (arr!5852 lt!126578) #b00000000000000000000000000000000)))))

(declare-fun b!252739 () Bool)

(assert (=> b!252739 (= e!163881 e!163880)))

(declare-fun lt!126748 () (_ BitVec 64))

(assert (=> b!252739 (= lt!126748 (select (arr!5852 lt!126578) #b00000000000000000000000000000000))))

(declare-fun lt!126746 () Unit!7784)

(assert (=> b!252739 (= lt!126746 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126578 lt!126748 #b00000000000000000000000000000000))))

(assert (=> b!252739 (arrayContainsKey!0 lt!126578 lt!126748 #b00000000000000000000000000000000)))

(declare-fun lt!126747 () Unit!7784)

(assert (=> b!252739 (= lt!126747 lt!126746)))

(declare-fun res!123710 () Bool)

(assert (=> b!252739 (= res!123710 (= (seekEntryOrOpen!0 (select (arr!5852 lt!126578) #b00000000000000000000000000000000) lt!126578 (mask!10882 thiss!1504)) (Found!1097 #b00000000000000000000000000000000)))))

(assert (=> b!252739 (=> (not res!123710) (not e!163880))))

(declare-fun bm!23804 () Bool)

(assert (=> bm!23804 (= call!23807 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126578 (mask!10882 thiss!1504)))))

(declare-fun b!252740 () Bool)

(assert (=> b!252740 (= e!163881 call!23807)))

(declare-fun d!61437 () Bool)

(declare-fun res!123709 () Bool)

(assert (=> d!61437 (=> res!123709 e!163882)))

(assert (=> d!61437 (= res!123709 (bvsge #b00000000000000000000000000000000 (size!6199 lt!126578)))))

(assert (=> d!61437 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126578 (mask!10882 thiss!1504)) e!163882)))

(assert (= (and d!61437 (not res!123709)) b!252738))

(assert (= (and b!252738 c!42601) b!252739))

(assert (= (and b!252738 (not c!42601)) b!252740))

(assert (= (and b!252739 res!123710) b!252737))

(assert (= (or b!252737 b!252740) bm!23804))

(assert (=> b!252738 m!268957))

(assert (=> b!252738 m!268957))

(assert (=> b!252738 m!268963))

(assert (=> b!252739 m!268957))

(declare-fun m!268971 () Bool)

(assert (=> b!252739 m!268971))

(declare-fun m!268973 () Bool)

(assert (=> b!252739 m!268973))

(assert (=> b!252739 m!268957))

(declare-fun m!268975 () Bool)

(assert (=> b!252739 m!268975))

(declare-fun m!268977 () Bool)

(assert (=> bm!23804 m!268977))

(assert (=> b!252447 d!61437))

(declare-fun b!252741 () Bool)

(declare-fun e!163883 () (_ BitVec 32))

(declare-fun call!23808 () (_ BitVec 32))

(assert (=> b!252741 (= e!163883 (bvadd #b00000000000000000000000000000001 call!23808))))

(declare-fun d!61439 () Bool)

(declare-fun lt!126749 () (_ BitVec 32))

(assert (=> d!61439 (and (bvsge lt!126749 #b00000000000000000000000000000000) (bvsle lt!126749 (bvsub (size!6199 lt!126578) #b00000000000000000000000000000000)))))

(declare-fun e!163884 () (_ BitVec 32))

(assert (=> d!61439 (= lt!126749 e!163884)))

(declare-fun c!42602 () Bool)

(assert (=> d!61439 (= c!42602 (bvsge #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))))))

(assert (=> d!61439 (and (bvsle #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6199 (_keys!6811 thiss!1504)) (size!6199 lt!126578)))))

(assert (=> d!61439 (= (arrayCountValidKeys!0 lt!126578 #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))) lt!126749)))

(declare-fun b!252742 () Bool)

(assert (=> b!252742 (= e!163884 #b00000000000000000000000000000000)))

(declare-fun b!252743 () Bool)

(assert (=> b!252743 (= e!163883 call!23808)))

(declare-fun b!252744 () Bool)

(assert (=> b!252744 (= e!163884 e!163883)))

(declare-fun c!42603 () Bool)

(assert (=> b!252744 (= c!42603 (validKeyInArray!0 (select (arr!5852 lt!126578) #b00000000000000000000000000000000)))))

(declare-fun bm!23805 () Bool)

(assert (=> bm!23805 (= call!23808 (arrayCountValidKeys!0 lt!126578 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6199 (_keys!6811 thiss!1504))))))

(assert (= (and d!61439 c!42602) b!252742))

(assert (= (and d!61439 (not c!42602)) b!252744))

(assert (= (and b!252744 c!42603) b!252741))

(assert (= (and b!252744 (not c!42603)) b!252743))

(assert (= (or b!252741 b!252743) bm!23805))

(assert (=> b!252744 m!268957))

(assert (=> b!252744 m!268957))

(assert (=> b!252744 m!268963))

(declare-fun m!268979 () Bool)

(assert (=> bm!23805 m!268979))

(assert (=> b!252447 d!61439))

(declare-fun d!61441 () Bool)

(declare-fun res!123715 () Bool)

(declare-fun e!163889 () Bool)

(assert (=> d!61441 (=> res!123715 e!163889)))

(assert (=> d!61441 (= res!123715 (= (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61441 (= (arrayContainsKey!0 (_keys!6811 thiss!1504) key!932 #b00000000000000000000000000000000) e!163889)))

(declare-fun b!252749 () Bool)

(declare-fun e!163890 () Bool)

(assert (=> b!252749 (= e!163889 e!163890)))

(declare-fun res!123716 () Bool)

(assert (=> b!252749 (=> (not res!123716) (not e!163890))))

(assert (=> b!252749 (= res!123716 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6199 (_keys!6811 thiss!1504))))))

(declare-fun b!252750 () Bool)

(assert (=> b!252750 (= e!163890 (arrayContainsKey!0 (_keys!6811 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61441 (not res!123715)) b!252749))

(assert (= (and b!252749 res!123716) b!252750))

(assert (=> d!61441 m!268867))

(declare-fun m!268981 () Bool)

(assert (=> b!252750 m!268981))

(assert (=> b!252447 d!61441))

(declare-fun d!61443 () Bool)

(declare-fun e!163893 () Bool)

(assert (=> d!61443 e!163893))

(declare-fun res!123719 () Bool)

(assert (=> d!61443 (=> (not res!123719) (not e!163893))))

(assert (=> d!61443 (= res!123719 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6199 (_keys!6811 thiss!1504)))))))

(declare-fun lt!126752 () Unit!7784)

(declare-fun choose!102 ((_ BitVec 64) array!12347 (_ BitVec 32) (_ BitVec 32)) Unit!7784)

(assert (=> d!61443 (= lt!126752 (choose!102 key!932 (_keys!6811 thiss!1504) index!297 (mask!10882 thiss!1504)))))

(assert (=> d!61443 (validMask!0 (mask!10882 thiss!1504))))

(assert (=> d!61443 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6811 thiss!1504) index!297 (mask!10882 thiss!1504)) lt!126752)))

(declare-fun b!252753 () Bool)

(assert (=> b!252753 (= e!163893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12348 (store (arr!5852 (_keys!6811 thiss!1504)) index!297 key!932) (size!6199 (_keys!6811 thiss!1504))) (mask!10882 thiss!1504)))))

(assert (= (and d!61443 res!123719) b!252753))

(declare-fun m!268983 () Bool)

(assert (=> d!61443 m!268983))

(assert (=> d!61443 m!268711))

(assert (=> b!252753 m!268721))

(declare-fun m!268985 () Bool)

(assert (=> b!252753 m!268985))

(assert (=> b!252447 d!61443))

(declare-fun d!61445 () Bool)

(declare-fun res!123726 () Bool)

(declare-fun e!163896 () Bool)

(assert (=> d!61445 (=> (not res!123726) (not e!163896))))

(declare-fun simpleValid!267 (LongMapFixedSize!3724) Bool)

(assert (=> d!61445 (= res!123726 (simpleValid!267 thiss!1504))))

(assert (=> d!61445 (= (valid!1463 thiss!1504) e!163896)))

(declare-fun b!252760 () Bool)

(declare-fun res!123727 () Bool)

(assert (=> b!252760 (=> (not res!123727) (not e!163896))))

(assert (=> b!252760 (= res!123727 (= (arrayCountValidKeys!0 (_keys!6811 thiss!1504) #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))) (_size!1911 thiss!1504)))))

(declare-fun b!252761 () Bool)

(declare-fun res!123728 () Bool)

(assert (=> b!252761 (=> (not res!123728) (not e!163896))))

(assert (=> b!252761 (= res!123728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6811 thiss!1504) (mask!10882 thiss!1504)))))

(declare-fun b!252762 () Bool)

(assert (=> b!252762 (= e!163896 (arrayNoDuplicates!0 (_keys!6811 thiss!1504) #b00000000000000000000000000000000 Nil!3652))))

(assert (= (and d!61445 res!123726) b!252760))

(assert (= (and b!252760 res!123727) b!252761))

(assert (= (and b!252761 res!123728) b!252762))

(declare-fun m!268987 () Bool)

(assert (=> d!61445 m!268987))

(assert (=> b!252760 m!268723))

(assert (=> b!252761 m!268737))

(assert (=> b!252762 m!268743))

(assert (=> start!24142 d!61445))

(declare-fun d!61447 () Bool)

(declare-fun res!123730 () Bool)

(declare-fun e!163897 () Bool)

(assert (=> d!61447 (=> res!123730 e!163897)))

(assert (=> d!61447 (= res!123730 (bvsge #b00000000000000000000000000000000 (size!6199 (_keys!6811 thiss!1504))))))

(assert (=> d!61447 (= (arrayNoDuplicates!0 (_keys!6811 thiss!1504) #b00000000000000000000000000000000 Nil!3652) e!163897)))

(declare-fun bm!23806 () Bool)

(declare-fun call!23809 () Bool)

(declare-fun c!42604 () Bool)

(assert (=> bm!23806 (= call!23809 (arrayNoDuplicates!0 (_keys!6811 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42604 (Cons!3651 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000) Nil!3652) Nil!3652)))))

(declare-fun b!252763 () Bool)

(declare-fun e!163900 () Bool)

(assert (=> b!252763 (= e!163900 (contains!1806 Nil!3652 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252764 () Bool)

(declare-fun e!163899 () Bool)

(assert (=> b!252764 (= e!163899 call!23809)))

(declare-fun b!252765 () Bool)

(declare-fun e!163898 () Bool)

(assert (=> b!252765 (= e!163897 e!163898)))

(declare-fun res!123731 () Bool)

(assert (=> b!252765 (=> (not res!123731) (not e!163898))))

(assert (=> b!252765 (= res!123731 (not e!163900))))

(declare-fun res!123729 () Bool)

(assert (=> b!252765 (=> (not res!123729) (not e!163900))))

(assert (=> b!252765 (= res!123729 (validKeyInArray!0 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252766 () Bool)

(assert (=> b!252766 (= e!163899 call!23809)))

(declare-fun b!252767 () Bool)

(assert (=> b!252767 (= e!163898 e!163899)))

(assert (=> b!252767 (= c!42604 (validKeyInArray!0 (select (arr!5852 (_keys!6811 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61447 (not res!123730)) b!252765))

(assert (= (and b!252765 res!123729) b!252763))

(assert (= (and b!252765 res!123731) b!252767))

(assert (= (and b!252767 c!42604) b!252764))

(assert (= (and b!252767 (not c!42604)) b!252766))

(assert (= (or b!252764 b!252766) bm!23806))

(assert (=> bm!23806 m!268867))

(declare-fun m!268989 () Bool)

(assert (=> bm!23806 m!268989))

(assert (=> b!252763 m!268867))

(assert (=> b!252763 m!268867))

(declare-fun m!268991 () Bool)

(assert (=> b!252763 m!268991))

(assert (=> b!252765 m!268867))

(assert (=> b!252765 m!268867))

(assert (=> b!252765 m!268869))

(assert (=> b!252767 m!268867))

(assert (=> b!252767 m!268867))

(assert (=> b!252767 m!268869))

(assert (=> b!252445 d!61447))

(assert (=> bm!23761 d!61441))

(declare-fun b!252780 () Bool)

(declare-fun lt!126760 () SeekEntryResult!1097)

(declare-fun e!163909 () SeekEntryResult!1097)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12347 (_ BitVec 32)) SeekEntryResult!1097)

(assert (=> b!252780 (= e!163909 (seekKeyOrZeroReturnVacant!0 (x!24735 lt!126760) (index!6560 lt!126760) (index!6560 lt!126760) key!932 (_keys!6811 thiss!1504) (mask!10882 thiss!1504)))))

(declare-fun b!252781 () Bool)

(declare-fun c!42611 () Bool)

(declare-fun lt!126759 () (_ BitVec 64))

(assert (=> b!252781 (= c!42611 (= lt!126759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163907 () SeekEntryResult!1097)

(assert (=> b!252781 (= e!163907 e!163909)))

(declare-fun b!252782 () Bool)

(declare-fun e!163908 () SeekEntryResult!1097)

(assert (=> b!252782 (= e!163908 e!163907)))

(assert (=> b!252782 (= lt!126759 (select (arr!5852 (_keys!6811 thiss!1504)) (index!6560 lt!126760)))))

(declare-fun c!42613 () Bool)

(assert (=> b!252782 (= c!42613 (= lt!126759 key!932))))

(declare-fun b!252783 () Bool)

(assert (=> b!252783 (= e!163907 (Found!1097 (index!6560 lt!126760)))))

(declare-fun b!252785 () Bool)

(assert (=> b!252785 (= e!163909 (MissingZero!1097 (index!6560 lt!126760)))))

(declare-fun d!61449 () Bool)

(declare-fun lt!126761 () SeekEntryResult!1097)

(assert (=> d!61449 (and (or ((_ is Undefined!1097) lt!126761) (not ((_ is Found!1097) lt!126761)) (and (bvsge (index!6559 lt!126761) #b00000000000000000000000000000000) (bvslt (index!6559 lt!126761) (size!6199 (_keys!6811 thiss!1504))))) (or ((_ is Undefined!1097) lt!126761) ((_ is Found!1097) lt!126761) (not ((_ is MissingZero!1097) lt!126761)) (and (bvsge (index!6558 lt!126761) #b00000000000000000000000000000000) (bvslt (index!6558 lt!126761) (size!6199 (_keys!6811 thiss!1504))))) (or ((_ is Undefined!1097) lt!126761) ((_ is Found!1097) lt!126761) ((_ is MissingZero!1097) lt!126761) (not ((_ is MissingVacant!1097) lt!126761)) (and (bvsge (index!6561 lt!126761) #b00000000000000000000000000000000) (bvslt (index!6561 lt!126761) (size!6199 (_keys!6811 thiss!1504))))) (or ((_ is Undefined!1097) lt!126761) (ite ((_ is Found!1097) lt!126761) (= (select (arr!5852 (_keys!6811 thiss!1504)) (index!6559 lt!126761)) key!932) (ite ((_ is MissingZero!1097) lt!126761) (= (select (arr!5852 (_keys!6811 thiss!1504)) (index!6558 lt!126761)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1097) lt!126761) (= (select (arr!5852 (_keys!6811 thiss!1504)) (index!6561 lt!126761)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61449 (= lt!126761 e!163908)))

(declare-fun c!42612 () Bool)

(assert (=> d!61449 (= c!42612 (and ((_ is Intermediate!1097) lt!126760) (undefined!1909 lt!126760)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12347 (_ BitVec 32)) SeekEntryResult!1097)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61449 (= lt!126760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10882 thiss!1504)) key!932 (_keys!6811 thiss!1504) (mask!10882 thiss!1504)))))

(assert (=> d!61449 (validMask!0 (mask!10882 thiss!1504))))

(assert (=> d!61449 (= (seekEntryOrOpen!0 key!932 (_keys!6811 thiss!1504) (mask!10882 thiss!1504)) lt!126761)))

(declare-fun b!252784 () Bool)

(assert (=> b!252784 (= e!163908 Undefined!1097)))

(assert (= (and d!61449 c!42612) b!252784))

(assert (= (and d!61449 (not c!42612)) b!252782))

(assert (= (and b!252782 c!42613) b!252783))

(assert (= (and b!252782 (not c!42613)) b!252781))

(assert (= (and b!252781 c!42611) b!252785))

(assert (= (and b!252781 (not c!42611)) b!252780))

(declare-fun m!268993 () Bool)

(assert (=> b!252780 m!268993))

(declare-fun m!268995 () Bool)

(assert (=> b!252782 m!268995))

(declare-fun m!268997 () Bool)

(assert (=> d!61449 m!268997))

(declare-fun m!268999 () Bool)

(assert (=> d!61449 m!268999))

(assert (=> d!61449 m!268711))

(declare-fun m!269001 () Bool)

(assert (=> d!61449 m!269001))

(declare-fun m!269003 () Bool)

(assert (=> d!61449 m!269003))

(declare-fun m!269005 () Bool)

(assert (=> d!61449 m!269005))

(assert (=> d!61449 m!268997))

(assert (=> b!252443 d!61449))

(declare-fun d!61451 () Bool)

(assert (=> d!61451 (contains!1804 (getCurrentListMap!1393 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)) key!932)))

(declare-fun lt!126764 () Unit!7784)

(declare-fun choose!1211 (array!12347 array!12345 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) (_ BitVec 32) Int) Unit!7784)

(assert (=> d!61451 (= lt!126764 (choose!1211 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(assert (=> d!61451 (validMask!0 (mask!10882 thiss!1504))))

(assert (=> d!61451 (= (lemmaArrayContainsKeyThenInListMap!220 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)) lt!126764)))

(declare-fun bs!9050 () Bool)

(assert (= bs!9050 d!61451))

(assert (=> bs!9050 m!268733))

(assert (=> bs!9050 m!268733))

(assert (=> bs!9050 m!268735))

(declare-fun m!269007 () Bool)

(assert (=> bs!9050 m!269007))

(assert (=> bs!9050 m!268711))

(assert (=> b!252452 d!61451))

(declare-fun b!252802 () Bool)

(declare-fun e!163918 () Bool)

(declare-fun e!163920 () Bool)

(assert (=> b!252802 (= e!163918 e!163920)))

(declare-fun c!42619 () Bool)

(declare-fun lt!126770 () SeekEntryResult!1097)

(assert (=> b!252802 (= c!42619 ((_ is MissingVacant!1097) lt!126770))))

(declare-fun bm!23811 () Bool)

(declare-fun call!23815 () Bool)

(assert (=> bm!23811 (= call!23815 (arrayContainsKey!0 (_keys!6811 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252803 () Bool)

(declare-fun res!123743 () Bool)

(declare-fun e!163919 () Bool)

(assert (=> b!252803 (=> (not res!123743) (not e!163919))))

(declare-fun call!23814 () Bool)

(assert (=> b!252803 (= res!123743 call!23814)))

(assert (=> b!252803 (= e!163920 e!163919)))

(declare-fun b!252804 () Bool)

(assert (=> b!252804 (= e!163920 ((_ is Undefined!1097) lt!126770))))

(declare-fun b!252805 () Bool)

(declare-fun res!123742 () Bool)

(assert (=> b!252805 (=> (not res!123742) (not e!163919))))

(assert (=> b!252805 (= res!123742 (= (select (arr!5852 (_keys!6811 thiss!1504)) (index!6561 lt!126770)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252805 (and (bvsge (index!6561 lt!126770) #b00000000000000000000000000000000) (bvslt (index!6561 lt!126770) (size!6199 (_keys!6811 thiss!1504))))))

(declare-fun b!252806 () Bool)

(declare-fun e!163921 () Bool)

(assert (=> b!252806 (= e!163918 e!163921)))

(declare-fun res!123740 () Bool)

(assert (=> b!252806 (= res!123740 call!23814)))

(assert (=> b!252806 (=> (not res!123740) (not e!163921))))

(declare-fun b!252807 () Bool)

(assert (=> b!252807 (= e!163921 (not call!23815))))

(declare-fun d!61453 () Bool)

(assert (=> d!61453 e!163918))

(declare-fun c!42618 () Bool)

(assert (=> d!61453 (= c!42618 ((_ is MissingZero!1097) lt!126770))))

(assert (=> d!61453 (= lt!126770 (seekEntryOrOpen!0 key!932 (_keys!6811 thiss!1504) (mask!10882 thiss!1504)))))

(declare-fun lt!126769 () Unit!7784)

(declare-fun choose!1212 (array!12347 array!12345 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) Int) Unit!7784)

(assert (=> d!61453 (= lt!126769 (choose!1212 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)))))

(assert (=> d!61453 (validMask!0 (mask!10882 thiss!1504))))

(assert (=> d!61453 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!394 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)) lt!126769)))

(declare-fun b!252808 () Bool)

(assert (=> b!252808 (= e!163919 (not call!23815))))

(declare-fun b!252809 () Bool)

(assert (=> b!252809 (and (bvsge (index!6558 lt!126770) #b00000000000000000000000000000000) (bvslt (index!6558 lt!126770) (size!6199 (_keys!6811 thiss!1504))))))

(declare-fun res!123741 () Bool)

(assert (=> b!252809 (= res!123741 (= (select (arr!5852 (_keys!6811 thiss!1504)) (index!6558 lt!126770)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252809 (=> (not res!123741) (not e!163921))))

(declare-fun bm!23812 () Bool)

(assert (=> bm!23812 (= call!23814 (inRange!0 (ite c!42618 (index!6558 lt!126770) (index!6561 lt!126770)) (mask!10882 thiss!1504)))))

(assert (= (and d!61453 c!42618) b!252806))

(assert (= (and d!61453 (not c!42618)) b!252802))

(assert (= (and b!252806 res!123740) b!252809))

(assert (= (and b!252809 res!123741) b!252807))

(assert (= (and b!252802 c!42619) b!252803))

(assert (= (and b!252802 (not c!42619)) b!252804))

(assert (= (and b!252803 res!123743) b!252805))

(assert (= (and b!252805 res!123742) b!252808))

(assert (= (or b!252806 b!252803) bm!23812))

(assert (= (or b!252807 b!252808) bm!23811))

(assert (=> d!61453 m!268739))

(declare-fun m!269009 () Bool)

(assert (=> d!61453 m!269009))

(assert (=> d!61453 m!268711))

(assert (=> bm!23811 m!268727))

(declare-fun m!269011 () Bool)

(assert (=> b!252809 m!269011))

(declare-fun m!269013 () Bool)

(assert (=> b!252805 m!269013))

(declare-fun m!269015 () Bool)

(assert (=> bm!23812 m!269015))

(assert (=> b!252462 d!61453))

(declare-fun condMapEmpty!11082 () Bool)

(declare-fun mapDefault!11082 () ValueCell!2912)

(assert (=> mapNonEmpty!11073 (= condMapEmpty!11082 (= mapRest!11073 ((as const (Array (_ BitVec 32) ValueCell!2912)) mapDefault!11082)))))

(declare-fun e!163926 () Bool)

(declare-fun mapRes!11082 () Bool)

(assert (=> mapNonEmpty!11073 (= tp!23226 (and e!163926 mapRes!11082))))

(declare-fun mapNonEmpty!11082 () Bool)

(declare-fun tp!23241 () Bool)

(declare-fun e!163927 () Bool)

(assert (=> mapNonEmpty!11082 (= mapRes!11082 (and tp!23241 e!163927))))

(declare-fun mapValue!11082 () ValueCell!2912)

(declare-fun mapKey!11082 () (_ BitVec 32))

(declare-fun mapRest!11082 () (Array (_ BitVec 32) ValueCell!2912))

(assert (=> mapNonEmpty!11082 (= mapRest!11073 (store mapRest!11082 mapKey!11082 mapValue!11082))))

(declare-fun b!252817 () Bool)

(assert (=> b!252817 (= e!163926 tp_is_empty!6511)))

(declare-fun b!252816 () Bool)

(assert (=> b!252816 (= e!163927 tp_is_empty!6511)))

(declare-fun mapIsEmpty!11082 () Bool)

(assert (=> mapIsEmpty!11082 mapRes!11082))

(assert (= (and mapNonEmpty!11073 condMapEmpty!11082) mapIsEmpty!11082))

(assert (= (and mapNonEmpty!11073 (not condMapEmpty!11082)) mapNonEmpty!11082))

(assert (= (and mapNonEmpty!11082 ((_ is ValueCellFull!2912) mapValue!11082)) b!252816))

(assert (= (and mapNonEmpty!11073 ((_ is ValueCellFull!2912) mapDefault!11082)) b!252817))

(declare-fun m!269017 () Bool)

(assert (=> mapNonEmpty!11082 m!269017))

(declare-fun b_lambda!8143 () Bool)

(assert (= b_lambda!8141 (or (and b!252458 b_free!6649) b_lambda!8143)))

(check-sat (not b!252717) (not b_lambda!8143) (not b!252736) (not bm!23811) (not b!252767) (not d!61451) (not d!61443) (not b!252765) (not bm!23792) (not b!252733) (not d!61435) (not bm!23806) (not b!252689) (not b!252682) (not b!252612) (not d!61417) (not b!252719) (not bm!23797) (not b!252619) (not b!252613) (not b!252753) (not b!252721) (not b!252761) (not d!61449) (not b!252678) (not bm!23803) (not b!252744) (not b!252686) (not bm!23805) tp_is_empty!6511 (not bm!23776) (not b!252739) (not b!252706) (not bm!23800) b_and!13705 (not d!61445) (not d!61419) (not b!252704) (not b_next!6649) (not b!252750) (not mapNonEmpty!11082) (not b!252762) (not b!252780) (not b!252627) (not d!61453) (not b!252690) (not bm!23794) (not b!252691) (not d!61413) (not b!252703) (not bm!23796) (not b!252676) (not b!252760) (not d!61427) (not bm!23812) (not b!252763) (not bm!23804) (not b!252738) (not b!252629) (not b!252685))
(check-sat b_and!13705 (not b_next!6649))
