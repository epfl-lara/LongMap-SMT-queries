; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21828 () Bool)

(assert start!21828)

(declare-fun b!219549 () Bool)

(declare-fun b_free!5895 () Bool)

(declare-fun b_next!5895 () Bool)

(assert (=> b!219549 (= b_free!5895 (not b_next!5895))))

(declare-fun tp!20826 () Bool)

(declare-fun b_and!12793 () Bool)

(assert (=> b!219549 (= tp!20826 b_and!12793)))

(declare-fun b!219532 () Bool)

(declare-fun e!142797 () Bool)

(declare-fun e!142792 () Bool)

(declare-fun mapRes!9805 () Bool)

(assert (=> b!219532 (= e!142797 (and e!142792 mapRes!9805))))

(declare-fun condMapEmpty!9805 () Bool)

(declare-datatypes ((V!7323 0))(
  ( (V!7324 (val!2923 Int)) )
))
(declare-datatypes ((ValueCell!2535 0))(
  ( (ValueCellFull!2535 (v!4943 V!7323)) (EmptyCell!2535) )
))
(declare-datatypes ((array!10757 0))(
  ( (array!10758 (arr!5098 (Array (_ BitVec 32) ValueCell!2535)) (size!5431 (_ BitVec 32))) )
))
(declare-datatypes ((array!10759 0))(
  ( (array!10760 (arr!5099 (Array (_ BitVec 32) (_ BitVec 64))) (size!5432 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2970 0))(
  ( (LongMapFixedSize!2971 (defaultEntry!4144 Int) (mask!9936 (_ BitVec 32)) (extraKeys!3881 (_ BitVec 32)) (zeroValue!3985 V!7323) (minValue!3985 V!7323) (_size!1534 (_ BitVec 32)) (_keys!6198 array!10759) (_values!4127 array!10757) (_vacant!1534 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2970)

(declare-fun mapDefault!9805 () ValueCell!2535)

(assert (=> b!219532 (= condMapEmpty!9805 (= (arr!5098 (_values!4127 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2535)) mapDefault!9805)))))

(declare-fun mapNonEmpty!9805 () Bool)

(declare-fun tp!20827 () Bool)

(declare-fun e!142794 () Bool)

(assert (=> mapNonEmpty!9805 (= mapRes!9805 (and tp!20827 e!142794))))

(declare-fun mapRest!9805 () (Array (_ BitVec 32) ValueCell!2535))

(declare-fun mapValue!9805 () ValueCell!2535)

(declare-fun mapKey!9805 () (_ BitVec 32))

(assert (=> mapNonEmpty!9805 (= (arr!5098 (_values!4127 thiss!1504)) (store mapRest!9805 mapKey!9805 mapValue!9805))))

(declare-fun b!219533 () Bool)

(declare-fun tp_is_empty!5757 () Bool)

(assert (=> b!219533 (= e!142794 tp_is_empty!5757)))

(declare-fun b!219534 () Bool)

(declare-fun e!142801 () Bool)

(declare-fun e!142800 () Bool)

(assert (=> b!219534 (= e!142801 e!142800)))

(declare-fun res!107601 () Bool)

(assert (=> b!219534 (=> (not res!107601) (not e!142800))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219534 (= res!107601 (inRange!0 index!297 (mask!9936 thiss!1504)))))

(declare-datatypes ((Unit!6544 0))(
  ( (Unit!6545) )
))
(declare-fun lt!111974 () Unit!6544)

(declare-fun e!142802 () Unit!6544)

(assert (=> b!219534 (= lt!111974 e!142802)))

(declare-fun c!36559 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4340 0))(
  ( (tuple2!4341 (_1!2181 (_ BitVec 64)) (_2!2181 V!7323)) )
))
(declare-datatypes ((List!3242 0))(
  ( (Nil!3239) (Cons!3238 (h!3886 tuple2!4340) (t!8201 List!3242)) )
))
(declare-datatypes ((ListLongMap!3253 0))(
  ( (ListLongMap!3254 (toList!1642 List!3242)) )
))
(declare-fun contains!1485 (ListLongMap!3253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1170 (array!10759 array!10757 (_ BitVec 32) (_ BitVec 32) V!7323 V!7323 (_ BitVec 32) Int) ListLongMap!3253)

(assert (=> b!219534 (= c!36559 (contains!1485 (getCurrentListMap!1170 (_keys!6198 thiss!1504) (_values!4127 thiss!1504) (mask!9936 thiss!1504) (extraKeys!3881 thiss!1504) (zeroValue!3985 thiss!1504) (minValue!3985 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4144 thiss!1504)) key!932))))

(declare-fun b!219535 () Bool)

(declare-fun Unit!6546 () Unit!6544)

(assert (=> b!219535 (= e!142802 Unit!6546)))

(declare-fun lt!111976 () Unit!6544)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!195 (array!10759 array!10757 (_ BitVec 32) (_ BitVec 32) V!7323 V!7323 (_ BitVec 64) Int) Unit!6544)

(assert (=> b!219535 (= lt!111976 (lemmaInListMapThenSeekEntryOrOpenFindsIt!195 (_keys!6198 thiss!1504) (_values!4127 thiss!1504) (mask!9936 thiss!1504) (extraKeys!3881 thiss!1504) (zeroValue!3985 thiss!1504) (minValue!3985 thiss!1504) key!932 (defaultEntry!4144 thiss!1504)))))

(assert (=> b!219535 false))

(declare-fun b!219536 () Bool)

(declare-fun res!107600 () Bool)

(assert (=> b!219536 (=> (not res!107600) (not e!142800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219536 (= res!107600 (validMask!0 (mask!9936 thiss!1504)))))

(declare-fun c!36561 () Bool)

(declare-fun call!20520 () Bool)

(declare-datatypes ((SeekEntryResult!798 0))(
  ( (MissingZero!798 (index!5362 (_ BitVec 32))) (Found!798 (index!5363 (_ BitVec 32))) (Intermediate!798 (undefined!1610 Bool) (index!5364 (_ BitVec 32)) (x!22906 (_ BitVec 32))) (Undefined!798) (MissingVacant!798 (index!5365 (_ BitVec 32))) )
))
(declare-fun lt!111973 () SeekEntryResult!798)

(declare-fun bm!20516 () Bool)

(assert (=> bm!20516 (= call!20520 (inRange!0 (ite c!36561 (index!5362 lt!111973) (index!5365 lt!111973)) (mask!9936 thiss!1504)))))

(declare-fun b!219537 () Bool)

(declare-fun lt!111977 () Unit!6544)

(assert (=> b!219537 (= e!142802 lt!111977)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!206 (array!10759 array!10757 (_ BitVec 32) (_ BitVec 32) V!7323 V!7323 (_ BitVec 64) Int) Unit!6544)

(assert (=> b!219537 (= lt!111977 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!206 (_keys!6198 thiss!1504) (_values!4127 thiss!1504) (mask!9936 thiss!1504) (extraKeys!3881 thiss!1504) (zeroValue!3985 thiss!1504) (minValue!3985 thiss!1504) key!932 (defaultEntry!4144 thiss!1504)))))

(get-info :version)

(assert (=> b!219537 (= c!36561 ((_ is MissingZero!798) lt!111973))))

(declare-fun e!142791 () Bool)

(assert (=> b!219537 e!142791))

(declare-fun b!219538 () Bool)

(declare-fun e!142796 () Bool)

(declare-fun call!20519 () Bool)

(assert (=> b!219538 (= e!142796 (not call!20519))))

(declare-fun b!219539 () Bool)

(declare-fun res!107602 () Bool)

(assert (=> b!219539 (= res!107602 (= (select (arr!5099 (_keys!6198 thiss!1504)) (index!5365 lt!111973)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142795 () Bool)

(assert (=> b!219539 (=> (not res!107602) (not e!142795))))

(declare-fun b!219540 () Bool)

(declare-fun e!142798 () Bool)

(assert (=> b!219540 (= e!142798 ((_ is Undefined!798) lt!111973))))

(declare-fun b!219541 () Bool)

(declare-fun e!142790 () Bool)

(assert (=> b!219541 (= e!142790 e!142801)))

(declare-fun res!107595 () Bool)

(assert (=> b!219541 (=> (not res!107595) (not e!142801))))

(assert (=> b!219541 (= res!107595 (or (= lt!111973 (MissingZero!798 index!297)) (= lt!111973 (MissingVacant!798 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10759 (_ BitVec 32)) SeekEntryResult!798)

(assert (=> b!219541 (= lt!111973 (seekEntryOrOpen!0 key!932 (_keys!6198 thiss!1504) (mask!9936 thiss!1504)))))

(declare-fun b!219543 () Bool)

(assert (=> b!219543 (= e!142792 tp_is_empty!5757)))

(declare-fun b!219544 () Bool)

(declare-fun res!107596 () Bool)

(assert (=> b!219544 (=> (not res!107596) (not e!142800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10759 (_ BitVec 32)) Bool)

(assert (=> b!219544 (= res!107596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6198 thiss!1504) (mask!9936 thiss!1504)))))

(declare-fun bm!20517 () Bool)

(declare-fun arrayContainsKey!0 (array!10759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20517 (= call!20519 (arrayContainsKey!0 (_keys!6198 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219545 () Bool)

(declare-fun res!107598 () Bool)

(assert (=> b!219545 (=> (not res!107598) (not e!142796))))

(assert (=> b!219545 (= res!107598 call!20520)))

(assert (=> b!219545 (= e!142791 e!142796)))

(declare-fun b!219546 () Bool)

(declare-fun res!107594 () Bool)

(assert (=> b!219546 (=> (not res!107594) (not e!142790))))

(assert (=> b!219546 (= res!107594 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219547 () Bool)

(declare-fun c!36560 () Bool)

(assert (=> b!219547 (= c!36560 ((_ is MissingVacant!798) lt!111973))))

(assert (=> b!219547 (= e!142791 e!142798)))

(declare-fun b!219548 () Bool)

(declare-fun res!107597 () Bool)

(assert (=> b!219548 (=> (not res!107597) (not e!142800))))

(assert (=> b!219548 (= res!107597 (arrayContainsKey!0 (_keys!6198 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!9805 () Bool)

(assert (=> mapIsEmpty!9805 mapRes!9805))

(declare-fun e!142793 () Bool)

(declare-fun array_inv!3377 (array!10759) Bool)

(declare-fun array_inv!3378 (array!10757) Bool)

(assert (=> b!219549 (= e!142793 (and tp!20826 tp_is_empty!5757 (array_inv!3377 (_keys!6198 thiss!1504)) (array_inv!3378 (_values!4127 thiss!1504)) e!142797))))

(declare-fun b!219550 () Bool)

(assert (=> b!219550 (= e!142795 (not call!20519))))

(declare-fun b!219551 () Bool)

(declare-fun res!107605 () Bool)

(assert (=> b!219551 (=> (not res!107605) (not e!142796))))

(assert (=> b!219551 (= res!107605 (= (select (arr!5099 (_keys!6198 thiss!1504)) (index!5362 lt!111973)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219552 () Bool)

(assert (=> b!219552 (= e!142798 e!142795)))

(declare-fun res!107603 () Bool)

(assert (=> b!219552 (= res!107603 call!20520)))

(assert (=> b!219552 (=> (not res!107603) (not e!142795))))

(declare-fun b!219553 () Bool)

(assert (=> b!219553 (= e!142800 false)))

(declare-fun lt!111975 () Bool)

(declare-datatypes ((List!3243 0))(
  ( (Nil!3240) (Cons!3239 (h!3887 (_ BitVec 64)) (t!8202 List!3243)) )
))
(declare-fun arrayNoDuplicates!0 (array!10759 (_ BitVec 32) List!3243) Bool)

(assert (=> b!219553 (= lt!111975 (arrayNoDuplicates!0 (_keys!6198 thiss!1504) #b00000000000000000000000000000000 Nil!3240))))

(declare-fun b!219542 () Bool)

(declare-fun res!107604 () Bool)

(assert (=> b!219542 (=> (not res!107604) (not e!142800))))

(assert (=> b!219542 (= res!107604 (and (= (size!5431 (_values!4127 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9936 thiss!1504))) (= (size!5432 (_keys!6198 thiss!1504)) (size!5431 (_values!4127 thiss!1504))) (bvsge (mask!9936 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3881 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3881 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!107599 () Bool)

(assert (=> start!21828 (=> (not res!107599) (not e!142790))))

(declare-fun valid!1202 (LongMapFixedSize!2970) Bool)

(assert (=> start!21828 (= res!107599 (valid!1202 thiss!1504))))

(assert (=> start!21828 e!142790))

(assert (=> start!21828 e!142793))

(assert (=> start!21828 true))

(assert (= (and start!21828 res!107599) b!219546))

(assert (= (and b!219546 res!107594) b!219541))

(assert (= (and b!219541 res!107595) b!219534))

(assert (= (and b!219534 c!36559) b!219535))

(assert (= (and b!219534 (not c!36559)) b!219537))

(assert (= (and b!219537 c!36561) b!219545))

(assert (= (and b!219537 (not c!36561)) b!219547))

(assert (= (and b!219545 res!107598) b!219551))

(assert (= (and b!219551 res!107605) b!219538))

(assert (= (and b!219547 c!36560) b!219552))

(assert (= (and b!219547 (not c!36560)) b!219540))

(assert (= (and b!219552 res!107603) b!219539))

(assert (= (and b!219539 res!107602) b!219550))

(assert (= (or b!219545 b!219552) bm!20516))

(assert (= (or b!219538 b!219550) bm!20517))

(assert (= (and b!219534 res!107601) b!219548))

(assert (= (and b!219548 res!107597) b!219536))

(assert (= (and b!219536 res!107600) b!219542))

(assert (= (and b!219542 res!107604) b!219544))

(assert (= (and b!219544 res!107596) b!219553))

(assert (= (and b!219532 condMapEmpty!9805) mapIsEmpty!9805))

(assert (= (and b!219532 (not condMapEmpty!9805)) mapNonEmpty!9805))

(assert (= (and mapNonEmpty!9805 ((_ is ValueCellFull!2535) mapValue!9805)) b!219533))

(assert (= (and b!219532 ((_ is ValueCellFull!2535) mapDefault!9805)) b!219543))

(assert (= b!219549 b!219532))

(assert (= start!21828 b!219549))

(declare-fun m!245097 () Bool)

(assert (=> b!219534 m!245097))

(declare-fun m!245099 () Bool)

(assert (=> b!219534 m!245099))

(assert (=> b!219534 m!245099))

(declare-fun m!245101 () Bool)

(assert (=> b!219534 m!245101))

(declare-fun m!245103 () Bool)

(assert (=> b!219553 m!245103))

(declare-fun m!245105 () Bool)

(assert (=> b!219539 m!245105))

(declare-fun m!245107 () Bool)

(assert (=> b!219551 m!245107))

(declare-fun m!245109 () Bool)

(assert (=> b!219548 m!245109))

(declare-fun m!245111 () Bool)

(assert (=> b!219549 m!245111))

(declare-fun m!245113 () Bool)

(assert (=> b!219549 m!245113))

(declare-fun m!245115 () Bool)

(assert (=> b!219544 m!245115))

(declare-fun m!245117 () Bool)

(assert (=> b!219537 m!245117))

(assert (=> bm!20517 m!245109))

(declare-fun m!245119 () Bool)

(assert (=> mapNonEmpty!9805 m!245119))

(declare-fun m!245121 () Bool)

(assert (=> bm!20516 m!245121))

(declare-fun m!245123 () Bool)

(assert (=> b!219536 m!245123))

(declare-fun m!245125 () Bool)

(assert (=> b!219541 m!245125))

(declare-fun m!245127 () Bool)

(assert (=> start!21828 m!245127))

(declare-fun m!245129 () Bool)

(assert (=> b!219535 m!245129))

(check-sat (not bm!20517) (not b!219544) b_and!12793 (not b!219541) (not bm!20516) (not mapNonEmpty!9805) (not b!219537) (not b!219534) (not start!21828) (not b!219535) (not b!219536) (not b!219553) (not b!219548) tp_is_empty!5757 (not b!219549) (not b_next!5895))
(check-sat b_and!12793 (not b_next!5895))
