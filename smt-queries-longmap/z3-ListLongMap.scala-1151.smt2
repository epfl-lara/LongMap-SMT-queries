; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24184 () Bool)

(assert start!24184)

(declare-fun b!252676 () Bool)

(declare-fun b_free!6655 () Bool)

(declare-fun b_next!6655 () Bool)

(assert (=> b!252676 (= b_free!6655 (not b_next!6655))))

(declare-fun tp!23247 () Bool)

(declare-fun b_and!13667 () Bool)

(assert (=> b!252676 (= tp!23247 b_and!13667)))

(declare-fun b!252672 () Bool)

(declare-fun res!123655 () Bool)

(declare-fun e!163846 () Bool)

(assert (=> b!252672 (=> (not res!123655) (not e!163846))))

(declare-datatypes ((V!8337 0))(
  ( (V!8338 (val!3303 Int)) )
))
(declare-datatypes ((ValueCell!2915 0))(
  ( (ValueCellFull!2915 (v!5369 V!8337)) (EmptyCell!2915) )
))
(declare-datatypes ((array!12353 0))(
  ( (array!12354 (arr!5853 (Array (_ BitVec 32) ValueCell!2915)) (size!6201 (_ BitVec 32))) )
))
(declare-datatypes ((array!12355 0))(
  ( (array!12356 (arr!5854 (Array (_ BitVec 32) (_ BitVec 64))) (size!6202 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3730 0))(
  ( (LongMapFixedSize!3731 (defaultEntry!4670 Int) (mask!10895 (_ BitVec 32)) (extraKeys!4407 (_ BitVec 32)) (zeroValue!4511 V!8337) (minValue!4511 V!8337) (_size!1914 (_ BitVec 32)) (_keys!6819 array!12355) (_values!4653 array!12353) (_vacant!1914 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3730)

(declare-datatypes ((SeekEntryResult!1134 0))(
  ( (MissingZero!1134 (index!6706 (_ BitVec 32))) (Found!1134 (index!6707 (_ BitVec 32))) (Intermediate!1134 (undefined!1946 Bool) (index!6708 (_ BitVec 32)) (x!24789 (_ BitVec 32))) (Undefined!1134) (MissingVacant!1134 (index!6709 (_ BitVec 32))) )
))
(declare-fun lt!126559 () SeekEntryResult!1134)

(assert (=> b!252672 (= res!123655 (= (select (arr!5854 (_keys!6819 thiss!1504)) (index!6706 lt!126559)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23805 () Bool)

(declare-fun call!23808 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23805 (= call!23808 (arrayContainsKey!0 (_keys!6819 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun call!23809 () Bool)

(declare-fun c!42591 () Bool)

(declare-fun bm!23806 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23806 (= call!23809 (inRange!0 (ite c!42591 (index!6706 lt!126559) (index!6709 lt!126559)) (mask!10895 thiss!1504)))))

(declare-fun b!252673 () Bool)

(declare-datatypes ((Unit!7801 0))(
  ( (Unit!7802) )
))
(declare-fun e!163840 () Unit!7801)

(declare-fun Unit!7803 () Unit!7801)

(assert (=> b!252673 (= e!163840 Unit!7803)))

(declare-fun b!252674 () Bool)

(declare-fun Unit!7804 () Unit!7801)

(assert (=> b!252674 (= e!163840 Unit!7804)))

(declare-fun lt!126558 () Unit!7801)

(declare-fun lemmaArrayContainsKeyThenInListMap!216 (array!12355 array!12353 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) (_ BitVec 32) Int) Unit!7801)

(assert (=> b!252674 (= lt!126558 (lemmaArrayContainsKeyThenInListMap!216 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(assert (=> b!252674 false))

(declare-fun b!252675 () Bool)

(declare-fun e!163833 () Bool)

(declare-fun e!163836 () Bool)

(assert (=> b!252675 (= e!163833 e!163836)))

(declare-fun res!123661 () Bool)

(assert (=> b!252675 (= res!123661 call!23809)))

(assert (=> b!252675 (=> (not res!123661) (not e!163836))))

(declare-fun e!163839 () Bool)

(declare-fun tp_is_empty!6517 () Bool)

(declare-fun e!163835 () Bool)

(declare-fun array_inv!3865 (array!12355) Bool)

(declare-fun array_inv!3866 (array!12353) Bool)

(assert (=> b!252676 (= e!163839 (and tp!23247 tp_is_empty!6517 (array_inv!3865 (_keys!6819 thiss!1504)) (array_inv!3866 (_values!4653 thiss!1504)) e!163835))))

(declare-fun b!252677 () Bool)

(declare-fun e!163842 () Unit!7801)

(declare-fun Unit!7805 () Unit!7801)

(assert (=> b!252677 (= e!163842 Unit!7805)))

(declare-fun lt!126554 () Unit!7801)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!408 (array!12355 array!12353 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) Int) Unit!7801)

(assert (=> b!252677 (= lt!126554 (lemmaInListMapThenSeekEntryOrOpenFindsIt!408 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)))))

(assert (=> b!252677 false))

(declare-fun mapIsEmpty!11085 () Bool)

(declare-fun mapRes!11085 () Bool)

(assert (=> mapIsEmpty!11085 mapRes!11085))

(declare-fun b!252678 () Bool)

(declare-fun res!123653 () Bool)

(assert (=> b!252678 (=> (not res!123653) (not e!163846))))

(assert (=> b!252678 (= res!123653 call!23809)))

(declare-fun e!163837 () Bool)

(assert (=> b!252678 (= e!163837 e!163846)))

(declare-fun b!252679 () Bool)

(declare-fun e!163845 () Bool)

(assert (=> b!252679 (= e!163845 tp_is_empty!6517)))

(declare-fun b!252680 () Bool)

(assert (=> b!252680 (= e!163836 (not call!23808))))

(declare-fun b!252682 () Bool)

(assert (=> b!252682 (= e!163846 (not call!23808))))

(declare-fun b!252683 () Bool)

(get-info :version)

(assert (=> b!252683 (= e!163833 ((_ is Undefined!1134) lt!126559))))

(declare-fun b!252684 () Bool)

(declare-fun e!163841 () Bool)

(assert (=> b!252684 (= e!163841 tp_is_empty!6517)))

(declare-fun b!252685 () Bool)

(declare-fun res!123663 () Bool)

(assert (=> b!252685 (= res!123663 (= (select (arr!5854 (_keys!6819 thiss!1504)) (index!6709 lt!126559)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252685 (=> (not res!123663) (not e!163836))))

(declare-fun b!252686 () Bool)

(assert (=> b!252686 (= e!163835 (and e!163845 mapRes!11085))))

(declare-fun condMapEmpty!11085 () Bool)

(declare-fun mapDefault!11085 () ValueCell!2915)

(assert (=> b!252686 (= condMapEmpty!11085 (= (arr!5853 (_values!4653 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2915)) mapDefault!11085)))))

(declare-fun b!252687 () Bool)

(declare-fun c!42590 () Bool)

(assert (=> b!252687 (= c!42590 ((_ is MissingVacant!1134) lt!126559))))

(assert (=> b!252687 (= e!163837 e!163833)))

(declare-fun b!252688 () Bool)

(declare-fun res!123657 () Bool)

(declare-fun e!163844 () Bool)

(assert (=> b!252688 (=> res!123657 e!163844)))

(assert (=> b!252688 (= res!123657 (or (not (= (size!6201 (_values!4653 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10895 thiss!1504)))) (not (= (size!6202 (_keys!6819 thiss!1504)) (size!6201 (_values!4653 thiss!1504)))) (bvslt (mask!10895 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4407 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4407 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11085 () Bool)

(declare-fun tp!23246 () Bool)

(assert (=> mapNonEmpty!11085 (= mapRes!11085 (and tp!23246 e!163841))))

(declare-fun mapKey!11085 () (_ BitVec 32))

(declare-fun mapValue!11085 () ValueCell!2915)

(declare-fun mapRest!11085 () (Array (_ BitVec 32) ValueCell!2915))

(assert (=> mapNonEmpty!11085 (= (arr!5853 (_values!4653 thiss!1504)) (store mapRest!11085 mapKey!11085 mapValue!11085))))

(declare-fun b!252689 () Bool)

(declare-fun res!123662 () Bool)

(assert (=> b!252689 (=> res!123662 e!163844)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12355 (_ BitVec 32)) Bool)

(assert (=> b!252689 (= res!123662 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6819 thiss!1504) (mask!10895 thiss!1504))))))

(declare-fun b!252690 () Bool)

(declare-fun res!123658 () Bool)

(declare-fun e!163838 () Bool)

(assert (=> b!252690 (=> (not res!123658) (not e!163838))))

(assert (=> b!252690 (= res!123658 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!252691 () Bool)

(declare-fun e!163843 () Bool)

(assert (=> b!252691 (= e!163838 e!163843)))

(declare-fun res!123656 () Bool)

(assert (=> b!252691 (=> (not res!123656) (not e!163843))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!252691 (= res!123656 (or (= lt!126559 (MissingZero!1134 index!297)) (= lt!126559 (MissingVacant!1134 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12355 (_ BitVec 32)) SeekEntryResult!1134)

(assert (=> b!252691 (= lt!126559 (seekEntryOrOpen!0 key!932 (_keys!6819 thiss!1504) (mask!10895 thiss!1504)))))

(declare-fun b!252692 () Bool)

(declare-fun res!123654 () Bool)

(assert (=> b!252692 (=> res!123654 e!163844)))

(declare-datatypes ((List!3725 0))(
  ( (Nil!3722) (Cons!3721 (h!4383 (_ BitVec 64)) (t!8759 List!3725)) )
))
(declare-fun arrayNoDuplicates!0 (array!12355 (_ BitVec 32) List!3725) Bool)

(assert (=> b!252692 (= res!123654 (not (arrayNoDuplicates!0 (_keys!6819 thiss!1504) #b00000000000000000000000000000000 Nil!3722)))))

(declare-fun b!252693 () Bool)

(declare-fun lt!126557 () Unit!7801)

(assert (=> b!252693 (= e!163842 lt!126557)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!408 (array!12355 array!12353 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) Int) Unit!7801)

(assert (=> b!252693 (= lt!126557 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!408 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)))))

(assert (=> b!252693 (= c!42591 ((_ is MissingZero!1134) lt!126559))))

(assert (=> b!252693 e!163837))

(declare-fun b!252694 () Bool)

(assert (=> b!252694 (= e!163844 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6202 (_keys!6819 thiss!1504)))))))

(declare-fun b!252695 () Bool)

(declare-fun e!163847 () Bool)

(assert (=> b!252695 (= e!163847 (not e!163844))))

(declare-fun res!123652 () Bool)

(assert (=> b!252695 (=> res!123652 e!163844)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!252695 (= res!123652 (not (validMask!0 (mask!10895 thiss!1504))))))

(declare-fun lt!126552 () array!12355)

(assert (=> b!252695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126552 (mask!10895 thiss!1504))))

(declare-fun lt!126560 () Unit!7801)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12355 (_ BitVec 32) (_ BitVec 32)) Unit!7801)

(assert (=> b!252695 (= lt!126560 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6819 thiss!1504) index!297 (mask!10895 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12355 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!252695 (= (arrayCountValidKeys!0 lt!126552 #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6819 thiss!1504) #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504)))))))

(declare-fun lt!126551 () Unit!7801)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12355 (_ BitVec 32) (_ BitVec 64)) Unit!7801)

(assert (=> b!252695 (= lt!126551 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6819 thiss!1504) index!297 key!932))))

(assert (=> b!252695 (arrayNoDuplicates!0 lt!126552 #b00000000000000000000000000000000 Nil!3722)))

(assert (=> b!252695 (= lt!126552 (array!12356 (store (arr!5854 (_keys!6819 thiss!1504)) index!297 key!932) (size!6202 (_keys!6819 thiss!1504))))))

(declare-fun lt!126556 () Unit!7801)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12355 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3725) Unit!7801)

(assert (=> b!252695 (= lt!126556 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6819 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3722))))

(declare-fun lt!126553 () Unit!7801)

(assert (=> b!252695 (= lt!126553 e!163840)))

(declare-fun c!42592 () Bool)

(assert (=> b!252695 (= c!42592 (arrayContainsKey!0 (_keys!6819 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252681 () Bool)

(assert (=> b!252681 (= e!163843 e!163847)))

(declare-fun res!123659 () Bool)

(assert (=> b!252681 (=> (not res!123659) (not e!163847))))

(assert (=> b!252681 (= res!123659 (inRange!0 index!297 (mask!10895 thiss!1504)))))

(declare-fun lt!126555 () Unit!7801)

(assert (=> b!252681 (= lt!126555 e!163842)))

(declare-fun c!42589 () Bool)

(declare-datatypes ((tuple2!4826 0))(
  ( (tuple2!4827 (_1!2424 (_ BitVec 64)) (_2!2424 V!8337)) )
))
(declare-datatypes ((List!3726 0))(
  ( (Nil!3723) (Cons!3722 (h!4384 tuple2!4826) (t!8760 List!3726)) )
))
(declare-datatypes ((ListLongMap!3729 0))(
  ( (ListLongMap!3730 (toList!1880 List!3726)) )
))
(declare-fun contains!1813 (ListLongMap!3729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1389 (array!12355 array!12353 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 32) Int) ListLongMap!3729)

(assert (=> b!252681 (= c!42589 (contains!1813 (getCurrentListMap!1389 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)) key!932))))

(declare-fun res!123660 () Bool)

(assert (=> start!24184 (=> (not res!123660) (not e!163838))))

(declare-fun valid!1462 (LongMapFixedSize!3730) Bool)

(assert (=> start!24184 (= res!123660 (valid!1462 thiss!1504))))

(assert (=> start!24184 e!163838))

(assert (=> start!24184 e!163839))

(assert (=> start!24184 true))

(assert (= (and start!24184 res!123660) b!252690))

(assert (= (and b!252690 res!123658) b!252691))

(assert (= (and b!252691 res!123656) b!252681))

(assert (= (and b!252681 c!42589) b!252677))

(assert (= (and b!252681 (not c!42589)) b!252693))

(assert (= (and b!252693 c!42591) b!252678))

(assert (= (and b!252693 (not c!42591)) b!252687))

(assert (= (and b!252678 res!123653) b!252672))

(assert (= (and b!252672 res!123655) b!252682))

(assert (= (and b!252687 c!42590) b!252675))

(assert (= (and b!252687 (not c!42590)) b!252683))

(assert (= (and b!252675 res!123661) b!252685))

(assert (= (and b!252685 res!123663) b!252680))

(assert (= (or b!252678 b!252675) bm!23806))

(assert (= (or b!252682 b!252680) bm!23805))

(assert (= (and b!252681 res!123659) b!252695))

(assert (= (and b!252695 c!42592) b!252674))

(assert (= (and b!252695 (not c!42592)) b!252673))

(assert (= (and b!252695 (not res!123652)) b!252688))

(assert (= (and b!252688 (not res!123657)) b!252689))

(assert (= (and b!252689 (not res!123662)) b!252692))

(assert (= (and b!252692 (not res!123654)) b!252694))

(assert (= (and b!252686 condMapEmpty!11085) mapIsEmpty!11085))

(assert (= (and b!252686 (not condMapEmpty!11085)) mapNonEmpty!11085))

(assert (= (and mapNonEmpty!11085 ((_ is ValueCellFull!2915) mapValue!11085)) b!252684))

(assert (= (and b!252686 ((_ is ValueCellFull!2915) mapDefault!11085)) b!252679))

(assert (= b!252676 b!252686))

(assert (= start!24184 b!252676))

(declare-fun m!268221 () Bool)

(assert (=> b!252677 m!268221))

(declare-fun m!268223 () Bool)

(assert (=> b!252689 m!268223))

(declare-fun m!268225 () Bool)

(assert (=> b!252676 m!268225))

(declare-fun m!268227 () Bool)

(assert (=> b!252676 m!268227))

(declare-fun m!268229 () Bool)

(assert (=> b!252685 m!268229))

(declare-fun m!268231 () Bool)

(assert (=> b!252695 m!268231))

(declare-fun m!268233 () Bool)

(assert (=> b!252695 m!268233))

(declare-fun m!268235 () Bool)

(assert (=> b!252695 m!268235))

(declare-fun m!268237 () Bool)

(assert (=> b!252695 m!268237))

(declare-fun m!268239 () Bool)

(assert (=> b!252695 m!268239))

(declare-fun m!268241 () Bool)

(assert (=> b!252695 m!268241))

(declare-fun m!268243 () Bool)

(assert (=> b!252695 m!268243))

(declare-fun m!268245 () Bool)

(assert (=> b!252695 m!268245))

(declare-fun m!268247 () Bool)

(assert (=> b!252695 m!268247))

(declare-fun m!268249 () Bool)

(assert (=> b!252695 m!268249))

(declare-fun m!268251 () Bool)

(assert (=> b!252672 m!268251))

(declare-fun m!268253 () Bool)

(assert (=> start!24184 m!268253))

(declare-fun m!268255 () Bool)

(assert (=> b!252692 m!268255))

(assert (=> bm!23805 m!268233))

(declare-fun m!268257 () Bool)

(assert (=> bm!23806 m!268257))

(declare-fun m!268259 () Bool)

(assert (=> b!252681 m!268259))

(declare-fun m!268261 () Bool)

(assert (=> b!252681 m!268261))

(assert (=> b!252681 m!268261))

(declare-fun m!268263 () Bool)

(assert (=> b!252681 m!268263))

(declare-fun m!268265 () Bool)

(assert (=> mapNonEmpty!11085 m!268265))

(declare-fun m!268267 () Bool)

(assert (=> b!252693 m!268267))

(declare-fun m!268269 () Bool)

(assert (=> b!252674 m!268269))

(declare-fun m!268271 () Bool)

(assert (=> b!252691 m!268271))

(check-sat (not b!252689) (not b!252693) (not b!252695) (not b!252681) (not b!252676) (not b!252674) tp_is_empty!6517 b_and!13667 (not mapNonEmpty!11085) (not bm!23806) (not b!252692) (not bm!23805) (not b!252691) (not b!252677) (not start!24184) (not b_next!6655))
(check-sat b_and!13667 (not b_next!6655))
(get-model)

(declare-fun d!61235 () Bool)

(assert (=> d!61235 (contains!1813 (getCurrentListMap!1389 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)) key!932)))

(declare-fun lt!126623 () Unit!7801)

(declare-fun choose!1213 (array!12355 array!12353 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) (_ BitVec 32) Int) Unit!7801)

(assert (=> d!61235 (= lt!126623 (choose!1213 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(assert (=> d!61235 (validMask!0 (mask!10895 thiss!1504))))

(assert (=> d!61235 (= (lemmaArrayContainsKeyThenInListMap!216 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)) lt!126623)))

(declare-fun bs!9010 () Bool)

(assert (= bs!9010 d!61235))

(assert (=> bs!9010 m!268261))

(assert (=> bs!9010 m!268261))

(assert (=> bs!9010 m!268263))

(declare-fun m!268377 () Bool)

(assert (=> bs!9010 m!268377))

(assert (=> bs!9010 m!268231))

(assert (=> b!252674 d!61235))

(declare-fun b!252856 () Bool)

(declare-fun res!123746 () Bool)

(declare-fun e!163949 () Bool)

(assert (=> b!252856 (=> (not res!123746) (not e!163949))))

(declare-fun call!23826 () Bool)

(assert (=> b!252856 (= res!123746 call!23826)))

(declare-fun e!163948 () Bool)

(assert (=> b!252856 (= e!163948 e!163949)))

(declare-fun b!252857 () Bool)

(declare-fun lt!126629 () SeekEntryResult!1134)

(assert (=> b!252857 (= e!163948 ((_ is Undefined!1134) lt!126629))))

(declare-fun b!252858 () Bool)

(declare-fun call!23827 () Bool)

(assert (=> b!252858 (= e!163949 (not call!23827))))

(declare-fun b!252859 () Bool)

(declare-fun e!163946 () Bool)

(assert (=> b!252859 (= e!163946 e!163948)))

(declare-fun c!42621 () Bool)

(assert (=> b!252859 (= c!42621 ((_ is MissingVacant!1134) lt!126629))))

(declare-fun b!252860 () Bool)

(declare-fun e!163947 () Bool)

(assert (=> b!252860 (= e!163946 e!163947)))

(declare-fun res!123745 () Bool)

(assert (=> b!252860 (= res!123745 call!23826)))

(assert (=> b!252860 (=> (not res!123745) (not e!163947))))

(declare-fun b!252861 () Bool)

(assert (=> b!252861 (= e!163947 (not call!23827))))

(declare-fun b!252862 () Bool)

(declare-fun res!123744 () Bool)

(assert (=> b!252862 (=> (not res!123744) (not e!163949))))

(assert (=> b!252862 (= res!123744 (= (select (arr!5854 (_keys!6819 thiss!1504)) (index!6709 lt!126629)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252862 (and (bvsge (index!6709 lt!126629) #b00000000000000000000000000000000) (bvslt (index!6709 lt!126629) (size!6202 (_keys!6819 thiss!1504))))))

(declare-fun bm!23823 () Bool)

(declare-fun c!42622 () Bool)

(assert (=> bm!23823 (= call!23826 (inRange!0 (ite c!42622 (index!6706 lt!126629) (index!6709 lt!126629)) (mask!10895 thiss!1504)))))

(declare-fun d!61237 () Bool)

(assert (=> d!61237 e!163946))

(assert (=> d!61237 (= c!42622 ((_ is MissingZero!1134) lt!126629))))

(assert (=> d!61237 (= lt!126629 (seekEntryOrOpen!0 key!932 (_keys!6819 thiss!1504) (mask!10895 thiss!1504)))))

(declare-fun lt!126628 () Unit!7801)

(declare-fun choose!1214 (array!12355 array!12353 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) Int) Unit!7801)

(assert (=> d!61237 (= lt!126628 (choose!1214 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)))))

(assert (=> d!61237 (validMask!0 (mask!10895 thiss!1504))))

(assert (=> d!61237 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!408 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)) lt!126628)))

(declare-fun bm!23824 () Bool)

(assert (=> bm!23824 (= call!23827 (arrayContainsKey!0 (_keys!6819 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252863 () Bool)

(assert (=> b!252863 (and (bvsge (index!6706 lt!126629) #b00000000000000000000000000000000) (bvslt (index!6706 lt!126629) (size!6202 (_keys!6819 thiss!1504))))))

(declare-fun res!123747 () Bool)

(assert (=> b!252863 (= res!123747 (= (select (arr!5854 (_keys!6819 thiss!1504)) (index!6706 lt!126629)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252863 (=> (not res!123747) (not e!163947))))

(assert (= (and d!61237 c!42622) b!252860))

(assert (= (and d!61237 (not c!42622)) b!252859))

(assert (= (and b!252860 res!123745) b!252863))

(assert (= (and b!252863 res!123747) b!252861))

(assert (= (and b!252859 c!42621) b!252856))

(assert (= (and b!252859 (not c!42621)) b!252857))

(assert (= (and b!252856 res!123746) b!252862))

(assert (= (and b!252862 res!123744) b!252858))

(assert (= (or b!252860 b!252856) bm!23823))

(assert (= (or b!252861 b!252858) bm!23824))

(declare-fun m!268379 () Bool)

(assert (=> b!252862 m!268379))

(assert (=> bm!23824 m!268233))

(assert (=> d!61237 m!268271))

(declare-fun m!268381 () Bool)

(assert (=> d!61237 m!268381))

(assert (=> d!61237 m!268231))

(declare-fun m!268383 () Bool)

(assert (=> b!252863 m!268383))

(declare-fun m!268385 () Bool)

(assert (=> bm!23823 m!268385))

(assert (=> b!252693 d!61237))

(declare-fun d!61239 () Bool)

(assert (=> d!61239 (= (inRange!0 index!297 (mask!10895 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10895 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!252681 d!61239))

(declare-fun d!61241 () Bool)

(declare-fun e!163954 () Bool)

(assert (=> d!61241 e!163954))

(declare-fun res!123750 () Bool)

(assert (=> d!61241 (=> res!123750 e!163954)))

(declare-fun lt!126641 () Bool)

(assert (=> d!61241 (= res!123750 (not lt!126641))))

(declare-fun lt!126638 () Bool)

(assert (=> d!61241 (= lt!126641 lt!126638)))

(declare-fun lt!126639 () Unit!7801)

(declare-fun e!163955 () Unit!7801)

(assert (=> d!61241 (= lt!126639 e!163955)))

(declare-fun c!42625 () Bool)

(assert (=> d!61241 (= c!42625 lt!126638)))

(declare-fun containsKey!293 (List!3726 (_ BitVec 64)) Bool)

(assert (=> d!61241 (= lt!126638 (containsKey!293 (toList!1880 (getCurrentListMap!1389 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504))) key!932))))

(assert (=> d!61241 (= (contains!1813 (getCurrentListMap!1389 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)) key!932) lt!126641)))

(declare-fun b!252870 () Bool)

(declare-fun lt!126640 () Unit!7801)

(assert (=> b!252870 (= e!163955 lt!126640)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!242 (List!3726 (_ BitVec 64)) Unit!7801)

(assert (=> b!252870 (= lt!126640 (lemmaContainsKeyImpliesGetValueByKeyDefined!242 (toList!1880 (getCurrentListMap!1389 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504))) key!932))))

(declare-datatypes ((Option!307 0))(
  ( (Some!306 (v!5372 V!8337)) (None!305) )
))
(declare-fun isDefined!243 (Option!307) Bool)

(declare-fun getValueByKey!301 (List!3726 (_ BitVec 64)) Option!307)

(assert (=> b!252870 (isDefined!243 (getValueByKey!301 (toList!1880 (getCurrentListMap!1389 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504))) key!932))))

(declare-fun b!252871 () Bool)

(declare-fun Unit!7811 () Unit!7801)

(assert (=> b!252871 (= e!163955 Unit!7811)))

(declare-fun b!252872 () Bool)

(assert (=> b!252872 (= e!163954 (isDefined!243 (getValueByKey!301 (toList!1880 (getCurrentListMap!1389 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504))) key!932)))))

(assert (= (and d!61241 c!42625) b!252870))

(assert (= (and d!61241 (not c!42625)) b!252871))

(assert (= (and d!61241 (not res!123750)) b!252872))

(declare-fun m!268387 () Bool)

(assert (=> d!61241 m!268387))

(declare-fun m!268389 () Bool)

(assert (=> b!252870 m!268389))

(declare-fun m!268391 () Bool)

(assert (=> b!252870 m!268391))

(assert (=> b!252870 m!268391))

(declare-fun m!268393 () Bool)

(assert (=> b!252870 m!268393))

(assert (=> b!252872 m!268391))

(assert (=> b!252872 m!268391))

(assert (=> b!252872 m!268393))

(assert (=> b!252681 d!61241))

(declare-fun bm!23839 () Bool)

(declare-fun call!23847 () ListLongMap!3729)

(declare-fun call!23843 () ListLongMap!3729)

(assert (=> bm!23839 (= call!23847 call!23843)))

(declare-fun bm!23840 () Bool)

(declare-fun call!23844 () ListLongMap!3729)

(declare-fun getCurrentListMapNoExtraKeys!561 (array!12355 array!12353 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 32) Int) ListLongMap!3729)

(assert (=> bm!23840 (= call!23844 (getCurrentListMapNoExtraKeys!561 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(declare-fun bm!23841 () Bool)

(declare-fun call!23842 () ListLongMap!3729)

(declare-fun call!23846 () ListLongMap!3729)

(assert (=> bm!23841 (= call!23842 call!23846)))

(declare-fun b!252915 () Bool)

(declare-fun e!163993 () ListLongMap!3729)

(assert (=> b!252915 (= e!163993 call!23847)))

(declare-fun bm!23842 () Bool)

(assert (=> bm!23842 (= call!23846 call!23844)))

(declare-fun b!252916 () Bool)

(declare-fun e!163994 () Bool)

(declare-fun e!163985 () Bool)

(assert (=> b!252916 (= e!163994 e!163985)))

(declare-fun c!42643 () Bool)

(assert (=> b!252916 (= c!42643 (not (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!252917 () Bool)

(declare-fun res!123774 () Bool)

(assert (=> b!252917 (=> (not res!123774) (not e!163994))))

(declare-fun e!163989 () Bool)

(assert (=> b!252917 (= res!123774 e!163989)))

(declare-fun c!42640 () Bool)

(assert (=> b!252917 (= c!42640 (not (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!252918 () Bool)

(declare-fun e!163987 () ListLongMap!3729)

(declare-fun +!678 (ListLongMap!3729 tuple2!4826) ListLongMap!3729)

(assert (=> b!252918 (= e!163987 (+!678 call!23843 (tuple2!4827 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4511 thiss!1504))))))

(declare-fun b!252919 () Bool)

(assert (=> b!252919 (= e!163993 call!23842)))

(declare-fun b!252920 () Bool)

(declare-fun e!163988 () Bool)

(declare-fun lt!126691 () ListLongMap!3729)

(declare-fun apply!245 (ListLongMap!3729 (_ BitVec 64)) V!8337)

(assert (=> b!252920 (= e!163988 (= (apply!245 lt!126691 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4511 thiss!1504)))))

(declare-fun c!42638 () Bool)

(declare-fun c!42641 () Bool)

(declare-fun bm!23843 () Bool)

(assert (=> bm!23843 (= call!23843 (+!678 (ite c!42641 call!23844 (ite c!42638 call!23846 call!23842)) (ite (or c!42641 c!42638) (tuple2!4827 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4511 thiss!1504)) (tuple2!4827 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4511 thiss!1504)))))))

(declare-fun b!252921 () Bool)

(declare-fun e!163982 () Unit!7801)

(declare-fun lt!126703 () Unit!7801)

(assert (=> b!252921 (= e!163982 lt!126703)))

(declare-fun lt!126699 () ListLongMap!3729)

(assert (=> b!252921 (= lt!126699 (getCurrentListMapNoExtraKeys!561 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(declare-fun lt!126688 () (_ BitVec 64))

(assert (=> b!252921 (= lt!126688 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126700 () (_ BitVec 64))

(assert (=> b!252921 (= lt!126700 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126698 () Unit!7801)

(declare-fun addStillContains!221 (ListLongMap!3729 (_ BitVec 64) V!8337 (_ BitVec 64)) Unit!7801)

(assert (=> b!252921 (= lt!126698 (addStillContains!221 lt!126699 lt!126688 (zeroValue!4511 thiss!1504) lt!126700))))

(assert (=> b!252921 (contains!1813 (+!678 lt!126699 (tuple2!4827 lt!126688 (zeroValue!4511 thiss!1504))) lt!126700)))

(declare-fun lt!126705 () Unit!7801)

(assert (=> b!252921 (= lt!126705 lt!126698)))

(declare-fun lt!126690 () ListLongMap!3729)

(assert (=> b!252921 (= lt!126690 (getCurrentListMapNoExtraKeys!561 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(declare-fun lt!126702 () (_ BitVec 64))

(assert (=> b!252921 (= lt!126702 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126689 () (_ BitVec 64))

(assert (=> b!252921 (= lt!126689 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126686 () Unit!7801)

(declare-fun addApplyDifferent!221 (ListLongMap!3729 (_ BitVec 64) V!8337 (_ BitVec 64)) Unit!7801)

(assert (=> b!252921 (= lt!126686 (addApplyDifferent!221 lt!126690 lt!126702 (minValue!4511 thiss!1504) lt!126689))))

(assert (=> b!252921 (= (apply!245 (+!678 lt!126690 (tuple2!4827 lt!126702 (minValue!4511 thiss!1504))) lt!126689) (apply!245 lt!126690 lt!126689))))

(declare-fun lt!126695 () Unit!7801)

(assert (=> b!252921 (= lt!126695 lt!126686)))

(declare-fun lt!126701 () ListLongMap!3729)

(assert (=> b!252921 (= lt!126701 (getCurrentListMapNoExtraKeys!561 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(declare-fun lt!126694 () (_ BitVec 64))

(assert (=> b!252921 (= lt!126694 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126704 () (_ BitVec 64))

(assert (=> b!252921 (= lt!126704 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126697 () Unit!7801)

(assert (=> b!252921 (= lt!126697 (addApplyDifferent!221 lt!126701 lt!126694 (zeroValue!4511 thiss!1504) lt!126704))))

(assert (=> b!252921 (= (apply!245 (+!678 lt!126701 (tuple2!4827 lt!126694 (zeroValue!4511 thiss!1504))) lt!126704) (apply!245 lt!126701 lt!126704))))

(declare-fun lt!126706 () Unit!7801)

(assert (=> b!252921 (= lt!126706 lt!126697)))

(declare-fun lt!126692 () ListLongMap!3729)

(assert (=> b!252921 (= lt!126692 (getCurrentListMapNoExtraKeys!561 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(declare-fun lt!126707 () (_ BitVec 64))

(assert (=> b!252921 (= lt!126707 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126687 () (_ BitVec 64))

(assert (=> b!252921 (= lt!126687 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252921 (= lt!126703 (addApplyDifferent!221 lt!126692 lt!126707 (minValue!4511 thiss!1504) lt!126687))))

(assert (=> b!252921 (= (apply!245 (+!678 lt!126692 (tuple2!4827 lt!126707 (minValue!4511 thiss!1504))) lt!126687) (apply!245 lt!126692 lt!126687))))

(declare-fun b!252922 () Bool)

(declare-fun e!163984 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!252922 (= e!163984 (validKeyInArray!0 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61243 () Bool)

(assert (=> d!61243 e!163994))

(declare-fun res!123775 () Bool)

(assert (=> d!61243 (=> (not res!123775) (not e!163994))))

(assert (=> d!61243 (= res!123775 (or (bvsge #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))))))))

(declare-fun lt!126696 () ListLongMap!3729)

(assert (=> d!61243 (= lt!126691 lt!126696)))

(declare-fun lt!126693 () Unit!7801)

(assert (=> d!61243 (= lt!126693 e!163982)))

(declare-fun c!42642 () Bool)

(assert (=> d!61243 (= c!42642 e!163984)))

(declare-fun res!123773 () Bool)

(assert (=> d!61243 (=> (not res!123773) (not e!163984))))

(assert (=> d!61243 (= res!123773 (bvslt #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))))))

(assert (=> d!61243 (= lt!126696 e!163987)))

(assert (=> d!61243 (= c!42641 (and (not (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61243 (validMask!0 (mask!10895 thiss!1504))))

(assert (=> d!61243 (= (getCurrentListMap!1389 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)) lt!126691)))

(declare-fun b!252923 () Bool)

(declare-fun e!163986 () Bool)

(assert (=> b!252923 (= e!163989 e!163986)))

(declare-fun res!123769 () Bool)

(declare-fun call!23848 () Bool)

(assert (=> b!252923 (= res!123769 call!23848)))

(assert (=> b!252923 (=> (not res!123769) (not e!163986))))

(declare-fun b!252924 () Bool)

(declare-fun Unit!7812 () Unit!7801)

(assert (=> b!252924 (= e!163982 Unit!7812)))

(declare-fun b!252925 () Bool)

(declare-fun c!42639 () Bool)

(assert (=> b!252925 (= c!42639 (and (not (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!163990 () ListLongMap!3729)

(assert (=> b!252925 (= e!163990 e!163993)))

(declare-fun b!252926 () Bool)

(assert (=> b!252926 (= e!163990 call!23847)))

(declare-fun b!252927 () Bool)

(declare-fun res!123770 () Bool)

(assert (=> b!252927 (=> (not res!123770) (not e!163994))))

(declare-fun e!163992 () Bool)

(assert (=> b!252927 (= res!123770 e!163992)))

(declare-fun res!123771 () Bool)

(assert (=> b!252927 (=> res!123771 e!163992)))

(declare-fun e!163991 () Bool)

(assert (=> b!252927 (= res!123771 (not e!163991))))

(declare-fun res!123776 () Bool)

(assert (=> b!252927 (=> (not res!123776) (not e!163991))))

(assert (=> b!252927 (= res!123776 (bvslt #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))))))

(declare-fun b!252928 () Bool)

(declare-fun call!23845 () Bool)

(assert (=> b!252928 (= e!163985 (not call!23845))))

(declare-fun bm!23844 () Bool)

(assert (=> bm!23844 (= call!23845 (contains!1813 lt!126691 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252929 () Bool)

(declare-fun e!163983 () Bool)

(assert (=> b!252929 (= e!163992 e!163983)))

(declare-fun res!123777 () Bool)

(assert (=> b!252929 (=> (not res!123777) (not e!163983))))

(assert (=> b!252929 (= res!123777 (contains!1813 lt!126691 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!252929 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))))))

(declare-fun b!252930 () Bool)

(assert (=> b!252930 (= e!163986 (= (apply!245 lt!126691 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4511 thiss!1504)))))

(declare-fun b!252931 () Bool)

(declare-fun get!3012 (ValueCell!2915 V!8337) V!8337)

(declare-fun dynLambda!579 (Int (_ BitVec 64)) V!8337)

(assert (=> b!252931 (= e!163983 (= (apply!245 lt!126691 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000)) (get!3012 (select (arr!5853 (_values!4653 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!579 (defaultEntry!4670 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!252931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6201 (_values!4653 thiss!1504))))))

(assert (=> b!252931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))))))

(declare-fun bm!23845 () Bool)

(assert (=> bm!23845 (= call!23848 (contains!1813 lt!126691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252932 () Bool)

(assert (=> b!252932 (= e!163991 (validKeyInArray!0 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252933 () Bool)

(assert (=> b!252933 (= e!163989 (not call!23848))))

(declare-fun b!252934 () Bool)

(assert (=> b!252934 (= e!163985 e!163988)))

(declare-fun res!123772 () Bool)

(assert (=> b!252934 (= res!123772 call!23845)))

(assert (=> b!252934 (=> (not res!123772) (not e!163988))))

(declare-fun b!252935 () Bool)

(assert (=> b!252935 (= e!163987 e!163990)))

(assert (=> b!252935 (= c!42638 (and (not (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61243 c!42641) b!252918))

(assert (= (and d!61243 (not c!42641)) b!252935))

(assert (= (and b!252935 c!42638) b!252926))

(assert (= (and b!252935 (not c!42638)) b!252925))

(assert (= (and b!252925 c!42639) b!252915))

(assert (= (and b!252925 (not c!42639)) b!252919))

(assert (= (or b!252915 b!252919) bm!23841))

(assert (= (or b!252926 bm!23841) bm!23842))

(assert (= (or b!252926 b!252915) bm!23839))

(assert (= (or b!252918 bm!23842) bm!23840))

(assert (= (or b!252918 bm!23839) bm!23843))

(assert (= (and d!61243 res!123773) b!252922))

(assert (= (and d!61243 c!42642) b!252921))

(assert (= (and d!61243 (not c!42642)) b!252924))

(assert (= (and d!61243 res!123775) b!252927))

(assert (= (and b!252927 res!123776) b!252932))

(assert (= (and b!252927 (not res!123771)) b!252929))

(assert (= (and b!252929 res!123777) b!252931))

(assert (= (and b!252927 res!123770) b!252917))

(assert (= (and b!252917 c!42640) b!252923))

(assert (= (and b!252917 (not c!42640)) b!252933))

(assert (= (and b!252923 res!123769) b!252930))

(assert (= (or b!252923 b!252933) bm!23845))

(assert (= (and b!252917 res!123774) b!252916))

(assert (= (and b!252916 c!42643) b!252934))

(assert (= (and b!252916 (not c!42643)) b!252928))

(assert (= (and b!252934 res!123772) b!252920))

(assert (= (or b!252934 b!252928) bm!23844))

(declare-fun b_lambda!8105 () Bool)

(assert (=> (not b_lambda!8105) (not b!252931)))

(declare-fun t!8763 () Bool)

(declare-fun tb!2995 () Bool)

(assert (=> (and b!252676 (= (defaultEntry!4670 thiss!1504) (defaultEntry!4670 thiss!1504)) t!8763) tb!2995))

(declare-fun result!5323 () Bool)

(assert (=> tb!2995 (= result!5323 tp_is_empty!6517)))

(assert (=> b!252931 t!8763))

(declare-fun b_and!13673 () Bool)

(assert (= b_and!13667 (and (=> t!8763 result!5323) b_and!13673)))

(declare-fun m!268395 () Bool)

(assert (=> b!252931 m!268395))

(declare-fun m!268397 () Bool)

(assert (=> b!252931 m!268397))

(declare-fun m!268399 () Bool)

(assert (=> b!252931 m!268399))

(assert (=> b!252931 m!268399))

(assert (=> b!252931 m!268397))

(declare-fun m!268401 () Bool)

(assert (=> b!252931 m!268401))

(assert (=> b!252931 m!268395))

(declare-fun m!268403 () Bool)

(assert (=> b!252931 m!268403))

(declare-fun m!268405 () Bool)

(assert (=> b!252921 m!268405))

(declare-fun m!268407 () Bool)

(assert (=> b!252921 m!268407))

(declare-fun m!268409 () Bool)

(assert (=> b!252921 m!268409))

(declare-fun m!268411 () Bool)

(assert (=> b!252921 m!268411))

(declare-fun m!268413 () Bool)

(assert (=> b!252921 m!268413))

(declare-fun m!268415 () Bool)

(assert (=> b!252921 m!268415))

(declare-fun m!268417 () Bool)

(assert (=> b!252921 m!268417))

(declare-fun m!268419 () Bool)

(assert (=> b!252921 m!268419))

(assert (=> b!252921 m!268417))

(declare-fun m!268421 () Bool)

(assert (=> b!252921 m!268421))

(declare-fun m!268423 () Bool)

(assert (=> b!252921 m!268423))

(assert (=> b!252921 m!268407))

(declare-fun m!268425 () Bool)

(assert (=> b!252921 m!268425))

(assert (=> b!252921 m!268395))

(assert (=> b!252921 m!268413))

(declare-fun m!268427 () Bool)

(assert (=> b!252921 m!268427))

(declare-fun m!268429 () Bool)

(assert (=> b!252921 m!268429))

(declare-fun m!268431 () Bool)

(assert (=> b!252921 m!268431))

(assert (=> b!252921 m!268429))

(declare-fun m!268433 () Bool)

(assert (=> b!252921 m!268433))

(declare-fun m!268435 () Bool)

(assert (=> b!252921 m!268435))

(assert (=> b!252929 m!268395))

(assert (=> b!252929 m!268395))

(declare-fun m!268437 () Bool)

(assert (=> b!252929 m!268437))

(declare-fun m!268439 () Bool)

(assert (=> b!252930 m!268439))

(assert (=> b!252932 m!268395))

(assert (=> b!252932 m!268395))

(declare-fun m!268441 () Bool)

(assert (=> b!252932 m!268441))

(declare-fun m!268443 () Bool)

(assert (=> b!252920 m!268443))

(declare-fun m!268445 () Bool)

(assert (=> bm!23844 m!268445))

(assert (=> d!61243 m!268231))

(declare-fun m!268447 () Bool)

(assert (=> b!252918 m!268447))

(declare-fun m!268449 () Bool)

(assert (=> bm!23845 m!268449))

(declare-fun m!268451 () Bool)

(assert (=> bm!23843 m!268451))

(assert (=> b!252922 m!268395))

(assert (=> b!252922 m!268395))

(assert (=> b!252922 m!268441))

(assert (=> bm!23840 m!268435))

(assert (=> b!252681 d!61243))

(declare-fun d!61245 () Bool)

(declare-fun res!123784 () Bool)

(declare-fun e!163997 () Bool)

(assert (=> d!61245 (=> (not res!123784) (not e!163997))))

(declare-fun simpleValid!268 (LongMapFixedSize!3730) Bool)

(assert (=> d!61245 (= res!123784 (simpleValid!268 thiss!1504))))

(assert (=> d!61245 (= (valid!1462 thiss!1504) e!163997)))

(declare-fun b!252944 () Bool)

(declare-fun res!123785 () Bool)

(assert (=> b!252944 (=> (not res!123785) (not e!163997))))

(assert (=> b!252944 (= res!123785 (= (arrayCountValidKeys!0 (_keys!6819 thiss!1504) #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))) (_size!1914 thiss!1504)))))

(declare-fun b!252945 () Bool)

(declare-fun res!123786 () Bool)

(assert (=> b!252945 (=> (not res!123786) (not e!163997))))

(assert (=> b!252945 (= res!123786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6819 thiss!1504) (mask!10895 thiss!1504)))))

(declare-fun b!252946 () Bool)

(assert (=> b!252946 (= e!163997 (arrayNoDuplicates!0 (_keys!6819 thiss!1504) #b00000000000000000000000000000000 Nil!3722))))

(assert (= (and d!61245 res!123784) b!252944))

(assert (= (and b!252944 res!123785) b!252945))

(assert (= (and b!252945 res!123786) b!252946))

(declare-fun m!268453 () Bool)

(assert (=> d!61245 m!268453))

(assert (=> b!252944 m!268245))

(assert (=> b!252945 m!268223))

(assert (=> b!252946 m!268255))

(assert (=> start!24184 d!61245))

(declare-fun d!61247 () Bool)

(declare-fun res!123791 () Bool)

(declare-fun e!164002 () Bool)

(assert (=> d!61247 (=> res!123791 e!164002)))

(assert (=> d!61247 (= res!123791 (= (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61247 (= (arrayContainsKey!0 (_keys!6819 thiss!1504) key!932 #b00000000000000000000000000000000) e!164002)))

(declare-fun b!252951 () Bool)

(declare-fun e!164003 () Bool)

(assert (=> b!252951 (= e!164002 e!164003)))

(declare-fun res!123792 () Bool)

(assert (=> b!252951 (=> (not res!123792) (not e!164003))))

(assert (=> b!252951 (= res!123792 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6202 (_keys!6819 thiss!1504))))))

(declare-fun b!252952 () Bool)

(assert (=> b!252952 (= e!164003 (arrayContainsKey!0 (_keys!6819 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61247 (not res!123791)) b!252951))

(assert (= (and b!252951 res!123792) b!252952))

(assert (=> d!61247 m!268395))

(declare-fun m!268455 () Bool)

(assert (=> b!252952 m!268455))

(assert (=> bm!23805 d!61247))

(declare-fun b!252963 () Bool)

(declare-fun e!164014 () Bool)

(declare-fun call!23851 () Bool)

(assert (=> b!252963 (= e!164014 call!23851)))

(declare-fun b!252964 () Bool)

(declare-fun e!164013 () Bool)

(declare-fun e!164015 () Bool)

(assert (=> b!252964 (= e!164013 e!164015)))

(declare-fun res!123801 () Bool)

(assert (=> b!252964 (=> (not res!123801) (not e!164015))))

(declare-fun e!164012 () Bool)

(assert (=> b!252964 (= res!123801 (not e!164012))))

(declare-fun res!123800 () Bool)

(assert (=> b!252964 (=> (not res!123800) (not e!164012))))

(assert (=> b!252964 (= res!123800 (validKeyInArray!0 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61249 () Bool)

(declare-fun res!123799 () Bool)

(assert (=> d!61249 (=> res!123799 e!164013)))

(assert (=> d!61249 (= res!123799 (bvsge #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))))))

(assert (=> d!61249 (= (arrayNoDuplicates!0 (_keys!6819 thiss!1504) #b00000000000000000000000000000000 Nil!3722) e!164013)))

(declare-fun b!252965 () Bool)

(assert (=> b!252965 (= e!164014 call!23851)))

(declare-fun b!252966 () Bool)

(assert (=> b!252966 (= e!164015 e!164014)))

(declare-fun c!42646 () Bool)

(assert (=> b!252966 (= c!42646 (validKeyInArray!0 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252967 () Bool)

(declare-fun contains!1814 (List!3725 (_ BitVec 64)) Bool)

(assert (=> b!252967 (= e!164012 (contains!1814 Nil!3722 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23848 () Bool)

(assert (=> bm!23848 (= call!23851 (arrayNoDuplicates!0 (_keys!6819 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42646 (Cons!3721 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000) Nil!3722) Nil!3722)))))

(assert (= (and d!61249 (not res!123799)) b!252964))

(assert (= (and b!252964 res!123800) b!252967))

(assert (= (and b!252964 res!123801) b!252966))

(assert (= (and b!252966 c!42646) b!252963))

(assert (= (and b!252966 (not c!42646)) b!252965))

(assert (= (or b!252963 b!252965) bm!23848))

(assert (=> b!252964 m!268395))

(assert (=> b!252964 m!268395))

(assert (=> b!252964 m!268441))

(assert (=> b!252966 m!268395))

(assert (=> b!252966 m!268395))

(assert (=> b!252966 m!268441))

(assert (=> b!252967 m!268395))

(assert (=> b!252967 m!268395))

(declare-fun m!268457 () Bool)

(assert (=> b!252967 m!268457))

(assert (=> bm!23848 m!268395))

(declare-fun m!268459 () Bool)

(assert (=> bm!23848 m!268459))

(assert (=> b!252692 d!61249))

(declare-fun d!61251 () Bool)

(assert (=> d!61251 (= (inRange!0 (ite c!42591 (index!6706 lt!126559) (index!6709 lt!126559)) (mask!10895 thiss!1504)) (and (bvsge (ite c!42591 (index!6706 lt!126559) (index!6709 lt!126559)) #b00000000000000000000000000000000) (bvslt (ite c!42591 (index!6706 lt!126559) (index!6709 lt!126559)) (bvadd (mask!10895 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23806 d!61251))

(declare-fun b!252980 () Bool)

(declare-fun e!164024 () SeekEntryResult!1134)

(declare-fun lt!126716 () SeekEntryResult!1134)

(assert (=> b!252980 (= e!164024 (MissingZero!1134 (index!6708 lt!126716)))))

(declare-fun b!252981 () Bool)

(declare-fun e!164023 () SeekEntryResult!1134)

(declare-fun e!164022 () SeekEntryResult!1134)

(assert (=> b!252981 (= e!164023 e!164022)))

(declare-fun lt!126715 () (_ BitVec 64))

(assert (=> b!252981 (= lt!126715 (select (arr!5854 (_keys!6819 thiss!1504)) (index!6708 lt!126716)))))

(declare-fun c!42654 () Bool)

(assert (=> b!252981 (= c!42654 (= lt!126715 key!932))))

(declare-fun b!252982 () Bool)

(assert (=> b!252982 (= e!164022 (Found!1134 (index!6708 lt!126716)))))

(declare-fun b!252984 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12355 (_ BitVec 32)) SeekEntryResult!1134)

(assert (=> b!252984 (= e!164024 (seekKeyOrZeroReturnVacant!0 (x!24789 lt!126716) (index!6708 lt!126716) (index!6708 lt!126716) key!932 (_keys!6819 thiss!1504) (mask!10895 thiss!1504)))))

(declare-fun b!252985 () Bool)

(declare-fun c!42655 () Bool)

(assert (=> b!252985 (= c!42655 (= lt!126715 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252985 (= e!164022 e!164024)))

(declare-fun d!61253 () Bool)

(declare-fun lt!126714 () SeekEntryResult!1134)

(assert (=> d!61253 (and (or ((_ is Undefined!1134) lt!126714) (not ((_ is Found!1134) lt!126714)) (and (bvsge (index!6707 lt!126714) #b00000000000000000000000000000000) (bvslt (index!6707 lt!126714) (size!6202 (_keys!6819 thiss!1504))))) (or ((_ is Undefined!1134) lt!126714) ((_ is Found!1134) lt!126714) (not ((_ is MissingZero!1134) lt!126714)) (and (bvsge (index!6706 lt!126714) #b00000000000000000000000000000000) (bvslt (index!6706 lt!126714) (size!6202 (_keys!6819 thiss!1504))))) (or ((_ is Undefined!1134) lt!126714) ((_ is Found!1134) lt!126714) ((_ is MissingZero!1134) lt!126714) (not ((_ is MissingVacant!1134) lt!126714)) (and (bvsge (index!6709 lt!126714) #b00000000000000000000000000000000) (bvslt (index!6709 lt!126714) (size!6202 (_keys!6819 thiss!1504))))) (or ((_ is Undefined!1134) lt!126714) (ite ((_ is Found!1134) lt!126714) (= (select (arr!5854 (_keys!6819 thiss!1504)) (index!6707 lt!126714)) key!932) (ite ((_ is MissingZero!1134) lt!126714) (= (select (arr!5854 (_keys!6819 thiss!1504)) (index!6706 lt!126714)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1134) lt!126714) (= (select (arr!5854 (_keys!6819 thiss!1504)) (index!6709 lt!126714)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61253 (= lt!126714 e!164023)))

(declare-fun c!42653 () Bool)

(assert (=> d!61253 (= c!42653 (and ((_ is Intermediate!1134) lt!126716) (undefined!1946 lt!126716)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12355 (_ BitVec 32)) SeekEntryResult!1134)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61253 (= lt!126716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10895 thiss!1504)) key!932 (_keys!6819 thiss!1504) (mask!10895 thiss!1504)))))

(assert (=> d!61253 (validMask!0 (mask!10895 thiss!1504))))

(assert (=> d!61253 (= (seekEntryOrOpen!0 key!932 (_keys!6819 thiss!1504) (mask!10895 thiss!1504)) lt!126714)))

(declare-fun b!252983 () Bool)

(assert (=> b!252983 (= e!164023 Undefined!1134)))

(assert (= (and d!61253 c!42653) b!252983))

(assert (= (and d!61253 (not c!42653)) b!252981))

(assert (= (and b!252981 c!42654) b!252982))

(assert (= (and b!252981 (not c!42654)) b!252985))

(assert (= (and b!252985 c!42655) b!252980))

(assert (= (and b!252985 (not c!42655)) b!252984))

(declare-fun m!268461 () Bool)

(assert (=> b!252981 m!268461))

(declare-fun m!268463 () Bool)

(assert (=> b!252984 m!268463))

(declare-fun m!268465 () Bool)

(assert (=> d!61253 m!268465))

(declare-fun m!268467 () Bool)

(assert (=> d!61253 m!268467))

(declare-fun m!268469 () Bool)

(assert (=> d!61253 m!268469))

(declare-fun m!268471 () Bool)

(assert (=> d!61253 m!268471))

(assert (=> d!61253 m!268471))

(declare-fun m!268473 () Bool)

(assert (=> d!61253 m!268473))

(assert (=> d!61253 m!268231))

(assert (=> b!252691 d!61253))

(declare-fun b!252994 () Bool)

(declare-fun e!164032 () Bool)

(declare-fun e!164031 () Bool)

(assert (=> b!252994 (= e!164032 e!164031)))

(declare-fun c!42658 () Bool)

(assert (=> b!252994 (= c!42658 (validKeyInArray!0 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252995 () Bool)

(declare-fun e!164033 () Bool)

(declare-fun call!23854 () Bool)

(assert (=> b!252995 (= e!164033 call!23854)))

(declare-fun bm!23851 () Bool)

(assert (=> bm!23851 (= call!23854 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6819 thiss!1504) (mask!10895 thiss!1504)))))

(declare-fun b!252996 () Bool)

(assert (=> b!252996 (= e!164031 call!23854)))

(declare-fun d!61255 () Bool)

(declare-fun res!123807 () Bool)

(assert (=> d!61255 (=> res!123807 e!164032)))

(assert (=> d!61255 (= res!123807 (bvsge #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))))))

(assert (=> d!61255 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6819 thiss!1504) (mask!10895 thiss!1504)) e!164032)))

(declare-fun b!252997 () Bool)

(assert (=> b!252997 (= e!164031 e!164033)))

(declare-fun lt!126724 () (_ BitVec 64))

(assert (=> b!252997 (= lt!126724 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126723 () Unit!7801)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12355 (_ BitVec 64) (_ BitVec 32)) Unit!7801)

(assert (=> b!252997 (= lt!126723 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6819 thiss!1504) lt!126724 #b00000000000000000000000000000000))))

(assert (=> b!252997 (arrayContainsKey!0 (_keys!6819 thiss!1504) lt!126724 #b00000000000000000000000000000000)))

(declare-fun lt!126725 () Unit!7801)

(assert (=> b!252997 (= lt!126725 lt!126723)))

(declare-fun res!123806 () Bool)

(assert (=> b!252997 (= res!123806 (= (seekEntryOrOpen!0 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000) (_keys!6819 thiss!1504) (mask!10895 thiss!1504)) (Found!1134 #b00000000000000000000000000000000)))))

(assert (=> b!252997 (=> (not res!123806) (not e!164033))))

(assert (= (and d!61255 (not res!123807)) b!252994))

(assert (= (and b!252994 c!42658) b!252997))

(assert (= (and b!252994 (not c!42658)) b!252996))

(assert (= (and b!252997 res!123806) b!252995))

(assert (= (or b!252995 b!252996) bm!23851))

(assert (=> b!252994 m!268395))

(assert (=> b!252994 m!268395))

(assert (=> b!252994 m!268441))

(declare-fun m!268475 () Bool)

(assert (=> bm!23851 m!268475))

(assert (=> b!252997 m!268395))

(declare-fun m!268477 () Bool)

(assert (=> b!252997 m!268477))

(declare-fun m!268479 () Bool)

(assert (=> b!252997 m!268479))

(assert (=> b!252997 m!268395))

(declare-fun m!268481 () Bool)

(assert (=> b!252997 m!268481))

(assert (=> b!252689 d!61255))

(declare-fun d!61257 () Bool)

(assert (=> d!61257 (= (array_inv!3865 (_keys!6819 thiss!1504)) (bvsge (size!6202 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252676 d!61257))

(declare-fun d!61259 () Bool)

(assert (=> d!61259 (= (array_inv!3866 (_values!4653 thiss!1504)) (bvsge (size!6201 (_values!4653 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252676 d!61259))

(declare-fun bm!23854 () Bool)

(declare-fun call!23857 () (_ BitVec 32))

(assert (=> bm!23854 (= call!23857 (arrayCountValidKeys!0 (_keys!6819 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6202 (_keys!6819 thiss!1504))))))

(declare-fun b!253006 () Bool)

(declare-fun e!164039 () (_ BitVec 32))

(declare-fun e!164038 () (_ BitVec 32))

(assert (=> b!253006 (= e!164039 e!164038)))

(declare-fun c!42663 () Bool)

(assert (=> b!253006 (= c!42663 (validKeyInArray!0 (select (arr!5854 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253007 () Bool)

(assert (=> b!253007 (= e!164038 (bvadd #b00000000000000000000000000000001 call!23857))))

(declare-fun d!61261 () Bool)

(declare-fun lt!126728 () (_ BitVec 32))

(assert (=> d!61261 (and (bvsge lt!126728 #b00000000000000000000000000000000) (bvsle lt!126728 (bvsub (size!6202 (_keys!6819 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61261 (= lt!126728 e!164039)))

(declare-fun c!42664 () Bool)

(assert (=> d!61261 (= c!42664 (bvsge #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))))))

(assert (=> d!61261 (and (bvsle #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6202 (_keys!6819 thiss!1504)) (size!6202 (_keys!6819 thiss!1504))))))

(assert (=> d!61261 (= (arrayCountValidKeys!0 (_keys!6819 thiss!1504) #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))) lt!126728)))

(declare-fun b!253008 () Bool)

(assert (=> b!253008 (= e!164038 call!23857)))

(declare-fun b!253009 () Bool)

(assert (=> b!253009 (= e!164039 #b00000000000000000000000000000000)))

(assert (= (and d!61261 c!42664) b!253009))

(assert (= (and d!61261 (not c!42664)) b!253006))

(assert (= (and b!253006 c!42663) b!253007))

(assert (= (and b!253006 (not c!42663)) b!253008))

(assert (= (or b!253007 b!253008) bm!23854))

(declare-fun m!268483 () Bool)

(assert (=> bm!23854 m!268483))

(assert (=> b!253006 m!268395))

(assert (=> b!253006 m!268395))

(assert (=> b!253006 m!268441))

(assert (=> b!252695 d!61261))

(declare-fun d!61263 () Bool)

(assert (=> d!61263 (= (validMask!0 (mask!10895 thiss!1504)) (and (or (= (mask!10895 thiss!1504) #b00000000000000000000000000000111) (= (mask!10895 thiss!1504) #b00000000000000000000000000001111) (= (mask!10895 thiss!1504) #b00000000000000000000000000011111) (= (mask!10895 thiss!1504) #b00000000000000000000000000111111) (= (mask!10895 thiss!1504) #b00000000000000000000000001111111) (= (mask!10895 thiss!1504) #b00000000000000000000000011111111) (= (mask!10895 thiss!1504) #b00000000000000000000000111111111) (= (mask!10895 thiss!1504) #b00000000000000000000001111111111) (= (mask!10895 thiss!1504) #b00000000000000000000011111111111) (= (mask!10895 thiss!1504) #b00000000000000000000111111111111) (= (mask!10895 thiss!1504) #b00000000000000000001111111111111) (= (mask!10895 thiss!1504) #b00000000000000000011111111111111) (= (mask!10895 thiss!1504) #b00000000000000000111111111111111) (= (mask!10895 thiss!1504) #b00000000000000001111111111111111) (= (mask!10895 thiss!1504) #b00000000000000011111111111111111) (= (mask!10895 thiss!1504) #b00000000000000111111111111111111) (= (mask!10895 thiss!1504) #b00000000000001111111111111111111) (= (mask!10895 thiss!1504) #b00000000000011111111111111111111) (= (mask!10895 thiss!1504) #b00000000000111111111111111111111) (= (mask!10895 thiss!1504) #b00000000001111111111111111111111) (= (mask!10895 thiss!1504) #b00000000011111111111111111111111) (= (mask!10895 thiss!1504) #b00000000111111111111111111111111) (= (mask!10895 thiss!1504) #b00000001111111111111111111111111) (= (mask!10895 thiss!1504) #b00000011111111111111111111111111) (= (mask!10895 thiss!1504) #b00000111111111111111111111111111) (= (mask!10895 thiss!1504) #b00001111111111111111111111111111) (= (mask!10895 thiss!1504) #b00011111111111111111111111111111) (= (mask!10895 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10895 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!252695 d!61263))

(declare-fun b!253010 () Bool)

(declare-fun e!164041 () Bool)

(declare-fun e!164040 () Bool)

(assert (=> b!253010 (= e!164041 e!164040)))

(declare-fun c!42665 () Bool)

(assert (=> b!253010 (= c!42665 (validKeyInArray!0 (select (arr!5854 lt!126552) #b00000000000000000000000000000000)))))

(declare-fun b!253011 () Bool)

(declare-fun e!164042 () Bool)

(declare-fun call!23858 () Bool)

(assert (=> b!253011 (= e!164042 call!23858)))

(declare-fun bm!23855 () Bool)

(assert (=> bm!23855 (= call!23858 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126552 (mask!10895 thiss!1504)))))

(declare-fun b!253012 () Bool)

(assert (=> b!253012 (= e!164040 call!23858)))

(declare-fun d!61265 () Bool)

(declare-fun res!123809 () Bool)

(assert (=> d!61265 (=> res!123809 e!164041)))

(assert (=> d!61265 (= res!123809 (bvsge #b00000000000000000000000000000000 (size!6202 lt!126552)))))

(assert (=> d!61265 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126552 (mask!10895 thiss!1504)) e!164041)))

(declare-fun b!253013 () Bool)

(assert (=> b!253013 (= e!164040 e!164042)))

(declare-fun lt!126730 () (_ BitVec 64))

(assert (=> b!253013 (= lt!126730 (select (arr!5854 lt!126552) #b00000000000000000000000000000000))))

(declare-fun lt!126729 () Unit!7801)

(assert (=> b!253013 (= lt!126729 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126552 lt!126730 #b00000000000000000000000000000000))))

(assert (=> b!253013 (arrayContainsKey!0 lt!126552 lt!126730 #b00000000000000000000000000000000)))

(declare-fun lt!126731 () Unit!7801)

(assert (=> b!253013 (= lt!126731 lt!126729)))

(declare-fun res!123808 () Bool)

(assert (=> b!253013 (= res!123808 (= (seekEntryOrOpen!0 (select (arr!5854 lt!126552) #b00000000000000000000000000000000) lt!126552 (mask!10895 thiss!1504)) (Found!1134 #b00000000000000000000000000000000)))))

(assert (=> b!253013 (=> (not res!123808) (not e!164042))))

(assert (= (and d!61265 (not res!123809)) b!253010))

(assert (= (and b!253010 c!42665) b!253013))

(assert (= (and b!253010 (not c!42665)) b!253012))

(assert (= (and b!253013 res!123808) b!253011))

(assert (= (or b!253011 b!253012) bm!23855))

(declare-fun m!268485 () Bool)

(assert (=> b!253010 m!268485))

(assert (=> b!253010 m!268485))

(declare-fun m!268487 () Bool)

(assert (=> b!253010 m!268487))

(declare-fun m!268489 () Bool)

(assert (=> bm!23855 m!268489))

(assert (=> b!253013 m!268485))

(declare-fun m!268491 () Bool)

(assert (=> b!253013 m!268491))

(declare-fun m!268493 () Bool)

(assert (=> b!253013 m!268493))

(assert (=> b!253013 m!268485))

(declare-fun m!268495 () Bool)

(assert (=> b!253013 m!268495))

(assert (=> b!252695 d!61265))

(declare-fun bm!23856 () Bool)

(declare-fun call!23859 () (_ BitVec 32))

(assert (=> bm!23856 (= call!23859 (arrayCountValidKeys!0 lt!126552 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6202 (_keys!6819 thiss!1504))))))

(declare-fun b!253014 () Bool)

(declare-fun e!164044 () (_ BitVec 32))

(declare-fun e!164043 () (_ BitVec 32))

(assert (=> b!253014 (= e!164044 e!164043)))

(declare-fun c!42666 () Bool)

(assert (=> b!253014 (= c!42666 (validKeyInArray!0 (select (arr!5854 lt!126552) #b00000000000000000000000000000000)))))

(declare-fun b!253015 () Bool)

(assert (=> b!253015 (= e!164043 (bvadd #b00000000000000000000000000000001 call!23859))))

(declare-fun d!61267 () Bool)

(declare-fun lt!126732 () (_ BitVec 32))

(assert (=> d!61267 (and (bvsge lt!126732 #b00000000000000000000000000000000) (bvsle lt!126732 (bvsub (size!6202 lt!126552) #b00000000000000000000000000000000)))))

(assert (=> d!61267 (= lt!126732 e!164044)))

(declare-fun c!42667 () Bool)

(assert (=> d!61267 (= c!42667 (bvsge #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))))))

(assert (=> d!61267 (and (bvsle #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6202 (_keys!6819 thiss!1504)) (size!6202 lt!126552)))))

(assert (=> d!61267 (= (arrayCountValidKeys!0 lt!126552 #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))) lt!126732)))

(declare-fun b!253016 () Bool)

(assert (=> b!253016 (= e!164043 call!23859)))

(declare-fun b!253017 () Bool)

(assert (=> b!253017 (= e!164044 #b00000000000000000000000000000000)))

(assert (= (and d!61267 c!42667) b!253017))

(assert (= (and d!61267 (not c!42667)) b!253014))

(assert (= (and b!253014 c!42666) b!253015))

(assert (= (and b!253014 (not c!42666)) b!253016))

(assert (= (or b!253015 b!253016) bm!23856))

(declare-fun m!268497 () Bool)

(assert (=> bm!23856 m!268497))

(assert (=> b!253014 m!268485))

(assert (=> b!253014 m!268485))

(assert (=> b!253014 m!268487))

(assert (=> b!252695 d!61267))

(declare-fun d!61269 () Bool)

(declare-fun e!164047 () Bool)

(assert (=> d!61269 e!164047))

(declare-fun res!123812 () Bool)

(assert (=> d!61269 (=> (not res!123812) (not e!164047))))

(assert (=> d!61269 (= res!123812 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6202 (_keys!6819 thiss!1504)))))))

(declare-fun lt!126735 () Unit!7801)

(declare-fun choose!41 (array!12355 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3725) Unit!7801)

(assert (=> d!61269 (= lt!126735 (choose!41 (_keys!6819 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3722))))

(assert (=> d!61269 (bvslt (size!6202 (_keys!6819 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61269 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6819 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3722) lt!126735)))

(declare-fun b!253020 () Bool)

(assert (=> b!253020 (= e!164047 (arrayNoDuplicates!0 (array!12356 (store (arr!5854 (_keys!6819 thiss!1504)) index!297 key!932) (size!6202 (_keys!6819 thiss!1504))) #b00000000000000000000000000000000 Nil!3722))))

(assert (= (and d!61269 res!123812) b!253020))

(declare-fun m!268499 () Bool)

(assert (=> d!61269 m!268499))

(assert (=> b!253020 m!268243))

(declare-fun m!268501 () Bool)

(assert (=> b!253020 m!268501))

(assert (=> b!252695 d!61269))

(declare-fun b!253029 () Bool)

(declare-fun res!123823 () Bool)

(declare-fun e!164053 () Bool)

(assert (=> b!253029 (=> (not res!123823) (not e!164053))))

(assert (=> b!253029 (= res!123823 (not (validKeyInArray!0 (select (arr!5854 (_keys!6819 thiss!1504)) index!297))))))

(declare-fun e!164052 () Bool)

(declare-fun b!253032 () Bool)

(assert (=> b!253032 (= e!164052 (= (arrayCountValidKeys!0 (array!12356 (store (arr!5854 (_keys!6819 thiss!1504)) index!297 key!932) (size!6202 (_keys!6819 thiss!1504))) #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6819 thiss!1504) #b00000000000000000000000000000000 (size!6202 (_keys!6819 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!253030 () Bool)

(declare-fun res!123824 () Bool)

(assert (=> b!253030 (=> (not res!123824) (not e!164053))))

(assert (=> b!253030 (= res!123824 (validKeyInArray!0 key!932))))

(declare-fun d!61271 () Bool)

(assert (=> d!61271 e!164052))

(declare-fun res!123821 () Bool)

(assert (=> d!61271 (=> (not res!123821) (not e!164052))))

(assert (=> d!61271 (= res!123821 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6202 (_keys!6819 thiss!1504)))))))

(declare-fun lt!126738 () Unit!7801)

(declare-fun choose!1 (array!12355 (_ BitVec 32) (_ BitVec 64)) Unit!7801)

(assert (=> d!61271 (= lt!126738 (choose!1 (_keys!6819 thiss!1504) index!297 key!932))))

(assert (=> d!61271 e!164053))

(declare-fun res!123822 () Bool)

(assert (=> d!61271 (=> (not res!123822) (not e!164053))))

(assert (=> d!61271 (= res!123822 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6202 (_keys!6819 thiss!1504)))))))

(assert (=> d!61271 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6819 thiss!1504) index!297 key!932) lt!126738)))

(declare-fun b!253031 () Bool)

(assert (=> b!253031 (= e!164053 (bvslt (size!6202 (_keys!6819 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!61271 res!123822) b!253029))

(assert (= (and b!253029 res!123823) b!253030))

(assert (= (and b!253030 res!123824) b!253031))

(assert (= (and d!61271 res!123821) b!253032))

(declare-fun m!268503 () Bool)

(assert (=> b!253029 m!268503))

(assert (=> b!253029 m!268503))

(declare-fun m!268505 () Bool)

(assert (=> b!253029 m!268505))

(assert (=> b!253032 m!268243))

(declare-fun m!268507 () Bool)

(assert (=> b!253032 m!268507))

(assert (=> b!253032 m!268245))

(declare-fun m!268509 () Bool)

(assert (=> b!253030 m!268509))

(declare-fun m!268511 () Bool)

(assert (=> d!61271 m!268511))

(assert (=> b!252695 d!61271))

(declare-fun b!253033 () Bool)

(declare-fun e!164056 () Bool)

(declare-fun call!23860 () Bool)

(assert (=> b!253033 (= e!164056 call!23860)))

(declare-fun b!253034 () Bool)

(declare-fun e!164055 () Bool)

(declare-fun e!164057 () Bool)

(assert (=> b!253034 (= e!164055 e!164057)))

(declare-fun res!123827 () Bool)

(assert (=> b!253034 (=> (not res!123827) (not e!164057))))

(declare-fun e!164054 () Bool)

(assert (=> b!253034 (= res!123827 (not e!164054))))

(declare-fun res!123826 () Bool)

(assert (=> b!253034 (=> (not res!123826) (not e!164054))))

(assert (=> b!253034 (= res!123826 (validKeyInArray!0 (select (arr!5854 lt!126552) #b00000000000000000000000000000000)))))

(declare-fun d!61273 () Bool)

(declare-fun res!123825 () Bool)

(assert (=> d!61273 (=> res!123825 e!164055)))

(assert (=> d!61273 (= res!123825 (bvsge #b00000000000000000000000000000000 (size!6202 lt!126552)))))

(assert (=> d!61273 (= (arrayNoDuplicates!0 lt!126552 #b00000000000000000000000000000000 Nil!3722) e!164055)))

(declare-fun b!253035 () Bool)

(assert (=> b!253035 (= e!164056 call!23860)))

(declare-fun b!253036 () Bool)

(assert (=> b!253036 (= e!164057 e!164056)))

(declare-fun c!42668 () Bool)

(assert (=> b!253036 (= c!42668 (validKeyInArray!0 (select (arr!5854 lt!126552) #b00000000000000000000000000000000)))))

(declare-fun b!253037 () Bool)

(assert (=> b!253037 (= e!164054 (contains!1814 Nil!3722 (select (arr!5854 lt!126552) #b00000000000000000000000000000000)))))

(declare-fun bm!23857 () Bool)

(assert (=> bm!23857 (= call!23860 (arrayNoDuplicates!0 lt!126552 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42668 (Cons!3721 (select (arr!5854 lt!126552) #b00000000000000000000000000000000) Nil!3722) Nil!3722)))))

(assert (= (and d!61273 (not res!123825)) b!253034))

(assert (= (and b!253034 res!123826) b!253037))

(assert (= (and b!253034 res!123827) b!253036))

(assert (= (and b!253036 c!42668) b!253033))

(assert (= (and b!253036 (not c!42668)) b!253035))

(assert (= (or b!253033 b!253035) bm!23857))

(assert (=> b!253034 m!268485))

(assert (=> b!253034 m!268485))

(assert (=> b!253034 m!268487))

(assert (=> b!253036 m!268485))

(assert (=> b!253036 m!268485))

(assert (=> b!253036 m!268487))

(assert (=> b!253037 m!268485))

(assert (=> b!253037 m!268485))

(declare-fun m!268513 () Bool)

(assert (=> b!253037 m!268513))

(assert (=> bm!23857 m!268485))

(declare-fun m!268515 () Bool)

(assert (=> bm!23857 m!268515))

(assert (=> b!252695 d!61273))

(assert (=> b!252695 d!61247))

(declare-fun d!61275 () Bool)

(declare-fun e!164060 () Bool)

(assert (=> d!61275 e!164060))

(declare-fun res!123830 () Bool)

(assert (=> d!61275 (=> (not res!123830) (not e!164060))))

(assert (=> d!61275 (= res!123830 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6202 (_keys!6819 thiss!1504)))))))

(declare-fun lt!126741 () Unit!7801)

(declare-fun choose!102 ((_ BitVec 64) array!12355 (_ BitVec 32) (_ BitVec 32)) Unit!7801)

(assert (=> d!61275 (= lt!126741 (choose!102 key!932 (_keys!6819 thiss!1504) index!297 (mask!10895 thiss!1504)))))

(assert (=> d!61275 (validMask!0 (mask!10895 thiss!1504))))

(assert (=> d!61275 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6819 thiss!1504) index!297 (mask!10895 thiss!1504)) lt!126741)))

(declare-fun b!253040 () Bool)

(assert (=> b!253040 (= e!164060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12356 (store (arr!5854 (_keys!6819 thiss!1504)) index!297 key!932) (size!6202 (_keys!6819 thiss!1504))) (mask!10895 thiss!1504)))))

(assert (= (and d!61275 res!123830) b!253040))

(declare-fun m!268517 () Bool)

(assert (=> d!61275 m!268517))

(assert (=> d!61275 m!268231))

(assert (=> b!253040 m!268243))

(declare-fun m!268519 () Bool)

(assert (=> b!253040 m!268519))

(assert (=> b!252695 d!61275))

(declare-fun d!61277 () Bool)

(declare-fun e!164063 () Bool)

(assert (=> d!61277 e!164063))

(declare-fun res!123836 () Bool)

(assert (=> d!61277 (=> (not res!123836) (not e!164063))))

(declare-fun lt!126747 () SeekEntryResult!1134)

(assert (=> d!61277 (= res!123836 ((_ is Found!1134) lt!126747))))

(assert (=> d!61277 (= lt!126747 (seekEntryOrOpen!0 key!932 (_keys!6819 thiss!1504) (mask!10895 thiss!1504)))))

(declare-fun lt!126746 () Unit!7801)

(declare-fun choose!1215 (array!12355 array!12353 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) Int) Unit!7801)

(assert (=> d!61277 (= lt!126746 (choose!1215 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)))))

(assert (=> d!61277 (validMask!0 (mask!10895 thiss!1504))))

(assert (=> d!61277 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!408 (_keys!6819 thiss!1504) (_values!4653 thiss!1504) (mask!10895 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)) lt!126746)))

(declare-fun b!253045 () Bool)

(declare-fun res!123835 () Bool)

(assert (=> b!253045 (=> (not res!123835) (not e!164063))))

(assert (=> b!253045 (= res!123835 (inRange!0 (index!6707 lt!126747) (mask!10895 thiss!1504)))))

(declare-fun b!253046 () Bool)

(assert (=> b!253046 (= e!164063 (= (select (arr!5854 (_keys!6819 thiss!1504)) (index!6707 lt!126747)) key!932))))

(assert (=> b!253046 (and (bvsge (index!6707 lt!126747) #b00000000000000000000000000000000) (bvslt (index!6707 lt!126747) (size!6202 (_keys!6819 thiss!1504))))))

(assert (= (and d!61277 res!123836) b!253045))

(assert (= (and b!253045 res!123835) b!253046))

(assert (=> d!61277 m!268271))

(declare-fun m!268521 () Bool)

(assert (=> d!61277 m!268521))

(assert (=> d!61277 m!268231))

(declare-fun m!268523 () Bool)

(assert (=> b!253045 m!268523))

(declare-fun m!268525 () Bool)

(assert (=> b!253046 m!268525))

(assert (=> b!252677 d!61277))

(declare-fun b!253053 () Bool)

(declare-fun e!164068 () Bool)

(assert (=> b!253053 (= e!164068 tp_is_empty!6517)))

(declare-fun condMapEmpty!11094 () Bool)

(declare-fun mapDefault!11094 () ValueCell!2915)

(assert (=> mapNonEmpty!11085 (= condMapEmpty!11094 (= mapRest!11085 ((as const (Array (_ BitVec 32) ValueCell!2915)) mapDefault!11094)))))

(declare-fun e!164069 () Bool)

(declare-fun mapRes!11094 () Bool)

(assert (=> mapNonEmpty!11085 (= tp!23246 (and e!164069 mapRes!11094))))

(declare-fun mapIsEmpty!11094 () Bool)

(assert (=> mapIsEmpty!11094 mapRes!11094))

(declare-fun mapNonEmpty!11094 () Bool)

(declare-fun tp!23262 () Bool)

(assert (=> mapNonEmpty!11094 (= mapRes!11094 (and tp!23262 e!164068))))

(declare-fun mapValue!11094 () ValueCell!2915)

(declare-fun mapKey!11094 () (_ BitVec 32))

(declare-fun mapRest!11094 () (Array (_ BitVec 32) ValueCell!2915))

(assert (=> mapNonEmpty!11094 (= mapRest!11085 (store mapRest!11094 mapKey!11094 mapValue!11094))))

(declare-fun b!253054 () Bool)

(assert (=> b!253054 (= e!164069 tp_is_empty!6517)))

(assert (= (and mapNonEmpty!11085 condMapEmpty!11094) mapIsEmpty!11094))

(assert (= (and mapNonEmpty!11085 (not condMapEmpty!11094)) mapNonEmpty!11094))

(assert (= (and mapNonEmpty!11094 ((_ is ValueCellFull!2915) mapValue!11094)) b!253053))

(assert (= (and mapNonEmpty!11085 ((_ is ValueCellFull!2915) mapDefault!11094)) b!253054))

(declare-fun m!268527 () Bool)

(assert (=> mapNonEmpty!11094 m!268527))

(declare-fun b_lambda!8107 () Bool)

(assert (= b_lambda!8105 (or (and b!252676 b_free!6655) b_lambda!8107)))

(check-sat (not b!252920) (not b!253030) (not d!61253) (not bm!23856) (not b!252946) (not bm!23823) (not d!61237) tp_is_empty!6517 (not b!253034) (not bm!23824) (not b!252872) (not b!253036) (not d!61277) (not bm!23851) (not b!252964) (not bm!23845) (not b!253037) (not bm!23855) (not d!61269) (not b!252952) (not b!252997) (not b!252944) (not b!253020) (not b!253032) (not b!252932) (not bm!23840) (not b!253045) (not b_lambda!8107) b_and!13673 (not b!252921) (not b!253006) (not b!253013) (not b!252918) (not b!253010) (not b!252870) (not bm!23857) (not b!252922) (not b!252930) (not bm!23844) (not d!61271) (not bm!23848) (not d!61235) (not b!252931) (not b!253029) (not d!61245) (not b_next!6655) (not mapNonEmpty!11094) (not bm!23854) (not bm!23843) (not b!252966) (not d!61241) (not d!61275) (not b!253040) (not b!252967) (not b!252929) (not b!252994) (not b!253014) (not d!61243) (not b!252945) (not b!252984))
(check-sat b_and!13673 (not b_next!6655))
