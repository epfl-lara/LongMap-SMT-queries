; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24426 () Bool)

(assert start!24426)

(declare-fun b!255678 () Bool)

(declare-fun b_free!6709 () Bool)

(declare-fun b_next!6709 () Bool)

(assert (=> b!255678 (= b_free!6709 (not b_next!6709))))

(declare-fun tp!23423 () Bool)

(declare-fun b_and!13737 () Bool)

(assert (=> b!255678 (= tp!23423 b_and!13737)))

(declare-fun b!255665 () Bool)

(declare-fun c!43185 () Bool)

(declare-datatypes ((SeekEntryResult!1157 0))(
  ( (MissingZero!1157 (index!6798 (_ BitVec 32))) (Found!1157 (index!6799 (_ BitVec 32))) (Intermediate!1157 (undefined!1969 Bool) (index!6800 (_ BitVec 32)) (x!24934 (_ BitVec 32))) (Undefined!1157) (MissingVacant!1157 (index!6801 (_ BitVec 32))) )
))
(declare-fun lt!128184 () SeekEntryResult!1157)

(get-info :version)

(assert (=> b!255665 (= c!43185 ((_ is MissingVacant!1157) lt!128184))))

(declare-fun e!165715 () Bool)

(declare-fun e!165726 () Bool)

(assert (=> b!255665 (= e!165715 e!165726)))

(declare-fun b!255666 () Bool)

(declare-datatypes ((Unit!7902 0))(
  ( (Unit!7903) )
))
(declare-fun e!165716 () Unit!7902)

(declare-fun Unit!7904 () Unit!7902)

(assert (=> b!255666 (= e!165716 Unit!7904)))

(declare-fun b!255667 () Bool)

(declare-fun e!165728 () Bool)

(declare-fun tp_is_empty!6571 () Bool)

(assert (=> b!255667 (= e!165728 tp_is_empty!6571)))

(declare-fun b!255668 () Bool)

(declare-fun e!165727 () Bool)

(declare-fun e!165719 () Bool)

(assert (=> b!255668 (= e!165727 e!165719)))

(declare-fun res!125085 () Bool)

(assert (=> b!255668 (=> (not res!125085) (not e!165719))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8409 0))(
  ( (V!8410 (val!3330 Int)) )
))
(declare-datatypes ((ValueCell!2942 0))(
  ( (ValueCellFull!2942 (v!5407 V!8409)) (EmptyCell!2942) )
))
(declare-datatypes ((array!12471 0))(
  ( (array!12472 (arr!5907 (Array (_ BitVec 32) ValueCell!2942)) (size!6255 (_ BitVec 32))) )
))
(declare-datatypes ((array!12473 0))(
  ( (array!12474 (arr!5908 (Array (_ BitVec 32) (_ BitVec 64))) (size!6256 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3784 0))(
  ( (LongMapFixedSize!3785 (defaultEntry!4720 Int) (mask!10985 (_ BitVec 32)) (extraKeys!4457 (_ BitVec 32)) (zeroValue!4561 V!8409) (minValue!4561 V!8409) (_size!1941 (_ BitVec 32)) (_keys!6879 array!12473) (_values!4703 array!12471) (_vacant!1941 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3784)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255668 (= res!125085 (inRange!0 index!297 (mask!10985 thiss!1504)))))

(declare-fun lt!128189 () Unit!7902)

(declare-fun e!165724 () Unit!7902)

(assert (=> b!255668 (= lt!128189 e!165724)))

(declare-fun c!43187 () Bool)

(declare-datatypes ((tuple2!4854 0))(
  ( (tuple2!4855 (_1!2438 (_ BitVec 64)) (_2!2438 V!8409)) )
))
(declare-datatypes ((List!3757 0))(
  ( (Nil!3754) (Cons!3753 (h!4415 tuple2!4854) (t!8801 List!3757)) )
))
(declare-datatypes ((ListLongMap!3757 0))(
  ( (ListLongMap!3758 (toList!1894 List!3757)) )
))
(declare-fun lt!128191 () ListLongMap!3757)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1835 (ListLongMap!3757 (_ BitVec 64)) Bool)

(assert (=> b!255668 (= c!43187 (contains!1835 lt!128191 key!932))))

(declare-fun getCurrentListMap!1403 (array!12473 array!12471 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 32) Int) ListLongMap!3757)

(assert (=> b!255668 (= lt!128191 (getCurrentListMap!1403 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun b!255669 () Bool)

(declare-fun e!165718 () Bool)

(assert (=> b!255669 (= e!165726 e!165718)))

(declare-fun res!125079 () Bool)

(declare-fun call!24181 () Bool)

(assert (=> b!255669 (= res!125079 call!24181)))

(assert (=> b!255669 (=> (not res!125079) (not e!165718))))

(declare-fun b!255670 () Bool)

(declare-fun Unit!7905 () Unit!7902)

(assert (=> b!255670 (= e!165724 Unit!7905)))

(declare-fun lt!128183 () Unit!7902)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!424 (array!12473 array!12471 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) Int) Unit!7902)

(assert (=> b!255670 (= lt!128183 (lemmaInListMapThenSeekEntryOrOpenFindsIt!424 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)))))

(assert (=> b!255670 false))

(declare-fun b!255671 () Bool)

(declare-fun Unit!7906 () Unit!7902)

(assert (=> b!255671 (= e!165716 Unit!7906)))

(declare-fun lt!128186 () Unit!7902)

(declare-fun lemmaArrayContainsKeyThenInListMap!234 (array!12473 array!12471 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) (_ BitVec 32) Int) Unit!7902)

(assert (=> b!255671 (= lt!128186 (lemmaArrayContainsKeyThenInListMap!234 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(assert (=> b!255671 false))

(declare-fun b!255672 () Bool)

(declare-fun lt!128185 () Unit!7902)

(assert (=> b!255672 (= e!165724 lt!128185)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!423 (array!12473 array!12471 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) Int) Unit!7902)

(assert (=> b!255672 (= lt!128185 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!423 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)))))

(declare-fun c!43188 () Bool)

(assert (=> b!255672 (= c!43188 ((_ is MissingZero!1157) lt!128184))))

(assert (=> b!255672 e!165715))

(declare-fun b!255673 () Bool)

(declare-fun res!125082 () Bool)

(declare-fun e!165723 () Bool)

(assert (=> b!255673 (=> (not res!125082) (not e!165723))))

(assert (=> b!255673 (= res!125082 (= (select (arr!5908 (_keys!6879 thiss!1504)) (index!6798 lt!128184)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255675 () Bool)

(assert (=> b!255675 (= e!165726 ((_ is Undefined!1157) lt!128184))))

(declare-fun b!255676 () Bool)

(declare-fun call!24180 () Bool)

(assert (=> b!255676 (= e!165718 (not call!24180))))

(declare-fun b!255677 () Bool)

(declare-fun res!125083 () Bool)

(assert (=> b!255677 (= res!125083 (= (select (arr!5908 (_keys!6879 thiss!1504)) (index!6801 lt!128184)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255677 (=> (not res!125083) (not e!165718))))

(declare-fun e!165725 () Bool)

(declare-fun e!165717 () Bool)

(declare-fun array_inv!3903 (array!12473) Bool)

(declare-fun array_inv!3904 (array!12471) Bool)

(assert (=> b!255678 (= e!165717 (and tp!23423 tp_is_empty!6571 (array_inv!3903 (_keys!6879 thiss!1504)) (array_inv!3904 (_values!4703 thiss!1504)) e!165725))))

(declare-fun b!255679 () Bool)

(assert (=> b!255679 (= e!165723 (not call!24180))))

(declare-fun b!255680 () Bool)

(assert (=> b!255680 (= e!165719 (not (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6256 (_keys!6879 thiss!1504))) (bvslt (size!6256 (_keys!6879 thiss!1504)) #b01111111111111111111111111111111))))))

(declare-fun lt!128192 () array!12473)

(declare-fun v!346 () V!8409)

(declare-fun +!686 (ListLongMap!3757 tuple2!4854) ListLongMap!3757)

(assert (=> b!255680 (= (+!686 lt!128191 (tuple2!4855 key!932 v!346)) (getCurrentListMap!1403 lt!128192 (array!12472 (store (arr!5907 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6255 (_values!4703 thiss!1504))) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128190 () Unit!7902)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!97 (array!12473 array!12471 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 32) (_ BitVec 64) V!8409 Int) Unit!7902)

(assert (=> b!255680 (= lt!128190 (lemmaAddValidKeyToArrayThenAddPairToListMap!97 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) index!297 key!932 v!346 (defaultEntry!4720 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12473 (_ BitVec 32)) Bool)

(assert (=> b!255680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128192 (mask!10985 thiss!1504))))

(declare-fun lt!128187 () Unit!7902)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12473 (_ BitVec 32) (_ BitVec 32)) Unit!7902)

(assert (=> b!255680 (= lt!128187 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6879 thiss!1504) index!297 (mask!10985 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12473 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!255680 (= (arrayCountValidKeys!0 lt!128192 #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6879 thiss!1504) #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504)))))))

(declare-fun lt!128194 () Unit!7902)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12473 (_ BitVec 32) (_ BitVec 64)) Unit!7902)

(assert (=> b!255680 (= lt!128194 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6879 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3758 0))(
  ( (Nil!3755) (Cons!3754 (h!4416 (_ BitVec 64)) (t!8802 List!3758)) )
))
(declare-fun arrayNoDuplicates!0 (array!12473 (_ BitVec 32) List!3758) Bool)

(assert (=> b!255680 (arrayNoDuplicates!0 lt!128192 #b00000000000000000000000000000000 Nil!3755)))

(assert (=> b!255680 (= lt!128192 (array!12474 (store (arr!5908 (_keys!6879 thiss!1504)) index!297 key!932) (size!6256 (_keys!6879 thiss!1504))))))

(declare-fun lt!128188 () Unit!7902)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3758) Unit!7902)

(assert (=> b!255680 (= lt!128188 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6879 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3755))))

(declare-fun lt!128193 () Unit!7902)

(assert (=> b!255680 (= lt!128193 e!165716)))

(declare-fun c!43186 () Bool)

(declare-fun arrayContainsKey!0 (array!12473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!255680 (= c!43186 (arrayContainsKey!0 (_keys!6879 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255681 () Bool)

(declare-fun e!165722 () Bool)

(assert (=> b!255681 (= e!165722 tp_is_empty!6571)))

(declare-fun b!255682 () Bool)

(declare-fun res!125080 () Bool)

(assert (=> b!255682 (=> (not res!125080) (not e!165723))))

(assert (=> b!255682 (= res!125080 call!24181)))

(assert (=> b!255682 (= e!165715 e!165723)))

(declare-fun b!255683 () Bool)

(declare-fun mapRes!11181 () Bool)

(assert (=> b!255683 (= e!165725 (and e!165728 mapRes!11181))))

(declare-fun condMapEmpty!11181 () Bool)

(declare-fun mapDefault!11181 () ValueCell!2942)

(assert (=> b!255683 (= condMapEmpty!11181 (= (arr!5907 (_values!4703 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2942)) mapDefault!11181)))))

(declare-fun mapNonEmpty!11181 () Bool)

(declare-fun tp!23424 () Bool)

(assert (=> mapNonEmpty!11181 (= mapRes!11181 (and tp!23424 e!165722))))

(declare-fun mapValue!11181 () ValueCell!2942)

(declare-fun mapRest!11181 () (Array (_ BitVec 32) ValueCell!2942))

(declare-fun mapKey!11181 () (_ BitVec 32))

(assert (=> mapNonEmpty!11181 (= (arr!5907 (_values!4703 thiss!1504)) (store mapRest!11181 mapKey!11181 mapValue!11181))))

(declare-fun bm!24177 () Bool)

(assert (=> bm!24177 (= call!24180 (arrayContainsKey!0 (_keys!6879 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!24178 () Bool)

(assert (=> bm!24178 (= call!24181 (inRange!0 (ite c!43188 (index!6798 lt!128184) (index!6801 lt!128184)) (mask!10985 thiss!1504)))))

(declare-fun mapIsEmpty!11181 () Bool)

(assert (=> mapIsEmpty!11181 mapRes!11181))

(declare-fun b!255684 () Bool)

(declare-fun e!165721 () Bool)

(assert (=> b!255684 (= e!165721 e!165727)))

(declare-fun res!125084 () Bool)

(assert (=> b!255684 (=> (not res!125084) (not e!165727))))

(assert (=> b!255684 (= res!125084 (or (= lt!128184 (MissingZero!1157 index!297)) (= lt!128184 (MissingVacant!1157 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12473 (_ BitVec 32)) SeekEntryResult!1157)

(assert (=> b!255684 (= lt!128184 (seekEntryOrOpen!0 key!932 (_keys!6879 thiss!1504) (mask!10985 thiss!1504)))))

(declare-fun res!125086 () Bool)

(assert (=> start!24426 (=> (not res!125086) (not e!165721))))

(declare-fun valid!1483 (LongMapFixedSize!3784) Bool)

(assert (=> start!24426 (= res!125086 (valid!1483 thiss!1504))))

(assert (=> start!24426 e!165721))

(assert (=> start!24426 e!165717))

(assert (=> start!24426 true))

(assert (=> start!24426 tp_is_empty!6571))

(declare-fun b!255674 () Bool)

(declare-fun res!125081 () Bool)

(assert (=> b!255674 (=> (not res!125081) (not e!165721))))

(assert (=> b!255674 (= res!125081 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!24426 res!125086) b!255674))

(assert (= (and b!255674 res!125081) b!255684))

(assert (= (and b!255684 res!125084) b!255668))

(assert (= (and b!255668 c!43187) b!255670))

(assert (= (and b!255668 (not c!43187)) b!255672))

(assert (= (and b!255672 c!43188) b!255682))

(assert (= (and b!255672 (not c!43188)) b!255665))

(assert (= (and b!255682 res!125080) b!255673))

(assert (= (and b!255673 res!125082) b!255679))

(assert (= (and b!255665 c!43185) b!255669))

(assert (= (and b!255665 (not c!43185)) b!255675))

(assert (= (and b!255669 res!125079) b!255677))

(assert (= (and b!255677 res!125083) b!255676))

(assert (= (or b!255682 b!255669) bm!24178))

(assert (= (or b!255679 b!255676) bm!24177))

(assert (= (and b!255668 res!125085) b!255680))

(assert (= (and b!255680 c!43186) b!255671))

(assert (= (and b!255680 (not c!43186)) b!255666))

(assert (= (and b!255683 condMapEmpty!11181) mapIsEmpty!11181))

(assert (= (and b!255683 (not condMapEmpty!11181)) mapNonEmpty!11181))

(assert (= (and mapNonEmpty!11181 ((_ is ValueCellFull!2942) mapValue!11181)) b!255681))

(assert (= (and b!255683 ((_ is ValueCellFull!2942) mapDefault!11181)) b!255667))

(assert (= b!255678 b!255683))

(assert (= start!24426 b!255678))

(declare-fun m!270629 () Bool)

(assert (=> b!255671 m!270629))

(declare-fun m!270631 () Bool)

(assert (=> bm!24177 m!270631))

(declare-fun m!270633 () Bool)

(assert (=> b!255670 m!270633))

(declare-fun m!270635 () Bool)

(assert (=> b!255668 m!270635))

(declare-fun m!270637 () Bool)

(assert (=> b!255668 m!270637))

(declare-fun m!270639 () Bool)

(assert (=> b!255668 m!270639))

(declare-fun m!270641 () Bool)

(assert (=> mapNonEmpty!11181 m!270641))

(declare-fun m!270643 () Bool)

(assert (=> b!255678 m!270643))

(declare-fun m!270645 () Bool)

(assert (=> b!255678 m!270645))

(declare-fun m!270647 () Bool)

(assert (=> start!24426 m!270647))

(declare-fun m!270649 () Bool)

(assert (=> bm!24178 m!270649))

(declare-fun m!270651 () Bool)

(assert (=> b!255677 m!270651))

(declare-fun m!270653 () Bool)

(assert (=> b!255673 m!270653))

(declare-fun m!270655 () Bool)

(assert (=> b!255684 m!270655))

(declare-fun m!270657 () Bool)

(assert (=> b!255672 m!270657))

(assert (=> b!255680 m!270631))

(declare-fun m!270659 () Bool)

(assert (=> b!255680 m!270659))

(declare-fun m!270661 () Bool)

(assert (=> b!255680 m!270661))

(declare-fun m!270663 () Bool)

(assert (=> b!255680 m!270663))

(declare-fun m!270665 () Bool)

(assert (=> b!255680 m!270665))

(declare-fun m!270667 () Bool)

(assert (=> b!255680 m!270667))

(declare-fun m!270669 () Bool)

(assert (=> b!255680 m!270669))

(declare-fun m!270671 () Bool)

(assert (=> b!255680 m!270671))

(declare-fun m!270673 () Bool)

(assert (=> b!255680 m!270673))

(declare-fun m!270675 () Bool)

(assert (=> b!255680 m!270675))

(declare-fun m!270677 () Bool)

(assert (=> b!255680 m!270677))

(declare-fun m!270679 () Bool)

(assert (=> b!255680 m!270679))

(declare-fun m!270681 () Bool)

(assert (=> b!255680 m!270681))

(check-sat (not bm!24178) (not b!255684) (not b!255668) (not b!255671) (not b!255678) tp_is_empty!6571 b_and!13737 (not b_next!6709) (not bm!24177) (not b!255670) (not b!255680) (not mapNonEmpty!11181) (not start!24426) (not b!255672))
(check-sat b_and!13737 (not b_next!6709))
(get-model)

(declare-fun d!61475 () Bool)

(assert (=> d!61475 (= (inRange!0 index!297 (mask!10985 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10985 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!255668 d!61475))

(declare-fun d!61477 () Bool)

(declare-fun e!165817 () Bool)

(assert (=> d!61477 e!165817))

(declare-fun res!125137 () Bool)

(assert (=> d!61477 (=> res!125137 e!165817)))

(declare-fun lt!128277 () Bool)

(assert (=> d!61477 (= res!125137 (not lt!128277))))

(declare-fun lt!128275 () Bool)

(assert (=> d!61477 (= lt!128277 lt!128275)))

(declare-fun lt!128278 () Unit!7902)

(declare-fun e!165818 () Unit!7902)

(assert (=> d!61477 (= lt!128278 e!165818)))

(declare-fun c!43215 () Bool)

(assert (=> d!61477 (= c!43215 lt!128275)))

(declare-fun containsKey!298 (List!3757 (_ BitVec 64)) Bool)

(assert (=> d!61477 (= lt!128275 (containsKey!298 (toList!1894 lt!128191) key!932))))

(assert (=> d!61477 (= (contains!1835 lt!128191 key!932) lt!128277)))

(declare-fun b!255811 () Bool)

(declare-fun lt!128276 () Unit!7902)

(assert (=> b!255811 (= e!165818 lt!128276)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!247 (List!3757 (_ BitVec 64)) Unit!7902)

(assert (=> b!255811 (= lt!128276 (lemmaContainsKeyImpliesGetValueByKeyDefined!247 (toList!1894 lt!128191) key!932))))

(declare-datatypes ((Option!312 0))(
  ( (Some!311 (v!5412 V!8409)) (None!310) )
))
(declare-fun isDefined!248 (Option!312) Bool)

(declare-fun getValueByKey!306 (List!3757 (_ BitVec 64)) Option!312)

(assert (=> b!255811 (isDefined!248 (getValueByKey!306 (toList!1894 lt!128191) key!932))))

(declare-fun b!255812 () Bool)

(declare-fun Unit!7912 () Unit!7902)

(assert (=> b!255812 (= e!165818 Unit!7912)))

(declare-fun b!255813 () Bool)

(assert (=> b!255813 (= e!165817 (isDefined!248 (getValueByKey!306 (toList!1894 lt!128191) key!932)))))

(assert (= (and d!61477 c!43215) b!255811))

(assert (= (and d!61477 (not c!43215)) b!255812))

(assert (= (and d!61477 (not res!125137)) b!255813))

(declare-fun m!270791 () Bool)

(assert (=> d!61477 m!270791))

(declare-fun m!270793 () Bool)

(assert (=> b!255811 m!270793))

(declare-fun m!270795 () Bool)

(assert (=> b!255811 m!270795))

(assert (=> b!255811 m!270795))

(declare-fun m!270797 () Bool)

(assert (=> b!255811 m!270797))

(assert (=> b!255813 m!270795))

(assert (=> b!255813 m!270795))

(assert (=> b!255813 m!270797))

(assert (=> b!255668 d!61477))

(declare-fun b!255856 () Bool)

(declare-fun e!165849 () Bool)

(declare-fun call!24210 () Bool)

(assert (=> b!255856 (= e!165849 (not call!24210))))

(declare-fun b!255857 () Bool)

(declare-fun res!125162 () Bool)

(declare-fun e!165852 () Bool)

(assert (=> b!255857 (=> (not res!125162) (not e!165852))))

(declare-fun e!165848 () Bool)

(assert (=> b!255857 (= res!125162 e!165848)))

(declare-fun c!43229 () Bool)

(assert (=> b!255857 (= c!43229 (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255858 () Bool)

(assert (=> b!255858 (= e!165852 e!165849)))

(declare-fun c!43230 () Bool)

(assert (=> b!255858 (= c!43230 (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24205 () Bool)

(declare-fun call!24211 () ListLongMap!3757)

(declare-fun call!24212 () ListLongMap!3757)

(assert (=> bm!24205 (= call!24211 call!24212)))

(declare-fun bm!24206 () Bool)

(declare-fun call!24208 () ListLongMap!3757)

(assert (=> bm!24206 (= call!24212 call!24208)))

(declare-fun bm!24207 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!566 (array!12473 array!12471 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 32) Int) ListLongMap!3757)

(assert (=> bm!24207 (= call!24208 (getCurrentListMapNoExtraKeys!566 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun b!255859 () Bool)

(declare-fun e!165856 () Unit!7902)

(declare-fun lt!128342 () Unit!7902)

(assert (=> b!255859 (= e!165856 lt!128342)))

(declare-fun lt!128333 () ListLongMap!3757)

(assert (=> b!255859 (= lt!128333 (getCurrentListMapNoExtraKeys!566 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128344 () (_ BitVec 64))

(assert (=> b!255859 (= lt!128344 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128329 () (_ BitVec 64))

(assert (=> b!255859 (= lt!128329 (select (arr!5908 (_keys!6879 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128336 () Unit!7902)

(declare-fun addStillContains!226 (ListLongMap!3757 (_ BitVec 64) V!8409 (_ BitVec 64)) Unit!7902)

(assert (=> b!255859 (= lt!128336 (addStillContains!226 lt!128333 lt!128344 (zeroValue!4561 thiss!1504) lt!128329))))

(assert (=> b!255859 (contains!1835 (+!686 lt!128333 (tuple2!4855 lt!128344 (zeroValue!4561 thiss!1504))) lt!128329)))

(declare-fun lt!128328 () Unit!7902)

(assert (=> b!255859 (= lt!128328 lt!128336)))

(declare-fun lt!128340 () ListLongMap!3757)

(assert (=> b!255859 (= lt!128340 (getCurrentListMapNoExtraKeys!566 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128330 () (_ BitVec 64))

(assert (=> b!255859 (= lt!128330 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128343 () (_ BitVec 64))

(assert (=> b!255859 (= lt!128343 (select (arr!5908 (_keys!6879 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128326 () Unit!7902)

(declare-fun addApplyDifferent!226 (ListLongMap!3757 (_ BitVec 64) V!8409 (_ BitVec 64)) Unit!7902)

(assert (=> b!255859 (= lt!128326 (addApplyDifferent!226 lt!128340 lt!128330 (minValue!4561 thiss!1504) lt!128343))))

(declare-fun apply!250 (ListLongMap!3757 (_ BitVec 64)) V!8409)

(assert (=> b!255859 (= (apply!250 (+!686 lt!128340 (tuple2!4855 lt!128330 (minValue!4561 thiss!1504))) lt!128343) (apply!250 lt!128340 lt!128343))))

(declare-fun lt!128327 () Unit!7902)

(assert (=> b!255859 (= lt!128327 lt!128326)))

(declare-fun lt!128334 () ListLongMap!3757)

(assert (=> b!255859 (= lt!128334 (getCurrentListMapNoExtraKeys!566 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128341 () (_ BitVec 64))

(assert (=> b!255859 (= lt!128341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128338 () (_ BitVec 64))

(assert (=> b!255859 (= lt!128338 (select (arr!5908 (_keys!6879 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128332 () Unit!7902)

(assert (=> b!255859 (= lt!128332 (addApplyDifferent!226 lt!128334 lt!128341 (zeroValue!4561 thiss!1504) lt!128338))))

(assert (=> b!255859 (= (apply!250 (+!686 lt!128334 (tuple2!4855 lt!128341 (zeroValue!4561 thiss!1504))) lt!128338) (apply!250 lt!128334 lt!128338))))

(declare-fun lt!128324 () Unit!7902)

(assert (=> b!255859 (= lt!128324 lt!128332)))

(declare-fun lt!128337 () ListLongMap!3757)

(assert (=> b!255859 (= lt!128337 (getCurrentListMapNoExtraKeys!566 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128335 () (_ BitVec 64))

(assert (=> b!255859 (= lt!128335 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128325 () (_ BitVec 64))

(assert (=> b!255859 (= lt!128325 (select (arr!5908 (_keys!6879 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255859 (= lt!128342 (addApplyDifferent!226 lt!128337 lt!128335 (minValue!4561 thiss!1504) lt!128325))))

(assert (=> b!255859 (= (apply!250 (+!686 lt!128337 (tuple2!4855 lt!128335 (minValue!4561 thiss!1504))) lt!128325) (apply!250 lt!128337 lt!128325))))

(declare-fun b!255860 () Bool)

(declare-fun e!165845 () Bool)

(declare-fun lt!128323 () ListLongMap!3757)

(declare-fun get!3035 (ValueCell!2942 V!8409) V!8409)

(declare-fun dynLambda!584 (Int (_ BitVec 64)) V!8409)

(assert (=> b!255860 (= e!165845 (= (apply!250 lt!128323 (select (arr!5908 (_keys!6879 thiss!1504)) #b00000000000000000000000000000000)) (get!3035 (select (arr!5907 (_values!4703 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4720 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6255 (_values!4703 thiss!1504))))))

(assert (=> b!255860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))))))

(declare-fun b!255861 () Bool)

(declare-fun e!165850 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!255861 (= e!165850 (validKeyInArray!0 (select (arr!5908 (_keys!6879 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255862 () Bool)

(declare-fun call!24213 () Bool)

(assert (=> b!255862 (= e!165848 (not call!24213))))

(declare-fun d!61479 () Bool)

(assert (=> d!61479 e!165852))

(declare-fun res!125164 () Bool)

(assert (=> d!61479 (=> (not res!125164) (not e!165852))))

(assert (=> d!61479 (= res!125164 (or (bvsge #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))))))))

(declare-fun lt!128339 () ListLongMap!3757)

(assert (=> d!61479 (= lt!128323 lt!128339)))

(declare-fun lt!128331 () Unit!7902)

(assert (=> d!61479 (= lt!128331 e!165856)))

(declare-fun c!43228 () Bool)

(assert (=> d!61479 (= c!43228 e!165850)))

(declare-fun res!125159 () Bool)

(assert (=> d!61479 (=> (not res!125159) (not e!165850))))

(assert (=> d!61479 (= res!125159 (bvslt #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))))))

(declare-fun e!165847 () ListLongMap!3757)

(assert (=> d!61479 (= lt!128339 e!165847)))

(declare-fun c!43231 () Bool)

(assert (=> d!61479 (= c!43231 (and (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61479 (validMask!0 (mask!10985 thiss!1504))))

(assert (=> d!61479 (= (getCurrentListMap!1403 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)) lt!128323)))

(declare-fun bm!24208 () Bool)

(assert (=> bm!24208 (= call!24213 (contains!1835 lt!128323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255863 () Bool)

(declare-fun e!165857 () ListLongMap!3757)

(assert (=> b!255863 (= e!165857 call!24211)))

(declare-fun b!255864 () Bool)

(declare-fun e!165855 () Bool)

(assert (=> b!255864 (= e!165848 e!165855)))

(declare-fun res!125160 () Bool)

(assert (=> b!255864 (= res!125160 call!24213)))

(assert (=> b!255864 (=> (not res!125160) (not e!165855))))

(declare-fun bm!24209 () Bool)

(assert (=> bm!24209 (= call!24210 (contains!1835 lt!128323 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255865 () Bool)

(declare-fun e!165851 () ListLongMap!3757)

(assert (=> b!255865 (= e!165847 e!165851)))

(declare-fun c!43232 () Bool)

(assert (=> b!255865 (= c!43232 (and (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255866 () Bool)

(declare-fun c!43233 () Bool)

(assert (=> b!255866 (= c!43233 (and (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!255866 (= e!165851 e!165857)))

(declare-fun b!255867 () Bool)

(assert (=> b!255867 (= e!165855 (= (apply!250 lt!128323 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4561 thiss!1504)))))

(declare-fun b!255868 () Bool)

(declare-fun call!24214 () ListLongMap!3757)

(assert (=> b!255868 (= e!165857 call!24214)))

(declare-fun bm!24210 () Bool)

(declare-fun call!24209 () ListLongMap!3757)

(assert (=> bm!24210 (= call!24214 call!24209)))

(declare-fun b!255869 () Bool)

(assert (=> b!255869 (= e!165847 (+!686 call!24209 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4561 thiss!1504))))))

(declare-fun b!255870 () Bool)

(declare-fun e!165854 () Bool)

(assert (=> b!255870 (= e!165854 e!165845)))

(declare-fun res!125161 () Bool)

(assert (=> b!255870 (=> (not res!125161) (not e!165845))))

(assert (=> b!255870 (= res!125161 (contains!1835 lt!128323 (select (arr!5908 (_keys!6879 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!255870 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))))))

(declare-fun b!255871 () Bool)

(declare-fun res!125163 () Bool)

(assert (=> b!255871 (=> (not res!125163) (not e!165852))))

(assert (=> b!255871 (= res!125163 e!165854)))

(declare-fun res!125158 () Bool)

(assert (=> b!255871 (=> res!125158 e!165854)))

(declare-fun e!165853 () Bool)

(assert (=> b!255871 (= res!125158 (not e!165853))))

(declare-fun res!125157 () Bool)

(assert (=> b!255871 (=> (not res!125157) (not e!165853))))

(assert (=> b!255871 (= res!125157 (bvslt #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))))))

(declare-fun b!255872 () Bool)

(declare-fun e!165846 () Bool)

(assert (=> b!255872 (= e!165849 e!165846)))

(declare-fun res!125156 () Bool)

(assert (=> b!255872 (= res!125156 call!24210)))

(assert (=> b!255872 (=> (not res!125156) (not e!165846))))

(declare-fun b!255873 () Bool)

(declare-fun Unit!7913 () Unit!7902)

(assert (=> b!255873 (= e!165856 Unit!7913)))

(declare-fun b!255874 () Bool)

(assert (=> b!255874 (= e!165851 call!24214)))

(declare-fun b!255875 () Bool)

(assert (=> b!255875 (= e!165846 (= (apply!250 lt!128323 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4561 thiss!1504)))))

(declare-fun bm!24211 () Bool)

(assert (=> bm!24211 (= call!24209 (+!686 (ite c!43231 call!24208 (ite c!43232 call!24212 call!24211)) (ite (or c!43231 c!43232) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4561 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4561 thiss!1504)))))))

(declare-fun b!255876 () Bool)

(assert (=> b!255876 (= e!165853 (validKeyInArray!0 (select (arr!5908 (_keys!6879 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61479 c!43231) b!255869))

(assert (= (and d!61479 (not c!43231)) b!255865))

(assert (= (and b!255865 c!43232) b!255874))

(assert (= (and b!255865 (not c!43232)) b!255866))

(assert (= (and b!255866 c!43233) b!255868))

(assert (= (and b!255866 (not c!43233)) b!255863))

(assert (= (or b!255868 b!255863) bm!24205))

(assert (= (or b!255874 bm!24205) bm!24206))

(assert (= (or b!255874 b!255868) bm!24210))

(assert (= (or b!255869 bm!24206) bm!24207))

(assert (= (or b!255869 bm!24210) bm!24211))

(assert (= (and d!61479 res!125159) b!255861))

(assert (= (and d!61479 c!43228) b!255859))

(assert (= (and d!61479 (not c!43228)) b!255873))

(assert (= (and d!61479 res!125164) b!255871))

(assert (= (and b!255871 res!125157) b!255876))

(assert (= (and b!255871 (not res!125158)) b!255870))

(assert (= (and b!255870 res!125161) b!255860))

(assert (= (and b!255871 res!125163) b!255857))

(assert (= (and b!255857 c!43229) b!255864))

(assert (= (and b!255857 (not c!43229)) b!255862))

(assert (= (and b!255864 res!125160) b!255867))

(assert (= (or b!255864 b!255862) bm!24208))

(assert (= (and b!255857 res!125162) b!255858))

(assert (= (and b!255858 c!43230) b!255872))

(assert (= (and b!255858 (not c!43230)) b!255856))

(assert (= (and b!255872 res!125156) b!255875))

(assert (= (or b!255872 b!255856) bm!24209))

(declare-fun b_lambda!8137 () Bool)

(assert (=> (not b_lambda!8137) (not b!255860)))

(declare-fun t!8806 () Bool)

(declare-fun tb!3005 () Bool)

(assert (=> (and b!255678 (= (defaultEntry!4720 thiss!1504) (defaultEntry!4720 thiss!1504)) t!8806) tb!3005))

(declare-fun result!5353 () Bool)

(assert (=> tb!3005 (= result!5353 tp_is_empty!6571)))

(assert (=> b!255860 t!8806))

(declare-fun b_and!13743 () Bool)

(assert (= b_and!13737 (and (=> t!8806 result!5353) b_and!13743)))

(declare-fun m!270799 () Bool)

(assert (=> b!255859 m!270799))

(declare-fun m!270801 () Bool)

(assert (=> b!255859 m!270801))

(declare-fun m!270803 () Bool)

(assert (=> b!255859 m!270803))

(declare-fun m!270805 () Bool)

(assert (=> b!255859 m!270805))

(declare-fun m!270807 () Bool)

(assert (=> b!255859 m!270807))

(declare-fun m!270809 () Bool)

(assert (=> b!255859 m!270809))

(declare-fun m!270811 () Bool)

(assert (=> b!255859 m!270811))

(assert (=> b!255859 m!270809))

(declare-fun m!270813 () Bool)

(assert (=> b!255859 m!270813))

(declare-fun m!270815 () Bool)

(assert (=> b!255859 m!270815))

(assert (=> b!255859 m!270805))

(declare-fun m!270817 () Bool)

(assert (=> b!255859 m!270817))

(declare-fun m!270819 () Bool)

(assert (=> b!255859 m!270819))

(declare-fun m!270821 () Bool)

(assert (=> b!255859 m!270821))

(declare-fun m!270823 () Bool)

(assert (=> b!255859 m!270823))

(assert (=> b!255859 m!270807))

(declare-fun m!270825 () Bool)

(assert (=> b!255859 m!270825))

(declare-fun m!270827 () Bool)

(assert (=> b!255859 m!270827))

(declare-fun m!270829 () Bool)

(assert (=> b!255859 m!270829))

(assert (=> b!255859 m!270799))

(declare-fun m!270831 () Bool)

(assert (=> b!255859 m!270831))

(declare-fun m!270833 () Bool)

(assert (=> bm!24209 m!270833))

(declare-fun m!270835 () Bool)

(assert (=> b!255869 m!270835))

(declare-fun m!270837 () Bool)

(assert (=> d!61479 m!270837))

(declare-fun m!270839 () Bool)

(assert (=> bm!24211 m!270839))

(assert (=> bm!24207 m!270803))

(declare-fun m!270841 () Bool)

(assert (=> b!255875 m!270841))

(assert (=> b!255861 m!270813))

(assert (=> b!255861 m!270813))

(declare-fun m!270843 () Bool)

(assert (=> b!255861 m!270843))

(assert (=> b!255876 m!270813))

(assert (=> b!255876 m!270813))

(assert (=> b!255876 m!270843))

(assert (=> b!255870 m!270813))

(assert (=> b!255870 m!270813))

(declare-fun m!270845 () Bool)

(assert (=> b!255870 m!270845))

(assert (=> b!255860 m!270813))

(declare-fun m!270847 () Bool)

(assert (=> b!255860 m!270847))

(declare-fun m!270849 () Bool)

(assert (=> b!255860 m!270849))

(assert (=> b!255860 m!270847))

(declare-fun m!270851 () Bool)

(assert (=> b!255860 m!270851))

(assert (=> b!255860 m!270813))

(declare-fun m!270853 () Bool)

(assert (=> b!255860 m!270853))

(assert (=> b!255860 m!270849))

(declare-fun m!270855 () Bool)

(assert (=> b!255867 m!270855))

(declare-fun m!270857 () Bool)

(assert (=> bm!24208 m!270857))

(assert (=> b!255668 d!61479))

(declare-fun d!61481 () Bool)

(assert (=> d!61481 (= (array_inv!3903 (_keys!6879 thiss!1504)) (bvsge (size!6256 (_keys!6879 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255678 d!61481))

(declare-fun d!61483 () Bool)

(assert (=> d!61483 (= (array_inv!3904 (_values!4703 thiss!1504)) (bvsge (size!6255 (_values!4703 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255678 d!61483))

(declare-fun d!61485 () Bool)

(declare-fun res!125171 () Bool)

(declare-fun e!165860 () Bool)

(assert (=> d!61485 (=> (not res!125171) (not e!165860))))

(declare-fun simpleValid!273 (LongMapFixedSize!3784) Bool)

(assert (=> d!61485 (= res!125171 (simpleValid!273 thiss!1504))))

(assert (=> d!61485 (= (valid!1483 thiss!1504) e!165860)))

(declare-fun b!255885 () Bool)

(declare-fun res!125172 () Bool)

(assert (=> b!255885 (=> (not res!125172) (not e!165860))))

(assert (=> b!255885 (= res!125172 (= (arrayCountValidKeys!0 (_keys!6879 thiss!1504) #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))) (_size!1941 thiss!1504)))))

(declare-fun b!255886 () Bool)

(declare-fun res!125173 () Bool)

(assert (=> b!255886 (=> (not res!125173) (not e!165860))))

(assert (=> b!255886 (= res!125173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6879 thiss!1504) (mask!10985 thiss!1504)))))

(declare-fun b!255887 () Bool)

(assert (=> b!255887 (= e!165860 (arrayNoDuplicates!0 (_keys!6879 thiss!1504) #b00000000000000000000000000000000 Nil!3755))))

(assert (= (and d!61485 res!125171) b!255885))

(assert (= (and b!255885 res!125172) b!255886))

(assert (= (and b!255886 res!125173) b!255887))

(declare-fun m!270859 () Bool)

(assert (=> d!61485 m!270859))

(assert (=> b!255885 m!270673))

(declare-fun m!270861 () Bool)

(assert (=> b!255886 m!270861))

(declare-fun m!270863 () Bool)

(assert (=> b!255887 m!270863))

(assert (=> start!24426 d!61485))

(declare-fun b!255899 () Bool)

(declare-fun e!165866 () Bool)

(assert (=> b!255899 (= e!165866 (= (arrayCountValidKeys!0 (array!12474 (store (arr!5908 (_keys!6879 thiss!1504)) index!297 key!932) (size!6256 (_keys!6879 thiss!1504))) #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6879 thiss!1504) #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!255896 () Bool)

(declare-fun res!125183 () Bool)

(declare-fun e!165865 () Bool)

(assert (=> b!255896 (=> (not res!125183) (not e!165865))))

(assert (=> b!255896 (= res!125183 (not (validKeyInArray!0 (select (arr!5908 (_keys!6879 thiss!1504)) index!297))))))

(declare-fun b!255898 () Bool)

(assert (=> b!255898 (= e!165865 (bvslt (size!6256 (_keys!6879 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!61487 () Bool)

(assert (=> d!61487 e!165866))

(declare-fun res!125184 () Bool)

(assert (=> d!61487 (=> (not res!125184) (not e!165866))))

(assert (=> d!61487 (= res!125184 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6256 (_keys!6879 thiss!1504)))))))

(declare-fun lt!128347 () Unit!7902)

(declare-fun choose!1 (array!12473 (_ BitVec 32) (_ BitVec 64)) Unit!7902)

(assert (=> d!61487 (= lt!128347 (choose!1 (_keys!6879 thiss!1504) index!297 key!932))))

(assert (=> d!61487 e!165865))

(declare-fun res!125185 () Bool)

(assert (=> d!61487 (=> (not res!125185) (not e!165865))))

(assert (=> d!61487 (= res!125185 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6256 (_keys!6879 thiss!1504)))))))

(assert (=> d!61487 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6879 thiss!1504) index!297 key!932) lt!128347)))

(declare-fun b!255897 () Bool)

(declare-fun res!125182 () Bool)

(assert (=> b!255897 (=> (not res!125182) (not e!165865))))

(assert (=> b!255897 (= res!125182 (validKeyInArray!0 key!932))))

(assert (= (and d!61487 res!125185) b!255896))

(assert (= (and b!255896 res!125183) b!255897))

(assert (= (and b!255897 res!125182) b!255898))

(assert (= (and d!61487 res!125184) b!255899))

(assert (=> b!255899 m!270671))

(declare-fun m!270865 () Bool)

(assert (=> b!255899 m!270865))

(assert (=> b!255899 m!270673))

(declare-fun m!270867 () Bool)

(assert (=> b!255896 m!270867))

(assert (=> b!255896 m!270867))

(declare-fun m!270869 () Bool)

(assert (=> b!255896 m!270869))

(declare-fun m!270871 () Bool)

(assert (=> d!61487 m!270871))

(declare-fun m!270873 () Bool)

(assert (=> b!255897 m!270873))

(assert (=> b!255680 d!61487))

(declare-fun b!255910 () Bool)

(declare-fun e!165877 () Bool)

(declare-fun call!24217 () Bool)

(assert (=> b!255910 (= e!165877 call!24217)))

(declare-fun b!255911 () Bool)

(declare-fun e!165876 () Bool)

(declare-fun contains!1836 (List!3758 (_ BitVec 64)) Bool)

(assert (=> b!255911 (= e!165876 (contains!1836 Nil!3755 (select (arr!5908 lt!128192) #b00000000000000000000000000000000)))))

(declare-fun d!61489 () Bool)

(declare-fun res!125193 () Bool)

(declare-fun e!165878 () Bool)

(assert (=> d!61489 (=> res!125193 e!165878)))

(assert (=> d!61489 (= res!125193 (bvsge #b00000000000000000000000000000000 (size!6256 lt!128192)))))

(assert (=> d!61489 (= (arrayNoDuplicates!0 lt!128192 #b00000000000000000000000000000000 Nil!3755) e!165878)))

(declare-fun b!255912 () Bool)

(declare-fun e!165875 () Bool)

(assert (=> b!255912 (= e!165875 e!165877)))

(declare-fun c!43236 () Bool)

(assert (=> b!255912 (= c!43236 (validKeyInArray!0 (select (arr!5908 lt!128192) #b00000000000000000000000000000000)))))

(declare-fun b!255913 () Bool)

(assert (=> b!255913 (= e!165878 e!165875)))

(declare-fun res!125194 () Bool)

(assert (=> b!255913 (=> (not res!125194) (not e!165875))))

(assert (=> b!255913 (= res!125194 (not e!165876))))

(declare-fun res!125192 () Bool)

(assert (=> b!255913 (=> (not res!125192) (not e!165876))))

(assert (=> b!255913 (= res!125192 (validKeyInArray!0 (select (arr!5908 lt!128192) #b00000000000000000000000000000000)))))

(declare-fun b!255914 () Bool)

(assert (=> b!255914 (= e!165877 call!24217)))

(declare-fun bm!24214 () Bool)

(assert (=> bm!24214 (= call!24217 (arrayNoDuplicates!0 lt!128192 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43236 (Cons!3754 (select (arr!5908 lt!128192) #b00000000000000000000000000000000) Nil!3755) Nil!3755)))))

(assert (= (and d!61489 (not res!125193)) b!255913))

(assert (= (and b!255913 res!125192) b!255911))

(assert (= (and b!255913 res!125194) b!255912))

(assert (= (and b!255912 c!43236) b!255914))

(assert (= (and b!255912 (not c!43236)) b!255910))

(assert (= (or b!255914 b!255910) bm!24214))

(declare-fun m!270875 () Bool)

(assert (=> b!255911 m!270875))

(assert (=> b!255911 m!270875))

(declare-fun m!270877 () Bool)

(assert (=> b!255911 m!270877))

(assert (=> b!255912 m!270875))

(assert (=> b!255912 m!270875))

(declare-fun m!270879 () Bool)

(assert (=> b!255912 m!270879))

(assert (=> b!255913 m!270875))

(assert (=> b!255913 m!270875))

(assert (=> b!255913 m!270879))

(assert (=> bm!24214 m!270875))

(declare-fun m!270881 () Bool)

(assert (=> bm!24214 m!270881))

(assert (=> b!255680 d!61489))

(declare-fun b!255923 () Bool)

(declare-fun e!165883 () (_ BitVec 32))

(declare-fun call!24220 () (_ BitVec 32))

(assert (=> b!255923 (= e!165883 (bvadd #b00000000000000000000000000000001 call!24220))))

(declare-fun b!255924 () Bool)

(declare-fun e!165884 () (_ BitVec 32))

(assert (=> b!255924 (= e!165884 e!165883)))

(declare-fun c!43241 () Bool)

(assert (=> b!255924 (= c!43241 (validKeyInArray!0 (select (arr!5908 (_keys!6879 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61491 () Bool)

(declare-fun lt!128350 () (_ BitVec 32))

(assert (=> d!61491 (and (bvsge lt!128350 #b00000000000000000000000000000000) (bvsle lt!128350 (bvsub (size!6256 (_keys!6879 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61491 (= lt!128350 e!165884)))

(declare-fun c!43242 () Bool)

(assert (=> d!61491 (= c!43242 (bvsge #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))))))

(assert (=> d!61491 (and (bvsle #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6256 (_keys!6879 thiss!1504)) (size!6256 (_keys!6879 thiss!1504))))))

(assert (=> d!61491 (= (arrayCountValidKeys!0 (_keys!6879 thiss!1504) #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))) lt!128350)))

(declare-fun b!255925 () Bool)

(assert (=> b!255925 (= e!165883 call!24220)))

(declare-fun bm!24217 () Bool)

(assert (=> bm!24217 (= call!24220 (arrayCountValidKeys!0 (_keys!6879 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6256 (_keys!6879 thiss!1504))))))

(declare-fun b!255926 () Bool)

(assert (=> b!255926 (= e!165884 #b00000000000000000000000000000000)))

(assert (= (and d!61491 c!43242) b!255926))

(assert (= (and d!61491 (not c!43242)) b!255924))

(assert (= (and b!255924 c!43241) b!255923))

(assert (= (and b!255924 (not c!43241)) b!255925))

(assert (= (or b!255923 b!255925) bm!24217))

(assert (=> b!255924 m!270813))

(assert (=> b!255924 m!270813))

(assert (=> b!255924 m!270843))

(declare-fun m!270883 () Bool)

(assert (=> bm!24217 m!270883))

(assert (=> b!255680 d!61491))

(declare-fun d!61493 () Bool)

(declare-fun e!165887 () Bool)

(assert (=> d!61493 e!165887))

(declare-fun res!125197 () Bool)

(assert (=> d!61493 (=> (not res!125197) (not e!165887))))

(assert (=> d!61493 (= res!125197 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6256 (_keys!6879 thiss!1504))) (bvslt index!297 (size!6255 (_values!4703 thiss!1504)))))))

(declare-fun lt!128353 () Unit!7902)

(declare-fun choose!1231 (array!12473 array!12471 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 32) (_ BitVec 64) V!8409 Int) Unit!7902)

(assert (=> d!61493 (= lt!128353 (choose!1231 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) index!297 key!932 v!346 (defaultEntry!4720 thiss!1504)))))

(assert (=> d!61493 (validMask!0 (mask!10985 thiss!1504))))

(assert (=> d!61493 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!97 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) index!297 key!932 v!346 (defaultEntry!4720 thiss!1504)) lt!128353)))

(declare-fun b!255929 () Bool)

(assert (=> b!255929 (= e!165887 (= (+!686 (getCurrentListMap!1403 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)) (tuple2!4855 key!932 v!346)) (getCurrentListMap!1403 (array!12474 (store (arr!5908 (_keys!6879 thiss!1504)) index!297 key!932) (size!6256 (_keys!6879 thiss!1504))) (array!12472 (store (arr!5907 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6255 (_values!4703 thiss!1504))) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504))))))

(assert (= (and d!61493 res!125197) b!255929))

(declare-fun m!270885 () Bool)

(assert (=> d!61493 m!270885))

(assert (=> d!61493 m!270837))

(assert (=> b!255929 m!270639))

(assert (=> b!255929 m!270675))

(assert (=> b!255929 m!270639))

(declare-fun m!270887 () Bool)

(assert (=> b!255929 m!270887))

(declare-fun m!270889 () Bool)

(assert (=> b!255929 m!270889))

(assert (=> b!255929 m!270671))

(assert (=> b!255680 d!61493))

(declare-fun b!255930 () Bool)

(declare-fun e!165892 () Bool)

(declare-fun call!24223 () Bool)

(assert (=> b!255930 (= e!165892 (not call!24223))))

(declare-fun b!255931 () Bool)

(declare-fun res!125204 () Bool)

(declare-fun e!165895 () Bool)

(assert (=> b!255931 (=> (not res!125204) (not e!165895))))

(declare-fun e!165891 () Bool)

(assert (=> b!255931 (= res!125204 e!165891)))

(declare-fun c!43244 () Bool)

(assert (=> b!255931 (= c!43244 (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255932 () Bool)

(assert (=> b!255932 (= e!165895 e!165892)))

(declare-fun c!43245 () Bool)

(assert (=> b!255932 (= c!43245 (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24218 () Bool)

(declare-fun call!24224 () ListLongMap!3757)

(declare-fun call!24225 () ListLongMap!3757)

(assert (=> bm!24218 (= call!24224 call!24225)))

(declare-fun bm!24219 () Bool)

(declare-fun call!24221 () ListLongMap!3757)

(assert (=> bm!24219 (= call!24225 call!24221)))

(declare-fun bm!24220 () Bool)

(assert (=> bm!24220 (= call!24221 (getCurrentListMapNoExtraKeys!566 lt!128192 (array!12472 (store (arr!5907 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6255 (_values!4703 thiss!1504))) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun b!255933 () Bool)

(declare-fun e!165899 () Unit!7902)

(declare-fun lt!128373 () Unit!7902)

(assert (=> b!255933 (= e!165899 lt!128373)))

(declare-fun lt!128364 () ListLongMap!3757)

(assert (=> b!255933 (= lt!128364 (getCurrentListMapNoExtraKeys!566 lt!128192 (array!12472 (store (arr!5907 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6255 (_values!4703 thiss!1504))) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128375 () (_ BitVec 64))

(assert (=> b!255933 (= lt!128375 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128360 () (_ BitVec 64))

(assert (=> b!255933 (= lt!128360 (select (arr!5908 lt!128192) #b00000000000000000000000000000000))))

(declare-fun lt!128367 () Unit!7902)

(assert (=> b!255933 (= lt!128367 (addStillContains!226 lt!128364 lt!128375 (zeroValue!4561 thiss!1504) lt!128360))))

(assert (=> b!255933 (contains!1835 (+!686 lt!128364 (tuple2!4855 lt!128375 (zeroValue!4561 thiss!1504))) lt!128360)))

(declare-fun lt!128359 () Unit!7902)

(assert (=> b!255933 (= lt!128359 lt!128367)))

(declare-fun lt!128371 () ListLongMap!3757)

(assert (=> b!255933 (= lt!128371 (getCurrentListMapNoExtraKeys!566 lt!128192 (array!12472 (store (arr!5907 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6255 (_values!4703 thiss!1504))) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128361 () (_ BitVec 64))

(assert (=> b!255933 (= lt!128361 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128374 () (_ BitVec 64))

(assert (=> b!255933 (= lt!128374 (select (arr!5908 lt!128192) #b00000000000000000000000000000000))))

(declare-fun lt!128357 () Unit!7902)

(assert (=> b!255933 (= lt!128357 (addApplyDifferent!226 lt!128371 lt!128361 (minValue!4561 thiss!1504) lt!128374))))

(assert (=> b!255933 (= (apply!250 (+!686 lt!128371 (tuple2!4855 lt!128361 (minValue!4561 thiss!1504))) lt!128374) (apply!250 lt!128371 lt!128374))))

(declare-fun lt!128358 () Unit!7902)

(assert (=> b!255933 (= lt!128358 lt!128357)))

(declare-fun lt!128365 () ListLongMap!3757)

(assert (=> b!255933 (= lt!128365 (getCurrentListMapNoExtraKeys!566 lt!128192 (array!12472 (store (arr!5907 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6255 (_values!4703 thiss!1504))) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128372 () (_ BitVec 64))

(assert (=> b!255933 (= lt!128372 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128369 () (_ BitVec 64))

(assert (=> b!255933 (= lt!128369 (select (arr!5908 lt!128192) #b00000000000000000000000000000000))))

(declare-fun lt!128363 () Unit!7902)

(assert (=> b!255933 (= lt!128363 (addApplyDifferent!226 lt!128365 lt!128372 (zeroValue!4561 thiss!1504) lt!128369))))

(assert (=> b!255933 (= (apply!250 (+!686 lt!128365 (tuple2!4855 lt!128372 (zeroValue!4561 thiss!1504))) lt!128369) (apply!250 lt!128365 lt!128369))))

(declare-fun lt!128355 () Unit!7902)

(assert (=> b!255933 (= lt!128355 lt!128363)))

(declare-fun lt!128368 () ListLongMap!3757)

(assert (=> b!255933 (= lt!128368 (getCurrentListMapNoExtraKeys!566 lt!128192 (array!12472 (store (arr!5907 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6255 (_values!4703 thiss!1504))) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128366 () (_ BitVec 64))

(assert (=> b!255933 (= lt!128366 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128356 () (_ BitVec 64))

(assert (=> b!255933 (= lt!128356 (select (arr!5908 lt!128192) #b00000000000000000000000000000000))))

(assert (=> b!255933 (= lt!128373 (addApplyDifferent!226 lt!128368 lt!128366 (minValue!4561 thiss!1504) lt!128356))))

(assert (=> b!255933 (= (apply!250 (+!686 lt!128368 (tuple2!4855 lt!128366 (minValue!4561 thiss!1504))) lt!128356) (apply!250 lt!128368 lt!128356))))

(declare-fun lt!128354 () ListLongMap!3757)

(declare-fun e!165888 () Bool)

(declare-fun b!255934 () Bool)

(assert (=> b!255934 (= e!165888 (= (apply!250 lt!128354 (select (arr!5908 lt!128192) #b00000000000000000000000000000000)) (get!3035 (select (arr!5907 (array!12472 (store (arr!5907 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6255 (_values!4703 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!584 (defaultEntry!4720 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6255 (array!12472 (store (arr!5907 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6255 (_values!4703 thiss!1504))))))))

(assert (=> b!255934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6256 lt!128192)))))

(declare-fun b!255935 () Bool)

(declare-fun e!165893 () Bool)

(assert (=> b!255935 (= e!165893 (validKeyInArray!0 (select (arr!5908 lt!128192) #b00000000000000000000000000000000)))))

(declare-fun b!255936 () Bool)

(declare-fun call!24226 () Bool)

(assert (=> b!255936 (= e!165891 (not call!24226))))

(declare-fun d!61495 () Bool)

(assert (=> d!61495 e!165895))

(declare-fun res!125206 () Bool)

(assert (=> d!61495 (=> (not res!125206) (not e!165895))))

(assert (=> d!61495 (= res!125206 (or (bvsge #b00000000000000000000000000000000 (size!6256 lt!128192)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6256 lt!128192)))))))

(declare-fun lt!128370 () ListLongMap!3757)

(assert (=> d!61495 (= lt!128354 lt!128370)))

(declare-fun lt!128362 () Unit!7902)

(assert (=> d!61495 (= lt!128362 e!165899)))

(declare-fun c!43243 () Bool)

(assert (=> d!61495 (= c!43243 e!165893)))

(declare-fun res!125201 () Bool)

(assert (=> d!61495 (=> (not res!125201) (not e!165893))))

(assert (=> d!61495 (= res!125201 (bvslt #b00000000000000000000000000000000 (size!6256 lt!128192)))))

(declare-fun e!165890 () ListLongMap!3757)

(assert (=> d!61495 (= lt!128370 e!165890)))

(declare-fun c!43246 () Bool)

(assert (=> d!61495 (= c!43246 (and (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61495 (validMask!0 (mask!10985 thiss!1504))))

(assert (=> d!61495 (= (getCurrentListMap!1403 lt!128192 (array!12472 (store (arr!5907 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6255 (_values!4703 thiss!1504))) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)) lt!128354)))

(declare-fun bm!24221 () Bool)

(assert (=> bm!24221 (= call!24226 (contains!1835 lt!128354 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255937 () Bool)

(declare-fun e!165900 () ListLongMap!3757)

(assert (=> b!255937 (= e!165900 call!24224)))

(declare-fun b!255938 () Bool)

(declare-fun e!165898 () Bool)

(assert (=> b!255938 (= e!165891 e!165898)))

(declare-fun res!125202 () Bool)

(assert (=> b!255938 (= res!125202 call!24226)))

(assert (=> b!255938 (=> (not res!125202) (not e!165898))))

(declare-fun bm!24222 () Bool)

(assert (=> bm!24222 (= call!24223 (contains!1835 lt!128354 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255939 () Bool)

(declare-fun e!165894 () ListLongMap!3757)

(assert (=> b!255939 (= e!165890 e!165894)))

(declare-fun c!43247 () Bool)

(assert (=> b!255939 (= c!43247 (and (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255940 () Bool)

(declare-fun c!43248 () Bool)

(assert (=> b!255940 (= c!43248 (and (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!255940 (= e!165894 e!165900)))

(declare-fun b!255941 () Bool)

(assert (=> b!255941 (= e!165898 (= (apply!250 lt!128354 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4561 thiss!1504)))))

(declare-fun b!255942 () Bool)

(declare-fun call!24227 () ListLongMap!3757)

(assert (=> b!255942 (= e!165900 call!24227)))

(declare-fun bm!24223 () Bool)

(declare-fun call!24222 () ListLongMap!3757)

(assert (=> bm!24223 (= call!24227 call!24222)))

(declare-fun b!255943 () Bool)

(assert (=> b!255943 (= e!165890 (+!686 call!24222 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4561 thiss!1504))))))

(declare-fun b!255944 () Bool)

(declare-fun e!165897 () Bool)

(assert (=> b!255944 (= e!165897 e!165888)))

(declare-fun res!125203 () Bool)

(assert (=> b!255944 (=> (not res!125203) (not e!165888))))

(assert (=> b!255944 (= res!125203 (contains!1835 lt!128354 (select (arr!5908 lt!128192) #b00000000000000000000000000000000)))))

(assert (=> b!255944 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6256 lt!128192)))))

(declare-fun b!255945 () Bool)

(declare-fun res!125205 () Bool)

(assert (=> b!255945 (=> (not res!125205) (not e!165895))))

(assert (=> b!255945 (= res!125205 e!165897)))

(declare-fun res!125200 () Bool)

(assert (=> b!255945 (=> res!125200 e!165897)))

(declare-fun e!165896 () Bool)

(assert (=> b!255945 (= res!125200 (not e!165896))))

(declare-fun res!125199 () Bool)

(assert (=> b!255945 (=> (not res!125199) (not e!165896))))

(assert (=> b!255945 (= res!125199 (bvslt #b00000000000000000000000000000000 (size!6256 lt!128192)))))

(declare-fun b!255946 () Bool)

(declare-fun e!165889 () Bool)

(assert (=> b!255946 (= e!165892 e!165889)))

(declare-fun res!125198 () Bool)

(assert (=> b!255946 (= res!125198 call!24223)))

(assert (=> b!255946 (=> (not res!125198) (not e!165889))))

(declare-fun b!255947 () Bool)

(declare-fun Unit!7914 () Unit!7902)

(assert (=> b!255947 (= e!165899 Unit!7914)))

(declare-fun b!255948 () Bool)

(assert (=> b!255948 (= e!165894 call!24227)))

(declare-fun b!255949 () Bool)

(assert (=> b!255949 (= e!165889 (= (apply!250 lt!128354 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4561 thiss!1504)))))

(declare-fun bm!24224 () Bool)

(assert (=> bm!24224 (= call!24222 (+!686 (ite c!43246 call!24221 (ite c!43247 call!24225 call!24224)) (ite (or c!43246 c!43247) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4561 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4561 thiss!1504)))))))

(declare-fun b!255950 () Bool)

(assert (=> b!255950 (= e!165896 (validKeyInArray!0 (select (arr!5908 lt!128192) #b00000000000000000000000000000000)))))

(assert (= (and d!61495 c!43246) b!255943))

(assert (= (and d!61495 (not c!43246)) b!255939))

(assert (= (and b!255939 c!43247) b!255948))

(assert (= (and b!255939 (not c!43247)) b!255940))

(assert (= (and b!255940 c!43248) b!255942))

(assert (= (and b!255940 (not c!43248)) b!255937))

(assert (= (or b!255942 b!255937) bm!24218))

(assert (= (or b!255948 bm!24218) bm!24219))

(assert (= (or b!255948 b!255942) bm!24223))

(assert (= (or b!255943 bm!24219) bm!24220))

(assert (= (or b!255943 bm!24223) bm!24224))

(assert (= (and d!61495 res!125201) b!255935))

(assert (= (and d!61495 c!43243) b!255933))

(assert (= (and d!61495 (not c!43243)) b!255947))

(assert (= (and d!61495 res!125206) b!255945))

(assert (= (and b!255945 res!125199) b!255950))

(assert (= (and b!255945 (not res!125200)) b!255944))

(assert (= (and b!255944 res!125203) b!255934))

(assert (= (and b!255945 res!125205) b!255931))

(assert (= (and b!255931 c!43244) b!255938))

(assert (= (and b!255931 (not c!43244)) b!255936))

(assert (= (and b!255938 res!125202) b!255941))

(assert (= (or b!255938 b!255936) bm!24221))

(assert (= (and b!255931 res!125204) b!255932))

(assert (= (and b!255932 c!43245) b!255946))

(assert (= (and b!255932 (not c!43245)) b!255930))

(assert (= (and b!255946 res!125198) b!255949))

(assert (= (or b!255946 b!255930) bm!24222))

(declare-fun b_lambda!8139 () Bool)

(assert (=> (not b_lambda!8139) (not b!255934)))

(assert (=> b!255934 t!8806))

(declare-fun b_and!13745 () Bool)

(assert (= b_and!13743 (and (=> t!8806 result!5353) b_and!13745)))

(declare-fun m!270891 () Bool)

(assert (=> b!255933 m!270891))

(declare-fun m!270893 () Bool)

(assert (=> b!255933 m!270893))

(declare-fun m!270895 () Bool)

(assert (=> b!255933 m!270895))

(declare-fun m!270897 () Bool)

(assert (=> b!255933 m!270897))

(declare-fun m!270899 () Bool)

(assert (=> b!255933 m!270899))

(declare-fun m!270901 () Bool)

(assert (=> b!255933 m!270901))

(declare-fun m!270903 () Bool)

(assert (=> b!255933 m!270903))

(assert (=> b!255933 m!270901))

(assert (=> b!255933 m!270875))

(declare-fun m!270905 () Bool)

(assert (=> b!255933 m!270905))

(assert (=> b!255933 m!270897))

(declare-fun m!270907 () Bool)

(assert (=> b!255933 m!270907))

(declare-fun m!270909 () Bool)

(assert (=> b!255933 m!270909))

(declare-fun m!270911 () Bool)

(assert (=> b!255933 m!270911))

(declare-fun m!270913 () Bool)

(assert (=> b!255933 m!270913))

(assert (=> b!255933 m!270899))

(declare-fun m!270915 () Bool)

(assert (=> b!255933 m!270915))

(declare-fun m!270917 () Bool)

(assert (=> b!255933 m!270917))

(declare-fun m!270919 () Bool)

(assert (=> b!255933 m!270919))

(assert (=> b!255933 m!270891))

(declare-fun m!270921 () Bool)

(assert (=> b!255933 m!270921))

(declare-fun m!270923 () Bool)

(assert (=> bm!24222 m!270923))

(declare-fun m!270925 () Bool)

(assert (=> b!255943 m!270925))

(assert (=> d!61495 m!270837))

(declare-fun m!270927 () Bool)

(assert (=> bm!24224 m!270927))

(assert (=> bm!24220 m!270895))

(declare-fun m!270929 () Bool)

(assert (=> b!255949 m!270929))

(assert (=> b!255935 m!270875))

(assert (=> b!255935 m!270875))

(assert (=> b!255935 m!270879))

(assert (=> b!255950 m!270875))

(assert (=> b!255950 m!270875))

(assert (=> b!255950 m!270879))

(assert (=> b!255944 m!270875))

(assert (=> b!255944 m!270875))

(declare-fun m!270931 () Bool)

(assert (=> b!255944 m!270931))

(assert (=> b!255934 m!270875))

(assert (=> b!255934 m!270847))

(declare-fun m!270933 () Bool)

(assert (=> b!255934 m!270933))

(assert (=> b!255934 m!270847))

(declare-fun m!270935 () Bool)

(assert (=> b!255934 m!270935))

(assert (=> b!255934 m!270875))

(declare-fun m!270937 () Bool)

(assert (=> b!255934 m!270937))

(assert (=> b!255934 m!270933))

(declare-fun m!270939 () Bool)

(assert (=> b!255941 m!270939))

(declare-fun m!270941 () Bool)

(assert (=> bm!24221 m!270941))

(assert (=> b!255680 d!61495))

(declare-fun b!255951 () Bool)

(declare-fun e!165901 () (_ BitVec 32))

(declare-fun call!24228 () (_ BitVec 32))

(assert (=> b!255951 (= e!165901 (bvadd #b00000000000000000000000000000001 call!24228))))

(declare-fun b!255952 () Bool)

(declare-fun e!165902 () (_ BitVec 32))

(assert (=> b!255952 (= e!165902 e!165901)))

(declare-fun c!43249 () Bool)

(assert (=> b!255952 (= c!43249 (validKeyInArray!0 (select (arr!5908 lt!128192) #b00000000000000000000000000000000)))))

(declare-fun d!61497 () Bool)

(declare-fun lt!128376 () (_ BitVec 32))

(assert (=> d!61497 (and (bvsge lt!128376 #b00000000000000000000000000000000) (bvsle lt!128376 (bvsub (size!6256 lt!128192) #b00000000000000000000000000000000)))))

(assert (=> d!61497 (= lt!128376 e!165902)))

(declare-fun c!43250 () Bool)

(assert (=> d!61497 (= c!43250 (bvsge #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))))))

(assert (=> d!61497 (and (bvsle #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6256 (_keys!6879 thiss!1504)) (size!6256 lt!128192)))))

(assert (=> d!61497 (= (arrayCountValidKeys!0 lt!128192 #b00000000000000000000000000000000 (size!6256 (_keys!6879 thiss!1504))) lt!128376)))

(declare-fun b!255953 () Bool)

(assert (=> b!255953 (= e!165901 call!24228)))

(declare-fun bm!24225 () Bool)

(assert (=> bm!24225 (= call!24228 (arrayCountValidKeys!0 lt!128192 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6256 (_keys!6879 thiss!1504))))))

(declare-fun b!255954 () Bool)

(assert (=> b!255954 (= e!165902 #b00000000000000000000000000000000)))

(assert (= (and d!61497 c!43250) b!255954))

(assert (= (and d!61497 (not c!43250)) b!255952))

(assert (= (and b!255952 c!43249) b!255951))

(assert (= (and b!255952 (not c!43249)) b!255953))

(assert (= (or b!255951 b!255953) bm!24225))

(assert (=> b!255952 m!270875))

(assert (=> b!255952 m!270875))

(assert (=> b!255952 m!270879))

(declare-fun m!270943 () Bool)

(assert (=> bm!24225 m!270943))

(assert (=> b!255680 d!61497))

(declare-fun d!61499 () Bool)

(declare-fun e!165905 () Bool)

(assert (=> d!61499 e!165905))

(declare-fun res!125212 () Bool)

(assert (=> d!61499 (=> (not res!125212) (not e!165905))))

(declare-fun lt!128385 () ListLongMap!3757)

(assert (=> d!61499 (= res!125212 (contains!1835 lt!128385 (_1!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun lt!128387 () List!3757)

(assert (=> d!61499 (= lt!128385 (ListLongMap!3758 lt!128387))))

(declare-fun lt!128386 () Unit!7902)

(declare-fun lt!128388 () Unit!7902)

(assert (=> d!61499 (= lt!128386 lt!128388)))

(assert (=> d!61499 (= (getValueByKey!306 lt!128387 (_1!2438 (tuple2!4855 key!932 v!346))) (Some!311 (_2!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!165 (List!3757 (_ BitVec 64) V!8409) Unit!7902)

(assert (=> d!61499 (= lt!128388 (lemmaContainsTupThenGetReturnValue!165 lt!128387 (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun insertStrictlySorted!168 (List!3757 (_ BitVec 64) V!8409) List!3757)

(assert (=> d!61499 (= lt!128387 (insertStrictlySorted!168 (toList!1894 lt!128191) (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346))))))

(assert (=> d!61499 (= (+!686 lt!128191 (tuple2!4855 key!932 v!346)) lt!128385)))

(declare-fun b!255959 () Bool)

(declare-fun res!125211 () Bool)

(assert (=> b!255959 (=> (not res!125211) (not e!165905))))

(assert (=> b!255959 (= res!125211 (= (getValueByKey!306 (toList!1894 lt!128385) (_1!2438 (tuple2!4855 key!932 v!346))) (Some!311 (_2!2438 (tuple2!4855 key!932 v!346)))))))

(declare-fun b!255960 () Bool)

(declare-fun contains!1837 (List!3757 tuple2!4854) Bool)

(assert (=> b!255960 (= e!165905 (contains!1837 (toList!1894 lt!128385) (tuple2!4855 key!932 v!346)))))

(assert (= (and d!61499 res!125212) b!255959))

(assert (= (and b!255959 res!125211) b!255960))

(declare-fun m!270945 () Bool)

(assert (=> d!61499 m!270945))

(declare-fun m!270947 () Bool)

(assert (=> d!61499 m!270947))

(declare-fun m!270949 () Bool)

(assert (=> d!61499 m!270949))

(declare-fun m!270951 () Bool)

(assert (=> d!61499 m!270951))

(declare-fun m!270953 () Bool)

(assert (=> b!255959 m!270953))

(declare-fun m!270955 () Bool)

(assert (=> b!255960 m!270955))

(assert (=> b!255680 d!61499))

(declare-fun b!255969 () Bool)

(declare-fun e!165914 () Bool)

(declare-fun call!24231 () Bool)

(assert (=> b!255969 (= e!165914 call!24231)))

(declare-fun bm!24228 () Bool)

(assert (=> bm!24228 (= call!24231 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!128192 (mask!10985 thiss!1504)))))

(declare-fun b!255970 () Bool)

(declare-fun e!165913 () Bool)

(assert (=> b!255970 (= e!165913 call!24231)))

(declare-fun b!255971 () Bool)

(assert (=> b!255971 (= e!165914 e!165913)))

(declare-fun lt!128395 () (_ BitVec 64))

(assert (=> b!255971 (= lt!128395 (select (arr!5908 lt!128192) #b00000000000000000000000000000000))))

(declare-fun lt!128396 () Unit!7902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12473 (_ BitVec 64) (_ BitVec 32)) Unit!7902)

(assert (=> b!255971 (= lt!128396 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128192 lt!128395 #b00000000000000000000000000000000))))

(assert (=> b!255971 (arrayContainsKey!0 lt!128192 lt!128395 #b00000000000000000000000000000000)))

(declare-fun lt!128397 () Unit!7902)

(assert (=> b!255971 (= lt!128397 lt!128396)))

(declare-fun res!125217 () Bool)

(assert (=> b!255971 (= res!125217 (= (seekEntryOrOpen!0 (select (arr!5908 lt!128192) #b00000000000000000000000000000000) lt!128192 (mask!10985 thiss!1504)) (Found!1157 #b00000000000000000000000000000000)))))

(assert (=> b!255971 (=> (not res!125217) (not e!165913))))

(declare-fun d!61501 () Bool)

(declare-fun res!125218 () Bool)

(declare-fun e!165912 () Bool)

(assert (=> d!61501 (=> res!125218 e!165912)))

(assert (=> d!61501 (= res!125218 (bvsge #b00000000000000000000000000000000 (size!6256 lt!128192)))))

(assert (=> d!61501 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128192 (mask!10985 thiss!1504)) e!165912)))

(declare-fun b!255972 () Bool)

(assert (=> b!255972 (= e!165912 e!165914)))

(declare-fun c!43253 () Bool)

(assert (=> b!255972 (= c!43253 (validKeyInArray!0 (select (arr!5908 lt!128192) #b00000000000000000000000000000000)))))

(assert (= (and d!61501 (not res!125218)) b!255972))

(assert (= (and b!255972 c!43253) b!255971))

(assert (= (and b!255972 (not c!43253)) b!255969))

(assert (= (and b!255971 res!125217) b!255970))

(assert (= (or b!255970 b!255969) bm!24228))

(declare-fun m!270957 () Bool)

(assert (=> bm!24228 m!270957))

(assert (=> b!255971 m!270875))

(declare-fun m!270959 () Bool)

(assert (=> b!255971 m!270959))

(declare-fun m!270961 () Bool)

(assert (=> b!255971 m!270961))

(assert (=> b!255971 m!270875))

(declare-fun m!270963 () Bool)

(assert (=> b!255971 m!270963))

(assert (=> b!255972 m!270875))

(assert (=> b!255972 m!270875))

(assert (=> b!255972 m!270879))

(assert (=> b!255680 d!61501))

(declare-fun d!61503 () Bool)

(declare-fun e!165917 () Bool)

(assert (=> d!61503 e!165917))

(declare-fun res!125221 () Bool)

(assert (=> d!61503 (=> (not res!125221) (not e!165917))))

(assert (=> d!61503 (= res!125221 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6256 (_keys!6879 thiss!1504)))))))

(declare-fun lt!128400 () Unit!7902)

(declare-fun choose!41 (array!12473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3758) Unit!7902)

(assert (=> d!61503 (= lt!128400 (choose!41 (_keys!6879 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3755))))

(assert (=> d!61503 (bvslt (size!6256 (_keys!6879 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61503 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6879 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3755) lt!128400)))

(declare-fun b!255975 () Bool)

(assert (=> b!255975 (= e!165917 (arrayNoDuplicates!0 (array!12474 (store (arr!5908 (_keys!6879 thiss!1504)) index!297 key!932) (size!6256 (_keys!6879 thiss!1504))) #b00000000000000000000000000000000 Nil!3755))))

(assert (= (and d!61503 res!125221) b!255975))

(declare-fun m!270965 () Bool)

(assert (=> d!61503 m!270965))

(assert (=> b!255975 m!270671))

(declare-fun m!270967 () Bool)

(assert (=> b!255975 m!270967))

(assert (=> b!255680 d!61503))

(declare-fun d!61505 () Bool)

(declare-fun res!125226 () Bool)

(declare-fun e!165922 () Bool)

(assert (=> d!61505 (=> res!125226 e!165922)))

(assert (=> d!61505 (= res!125226 (= (select (arr!5908 (_keys!6879 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61505 (= (arrayContainsKey!0 (_keys!6879 thiss!1504) key!932 #b00000000000000000000000000000000) e!165922)))

(declare-fun b!255980 () Bool)

(declare-fun e!165923 () Bool)

(assert (=> b!255980 (= e!165922 e!165923)))

(declare-fun res!125227 () Bool)

(assert (=> b!255980 (=> (not res!125227) (not e!165923))))

(assert (=> b!255980 (= res!125227 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6256 (_keys!6879 thiss!1504))))))

(declare-fun b!255981 () Bool)

(assert (=> b!255981 (= e!165923 (arrayContainsKey!0 (_keys!6879 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61505 (not res!125226)) b!255980))

(assert (= (and b!255980 res!125227) b!255981))

(assert (=> d!61505 m!270813))

(declare-fun m!270969 () Bool)

(assert (=> b!255981 m!270969))

(assert (=> b!255680 d!61505))

(declare-fun d!61507 () Bool)

(declare-fun e!165926 () Bool)

(assert (=> d!61507 e!165926))

(declare-fun res!125230 () Bool)

(assert (=> d!61507 (=> (not res!125230) (not e!165926))))

(assert (=> d!61507 (= res!125230 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6256 (_keys!6879 thiss!1504)))))))

(declare-fun lt!128403 () Unit!7902)

(declare-fun choose!102 ((_ BitVec 64) array!12473 (_ BitVec 32) (_ BitVec 32)) Unit!7902)

(assert (=> d!61507 (= lt!128403 (choose!102 key!932 (_keys!6879 thiss!1504) index!297 (mask!10985 thiss!1504)))))

(assert (=> d!61507 (validMask!0 (mask!10985 thiss!1504))))

(assert (=> d!61507 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6879 thiss!1504) index!297 (mask!10985 thiss!1504)) lt!128403)))

(declare-fun b!255984 () Bool)

(assert (=> b!255984 (= e!165926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12474 (store (arr!5908 (_keys!6879 thiss!1504)) index!297 key!932) (size!6256 (_keys!6879 thiss!1504))) (mask!10985 thiss!1504)))))

(assert (= (and d!61507 res!125230) b!255984))

(declare-fun m!270971 () Bool)

(assert (=> d!61507 m!270971))

(assert (=> d!61507 m!270837))

(assert (=> b!255984 m!270671))

(declare-fun m!270973 () Bool)

(assert (=> b!255984 m!270973))

(assert (=> b!255680 d!61507))

(assert (=> bm!24177 d!61505))

(declare-fun d!61509 () Bool)

(assert (=> d!61509 (contains!1835 (getCurrentListMap!1403 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)) key!932)))

(declare-fun lt!128406 () Unit!7902)

(declare-fun choose!1232 (array!12473 array!12471 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) (_ BitVec 32) Int) Unit!7902)

(assert (=> d!61509 (= lt!128406 (choose!1232 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(assert (=> d!61509 (validMask!0 (mask!10985 thiss!1504))))

(assert (=> d!61509 (= (lemmaArrayContainsKeyThenInListMap!234 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)) lt!128406)))

(declare-fun bs!9042 () Bool)

(assert (= bs!9042 d!61509))

(assert (=> bs!9042 m!270639))

(assert (=> bs!9042 m!270639))

(declare-fun m!270975 () Bool)

(assert (=> bs!9042 m!270975))

(declare-fun m!270977 () Bool)

(assert (=> bs!9042 m!270977))

(assert (=> bs!9042 m!270837))

(assert (=> b!255671 d!61509))

(declare-fun d!61511 () Bool)

(assert (=> d!61511 (= (inRange!0 (ite c!43188 (index!6798 lt!128184) (index!6801 lt!128184)) (mask!10985 thiss!1504)) (and (bvsge (ite c!43188 (index!6798 lt!128184) (index!6801 lt!128184)) #b00000000000000000000000000000000) (bvslt (ite c!43188 (index!6798 lt!128184) (index!6801 lt!128184)) (bvadd (mask!10985 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24178 d!61511))

(declare-fun d!61513 () Bool)

(declare-fun e!165929 () Bool)

(assert (=> d!61513 e!165929))

(declare-fun res!125236 () Bool)

(assert (=> d!61513 (=> (not res!125236) (not e!165929))))

(declare-fun lt!128412 () SeekEntryResult!1157)

(assert (=> d!61513 (= res!125236 ((_ is Found!1157) lt!128412))))

(assert (=> d!61513 (= lt!128412 (seekEntryOrOpen!0 key!932 (_keys!6879 thiss!1504) (mask!10985 thiss!1504)))))

(declare-fun lt!128411 () Unit!7902)

(declare-fun choose!1233 (array!12473 array!12471 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) Int) Unit!7902)

(assert (=> d!61513 (= lt!128411 (choose!1233 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)))))

(assert (=> d!61513 (validMask!0 (mask!10985 thiss!1504))))

(assert (=> d!61513 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!424 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)) lt!128411)))

(declare-fun b!255989 () Bool)

(declare-fun res!125235 () Bool)

(assert (=> b!255989 (=> (not res!125235) (not e!165929))))

(assert (=> b!255989 (= res!125235 (inRange!0 (index!6799 lt!128412) (mask!10985 thiss!1504)))))

(declare-fun b!255990 () Bool)

(assert (=> b!255990 (= e!165929 (= (select (arr!5908 (_keys!6879 thiss!1504)) (index!6799 lt!128412)) key!932))))

(assert (=> b!255990 (and (bvsge (index!6799 lt!128412) #b00000000000000000000000000000000) (bvslt (index!6799 lt!128412) (size!6256 (_keys!6879 thiss!1504))))))

(assert (= (and d!61513 res!125236) b!255989))

(assert (= (and b!255989 res!125235) b!255990))

(assert (=> d!61513 m!270655))

(declare-fun m!270979 () Bool)

(assert (=> d!61513 m!270979))

(assert (=> d!61513 m!270837))

(declare-fun m!270981 () Bool)

(assert (=> b!255989 m!270981))

(declare-fun m!270983 () Bool)

(assert (=> b!255990 m!270983))

(assert (=> b!255670 d!61513))

(declare-fun e!165937 () SeekEntryResult!1157)

(declare-fun lt!128421 () SeekEntryResult!1157)

(declare-fun b!256003 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12473 (_ BitVec 32)) SeekEntryResult!1157)

(assert (=> b!256003 (= e!165937 (seekKeyOrZeroReturnVacant!0 (x!24934 lt!128421) (index!6800 lt!128421) (index!6800 lt!128421) key!932 (_keys!6879 thiss!1504) (mask!10985 thiss!1504)))))

(declare-fun b!256004 () Bool)

(declare-fun e!165936 () SeekEntryResult!1157)

(assert (=> b!256004 (= e!165936 Undefined!1157)))

(declare-fun b!256005 () Bool)

(declare-fun e!165938 () SeekEntryResult!1157)

(assert (=> b!256005 (= e!165938 (Found!1157 (index!6800 lt!128421)))))

(declare-fun d!61515 () Bool)

(declare-fun lt!128420 () SeekEntryResult!1157)

(assert (=> d!61515 (and (or ((_ is Undefined!1157) lt!128420) (not ((_ is Found!1157) lt!128420)) (and (bvsge (index!6799 lt!128420) #b00000000000000000000000000000000) (bvslt (index!6799 lt!128420) (size!6256 (_keys!6879 thiss!1504))))) (or ((_ is Undefined!1157) lt!128420) ((_ is Found!1157) lt!128420) (not ((_ is MissingZero!1157) lt!128420)) (and (bvsge (index!6798 lt!128420) #b00000000000000000000000000000000) (bvslt (index!6798 lt!128420) (size!6256 (_keys!6879 thiss!1504))))) (or ((_ is Undefined!1157) lt!128420) ((_ is Found!1157) lt!128420) ((_ is MissingZero!1157) lt!128420) (not ((_ is MissingVacant!1157) lt!128420)) (and (bvsge (index!6801 lt!128420) #b00000000000000000000000000000000) (bvslt (index!6801 lt!128420) (size!6256 (_keys!6879 thiss!1504))))) (or ((_ is Undefined!1157) lt!128420) (ite ((_ is Found!1157) lt!128420) (= (select (arr!5908 (_keys!6879 thiss!1504)) (index!6799 lt!128420)) key!932) (ite ((_ is MissingZero!1157) lt!128420) (= (select (arr!5908 (_keys!6879 thiss!1504)) (index!6798 lt!128420)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1157) lt!128420) (= (select (arr!5908 (_keys!6879 thiss!1504)) (index!6801 lt!128420)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61515 (= lt!128420 e!165936)))

(declare-fun c!43261 () Bool)

(assert (=> d!61515 (= c!43261 (and ((_ is Intermediate!1157) lt!128421) (undefined!1969 lt!128421)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12473 (_ BitVec 32)) SeekEntryResult!1157)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61515 (= lt!128421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10985 thiss!1504)) key!932 (_keys!6879 thiss!1504) (mask!10985 thiss!1504)))))

(assert (=> d!61515 (validMask!0 (mask!10985 thiss!1504))))

(assert (=> d!61515 (= (seekEntryOrOpen!0 key!932 (_keys!6879 thiss!1504) (mask!10985 thiss!1504)) lt!128420)))

(declare-fun b!256006 () Bool)

(declare-fun c!43262 () Bool)

(declare-fun lt!128419 () (_ BitVec 64))

(assert (=> b!256006 (= c!43262 (= lt!128419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256006 (= e!165938 e!165937)))

(declare-fun b!256007 () Bool)

(assert (=> b!256007 (= e!165937 (MissingZero!1157 (index!6800 lt!128421)))))

(declare-fun b!256008 () Bool)

(assert (=> b!256008 (= e!165936 e!165938)))

(assert (=> b!256008 (= lt!128419 (select (arr!5908 (_keys!6879 thiss!1504)) (index!6800 lt!128421)))))

(declare-fun c!43260 () Bool)

(assert (=> b!256008 (= c!43260 (= lt!128419 key!932))))

(assert (= (and d!61515 c!43261) b!256004))

(assert (= (and d!61515 (not c!43261)) b!256008))

(assert (= (and b!256008 c!43260) b!256005))

(assert (= (and b!256008 (not c!43260)) b!256006))

(assert (= (and b!256006 c!43262) b!256007))

(assert (= (and b!256006 (not c!43262)) b!256003))

(declare-fun m!270985 () Bool)

(assert (=> b!256003 m!270985))

(declare-fun m!270987 () Bool)

(assert (=> d!61515 m!270987))

(declare-fun m!270989 () Bool)

(assert (=> d!61515 m!270989))

(declare-fun m!270991 () Bool)

(assert (=> d!61515 m!270991))

(assert (=> d!61515 m!270837))

(assert (=> d!61515 m!270991))

(declare-fun m!270993 () Bool)

(assert (=> d!61515 m!270993))

(declare-fun m!270995 () Bool)

(assert (=> d!61515 m!270995))

(declare-fun m!270997 () Bool)

(assert (=> b!256008 m!270997))

(assert (=> b!255684 d!61515))

(declare-fun bm!24233 () Bool)

(declare-fun call!24237 () Bool)

(assert (=> bm!24233 (= call!24237 (arrayContainsKey!0 (_keys!6879 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256026 () Bool)

(declare-fun e!165949 () Bool)

(declare-fun lt!128427 () SeekEntryResult!1157)

(assert (=> b!256026 (= e!165949 ((_ is Undefined!1157) lt!128427))))

(declare-fun b!256027 () Bool)

(declare-fun e!165947 () Bool)

(assert (=> b!256027 (= e!165947 (not call!24237))))

(declare-fun b!256028 () Bool)

(assert (=> b!256028 (and (bvsge (index!6798 lt!128427) #b00000000000000000000000000000000) (bvslt (index!6798 lt!128427) (size!6256 (_keys!6879 thiss!1504))))))

(declare-fun res!125247 () Bool)

(assert (=> b!256028 (= res!125247 (= (select (arr!5908 (_keys!6879 thiss!1504)) (index!6798 lt!128427)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165948 () Bool)

(assert (=> b!256028 (=> (not res!125247) (not e!165948))))

(declare-fun bm!24234 () Bool)

(declare-fun c!43267 () Bool)

(declare-fun call!24236 () Bool)

(assert (=> bm!24234 (= call!24236 (inRange!0 (ite c!43267 (index!6798 lt!128427) (index!6801 lt!128427)) (mask!10985 thiss!1504)))))

(declare-fun d!61517 () Bool)

(declare-fun e!165950 () Bool)

(assert (=> d!61517 e!165950))

(assert (=> d!61517 (= c!43267 ((_ is MissingZero!1157) lt!128427))))

(assert (=> d!61517 (= lt!128427 (seekEntryOrOpen!0 key!932 (_keys!6879 thiss!1504) (mask!10985 thiss!1504)))))

(declare-fun lt!128426 () Unit!7902)

(declare-fun choose!1234 (array!12473 array!12471 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) Int) Unit!7902)

(assert (=> d!61517 (= lt!128426 (choose!1234 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)))))

(assert (=> d!61517 (validMask!0 (mask!10985 thiss!1504))))

(assert (=> d!61517 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!423 (_keys!6879 thiss!1504) (_values!4703 thiss!1504) (mask!10985 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)) lt!128426)))

(declare-fun b!256025 () Bool)

(assert (=> b!256025 (= e!165950 e!165949)))

(declare-fun c!43268 () Bool)

(assert (=> b!256025 (= c!43268 ((_ is MissingVacant!1157) lt!128427))))

(declare-fun b!256029 () Bool)

(assert (=> b!256029 (= e!165950 e!165948)))

(declare-fun res!125245 () Bool)

(assert (=> b!256029 (= res!125245 call!24236)))

(assert (=> b!256029 (=> (not res!125245) (not e!165948))))

(declare-fun b!256030 () Bool)

(assert (=> b!256030 (= e!165948 (not call!24237))))

(declare-fun b!256031 () Bool)

(declare-fun res!125248 () Bool)

(assert (=> b!256031 (=> (not res!125248) (not e!165947))))

(assert (=> b!256031 (= res!125248 (= (select (arr!5908 (_keys!6879 thiss!1504)) (index!6801 lt!128427)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256031 (and (bvsge (index!6801 lt!128427) #b00000000000000000000000000000000) (bvslt (index!6801 lt!128427) (size!6256 (_keys!6879 thiss!1504))))))

(declare-fun b!256032 () Bool)

(declare-fun res!125246 () Bool)

(assert (=> b!256032 (=> (not res!125246) (not e!165947))))

(assert (=> b!256032 (= res!125246 call!24236)))

(assert (=> b!256032 (= e!165949 e!165947)))

(assert (= (and d!61517 c!43267) b!256029))

(assert (= (and d!61517 (not c!43267)) b!256025))

(assert (= (and b!256029 res!125245) b!256028))

(assert (= (and b!256028 res!125247) b!256030))

(assert (= (and b!256025 c!43268) b!256032))

(assert (= (and b!256025 (not c!43268)) b!256026))

(assert (= (and b!256032 res!125246) b!256031))

(assert (= (and b!256031 res!125248) b!256027))

(assert (= (or b!256029 b!256032) bm!24234))

(assert (= (or b!256030 b!256027) bm!24233))

(declare-fun m!270999 () Bool)

(assert (=> b!256031 m!270999))

(assert (=> d!61517 m!270655))

(declare-fun m!271001 () Bool)

(assert (=> d!61517 m!271001))

(assert (=> d!61517 m!270837))

(declare-fun m!271003 () Bool)

(assert (=> b!256028 m!271003))

(declare-fun m!271005 () Bool)

(assert (=> bm!24234 m!271005))

(assert (=> bm!24233 m!270631))

(assert (=> b!255672 d!61517))

(declare-fun b!256039 () Bool)

(declare-fun e!165956 () Bool)

(assert (=> b!256039 (= e!165956 tp_is_empty!6571)))

(declare-fun condMapEmpty!11190 () Bool)

(declare-fun mapDefault!11190 () ValueCell!2942)

(assert (=> mapNonEmpty!11181 (= condMapEmpty!11190 (= mapRest!11181 ((as const (Array (_ BitVec 32) ValueCell!2942)) mapDefault!11190)))))

(declare-fun e!165955 () Bool)

(declare-fun mapRes!11190 () Bool)

(assert (=> mapNonEmpty!11181 (= tp!23424 (and e!165955 mapRes!11190))))

(declare-fun b!256040 () Bool)

(assert (=> b!256040 (= e!165955 tp_is_empty!6571)))

(declare-fun mapIsEmpty!11190 () Bool)

(assert (=> mapIsEmpty!11190 mapRes!11190))

(declare-fun mapNonEmpty!11190 () Bool)

(declare-fun tp!23439 () Bool)

(assert (=> mapNonEmpty!11190 (= mapRes!11190 (and tp!23439 e!165956))))

(declare-fun mapKey!11190 () (_ BitVec 32))

(declare-fun mapRest!11190 () (Array (_ BitVec 32) ValueCell!2942))

(declare-fun mapValue!11190 () ValueCell!2942)

(assert (=> mapNonEmpty!11190 (= mapRest!11181 (store mapRest!11190 mapKey!11190 mapValue!11190))))

(assert (= (and mapNonEmpty!11181 condMapEmpty!11190) mapIsEmpty!11190))

(assert (= (and mapNonEmpty!11181 (not condMapEmpty!11190)) mapNonEmpty!11190))

(assert (= (and mapNonEmpty!11190 ((_ is ValueCellFull!2942) mapValue!11190)) b!256039))

(assert (= (and mapNonEmpty!11181 ((_ is ValueCellFull!2942) mapDefault!11190)) b!256040))

(declare-fun m!271007 () Bool)

(assert (=> mapNonEmpty!11190 m!271007))

(declare-fun b_lambda!8141 () Bool)

(assert (= b_lambda!8139 (or (and b!255678 b_free!6709) b_lambda!8141)))

(declare-fun b_lambda!8143 () Bool)

(assert (= b_lambda!8137 (or (and b!255678 b_free!6709) b_lambda!8143)))

(check-sat (not bm!24228) (not b!255960) (not b!255933) (not b!255899) (not b!255896) (not b!255861) (not b!255885) (not bm!24217) (not mapNonEmpty!11190) (not d!61477) (not b!255941) (not b!255943) (not b!255897) (not b!255886) (not b_lambda!8141) (not d!61503) (not d!61499) b_and!13745 (not b!255859) (not bm!24224) (not bm!24225) (not b!255975) (not d!61485) (not d!61507) (not b_lambda!8143) (not b!255959) (not b!255929) (not b!255944) (not bm!24214) (not bm!24208) (not b!255949) tp_is_empty!6571 (not b!255887) (not bm!24220) (not d!61479) (not b!255924) (not b!255876) (not d!61517) (not b!255971) (not b_next!6709) (not d!61509) (not bm!24207) (not b!255952) (not b!255811) (not b!255913) (not b!255984) (not d!61487) (not bm!24233) (not b!255972) (not b!255813) (not b!255870) (not b!255935) (not b!255950) (not b!255934) (not b!255860) (not d!61515) (not bm!24234) (not d!61513) (not b!255989) (not bm!24211) (not b!255867) (not b!255875) (not d!61493) (not b!255912) (not b!255869) (not b!255911) (not b!255981) (not b!256003) (not bm!24222) (not d!61495) (not bm!24221) (not bm!24209))
(check-sat b_and!13745 (not b_next!6709))
