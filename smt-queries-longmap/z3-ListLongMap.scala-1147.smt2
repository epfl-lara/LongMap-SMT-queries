; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23922 () Bool)

(assert start!23922)

(declare-fun b!250783 () Bool)

(declare-fun b_free!6633 () Bool)

(declare-fun b_next!6633 () Bool)

(assert (=> b!250783 (= b_free!6633 (not b_next!6633))))

(declare-fun tp!23167 () Bool)

(declare-fun b_and!13655 () Bool)

(assert (=> b!250783 (= tp!23167 b_and!13655)))

(declare-fun b!250772 () Bool)

(declare-fun res!122812 () Bool)

(declare-fun e!162644 () Bool)

(assert (=> b!250772 (=> (not res!122812) (not e!162644))))

(declare-fun call!23579 () Bool)

(assert (=> b!250772 (= res!122812 call!23579)))

(declare-fun e!162654 () Bool)

(assert (=> b!250772 (= e!162654 e!162644)))

(declare-fun b!250773 () Bool)

(declare-fun e!162653 () Bool)

(declare-fun tp_is_empty!6495 () Bool)

(assert (=> b!250773 (= e!162653 tp_is_empty!6495)))

(declare-fun b!250774 () Bool)

(declare-fun c!42152 () Bool)

(declare-datatypes ((SeekEntryResult!1124 0))(
  ( (MissingZero!1124 (index!6666 (_ BitVec 32))) (Found!1124 (index!6667 (_ BitVec 32))) (Intermediate!1124 (undefined!1936 Bool) (index!6668 (_ BitVec 32)) (x!24692 (_ BitVec 32))) (Undefined!1124) (MissingVacant!1124 (index!6669 (_ BitVec 32))) )
))
(declare-fun lt!125655 () SeekEntryResult!1124)

(get-info :version)

(assert (=> b!250774 (= c!42152 ((_ is MissingVacant!1124) lt!125655))))

(declare-fun e!162643 () Bool)

(assert (=> b!250774 (= e!162654 e!162643)))

(declare-fun b!250775 () Bool)

(declare-fun e!162651 () Bool)

(declare-fun e!162652 () Bool)

(assert (=> b!250775 (= e!162651 e!162652)))

(declare-fun res!122808 () Bool)

(assert (=> b!250775 (=> (not res!122808) (not e!162652))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!250775 (= res!122808 (or (= lt!125655 (MissingZero!1124 index!297)) (= lt!125655 (MissingVacant!1124 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8307 0))(
  ( (V!8308 (val!3292 Int)) )
))
(declare-datatypes ((ValueCell!2904 0))(
  ( (ValueCellFull!2904 (v!5358 V!8307)) (EmptyCell!2904) )
))
(declare-datatypes ((array!12309 0))(
  ( (array!12310 (arr!5836 (Array (_ BitVec 32) ValueCell!2904)) (size!6181 (_ BitVec 32))) )
))
(declare-datatypes ((array!12311 0))(
  ( (array!12312 (arr!5837 (Array (_ BitVec 32) (_ BitVec 64))) (size!6182 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3708 0))(
  ( (LongMapFixedSize!3709 (defaultEntry!4635 Int) (mask!10825 (_ BitVec 32)) (extraKeys!4372 (_ BitVec 32)) (zeroValue!4476 V!8307) (minValue!4476 V!8307) (_size!1903 (_ BitVec 32)) (_keys!6773 array!12311) (_values!4618 array!12309) (_vacant!1903 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3708)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12311 (_ BitVec 32)) SeekEntryResult!1124)

(assert (=> b!250775 (= lt!125655 (seekEntryOrOpen!0 key!932 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)))))

(declare-fun b!250776 () Bool)

(declare-datatypes ((Unit!7760 0))(
  ( (Unit!7761) )
))
(declare-fun e!162650 () Unit!7760)

(declare-fun lt!125651 () Unit!7760)

(assert (=> b!250776 (= e!162650 lt!125651)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!402 (array!12311 array!12309 (_ BitVec 32) (_ BitVec 32) V!8307 V!8307 (_ BitVec 64) Int) Unit!7760)

(assert (=> b!250776 (= lt!125651 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!402 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) key!932 (defaultEntry!4635 thiss!1504)))))

(declare-fun c!42153 () Bool)

(assert (=> b!250776 (= c!42153 ((_ is MissingZero!1124) lt!125655))))

(assert (=> b!250776 e!162654))

(declare-fun b!250777 () Bool)

(declare-fun res!122811 () Bool)

(assert (=> b!250777 (=> (not res!122811) (not e!162644))))

(assert (=> b!250777 (= res!122811 (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6666 lt!125655)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250778 () Bool)

(declare-fun res!122807 () Bool)

(assert (=> b!250778 (=> (not res!122807) (not e!162651))))

(assert (=> b!250778 (= res!122807 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!23576 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23576 (= call!23579 (inRange!0 (ite c!42153 (index!6666 lt!125655) (index!6669 lt!125655)) (mask!10825 thiss!1504)))))

(declare-fun bm!23577 () Bool)

(declare-fun call!23580 () Bool)

(declare-fun arrayContainsKey!0 (array!12311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23577 (= call!23580 (arrayContainsKey!0 (_keys!6773 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250779 () Bool)

(declare-fun e!162649 () Bool)

(assert (=> b!250779 (= e!162649 (not call!23580))))

(declare-fun res!122805 () Bool)

(assert (=> start!23922 (=> (not res!122805) (not e!162651))))

(declare-fun valid!1449 (LongMapFixedSize!3708) Bool)

(assert (=> start!23922 (= res!122805 (valid!1449 thiss!1504))))

(assert (=> start!23922 e!162651))

(declare-fun e!162642 () Bool)

(assert (=> start!23922 e!162642))

(assert (=> start!23922 true))

(declare-fun mapIsEmpty!11038 () Bool)

(declare-fun mapRes!11038 () Bool)

(assert (=> mapIsEmpty!11038 mapRes!11038))

(declare-fun b!250780 () Bool)

(declare-fun res!122810 () Bool)

(assert (=> b!250780 (= res!122810 (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6669 lt!125655)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250780 (=> (not res!122810) (not e!162649))))

(declare-fun b!250781 () Bool)

(declare-fun Unit!7762 () Unit!7760)

(assert (=> b!250781 (= e!162650 Unit!7762)))

(declare-fun lt!125658 () Unit!7760)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!399 (array!12311 array!12309 (_ BitVec 32) (_ BitVec 32) V!8307 V!8307 (_ BitVec 64) Int) Unit!7760)

(assert (=> b!250781 (= lt!125658 (lemmaInListMapThenSeekEntryOrOpenFindsIt!399 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) key!932 (defaultEntry!4635 thiss!1504)))))

(assert (=> b!250781 false))

(declare-fun b!250782 () Bool)

(declare-fun e!162646 () Bool)

(assert (=> b!250782 (= e!162646 tp_is_empty!6495)))

(declare-fun e!162655 () Bool)

(declare-fun array_inv!3853 (array!12311) Bool)

(declare-fun array_inv!3854 (array!12309) Bool)

(assert (=> b!250783 (= e!162642 (and tp!23167 tp_is_empty!6495 (array_inv!3853 (_keys!6773 thiss!1504)) (array_inv!3854 (_values!4618 thiss!1504)) e!162655))))

(declare-fun b!250784 () Bool)

(declare-fun e!162648 () Unit!7760)

(declare-fun Unit!7763 () Unit!7760)

(assert (=> b!250784 (= e!162648 Unit!7763)))

(declare-fun lt!125659 () Unit!7760)

(declare-fun lemmaArrayContainsKeyThenInListMap!202 (array!12311 array!12309 (_ BitVec 32) (_ BitVec 32) V!8307 V!8307 (_ BitVec 64) (_ BitVec 32) Int) Unit!7760)

(assert (=> b!250784 (= lt!125659 (lemmaArrayContainsKeyThenInListMap!202 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))))

(assert (=> b!250784 false))

(declare-fun mapNonEmpty!11038 () Bool)

(declare-fun tp!23166 () Bool)

(assert (=> mapNonEmpty!11038 (= mapRes!11038 (and tp!23166 e!162653))))

(declare-fun mapKey!11038 () (_ BitVec 32))

(declare-fun mapValue!11038 () ValueCell!2904)

(declare-fun mapRest!11038 () (Array (_ BitVec 32) ValueCell!2904))

(assert (=> mapNonEmpty!11038 (= (arr!5836 (_values!4618 thiss!1504)) (store mapRest!11038 mapKey!11038 mapValue!11038))))

(declare-fun b!250785 () Bool)

(declare-fun e!162641 () Bool)

(assert (=> b!250785 (= e!162641 (or (not (= (size!6181 (_values!4618 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10825 thiss!1504)))) (not (= (size!6182 (_keys!6773 thiss!1504)) (size!6181 (_values!4618 thiss!1504)))) (bvslt (mask!10825 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4372 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!250786 () Bool)

(assert (=> b!250786 (= e!162643 e!162649)))

(declare-fun res!122804 () Bool)

(assert (=> b!250786 (= res!122804 call!23579)))

(assert (=> b!250786 (=> (not res!122804) (not e!162649))))

(declare-fun b!250787 () Bool)

(declare-fun Unit!7764 () Unit!7760)

(assert (=> b!250787 (= e!162648 Unit!7764)))

(declare-fun b!250788 () Bool)

(assert (=> b!250788 (= e!162643 ((_ is Undefined!1124) lt!125655))))

(declare-fun b!250789 () Bool)

(assert (=> b!250789 (= e!162644 (not call!23580))))

(declare-fun b!250790 () Bool)

(assert (=> b!250790 (= e!162655 (and e!162646 mapRes!11038))))

(declare-fun condMapEmpty!11038 () Bool)

(declare-fun mapDefault!11038 () ValueCell!2904)

(assert (=> b!250790 (= condMapEmpty!11038 (= (arr!5836 (_values!4618 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2904)) mapDefault!11038)))))

(declare-fun b!250791 () Bool)

(declare-fun e!162645 () Bool)

(assert (=> b!250791 (= e!162645 (not e!162641))))

(declare-fun res!122809 () Bool)

(assert (=> b!250791 (=> res!122809 e!162641)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!250791 (= res!122809 (not (validMask!0 (mask!10825 thiss!1504))))))

(declare-fun lt!125657 () array!12311)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12311 (_ BitVec 32)) Bool)

(assert (=> b!250791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125657 (mask!10825 thiss!1504))))

(declare-fun lt!125652 () Unit!7760)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12311 (_ BitVec 32) (_ BitVec 32)) Unit!7760)

(assert (=> b!250791 (= lt!125652 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6773 thiss!1504) index!297 (mask!10825 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12311 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!250791 (= (arrayCountValidKeys!0 lt!125657 #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6773 thiss!1504) #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504)))))))

(declare-fun lt!125653 () Unit!7760)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12311 (_ BitVec 32) (_ BitVec 64)) Unit!7760)

(assert (=> b!250791 (= lt!125653 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6773 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3726 0))(
  ( (Nil!3723) (Cons!3722 (h!4382 (_ BitVec 64)) (t!8761 List!3726)) )
))
(declare-fun arrayNoDuplicates!0 (array!12311 (_ BitVec 32) List!3726) Bool)

(assert (=> b!250791 (arrayNoDuplicates!0 lt!125657 #b00000000000000000000000000000000 Nil!3723)))

(assert (=> b!250791 (= lt!125657 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun lt!125650 () Unit!7760)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12311 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3726) Unit!7760)

(assert (=> b!250791 (= lt!125650 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6773 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3723))))

(declare-fun lt!125654 () Unit!7760)

(assert (=> b!250791 (= lt!125654 e!162648)))

(declare-fun c!42155 () Bool)

(assert (=> b!250791 (= c!42155 (arrayContainsKey!0 (_keys!6773 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250792 () Bool)

(assert (=> b!250792 (= e!162652 e!162645)))

(declare-fun res!122806 () Bool)

(assert (=> b!250792 (=> (not res!122806) (not e!162645))))

(assert (=> b!250792 (= res!122806 (inRange!0 index!297 (mask!10825 thiss!1504)))))

(declare-fun lt!125656 () Unit!7760)

(assert (=> b!250792 (= lt!125656 e!162650)))

(declare-fun c!42154 () Bool)

(declare-datatypes ((tuple2!4846 0))(
  ( (tuple2!4847 (_1!2434 (_ BitVec 64)) (_2!2434 V!8307)) )
))
(declare-datatypes ((List!3727 0))(
  ( (Nil!3724) (Cons!3723 (h!4383 tuple2!4846) (t!8762 List!3727)) )
))
(declare-datatypes ((ListLongMap!3759 0))(
  ( (ListLongMap!3760 (toList!1895 List!3727)) )
))
(declare-fun contains!1817 (ListLongMap!3759 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1423 (array!12311 array!12309 (_ BitVec 32) (_ BitVec 32) V!8307 V!8307 (_ BitVec 32) Int) ListLongMap!3759)

(assert (=> b!250792 (= c!42154 (contains!1817 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)) key!932))))

(assert (= (and start!23922 res!122805) b!250778))

(assert (= (and b!250778 res!122807) b!250775))

(assert (= (and b!250775 res!122808) b!250792))

(assert (= (and b!250792 c!42154) b!250781))

(assert (= (and b!250792 (not c!42154)) b!250776))

(assert (= (and b!250776 c!42153) b!250772))

(assert (= (and b!250776 (not c!42153)) b!250774))

(assert (= (and b!250772 res!122812) b!250777))

(assert (= (and b!250777 res!122811) b!250789))

(assert (= (and b!250774 c!42152) b!250786))

(assert (= (and b!250774 (not c!42152)) b!250788))

(assert (= (and b!250786 res!122804) b!250780))

(assert (= (and b!250780 res!122810) b!250779))

(assert (= (or b!250772 b!250786) bm!23576))

(assert (= (or b!250789 b!250779) bm!23577))

(assert (= (and b!250792 res!122806) b!250791))

(assert (= (and b!250791 c!42155) b!250784))

(assert (= (and b!250791 (not c!42155)) b!250787))

(assert (= (and b!250791 (not res!122809)) b!250785))

(assert (= (and b!250790 condMapEmpty!11038) mapIsEmpty!11038))

(assert (= (and b!250790 (not condMapEmpty!11038)) mapNonEmpty!11038))

(assert (= (and mapNonEmpty!11038 ((_ is ValueCellFull!2904) mapValue!11038)) b!250773))

(assert (= (and b!250790 ((_ is ValueCellFull!2904) mapDefault!11038)) b!250782))

(assert (= b!250783 b!250790))

(assert (= start!23922 b!250783))

(declare-fun m!267113 () Bool)

(assert (=> mapNonEmpty!11038 m!267113))

(declare-fun m!267115 () Bool)

(assert (=> b!250775 m!267115))

(declare-fun m!267117 () Bool)

(assert (=> b!250781 m!267117))

(declare-fun m!267119 () Bool)

(assert (=> b!250791 m!267119))

(declare-fun m!267121 () Bool)

(assert (=> b!250791 m!267121))

(declare-fun m!267123 () Bool)

(assert (=> b!250791 m!267123))

(declare-fun m!267125 () Bool)

(assert (=> b!250791 m!267125))

(declare-fun m!267127 () Bool)

(assert (=> b!250791 m!267127))

(declare-fun m!267129 () Bool)

(assert (=> b!250791 m!267129))

(declare-fun m!267131 () Bool)

(assert (=> b!250791 m!267131))

(declare-fun m!267133 () Bool)

(assert (=> b!250791 m!267133))

(declare-fun m!267135 () Bool)

(assert (=> b!250791 m!267135))

(declare-fun m!267137 () Bool)

(assert (=> b!250791 m!267137))

(declare-fun m!267139 () Bool)

(assert (=> bm!23576 m!267139))

(declare-fun m!267141 () Bool)

(assert (=> b!250780 m!267141))

(declare-fun m!267143 () Bool)

(assert (=> b!250783 m!267143))

(declare-fun m!267145 () Bool)

(assert (=> b!250783 m!267145))

(declare-fun m!267147 () Bool)

(assert (=> b!250777 m!267147))

(declare-fun m!267149 () Bool)

(assert (=> b!250792 m!267149))

(declare-fun m!267151 () Bool)

(assert (=> b!250792 m!267151))

(assert (=> b!250792 m!267151))

(declare-fun m!267153 () Bool)

(assert (=> b!250792 m!267153))

(assert (=> bm!23577 m!267121))

(declare-fun m!267155 () Bool)

(assert (=> b!250784 m!267155))

(declare-fun m!267157 () Bool)

(assert (=> start!23922 m!267157))

(declare-fun m!267159 () Bool)

(assert (=> b!250776 m!267159))

(check-sat (not mapNonEmpty!11038) (not b!250775) (not b!250791) (not b!250781) (not bm!23576) tp_is_empty!6495 (not b!250776) (not b!250792) (not start!23922) (not b!250783) b_and!13655 (not b_next!6633) (not b!250784) (not bm!23577))
(check-sat b_and!13655 (not b_next!6633))
(get-model)

(declare-fun b!250872 () Bool)

(declare-fun e!162711 () Bool)

(declare-fun call!23592 () Bool)

(assert (=> b!250872 (= e!162711 (not call!23592))))

(declare-fun b!250873 () Bool)

(declare-fun res!122848 () Bool)

(assert (=> b!250873 (=> (not res!122848) (not e!162711))))

(declare-fun lt!125694 () SeekEntryResult!1124)

(assert (=> b!250873 (= res!122848 (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6669 lt!125694)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250873 (and (bvsge (index!6669 lt!125694) #b00000000000000000000000000000000) (bvslt (index!6669 lt!125694) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun b!250874 () Bool)

(declare-fun e!162710 () Bool)

(declare-fun e!162709 () Bool)

(assert (=> b!250874 (= e!162710 e!162709)))

(declare-fun res!122850 () Bool)

(declare-fun call!23591 () Bool)

(assert (=> b!250874 (= res!122850 call!23591)))

(assert (=> b!250874 (=> (not res!122850) (not e!162709))))

(declare-fun bm!23588 () Bool)

(assert (=> bm!23588 (= call!23592 (arrayContainsKey!0 (_keys!6773 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun d!60973 () Bool)

(assert (=> d!60973 e!162710))

(declare-fun c!42173 () Bool)

(assert (=> d!60973 (= c!42173 ((_ is MissingZero!1124) lt!125694))))

(assert (=> d!60973 (= lt!125694 (seekEntryOrOpen!0 key!932 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)))))

(declare-fun lt!125695 () Unit!7760)

(declare-fun choose!1188 (array!12311 array!12309 (_ BitVec 32) (_ BitVec 32) V!8307 V!8307 (_ BitVec 64) Int) Unit!7760)

(assert (=> d!60973 (= lt!125695 (choose!1188 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) key!932 (defaultEntry!4635 thiss!1504)))))

(assert (=> d!60973 (validMask!0 (mask!10825 thiss!1504))))

(assert (=> d!60973 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!402 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) key!932 (defaultEntry!4635 thiss!1504)) lt!125695)))

(declare-fun b!250875 () Bool)

(assert (=> b!250875 (= e!162709 (not call!23592))))

(declare-fun bm!23589 () Bool)

(assert (=> bm!23589 (= call!23591 (inRange!0 (ite c!42173 (index!6666 lt!125694) (index!6669 lt!125694)) (mask!10825 thiss!1504)))))

(declare-fun b!250876 () Bool)

(declare-fun e!162712 () Bool)

(assert (=> b!250876 (= e!162710 e!162712)))

(declare-fun c!42172 () Bool)

(assert (=> b!250876 (= c!42172 ((_ is MissingVacant!1124) lt!125694))))

(declare-fun b!250877 () Bool)

(assert (=> b!250877 (and (bvsge (index!6666 lt!125694) #b00000000000000000000000000000000) (bvslt (index!6666 lt!125694) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun res!122851 () Bool)

(assert (=> b!250877 (= res!122851 (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6666 lt!125694)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250877 (=> (not res!122851) (not e!162709))))

(declare-fun b!250878 () Bool)

(assert (=> b!250878 (= e!162712 ((_ is Undefined!1124) lt!125694))))

(declare-fun b!250879 () Bool)

(declare-fun res!122849 () Bool)

(assert (=> b!250879 (=> (not res!122849) (not e!162711))))

(assert (=> b!250879 (= res!122849 call!23591)))

(assert (=> b!250879 (= e!162712 e!162711)))

(assert (= (and d!60973 c!42173) b!250874))

(assert (= (and d!60973 (not c!42173)) b!250876))

(assert (= (and b!250874 res!122850) b!250877))

(assert (= (and b!250877 res!122851) b!250875))

(assert (= (and b!250876 c!42172) b!250879))

(assert (= (and b!250876 (not c!42172)) b!250878))

(assert (= (and b!250879 res!122849) b!250873))

(assert (= (and b!250873 res!122848) b!250872))

(assert (= (or b!250874 b!250879) bm!23589))

(assert (= (or b!250875 b!250872) bm!23588))

(assert (=> d!60973 m!267115))

(declare-fun m!267209 () Bool)

(assert (=> d!60973 m!267209))

(assert (=> d!60973 m!267119))

(declare-fun m!267211 () Bool)

(assert (=> b!250873 m!267211))

(declare-fun m!267213 () Bool)

(assert (=> bm!23589 m!267213))

(declare-fun m!267215 () Bool)

(assert (=> b!250877 m!267215))

(assert (=> bm!23588 m!267121))

(assert (=> b!250776 d!60973))

(declare-fun d!60975 () Bool)

(assert (=> d!60975 (contains!1817 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)) key!932)))

(declare-fun lt!125698 () Unit!7760)

(declare-fun choose!1189 (array!12311 array!12309 (_ BitVec 32) (_ BitVec 32) V!8307 V!8307 (_ BitVec 64) (_ BitVec 32) Int) Unit!7760)

(assert (=> d!60975 (= lt!125698 (choose!1189 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))))

(assert (=> d!60975 (validMask!0 (mask!10825 thiss!1504))))

(assert (=> d!60975 (= (lemmaArrayContainsKeyThenInListMap!202 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)) lt!125698)))

(declare-fun bs!8987 () Bool)

(assert (= bs!8987 d!60975))

(assert (=> bs!8987 m!267151))

(assert (=> bs!8987 m!267151))

(assert (=> bs!8987 m!267153))

(declare-fun m!267217 () Bool)

(assert (=> bs!8987 m!267217))

(assert (=> bs!8987 m!267119))

(assert (=> b!250784 d!60975))

(declare-fun d!60977 () Bool)

(assert (=> d!60977 (= (inRange!0 index!297 (mask!10825 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10825 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!250792 d!60977))

(declare-fun d!60979 () Bool)

(declare-fun e!162718 () Bool)

(assert (=> d!60979 e!162718))

(declare-fun res!122854 () Bool)

(assert (=> d!60979 (=> res!122854 e!162718)))

(declare-fun lt!125707 () Bool)

(assert (=> d!60979 (= res!122854 (not lt!125707))))

(declare-fun lt!125709 () Bool)

(assert (=> d!60979 (= lt!125707 lt!125709)))

(declare-fun lt!125710 () Unit!7760)

(declare-fun e!162717 () Unit!7760)

(assert (=> d!60979 (= lt!125710 e!162717)))

(declare-fun c!42176 () Bool)

(assert (=> d!60979 (= c!42176 lt!125709)))

(declare-fun containsKey!291 (List!3727 (_ BitVec 64)) Bool)

(assert (=> d!60979 (= lt!125709 (containsKey!291 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))) key!932))))

(assert (=> d!60979 (= (contains!1817 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)) key!932) lt!125707)))

(declare-fun b!250886 () Bool)

(declare-fun lt!125708 () Unit!7760)

(assert (=> b!250886 (= e!162717 lt!125708)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!239 (List!3727 (_ BitVec 64)) Unit!7760)

(assert (=> b!250886 (= lt!125708 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))) key!932))))

(declare-datatypes ((Option!305 0))(
  ( (Some!304 (v!5360 V!8307)) (None!303) )
))
(declare-fun isDefined!240 (Option!305) Bool)

(declare-fun getValueByKey!299 (List!3727 (_ BitVec 64)) Option!305)

(assert (=> b!250886 (isDefined!240 (getValueByKey!299 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))) key!932))))

(declare-fun b!250887 () Bool)

(declare-fun Unit!7770 () Unit!7760)

(assert (=> b!250887 (= e!162717 Unit!7770)))

(declare-fun b!250888 () Bool)

(assert (=> b!250888 (= e!162718 (isDefined!240 (getValueByKey!299 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))) key!932)))))

(assert (= (and d!60979 c!42176) b!250886))

(assert (= (and d!60979 (not c!42176)) b!250887))

(assert (= (and d!60979 (not res!122854)) b!250888))

(declare-fun m!267219 () Bool)

(assert (=> d!60979 m!267219))

(declare-fun m!267221 () Bool)

(assert (=> b!250886 m!267221))

(declare-fun m!267223 () Bool)

(assert (=> b!250886 m!267223))

(assert (=> b!250886 m!267223))

(declare-fun m!267225 () Bool)

(assert (=> b!250886 m!267225))

(assert (=> b!250888 m!267223))

(assert (=> b!250888 m!267223))

(assert (=> b!250888 m!267225))

(assert (=> b!250792 d!60979))

(declare-fun b!250931 () Bool)

(declare-fun e!162746 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!250931 (= e!162746 (validKeyInArray!0 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250932 () Bool)

(declare-fun e!162749 () Bool)

(declare-fun e!162745 () Bool)

(assert (=> b!250932 (= e!162749 e!162745)))

(declare-fun res!122878 () Bool)

(declare-fun call!23609 () Bool)

(assert (=> b!250932 (= res!122878 call!23609)))

(assert (=> b!250932 (=> (not res!122878) (not e!162745))))

(declare-fun bm!23604 () Bool)

(declare-fun call!23607 () ListLongMap!3759)

(declare-fun call!23608 () ListLongMap!3759)

(assert (=> bm!23604 (= call!23607 call!23608)))

(declare-fun b!250933 () Bool)

(declare-fun e!162757 () ListLongMap!3759)

(declare-fun call!23610 () ListLongMap!3759)

(assert (=> b!250933 (= e!162757 call!23610)))

(declare-fun b!250934 () Bool)

(declare-fun e!162754 () Bool)

(assert (=> b!250934 (= e!162754 e!162749)))

(declare-fun c!42194 () Bool)

(assert (=> b!250934 (= c!42194 (not (= (bvand (extraKeys!4372 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!60981 () Bool)

(assert (=> d!60981 e!162754))

(declare-fun res!122877 () Bool)

(assert (=> d!60981 (=> (not res!122877) (not e!162754))))

(assert (=> d!60981 (= res!122877 (or (bvsge #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))))

(declare-fun lt!125771 () ListLongMap!3759)

(declare-fun lt!125760 () ListLongMap!3759)

(assert (=> d!60981 (= lt!125771 lt!125760)))

(declare-fun lt!125767 () Unit!7760)

(declare-fun e!162752 () Unit!7760)

(assert (=> d!60981 (= lt!125767 e!162752)))

(declare-fun c!42192 () Bool)

(declare-fun e!162747 () Bool)

(assert (=> d!60981 (= c!42192 e!162747)))

(declare-fun res!122879 () Bool)

(assert (=> d!60981 (=> (not res!122879) (not e!162747))))

(assert (=> d!60981 (= res!122879 (bvslt #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun e!162751 () ListLongMap!3759)

(assert (=> d!60981 (= lt!125760 e!162751)))

(declare-fun c!42190 () Bool)

(assert (=> d!60981 (= c!42190 (and (not (= (bvand (extraKeys!4372 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4372 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60981 (validMask!0 (mask!10825 thiss!1504))))

(assert (=> d!60981 (= (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)) lt!125771)))

(declare-fun bm!23605 () Bool)

(declare-fun call!23613 () ListLongMap!3759)

(assert (=> bm!23605 (= call!23613 call!23607)))

(declare-fun b!250935 () Bool)

(assert (=> b!250935 (= e!162751 e!162757)))

(declare-fun c!42191 () Bool)

(assert (=> b!250935 (= c!42191 (and (not (= (bvand (extraKeys!4372 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4372 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!250936 () Bool)

(declare-fun c!42193 () Bool)

(assert (=> b!250936 (= c!42193 (and (not (= (bvand (extraKeys!4372 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4372 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!162756 () ListLongMap!3759)

(assert (=> b!250936 (= e!162757 e!162756)))

(declare-fun bm!23606 () Bool)

(declare-fun call!23611 () ListLongMap!3759)

(assert (=> bm!23606 (= call!23610 call!23611)))

(declare-fun b!250937 () Bool)

(declare-fun apply!241 (ListLongMap!3759 (_ BitVec 64)) V!8307)

(assert (=> b!250937 (= e!162745 (= (apply!241 lt!125771 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4476 thiss!1504)))))

(declare-fun b!250938 () Bool)

(declare-fun e!162753 () Bool)

(declare-fun call!23612 () Bool)

(assert (=> b!250938 (= e!162753 (not call!23612))))

(declare-fun bm!23607 () Bool)

(declare-fun +!668 (ListLongMap!3759 tuple2!4846) ListLongMap!3759)

(assert (=> bm!23607 (= call!23611 (+!668 (ite c!42190 call!23608 (ite c!42191 call!23607 call!23613)) (ite (or c!42190 c!42191) (tuple2!4847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4476 thiss!1504)) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504)))))))

(declare-fun b!250939 () Bool)

(declare-fun e!162750 () Bool)

(declare-fun get!3000 (ValueCell!2904 V!8307) V!8307)

(declare-fun dynLambda!584 (Int (_ BitVec 64)) V!8307)

(assert (=> b!250939 (= e!162750 (= (apply!241 lt!125771 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)) (get!3000 (select (arr!5836 (_values!4618 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4635 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250939 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6181 (_values!4618 thiss!1504))))))

(assert (=> b!250939 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun b!250940 () Bool)

(assert (=> b!250940 (= e!162751 (+!668 call!23611 (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504))))))

(declare-fun b!250941 () Bool)

(assert (=> b!250941 (= e!162756 call!23610)))

(declare-fun b!250942 () Bool)

(declare-fun res!122874 () Bool)

(assert (=> b!250942 (=> (not res!122874) (not e!162754))))

(declare-fun e!162755 () Bool)

(assert (=> b!250942 (= res!122874 e!162755)))

(declare-fun res!122875 () Bool)

(assert (=> b!250942 (=> res!122875 e!162755)))

(assert (=> b!250942 (= res!122875 (not e!162746))))

(declare-fun res!122880 () Bool)

(assert (=> b!250942 (=> (not res!122880) (not e!162746))))

(assert (=> b!250942 (= res!122880 (bvslt #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun b!250943 () Bool)

(assert (=> b!250943 (= e!162756 call!23613)))

(declare-fun b!250944 () Bool)

(declare-fun res!122873 () Bool)

(assert (=> b!250944 (=> (not res!122873) (not e!162754))))

(assert (=> b!250944 (= res!122873 e!162753)))

(declare-fun c!42189 () Bool)

(assert (=> b!250944 (= c!42189 (not (= (bvand (extraKeys!4372 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!250945 () Bool)

(declare-fun Unit!7771 () Unit!7760)

(assert (=> b!250945 (= e!162752 Unit!7771)))

(declare-fun bm!23608 () Bool)

(assert (=> bm!23608 (= call!23612 (contains!1817 lt!125771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23609 () Bool)

(assert (=> bm!23609 (= call!23609 (contains!1817 lt!125771 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250946 () Bool)

(assert (=> b!250946 (= e!162749 (not call!23609))))

(declare-fun b!250947 () Bool)

(declare-fun e!162748 () Bool)

(assert (=> b!250947 (= e!162748 (= (apply!241 lt!125771 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4476 thiss!1504)))))

(declare-fun b!250948 () Bool)

(assert (=> b!250948 (= e!162747 (validKeyInArray!0 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250949 () Bool)

(assert (=> b!250949 (= e!162755 e!162750)))

(declare-fun res!122876 () Bool)

(assert (=> b!250949 (=> (not res!122876) (not e!162750))))

(assert (=> b!250949 (= res!122876 (contains!1817 lt!125771 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun bm!23610 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!563 (array!12311 array!12309 (_ BitVec 32) (_ BitVec 32) V!8307 V!8307 (_ BitVec 32) Int) ListLongMap!3759)

(assert (=> bm!23610 (= call!23608 (getCurrentListMapNoExtraKeys!563 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))))

(declare-fun b!250950 () Bool)

(declare-fun lt!125762 () Unit!7760)

(assert (=> b!250950 (= e!162752 lt!125762)))

(declare-fun lt!125774 () ListLongMap!3759)

(assert (=> b!250950 (= lt!125774 (getCurrentListMapNoExtraKeys!563 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))))

(declare-fun lt!125763 () (_ BitVec 64))

(assert (=> b!250950 (= lt!125763 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125756 () (_ BitVec 64))

(assert (=> b!250950 (= lt!125756 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125761 () Unit!7760)

(declare-fun addStillContains!217 (ListLongMap!3759 (_ BitVec 64) V!8307 (_ BitVec 64)) Unit!7760)

(assert (=> b!250950 (= lt!125761 (addStillContains!217 lt!125774 lt!125763 (zeroValue!4476 thiss!1504) lt!125756))))

(assert (=> b!250950 (contains!1817 (+!668 lt!125774 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504))) lt!125756)))

(declare-fun lt!125759 () Unit!7760)

(assert (=> b!250950 (= lt!125759 lt!125761)))

(declare-fun lt!125766 () ListLongMap!3759)

(assert (=> b!250950 (= lt!125766 (getCurrentListMapNoExtraKeys!563 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))))

(declare-fun lt!125757 () (_ BitVec 64))

(assert (=> b!250950 (= lt!125757 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125773 () (_ BitVec 64))

(assert (=> b!250950 (= lt!125773 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125775 () Unit!7760)

(declare-fun addApplyDifferent!217 (ListLongMap!3759 (_ BitVec 64) V!8307 (_ BitVec 64)) Unit!7760)

(assert (=> b!250950 (= lt!125775 (addApplyDifferent!217 lt!125766 lt!125757 (minValue!4476 thiss!1504) lt!125773))))

(assert (=> b!250950 (= (apply!241 (+!668 lt!125766 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504))) lt!125773) (apply!241 lt!125766 lt!125773))))

(declare-fun lt!125776 () Unit!7760)

(assert (=> b!250950 (= lt!125776 lt!125775)))

(declare-fun lt!125768 () ListLongMap!3759)

(assert (=> b!250950 (= lt!125768 (getCurrentListMapNoExtraKeys!563 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))))

(declare-fun lt!125769 () (_ BitVec 64))

(assert (=> b!250950 (= lt!125769 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125755 () (_ BitVec 64))

(assert (=> b!250950 (= lt!125755 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125758 () Unit!7760)

(assert (=> b!250950 (= lt!125758 (addApplyDifferent!217 lt!125768 lt!125769 (zeroValue!4476 thiss!1504) lt!125755))))

(assert (=> b!250950 (= (apply!241 (+!668 lt!125768 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504))) lt!125755) (apply!241 lt!125768 lt!125755))))

(declare-fun lt!125765 () Unit!7760)

(assert (=> b!250950 (= lt!125765 lt!125758)))

(declare-fun lt!125764 () ListLongMap!3759)

(assert (=> b!250950 (= lt!125764 (getCurrentListMapNoExtraKeys!563 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))))

(declare-fun lt!125770 () (_ BitVec 64))

(assert (=> b!250950 (= lt!125770 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125772 () (_ BitVec 64))

(assert (=> b!250950 (= lt!125772 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250950 (= lt!125762 (addApplyDifferent!217 lt!125764 lt!125770 (minValue!4476 thiss!1504) lt!125772))))

(assert (=> b!250950 (= (apply!241 (+!668 lt!125764 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504))) lt!125772) (apply!241 lt!125764 lt!125772))))

(declare-fun b!250951 () Bool)

(assert (=> b!250951 (= e!162753 e!162748)))

(declare-fun res!122881 () Bool)

(assert (=> b!250951 (= res!122881 call!23612)))

(assert (=> b!250951 (=> (not res!122881) (not e!162748))))

(assert (= (and d!60981 c!42190) b!250940))

(assert (= (and d!60981 (not c!42190)) b!250935))

(assert (= (and b!250935 c!42191) b!250933))

(assert (= (and b!250935 (not c!42191)) b!250936))

(assert (= (and b!250936 c!42193) b!250941))

(assert (= (and b!250936 (not c!42193)) b!250943))

(assert (= (or b!250941 b!250943) bm!23605))

(assert (= (or b!250933 bm!23605) bm!23604))

(assert (= (or b!250933 b!250941) bm!23606))

(assert (= (or b!250940 bm!23604) bm!23610))

(assert (= (or b!250940 bm!23606) bm!23607))

(assert (= (and d!60981 res!122879) b!250948))

(assert (= (and d!60981 c!42192) b!250950))

(assert (= (and d!60981 (not c!42192)) b!250945))

(assert (= (and d!60981 res!122877) b!250942))

(assert (= (and b!250942 res!122880) b!250931))

(assert (= (and b!250942 (not res!122875)) b!250949))

(assert (= (and b!250949 res!122876) b!250939))

(assert (= (and b!250942 res!122874) b!250944))

(assert (= (and b!250944 c!42189) b!250951))

(assert (= (and b!250944 (not c!42189)) b!250938))

(assert (= (and b!250951 res!122881) b!250947))

(assert (= (or b!250951 b!250938) bm!23608))

(assert (= (and b!250944 res!122873) b!250934))

(assert (= (and b!250934 c!42194) b!250932))

(assert (= (and b!250934 (not c!42194)) b!250946))

(assert (= (and b!250932 res!122878) b!250937))

(assert (= (or b!250932 b!250946) bm!23609))

(declare-fun b_lambda!8091 () Bool)

(assert (=> (not b_lambda!8091) (not b!250939)))

(declare-fun t!8766 () Bool)

(declare-fun tb!2995 () Bool)

(assert (=> (and b!250783 (= (defaultEntry!4635 thiss!1504) (defaultEntry!4635 thiss!1504)) t!8766) tb!2995))

(declare-fun result!5307 () Bool)

(assert (=> tb!2995 (= result!5307 tp_is_empty!6495)))

(assert (=> b!250939 t!8766))

(declare-fun b_and!13659 () Bool)

(assert (= b_and!13655 (and (=> t!8766 result!5307) b_and!13659)))

(declare-fun m!267227 () Bool)

(assert (=> b!250948 m!267227))

(assert (=> b!250948 m!267227))

(declare-fun m!267229 () Bool)

(assert (=> b!250948 m!267229))

(assert (=> d!60981 m!267119))

(declare-fun m!267231 () Bool)

(assert (=> b!250937 m!267231))

(declare-fun m!267233 () Bool)

(assert (=> bm!23610 m!267233))

(declare-fun m!267235 () Bool)

(assert (=> bm!23608 m!267235))

(declare-fun m!267237 () Bool)

(assert (=> b!250947 m!267237))

(declare-fun m!267239 () Bool)

(assert (=> bm!23607 m!267239))

(declare-fun m!267241 () Bool)

(assert (=> b!250939 m!267241))

(declare-fun m!267243 () Bool)

(assert (=> b!250939 m!267243))

(declare-fun m!267245 () Bool)

(assert (=> b!250939 m!267245))

(assert (=> b!250939 m!267243))

(assert (=> b!250939 m!267227))

(assert (=> b!250939 m!267227))

(declare-fun m!267247 () Bool)

(assert (=> b!250939 m!267247))

(assert (=> b!250939 m!267241))

(assert (=> b!250931 m!267227))

(assert (=> b!250931 m!267227))

(assert (=> b!250931 m!267229))

(declare-fun m!267249 () Bool)

(assert (=> b!250940 m!267249))

(assert (=> b!250949 m!267227))

(assert (=> b!250949 m!267227))

(declare-fun m!267251 () Bool)

(assert (=> b!250949 m!267251))

(declare-fun m!267253 () Bool)

(assert (=> bm!23609 m!267253))

(declare-fun m!267255 () Bool)

(assert (=> b!250950 m!267255))

(assert (=> b!250950 m!267255))

(declare-fun m!267257 () Bool)

(assert (=> b!250950 m!267257))

(assert (=> b!250950 m!267233))

(declare-fun m!267259 () Bool)

(assert (=> b!250950 m!267259))

(declare-fun m!267261 () Bool)

(assert (=> b!250950 m!267261))

(assert (=> b!250950 m!267227))

(declare-fun m!267263 () Bool)

(assert (=> b!250950 m!267263))

(declare-fun m!267265 () Bool)

(assert (=> b!250950 m!267265))

(declare-fun m!267267 () Bool)

(assert (=> b!250950 m!267267))

(declare-fun m!267269 () Bool)

(assert (=> b!250950 m!267269))

(declare-fun m!267271 () Bool)

(assert (=> b!250950 m!267271))

(assert (=> b!250950 m!267265))

(declare-fun m!267273 () Bool)

(assert (=> b!250950 m!267273))

(declare-fun m!267275 () Bool)

(assert (=> b!250950 m!267275))

(declare-fun m!267277 () Bool)

(assert (=> b!250950 m!267277))

(assert (=> b!250950 m!267269))

(declare-fun m!267279 () Bool)

(assert (=> b!250950 m!267279))

(assert (=> b!250950 m!267279))

(declare-fun m!267281 () Bool)

(assert (=> b!250950 m!267281))

(declare-fun m!267283 () Bool)

(assert (=> b!250950 m!267283))

(assert (=> b!250792 d!60981))

(declare-fun d!60983 () Bool)

(declare-fun res!122886 () Bool)

(declare-fun e!162762 () Bool)

(assert (=> d!60983 (=> res!122886 e!162762)))

(assert (=> d!60983 (= res!122886 (= (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60983 (= (arrayContainsKey!0 (_keys!6773 thiss!1504) key!932 #b00000000000000000000000000000000) e!162762)))

(declare-fun b!250958 () Bool)

(declare-fun e!162763 () Bool)

(assert (=> b!250958 (= e!162762 e!162763)))

(declare-fun res!122887 () Bool)

(assert (=> b!250958 (=> (not res!122887) (not e!162763))))

(assert (=> b!250958 (= res!122887 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun b!250959 () Bool)

(assert (=> b!250959 (= e!162763 (arrayContainsKey!0 (_keys!6773 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60983 (not res!122886)) b!250958))

(assert (= (and b!250958 res!122887) b!250959))

(assert (=> d!60983 m!267227))

(declare-fun m!267285 () Bool)

(assert (=> b!250959 m!267285))

(assert (=> bm!23577 d!60983))

(declare-fun d!60985 () Bool)

(declare-fun lt!125785 () SeekEntryResult!1124)

(assert (=> d!60985 (and (or ((_ is Undefined!1124) lt!125785) (not ((_ is Found!1124) lt!125785)) (and (bvsge (index!6667 lt!125785) #b00000000000000000000000000000000) (bvslt (index!6667 lt!125785) (size!6182 (_keys!6773 thiss!1504))))) (or ((_ is Undefined!1124) lt!125785) ((_ is Found!1124) lt!125785) (not ((_ is MissingZero!1124) lt!125785)) (and (bvsge (index!6666 lt!125785) #b00000000000000000000000000000000) (bvslt (index!6666 lt!125785) (size!6182 (_keys!6773 thiss!1504))))) (or ((_ is Undefined!1124) lt!125785) ((_ is Found!1124) lt!125785) ((_ is MissingZero!1124) lt!125785) (not ((_ is MissingVacant!1124) lt!125785)) (and (bvsge (index!6669 lt!125785) #b00000000000000000000000000000000) (bvslt (index!6669 lt!125785) (size!6182 (_keys!6773 thiss!1504))))) (or ((_ is Undefined!1124) lt!125785) (ite ((_ is Found!1124) lt!125785) (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6667 lt!125785)) key!932) (ite ((_ is MissingZero!1124) lt!125785) (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6666 lt!125785)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1124) lt!125785) (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6669 lt!125785)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!162772 () SeekEntryResult!1124)

(assert (=> d!60985 (= lt!125785 e!162772)))

(declare-fun c!42201 () Bool)

(declare-fun lt!125783 () SeekEntryResult!1124)

(assert (=> d!60985 (= c!42201 (and ((_ is Intermediate!1124) lt!125783) (undefined!1936 lt!125783)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12311 (_ BitVec 32)) SeekEntryResult!1124)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60985 (= lt!125783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10825 thiss!1504)) key!932 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)))))

(assert (=> d!60985 (validMask!0 (mask!10825 thiss!1504))))

(assert (=> d!60985 (= (seekEntryOrOpen!0 key!932 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)) lt!125785)))

(declare-fun b!250972 () Bool)

(declare-fun c!42202 () Bool)

(declare-fun lt!125784 () (_ BitVec 64))

(assert (=> b!250972 (= c!42202 (= lt!125784 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162770 () SeekEntryResult!1124)

(declare-fun e!162771 () SeekEntryResult!1124)

(assert (=> b!250972 (= e!162770 e!162771)))

(declare-fun b!250973 () Bool)

(assert (=> b!250973 (= e!162771 (MissingZero!1124 (index!6668 lt!125783)))))

(declare-fun b!250974 () Bool)

(assert (=> b!250974 (= e!162770 (Found!1124 (index!6668 lt!125783)))))

(declare-fun b!250975 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12311 (_ BitVec 32)) SeekEntryResult!1124)

(assert (=> b!250975 (= e!162771 (seekKeyOrZeroReturnVacant!0 (x!24692 lt!125783) (index!6668 lt!125783) (index!6668 lt!125783) key!932 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)))))

(declare-fun b!250976 () Bool)

(assert (=> b!250976 (= e!162772 e!162770)))

(assert (=> b!250976 (= lt!125784 (select (arr!5837 (_keys!6773 thiss!1504)) (index!6668 lt!125783)))))

(declare-fun c!42203 () Bool)

(assert (=> b!250976 (= c!42203 (= lt!125784 key!932))))

(declare-fun b!250977 () Bool)

(assert (=> b!250977 (= e!162772 Undefined!1124)))

(assert (= (and d!60985 c!42201) b!250977))

(assert (= (and d!60985 (not c!42201)) b!250976))

(assert (= (and b!250976 c!42203) b!250974))

(assert (= (and b!250976 (not c!42203)) b!250972))

(assert (= (and b!250972 c!42202) b!250973))

(assert (= (and b!250972 (not c!42202)) b!250975))

(declare-fun m!267287 () Bool)

(assert (=> d!60985 m!267287))

(declare-fun m!267289 () Bool)

(assert (=> d!60985 m!267289))

(declare-fun m!267291 () Bool)

(assert (=> d!60985 m!267291))

(declare-fun m!267293 () Bool)

(assert (=> d!60985 m!267293))

(assert (=> d!60985 m!267119))

(assert (=> d!60985 m!267289))

(declare-fun m!267295 () Bool)

(assert (=> d!60985 m!267295))

(declare-fun m!267297 () Bool)

(assert (=> b!250975 m!267297))

(declare-fun m!267299 () Bool)

(assert (=> b!250976 m!267299))

(assert (=> b!250775 d!60985))

(declare-fun d!60987 () Bool)

(assert (=> d!60987 (= (array_inv!3853 (_keys!6773 thiss!1504)) (bvsge (size!6182 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250783 d!60987))

(declare-fun d!60989 () Bool)

(assert (=> d!60989 (= (array_inv!3854 (_values!4618 thiss!1504)) (bvsge (size!6181 (_values!4618 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250783 d!60989))

(declare-fun d!60991 () Bool)

(declare-fun e!162775 () Bool)

(assert (=> d!60991 e!162775))

(declare-fun res!122892 () Bool)

(assert (=> d!60991 (=> (not res!122892) (not e!162775))))

(declare-fun lt!125790 () SeekEntryResult!1124)

(assert (=> d!60991 (= res!122892 ((_ is Found!1124) lt!125790))))

(assert (=> d!60991 (= lt!125790 (seekEntryOrOpen!0 key!932 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)))))

(declare-fun lt!125791 () Unit!7760)

(declare-fun choose!1190 (array!12311 array!12309 (_ BitVec 32) (_ BitVec 32) V!8307 V!8307 (_ BitVec 64) Int) Unit!7760)

(assert (=> d!60991 (= lt!125791 (choose!1190 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) key!932 (defaultEntry!4635 thiss!1504)))))

(assert (=> d!60991 (validMask!0 (mask!10825 thiss!1504))))

(assert (=> d!60991 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!399 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) key!932 (defaultEntry!4635 thiss!1504)) lt!125791)))

(declare-fun b!250982 () Bool)

(declare-fun res!122893 () Bool)

(assert (=> b!250982 (=> (not res!122893) (not e!162775))))

(assert (=> b!250982 (= res!122893 (inRange!0 (index!6667 lt!125790) (mask!10825 thiss!1504)))))

(declare-fun b!250983 () Bool)

(assert (=> b!250983 (= e!162775 (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6667 lt!125790)) key!932))))

(assert (=> b!250983 (and (bvsge (index!6667 lt!125790) #b00000000000000000000000000000000) (bvslt (index!6667 lt!125790) (size!6182 (_keys!6773 thiss!1504))))))

(assert (= (and d!60991 res!122892) b!250982))

(assert (= (and b!250982 res!122893) b!250983))

(assert (=> d!60991 m!267115))

(declare-fun m!267301 () Bool)

(assert (=> d!60991 m!267301))

(assert (=> d!60991 m!267119))

(declare-fun m!267303 () Bool)

(assert (=> b!250982 m!267303))

(declare-fun m!267305 () Bool)

(assert (=> b!250983 m!267305))

(assert (=> b!250781 d!60991))

(declare-fun b!250992 () Bool)

(declare-fun res!122903 () Bool)

(declare-fun e!162780 () Bool)

(assert (=> b!250992 (=> (not res!122903) (not e!162780))))

(assert (=> b!250992 (= res!122903 (not (validKeyInArray!0 (select (arr!5837 (_keys!6773 thiss!1504)) index!297))))))

(declare-fun b!250995 () Bool)

(declare-fun e!162781 () Bool)

(assert (=> b!250995 (= e!162781 (= (arrayCountValidKeys!0 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6773 thiss!1504) #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!250993 () Bool)

(declare-fun res!122905 () Bool)

(assert (=> b!250993 (=> (not res!122905) (not e!162780))))

(assert (=> b!250993 (= res!122905 (validKeyInArray!0 key!932))))

(declare-fun d!60993 () Bool)

(assert (=> d!60993 e!162781))

(declare-fun res!122902 () Bool)

(assert (=> d!60993 (=> (not res!122902) (not e!162781))))

(assert (=> d!60993 (= res!122902 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6182 (_keys!6773 thiss!1504)))))))

(declare-fun lt!125794 () Unit!7760)

(declare-fun choose!1 (array!12311 (_ BitVec 32) (_ BitVec 64)) Unit!7760)

(assert (=> d!60993 (= lt!125794 (choose!1 (_keys!6773 thiss!1504) index!297 key!932))))

(assert (=> d!60993 e!162780))

(declare-fun res!122904 () Bool)

(assert (=> d!60993 (=> (not res!122904) (not e!162780))))

(assert (=> d!60993 (= res!122904 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6182 (_keys!6773 thiss!1504)))))))

(assert (=> d!60993 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6773 thiss!1504) index!297 key!932) lt!125794)))

(declare-fun b!250994 () Bool)

(assert (=> b!250994 (= e!162780 (bvslt (size!6182 (_keys!6773 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!60993 res!122904) b!250992))

(assert (= (and b!250992 res!122903) b!250993))

(assert (= (and b!250993 res!122905) b!250994))

(assert (= (and d!60993 res!122902) b!250995))

(declare-fun m!267307 () Bool)

(assert (=> b!250992 m!267307))

(assert (=> b!250992 m!267307))

(declare-fun m!267309 () Bool)

(assert (=> b!250992 m!267309))

(assert (=> b!250995 m!267129))

(declare-fun m!267311 () Bool)

(assert (=> b!250995 m!267311))

(assert (=> b!250995 m!267131))

(declare-fun m!267313 () Bool)

(assert (=> b!250993 m!267313))

(declare-fun m!267315 () Bool)

(assert (=> d!60993 m!267315))

(assert (=> b!250791 d!60993))

(declare-fun d!60995 () Bool)

(assert (=> d!60995 (= (validMask!0 (mask!10825 thiss!1504)) (and (or (= (mask!10825 thiss!1504) #b00000000000000000000000000000111) (= (mask!10825 thiss!1504) #b00000000000000000000000000001111) (= (mask!10825 thiss!1504) #b00000000000000000000000000011111) (= (mask!10825 thiss!1504) #b00000000000000000000000000111111) (= (mask!10825 thiss!1504) #b00000000000000000000000001111111) (= (mask!10825 thiss!1504) #b00000000000000000000000011111111) (= (mask!10825 thiss!1504) #b00000000000000000000000111111111) (= (mask!10825 thiss!1504) #b00000000000000000000001111111111) (= (mask!10825 thiss!1504) #b00000000000000000000011111111111) (= (mask!10825 thiss!1504) #b00000000000000000000111111111111) (= (mask!10825 thiss!1504) #b00000000000000000001111111111111) (= (mask!10825 thiss!1504) #b00000000000000000011111111111111) (= (mask!10825 thiss!1504) #b00000000000000000111111111111111) (= (mask!10825 thiss!1504) #b00000000000000001111111111111111) (= (mask!10825 thiss!1504) #b00000000000000011111111111111111) (= (mask!10825 thiss!1504) #b00000000000000111111111111111111) (= (mask!10825 thiss!1504) #b00000000000001111111111111111111) (= (mask!10825 thiss!1504) #b00000000000011111111111111111111) (= (mask!10825 thiss!1504) #b00000000000111111111111111111111) (= (mask!10825 thiss!1504) #b00000000001111111111111111111111) (= (mask!10825 thiss!1504) #b00000000011111111111111111111111) (= (mask!10825 thiss!1504) #b00000000111111111111111111111111) (= (mask!10825 thiss!1504) #b00000001111111111111111111111111) (= (mask!10825 thiss!1504) #b00000011111111111111111111111111) (= (mask!10825 thiss!1504) #b00000111111111111111111111111111) (= (mask!10825 thiss!1504) #b00001111111111111111111111111111) (= (mask!10825 thiss!1504) #b00011111111111111111111111111111) (= (mask!10825 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10825 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!250791 d!60995))

(declare-fun bm!23613 () Bool)

(declare-fun call!23616 () Bool)

(assert (=> bm!23613 (= call!23616 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125657 (mask!10825 thiss!1504)))))

(declare-fun b!251004 () Bool)

(declare-fun e!162788 () Bool)

(assert (=> b!251004 (= e!162788 call!23616)))

(declare-fun d!60997 () Bool)

(declare-fun res!122911 () Bool)

(declare-fun e!162790 () Bool)

(assert (=> d!60997 (=> res!122911 e!162790)))

(assert (=> d!60997 (= res!122911 (bvsge #b00000000000000000000000000000000 (size!6182 lt!125657)))))

(assert (=> d!60997 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125657 (mask!10825 thiss!1504)) e!162790)))

(declare-fun b!251005 () Bool)

(declare-fun e!162789 () Bool)

(assert (=> b!251005 (= e!162788 e!162789)))

(declare-fun lt!125802 () (_ BitVec 64))

(assert (=> b!251005 (= lt!125802 (select (arr!5837 lt!125657) #b00000000000000000000000000000000))))

(declare-fun lt!125801 () Unit!7760)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12311 (_ BitVec 64) (_ BitVec 32)) Unit!7760)

(assert (=> b!251005 (= lt!125801 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125657 lt!125802 #b00000000000000000000000000000000))))

(assert (=> b!251005 (arrayContainsKey!0 lt!125657 lt!125802 #b00000000000000000000000000000000)))

(declare-fun lt!125803 () Unit!7760)

(assert (=> b!251005 (= lt!125803 lt!125801)))

(declare-fun res!122910 () Bool)

(assert (=> b!251005 (= res!122910 (= (seekEntryOrOpen!0 (select (arr!5837 lt!125657) #b00000000000000000000000000000000) lt!125657 (mask!10825 thiss!1504)) (Found!1124 #b00000000000000000000000000000000)))))

(assert (=> b!251005 (=> (not res!122910) (not e!162789))))

(declare-fun b!251006 () Bool)

(assert (=> b!251006 (= e!162789 call!23616)))

(declare-fun b!251007 () Bool)

(assert (=> b!251007 (= e!162790 e!162788)))

(declare-fun c!42206 () Bool)

(assert (=> b!251007 (= c!42206 (validKeyInArray!0 (select (arr!5837 lt!125657) #b00000000000000000000000000000000)))))

(assert (= (and d!60997 (not res!122911)) b!251007))

(assert (= (and b!251007 c!42206) b!251005))

(assert (= (and b!251007 (not c!42206)) b!251004))

(assert (= (and b!251005 res!122910) b!251006))

(assert (= (or b!251006 b!251004) bm!23613))

(declare-fun m!267317 () Bool)

(assert (=> bm!23613 m!267317))

(declare-fun m!267319 () Bool)

(assert (=> b!251005 m!267319))

(declare-fun m!267321 () Bool)

(assert (=> b!251005 m!267321))

(declare-fun m!267323 () Bool)

(assert (=> b!251005 m!267323))

(assert (=> b!251005 m!267319))

(declare-fun m!267325 () Bool)

(assert (=> b!251005 m!267325))

(assert (=> b!251007 m!267319))

(assert (=> b!251007 m!267319))

(declare-fun m!267327 () Bool)

(assert (=> b!251007 m!267327))

(assert (=> b!250791 d!60997))

(declare-fun d!60999 () Bool)

(declare-fun lt!125806 () (_ BitVec 32))

(assert (=> d!60999 (and (bvsge lt!125806 #b00000000000000000000000000000000) (bvsle lt!125806 (bvsub (size!6182 lt!125657) #b00000000000000000000000000000000)))))

(declare-fun e!162796 () (_ BitVec 32))

(assert (=> d!60999 (= lt!125806 e!162796)))

(declare-fun c!42212 () Bool)

(assert (=> d!60999 (= c!42212 (bvsge #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(assert (=> d!60999 (and (bvsle #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6182 (_keys!6773 thiss!1504)) (size!6182 lt!125657)))))

(assert (=> d!60999 (= (arrayCountValidKeys!0 lt!125657 #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) lt!125806)))

(declare-fun bm!23616 () Bool)

(declare-fun call!23619 () (_ BitVec 32))

(assert (=> bm!23616 (= call!23619 (arrayCountValidKeys!0 lt!125657 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun b!251016 () Bool)

(declare-fun e!162795 () (_ BitVec 32))

(assert (=> b!251016 (= e!162795 (bvadd #b00000000000000000000000000000001 call!23619))))

(declare-fun b!251017 () Bool)

(assert (=> b!251017 (= e!162796 e!162795)))

(declare-fun c!42211 () Bool)

(assert (=> b!251017 (= c!42211 (validKeyInArray!0 (select (arr!5837 lt!125657) #b00000000000000000000000000000000)))))

(declare-fun b!251018 () Bool)

(assert (=> b!251018 (= e!162796 #b00000000000000000000000000000000)))

(declare-fun b!251019 () Bool)

(assert (=> b!251019 (= e!162795 call!23619)))

(assert (= (and d!60999 c!42212) b!251018))

(assert (= (and d!60999 (not c!42212)) b!251017))

(assert (= (and b!251017 c!42211) b!251016))

(assert (= (and b!251017 (not c!42211)) b!251019))

(assert (= (or b!251016 b!251019) bm!23616))

(declare-fun m!267329 () Bool)

(assert (=> bm!23616 m!267329))

(assert (=> b!251017 m!267319))

(assert (=> b!251017 m!267319))

(assert (=> b!251017 m!267327))

(assert (=> b!250791 d!60999))

(declare-fun d!61001 () Bool)

(declare-fun e!162799 () Bool)

(assert (=> d!61001 e!162799))

(declare-fun res!122914 () Bool)

(assert (=> d!61001 (=> (not res!122914) (not e!162799))))

(assert (=> d!61001 (= res!122914 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6182 (_keys!6773 thiss!1504)))))))

(declare-fun lt!125809 () Unit!7760)

(declare-fun choose!41 (array!12311 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3726) Unit!7760)

(assert (=> d!61001 (= lt!125809 (choose!41 (_keys!6773 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3723))))

(assert (=> d!61001 (bvslt (size!6182 (_keys!6773 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61001 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6773 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3723) lt!125809)))

(declare-fun b!251022 () Bool)

(assert (=> b!251022 (= e!162799 (arrayNoDuplicates!0 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) #b00000000000000000000000000000000 Nil!3723))))

(assert (= (and d!61001 res!122914) b!251022))

(declare-fun m!267331 () Bool)

(assert (=> d!61001 m!267331))

(assert (=> b!251022 m!267129))

(declare-fun m!267333 () Bool)

(assert (=> b!251022 m!267333))

(assert (=> b!250791 d!61001))

(assert (=> b!250791 d!60983))

(declare-fun d!61003 () Bool)

(declare-fun e!162802 () Bool)

(assert (=> d!61003 e!162802))

(declare-fun res!122917 () Bool)

(assert (=> d!61003 (=> (not res!122917) (not e!162802))))

(assert (=> d!61003 (= res!122917 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6182 (_keys!6773 thiss!1504)))))))

(declare-fun lt!125812 () Unit!7760)

(declare-fun choose!102 ((_ BitVec 64) array!12311 (_ BitVec 32) (_ BitVec 32)) Unit!7760)

(assert (=> d!61003 (= lt!125812 (choose!102 key!932 (_keys!6773 thiss!1504) index!297 (mask!10825 thiss!1504)))))

(assert (=> d!61003 (validMask!0 (mask!10825 thiss!1504))))

(assert (=> d!61003 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6773 thiss!1504) index!297 (mask!10825 thiss!1504)) lt!125812)))

(declare-fun b!251025 () Bool)

(assert (=> b!251025 (= e!162802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) (mask!10825 thiss!1504)))))

(assert (= (and d!61003 res!122917) b!251025))

(declare-fun m!267335 () Bool)

(assert (=> d!61003 m!267335))

(assert (=> d!61003 m!267119))

(assert (=> b!251025 m!267129))

(declare-fun m!267337 () Bool)

(assert (=> b!251025 m!267337))

(assert (=> b!250791 d!61003))

(declare-fun d!61005 () Bool)

(declare-fun lt!125813 () (_ BitVec 32))

(assert (=> d!61005 (and (bvsge lt!125813 #b00000000000000000000000000000000) (bvsle lt!125813 (bvsub (size!6182 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!162804 () (_ BitVec 32))

(assert (=> d!61005 (= lt!125813 e!162804)))

(declare-fun c!42214 () Bool)

(assert (=> d!61005 (= c!42214 (bvsge #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(assert (=> d!61005 (and (bvsle #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6182 (_keys!6773 thiss!1504)) (size!6182 (_keys!6773 thiss!1504))))))

(assert (=> d!61005 (= (arrayCountValidKeys!0 (_keys!6773 thiss!1504) #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) lt!125813)))

(declare-fun bm!23617 () Bool)

(declare-fun call!23620 () (_ BitVec 32))

(assert (=> bm!23617 (= call!23620 (arrayCountValidKeys!0 (_keys!6773 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun b!251026 () Bool)

(declare-fun e!162803 () (_ BitVec 32))

(assert (=> b!251026 (= e!162803 (bvadd #b00000000000000000000000000000001 call!23620))))

(declare-fun b!251027 () Bool)

(assert (=> b!251027 (= e!162804 e!162803)))

(declare-fun c!42213 () Bool)

(assert (=> b!251027 (= c!42213 (validKeyInArray!0 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251028 () Bool)

(assert (=> b!251028 (= e!162804 #b00000000000000000000000000000000)))

(declare-fun b!251029 () Bool)

(assert (=> b!251029 (= e!162803 call!23620)))

(assert (= (and d!61005 c!42214) b!251028))

(assert (= (and d!61005 (not c!42214)) b!251027))

(assert (= (and b!251027 c!42213) b!251026))

(assert (= (and b!251027 (not c!42213)) b!251029))

(assert (= (or b!251026 b!251029) bm!23617))

(declare-fun m!267339 () Bool)

(assert (=> bm!23617 m!267339))

(assert (=> b!251027 m!267227))

(assert (=> b!251027 m!267227))

(assert (=> b!251027 m!267229))

(assert (=> b!250791 d!61005))

(declare-fun d!61007 () Bool)

(declare-fun res!122926 () Bool)

(declare-fun e!162815 () Bool)

(assert (=> d!61007 (=> res!122926 e!162815)))

(assert (=> d!61007 (= res!122926 (bvsge #b00000000000000000000000000000000 (size!6182 lt!125657)))))

(assert (=> d!61007 (= (arrayNoDuplicates!0 lt!125657 #b00000000000000000000000000000000 Nil!3723) e!162815)))

(declare-fun b!251040 () Bool)

(declare-fun e!162814 () Bool)

(declare-fun contains!1819 (List!3726 (_ BitVec 64)) Bool)

(assert (=> b!251040 (= e!162814 (contains!1819 Nil!3723 (select (arr!5837 lt!125657) #b00000000000000000000000000000000)))))

(declare-fun b!251041 () Bool)

(declare-fun e!162813 () Bool)

(declare-fun e!162816 () Bool)

(assert (=> b!251041 (= e!162813 e!162816)))

(declare-fun c!42217 () Bool)

(assert (=> b!251041 (= c!42217 (validKeyInArray!0 (select (arr!5837 lt!125657) #b00000000000000000000000000000000)))))

(declare-fun bm!23620 () Bool)

(declare-fun call!23623 () Bool)

(assert (=> bm!23620 (= call!23623 (arrayNoDuplicates!0 lt!125657 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42217 (Cons!3722 (select (arr!5837 lt!125657) #b00000000000000000000000000000000) Nil!3723) Nil!3723)))))

(declare-fun b!251042 () Bool)

(assert (=> b!251042 (= e!162815 e!162813)))

(declare-fun res!122925 () Bool)

(assert (=> b!251042 (=> (not res!122925) (not e!162813))))

(assert (=> b!251042 (= res!122925 (not e!162814))))

(declare-fun res!122924 () Bool)

(assert (=> b!251042 (=> (not res!122924) (not e!162814))))

(assert (=> b!251042 (= res!122924 (validKeyInArray!0 (select (arr!5837 lt!125657) #b00000000000000000000000000000000)))))

(declare-fun b!251043 () Bool)

(assert (=> b!251043 (= e!162816 call!23623)))

(declare-fun b!251044 () Bool)

(assert (=> b!251044 (= e!162816 call!23623)))

(assert (= (and d!61007 (not res!122926)) b!251042))

(assert (= (and b!251042 res!122924) b!251040))

(assert (= (and b!251042 res!122925) b!251041))

(assert (= (and b!251041 c!42217) b!251043))

(assert (= (and b!251041 (not c!42217)) b!251044))

(assert (= (or b!251043 b!251044) bm!23620))

(assert (=> b!251040 m!267319))

(assert (=> b!251040 m!267319))

(declare-fun m!267341 () Bool)

(assert (=> b!251040 m!267341))

(assert (=> b!251041 m!267319))

(assert (=> b!251041 m!267319))

(assert (=> b!251041 m!267327))

(assert (=> bm!23620 m!267319))

(declare-fun m!267343 () Bool)

(assert (=> bm!23620 m!267343))

(assert (=> b!251042 m!267319))

(assert (=> b!251042 m!267319))

(assert (=> b!251042 m!267327))

(assert (=> b!250791 d!61007))

(declare-fun d!61009 () Bool)

(assert (=> d!61009 (= (inRange!0 (ite c!42153 (index!6666 lt!125655) (index!6669 lt!125655)) (mask!10825 thiss!1504)) (and (bvsge (ite c!42153 (index!6666 lt!125655) (index!6669 lt!125655)) #b00000000000000000000000000000000) (bvslt (ite c!42153 (index!6666 lt!125655) (index!6669 lt!125655)) (bvadd (mask!10825 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23576 d!61009))

(declare-fun d!61011 () Bool)

(declare-fun res!122933 () Bool)

(declare-fun e!162819 () Bool)

(assert (=> d!61011 (=> (not res!122933) (not e!162819))))

(declare-fun simpleValid!264 (LongMapFixedSize!3708) Bool)

(assert (=> d!61011 (= res!122933 (simpleValid!264 thiss!1504))))

(assert (=> d!61011 (= (valid!1449 thiss!1504) e!162819)))

(declare-fun b!251051 () Bool)

(declare-fun res!122934 () Bool)

(assert (=> b!251051 (=> (not res!122934) (not e!162819))))

(assert (=> b!251051 (= res!122934 (= (arrayCountValidKeys!0 (_keys!6773 thiss!1504) #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) (_size!1903 thiss!1504)))))

(declare-fun b!251052 () Bool)

(declare-fun res!122935 () Bool)

(assert (=> b!251052 (=> (not res!122935) (not e!162819))))

(assert (=> b!251052 (= res!122935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)))))

(declare-fun b!251053 () Bool)

(assert (=> b!251053 (= e!162819 (arrayNoDuplicates!0 (_keys!6773 thiss!1504) #b00000000000000000000000000000000 Nil!3723))))

(assert (= (and d!61011 res!122933) b!251051))

(assert (= (and b!251051 res!122934) b!251052))

(assert (= (and b!251052 res!122935) b!251053))

(declare-fun m!267345 () Bool)

(assert (=> d!61011 m!267345))

(assert (=> b!251051 m!267131))

(declare-fun m!267347 () Bool)

(assert (=> b!251052 m!267347))

(declare-fun m!267349 () Bool)

(assert (=> b!251053 m!267349))

(assert (=> start!23922 d!61011))

(declare-fun b!251061 () Bool)

(declare-fun e!162825 () Bool)

(assert (=> b!251061 (= e!162825 tp_is_empty!6495)))

(declare-fun condMapEmpty!11044 () Bool)

(declare-fun mapDefault!11044 () ValueCell!2904)

(assert (=> mapNonEmpty!11038 (= condMapEmpty!11044 (= mapRest!11038 ((as const (Array (_ BitVec 32) ValueCell!2904)) mapDefault!11044)))))

(declare-fun mapRes!11044 () Bool)

(assert (=> mapNonEmpty!11038 (= tp!23166 (and e!162825 mapRes!11044))))

(declare-fun b!251060 () Bool)

(declare-fun e!162824 () Bool)

(assert (=> b!251060 (= e!162824 tp_is_empty!6495)))

(declare-fun mapNonEmpty!11044 () Bool)

(declare-fun tp!23176 () Bool)

(assert (=> mapNonEmpty!11044 (= mapRes!11044 (and tp!23176 e!162824))))

(declare-fun mapKey!11044 () (_ BitVec 32))

(declare-fun mapRest!11044 () (Array (_ BitVec 32) ValueCell!2904))

(declare-fun mapValue!11044 () ValueCell!2904)

(assert (=> mapNonEmpty!11044 (= mapRest!11038 (store mapRest!11044 mapKey!11044 mapValue!11044))))

(declare-fun mapIsEmpty!11044 () Bool)

(assert (=> mapIsEmpty!11044 mapRes!11044))

(assert (= (and mapNonEmpty!11038 condMapEmpty!11044) mapIsEmpty!11044))

(assert (= (and mapNonEmpty!11038 (not condMapEmpty!11044)) mapNonEmpty!11044))

(assert (= (and mapNonEmpty!11044 ((_ is ValueCellFull!2904) mapValue!11044)) b!251060))

(assert (= (and mapNonEmpty!11038 ((_ is ValueCellFull!2904) mapDefault!11044)) b!251061))

(declare-fun m!267351 () Bool)

(assert (=> mapNonEmpty!11044 m!267351))

(declare-fun b_lambda!8093 () Bool)

(assert (= b_lambda!8091 (or (and b!250783 b_free!6633) b_lambda!8093)))

(check-sat (not d!60985) (not b!251027) (not b!251053) (not b!250995) (not b!250947) (not b!251041) (not bm!23613) (not b!251007) (not b!251017) (not b!250992) (not b!250888) (not b!250939) (not d!60975) (not bm!23617) (not bm!23620) (not b!250975) (not d!61003) (not b!251022) (not bm!23589) (not b_next!6633) (not d!60979) (not b!250950) (not b!250982) (not b!250937) (not d!61001) (not b!250931) b_and!13659 (not mapNonEmpty!11044) (not b!250959) (not b!251042) (not b!250940) (not b!250949) (not bm!23609) (not b_lambda!8093) (not b!250886) (not d!60981) (not bm!23610) (not b!251005) (not d!60991) (not bm!23588) (not d!60993) (not b!251051) tp_is_empty!6495 (not b!250948) (not bm!23608) (not d!61011) (not d!60973) (not bm!23616) (not b!251025) (not b!251052) (not bm!23607) (not b!251040) (not b!250993))
(check-sat b_and!13659 (not b_next!6633))
(get-model)

(declare-fun d!61013 () Bool)

(declare-fun get!3001 (Option!305) V!8307)

(assert (=> d!61013 (= (apply!241 lt!125771 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3001 (getValueByKey!299 (toList!1895 lt!125771) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8988 () Bool)

(assert (= bs!8988 d!61013))

(declare-fun m!267353 () Bool)

(assert (=> bs!8988 m!267353))

(assert (=> bs!8988 m!267353))

(declare-fun m!267355 () Bool)

(assert (=> bs!8988 m!267355))

(assert (=> b!250947 d!61013))

(declare-fun d!61015 () Bool)

(declare-fun res!122938 () Bool)

(declare-fun e!162828 () Bool)

(assert (=> d!61015 (=> res!122938 e!162828)))

(assert (=> d!61015 (= res!122938 (bvsge #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(assert (=> d!61015 (= (arrayNoDuplicates!0 (_keys!6773 thiss!1504) #b00000000000000000000000000000000 Nil!3723) e!162828)))

(declare-fun b!251062 () Bool)

(declare-fun e!162827 () Bool)

(assert (=> b!251062 (= e!162827 (contains!1819 Nil!3723 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251063 () Bool)

(declare-fun e!162826 () Bool)

(declare-fun e!162829 () Bool)

(assert (=> b!251063 (= e!162826 e!162829)))

(declare-fun c!42218 () Bool)

(assert (=> b!251063 (= c!42218 (validKeyInArray!0 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23621 () Bool)

(declare-fun call!23624 () Bool)

(assert (=> bm!23621 (= call!23624 (arrayNoDuplicates!0 (_keys!6773 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42218 (Cons!3722 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000) Nil!3723) Nil!3723)))))

(declare-fun b!251064 () Bool)

(assert (=> b!251064 (= e!162828 e!162826)))

(declare-fun res!122937 () Bool)

(assert (=> b!251064 (=> (not res!122937) (not e!162826))))

(assert (=> b!251064 (= res!122937 (not e!162827))))

(declare-fun res!122936 () Bool)

(assert (=> b!251064 (=> (not res!122936) (not e!162827))))

(assert (=> b!251064 (= res!122936 (validKeyInArray!0 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251065 () Bool)

(assert (=> b!251065 (= e!162829 call!23624)))

(declare-fun b!251066 () Bool)

(assert (=> b!251066 (= e!162829 call!23624)))

(assert (= (and d!61015 (not res!122938)) b!251064))

(assert (= (and b!251064 res!122936) b!251062))

(assert (= (and b!251064 res!122937) b!251063))

(assert (= (and b!251063 c!42218) b!251065))

(assert (= (and b!251063 (not c!42218)) b!251066))

(assert (= (or b!251065 b!251066) bm!23621))

(assert (=> b!251062 m!267227))

(assert (=> b!251062 m!267227))

(declare-fun m!267357 () Bool)

(assert (=> b!251062 m!267357))

(assert (=> b!251063 m!267227))

(assert (=> b!251063 m!267227))

(assert (=> b!251063 m!267229))

(assert (=> bm!23621 m!267227))

(declare-fun m!267359 () Bool)

(assert (=> bm!23621 m!267359))

(assert (=> b!251064 m!267227))

(assert (=> b!251064 m!267227))

(assert (=> b!251064 m!267229))

(assert (=> b!251053 d!61015))

(declare-fun d!61017 () Bool)

(declare-fun e!162831 () Bool)

(assert (=> d!61017 e!162831))

(declare-fun res!122939 () Bool)

(assert (=> d!61017 (=> res!122939 e!162831)))

(declare-fun lt!125814 () Bool)

(assert (=> d!61017 (= res!122939 (not lt!125814))))

(declare-fun lt!125816 () Bool)

(assert (=> d!61017 (= lt!125814 lt!125816)))

(declare-fun lt!125817 () Unit!7760)

(declare-fun e!162830 () Unit!7760)

(assert (=> d!61017 (= lt!125817 e!162830)))

(declare-fun c!42219 () Bool)

(assert (=> d!61017 (= c!42219 lt!125816)))

(assert (=> d!61017 (= lt!125816 (containsKey!291 (toList!1895 lt!125771) (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61017 (= (contains!1817 lt!125771 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)) lt!125814)))

(declare-fun b!251067 () Bool)

(declare-fun lt!125815 () Unit!7760)

(assert (=> b!251067 (= e!162830 lt!125815)))

(assert (=> b!251067 (= lt!125815 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1895 lt!125771) (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251067 (isDefined!240 (getValueByKey!299 (toList!1895 lt!125771) (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251068 () Bool)

(declare-fun Unit!7772 () Unit!7760)

(assert (=> b!251068 (= e!162830 Unit!7772)))

(declare-fun b!251069 () Bool)

(assert (=> b!251069 (= e!162831 (isDefined!240 (getValueByKey!299 (toList!1895 lt!125771) (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!61017 c!42219) b!251067))

(assert (= (and d!61017 (not c!42219)) b!251068))

(assert (= (and d!61017 (not res!122939)) b!251069))

(assert (=> d!61017 m!267227))

(declare-fun m!267361 () Bool)

(assert (=> d!61017 m!267361))

(assert (=> b!251067 m!267227))

(declare-fun m!267363 () Bool)

(assert (=> b!251067 m!267363))

(assert (=> b!251067 m!267227))

(declare-fun m!267365 () Bool)

(assert (=> b!251067 m!267365))

(assert (=> b!251067 m!267365))

(declare-fun m!267367 () Bool)

(assert (=> b!251067 m!267367))

(assert (=> b!251069 m!267227))

(assert (=> b!251069 m!267365))

(assert (=> b!251069 m!267365))

(assert (=> b!251069 m!267367))

(assert (=> b!250949 d!61017))

(declare-fun call!23625 () Bool)

(declare-fun bm!23622 () Bool)

(assert (=> bm!23622 (= call!23625 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) (mask!10825 thiss!1504)))))

(declare-fun b!251070 () Bool)

(declare-fun e!162832 () Bool)

(assert (=> b!251070 (= e!162832 call!23625)))

(declare-fun d!61019 () Bool)

(declare-fun res!122941 () Bool)

(declare-fun e!162834 () Bool)

(assert (=> d!61019 (=> res!122941 e!162834)))

(assert (=> d!61019 (= res!122941 (bvsge #b00000000000000000000000000000000 (size!6182 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))))))))

(assert (=> d!61019 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) (mask!10825 thiss!1504)) e!162834)))

(declare-fun b!251071 () Bool)

(declare-fun e!162833 () Bool)

(assert (=> b!251071 (= e!162832 e!162833)))

(declare-fun lt!125819 () (_ BitVec 64))

(assert (=> b!251071 (= lt!125819 (select (arr!5837 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!125818 () Unit!7760)

(assert (=> b!251071 (= lt!125818 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) lt!125819 #b00000000000000000000000000000000))))

(assert (=> b!251071 (arrayContainsKey!0 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) lt!125819 #b00000000000000000000000000000000)))

(declare-fun lt!125820 () Unit!7760)

(assert (=> b!251071 (= lt!125820 lt!125818)))

(declare-fun res!122940 () Bool)

(assert (=> b!251071 (= res!122940 (= (seekEntryOrOpen!0 (select (arr!5837 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504)))) #b00000000000000000000000000000000) (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) (mask!10825 thiss!1504)) (Found!1124 #b00000000000000000000000000000000)))))

(assert (=> b!251071 (=> (not res!122940) (not e!162833))))

(declare-fun b!251072 () Bool)

(assert (=> b!251072 (= e!162833 call!23625)))

(declare-fun b!251073 () Bool)

(assert (=> b!251073 (= e!162834 e!162832)))

(declare-fun c!42220 () Bool)

(assert (=> b!251073 (= c!42220 (validKeyInArray!0 (select (arr!5837 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!61019 (not res!122941)) b!251073))

(assert (= (and b!251073 c!42220) b!251071))

(assert (= (and b!251073 (not c!42220)) b!251070))

(assert (= (and b!251071 res!122940) b!251072))

(assert (= (or b!251072 b!251070) bm!23622))

(declare-fun m!267369 () Bool)

(assert (=> bm!23622 m!267369))

(declare-fun m!267371 () Bool)

(assert (=> b!251071 m!267371))

(declare-fun m!267373 () Bool)

(assert (=> b!251071 m!267373))

(declare-fun m!267375 () Bool)

(assert (=> b!251071 m!267375))

(assert (=> b!251071 m!267371))

(declare-fun m!267377 () Bool)

(assert (=> b!251071 m!267377))

(assert (=> b!251073 m!267371))

(assert (=> b!251073 m!267371))

(declare-fun m!267379 () Bool)

(assert (=> b!251073 m!267379))

(assert (=> b!251025 d!61019))

(assert (=> d!60973 d!60985))

(declare-fun bm!23627 () Bool)

(declare-fun call!23630 () Bool)

(assert (=> bm!23627 (= call!23630 (arrayContainsKey!0 (_keys!6773 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun d!61021 () Bool)

(declare-fun e!162844 () Bool)

(assert (=> d!61021 e!162844))

(declare-fun c!42225 () Bool)

(declare-fun lt!125823 () SeekEntryResult!1124)

(assert (=> d!61021 (= c!42225 ((_ is MissingZero!1124) lt!125823))))

(assert (=> d!61021 (= lt!125823 (seekEntryOrOpen!0 key!932 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)))))

(assert (=> d!61021 true))

(declare-fun _$34!1113 () Unit!7760)

(assert (=> d!61021 (= (choose!1188 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) key!932 (defaultEntry!4635 thiss!1504)) _$34!1113)))

(declare-fun b!251090 () Bool)

(declare-fun res!122952 () Bool)

(declare-fun e!162845 () Bool)

(assert (=> b!251090 (=> (not res!122952) (not e!162845))))

(declare-fun call!23631 () Bool)

(assert (=> b!251090 (= res!122952 call!23631)))

(declare-fun e!162846 () Bool)

(assert (=> b!251090 (= e!162846 e!162845)))

(declare-fun b!251091 () Bool)

(assert (=> b!251091 (= e!162846 ((_ is Undefined!1124) lt!125823))))

(declare-fun b!251092 () Bool)

(assert (=> b!251092 (= e!162845 (not call!23630))))

(declare-fun b!251093 () Bool)

(declare-fun e!162843 () Bool)

(assert (=> b!251093 (= e!162843 (not call!23630))))

(declare-fun b!251094 () Bool)

(assert (=> b!251094 (= e!162844 e!162843)))

(declare-fun res!122950 () Bool)

(assert (=> b!251094 (= res!122950 call!23631)))

(assert (=> b!251094 (=> (not res!122950) (not e!162843))))

(declare-fun b!251095 () Bool)

(declare-fun res!122953 () Bool)

(assert (=> b!251095 (= res!122953 (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6666 lt!125823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251095 (=> (not res!122953) (not e!162843))))

(declare-fun b!251096 () Bool)

(declare-fun res!122951 () Bool)

(assert (=> b!251096 (=> (not res!122951) (not e!162845))))

(assert (=> b!251096 (= res!122951 (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6669 lt!125823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23628 () Bool)

(assert (=> bm!23628 (= call!23631 (inRange!0 (ite c!42225 (index!6666 lt!125823) (index!6669 lt!125823)) (mask!10825 thiss!1504)))))

(declare-fun b!251097 () Bool)

(assert (=> b!251097 (= e!162844 e!162846)))

(declare-fun c!42226 () Bool)

(assert (=> b!251097 (= c!42226 ((_ is MissingVacant!1124) lt!125823))))

(assert (= (and d!61021 c!42225) b!251094))

(assert (= (and d!61021 (not c!42225)) b!251097))

(assert (= (and b!251094 res!122950) b!251095))

(assert (= (and b!251095 res!122953) b!251093))

(assert (= (and b!251097 c!42226) b!251090))

(assert (= (and b!251097 (not c!42226)) b!251091))

(assert (= (and b!251090 res!122952) b!251096))

(assert (= (and b!251096 res!122951) b!251092))

(assert (= (or b!251094 b!251090) bm!23628))

(assert (= (or b!251093 b!251092) bm!23627))

(assert (=> bm!23627 m!267121))

(declare-fun m!267381 () Bool)

(assert (=> b!251096 m!267381))

(assert (=> d!61021 m!267115))

(declare-fun m!267383 () Bool)

(assert (=> b!251095 m!267383))

(declare-fun m!267385 () Bool)

(assert (=> bm!23628 m!267385))

(assert (=> d!60973 d!61021))

(assert (=> d!60973 d!60995))

(assert (=> bm!23588 d!60983))

(declare-fun d!61023 () Bool)

(assert (=> d!61023 (= (inRange!0 (ite c!42173 (index!6666 lt!125694) (index!6669 lt!125694)) (mask!10825 thiss!1504)) (and (bvsge (ite c!42173 (index!6666 lt!125694) (index!6669 lt!125694)) #b00000000000000000000000000000000) (bvslt (ite c!42173 (index!6666 lt!125694) (index!6669 lt!125694)) (bvadd (mask!10825 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23589 d!61023))

(declare-fun d!61025 () Bool)

(declare-fun lt!125824 () (_ BitVec 32))

(assert (=> d!61025 (and (bvsge lt!125824 #b00000000000000000000000000000000) (bvsle lt!125824 (bvsub (size!6182 (_keys!6773 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!162848 () (_ BitVec 32))

(assert (=> d!61025 (= lt!125824 e!162848)))

(declare-fun c!42228 () Bool)

(assert (=> d!61025 (= c!42228 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))))))

(assert (=> d!61025 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6182 (_keys!6773 thiss!1504)) (size!6182 (_keys!6773 thiss!1504))))))

(assert (=> d!61025 (= (arrayCountValidKeys!0 (_keys!6773 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))) lt!125824)))

(declare-fun bm!23629 () Bool)

(declare-fun call!23632 () (_ BitVec 32))

(assert (=> bm!23629 (= call!23632 (arrayCountValidKeys!0 (_keys!6773 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun b!251098 () Bool)

(declare-fun e!162847 () (_ BitVec 32))

(assert (=> b!251098 (= e!162847 (bvadd #b00000000000000000000000000000001 call!23632))))

(declare-fun b!251099 () Bool)

(assert (=> b!251099 (= e!162848 e!162847)))

(declare-fun c!42227 () Bool)

(assert (=> b!251099 (= c!42227 (validKeyInArray!0 (select (arr!5837 (_keys!6773 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251100 () Bool)

(assert (=> b!251100 (= e!162848 #b00000000000000000000000000000000)))

(declare-fun b!251101 () Bool)

(assert (=> b!251101 (= e!162847 call!23632)))

(assert (= (and d!61025 c!42228) b!251100))

(assert (= (and d!61025 (not c!42228)) b!251099))

(assert (= (and b!251099 c!42227) b!251098))

(assert (= (and b!251099 (not c!42227)) b!251101))

(assert (= (or b!251098 b!251101) bm!23629))

(declare-fun m!267387 () Bool)

(assert (=> bm!23629 m!267387))

(declare-fun m!267389 () Bool)

(assert (=> b!251099 m!267389))

(assert (=> b!251099 m!267389))

(declare-fun m!267391 () Bool)

(assert (=> b!251099 m!267391))

(assert (=> bm!23617 d!61025))

(assert (=> d!60991 d!60985))

(declare-fun d!61027 () Bool)

(declare-fun e!162851 () Bool)

(assert (=> d!61027 e!162851))

(declare-fun res!122959 () Bool)

(assert (=> d!61027 (=> (not res!122959) (not e!162851))))

(declare-fun lt!125827 () SeekEntryResult!1124)

(assert (=> d!61027 (= res!122959 ((_ is Found!1124) lt!125827))))

(assert (=> d!61027 (= lt!125827 (seekEntryOrOpen!0 key!932 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)))))

(assert (=> d!61027 true))

(declare-fun _$33!168 () Unit!7760)

(assert (=> d!61027 (= (choose!1190 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) key!932 (defaultEntry!4635 thiss!1504)) _$33!168)))

(declare-fun b!251106 () Bool)

(declare-fun res!122958 () Bool)

(assert (=> b!251106 (=> (not res!122958) (not e!162851))))

(assert (=> b!251106 (= res!122958 (inRange!0 (index!6667 lt!125827) (mask!10825 thiss!1504)))))

(declare-fun b!251107 () Bool)

(assert (=> b!251107 (= e!162851 (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6667 lt!125827)) key!932))))

(assert (= (and d!61027 res!122959) b!251106))

(assert (= (and b!251106 res!122958) b!251107))

(assert (=> d!61027 m!267115))

(declare-fun m!267393 () Bool)

(assert (=> b!251106 m!267393))

(declare-fun m!267395 () Bool)

(assert (=> b!251107 m!267395))

(assert (=> d!60991 d!61027))

(assert (=> d!60991 d!60995))

(assert (=> d!60981 d!60995))

(declare-fun d!61029 () Bool)

(declare-fun e!162853 () Bool)

(assert (=> d!61029 e!162853))

(declare-fun res!122960 () Bool)

(assert (=> d!61029 (=> res!122960 e!162853)))

(declare-fun lt!125828 () Bool)

(assert (=> d!61029 (= res!122960 (not lt!125828))))

(declare-fun lt!125830 () Bool)

(assert (=> d!61029 (= lt!125828 lt!125830)))

(declare-fun lt!125831 () Unit!7760)

(declare-fun e!162852 () Unit!7760)

(assert (=> d!61029 (= lt!125831 e!162852)))

(declare-fun c!42229 () Bool)

(assert (=> d!61029 (= c!42229 lt!125830)))

(assert (=> d!61029 (= lt!125830 (containsKey!291 (toList!1895 lt!125771) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61029 (= (contains!1817 lt!125771 #b1000000000000000000000000000000000000000000000000000000000000000) lt!125828)))

(declare-fun b!251108 () Bool)

(declare-fun lt!125829 () Unit!7760)

(assert (=> b!251108 (= e!162852 lt!125829)))

(assert (=> b!251108 (= lt!125829 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1895 lt!125771) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251108 (isDefined!240 (getValueByKey!299 (toList!1895 lt!125771) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251109 () Bool)

(declare-fun Unit!7773 () Unit!7760)

(assert (=> b!251109 (= e!162852 Unit!7773)))

(declare-fun b!251110 () Bool)

(assert (=> b!251110 (= e!162853 (isDefined!240 (getValueByKey!299 (toList!1895 lt!125771) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61029 c!42229) b!251108))

(assert (= (and d!61029 (not c!42229)) b!251109))

(assert (= (and d!61029 (not res!122960)) b!251110))

(declare-fun m!267397 () Bool)

(assert (=> d!61029 m!267397))

(declare-fun m!267399 () Bool)

(assert (=> b!251108 m!267399))

(declare-fun m!267401 () Bool)

(assert (=> b!251108 m!267401))

(assert (=> b!251108 m!267401))

(declare-fun m!267403 () Bool)

(assert (=> b!251108 m!267403))

(assert (=> b!251110 m!267401))

(assert (=> b!251110 m!267401))

(assert (=> b!251110 m!267403))

(assert (=> bm!23609 d!61029))

(assert (=> b!251051 d!61005))

(declare-fun d!61031 () Bool)

(assert (=> d!61031 (= (validKeyInArray!0 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251027 d!61031))

(declare-fun b!251123 () Bool)

(declare-fun e!162861 () SeekEntryResult!1124)

(declare-fun e!162860 () SeekEntryResult!1124)

(assert (=> b!251123 (= e!162861 e!162860)))

(declare-fun c!42236 () Bool)

(declare-fun lt!125836 () (_ BitVec 64))

(assert (=> b!251123 (= c!42236 (= lt!125836 key!932))))

(declare-fun b!251124 () Bool)

(assert (=> b!251124 (= e!162860 (Found!1124 (index!6668 lt!125783)))))

(declare-fun b!251126 () Bool)

(declare-fun e!162862 () SeekEntryResult!1124)

(assert (=> b!251126 (= e!162862 (MissingVacant!1124 (index!6668 lt!125783)))))

(declare-fun b!251127 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!251127 (= e!162862 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24692 lt!125783) #b00000000000000000000000000000001) (nextIndex!0 (index!6668 lt!125783) (x!24692 lt!125783) (mask!10825 thiss!1504)) (index!6668 lt!125783) key!932 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)))))

(declare-fun b!251128 () Bool)

(assert (=> b!251128 (= e!162861 Undefined!1124)))

(declare-fun b!251125 () Bool)

(declare-fun c!42237 () Bool)

(assert (=> b!251125 (= c!42237 (= lt!125836 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251125 (= e!162860 e!162862)))

(declare-fun lt!125837 () SeekEntryResult!1124)

(declare-fun d!61033 () Bool)

(assert (=> d!61033 (and (or ((_ is Undefined!1124) lt!125837) (not ((_ is Found!1124) lt!125837)) (and (bvsge (index!6667 lt!125837) #b00000000000000000000000000000000) (bvslt (index!6667 lt!125837) (size!6182 (_keys!6773 thiss!1504))))) (or ((_ is Undefined!1124) lt!125837) ((_ is Found!1124) lt!125837) (not ((_ is MissingVacant!1124) lt!125837)) (not (= (index!6669 lt!125837) (index!6668 lt!125783))) (and (bvsge (index!6669 lt!125837) #b00000000000000000000000000000000) (bvslt (index!6669 lt!125837) (size!6182 (_keys!6773 thiss!1504))))) (or ((_ is Undefined!1124) lt!125837) (ite ((_ is Found!1124) lt!125837) (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6667 lt!125837)) key!932) (and ((_ is MissingVacant!1124) lt!125837) (= (index!6669 lt!125837) (index!6668 lt!125783)) (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6669 lt!125837)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!61033 (= lt!125837 e!162861)))

(declare-fun c!42238 () Bool)

(assert (=> d!61033 (= c!42238 (bvsge (x!24692 lt!125783) #b01111111111111111111111111111110))))

(assert (=> d!61033 (= lt!125836 (select (arr!5837 (_keys!6773 thiss!1504)) (index!6668 lt!125783)))))

(assert (=> d!61033 (validMask!0 (mask!10825 thiss!1504))))

(assert (=> d!61033 (= (seekKeyOrZeroReturnVacant!0 (x!24692 lt!125783) (index!6668 lt!125783) (index!6668 lt!125783) key!932 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)) lt!125837)))

(assert (= (and d!61033 c!42238) b!251128))

(assert (= (and d!61033 (not c!42238)) b!251123))

(assert (= (and b!251123 c!42236) b!251124))

(assert (= (and b!251123 (not c!42236)) b!251125))

(assert (= (and b!251125 c!42237) b!251126))

(assert (= (and b!251125 (not c!42237)) b!251127))

(declare-fun m!267405 () Bool)

(assert (=> b!251127 m!267405))

(assert (=> b!251127 m!267405))

(declare-fun m!267407 () Bool)

(assert (=> b!251127 m!267407))

(declare-fun m!267409 () Bool)

(assert (=> d!61033 m!267409))

(declare-fun m!267411 () Bool)

(assert (=> d!61033 m!267411))

(assert (=> d!61033 m!267299))

(assert (=> d!61033 m!267119))

(assert (=> b!250975 d!61033))

(assert (=> d!60975 d!60979))

(assert (=> d!60975 d!60981))

(declare-fun d!61035 () Bool)

(assert (=> d!61035 (contains!1817 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)) key!932)))

(assert (=> d!61035 true))

(declare-fun _$17!77 () Unit!7760)

(assert (=> d!61035 (= (choose!1189 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)) _$17!77)))

(declare-fun bs!8989 () Bool)

(assert (= bs!8989 d!61035))

(assert (=> bs!8989 m!267151))

(assert (=> bs!8989 m!267151))

(assert (=> bs!8989 m!267153))

(assert (=> d!60975 d!61035))

(assert (=> d!60975 d!60995))

(declare-fun d!61037 () Bool)

(assert (=> d!61037 (arrayContainsKey!0 lt!125657 lt!125802 #b00000000000000000000000000000000)))

(declare-fun lt!125840 () Unit!7760)

(declare-fun choose!13 (array!12311 (_ BitVec 64) (_ BitVec 32)) Unit!7760)

(assert (=> d!61037 (= lt!125840 (choose!13 lt!125657 lt!125802 #b00000000000000000000000000000000))))

(assert (=> d!61037 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!61037 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125657 lt!125802 #b00000000000000000000000000000000) lt!125840)))

(declare-fun bs!8990 () Bool)

(assert (= bs!8990 d!61037))

(assert (=> bs!8990 m!267323))

(declare-fun m!267413 () Bool)

(assert (=> bs!8990 m!267413))

(assert (=> b!251005 d!61037))

(declare-fun d!61039 () Bool)

(declare-fun res!122961 () Bool)

(declare-fun e!162863 () Bool)

(assert (=> d!61039 (=> res!122961 e!162863)))

(assert (=> d!61039 (= res!122961 (= (select (arr!5837 lt!125657) #b00000000000000000000000000000000) lt!125802))))

(assert (=> d!61039 (= (arrayContainsKey!0 lt!125657 lt!125802 #b00000000000000000000000000000000) e!162863)))

(declare-fun b!251129 () Bool)

(declare-fun e!162864 () Bool)

(assert (=> b!251129 (= e!162863 e!162864)))

(declare-fun res!122962 () Bool)

(assert (=> b!251129 (=> (not res!122962) (not e!162864))))

(assert (=> b!251129 (= res!122962 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 lt!125657)))))

(declare-fun b!251130 () Bool)

(assert (=> b!251130 (= e!162864 (arrayContainsKey!0 lt!125657 lt!125802 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61039 (not res!122961)) b!251129))

(assert (= (and b!251129 res!122962) b!251130))

(assert (=> d!61039 m!267319))

(declare-fun m!267415 () Bool)

(assert (=> b!251130 m!267415))

(assert (=> b!251005 d!61039))

(declare-fun d!61041 () Bool)

(declare-fun lt!125843 () SeekEntryResult!1124)

(assert (=> d!61041 (and (or ((_ is Undefined!1124) lt!125843) (not ((_ is Found!1124) lt!125843)) (and (bvsge (index!6667 lt!125843) #b00000000000000000000000000000000) (bvslt (index!6667 lt!125843) (size!6182 lt!125657)))) (or ((_ is Undefined!1124) lt!125843) ((_ is Found!1124) lt!125843) (not ((_ is MissingZero!1124) lt!125843)) (and (bvsge (index!6666 lt!125843) #b00000000000000000000000000000000) (bvslt (index!6666 lt!125843) (size!6182 lt!125657)))) (or ((_ is Undefined!1124) lt!125843) ((_ is Found!1124) lt!125843) ((_ is MissingZero!1124) lt!125843) (not ((_ is MissingVacant!1124) lt!125843)) (and (bvsge (index!6669 lt!125843) #b00000000000000000000000000000000) (bvslt (index!6669 lt!125843) (size!6182 lt!125657)))) (or ((_ is Undefined!1124) lt!125843) (ite ((_ is Found!1124) lt!125843) (= (select (arr!5837 lt!125657) (index!6667 lt!125843)) (select (arr!5837 lt!125657) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1124) lt!125843) (= (select (arr!5837 lt!125657) (index!6666 lt!125843)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1124) lt!125843) (= (select (arr!5837 lt!125657) (index!6669 lt!125843)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!162867 () SeekEntryResult!1124)

(assert (=> d!61041 (= lt!125843 e!162867)))

(declare-fun c!42239 () Bool)

(declare-fun lt!125841 () SeekEntryResult!1124)

(assert (=> d!61041 (= c!42239 (and ((_ is Intermediate!1124) lt!125841) (undefined!1936 lt!125841)))))

(assert (=> d!61041 (= lt!125841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5837 lt!125657) #b00000000000000000000000000000000) (mask!10825 thiss!1504)) (select (arr!5837 lt!125657) #b00000000000000000000000000000000) lt!125657 (mask!10825 thiss!1504)))))

(assert (=> d!61041 (validMask!0 (mask!10825 thiss!1504))))

(assert (=> d!61041 (= (seekEntryOrOpen!0 (select (arr!5837 lt!125657) #b00000000000000000000000000000000) lt!125657 (mask!10825 thiss!1504)) lt!125843)))

(declare-fun b!251131 () Bool)

(declare-fun c!42240 () Bool)

(declare-fun lt!125842 () (_ BitVec 64))

(assert (=> b!251131 (= c!42240 (= lt!125842 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162865 () SeekEntryResult!1124)

(declare-fun e!162866 () SeekEntryResult!1124)

(assert (=> b!251131 (= e!162865 e!162866)))

(declare-fun b!251132 () Bool)

(assert (=> b!251132 (= e!162866 (MissingZero!1124 (index!6668 lt!125841)))))

(declare-fun b!251133 () Bool)

(assert (=> b!251133 (= e!162865 (Found!1124 (index!6668 lt!125841)))))

(declare-fun b!251134 () Bool)

(assert (=> b!251134 (= e!162866 (seekKeyOrZeroReturnVacant!0 (x!24692 lt!125841) (index!6668 lt!125841) (index!6668 lt!125841) (select (arr!5837 lt!125657) #b00000000000000000000000000000000) lt!125657 (mask!10825 thiss!1504)))))

(declare-fun b!251135 () Bool)

(assert (=> b!251135 (= e!162867 e!162865)))

(assert (=> b!251135 (= lt!125842 (select (arr!5837 lt!125657) (index!6668 lt!125841)))))

(declare-fun c!42241 () Bool)

(assert (=> b!251135 (= c!42241 (= lt!125842 (select (arr!5837 lt!125657) #b00000000000000000000000000000000)))))

(declare-fun b!251136 () Bool)

(assert (=> b!251136 (= e!162867 Undefined!1124)))

(assert (= (and d!61041 c!42239) b!251136))

(assert (= (and d!61041 (not c!42239)) b!251135))

(assert (= (and b!251135 c!42241) b!251133))

(assert (= (and b!251135 (not c!42241)) b!251131))

(assert (= (and b!251131 c!42240) b!251132))

(assert (= (and b!251131 (not c!42240)) b!251134))

(declare-fun m!267417 () Bool)

(assert (=> d!61041 m!267417))

(assert (=> d!61041 m!267319))

(declare-fun m!267419 () Bool)

(assert (=> d!61041 m!267419))

(declare-fun m!267421 () Bool)

(assert (=> d!61041 m!267421))

(declare-fun m!267423 () Bool)

(assert (=> d!61041 m!267423))

(assert (=> d!61041 m!267119))

(assert (=> d!61041 m!267419))

(assert (=> d!61041 m!267319))

(declare-fun m!267425 () Bool)

(assert (=> d!61041 m!267425))

(assert (=> b!251134 m!267319))

(declare-fun m!267427 () Bool)

(assert (=> b!251134 m!267427))

(declare-fun m!267429 () Bool)

(assert (=> b!251135 m!267429))

(assert (=> b!251005 d!61041))

(declare-fun d!61043 () Bool)

(assert (=> d!61043 (= (validKeyInArray!0 (select (arr!5837 lt!125657) #b00000000000000000000000000000000)) (and (not (= (select (arr!5837 lt!125657) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5837 lt!125657) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251007 d!61043))

(declare-fun d!61045 () Bool)

(declare-fun e!162870 () Bool)

(assert (=> d!61045 e!162870))

(declare-fun res!122967 () Bool)

(assert (=> d!61045 (=> (not res!122967) (not e!162870))))

(declare-fun lt!125855 () ListLongMap!3759)

(assert (=> d!61045 (= res!122967 (contains!1817 lt!125855 (_1!2434 (ite (or c!42190 c!42191) (tuple2!4847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4476 thiss!1504)) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504))))))))

(declare-fun lt!125853 () List!3727)

(assert (=> d!61045 (= lt!125855 (ListLongMap!3760 lt!125853))))

(declare-fun lt!125854 () Unit!7760)

(declare-fun lt!125852 () Unit!7760)

(assert (=> d!61045 (= lt!125854 lt!125852)))

(assert (=> d!61045 (= (getValueByKey!299 lt!125853 (_1!2434 (ite (or c!42190 c!42191) (tuple2!4847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4476 thiss!1504)) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504))))) (Some!304 (_2!2434 (ite (or c!42190 c!42191) (tuple2!4847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4476 thiss!1504)) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!159 (List!3727 (_ BitVec 64) V!8307) Unit!7760)

(assert (=> d!61045 (= lt!125852 (lemmaContainsTupThenGetReturnValue!159 lt!125853 (_1!2434 (ite (or c!42190 c!42191) (tuple2!4847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4476 thiss!1504)) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504)))) (_2!2434 (ite (or c!42190 c!42191) (tuple2!4847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4476 thiss!1504)) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504))))))))

(declare-fun insertStrictlySorted!162 (List!3727 (_ BitVec 64) V!8307) List!3727)

(assert (=> d!61045 (= lt!125853 (insertStrictlySorted!162 (toList!1895 (ite c!42190 call!23608 (ite c!42191 call!23607 call!23613))) (_1!2434 (ite (or c!42190 c!42191) (tuple2!4847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4476 thiss!1504)) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504)))) (_2!2434 (ite (or c!42190 c!42191) (tuple2!4847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4476 thiss!1504)) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504))))))))

(assert (=> d!61045 (= (+!668 (ite c!42190 call!23608 (ite c!42191 call!23607 call!23613)) (ite (or c!42190 c!42191) (tuple2!4847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4476 thiss!1504)) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504)))) lt!125855)))

(declare-fun b!251141 () Bool)

(declare-fun res!122968 () Bool)

(assert (=> b!251141 (=> (not res!122968) (not e!162870))))

(assert (=> b!251141 (= res!122968 (= (getValueByKey!299 (toList!1895 lt!125855) (_1!2434 (ite (or c!42190 c!42191) (tuple2!4847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4476 thiss!1504)) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504))))) (Some!304 (_2!2434 (ite (or c!42190 c!42191) (tuple2!4847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4476 thiss!1504)) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504)))))))))

(declare-fun b!251142 () Bool)

(declare-fun contains!1820 (List!3727 tuple2!4846) Bool)

(assert (=> b!251142 (= e!162870 (contains!1820 (toList!1895 lt!125855) (ite (or c!42190 c!42191) (tuple2!4847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4476 thiss!1504)) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504)))))))

(assert (= (and d!61045 res!122967) b!251141))

(assert (= (and b!251141 res!122968) b!251142))

(declare-fun m!267431 () Bool)

(assert (=> d!61045 m!267431))

(declare-fun m!267433 () Bool)

(assert (=> d!61045 m!267433))

(declare-fun m!267435 () Bool)

(assert (=> d!61045 m!267435))

(declare-fun m!267437 () Bool)

(assert (=> d!61045 m!267437))

(declare-fun m!267439 () Bool)

(assert (=> b!251141 m!267439))

(declare-fun m!267441 () Bool)

(assert (=> b!251142 m!267441))

(assert (=> bm!23607 d!61045))

(declare-fun d!61047 () Bool)

(assert (=> d!61047 (= (arrayCountValidKeys!0 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6773 thiss!1504) #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!61047 true))

(declare-fun _$84!30 () Unit!7760)

(assert (=> d!61047 (= (choose!1 (_keys!6773 thiss!1504) index!297 key!932) _$84!30)))

(declare-fun bs!8991 () Bool)

(assert (= bs!8991 d!61047))

(assert (=> bs!8991 m!267129))

(assert (=> bs!8991 m!267311))

(assert (=> bs!8991 m!267131))

(assert (=> d!60993 d!61047))

(declare-fun d!61049 () Bool)

(declare-fun e!162871 () Bool)

(assert (=> d!61049 e!162871))

(declare-fun res!122969 () Bool)

(assert (=> d!61049 (=> (not res!122969) (not e!162871))))

(declare-fun lt!125859 () ListLongMap!3759)

(assert (=> d!61049 (= res!122969 (contains!1817 lt!125859 (_1!2434 (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504)))))))

(declare-fun lt!125857 () List!3727)

(assert (=> d!61049 (= lt!125859 (ListLongMap!3760 lt!125857))))

(declare-fun lt!125858 () Unit!7760)

(declare-fun lt!125856 () Unit!7760)

(assert (=> d!61049 (= lt!125858 lt!125856)))

(assert (=> d!61049 (= (getValueByKey!299 lt!125857 (_1!2434 (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504)))) (Some!304 (_2!2434 (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504)))))))

(assert (=> d!61049 (= lt!125856 (lemmaContainsTupThenGetReturnValue!159 lt!125857 (_1!2434 (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504))) (_2!2434 (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504)))))))

(assert (=> d!61049 (= lt!125857 (insertStrictlySorted!162 (toList!1895 call!23611) (_1!2434 (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504))) (_2!2434 (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504)))))))

(assert (=> d!61049 (= (+!668 call!23611 (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504))) lt!125859)))

(declare-fun b!251143 () Bool)

(declare-fun res!122970 () Bool)

(assert (=> b!251143 (=> (not res!122970) (not e!162871))))

(assert (=> b!251143 (= res!122970 (= (getValueByKey!299 (toList!1895 lt!125859) (_1!2434 (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504)))) (Some!304 (_2!2434 (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504))))))))

(declare-fun b!251144 () Bool)

(assert (=> b!251144 (= e!162871 (contains!1820 (toList!1895 lt!125859) (tuple2!4847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4476 thiss!1504))))))

(assert (= (and d!61049 res!122969) b!251143))

(assert (= (and b!251143 res!122970) b!251144))

(declare-fun m!267443 () Bool)

(assert (=> d!61049 m!267443))

(declare-fun m!267445 () Bool)

(assert (=> d!61049 m!267445))

(declare-fun m!267447 () Bool)

(assert (=> d!61049 m!267447))

(declare-fun m!267449 () Bool)

(assert (=> d!61049 m!267449))

(declare-fun m!267451 () Bool)

(assert (=> b!251143 m!267451))

(declare-fun m!267453 () Bool)

(assert (=> b!251144 m!267453))

(assert (=> b!250940 d!61049))

(declare-fun d!61051 () Bool)

(declare-fun res!122975 () Bool)

(declare-fun e!162876 () Bool)

(assert (=> d!61051 (=> res!122975 e!162876)))

(assert (=> d!61051 (= res!122975 (and ((_ is Cons!3723) (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))) (= (_1!2434 (h!4383 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))))) key!932)))))

(assert (=> d!61051 (= (containsKey!291 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))) key!932) e!162876)))

(declare-fun b!251149 () Bool)

(declare-fun e!162877 () Bool)

(assert (=> b!251149 (= e!162876 e!162877)))

(declare-fun res!122976 () Bool)

(assert (=> b!251149 (=> (not res!122976) (not e!162877))))

(assert (=> b!251149 (= res!122976 (and (or (not ((_ is Cons!3723) (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))))) (bvsle (_1!2434 (h!4383 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))))) key!932)) ((_ is Cons!3723) (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))) (bvslt (_1!2434 (h!4383 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))))) key!932)))))

(declare-fun b!251150 () Bool)

(assert (=> b!251150 (= e!162877 (containsKey!291 (t!8762 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))) key!932))))

(assert (= (and d!61051 (not res!122975)) b!251149))

(assert (= (and b!251149 res!122976) b!251150))

(declare-fun m!267455 () Bool)

(assert (=> b!251150 m!267455))

(assert (=> d!60979 d!61051))

(declare-fun d!61053 () Bool)

(assert (=> d!61053 (= (apply!241 (+!668 lt!125768 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504))) lt!125755) (apply!241 lt!125768 lt!125755))))

(declare-fun lt!125862 () Unit!7760)

(declare-fun choose!1191 (ListLongMap!3759 (_ BitVec 64) V!8307 (_ BitVec 64)) Unit!7760)

(assert (=> d!61053 (= lt!125862 (choose!1191 lt!125768 lt!125769 (zeroValue!4476 thiss!1504) lt!125755))))

(declare-fun e!162880 () Bool)

(assert (=> d!61053 e!162880))

(declare-fun res!122979 () Bool)

(assert (=> d!61053 (=> (not res!122979) (not e!162880))))

(assert (=> d!61053 (= res!122979 (contains!1817 lt!125768 lt!125755))))

(assert (=> d!61053 (= (addApplyDifferent!217 lt!125768 lt!125769 (zeroValue!4476 thiss!1504) lt!125755) lt!125862)))

(declare-fun b!251154 () Bool)

(assert (=> b!251154 (= e!162880 (not (= lt!125755 lt!125769)))))

(assert (= (and d!61053 res!122979) b!251154))

(assert (=> d!61053 m!267259))

(declare-fun m!267457 () Bool)

(assert (=> d!61053 m!267457))

(declare-fun m!267459 () Bool)

(assert (=> d!61053 m!267459))

(assert (=> d!61053 m!267269))

(assert (=> d!61053 m!267271))

(assert (=> d!61053 m!267269))

(assert (=> b!250950 d!61053))

(declare-fun d!61055 () Bool)

(assert (=> d!61055 (= (apply!241 (+!668 lt!125766 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504))) lt!125773) (apply!241 lt!125766 lt!125773))))

(declare-fun lt!125863 () Unit!7760)

(assert (=> d!61055 (= lt!125863 (choose!1191 lt!125766 lt!125757 (minValue!4476 thiss!1504) lt!125773))))

(declare-fun e!162881 () Bool)

(assert (=> d!61055 e!162881))

(declare-fun res!122980 () Bool)

(assert (=> d!61055 (=> (not res!122980) (not e!162881))))

(assert (=> d!61055 (= res!122980 (contains!1817 lt!125766 lt!125773))))

(assert (=> d!61055 (= (addApplyDifferent!217 lt!125766 lt!125757 (minValue!4476 thiss!1504) lt!125773) lt!125863)))

(declare-fun b!251155 () Bool)

(assert (=> b!251155 (= e!162881 (not (= lt!125773 lt!125757)))))

(assert (= (and d!61055 res!122980) b!251155))

(assert (=> d!61055 m!267267))

(declare-fun m!267461 () Bool)

(assert (=> d!61055 m!267461))

(declare-fun m!267463 () Bool)

(assert (=> d!61055 m!267463))

(assert (=> d!61055 m!267265))

(assert (=> d!61055 m!267273))

(assert (=> d!61055 m!267265))

(assert (=> b!250950 d!61055))

(declare-fun d!61057 () Bool)

(declare-fun e!162883 () Bool)

(assert (=> d!61057 e!162883))

(declare-fun res!122981 () Bool)

(assert (=> d!61057 (=> res!122981 e!162883)))

(declare-fun lt!125864 () Bool)

(assert (=> d!61057 (= res!122981 (not lt!125864))))

(declare-fun lt!125866 () Bool)

(assert (=> d!61057 (= lt!125864 lt!125866)))

(declare-fun lt!125867 () Unit!7760)

(declare-fun e!162882 () Unit!7760)

(assert (=> d!61057 (= lt!125867 e!162882)))

(declare-fun c!42242 () Bool)

(assert (=> d!61057 (= c!42242 lt!125866)))

(assert (=> d!61057 (= lt!125866 (containsKey!291 (toList!1895 (+!668 lt!125774 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504)))) lt!125756))))

(assert (=> d!61057 (= (contains!1817 (+!668 lt!125774 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504))) lt!125756) lt!125864)))

(declare-fun b!251156 () Bool)

(declare-fun lt!125865 () Unit!7760)

(assert (=> b!251156 (= e!162882 lt!125865)))

(assert (=> b!251156 (= lt!125865 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1895 (+!668 lt!125774 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504)))) lt!125756))))

(assert (=> b!251156 (isDefined!240 (getValueByKey!299 (toList!1895 (+!668 lt!125774 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504)))) lt!125756))))

(declare-fun b!251157 () Bool)

(declare-fun Unit!7774 () Unit!7760)

(assert (=> b!251157 (= e!162882 Unit!7774)))

(declare-fun b!251158 () Bool)

(assert (=> b!251158 (= e!162883 (isDefined!240 (getValueByKey!299 (toList!1895 (+!668 lt!125774 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504)))) lt!125756)))))

(assert (= (and d!61057 c!42242) b!251156))

(assert (= (and d!61057 (not c!42242)) b!251157))

(assert (= (and d!61057 (not res!122981)) b!251158))

(declare-fun m!267465 () Bool)

(assert (=> d!61057 m!267465))

(declare-fun m!267467 () Bool)

(assert (=> b!251156 m!267467))

(declare-fun m!267469 () Bool)

(assert (=> b!251156 m!267469))

(assert (=> b!251156 m!267469))

(declare-fun m!267471 () Bool)

(assert (=> b!251156 m!267471))

(assert (=> b!251158 m!267469))

(assert (=> b!251158 m!267469))

(assert (=> b!251158 m!267471))

(assert (=> b!250950 d!61057))

(declare-fun d!61059 () Bool)

(declare-fun e!162884 () Bool)

(assert (=> d!61059 e!162884))

(declare-fun res!122982 () Bool)

(assert (=> d!61059 (=> (not res!122982) (not e!162884))))

(declare-fun lt!125871 () ListLongMap!3759)

(assert (=> d!61059 (= res!122982 (contains!1817 lt!125871 (_1!2434 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504)))))))

(declare-fun lt!125869 () List!3727)

(assert (=> d!61059 (= lt!125871 (ListLongMap!3760 lt!125869))))

(declare-fun lt!125870 () Unit!7760)

(declare-fun lt!125868 () Unit!7760)

(assert (=> d!61059 (= lt!125870 lt!125868)))

(assert (=> d!61059 (= (getValueByKey!299 lt!125869 (_1!2434 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504)))) (Some!304 (_2!2434 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504)))))))

(assert (=> d!61059 (= lt!125868 (lemmaContainsTupThenGetReturnValue!159 lt!125869 (_1!2434 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504))) (_2!2434 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504)))))))

(assert (=> d!61059 (= lt!125869 (insertStrictlySorted!162 (toList!1895 lt!125774) (_1!2434 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504))) (_2!2434 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504)))))))

(assert (=> d!61059 (= (+!668 lt!125774 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504))) lt!125871)))

(declare-fun b!251159 () Bool)

(declare-fun res!122983 () Bool)

(assert (=> b!251159 (=> (not res!122983) (not e!162884))))

(assert (=> b!251159 (= res!122983 (= (getValueByKey!299 (toList!1895 lt!125871) (_1!2434 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504)))) (Some!304 (_2!2434 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504))))))))

(declare-fun b!251160 () Bool)

(assert (=> b!251160 (= e!162884 (contains!1820 (toList!1895 lt!125871) (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504))))))

(assert (= (and d!61059 res!122982) b!251159))

(assert (= (and b!251159 res!122983) b!251160))

(declare-fun m!267473 () Bool)

(assert (=> d!61059 m!267473))

(declare-fun m!267475 () Bool)

(assert (=> d!61059 m!267475))

(declare-fun m!267477 () Bool)

(assert (=> d!61059 m!267477))

(declare-fun m!267479 () Bool)

(assert (=> d!61059 m!267479))

(declare-fun m!267481 () Bool)

(assert (=> b!251159 m!267481))

(declare-fun m!267483 () Bool)

(assert (=> b!251160 m!267483))

(assert (=> b!250950 d!61059))

(declare-fun d!61061 () Bool)

(assert (=> d!61061 (= (apply!241 (+!668 lt!125764 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504))) lt!125772) (get!3001 (getValueByKey!299 (toList!1895 (+!668 lt!125764 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504)))) lt!125772)))))

(declare-fun bs!8992 () Bool)

(assert (= bs!8992 d!61061))

(declare-fun m!267485 () Bool)

(assert (=> bs!8992 m!267485))

(assert (=> bs!8992 m!267485))

(declare-fun m!267487 () Bool)

(assert (=> bs!8992 m!267487))

(assert (=> b!250950 d!61061))

(declare-fun d!61063 () Bool)

(assert (=> d!61063 (= (apply!241 (+!668 lt!125764 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504))) lt!125772) (apply!241 lt!125764 lt!125772))))

(declare-fun lt!125872 () Unit!7760)

(assert (=> d!61063 (= lt!125872 (choose!1191 lt!125764 lt!125770 (minValue!4476 thiss!1504) lt!125772))))

(declare-fun e!162885 () Bool)

(assert (=> d!61063 e!162885))

(declare-fun res!122984 () Bool)

(assert (=> d!61063 (=> (not res!122984) (not e!162885))))

(assert (=> d!61063 (= res!122984 (contains!1817 lt!125764 lt!125772))))

(assert (=> d!61063 (= (addApplyDifferent!217 lt!125764 lt!125770 (minValue!4476 thiss!1504) lt!125772) lt!125872)))

(declare-fun b!251161 () Bool)

(assert (=> b!251161 (= e!162885 (not (= lt!125772 lt!125770)))))

(assert (= (and d!61063 res!122984) b!251161))

(assert (=> d!61063 m!267263))

(declare-fun m!267489 () Bool)

(assert (=> d!61063 m!267489))

(declare-fun m!267491 () Bool)

(assert (=> d!61063 m!267491))

(assert (=> d!61063 m!267279))

(assert (=> d!61063 m!267281))

(assert (=> d!61063 m!267279))

(assert (=> b!250950 d!61063))

(declare-fun d!61065 () Bool)

(assert (=> d!61065 (= (apply!241 lt!125764 lt!125772) (get!3001 (getValueByKey!299 (toList!1895 lt!125764) lt!125772)))))

(declare-fun bs!8993 () Bool)

(assert (= bs!8993 d!61065))

(declare-fun m!267493 () Bool)

(assert (=> bs!8993 m!267493))

(assert (=> bs!8993 m!267493))

(declare-fun m!267495 () Bool)

(assert (=> bs!8993 m!267495))

(assert (=> b!250950 d!61065))

(declare-fun d!61067 () Bool)

(declare-fun e!162886 () Bool)

(assert (=> d!61067 e!162886))

(declare-fun res!122985 () Bool)

(assert (=> d!61067 (=> (not res!122985) (not e!162886))))

(declare-fun lt!125876 () ListLongMap!3759)

(assert (=> d!61067 (= res!122985 (contains!1817 lt!125876 (_1!2434 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504)))))))

(declare-fun lt!125874 () List!3727)

(assert (=> d!61067 (= lt!125876 (ListLongMap!3760 lt!125874))))

(declare-fun lt!125875 () Unit!7760)

(declare-fun lt!125873 () Unit!7760)

(assert (=> d!61067 (= lt!125875 lt!125873)))

(assert (=> d!61067 (= (getValueByKey!299 lt!125874 (_1!2434 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504)))) (Some!304 (_2!2434 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504)))))))

(assert (=> d!61067 (= lt!125873 (lemmaContainsTupThenGetReturnValue!159 lt!125874 (_1!2434 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504))) (_2!2434 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504)))))))

(assert (=> d!61067 (= lt!125874 (insertStrictlySorted!162 (toList!1895 lt!125766) (_1!2434 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504))) (_2!2434 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504)))))))

(assert (=> d!61067 (= (+!668 lt!125766 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504))) lt!125876)))

(declare-fun b!251162 () Bool)

(declare-fun res!122986 () Bool)

(assert (=> b!251162 (=> (not res!122986) (not e!162886))))

(assert (=> b!251162 (= res!122986 (= (getValueByKey!299 (toList!1895 lt!125876) (_1!2434 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504)))) (Some!304 (_2!2434 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504))))))))

(declare-fun b!251163 () Bool)

(assert (=> b!251163 (= e!162886 (contains!1820 (toList!1895 lt!125876) (tuple2!4847 lt!125757 (minValue!4476 thiss!1504))))))

(assert (= (and d!61067 res!122985) b!251162))

(assert (= (and b!251162 res!122986) b!251163))

(declare-fun m!267497 () Bool)

(assert (=> d!61067 m!267497))

(declare-fun m!267499 () Bool)

(assert (=> d!61067 m!267499))

(declare-fun m!267501 () Bool)

(assert (=> d!61067 m!267501))

(declare-fun m!267503 () Bool)

(assert (=> d!61067 m!267503))

(declare-fun m!267505 () Bool)

(assert (=> b!251162 m!267505))

(declare-fun m!267507 () Bool)

(assert (=> b!251163 m!267507))

(assert (=> b!250950 d!61067))

(declare-fun d!61069 () Bool)

(assert (=> d!61069 (= (apply!241 (+!668 lt!125766 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504))) lt!125773) (get!3001 (getValueByKey!299 (toList!1895 (+!668 lt!125766 (tuple2!4847 lt!125757 (minValue!4476 thiss!1504)))) lt!125773)))))

(declare-fun bs!8994 () Bool)

(assert (= bs!8994 d!61069))

(declare-fun m!267509 () Bool)

(assert (=> bs!8994 m!267509))

(assert (=> bs!8994 m!267509))

(declare-fun m!267511 () Bool)

(assert (=> bs!8994 m!267511))

(assert (=> b!250950 d!61069))

(declare-fun d!61071 () Bool)

(declare-fun e!162887 () Bool)

(assert (=> d!61071 e!162887))

(declare-fun res!122987 () Bool)

(assert (=> d!61071 (=> (not res!122987) (not e!162887))))

(declare-fun lt!125880 () ListLongMap!3759)

(assert (=> d!61071 (= res!122987 (contains!1817 lt!125880 (_1!2434 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504)))))))

(declare-fun lt!125878 () List!3727)

(assert (=> d!61071 (= lt!125880 (ListLongMap!3760 lt!125878))))

(declare-fun lt!125879 () Unit!7760)

(declare-fun lt!125877 () Unit!7760)

(assert (=> d!61071 (= lt!125879 lt!125877)))

(assert (=> d!61071 (= (getValueByKey!299 lt!125878 (_1!2434 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504)))) (Some!304 (_2!2434 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504)))))))

(assert (=> d!61071 (= lt!125877 (lemmaContainsTupThenGetReturnValue!159 lt!125878 (_1!2434 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504))) (_2!2434 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504)))))))

(assert (=> d!61071 (= lt!125878 (insertStrictlySorted!162 (toList!1895 lt!125768) (_1!2434 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504))) (_2!2434 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504)))))))

(assert (=> d!61071 (= (+!668 lt!125768 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504))) lt!125880)))

(declare-fun b!251164 () Bool)

(declare-fun res!122988 () Bool)

(assert (=> b!251164 (=> (not res!122988) (not e!162887))))

(assert (=> b!251164 (= res!122988 (= (getValueByKey!299 (toList!1895 lt!125880) (_1!2434 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504)))) (Some!304 (_2!2434 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504))))))))

(declare-fun b!251165 () Bool)

(assert (=> b!251165 (= e!162887 (contains!1820 (toList!1895 lt!125880) (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504))))))

(assert (= (and d!61071 res!122987) b!251164))

(assert (= (and b!251164 res!122988) b!251165))

(declare-fun m!267513 () Bool)

(assert (=> d!61071 m!267513))

(declare-fun m!267515 () Bool)

(assert (=> d!61071 m!267515))

(declare-fun m!267517 () Bool)

(assert (=> d!61071 m!267517))

(declare-fun m!267519 () Bool)

(assert (=> d!61071 m!267519))

(declare-fun m!267521 () Bool)

(assert (=> b!251164 m!267521))

(declare-fun m!267523 () Bool)

(assert (=> b!251165 m!267523))

(assert (=> b!250950 d!61071))

(declare-fun d!61073 () Bool)

(assert (=> d!61073 (= (apply!241 lt!125768 lt!125755) (get!3001 (getValueByKey!299 (toList!1895 lt!125768) lt!125755)))))

(declare-fun bs!8995 () Bool)

(assert (= bs!8995 d!61073))

(declare-fun m!267525 () Bool)

(assert (=> bs!8995 m!267525))

(assert (=> bs!8995 m!267525))

(declare-fun m!267527 () Bool)

(assert (=> bs!8995 m!267527))

(assert (=> b!250950 d!61073))

(declare-fun b!251190 () Bool)

(declare-fun e!162905 () ListLongMap!3759)

(declare-fun e!162907 () ListLongMap!3759)

(assert (=> b!251190 (= e!162905 e!162907)))

(declare-fun c!42254 () Bool)

(assert (=> b!251190 (= c!42254 (validKeyInArray!0 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251191 () Bool)

(declare-fun call!23635 () ListLongMap!3759)

(assert (=> b!251191 (= e!162907 call!23635)))

(declare-fun b!251192 () Bool)

(declare-fun res!122999 () Bool)

(declare-fun e!162908 () Bool)

(assert (=> b!251192 (=> (not res!122999) (not e!162908))))

(declare-fun lt!125897 () ListLongMap!3759)

(assert (=> b!251192 (= res!122999 (not (contains!1817 lt!125897 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251193 () Bool)

(declare-fun lt!125896 () Unit!7760)

(declare-fun lt!125901 () Unit!7760)

(assert (=> b!251193 (= lt!125896 lt!125901)))

(declare-fun lt!125895 () V!8307)

(declare-fun lt!125899 () (_ BitVec 64))

(declare-fun lt!125898 () ListLongMap!3759)

(declare-fun lt!125900 () (_ BitVec 64))

(assert (=> b!251193 (not (contains!1817 (+!668 lt!125898 (tuple2!4847 lt!125900 lt!125895)) lt!125899))))

(declare-fun addStillNotContains!123 (ListLongMap!3759 (_ BitVec 64) V!8307 (_ BitVec 64)) Unit!7760)

(assert (=> b!251193 (= lt!125901 (addStillNotContains!123 lt!125898 lt!125900 lt!125895 lt!125899))))

(assert (=> b!251193 (= lt!125899 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!251193 (= lt!125895 (get!3000 (select (arr!5836 (_values!4618 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4635 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251193 (= lt!125900 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251193 (= lt!125898 call!23635)))

(assert (=> b!251193 (= e!162907 (+!668 call!23635 (tuple2!4847 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000) (get!3000 (select (arr!5836 (_values!4618 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4635 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!251194 () Bool)

(declare-fun e!162903 () Bool)

(assert (=> b!251194 (= e!162908 e!162903)))

(declare-fun c!42253 () Bool)

(declare-fun e!162906 () Bool)

(assert (=> b!251194 (= c!42253 e!162906)))

(declare-fun res!123000 () Bool)

(assert (=> b!251194 (=> (not res!123000) (not e!162906))))

(assert (=> b!251194 (= res!123000 (bvslt #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun b!251195 () Bool)

(declare-fun e!162902 () Bool)

(assert (=> b!251195 (= e!162903 e!162902)))

(declare-fun c!42252 () Bool)

(assert (=> b!251195 (= c!42252 (bvslt #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun bm!23632 () Bool)

(assert (=> bm!23632 (= call!23635 (getCurrentListMapNoExtraKeys!563 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4635 thiss!1504)))))

(declare-fun d!61075 () Bool)

(assert (=> d!61075 e!162908))

(declare-fun res!122998 () Bool)

(assert (=> d!61075 (=> (not res!122998) (not e!162908))))

(assert (=> d!61075 (= res!122998 (not (contains!1817 lt!125897 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61075 (= lt!125897 e!162905)))

(declare-fun c!42251 () Bool)

(assert (=> d!61075 (= c!42251 (bvsge #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(assert (=> d!61075 (validMask!0 (mask!10825 thiss!1504))))

(assert (=> d!61075 (= (getCurrentListMapNoExtraKeys!563 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)) lt!125897)))

(declare-fun b!251196 () Bool)

(declare-fun e!162904 () Bool)

(assert (=> b!251196 (= e!162903 e!162904)))

(assert (=> b!251196 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun res!122997 () Bool)

(assert (=> b!251196 (= res!122997 (contains!1817 lt!125897 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251196 (=> (not res!122997) (not e!162904))))

(declare-fun b!251197 () Bool)

(assert (=> b!251197 (= e!162902 (= lt!125897 (getCurrentListMapNoExtraKeys!563 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4635 thiss!1504))))))

(declare-fun b!251198 () Bool)

(assert (=> b!251198 (= e!162906 (validKeyInArray!0 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251198 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!251199 () Bool)

(declare-fun isEmpty!528 (ListLongMap!3759) Bool)

(assert (=> b!251199 (= e!162902 (isEmpty!528 lt!125897))))

(declare-fun b!251200 () Bool)

(assert (=> b!251200 (= e!162905 (ListLongMap!3760 Nil!3724))))

(declare-fun b!251201 () Bool)

(assert (=> b!251201 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(assert (=> b!251201 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6181 (_values!4618 thiss!1504))))))

(assert (=> b!251201 (= e!162904 (= (apply!241 lt!125897 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)) (get!3000 (select (arr!5836 (_values!4618 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4635 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!61075 c!42251) b!251200))

(assert (= (and d!61075 (not c!42251)) b!251190))

(assert (= (and b!251190 c!42254) b!251193))

(assert (= (and b!251190 (not c!42254)) b!251191))

(assert (= (or b!251193 b!251191) bm!23632))

(assert (= (and d!61075 res!122998) b!251192))

(assert (= (and b!251192 res!122999) b!251194))

(assert (= (and b!251194 res!123000) b!251198))

(assert (= (and b!251194 c!42253) b!251196))

(assert (= (and b!251194 (not c!42253)) b!251195))

(assert (= (and b!251196 res!122997) b!251201))

(assert (= (and b!251195 c!42252) b!251197))

(assert (= (and b!251195 (not c!42252)) b!251199))

(declare-fun b_lambda!8095 () Bool)

(assert (=> (not b_lambda!8095) (not b!251193)))

(assert (=> b!251193 t!8766))

(declare-fun b_and!13661 () Bool)

(assert (= b_and!13659 (and (=> t!8766 result!5307) b_and!13661)))

(declare-fun b_lambda!8097 () Bool)

(assert (=> (not b_lambda!8097) (not b!251201)))

(assert (=> b!251201 t!8766))

(declare-fun b_and!13663 () Bool)

(assert (= b_and!13661 (and (=> t!8766 result!5307) b_and!13663)))

(declare-fun m!267529 () Bool)

(assert (=> bm!23632 m!267529))

(declare-fun m!267531 () Bool)

(assert (=> d!61075 m!267531))

(assert (=> d!61075 m!267119))

(assert (=> b!251190 m!267227))

(assert (=> b!251190 m!267227))

(assert (=> b!251190 m!267229))

(declare-fun m!267533 () Bool)

(assert (=> b!251199 m!267533))

(assert (=> b!251197 m!267529))

(assert (=> b!251198 m!267227))

(assert (=> b!251198 m!267227))

(assert (=> b!251198 m!267229))

(assert (=> b!251193 m!267241))

(assert (=> b!251193 m!267243))

(assert (=> b!251193 m!267227))

(declare-fun m!267535 () Bool)

(assert (=> b!251193 m!267535))

(declare-fun m!267537 () Bool)

(assert (=> b!251193 m!267537))

(assert (=> b!251193 m!267535))

(assert (=> b!251193 m!267241))

(assert (=> b!251193 m!267243))

(assert (=> b!251193 m!267245))

(declare-fun m!267539 () Bool)

(assert (=> b!251193 m!267539))

(declare-fun m!267541 () Bool)

(assert (=> b!251193 m!267541))

(assert (=> b!251196 m!267227))

(assert (=> b!251196 m!267227))

(declare-fun m!267543 () Bool)

(assert (=> b!251196 m!267543))

(declare-fun m!267545 () Bool)

(assert (=> b!251192 m!267545))

(assert (=> b!251201 m!267241))

(assert (=> b!251201 m!267243))

(assert (=> b!251201 m!267227))

(assert (=> b!251201 m!267227))

(declare-fun m!267547 () Bool)

(assert (=> b!251201 m!267547))

(assert (=> b!251201 m!267241))

(assert (=> b!251201 m!267243))

(assert (=> b!251201 m!267245))

(assert (=> b!250950 d!61075))

(declare-fun d!61077 () Bool)

(declare-fun e!162909 () Bool)

(assert (=> d!61077 e!162909))

(declare-fun res!123001 () Bool)

(assert (=> d!61077 (=> (not res!123001) (not e!162909))))

(declare-fun lt!125905 () ListLongMap!3759)

(assert (=> d!61077 (= res!123001 (contains!1817 lt!125905 (_1!2434 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504)))))))

(declare-fun lt!125903 () List!3727)

(assert (=> d!61077 (= lt!125905 (ListLongMap!3760 lt!125903))))

(declare-fun lt!125904 () Unit!7760)

(declare-fun lt!125902 () Unit!7760)

(assert (=> d!61077 (= lt!125904 lt!125902)))

(assert (=> d!61077 (= (getValueByKey!299 lt!125903 (_1!2434 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504)))) (Some!304 (_2!2434 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504)))))))

(assert (=> d!61077 (= lt!125902 (lemmaContainsTupThenGetReturnValue!159 lt!125903 (_1!2434 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504))) (_2!2434 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504)))))))

(assert (=> d!61077 (= lt!125903 (insertStrictlySorted!162 (toList!1895 lt!125764) (_1!2434 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504))) (_2!2434 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504)))))))

(assert (=> d!61077 (= (+!668 lt!125764 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504))) lt!125905)))

(declare-fun b!251202 () Bool)

(declare-fun res!123002 () Bool)

(assert (=> b!251202 (=> (not res!123002) (not e!162909))))

(assert (=> b!251202 (= res!123002 (= (getValueByKey!299 (toList!1895 lt!125905) (_1!2434 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504)))) (Some!304 (_2!2434 (tuple2!4847 lt!125770 (minValue!4476 thiss!1504))))))))

(declare-fun b!251203 () Bool)

(assert (=> b!251203 (= e!162909 (contains!1820 (toList!1895 lt!125905) (tuple2!4847 lt!125770 (minValue!4476 thiss!1504))))))

(assert (= (and d!61077 res!123001) b!251202))

(assert (= (and b!251202 res!123002) b!251203))

(declare-fun m!267549 () Bool)

(assert (=> d!61077 m!267549))

(declare-fun m!267551 () Bool)

(assert (=> d!61077 m!267551))

(declare-fun m!267553 () Bool)

(assert (=> d!61077 m!267553))

(declare-fun m!267555 () Bool)

(assert (=> d!61077 m!267555))

(declare-fun m!267557 () Bool)

(assert (=> b!251202 m!267557))

(declare-fun m!267559 () Bool)

(assert (=> b!251203 m!267559))

(assert (=> b!250950 d!61077))

(declare-fun d!61079 () Bool)

(assert (=> d!61079 (= (apply!241 (+!668 lt!125768 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504))) lt!125755) (get!3001 (getValueByKey!299 (toList!1895 (+!668 lt!125768 (tuple2!4847 lt!125769 (zeroValue!4476 thiss!1504)))) lt!125755)))))

(declare-fun bs!8996 () Bool)

(assert (= bs!8996 d!61079))

(declare-fun m!267561 () Bool)

(assert (=> bs!8996 m!267561))

(assert (=> bs!8996 m!267561))

(declare-fun m!267563 () Bool)

(assert (=> bs!8996 m!267563))

(assert (=> b!250950 d!61079))

(declare-fun d!61081 () Bool)

(assert (=> d!61081 (contains!1817 (+!668 lt!125774 (tuple2!4847 lt!125763 (zeroValue!4476 thiss!1504))) lt!125756)))

(declare-fun lt!125908 () Unit!7760)

(declare-fun choose!1192 (ListLongMap!3759 (_ BitVec 64) V!8307 (_ BitVec 64)) Unit!7760)

(assert (=> d!61081 (= lt!125908 (choose!1192 lt!125774 lt!125763 (zeroValue!4476 thiss!1504) lt!125756))))

(assert (=> d!61081 (contains!1817 lt!125774 lt!125756)))

(assert (=> d!61081 (= (addStillContains!217 lt!125774 lt!125763 (zeroValue!4476 thiss!1504) lt!125756) lt!125908)))

(declare-fun bs!8997 () Bool)

(assert (= bs!8997 d!61081))

(assert (=> bs!8997 m!267255))

(assert (=> bs!8997 m!267255))

(assert (=> bs!8997 m!267257))

(declare-fun m!267565 () Bool)

(assert (=> bs!8997 m!267565))

(declare-fun m!267567 () Bool)

(assert (=> bs!8997 m!267567))

(assert (=> b!250950 d!61081))

(declare-fun d!61083 () Bool)

(assert (=> d!61083 (= (apply!241 lt!125766 lt!125773) (get!3001 (getValueByKey!299 (toList!1895 lt!125766) lt!125773)))))

(declare-fun bs!8998 () Bool)

(assert (= bs!8998 d!61083))

(declare-fun m!267569 () Bool)

(assert (=> bs!8998 m!267569))

(assert (=> bs!8998 m!267569))

(declare-fun m!267571 () Bool)

(assert (=> bs!8998 m!267571))

(assert (=> b!250950 d!61083))

(declare-fun d!61085 () Bool)

(assert (=> d!61085 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250993 d!61085))

(declare-fun bm!23633 () Bool)

(declare-fun call!23636 () Bool)

(assert (=> bm!23633 (= call!23636 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!125657 (mask!10825 thiss!1504)))))

(declare-fun b!251205 () Bool)

(declare-fun e!162910 () Bool)

(assert (=> b!251205 (= e!162910 call!23636)))

(declare-fun d!61087 () Bool)

(declare-fun res!123004 () Bool)

(declare-fun e!162912 () Bool)

(assert (=> d!61087 (=> res!123004 e!162912)))

(assert (=> d!61087 (= res!123004 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 lt!125657)))))

(assert (=> d!61087 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125657 (mask!10825 thiss!1504)) e!162912)))

(declare-fun b!251206 () Bool)

(declare-fun e!162911 () Bool)

(assert (=> b!251206 (= e!162910 e!162911)))

(declare-fun lt!125910 () (_ BitVec 64))

(assert (=> b!251206 (= lt!125910 (select (arr!5837 lt!125657) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!125909 () Unit!7760)

(assert (=> b!251206 (= lt!125909 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125657 lt!125910 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!251206 (arrayContainsKey!0 lt!125657 lt!125910 #b00000000000000000000000000000000)))

(declare-fun lt!125911 () Unit!7760)

(assert (=> b!251206 (= lt!125911 lt!125909)))

(declare-fun res!123003 () Bool)

(assert (=> b!251206 (= res!123003 (= (seekEntryOrOpen!0 (select (arr!5837 lt!125657) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!125657 (mask!10825 thiss!1504)) (Found!1124 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!251206 (=> (not res!123003) (not e!162911))))

(declare-fun b!251207 () Bool)

(assert (=> b!251207 (= e!162911 call!23636)))

(declare-fun b!251208 () Bool)

(assert (=> b!251208 (= e!162912 e!162910)))

(declare-fun c!42255 () Bool)

(assert (=> b!251208 (= c!42255 (validKeyInArray!0 (select (arr!5837 lt!125657) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!61087 (not res!123004)) b!251208))

(assert (= (and b!251208 c!42255) b!251206))

(assert (= (and b!251208 (not c!42255)) b!251205))

(assert (= (and b!251206 res!123003) b!251207))

(assert (= (or b!251207 b!251205) bm!23633))

(declare-fun m!267573 () Bool)

(assert (=> bm!23633 m!267573))

(declare-fun m!267575 () Bool)

(assert (=> b!251206 m!267575))

(declare-fun m!267577 () Bool)

(assert (=> b!251206 m!267577))

(declare-fun m!267579 () Bool)

(assert (=> b!251206 m!267579))

(assert (=> b!251206 m!267575))

(declare-fun m!267581 () Bool)

(assert (=> b!251206 m!267581))

(assert (=> b!251208 m!267575))

(assert (=> b!251208 m!267575))

(declare-fun m!267583 () Bool)

(assert (=> b!251208 m!267583))

(assert (=> bm!23613 d!61087))

(assert (=> b!251041 d!61043))

(assert (=> b!251042 d!61043))

(declare-fun d!61089 () Bool)

(assert (=> d!61089 (= (apply!241 lt!125771 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3001 (getValueByKey!299 (toList!1895 lt!125771) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8999 () Bool)

(assert (= bs!8999 d!61089))

(assert (=> bs!8999 m!267401))

(assert (=> bs!8999 m!267401))

(declare-fun m!267585 () Bool)

(assert (=> bs!8999 m!267585))

(assert (=> b!250937 d!61089))

(declare-fun lt!125912 () (_ BitVec 32))

(declare-fun d!61091 () Bool)

(assert (=> d!61091 (and (bvsge lt!125912 #b00000000000000000000000000000000) (bvsle lt!125912 (bvsub (size!6182 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!162914 () (_ BitVec 32))

(assert (=> d!61091 (= lt!125912 e!162914)))

(declare-fun c!42257 () Bool)

(assert (=> d!61091 (= c!42257 (bvsge #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(assert (=> d!61091 (and (bvsle #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6182 (_keys!6773 thiss!1504)) (size!6182 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))))))))

(assert (=> d!61091 (= (arrayCountValidKeys!0 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))) lt!125912)))

(declare-fun bm!23634 () Bool)

(declare-fun call!23637 () (_ BitVec 32))

(assert (=> bm!23634 (= call!23637 (arrayCountValidKeys!0 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun b!251209 () Bool)

(declare-fun e!162913 () (_ BitVec 32))

(assert (=> b!251209 (= e!162913 (bvadd #b00000000000000000000000000000001 call!23637))))

(declare-fun b!251210 () Bool)

(assert (=> b!251210 (= e!162914 e!162913)))

(declare-fun c!42256 () Bool)

(assert (=> b!251210 (= c!42256 (validKeyInArray!0 (select (arr!5837 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251211 () Bool)

(assert (=> b!251211 (= e!162914 #b00000000000000000000000000000000)))

(declare-fun b!251212 () Bool)

(assert (=> b!251212 (= e!162913 call!23637)))

(assert (= (and d!61091 c!42257) b!251211))

(assert (= (and d!61091 (not c!42257)) b!251210))

(assert (= (and b!251210 c!42256) b!251209))

(assert (= (and b!251210 (not c!42256)) b!251212))

(assert (= (or b!251209 b!251212) bm!23634))

(declare-fun m!267587 () Bool)

(assert (=> bm!23634 m!267587))

(assert (=> b!251210 m!267371))

(assert (=> b!251210 m!267371))

(assert (=> b!251210 m!267379))

(assert (=> b!250995 d!61091))

(assert (=> b!250995 d!61005))

(assert (=> b!250931 d!61031))

(declare-fun bm!23635 () Bool)

(declare-fun call!23638 () Bool)

(assert (=> bm!23635 (= call!23638 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6773 thiss!1504) (mask!10825 thiss!1504)))))

(declare-fun b!251213 () Bool)

(declare-fun e!162915 () Bool)

(assert (=> b!251213 (= e!162915 call!23638)))

(declare-fun d!61093 () Bool)

(declare-fun res!123006 () Bool)

(declare-fun e!162917 () Bool)

(assert (=> d!61093 (=> res!123006 e!162917)))

(assert (=> d!61093 (= res!123006 (bvsge #b00000000000000000000000000000000 (size!6182 (_keys!6773 thiss!1504))))))

(assert (=> d!61093 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)) e!162917)))

(declare-fun b!251214 () Bool)

(declare-fun e!162916 () Bool)

(assert (=> b!251214 (= e!162915 e!162916)))

(declare-fun lt!125914 () (_ BitVec 64))

(assert (=> b!251214 (= lt!125914 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125913 () Unit!7760)

(assert (=> b!251214 (= lt!125913 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6773 thiss!1504) lt!125914 #b00000000000000000000000000000000))))

(assert (=> b!251214 (arrayContainsKey!0 (_keys!6773 thiss!1504) lt!125914 #b00000000000000000000000000000000)))

(declare-fun lt!125915 () Unit!7760)

(assert (=> b!251214 (= lt!125915 lt!125913)))

(declare-fun res!123005 () Bool)

(assert (=> b!251214 (= res!123005 (= (seekEntryOrOpen!0 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000) (_keys!6773 thiss!1504) (mask!10825 thiss!1504)) (Found!1124 #b00000000000000000000000000000000)))))

(assert (=> b!251214 (=> (not res!123005) (not e!162916))))

(declare-fun b!251215 () Bool)

(assert (=> b!251215 (= e!162916 call!23638)))

(declare-fun b!251216 () Bool)

(assert (=> b!251216 (= e!162917 e!162915)))

(declare-fun c!42258 () Bool)

(assert (=> b!251216 (= c!42258 (validKeyInArray!0 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61093 (not res!123006)) b!251216))

(assert (= (and b!251216 c!42258) b!251214))

(assert (= (and b!251216 (not c!42258)) b!251213))

(assert (= (and b!251214 res!123005) b!251215))

(assert (= (or b!251215 b!251213) bm!23635))

(declare-fun m!267589 () Bool)

(assert (=> bm!23635 m!267589))

(assert (=> b!251214 m!267227))

(declare-fun m!267591 () Bool)

(assert (=> b!251214 m!267591))

(declare-fun m!267593 () Bool)

(assert (=> b!251214 m!267593))

(assert (=> b!251214 m!267227))

(declare-fun m!267595 () Bool)

(assert (=> b!251214 m!267595))

(assert (=> b!251216 m!267227))

(assert (=> b!251216 m!267227))

(assert (=> b!251216 m!267229))

(assert (=> b!251052 d!61093))

(declare-fun d!61095 () Bool)

(declare-fun res!123009 () Bool)

(declare-fun e!162920 () Bool)

(assert (=> d!61095 (=> res!123009 e!162920)))

(assert (=> d!61095 (= res!123009 (bvsge #b00000000000000000000000000000000 (size!6182 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))))))))

(assert (=> d!61095 (= (arrayNoDuplicates!0 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) #b00000000000000000000000000000000 Nil!3723) e!162920)))

(declare-fun e!162919 () Bool)

(declare-fun b!251217 () Bool)

(assert (=> b!251217 (= e!162919 (contains!1819 Nil!3723 (select (arr!5837 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251218 () Bool)

(declare-fun e!162918 () Bool)

(declare-fun e!162921 () Bool)

(assert (=> b!251218 (= e!162918 e!162921)))

(declare-fun c!42259 () Bool)

(assert (=> b!251218 (= c!42259 (validKeyInArray!0 (select (arr!5837 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun call!23639 () Bool)

(declare-fun bm!23636 () Bool)

(assert (=> bm!23636 (= call!23639 (arrayNoDuplicates!0 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42259 (Cons!3722 (select (arr!5837 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504)))) #b00000000000000000000000000000000) Nil!3723) Nil!3723)))))

(declare-fun b!251219 () Bool)

(assert (=> b!251219 (= e!162920 e!162918)))

(declare-fun res!123008 () Bool)

(assert (=> b!251219 (=> (not res!123008) (not e!162918))))

(assert (=> b!251219 (= res!123008 (not e!162919))))

(declare-fun res!123007 () Bool)

(assert (=> b!251219 (=> (not res!123007) (not e!162919))))

(assert (=> b!251219 (= res!123007 (validKeyInArray!0 (select (arr!5837 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251220 () Bool)

(assert (=> b!251220 (= e!162921 call!23639)))

(declare-fun b!251221 () Bool)

(assert (=> b!251221 (= e!162921 call!23639)))

(assert (= (and d!61095 (not res!123009)) b!251219))

(assert (= (and b!251219 res!123007) b!251217))

(assert (= (and b!251219 res!123008) b!251218))

(assert (= (and b!251218 c!42259) b!251220))

(assert (= (and b!251218 (not c!42259)) b!251221))

(assert (= (or b!251220 b!251221) bm!23636))

(assert (=> b!251217 m!267371))

(assert (=> b!251217 m!267371))

(declare-fun m!267597 () Bool)

(assert (=> b!251217 m!267597))

(assert (=> b!251218 m!267371))

(assert (=> b!251218 m!267371))

(assert (=> b!251218 m!267379))

(assert (=> bm!23636 m!267371))

(declare-fun m!267599 () Bool)

(assert (=> bm!23636 m!267599))

(assert (=> b!251219 m!267371))

(assert (=> b!251219 m!267371))

(assert (=> b!251219 m!267379))

(assert (=> b!251022 d!61095))

(declare-fun b!251240 () Bool)

(declare-fun e!162932 () SeekEntryResult!1124)

(assert (=> b!251240 (= e!162932 (Intermediate!1124 true (toIndex!0 key!932 (mask!10825 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!251241 () Bool)

(declare-fun lt!125921 () SeekEntryResult!1124)

(assert (=> b!251241 (and (bvsge (index!6668 lt!125921) #b00000000000000000000000000000000) (bvslt (index!6668 lt!125921) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun e!162935 () Bool)

(assert (=> b!251241 (= e!162935 (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6668 lt!125921)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251242 () Bool)

(declare-fun e!162934 () Bool)

(declare-fun e!162933 () Bool)

(assert (=> b!251242 (= e!162934 e!162933)))

(declare-fun res!123016 () Bool)

(assert (=> b!251242 (= res!123016 (and ((_ is Intermediate!1124) lt!125921) (not (undefined!1936 lt!125921)) (bvslt (x!24692 lt!125921) #b01111111111111111111111111111110) (bvsge (x!24692 lt!125921) #b00000000000000000000000000000000) (bvsge (x!24692 lt!125921) #b00000000000000000000000000000000)))))

(assert (=> b!251242 (=> (not res!123016) (not e!162933))))

(declare-fun b!251243 () Bool)

(declare-fun e!162936 () SeekEntryResult!1124)

(assert (=> b!251243 (= e!162936 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10825 thiss!1504)) #b00000000000000000000000000000000 (mask!10825 thiss!1504)) key!932 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)))))

(declare-fun b!251244 () Bool)

(assert (=> b!251244 (= e!162936 (Intermediate!1124 false (toIndex!0 key!932 (mask!10825 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!61097 () Bool)

(assert (=> d!61097 e!162934))

(declare-fun c!42266 () Bool)

(assert (=> d!61097 (= c!42266 (and ((_ is Intermediate!1124) lt!125921) (undefined!1936 lt!125921)))))

(assert (=> d!61097 (= lt!125921 e!162932)))

(declare-fun c!42267 () Bool)

(assert (=> d!61097 (= c!42267 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!125920 () (_ BitVec 64))

(assert (=> d!61097 (= lt!125920 (select (arr!5837 (_keys!6773 thiss!1504)) (toIndex!0 key!932 (mask!10825 thiss!1504))))))

(assert (=> d!61097 (validMask!0 (mask!10825 thiss!1504))))

(assert (=> d!61097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10825 thiss!1504)) key!932 (_keys!6773 thiss!1504) (mask!10825 thiss!1504)) lt!125921)))

(declare-fun b!251245 () Bool)

(assert (=> b!251245 (= e!162934 (bvsge (x!24692 lt!125921) #b01111111111111111111111111111110))))

(declare-fun b!251246 () Bool)

(assert (=> b!251246 (and (bvsge (index!6668 lt!125921) #b00000000000000000000000000000000) (bvslt (index!6668 lt!125921) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun res!123018 () Bool)

(assert (=> b!251246 (= res!123018 (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6668 lt!125921)) key!932))))

(assert (=> b!251246 (=> res!123018 e!162935)))

(assert (=> b!251246 (= e!162933 e!162935)))

(declare-fun b!251247 () Bool)

(assert (=> b!251247 (and (bvsge (index!6668 lt!125921) #b00000000000000000000000000000000) (bvslt (index!6668 lt!125921) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun res!123017 () Bool)

(assert (=> b!251247 (= res!123017 (= (select (arr!5837 (_keys!6773 thiss!1504)) (index!6668 lt!125921)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251247 (=> res!123017 e!162935)))

(declare-fun b!251248 () Bool)

(assert (=> b!251248 (= e!162932 e!162936)))

(declare-fun c!42268 () Bool)

(assert (=> b!251248 (= c!42268 (or (= lt!125920 key!932) (= (bvadd lt!125920 lt!125920) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61097 c!42267) b!251240))

(assert (= (and d!61097 (not c!42267)) b!251248))

(assert (= (and b!251248 c!42268) b!251244))

(assert (= (and b!251248 (not c!42268)) b!251243))

(assert (= (and d!61097 c!42266) b!251245))

(assert (= (and d!61097 (not c!42266)) b!251242))

(assert (= (and b!251242 res!123016) b!251246))

(assert (= (and b!251246 (not res!123018)) b!251247))

(assert (= (and b!251247 (not res!123017)) b!251241))

(declare-fun m!267601 () Bool)

(assert (=> b!251241 m!267601))

(assert (=> b!251246 m!267601))

(assert (=> b!251243 m!267289))

(declare-fun m!267603 () Bool)

(assert (=> b!251243 m!267603))

(assert (=> b!251243 m!267603))

(declare-fun m!267605 () Bool)

(assert (=> b!251243 m!267605))

(assert (=> d!61097 m!267289))

(declare-fun m!267607 () Bool)

(assert (=> d!61097 m!267607))

(assert (=> d!61097 m!267119))

(assert (=> b!251247 m!267601))

(assert (=> d!60985 d!61097))

(declare-fun d!61099 () Bool)

(declare-fun lt!125927 () (_ BitVec 32))

(declare-fun lt!125926 () (_ BitVec 32))

(assert (=> d!61099 (= lt!125927 (bvmul (bvxor lt!125926 (bvlshr lt!125926 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!61099 (= lt!125926 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!61099 (and (bvsge (mask!10825 thiss!1504) #b00000000000000000000000000000000) (let ((res!123019 (let ((h!4386 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24711 (bvmul (bvxor h!4386 (bvlshr h!4386 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24711 (bvlshr x!24711 #b00000000000000000000000000001101)) (mask!10825 thiss!1504)))))) (and (bvslt res!123019 (bvadd (mask!10825 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!123019 #b00000000000000000000000000000000))))))

(assert (=> d!61099 (= (toIndex!0 key!932 (mask!10825 thiss!1504)) (bvand (bvxor lt!125927 (bvlshr lt!125927 #b00000000000000000000000000001101)) (mask!10825 thiss!1504)))))

(assert (=> d!60985 d!61099))

(assert (=> d!60985 d!60995))

(assert (=> b!250948 d!61031))

(declare-fun d!61101 () Bool)

(assert (=> d!61101 (arrayNoDuplicates!0 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) #b00000000000000000000000000000000 Nil!3723)))

(assert (=> d!61101 true))

(declare-fun _$65!80 () Unit!7760)

(assert (=> d!61101 (= (choose!41 (_keys!6773 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3723) _$65!80)))

(declare-fun bs!9000 () Bool)

(assert (= bs!9000 d!61101))

(assert (=> bs!9000 m!267129))

(assert (=> bs!9000 m!267333))

(assert (=> d!61001 d!61101))

(assert (=> bm!23610 d!61075))

(declare-fun d!61103 () Bool)

(declare-fun lt!125928 () (_ BitVec 32))

(assert (=> d!61103 (and (bvsge lt!125928 #b00000000000000000000000000000000) (bvsle lt!125928 (bvsub (size!6182 lt!125657) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!162938 () (_ BitVec 32))

(assert (=> d!61103 (= lt!125928 e!162938)))

(declare-fun c!42270 () Bool)

(assert (=> d!61103 (= c!42270 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))))))

(assert (=> d!61103 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6182 (_keys!6773 thiss!1504)) (size!6182 lt!125657)))))

(assert (=> d!61103 (= (arrayCountValidKeys!0 lt!125657 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))) lt!125928)))

(declare-fun bm!23637 () Bool)

(declare-fun call!23640 () (_ BitVec 32))

(assert (=> bm!23637 (= call!23640 (arrayCountValidKeys!0 lt!125657 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun b!251249 () Bool)

(declare-fun e!162937 () (_ BitVec 32))

(assert (=> b!251249 (= e!162937 (bvadd #b00000000000000000000000000000001 call!23640))))

(declare-fun b!251250 () Bool)

(assert (=> b!251250 (= e!162938 e!162937)))

(declare-fun c!42269 () Bool)

(assert (=> b!251250 (= c!42269 (validKeyInArray!0 (select (arr!5837 lt!125657) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251251 () Bool)

(assert (=> b!251251 (= e!162938 #b00000000000000000000000000000000)))

(declare-fun b!251252 () Bool)

(assert (=> b!251252 (= e!162937 call!23640)))

(assert (= (and d!61103 c!42270) b!251251))

(assert (= (and d!61103 (not c!42270)) b!251250))

(assert (= (and b!251250 c!42269) b!251249))

(assert (= (and b!251250 (not c!42269)) b!251252))

(assert (= (or b!251249 b!251252) bm!23637))

(declare-fun m!267609 () Bool)

(assert (=> bm!23637 m!267609))

(assert (=> b!251250 m!267575))

(assert (=> b!251250 m!267575))

(assert (=> b!251250 m!267583))

(assert (=> bm!23616 d!61103))

(declare-fun d!61105 () Bool)

(declare-fun res!123020 () Bool)

(declare-fun e!162939 () Bool)

(assert (=> d!61105 (=> res!123020 e!162939)))

(assert (=> d!61105 (= res!123020 (= (select (arr!5837 (_keys!6773 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!61105 (= (arrayContainsKey!0 (_keys!6773 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!162939)))

(declare-fun b!251253 () Bool)

(declare-fun e!162940 () Bool)

(assert (=> b!251253 (= e!162939 e!162940)))

(declare-fun res!123021 () Bool)

(assert (=> b!251253 (=> (not res!123021) (not e!162940))))

(assert (=> b!251253 (= res!123021 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6182 (_keys!6773 thiss!1504))))))

(declare-fun b!251254 () Bool)

(assert (=> b!251254 (= e!162940 (arrayContainsKey!0 (_keys!6773 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!61105 (not res!123020)) b!251253))

(assert (= (and b!251253 res!123021) b!251254))

(assert (=> d!61105 m!267389))

(declare-fun m!267611 () Bool)

(assert (=> b!251254 m!267611))

(assert (=> b!250959 d!61105))

(declare-fun b!251263 () Bool)

(declare-fun res!123033 () Bool)

(declare-fun e!162943 () Bool)

(assert (=> b!251263 (=> (not res!123033) (not e!162943))))

(assert (=> b!251263 (= res!123033 (and (= (size!6181 (_values!4618 thiss!1504)) (bvadd (mask!10825 thiss!1504) #b00000000000000000000000000000001)) (= (size!6182 (_keys!6773 thiss!1504)) (size!6181 (_values!4618 thiss!1504))) (bvsge (_size!1903 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1903 thiss!1504) (bvadd (mask!10825 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!61107 () Bool)

(declare-fun res!123030 () Bool)

(assert (=> d!61107 (=> (not res!123030) (not e!162943))))

(assert (=> d!61107 (= res!123030 (validMask!0 (mask!10825 thiss!1504)))))

(assert (=> d!61107 (= (simpleValid!264 thiss!1504) e!162943)))

(declare-fun b!251265 () Bool)

(declare-fun res!123031 () Bool)

(assert (=> b!251265 (=> (not res!123031) (not e!162943))))

(declare-fun size!6185 (LongMapFixedSize!3708) (_ BitVec 32))

(assert (=> b!251265 (= res!123031 (= (size!6185 thiss!1504) (bvadd (_size!1903 thiss!1504) (bvsdiv (bvadd (extraKeys!4372 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!251266 () Bool)

(assert (=> b!251266 (= e!162943 (and (bvsge (extraKeys!4372 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4372 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1903 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!251264 () Bool)

(declare-fun res!123032 () Bool)

(assert (=> b!251264 (=> (not res!123032) (not e!162943))))

(assert (=> b!251264 (= res!123032 (bvsge (size!6185 thiss!1504) (_size!1903 thiss!1504)))))

(assert (= (and d!61107 res!123030) b!251263))

(assert (= (and b!251263 res!123033) b!251264))

(assert (= (and b!251264 res!123032) b!251265))

(assert (= (and b!251265 res!123031) b!251266))

(assert (=> d!61107 m!267119))

(declare-fun m!267613 () Bool)

(assert (=> b!251265 m!267613))

(assert (=> b!251264 m!267613))

(assert (=> d!61011 d!61107))

(assert (=> b!251017 d!61043))

(declare-fun d!61109 () Bool)

(declare-fun e!162945 () Bool)

(assert (=> d!61109 e!162945))

(declare-fun res!123034 () Bool)

(assert (=> d!61109 (=> res!123034 e!162945)))

(declare-fun lt!125929 () Bool)

(assert (=> d!61109 (= res!123034 (not lt!125929))))

(declare-fun lt!125931 () Bool)

(assert (=> d!61109 (= lt!125929 lt!125931)))

(declare-fun lt!125932 () Unit!7760)

(declare-fun e!162944 () Unit!7760)

(assert (=> d!61109 (= lt!125932 e!162944)))

(declare-fun c!42271 () Bool)

(assert (=> d!61109 (= c!42271 lt!125931)))

(assert (=> d!61109 (= lt!125931 (containsKey!291 (toList!1895 lt!125771) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61109 (= (contains!1817 lt!125771 #b0000000000000000000000000000000000000000000000000000000000000000) lt!125929)))

(declare-fun b!251267 () Bool)

(declare-fun lt!125930 () Unit!7760)

(assert (=> b!251267 (= e!162944 lt!125930)))

(assert (=> b!251267 (= lt!125930 (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1895 lt!125771) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251267 (isDefined!240 (getValueByKey!299 (toList!1895 lt!125771) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251268 () Bool)

(declare-fun Unit!7775 () Unit!7760)

(assert (=> b!251268 (= e!162944 Unit!7775)))

(declare-fun b!251269 () Bool)

(assert (=> b!251269 (= e!162945 (isDefined!240 (getValueByKey!299 (toList!1895 lt!125771) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61109 c!42271) b!251267))

(assert (= (and d!61109 (not c!42271)) b!251268))

(assert (= (and d!61109 (not res!123034)) b!251269))

(declare-fun m!267615 () Bool)

(assert (=> d!61109 m!267615))

(declare-fun m!267617 () Bool)

(assert (=> b!251267 m!267617))

(assert (=> b!251267 m!267353))

(assert (=> b!251267 m!267353))

(declare-fun m!267619 () Bool)

(assert (=> b!251267 m!267619))

(assert (=> b!251269 m!267353))

(assert (=> b!251269 m!267353))

(assert (=> b!251269 m!267619))

(assert (=> bm!23608 d!61109))

(declare-fun d!61111 () Bool)

(assert (=> d!61111 (= (apply!241 lt!125771 (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000)) (get!3001 (getValueByKey!299 (toList!1895 lt!125771) (select (arr!5837 (_keys!6773 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9001 () Bool)

(assert (= bs!9001 d!61111))

(assert (=> bs!9001 m!267227))

(assert (=> bs!9001 m!267365))

(assert (=> bs!9001 m!267365))

(declare-fun m!267621 () Bool)

(assert (=> bs!9001 m!267621))

(assert (=> b!250939 d!61111))

(declare-fun d!61113 () Bool)

(declare-fun c!42274 () Bool)

(assert (=> d!61113 (= c!42274 ((_ is ValueCellFull!2904) (select (arr!5836 (_values!4618 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!162948 () V!8307)

(assert (=> d!61113 (= (get!3000 (select (arr!5836 (_values!4618 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4635 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!162948)))

(declare-fun b!251274 () Bool)

(declare-fun get!3002 (ValueCell!2904 V!8307) V!8307)

(assert (=> b!251274 (= e!162948 (get!3002 (select (arr!5836 (_values!4618 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4635 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251275 () Bool)

(declare-fun get!3003 (ValueCell!2904 V!8307) V!8307)

(assert (=> b!251275 (= e!162948 (get!3003 (select (arr!5836 (_values!4618 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4635 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61113 c!42274) b!251274))

(assert (= (and d!61113 (not c!42274)) b!251275))

(assert (=> b!251274 m!267241))

(assert (=> b!251274 m!267243))

(declare-fun m!267623 () Bool)

(assert (=> b!251274 m!267623))

(assert (=> b!251275 m!267241))

(assert (=> b!251275 m!267243))

(declare-fun m!267625 () Bool)

(assert (=> b!251275 m!267625))

(assert (=> b!250939 d!61113))

(declare-fun d!61115 () Bool)

(assert (=> d!61115 (= (inRange!0 (index!6667 lt!125790) (mask!10825 thiss!1504)) (and (bvsge (index!6667 lt!125790) #b00000000000000000000000000000000) (bvslt (index!6667 lt!125790) (bvadd (mask!10825 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!250982 d!61115))

(declare-fun d!61117 () Bool)

(declare-fun lt!125935 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!166 (List!3726) (InoxSet (_ BitVec 64)))

(assert (=> d!61117 (= lt!125935 (select (content!166 Nil!3723) (select (arr!5837 lt!125657) #b00000000000000000000000000000000)))))

(declare-fun e!162954 () Bool)

(assert (=> d!61117 (= lt!125935 e!162954)))

(declare-fun res!123039 () Bool)

(assert (=> d!61117 (=> (not res!123039) (not e!162954))))

(assert (=> d!61117 (= res!123039 ((_ is Cons!3722) Nil!3723))))

(assert (=> d!61117 (= (contains!1819 Nil!3723 (select (arr!5837 lt!125657) #b00000000000000000000000000000000)) lt!125935)))

(declare-fun b!251280 () Bool)

(declare-fun e!162953 () Bool)

(assert (=> b!251280 (= e!162954 e!162953)))

(declare-fun res!123040 () Bool)

(assert (=> b!251280 (=> res!123040 e!162953)))

(assert (=> b!251280 (= res!123040 (= (h!4382 Nil!3723) (select (arr!5837 lt!125657) #b00000000000000000000000000000000)))))

(declare-fun b!251281 () Bool)

(assert (=> b!251281 (= e!162953 (contains!1819 (t!8761 Nil!3723) (select (arr!5837 lt!125657) #b00000000000000000000000000000000)))))

(assert (= (and d!61117 res!123039) b!251280))

(assert (= (and b!251280 (not res!123040)) b!251281))

(declare-fun m!267627 () Bool)

(assert (=> d!61117 m!267627))

(assert (=> d!61117 m!267319))

(declare-fun m!267629 () Bool)

(assert (=> d!61117 m!267629))

(assert (=> b!251281 m!267319))

(declare-fun m!267631 () Bool)

(assert (=> b!251281 m!267631))

(assert (=> b!251040 d!61117))

(declare-fun d!61119 () Bool)

(assert (=> d!61119 (isDefined!240 (getValueByKey!299 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))) key!932))))

(declare-fun lt!125938 () Unit!7760)

(declare-fun choose!1193 (List!3727 (_ BitVec 64)) Unit!7760)

(assert (=> d!61119 (= lt!125938 (choose!1193 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))) key!932))))

(declare-fun e!162957 () Bool)

(assert (=> d!61119 e!162957))

(declare-fun res!123043 () Bool)

(assert (=> d!61119 (=> (not res!123043) (not e!162957))))

(declare-fun isStrictlySorted!371 (List!3727) Bool)

(assert (=> d!61119 (= res!123043 (isStrictlySorted!371 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))))))

(assert (=> d!61119 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!239 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))) key!932) lt!125938)))

(declare-fun b!251284 () Bool)

(assert (=> b!251284 (= e!162957 (containsKey!291 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))) key!932))))

(assert (= (and d!61119 res!123043) b!251284))

(assert (=> d!61119 m!267223))

(assert (=> d!61119 m!267223))

(assert (=> d!61119 m!267225))

(declare-fun m!267633 () Bool)

(assert (=> d!61119 m!267633))

(declare-fun m!267635 () Bool)

(assert (=> d!61119 m!267635))

(assert (=> b!251284 m!267219))

(assert (=> b!250886 d!61119))

(declare-fun d!61121 () Bool)

(declare-fun isEmpty!529 (Option!305) Bool)

(assert (=> d!61121 (= (isDefined!240 (getValueByKey!299 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))) key!932)) (not (isEmpty!529 (getValueByKey!299 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))) key!932))))))

(declare-fun bs!9002 () Bool)

(assert (= bs!9002 d!61121))

(assert (=> bs!9002 m!267223))

(declare-fun m!267637 () Bool)

(assert (=> bs!9002 m!267637))

(assert (=> b!250886 d!61121))

(declare-fun b!251296 () Bool)

(declare-fun e!162963 () Option!305)

(assert (=> b!251296 (= e!162963 None!303)))

(declare-fun b!251293 () Bool)

(declare-fun e!162962 () Option!305)

(assert (=> b!251293 (= e!162962 (Some!304 (_2!2434 (h!4383 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))))))))

(declare-fun b!251295 () Bool)

(assert (=> b!251295 (= e!162963 (getValueByKey!299 (t!8762 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))) key!932))))

(declare-fun b!251294 () Bool)

(assert (=> b!251294 (= e!162962 e!162963)))

(declare-fun c!42280 () Bool)

(assert (=> b!251294 (= c!42280 (and ((_ is Cons!3723) (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))) (not (= (_1!2434 (h!4383 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))))) key!932))))))

(declare-fun d!61123 () Bool)

(declare-fun c!42279 () Bool)

(assert (=> d!61123 (= c!42279 (and ((_ is Cons!3723) (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504)))) (= (_1!2434 (h!4383 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))))) key!932)))))

(assert (=> d!61123 (= (getValueByKey!299 (toList!1895 (getCurrentListMap!1423 (_keys!6773 thiss!1504) (_values!4618 thiss!1504) (mask!10825 thiss!1504) (extraKeys!4372 thiss!1504) (zeroValue!4476 thiss!1504) (minValue!4476 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4635 thiss!1504))) key!932) e!162962)))

(assert (= (and d!61123 c!42279) b!251293))

(assert (= (and d!61123 (not c!42279)) b!251294))

(assert (= (and b!251294 c!42280) b!251295))

(assert (= (and b!251294 (not c!42280)) b!251296))

(declare-fun m!267639 () Bool)

(assert (=> b!251295 m!267639))

(assert (=> b!250886 d!61123))

(declare-fun d!61125 () Bool)

(assert (=> d!61125 (= (validKeyInArray!0 (select (arr!5837 (_keys!6773 thiss!1504)) index!297)) (and (not (= (select (arr!5837 (_keys!6773 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5837 (_keys!6773 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250992 d!61125))

(declare-fun d!61127 () Bool)

(declare-fun res!123046 () Bool)

(declare-fun e!162966 () Bool)

(assert (=> d!61127 (=> res!123046 e!162966)))

(assert (=> d!61127 (= res!123046 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6182 lt!125657)))))

(assert (=> d!61127 (= (arrayNoDuplicates!0 lt!125657 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42217 (Cons!3722 (select (arr!5837 lt!125657) #b00000000000000000000000000000000) Nil!3723) Nil!3723)) e!162966)))

(declare-fun b!251297 () Bool)

(declare-fun e!162965 () Bool)

(assert (=> b!251297 (= e!162965 (contains!1819 (ite c!42217 (Cons!3722 (select (arr!5837 lt!125657) #b00000000000000000000000000000000) Nil!3723) Nil!3723) (select (arr!5837 lt!125657) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251298 () Bool)

(declare-fun e!162964 () Bool)

(declare-fun e!162967 () Bool)

(assert (=> b!251298 (= e!162964 e!162967)))

(declare-fun c!42281 () Bool)

(assert (=> b!251298 (= c!42281 (validKeyInArray!0 (select (arr!5837 lt!125657) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!23638 () Bool)

(declare-fun call!23641 () Bool)

(assert (=> bm!23638 (= call!23641 (arrayNoDuplicates!0 lt!125657 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!42281 (Cons!3722 (select (arr!5837 lt!125657) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!42217 (Cons!3722 (select (arr!5837 lt!125657) #b00000000000000000000000000000000) Nil!3723) Nil!3723)) (ite c!42217 (Cons!3722 (select (arr!5837 lt!125657) #b00000000000000000000000000000000) Nil!3723) Nil!3723))))))

(declare-fun b!251299 () Bool)

(assert (=> b!251299 (= e!162966 e!162964)))

(declare-fun res!123045 () Bool)

(assert (=> b!251299 (=> (not res!123045) (not e!162964))))

(assert (=> b!251299 (= res!123045 (not e!162965))))

(declare-fun res!123044 () Bool)

(assert (=> b!251299 (=> (not res!123044) (not e!162965))))

(assert (=> b!251299 (= res!123044 (validKeyInArray!0 (select (arr!5837 lt!125657) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251300 () Bool)

(assert (=> b!251300 (= e!162967 call!23641)))

(declare-fun b!251301 () Bool)

(assert (=> b!251301 (= e!162967 call!23641)))

(assert (= (and d!61127 (not res!123046)) b!251299))

(assert (= (and b!251299 res!123044) b!251297))

(assert (= (and b!251299 res!123045) b!251298))

(assert (= (and b!251298 c!42281) b!251300))

(assert (= (and b!251298 (not c!42281)) b!251301))

(assert (= (or b!251300 b!251301) bm!23638))

(assert (=> b!251297 m!267575))

(assert (=> b!251297 m!267575))

(declare-fun m!267641 () Bool)

(assert (=> b!251297 m!267641))

(assert (=> b!251298 m!267575))

(assert (=> b!251298 m!267575))

(assert (=> b!251298 m!267583))

(assert (=> bm!23638 m!267575))

(declare-fun m!267643 () Bool)

(assert (=> bm!23638 m!267643))

(assert (=> b!251299 m!267575))

(assert (=> b!251299 m!267575))

(assert (=> b!251299 m!267583))

(assert (=> bm!23620 d!61127))

(assert (=> b!250888 d!61121))

(assert (=> b!250888 d!61123))

(declare-fun d!61129 () Bool)

(assert (=> d!61129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12312 (store (arr!5837 (_keys!6773 thiss!1504)) index!297 key!932) (size!6182 (_keys!6773 thiss!1504))) (mask!10825 thiss!1504))))

(assert (=> d!61129 true))

(declare-fun _$56!27 () Unit!7760)

(assert (=> d!61129 (= (choose!102 key!932 (_keys!6773 thiss!1504) index!297 (mask!10825 thiss!1504)) _$56!27)))

(declare-fun bs!9003 () Bool)

(assert (= bs!9003 d!61129))

(assert (=> bs!9003 m!267129))

(assert (=> bs!9003 m!267337))

(assert (=> d!61003 d!61129))

(assert (=> d!61003 d!60995))

(declare-fun b!251303 () Bool)

(declare-fun e!162969 () Bool)

(assert (=> b!251303 (= e!162969 tp_is_empty!6495)))

(declare-fun condMapEmpty!11045 () Bool)

(declare-fun mapDefault!11045 () ValueCell!2904)

(assert (=> mapNonEmpty!11044 (= condMapEmpty!11045 (= mapRest!11044 ((as const (Array (_ BitVec 32) ValueCell!2904)) mapDefault!11045)))))

(declare-fun mapRes!11045 () Bool)

(assert (=> mapNonEmpty!11044 (= tp!23176 (and e!162969 mapRes!11045))))

(declare-fun b!251302 () Bool)

(declare-fun e!162968 () Bool)

(assert (=> b!251302 (= e!162968 tp_is_empty!6495)))

(declare-fun mapNonEmpty!11045 () Bool)

(declare-fun tp!23177 () Bool)

(assert (=> mapNonEmpty!11045 (= mapRes!11045 (and tp!23177 e!162968))))

(declare-fun mapKey!11045 () (_ BitVec 32))

(declare-fun mapValue!11045 () ValueCell!2904)

(declare-fun mapRest!11045 () (Array (_ BitVec 32) ValueCell!2904))

(assert (=> mapNonEmpty!11045 (= mapRest!11044 (store mapRest!11045 mapKey!11045 mapValue!11045))))

(declare-fun mapIsEmpty!11045 () Bool)

(assert (=> mapIsEmpty!11045 mapRes!11045))

(assert (= (and mapNonEmpty!11044 condMapEmpty!11045) mapIsEmpty!11045))

(assert (= (and mapNonEmpty!11044 (not condMapEmpty!11045)) mapNonEmpty!11045))

(assert (= (and mapNonEmpty!11045 ((_ is ValueCellFull!2904) mapValue!11045)) b!251302))

(assert (= (and mapNonEmpty!11044 ((_ is ValueCellFull!2904) mapDefault!11045)) b!251303))

(declare-fun m!267645 () Bool)

(assert (=> mapNonEmpty!11045 m!267645))

(declare-fun b_lambda!8099 () Bool)

(assert (= b_lambda!8095 (or (and b!250783 b_free!6633) b_lambda!8099)))

(declare-fun b_lambda!8101 () Bool)

(assert (= b_lambda!8097 (or (and b!250783 b_free!6633) b_lambda!8101)))

(check-sat (not b!251164) (not bm!23622) (not b!251275) (not b!251156) (not b!251250) (not b!251297) (not b!251144) (not d!61067) (not b!251190) (not b!251069) (not b!251265) (not d!61063) (not b!251299) (not d!61071) (not d!61097) (not d!61047) (not b!251099) (not b!251134) (not b!251208) (not b!251063) (not bm!23634) (not b!251203) (not d!61077) (not b!251269) (not b!251110) (not b!251165) (not b!251206) (not b!251067) (not d!61029) (not d!61045) (not b!251158) (not b!251192) (not b_next!6633) (not b!251163) (not d!61033) (not b!251264) (not b!251218) (not b!251202) (not b!251127) (not d!61017) (not d!61041) (not bm!23628) (not b!251073) (not d!61101) (not d!61061) (not b!251141) (not d!61109) (not b!251071) (not d!61129) (not b!251214) (not b!251274) (not d!61013) (not b!251193) b_and!13663 (not d!61083) (not d!61119) (not b!251298) (not d!61065) (not d!61035) (not b!251108) (not b_lambda!8099) (not b!251197) (not b!251210) (not b!251062) (not bm!23627) (not b!251142) (not b!251267) (not b!251160) (not d!61037) (not d!61021) (not b_lambda!8093) (not d!61107) (not b!251198) (not b!251159) (not d!61027) (not d!61117) tp_is_empty!6495 (not b!251295) (not b!251199) (not d!61075) (not d!61089) (not bm!23621) (not d!61055) (not bm!23636) (not b!251196) (not b!251217) (not bm!23637) (not b!251254) (not b!251281) (not d!61053) (not bm!23635) (not d!61111) (not d!61081) (not b!251106) (not b!251219) (not d!61069) (not d!61057) (not b!251284) (not b!251150) (not d!61073) (not d!61121) (not bm!23632) (not b!251216) (not b!251130) (not b!251064) (not bm!23638) (not d!61079) (not b!251143) (not b_lambda!8101) (not b!251162) (not d!61049) (not b!251201) (not mapNonEmpty!11045) (not d!61059) (not b!251243) (not bm!23633) (not bm!23629))
(check-sat b_and!13663 (not b_next!6633))
