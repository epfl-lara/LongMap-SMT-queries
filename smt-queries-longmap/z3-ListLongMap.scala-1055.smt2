; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22016 () Bool)

(assert start!22016)

(declare-fun b!226679 () Bool)

(declare-fun b_free!6079 () Bool)

(declare-fun b_next!6079 () Bool)

(assert (=> b!226679 (= b_free!6079 (not b_next!6079))))

(declare-fun tp!21379 () Bool)

(declare-fun b_and!12991 () Bool)

(assert (=> b!226679 (= tp!21379 b_and!12991)))

(declare-fun b!226674 () Bool)

(declare-datatypes ((Unit!6833 0))(
  ( (Unit!6834) )
))
(declare-fun e!147061 () Unit!6833)

(declare-fun Unit!6835 () Unit!6833)

(assert (=> b!226674 (= e!147061 Unit!6835)))

(declare-fun lt!114135 () Unit!6833)

(declare-datatypes ((V!7569 0))(
  ( (V!7570 (val!3015 Int)) )
))
(declare-datatypes ((ValueCell!2627 0))(
  ( (ValueCellFull!2627 (v!5036 V!7569)) (EmptyCell!2627) )
))
(declare-datatypes ((array!11123 0))(
  ( (array!11124 (arr!5281 (Array (_ BitVec 32) ValueCell!2627)) (size!5614 (_ BitVec 32))) )
))
(declare-datatypes ((array!11125 0))(
  ( (array!11126 (arr!5282 (Array (_ BitVec 32) (_ BitVec 64))) (size!5615 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3154 0))(
  ( (LongMapFixedSize!3155 (defaultEntry!4236 Int) (mask!10090 (_ BitVec 32)) (extraKeys!3973 (_ BitVec 32)) (zeroValue!4077 V!7569) (minValue!4077 V!7569) (_size!1626 (_ BitVec 32)) (_keys!6290 array!11125) (_values!4219 array!11123) (_vacant!1626 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3154)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!96 (array!11125 array!11123 (_ BitVec 32) (_ BitVec 32) V!7569 V!7569 (_ BitVec 64) (_ BitVec 32) Int) Unit!6833)

(assert (=> b!226674 (= lt!114135 (lemmaArrayContainsKeyThenInListMap!96 (_keys!6290 thiss!1504) (_values!4219 thiss!1504) (mask!10090 thiss!1504) (extraKeys!3973 thiss!1504) (zeroValue!4077 thiss!1504) (minValue!4077 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4236 thiss!1504)))))

(assert (=> b!226674 false))

(declare-fun b!226675 () Bool)

(declare-fun e!147059 () Unit!6833)

(declare-fun Unit!6836 () Unit!6833)

(assert (=> b!226675 (= e!147059 Unit!6836)))

(declare-fun lt!114136 () Unit!6833)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!258 (array!11125 array!11123 (_ BitVec 32) (_ BitVec 32) V!7569 V!7569 (_ BitVec 64) Int) Unit!6833)

(assert (=> b!226675 (= lt!114136 (lemmaInListMapThenSeekEntryOrOpenFindsIt!258 (_keys!6290 thiss!1504) (_values!4219 thiss!1504) (mask!10090 thiss!1504) (extraKeys!3973 thiss!1504) (zeroValue!4077 thiss!1504) (minValue!4077 thiss!1504) key!932 (defaultEntry!4236 thiss!1504)))))

(assert (=> b!226675 false))

(declare-datatypes ((SeekEntryResult!855 0))(
  ( (MissingZero!855 (index!5590 (_ BitVec 32))) (Found!855 (index!5591 (_ BitVec 32))) (Intermediate!855 (undefined!1667 Bool) (index!5592 (_ BitVec 32)) (x!23211 (_ BitVec 32))) (Undefined!855) (MissingVacant!855 (index!5593 (_ BitVec 32))) )
))
(declare-fun lt!114132 () SeekEntryResult!855)

(declare-fun bm!21056 () Bool)

(declare-fun c!37583 () Bool)

(declare-fun call!21060 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21056 (= call!21060 (inRange!0 (ite c!37583 (index!5590 lt!114132) (index!5593 lt!114132)) (mask!10090 thiss!1504)))))

(declare-fun b!226676 () Bool)

(declare-fun res!111592 () Bool)

(declare-fun e!147067 () Bool)

(assert (=> b!226676 (=> (not res!111592) (not e!147067))))

(assert (=> b!226676 (= res!111592 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226677 () Bool)

(declare-fun e!147062 () Bool)

(declare-fun tp_is_empty!5941 () Bool)

(assert (=> b!226677 (= e!147062 tp_is_empty!5941)))

(declare-fun b!226678 () Bool)

(declare-fun res!111591 () Bool)

(declare-fun e!147058 () Bool)

(assert (=> b!226678 (=> res!111591 e!147058)))

(declare-fun lt!114129 () Bool)

(assert (=> b!226678 (= res!111591 lt!114129)))

(declare-fun e!147055 () Bool)

(declare-fun e!147060 () Bool)

(declare-fun array_inv!3465 (array!11125) Bool)

(declare-fun array_inv!3466 (array!11123) Bool)

(assert (=> b!226679 (= e!147060 (and tp!21379 tp_is_empty!5941 (array_inv!3465 (_keys!6290 thiss!1504)) (array_inv!3466 (_values!4219 thiss!1504)) e!147055))))

(declare-fun bm!21057 () Bool)

(declare-fun call!21059 () Bool)

(declare-fun arrayContainsKey!0 (array!11125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21057 (= call!21059 (arrayContainsKey!0 (_keys!6290 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226680 () Bool)

(declare-fun res!111590 () Bool)

(declare-fun e!147066 () Bool)

(assert (=> b!226680 (=> (not res!111590) (not e!147066))))

(assert (=> b!226680 (= res!111590 call!21060)))

(declare-fun e!147068 () Bool)

(assert (=> b!226680 (= e!147068 e!147066)))

(declare-fun b!226681 () Bool)

(declare-fun e!147064 () Bool)

(assert (=> b!226681 (= e!147064 (not call!21059))))

(declare-fun mapNonEmpty!10081 () Bool)

(declare-fun mapRes!10081 () Bool)

(declare-fun tp!21378 () Bool)

(declare-fun e!147065 () Bool)

(assert (=> mapNonEmpty!10081 (= mapRes!10081 (and tp!21378 e!147065))))

(declare-fun mapValue!10081 () ValueCell!2627)

(declare-fun mapRest!10081 () (Array (_ BitVec 32) ValueCell!2627))

(declare-fun mapKey!10081 () (_ BitVec 32))

(assert (=> mapNonEmpty!10081 (= (arr!5281 (_values!4219 thiss!1504)) (store mapRest!10081 mapKey!10081 mapValue!10081))))

(declare-fun b!226682 () Bool)

(assert (=> b!226682 (= e!147058 true)))

(declare-fun lt!114134 () Bool)

(declare-datatypes ((List!3290 0))(
  ( (Nil!3287) (Cons!3286 (h!3934 (_ BitVec 64)) (t!8241 List!3290)) )
))
(declare-fun arrayNoDuplicates!0 (array!11125 (_ BitVec 32) List!3290) Bool)

(assert (=> b!226682 (= lt!114134 (arrayNoDuplicates!0 (_keys!6290 thiss!1504) #b00000000000000000000000000000000 Nil!3287))))

(declare-fun b!226683 () Bool)

(declare-fun res!111587 () Bool)

(assert (=> b!226683 (=> res!111587 e!147058)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11125 (_ BitVec 32)) Bool)

(assert (=> b!226683 (= res!111587 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6290 thiss!1504) (mask!10090 thiss!1504))))))

(declare-fun b!226684 () Bool)

(declare-fun e!147057 () Bool)

(assert (=> b!226684 (= e!147057 (not e!147058))))

(declare-fun res!111589 () Bool)

(assert (=> b!226684 (=> res!111589 e!147058)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226684 (= res!111589 (not (validMask!0 (mask!10090 thiss!1504))))))

(declare-fun lt!114126 () array!11125)

(declare-fun arrayCountValidKeys!0 (array!11125 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226684 (= (arrayCountValidKeys!0 lt!114126 #b00000000000000000000000000000000 (size!5615 (_keys!6290 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6290 thiss!1504) #b00000000000000000000000000000000 (size!5615 (_keys!6290 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!114130 () Unit!6833)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11125 (_ BitVec 32) (_ BitVec 64)) Unit!6833)

(assert (=> b!226684 (= lt!114130 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6290 thiss!1504) index!297 key!932))))

(assert (=> b!226684 (arrayNoDuplicates!0 lt!114126 #b00000000000000000000000000000000 Nil!3287)))

(assert (=> b!226684 (= lt!114126 (array!11126 (store (arr!5282 (_keys!6290 thiss!1504)) index!297 key!932) (size!5615 (_keys!6290 thiss!1504))))))

(declare-fun lt!114128 () Unit!6833)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11125 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3290) Unit!6833)

(assert (=> b!226684 (= lt!114128 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6290 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3287))))

(declare-fun lt!114133 () Unit!6833)

(assert (=> b!226684 (= lt!114133 e!147061)))

(declare-fun c!37585 () Bool)

(assert (=> b!226684 (= c!37585 lt!114129)))

(assert (=> b!226684 (= lt!114129 (arrayContainsKey!0 (_keys!6290 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!111593 () Bool)

(assert (=> start!22016 (=> (not res!111593) (not e!147067))))

(declare-fun valid!1271 (LongMapFixedSize!3154) Bool)

(assert (=> start!22016 (= res!111593 (valid!1271 thiss!1504))))

(assert (=> start!22016 e!147067))

(assert (=> start!22016 e!147060))

(assert (=> start!22016 true))

(declare-fun b!226685 () Bool)

(declare-fun res!111586 () Bool)

(assert (=> b!226685 (=> res!111586 e!147058)))

(assert (=> b!226685 (= res!111586 (or (not (= (size!5615 (_keys!6290 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10090 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5615 (_keys!6290 thiss!1504)))))))

(declare-fun b!226686 () Bool)

(declare-fun res!111598 () Bool)

(assert (=> b!226686 (=> (not res!111598) (not e!147066))))

(assert (=> b!226686 (= res!111598 (= (select (arr!5282 (_keys!6290 thiss!1504)) (index!5590 lt!114132)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226687 () Bool)

(declare-fun e!147063 () Bool)

(assert (=> b!226687 (= e!147067 e!147063)))

(declare-fun res!111588 () Bool)

(assert (=> b!226687 (=> (not res!111588) (not e!147063))))

(assert (=> b!226687 (= res!111588 (or (= lt!114132 (MissingZero!855 index!297)) (= lt!114132 (MissingVacant!855 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11125 (_ BitVec 32)) SeekEntryResult!855)

(assert (=> b!226687 (= lt!114132 (seekEntryOrOpen!0 key!932 (_keys!6290 thiss!1504) (mask!10090 thiss!1504)))))

(declare-fun b!226688 () Bool)

(declare-fun res!111597 () Bool)

(assert (=> b!226688 (=> res!111597 e!147058)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226688 (= res!111597 (not (validKeyInArray!0 key!932)))))

(declare-fun b!226689 () Bool)

(assert (=> b!226689 (= e!147066 (not call!21059))))

(declare-fun b!226690 () Bool)

(declare-fun c!37584 () Bool)

(get-info :version)

(assert (=> b!226690 (= c!37584 ((_ is MissingVacant!855) lt!114132))))

(declare-fun e!147054 () Bool)

(assert (=> b!226690 (= e!147068 e!147054)))

(declare-fun b!226691 () Bool)

(declare-fun lt!114127 () Unit!6833)

(assert (=> b!226691 (= e!147059 lt!114127)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!248 (array!11125 array!11123 (_ BitVec 32) (_ BitVec 32) V!7569 V!7569 (_ BitVec 64) Int) Unit!6833)

(assert (=> b!226691 (= lt!114127 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!248 (_keys!6290 thiss!1504) (_values!4219 thiss!1504) (mask!10090 thiss!1504) (extraKeys!3973 thiss!1504) (zeroValue!4077 thiss!1504) (minValue!4077 thiss!1504) key!932 (defaultEntry!4236 thiss!1504)))))

(assert (=> b!226691 (= c!37583 ((_ is MissingZero!855) lt!114132))))

(assert (=> b!226691 e!147068))

(declare-fun b!226692 () Bool)

(assert (=> b!226692 (= e!147054 ((_ is Undefined!855) lt!114132))))

(declare-fun b!226693 () Bool)

(declare-fun res!111594 () Bool)

(assert (=> b!226693 (= res!111594 (= (select (arr!5282 (_keys!6290 thiss!1504)) (index!5593 lt!114132)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226693 (=> (not res!111594) (not e!147064))))

(declare-fun b!226694 () Bool)

(declare-fun Unit!6837 () Unit!6833)

(assert (=> b!226694 (= e!147061 Unit!6837)))

(declare-fun b!226695 () Bool)

(assert (=> b!226695 (= e!147055 (and e!147062 mapRes!10081))))

(declare-fun condMapEmpty!10081 () Bool)

(declare-fun mapDefault!10081 () ValueCell!2627)

(assert (=> b!226695 (= condMapEmpty!10081 (= (arr!5281 (_values!4219 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2627)) mapDefault!10081)))))

(declare-fun b!226696 () Bool)

(assert (=> b!226696 (= e!147065 tp_is_empty!5941)))

(declare-fun b!226697 () Bool)

(assert (=> b!226697 (= e!147063 e!147057)))

(declare-fun res!111595 () Bool)

(assert (=> b!226697 (=> (not res!111595) (not e!147057))))

(assert (=> b!226697 (= res!111595 (inRange!0 index!297 (mask!10090 thiss!1504)))))

(declare-fun lt!114131 () Unit!6833)

(assert (=> b!226697 (= lt!114131 e!147059)))

(declare-fun c!37582 () Bool)

(declare-datatypes ((tuple2!4380 0))(
  ( (tuple2!4381 (_1!2201 (_ BitVec 64)) (_2!2201 V!7569)) )
))
(declare-datatypes ((List!3291 0))(
  ( (Nil!3288) (Cons!3287 (h!3935 tuple2!4380) (t!8242 List!3291)) )
))
(declare-datatypes ((ListLongMap!3295 0))(
  ( (ListLongMap!3296 (toList!1663 List!3291)) )
))
(declare-fun contains!1552 (ListLongMap!3295 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1195 (array!11125 array!11123 (_ BitVec 32) (_ BitVec 32) V!7569 V!7569 (_ BitVec 32) Int) ListLongMap!3295)

(assert (=> b!226697 (= c!37582 (contains!1552 (getCurrentListMap!1195 (_keys!6290 thiss!1504) (_values!4219 thiss!1504) (mask!10090 thiss!1504) (extraKeys!3973 thiss!1504) (zeroValue!4077 thiss!1504) (minValue!4077 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4236 thiss!1504)) key!932))))

(declare-fun b!226698 () Bool)

(assert (=> b!226698 (= e!147054 e!147064)))

(declare-fun res!111596 () Bool)

(assert (=> b!226698 (= res!111596 call!21060)))

(assert (=> b!226698 (=> (not res!111596) (not e!147064))))

(declare-fun mapIsEmpty!10081 () Bool)

(assert (=> mapIsEmpty!10081 mapRes!10081))

(assert (= (and start!22016 res!111593) b!226676))

(assert (= (and b!226676 res!111592) b!226687))

(assert (= (and b!226687 res!111588) b!226697))

(assert (= (and b!226697 c!37582) b!226675))

(assert (= (and b!226697 (not c!37582)) b!226691))

(assert (= (and b!226691 c!37583) b!226680))

(assert (= (and b!226691 (not c!37583)) b!226690))

(assert (= (and b!226680 res!111590) b!226686))

(assert (= (and b!226686 res!111598) b!226689))

(assert (= (and b!226690 c!37584) b!226698))

(assert (= (and b!226690 (not c!37584)) b!226692))

(assert (= (and b!226698 res!111596) b!226693))

(assert (= (and b!226693 res!111594) b!226681))

(assert (= (or b!226680 b!226698) bm!21056))

(assert (= (or b!226689 b!226681) bm!21057))

(assert (= (and b!226697 res!111595) b!226684))

(assert (= (and b!226684 c!37585) b!226674))

(assert (= (and b!226684 (not c!37585)) b!226694))

(assert (= (and b!226684 (not res!111589)) b!226685))

(assert (= (and b!226685 (not res!111586)) b!226688))

(assert (= (and b!226688 (not res!111597)) b!226678))

(assert (= (and b!226678 (not res!111591)) b!226683))

(assert (= (and b!226683 (not res!111587)) b!226682))

(assert (= (and b!226695 condMapEmpty!10081) mapIsEmpty!10081))

(assert (= (and b!226695 (not condMapEmpty!10081)) mapNonEmpty!10081))

(assert (= (and mapNonEmpty!10081 ((_ is ValueCellFull!2627) mapValue!10081)) b!226696))

(assert (= (and b!226695 ((_ is ValueCellFull!2627) mapDefault!10081)) b!226677))

(assert (= b!226679 b!226695))

(assert (= start!22016 b!226679))

(declare-fun m!249031 () Bool)

(assert (=> mapNonEmpty!10081 m!249031))

(declare-fun m!249033 () Bool)

(assert (=> b!226684 m!249033))

(declare-fun m!249035 () Bool)

(assert (=> b!226684 m!249035))

(declare-fun m!249037 () Bool)

(assert (=> b!226684 m!249037))

(declare-fun m!249039 () Bool)

(assert (=> b!226684 m!249039))

(declare-fun m!249041 () Bool)

(assert (=> b!226684 m!249041))

(declare-fun m!249043 () Bool)

(assert (=> b!226684 m!249043))

(declare-fun m!249045 () Bool)

(assert (=> b!226684 m!249045))

(declare-fun m!249047 () Bool)

(assert (=> b!226684 m!249047))

(declare-fun m!249049 () Bool)

(assert (=> b!226691 m!249049))

(declare-fun m!249051 () Bool)

(assert (=> b!226674 m!249051))

(declare-fun m!249053 () Bool)

(assert (=> b!226687 m!249053))

(declare-fun m!249055 () Bool)

(assert (=> b!226686 m!249055))

(declare-fun m!249057 () Bool)

(assert (=> b!226697 m!249057))

(declare-fun m!249059 () Bool)

(assert (=> b!226697 m!249059))

(assert (=> b!226697 m!249059))

(declare-fun m!249061 () Bool)

(assert (=> b!226697 m!249061))

(declare-fun m!249063 () Bool)

(assert (=> bm!21056 m!249063))

(declare-fun m!249065 () Bool)

(assert (=> b!226688 m!249065))

(declare-fun m!249067 () Bool)

(assert (=> b!226675 m!249067))

(declare-fun m!249069 () Bool)

(assert (=> b!226693 m!249069))

(declare-fun m!249071 () Bool)

(assert (=> start!22016 m!249071))

(declare-fun m!249073 () Bool)

(assert (=> b!226683 m!249073))

(declare-fun m!249075 () Bool)

(assert (=> b!226679 m!249075))

(declare-fun m!249077 () Bool)

(assert (=> b!226679 m!249077))

(assert (=> bm!21057 m!249035))

(declare-fun m!249079 () Bool)

(assert (=> b!226682 m!249079))

(check-sat (not bm!21056) b_and!12991 tp_is_empty!5941 (not b!226674) (not b!226682) (not mapNonEmpty!10081) (not b!226697) (not bm!21057) (not b!226691) (not b!226675) (not b!226687) (not b!226684) (not b!226679) (not b_next!6079) (not start!22016) (not b!226688) (not b!226683))
(check-sat b_and!12991 (not b_next!6079))
