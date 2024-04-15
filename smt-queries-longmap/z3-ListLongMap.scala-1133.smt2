; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23298 () Bool)

(assert start!23298)

(declare-fun b!244778 () Bool)

(declare-fun b_free!6547 () Bool)

(declare-fun b_next!6547 () Bool)

(assert (=> b!244778 (= b_free!6547 (not b_next!6547))))

(declare-fun tp!22869 () Bool)

(declare-fun b_and!13507 () Bool)

(assert (=> b!244778 (= tp!22869 b_and!13507)))

(declare-fun res!120066 () Bool)

(declare-fun e!158795 () Bool)

(assert (=> start!23298 (=> (not res!120066) (not e!158795))))

(declare-datatypes ((V!8193 0))(
  ( (V!8194 (val!3249 Int)) )
))
(declare-datatypes ((ValueCell!2861 0))(
  ( (ValueCellFull!2861 (v!5294 V!8193)) (EmptyCell!2861) )
))
(declare-datatypes ((array!12105 0))(
  ( (array!12106 (arr!5745 (Array (_ BitVec 32) ValueCell!2861)) (size!6088 (_ BitVec 32))) )
))
(declare-datatypes ((array!12107 0))(
  ( (array!12108 (arr!5746 (Array (_ BitVec 32) (_ BitVec 64))) (size!6089 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3622 0))(
  ( (LongMapFixedSize!3623 (defaultEntry!4532 Int) (mask!10636 (_ BitVec 32)) (extraKeys!4269 (_ BitVec 32)) (zeroValue!4373 V!8193) (minValue!4373 V!8193) (_size!1860 (_ BitVec 32)) (_keys!6644 array!12107) (_values!4515 array!12105) (_vacant!1860 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3622)

(declare-fun valid!1429 (LongMapFixedSize!3622) Bool)

(assert (=> start!23298 (= res!120066 (valid!1429 thiss!1504))))

(assert (=> start!23298 e!158795))

(declare-fun e!158798 () Bool)

(assert (=> start!23298 e!158798))

(assert (=> start!23298 true))

(declare-fun b!244768 () Bool)

(declare-fun e!158805 () Bool)

(declare-fun tp_is_empty!6409 () Bool)

(assert (=> b!244768 (= e!158805 tp_is_empty!6409)))

(declare-fun mapIsEmpty!10870 () Bool)

(declare-fun mapRes!10870 () Bool)

(assert (=> mapIsEmpty!10870 mapRes!10870))

(declare-fun b!244769 () Bool)

(declare-fun e!158804 () Bool)

(declare-fun call!22820 () Bool)

(assert (=> b!244769 (= e!158804 (not call!22820))))

(declare-fun b!244770 () Bool)

(declare-fun res!120065 () Bool)

(declare-fun e!158803 () Bool)

(assert (=> b!244770 (=> (not res!120065) (not e!158803))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244770 (= res!120065 (validKeyInArray!0 key!932))))

(declare-fun b!244771 () Bool)

(declare-fun res!120062 () Bool)

(assert (=> b!244771 (=> (not res!120062) (not e!158803))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!244771 (= res!120062 (not (validKeyInArray!0 (select (arr!5746 (_keys!6644 thiss!1504)) index!297))))))

(declare-fun b!244772 () Bool)

(declare-fun e!158800 () Bool)

(assert (=> b!244772 (= e!158800 (and e!158805 mapRes!10870))))

(declare-fun condMapEmpty!10870 () Bool)

(declare-fun mapDefault!10870 () ValueCell!2861)

(assert (=> b!244772 (= condMapEmpty!10870 (= (arr!5745 (_values!4515 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2861)) mapDefault!10870)))))

(declare-fun b!244773 () Bool)

(declare-fun e!158802 () Bool)

(declare-datatypes ((SeekEntryResult!1083 0))(
  ( (MissingZero!1083 (index!6502 (_ BitVec 32))) (Found!1083 (index!6503 (_ BitVec 32))) (Intermediate!1083 (undefined!1895 Bool) (index!6504 (_ BitVec 32)) (x!24394 (_ BitVec 32))) (Undefined!1083) (MissingVacant!1083 (index!6505 (_ BitVec 32))) )
))
(declare-fun lt!122487 () SeekEntryResult!1083)

(get-info :version)

(assert (=> b!244773 (= e!158802 ((_ is Undefined!1083) lt!122487))))

(declare-fun b!244774 () Bool)

(declare-fun res!120058 () Bool)

(assert (=> b!244774 (=> (not res!120058) (not e!158804))))

(assert (=> b!244774 (= res!120058 (= (select (arr!5746 (_keys!6644 thiss!1504)) (index!6502 lt!122487)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244775 () Bool)

(assert (=> b!244775 (= e!158803 (bvslt (size!6089 (_keys!6644 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!244776 () Bool)

(declare-datatypes ((Unit!7551 0))(
  ( (Unit!7552) )
))
(declare-fun e!158794 () Unit!7551)

(declare-fun Unit!7553 () Unit!7551)

(assert (=> b!244776 (= e!158794 Unit!7553)))

(declare-fun lt!122488 () Unit!7551)

(declare-fun lemmaArrayContainsKeyThenInListMap!182 (array!12107 array!12105 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 64) (_ BitVec 32) Int) Unit!7551)

(assert (=> b!244776 (= lt!122488 (lemmaArrayContainsKeyThenInListMap!182 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(assert (=> b!244776 false))

(declare-fun b!244777 () Bool)

(declare-fun e!158807 () Bool)

(assert (=> b!244777 (= e!158795 e!158807)))

(declare-fun res!120060 () Bool)

(assert (=> b!244777 (=> (not res!120060) (not e!158807))))

(assert (=> b!244777 (= res!120060 (or (= lt!122487 (MissingZero!1083 index!297)) (= lt!122487 (MissingVacant!1083 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12107 (_ BitVec 32)) SeekEntryResult!1083)

(assert (=> b!244777 (= lt!122487 (seekEntryOrOpen!0 key!932 (_keys!6644 thiss!1504) (mask!10636 thiss!1504)))))

(declare-fun array_inv!3791 (array!12107) Bool)

(declare-fun array_inv!3792 (array!12105) Bool)

(assert (=> b!244778 (= e!158798 (and tp!22869 tp_is_empty!6409 (array_inv!3791 (_keys!6644 thiss!1504)) (array_inv!3792 (_values!4515 thiss!1504)) e!158800))))

(declare-fun b!244779 () Bool)

(declare-fun e!158793 () Bool)

(assert (=> b!244779 (= e!158807 e!158793)))

(declare-fun res!120057 () Bool)

(assert (=> b!244779 (=> (not res!120057) (not e!158793))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244779 (= res!120057 (inRange!0 index!297 (mask!10636 thiss!1504)))))

(declare-fun lt!122483 () Unit!7551)

(declare-fun e!158801 () Unit!7551)

(assert (=> b!244779 (= lt!122483 e!158801)))

(declare-fun c!40849 () Bool)

(declare-datatypes ((tuple2!4750 0))(
  ( (tuple2!4751 (_1!2386 (_ BitVec 64)) (_2!2386 V!8193)) )
))
(declare-datatypes ((List!3652 0))(
  ( (Nil!3649) (Cons!3648 (h!4305 tuple2!4750) (t!8654 List!3652)) )
))
(declare-datatypes ((ListLongMap!3653 0))(
  ( (ListLongMap!3654 (toList!1842 List!3652)) )
))
(declare-fun contains!1754 (ListLongMap!3653 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1351 (array!12107 array!12105 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 32) Int) ListLongMap!3653)

(assert (=> b!244779 (= c!40849 (contains!1754 (getCurrentListMap!1351 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10870 () Bool)

(declare-fun tp!22870 () Bool)

(declare-fun e!158796 () Bool)

(assert (=> mapNonEmpty!10870 (= mapRes!10870 (and tp!22870 e!158796))))

(declare-fun mapValue!10870 () ValueCell!2861)

(declare-fun mapKey!10870 () (_ BitVec 32))

(declare-fun mapRest!10870 () (Array (_ BitVec 32) ValueCell!2861))

(assert (=> mapNonEmpty!10870 (= (arr!5745 (_values!4515 thiss!1504)) (store mapRest!10870 mapKey!10870 mapValue!10870))))

(declare-fun b!244780 () Bool)

(declare-fun Unit!7554 () Unit!7551)

(assert (=> b!244780 (= e!158794 Unit!7554)))

(declare-fun b!244781 () Bool)

(declare-fun res!120059 () Bool)

(assert (=> b!244781 (=> (not res!120059) (not e!158804))))

(declare-fun call!22821 () Bool)

(assert (=> b!244781 (= res!120059 call!22821)))

(declare-fun e!158806 () Bool)

(assert (=> b!244781 (= e!158806 e!158804)))

(declare-fun b!244782 () Bool)

(declare-fun e!158799 () Bool)

(assert (=> b!244782 (= e!158802 e!158799)))

(declare-fun res!120064 () Bool)

(assert (=> b!244782 (= res!120064 call!22821)))

(assert (=> b!244782 (=> (not res!120064) (not e!158799))))

(declare-fun b!244783 () Bool)

(declare-fun res!120063 () Bool)

(assert (=> b!244783 (= res!120063 (= (select (arr!5746 (_keys!6644 thiss!1504)) (index!6505 lt!122487)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244783 (=> (not res!120063) (not e!158799))))

(declare-fun b!244784 () Bool)

(assert (=> b!244784 (= e!158793 (not e!158803))))

(declare-fun res!120067 () Bool)

(assert (=> b!244784 (=> (not res!120067) (not e!158803))))

(assert (=> b!244784 (= res!120067 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6089 (_keys!6644 thiss!1504)))))))

(declare-datatypes ((List!3653 0))(
  ( (Nil!3650) (Cons!3649 (h!4306 (_ BitVec 64)) (t!8655 List!3653)) )
))
(declare-fun arrayNoDuplicates!0 (array!12107 (_ BitVec 32) List!3653) Bool)

(assert (=> b!244784 (arrayNoDuplicates!0 (array!12108 (store (arr!5746 (_keys!6644 thiss!1504)) index!297 key!932) (size!6089 (_keys!6644 thiss!1504))) #b00000000000000000000000000000000 Nil!3650)))

(declare-fun lt!122484 () Unit!7551)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12107 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3653) Unit!7551)

(assert (=> b!244784 (= lt!122484 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6644 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3650))))

(declare-fun lt!122482 () Unit!7551)

(assert (=> b!244784 (= lt!122482 e!158794)))

(declare-fun c!40847 () Bool)

(declare-fun arrayContainsKey!0 (array!12107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!244784 (= c!40847 (arrayContainsKey!0 (_keys!6644 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244785 () Bool)

(assert (=> b!244785 (= e!158799 (not call!22820))))

(declare-fun b!244786 () Bool)

(declare-fun res!120061 () Bool)

(assert (=> b!244786 (=> (not res!120061) (not e!158795))))

(assert (=> b!244786 (= res!120061 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!244787 () Bool)

(declare-fun c!40848 () Bool)

(assert (=> b!244787 (= c!40848 ((_ is MissingVacant!1083) lt!122487))))

(assert (=> b!244787 (= e!158806 e!158802)))

(declare-fun c!40846 () Bool)

(declare-fun bm!22817 () Bool)

(assert (=> bm!22817 (= call!22821 (inRange!0 (ite c!40846 (index!6502 lt!122487) (index!6505 lt!122487)) (mask!10636 thiss!1504)))))

(declare-fun bm!22818 () Bool)

(assert (=> bm!22818 (= call!22820 (arrayContainsKey!0 (_keys!6644 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244788 () Bool)

(assert (=> b!244788 (= e!158796 tp_is_empty!6409)))

(declare-fun b!244789 () Bool)

(declare-fun lt!122486 () Unit!7551)

(assert (=> b!244789 (= e!158801 lt!122486)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!371 (array!12107 array!12105 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 64) Int) Unit!7551)

(assert (=> b!244789 (= lt!122486 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!371 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 (defaultEntry!4532 thiss!1504)))))

(assert (=> b!244789 (= c!40846 ((_ is MissingZero!1083) lt!122487))))

(assert (=> b!244789 e!158806))

(declare-fun b!244790 () Bool)

(declare-fun Unit!7555 () Unit!7551)

(assert (=> b!244790 (= e!158801 Unit!7555)))

(declare-fun lt!122485 () Unit!7551)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!374 (array!12107 array!12105 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 64) Int) Unit!7551)

(assert (=> b!244790 (= lt!122485 (lemmaInListMapThenSeekEntryOrOpenFindsIt!374 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 (defaultEntry!4532 thiss!1504)))))

(assert (=> b!244790 false))

(assert (= (and start!23298 res!120066) b!244786))

(assert (= (and b!244786 res!120061) b!244777))

(assert (= (and b!244777 res!120060) b!244779))

(assert (= (and b!244779 c!40849) b!244790))

(assert (= (and b!244779 (not c!40849)) b!244789))

(assert (= (and b!244789 c!40846) b!244781))

(assert (= (and b!244789 (not c!40846)) b!244787))

(assert (= (and b!244781 res!120059) b!244774))

(assert (= (and b!244774 res!120058) b!244769))

(assert (= (and b!244787 c!40848) b!244782))

(assert (= (and b!244787 (not c!40848)) b!244773))

(assert (= (and b!244782 res!120064) b!244783))

(assert (= (and b!244783 res!120063) b!244785))

(assert (= (or b!244781 b!244782) bm!22817))

(assert (= (or b!244769 b!244785) bm!22818))

(assert (= (and b!244779 res!120057) b!244784))

(assert (= (and b!244784 c!40847) b!244776))

(assert (= (and b!244784 (not c!40847)) b!244780))

(assert (= (and b!244784 res!120067) b!244771))

(assert (= (and b!244771 res!120062) b!244770))

(assert (= (and b!244770 res!120065) b!244775))

(assert (= (and b!244772 condMapEmpty!10870) mapIsEmpty!10870))

(assert (= (and b!244772 (not condMapEmpty!10870)) mapNonEmpty!10870))

(assert (= (and mapNonEmpty!10870 ((_ is ValueCellFull!2861) mapValue!10870)) b!244788))

(assert (= (and b!244772 ((_ is ValueCellFull!2861) mapDefault!10870)) b!244768))

(assert (= b!244778 b!244772))

(assert (= start!23298 b!244778))

(declare-fun m!262047 () Bool)

(assert (=> mapNonEmpty!10870 m!262047))

(declare-fun m!262049 () Bool)

(assert (=> b!244789 m!262049))

(declare-fun m!262051 () Bool)

(assert (=> b!244779 m!262051))

(declare-fun m!262053 () Bool)

(assert (=> b!244779 m!262053))

(assert (=> b!244779 m!262053))

(declare-fun m!262055 () Bool)

(assert (=> b!244779 m!262055))

(declare-fun m!262057 () Bool)

(assert (=> bm!22818 m!262057))

(declare-fun m!262059 () Bool)

(assert (=> bm!22817 m!262059))

(declare-fun m!262061 () Bool)

(assert (=> b!244774 m!262061))

(declare-fun m!262063 () Bool)

(assert (=> b!244777 m!262063))

(declare-fun m!262065 () Bool)

(assert (=> b!244778 m!262065))

(declare-fun m!262067 () Bool)

(assert (=> b!244778 m!262067))

(declare-fun m!262069 () Bool)

(assert (=> b!244784 m!262069))

(declare-fun m!262071 () Bool)

(assert (=> b!244784 m!262071))

(declare-fun m!262073 () Bool)

(assert (=> b!244784 m!262073))

(assert (=> b!244784 m!262057))

(declare-fun m!262075 () Bool)

(assert (=> b!244776 m!262075))

(declare-fun m!262077 () Bool)

(assert (=> start!23298 m!262077))

(declare-fun m!262079 () Bool)

(assert (=> b!244783 m!262079))

(declare-fun m!262081 () Bool)

(assert (=> b!244771 m!262081))

(assert (=> b!244771 m!262081))

(declare-fun m!262083 () Bool)

(assert (=> b!244771 m!262083))

(declare-fun m!262085 () Bool)

(assert (=> b!244790 m!262085))

(declare-fun m!262087 () Bool)

(assert (=> b!244770 m!262087))

(check-sat (not b!244784) (not b!244779) (not bm!22817) (not start!23298) (not b_next!6547) (not b!244778) (not b!244770) (not b!244777) tp_is_empty!6409 (not b!244789) (not b!244776) (not b!244771) b_and!13507 (not bm!22818) (not b!244790) (not mapNonEmpty!10870))
(check-sat b_and!13507 (not b_next!6547))
(get-model)

(declare-fun d!59999 () Bool)

(declare-fun e!158900 () Bool)

(assert (=> d!59999 e!158900))

(declare-fun res!120139 () Bool)

(assert (=> d!59999 (=> (not res!120139) (not e!158900))))

(declare-fun lt!122536 () SeekEntryResult!1083)

(assert (=> d!59999 (= res!120139 ((_ is Found!1083) lt!122536))))

(assert (=> d!59999 (= lt!122536 (seekEntryOrOpen!0 key!932 (_keys!6644 thiss!1504) (mask!10636 thiss!1504)))))

(declare-fun lt!122535 () Unit!7551)

(declare-fun choose!1150 (array!12107 array!12105 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 64) Int) Unit!7551)

(assert (=> d!59999 (= lt!122535 (choose!1150 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 (defaultEntry!4532 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59999 (validMask!0 (mask!10636 thiss!1504))))

(assert (=> d!59999 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!374 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 (defaultEntry!4532 thiss!1504)) lt!122535)))

(declare-fun b!244933 () Bool)

(declare-fun res!120138 () Bool)

(assert (=> b!244933 (=> (not res!120138) (not e!158900))))

(assert (=> b!244933 (= res!120138 (inRange!0 (index!6503 lt!122536) (mask!10636 thiss!1504)))))

(declare-fun b!244934 () Bool)

(assert (=> b!244934 (= e!158900 (= (select (arr!5746 (_keys!6644 thiss!1504)) (index!6503 lt!122536)) key!932))))

(assert (=> b!244934 (and (bvsge (index!6503 lt!122536) #b00000000000000000000000000000000) (bvslt (index!6503 lt!122536) (size!6089 (_keys!6644 thiss!1504))))))

(assert (= (and d!59999 res!120139) b!244933))

(assert (= (and b!244933 res!120138) b!244934))

(assert (=> d!59999 m!262063))

(declare-fun m!262173 () Bool)

(assert (=> d!59999 m!262173))

(declare-fun m!262175 () Bool)

(assert (=> d!59999 m!262175))

(declare-fun m!262177 () Bool)

(assert (=> b!244933 m!262177))

(declare-fun m!262179 () Bool)

(assert (=> b!244934 m!262179))

(assert (=> b!244790 d!59999))

(declare-fun d!60001 () Bool)

(declare-fun res!120146 () Bool)

(declare-fun e!158903 () Bool)

(assert (=> d!60001 (=> (not res!120146) (not e!158903))))

(declare-fun simpleValid!252 (LongMapFixedSize!3622) Bool)

(assert (=> d!60001 (= res!120146 (simpleValid!252 thiss!1504))))

(assert (=> d!60001 (= (valid!1429 thiss!1504) e!158903)))

(declare-fun b!244941 () Bool)

(declare-fun res!120147 () Bool)

(assert (=> b!244941 (=> (not res!120147) (not e!158903))))

(declare-fun arrayCountValidKeys!0 (array!12107 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!244941 (= res!120147 (= (arrayCountValidKeys!0 (_keys!6644 thiss!1504) #b00000000000000000000000000000000 (size!6089 (_keys!6644 thiss!1504))) (_size!1860 thiss!1504)))))

(declare-fun b!244942 () Bool)

(declare-fun res!120148 () Bool)

(assert (=> b!244942 (=> (not res!120148) (not e!158903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12107 (_ BitVec 32)) Bool)

(assert (=> b!244942 (= res!120148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6644 thiss!1504) (mask!10636 thiss!1504)))))

(declare-fun b!244943 () Bool)

(assert (=> b!244943 (= e!158903 (arrayNoDuplicates!0 (_keys!6644 thiss!1504) #b00000000000000000000000000000000 Nil!3650))))

(assert (= (and d!60001 res!120146) b!244941))

(assert (= (and b!244941 res!120147) b!244942))

(assert (= (and b!244942 res!120148) b!244943))

(declare-fun m!262181 () Bool)

(assert (=> d!60001 m!262181))

(declare-fun m!262183 () Bool)

(assert (=> b!244941 m!262183))

(declare-fun m!262185 () Bool)

(assert (=> b!244942 m!262185))

(declare-fun m!262187 () Bool)

(assert (=> b!244943 m!262187))

(assert (=> start!23298 d!60001))

(declare-fun d!60003 () Bool)

(assert (=> d!60003 (contains!1754 (getCurrentListMap!1351 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)) key!932)))

(declare-fun lt!122539 () Unit!7551)

(declare-fun choose!1151 (array!12107 array!12105 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 64) (_ BitVec 32) Int) Unit!7551)

(assert (=> d!60003 (= lt!122539 (choose!1151 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(assert (=> d!60003 (validMask!0 (mask!10636 thiss!1504))))

(assert (=> d!60003 (= (lemmaArrayContainsKeyThenInListMap!182 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)) lt!122539)))

(declare-fun bs!8862 () Bool)

(assert (= bs!8862 d!60003))

(assert (=> bs!8862 m!262053))

(assert (=> bs!8862 m!262053))

(assert (=> bs!8862 m!262055))

(declare-fun m!262189 () Bool)

(assert (=> bs!8862 m!262189))

(assert (=> bs!8862 m!262175))

(assert (=> b!244776 d!60003))

(declare-fun call!22836 () Bool)

(declare-fun c!40876 () Bool)

(declare-fun bm!22833 () Bool)

(assert (=> bm!22833 (= call!22836 (arrayNoDuplicates!0 (array!12108 (store (arr!5746 (_keys!6644 thiss!1504)) index!297 key!932) (size!6089 (_keys!6644 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40876 (Cons!3649 (select (arr!5746 (array!12108 (store (arr!5746 (_keys!6644 thiss!1504)) index!297 key!932) (size!6089 (_keys!6644 thiss!1504)))) #b00000000000000000000000000000000) Nil!3650) Nil!3650)))))

(declare-fun b!244954 () Bool)

(declare-fun e!158912 () Bool)

(assert (=> b!244954 (= e!158912 call!22836)))

(declare-fun b!244955 () Bool)

(assert (=> b!244955 (= e!158912 call!22836)))

(declare-fun b!244956 () Bool)

(declare-fun e!158913 () Bool)

(assert (=> b!244956 (= e!158913 e!158912)))

(assert (=> b!244956 (= c!40876 (validKeyInArray!0 (select (arr!5746 (array!12108 (store (arr!5746 (_keys!6644 thiss!1504)) index!297 key!932) (size!6089 (_keys!6644 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!158915 () Bool)

(declare-fun b!244957 () Bool)

(declare-fun contains!1756 (List!3653 (_ BitVec 64)) Bool)

(assert (=> b!244957 (= e!158915 (contains!1756 Nil!3650 (select (arr!5746 (array!12108 (store (arr!5746 (_keys!6644 thiss!1504)) index!297 key!932) (size!6089 (_keys!6644 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!244958 () Bool)

(declare-fun e!158914 () Bool)

(assert (=> b!244958 (= e!158914 e!158913)))

(declare-fun res!120156 () Bool)

(assert (=> b!244958 (=> (not res!120156) (not e!158913))))

(assert (=> b!244958 (= res!120156 (not e!158915))))

(declare-fun res!120157 () Bool)

(assert (=> b!244958 (=> (not res!120157) (not e!158915))))

(assert (=> b!244958 (= res!120157 (validKeyInArray!0 (select (arr!5746 (array!12108 (store (arr!5746 (_keys!6644 thiss!1504)) index!297 key!932) (size!6089 (_keys!6644 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!60005 () Bool)

(declare-fun res!120155 () Bool)

(assert (=> d!60005 (=> res!120155 e!158914)))

(assert (=> d!60005 (= res!120155 (bvsge #b00000000000000000000000000000000 (size!6089 (array!12108 (store (arr!5746 (_keys!6644 thiss!1504)) index!297 key!932) (size!6089 (_keys!6644 thiss!1504))))))))

(assert (=> d!60005 (= (arrayNoDuplicates!0 (array!12108 (store (arr!5746 (_keys!6644 thiss!1504)) index!297 key!932) (size!6089 (_keys!6644 thiss!1504))) #b00000000000000000000000000000000 Nil!3650) e!158914)))

(assert (= (and d!60005 (not res!120155)) b!244958))

(assert (= (and b!244958 res!120157) b!244957))

(assert (= (and b!244958 res!120156) b!244956))

(assert (= (and b!244956 c!40876) b!244955))

(assert (= (and b!244956 (not c!40876)) b!244954))

(assert (= (or b!244955 b!244954) bm!22833))

(declare-fun m!262191 () Bool)

(assert (=> bm!22833 m!262191))

(declare-fun m!262193 () Bool)

(assert (=> bm!22833 m!262193))

(assert (=> b!244956 m!262191))

(assert (=> b!244956 m!262191))

(declare-fun m!262195 () Bool)

(assert (=> b!244956 m!262195))

(assert (=> b!244957 m!262191))

(assert (=> b!244957 m!262191))

(declare-fun m!262197 () Bool)

(assert (=> b!244957 m!262197))

(assert (=> b!244958 m!262191))

(assert (=> b!244958 m!262191))

(assert (=> b!244958 m!262195))

(assert (=> b!244784 d!60005))

(declare-fun d!60007 () Bool)

(declare-fun e!158918 () Bool)

(assert (=> d!60007 e!158918))

(declare-fun res!120160 () Bool)

(assert (=> d!60007 (=> (not res!120160) (not e!158918))))

(assert (=> d!60007 (= res!120160 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6089 (_keys!6644 thiss!1504)))))))

(declare-fun lt!122542 () Unit!7551)

(declare-fun choose!41 (array!12107 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3653) Unit!7551)

(assert (=> d!60007 (= lt!122542 (choose!41 (_keys!6644 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3650))))

(assert (=> d!60007 (bvslt (size!6089 (_keys!6644 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60007 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6644 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3650) lt!122542)))

(declare-fun b!244961 () Bool)

(assert (=> b!244961 (= e!158918 (arrayNoDuplicates!0 (array!12108 (store (arr!5746 (_keys!6644 thiss!1504)) index!297 key!932) (size!6089 (_keys!6644 thiss!1504))) #b00000000000000000000000000000000 Nil!3650))))

(assert (= (and d!60007 res!120160) b!244961))

(declare-fun m!262199 () Bool)

(assert (=> d!60007 m!262199))

(assert (=> b!244961 m!262069))

(assert (=> b!244961 m!262071))

(assert (=> b!244784 d!60007))

(declare-fun d!60009 () Bool)

(declare-fun res!120165 () Bool)

(declare-fun e!158923 () Bool)

(assert (=> d!60009 (=> res!120165 e!158923)))

(assert (=> d!60009 (= res!120165 (= (select (arr!5746 (_keys!6644 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60009 (= (arrayContainsKey!0 (_keys!6644 thiss!1504) key!932 #b00000000000000000000000000000000) e!158923)))

(declare-fun b!244966 () Bool)

(declare-fun e!158924 () Bool)

(assert (=> b!244966 (= e!158923 e!158924)))

(declare-fun res!120166 () Bool)

(assert (=> b!244966 (=> (not res!120166) (not e!158924))))

(assert (=> b!244966 (= res!120166 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6089 (_keys!6644 thiss!1504))))))

(declare-fun b!244967 () Bool)

(assert (=> b!244967 (= e!158924 (arrayContainsKey!0 (_keys!6644 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60009 (not res!120165)) b!244966))

(assert (= (and b!244966 res!120166) b!244967))

(declare-fun m!262201 () Bool)

(assert (=> d!60009 m!262201))

(declare-fun m!262203 () Bool)

(assert (=> b!244967 m!262203))

(assert (=> b!244784 d!60009))

(declare-fun d!60011 () Bool)

(assert (=> d!60011 (= (array_inv!3791 (_keys!6644 thiss!1504)) (bvsge (size!6089 (_keys!6644 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244778 d!60011))

(declare-fun d!60013 () Bool)

(assert (=> d!60013 (= (array_inv!3792 (_values!4515 thiss!1504)) (bvsge (size!6088 (_values!4515 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244778 d!60013))

(declare-fun d!60015 () Bool)

(assert (=> d!60015 (= (inRange!0 (ite c!40846 (index!6502 lt!122487) (index!6505 lt!122487)) (mask!10636 thiss!1504)) (and (bvsge (ite c!40846 (index!6502 lt!122487) (index!6505 lt!122487)) #b00000000000000000000000000000000) (bvslt (ite c!40846 (index!6502 lt!122487) (index!6505 lt!122487)) (bvadd (mask!10636 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22817 d!60015))

(declare-fun d!60017 () Bool)

(assert (=> d!60017 (= (inRange!0 index!297 (mask!10636 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10636 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!244779 d!60017))

(declare-fun d!60019 () Bool)

(declare-fun e!158930 () Bool)

(assert (=> d!60019 e!158930))

(declare-fun res!120169 () Bool)

(assert (=> d!60019 (=> res!120169 e!158930)))

(declare-fun lt!122551 () Bool)

(assert (=> d!60019 (= res!120169 (not lt!122551))))

(declare-fun lt!122552 () Bool)

(assert (=> d!60019 (= lt!122551 lt!122552)))

(declare-fun lt!122554 () Unit!7551)

(declare-fun e!158929 () Unit!7551)

(assert (=> d!60019 (= lt!122554 e!158929)))

(declare-fun c!40879 () Bool)

(assert (=> d!60019 (= c!40879 lt!122552)))

(declare-fun containsKey!277 (List!3652 (_ BitVec 64)) Bool)

(assert (=> d!60019 (= lt!122552 (containsKey!277 (toList!1842 (getCurrentListMap!1351 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504))) key!932))))

(assert (=> d!60019 (= (contains!1754 (getCurrentListMap!1351 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)) key!932) lt!122551)))

(declare-fun b!244974 () Bool)

(declare-fun lt!122553 () Unit!7551)

(assert (=> b!244974 (= e!158929 lt!122553)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!226 (List!3652 (_ BitVec 64)) Unit!7551)

(assert (=> b!244974 (= lt!122553 (lemmaContainsKeyImpliesGetValueByKeyDefined!226 (toList!1842 (getCurrentListMap!1351 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504))) key!932))))

(declare-datatypes ((Option!291 0))(
  ( (Some!290 (v!5297 V!8193)) (None!289) )
))
(declare-fun isDefined!227 (Option!291) Bool)

(declare-fun getValueByKey!285 (List!3652 (_ BitVec 64)) Option!291)

(assert (=> b!244974 (isDefined!227 (getValueByKey!285 (toList!1842 (getCurrentListMap!1351 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504))) key!932))))

(declare-fun b!244975 () Bool)

(declare-fun Unit!7564 () Unit!7551)

(assert (=> b!244975 (= e!158929 Unit!7564)))

(declare-fun b!244976 () Bool)

(assert (=> b!244976 (= e!158930 (isDefined!227 (getValueByKey!285 (toList!1842 (getCurrentListMap!1351 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504))) key!932)))))

(assert (= (and d!60019 c!40879) b!244974))

(assert (= (and d!60019 (not c!40879)) b!244975))

(assert (= (and d!60019 (not res!120169)) b!244976))

(declare-fun m!262205 () Bool)

(assert (=> d!60019 m!262205))

(declare-fun m!262207 () Bool)

(assert (=> b!244974 m!262207))

(declare-fun m!262209 () Bool)

(assert (=> b!244974 m!262209))

(assert (=> b!244974 m!262209))

(declare-fun m!262211 () Bool)

(assert (=> b!244974 m!262211))

(assert (=> b!244976 m!262209))

(assert (=> b!244976 m!262209))

(assert (=> b!244976 m!262211))

(assert (=> b!244779 d!60019))

(declare-fun bm!22848 () Bool)

(declare-fun call!22855 () ListLongMap!3653)

(declare-fun call!22853 () ListLongMap!3653)

(assert (=> bm!22848 (= call!22855 call!22853)))

(declare-fun bm!22849 () Bool)

(declare-fun call!22852 () ListLongMap!3653)

(declare-fun getCurrentListMapNoExtraKeys!545 (array!12107 array!12105 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 32) Int) ListLongMap!3653)

(assert (=> bm!22849 (= call!22852 (getCurrentListMapNoExtraKeys!545 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(declare-fun b!245019 () Bool)

(declare-fun e!158962 () Bool)

(assert (=> b!245019 (= e!158962 (validKeyInArray!0 (select (arr!5746 (_keys!6644 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245020 () Bool)

(declare-fun res!120193 () Bool)

(declare-fun e!158969 () Bool)

(assert (=> b!245020 (=> (not res!120193) (not e!158969))))

(declare-fun e!158967 () Bool)

(assert (=> b!245020 (= res!120193 e!158967)))

(declare-fun c!40892 () Bool)

(assert (=> b!245020 (= c!40892 (not (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!245021 () Bool)

(declare-fun e!158965 () ListLongMap!3653)

(declare-fun e!158966 () ListLongMap!3653)

(assert (=> b!245021 (= e!158965 e!158966)))

(declare-fun c!40894 () Bool)

(assert (=> b!245021 (= c!40894 (and (not (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!245022 () Bool)

(declare-fun e!158959 () Unit!7551)

(declare-fun lt!122609 () Unit!7551)

(assert (=> b!245022 (= e!158959 lt!122609)))

(declare-fun lt!122610 () ListLongMap!3653)

(assert (=> b!245022 (= lt!122610 (getCurrentListMapNoExtraKeys!545 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(declare-fun lt!122614 () (_ BitVec 64))

(assert (=> b!245022 (= lt!122614 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122611 () (_ BitVec 64))

(assert (=> b!245022 (= lt!122611 (select (arr!5746 (_keys!6644 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122607 () Unit!7551)

(declare-fun addStillContains!205 (ListLongMap!3653 (_ BitVec 64) V!8193 (_ BitVec 64)) Unit!7551)

(assert (=> b!245022 (= lt!122607 (addStillContains!205 lt!122610 lt!122614 (zeroValue!4373 thiss!1504) lt!122611))))

(declare-fun +!662 (ListLongMap!3653 tuple2!4750) ListLongMap!3653)

(assert (=> b!245022 (contains!1754 (+!662 lt!122610 (tuple2!4751 lt!122614 (zeroValue!4373 thiss!1504))) lt!122611)))

(declare-fun lt!122604 () Unit!7551)

(assert (=> b!245022 (= lt!122604 lt!122607)))

(declare-fun lt!122620 () ListLongMap!3653)

(assert (=> b!245022 (= lt!122620 (getCurrentListMapNoExtraKeys!545 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(declare-fun lt!122616 () (_ BitVec 64))

(assert (=> b!245022 (= lt!122616 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122606 () (_ BitVec 64))

(assert (=> b!245022 (= lt!122606 (select (arr!5746 (_keys!6644 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122613 () Unit!7551)

(declare-fun addApplyDifferent!205 (ListLongMap!3653 (_ BitVec 64) V!8193 (_ BitVec 64)) Unit!7551)

(assert (=> b!245022 (= lt!122613 (addApplyDifferent!205 lt!122620 lt!122616 (minValue!4373 thiss!1504) lt!122606))))

(declare-fun apply!229 (ListLongMap!3653 (_ BitVec 64)) V!8193)

(assert (=> b!245022 (= (apply!229 (+!662 lt!122620 (tuple2!4751 lt!122616 (minValue!4373 thiss!1504))) lt!122606) (apply!229 lt!122620 lt!122606))))

(declare-fun lt!122605 () Unit!7551)

(assert (=> b!245022 (= lt!122605 lt!122613)))

(declare-fun lt!122608 () ListLongMap!3653)

(assert (=> b!245022 (= lt!122608 (getCurrentListMapNoExtraKeys!545 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(declare-fun lt!122619 () (_ BitVec 64))

(assert (=> b!245022 (= lt!122619 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122600 () (_ BitVec 64))

(assert (=> b!245022 (= lt!122600 (select (arr!5746 (_keys!6644 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122617 () Unit!7551)

(assert (=> b!245022 (= lt!122617 (addApplyDifferent!205 lt!122608 lt!122619 (zeroValue!4373 thiss!1504) lt!122600))))

(assert (=> b!245022 (= (apply!229 (+!662 lt!122608 (tuple2!4751 lt!122619 (zeroValue!4373 thiss!1504))) lt!122600) (apply!229 lt!122608 lt!122600))))

(declare-fun lt!122615 () Unit!7551)

(assert (=> b!245022 (= lt!122615 lt!122617)))

(declare-fun lt!122612 () ListLongMap!3653)

(assert (=> b!245022 (= lt!122612 (getCurrentListMapNoExtraKeys!545 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(declare-fun lt!122618 () (_ BitVec 64))

(assert (=> b!245022 (= lt!122618 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122603 () (_ BitVec 64))

(assert (=> b!245022 (= lt!122603 (select (arr!5746 (_keys!6644 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245022 (= lt!122609 (addApplyDifferent!205 lt!122612 lt!122618 (minValue!4373 thiss!1504) lt!122603))))

(assert (=> b!245022 (= (apply!229 (+!662 lt!122612 (tuple2!4751 lt!122618 (minValue!4373 thiss!1504))) lt!122603) (apply!229 lt!122612 lt!122603))))

(declare-fun b!245023 () Bool)

(declare-fun call!22857 () Bool)

(assert (=> b!245023 (= e!158967 (not call!22857))))

(declare-fun b!245024 () Bool)

(declare-fun e!158963 () ListLongMap!3653)

(assert (=> b!245024 (= e!158963 call!22855)))

(declare-fun b!245025 () Bool)

(declare-fun e!158958 () Bool)

(declare-fun lt!122599 () ListLongMap!3653)

(declare-fun get!2945 (ValueCell!2861 V!8193) V!8193)

(declare-fun dynLambda!563 (Int (_ BitVec 64)) V!8193)

(assert (=> b!245025 (= e!158958 (= (apply!229 lt!122599 (select (arr!5746 (_keys!6644 thiss!1504)) #b00000000000000000000000000000000)) (get!2945 (select (arr!5745 (_values!4515 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!563 (defaultEntry!4532 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6088 (_values!4515 thiss!1504))))))

(assert (=> b!245025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6089 (_keys!6644 thiss!1504))))))

(declare-fun b!245026 () Bool)

(assert (=> b!245026 (= e!158966 call!22855)))

(declare-fun b!245027 () Bool)

(declare-fun res!120194 () Bool)

(assert (=> b!245027 (=> (not res!120194) (not e!158969))))

(declare-fun e!158964 () Bool)

(assert (=> b!245027 (= res!120194 e!158964)))

(declare-fun res!120195 () Bool)

(assert (=> b!245027 (=> res!120195 e!158964)))

(declare-fun e!158957 () Bool)

(assert (=> b!245027 (= res!120195 (not e!158957))))

(declare-fun res!120190 () Bool)

(assert (=> b!245027 (=> (not res!120190) (not e!158957))))

(assert (=> b!245027 (= res!120190 (bvslt #b00000000000000000000000000000000 (size!6089 (_keys!6644 thiss!1504))))))

(declare-fun b!245028 () Bool)

(assert (=> b!245028 (= e!158957 (validKeyInArray!0 (select (arr!5746 (_keys!6644 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22850 () Bool)

(assert (=> bm!22850 (= call!22857 (contains!1754 lt!122599 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22851 () Bool)

(declare-fun call!22854 () ListLongMap!3653)

(declare-fun call!22851 () ListLongMap!3653)

(assert (=> bm!22851 (= call!22854 call!22851)))

(declare-fun b!245029 () Bool)

(declare-fun e!158961 () Bool)

(declare-fun e!158960 () Bool)

(assert (=> b!245029 (= e!158961 e!158960)))

(declare-fun res!120192 () Bool)

(declare-fun call!22856 () Bool)

(assert (=> b!245029 (= res!120192 call!22856)))

(assert (=> b!245029 (=> (not res!120192) (not e!158960))))

(declare-fun b!245031 () Bool)

(assert (=> b!245031 (= e!158965 (+!662 call!22853 (tuple2!4751 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4373 thiss!1504))))))

(declare-fun b!245032 () Bool)

(assert (=> b!245032 (= e!158963 call!22854)))

(declare-fun b!245033 () Bool)

(declare-fun e!158968 () Bool)

(assert (=> b!245033 (= e!158968 (= (apply!229 lt!122599 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4373 thiss!1504)))))

(declare-fun b!245034 () Bool)

(declare-fun c!40893 () Bool)

(assert (=> b!245034 (= c!40893 (and (not (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!245034 (= e!158966 e!158963)))

(declare-fun bm!22852 () Bool)

(assert (=> bm!22852 (= call!22851 call!22852)))

(declare-fun b!245035 () Bool)

(assert (=> b!245035 (= e!158967 e!158968)))

(declare-fun res!120189 () Bool)

(assert (=> b!245035 (= res!120189 call!22857)))

(assert (=> b!245035 (=> (not res!120189) (not e!158968))))

(declare-fun d!60021 () Bool)

(assert (=> d!60021 e!158969))

(declare-fun res!120191 () Bool)

(assert (=> d!60021 (=> (not res!120191) (not e!158969))))

(assert (=> d!60021 (= res!120191 (or (bvsge #b00000000000000000000000000000000 (size!6089 (_keys!6644 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6089 (_keys!6644 thiss!1504))))))))

(declare-fun lt!122602 () ListLongMap!3653)

(assert (=> d!60021 (= lt!122599 lt!122602)))

(declare-fun lt!122601 () Unit!7551)

(assert (=> d!60021 (= lt!122601 e!158959)))

(declare-fun c!40897 () Bool)

(assert (=> d!60021 (= c!40897 e!158962)))

(declare-fun res!120196 () Bool)

(assert (=> d!60021 (=> (not res!120196) (not e!158962))))

(assert (=> d!60021 (= res!120196 (bvslt #b00000000000000000000000000000000 (size!6089 (_keys!6644 thiss!1504))))))

(assert (=> d!60021 (= lt!122602 e!158965)))

(declare-fun c!40896 () Bool)

(assert (=> d!60021 (= c!40896 (and (not (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60021 (validMask!0 (mask!10636 thiss!1504))))

(assert (=> d!60021 (= (getCurrentListMap!1351 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)) lt!122599)))

(declare-fun b!245030 () Bool)

(assert (=> b!245030 (= e!158961 (not call!22856))))

(declare-fun bm!22853 () Bool)

(assert (=> bm!22853 (= call!22856 (contains!1754 lt!122599 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245036 () Bool)

(assert (=> b!245036 (= e!158960 (= (apply!229 lt!122599 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4373 thiss!1504)))))

(declare-fun bm!22854 () Bool)

(assert (=> bm!22854 (= call!22853 (+!662 (ite c!40896 call!22852 (ite c!40894 call!22851 call!22854)) (ite (or c!40896 c!40894) (tuple2!4751 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4373 thiss!1504)) (tuple2!4751 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4373 thiss!1504)))))))

(declare-fun b!245037 () Bool)

(assert (=> b!245037 (= e!158969 e!158961)))

(declare-fun c!40895 () Bool)

(assert (=> b!245037 (= c!40895 (not (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!245038 () Bool)

(declare-fun Unit!7565 () Unit!7551)

(assert (=> b!245038 (= e!158959 Unit!7565)))

(declare-fun b!245039 () Bool)

(assert (=> b!245039 (= e!158964 e!158958)))

(declare-fun res!120188 () Bool)

(assert (=> b!245039 (=> (not res!120188) (not e!158958))))

(assert (=> b!245039 (= res!120188 (contains!1754 lt!122599 (select (arr!5746 (_keys!6644 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!245039 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6089 (_keys!6644 thiss!1504))))))

(assert (= (and d!60021 c!40896) b!245031))

(assert (= (and d!60021 (not c!40896)) b!245021))

(assert (= (and b!245021 c!40894) b!245026))

(assert (= (and b!245021 (not c!40894)) b!245034))

(assert (= (and b!245034 c!40893) b!245024))

(assert (= (and b!245034 (not c!40893)) b!245032))

(assert (= (or b!245024 b!245032) bm!22851))

(assert (= (or b!245026 bm!22851) bm!22852))

(assert (= (or b!245026 b!245024) bm!22848))

(assert (= (or b!245031 bm!22852) bm!22849))

(assert (= (or b!245031 bm!22848) bm!22854))

(assert (= (and d!60021 res!120196) b!245019))

(assert (= (and d!60021 c!40897) b!245022))

(assert (= (and d!60021 (not c!40897)) b!245038))

(assert (= (and d!60021 res!120191) b!245027))

(assert (= (and b!245027 res!120190) b!245028))

(assert (= (and b!245027 (not res!120195)) b!245039))

(assert (= (and b!245039 res!120188) b!245025))

(assert (= (and b!245027 res!120194) b!245020))

(assert (= (and b!245020 c!40892) b!245035))

(assert (= (and b!245020 (not c!40892)) b!245023))

(assert (= (and b!245035 res!120189) b!245033))

(assert (= (or b!245035 b!245023) bm!22850))

(assert (= (and b!245020 res!120193) b!245037))

(assert (= (and b!245037 c!40895) b!245029))

(assert (= (and b!245037 (not c!40895)) b!245030))

(assert (= (and b!245029 res!120192) b!245036))

(assert (= (or b!245029 b!245030) bm!22853))

(declare-fun b_lambda!8001 () Bool)

(assert (=> (not b_lambda!8001) (not b!245025)))

(declare-fun t!8660 () Bool)

(declare-fun tb!2963 () Bool)

(assert (=> (and b!244778 (= (defaultEntry!4532 thiss!1504) (defaultEntry!4532 thiss!1504)) t!8660) tb!2963))

(declare-fun result!5227 () Bool)

(assert (=> tb!2963 (= result!5227 tp_is_empty!6409)))

(assert (=> b!245025 t!8660))

(declare-fun b_and!13513 () Bool)

(assert (= b_and!13507 (and (=> t!8660 result!5227) b_and!13513)))

(assert (=> b!245019 m!262201))

(assert (=> b!245019 m!262201))

(declare-fun m!262213 () Bool)

(assert (=> b!245019 m!262213))

(declare-fun m!262215 () Bool)

(assert (=> b!245022 m!262215))

(declare-fun m!262217 () Bool)

(assert (=> b!245022 m!262217))

(declare-fun m!262219 () Bool)

(assert (=> b!245022 m!262219))

(declare-fun m!262221 () Bool)

(assert (=> b!245022 m!262221))

(assert (=> b!245022 m!262201))

(declare-fun m!262223 () Bool)

(assert (=> b!245022 m!262223))

(declare-fun m!262225 () Bool)

(assert (=> b!245022 m!262225))

(declare-fun m!262227 () Bool)

(assert (=> b!245022 m!262227))

(declare-fun m!262229 () Bool)

(assert (=> b!245022 m!262229))

(declare-fun m!262231 () Bool)

(assert (=> b!245022 m!262231))

(declare-fun m!262233 () Bool)

(assert (=> b!245022 m!262233))

(declare-fun m!262235 () Bool)

(assert (=> b!245022 m!262235))

(declare-fun m!262237 () Bool)

(assert (=> b!245022 m!262237))

(declare-fun m!262239 () Bool)

(assert (=> b!245022 m!262239))

(declare-fun m!262241 () Bool)

(assert (=> b!245022 m!262241))

(assert (=> b!245022 m!262225))

(assert (=> b!245022 m!262235))

(assert (=> b!245022 m!262231))

(declare-fun m!262243 () Bool)

(assert (=> b!245022 m!262243))

(declare-fun m!262245 () Bool)

(assert (=> b!245022 m!262245))

(assert (=> b!245022 m!262215))

(declare-fun m!262247 () Bool)

(assert (=> bm!22850 m!262247))

(declare-fun m!262249 () Bool)

(assert (=> b!245033 m!262249))

(declare-fun m!262251 () Bool)

(assert (=> b!245036 m!262251))

(assert (=> d!60021 m!262175))

(declare-fun m!262253 () Bool)

(assert (=> bm!22854 m!262253))

(declare-fun m!262255 () Bool)

(assert (=> b!245031 m!262255))

(declare-fun m!262257 () Bool)

(assert (=> bm!22853 m!262257))

(assert (=> b!245025 m!262201))

(declare-fun m!262259 () Bool)

(assert (=> b!245025 m!262259))

(declare-fun m!262261 () Bool)

(assert (=> b!245025 m!262261))

(declare-fun m!262263 () Bool)

(assert (=> b!245025 m!262263))

(assert (=> b!245025 m!262201))

(assert (=> b!245025 m!262263))

(assert (=> b!245025 m!262261))

(declare-fun m!262265 () Bool)

(assert (=> b!245025 m!262265))

(assert (=> b!245039 m!262201))

(assert (=> b!245039 m!262201))

(declare-fun m!262267 () Bool)

(assert (=> b!245039 m!262267))

(assert (=> b!245028 m!262201))

(assert (=> b!245028 m!262201))

(assert (=> b!245028 m!262213))

(assert (=> bm!22849 m!262223))

(assert (=> b!244779 d!60021))

(declare-fun lt!122627 () SeekEntryResult!1083)

(declare-fun b!245054 () Bool)

(declare-fun e!158977 () SeekEntryResult!1083)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12107 (_ BitVec 32)) SeekEntryResult!1083)

(assert (=> b!245054 (= e!158977 (seekKeyOrZeroReturnVacant!0 (x!24394 lt!122627) (index!6504 lt!122627) (index!6504 lt!122627) key!932 (_keys!6644 thiss!1504) (mask!10636 thiss!1504)))))

(declare-fun b!245055 () Bool)

(declare-fun e!158976 () SeekEntryResult!1083)

(assert (=> b!245055 (= e!158976 (Found!1083 (index!6504 lt!122627)))))

(declare-fun b!245056 () Bool)

(assert (=> b!245056 (= e!158977 (MissingZero!1083 (index!6504 lt!122627)))))

(declare-fun b!245057 () Bool)

(declare-fun e!158978 () SeekEntryResult!1083)

(assert (=> b!245057 (= e!158978 e!158976)))

(declare-fun lt!122628 () (_ BitVec 64))

(assert (=> b!245057 (= lt!122628 (select (arr!5746 (_keys!6644 thiss!1504)) (index!6504 lt!122627)))))

(declare-fun c!40906 () Bool)

(assert (=> b!245057 (= c!40906 (= lt!122628 key!932))))

(declare-fun b!245058 () Bool)

(declare-fun c!40905 () Bool)

(assert (=> b!245058 (= c!40905 (= lt!122628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245058 (= e!158976 e!158977)))

(declare-fun b!245059 () Bool)

(assert (=> b!245059 (= e!158978 Undefined!1083)))

(declare-fun d!60023 () Bool)

(declare-fun lt!122629 () SeekEntryResult!1083)

(assert (=> d!60023 (and (or ((_ is Undefined!1083) lt!122629) (not ((_ is Found!1083) lt!122629)) (and (bvsge (index!6503 lt!122629) #b00000000000000000000000000000000) (bvslt (index!6503 lt!122629) (size!6089 (_keys!6644 thiss!1504))))) (or ((_ is Undefined!1083) lt!122629) ((_ is Found!1083) lt!122629) (not ((_ is MissingZero!1083) lt!122629)) (and (bvsge (index!6502 lt!122629) #b00000000000000000000000000000000) (bvslt (index!6502 lt!122629) (size!6089 (_keys!6644 thiss!1504))))) (or ((_ is Undefined!1083) lt!122629) ((_ is Found!1083) lt!122629) ((_ is MissingZero!1083) lt!122629) (not ((_ is MissingVacant!1083) lt!122629)) (and (bvsge (index!6505 lt!122629) #b00000000000000000000000000000000) (bvslt (index!6505 lt!122629) (size!6089 (_keys!6644 thiss!1504))))) (or ((_ is Undefined!1083) lt!122629) (ite ((_ is Found!1083) lt!122629) (= (select (arr!5746 (_keys!6644 thiss!1504)) (index!6503 lt!122629)) key!932) (ite ((_ is MissingZero!1083) lt!122629) (= (select (arr!5746 (_keys!6644 thiss!1504)) (index!6502 lt!122629)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1083) lt!122629) (= (select (arr!5746 (_keys!6644 thiss!1504)) (index!6505 lt!122629)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60023 (= lt!122629 e!158978)))

(declare-fun c!40904 () Bool)

(assert (=> d!60023 (= c!40904 (and ((_ is Intermediate!1083) lt!122627) (undefined!1895 lt!122627)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12107 (_ BitVec 32)) SeekEntryResult!1083)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60023 (= lt!122627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10636 thiss!1504)) key!932 (_keys!6644 thiss!1504) (mask!10636 thiss!1504)))))

(assert (=> d!60023 (validMask!0 (mask!10636 thiss!1504))))

(assert (=> d!60023 (= (seekEntryOrOpen!0 key!932 (_keys!6644 thiss!1504) (mask!10636 thiss!1504)) lt!122629)))

(assert (= (and d!60023 c!40904) b!245059))

(assert (= (and d!60023 (not c!40904)) b!245057))

(assert (= (and b!245057 c!40906) b!245055))

(assert (= (and b!245057 (not c!40906)) b!245058))

(assert (= (and b!245058 c!40905) b!245056))

(assert (= (and b!245058 (not c!40905)) b!245054))

(declare-fun m!262269 () Bool)

(assert (=> b!245054 m!262269))

(declare-fun m!262271 () Bool)

(assert (=> b!245057 m!262271))

(declare-fun m!262273 () Bool)

(assert (=> d!60023 m!262273))

(declare-fun m!262275 () Bool)

(assert (=> d!60023 m!262275))

(assert (=> d!60023 m!262273))

(declare-fun m!262277 () Bool)

(assert (=> d!60023 m!262277))

(declare-fun m!262279 () Bool)

(assert (=> d!60023 m!262279))

(declare-fun m!262281 () Bool)

(assert (=> d!60023 m!262281))

(assert (=> d!60023 m!262175))

(assert (=> b!244777 d!60023))

(declare-fun d!60025 () Bool)

(assert (=> d!60025 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244770 d!60025))

(declare-fun b!245076 () Bool)

(declare-fun e!158990 () Bool)

(declare-fun e!158988 () Bool)

(assert (=> b!245076 (= e!158990 e!158988)))

(declare-fun res!120207 () Bool)

(declare-fun call!22862 () Bool)

(assert (=> b!245076 (= res!120207 call!22862)))

(assert (=> b!245076 (=> (not res!120207) (not e!158988))))

(declare-fun b!245077 () Bool)

(declare-fun e!158987 () Bool)

(declare-fun call!22863 () Bool)

(assert (=> b!245077 (= e!158987 (not call!22863))))

(declare-fun b!245078 () Bool)

(declare-fun res!120208 () Bool)

(assert (=> b!245078 (=> (not res!120208) (not e!158987))))

(declare-fun lt!122635 () SeekEntryResult!1083)

(assert (=> b!245078 (= res!120208 (= (select (arr!5746 (_keys!6644 thiss!1504)) (index!6505 lt!122635)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245078 (and (bvsge (index!6505 lt!122635) #b00000000000000000000000000000000) (bvslt (index!6505 lt!122635) (size!6089 (_keys!6644 thiss!1504))))))

(declare-fun b!245079 () Bool)

(declare-fun e!158989 () Bool)

(assert (=> b!245079 (= e!158989 ((_ is Undefined!1083) lt!122635))))

(declare-fun b!245080 () Bool)

(assert (=> b!245080 (and (bvsge (index!6502 lt!122635) #b00000000000000000000000000000000) (bvslt (index!6502 lt!122635) (size!6089 (_keys!6644 thiss!1504))))))

(declare-fun res!120205 () Bool)

(assert (=> b!245080 (= res!120205 (= (select (arr!5746 (_keys!6644 thiss!1504)) (index!6502 lt!122635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245080 (=> (not res!120205) (not e!158988))))

(declare-fun bm!22859 () Bool)

(assert (=> bm!22859 (= call!22863 (arrayContainsKey!0 (_keys!6644 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245082 () Bool)

(declare-fun res!120206 () Bool)

(assert (=> b!245082 (=> (not res!120206) (not e!158987))))

(assert (=> b!245082 (= res!120206 call!22862)))

(assert (=> b!245082 (= e!158989 e!158987)))

(declare-fun c!40912 () Bool)

(declare-fun bm!22860 () Bool)

(assert (=> bm!22860 (= call!22862 (inRange!0 (ite c!40912 (index!6502 lt!122635) (index!6505 lt!122635)) (mask!10636 thiss!1504)))))

(declare-fun b!245083 () Bool)

(assert (=> b!245083 (= e!158988 (not call!22863))))

(declare-fun b!245081 () Bool)

(assert (=> b!245081 (= e!158990 e!158989)))

(declare-fun c!40911 () Bool)

(assert (=> b!245081 (= c!40911 ((_ is MissingVacant!1083) lt!122635))))

(declare-fun d!60027 () Bool)

(assert (=> d!60027 e!158990))

(assert (=> d!60027 (= c!40912 ((_ is MissingZero!1083) lt!122635))))

(assert (=> d!60027 (= lt!122635 (seekEntryOrOpen!0 key!932 (_keys!6644 thiss!1504) (mask!10636 thiss!1504)))))

(declare-fun lt!122634 () Unit!7551)

(declare-fun choose!1152 (array!12107 array!12105 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 64) Int) Unit!7551)

(assert (=> d!60027 (= lt!122634 (choose!1152 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 (defaultEntry!4532 thiss!1504)))))

(assert (=> d!60027 (validMask!0 (mask!10636 thiss!1504))))

(assert (=> d!60027 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!371 (_keys!6644 thiss!1504) (_values!4515 thiss!1504) (mask!10636 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 (defaultEntry!4532 thiss!1504)) lt!122634)))

(assert (= (and d!60027 c!40912) b!245076))

(assert (= (and d!60027 (not c!40912)) b!245081))

(assert (= (and b!245076 res!120207) b!245080))

(assert (= (and b!245080 res!120205) b!245083))

(assert (= (and b!245081 c!40911) b!245082))

(assert (= (and b!245081 (not c!40911)) b!245079))

(assert (= (and b!245082 res!120206) b!245078))

(assert (= (and b!245078 res!120208) b!245077))

(assert (= (or b!245076 b!245082) bm!22860))

(assert (= (or b!245083 b!245077) bm!22859))

(declare-fun m!262283 () Bool)

(assert (=> b!245078 m!262283))

(declare-fun m!262285 () Bool)

(assert (=> b!245080 m!262285))

(assert (=> bm!22859 m!262057))

(declare-fun m!262287 () Bool)

(assert (=> bm!22860 m!262287))

(assert (=> d!60027 m!262063))

(declare-fun m!262289 () Bool)

(assert (=> d!60027 m!262289))

(assert (=> d!60027 m!262175))

(assert (=> b!244789 d!60027))

(declare-fun d!60029 () Bool)

(assert (=> d!60029 (= (validKeyInArray!0 (select (arr!5746 (_keys!6644 thiss!1504)) index!297)) (and (not (= (select (arr!5746 (_keys!6644 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5746 (_keys!6644 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244771 d!60029))

(assert (=> bm!22818 d!60009))

(declare-fun condMapEmpty!10879 () Bool)

(declare-fun mapDefault!10879 () ValueCell!2861)

(assert (=> mapNonEmpty!10870 (= condMapEmpty!10879 (= mapRest!10870 ((as const (Array (_ BitVec 32) ValueCell!2861)) mapDefault!10879)))))

(declare-fun e!158995 () Bool)

(declare-fun mapRes!10879 () Bool)

(assert (=> mapNonEmpty!10870 (= tp!22870 (and e!158995 mapRes!10879))))

(declare-fun mapNonEmpty!10879 () Bool)

(declare-fun tp!22885 () Bool)

(declare-fun e!158996 () Bool)

(assert (=> mapNonEmpty!10879 (= mapRes!10879 (and tp!22885 e!158996))))

(declare-fun mapRest!10879 () (Array (_ BitVec 32) ValueCell!2861))

(declare-fun mapKey!10879 () (_ BitVec 32))

(declare-fun mapValue!10879 () ValueCell!2861)

(assert (=> mapNonEmpty!10879 (= mapRest!10870 (store mapRest!10879 mapKey!10879 mapValue!10879))))

(declare-fun b!245090 () Bool)

(assert (=> b!245090 (= e!158996 tp_is_empty!6409)))

(declare-fun b!245091 () Bool)

(assert (=> b!245091 (= e!158995 tp_is_empty!6409)))

(declare-fun mapIsEmpty!10879 () Bool)

(assert (=> mapIsEmpty!10879 mapRes!10879))

(assert (= (and mapNonEmpty!10870 condMapEmpty!10879) mapIsEmpty!10879))

(assert (= (and mapNonEmpty!10870 (not condMapEmpty!10879)) mapNonEmpty!10879))

(assert (= (and mapNonEmpty!10879 ((_ is ValueCellFull!2861) mapValue!10879)) b!245090))

(assert (= (and mapNonEmpty!10870 ((_ is ValueCellFull!2861) mapDefault!10879)) b!245091))

(declare-fun m!262291 () Bool)

(assert (=> mapNonEmpty!10879 m!262291))

(declare-fun b_lambda!8003 () Bool)

(assert (= b_lambda!8001 (or (and b!244778 b_free!6547) b_lambda!8003)))

(check-sat (not bm!22850) (not b!245025) (not bm!22853) (not d!60021) (not b!245033) (not mapNonEmpty!10879) (not d!59999) (not bm!22854) (not b!245031) (not d!60027) (not b!244957) (not b_lambda!8003) (not bm!22859) (not b!245039) tp_is_empty!6409 (not b!244941) (not d!60023) (not bm!22860) (not b!245028) (not b!244942) (not b!244943) (not d!60007) (not b!244956) (not d!60019) (not b!244933) (not b!244974) (not b!245022) (not b!244976) (not b!245019) (not b!245036) (not b_next!6547) (not b!244967) (not bm!22833) (not b!245054) (not d!60003) (not b!244961) b_and!13513 (not d!60001) (not b!244958) (not bm!22849))
(check-sat b_and!13513 (not b_next!6547))
