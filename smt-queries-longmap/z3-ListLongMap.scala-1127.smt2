; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23148 () Bool)

(assert start!23148)

(declare-fun b!242766 () Bool)

(declare-fun b_free!6513 () Bool)

(declare-fun b_next!6513 () Bool)

(assert (=> b!242766 (= b_free!6513 (not b_next!6513))))

(declare-fun tp!22755 () Bool)

(declare-fun b_and!13491 () Bool)

(assert (=> b!242766 (= tp!22755 b_and!13491)))

(declare-fun bm!22622 () Bool)

(declare-fun call!22626 () Bool)

(declare-datatypes ((V!8147 0))(
  ( (V!8148 (val!3232 Int)) )
))
(declare-datatypes ((ValueCell!2844 0))(
  ( (ValueCellFull!2844 (v!5275 V!8147)) (EmptyCell!2844) )
))
(declare-datatypes ((array!12037 0))(
  ( (array!12038 (arr!5716 (Array (_ BitVec 32) ValueCell!2844)) (size!6058 (_ BitVec 32))) )
))
(declare-datatypes ((array!12039 0))(
  ( (array!12040 (arr!5717 (Array (_ BitVec 32) (_ BitVec 64))) (size!6059 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3588 0))(
  ( (LongMapFixedSize!3589 (defaultEntry!4499 Int) (mask!10584 (_ BitVec 32)) (extraKeys!4236 (_ BitVec 32)) (zeroValue!4340 V!8147) (minValue!4340 V!8147) (_size!1843 (_ BitVec 32)) (_keys!6608 array!12039) (_values!4482 array!12037) (_vacant!1843 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3588)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22622 (= call!22626 (arrayContainsKey!0 (_keys!6608 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242758 () Bool)

(declare-fun res!118962 () Bool)

(declare-fun e!157558 () Bool)

(assert (=> b!242758 (=> (not res!118962) (not e!157558))))

(declare-datatypes ((List!3638 0))(
  ( (Nil!3635) (Cons!3634 (h!4291 (_ BitVec 64)) (t!8641 List!3638)) )
))
(declare-fun contains!1746 (List!3638 (_ BitVec 64)) Bool)

(assert (=> b!242758 (= res!118962 (not (contains!1746 Nil!3635 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!242759 () Bool)

(declare-fun e!157566 () Bool)

(declare-fun tp_is_empty!6375 () Bool)

(assert (=> b!242759 (= e!157566 tp_is_empty!6375)))

(declare-fun b!242760 () Bool)

(declare-fun res!118961 () Bool)

(assert (=> b!242760 (=> (not res!118961) (not e!157558))))

(declare-fun noDuplicate!92 (List!3638) Bool)

(assert (=> b!242760 (= res!118961 (noDuplicate!92 Nil!3635))))

(declare-fun b!242761 () Bool)

(declare-fun e!157563 () Bool)

(assert (=> b!242761 (= e!157563 e!157558)))

(declare-fun res!118963 () Bool)

(assert (=> b!242761 (=> (not res!118963) (not e!157558))))

(assert (=> b!242761 (= res!118963 (and (bvslt (size!6059 (_keys!6608 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6059 (_keys!6608 thiss!1504)))))))

(declare-datatypes ((Unit!7487 0))(
  ( (Unit!7488) )
))
(declare-fun lt!121909 () Unit!7487)

(declare-fun e!157560 () Unit!7487)

(assert (=> b!242761 (= lt!121909 e!157560)))

(declare-fun c!40515 () Bool)

(assert (=> b!242761 (= c!40515 (arrayContainsKey!0 (_keys!6608 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242762 () Bool)

(declare-fun c!40516 () Bool)

(declare-datatypes ((SeekEntryResult!1067 0))(
  ( (MissingZero!1067 (index!6438 (_ BitVec 32))) (Found!1067 (index!6439 (_ BitVec 32))) (Intermediate!1067 (undefined!1879 Bool) (index!6440 (_ BitVec 32)) (x!24291 (_ BitVec 32))) (Undefined!1067) (MissingVacant!1067 (index!6441 (_ BitVec 32))) )
))
(declare-fun lt!121913 () SeekEntryResult!1067)

(get-info :version)

(assert (=> b!242762 (= c!40516 ((_ is MissingVacant!1067) lt!121913))))

(declare-fun e!157555 () Bool)

(declare-fun e!157559 () Bool)

(assert (=> b!242762 (= e!157555 e!157559)))

(declare-fun bm!22623 () Bool)

(declare-fun call!22625 () Bool)

(declare-fun c!40517 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22623 (= call!22625 (inRange!0 (ite c!40517 (index!6438 lt!121913) (index!6441 lt!121913)) (mask!10584 thiss!1504)))))

(declare-fun b!242763 () Bool)

(declare-fun e!157552 () Unit!7487)

(declare-fun Unit!7489 () Unit!7487)

(assert (=> b!242763 (= e!157552 Unit!7489)))

(declare-fun lt!121914 () Unit!7487)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!356 (array!12039 array!12037 (_ BitVec 32) (_ BitVec 32) V!8147 V!8147 (_ BitVec 64) Int) Unit!7487)

(assert (=> b!242763 (= lt!121914 (lemmaInListMapThenSeekEntryOrOpenFindsIt!356 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) key!932 (defaultEntry!4499 thiss!1504)))))

(assert (=> b!242763 false))

(declare-fun b!242764 () Bool)

(declare-fun e!157564 () Bool)

(declare-fun e!157561 () Bool)

(declare-fun mapRes!10807 () Bool)

(assert (=> b!242764 (= e!157564 (and e!157561 mapRes!10807))))

(declare-fun condMapEmpty!10807 () Bool)

(declare-fun mapDefault!10807 () ValueCell!2844)

(assert (=> b!242764 (= condMapEmpty!10807 (= (arr!5716 (_values!4482 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2844)) mapDefault!10807)))))

(declare-fun b!242765 () Bool)

(declare-fun Unit!7490 () Unit!7487)

(assert (=> b!242765 (= e!157560 Unit!7490)))

(declare-fun e!157562 () Bool)

(declare-fun array_inv!3783 (array!12039) Bool)

(declare-fun array_inv!3784 (array!12037) Bool)

(assert (=> b!242766 (= e!157562 (and tp!22755 tp_is_empty!6375 (array_inv!3783 (_keys!6608 thiss!1504)) (array_inv!3784 (_values!4482 thiss!1504)) e!157564))))

(declare-fun mapNonEmpty!10807 () Bool)

(declare-fun tp!22756 () Bool)

(assert (=> mapNonEmpty!10807 (= mapRes!10807 (and tp!22756 e!157566))))

(declare-fun mapKey!10807 () (_ BitVec 32))

(declare-fun mapRest!10807 () (Array (_ BitVec 32) ValueCell!2844))

(declare-fun mapValue!10807 () ValueCell!2844)

(assert (=> mapNonEmpty!10807 (= (arr!5716 (_values!4482 thiss!1504)) (store mapRest!10807 mapKey!10807 mapValue!10807))))

(declare-fun b!242767 () Bool)

(declare-fun res!118957 () Bool)

(assert (=> b!242767 (=> (not res!118957) (not e!157558))))

(assert (=> b!242767 (= res!118957 (not (contains!1746 Nil!3635 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!242768 () Bool)

(assert (=> b!242768 (= e!157559 ((_ is Undefined!1067) lt!121913))))

(declare-fun res!118965 () Bool)

(declare-fun e!157565 () Bool)

(assert (=> start!23148 (=> (not res!118965) (not e!157565))))

(declare-fun valid!1407 (LongMapFixedSize!3588) Bool)

(assert (=> start!23148 (= res!118965 (valid!1407 thiss!1504))))

(assert (=> start!23148 e!157565))

(assert (=> start!23148 e!157562))

(assert (=> start!23148 true))

(declare-fun b!242769 () Bool)

(declare-fun e!157550 () Bool)

(assert (=> b!242769 (= e!157559 e!157550)))

(declare-fun res!118959 () Bool)

(assert (=> b!242769 (= res!118959 call!22625)))

(assert (=> b!242769 (=> (not res!118959) (not e!157550))))

(declare-fun b!242770 () Bool)

(declare-fun e!157553 () Bool)

(assert (=> b!242770 (= e!157553 (contains!1746 Nil!3635 key!932))))

(declare-fun mapIsEmpty!10807 () Bool)

(assert (=> mapIsEmpty!10807 mapRes!10807))

(declare-fun b!242771 () Bool)

(assert (=> b!242771 (= e!157558 e!157553)))

(declare-fun res!118964 () Bool)

(assert (=> b!242771 (=> res!118964 e!157553)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!242771 (= res!118964 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!242772 () Bool)

(declare-fun res!118954 () Bool)

(assert (=> b!242772 (= res!118954 (= (select (arr!5717 (_keys!6608 thiss!1504)) (index!6441 lt!121913)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242772 (=> (not res!118954) (not e!157550))))

(declare-fun b!242773 () Bool)

(declare-fun res!118953 () Bool)

(assert (=> b!242773 (=> (not res!118953) (not e!157565))))

(assert (=> b!242773 (= res!118953 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!242774 () Bool)

(declare-fun lt!121912 () Unit!7487)

(assert (=> b!242774 (= e!157552 lt!121912)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!366 (array!12039 array!12037 (_ BitVec 32) (_ BitVec 32) V!8147 V!8147 (_ BitVec 64) Int) Unit!7487)

(assert (=> b!242774 (= lt!121912 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!366 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) key!932 (defaultEntry!4499 thiss!1504)))))

(assert (=> b!242774 (= c!40517 ((_ is MissingZero!1067) lt!121913))))

(assert (=> b!242774 e!157555))

(declare-fun b!242775 () Bool)

(assert (=> b!242775 (= e!157561 tp_is_empty!6375)))

(declare-fun b!242776 () Bool)

(declare-fun res!118966 () Bool)

(declare-fun e!157557 () Bool)

(assert (=> b!242776 (=> (not res!118966) (not e!157557))))

(assert (=> b!242776 (= res!118966 (= (select (arr!5717 (_keys!6608 thiss!1504)) (index!6438 lt!121913)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242777 () Bool)

(declare-fun res!118960 () Bool)

(assert (=> b!242777 (=> (not res!118960) (not e!157557))))

(assert (=> b!242777 (= res!118960 call!22625)))

(assert (=> b!242777 (= e!157555 e!157557)))

(declare-fun b!242778 () Bool)

(declare-fun e!157551 () Bool)

(assert (=> b!242778 (= e!157551 e!157563)))

(declare-fun res!118955 () Bool)

(assert (=> b!242778 (=> (not res!118955) (not e!157563))))

(assert (=> b!242778 (= res!118955 (inRange!0 index!297 (mask!10584 thiss!1504)))))

(declare-fun lt!121911 () Unit!7487)

(assert (=> b!242778 (= lt!121911 e!157552)))

(declare-fun c!40518 () Bool)

(declare-datatypes ((tuple2!4760 0))(
  ( (tuple2!4761 (_1!2391 (_ BitVec 64)) (_2!2391 V!8147)) )
))
(declare-datatypes ((List!3639 0))(
  ( (Nil!3636) (Cons!3635 (h!4292 tuple2!4760) (t!8642 List!3639)) )
))
(declare-datatypes ((ListLongMap!3673 0))(
  ( (ListLongMap!3674 (toList!1852 List!3639)) )
))
(declare-fun contains!1747 (ListLongMap!3673 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1380 (array!12039 array!12037 (_ BitVec 32) (_ BitVec 32) V!8147 V!8147 (_ BitVec 32) Int) ListLongMap!3673)

(assert (=> b!242778 (= c!40518 (contains!1747 (getCurrentListMap!1380 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504)) key!932))))

(declare-fun b!242779 () Bool)

(declare-fun Unit!7491 () Unit!7487)

(assert (=> b!242779 (= e!157560 Unit!7491)))

(declare-fun lt!121910 () Unit!7487)

(declare-fun lemmaArrayContainsKeyThenInListMap!161 (array!12039 array!12037 (_ BitVec 32) (_ BitVec 32) V!8147 V!8147 (_ BitVec 64) (_ BitVec 32) Int) Unit!7487)

(assert (=> b!242779 (= lt!121910 (lemmaArrayContainsKeyThenInListMap!161 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504)))))

(assert (=> b!242779 false))

(declare-fun b!242780 () Bool)

(declare-fun res!118967 () Bool)

(assert (=> b!242780 (=> (not res!118967) (not e!157558))))

(declare-fun e!157556 () Bool)

(assert (=> b!242780 (= res!118967 e!157556)))

(declare-fun res!118956 () Bool)

(assert (=> b!242780 (=> res!118956 e!157556)))

(assert (=> b!242780 (= res!118956 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!242781 () Bool)

(assert (=> b!242781 (= e!157550 (not call!22626))))

(declare-fun b!242782 () Bool)

(assert (=> b!242782 (= e!157565 e!157551)))

(declare-fun res!118958 () Bool)

(assert (=> b!242782 (=> (not res!118958) (not e!157551))))

(assert (=> b!242782 (= res!118958 (or (= lt!121913 (MissingZero!1067 index!297)) (= lt!121913 (MissingVacant!1067 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12039 (_ BitVec 32)) SeekEntryResult!1067)

(assert (=> b!242782 (= lt!121913 (seekEntryOrOpen!0 key!932 (_keys!6608 thiss!1504) (mask!10584 thiss!1504)))))

(declare-fun b!242783 () Bool)

(assert (=> b!242783 (= e!157557 (not call!22626))))

(declare-fun b!242784 () Bool)

(assert (=> b!242784 (= e!157556 (not (contains!1746 Nil!3635 key!932)))))

(assert (= (and start!23148 res!118965) b!242773))

(assert (= (and b!242773 res!118953) b!242782))

(assert (= (and b!242782 res!118958) b!242778))

(assert (= (and b!242778 c!40518) b!242763))

(assert (= (and b!242778 (not c!40518)) b!242774))

(assert (= (and b!242774 c!40517) b!242777))

(assert (= (and b!242774 (not c!40517)) b!242762))

(assert (= (and b!242777 res!118960) b!242776))

(assert (= (and b!242776 res!118966) b!242783))

(assert (= (and b!242762 c!40516) b!242769))

(assert (= (and b!242762 (not c!40516)) b!242768))

(assert (= (and b!242769 res!118959) b!242772))

(assert (= (and b!242772 res!118954) b!242781))

(assert (= (or b!242777 b!242769) bm!22623))

(assert (= (or b!242783 b!242781) bm!22622))

(assert (= (and b!242778 res!118955) b!242761))

(assert (= (and b!242761 c!40515) b!242779))

(assert (= (and b!242761 (not c!40515)) b!242765))

(assert (= (and b!242761 res!118963) b!242760))

(assert (= (and b!242760 res!118961) b!242767))

(assert (= (and b!242767 res!118957) b!242758))

(assert (= (and b!242758 res!118962) b!242780))

(assert (= (and b!242780 (not res!118956)) b!242784))

(assert (= (and b!242780 res!118967) b!242771))

(assert (= (and b!242771 (not res!118964)) b!242770))

(assert (= (and b!242764 condMapEmpty!10807) mapIsEmpty!10807))

(assert (= (and b!242764 (not condMapEmpty!10807)) mapNonEmpty!10807))

(assert (= (and mapNonEmpty!10807 ((_ is ValueCellFull!2844) mapValue!10807)) b!242759))

(assert (= (and b!242764 ((_ is ValueCellFull!2844) mapDefault!10807)) b!242775))

(assert (= b!242766 b!242764))

(assert (= start!23148 b!242766))

(declare-fun m!261457 () Bool)

(assert (=> b!242782 m!261457))

(declare-fun m!261459 () Bool)

(assert (=> b!242774 m!261459))

(declare-fun m!261461 () Bool)

(assert (=> mapNonEmpty!10807 m!261461))

(declare-fun m!261463 () Bool)

(assert (=> b!242784 m!261463))

(declare-fun m!261465 () Bool)

(assert (=> bm!22622 m!261465))

(declare-fun m!261467 () Bool)

(assert (=> bm!22623 m!261467))

(declare-fun m!261469 () Bool)

(assert (=> b!242766 m!261469))

(declare-fun m!261471 () Bool)

(assert (=> b!242766 m!261471))

(declare-fun m!261473 () Bool)

(assert (=> b!242763 m!261473))

(declare-fun m!261475 () Bool)

(assert (=> b!242778 m!261475))

(declare-fun m!261477 () Bool)

(assert (=> b!242778 m!261477))

(assert (=> b!242778 m!261477))

(declare-fun m!261479 () Bool)

(assert (=> b!242778 m!261479))

(assert (=> b!242761 m!261465))

(declare-fun m!261481 () Bool)

(assert (=> b!242758 m!261481))

(declare-fun m!261483 () Bool)

(assert (=> b!242776 m!261483))

(declare-fun m!261485 () Bool)

(assert (=> start!23148 m!261485))

(assert (=> b!242770 m!261463))

(declare-fun m!261487 () Bool)

(assert (=> b!242779 m!261487))

(declare-fun m!261489 () Bool)

(assert (=> b!242760 m!261489))

(declare-fun m!261491 () Bool)

(assert (=> b!242772 m!261491))

(declare-fun m!261493 () Bool)

(assert (=> b!242767 m!261493))

(check-sat (not b!242770) (not b!242766) (not b!242763) (not b!242782) (not b!242760) (not bm!22622) b_and!13491 (not b!242774) (not b!242784) (not b!242761) (not b!242758) tp_is_empty!6375 (not b_next!6513) (not start!23148) (not mapNonEmpty!10807) (not b!242779) (not b!242778) (not bm!22623) (not b!242767))
(check-sat b_and!13491 (not b_next!6513))
(get-model)

(declare-fun b!242878 () Bool)

(declare-fun c!40537 () Bool)

(declare-fun lt!121940 () (_ BitVec 64))

(assert (=> b!242878 (= c!40537 (= lt!121940 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157624 () SeekEntryResult!1067)

(declare-fun e!157625 () SeekEntryResult!1067)

(assert (=> b!242878 (= e!157624 e!157625)))

(declare-fun b!242879 () Bool)

(declare-fun e!157626 () SeekEntryResult!1067)

(assert (=> b!242879 (= e!157626 e!157624)))

(declare-fun lt!121939 () SeekEntryResult!1067)

(assert (=> b!242879 (= lt!121940 (select (arr!5717 (_keys!6608 thiss!1504)) (index!6440 lt!121939)))))

(declare-fun c!40538 () Bool)

(assert (=> b!242879 (= c!40538 (= lt!121940 key!932))))

(declare-fun b!242880 () Bool)

(assert (=> b!242880 (= e!157626 Undefined!1067)))

(declare-fun b!242881 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12039 (_ BitVec 32)) SeekEntryResult!1067)

(assert (=> b!242881 (= e!157625 (seekKeyOrZeroReturnVacant!0 (x!24291 lt!121939) (index!6440 lt!121939) (index!6440 lt!121939) key!932 (_keys!6608 thiss!1504) (mask!10584 thiss!1504)))))

(declare-fun b!242882 () Bool)

(assert (=> b!242882 (= e!157625 (MissingZero!1067 (index!6440 lt!121939)))))

(declare-fun b!242883 () Bool)

(assert (=> b!242883 (= e!157624 (Found!1067 (index!6440 lt!121939)))))

(declare-fun d!59999 () Bool)

(declare-fun lt!121941 () SeekEntryResult!1067)

(assert (=> d!59999 (and (or ((_ is Undefined!1067) lt!121941) (not ((_ is Found!1067) lt!121941)) (and (bvsge (index!6439 lt!121941) #b00000000000000000000000000000000) (bvslt (index!6439 lt!121941) (size!6059 (_keys!6608 thiss!1504))))) (or ((_ is Undefined!1067) lt!121941) ((_ is Found!1067) lt!121941) (not ((_ is MissingZero!1067) lt!121941)) (and (bvsge (index!6438 lt!121941) #b00000000000000000000000000000000) (bvslt (index!6438 lt!121941) (size!6059 (_keys!6608 thiss!1504))))) (or ((_ is Undefined!1067) lt!121941) ((_ is Found!1067) lt!121941) ((_ is MissingZero!1067) lt!121941) (not ((_ is MissingVacant!1067) lt!121941)) (and (bvsge (index!6441 lt!121941) #b00000000000000000000000000000000) (bvslt (index!6441 lt!121941) (size!6059 (_keys!6608 thiss!1504))))) (or ((_ is Undefined!1067) lt!121941) (ite ((_ is Found!1067) lt!121941) (= (select (arr!5717 (_keys!6608 thiss!1504)) (index!6439 lt!121941)) key!932) (ite ((_ is MissingZero!1067) lt!121941) (= (select (arr!5717 (_keys!6608 thiss!1504)) (index!6438 lt!121941)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1067) lt!121941) (= (select (arr!5717 (_keys!6608 thiss!1504)) (index!6441 lt!121941)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59999 (= lt!121941 e!157626)))

(declare-fun c!40539 () Bool)

(assert (=> d!59999 (= c!40539 (and ((_ is Intermediate!1067) lt!121939) (undefined!1879 lt!121939)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12039 (_ BitVec 32)) SeekEntryResult!1067)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59999 (= lt!121939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10584 thiss!1504)) key!932 (_keys!6608 thiss!1504) (mask!10584 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59999 (validMask!0 (mask!10584 thiss!1504))))

(assert (=> d!59999 (= (seekEntryOrOpen!0 key!932 (_keys!6608 thiss!1504) (mask!10584 thiss!1504)) lt!121941)))

(assert (= (and d!59999 c!40539) b!242880))

(assert (= (and d!59999 (not c!40539)) b!242879))

(assert (= (and b!242879 c!40538) b!242883))

(assert (= (and b!242879 (not c!40538)) b!242878))

(assert (= (and b!242878 c!40537) b!242882))

(assert (= (and b!242878 (not c!40537)) b!242881))

(declare-fun m!261533 () Bool)

(assert (=> b!242879 m!261533))

(declare-fun m!261535 () Bool)

(assert (=> b!242881 m!261535))

(declare-fun m!261537 () Bool)

(assert (=> d!59999 m!261537))

(declare-fun m!261539 () Bool)

(assert (=> d!59999 m!261539))

(declare-fun m!261541 () Bool)

(assert (=> d!59999 m!261541))

(declare-fun m!261543 () Bool)

(assert (=> d!59999 m!261543))

(declare-fun m!261545 () Bool)

(assert (=> d!59999 m!261545))

(declare-fun m!261547 () Bool)

(assert (=> d!59999 m!261547))

(assert (=> d!59999 m!261541))

(assert (=> b!242782 d!59999))

(declare-fun d!60001 () Bool)

(declare-fun e!157629 () Bool)

(assert (=> d!60001 e!157629))

(declare-fun res!119018 () Bool)

(assert (=> d!60001 (=> (not res!119018) (not e!157629))))

(declare-fun lt!121947 () SeekEntryResult!1067)

(assert (=> d!60001 (= res!119018 ((_ is Found!1067) lt!121947))))

(assert (=> d!60001 (= lt!121947 (seekEntryOrOpen!0 key!932 (_keys!6608 thiss!1504) (mask!10584 thiss!1504)))))

(declare-fun lt!121946 () Unit!7487)

(declare-fun choose!1131 (array!12039 array!12037 (_ BitVec 32) (_ BitVec 32) V!8147 V!8147 (_ BitVec 64) Int) Unit!7487)

(assert (=> d!60001 (= lt!121946 (choose!1131 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) key!932 (defaultEntry!4499 thiss!1504)))))

(assert (=> d!60001 (validMask!0 (mask!10584 thiss!1504))))

(assert (=> d!60001 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!356 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) key!932 (defaultEntry!4499 thiss!1504)) lt!121946)))

(declare-fun b!242888 () Bool)

(declare-fun res!119017 () Bool)

(assert (=> b!242888 (=> (not res!119017) (not e!157629))))

(assert (=> b!242888 (= res!119017 (inRange!0 (index!6439 lt!121947) (mask!10584 thiss!1504)))))

(declare-fun b!242889 () Bool)

(assert (=> b!242889 (= e!157629 (= (select (arr!5717 (_keys!6608 thiss!1504)) (index!6439 lt!121947)) key!932))))

(assert (=> b!242889 (and (bvsge (index!6439 lt!121947) #b00000000000000000000000000000000) (bvslt (index!6439 lt!121947) (size!6059 (_keys!6608 thiss!1504))))))

(assert (= (and d!60001 res!119018) b!242888))

(assert (= (and b!242888 res!119017) b!242889))

(assert (=> d!60001 m!261457))

(declare-fun m!261549 () Bool)

(assert (=> d!60001 m!261549))

(assert (=> d!60001 m!261547))

(declare-fun m!261551 () Bool)

(assert (=> b!242888 m!261551))

(declare-fun m!261553 () Bool)

(assert (=> b!242889 m!261553))

(assert (=> b!242763 d!60001))

(declare-fun d!60003 () Bool)

(assert (=> d!60003 (= (inRange!0 (ite c!40517 (index!6438 lt!121913) (index!6441 lt!121913)) (mask!10584 thiss!1504)) (and (bvsge (ite c!40517 (index!6438 lt!121913) (index!6441 lt!121913)) #b00000000000000000000000000000000) (bvslt (ite c!40517 (index!6438 lt!121913) (index!6441 lt!121913)) (bvadd (mask!10584 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22623 d!60003))

(declare-fun d!60005 () Bool)

(declare-fun res!119023 () Bool)

(declare-fun e!157634 () Bool)

(assert (=> d!60005 (=> res!119023 e!157634)))

(assert (=> d!60005 (= res!119023 (= (select (arr!5717 (_keys!6608 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60005 (= (arrayContainsKey!0 (_keys!6608 thiss!1504) key!932 #b00000000000000000000000000000000) e!157634)))

(declare-fun b!242894 () Bool)

(declare-fun e!157635 () Bool)

(assert (=> b!242894 (= e!157634 e!157635)))

(declare-fun res!119024 () Bool)

(assert (=> b!242894 (=> (not res!119024) (not e!157635))))

(assert (=> b!242894 (= res!119024 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6059 (_keys!6608 thiss!1504))))))

(declare-fun b!242895 () Bool)

(assert (=> b!242895 (= e!157635 (arrayContainsKey!0 (_keys!6608 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60005 (not res!119023)) b!242894))

(assert (= (and b!242894 res!119024) b!242895))

(declare-fun m!261555 () Bool)

(assert (=> d!60005 m!261555))

(declare-fun m!261557 () Bool)

(assert (=> b!242895 m!261557))

(assert (=> b!242761 d!60005))

(declare-fun d!60007 () Bool)

(declare-fun lt!121950 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!159 (List!3638) (InoxSet (_ BitVec 64)))

(assert (=> d!60007 (= lt!121950 (select (content!159 Nil!3635) key!932))))

(declare-fun e!157640 () Bool)

(assert (=> d!60007 (= lt!121950 e!157640)))

(declare-fun res!119030 () Bool)

(assert (=> d!60007 (=> (not res!119030) (not e!157640))))

(assert (=> d!60007 (= res!119030 ((_ is Cons!3634) Nil!3635))))

(assert (=> d!60007 (= (contains!1746 Nil!3635 key!932) lt!121950)))

(declare-fun b!242900 () Bool)

(declare-fun e!157641 () Bool)

(assert (=> b!242900 (= e!157640 e!157641)))

(declare-fun res!119029 () Bool)

(assert (=> b!242900 (=> res!119029 e!157641)))

(assert (=> b!242900 (= res!119029 (= (h!4291 Nil!3635) key!932))))

(declare-fun b!242901 () Bool)

(assert (=> b!242901 (= e!157641 (contains!1746 (t!8641 Nil!3635) key!932))))

(assert (= (and d!60007 res!119030) b!242900))

(assert (= (and b!242900 (not res!119029)) b!242901))

(declare-fun m!261559 () Bool)

(assert (=> d!60007 m!261559))

(declare-fun m!261561 () Bool)

(assert (=> d!60007 m!261561))

(declare-fun m!261563 () Bool)

(assert (=> b!242901 m!261563))

(assert (=> b!242770 d!60007))

(declare-fun d!60009 () Bool)

(assert (=> d!60009 (= (inRange!0 index!297 (mask!10584 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10584 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!242778 d!60009))

(declare-fun d!60011 () Bool)

(declare-fun e!157647 () Bool)

(assert (=> d!60011 e!157647))

(declare-fun res!119033 () Bool)

(assert (=> d!60011 (=> res!119033 e!157647)))

(declare-fun lt!121961 () Bool)

(assert (=> d!60011 (= res!119033 (not lt!121961))))

(declare-fun lt!121959 () Bool)

(assert (=> d!60011 (= lt!121961 lt!121959)))

(declare-fun lt!121962 () Unit!7487)

(declare-fun e!157646 () Unit!7487)

(assert (=> d!60011 (= lt!121962 e!157646)))

(declare-fun c!40542 () Bool)

(assert (=> d!60011 (= c!40542 lt!121959)))

(declare-fun containsKey!275 (List!3639 (_ BitVec 64)) Bool)

(assert (=> d!60011 (= lt!121959 (containsKey!275 (toList!1852 (getCurrentListMap!1380 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504))) key!932))))

(assert (=> d!60011 (= (contains!1747 (getCurrentListMap!1380 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504)) key!932) lt!121961)))

(declare-fun b!242908 () Bool)

(declare-fun lt!121960 () Unit!7487)

(assert (=> b!242908 (= e!157646 lt!121960)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!223 (List!3639 (_ BitVec 64)) Unit!7487)

(assert (=> b!242908 (= lt!121960 (lemmaContainsKeyImpliesGetValueByKeyDefined!223 (toList!1852 (getCurrentListMap!1380 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504))) key!932))))

(declare-datatypes ((Option!289 0))(
  ( (Some!288 (v!5278 V!8147)) (None!287) )
))
(declare-fun isDefined!224 (Option!289) Bool)

(declare-fun getValueByKey!283 (List!3639 (_ BitVec 64)) Option!289)

(assert (=> b!242908 (isDefined!224 (getValueByKey!283 (toList!1852 (getCurrentListMap!1380 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504))) key!932))))

(declare-fun b!242909 () Bool)

(declare-fun Unit!7497 () Unit!7487)

(assert (=> b!242909 (= e!157646 Unit!7497)))

(declare-fun b!242910 () Bool)

(assert (=> b!242910 (= e!157647 (isDefined!224 (getValueByKey!283 (toList!1852 (getCurrentListMap!1380 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504))) key!932)))))

(assert (= (and d!60011 c!40542) b!242908))

(assert (= (and d!60011 (not c!40542)) b!242909))

(assert (= (and d!60011 (not res!119033)) b!242910))

(declare-fun m!261565 () Bool)

(assert (=> d!60011 m!261565))

(declare-fun m!261567 () Bool)

(assert (=> b!242908 m!261567))

(declare-fun m!261569 () Bool)

(assert (=> b!242908 m!261569))

(assert (=> b!242908 m!261569))

(declare-fun m!261571 () Bool)

(assert (=> b!242908 m!261571))

(assert (=> b!242910 m!261569))

(assert (=> b!242910 m!261569))

(assert (=> b!242910 m!261571))

(assert (=> b!242778 d!60011))

(declare-fun b!242953 () Bool)

(declare-fun c!40558 () Bool)

(assert (=> b!242953 (= c!40558 (and (not (= (bvand (extraKeys!4236 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4236 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!157682 () ListLongMap!3673)

(declare-fun e!157675 () ListLongMap!3673)

(assert (=> b!242953 (= e!157682 e!157675)))

(declare-fun b!242954 () Bool)

(declare-fun e!157677 () Bool)

(declare-fun lt!122011 () ListLongMap!3673)

(declare-fun apply!225 (ListLongMap!3673 (_ BitVec 64)) V!8147)

(assert (=> b!242954 (= e!157677 (= (apply!225 lt!122011 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4340 thiss!1504)))))

(declare-fun b!242955 () Bool)

(declare-fun e!157678 () Unit!7487)

(declare-fun lt!122016 () Unit!7487)

(assert (=> b!242955 (= e!157678 lt!122016)))

(declare-fun lt!122010 () ListLongMap!3673)

(declare-fun getCurrentListMapNoExtraKeys!547 (array!12039 array!12037 (_ BitVec 32) (_ BitVec 32) V!8147 V!8147 (_ BitVec 32) Int) ListLongMap!3673)

(assert (=> b!242955 (= lt!122010 (getCurrentListMapNoExtraKeys!547 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504)))))

(declare-fun lt!122007 () (_ BitVec 64))

(assert (=> b!242955 (= lt!122007 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122028 () (_ BitVec 64))

(assert (=> b!242955 (= lt!122028 (select (arr!5717 (_keys!6608 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122019 () Unit!7487)

(declare-fun addStillContains!201 (ListLongMap!3673 (_ BitVec 64) V!8147 (_ BitVec 64)) Unit!7487)

(assert (=> b!242955 (= lt!122019 (addStillContains!201 lt!122010 lt!122007 (zeroValue!4340 thiss!1504) lt!122028))))

(declare-fun +!652 (ListLongMap!3673 tuple2!4760) ListLongMap!3673)

(assert (=> b!242955 (contains!1747 (+!652 lt!122010 (tuple2!4761 lt!122007 (zeroValue!4340 thiss!1504))) lt!122028)))

(declare-fun lt!122013 () Unit!7487)

(assert (=> b!242955 (= lt!122013 lt!122019)))

(declare-fun lt!122023 () ListLongMap!3673)

(assert (=> b!242955 (= lt!122023 (getCurrentListMapNoExtraKeys!547 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504)))))

(declare-fun lt!122021 () (_ BitVec 64))

(assert (=> b!242955 (= lt!122021 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122022 () (_ BitVec 64))

(assert (=> b!242955 (= lt!122022 (select (arr!5717 (_keys!6608 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122012 () Unit!7487)

(declare-fun addApplyDifferent!201 (ListLongMap!3673 (_ BitVec 64) V!8147 (_ BitVec 64)) Unit!7487)

(assert (=> b!242955 (= lt!122012 (addApplyDifferent!201 lt!122023 lt!122021 (minValue!4340 thiss!1504) lt!122022))))

(assert (=> b!242955 (= (apply!225 (+!652 lt!122023 (tuple2!4761 lt!122021 (minValue!4340 thiss!1504))) lt!122022) (apply!225 lt!122023 lt!122022))))

(declare-fun lt!122018 () Unit!7487)

(assert (=> b!242955 (= lt!122018 lt!122012)))

(declare-fun lt!122015 () ListLongMap!3673)

(assert (=> b!242955 (= lt!122015 (getCurrentListMapNoExtraKeys!547 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504)))))

(declare-fun lt!122027 () (_ BitVec 64))

(assert (=> b!242955 (= lt!122027 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122014 () (_ BitVec 64))

(assert (=> b!242955 (= lt!122014 (select (arr!5717 (_keys!6608 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122009 () Unit!7487)

(assert (=> b!242955 (= lt!122009 (addApplyDifferent!201 lt!122015 lt!122027 (zeroValue!4340 thiss!1504) lt!122014))))

(assert (=> b!242955 (= (apply!225 (+!652 lt!122015 (tuple2!4761 lt!122027 (zeroValue!4340 thiss!1504))) lt!122014) (apply!225 lt!122015 lt!122014))))

(declare-fun lt!122020 () Unit!7487)

(assert (=> b!242955 (= lt!122020 lt!122009)))

(declare-fun lt!122026 () ListLongMap!3673)

(assert (=> b!242955 (= lt!122026 (getCurrentListMapNoExtraKeys!547 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504)))))

(declare-fun lt!122008 () (_ BitVec 64))

(assert (=> b!242955 (= lt!122008 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122017 () (_ BitVec 64))

(assert (=> b!242955 (= lt!122017 (select (arr!5717 (_keys!6608 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242955 (= lt!122016 (addApplyDifferent!201 lt!122026 lt!122008 (minValue!4340 thiss!1504) lt!122017))))

(assert (=> b!242955 (= (apply!225 (+!652 lt!122026 (tuple2!4761 lt!122008 (minValue!4340 thiss!1504))) lt!122017) (apply!225 lt!122026 lt!122017))))

(declare-fun b!242957 () Bool)

(declare-fun call!22652 () ListLongMap!3673)

(assert (=> b!242957 (= e!157675 call!22652)))

(declare-fun b!242958 () Bool)

(declare-fun e!157679 () ListLongMap!3673)

(declare-fun call!22649 () ListLongMap!3673)

(assert (=> b!242958 (= e!157679 (+!652 call!22649 (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4340 thiss!1504))))))

(declare-fun b!242959 () Bool)

(declare-fun e!157684 () Bool)

(declare-fun call!22650 () Bool)

(assert (=> b!242959 (= e!157684 (not call!22650))))

(declare-fun b!242960 () Bool)

(declare-fun Unit!7498 () Unit!7487)

(assert (=> b!242960 (= e!157678 Unit!7498)))

(declare-fun b!242961 () Bool)

(declare-fun call!22647 () ListLongMap!3673)

(assert (=> b!242961 (= e!157675 call!22647)))

(declare-fun b!242962 () Bool)

(assert (=> b!242962 (= e!157682 call!22652)))

(declare-fun bm!22644 () Bool)

(declare-fun call!22653 () ListLongMap!3673)

(assert (=> bm!22644 (= call!22653 (getCurrentListMapNoExtraKeys!547 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504)))))

(declare-fun b!242963 () Bool)

(declare-fun res!119057 () Bool)

(declare-fun e!157680 () Bool)

(assert (=> b!242963 (=> (not res!119057) (not e!157680))))

(assert (=> b!242963 (= res!119057 e!157684)))

(declare-fun c!40555 () Bool)

(assert (=> b!242963 (= c!40555 (not (= (bvand (extraKeys!4236 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!22645 () Bool)

(declare-fun call!22651 () ListLongMap!3673)

(assert (=> bm!22645 (= call!22651 call!22653)))

(declare-fun bm!22646 () Bool)

(declare-fun c!40560 () Bool)

(declare-fun c!40559 () Bool)

(assert (=> bm!22646 (= call!22649 (+!652 (ite c!40560 call!22653 (ite c!40559 call!22651 call!22647)) (ite (or c!40560 c!40559) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4340 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4340 thiss!1504)))))))

(declare-fun bm!22647 () Bool)

(assert (=> bm!22647 (= call!22650 (contains!1747 lt!122011 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242964 () Bool)

(declare-fun e!157674 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!242964 (= e!157674 (validKeyInArray!0 (select (arr!5717 (_keys!6608 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!242965 () Bool)

(declare-fun res!119058 () Bool)

(assert (=> b!242965 (=> (not res!119058) (not e!157680))))

(declare-fun e!157676 () Bool)

(assert (=> b!242965 (= res!119058 e!157676)))

(declare-fun res!119053 () Bool)

(assert (=> b!242965 (=> res!119053 e!157676)))

(assert (=> b!242965 (= res!119053 (not e!157674))))

(declare-fun res!119055 () Bool)

(assert (=> b!242965 (=> (not res!119055) (not e!157674))))

(assert (=> b!242965 (= res!119055 (bvslt #b00000000000000000000000000000000 (size!6059 (_keys!6608 thiss!1504))))))

(declare-fun d!60013 () Bool)

(assert (=> d!60013 e!157680))

(declare-fun res!119052 () Bool)

(assert (=> d!60013 (=> (not res!119052) (not e!157680))))

(assert (=> d!60013 (= res!119052 (or (bvsge #b00000000000000000000000000000000 (size!6059 (_keys!6608 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6059 (_keys!6608 thiss!1504))))))))

(declare-fun lt!122025 () ListLongMap!3673)

(assert (=> d!60013 (= lt!122011 lt!122025)))

(declare-fun lt!122024 () Unit!7487)

(assert (=> d!60013 (= lt!122024 e!157678)))

(declare-fun c!40556 () Bool)

(declare-fun e!157686 () Bool)

(assert (=> d!60013 (= c!40556 e!157686)))

(declare-fun res!119059 () Bool)

(assert (=> d!60013 (=> (not res!119059) (not e!157686))))

(assert (=> d!60013 (= res!119059 (bvslt #b00000000000000000000000000000000 (size!6059 (_keys!6608 thiss!1504))))))

(assert (=> d!60013 (= lt!122025 e!157679)))

(assert (=> d!60013 (= c!40560 (and (not (= (bvand (extraKeys!4236 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4236 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60013 (validMask!0 (mask!10584 thiss!1504))))

(assert (=> d!60013 (= (getCurrentListMap!1380 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504)) lt!122011)))

(declare-fun b!242956 () Bool)

(declare-fun e!157685 () Bool)

(declare-fun get!2935 (ValueCell!2844 V!8147) V!8147)

(declare-fun dynLambda!568 (Int (_ BitVec 64)) V!8147)

(assert (=> b!242956 (= e!157685 (= (apply!225 lt!122011 (select (arr!5717 (_keys!6608 thiss!1504)) #b00000000000000000000000000000000)) (get!2935 (select (arr!5716 (_values!4482 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!568 (defaultEntry!4499 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!242956 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6058 (_values!4482 thiss!1504))))))

(assert (=> b!242956 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6059 (_keys!6608 thiss!1504))))))

(declare-fun bm!22648 () Bool)

(assert (=> bm!22648 (= call!22652 call!22649)))

(declare-fun b!242966 () Bool)

(declare-fun e!157683 () Bool)

(declare-fun e!157681 () Bool)

(assert (=> b!242966 (= e!157683 e!157681)))

(declare-fun res!119056 () Bool)

(declare-fun call!22648 () Bool)

(assert (=> b!242966 (= res!119056 call!22648)))

(assert (=> b!242966 (=> (not res!119056) (not e!157681))))

(declare-fun b!242967 () Bool)

(assert (=> b!242967 (= e!157683 (not call!22648))))

(declare-fun bm!22649 () Bool)

(assert (=> bm!22649 (= call!22648 (contains!1747 lt!122011 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242968 () Bool)

(assert (=> b!242968 (= e!157684 e!157677)))

(declare-fun res!119060 () Bool)

(assert (=> b!242968 (= res!119060 call!22650)))

(assert (=> b!242968 (=> (not res!119060) (not e!157677))))

(declare-fun bm!22650 () Bool)

(assert (=> bm!22650 (= call!22647 call!22651)))

(declare-fun b!242969 () Bool)

(assert (=> b!242969 (= e!157679 e!157682)))

(assert (=> b!242969 (= c!40559 (and (not (= (bvand (extraKeys!4236 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4236 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!242970 () Bool)

(assert (=> b!242970 (= e!157676 e!157685)))

(declare-fun res!119054 () Bool)

(assert (=> b!242970 (=> (not res!119054) (not e!157685))))

(assert (=> b!242970 (= res!119054 (contains!1747 lt!122011 (select (arr!5717 (_keys!6608 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!242970 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6059 (_keys!6608 thiss!1504))))))

(declare-fun b!242971 () Bool)

(assert (=> b!242971 (= e!157680 e!157683)))

(declare-fun c!40557 () Bool)

(assert (=> b!242971 (= c!40557 (not (= (bvand (extraKeys!4236 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!242972 () Bool)

(assert (=> b!242972 (= e!157686 (validKeyInArray!0 (select (arr!5717 (_keys!6608 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!242973 () Bool)

(assert (=> b!242973 (= e!157681 (= (apply!225 lt!122011 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4340 thiss!1504)))))

(assert (= (and d!60013 c!40560) b!242958))

(assert (= (and d!60013 (not c!40560)) b!242969))

(assert (= (and b!242969 c!40559) b!242962))

(assert (= (and b!242969 (not c!40559)) b!242953))

(assert (= (and b!242953 c!40558) b!242957))

(assert (= (and b!242953 (not c!40558)) b!242961))

(assert (= (or b!242957 b!242961) bm!22650))

(assert (= (or b!242962 bm!22650) bm!22645))

(assert (= (or b!242962 b!242957) bm!22648))

(assert (= (or b!242958 bm!22645) bm!22644))

(assert (= (or b!242958 bm!22648) bm!22646))

(assert (= (and d!60013 res!119059) b!242972))

(assert (= (and d!60013 c!40556) b!242955))

(assert (= (and d!60013 (not c!40556)) b!242960))

(assert (= (and d!60013 res!119052) b!242965))

(assert (= (and b!242965 res!119055) b!242964))

(assert (= (and b!242965 (not res!119053)) b!242970))

(assert (= (and b!242970 res!119054) b!242956))

(assert (= (and b!242965 res!119058) b!242963))

(assert (= (and b!242963 c!40555) b!242968))

(assert (= (and b!242963 (not c!40555)) b!242959))

(assert (= (and b!242968 res!119060) b!242954))

(assert (= (or b!242968 b!242959) bm!22647))

(assert (= (and b!242963 res!119057) b!242971))

(assert (= (and b!242971 c!40557) b!242966))

(assert (= (and b!242971 (not c!40557)) b!242967))

(assert (= (and b!242966 res!119056) b!242973))

(assert (= (or b!242966 b!242967) bm!22649))

(declare-fun b_lambda!8003 () Bool)

(assert (=> (not b_lambda!8003) (not b!242956)))

(declare-fun t!8646 () Bool)

(declare-fun tb!2963 () Bool)

(assert (=> (and b!242766 (= (defaultEntry!4499 thiss!1504) (defaultEntry!4499 thiss!1504)) t!8646) tb!2963))

(declare-fun result!5211 () Bool)

(assert (=> tb!2963 (= result!5211 tp_is_empty!6375)))

(assert (=> b!242956 t!8646))

(declare-fun b_and!13495 () Bool)

(assert (= b_and!13491 (and (=> t!8646 result!5211) b_and!13495)))

(assert (=> b!242964 m!261555))

(assert (=> b!242964 m!261555))

(declare-fun m!261573 () Bool)

(assert (=> b!242964 m!261573))

(declare-fun m!261575 () Bool)

(assert (=> b!242958 m!261575))

(declare-fun m!261577 () Bool)

(assert (=> bm!22649 m!261577))

(declare-fun m!261579 () Bool)

(assert (=> bm!22646 m!261579))

(assert (=> b!242972 m!261555))

(assert (=> b!242972 m!261555))

(assert (=> b!242972 m!261573))

(declare-fun m!261581 () Bool)

(assert (=> bm!22644 m!261581))

(declare-fun m!261583 () Bool)

(assert (=> b!242956 m!261583))

(assert (=> b!242956 m!261555))

(assert (=> b!242956 m!261583))

(declare-fun m!261585 () Bool)

(assert (=> b!242956 m!261585))

(declare-fun m!261587 () Bool)

(assert (=> b!242956 m!261587))

(assert (=> b!242956 m!261555))

(declare-fun m!261589 () Bool)

(assert (=> b!242956 m!261589))

(assert (=> b!242956 m!261585))

(declare-fun m!261591 () Bool)

(assert (=> b!242955 m!261591))

(declare-fun m!261593 () Bool)

(assert (=> b!242955 m!261593))

(declare-fun m!261595 () Bool)

(assert (=> b!242955 m!261595))

(declare-fun m!261597 () Bool)

(assert (=> b!242955 m!261597))

(declare-fun m!261599 () Bool)

(assert (=> b!242955 m!261599))

(declare-fun m!261601 () Bool)

(assert (=> b!242955 m!261601))

(declare-fun m!261603 () Bool)

(assert (=> b!242955 m!261603))

(declare-fun m!261605 () Bool)

(assert (=> b!242955 m!261605))

(declare-fun m!261607 () Bool)

(assert (=> b!242955 m!261607))

(declare-fun m!261609 () Bool)

(assert (=> b!242955 m!261609))

(declare-fun m!261611 () Bool)

(assert (=> b!242955 m!261611))

(assert (=> b!242955 m!261609))

(declare-fun m!261613 () Bool)

(assert (=> b!242955 m!261613))

(assert (=> b!242955 m!261603))

(declare-fun m!261615 () Bool)

(assert (=> b!242955 m!261615))

(assert (=> b!242955 m!261581))

(assert (=> b!242955 m!261555))

(declare-fun m!261617 () Bool)

(assert (=> b!242955 m!261617))

(assert (=> b!242955 m!261593))

(assert (=> b!242955 m!261613))

(declare-fun m!261619 () Bool)

(assert (=> b!242955 m!261619))

(assert (=> b!242970 m!261555))

(assert (=> b!242970 m!261555))

(declare-fun m!261621 () Bool)

(assert (=> b!242970 m!261621))

(declare-fun m!261623 () Bool)

(assert (=> bm!22647 m!261623))

(declare-fun m!261625 () Bool)

(assert (=> b!242954 m!261625))

(declare-fun m!261627 () Bool)

(assert (=> b!242973 m!261627))

(assert (=> d!60013 m!261547))

(assert (=> b!242778 d!60013))

(declare-fun d!60015 () Bool)

(declare-fun res!119065 () Bool)

(declare-fun e!157691 () Bool)

(assert (=> d!60015 (=> res!119065 e!157691)))

(assert (=> d!60015 (= res!119065 ((_ is Nil!3635) Nil!3635))))

(assert (=> d!60015 (= (noDuplicate!92 Nil!3635) e!157691)))

(declare-fun b!242980 () Bool)

(declare-fun e!157692 () Bool)

(assert (=> b!242980 (= e!157691 e!157692)))

(declare-fun res!119066 () Bool)

(assert (=> b!242980 (=> (not res!119066) (not e!157692))))

(assert (=> b!242980 (= res!119066 (not (contains!1746 (t!8641 Nil!3635) (h!4291 Nil!3635))))))

(declare-fun b!242981 () Bool)

(assert (=> b!242981 (= e!157692 (noDuplicate!92 (t!8641 Nil!3635)))))

(assert (= (and d!60015 (not res!119065)) b!242980))

(assert (= (and b!242980 res!119066) b!242981))

(declare-fun m!261629 () Bool)

(assert (=> b!242980 m!261629))

(declare-fun m!261631 () Bool)

(assert (=> b!242981 m!261631))

(assert (=> b!242760 d!60015))

(declare-fun d!60017 () Bool)

(declare-fun res!119073 () Bool)

(declare-fun e!157695 () Bool)

(assert (=> d!60017 (=> (not res!119073) (not e!157695))))

(declare-fun simpleValid!248 (LongMapFixedSize!3588) Bool)

(assert (=> d!60017 (= res!119073 (simpleValid!248 thiss!1504))))

(assert (=> d!60017 (= (valid!1407 thiss!1504) e!157695)))

(declare-fun b!242988 () Bool)

(declare-fun res!119074 () Bool)

(assert (=> b!242988 (=> (not res!119074) (not e!157695))))

(declare-fun arrayCountValidKeys!0 (array!12039 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!242988 (= res!119074 (= (arrayCountValidKeys!0 (_keys!6608 thiss!1504) #b00000000000000000000000000000000 (size!6059 (_keys!6608 thiss!1504))) (_size!1843 thiss!1504)))))

(declare-fun b!242989 () Bool)

(declare-fun res!119075 () Bool)

(assert (=> b!242989 (=> (not res!119075) (not e!157695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12039 (_ BitVec 32)) Bool)

(assert (=> b!242989 (= res!119075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6608 thiss!1504) (mask!10584 thiss!1504)))))

(declare-fun b!242990 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12039 (_ BitVec 32) List!3638) Bool)

(assert (=> b!242990 (= e!157695 (arrayNoDuplicates!0 (_keys!6608 thiss!1504) #b00000000000000000000000000000000 Nil!3635))))

(assert (= (and d!60017 res!119073) b!242988))

(assert (= (and b!242988 res!119074) b!242989))

(assert (= (and b!242989 res!119075) b!242990))

(declare-fun m!261633 () Bool)

(assert (=> d!60017 m!261633))

(declare-fun m!261635 () Bool)

(assert (=> b!242988 m!261635))

(declare-fun m!261637 () Bool)

(assert (=> b!242989 m!261637))

(declare-fun m!261639 () Bool)

(assert (=> b!242990 m!261639))

(assert (=> start!23148 d!60017))

(declare-fun d!60019 () Bool)

(assert (=> d!60019 (contains!1747 (getCurrentListMap!1380 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504)) key!932)))

(declare-fun lt!122031 () Unit!7487)

(declare-fun choose!1132 (array!12039 array!12037 (_ BitVec 32) (_ BitVec 32) V!8147 V!8147 (_ BitVec 64) (_ BitVec 32) Int) Unit!7487)

(assert (=> d!60019 (= lt!122031 (choose!1132 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504)))))

(assert (=> d!60019 (validMask!0 (mask!10584 thiss!1504))))

(assert (=> d!60019 (= (lemmaArrayContainsKeyThenInListMap!161 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4499 thiss!1504)) lt!122031)))

(declare-fun bs!8865 () Bool)

(assert (= bs!8865 d!60019))

(assert (=> bs!8865 m!261477))

(assert (=> bs!8865 m!261477))

(assert (=> bs!8865 m!261479))

(declare-fun m!261641 () Bool)

(assert (=> bs!8865 m!261641))

(assert (=> bs!8865 m!261547))

(assert (=> b!242779 d!60019))

(declare-fun d!60021 () Bool)

(declare-fun lt!122032 () Bool)

(assert (=> d!60021 (= lt!122032 (select (content!159 Nil!3635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157696 () Bool)

(assert (=> d!60021 (= lt!122032 e!157696)))

(declare-fun res!119077 () Bool)

(assert (=> d!60021 (=> (not res!119077) (not e!157696))))

(assert (=> d!60021 (= res!119077 ((_ is Cons!3634) Nil!3635))))

(assert (=> d!60021 (= (contains!1746 Nil!3635 #b0000000000000000000000000000000000000000000000000000000000000000) lt!122032)))

(declare-fun b!242991 () Bool)

(declare-fun e!157697 () Bool)

(assert (=> b!242991 (= e!157696 e!157697)))

(declare-fun res!119076 () Bool)

(assert (=> b!242991 (=> res!119076 e!157697)))

(assert (=> b!242991 (= res!119076 (= (h!4291 Nil!3635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242992 () Bool)

(assert (=> b!242992 (= e!157697 (contains!1746 (t!8641 Nil!3635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60021 res!119077) b!242991))

(assert (= (and b!242991 (not res!119076)) b!242992))

(assert (=> d!60021 m!261559))

(declare-fun m!261643 () Bool)

(assert (=> d!60021 m!261643))

(declare-fun m!261645 () Bool)

(assert (=> b!242992 m!261645))

(assert (=> b!242767 d!60021))

(assert (=> bm!22622 d!60005))

(declare-fun d!60023 () Bool)

(declare-fun lt!122033 () Bool)

(assert (=> d!60023 (= lt!122033 (select (content!159 Nil!3635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157698 () Bool)

(assert (=> d!60023 (= lt!122033 e!157698)))

(declare-fun res!119079 () Bool)

(assert (=> d!60023 (=> (not res!119079) (not e!157698))))

(assert (=> d!60023 (= res!119079 ((_ is Cons!3634) Nil!3635))))

(assert (=> d!60023 (= (contains!1746 Nil!3635 #b1000000000000000000000000000000000000000000000000000000000000000) lt!122033)))

(declare-fun b!242993 () Bool)

(declare-fun e!157699 () Bool)

(assert (=> b!242993 (= e!157698 e!157699)))

(declare-fun res!119078 () Bool)

(assert (=> b!242993 (=> res!119078 e!157699)))

(assert (=> b!242993 (= res!119078 (= (h!4291 Nil!3635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242994 () Bool)

(assert (=> b!242994 (= e!157699 (contains!1746 (t!8641 Nil!3635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60023 res!119079) b!242993))

(assert (= (and b!242993 (not res!119078)) b!242994))

(assert (=> d!60023 m!261559))

(declare-fun m!261647 () Bool)

(assert (=> d!60023 m!261647))

(declare-fun m!261649 () Bool)

(assert (=> b!242994 m!261649))

(assert (=> b!242758 d!60023))

(declare-fun bm!22655 () Bool)

(declare-fun call!22659 () Bool)

(assert (=> bm!22655 (= call!22659 (arrayContainsKey!0 (_keys!6608 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun lt!122038 () SeekEntryResult!1067)

(declare-fun c!40565 () Bool)

(declare-fun call!22658 () Bool)

(declare-fun bm!22656 () Bool)

(assert (=> bm!22656 (= call!22658 (inRange!0 (ite c!40565 (index!6438 lt!122038) (index!6441 lt!122038)) (mask!10584 thiss!1504)))))

(declare-fun b!243012 () Bool)

(declare-fun e!157711 () Bool)

(assert (=> b!243012 (= e!157711 ((_ is Undefined!1067) lt!122038))))

(declare-fun b!243013 () Bool)

(declare-fun e!157709 () Bool)

(assert (=> b!243013 (= e!157709 (not call!22659))))

(declare-fun b!243014 () Bool)

(declare-fun e!157708 () Bool)

(declare-fun e!157710 () Bool)

(assert (=> b!243014 (= e!157708 e!157710)))

(declare-fun res!119091 () Bool)

(assert (=> b!243014 (= res!119091 call!22658)))

(assert (=> b!243014 (=> (not res!119091) (not e!157710))))

(declare-fun b!243015 () Bool)

(assert (=> b!243015 (= e!157710 (not call!22659))))

(declare-fun b!243016 () Bool)

(declare-fun res!119089 () Bool)

(assert (=> b!243016 (=> (not res!119089) (not e!157709))))

(assert (=> b!243016 (= res!119089 call!22658)))

(assert (=> b!243016 (= e!157711 e!157709)))

(declare-fun b!243011 () Bool)

(assert (=> b!243011 (and (bvsge (index!6438 lt!122038) #b00000000000000000000000000000000) (bvslt (index!6438 lt!122038) (size!6059 (_keys!6608 thiss!1504))))))

(declare-fun res!119088 () Bool)

(assert (=> b!243011 (= res!119088 (= (select (arr!5717 (_keys!6608 thiss!1504)) (index!6438 lt!122038)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243011 (=> (not res!119088) (not e!157710))))

(declare-fun d!60025 () Bool)

(assert (=> d!60025 e!157708))

(assert (=> d!60025 (= c!40565 ((_ is MissingZero!1067) lt!122038))))

(assert (=> d!60025 (= lt!122038 (seekEntryOrOpen!0 key!932 (_keys!6608 thiss!1504) (mask!10584 thiss!1504)))))

(declare-fun lt!122039 () Unit!7487)

(declare-fun choose!1133 (array!12039 array!12037 (_ BitVec 32) (_ BitVec 32) V!8147 V!8147 (_ BitVec 64) Int) Unit!7487)

(assert (=> d!60025 (= lt!122039 (choose!1133 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) key!932 (defaultEntry!4499 thiss!1504)))))

(assert (=> d!60025 (validMask!0 (mask!10584 thiss!1504))))

(assert (=> d!60025 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!366 (_keys!6608 thiss!1504) (_values!4482 thiss!1504) (mask!10584 thiss!1504) (extraKeys!4236 thiss!1504) (zeroValue!4340 thiss!1504) (minValue!4340 thiss!1504) key!932 (defaultEntry!4499 thiss!1504)) lt!122039)))

(declare-fun b!243017 () Bool)

(declare-fun res!119090 () Bool)

(assert (=> b!243017 (=> (not res!119090) (not e!157709))))

(assert (=> b!243017 (= res!119090 (= (select (arr!5717 (_keys!6608 thiss!1504)) (index!6441 lt!122038)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243017 (and (bvsge (index!6441 lt!122038) #b00000000000000000000000000000000) (bvslt (index!6441 lt!122038) (size!6059 (_keys!6608 thiss!1504))))))

(declare-fun b!243018 () Bool)

(assert (=> b!243018 (= e!157708 e!157711)))

(declare-fun c!40566 () Bool)

(assert (=> b!243018 (= c!40566 ((_ is MissingVacant!1067) lt!122038))))

(assert (= (and d!60025 c!40565) b!243014))

(assert (= (and d!60025 (not c!40565)) b!243018))

(assert (= (and b!243014 res!119091) b!243011))

(assert (= (and b!243011 res!119088) b!243015))

(assert (= (and b!243018 c!40566) b!243016))

(assert (= (and b!243018 (not c!40566)) b!243012))

(assert (= (and b!243016 res!119089) b!243017))

(assert (= (and b!243017 res!119090) b!243013))

(assert (= (or b!243014 b!243016) bm!22656))

(assert (= (or b!243015 b!243013) bm!22655))

(declare-fun m!261651 () Bool)

(assert (=> b!243011 m!261651))

(declare-fun m!261653 () Bool)

(assert (=> b!243017 m!261653))

(declare-fun m!261655 () Bool)

(assert (=> bm!22656 m!261655))

(assert (=> bm!22655 m!261465))

(assert (=> d!60025 m!261457))

(declare-fun m!261657 () Bool)

(assert (=> d!60025 m!261657))

(assert (=> d!60025 m!261547))

(assert (=> b!242774 d!60025))

(declare-fun d!60027 () Bool)

(assert (=> d!60027 (= (array_inv!3783 (_keys!6608 thiss!1504)) (bvsge (size!6059 (_keys!6608 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242766 d!60027))

(declare-fun d!60029 () Bool)

(assert (=> d!60029 (= (array_inv!3784 (_values!4482 thiss!1504)) (bvsge (size!6058 (_values!4482 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242766 d!60029))

(assert (=> b!242784 d!60007))

(declare-fun condMapEmpty!10813 () Bool)

(declare-fun mapDefault!10813 () ValueCell!2844)

(assert (=> mapNonEmpty!10807 (= condMapEmpty!10813 (= mapRest!10807 ((as const (Array (_ BitVec 32) ValueCell!2844)) mapDefault!10813)))))

(declare-fun e!157717 () Bool)

(declare-fun mapRes!10813 () Bool)

(assert (=> mapNonEmpty!10807 (= tp!22756 (and e!157717 mapRes!10813))))

(declare-fun b!243025 () Bool)

(declare-fun e!157716 () Bool)

(assert (=> b!243025 (= e!157716 tp_is_empty!6375)))

(declare-fun mapIsEmpty!10813 () Bool)

(assert (=> mapIsEmpty!10813 mapRes!10813))

(declare-fun b!243026 () Bool)

(assert (=> b!243026 (= e!157717 tp_is_empty!6375)))

(declare-fun mapNonEmpty!10813 () Bool)

(declare-fun tp!22765 () Bool)

(assert (=> mapNonEmpty!10813 (= mapRes!10813 (and tp!22765 e!157716))))

(declare-fun mapValue!10813 () ValueCell!2844)

(declare-fun mapRest!10813 () (Array (_ BitVec 32) ValueCell!2844))

(declare-fun mapKey!10813 () (_ BitVec 32))

(assert (=> mapNonEmpty!10813 (= mapRest!10807 (store mapRest!10813 mapKey!10813 mapValue!10813))))

(assert (= (and mapNonEmpty!10807 condMapEmpty!10813) mapIsEmpty!10813))

(assert (= (and mapNonEmpty!10807 (not condMapEmpty!10813)) mapNonEmpty!10813))

(assert (= (and mapNonEmpty!10813 ((_ is ValueCellFull!2844) mapValue!10813)) b!243025))

(assert (= (and mapNonEmpty!10807 ((_ is ValueCellFull!2844) mapDefault!10813)) b!243026))

(declare-fun m!261659 () Bool)

(assert (=> mapNonEmpty!10813 m!261659))

(declare-fun b_lambda!8005 () Bool)

(assert (= b_lambda!8003 (or (and b!242766 b_free!6513) b_lambda!8005)))

(check-sat (not d!60001) (not bm!22656) (not b!242970) (not b!242910) (not d!60025) (not b!242888) (not b!242901) (not b!242908) b_and!13495 (not d!60013) (not b!242994) (not d!60023) (not d!59999) (not b!242972) (not b!242895) (not b!242881) (not b_next!6513) (not b_lambda!8005) tp_is_empty!6375 (not b!242958) (not d!60017) (not b!242989) (not bm!22646) (not bm!22655) (not b!242954) (not d!60021) (not b!242990) (not bm!22649) (not b!242992) (not d!60007) (not b!242980) (not d!60011) (not bm!22647) (not b!242964) (not b!242973) (not b!242955) (not bm!22644) (not b!242988) (not b!242956) (not b!242981) (not mapNonEmpty!10813) (not d!60019))
(check-sat b_and!13495 (not b_next!6513))
