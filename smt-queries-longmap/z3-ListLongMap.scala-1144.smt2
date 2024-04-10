; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23704 () Bool)

(assert start!23704)

(declare-fun b!249111 () Bool)

(declare-fun b_free!6615 () Bool)

(declare-fun b_next!6615 () Bool)

(assert (=> b!249111 (= b_free!6615 (not b_next!6615))))

(declare-fun tp!23102 () Bool)

(declare-fun b_and!13623 () Bool)

(assert (=> b!249111 (= tp!23102 b_and!13623)))

(declare-fun b!249103 () Bool)

(declare-fun e!161582 () Bool)

(declare-fun e!161573 () Bool)

(assert (=> b!249103 (= e!161582 e!161573)))

(declare-fun res!122055 () Bool)

(declare-fun call!23379 () Bool)

(assert (=> b!249103 (= res!122055 call!23379)))

(assert (=> b!249103 (=> (not res!122055) (not e!161573))))

(declare-fun bm!23375 () Bool)

(declare-fun call!23378 () Bool)

(declare-datatypes ((V!8283 0))(
  ( (V!8284 (val!3283 Int)) )
))
(declare-datatypes ((ValueCell!2895 0))(
  ( (ValueCellFull!2895 (v!5344 V!8283)) (EmptyCell!2895) )
))
(declare-datatypes ((array!12267 0))(
  ( (array!12268 (arr!5818 (Array (_ BitVec 32) ValueCell!2895)) (size!6161 (_ BitVec 32))) )
))
(declare-datatypes ((array!12269 0))(
  ( (array!12270 (arr!5819 (Array (_ BitVec 32) (_ BitVec 64))) (size!6162 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3690 0))(
  ( (LongMapFixedSize!3691 (defaultEntry!4606 Int) (mask!10767 (_ BitVec 32)) (extraKeys!4343 (_ BitVec 32)) (zeroValue!4447 V!8283) (minValue!4447 V!8283) (_size!1894 (_ BitVec 32)) (_keys!6734 array!12269) (_values!4589 array!12267) (_vacant!1894 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3690)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23375 (= call!23378 (arrayContainsKey!0 (_keys!6734 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249104 () Bool)

(declare-datatypes ((Unit!7714 0))(
  ( (Unit!7715) )
))
(declare-fun e!161575 () Unit!7714)

(declare-fun Unit!7716 () Unit!7714)

(assert (=> b!249104 (= e!161575 Unit!7716)))

(declare-fun mapNonEmpty!11000 () Bool)

(declare-fun mapRes!11000 () Bool)

(declare-fun tp!23101 () Bool)

(declare-fun e!161577 () Bool)

(assert (=> mapNonEmpty!11000 (= mapRes!11000 (and tp!23101 e!161577))))

(declare-fun mapValue!11000 () ValueCell!2895)

(declare-fun mapKey!11000 () (_ BitVec 32))

(declare-fun mapRest!11000 () (Array (_ BitVec 32) ValueCell!2895))

(assert (=> mapNonEmpty!11000 (= (arr!5818 (_values!4589 thiss!1504)) (store mapRest!11000 mapKey!11000 mapValue!11000))))

(declare-fun b!249105 () Bool)

(declare-datatypes ((SeekEntryResult!1116 0))(
  ( (MissingZero!1116 (index!6634 (_ BitVec 32))) (Found!1116 (index!6635 (_ BitVec 32))) (Intermediate!1116 (undefined!1928 Bool) (index!6636 (_ BitVec 32)) (x!24614 (_ BitVec 32))) (Undefined!1116) (MissingVacant!1116 (index!6637 (_ BitVec 32))) )
))
(declare-fun lt!124759 () SeekEntryResult!1116)

(get-info :version)

(assert (=> b!249105 (= e!161582 ((_ is Undefined!1116) lt!124759))))

(declare-fun b!249106 () Bool)

(assert (=> b!249106 (= e!161573 (not call!23378))))

(declare-fun b!249107 () Bool)

(declare-fun res!122057 () Bool)

(declare-fun e!161585 () Bool)

(assert (=> b!249107 (=> (not res!122057) (not e!161585))))

(assert (=> b!249107 (= res!122057 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!249108 () Bool)

(declare-fun e!161584 () Unit!7714)

(declare-fun lt!124761 () Unit!7714)

(assert (=> b!249108 (= e!161584 lt!124761)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!396 (array!12269 array!12267 (_ BitVec 32) (_ BitVec 32) V!8283 V!8283 (_ BitVec 64) Int) Unit!7714)

(assert (=> b!249108 (= lt!124761 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!396 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) key!932 (defaultEntry!4606 thiss!1504)))))

(declare-fun c!41766 () Bool)

(assert (=> b!249108 (= c!41766 ((_ is MissingZero!1116) lt!124759))))

(declare-fun e!161580 () Bool)

(assert (=> b!249108 e!161580))

(declare-fun b!249109 () Bool)

(declare-fun e!161579 () Bool)

(declare-fun e!161576 () Bool)

(assert (=> b!249109 (= e!161579 e!161576)))

(declare-fun res!122053 () Bool)

(assert (=> b!249109 (=> (not res!122053) (not e!161576))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!249109 (= res!122053 (inRange!0 index!297 (mask!10767 thiss!1504)))))

(declare-fun lt!124760 () Unit!7714)

(assert (=> b!249109 (= lt!124760 e!161584)))

(declare-fun c!41767 () Bool)

(declare-datatypes ((tuple2!4832 0))(
  ( (tuple2!4833 (_1!2427 (_ BitVec 64)) (_2!2427 V!8283)) )
))
(declare-datatypes ((List!3713 0))(
  ( (Nil!3710) (Cons!3709 (h!4367 tuple2!4832) (t!8742 List!3713)) )
))
(declare-datatypes ((ListLongMap!3745 0))(
  ( (ListLongMap!3746 (toList!1888 List!3713)) )
))
(declare-fun contains!1805 (ListLongMap!3745 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1416 (array!12269 array!12267 (_ BitVec 32) (_ BitVec 32) V!8283 V!8283 (_ BitVec 32) Int) ListLongMap!3745)

(assert (=> b!249109 (= c!41767 (contains!1805 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)) key!932))))

(declare-fun e!161587 () Bool)

(declare-fun tp_is_empty!6477 () Bool)

(declare-fun e!161581 () Bool)

(declare-fun array_inv!3839 (array!12269) Bool)

(declare-fun array_inv!3840 (array!12267) Bool)

(assert (=> b!249111 (= e!161581 (and tp!23102 tp_is_empty!6477 (array_inv!3839 (_keys!6734 thiss!1504)) (array_inv!3840 (_values!4589 thiss!1504)) e!161587))))

(declare-fun b!249112 () Bool)

(declare-fun Unit!7717 () Unit!7714)

(assert (=> b!249112 (= e!161575 Unit!7717)))

(declare-fun lt!124766 () Unit!7714)

(declare-fun lemmaArrayContainsKeyThenInListMap!197 (array!12269 array!12267 (_ BitVec 32) (_ BitVec 32) V!8283 V!8283 (_ BitVec 64) (_ BitVec 32) Int) Unit!7714)

(assert (=> b!249112 (= lt!124766 (lemmaArrayContainsKeyThenInListMap!197 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))))

(assert (=> b!249112 false))

(declare-fun b!249113 () Bool)

(declare-fun res!122056 () Bool)

(declare-fun e!161583 () Bool)

(assert (=> b!249113 (=> (not res!122056) (not e!161583))))

(assert (=> b!249113 (= res!122056 (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6634 lt!124759)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!11000 () Bool)

(assert (=> mapIsEmpty!11000 mapRes!11000))

(declare-fun b!249114 () Bool)

(declare-fun res!122059 () Bool)

(assert (=> b!249114 (= res!122059 (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6637 lt!124759)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249114 (=> (not res!122059) (not e!161573))))

(declare-fun b!249115 () Bool)

(declare-fun c!41769 () Bool)

(assert (=> b!249115 (= c!41769 ((_ is MissingVacant!1116) lt!124759))))

(assert (=> b!249115 (= e!161580 e!161582)))

(declare-fun b!249116 () Bool)

(declare-fun res!122052 () Bool)

(assert (=> b!249116 (=> (not res!122052) (not e!161583))))

(assert (=> b!249116 (= res!122052 call!23379)))

(assert (=> b!249116 (= e!161580 e!161583)))

(declare-fun b!249117 () Bool)

(declare-fun e!161586 () Bool)

(assert (=> b!249117 (= e!161587 (and e!161586 mapRes!11000))))

(declare-fun condMapEmpty!11000 () Bool)

(declare-fun mapDefault!11000 () ValueCell!2895)

(assert (=> b!249117 (= condMapEmpty!11000 (= (arr!5818 (_values!4589 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2895)) mapDefault!11000)))))

(declare-fun b!249118 () Bool)

(declare-fun e!161578 () Bool)

(assert (=> b!249118 (= e!161578 (= (size!6161 (_values!4589 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10767 thiss!1504))))))

(declare-fun b!249119 () Bool)

(assert (=> b!249119 (= e!161577 tp_is_empty!6477)))

(declare-fun b!249120 () Bool)

(declare-fun Unit!7718 () Unit!7714)

(assert (=> b!249120 (= e!161584 Unit!7718)))

(declare-fun lt!124763 () Unit!7714)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!393 (array!12269 array!12267 (_ BitVec 32) (_ BitVec 32) V!8283 V!8283 (_ BitVec 64) Int) Unit!7714)

(assert (=> b!249120 (= lt!124763 (lemmaInListMapThenSeekEntryOrOpenFindsIt!393 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) key!932 (defaultEntry!4606 thiss!1504)))))

(assert (=> b!249120 false))

(declare-fun b!249121 () Bool)

(assert (=> b!249121 (= e!161583 (not call!23378))))

(declare-fun b!249122 () Bool)

(assert (=> b!249122 (= e!161576 (not e!161578))))

(declare-fun res!122051 () Bool)

(assert (=> b!249122 (=> res!122051 e!161578)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!249122 (= res!122051 (not (validMask!0 (mask!10767 thiss!1504))))))

(declare-fun lt!124762 () array!12269)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12269 (_ BitVec 32)) Bool)

(assert (=> b!249122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124762 (mask!10767 thiss!1504))))

(declare-fun lt!124764 () Unit!7714)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12269 (_ BitVec 32) (_ BitVec 32)) Unit!7714)

(assert (=> b!249122 (= lt!124764 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6734 thiss!1504) index!297 (mask!10767 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12269 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!249122 (= (arrayCountValidKeys!0 lt!124762 #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6734 thiss!1504) #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504)))))))

(declare-fun lt!124758 () Unit!7714)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12269 (_ BitVec 32) (_ BitVec 64)) Unit!7714)

(assert (=> b!249122 (= lt!124758 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6734 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3714 0))(
  ( (Nil!3711) (Cons!3710 (h!4368 (_ BitVec 64)) (t!8743 List!3714)) )
))
(declare-fun arrayNoDuplicates!0 (array!12269 (_ BitVec 32) List!3714) Bool)

(assert (=> b!249122 (arrayNoDuplicates!0 lt!124762 #b00000000000000000000000000000000 Nil!3711)))

(assert (=> b!249122 (= lt!124762 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun lt!124765 () Unit!7714)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12269 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3714) Unit!7714)

(assert (=> b!249122 (= lt!124765 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6734 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3711))))

(declare-fun lt!124767 () Unit!7714)

(assert (=> b!249122 (= lt!124767 e!161575)))

(declare-fun c!41768 () Bool)

(assert (=> b!249122 (= c!41768 (arrayContainsKey!0 (_keys!6734 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249123 () Bool)

(assert (=> b!249123 (= e!161586 tp_is_empty!6477)))

(declare-fun bm!23376 () Bool)

(assert (=> bm!23376 (= call!23379 (inRange!0 (ite c!41766 (index!6634 lt!124759) (index!6637 lt!124759)) (mask!10767 thiss!1504)))))

(declare-fun b!249110 () Bool)

(assert (=> b!249110 (= e!161585 e!161579)))

(declare-fun res!122058 () Bool)

(assert (=> b!249110 (=> (not res!122058) (not e!161579))))

(assert (=> b!249110 (= res!122058 (or (= lt!124759 (MissingZero!1116 index!297)) (= lt!124759 (MissingVacant!1116 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12269 (_ BitVec 32)) SeekEntryResult!1116)

(assert (=> b!249110 (= lt!124759 (seekEntryOrOpen!0 key!932 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)))))

(declare-fun res!122054 () Bool)

(assert (=> start!23704 (=> (not res!122054) (not e!161585))))

(declare-fun valid!1444 (LongMapFixedSize!3690) Bool)

(assert (=> start!23704 (= res!122054 (valid!1444 thiss!1504))))

(assert (=> start!23704 e!161585))

(assert (=> start!23704 e!161581))

(assert (=> start!23704 true))

(assert (= (and start!23704 res!122054) b!249107))

(assert (= (and b!249107 res!122057) b!249110))

(assert (= (and b!249110 res!122058) b!249109))

(assert (= (and b!249109 c!41767) b!249120))

(assert (= (and b!249109 (not c!41767)) b!249108))

(assert (= (and b!249108 c!41766) b!249116))

(assert (= (and b!249108 (not c!41766)) b!249115))

(assert (= (and b!249116 res!122052) b!249113))

(assert (= (and b!249113 res!122056) b!249121))

(assert (= (and b!249115 c!41769) b!249103))

(assert (= (and b!249115 (not c!41769)) b!249105))

(assert (= (and b!249103 res!122055) b!249114))

(assert (= (and b!249114 res!122059) b!249106))

(assert (= (or b!249116 b!249103) bm!23376))

(assert (= (or b!249121 b!249106) bm!23375))

(assert (= (and b!249109 res!122053) b!249122))

(assert (= (and b!249122 c!41768) b!249112))

(assert (= (and b!249122 (not c!41768)) b!249104))

(assert (= (and b!249122 (not res!122051)) b!249118))

(assert (= (and b!249117 condMapEmpty!11000) mapIsEmpty!11000))

(assert (= (and b!249117 (not condMapEmpty!11000)) mapNonEmpty!11000))

(assert (= (and mapNonEmpty!11000 ((_ is ValueCellFull!2895) mapValue!11000)) b!249119))

(assert (= (and b!249117 ((_ is ValueCellFull!2895) mapDefault!11000)) b!249123))

(assert (= b!249111 b!249117))

(assert (= start!23704 b!249111))

(declare-fun m!265661 () Bool)

(assert (=> b!249114 m!265661))

(declare-fun m!265663 () Bool)

(assert (=> b!249113 m!265663))

(declare-fun m!265665 () Bool)

(assert (=> b!249122 m!265665))

(declare-fun m!265667 () Bool)

(assert (=> b!249122 m!265667))

(declare-fun m!265669 () Bool)

(assert (=> b!249122 m!265669))

(declare-fun m!265671 () Bool)

(assert (=> b!249122 m!265671))

(declare-fun m!265673 () Bool)

(assert (=> b!249122 m!265673))

(declare-fun m!265675 () Bool)

(assert (=> b!249122 m!265675))

(declare-fun m!265677 () Bool)

(assert (=> b!249122 m!265677))

(declare-fun m!265679 () Bool)

(assert (=> b!249122 m!265679))

(declare-fun m!265681 () Bool)

(assert (=> b!249122 m!265681))

(declare-fun m!265683 () Bool)

(assert (=> b!249122 m!265683))

(assert (=> bm!23375 m!265677))

(declare-fun m!265685 () Bool)

(assert (=> b!249109 m!265685))

(declare-fun m!265687 () Bool)

(assert (=> b!249109 m!265687))

(assert (=> b!249109 m!265687))

(declare-fun m!265689 () Bool)

(assert (=> b!249109 m!265689))

(declare-fun m!265691 () Bool)

(assert (=> b!249120 m!265691))

(declare-fun m!265693 () Bool)

(assert (=> b!249110 m!265693))

(declare-fun m!265695 () Bool)

(assert (=> b!249111 m!265695))

(declare-fun m!265697 () Bool)

(assert (=> b!249111 m!265697))

(declare-fun m!265699 () Bool)

(assert (=> bm!23376 m!265699))

(declare-fun m!265701 () Bool)

(assert (=> b!249108 m!265701))

(declare-fun m!265703 () Bool)

(assert (=> b!249112 m!265703))

(declare-fun m!265705 () Bool)

(assert (=> start!23704 m!265705))

(declare-fun m!265707 () Bool)

(assert (=> mapNonEmpty!11000 m!265707))

(check-sat (not b!249112) tp_is_empty!6477 (not b!249110) (not b!249109) (not bm!23375) (not b_next!6615) (not b!249111) (not bm!23376) (not b!249122) (not b!249108) (not b!249120) b_and!13623 (not mapNonEmpty!11000) (not start!23704))
(check-sat b_and!13623 (not b_next!6615))
(get-model)

(declare-fun d!60611 () Bool)

(assert (=> d!60611 (= (inRange!0 (ite c!41766 (index!6634 lt!124759) (index!6637 lt!124759)) (mask!10767 thiss!1504)) (and (bvsge (ite c!41766 (index!6634 lt!124759) (index!6637 lt!124759)) #b00000000000000000000000000000000) (bvslt (ite c!41766 (index!6634 lt!124759) (index!6637 lt!124759)) (bvadd (mask!10767 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23376 d!60611))

(declare-fun d!60613 () Bool)

(assert (=> d!60613 (= (inRange!0 index!297 (mask!10767 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10767 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!249109 d!60613))

(declare-fun d!60615 () Bool)

(declare-fun e!161638 () Bool)

(assert (=> d!60615 e!161638))

(declare-fun res!122089 () Bool)

(assert (=> d!60615 (=> res!122089 e!161638)))

(declare-fun lt!124809 () Bool)

(assert (=> d!60615 (= res!122089 (not lt!124809))))

(declare-fun lt!124808 () Bool)

(assert (=> d!60615 (= lt!124809 lt!124808)))

(declare-fun lt!124806 () Unit!7714)

(declare-fun e!161637 () Unit!7714)

(assert (=> d!60615 (= lt!124806 e!161637)))

(declare-fun c!41784 () Bool)

(assert (=> d!60615 (= c!41784 lt!124808)))

(declare-fun containsKey!288 (List!3713 (_ BitVec 64)) Bool)

(assert (=> d!60615 (= lt!124808 (containsKey!288 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))) key!932))))

(assert (=> d!60615 (= (contains!1805 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)) key!932) lt!124809)))

(declare-fun b!249193 () Bool)

(declare-fun lt!124807 () Unit!7714)

(assert (=> b!249193 (= e!161637 lt!124807)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!236 (List!3713 (_ BitVec 64)) Unit!7714)

(assert (=> b!249193 (= lt!124807 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))) key!932))))

(declare-datatypes ((Option!302 0))(
  ( (Some!301 (v!5346 V!8283)) (None!300) )
))
(declare-fun isDefined!237 (Option!302) Bool)

(declare-fun getValueByKey!296 (List!3713 (_ BitVec 64)) Option!302)

(assert (=> b!249193 (isDefined!237 (getValueByKey!296 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))) key!932))))

(declare-fun b!249194 () Bool)

(declare-fun Unit!7724 () Unit!7714)

(assert (=> b!249194 (= e!161637 Unit!7724)))

(declare-fun b!249195 () Bool)

(assert (=> b!249195 (= e!161638 (isDefined!237 (getValueByKey!296 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))) key!932)))))

(assert (= (and d!60615 c!41784) b!249193))

(assert (= (and d!60615 (not c!41784)) b!249194))

(assert (= (and d!60615 (not res!122089)) b!249195))

(declare-fun m!265757 () Bool)

(assert (=> d!60615 m!265757))

(declare-fun m!265759 () Bool)

(assert (=> b!249193 m!265759))

(declare-fun m!265761 () Bool)

(assert (=> b!249193 m!265761))

(assert (=> b!249193 m!265761))

(declare-fun m!265763 () Bool)

(assert (=> b!249193 m!265763))

(assert (=> b!249195 m!265761))

(assert (=> b!249195 m!265761))

(assert (=> b!249195 m!265763))

(assert (=> b!249109 d!60615))

(declare-fun b!249238 () Bool)

(declare-fun e!161667 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!249238 (= e!161667 (validKeyInArray!0 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249239 () Bool)

(declare-fun e!161675 () Bool)

(declare-fun e!161674 () Bool)

(assert (=> b!249239 (= e!161675 e!161674)))

(declare-fun res!122108 () Bool)

(declare-fun call!23405 () Bool)

(assert (=> b!249239 (= res!122108 call!23405)))

(assert (=> b!249239 (=> (not res!122108) (not e!161674))))

(declare-fun b!249241 () Bool)

(declare-fun e!161677 () ListLongMap!3745)

(declare-fun e!161665 () ListLongMap!3745)

(assert (=> b!249241 (= e!161677 e!161665)))

(declare-fun c!41797 () Bool)

(assert (=> b!249241 (= c!41797 (and (not (= (bvand (extraKeys!4343 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4343 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!249242 () Bool)

(declare-fun e!161676 () Bool)

(declare-fun e!161670 () Bool)

(assert (=> b!249242 (= e!161676 e!161670)))

(declare-fun res!122109 () Bool)

(assert (=> b!249242 (=> (not res!122109) (not e!161670))))

(declare-fun lt!124859 () ListLongMap!3745)

(assert (=> b!249242 (= res!122109 (contains!1805 lt!124859 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249242 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun b!249243 () Bool)

(assert (=> b!249243 (= e!161675 (not call!23405))))

(declare-fun b!249244 () Bool)

(declare-fun e!161669 () Unit!7714)

(declare-fun Unit!7725 () Unit!7714)

(assert (=> b!249244 (= e!161669 Unit!7725)))

(declare-fun b!249245 () Bool)

(declare-fun e!161671 () Bool)

(assert (=> b!249245 (= e!161671 (validKeyInArray!0 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249246 () Bool)

(declare-fun apply!238 (ListLongMap!3745 (_ BitVec 64)) V!8283)

(declare-fun get!2985 (ValueCell!2895 V!8283) V!8283)

(declare-fun dynLambda!581 (Int (_ BitVec 64)) V!8283)

(assert (=> b!249246 (= e!161670 (= (apply!238 lt!124859 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)) (get!2985 (select (arr!5818 (_values!4589 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4606 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249246 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6161 (_values!4589 thiss!1504))))))

(assert (=> b!249246 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun bm!23397 () Bool)

(declare-fun call!23403 () Bool)

(assert (=> bm!23397 (= call!23403 (contains!1805 lt!124859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!41801 () Bool)

(declare-fun call!23401 () ListLongMap!3745)

(declare-fun call!23404 () ListLongMap!3745)

(declare-fun bm!23398 () Bool)

(declare-fun call!23400 () ListLongMap!3745)

(declare-fun call!23402 () ListLongMap!3745)

(declare-fun +!665 (ListLongMap!3745 tuple2!4832) ListLongMap!3745)

(assert (=> bm!23398 (= call!23400 (+!665 (ite c!41801 call!23404 (ite c!41797 call!23401 call!23402)) (ite (or c!41801 c!41797) (tuple2!4833 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4447 thiss!1504)) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504)))))))

(declare-fun bm!23399 () Bool)

(declare-fun call!23406 () ListLongMap!3745)

(assert (=> bm!23399 (= call!23406 call!23400)))

(declare-fun bm!23400 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!560 (array!12269 array!12267 (_ BitVec 32) (_ BitVec 32) V!8283 V!8283 (_ BitVec 32) Int) ListLongMap!3745)

(assert (=> bm!23400 (= call!23404 (getCurrentListMapNoExtraKeys!560 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))))

(declare-fun bm!23401 () Bool)

(assert (=> bm!23401 (= call!23401 call!23404)))

(declare-fun b!249247 () Bool)

(declare-fun e!161672 () ListLongMap!3745)

(assert (=> b!249247 (= e!161672 call!23406)))

(declare-fun b!249240 () Bool)

(assert (=> b!249240 (= e!161665 call!23406)))

(declare-fun d!60617 () Bool)

(declare-fun e!161666 () Bool)

(assert (=> d!60617 e!161666))

(declare-fun res!122116 () Bool)

(assert (=> d!60617 (=> (not res!122116) (not e!161666))))

(assert (=> d!60617 (= res!122116 (or (bvsge #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))))

(declare-fun lt!124863 () ListLongMap!3745)

(assert (=> d!60617 (= lt!124859 lt!124863)))

(declare-fun lt!124862 () Unit!7714)

(assert (=> d!60617 (= lt!124862 e!161669)))

(declare-fun c!41798 () Bool)

(assert (=> d!60617 (= c!41798 e!161671)))

(declare-fun res!122110 () Bool)

(assert (=> d!60617 (=> (not res!122110) (not e!161671))))

(assert (=> d!60617 (= res!122110 (bvslt #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(assert (=> d!60617 (= lt!124863 e!161677)))

(assert (=> d!60617 (= c!41801 (and (not (= (bvand (extraKeys!4343 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4343 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60617 (validMask!0 (mask!10767 thiss!1504))))

(assert (=> d!60617 (= (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)) lt!124859)))

(declare-fun b!249248 () Bool)

(assert (=> b!249248 (= e!161674 (= (apply!238 lt!124859 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4447 thiss!1504)))))

(declare-fun b!249249 () Bool)

(declare-fun e!161668 () Bool)

(declare-fun e!161673 () Bool)

(assert (=> b!249249 (= e!161668 e!161673)))

(declare-fun res!122111 () Bool)

(assert (=> b!249249 (= res!122111 call!23403)))

(assert (=> b!249249 (=> (not res!122111) (not e!161673))))

(declare-fun bm!23402 () Bool)

(assert (=> bm!23402 (= call!23402 call!23401)))

(declare-fun b!249250 () Bool)

(assert (=> b!249250 (= e!161677 (+!665 call!23400 (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504))))))

(declare-fun b!249251 () Bool)

(declare-fun c!41800 () Bool)

(assert (=> b!249251 (= c!41800 (and (not (= (bvand (extraKeys!4343 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4343 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!249251 (= e!161665 e!161672)))

(declare-fun b!249252 () Bool)

(assert (=> b!249252 (= e!161672 call!23402)))

(declare-fun b!249253 () Bool)

(declare-fun res!122115 () Bool)

(assert (=> b!249253 (=> (not res!122115) (not e!161666))))

(assert (=> b!249253 (= res!122115 e!161676)))

(declare-fun res!122112 () Bool)

(assert (=> b!249253 (=> res!122112 e!161676)))

(assert (=> b!249253 (= res!122112 (not e!161667))))

(declare-fun res!122114 () Bool)

(assert (=> b!249253 (=> (not res!122114) (not e!161667))))

(assert (=> b!249253 (= res!122114 (bvslt #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun b!249254 () Bool)

(declare-fun res!122113 () Bool)

(assert (=> b!249254 (=> (not res!122113) (not e!161666))))

(assert (=> b!249254 (= res!122113 e!161668)))

(declare-fun c!41802 () Bool)

(assert (=> b!249254 (= c!41802 (not (= (bvand (extraKeys!4343 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!249255 () Bool)

(assert (=> b!249255 (= e!161666 e!161675)))

(declare-fun c!41799 () Bool)

(assert (=> b!249255 (= c!41799 (not (= (bvand (extraKeys!4343 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!249256 () Bool)

(assert (=> b!249256 (= e!161668 (not call!23403))))

(declare-fun bm!23403 () Bool)

(assert (=> bm!23403 (= call!23405 (contains!1805 lt!124859 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249257 () Bool)

(assert (=> b!249257 (= e!161673 (= (apply!238 lt!124859 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4447 thiss!1504)))))

(declare-fun b!249258 () Bool)

(declare-fun lt!124871 () Unit!7714)

(assert (=> b!249258 (= e!161669 lt!124871)))

(declare-fun lt!124872 () ListLongMap!3745)

(assert (=> b!249258 (= lt!124872 (getCurrentListMapNoExtraKeys!560 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))))

(declare-fun lt!124860 () (_ BitVec 64))

(assert (=> b!249258 (= lt!124860 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124857 () (_ BitVec 64))

(assert (=> b!249258 (= lt!124857 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124854 () Unit!7714)

(declare-fun addStillContains!214 (ListLongMap!3745 (_ BitVec 64) V!8283 (_ BitVec 64)) Unit!7714)

(assert (=> b!249258 (= lt!124854 (addStillContains!214 lt!124872 lt!124860 (zeroValue!4447 thiss!1504) lt!124857))))

(assert (=> b!249258 (contains!1805 (+!665 lt!124872 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504))) lt!124857)))

(declare-fun lt!124869 () Unit!7714)

(assert (=> b!249258 (= lt!124869 lt!124854)))

(declare-fun lt!124867 () ListLongMap!3745)

(assert (=> b!249258 (= lt!124867 (getCurrentListMapNoExtraKeys!560 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))))

(declare-fun lt!124874 () (_ BitVec 64))

(assert (=> b!249258 (= lt!124874 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124864 () (_ BitVec 64))

(assert (=> b!249258 (= lt!124864 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124873 () Unit!7714)

(declare-fun addApplyDifferent!214 (ListLongMap!3745 (_ BitVec 64) V!8283 (_ BitVec 64)) Unit!7714)

(assert (=> b!249258 (= lt!124873 (addApplyDifferent!214 lt!124867 lt!124874 (minValue!4447 thiss!1504) lt!124864))))

(assert (=> b!249258 (= (apply!238 (+!665 lt!124867 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504))) lt!124864) (apply!238 lt!124867 lt!124864))))

(declare-fun lt!124855 () Unit!7714)

(assert (=> b!249258 (= lt!124855 lt!124873)))

(declare-fun lt!124866 () ListLongMap!3745)

(assert (=> b!249258 (= lt!124866 (getCurrentListMapNoExtraKeys!560 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))))

(declare-fun lt!124858 () (_ BitVec 64))

(assert (=> b!249258 (= lt!124858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124856 () (_ BitVec 64))

(assert (=> b!249258 (= lt!124856 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124875 () Unit!7714)

(assert (=> b!249258 (= lt!124875 (addApplyDifferent!214 lt!124866 lt!124858 (zeroValue!4447 thiss!1504) lt!124856))))

(assert (=> b!249258 (= (apply!238 (+!665 lt!124866 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504))) lt!124856) (apply!238 lt!124866 lt!124856))))

(declare-fun lt!124865 () Unit!7714)

(assert (=> b!249258 (= lt!124865 lt!124875)))

(declare-fun lt!124870 () ListLongMap!3745)

(assert (=> b!249258 (= lt!124870 (getCurrentListMapNoExtraKeys!560 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))))

(declare-fun lt!124861 () (_ BitVec 64))

(assert (=> b!249258 (= lt!124861 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124868 () (_ BitVec 64))

(assert (=> b!249258 (= lt!124868 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249258 (= lt!124871 (addApplyDifferent!214 lt!124870 lt!124861 (minValue!4447 thiss!1504) lt!124868))))

(assert (=> b!249258 (= (apply!238 (+!665 lt!124870 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504))) lt!124868) (apply!238 lt!124870 lt!124868))))

(assert (= (and d!60617 c!41801) b!249250))

(assert (= (and d!60617 (not c!41801)) b!249241))

(assert (= (and b!249241 c!41797) b!249240))

(assert (= (and b!249241 (not c!41797)) b!249251))

(assert (= (and b!249251 c!41800) b!249247))

(assert (= (and b!249251 (not c!41800)) b!249252))

(assert (= (or b!249247 b!249252) bm!23402))

(assert (= (or b!249240 bm!23402) bm!23401))

(assert (= (or b!249240 b!249247) bm!23399))

(assert (= (or b!249250 bm!23401) bm!23400))

(assert (= (or b!249250 bm!23399) bm!23398))

(assert (= (and d!60617 res!122110) b!249245))

(assert (= (and d!60617 c!41798) b!249258))

(assert (= (and d!60617 (not c!41798)) b!249244))

(assert (= (and d!60617 res!122116) b!249253))

(assert (= (and b!249253 res!122114) b!249238))

(assert (= (and b!249253 (not res!122112)) b!249242))

(assert (= (and b!249242 res!122109) b!249246))

(assert (= (and b!249253 res!122115) b!249254))

(assert (= (and b!249254 c!41802) b!249249))

(assert (= (and b!249254 (not c!41802)) b!249256))

(assert (= (and b!249249 res!122111) b!249257))

(assert (= (or b!249249 b!249256) bm!23397))

(assert (= (and b!249254 res!122113) b!249255))

(assert (= (and b!249255 c!41799) b!249239))

(assert (= (and b!249255 (not c!41799)) b!249243))

(assert (= (and b!249239 res!122108) b!249248))

(assert (= (or b!249239 b!249243) bm!23403))

(declare-fun b_lambda!8063 () Bool)

(assert (=> (not b_lambda!8063) (not b!249246)))

(declare-fun t!8747 () Bool)

(declare-fun tb!2989 () Bool)

(assert (=> (and b!249111 (= (defaultEntry!4606 thiss!1504) (defaultEntry!4606 thiss!1504)) t!8747) tb!2989))

(declare-fun result!5289 () Bool)

(assert (=> tb!2989 (= result!5289 tp_is_empty!6477)))

(assert (=> b!249246 t!8747))

(declare-fun b_and!13627 () Bool)

(assert (= b_and!13623 (and (=> t!8747 result!5289) b_and!13627)))

(declare-fun m!265765 () Bool)

(assert (=> b!249258 m!265765))

(declare-fun m!265767 () Bool)

(assert (=> b!249258 m!265767))

(declare-fun m!265769 () Bool)

(assert (=> b!249258 m!265769))

(declare-fun m!265771 () Bool)

(assert (=> b!249258 m!265771))

(declare-fun m!265773 () Bool)

(assert (=> b!249258 m!265773))

(declare-fun m!265775 () Bool)

(assert (=> b!249258 m!265775))

(declare-fun m!265777 () Bool)

(assert (=> b!249258 m!265777))

(declare-fun m!265779 () Bool)

(assert (=> b!249258 m!265779))

(declare-fun m!265781 () Bool)

(assert (=> b!249258 m!265781))

(declare-fun m!265783 () Bool)

(assert (=> b!249258 m!265783))

(declare-fun m!265785 () Bool)

(assert (=> b!249258 m!265785))

(declare-fun m!265787 () Bool)

(assert (=> b!249258 m!265787))

(declare-fun m!265789 () Bool)

(assert (=> b!249258 m!265789))

(assert (=> b!249258 m!265773))

(declare-fun m!265791 () Bool)

(assert (=> b!249258 m!265791))

(declare-fun m!265793 () Bool)

(assert (=> b!249258 m!265793))

(declare-fun m!265795 () Bool)

(assert (=> b!249258 m!265795))

(declare-fun m!265797 () Bool)

(assert (=> b!249258 m!265797))

(assert (=> b!249258 m!265769))

(assert (=> b!249258 m!265795))

(assert (=> b!249258 m!265779))

(assert (=> bm!23400 m!265785))

(declare-fun m!265799 () Bool)

(assert (=> bm!23398 m!265799))

(declare-fun m!265801 () Bool)

(assert (=> b!249248 m!265801))

(declare-fun m!265803 () Bool)

(assert (=> b!249246 m!265803))

(assert (=> b!249246 m!265787))

(declare-fun m!265805 () Bool)

(assert (=> b!249246 m!265805))

(declare-fun m!265807 () Bool)

(assert (=> b!249246 m!265807))

(assert (=> b!249246 m!265807))

(assert (=> b!249246 m!265803))

(declare-fun m!265809 () Bool)

(assert (=> b!249246 m!265809))

(assert (=> b!249246 m!265787))

(declare-fun m!265811 () Bool)

(assert (=> bm!23397 m!265811))

(declare-fun m!265813 () Bool)

(assert (=> b!249257 m!265813))

(assert (=> b!249242 m!265787))

(assert (=> b!249242 m!265787))

(declare-fun m!265815 () Bool)

(assert (=> b!249242 m!265815))

(declare-fun m!265817 () Bool)

(assert (=> b!249250 m!265817))

(assert (=> b!249245 m!265787))

(assert (=> b!249245 m!265787))

(declare-fun m!265819 () Bool)

(assert (=> b!249245 m!265819))

(declare-fun m!265821 () Bool)

(assert (=> bm!23403 m!265821))

(assert (=> d!60617 m!265665))

(assert (=> b!249238 m!265787))

(assert (=> b!249238 m!265787))

(assert (=> b!249238 m!265819))

(assert (=> b!249109 d!60617))

(declare-fun d!60619 () Bool)

(declare-fun res!122121 () Bool)

(declare-fun e!161682 () Bool)

(assert (=> d!60619 (=> res!122121 e!161682)))

(assert (=> d!60619 (= res!122121 (= (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60619 (= (arrayContainsKey!0 (_keys!6734 thiss!1504) key!932 #b00000000000000000000000000000000) e!161682)))

(declare-fun b!249265 () Bool)

(declare-fun e!161683 () Bool)

(assert (=> b!249265 (= e!161682 e!161683)))

(declare-fun res!122122 () Bool)

(assert (=> b!249265 (=> (not res!122122) (not e!161683))))

(assert (=> b!249265 (= res!122122 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun b!249266 () Bool)

(assert (=> b!249266 (= e!161683 (arrayContainsKey!0 (_keys!6734 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60619 (not res!122121)) b!249265))

(assert (= (and b!249265 res!122122) b!249266))

(assert (=> d!60619 m!265787))

(declare-fun m!265823 () Bool)

(assert (=> b!249266 m!265823))

(assert (=> bm!23375 d!60619))

(declare-fun d!60621 () Bool)

(declare-fun e!161693 () Bool)

(assert (=> d!60621 e!161693))

(declare-fun c!41808 () Bool)

(declare-fun lt!124881 () SeekEntryResult!1116)

(assert (=> d!60621 (= c!41808 ((_ is MissingZero!1116) lt!124881))))

(assert (=> d!60621 (= lt!124881 (seekEntryOrOpen!0 key!932 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)))))

(declare-fun lt!124880 () Unit!7714)

(declare-fun choose!1173 (array!12269 array!12267 (_ BitVec 32) (_ BitVec 32) V!8283 V!8283 (_ BitVec 64) Int) Unit!7714)

(assert (=> d!60621 (= lt!124880 (choose!1173 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) key!932 (defaultEntry!4606 thiss!1504)))))

(assert (=> d!60621 (validMask!0 (mask!10767 thiss!1504))))

(assert (=> d!60621 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!396 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) key!932 (defaultEntry!4606 thiss!1504)) lt!124880)))

(declare-fun b!249283 () Bool)

(declare-fun res!122134 () Bool)

(declare-fun e!161695 () Bool)

(assert (=> b!249283 (=> (not res!122134) (not e!161695))))

(assert (=> b!249283 (= res!122134 (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6637 lt!124881)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249283 (and (bvsge (index!6637 lt!124881) #b00000000000000000000000000000000) (bvslt (index!6637 lt!124881) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun b!249284 () Bool)

(declare-fun e!161692 () Bool)

(assert (=> b!249284 (= e!161693 e!161692)))

(declare-fun c!41807 () Bool)

(assert (=> b!249284 (= c!41807 ((_ is MissingVacant!1116) lt!124881))))

(declare-fun b!249285 () Bool)

(assert (=> b!249285 (= e!161692 ((_ is Undefined!1116) lt!124881))))

(declare-fun bm!23408 () Bool)

(declare-fun call!23411 () Bool)

(assert (=> bm!23408 (= call!23411 (arrayContainsKey!0 (_keys!6734 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249286 () Bool)

(declare-fun e!161694 () Bool)

(assert (=> b!249286 (= e!161693 e!161694)))

(declare-fun res!122131 () Bool)

(declare-fun call!23412 () Bool)

(assert (=> b!249286 (= res!122131 call!23412)))

(assert (=> b!249286 (=> (not res!122131) (not e!161694))))

(declare-fun b!249287 () Bool)

(assert (=> b!249287 (= e!161695 (not call!23411))))

(declare-fun b!249288 () Bool)

(assert (=> b!249288 (and (bvsge (index!6634 lt!124881) #b00000000000000000000000000000000) (bvslt (index!6634 lt!124881) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun res!122132 () Bool)

(assert (=> b!249288 (= res!122132 (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6634 lt!124881)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249288 (=> (not res!122132) (not e!161694))))

(declare-fun b!249289 () Bool)

(assert (=> b!249289 (= e!161694 (not call!23411))))

(declare-fun bm!23409 () Bool)

(assert (=> bm!23409 (= call!23412 (inRange!0 (ite c!41808 (index!6634 lt!124881) (index!6637 lt!124881)) (mask!10767 thiss!1504)))))

(declare-fun b!249290 () Bool)

(declare-fun res!122133 () Bool)

(assert (=> b!249290 (=> (not res!122133) (not e!161695))))

(assert (=> b!249290 (= res!122133 call!23412)))

(assert (=> b!249290 (= e!161692 e!161695)))

(assert (= (and d!60621 c!41808) b!249286))

(assert (= (and d!60621 (not c!41808)) b!249284))

(assert (= (and b!249286 res!122131) b!249288))

(assert (= (and b!249288 res!122132) b!249289))

(assert (= (and b!249284 c!41807) b!249290))

(assert (= (and b!249284 (not c!41807)) b!249285))

(assert (= (and b!249290 res!122133) b!249283))

(assert (= (and b!249283 res!122134) b!249287))

(assert (= (or b!249286 b!249290) bm!23409))

(assert (= (or b!249289 b!249287) bm!23408))

(declare-fun m!265825 () Bool)

(assert (=> b!249288 m!265825))

(assert (=> d!60621 m!265693))

(declare-fun m!265827 () Bool)

(assert (=> d!60621 m!265827))

(assert (=> d!60621 m!265665))

(declare-fun m!265829 () Bool)

(assert (=> bm!23409 m!265829))

(declare-fun m!265831 () Bool)

(assert (=> b!249283 m!265831))

(assert (=> bm!23408 m!265677))

(assert (=> b!249108 d!60621))

(declare-fun b!249301 () Bool)

(declare-fun e!161704 () Bool)

(declare-fun contains!1807 (List!3714 (_ BitVec 64)) Bool)

(assert (=> b!249301 (= e!161704 (contains!1807 Nil!3711 (select (arr!5819 lt!124762) #b00000000000000000000000000000000)))))

(declare-fun d!60623 () Bool)

(declare-fun res!122141 () Bool)

(declare-fun e!161706 () Bool)

(assert (=> d!60623 (=> res!122141 e!161706)))

(assert (=> d!60623 (= res!122141 (bvsge #b00000000000000000000000000000000 (size!6162 lt!124762)))))

(assert (=> d!60623 (= (arrayNoDuplicates!0 lt!124762 #b00000000000000000000000000000000 Nil!3711) e!161706)))

(declare-fun b!249302 () Bool)

(declare-fun e!161705 () Bool)

(assert (=> b!249302 (= e!161706 e!161705)))

(declare-fun res!122143 () Bool)

(assert (=> b!249302 (=> (not res!122143) (not e!161705))))

(assert (=> b!249302 (= res!122143 (not e!161704))))

(declare-fun res!122142 () Bool)

(assert (=> b!249302 (=> (not res!122142) (not e!161704))))

(assert (=> b!249302 (= res!122142 (validKeyInArray!0 (select (arr!5819 lt!124762) #b00000000000000000000000000000000)))))

(declare-fun b!249303 () Bool)

(declare-fun e!161707 () Bool)

(assert (=> b!249303 (= e!161705 e!161707)))

(declare-fun c!41811 () Bool)

(assert (=> b!249303 (= c!41811 (validKeyInArray!0 (select (arr!5819 lt!124762) #b00000000000000000000000000000000)))))

(declare-fun b!249304 () Bool)

(declare-fun call!23415 () Bool)

(assert (=> b!249304 (= e!161707 call!23415)))

(declare-fun b!249305 () Bool)

(assert (=> b!249305 (= e!161707 call!23415)))

(declare-fun bm!23412 () Bool)

(assert (=> bm!23412 (= call!23415 (arrayNoDuplicates!0 lt!124762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41811 (Cons!3710 (select (arr!5819 lt!124762) #b00000000000000000000000000000000) Nil!3711) Nil!3711)))))

(assert (= (and d!60623 (not res!122141)) b!249302))

(assert (= (and b!249302 res!122142) b!249301))

(assert (= (and b!249302 res!122143) b!249303))

(assert (= (and b!249303 c!41811) b!249304))

(assert (= (and b!249303 (not c!41811)) b!249305))

(assert (= (or b!249304 b!249305) bm!23412))

(declare-fun m!265833 () Bool)

(assert (=> b!249301 m!265833))

(assert (=> b!249301 m!265833))

(declare-fun m!265835 () Bool)

(assert (=> b!249301 m!265835))

(assert (=> b!249302 m!265833))

(assert (=> b!249302 m!265833))

(declare-fun m!265837 () Bool)

(assert (=> b!249302 m!265837))

(assert (=> b!249303 m!265833))

(assert (=> b!249303 m!265833))

(assert (=> b!249303 m!265837))

(assert (=> bm!23412 m!265833))

(declare-fun m!265839 () Bool)

(assert (=> bm!23412 m!265839))

(assert (=> b!249122 d!60623))

(declare-fun e!161712 () Bool)

(declare-fun b!249317 () Bool)

(assert (=> b!249317 (= e!161712 (= (arrayCountValidKeys!0 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6734 thiss!1504) #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!60625 () Bool)

(assert (=> d!60625 e!161712))

(declare-fun res!122155 () Bool)

(assert (=> d!60625 (=> (not res!122155) (not e!161712))))

(assert (=> d!60625 (= res!122155 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6162 (_keys!6734 thiss!1504)))))))

(declare-fun lt!124884 () Unit!7714)

(declare-fun choose!1 (array!12269 (_ BitVec 32) (_ BitVec 64)) Unit!7714)

(assert (=> d!60625 (= lt!124884 (choose!1 (_keys!6734 thiss!1504) index!297 key!932))))

(declare-fun e!161713 () Bool)

(assert (=> d!60625 e!161713))

(declare-fun res!122154 () Bool)

(assert (=> d!60625 (=> (not res!122154) (not e!161713))))

(assert (=> d!60625 (= res!122154 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6162 (_keys!6734 thiss!1504)))))))

(assert (=> d!60625 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6734 thiss!1504) index!297 key!932) lt!124884)))

(declare-fun b!249315 () Bool)

(declare-fun res!122152 () Bool)

(assert (=> b!249315 (=> (not res!122152) (not e!161713))))

(assert (=> b!249315 (= res!122152 (validKeyInArray!0 key!932))))

(declare-fun b!249314 () Bool)

(declare-fun res!122153 () Bool)

(assert (=> b!249314 (=> (not res!122153) (not e!161713))))

(assert (=> b!249314 (= res!122153 (not (validKeyInArray!0 (select (arr!5819 (_keys!6734 thiss!1504)) index!297))))))

(declare-fun b!249316 () Bool)

(assert (=> b!249316 (= e!161713 (bvslt (size!6162 (_keys!6734 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!60625 res!122154) b!249314))

(assert (= (and b!249314 res!122153) b!249315))

(assert (= (and b!249315 res!122152) b!249316))

(assert (= (and d!60625 res!122155) b!249317))

(assert (=> b!249317 m!265673))

(declare-fun m!265841 () Bool)

(assert (=> b!249317 m!265841))

(assert (=> b!249317 m!265681))

(declare-fun m!265843 () Bool)

(assert (=> d!60625 m!265843))

(declare-fun m!265845 () Bool)

(assert (=> b!249315 m!265845))

(declare-fun m!265847 () Bool)

(assert (=> b!249314 m!265847))

(assert (=> b!249314 m!265847))

(declare-fun m!265849 () Bool)

(assert (=> b!249314 m!265849))

(assert (=> b!249122 d!60625))

(declare-fun b!249326 () Bool)

(declare-fun e!161718 () (_ BitVec 32))

(declare-fun call!23418 () (_ BitVec 32))

(assert (=> b!249326 (= e!161718 call!23418)))

(declare-fun b!249327 () Bool)

(declare-fun e!161719 () (_ BitVec 32))

(assert (=> b!249327 (= e!161719 #b00000000000000000000000000000000)))

(declare-fun bm!23415 () Bool)

(assert (=> bm!23415 (= call!23418 (arrayCountValidKeys!0 (_keys!6734 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun d!60627 () Bool)

(declare-fun lt!124887 () (_ BitVec 32))

(assert (=> d!60627 (and (bvsge lt!124887 #b00000000000000000000000000000000) (bvsle lt!124887 (bvsub (size!6162 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60627 (= lt!124887 e!161719)))

(declare-fun c!41817 () Bool)

(assert (=> d!60627 (= c!41817 (bvsge #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(assert (=> d!60627 (and (bvsle #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6162 (_keys!6734 thiss!1504)) (size!6162 (_keys!6734 thiss!1504))))))

(assert (=> d!60627 (= (arrayCountValidKeys!0 (_keys!6734 thiss!1504) #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) lt!124887)))

(declare-fun b!249328 () Bool)

(assert (=> b!249328 (= e!161719 e!161718)))

(declare-fun c!41816 () Bool)

(assert (=> b!249328 (= c!41816 (validKeyInArray!0 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249329 () Bool)

(assert (=> b!249329 (= e!161718 (bvadd #b00000000000000000000000000000001 call!23418))))

(assert (= (and d!60627 c!41817) b!249327))

(assert (= (and d!60627 (not c!41817)) b!249328))

(assert (= (and b!249328 c!41816) b!249329))

(assert (= (and b!249328 (not c!41816)) b!249326))

(assert (= (or b!249329 b!249326) bm!23415))

(declare-fun m!265851 () Bool)

(assert (=> bm!23415 m!265851))

(assert (=> b!249328 m!265787))

(assert (=> b!249328 m!265787))

(assert (=> b!249328 m!265819))

(assert (=> b!249122 d!60627))

(declare-fun d!60629 () Bool)

(assert (=> d!60629 (= (validMask!0 (mask!10767 thiss!1504)) (and (or (= (mask!10767 thiss!1504) #b00000000000000000000000000000111) (= (mask!10767 thiss!1504) #b00000000000000000000000000001111) (= (mask!10767 thiss!1504) #b00000000000000000000000000011111) (= (mask!10767 thiss!1504) #b00000000000000000000000000111111) (= (mask!10767 thiss!1504) #b00000000000000000000000001111111) (= (mask!10767 thiss!1504) #b00000000000000000000000011111111) (= (mask!10767 thiss!1504) #b00000000000000000000000111111111) (= (mask!10767 thiss!1504) #b00000000000000000000001111111111) (= (mask!10767 thiss!1504) #b00000000000000000000011111111111) (= (mask!10767 thiss!1504) #b00000000000000000000111111111111) (= (mask!10767 thiss!1504) #b00000000000000000001111111111111) (= (mask!10767 thiss!1504) #b00000000000000000011111111111111) (= (mask!10767 thiss!1504) #b00000000000000000111111111111111) (= (mask!10767 thiss!1504) #b00000000000000001111111111111111) (= (mask!10767 thiss!1504) #b00000000000000011111111111111111) (= (mask!10767 thiss!1504) #b00000000000000111111111111111111) (= (mask!10767 thiss!1504) #b00000000000001111111111111111111) (= (mask!10767 thiss!1504) #b00000000000011111111111111111111) (= (mask!10767 thiss!1504) #b00000000000111111111111111111111) (= (mask!10767 thiss!1504) #b00000000001111111111111111111111) (= (mask!10767 thiss!1504) #b00000000011111111111111111111111) (= (mask!10767 thiss!1504) #b00000000111111111111111111111111) (= (mask!10767 thiss!1504) #b00000001111111111111111111111111) (= (mask!10767 thiss!1504) #b00000011111111111111111111111111) (= (mask!10767 thiss!1504) #b00000111111111111111111111111111) (= (mask!10767 thiss!1504) #b00001111111111111111111111111111) (= (mask!10767 thiss!1504) #b00011111111111111111111111111111) (= (mask!10767 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10767 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!249122 d!60629))

(declare-fun b!249338 () Bool)

(declare-fun e!161727 () Bool)

(declare-fun call!23421 () Bool)

(assert (=> b!249338 (= e!161727 call!23421)))

(declare-fun d!60631 () Bool)

(declare-fun res!122161 () Bool)

(declare-fun e!161726 () Bool)

(assert (=> d!60631 (=> res!122161 e!161726)))

(assert (=> d!60631 (= res!122161 (bvsge #b00000000000000000000000000000000 (size!6162 lt!124762)))))

(assert (=> d!60631 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124762 (mask!10767 thiss!1504)) e!161726)))

(declare-fun b!249339 () Bool)

(declare-fun e!161728 () Bool)

(assert (=> b!249339 (= e!161728 e!161727)))

(declare-fun lt!124894 () (_ BitVec 64))

(assert (=> b!249339 (= lt!124894 (select (arr!5819 lt!124762) #b00000000000000000000000000000000))))

(declare-fun lt!124896 () Unit!7714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12269 (_ BitVec 64) (_ BitVec 32)) Unit!7714)

(assert (=> b!249339 (= lt!124896 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124762 lt!124894 #b00000000000000000000000000000000))))

(assert (=> b!249339 (arrayContainsKey!0 lt!124762 lt!124894 #b00000000000000000000000000000000)))

(declare-fun lt!124895 () Unit!7714)

(assert (=> b!249339 (= lt!124895 lt!124896)))

(declare-fun res!122160 () Bool)

(assert (=> b!249339 (= res!122160 (= (seekEntryOrOpen!0 (select (arr!5819 lt!124762) #b00000000000000000000000000000000) lt!124762 (mask!10767 thiss!1504)) (Found!1116 #b00000000000000000000000000000000)))))

(assert (=> b!249339 (=> (not res!122160) (not e!161727))))

(declare-fun bm!23418 () Bool)

(assert (=> bm!23418 (= call!23421 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!124762 (mask!10767 thiss!1504)))))

(declare-fun b!249340 () Bool)

(assert (=> b!249340 (= e!161728 call!23421)))

(declare-fun b!249341 () Bool)

(assert (=> b!249341 (= e!161726 e!161728)))

(declare-fun c!41820 () Bool)

(assert (=> b!249341 (= c!41820 (validKeyInArray!0 (select (arr!5819 lt!124762) #b00000000000000000000000000000000)))))

(assert (= (and d!60631 (not res!122161)) b!249341))

(assert (= (and b!249341 c!41820) b!249339))

(assert (= (and b!249341 (not c!41820)) b!249340))

(assert (= (and b!249339 res!122160) b!249338))

(assert (= (or b!249338 b!249340) bm!23418))

(assert (=> b!249339 m!265833))

(declare-fun m!265853 () Bool)

(assert (=> b!249339 m!265853))

(declare-fun m!265855 () Bool)

(assert (=> b!249339 m!265855))

(assert (=> b!249339 m!265833))

(declare-fun m!265857 () Bool)

(assert (=> b!249339 m!265857))

(declare-fun m!265859 () Bool)

(assert (=> bm!23418 m!265859))

(assert (=> b!249341 m!265833))

(assert (=> b!249341 m!265833))

(assert (=> b!249341 m!265837))

(assert (=> b!249122 d!60631))

(declare-fun b!249342 () Bool)

(declare-fun e!161729 () (_ BitVec 32))

(declare-fun call!23422 () (_ BitVec 32))

(assert (=> b!249342 (= e!161729 call!23422)))

(declare-fun b!249343 () Bool)

(declare-fun e!161730 () (_ BitVec 32))

(assert (=> b!249343 (= e!161730 #b00000000000000000000000000000000)))

(declare-fun bm!23419 () Bool)

(assert (=> bm!23419 (= call!23422 (arrayCountValidKeys!0 lt!124762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun d!60633 () Bool)

(declare-fun lt!124897 () (_ BitVec 32))

(assert (=> d!60633 (and (bvsge lt!124897 #b00000000000000000000000000000000) (bvsle lt!124897 (bvsub (size!6162 lt!124762) #b00000000000000000000000000000000)))))

(assert (=> d!60633 (= lt!124897 e!161730)))

(declare-fun c!41822 () Bool)

(assert (=> d!60633 (= c!41822 (bvsge #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(assert (=> d!60633 (and (bvsle #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6162 (_keys!6734 thiss!1504)) (size!6162 lt!124762)))))

(assert (=> d!60633 (= (arrayCountValidKeys!0 lt!124762 #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) lt!124897)))

(declare-fun b!249344 () Bool)

(assert (=> b!249344 (= e!161730 e!161729)))

(declare-fun c!41821 () Bool)

(assert (=> b!249344 (= c!41821 (validKeyInArray!0 (select (arr!5819 lt!124762) #b00000000000000000000000000000000)))))

(declare-fun b!249345 () Bool)

(assert (=> b!249345 (= e!161729 (bvadd #b00000000000000000000000000000001 call!23422))))

(assert (= (and d!60633 c!41822) b!249343))

(assert (= (and d!60633 (not c!41822)) b!249344))

(assert (= (and b!249344 c!41821) b!249345))

(assert (= (and b!249344 (not c!41821)) b!249342))

(assert (= (or b!249345 b!249342) bm!23419))

(declare-fun m!265861 () Bool)

(assert (=> bm!23419 m!265861))

(assert (=> b!249344 m!265833))

(assert (=> b!249344 m!265833))

(assert (=> b!249344 m!265837))

(assert (=> b!249122 d!60633))

(declare-fun d!60635 () Bool)

(declare-fun e!161733 () Bool)

(assert (=> d!60635 e!161733))

(declare-fun res!122164 () Bool)

(assert (=> d!60635 (=> (not res!122164) (not e!161733))))

(assert (=> d!60635 (= res!122164 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6162 (_keys!6734 thiss!1504)))))))

(declare-fun lt!124900 () Unit!7714)

(declare-fun choose!41 (array!12269 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3714) Unit!7714)

(assert (=> d!60635 (= lt!124900 (choose!41 (_keys!6734 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3711))))

(assert (=> d!60635 (bvslt (size!6162 (_keys!6734 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60635 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6734 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3711) lt!124900)))

(declare-fun b!249348 () Bool)

(assert (=> b!249348 (= e!161733 (arrayNoDuplicates!0 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) #b00000000000000000000000000000000 Nil!3711))))

(assert (= (and d!60635 res!122164) b!249348))

(declare-fun m!265863 () Bool)

(assert (=> d!60635 m!265863))

(assert (=> b!249348 m!265673))

(declare-fun m!265865 () Bool)

(assert (=> b!249348 m!265865))

(assert (=> b!249122 d!60635))

(assert (=> b!249122 d!60619))

(declare-fun d!60637 () Bool)

(declare-fun e!161736 () Bool)

(assert (=> d!60637 e!161736))

(declare-fun res!122167 () Bool)

(assert (=> d!60637 (=> (not res!122167) (not e!161736))))

(assert (=> d!60637 (= res!122167 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6162 (_keys!6734 thiss!1504)))))))

(declare-fun lt!124903 () Unit!7714)

(declare-fun choose!102 ((_ BitVec 64) array!12269 (_ BitVec 32) (_ BitVec 32)) Unit!7714)

(assert (=> d!60637 (= lt!124903 (choose!102 key!932 (_keys!6734 thiss!1504) index!297 (mask!10767 thiss!1504)))))

(assert (=> d!60637 (validMask!0 (mask!10767 thiss!1504))))

(assert (=> d!60637 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6734 thiss!1504) index!297 (mask!10767 thiss!1504)) lt!124903)))

(declare-fun b!249351 () Bool)

(assert (=> b!249351 (= e!161736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) (mask!10767 thiss!1504)))))

(assert (= (and d!60637 res!122167) b!249351))

(declare-fun m!265867 () Bool)

(assert (=> d!60637 m!265867))

(assert (=> d!60637 m!265665))

(assert (=> b!249351 m!265673))

(declare-fun m!265869 () Bool)

(assert (=> b!249351 m!265869))

(assert (=> b!249122 d!60637))

(declare-fun d!60639 () Bool)

(assert (=> d!60639 (contains!1805 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)) key!932)))

(declare-fun lt!124906 () Unit!7714)

(declare-fun choose!1174 (array!12269 array!12267 (_ BitVec 32) (_ BitVec 32) V!8283 V!8283 (_ BitVec 64) (_ BitVec 32) Int) Unit!7714)

(assert (=> d!60639 (= lt!124906 (choose!1174 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))))

(assert (=> d!60639 (validMask!0 (mask!10767 thiss!1504))))

(assert (=> d!60639 (= (lemmaArrayContainsKeyThenInListMap!197 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)) lt!124906)))

(declare-fun bs!8943 () Bool)

(assert (= bs!8943 d!60639))

(assert (=> bs!8943 m!265687))

(assert (=> bs!8943 m!265687))

(assert (=> bs!8943 m!265689))

(declare-fun m!265871 () Bool)

(assert (=> bs!8943 m!265871))

(assert (=> bs!8943 m!265665))

(assert (=> b!249112 d!60639))

(declare-fun d!60641 () Bool)

(declare-fun res!122174 () Bool)

(declare-fun e!161739 () Bool)

(assert (=> d!60641 (=> (not res!122174) (not e!161739))))

(declare-fun simpleValid!261 (LongMapFixedSize!3690) Bool)

(assert (=> d!60641 (= res!122174 (simpleValid!261 thiss!1504))))

(assert (=> d!60641 (= (valid!1444 thiss!1504) e!161739)))

(declare-fun b!249358 () Bool)

(declare-fun res!122175 () Bool)

(assert (=> b!249358 (=> (not res!122175) (not e!161739))))

(assert (=> b!249358 (= res!122175 (= (arrayCountValidKeys!0 (_keys!6734 thiss!1504) #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) (_size!1894 thiss!1504)))))

(declare-fun b!249359 () Bool)

(declare-fun res!122176 () Bool)

(assert (=> b!249359 (=> (not res!122176) (not e!161739))))

(assert (=> b!249359 (= res!122176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)))))

(declare-fun b!249360 () Bool)

(assert (=> b!249360 (= e!161739 (arrayNoDuplicates!0 (_keys!6734 thiss!1504) #b00000000000000000000000000000000 Nil!3711))))

(assert (= (and d!60641 res!122174) b!249358))

(assert (= (and b!249358 res!122175) b!249359))

(assert (= (and b!249359 res!122176) b!249360))

(declare-fun m!265873 () Bool)

(assert (=> d!60641 m!265873))

(assert (=> b!249358 m!265681))

(declare-fun m!265875 () Bool)

(assert (=> b!249359 m!265875))

(declare-fun m!265877 () Bool)

(assert (=> b!249360 m!265877))

(assert (=> start!23704 d!60641))

(declare-fun d!60643 () Bool)

(declare-fun e!161742 () Bool)

(assert (=> d!60643 e!161742))

(declare-fun res!122181 () Bool)

(assert (=> d!60643 (=> (not res!122181) (not e!161742))))

(declare-fun lt!124912 () SeekEntryResult!1116)

(assert (=> d!60643 (= res!122181 ((_ is Found!1116) lt!124912))))

(assert (=> d!60643 (= lt!124912 (seekEntryOrOpen!0 key!932 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)))))

(declare-fun lt!124911 () Unit!7714)

(declare-fun choose!1175 (array!12269 array!12267 (_ BitVec 32) (_ BitVec 32) V!8283 V!8283 (_ BitVec 64) Int) Unit!7714)

(assert (=> d!60643 (= lt!124911 (choose!1175 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) key!932 (defaultEntry!4606 thiss!1504)))))

(assert (=> d!60643 (validMask!0 (mask!10767 thiss!1504))))

(assert (=> d!60643 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!393 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) key!932 (defaultEntry!4606 thiss!1504)) lt!124911)))

(declare-fun b!249365 () Bool)

(declare-fun res!122182 () Bool)

(assert (=> b!249365 (=> (not res!122182) (not e!161742))))

(assert (=> b!249365 (= res!122182 (inRange!0 (index!6635 lt!124912) (mask!10767 thiss!1504)))))

(declare-fun b!249366 () Bool)

(assert (=> b!249366 (= e!161742 (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6635 lt!124912)) key!932))))

(assert (=> b!249366 (and (bvsge (index!6635 lt!124912) #b00000000000000000000000000000000) (bvslt (index!6635 lt!124912) (size!6162 (_keys!6734 thiss!1504))))))

(assert (= (and d!60643 res!122181) b!249365))

(assert (= (and b!249365 res!122182) b!249366))

(assert (=> d!60643 m!265693))

(declare-fun m!265879 () Bool)

(assert (=> d!60643 m!265879))

(assert (=> d!60643 m!265665))

(declare-fun m!265881 () Bool)

(assert (=> b!249365 m!265881))

(declare-fun m!265883 () Bool)

(assert (=> b!249366 m!265883))

(assert (=> b!249120 d!60643))

(declare-fun b!249379 () Bool)

(declare-fun e!161751 () SeekEntryResult!1116)

(declare-fun lt!124920 () SeekEntryResult!1116)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12269 (_ BitVec 32)) SeekEntryResult!1116)

(assert (=> b!249379 (= e!161751 (seekKeyOrZeroReturnVacant!0 (x!24614 lt!124920) (index!6636 lt!124920) (index!6636 lt!124920) key!932 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)))))

(declare-fun b!249380 () Bool)

(assert (=> b!249380 (= e!161751 (MissingZero!1116 (index!6636 lt!124920)))))

(declare-fun b!249381 () Bool)

(declare-fun c!41831 () Bool)

(declare-fun lt!124921 () (_ BitVec 64))

(assert (=> b!249381 (= c!41831 (= lt!124921 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161750 () SeekEntryResult!1116)

(assert (=> b!249381 (= e!161750 e!161751)))

(declare-fun d!60645 () Bool)

(declare-fun lt!124919 () SeekEntryResult!1116)

(assert (=> d!60645 (and (or ((_ is Undefined!1116) lt!124919) (not ((_ is Found!1116) lt!124919)) (and (bvsge (index!6635 lt!124919) #b00000000000000000000000000000000) (bvslt (index!6635 lt!124919) (size!6162 (_keys!6734 thiss!1504))))) (or ((_ is Undefined!1116) lt!124919) ((_ is Found!1116) lt!124919) (not ((_ is MissingZero!1116) lt!124919)) (and (bvsge (index!6634 lt!124919) #b00000000000000000000000000000000) (bvslt (index!6634 lt!124919) (size!6162 (_keys!6734 thiss!1504))))) (or ((_ is Undefined!1116) lt!124919) ((_ is Found!1116) lt!124919) ((_ is MissingZero!1116) lt!124919) (not ((_ is MissingVacant!1116) lt!124919)) (and (bvsge (index!6637 lt!124919) #b00000000000000000000000000000000) (bvslt (index!6637 lt!124919) (size!6162 (_keys!6734 thiss!1504))))) (or ((_ is Undefined!1116) lt!124919) (ite ((_ is Found!1116) lt!124919) (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6635 lt!124919)) key!932) (ite ((_ is MissingZero!1116) lt!124919) (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6634 lt!124919)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1116) lt!124919) (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6637 lt!124919)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!161749 () SeekEntryResult!1116)

(assert (=> d!60645 (= lt!124919 e!161749)))

(declare-fun c!41829 () Bool)

(assert (=> d!60645 (= c!41829 (and ((_ is Intermediate!1116) lt!124920) (undefined!1928 lt!124920)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12269 (_ BitVec 32)) SeekEntryResult!1116)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60645 (= lt!124920 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10767 thiss!1504)) key!932 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)))))

(assert (=> d!60645 (validMask!0 (mask!10767 thiss!1504))))

(assert (=> d!60645 (= (seekEntryOrOpen!0 key!932 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)) lt!124919)))

(declare-fun b!249382 () Bool)

(assert (=> b!249382 (= e!161749 e!161750)))

(assert (=> b!249382 (= lt!124921 (select (arr!5819 (_keys!6734 thiss!1504)) (index!6636 lt!124920)))))

(declare-fun c!41830 () Bool)

(assert (=> b!249382 (= c!41830 (= lt!124921 key!932))))

(declare-fun b!249383 () Bool)

(assert (=> b!249383 (= e!161749 Undefined!1116)))

(declare-fun b!249384 () Bool)

(assert (=> b!249384 (= e!161750 (Found!1116 (index!6636 lt!124920)))))

(assert (= (and d!60645 c!41829) b!249383))

(assert (= (and d!60645 (not c!41829)) b!249382))

(assert (= (and b!249382 c!41830) b!249384))

(assert (= (and b!249382 (not c!41830)) b!249381))

(assert (= (and b!249381 c!41831) b!249380))

(assert (= (and b!249381 (not c!41831)) b!249379))

(declare-fun m!265885 () Bool)

(assert (=> b!249379 m!265885))

(declare-fun m!265887 () Bool)

(assert (=> d!60645 m!265887))

(declare-fun m!265889 () Bool)

(assert (=> d!60645 m!265889))

(declare-fun m!265891 () Bool)

(assert (=> d!60645 m!265891))

(declare-fun m!265893 () Bool)

(assert (=> d!60645 m!265893))

(assert (=> d!60645 m!265887))

(assert (=> d!60645 m!265665))

(declare-fun m!265895 () Bool)

(assert (=> d!60645 m!265895))

(declare-fun m!265897 () Bool)

(assert (=> b!249382 m!265897))

(assert (=> b!249110 d!60645))

(declare-fun d!60647 () Bool)

(assert (=> d!60647 (= (array_inv!3839 (_keys!6734 thiss!1504)) (bvsge (size!6162 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249111 d!60647))

(declare-fun d!60649 () Bool)

(assert (=> d!60649 (= (array_inv!3840 (_values!4589 thiss!1504)) (bvsge (size!6161 (_values!4589 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249111 d!60649))

(declare-fun b!249392 () Bool)

(declare-fun e!161756 () Bool)

(assert (=> b!249392 (= e!161756 tp_is_empty!6477)))

(declare-fun b!249391 () Bool)

(declare-fun e!161757 () Bool)

(assert (=> b!249391 (= e!161757 tp_is_empty!6477)))

(declare-fun mapIsEmpty!11006 () Bool)

(declare-fun mapRes!11006 () Bool)

(assert (=> mapIsEmpty!11006 mapRes!11006))

(declare-fun condMapEmpty!11006 () Bool)

(declare-fun mapDefault!11006 () ValueCell!2895)

(assert (=> mapNonEmpty!11000 (= condMapEmpty!11006 (= mapRest!11000 ((as const (Array (_ BitVec 32) ValueCell!2895)) mapDefault!11006)))))

(assert (=> mapNonEmpty!11000 (= tp!23101 (and e!161756 mapRes!11006))))

(declare-fun mapNonEmpty!11006 () Bool)

(declare-fun tp!23111 () Bool)

(assert (=> mapNonEmpty!11006 (= mapRes!11006 (and tp!23111 e!161757))))

(declare-fun mapValue!11006 () ValueCell!2895)

(declare-fun mapKey!11006 () (_ BitVec 32))

(declare-fun mapRest!11006 () (Array (_ BitVec 32) ValueCell!2895))

(assert (=> mapNonEmpty!11006 (= mapRest!11000 (store mapRest!11006 mapKey!11006 mapValue!11006))))

(assert (= (and mapNonEmpty!11000 condMapEmpty!11006) mapIsEmpty!11006))

(assert (= (and mapNonEmpty!11000 (not condMapEmpty!11006)) mapNonEmpty!11006))

(assert (= (and mapNonEmpty!11006 ((_ is ValueCellFull!2895) mapValue!11006)) b!249391))

(assert (= (and mapNonEmpty!11000 ((_ is ValueCellFull!2895) mapDefault!11006)) b!249392))

(declare-fun m!265899 () Bool)

(assert (=> mapNonEmpty!11006 m!265899))

(declare-fun b_lambda!8065 () Bool)

(assert (= b_lambda!8063 (or (and b!249111 b_free!6615) b_lambda!8065)))

(check-sat (not b_lambda!8065) (not b!249238) (not b!249341) (not bm!23403) (not b!249242) (not b!249328) (not b!249348) (not b!249302) (not b!249359) (not b_next!6615) (not b!249257) (not b!249266) (not b!249248) (not d!60621) (not bm!23397) b_and!13627 (not b!249351) (not b!249246) (not d!60615) (not bm!23412) (not d!60637) (not bm!23400) (not b!249195) (not mapNonEmpty!11006) (not b!249344) (not bm!23418) (not d!60635) (not b!249339) tp_is_empty!6477 (not d!60643) (not d!60639) (not bm!23409) (not bm!23415) (not d!60625) (not b!249317) (not d!60641) (not d!60645) (not bm!23398) (not b!249314) (not bm!23419) (not b!249245) (not d!60617) (not b!249358) (not bm!23408) (not b!249250) (not b!249258) (not b!249193) (not b!249360) (not b!249365) (not b!249315) (not b!249301) (not b!249303) (not b!249379))
(check-sat b_and!13627 (not b_next!6615))
(get-model)

(assert (=> b!249358 d!60627))

(declare-fun b!249393 () Bool)

(declare-fun e!161758 () Bool)

(assert (=> b!249393 (= e!161758 (contains!1807 Nil!3711 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60651 () Bool)

(declare-fun res!122183 () Bool)

(declare-fun e!161760 () Bool)

(assert (=> d!60651 (=> res!122183 e!161760)))

(assert (=> d!60651 (= res!122183 (bvsge #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(assert (=> d!60651 (= (arrayNoDuplicates!0 (_keys!6734 thiss!1504) #b00000000000000000000000000000000 Nil!3711) e!161760)))

(declare-fun b!249394 () Bool)

(declare-fun e!161759 () Bool)

(assert (=> b!249394 (= e!161760 e!161759)))

(declare-fun res!122185 () Bool)

(assert (=> b!249394 (=> (not res!122185) (not e!161759))))

(assert (=> b!249394 (= res!122185 (not e!161758))))

(declare-fun res!122184 () Bool)

(assert (=> b!249394 (=> (not res!122184) (not e!161758))))

(assert (=> b!249394 (= res!122184 (validKeyInArray!0 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249395 () Bool)

(declare-fun e!161761 () Bool)

(assert (=> b!249395 (= e!161759 e!161761)))

(declare-fun c!41832 () Bool)

(assert (=> b!249395 (= c!41832 (validKeyInArray!0 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249396 () Bool)

(declare-fun call!23423 () Bool)

(assert (=> b!249396 (= e!161761 call!23423)))

(declare-fun b!249397 () Bool)

(assert (=> b!249397 (= e!161761 call!23423)))

(declare-fun bm!23420 () Bool)

(assert (=> bm!23420 (= call!23423 (arrayNoDuplicates!0 (_keys!6734 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41832 (Cons!3710 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000) Nil!3711) Nil!3711)))))

(assert (= (and d!60651 (not res!122183)) b!249394))

(assert (= (and b!249394 res!122184) b!249393))

(assert (= (and b!249394 res!122185) b!249395))

(assert (= (and b!249395 c!41832) b!249396))

(assert (= (and b!249395 (not c!41832)) b!249397))

(assert (= (or b!249396 b!249397) bm!23420))

(assert (=> b!249393 m!265787))

(assert (=> b!249393 m!265787))

(declare-fun m!265901 () Bool)

(assert (=> b!249393 m!265901))

(assert (=> b!249394 m!265787))

(assert (=> b!249394 m!265787))

(assert (=> b!249394 m!265819))

(assert (=> b!249395 m!265787))

(assert (=> b!249395 m!265787))

(assert (=> b!249395 m!265819))

(assert (=> bm!23420 m!265787))

(declare-fun m!265903 () Bool)

(assert (=> bm!23420 m!265903))

(assert (=> b!249360 d!60651))

(declare-fun d!60653 () Bool)

(declare-fun lt!124924 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!164 (List!3714) (InoxSet (_ BitVec 64)))

(assert (=> d!60653 (= lt!124924 (select (content!164 Nil!3711) (select (arr!5819 lt!124762) #b00000000000000000000000000000000)))))

(declare-fun e!161766 () Bool)

(assert (=> d!60653 (= lt!124924 e!161766)))

(declare-fun res!122190 () Bool)

(assert (=> d!60653 (=> (not res!122190) (not e!161766))))

(assert (=> d!60653 (= res!122190 ((_ is Cons!3710) Nil!3711))))

(assert (=> d!60653 (= (contains!1807 Nil!3711 (select (arr!5819 lt!124762) #b00000000000000000000000000000000)) lt!124924)))

(declare-fun b!249402 () Bool)

(declare-fun e!161767 () Bool)

(assert (=> b!249402 (= e!161766 e!161767)))

(declare-fun res!122191 () Bool)

(assert (=> b!249402 (=> res!122191 e!161767)))

(assert (=> b!249402 (= res!122191 (= (h!4368 Nil!3711) (select (arr!5819 lt!124762) #b00000000000000000000000000000000)))))

(declare-fun b!249403 () Bool)

(assert (=> b!249403 (= e!161767 (contains!1807 (t!8743 Nil!3711) (select (arr!5819 lt!124762) #b00000000000000000000000000000000)))))

(assert (= (and d!60653 res!122190) b!249402))

(assert (= (and b!249402 (not res!122191)) b!249403))

(declare-fun m!265905 () Bool)

(assert (=> d!60653 m!265905))

(assert (=> d!60653 m!265833))

(declare-fun m!265907 () Bool)

(assert (=> d!60653 m!265907))

(assert (=> b!249403 m!265833))

(declare-fun m!265909 () Bool)

(assert (=> b!249403 m!265909))

(assert (=> b!249301 d!60653))

(declare-fun d!60655 () Bool)

(declare-fun e!161769 () Bool)

(assert (=> d!60655 e!161769))

(declare-fun res!122192 () Bool)

(assert (=> d!60655 (=> res!122192 e!161769)))

(declare-fun lt!124928 () Bool)

(assert (=> d!60655 (= res!122192 (not lt!124928))))

(declare-fun lt!124927 () Bool)

(assert (=> d!60655 (= lt!124928 lt!124927)))

(declare-fun lt!124925 () Unit!7714)

(declare-fun e!161768 () Unit!7714)

(assert (=> d!60655 (= lt!124925 e!161768)))

(declare-fun c!41833 () Bool)

(assert (=> d!60655 (= c!41833 lt!124927)))

(assert (=> d!60655 (= lt!124927 (containsKey!288 (toList!1888 lt!124859) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60655 (= (contains!1805 lt!124859 #b0000000000000000000000000000000000000000000000000000000000000000) lt!124928)))

(declare-fun b!249404 () Bool)

(declare-fun lt!124926 () Unit!7714)

(assert (=> b!249404 (= e!161768 lt!124926)))

(assert (=> b!249404 (= lt!124926 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1888 lt!124859) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249404 (isDefined!237 (getValueByKey!296 (toList!1888 lt!124859) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249405 () Bool)

(declare-fun Unit!7726 () Unit!7714)

(assert (=> b!249405 (= e!161768 Unit!7726)))

(declare-fun b!249406 () Bool)

(assert (=> b!249406 (= e!161769 (isDefined!237 (getValueByKey!296 (toList!1888 lt!124859) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60655 c!41833) b!249404))

(assert (= (and d!60655 (not c!41833)) b!249405))

(assert (= (and d!60655 (not res!122192)) b!249406))

(declare-fun m!265911 () Bool)

(assert (=> d!60655 m!265911))

(declare-fun m!265913 () Bool)

(assert (=> b!249404 m!265913))

(declare-fun m!265915 () Bool)

(assert (=> b!249404 m!265915))

(assert (=> b!249404 m!265915))

(declare-fun m!265917 () Bool)

(assert (=> b!249404 m!265917))

(assert (=> b!249406 m!265915))

(assert (=> b!249406 m!265915))

(assert (=> b!249406 m!265917))

(assert (=> bm!23397 d!60655))

(declare-fun d!60657 () Bool)

(assert (=> d!60657 (= (inRange!0 (index!6635 lt!124912) (mask!10767 thiss!1504)) (and (bvsge (index!6635 lt!124912) #b00000000000000000000000000000000) (bvslt (index!6635 lt!124912) (bvadd (mask!10767 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!249365 d!60657))

(declare-fun d!60659 () Bool)

(assert (=> d!60659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) (mask!10767 thiss!1504))))

(assert (=> d!60659 true))

(declare-fun _$56!21 () Unit!7714)

(assert (=> d!60659 (= (choose!102 key!932 (_keys!6734 thiss!1504) index!297 (mask!10767 thiss!1504)) _$56!21)))

(declare-fun bs!8944 () Bool)

(assert (= bs!8944 d!60659))

(assert (=> bs!8944 m!265673))

(assert (=> bs!8944 m!265869))

(assert (=> d!60637 d!60659))

(assert (=> d!60637 d!60629))

(declare-fun d!60661 () Bool)

(assert (=> d!60661 (arrayNoDuplicates!0 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) #b00000000000000000000000000000000 Nil!3711)))

(assert (=> d!60661 true))

(declare-fun _$65!74 () Unit!7714)

(assert (=> d!60661 (= (choose!41 (_keys!6734 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3711) _$65!74)))

(declare-fun bs!8945 () Bool)

(assert (= bs!8945 d!60661))

(assert (=> bs!8945 m!265673))

(assert (=> bs!8945 m!265865))

(assert (=> d!60635 d!60661))

(declare-fun d!60663 () Bool)

(assert (=> d!60663 (= (validKeyInArray!0 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249245 d!60663))

(declare-fun b!249407 () Bool)

(declare-fun e!161770 () (_ BitVec 32))

(declare-fun call!23424 () (_ BitVec 32))

(assert (=> b!249407 (= e!161770 call!23424)))

(declare-fun b!249408 () Bool)

(declare-fun e!161771 () (_ BitVec 32))

(assert (=> b!249408 (= e!161771 #b00000000000000000000000000000000)))

(declare-fun bm!23421 () Bool)

(assert (=> bm!23421 (= call!23424 (arrayCountValidKeys!0 (_keys!6734 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun d!60665 () Bool)

(declare-fun lt!124929 () (_ BitVec 32))

(assert (=> d!60665 (and (bvsge lt!124929 #b00000000000000000000000000000000) (bvsle lt!124929 (bvsub (size!6162 (_keys!6734 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!60665 (= lt!124929 e!161771)))

(declare-fun c!41835 () Bool)

(assert (=> d!60665 (= c!41835 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))))))

(assert (=> d!60665 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6162 (_keys!6734 thiss!1504)) (size!6162 (_keys!6734 thiss!1504))))))

(assert (=> d!60665 (= (arrayCountValidKeys!0 (_keys!6734 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))) lt!124929)))

(declare-fun b!249409 () Bool)

(assert (=> b!249409 (= e!161771 e!161770)))

(declare-fun c!41834 () Bool)

(assert (=> b!249409 (= c!41834 (validKeyInArray!0 (select (arr!5819 (_keys!6734 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!249410 () Bool)

(assert (=> b!249410 (= e!161770 (bvadd #b00000000000000000000000000000001 call!23424))))

(assert (= (and d!60665 c!41835) b!249408))

(assert (= (and d!60665 (not c!41835)) b!249409))

(assert (= (and b!249409 c!41834) b!249410))

(assert (= (and b!249409 (not c!41834)) b!249407))

(assert (= (or b!249410 b!249407) bm!23421))

(declare-fun m!265919 () Bool)

(assert (=> bm!23421 m!265919))

(declare-fun m!265921 () Bool)

(assert (=> b!249409 m!265921))

(assert (=> b!249409 m!265921))

(declare-fun m!265923 () Bool)

(assert (=> b!249409 m!265923))

(assert (=> bm!23415 d!60665))

(declare-fun d!60667 () Bool)

(assert (=> d!60667 (= (arrayCountValidKeys!0 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6734 thiss!1504) #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!60667 true))

(declare-fun _$84!24 () Unit!7714)

(assert (=> d!60667 (= (choose!1 (_keys!6734 thiss!1504) index!297 key!932) _$84!24)))

(declare-fun bs!8946 () Bool)

(assert (= bs!8946 d!60667))

(assert (=> bs!8946 m!265673))

(assert (=> bs!8946 m!265841))

(assert (=> bs!8946 m!265681))

(assert (=> d!60625 d!60667))

(declare-fun d!60669 () Bool)

(declare-fun get!2986 (Option!302) V!8283)

(assert (=> d!60669 (= (apply!238 lt!124859 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2986 (getValueByKey!296 (toList!1888 lt!124859) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8947 () Bool)

(assert (= bs!8947 d!60669))

(assert (=> bs!8947 m!265915))

(assert (=> bs!8947 m!265915))

(declare-fun m!265925 () Bool)

(assert (=> bs!8947 m!265925))

(assert (=> b!249257 d!60669))

(declare-fun d!60671 () Bool)

(assert (=> d!60671 (= (validKeyInArray!0 (select (arr!5819 lt!124762) #b00000000000000000000000000000000)) (and (not (= (select (arr!5819 lt!124762) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5819 lt!124762) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249341 d!60671))

(declare-fun e!161772 () Bool)

(declare-fun b!249411 () Bool)

(assert (=> b!249411 (= e!161772 (contains!1807 Nil!3711 (select (arr!5819 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!60673 () Bool)

(declare-fun res!122193 () Bool)

(declare-fun e!161774 () Bool)

(assert (=> d!60673 (=> res!122193 e!161774)))

(assert (=> d!60673 (= res!122193 (bvsge #b00000000000000000000000000000000 (size!6162 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))))))))

(assert (=> d!60673 (= (arrayNoDuplicates!0 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) #b00000000000000000000000000000000 Nil!3711) e!161774)))

(declare-fun b!249412 () Bool)

(declare-fun e!161773 () Bool)

(assert (=> b!249412 (= e!161774 e!161773)))

(declare-fun res!122195 () Bool)

(assert (=> b!249412 (=> (not res!122195) (not e!161773))))

(assert (=> b!249412 (= res!122195 (not e!161772))))

(declare-fun res!122194 () Bool)

(assert (=> b!249412 (=> (not res!122194) (not e!161772))))

(assert (=> b!249412 (= res!122194 (validKeyInArray!0 (select (arr!5819 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!249413 () Bool)

(declare-fun e!161775 () Bool)

(assert (=> b!249413 (= e!161773 e!161775)))

(declare-fun c!41836 () Bool)

(assert (=> b!249413 (= c!41836 (validKeyInArray!0 (select (arr!5819 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!249414 () Bool)

(declare-fun call!23425 () Bool)

(assert (=> b!249414 (= e!161775 call!23425)))

(declare-fun b!249415 () Bool)

(assert (=> b!249415 (= e!161775 call!23425)))

(declare-fun bm!23422 () Bool)

(assert (=> bm!23422 (= call!23425 (arrayNoDuplicates!0 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41836 (Cons!3710 (select (arr!5819 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504)))) #b00000000000000000000000000000000) Nil!3711) Nil!3711)))))

(assert (= (and d!60673 (not res!122193)) b!249412))

(assert (= (and b!249412 res!122194) b!249411))

(assert (= (and b!249412 res!122195) b!249413))

(assert (= (and b!249413 c!41836) b!249414))

(assert (= (and b!249413 (not c!41836)) b!249415))

(assert (= (or b!249414 b!249415) bm!23422))

(declare-fun m!265927 () Bool)

(assert (=> b!249411 m!265927))

(assert (=> b!249411 m!265927))

(declare-fun m!265929 () Bool)

(assert (=> b!249411 m!265929))

(assert (=> b!249412 m!265927))

(assert (=> b!249412 m!265927))

(declare-fun m!265931 () Bool)

(assert (=> b!249412 m!265931))

(assert (=> b!249413 m!265927))

(assert (=> b!249413 m!265927))

(assert (=> b!249413 m!265931))

(assert (=> bm!23422 m!265927))

(declare-fun m!265933 () Bool)

(assert (=> bm!23422 m!265933))

(assert (=> b!249348 d!60673))

(assert (=> d!60621 d!60645))

(declare-fun bm!23427 () Bool)

(declare-fun call!23430 () Bool)

(assert (=> bm!23427 (= call!23430 (arrayContainsKey!0 (_keys!6734 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249432 () Bool)

(declare-fun res!122206 () Bool)

(declare-fun e!161785 () Bool)

(assert (=> b!249432 (=> (not res!122206) (not e!161785))))

(declare-fun call!23431 () Bool)

(assert (=> b!249432 (= res!122206 call!23431)))

(declare-fun e!161784 () Bool)

(assert (=> b!249432 (= e!161784 e!161785)))

(declare-fun b!249433 () Bool)

(declare-fun res!122204 () Bool)

(declare-fun lt!124932 () SeekEntryResult!1116)

(assert (=> b!249433 (= res!122204 (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6634 lt!124932)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161786 () Bool)

(assert (=> b!249433 (=> (not res!122204) (not e!161786))))

(declare-fun c!41842 () Bool)

(declare-fun bm!23428 () Bool)

(assert (=> bm!23428 (= call!23431 (inRange!0 (ite c!41842 (index!6634 lt!124932) (index!6637 lt!124932)) (mask!10767 thiss!1504)))))

(declare-fun b!249434 () Bool)

(declare-fun res!122205 () Bool)

(assert (=> b!249434 (=> (not res!122205) (not e!161785))))

(assert (=> b!249434 (= res!122205 (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6637 lt!124932)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249435 () Bool)

(assert (=> b!249435 (= e!161786 (not call!23430))))

(declare-fun d!60675 () Bool)

(declare-fun e!161787 () Bool)

(assert (=> d!60675 e!161787))

(assert (=> d!60675 (= c!41842 ((_ is MissingZero!1116) lt!124932))))

(assert (=> d!60675 (= lt!124932 (seekEntryOrOpen!0 key!932 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)))))

(assert (=> d!60675 true))

(declare-fun _$34!1107 () Unit!7714)

(assert (=> d!60675 (= (choose!1173 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) key!932 (defaultEntry!4606 thiss!1504)) _$34!1107)))

(declare-fun b!249436 () Bool)

(assert (=> b!249436 (= e!161784 ((_ is Undefined!1116) lt!124932))))

(declare-fun b!249437 () Bool)

(assert (=> b!249437 (= e!161785 (not call!23430))))

(declare-fun b!249438 () Bool)

(assert (=> b!249438 (= e!161787 e!161786)))

(declare-fun res!122207 () Bool)

(assert (=> b!249438 (= res!122207 call!23431)))

(assert (=> b!249438 (=> (not res!122207) (not e!161786))))

(declare-fun b!249439 () Bool)

(assert (=> b!249439 (= e!161787 e!161784)))

(declare-fun c!41841 () Bool)

(assert (=> b!249439 (= c!41841 ((_ is MissingVacant!1116) lt!124932))))

(assert (= (and d!60675 c!41842) b!249438))

(assert (= (and d!60675 (not c!41842)) b!249439))

(assert (= (and b!249438 res!122207) b!249433))

(assert (= (and b!249433 res!122204) b!249435))

(assert (= (and b!249439 c!41841) b!249432))

(assert (= (and b!249439 (not c!41841)) b!249436))

(assert (= (and b!249432 res!122206) b!249434))

(assert (= (and b!249434 res!122205) b!249437))

(assert (= (or b!249438 b!249432) bm!23428))

(assert (= (or b!249435 b!249437) bm!23427))

(assert (=> d!60675 m!265693))

(declare-fun m!265935 () Bool)

(assert (=> b!249434 m!265935))

(declare-fun m!265937 () Bool)

(assert (=> b!249433 m!265937))

(assert (=> bm!23427 m!265677))

(declare-fun m!265939 () Bool)

(assert (=> bm!23428 m!265939))

(assert (=> d!60621 d!60675))

(assert (=> d!60621 d!60629))

(assert (=> b!249238 d!60663))

(assert (=> b!249344 d!60671))

(declare-fun d!60677 () Bool)

(assert (=> d!60677 (= (validKeyInArray!0 (select (arr!5819 (_keys!6734 thiss!1504)) index!297)) (and (not (= (select (arr!5819 (_keys!6734 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5819 (_keys!6734 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249314 d!60677))

(assert (=> d!60643 d!60645))

(declare-fun d!60679 () Bool)

(declare-fun e!161790 () Bool)

(assert (=> d!60679 e!161790))

(declare-fun res!122212 () Bool)

(assert (=> d!60679 (=> (not res!122212) (not e!161790))))

(declare-fun lt!124935 () SeekEntryResult!1116)

(assert (=> d!60679 (= res!122212 ((_ is Found!1116) lt!124935))))

(assert (=> d!60679 (= lt!124935 (seekEntryOrOpen!0 key!932 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)))))

(assert (=> d!60679 true))

(declare-fun _$33!162 () Unit!7714)

(assert (=> d!60679 (= (choose!1175 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) key!932 (defaultEntry!4606 thiss!1504)) _$33!162)))

(declare-fun b!249444 () Bool)

(declare-fun res!122213 () Bool)

(assert (=> b!249444 (=> (not res!122213) (not e!161790))))

(assert (=> b!249444 (= res!122213 (inRange!0 (index!6635 lt!124935) (mask!10767 thiss!1504)))))

(declare-fun b!249445 () Bool)

(assert (=> b!249445 (= e!161790 (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6635 lt!124935)) key!932))))

(assert (= (and d!60679 res!122212) b!249444))

(assert (= (and b!249444 res!122213) b!249445))

(assert (=> d!60679 m!265693))

(declare-fun m!265941 () Bool)

(assert (=> b!249444 m!265941))

(declare-fun m!265943 () Bool)

(assert (=> b!249445 m!265943))

(assert (=> d!60643 d!60679))

(assert (=> d!60643 d!60629))

(declare-fun d!60681 () Bool)

(assert (=> d!60681 (arrayContainsKey!0 lt!124762 lt!124894 #b00000000000000000000000000000000)))

(declare-fun lt!124938 () Unit!7714)

(declare-fun choose!13 (array!12269 (_ BitVec 64) (_ BitVec 32)) Unit!7714)

(assert (=> d!60681 (= lt!124938 (choose!13 lt!124762 lt!124894 #b00000000000000000000000000000000))))

(assert (=> d!60681 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!60681 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124762 lt!124894 #b00000000000000000000000000000000) lt!124938)))

(declare-fun bs!8948 () Bool)

(assert (= bs!8948 d!60681))

(assert (=> bs!8948 m!265855))

(declare-fun m!265945 () Bool)

(assert (=> bs!8948 m!265945))

(assert (=> b!249339 d!60681))

(declare-fun d!60683 () Bool)

(declare-fun res!122214 () Bool)

(declare-fun e!161791 () Bool)

(assert (=> d!60683 (=> res!122214 e!161791)))

(assert (=> d!60683 (= res!122214 (= (select (arr!5819 lt!124762) #b00000000000000000000000000000000) lt!124894))))

(assert (=> d!60683 (= (arrayContainsKey!0 lt!124762 lt!124894 #b00000000000000000000000000000000) e!161791)))

(declare-fun b!249446 () Bool)

(declare-fun e!161792 () Bool)

(assert (=> b!249446 (= e!161791 e!161792)))

(declare-fun res!122215 () Bool)

(assert (=> b!249446 (=> (not res!122215) (not e!161792))))

(assert (=> b!249446 (= res!122215 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 lt!124762)))))

(declare-fun b!249447 () Bool)

(assert (=> b!249447 (= e!161792 (arrayContainsKey!0 lt!124762 lt!124894 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60683 (not res!122214)) b!249446))

(assert (= (and b!249446 res!122215) b!249447))

(assert (=> d!60683 m!265833))

(declare-fun m!265947 () Bool)

(assert (=> b!249447 m!265947))

(assert (=> b!249339 d!60683))

(declare-fun e!161795 () SeekEntryResult!1116)

(declare-fun lt!124940 () SeekEntryResult!1116)

(declare-fun b!249448 () Bool)

(assert (=> b!249448 (= e!161795 (seekKeyOrZeroReturnVacant!0 (x!24614 lt!124940) (index!6636 lt!124940) (index!6636 lt!124940) (select (arr!5819 lt!124762) #b00000000000000000000000000000000) lt!124762 (mask!10767 thiss!1504)))))

(declare-fun b!249449 () Bool)

(assert (=> b!249449 (= e!161795 (MissingZero!1116 (index!6636 lt!124940)))))

(declare-fun b!249450 () Bool)

(declare-fun c!41845 () Bool)

(declare-fun lt!124941 () (_ BitVec 64))

(assert (=> b!249450 (= c!41845 (= lt!124941 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161794 () SeekEntryResult!1116)

(assert (=> b!249450 (= e!161794 e!161795)))

(declare-fun d!60685 () Bool)

(declare-fun lt!124939 () SeekEntryResult!1116)

(assert (=> d!60685 (and (or ((_ is Undefined!1116) lt!124939) (not ((_ is Found!1116) lt!124939)) (and (bvsge (index!6635 lt!124939) #b00000000000000000000000000000000) (bvslt (index!6635 lt!124939) (size!6162 lt!124762)))) (or ((_ is Undefined!1116) lt!124939) ((_ is Found!1116) lt!124939) (not ((_ is MissingZero!1116) lt!124939)) (and (bvsge (index!6634 lt!124939) #b00000000000000000000000000000000) (bvslt (index!6634 lt!124939) (size!6162 lt!124762)))) (or ((_ is Undefined!1116) lt!124939) ((_ is Found!1116) lt!124939) ((_ is MissingZero!1116) lt!124939) (not ((_ is MissingVacant!1116) lt!124939)) (and (bvsge (index!6637 lt!124939) #b00000000000000000000000000000000) (bvslt (index!6637 lt!124939) (size!6162 lt!124762)))) (or ((_ is Undefined!1116) lt!124939) (ite ((_ is Found!1116) lt!124939) (= (select (arr!5819 lt!124762) (index!6635 lt!124939)) (select (arr!5819 lt!124762) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1116) lt!124939) (= (select (arr!5819 lt!124762) (index!6634 lt!124939)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1116) lt!124939) (= (select (arr!5819 lt!124762) (index!6637 lt!124939)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!161793 () SeekEntryResult!1116)

(assert (=> d!60685 (= lt!124939 e!161793)))

(declare-fun c!41843 () Bool)

(assert (=> d!60685 (= c!41843 (and ((_ is Intermediate!1116) lt!124940) (undefined!1928 lt!124940)))))

(assert (=> d!60685 (= lt!124940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5819 lt!124762) #b00000000000000000000000000000000) (mask!10767 thiss!1504)) (select (arr!5819 lt!124762) #b00000000000000000000000000000000) lt!124762 (mask!10767 thiss!1504)))))

(assert (=> d!60685 (validMask!0 (mask!10767 thiss!1504))))

(assert (=> d!60685 (= (seekEntryOrOpen!0 (select (arr!5819 lt!124762) #b00000000000000000000000000000000) lt!124762 (mask!10767 thiss!1504)) lt!124939)))

(declare-fun b!249451 () Bool)

(assert (=> b!249451 (= e!161793 e!161794)))

(assert (=> b!249451 (= lt!124941 (select (arr!5819 lt!124762) (index!6636 lt!124940)))))

(declare-fun c!41844 () Bool)

(assert (=> b!249451 (= c!41844 (= lt!124941 (select (arr!5819 lt!124762) #b00000000000000000000000000000000)))))

(declare-fun b!249452 () Bool)

(assert (=> b!249452 (= e!161793 Undefined!1116)))

(declare-fun b!249453 () Bool)

(assert (=> b!249453 (= e!161794 (Found!1116 (index!6636 lt!124940)))))

(assert (= (and d!60685 c!41843) b!249452))

(assert (= (and d!60685 (not c!41843)) b!249451))

(assert (= (and b!249451 c!41844) b!249453))

(assert (= (and b!249451 (not c!41844)) b!249450))

(assert (= (and b!249450 c!41845) b!249449))

(assert (= (and b!249450 (not c!41845)) b!249448))

(assert (=> b!249448 m!265833))

(declare-fun m!265949 () Bool)

(assert (=> b!249448 m!265949))

(declare-fun m!265951 () Bool)

(assert (=> d!60685 m!265951))

(assert (=> d!60685 m!265833))

(declare-fun m!265953 () Bool)

(assert (=> d!60685 m!265953))

(declare-fun m!265955 () Bool)

(assert (=> d!60685 m!265955))

(declare-fun m!265957 () Bool)

(assert (=> d!60685 m!265957))

(assert (=> d!60685 m!265833))

(assert (=> d!60685 m!265951))

(assert (=> d!60685 m!265665))

(declare-fun m!265959 () Bool)

(assert (=> d!60685 m!265959))

(declare-fun m!265961 () Bool)

(assert (=> b!249451 m!265961))

(assert (=> b!249339 d!60685))

(declare-fun d!60687 () Bool)

(declare-fun res!122216 () Bool)

(declare-fun e!161796 () Bool)

(assert (=> d!60687 (=> res!122216 e!161796)))

(assert (=> d!60687 (= res!122216 (= (select (arr!5819 (_keys!6734 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!60687 (= (arrayContainsKey!0 (_keys!6734 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!161796)))

(declare-fun b!249454 () Bool)

(declare-fun e!161797 () Bool)

(assert (=> b!249454 (= e!161796 e!161797)))

(declare-fun res!122217 () Bool)

(assert (=> b!249454 (=> (not res!122217) (not e!161797))))

(assert (=> b!249454 (= res!122217 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun b!249455 () Bool)

(assert (=> b!249455 (= e!161797 (arrayContainsKey!0 (_keys!6734 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!60687 (not res!122216)) b!249454))

(assert (= (and b!249454 res!122217) b!249455))

(assert (=> d!60687 m!265921))

(declare-fun m!265963 () Bool)

(assert (=> b!249455 m!265963))

(assert (=> b!249266 d!60687))

(declare-fun d!60689 () Bool)

(assert (=> d!60689 (= (apply!238 lt!124859 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2986 (getValueByKey!296 (toList!1888 lt!124859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8949 () Bool)

(assert (= bs!8949 d!60689))

(declare-fun m!265965 () Bool)

(assert (=> bs!8949 m!265965))

(assert (=> bs!8949 m!265965))

(declare-fun m!265967 () Bool)

(assert (=> bs!8949 m!265967))

(assert (=> b!249248 d!60689))

(assert (=> b!249303 d!60671))

(declare-fun d!60691 () Bool)

(declare-fun res!122222 () Bool)

(declare-fun e!161802 () Bool)

(assert (=> d!60691 (=> res!122222 e!161802)))

(assert (=> d!60691 (= res!122222 (and ((_ is Cons!3709) (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))) (= (_1!2427 (h!4367 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))))) key!932)))))

(assert (=> d!60691 (= (containsKey!288 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))) key!932) e!161802)))

(declare-fun b!249460 () Bool)

(declare-fun e!161803 () Bool)

(assert (=> b!249460 (= e!161802 e!161803)))

(declare-fun res!122223 () Bool)

(assert (=> b!249460 (=> (not res!122223) (not e!161803))))

(assert (=> b!249460 (= res!122223 (and (or (not ((_ is Cons!3709) (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))))) (bvsle (_1!2427 (h!4367 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))))) key!932)) ((_ is Cons!3709) (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))) (bvslt (_1!2427 (h!4367 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))))) key!932)))))

(declare-fun b!249461 () Bool)

(assert (=> b!249461 (= e!161803 (containsKey!288 (t!8742 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))) key!932))))

(assert (= (and d!60691 (not res!122222)) b!249460))

(assert (= (and b!249460 res!122223) b!249461))

(declare-fun m!265969 () Bool)

(assert (=> b!249461 m!265969))

(assert (=> d!60615 d!60691))

(assert (=> bm!23408 d!60619))

(assert (=> b!249302 d!60671))

(declare-fun b!249486 () Bool)

(declare-fun e!161822 () Bool)

(declare-fun lt!124961 () ListLongMap!3745)

(declare-fun isEmpty!524 (ListLongMap!3745) Bool)

(assert (=> b!249486 (= e!161822 (isEmpty!524 lt!124961))))

(declare-fun b!249487 () Bool)

(declare-fun e!161821 () Bool)

(assert (=> b!249487 (= e!161821 e!161822)))

(declare-fun c!41857 () Bool)

(assert (=> b!249487 (= c!41857 (bvslt #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun b!249488 () Bool)

(assert (=> b!249488 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(assert (=> b!249488 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6161 (_values!4589 thiss!1504))))))

(declare-fun e!161819 () Bool)

(assert (=> b!249488 (= e!161819 (= (apply!238 lt!124961 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)) (get!2985 (select (arr!5818 (_values!4589 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4606 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!249489 () Bool)

(declare-fun res!122233 () Bool)

(declare-fun e!161823 () Bool)

(assert (=> b!249489 (=> (not res!122233) (not e!161823))))

(assert (=> b!249489 (= res!122233 (not (contains!1805 lt!124961 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!249490 () Bool)

(declare-fun lt!124962 () Unit!7714)

(declare-fun lt!124958 () Unit!7714)

(assert (=> b!249490 (= lt!124962 lt!124958)))

(declare-fun lt!124959 () ListLongMap!3745)

(declare-fun lt!124957 () (_ BitVec 64))

(declare-fun lt!124956 () V!8283)

(declare-fun lt!124960 () (_ BitVec 64))

(assert (=> b!249490 (not (contains!1805 (+!665 lt!124959 (tuple2!4833 lt!124960 lt!124956)) lt!124957))))

(declare-fun addStillNotContains!121 (ListLongMap!3745 (_ BitVec 64) V!8283 (_ BitVec 64)) Unit!7714)

(assert (=> b!249490 (= lt!124958 (addStillNotContains!121 lt!124959 lt!124960 lt!124956 lt!124957))))

(assert (=> b!249490 (= lt!124957 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!249490 (= lt!124956 (get!2985 (select (arr!5818 (_values!4589 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4606 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!249490 (= lt!124960 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!23434 () ListLongMap!3745)

(assert (=> b!249490 (= lt!124959 call!23434)))

(declare-fun e!161824 () ListLongMap!3745)

(assert (=> b!249490 (= e!161824 (+!665 call!23434 (tuple2!4833 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000) (get!2985 (select (arr!5818 (_values!4589 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4606 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!60693 () Bool)

(assert (=> d!60693 e!161823))

(declare-fun res!122235 () Bool)

(assert (=> d!60693 (=> (not res!122235) (not e!161823))))

(assert (=> d!60693 (= res!122235 (not (contains!1805 lt!124961 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!161818 () ListLongMap!3745)

(assert (=> d!60693 (= lt!124961 e!161818)))

(declare-fun c!41854 () Bool)

(assert (=> d!60693 (= c!41854 (bvsge #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(assert (=> d!60693 (validMask!0 (mask!10767 thiss!1504))))

(assert (=> d!60693 (= (getCurrentListMapNoExtraKeys!560 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)) lt!124961)))

(declare-fun b!249491 () Bool)

(assert (=> b!249491 (= e!161822 (= lt!124961 (getCurrentListMapNoExtraKeys!560 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4606 thiss!1504))))))

(declare-fun b!249492 () Bool)

(assert (=> b!249492 (= e!161818 (ListLongMap!3746 Nil!3710))))

(declare-fun b!249493 () Bool)

(assert (=> b!249493 (= e!161818 e!161824)))

(declare-fun c!41855 () Bool)

(assert (=> b!249493 (= c!41855 (validKeyInArray!0 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249494 () Bool)

(declare-fun e!161820 () Bool)

(assert (=> b!249494 (= e!161820 (validKeyInArray!0 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249494 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!249495 () Bool)

(assert (=> b!249495 (= e!161823 e!161821)))

(declare-fun c!41856 () Bool)

(assert (=> b!249495 (= c!41856 e!161820)))

(declare-fun res!122232 () Bool)

(assert (=> b!249495 (=> (not res!122232) (not e!161820))))

(assert (=> b!249495 (= res!122232 (bvslt #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun b!249496 () Bool)

(assert (=> b!249496 (= e!161824 call!23434)))

(declare-fun bm!23431 () Bool)

(assert (=> bm!23431 (= call!23434 (getCurrentListMapNoExtraKeys!560 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4606 thiss!1504)))))

(declare-fun b!249497 () Bool)

(assert (=> b!249497 (= e!161821 e!161819)))

(assert (=> b!249497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun res!122234 () Bool)

(assert (=> b!249497 (= res!122234 (contains!1805 lt!124961 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249497 (=> (not res!122234) (not e!161819))))

(assert (= (and d!60693 c!41854) b!249492))

(assert (= (and d!60693 (not c!41854)) b!249493))

(assert (= (and b!249493 c!41855) b!249490))

(assert (= (and b!249493 (not c!41855)) b!249496))

(assert (= (or b!249490 b!249496) bm!23431))

(assert (= (and d!60693 res!122235) b!249489))

(assert (= (and b!249489 res!122233) b!249495))

(assert (= (and b!249495 res!122232) b!249494))

(assert (= (and b!249495 c!41856) b!249497))

(assert (= (and b!249495 (not c!41856)) b!249487))

(assert (= (and b!249497 res!122234) b!249488))

(assert (= (and b!249487 c!41857) b!249491))

(assert (= (and b!249487 (not c!41857)) b!249486))

(declare-fun b_lambda!8067 () Bool)

(assert (=> (not b_lambda!8067) (not b!249488)))

(assert (=> b!249488 t!8747))

(declare-fun b_and!13629 () Bool)

(assert (= b_and!13627 (and (=> t!8747 result!5289) b_and!13629)))

(declare-fun b_lambda!8069 () Bool)

(assert (=> (not b_lambda!8069) (not b!249490)))

(assert (=> b!249490 t!8747))

(declare-fun b_and!13631 () Bool)

(assert (= b_and!13629 (and (=> t!8747 result!5289) b_and!13631)))

(declare-fun m!265971 () Bool)

(assert (=> bm!23431 m!265971))

(assert (=> b!249491 m!265971))

(assert (=> b!249488 m!265807))

(assert (=> b!249488 m!265803))

(assert (=> b!249488 m!265809))

(assert (=> b!249488 m!265787))

(assert (=> b!249488 m!265803))

(assert (=> b!249488 m!265807))

(assert (=> b!249488 m!265787))

(declare-fun m!265973 () Bool)

(assert (=> b!249488 m!265973))

(assert (=> b!249497 m!265787))

(assert (=> b!249497 m!265787))

(declare-fun m!265975 () Bool)

(assert (=> b!249497 m!265975))

(declare-fun m!265977 () Bool)

(assert (=> b!249490 m!265977))

(declare-fun m!265979 () Bool)

(assert (=> b!249490 m!265979))

(assert (=> b!249490 m!265807))

(assert (=> b!249490 m!265803))

(assert (=> b!249490 m!265809))

(declare-fun m!265981 () Bool)

(assert (=> b!249490 m!265981))

(declare-fun m!265983 () Bool)

(assert (=> b!249490 m!265983))

(assert (=> b!249490 m!265787))

(assert (=> b!249490 m!265803))

(assert (=> b!249490 m!265807))

(assert (=> b!249490 m!265981))

(declare-fun m!265985 () Bool)

(assert (=> d!60693 m!265985))

(assert (=> d!60693 m!265665))

(declare-fun m!265987 () Bool)

(assert (=> b!249486 m!265987))

(assert (=> b!249494 m!265787))

(assert (=> b!249494 m!265787))

(assert (=> b!249494 m!265819))

(declare-fun m!265989 () Bool)

(assert (=> b!249489 m!265989))

(assert (=> b!249493 m!265787))

(assert (=> b!249493 m!265787))

(assert (=> b!249493 m!265819))

(assert (=> bm!23400 d!60693))

(assert (=> d!60639 d!60615))

(assert (=> d!60639 d!60617))

(declare-fun d!60695 () Bool)

(assert (=> d!60695 (contains!1805 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)) key!932)))

(assert (=> d!60695 true))

(declare-fun _$17!71 () Unit!7714)

(assert (=> d!60695 (= (choose!1174 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)) _$17!71)))

(declare-fun bs!8950 () Bool)

(assert (= bs!8950 d!60695))

(assert (=> bs!8950 m!265687))

(assert (=> bs!8950 m!265687))

(assert (=> bs!8950 m!265689))

(assert (=> d!60639 d!60695))

(assert (=> d!60639 d!60629))

(declare-fun b!249498 () Bool)

(declare-fun e!161826 () Bool)

(declare-fun call!23435 () Bool)

(assert (=> b!249498 (= e!161826 call!23435)))

(declare-fun d!60697 () Bool)

(declare-fun res!122237 () Bool)

(declare-fun e!161825 () Bool)

(assert (=> d!60697 (=> res!122237 e!161825)))

(assert (=> d!60697 (= res!122237 (bvsge #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(assert (=> d!60697 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)) e!161825)))

(declare-fun b!249499 () Bool)

(declare-fun e!161827 () Bool)

(assert (=> b!249499 (= e!161827 e!161826)))

(declare-fun lt!124963 () (_ BitVec 64))

(assert (=> b!249499 (= lt!124963 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124965 () Unit!7714)

(assert (=> b!249499 (= lt!124965 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6734 thiss!1504) lt!124963 #b00000000000000000000000000000000))))

(assert (=> b!249499 (arrayContainsKey!0 (_keys!6734 thiss!1504) lt!124963 #b00000000000000000000000000000000)))

(declare-fun lt!124964 () Unit!7714)

(assert (=> b!249499 (= lt!124964 lt!124965)))

(declare-fun res!122236 () Bool)

(assert (=> b!249499 (= res!122236 (= (seekEntryOrOpen!0 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000) (_keys!6734 thiss!1504) (mask!10767 thiss!1504)) (Found!1116 #b00000000000000000000000000000000)))))

(assert (=> b!249499 (=> (not res!122236) (not e!161826))))

(declare-fun bm!23432 () Bool)

(assert (=> bm!23432 (= call!23435 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6734 thiss!1504) (mask!10767 thiss!1504)))))

(declare-fun b!249500 () Bool)

(assert (=> b!249500 (= e!161827 call!23435)))

(declare-fun b!249501 () Bool)

(assert (=> b!249501 (= e!161825 e!161827)))

(declare-fun c!41858 () Bool)

(assert (=> b!249501 (= c!41858 (validKeyInArray!0 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60697 (not res!122237)) b!249501))

(assert (= (and b!249501 c!41858) b!249499))

(assert (= (and b!249501 (not c!41858)) b!249500))

(assert (= (and b!249499 res!122236) b!249498))

(assert (= (or b!249498 b!249500) bm!23432))

(assert (=> b!249499 m!265787))

(declare-fun m!265991 () Bool)

(assert (=> b!249499 m!265991))

(declare-fun m!265993 () Bool)

(assert (=> b!249499 m!265993))

(assert (=> b!249499 m!265787))

(declare-fun m!265995 () Bool)

(assert (=> b!249499 m!265995))

(declare-fun m!265997 () Bool)

(assert (=> bm!23432 m!265997))

(assert (=> b!249501 m!265787))

(assert (=> b!249501 m!265787))

(assert (=> b!249501 m!265819))

(assert (=> b!249359 d!60697))

(declare-fun d!60699 () Bool)

(declare-fun e!161830 () Bool)

(assert (=> d!60699 e!161830))

(declare-fun res!122243 () Bool)

(assert (=> d!60699 (=> (not res!122243) (not e!161830))))

(declare-fun lt!124974 () ListLongMap!3745)

(assert (=> d!60699 (= res!122243 (contains!1805 lt!124974 (_1!2427 (ite (or c!41801 c!41797) (tuple2!4833 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4447 thiss!1504)) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504))))))))

(declare-fun lt!124975 () List!3713)

(assert (=> d!60699 (= lt!124974 (ListLongMap!3746 lt!124975))))

(declare-fun lt!124976 () Unit!7714)

(declare-fun lt!124977 () Unit!7714)

(assert (=> d!60699 (= lt!124976 lt!124977)))

(assert (=> d!60699 (= (getValueByKey!296 lt!124975 (_1!2427 (ite (or c!41801 c!41797) (tuple2!4833 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4447 thiss!1504)) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504))))) (Some!301 (_2!2427 (ite (or c!41801 c!41797) (tuple2!4833 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4447 thiss!1504)) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!157 (List!3713 (_ BitVec 64) V!8283) Unit!7714)

(assert (=> d!60699 (= lt!124977 (lemmaContainsTupThenGetReturnValue!157 lt!124975 (_1!2427 (ite (or c!41801 c!41797) (tuple2!4833 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4447 thiss!1504)) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504)))) (_2!2427 (ite (or c!41801 c!41797) (tuple2!4833 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4447 thiss!1504)) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504))))))))

(declare-fun insertStrictlySorted!160 (List!3713 (_ BitVec 64) V!8283) List!3713)

(assert (=> d!60699 (= lt!124975 (insertStrictlySorted!160 (toList!1888 (ite c!41801 call!23404 (ite c!41797 call!23401 call!23402))) (_1!2427 (ite (or c!41801 c!41797) (tuple2!4833 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4447 thiss!1504)) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504)))) (_2!2427 (ite (or c!41801 c!41797) (tuple2!4833 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4447 thiss!1504)) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504))))))))

(assert (=> d!60699 (= (+!665 (ite c!41801 call!23404 (ite c!41797 call!23401 call!23402)) (ite (or c!41801 c!41797) (tuple2!4833 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4447 thiss!1504)) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504)))) lt!124974)))

(declare-fun b!249506 () Bool)

(declare-fun res!122242 () Bool)

(assert (=> b!249506 (=> (not res!122242) (not e!161830))))

(assert (=> b!249506 (= res!122242 (= (getValueByKey!296 (toList!1888 lt!124974) (_1!2427 (ite (or c!41801 c!41797) (tuple2!4833 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4447 thiss!1504)) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504))))) (Some!301 (_2!2427 (ite (or c!41801 c!41797) (tuple2!4833 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4447 thiss!1504)) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504)))))))))

(declare-fun b!249507 () Bool)

(declare-fun contains!1808 (List!3713 tuple2!4832) Bool)

(assert (=> b!249507 (= e!161830 (contains!1808 (toList!1888 lt!124974) (ite (or c!41801 c!41797) (tuple2!4833 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4447 thiss!1504)) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504)))))))

(assert (= (and d!60699 res!122243) b!249506))

(assert (= (and b!249506 res!122242) b!249507))

(declare-fun m!265999 () Bool)

(assert (=> d!60699 m!265999))

(declare-fun m!266001 () Bool)

(assert (=> d!60699 m!266001))

(declare-fun m!266003 () Bool)

(assert (=> d!60699 m!266003))

(declare-fun m!266005 () Bool)

(assert (=> d!60699 m!266005))

(declare-fun m!266007 () Bool)

(assert (=> b!249506 m!266007))

(declare-fun m!266009 () Bool)

(assert (=> b!249507 m!266009))

(assert (=> bm!23398 d!60699))

(declare-fun b!249516 () Bool)

(declare-fun res!122254 () Bool)

(declare-fun e!161833 () Bool)

(assert (=> b!249516 (=> (not res!122254) (not e!161833))))

(assert (=> b!249516 (= res!122254 (and (= (size!6161 (_values!4589 thiss!1504)) (bvadd (mask!10767 thiss!1504) #b00000000000000000000000000000001)) (= (size!6162 (_keys!6734 thiss!1504)) (size!6161 (_values!4589 thiss!1504))) (bvsge (_size!1894 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1894 thiss!1504) (bvadd (mask!10767 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!249519 () Bool)

(assert (=> b!249519 (= e!161833 (and (bvsge (extraKeys!4343 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4343 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1894 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!60701 () Bool)

(declare-fun res!122253 () Bool)

(assert (=> d!60701 (=> (not res!122253) (not e!161833))))

(assert (=> d!60701 (= res!122253 (validMask!0 (mask!10767 thiss!1504)))))

(assert (=> d!60701 (= (simpleValid!261 thiss!1504) e!161833)))

(declare-fun b!249518 () Bool)

(declare-fun res!122255 () Bool)

(assert (=> b!249518 (=> (not res!122255) (not e!161833))))

(declare-fun size!6165 (LongMapFixedSize!3690) (_ BitVec 32))

(assert (=> b!249518 (= res!122255 (= (size!6165 thiss!1504) (bvadd (_size!1894 thiss!1504) (bvsdiv (bvadd (extraKeys!4343 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!249517 () Bool)

(declare-fun res!122252 () Bool)

(assert (=> b!249517 (=> (not res!122252) (not e!161833))))

(assert (=> b!249517 (= res!122252 (bvsge (size!6165 thiss!1504) (_size!1894 thiss!1504)))))

(assert (= (and d!60701 res!122253) b!249516))

(assert (= (and b!249516 res!122254) b!249517))

(assert (= (and b!249517 res!122252) b!249518))

(assert (= (and b!249518 res!122255) b!249519))

(assert (=> d!60701 m!265665))

(declare-fun m!266011 () Bool)

(assert (=> b!249518 m!266011))

(assert (=> b!249517 m!266011))

(assert (=> d!60641 d!60701))

(declare-fun d!60703 () Bool)

(assert (=> d!60703 (= (apply!238 lt!124859 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)) (get!2986 (getValueByKey!296 (toList!1888 lt!124859) (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8951 () Bool)

(assert (= bs!8951 d!60703))

(assert (=> bs!8951 m!265787))

(declare-fun m!266013 () Bool)

(assert (=> bs!8951 m!266013))

(assert (=> bs!8951 m!266013))

(declare-fun m!266015 () Bool)

(assert (=> bs!8951 m!266015))

(assert (=> b!249246 d!60703))

(declare-fun d!60705 () Bool)

(declare-fun c!41861 () Bool)

(assert (=> d!60705 (= c!41861 ((_ is ValueCellFull!2895) (select (arr!5818 (_values!4589 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!161836 () V!8283)

(assert (=> d!60705 (= (get!2985 (select (arr!5818 (_values!4589 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4606 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!161836)))

(declare-fun b!249524 () Bool)

(declare-fun get!2987 (ValueCell!2895 V!8283) V!8283)

(assert (=> b!249524 (= e!161836 (get!2987 (select (arr!5818 (_values!4589 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4606 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!249525 () Bool)

(declare-fun get!2988 (ValueCell!2895 V!8283) V!8283)

(assert (=> b!249525 (= e!161836 (get!2988 (select (arr!5818 (_values!4589 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4606 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60705 c!41861) b!249524))

(assert (= (and d!60705 (not c!41861)) b!249525))

(assert (=> b!249524 m!265807))

(assert (=> b!249524 m!265803))

(declare-fun m!266017 () Bool)

(assert (=> b!249524 m!266017))

(assert (=> b!249525 m!265807))

(assert (=> b!249525 m!265803))

(declare-fun m!266019 () Bool)

(assert (=> b!249525 m!266019))

(assert (=> b!249246 d!60705))

(declare-fun d!60707 () Bool)

(declare-fun isEmpty!525 (Option!302) Bool)

(assert (=> d!60707 (= (isDefined!237 (getValueByKey!296 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))) key!932)) (not (isEmpty!525 (getValueByKey!296 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))) key!932))))))

(declare-fun bs!8952 () Bool)

(assert (= bs!8952 d!60707))

(assert (=> bs!8952 m!265761))

(declare-fun m!266021 () Bool)

(assert (=> bs!8952 m!266021))

(assert (=> b!249195 d!60707))

(declare-fun b!249536 () Bool)

(declare-fun e!161842 () Option!302)

(assert (=> b!249536 (= e!161842 (getValueByKey!296 (t!8742 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))) key!932))))

(declare-fun b!249537 () Bool)

(assert (=> b!249537 (= e!161842 None!300)))

(declare-fun b!249534 () Bool)

(declare-fun e!161841 () Option!302)

(assert (=> b!249534 (= e!161841 (Some!301 (_2!2427 (h!4367 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))))))))

(declare-fun b!249535 () Bool)

(assert (=> b!249535 (= e!161841 e!161842)))

(declare-fun c!41867 () Bool)

(assert (=> b!249535 (= c!41867 (and ((_ is Cons!3709) (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))) (not (= (_1!2427 (h!4367 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))))) key!932))))))

(declare-fun d!60709 () Bool)

(declare-fun c!41866 () Bool)

(assert (=> d!60709 (= c!41866 (and ((_ is Cons!3709) (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))) (= (_1!2427 (h!4367 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))))) key!932)))))

(assert (=> d!60709 (= (getValueByKey!296 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))) key!932) e!161841)))

(assert (= (and d!60709 c!41866) b!249534))

(assert (= (and d!60709 (not c!41866)) b!249535))

(assert (= (and b!249535 c!41867) b!249536))

(assert (= (and b!249535 (not c!41867)) b!249537))

(declare-fun m!266023 () Bool)

(assert (=> b!249536 m!266023))

(assert (=> b!249195 d!60709))

(declare-fun d!60711 () Bool)

(declare-fun e!161843 () Bool)

(assert (=> d!60711 e!161843))

(declare-fun res!122257 () Bool)

(assert (=> d!60711 (=> (not res!122257) (not e!161843))))

(declare-fun lt!124978 () ListLongMap!3745)

(assert (=> d!60711 (= res!122257 (contains!1805 lt!124978 (_1!2427 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504)))))))

(declare-fun lt!124979 () List!3713)

(assert (=> d!60711 (= lt!124978 (ListLongMap!3746 lt!124979))))

(declare-fun lt!124980 () Unit!7714)

(declare-fun lt!124981 () Unit!7714)

(assert (=> d!60711 (= lt!124980 lt!124981)))

(assert (=> d!60711 (= (getValueByKey!296 lt!124979 (_1!2427 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504)))) (Some!301 (_2!2427 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504)))))))

(assert (=> d!60711 (= lt!124981 (lemmaContainsTupThenGetReturnValue!157 lt!124979 (_1!2427 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504))) (_2!2427 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504)))))))

(assert (=> d!60711 (= lt!124979 (insertStrictlySorted!160 (toList!1888 lt!124870) (_1!2427 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504))) (_2!2427 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504)))))))

(assert (=> d!60711 (= (+!665 lt!124870 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504))) lt!124978)))

(declare-fun b!249538 () Bool)

(declare-fun res!122256 () Bool)

(assert (=> b!249538 (=> (not res!122256) (not e!161843))))

(assert (=> b!249538 (= res!122256 (= (getValueByKey!296 (toList!1888 lt!124978) (_1!2427 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504)))) (Some!301 (_2!2427 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504))))))))

(declare-fun b!249539 () Bool)

(assert (=> b!249539 (= e!161843 (contains!1808 (toList!1888 lt!124978) (tuple2!4833 lt!124861 (minValue!4447 thiss!1504))))))

(assert (= (and d!60711 res!122257) b!249538))

(assert (= (and b!249538 res!122256) b!249539))

(declare-fun m!266025 () Bool)

(assert (=> d!60711 m!266025))

(declare-fun m!266027 () Bool)

(assert (=> d!60711 m!266027))

(declare-fun m!266029 () Bool)

(assert (=> d!60711 m!266029))

(declare-fun m!266031 () Bool)

(assert (=> d!60711 m!266031))

(declare-fun m!266033 () Bool)

(assert (=> b!249538 m!266033))

(declare-fun m!266035 () Bool)

(assert (=> b!249539 m!266035))

(assert (=> b!249258 d!60711))

(declare-fun d!60713 () Bool)

(assert (=> d!60713 (= (apply!238 (+!665 lt!124866 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504))) lt!124856) (apply!238 lt!124866 lt!124856))))

(declare-fun lt!124984 () Unit!7714)

(declare-fun choose!1176 (ListLongMap!3745 (_ BitVec 64) V!8283 (_ BitVec 64)) Unit!7714)

(assert (=> d!60713 (= lt!124984 (choose!1176 lt!124866 lt!124858 (zeroValue!4447 thiss!1504) lt!124856))))

(declare-fun e!161846 () Bool)

(assert (=> d!60713 e!161846))

(declare-fun res!122260 () Bool)

(assert (=> d!60713 (=> (not res!122260) (not e!161846))))

(assert (=> d!60713 (= res!122260 (contains!1805 lt!124866 lt!124856))))

(assert (=> d!60713 (= (addApplyDifferent!214 lt!124866 lt!124858 (zeroValue!4447 thiss!1504) lt!124856) lt!124984)))

(declare-fun b!249543 () Bool)

(assert (=> b!249543 (= e!161846 (not (= lt!124856 lt!124858)))))

(assert (= (and d!60713 res!122260) b!249543))

(declare-fun m!266037 () Bool)

(assert (=> d!60713 m!266037))

(declare-fun m!266039 () Bool)

(assert (=> d!60713 m!266039))

(assert (=> d!60713 m!265765))

(assert (=> d!60713 m!265779))

(assert (=> d!60713 m!265779))

(assert (=> d!60713 m!265781))

(assert (=> b!249258 d!60713))

(declare-fun d!60715 () Bool)

(declare-fun e!161848 () Bool)

(assert (=> d!60715 e!161848))

(declare-fun res!122261 () Bool)

(assert (=> d!60715 (=> res!122261 e!161848)))

(declare-fun lt!124988 () Bool)

(assert (=> d!60715 (= res!122261 (not lt!124988))))

(declare-fun lt!124987 () Bool)

(assert (=> d!60715 (= lt!124988 lt!124987)))

(declare-fun lt!124985 () Unit!7714)

(declare-fun e!161847 () Unit!7714)

(assert (=> d!60715 (= lt!124985 e!161847)))

(declare-fun c!41868 () Bool)

(assert (=> d!60715 (= c!41868 lt!124987)))

(assert (=> d!60715 (= lt!124987 (containsKey!288 (toList!1888 (+!665 lt!124872 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504)))) lt!124857))))

(assert (=> d!60715 (= (contains!1805 (+!665 lt!124872 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504))) lt!124857) lt!124988)))

(declare-fun b!249544 () Bool)

(declare-fun lt!124986 () Unit!7714)

(assert (=> b!249544 (= e!161847 lt!124986)))

(assert (=> b!249544 (= lt!124986 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1888 (+!665 lt!124872 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504)))) lt!124857))))

(assert (=> b!249544 (isDefined!237 (getValueByKey!296 (toList!1888 (+!665 lt!124872 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504)))) lt!124857))))

(declare-fun b!249545 () Bool)

(declare-fun Unit!7727 () Unit!7714)

(assert (=> b!249545 (= e!161847 Unit!7727)))

(declare-fun b!249546 () Bool)

(assert (=> b!249546 (= e!161848 (isDefined!237 (getValueByKey!296 (toList!1888 (+!665 lt!124872 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504)))) lt!124857)))))

(assert (= (and d!60715 c!41868) b!249544))

(assert (= (and d!60715 (not c!41868)) b!249545))

(assert (= (and d!60715 (not res!122261)) b!249546))

(declare-fun m!266041 () Bool)

(assert (=> d!60715 m!266041))

(declare-fun m!266043 () Bool)

(assert (=> b!249544 m!266043))

(declare-fun m!266045 () Bool)

(assert (=> b!249544 m!266045))

(assert (=> b!249544 m!266045))

(declare-fun m!266047 () Bool)

(assert (=> b!249544 m!266047))

(assert (=> b!249546 m!266045))

(assert (=> b!249546 m!266045))

(assert (=> b!249546 m!266047))

(assert (=> b!249258 d!60715))

(declare-fun d!60717 () Bool)

(declare-fun e!161849 () Bool)

(assert (=> d!60717 e!161849))

(declare-fun res!122263 () Bool)

(assert (=> d!60717 (=> (not res!122263) (not e!161849))))

(declare-fun lt!124989 () ListLongMap!3745)

(assert (=> d!60717 (= res!122263 (contains!1805 lt!124989 (_1!2427 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504)))))))

(declare-fun lt!124990 () List!3713)

(assert (=> d!60717 (= lt!124989 (ListLongMap!3746 lt!124990))))

(declare-fun lt!124991 () Unit!7714)

(declare-fun lt!124992 () Unit!7714)

(assert (=> d!60717 (= lt!124991 lt!124992)))

(assert (=> d!60717 (= (getValueByKey!296 lt!124990 (_1!2427 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504)))) (Some!301 (_2!2427 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504)))))))

(assert (=> d!60717 (= lt!124992 (lemmaContainsTupThenGetReturnValue!157 lt!124990 (_1!2427 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504))) (_2!2427 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504)))))))

(assert (=> d!60717 (= lt!124990 (insertStrictlySorted!160 (toList!1888 lt!124867) (_1!2427 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504))) (_2!2427 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504)))))))

(assert (=> d!60717 (= (+!665 lt!124867 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504))) lt!124989)))

(declare-fun b!249547 () Bool)

(declare-fun res!122262 () Bool)

(assert (=> b!249547 (=> (not res!122262) (not e!161849))))

(assert (=> b!249547 (= res!122262 (= (getValueByKey!296 (toList!1888 lt!124989) (_1!2427 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504)))) (Some!301 (_2!2427 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504))))))))

(declare-fun b!249548 () Bool)

(assert (=> b!249548 (= e!161849 (contains!1808 (toList!1888 lt!124989) (tuple2!4833 lt!124874 (minValue!4447 thiss!1504))))))

(assert (= (and d!60717 res!122263) b!249547))

(assert (= (and b!249547 res!122262) b!249548))

(declare-fun m!266049 () Bool)

(assert (=> d!60717 m!266049))

(declare-fun m!266051 () Bool)

(assert (=> d!60717 m!266051))

(declare-fun m!266053 () Bool)

(assert (=> d!60717 m!266053))

(declare-fun m!266055 () Bool)

(assert (=> d!60717 m!266055))

(declare-fun m!266057 () Bool)

(assert (=> b!249547 m!266057))

(declare-fun m!266059 () Bool)

(assert (=> b!249548 m!266059))

(assert (=> b!249258 d!60717))

(declare-fun d!60719 () Bool)

(assert (=> d!60719 (= (apply!238 (+!665 lt!124870 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504))) lt!124868) (get!2986 (getValueByKey!296 (toList!1888 (+!665 lt!124870 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504)))) lt!124868)))))

(declare-fun bs!8953 () Bool)

(assert (= bs!8953 d!60719))

(declare-fun m!266061 () Bool)

(assert (=> bs!8953 m!266061))

(assert (=> bs!8953 m!266061))

(declare-fun m!266063 () Bool)

(assert (=> bs!8953 m!266063))

(assert (=> b!249258 d!60719))

(declare-fun d!60721 () Bool)

(assert (=> d!60721 (= (apply!238 lt!124866 lt!124856) (get!2986 (getValueByKey!296 (toList!1888 lt!124866) lt!124856)))))

(declare-fun bs!8954 () Bool)

(assert (= bs!8954 d!60721))

(declare-fun m!266065 () Bool)

(assert (=> bs!8954 m!266065))

(assert (=> bs!8954 m!266065))

(declare-fun m!266067 () Bool)

(assert (=> bs!8954 m!266067))

(assert (=> b!249258 d!60721))

(declare-fun d!60723 () Bool)

(declare-fun e!161850 () Bool)

(assert (=> d!60723 e!161850))

(declare-fun res!122265 () Bool)

(assert (=> d!60723 (=> (not res!122265) (not e!161850))))

(declare-fun lt!124993 () ListLongMap!3745)

(assert (=> d!60723 (= res!122265 (contains!1805 lt!124993 (_1!2427 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504)))))))

(declare-fun lt!124994 () List!3713)

(assert (=> d!60723 (= lt!124993 (ListLongMap!3746 lt!124994))))

(declare-fun lt!124995 () Unit!7714)

(declare-fun lt!124996 () Unit!7714)

(assert (=> d!60723 (= lt!124995 lt!124996)))

(assert (=> d!60723 (= (getValueByKey!296 lt!124994 (_1!2427 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504)))) (Some!301 (_2!2427 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504)))))))

(assert (=> d!60723 (= lt!124996 (lemmaContainsTupThenGetReturnValue!157 lt!124994 (_1!2427 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504))) (_2!2427 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504)))))))

(assert (=> d!60723 (= lt!124994 (insertStrictlySorted!160 (toList!1888 lt!124872) (_1!2427 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504))) (_2!2427 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504)))))))

(assert (=> d!60723 (= (+!665 lt!124872 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504))) lt!124993)))

(declare-fun b!249549 () Bool)

(declare-fun res!122264 () Bool)

(assert (=> b!249549 (=> (not res!122264) (not e!161850))))

(assert (=> b!249549 (= res!122264 (= (getValueByKey!296 (toList!1888 lt!124993) (_1!2427 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504)))) (Some!301 (_2!2427 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504))))))))

(declare-fun b!249550 () Bool)

(assert (=> b!249550 (= e!161850 (contains!1808 (toList!1888 lt!124993) (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504))))))

(assert (= (and d!60723 res!122265) b!249549))

(assert (= (and b!249549 res!122264) b!249550))

(declare-fun m!266069 () Bool)

(assert (=> d!60723 m!266069))

(declare-fun m!266071 () Bool)

(assert (=> d!60723 m!266071))

(declare-fun m!266073 () Bool)

(assert (=> d!60723 m!266073))

(declare-fun m!266075 () Bool)

(assert (=> d!60723 m!266075))

(declare-fun m!266077 () Bool)

(assert (=> b!249549 m!266077))

(declare-fun m!266079 () Bool)

(assert (=> b!249550 m!266079))

(assert (=> b!249258 d!60723))

(declare-fun d!60725 () Bool)

(assert (=> d!60725 (contains!1805 (+!665 lt!124872 (tuple2!4833 lt!124860 (zeroValue!4447 thiss!1504))) lt!124857)))

(declare-fun lt!124999 () Unit!7714)

(declare-fun choose!1177 (ListLongMap!3745 (_ BitVec 64) V!8283 (_ BitVec 64)) Unit!7714)

(assert (=> d!60725 (= lt!124999 (choose!1177 lt!124872 lt!124860 (zeroValue!4447 thiss!1504) lt!124857))))

(assert (=> d!60725 (contains!1805 lt!124872 lt!124857)))

(assert (=> d!60725 (= (addStillContains!214 lt!124872 lt!124860 (zeroValue!4447 thiss!1504) lt!124857) lt!124999)))

(declare-fun bs!8955 () Bool)

(assert (= bs!8955 d!60725))

(assert (=> bs!8955 m!265769))

(assert (=> bs!8955 m!265769))

(assert (=> bs!8955 m!265771))

(declare-fun m!266081 () Bool)

(assert (=> bs!8955 m!266081))

(declare-fun m!266083 () Bool)

(assert (=> bs!8955 m!266083))

(assert (=> b!249258 d!60725))

(declare-fun d!60727 () Bool)

(assert (=> d!60727 (= (apply!238 lt!124867 lt!124864) (get!2986 (getValueByKey!296 (toList!1888 lt!124867) lt!124864)))))

(declare-fun bs!8956 () Bool)

(assert (= bs!8956 d!60727))

(declare-fun m!266085 () Bool)

(assert (=> bs!8956 m!266085))

(assert (=> bs!8956 m!266085))

(declare-fun m!266087 () Bool)

(assert (=> bs!8956 m!266087))

(assert (=> b!249258 d!60727))

(assert (=> b!249258 d!60693))

(declare-fun d!60729 () Bool)

(assert (=> d!60729 (= (apply!238 (+!665 lt!124867 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504))) lt!124864) (get!2986 (getValueByKey!296 (toList!1888 (+!665 lt!124867 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504)))) lt!124864)))))

(declare-fun bs!8957 () Bool)

(assert (= bs!8957 d!60729))

(declare-fun m!266089 () Bool)

(assert (=> bs!8957 m!266089))

(assert (=> bs!8957 m!266089))

(declare-fun m!266091 () Bool)

(assert (=> bs!8957 m!266091))

(assert (=> b!249258 d!60729))

(declare-fun d!60731 () Bool)

(assert (=> d!60731 (= (apply!238 (+!665 lt!124867 (tuple2!4833 lt!124874 (minValue!4447 thiss!1504))) lt!124864) (apply!238 lt!124867 lt!124864))))

(declare-fun lt!125000 () Unit!7714)

(assert (=> d!60731 (= lt!125000 (choose!1176 lt!124867 lt!124874 (minValue!4447 thiss!1504) lt!124864))))

(declare-fun e!161851 () Bool)

(assert (=> d!60731 e!161851))

(declare-fun res!122266 () Bool)

(assert (=> d!60731 (=> (not res!122266) (not e!161851))))

(assert (=> d!60731 (= res!122266 (contains!1805 lt!124867 lt!124864))))

(assert (=> d!60731 (= (addApplyDifferent!214 lt!124867 lt!124874 (minValue!4447 thiss!1504) lt!124864) lt!125000)))

(declare-fun b!249552 () Bool)

(assert (=> b!249552 (= e!161851 (not (= lt!124864 lt!124874)))))

(assert (= (and d!60731 res!122266) b!249552))

(declare-fun m!266093 () Bool)

(assert (=> d!60731 m!266093))

(declare-fun m!266095 () Bool)

(assert (=> d!60731 m!266095))

(assert (=> d!60731 m!265791))

(assert (=> d!60731 m!265773))

(assert (=> d!60731 m!265773))

(assert (=> d!60731 m!265775))

(assert (=> b!249258 d!60731))

(declare-fun d!60733 () Bool)

(assert (=> d!60733 (= (apply!238 lt!124870 lt!124868) (get!2986 (getValueByKey!296 (toList!1888 lt!124870) lt!124868)))))

(declare-fun bs!8958 () Bool)

(assert (= bs!8958 d!60733))

(declare-fun m!266097 () Bool)

(assert (=> bs!8958 m!266097))

(assert (=> bs!8958 m!266097))

(declare-fun m!266099 () Bool)

(assert (=> bs!8958 m!266099))

(assert (=> b!249258 d!60733))

(declare-fun d!60735 () Bool)

(assert (=> d!60735 (= (apply!238 (+!665 lt!124866 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504))) lt!124856) (get!2986 (getValueByKey!296 (toList!1888 (+!665 lt!124866 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504)))) lt!124856)))))

(declare-fun bs!8959 () Bool)

(assert (= bs!8959 d!60735))

(declare-fun m!266101 () Bool)

(assert (=> bs!8959 m!266101))

(assert (=> bs!8959 m!266101))

(declare-fun m!266103 () Bool)

(assert (=> bs!8959 m!266103))

(assert (=> b!249258 d!60735))

(declare-fun d!60737 () Bool)

(declare-fun e!161852 () Bool)

(assert (=> d!60737 e!161852))

(declare-fun res!122268 () Bool)

(assert (=> d!60737 (=> (not res!122268) (not e!161852))))

(declare-fun lt!125001 () ListLongMap!3745)

(assert (=> d!60737 (= res!122268 (contains!1805 lt!125001 (_1!2427 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504)))))))

(declare-fun lt!125002 () List!3713)

(assert (=> d!60737 (= lt!125001 (ListLongMap!3746 lt!125002))))

(declare-fun lt!125003 () Unit!7714)

(declare-fun lt!125004 () Unit!7714)

(assert (=> d!60737 (= lt!125003 lt!125004)))

(assert (=> d!60737 (= (getValueByKey!296 lt!125002 (_1!2427 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504)))) (Some!301 (_2!2427 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504)))))))

(assert (=> d!60737 (= lt!125004 (lemmaContainsTupThenGetReturnValue!157 lt!125002 (_1!2427 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504))) (_2!2427 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504)))))))

(assert (=> d!60737 (= lt!125002 (insertStrictlySorted!160 (toList!1888 lt!124866) (_1!2427 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504))) (_2!2427 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504)))))))

(assert (=> d!60737 (= (+!665 lt!124866 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504))) lt!125001)))

(declare-fun b!249553 () Bool)

(declare-fun res!122267 () Bool)

(assert (=> b!249553 (=> (not res!122267) (not e!161852))))

(assert (=> b!249553 (= res!122267 (= (getValueByKey!296 (toList!1888 lt!125001) (_1!2427 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504)))) (Some!301 (_2!2427 (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504))))))))

(declare-fun b!249554 () Bool)

(assert (=> b!249554 (= e!161852 (contains!1808 (toList!1888 lt!125001) (tuple2!4833 lt!124858 (zeroValue!4447 thiss!1504))))))

(assert (= (and d!60737 res!122268) b!249553))

(assert (= (and b!249553 res!122267) b!249554))

(declare-fun m!266105 () Bool)

(assert (=> d!60737 m!266105))

(declare-fun m!266107 () Bool)

(assert (=> d!60737 m!266107))

(declare-fun m!266109 () Bool)

(assert (=> d!60737 m!266109))

(declare-fun m!266111 () Bool)

(assert (=> d!60737 m!266111))

(declare-fun m!266113 () Bool)

(assert (=> b!249553 m!266113))

(declare-fun m!266115 () Bool)

(assert (=> b!249554 m!266115))

(assert (=> b!249258 d!60737))

(declare-fun d!60739 () Bool)

(assert (=> d!60739 (= (apply!238 (+!665 lt!124870 (tuple2!4833 lt!124861 (minValue!4447 thiss!1504))) lt!124868) (apply!238 lt!124870 lt!124868))))

(declare-fun lt!125005 () Unit!7714)

(assert (=> d!60739 (= lt!125005 (choose!1176 lt!124870 lt!124861 (minValue!4447 thiss!1504) lt!124868))))

(declare-fun e!161853 () Bool)

(assert (=> d!60739 e!161853))

(declare-fun res!122269 () Bool)

(assert (=> d!60739 (=> (not res!122269) (not e!161853))))

(assert (=> d!60739 (= res!122269 (contains!1805 lt!124870 lt!124868))))

(assert (=> d!60739 (= (addApplyDifferent!214 lt!124870 lt!124861 (minValue!4447 thiss!1504) lt!124868) lt!125005)))

(declare-fun b!249555 () Bool)

(assert (=> b!249555 (= e!161853 (not (= lt!124868 lt!124861)))))

(assert (= (and d!60739 res!122269) b!249555))

(declare-fun m!266117 () Bool)

(assert (=> d!60739 m!266117))

(declare-fun m!266119 () Bool)

(assert (=> d!60739 m!266119))

(assert (=> d!60739 m!265777))

(assert (=> d!60739 m!265795))

(assert (=> d!60739 m!265795))

(assert (=> d!60739 m!265797))

(assert (=> b!249258 d!60739))

(declare-fun d!60741 () Bool)

(assert (=> d!60741 (isDefined!237 (getValueByKey!296 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))) key!932))))

(declare-fun lt!125008 () Unit!7714)

(declare-fun choose!1178 (List!3713 (_ BitVec 64)) Unit!7714)

(assert (=> d!60741 (= lt!125008 (choose!1178 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))) key!932))))

(declare-fun e!161856 () Bool)

(assert (=> d!60741 e!161856))

(declare-fun res!122272 () Bool)

(assert (=> d!60741 (=> (not res!122272) (not e!161856))))

(declare-fun isStrictlySorted!369 (List!3713) Bool)

(assert (=> d!60741 (= res!122272 (isStrictlySorted!369 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504)))))))

(assert (=> d!60741 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))) key!932) lt!125008)))

(declare-fun b!249558 () Bool)

(assert (=> b!249558 (= e!161856 (containsKey!288 (toList!1888 (getCurrentListMap!1416 (_keys!6734 thiss!1504) (_values!4589 thiss!1504) (mask!10767 thiss!1504) (extraKeys!4343 thiss!1504) (zeroValue!4447 thiss!1504) (minValue!4447 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4606 thiss!1504))) key!932))))

(assert (= (and d!60741 res!122272) b!249558))

(assert (=> d!60741 m!265761))

(assert (=> d!60741 m!265761))

(assert (=> d!60741 m!265763))

(declare-fun m!266121 () Bool)

(assert (=> d!60741 m!266121))

(declare-fun m!266123 () Bool)

(assert (=> d!60741 m!266123))

(assert (=> b!249558 m!265757))

(assert (=> b!249193 d!60741))

(assert (=> b!249193 d!60707))

(assert (=> b!249193 d!60709))

(declare-fun b!249559 () Bool)

(declare-fun e!161858 () Bool)

(declare-fun call!23436 () Bool)

(assert (=> b!249559 (= e!161858 call!23436)))

(declare-fun d!60743 () Bool)

(declare-fun res!122274 () Bool)

(declare-fun e!161857 () Bool)

(assert (=> d!60743 (=> res!122274 e!161857)))

(assert (=> d!60743 (= res!122274 (bvsge #b00000000000000000000000000000000 (size!6162 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))))))))

(assert (=> d!60743 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) (mask!10767 thiss!1504)) e!161857)))

(declare-fun b!249560 () Bool)

(declare-fun e!161859 () Bool)

(assert (=> b!249560 (= e!161859 e!161858)))

(declare-fun lt!125009 () (_ BitVec 64))

(assert (=> b!249560 (= lt!125009 (select (arr!5819 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!125011 () Unit!7714)

(assert (=> b!249560 (= lt!125011 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) lt!125009 #b00000000000000000000000000000000))))

(assert (=> b!249560 (arrayContainsKey!0 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) lt!125009 #b00000000000000000000000000000000)))

(declare-fun lt!125010 () Unit!7714)

(assert (=> b!249560 (= lt!125010 lt!125011)))

(declare-fun res!122273 () Bool)

(assert (=> b!249560 (= res!122273 (= (seekEntryOrOpen!0 (select (arr!5819 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504)))) #b00000000000000000000000000000000) (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) (mask!10767 thiss!1504)) (Found!1116 #b00000000000000000000000000000000)))))

(assert (=> b!249560 (=> (not res!122273) (not e!161858))))

(declare-fun bm!23433 () Bool)

(assert (=> bm!23433 (= call!23436 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) (mask!10767 thiss!1504)))))

(declare-fun b!249561 () Bool)

(assert (=> b!249561 (= e!161859 call!23436)))

(declare-fun b!249562 () Bool)

(assert (=> b!249562 (= e!161857 e!161859)))

(declare-fun c!41869 () Bool)

(assert (=> b!249562 (= c!41869 (validKeyInArray!0 (select (arr!5819 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60743 (not res!122274)) b!249562))

(assert (= (and b!249562 c!41869) b!249560))

(assert (= (and b!249562 (not c!41869)) b!249561))

(assert (= (and b!249560 res!122273) b!249559))

(assert (= (or b!249559 b!249561) bm!23433))

(assert (=> b!249560 m!265927))

(declare-fun m!266125 () Bool)

(assert (=> b!249560 m!266125))

(declare-fun m!266127 () Bool)

(assert (=> b!249560 m!266127))

(assert (=> b!249560 m!265927))

(declare-fun m!266129 () Bool)

(assert (=> b!249560 m!266129))

(declare-fun m!266131 () Bool)

(assert (=> bm!23433 m!266131))

(assert (=> b!249562 m!265927))

(assert (=> b!249562 m!265927))

(assert (=> b!249562 m!265931))

(assert (=> b!249351 d!60743))

(assert (=> b!249328 d!60663))

(declare-fun d!60745 () Bool)

(declare-fun e!161861 () Bool)

(assert (=> d!60745 e!161861))

(declare-fun res!122275 () Bool)

(assert (=> d!60745 (=> res!122275 e!161861)))

(declare-fun lt!125015 () Bool)

(assert (=> d!60745 (= res!122275 (not lt!125015))))

(declare-fun lt!125014 () Bool)

(assert (=> d!60745 (= lt!125015 lt!125014)))

(declare-fun lt!125012 () Unit!7714)

(declare-fun e!161860 () Unit!7714)

(assert (=> d!60745 (= lt!125012 e!161860)))

(declare-fun c!41870 () Bool)

(assert (=> d!60745 (= c!41870 lt!125014)))

(assert (=> d!60745 (= lt!125014 (containsKey!288 (toList!1888 lt!124859) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60745 (= (contains!1805 lt!124859 #b1000000000000000000000000000000000000000000000000000000000000000) lt!125015)))

(declare-fun b!249563 () Bool)

(declare-fun lt!125013 () Unit!7714)

(assert (=> b!249563 (= e!161860 lt!125013)))

(assert (=> b!249563 (= lt!125013 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1888 lt!124859) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249563 (isDefined!237 (getValueByKey!296 (toList!1888 lt!124859) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249564 () Bool)

(declare-fun Unit!7728 () Unit!7714)

(assert (=> b!249564 (= e!161860 Unit!7728)))

(declare-fun b!249565 () Bool)

(assert (=> b!249565 (= e!161861 (isDefined!237 (getValueByKey!296 (toList!1888 lt!124859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60745 c!41870) b!249563))

(assert (= (and d!60745 (not c!41870)) b!249564))

(assert (= (and d!60745 (not res!122275)) b!249565))

(declare-fun m!266133 () Bool)

(assert (=> d!60745 m!266133))

(declare-fun m!266135 () Bool)

(assert (=> b!249563 m!266135))

(assert (=> b!249563 m!265965))

(assert (=> b!249563 m!265965))

(declare-fun m!266137 () Bool)

(assert (=> b!249563 m!266137))

(assert (=> b!249565 m!265965))

(assert (=> b!249565 m!265965))

(assert (=> b!249565 m!266137))

(assert (=> bm!23403 d!60745))

(declare-fun d!60747 () Bool)

(declare-fun e!161863 () Bool)

(assert (=> d!60747 e!161863))

(declare-fun res!122276 () Bool)

(assert (=> d!60747 (=> res!122276 e!161863)))

(declare-fun lt!125019 () Bool)

(assert (=> d!60747 (= res!122276 (not lt!125019))))

(declare-fun lt!125018 () Bool)

(assert (=> d!60747 (= lt!125019 lt!125018)))

(declare-fun lt!125016 () Unit!7714)

(declare-fun e!161862 () Unit!7714)

(assert (=> d!60747 (= lt!125016 e!161862)))

(declare-fun c!41871 () Bool)

(assert (=> d!60747 (= c!41871 lt!125018)))

(assert (=> d!60747 (= lt!125018 (containsKey!288 (toList!1888 lt!124859) (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60747 (= (contains!1805 lt!124859 (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)) lt!125019)))

(declare-fun b!249566 () Bool)

(declare-fun lt!125017 () Unit!7714)

(assert (=> b!249566 (= e!161862 lt!125017)))

(assert (=> b!249566 (= lt!125017 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1888 lt!124859) (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249566 (isDefined!237 (getValueByKey!296 (toList!1888 lt!124859) (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249567 () Bool)

(declare-fun Unit!7729 () Unit!7714)

(assert (=> b!249567 (= e!161862 Unit!7729)))

(declare-fun b!249568 () Bool)

(assert (=> b!249568 (= e!161863 (isDefined!237 (getValueByKey!296 (toList!1888 lt!124859) (select (arr!5819 (_keys!6734 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!60747 c!41871) b!249566))

(assert (= (and d!60747 (not c!41871)) b!249567))

(assert (= (and d!60747 (not res!122276)) b!249568))

(assert (=> d!60747 m!265787))

(declare-fun m!266139 () Bool)

(assert (=> d!60747 m!266139))

(assert (=> b!249566 m!265787))

(declare-fun m!266141 () Bool)

(assert (=> b!249566 m!266141))

(assert (=> b!249566 m!265787))

(assert (=> b!249566 m!266013))

(assert (=> b!249566 m!266013))

(declare-fun m!266143 () Bool)

(assert (=> b!249566 m!266143))

(assert (=> b!249568 m!265787))

(assert (=> b!249568 m!266013))

(assert (=> b!249568 m!266013))

(assert (=> b!249568 m!266143))

(assert (=> b!249242 d!60747))

(declare-fun b!249569 () Bool)

(declare-fun e!161865 () Bool)

(declare-fun call!23437 () Bool)

(assert (=> b!249569 (= e!161865 call!23437)))

(declare-fun d!60749 () Bool)

(declare-fun res!122278 () Bool)

(declare-fun e!161864 () Bool)

(assert (=> d!60749 (=> res!122278 e!161864)))

(assert (=> d!60749 (= res!122278 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 lt!124762)))))

(assert (=> d!60749 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!124762 (mask!10767 thiss!1504)) e!161864)))

(declare-fun b!249570 () Bool)

(declare-fun e!161866 () Bool)

(assert (=> b!249570 (= e!161866 e!161865)))

(declare-fun lt!125020 () (_ BitVec 64))

(assert (=> b!249570 (= lt!125020 (select (arr!5819 lt!124762) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!125022 () Unit!7714)

(assert (=> b!249570 (= lt!125022 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124762 lt!125020 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!249570 (arrayContainsKey!0 lt!124762 lt!125020 #b00000000000000000000000000000000)))

(declare-fun lt!125021 () Unit!7714)

(assert (=> b!249570 (= lt!125021 lt!125022)))

(declare-fun res!122277 () Bool)

(assert (=> b!249570 (= res!122277 (= (seekEntryOrOpen!0 (select (arr!5819 lt!124762) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!124762 (mask!10767 thiss!1504)) (Found!1116 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!249570 (=> (not res!122277) (not e!161865))))

(declare-fun bm!23434 () Bool)

(assert (=> bm!23434 (= call!23437 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!124762 (mask!10767 thiss!1504)))))

(declare-fun b!249571 () Bool)

(assert (=> b!249571 (= e!161866 call!23437)))

(declare-fun b!249572 () Bool)

(assert (=> b!249572 (= e!161864 e!161866)))

(declare-fun c!41872 () Bool)

(assert (=> b!249572 (= c!41872 (validKeyInArray!0 (select (arr!5819 lt!124762) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!60749 (not res!122278)) b!249572))

(assert (= (and b!249572 c!41872) b!249570))

(assert (= (and b!249572 (not c!41872)) b!249571))

(assert (= (and b!249570 res!122277) b!249569))

(assert (= (or b!249569 b!249571) bm!23434))

(declare-fun m!266145 () Bool)

(assert (=> b!249570 m!266145))

(declare-fun m!266147 () Bool)

(assert (=> b!249570 m!266147))

(declare-fun m!266149 () Bool)

(assert (=> b!249570 m!266149))

(assert (=> b!249570 m!266145))

(declare-fun m!266151 () Bool)

(assert (=> b!249570 m!266151))

(declare-fun m!266153 () Bool)

(assert (=> bm!23434 m!266153))

(assert (=> b!249572 m!266145))

(assert (=> b!249572 m!266145))

(declare-fun m!266155 () Bool)

(assert (=> b!249572 m!266155))

(assert (=> bm!23418 d!60749))

(declare-fun b!249573 () Bool)

(declare-fun e!161867 () (_ BitVec 32))

(declare-fun call!23438 () (_ BitVec 32))

(assert (=> b!249573 (= e!161867 call!23438)))

(declare-fun b!249574 () Bool)

(declare-fun e!161868 () (_ BitVec 32))

(assert (=> b!249574 (= e!161868 #b00000000000000000000000000000000)))

(declare-fun bm!23435 () Bool)

(assert (=> bm!23435 (= call!23438 (arrayCountValidKeys!0 lt!124762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun d!60751 () Bool)

(declare-fun lt!125023 () (_ BitVec 32))

(assert (=> d!60751 (and (bvsge lt!125023 #b00000000000000000000000000000000) (bvsle lt!125023 (bvsub (size!6162 lt!124762) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!60751 (= lt!125023 e!161868)))

(declare-fun c!41874 () Bool)

(assert (=> d!60751 (= c!41874 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))))))

(assert (=> d!60751 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6162 (_keys!6734 thiss!1504)) (size!6162 lt!124762)))))

(assert (=> d!60751 (= (arrayCountValidKeys!0 lt!124762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))) lt!125023)))

(declare-fun b!249575 () Bool)

(assert (=> b!249575 (= e!161868 e!161867)))

(declare-fun c!41873 () Bool)

(assert (=> b!249575 (= c!41873 (validKeyInArray!0 (select (arr!5819 lt!124762) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!249576 () Bool)

(assert (=> b!249576 (= e!161867 (bvadd #b00000000000000000000000000000001 call!23438))))

(assert (= (and d!60751 c!41874) b!249574))

(assert (= (and d!60751 (not c!41874)) b!249575))

(assert (= (and b!249575 c!41873) b!249576))

(assert (= (and b!249575 (not c!41873)) b!249573))

(assert (= (or b!249576 b!249573) bm!23435))

(declare-fun m!266157 () Bool)

(assert (=> bm!23435 m!266157))

(assert (=> b!249575 m!266145))

(assert (=> b!249575 m!266145))

(assert (=> b!249575 m!266155))

(assert (=> bm!23419 d!60751))

(declare-fun b!249577 () Bool)

(declare-fun e!161869 () (_ BitVec 32))

(declare-fun call!23439 () (_ BitVec 32))

(assert (=> b!249577 (= e!161869 call!23439)))

(declare-fun b!249578 () Bool)

(declare-fun e!161870 () (_ BitVec 32))

(assert (=> b!249578 (= e!161870 #b00000000000000000000000000000000)))

(declare-fun bm!23436 () Bool)

(assert (=> bm!23436 (= call!23439 (arrayCountValidKeys!0 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun lt!125024 () (_ BitVec 32))

(declare-fun d!60753 () Bool)

(assert (=> d!60753 (and (bvsge lt!125024 #b00000000000000000000000000000000) (bvsle lt!125024 (bvsub (size!6162 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!60753 (= lt!125024 e!161870)))

(declare-fun c!41876 () Bool)

(assert (=> d!60753 (= c!41876 (bvsge #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))))))

(assert (=> d!60753 (and (bvsle #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6162 (_keys!6734 thiss!1504)) (size!6162 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))))))))

(assert (=> d!60753 (= (arrayCountValidKeys!0 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504))) #b00000000000000000000000000000000 (size!6162 (_keys!6734 thiss!1504))) lt!125024)))

(declare-fun b!249579 () Bool)

(assert (=> b!249579 (= e!161870 e!161869)))

(declare-fun c!41875 () Bool)

(assert (=> b!249579 (= c!41875 (validKeyInArray!0 (select (arr!5819 (array!12270 (store (arr!5819 (_keys!6734 thiss!1504)) index!297 key!932) (size!6162 (_keys!6734 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!249580 () Bool)

(assert (=> b!249580 (= e!161869 (bvadd #b00000000000000000000000000000001 call!23439))))

(assert (= (and d!60753 c!41876) b!249578))

(assert (= (and d!60753 (not c!41876)) b!249579))

(assert (= (and b!249579 c!41875) b!249580))

(assert (= (and b!249579 (not c!41875)) b!249577))

(assert (= (or b!249580 b!249577) bm!23436))

(declare-fun m!266159 () Bool)

(assert (=> bm!23436 m!266159))

(assert (=> b!249579 m!265927))

(assert (=> b!249579 m!265927))

(assert (=> b!249579 m!265931))

(assert (=> b!249317 d!60753))

(assert (=> b!249317 d!60627))

(declare-fun b!249593 () Bool)

(declare-fun e!161877 () SeekEntryResult!1116)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!249593 (= e!161877 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24614 lt!124920) #b00000000000000000000000000000001) (nextIndex!0 (index!6636 lt!124920) (x!24614 lt!124920) (mask!10767 thiss!1504)) (index!6636 lt!124920) key!932 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)))))

(declare-fun b!249594 () Bool)

(declare-fun e!161879 () SeekEntryResult!1116)

(declare-fun e!161878 () SeekEntryResult!1116)

(assert (=> b!249594 (= e!161879 e!161878)))

(declare-fun c!41885 () Bool)

(declare-fun lt!125029 () (_ BitVec 64))

(assert (=> b!249594 (= c!41885 (= lt!125029 key!932))))

(declare-fun b!249596 () Bool)

(declare-fun c!41884 () Bool)

(assert (=> b!249596 (= c!41884 (= lt!125029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249596 (= e!161878 e!161877)))

(declare-fun b!249595 () Bool)

(assert (=> b!249595 (= e!161878 (Found!1116 (index!6636 lt!124920)))))

(declare-fun d!60755 () Bool)

(declare-fun lt!125030 () SeekEntryResult!1116)

(assert (=> d!60755 (and (or ((_ is Undefined!1116) lt!125030) (not ((_ is Found!1116) lt!125030)) (and (bvsge (index!6635 lt!125030) #b00000000000000000000000000000000) (bvslt (index!6635 lt!125030) (size!6162 (_keys!6734 thiss!1504))))) (or ((_ is Undefined!1116) lt!125030) ((_ is Found!1116) lt!125030) (not ((_ is MissingVacant!1116) lt!125030)) (not (= (index!6637 lt!125030) (index!6636 lt!124920))) (and (bvsge (index!6637 lt!125030) #b00000000000000000000000000000000) (bvslt (index!6637 lt!125030) (size!6162 (_keys!6734 thiss!1504))))) (or ((_ is Undefined!1116) lt!125030) (ite ((_ is Found!1116) lt!125030) (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6635 lt!125030)) key!932) (and ((_ is MissingVacant!1116) lt!125030) (= (index!6637 lt!125030) (index!6636 lt!124920)) (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6637 lt!125030)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!60755 (= lt!125030 e!161879)))

(declare-fun c!41883 () Bool)

(assert (=> d!60755 (= c!41883 (bvsge (x!24614 lt!124920) #b01111111111111111111111111111110))))

(assert (=> d!60755 (= lt!125029 (select (arr!5819 (_keys!6734 thiss!1504)) (index!6636 lt!124920)))))

(assert (=> d!60755 (validMask!0 (mask!10767 thiss!1504))))

(assert (=> d!60755 (= (seekKeyOrZeroReturnVacant!0 (x!24614 lt!124920) (index!6636 lt!124920) (index!6636 lt!124920) key!932 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)) lt!125030)))

(declare-fun b!249597 () Bool)

(assert (=> b!249597 (= e!161877 (MissingVacant!1116 (index!6636 lt!124920)))))

(declare-fun b!249598 () Bool)

(assert (=> b!249598 (= e!161879 Undefined!1116)))

(assert (= (and d!60755 c!41883) b!249598))

(assert (= (and d!60755 (not c!41883)) b!249594))

(assert (= (and b!249594 c!41885) b!249595))

(assert (= (and b!249594 (not c!41885)) b!249596))

(assert (= (and b!249596 c!41884) b!249597))

(assert (= (and b!249596 (not c!41884)) b!249593))

(declare-fun m!266161 () Bool)

(assert (=> b!249593 m!266161))

(assert (=> b!249593 m!266161))

(declare-fun m!266163 () Bool)

(assert (=> b!249593 m!266163))

(declare-fun m!266165 () Bool)

(assert (=> d!60755 m!266165))

(declare-fun m!266167 () Bool)

(assert (=> d!60755 m!266167))

(assert (=> d!60755 m!265897))

(assert (=> d!60755 m!265665))

(assert (=> b!249379 d!60755))

(declare-fun d!60757 () Bool)

(assert (=> d!60757 (= (inRange!0 (ite c!41808 (index!6634 lt!124881) (index!6637 lt!124881)) (mask!10767 thiss!1504)) (and (bvsge (ite c!41808 (index!6634 lt!124881) (index!6637 lt!124881)) #b00000000000000000000000000000000) (bvslt (ite c!41808 (index!6634 lt!124881) (index!6637 lt!124881)) (bvadd (mask!10767 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23409 d!60757))

(declare-fun d!60759 () Bool)

(assert (=> d!60759 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249315 d!60759))

(declare-fun d!60761 () Bool)

(declare-fun e!161880 () Bool)

(assert (=> d!60761 e!161880))

(declare-fun res!122280 () Bool)

(assert (=> d!60761 (=> (not res!122280) (not e!161880))))

(declare-fun lt!125031 () ListLongMap!3745)

(assert (=> d!60761 (= res!122280 (contains!1805 lt!125031 (_1!2427 (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504)))))))

(declare-fun lt!125032 () List!3713)

(assert (=> d!60761 (= lt!125031 (ListLongMap!3746 lt!125032))))

(declare-fun lt!125033 () Unit!7714)

(declare-fun lt!125034 () Unit!7714)

(assert (=> d!60761 (= lt!125033 lt!125034)))

(assert (=> d!60761 (= (getValueByKey!296 lt!125032 (_1!2427 (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504)))) (Some!301 (_2!2427 (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504)))))))

(assert (=> d!60761 (= lt!125034 (lemmaContainsTupThenGetReturnValue!157 lt!125032 (_1!2427 (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504))) (_2!2427 (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504)))))))

(assert (=> d!60761 (= lt!125032 (insertStrictlySorted!160 (toList!1888 call!23400) (_1!2427 (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504))) (_2!2427 (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504)))))))

(assert (=> d!60761 (= (+!665 call!23400 (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504))) lt!125031)))

(declare-fun b!249599 () Bool)

(declare-fun res!122279 () Bool)

(assert (=> b!249599 (=> (not res!122279) (not e!161880))))

(assert (=> b!249599 (= res!122279 (= (getValueByKey!296 (toList!1888 lt!125031) (_1!2427 (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504)))) (Some!301 (_2!2427 (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504))))))))

(declare-fun b!249600 () Bool)

(assert (=> b!249600 (= e!161880 (contains!1808 (toList!1888 lt!125031) (tuple2!4833 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4447 thiss!1504))))))

(assert (= (and d!60761 res!122280) b!249599))

(assert (= (and b!249599 res!122279) b!249600))

(declare-fun m!266169 () Bool)

(assert (=> d!60761 m!266169))

(declare-fun m!266171 () Bool)

(assert (=> d!60761 m!266171))

(declare-fun m!266173 () Bool)

(assert (=> d!60761 m!266173))

(declare-fun m!266175 () Bool)

(assert (=> d!60761 m!266175))

(declare-fun m!266177 () Bool)

(assert (=> b!249599 m!266177))

(declare-fun m!266179 () Bool)

(assert (=> b!249600 m!266179))

(assert (=> b!249250 d!60761))

(assert (=> d!60617 d!60629))

(declare-fun b!249601 () Bool)

(declare-fun e!161881 () Bool)

(assert (=> b!249601 (= e!161881 (contains!1807 (ite c!41811 (Cons!3710 (select (arr!5819 lt!124762) #b00000000000000000000000000000000) Nil!3711) Nil!3711) (select (arr!5819 lt!124762) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!60763 () Bool)

(declare-fun res!122281 () Bool)

(declare-fun e!161883 () Bool)

(assert (=> d!60763 (=> res!122281 e!161883)))

(assert (=> d!60763 (= res!122281 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6162 lt!124762)))))

(assert (=> d!60763 (= (arrayNoDuplicates!0 lt!124762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41811 (Cons!3710 (select (arr!5819 lt!124762) #b00000000000000000000000000000000) Nil!3711) Nil!3711)) e!161883)))

(declare-fun b!249602 () Bool)

(declare-fun e!161882 () Bool)

(assert (=> b!249602 (= e!161883 e!161882)))

(declare-fun res!122283 () Bool)

(assert (=> b!249602 (=> (not res!122283) (not e!161882))))

(assert (=> b!249602 (= res!122283 (not e!161881))))

(declare-fun res!122282 () Bool)

(assert (=> b!249602 (=> (not res!122282) (not e!161881))))

(assert (=> b!249602 (= res!122282 (validKeyInArray!0 (select (arr!5819 lt!124762) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!249603 () Bool)

(declare-fun e!161884 () Bool)

(assert (=> b!249603 (= e!161882 e!161884)))

(declare-fun c!41886 () Bool)

(assert (=> b!249603 (= c!41886 (validKeyInArray!0 (select (arr!5819 lt!124762) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!249604 () Bool)

(declare-fun call!23440 () Bool)

(assert (=> b!249604 (= e!161884 call!23440)))

(declare-fun b!249605 () Bool)

(assert (=> b!249605 (= e!161884 call!23440)))

(declare-fun bm!23437 () Bool)

(assert (=> bm!23437 (= call!23440 (arrayNoDuplicates!0 lt!124762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!41886 (Cons!3710 (select (arr!5819 lt!124762) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!41811 (Cons!3710 (select (arr!5819 lt!124762) #b00000000000000000000000000000000) Nil!3711) Nil!3711)) (ite c!41811 (Cons!3710 (select (arr!5819 lt!124762) #b00000000000000000000000000000000) Nil!3711) Nil!3711))))))

(assert (= (and d!60763 (not res!122281)) b!249602))

(assert (= (and b!249602 res!122282) b!249601))

(assert (= (and b!249602 res!122283) b!249603))

(assert (= (and b!249603 c!41886) b!249604))

(assert (= (and b!249603 (not c!41886)) b!249605))

(assert (= (or b!249604 b!249605) bm!23437))

(assert (=> b!249601 m!266145))

(assert (=> b!249601 m!266145))

(declare-fun m!266181 () Bool)

(assert (=> b!249601 m!266181))

(assert (=> b!249602 m!266145))

(assert (=> b!249602 m!266145))

(assert (=> b!249602 m!266155))

(assert (=> b!249603 m!266145))

(assert (=> b!249603 m!266145))

(assert (=> b!249603 m!266155))

(assert (=> bm!23437 m!266145))

(declare-fun m!266183 () Bool)

(assert (=> bm!23437 m!266183))

(assert (=> bm!23412 d!60763))

(declare-fun b!249624 () Bool)

(declare-fun e!161899 () SeekEntryResult!1116)

(declare-fun e!161895 () SeekEntryResult!1116)

(assert (=> b!249624 (= e!161899 e!161895)))

(declare-fun c!41894 () Bool)

(declare-fun lt!125039 () (_ BitVec 64))

(assert (=> b!249624 (= c!41894 (or (= lt!125039 key!932) (= (bvadd lt!125039 lt!125039) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!249625 () Bool)

(declare-fun e!161896 () Bool)

(declare-fun e!161897 () Bool)

(assert (=> b!249625 (= e!161896 e!161897)))

(declare-fun res!122291 () Bool)

(declare-fun lt!125040 () SeekEntryResult!1116)

(assert (=> b!249625 (= res!122291 (and ((_ is Intermediate!1116) lt!125040) (not (undefined!1928 lt!125040)) (bvslt (x!24614 lt!125040) #b01111111111111111111111111111110) (bvsge (x!24614 lt!125040) #b00000000000000000000000000000000) (bvsge (x!24614 lt!125040) #b00000000000000000000000000000000)))))

(assert (=> b!249625 (=> (not res!122291) (not e!161897))))

(declare-fun b!249626 () Bool)

(assert (=> b!249626 (= e!161895 (Intermediate!1116 false (toIndex!0 key!932 (mask!10767 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!249627 () Bool)

(assert (=> b!249627 (and (bvsge (index!6636 lt!125040) #b00000000000000000000000000000000) (bvslt (index!6636 lt!125040) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun e!161898 () Bool)

(assert (=> b!249627 (= e!161898 (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6636 lt!125040)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!60765 () Bool)

(assert (=> d!60765 e!161896))

(declare-fun c!41895 () Bool)

(assert (=> d!60765 (= c!41895 (and ((_ is Intermediate!1116) lt!125040) (undefined!1928 lt!125040)))))

(assert (=> d!60765 (= lt!125040 e!161899)))

(declare-fun c!41893 () Bool)

(assert (=> d!60765 (= c!41893 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!60765 (= lt!125039 (select (arr!5819 (_keys!6734 thiss!1504)) (toIndex!0 key!932 (mask!10767 thiss!1504))))))

(assert (=> d!60765 (validMask!0 (mask!10767 thiss!1504))))

(assert (=> d!60765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10767 thiss!1504)) key!932 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)) lt!125040)))

(declare-fun b!249628 () Bool)

(assert (=> b!249628 (= e!161895 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10767 thiss!1504)) #b00000000000000000000000000000000 (mask!10767 thiss!1504)) key!932 (_keys!6734 thiss!1504) (mask!10767 thiss!1504)))))

(declare-fun b!249629 () Bool)

(assert (=> b!249629 (= e!161896 (bvsge (x!24614 lt!125040) #b01111111111111111111111111111110))))

(declare-fun b!249630 () Bool)

(assert (=> b!249630 (and (bvsge (index!6636 lt!125040) #b00000000000000000000000000000000) (bvslt (index!6636 lt!125040) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun res!122290 () Bool)

(assert (=> b!249630 (= res!122290 (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6636 lt!125040)) key!932))))

(assert (=> b!249630 (=> res!122290 e!161898)))

(assert (=> b!249630 (= e!161897 e!161898)))

(declare-fun b!249631 () Bool)

(assert (=> b!249631 (and (bvsge (index!6636 lt!125040) #b00000000000000000000000000000000) (bvslt (index!6636 lt!125040) (size!6162 (_keys!6734 thiss!1504))))))

(declare-fun res!122292 () Bool)

(assert (=> b!249631 (= res!122292 (= (select (arr!5819 (_keys!6734 thiss!1504)) (index!6636 lt!125040)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249631 (=> res!122292 e!161898)))

(declare-fun b!249632 () Bool)

(assert (=> b!249632 (= e!161899 (Intermediate!1116 true (toIndex!0 key!932 (mask!10767 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!60765 c!41893) b!249632))

(assert (= (and d!60765 (not c!41893)) b!249624))

(assert (= (and b!249624 c!41894) b!249626))

(assert (= (and b!249624 (not c!41894)) b!249628))

(assert (= (and d!60765 c!41895) b!249629))

(assert (= (and d!60765 (not c!41895)) b!249625))

(assert (= (and b!249625 res!122291) b!249630))

(assert (= (and b!249630 (not res!122290)) b!249631))

(assert (= (and b!249631 (not res!122292)) b!249627))

(assert (=> b!249628 m!265887))

(declare-fun m!266185 () Bool)

(assert (=> b!249628 m!266185))

(assert (=> b!249628 m!266185))

(declare-fun m!266187 () Bool)

(assert (=> b!249628 m!266187))

(declare-fun m!266189 () Bool)

(assert (=> b!249627 m!266189))

(assert (=> b!249631 m!266189))

(assert (=> b!249630 m!266189))

(assert (=> d!60765 m!265887))

(declare-fun m!266191 () Bool)

(assert (=> d!60765 m!266191))

(assert (=> d!60765 m!265665))

(assert (=> d!60645 d!60765))

(declare-fun d!60767 () Bool)

(declare-fun lt!125046 () (_ BitVec 32))

(declare-fun lt!125045 () (_ BitVec 32))

(assert (=> d!60767 (= lt!125046 (bvmul (bvxor lt!125045 (bvlshr lt!125045 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!60767 (= lt!125045 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!60767 (and (bvsge (mask!10767 thiss!1504) #b00000000000000000000000000000000) (let ((res!122293 (let ((h!4371 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24633 (bvmul (bvxor h!4371 (bvlshr h!4371 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24633 (bvlshr x!24633 #b00000000000000000000000000001101)) (mask!10767 thiss!1504)))))) (and (bvslt res!122293 (bvadd (mask!10767 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!122293 #b00000000000000000000000000000000))))))

(assert (=> d!60767 (= (toIndex!0 key!932 (mask!10767 thiss!1504)) (bvand (bvxor lt!125046 (bvlshr lt!125046 #b00000000000000000000000000001101)) (mask!10767 thiss!1504)))))

(assert (=> d!60645 d!60767))

(assert (=> d!60645 d!60629))

(declare-fun b!249634 () Bool)

(declare-fun e!161900 () Bool)

(assert (=> b!249634 (= e!161900 tp_is_empty!6477)))

(declare-fun b!249633 () Bool)

(declare-fun e!161901 () Bool)

(assert (=> b!249633 (= e!161901 tp_is_empty!6477)))

(declare-fun mapIsEmpty!11007 () Bool)

(declare-fun mapRes!11007 () Bool)

(assert (=> mapIsEmpty!11007 mapRes!11007))

(declare-fun condMapEmpty!11007 () Bool)

(declare-fun mapDefault!11007 () ValueCell!2895)

(assert (=> mapNonEmpty!11006 (= condMapEmpty!11007 (= mapRest!11006 ((as const (Array (_ BitVec 32) ValueCell!2895)) mapDefault!11007)))))

(assert (=> mapNonEmpty!11006 (= tp!23111 (and e!161900 mapRes!11007))))

(declare-fun mapNonEmpty!11007 () Bool)

(declare-fun tp!23112 () Bool)

(assert (=> mapNonEmpty!11007 (= mapRes!11007 (and tp!23112 e!161901))))

(declare-fun mapRest!11007 () (Array (_ BitVec 32) ValueCell!2895))

(declare-fun mapValue!11007 () ValueCell!2895)

(declare-fun mapKey!11007 () (_ BitVec 32))

(assert (=> mapNonEmpty!11007 (= mapRest!11006 (store mapRest!11007 mapKey!11007 mapValue!11007))))

(assert (= (and mapNonEmpty!11006 condMapEmpty!11007) mapIsEmpty!11007))

(assert (= (and mapNonEmpty!11006 (not condMapEmpty!11007)) mapNonEmpty!11007))

(assert (= (and mapNonEmpty!11007 ((_ is ValueCellFull!2895) mapValue!11007)) b!249633))

(assert (= (and mapNonEmpty!11006 ((_ is ValueCellFull!2895) mapDefault!11007)) b!249634))

(declare-fun m!266193 () Bool)

(assert (=> mapNonEmpty!11007 m!266193))

(declare-fun b_lambda!8071 () Bool)

(assert (= b_lambda!8067 (or (and b!249111 b_free!6615) b_lambda!8071)))

(declare-fun b_lambda!8073 () Bool)

(assert (= b_lambda!8069 (or (and b!249111 b_free!6615) b_lambda!8073)))

(check-sat (not b!249566) (not b!249411) (not d!60761) (not b_lambda!8065) (not bm!23422) (not b!249406) (not b!249518) (not b!249395) (not d!60717) (not b!249553) (not d!60667) (not b!249524) (not d!60693) (not b!249409) (not d!60675) (not b!249536) (not d!60721) (not bm!23427) (not d!60741) (not d!60699) (not b!249554) (not d!60713) (not d!60661) (not b!249455) (not b!249403) (not b!249549) (not bm!23431) (not d!60719) (not b!249394) (not b!249572) (not b!249525) (not b!249444) (not bm!23421) (not bm!23434) (not d!60659) (not d!60711) (not b!249602) (not b!249494) (not b!249393) (not d!60679) (not bm!23420) (not d!60745) (not b!249489) (not b!249568) (not b!249544) (not d!60739) (not b!249547) (not b!249538) tp_is_empty!6477 (not bm!23432) (not b!249546) (not b!249488) (not b!249491) (not b!249565) (not d!60731) (not d!60689) (not b!249517) (not b!249404) (not b!249497) (not d!60669) (not d!60765) (not bm!23436) (not d!60685) (not b!249447) (not d!60735) (not b!249575) (not b_lambda!8073) b_and!13631 (not b!249490) (not d!60755) (not bm!23435) (not b!249501) (not b!249562) (not d!60715) (not b!249548) (not b!249413) (not b!249550) (not b!249499) (not b!249603) (not b!249601) (not b!249486) (not b!249448) (not b!249600) (not b!249507) (not b!249599) (not b!249570) (not b_lambda!8071) (not b!249461) (not bm!23428) (not bm!23433) (not b!249579) (not b!249558) (not d!60703) (not d!60701) (not d!60725) (not d!60737) (not b!249493) (not d!60733) (not b!249412) (not b!249506) (not b!249593) (not b!249628) (not b!249560) (not bm!23437) (not b_next!6615) (not b!249563) (not d!60681) (not b!249539) (not d!60655) (not d!60707) (not d!60653) (not d!60727) (not d!60723) (not d!60747) (not d!60729) (not d!60695) (not mapNonEmpty!11007))
(check-sat b_and!13631 (not b_next!6615))
