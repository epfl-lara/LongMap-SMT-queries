; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24184 () Bool)

(assert start!24184)

(declare-fun b!252867 () Bool)

(declare-fun b_free!6655 () Bool)

(declare-fun b_next!6655 () Bool)

(assert (=> b!252867 (= b_free!6655 (not b_next!6655))))

(declare-fun tp!23246 () Bool)

(declare-fun b_and!13707 () Bool)

(assert (=> b!252867 (= tp!23246 b_and!13707)))

(declare-fun b!252866 () Bool)

(declare-fun c!42631 () Bool)

(declare-datatypes ((SeekEntryResult!1100 0))(
  ( (MissingZero!1100 (index!6570 (_ BitVec 32))) (Found!1100 (index!6571 (_ BitVec 32))) (Intermediate!1100 (undefined!1912 Bool) (index!6572 (_ BitVec 32)) (x!24756 (_ BitVec 32))) (Undefined!1100) (MissingVacant!1100 (index!6573 (_ BitVec 32))) )
))
(declare-fun lt!126792 () SeekEntryResult!1100)

(get-info :version)

(assert (=> b!252866 (= c!42631 ((_ is MissingVacant!1100) lt!126792))))

(declare-fun e!163961 () Bool)

(declare-fun e!163960 () Bool)

(assert (=> b!252866 (= e!163961 e!163960)))

(declare-fun e!163968 () Bool)

(declare-datatypes ((V!8337 0))(
  ( (V!8338 (val!3303 Int)) )
))
(declare-datatypes ((ValueCell!2915 0))(
  ( (ValueCellFull!2915 (v!5376 V!8337)) (EmptyCell!2915) )
))
(declare-datatypes ((array!12359 0))(
  ( (array!12360 (arr!5857 (Array (_ BitVec 32) ValueCell!2915)) (size!6204 (_ BitVec 32))) )
))
(declare-datatypes ((array!12361 0))(
  ( (array!12362 (arr!5858 (Array (_ BitVec 32) (_ BitVec 64))) (size!6205 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3730 0))(
  ( (LongMapFixedSize!3731 (defaultEntry!4670 Int) (mask!10896 (_ BitVec 32)) (extraKeys!4407 (_ BitVec 32)) (zeroValue!4511 V!8337) (minValue!4511 V!8337) (_size!1914 (_ BitVec 32)) (_keys!6820 array!12361) (_values!4653 array!12359) (_vacant!1914 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3730)

(declare-fun tp_is_empty!6517 () Bool)

(declare-fun e!163972 () Bool)

(declare-fun array_inv!3849 (array!12361) Bool)

(declare-fun array_inv!3850 (array!12359) Bool)

(assert (=> b!252867 (= e!163972 (and tp!23246 tp_is_empty!6517 (array_inv!3849 (_keys!6820 thiss!1504)) (array_inv!3850 (_values!4653 thiss!1504)) e!163968))))

(declare-fun b!252868 () Bool)

(declare-fun res!123772 () Bool)

(declare-fun e!163965 () Bool)

(assert (=> b!252868 (=> (not res!123772) (not e!163965))))

(declare-fun call!23820 () Bool)

(assert (=> b!252868 (= res!123772 call!23820)))

(assert (=> b!252868 (= e!163961 e!163965)))

(declare-fun res!123779 () Bool)

(declare-fun e!163962 () Bool)

(assert (=> start!24184 (=> (not res!123779) (not e!163962))))

(declare-fun valid!1465 (LongMapFixedSize!3730) Bool)

(assert (=> start!24184 (= res!123779 (valid!1465 thiss!1504))))

(assert (=> start!24184 e!163962))

(assert (=> start!24184 e!163972))

(assert (=> start!24184 true))

(declare-fun b!252869 () Bool)

(declare-fun e!163964 () Bool)

(declare-fun call!23821 () Bool)

(assert (=> b!252869 (= e!163964 (not call!23821))))

(declare-fun b!252870 () Bool)

(declare-fun res!123771 () Bool)

(declare-fun e!163963 () Bool)

(assert (=> b!252870 (=> res!123771 e!163963)))

(declare-datatypes ((List!3658 0))(
  ( (Nil!3655) (Cons!3654 (h!4316 (_ BitVec 64)) (t!8693 List!3658)) )
))
(declare-fun arrayNoDuplicates!0 (array!12361 (_ BitVec 32) List!3658) Bool)

(assert (=> b!252870 (= res!123771 (not (arrayNoDuplicates!0 (_keys!6820 thiss!1504) #b00000000000000000000000000000000 Nil!3655)))))

(declare-fun b!252871 () Bool)

(declare-fun e!163958 () Bool)

(assert (=> b!252871 (= e!163962 e!163958)))

(declare-fun res!123776 () Bool)

(assert (=> b!252871 (=> (not res!123776) (not e!163958))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!252871 (= res!123776 (or (= lt!126792 (MissingZero!1100 index!297)) (= lt!126792 (MissingVacant!1100 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12361 (_ BitVec 32)) SeekEntryResult!1100)

(assert (=> b!252871 (= lt!126792 (seekEntryOrOpen!0 key!932 (_keys!6820 thiss!1504) (mask!10896 thiss!1504)))))

(declare-fun b!252872 () Bool)

(declare-fun e!163969 () Bool)

(assert (=> b!252872 (= e!163958 e!163969)))

(declare-fun res!123774 () Bool)

(assert (=> b!252872 (=> (not res!123774) (not e!163969))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252872 (= res!123774 (inRange!0 index!297 (mask!10896 thiss!1504)))))

(declare-datatypes ((Unit!7793 0))(
  ( (Unit!7794) )
))
(declare-fun lt!126793 () Unit!7793)

(declare-fun e!163967 () Unit!7793)

(assert (=> b!252872 (= lt!126793 e!163967)))

(declare-fun c!42628 () Bool)

(declare-datatypes ((tuple2!4780 0))(
  ( (tuple2!4781 (_1!2401 (_ BitVec 64)) (_2!2401 V!8337)) )
))
(declare-datatypes ((List!3659 0))(
  ( (Nil!3656) (Cons!3655 (h!4317 tuple2!4780) (t!8694 List!3659)) )
))
(declare-datatypes ((ListLongMap!3695 0))(
  ( (ListLongMap!3696 (toList!1863 List!3659)) )
))
(declare-fun contains!1807 (ListLongMap!3695 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1395 (array!12361 array!12359 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 32) Int) ListLongMap!3695)

(assert (=> b!252872 (= c!42628 (contains!1807 (getCurrentListMap!1395 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)) key!932))))

(declare-fun bm!23817 () Bool)

(declare-fun c!42629 () Bool)

(assert (=> bm!23817 (= call!23820 (inRange!0 (ite c!42629 (index!6570 lt!126792) (index!6573 lt!126792)) (mask!10896 thiss!1504)))))

(declare-fun b!252873 () Bool)

(declare-fun e!163970 () Bool)

(declare-fun mapRes!11085 () Bool)

(assert (=> b!252873 (= e!163968 (and e!163970 mapRes!11085))))

(declare-fun condMapEmpty!11085 () Bool)

(declare-fun mapDefault!11085 () ValueCell!2915)

(assert (=> b!252873 (= condMapEmpty!11085 (= (arr!5857 (_values!4653 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2915)) mapDefault!11085)))))

(declare-fun b!252874 () Bool)

(declare-fun res!123777 () Bool)

(assert (=> b!252874 (=> (not res!123777) (not e!163962))))

(assert (=> b!252874 (= res!123777 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!252875 () Bool)

(declare-fun Unit!7795 () Unit!7793)

(assert (=> b!252875 (= e!163967 Unit!7795)))

(declare-fun lt!126794 () Unit!7793)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!401 (array!12361 array!12359 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) Int) Unit!7793)

(assert (=> b!252875 (= lt!126794 (lemmaInListMapThenSeekEntryOrOpenFindsIt!401 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)))))

(assert (=> b!252875 false))

(declare-fun b!252876 () Bool)

(declare-fun e!163959 () Bool)

(assert (=> b!252876 (= e!163959 tp_is_empty!6517)))

(declare-fun b!252877 () Bool)

(declare-fun res!123773 () Bool)

(assert (=> b!252877 (=> res!123773 e!163963)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12361 (_ BitVec 32)) Bool)

(assert (=> b!252877 (= res!123773 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6820 thiss!1504) (mask!10896 thiss!1504))))))

(declare-fun bm!23818 () Bool)

(declare-fun arrayContainsKey!0 (array!12361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23818 (= call!23821 (arrayContainsKey!0 (_keys!6820 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252878 () Bool)

(declare-fun lt!126796 () Unit!7793)

(assert (=> b!252878 (= e!163967 lt!126796)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!396 (array!12361 array!12359 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) Int) Unit!7793)

(assert (=> b!252878 (= lt!126796 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!396 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)))))

(assert (=> b!252878 (= c!42629 ((_ is MissingZero!1100) lt!126792))))

(assert (=> b!252878 e!163961))

(declare-fun b!252879 () Bool)

(assert (=> b!252879 (= e!163960 ((_ is Undefined!1100) lt!126792))))

(declare-fun b!252880 () Bool)

(assert (=> b!252880 (= e!163965 (not call!23821))))

(declare-fun b!252881 () Bool)

(declare-fun res!123778 () Bool)

(assert (=> b!252881 (=> res!123778 e!163963)))

(assert (=> b!252881 (= res!123778 (or (not (= (size!6204 (_values!4653 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10896 thiss!1504)))) (not (= (size!6205 (_keys!6820 thiss!1504)) (size!6204 (_values!4653 thiss!1504)))) (bvslt (mask!10896 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4407 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4407 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!252882 () Bool)

(declare-fun res!123775 () Bool)

(assert (=> b!252882 (= res!123775 (= (select (arr!5858 (_keys!6820 thiss!1504)) (index!6573 lt!126792)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252882 (=> (not res!123775) (not e!163964))))

(declare-fun b!252883 () Bool)

(assert (=> b!252883 (= e!163970 tp_is_empty!6517)))

(declare-fun b!252884 () Bool)

(assert (=> b!252884 (= e!163969 (not e!163963))))

(declare-fun res!123768 () Bool)

(assert (=> b!252884 (=> res!123768 e!163963)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!252884 (= res!123768 (not (validMask!0 (mask!10896 thiss!1504))))))

(declare-fun lt!126791 () array!12361)

(assert (=> b!252884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126791 (mask!10896 thiss!1504))))

(declare-fun lt!126798 () Unit!7793)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12361 (_ BitVec 32) (_ BitVec 32)) Unit!7793)

(assert (=> b!252884 (= lt!126798 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6820 thiss!1504) index!297 (mask!10896 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12361 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!252884 (= (arrayCountValidKeys!0 lt!126791 #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6820 thiss!1504) #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504)))))))

(declare-fun lt!126799 () Unit!7793)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12361 (_ BitVec 32) (_ BitVec 64)) Unit!7793)

(assert (=> b!252884 (= lt!126799 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6820 thiss!1504) index!297 key!932))))

(assert (=> b!252884 (arrayNoDuplicates!0 lt!126791 #b00000000000000000000000000000000 Nil!3655)))

(assert (=> b!252884 (= lt!126791 (array!12362 (store (arr!5858 (_keys!6820 thiss!1504)) index!297 key!932) (size!6205 (_keys!6820 thiss!1504))))))

(declare-fun lt!126800 () Unit!7793)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3658) Unit!7793)

(assert (=> b!252884 (= lt!126800 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6820 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3655))))

(declare-fun lt!126795 () Unit!7793)

(declare-fun e!163966 () Unit!7793)

(assert (=> b!252884 (= lt!126795 e!163966)))

(declare-fun c!42630 () Bool)

(assert (=> b!252884 (= c!42630 (arrayContainsKey!0 (_keys!6820 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252885 () Bool)

(assert (=> b!252885 (= e!163963 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6205 (_keys!6820 thiss!1504)))))))

(declare-fun b!252886 () Bool)

(declare-fun Unit!7796 () Unit!7793)

(assert (=> b!252886 (= e!163966 Unit!7796)))

(declare-fun b!252887 () Bool)

(declare-fun Unit!7797 () Unit!7793)

(assert (=> b!252887 (= e!163966 Unit!7797)))

(declare-fun lt!126797 () Unit!7793)

(declare-fun lemmaArrayContainsKeyThenInListMap!221 (array!12361 array!12359 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) (_ BitVec 32) Int) Unit!7793)

(assert (=> b!252887 (= lt!126797 (lemmaArrayContainsKeyThenInListMap!221 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(assert (=> b!252887 false))

(declare-fun mapIsEmpty!11085 () Bool)

(assert (=> mapIsEmpty!11085 mapRes!11085))

(declare-fun b!252888 () Bool)

(declare-fun res!123770 () Bool)

(assert (=> b!252888 (=> (not res!123770) (not e!163965))))

(assert (=> b!252888 (= res!123770 (= (select (arr!5858 (_keys!6820 thiss!1504)) (index!6570 lt!126792)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252889 () Bool)

(assert (=> b!252889 (= e!163960 e!163964)))

(declare-fun res!123769 () Bool)

(assert (=> b!252889 (= res!123769 call!23820)))

(assert (=> b!252889 (=> (not res!123769) (not e!163964))))

(declare-fun mapNonEmpty!11085 () Bool)

(declare-fun tp!23247 () Bool)

(assert (=> mapNonEmpty!11085 (= mapRes!11085 (and tp!23247 e!163959))))

(declare-fun mapKey!11085 () (_ BitVec 32))

(declare-fun mapValue!11085 () ValueCell!2915)

(declare-fun mapRest!11085 () (Array (_ BitVec 32) ValueCell!2915))

(assert (=> mapNonEmpty!11085 (= (arr!5857 (_values!4653 thiss!1504)) (store mapRest!11085 mapKey!11085 mapValue!11085))))

(assert (= (and start!24184 res!123779) b!252874))

(assert (= (and b!252874 res!123777) b!252871))

(assert (= (and b!252871 res!123776) b!252872))

(assert (= (and b!252872 c!42628) b!252875))

(assert (= (and b!252872 (not c!42628)) b!252878))

(assert (= (and b!252878 c!42629) b!252868))

(assert (= (and b!252878 (not c!42629)) b!252866))

(assert (= (and b!252868 res!123772) b!252888))

(assert (= (and b!252888 res!123770) b!252880))

(assert (= (and b!252866 c!42631) b!252889))

(assert (= (and b!252866 (not c!42631)) b!252879))

(assert (= (and b!252889 res!123769) b!252882))

(assert (= (and b!252882 res!123775) b!252869))

(assert (= (or b!252868 b!252889) bm!23817))

(assert (= (or b!252880 b!252869) bm!23818))

(assert (= (and b!252872 res!123774) b!252884))

(assert (= (and b!252884 c!42630) b!252887))

(assert (= (and b!252884 (not c!42630)) b!252886))

(assert (= (and b!252884 (not res!123768)) b!252881))

(assert (= (and b!252881 (not res!123778)) b!252877))

(assert (= (and b!252877 (not res!123773)) b!252870))

(assert (= (and b!252870 (not res!123771)) b!252885))

(assert (= (and b!252873 condMapEmpty!11085) mapIsEmpty!11085))

(assert (= (and b!252873 (not condMapEmpty!11085)) mapNonEmpty!11085))

(assert (= (and mapNonEmpty!11085 ((_ is ValueCellFull!2915) mapValue!11085)) b!252876))

(assert (= (and b!252873 ((_ is ValueCellFull!2915) mapDefault!11085)) b!252883))

(assert (= b!252867 b!252873))

(assert (= start!24184 b!252867))

(declare-fun m!269019 () Bool)

(assert (=> b!252882 m!269019))

(declare-fun m!269021 () Bool)

(assert (=> b!252884 m!269021))

(declare-fun m!269023 () Bool)

(assert (=> b!252884 m!269023))

(declare-fun m!269025 () Bool)

(assert (=> b!252884 m!269025))

(declare-fun m!269027 () Bool)

(assert (=> b!252884 m!269027))

(declare-fun m!269029 () Bool)

(assert (=> b!252884 m!269029))

(declare-fun m!269031 () Bool)

(assert (=> b!252884 m!269031))

(declare-fun m!269033 () Bool)

(assert (=> b!252884 m!269033))

(declare-fun m!269035 () Bool)

(assert (=> b!252884 m!269035))

(declare-fun m!269037 () Bool)

(assert (=> b!252884 m!269037))

(declare-fun m!269039 () Bool)

(assert (=> b!252884 m!269039))

(declare-fun m!269041 () Bool)

(assert (=> bm!23817 m!269041))

(declare-fun m!269043 () Bool)

(assert (=> b!252872 m!269043))

(declare-fun m!269045 () Bool)

(assert (=> b!252872 m!269045))

(assert (=> b!252872 m!269045))

(declare-fun m!269047 () Bool)

(assert (=> b!252872 m!269047))

(declare-fun m!269049 () Bool)

(assert (=> b!252871 m!269049))

(declare-fun m!269051 () Bool)

(assert (=> b!252878 m!269051))

(declare-fun m!269053 () Bool)

(assert (=> b!252888 m!269053))

(declare-fun m!269055 () Bool)

(assert (=> b!252867 m!269055))

(declare-fun m!269057 () Bool)

(assert (=> b!252867 m!269057))

(assert (=> bm!23818 m!269023))

(declare-fun m!269059 () Bool)

(assert (=> mapNonEmpty!11085 m!269059))

(declare-fun m!269061 () Bool)

(assert (=> start!24184 m!269061))

(declare-fun m!269063 () Bool)

(assert (=> b!252887 m!269063))

(declare-fun m!269065 () Bool)

(assert (=> b!252875 m!269065))

(declare-fun m!269067 () Bool)

(assert (=> b!252877 m!269067))

(declare-fun m!269069 () Bool)

(assert (=> b!252870 m!269069))

(check-sat (not b!252884) tp_is_empty!6517 (not bm!23818) (not b!252872) (not b!252878) (not mapNonEmpty!11085) b_and!13707 (not b!252887) (not b!252871) (not b!252867) (not start!24184) (not b!252870) (not b!252875) (not b_next!6655) (not bm!23817) (not b!252877))
(check-sat b_and!13707 (not b_next!6655))
(get-model)

(declare-fun b!253050 () Bool)

(declare-fun e!164074 () Bool)

(declare-fun call!23839 () Bool)

(assert (=> b!253050 (= e!164074 (not call!23839))))

(declare-fun d!61457 () Bool)

(declare-fun e!164071 () Bool)

(assert (=> d!61457 e!164071))

(declare-fun c!42660 () Bool)

(declare-fun lt!126865 () SeekEntryResult!1100)

(assert (=> d!61457 (= c!42660 ((_ is MissingZero!1100) lt!126865))))

(assert (=> d!61457 (= lt!126865 (seekEntryOrOpen!0 key!932 (_keys!6820 thiss!1504) (mask!10896 thiss!1504)))))

(declare-fun lt!126866 () Unit!7793)

(declare-fun choose!1213 (array!12361 array!12359 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) Int) Unit!7793)

(assert (=> d!61457 (= lt!126866 (choose!1213 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)))))

(assert (=> d!61457 (validMask!0 (mask!10896 thiss!1504))))

(assert (=> d!61457 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!396 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)) lt!126866)))

(declare-fun b!253051 () Bool)

(declare-fun e!164072 () Bool)

(assert (=> b!253051 (= e!164072 ((_ is Undefined!1100) lt!126865))))

(declare-fun b!253052 () Bool)

(declare-fun res!123863 () Bool)

(assert (=> b!253052 (=> (not res!123863) (not e!164074))))

(assert (=> b!253052 (= res!123863 (= (select (arr!5858 (_keys!6820 thiss!1504)) (index!6573 lt!126865)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253052 (and (bvsge (index!6573 lt!126865) #b00000000000000000000000000000000) (bvslt (index!6573 lt!126865) (size!6205 (_keys!6820 thiss!1504))))))

(declare-fun b!253053 () Bool)

(declare-fun e!164073 () Bool)

(assert (=> b!253053 (= e!164071 e!164073)))

(declare-fun res!123861 () Bool)

(declare-fun call!23838 () Bool)

(assert (=> b!253053 (= res!123861 call!23838)))

(assert (=> b!253053 (=> (not res!123861) (not e!164073))))

(declare-fun b!253054 () Bool)

(assert (=> b!253054 (= e!164071 e!164072)))

(declare-fun c!42661 () Bool)

(assert (=> b!253054 (= c!42661 ((_ is MissingVacant!1100) lt!126865))))

(declare-fun b!253055 () Bool)

(assert (=> b!253055 (and (bvsge (index!6570 lt!126865) #b00000000000000000000000000000000) (bvslt (index!6570 lt!126865) (size!6205 (_keys!6820 thiss!1504))))))

(declare-fun res!123862 () Bool)

(assert (=> b!253055 (= res!123862 (= (select (arr!5858 (_keys!6820 thiss!1504)) (index!6570 lt!126865)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253055 (=> (not res!123862) (not e!164073))))

(declare-fun bm!23835 () Bool)

(assert (=> bm!23835 (= call!23839 (arrayContainsKey!0 (_keys!6820 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!23836 () Bool)

(assert (=> bm!23836 (= call!23838 (inRange!0 (ite c!42660 (index!6570 lt!126865) (index!6573 lt!126865)) (mask!10896 thiss!1504)))))

(declare-fun b!253056 () Bool)

(declare-fun res!123860 () Bool)

(assert (=> b!253056 (=> (not res!123860) (not e!164074))))

(assert (=> b!253056 (= res!123860 call!23838)))

(assert (=> b!253056 (= e!164072 e!164074)))

(declare-fun b!253057 () Bool)

(assert (=> b!253057 (= e!164073 (not call!23839))))

(assert (= (and d!61457 c!42660) b!253053))

(assert (= (and d!61457 (not c!42660)) b!253054))

(assert (= (and b!253053 res!123861) b!253055))

(assert (= (and b!253055 res!123862) b!253057))

(assert (= (and b!253054 c!42661) b!253056))

(assert (= (and b!253054 (not c!42661)) b!253051))

(assert (= (and b!253056 res!123860) b!253052))

(assert (= (and b!253052 res!123863) b!253050))

(assert (= (or b!253053 b!253056) bm!23836))

(assert (= (or b!253057 b!253050) bm!23835))

(declare-fun m!269175 () Bool)

(assert (=> b!253055 m!269175))

(declare-fun m!269177 () Bool)

(assert (=> b!253052 m!269177))

(assert (=> d!61457 m!269049))

(declare-fun m!269179 () Bool)

(assert (=> d!61457 m!269179))

(assert (=> d!61457 m!269021))

(declare-fun m!269181 () Bool)

(assert (=> bm!23836 m!269181))

(assert (=> bm!23835 m!269023))

(assert (=> b!252878 d!61457))

(declare-fun b!253070 () Bool)

(declare-fun e!164082 () SeekEntryResult!1100)

(declare-fun lt!126873 () SeekEntryResult!1100)

(assert (=> b!253070 (= e!164082 (MissingZero!1100 (index!6572 lt!126873)))))

(declare-fun b!253071 () Bool)

(declare-fun e!164083 () SeekEntryResult!1100)

(assert (=> b!253071 (= e!164083 Undefined!1100)))

(declare-fun b!253072 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12361 (_ BitVec 32)) SeekEntryResult!1100)

(assert (=> b!253072 (= e!164082 (seekKeyOrZeroReturnVacant!0 (x!24756 lt!126873) (index!6572 lt!126873) (index!6572 lt!126873) key!932 (_keys!6820 thiss!1504) (mask!10896 thiss!1504)))))

(declare-fun b!253073 () Bool)

(declare-fun c!42669 () Bool)

(declare-fun lt!126874 () (_ BitVec 64))

(assert (=> b!253073 (= c!42669 (= lt!126874 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!164081 () SeekEntryResult!1100)

(assert (=> b!253073 (= e!164081 e!164082)))

(declare-fun d!61459 () Bool)

(declare-fun lt!126875 () SeekEntryResult!1100)

(assert (=> d!61459 (and (or ((_ is Undefined!1100) lt!126875) (not ((_ is Found!1100) lt!126875)) (and (bvsge (index!6571 lt!126875) #b00000000000000000000000000000000) (bvslt (index!6571 lt!126875) (size!6205 (_keys!6820 thiss!1504))))) (or ((_ is Undefined!1100) lt!126875) ((_ is Found!1100) lt!126875) (not ((_ is MissingZero!1100) lt!126875)) (and (bvsge (index!6570 lt!126875) #b00000000000000000000000000000000) (bvslt (index!6570 lt!126875) (size!6205 (_keys!6820 thiss!1504))))) (or ((_ is Undefined!1100) lt!126875) ((_ is Found!1100) lt!126875) ((_ is MissingZero!1100) lt!126875) (not ((_ is MissingVacant!1100) lt!126875)) (and (bvsge (index!6573 lt!126875) #b00000000000000000000000000000000) (bvslt (index!6573 lt!126875) (size!6205 (_keys!6820 thiss!1504))))) (or ((_ is Undefined!1100) lt!126875) (ite ((_ is Found!1100) lt!126875) (= (select (arr!5858 (_keys!6820 thiss!1504)) (index!6571 lt!126875)) key!932) (ite ((_ is MissingZero!1100) lt!126875) (= (select (arr!5858 (_keys!6820 thiss!1504)) (index!6570 lt!126875)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1100) lt!126875) (= (select (arr!5858 (_keys!6820 thiss!1504)) (index!6573 lt!126875)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61459 (= lt!126875 e!164083)))

(declare-fun c!42668 () Bool)

(assert (=> d!61459 (= c!42668 (and ((_ is Intermediate!1100) lt!126873) (undefined!1912 lt!126873)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12361 (_ BitVec 32)) SeekEntryResult!1100)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61459 (= lt!126873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10896 thiss!1504)) key!932 (_keys!6820 thiss!1504) (mask!10896 thiss!1504)))))

(assert (=> d!61459 (validMask!0 (mask!10896 thiss!1504))))

(assert (=> d!61459 (= (seekEntryOrOpen!0 key!932 (_keys!6820 thiss!1504) (mask!10896 thiss!1504)) lt!126875)))

(declare-fun b!253074 () Bool)

(assert (=> b!253074 (= e!164083 e!164081)))

(assert (=> b!253074 (= lt!126874 (select (arr!5858 (_keys!6820 thiss!1504)) (index!6572 lt!126873)))))

(declare-fun c!42670 () Bool)

(assert (=> b!253074 (= c!42670 (= lt!126874 key!932))))

(declare-fun b!253075 () Bool)

(assert (=> b!253075 (= e!164081 (Found!1100 (index!6572 lt!126873)))))

(assert (= (and d!61459 c!42668) b!253071))

(assert (= (and d!61459 (not c!42668)) b!253074))

(assert (= (and b!253074 c!42670) b!253075))

(assert (= (and b!253074 (not c!42670)) b!253073))

(assert (= (and b!253073 c!42669) b!253070))

(assert (= (and b!253073 (not c!42669)) b!253072))

(declare-fun m!269183 () Bool)

(assert (=> b!253072 m!269183))

(declare-fun m!269185 () Bool)

(assert (=> d!61459 m!269185))

(declare-fun m!269187 () Bool)

(assert (=> d!61459 m!269187))

(declare-fun m!269189 () Bool)

(assert (=> d!61459 m!269189))

(declare-fun m!269191 () Bool)

(assert (=> d!61459 m!269191))

(declare-fun m!269193 () Bool)

(assert (=> d!61459 m!269193))

(assert (=> d!61459 m!269187))

(assert (=> d!61459 m!269021))

(declare-fun m!269195 () Bool)

(assert (=> b!253074 m!269195))

(assert (=> b!252871 d!61459))

(declare-fun b!253086 () Bool)

(declare-fun e!164094 () Bool)

(declare-fun call!23842 () Bool)

(assert (=> b!253086 (= e!164094 call!23842)))

(declare-fun b!253087 () Bool)

(declare-fun e!164095 () Bool)

(declare-fun contains!1809 (List!3658 (_ BitVec 64)) Bool)

(assert (=> b!253087 (= e!164095 (contains!1809 Nil!3655 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253088 () Bool)

(assert (=> b!253088 (= e!164094 call!23842)))

(declare-fun b!253089 () Bool)

(declare-fun e!164093 () Bool)

(declare-fun e!164092 () Bool)

(assert (=> b!253089 (= e!164093 e!164092)))

(declare-fun res!123871 () Bool)

(assert (=> b!253089 (=> (not res!123871) (not e!164092))))

(assert (=> b!253089 (= res!123871 (not e!164095))))

(declare-fun res!123870 () Bool)

(assert (=> b!253089 (=> (not res!123870) (not e!164095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!253089 (= res!123870 (validKeyInArray!0 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61461 () Bool)

(declare-fun res!123872 () Bool)

(assert (=> d!61461 (=> res!123872 e!164093)))

(assert (=> d!61461 (= res!123872 (bvsge #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))))))

(assert (=> d!61461 (= (arrayNoDuplicates!0 (_keys!6820 thiss!1504) #b00000000000000000000000000000000 Nil!3655) e!164093)))

(declare-fun bm!23839 () Bool)

(declare-fun c!42673 () Bool)

(assert (=> bm!23839 (= call!23842 (arrayNoDuplicates!0 (_keys!6820 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42673 (Cons!3654 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000) Nil!3655) Nil!3655)))))

(declare-fun b!253090 () Bool)

(assert (=> b!253090 (= e!164092 e!164094)))

(assert (=> b!253090 (= c!42673 (validKeyInArray!0 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61461 (not res!123872)) b!253089))

(assert (= (and b!253089 res!123870) b!253087))

(assert (= (and b!253089 res!123871) b!253090))

(assert (= (and b!253090 c!42673) b!253088))

(assert (= (and b!253090 (not c!42673)) b!253086))

(assert (= (or b!253088 b!253086) bm!23839))

(declare-fun m!269197 () Bool)

(assert (=> b!253087 m!269197))

(assert (=> b!253087 m!269197))

(declare-fun m!269199 () Bool)

(assert (=> b!253087 m!269199))

(assert (=> b!253089 m!269197))

(assert (=> b!253089 m!269197))

(declare-fun m!269201 () Bool)

(assert (=> b!253089 m!269201))

(assert (=> bm!23839 m!269197))

(declare-fun m!269203 () Bool)

(assert (=> bm!23839 m!269203))

(assert (=> b!253090 m!269197))

(assert (=> b!253090 m!269197))

(assert (=> b!253090 m!269201))

(assert (=> b!252870 d!61461))

(declare-fun d!61463 () Bool)

(assert (=> d!61463 (= (array_inv!3849 (_keys!6820 thiss!1504)) (bvsge (size!6205 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252867 d!61463))

(declare-fun d!61465 () Bool)

(assert (=> d!61465 (= (array_inv!3850 (_values!4653 thiss!1504)) (bvsge (size!6204 (_values!4653 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252867 d!61465))

(declare-fun d!61467 () Bool)

(declare-fun res!123877 () Bool)

(declare-fun e!164100 () Bool)

(assert (=> d!61467 (=> res!123877 e!164100)))

(assert (=> d!61467 (= res!123877 (= (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61467 (= (arrayContainsKey!0 (_keys!6820 thiss!1504) key!932 #b00000000000000000000000000000000) e!164100)))

(declare-fun b!253095 () Bool)

(declare-fun e!164101 () Bool)

(assert (=> b!253095 (= e!164100 e!164101)))

(declare-fun res!123878 () Bool)

(assert (=> b!253095 (=> (not res!123878) (not e!164101))))

(assert (=> b!253095 (= res!123878 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6205 (_keys!6820 thiss!1504))))))

(declare-fun b!253096 () Bool)

(assert (=> b!253096 (= e!164101 (arrayContainsKey!0 (_keys!6820 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61467 (not res!123877)) b!253095))

(assert (= (and b!253095 res!123878) b!253096))

(assert (=> d!61467 m!269197))

(declare-fun m!269205 () Bool)

(assert (=> b!253096 m!269205))

(assert (=> bm!23818 d!61467))

(declare-fun bm!23842 () Bool)

(declare-fun call!23845 () Bool)

(assert (=> bm!23842 (= call!23845 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6820 thiss!1504) (mask!10896 thiss!1504)))))

(declare-fun b!253105 () Bool)

(declare-fun e!164110 () Bool)

(assert (=> b!253105 (= e!164110 call!23845)))

(declare-fun d!61469 () Bool)

(declare-fun res!123883 () Bool)

(declare-fun e!164108 () Bool)

(assert (=> d!61469 (=> res!123883 e!164108)))

(assert (=> d!61469 (= res!123883 (bvsge #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))))))

(assert (=> d!61469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6820 thiss!1504) (mask!10896 thiss!1504)) e!164108)))

(declare-fun b!253106 () Bool)

(declare-fun e!164109 () Bool)

(assert (=> b!253106 (= e!164109 call!23845)))

(declare-fun b!253107 () Bool)

(assert (=> b!253107 (= e!164110 e!164109)))

(declare-fun lt!126884 () (_ BitVec 64))

(assert (=> b!253107 (= lt!126884 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126882 () Unit!7793)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12361 (_ BitVec 64) (_ BitVec 32)) Unit!7793)

(assert (=> b!253107 (= lt!126882 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6820 thiss!1504) lt!126884 #b00000000000000000000000000000000))))

(assert (=> b!253107 (arrayContainsKey!0 (_keys!6820 thiss!1504) lt!126884 #b00000000000000000000000000000000)))

(declare-fun lt!126883 () Unit!7793)

(assert (=> b!253107 (= lt!126883 lt!126882)))

(declare-fun res!123884 () Bool)

(assert (=> b!253107 (= res!123884 (= (seekEntryOrOpen!0 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000) (_keys!6820 thiss!1504) (mask!10896 thiss!1504)) (Found!1100 #b00000000000000000000000000000000)))))

(assert (=> b!253107 (=> (not res!123884) (not e!164109))))

(declare-fun b!253108 () Bool)

(assert (=> b!253108 (= e!164108 e!164110)))

(declare-fun c!42676 () Bool)

(assert (=> b!253108 (= c!42676 (validKeyInArray!0 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61469 (not res!123883)) b!253108))

(assert (= (and b!253108 c!42676) b!253107))

(assert (= (and b!253108 (not c!42676)) b!253105))

(assert (= (and b!253107 res!123884) b!253106))

(assert (= (or b!253106 b!253105) bm!23842))

(declare-fun m!269207 () Bool)

(assert (=> bm!23842 m!269207))

(assert (=> b!253107 m!269197))

(declare-fun m!269209 () Bool)

(assert (=> b!253107 m!269209))

(declare-fun m!269211 () Bool)

(assert (=> b!253107 m!269211))

(assert (=> b!253107 m!269197))

(declare-fun m!269213 () Bool)

(assert (=> b!253107 m!269213))

(assert (=> b!253108 m!269197))

(assert (=> b!253108 m!269197))

(assert (=> b!253108 m!269201))

(assert (=> b!252877 d!61469))

(declare-fun d!61471 () Bool)

(declare-fun res!123891 () Bool)

(declare-fun e!164113 () Bool)

(assert (=> d!61471 (=> (not res!123891) (not e!164113))))

(declare-fun simpleValid!268 (LongMapFixedSize!3730) Bool)

(assert (=> d!61471 (= res!123891 (simpleValid!268 thiss!1504))))

(assert (=> d!61471 (= (valid!1465 thiss!1504) e!164113)))

(declare-fun b!253115 () Bool)

(declare-fun res!123892 () Bool)

(assert (=> b!253115 (=> (not res!123892) (not e!164113))))

(assert (=> b!253115 (= res!123892 (= (arrayCountValidKeys!0 (_keys!6820 thiss!1504) #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))) (_size!1914 thiss!1504)))))

(declare-fun b!253116 () Bool)

(declare-fun res!123893 () Bool)

(assert (=> b!253116 (=> (not res!123893) (not e!164113))))

(assert (=> b!253116 (= res!123893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6820 thiss!1504) (mask!10896 thiss!1504)))))

(declare-fun b!253117 () Bool)

(assert (=> b!253117 (= e!164113 (arrayNoDuplicates!0 (_keys!6820 thiss!1504) #b00000000000000000000000000000000 Nil!3655))))

(assert (= (and d!61471 res!123891) b!253115))

(assert (= (and b!253115 res!123892) b!253116))

(assert (= (and b!253116 res!123893) b!253117))

(declare-fun m!269215 () Bool)

(assert (=> d!61471 m!269215))

(assert (=> b!253115 m!269037))

(assert (=> b!253116 m!269067))

(assert (=> b!253117 m!269069))

(assert (=> start!24184 d!61471))

(declare-fun d!61473 () Bool)

(assert (=> d!61473 (contains!1807 (getCurrentListMap!1395 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)) key!932)))

(declare-fun lt!126887 () Unit!7793)

(declare-fun choose!1214 (array!12361 array!12359 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) (_ BitVec 32) Int) Unit!7793)

(assert (=> d!61473 (= lt!126887 (choose!1214 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(assert (=> d!61473 (validMask!0 (mask!10896 thiss!1504))))

(assert (=> d!61473 (= (lemmaArrayContainsKeyThenInListMap!221 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)) lt!126887)))

(declare-fun bs!9054 () Bool)

(assert (= bs!9054 d!61473))

(assert (=> bs!9054 m!269045))

(assert (=> bs!9054 m!269045))

(assert (=> bs!9054 m!269047))

(declare-fun m!269217 () Bool)

(assert (=> bs!9054 m!269217))

(assert (=> bs!9054 m!269021))

(assert (=> b!252887 d!61473))

(declare-fun d!61475 () Bool)

(declare-fun e!164116 () Bool)

(assert (=> d!61475 e!164116))

(declare-fun res!123898 () Bool)

(assert (=> d!61475 (=> (not res!123898) (not e!164116))))

(declare-fun lt!126892 () SeekEntryResult!1100)

(assert (=> d!61475 (= res!123898 ((_ is Found!1100) lt!126892))))

(assert (=> d!61475 (= lt!126892 (seekEntryOrOpen!0 key!932 (_keys!6820 thiss!1504) (mask!10896 thiss!1504)))))

(declare-fun lt!126893 () Unit!7793)

(declare-fun choose!1215 (array!12361 array!12359 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) Int) Unit!7793)

(assert (=> d!61475 (= lt!126893 (choose!1215 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)))))

(assert (=> d!61475 (validMask!0 (mask!10896 thiss!1504))))

(assert (=> d!61475 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!401 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)) lt!126893)))

(declare-fun b!253122 () Bool)

(declare-fun res!123899 () Bool)

(assert (=> b!253122 (=> (not res!123899) (not e!164116))))

(assert (=> b!253122 (= res!123899 (inRange!0 (index!6571 lt!126892) (mask!10896 thiss!1504)))))

(declare-fun b!253123 () Bool)

(assert (=> b!253123 (= e!164116 (= (select (arr!5858 (_keys!6820 thiss!1504)) (index!6571 lt!126892)) key!932))))

(assert (=> b!253123 (and (bvsge (index!6571 lt!126892) #b00000000000000000000000000000000) (bvslt (index!6571 lt!126892) (size!6205 (_keys!6820 thiss!1504))))))

(assert (= (and d!61475 res!123898) b!253122))

(assert (= (and b!253122 res!123899) b!253123))

(assert (=> d!61475 m!269049))

(declare-fun m!269219 () Bool)

(assert (=> d!61475 m!269219))

(assert (=> d!61475 m!269021))

(declare-fun m!269221 () Bool)

(assert (=> b!253122 m!269221))

(declare-fun m!269223 () Bool)

(assert (=> b!253123 m!269223))

(assert (=> b!252875 d!61475))

(declare-fun d!61477 () Bool)

(declare-fun e!164122 () Bool)

(assert (=> d!61477 e!164122))

(declare-fun res!123910 () Bool)

(assert (=> d!61477 (=> (not res!123910) (not e!164122))))

(assert (=> d!61477 (= res!123910 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6205 (_keys!6820 thiss!1504)))))))

(declare-fun lt!126896 () Unit!7793)

(declare-fun choose!1 (array!12361 (_ BitVec 32) (_ BitVec 64)) Unit!7793)

(assert (=> d!61477 (= lt!126896 (choose!1 (_keys!6820 thiss!1504) index!297 key!932))))

(declare-fun e!164121 () Bool)

(assert (=> d!61477 e!164121))

(declare-fun res!123911 () Bool)

(assert (=> d!61477 (=> (not res!123911) (not e!164121))))

(assert (=> d!61477 (= res!123911 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6205 (_keys!6820 thiss!1504)))))))

(assert (=> d!61477 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6820 thiss!1504) index!297 key!932) lt!126896)))

(declare-fun b!253134 () Bool)

(assert (=> b!253134 (= e!164121 (bvslt (size!6205 (_keys!6820 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!253133 () Bool)

(declare-fun res!123909 () Bool)

(assert (=> b!253133 (=> (not res!123909) (not e!164121))))

(assert (=> b!253133 (= res!123909 (validKeyInArray!0 key!932))))

(declare-fun b!253135 () Bool)

(assert (=> b!253135 (= e!164122 (= (arrayCountValidKeys!0 (array!12362 (store (arr!5858 (_keys!6820 thiss!1504)) index!297 key!932) (size!6205 (_keys!6820 thiss!1504))) #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6820 thiss!1504) #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!253132 () Bool)

(declare-fun res!123908 () Bool)

(assert (=> b!253132 (=> (not res!123908) (not e!164121))))

(assert (=> b!253132 (= res!123908 (not (validKeyInArray!0 (select (arr!5858 (_keys!6820 thiss!1504)) index!297))))))

(assert (= (and d!61477 res!123911) b!253132))

(assert (= (and b!253132 res!123908) b!253133))

(assert (= (and b!253133 res!123909) b!253134))

(assert (= (and d!61477 res!123910) b!253135))

(declare-fun m!269225 () Bool)

(assert (=> d!61477 m!269225))

(declare-fun m!269227 () Bool)

(assert (=> b!253133 m!269227))

(assert (=> b!253135 m!269035))

(declare-fun m!269229 () Bool)

(assert (=> b!253135 m!269229))

(assert (=> b!253135 m!269037))

(declare-fun m!269231 () Bool)

(assert (=> b!253132 m!269231))

(assert (=> b!253132 m!269231))

(declare-fun m!269233 () Bool)

(assert (=> b!253132 m!269233))

(assert (=> b!252884 d!61477))

(declare-fun b!253136 () Bool)

(declare-fun e!164125 () Bool)

(declare-fun call!23846 () Bool)

(assert (=> b!253136 (= e!164125 call!23846)))

(declare-fun b!253137 () Bool)

(declare-fun e!164126 () Bool)

(assert (=> b!253137 (= e!164126 (contains!1809 Nil!3655 (select (arr!5858 lt!126791) #b00000000000000000000000000000000)))))

(declare-fun b!253138 () Bool)

(assert (=> b!253138 (= e!164125 call!23846)))

(declare-fun b!253139 () Bool)

(declare-fun e!164124 () Bool)

(declare-fun e!164123 () Bool)

(assert (=> b!253139 (= e!164124 e!164123)))

(declare-fun res!123913 () Bool)

(assert (=> b!253139 (=> (not res!123913) (not e!164123))))

(assert (=> b!253139 (= res!123913 (not e!164126))))

(declare-fun res!123912 () Bool)

(assert (=> b!253139 (=> (not res!123912) (not e!164126))))

(assert (=> b!253139 (= res!123912 (validKeyInArray!0 (select (arr!5858 lt!126791) #b00000000000000000000000000000000)))))

(declare-fun d!61479 () Bool)

(declare-fun res!123914 () Bool)

(assert (=> d!61479 (=> res!123914 e!164124)))

(assert (=> d!61479 (= res!123914 (bvsge #b00000000000000000000000000000000 (size!6205 lt!126791)))))

(assert (=> d!61479 (= (arrayNoDuplicates!0 lt!126791 #b00000000000000000000000000000000 Nil!3655) e!164124)))

(declare-fun bm!23843 () Bool)

(declare-fun c!42677 () Bool)

(assert (=> bm!23843 (= call!23846 (arrayNoDuplicates!0 lt!126791 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42677 (Cons!3654 (select (arr!5858 lt!126791) #b00000000000000000000000000000000) Nil!3655) Nil!3655)))))

(declare-fun b!253140 () Bool)

(assert (=> b!253140 (= e!164123 e!164125)))

(assert (=> b!253140 (= c!42677 (validKeyInArray!0 (select (arr!5858 lt!126791) #b00000000000000000000000000000000)))))

(assert (= (and d!61479 (not res!123914)) b!253139))

(assert (= (and b!253139 res!123912) b!253137))

(assert (= (and b!253139 res!123913) b!253140))

(assert (= (and b!253140 c!42677) b!253138))

(assert (= (and b!253140 (not c!42677)) b!253136))

(assert (= (or b!253138 b!253136) bm!23843))

(declare-fun m!269235 () Bool)

(assert (=> b!253137 m!269235))

(assert (=> b!253137 m!269235))

(declare-fun m!269237 () Bool)

(assert (=> b!253137 m!269237))

(assert (=> b!253139 m!269235))

(assert (=> b!253139 m!269235))

(declare-fun m!269239 () Bool)

(assert (=> b!253139 m!269239))

(assert (=> bm!23843 m!269235))

(declare-fun m!269241 () Bool)

(assert (=> bm!23843 m!269241))

(assert (=> b!253140 m!269235))

(assert (=> b!253140 m!269235))

(assert (=> b!253140 m!269239))

(assert (=> b!252884 d!61479))

(declare-fun b!253149 () Bool)

(declare-fun e!164132 () (_ BitVec 32))

(assert (=> b!253149 (= e!164132 #b00000000000000000000000000000000)))

(declare-fun b!253150 () Bool)

(declare-fun e!164131 () (_ BitVec 32))

(declare-fun call!23849 () (_ BitVec 32))

(assert (=> b!253150 (= e!164131 call!23849)))

(declare-fun d!61481 () Bool)

(declare-fun lt!126899 () (_ BitVec 32))

(assert (=> d!61481 (and (bvsge lt!126899 #b00000000000000000000000000000000) (bvsle lt!126899 (bvsub (size!6205 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61481 (= lt!126899 e!164132)))

(declare-fun c!42682 () Bool)

(assert (=> d!61481 (= c!42682 (bvsge #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))))))

(assert (=> d!61481 (and (bvsle #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6205 (_keys!6820 thiss!1504)) (size!6205 (_keys!6820 thiss!1504))))))

(assert (=> d!61481 (= (arrayCountValidKeys!0 (_keys!6820 thiss!1504) #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))) lt!126899)))

(declare-fun bm!23846 () Bool)

(assert (=> bm!23846 (= call!23849 (arrayCountValidKeys!0 (_keys!6820 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6205 (_keys!6820 thiss!1504))))))

(declare-fun b!253151 () Bool)

(assert (=> b!253151 (= e!164132 e!164131)))

(declare-fun c!42683 () Bool)

(assert (=> b!253151 (= c!42683 (validKeyInArray!0 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253152 () Bool)

(assert (=> b!253152 (= e!164131 (bvadd #b00000000000000000000000000000001 call!23849))))

(assert (= (and d!61481 c!42682) b!253149))

(assert (= (and d!61481 (not c!42682)) b!253151))

(assert (= (and b!253151 c!42683) b!253152))

(assert (= (and b!253151 (not c!42683)) b!253150))

(assert (= (or b!253152 b!253150) bm!23846))

(declare-fun m!269243 () Bool)

(assert (=> bm!23846 m!269243))

(assert (=> b!253151 m!269197))

(assert (=> b!253151 m!269197))

(assert (=> b!253151 m!269201))

(assert (=> b!252884 d!61481))

(declare-fun d!61483 () Bool)

(assert (=> d!61483 (= (validMask!0 (mask!10896 thiss!1504)) (and (or (= (mask!10896 thiss!1504) #b00000000000000000000000000000111) (= (mask!10896 thiss!1504) #b00000000000000000000000000001111) (= (mask!10896 thiss!1504) #b00000000000000000000000000011111) (= (mask!10896 thiss!1504) #b00000000000000000000000000111111) (= (mask!10896 thiss!1504) #b00000000000000000000000001111111) (= (mask!10896 thiss!1504) #b00000000000000000000000011111111) (= (mask!10896 thiss!1504) #b00000000000000000000000111111111) (= (mask!10896 thiss!1504) #b00000000000000000000001111111111) (= (mask!10896 thiss!1504) #b00000000000000000000011111111111) (= (mask!10896 thiss!1504) #b00000000000000000000111111111111) (= (mask!10896 thiss!1504) #b00000000000000000001111111111111) (= (mask!10896 thiss!1504) #b00000000000000000011111111111111) (= (mask!10896 thiss!1504) #b00000000000000000111111111111111) (= (mask!10896 thiss!1504) #b00000000000000001111111111111111) (= (mask!10896 thiss!1504) #b00000000000000011111111111111111) (= (mask!10896 thiss!1504) #b00000000000000111111111111111111) (= (mask!10896 thiss!1504) #b00000000000001111111111111111111) (= (mask!10896 thiss!1504) #b00000000000011111111111111111111) (= (mask!10896 thiss!1504) #b00000000000111111111111111111111) (= (mask!10896 thiss!1504) #b00000000001111111111111111111111) (= (mask!10896 thiss!1504) #b00000000011111111111111111111111) (= (mask!10896 thiss!1504) #b00000000111111111111111111111111) (= (mask!10896 thiss!1504) #b00000001111111111111111111111111) (= (mask!10896 thiss!1504) #b00000011111111111111111111111111) (= (mask!10896 thiss!1504) #b00000111111111111111111111111111) (= (mask!10896 thiss!1504) #b00001111111111111111111111111111) (= (mask!10896 thiss!1504) #b00011111111111111111111111111111) (= (mask!10896 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10896 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!252884 d!61483))

(declare-fun bm!23847 () Bool)

(declare-fun call!23850 () Bool)

(assert (=> bm!23847 (= call!23850 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126791 (mask!10896 thiss!1504)))))

(declare-fun b!253153 () Bool)

(declare-fun e!164135 () Bool)

(assert (=> b!253153 (= e!164135 call!23850)))

(declare-fun d!61485 () Bool)

(declare-fun res!123915 () Bool)

(declare-fun e!164133 () Bool)

(assert (=> d!61485 (=> res!123915 e!164133)))

(assert (=> d!61485 (= res!123915 (bvsge #b00000000000000000000000000000000 (size!6205 lt!126791)))))

(assert (=> d!61485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126791 (mask!10896 thiss!1504)) e!164133)))

(declare-fun b!253154 () Bool)

(declare-fun e!164134 () Bool)

(assert (=> b!253154 (= e!164134 call!23850)))

(declare-fun b!253155 () Bool)

(assert (=> b!253155 (= e!164135 e!164134)))

(declare-fun lt!126902 () (_ BitVec 64))

(assert (=> b!253155 (= lt!126902 (select (arr!5858 lt!126791) #b00000000000000000000000000000000))))

(declare-fun lt!126900 () Unit!7793)

(assert (=> b!253155 (= lt!126900 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126791 lt!126902 #b00000000000000000000000000000000))))

(assert (=> b!253155 (arrayContainsKey!0 lt!126791 lt!126902 #b00000000000000000000000000000000)))

(declare-fun lt!126901 () Unit!7793)

(assert (=> b!253155 (= lt!126901 lt!126900)))

(declare-fun res!123916 () Bool)

(assert (=> b!253155 (= res!123916 (= (seekEntryOrOpen!0 (select (arr!5858 lt!126791) #b00000000000000000000000000000000) lt!126791 (mask!10896 thiss!1504)) (Found!1100 #b00000000000000000000000000000000)))))

(assert (=> b!253155 (=> (not res!123916) (not e!164134))))

(declare-fun b!253156 () Bool)

(assert (=> b!253156 (= e!164133 e!164135)))

(declare-fun c!42684 () Bool)

(assert (=> b!253156 (= c!42684 (validKeyInArray!0 (select (arr!5858 lt!126791) #b00000000000000000000000000000000)))))

(assert (= (and d!61485 (not res!123915)) b!253156))

(assert (= (and b!253156 c!42684) b!253155))

(assert (= (and b!253156 (not c!42684)) b!253153))

(assert (= (and b!253155 res!123916) b!253154))

(assert (= (or b!253154 b!253153) bm!23847))

(declare-fun m!269245 () Bool)

(assert (=> bm!23847 m!269245))

(assert (=> b!253155 m!269235))

(declare-fun m!269247 () Bool)

(assert (=> b!253155 m!269247))

(declare-fun m!269249 () Bool)

(assert (=> b!253155 m!269249))

(assert (=> b!253155 m!269235))

(declare-fun m!269251 () Bool)

(assert (=> b!253155 m!269251))

(assert (=> b!253156 m!269235))

(assert (=> b!253156 m!269235))

(assert (=> b!253156 m!269239))

(assert (=> b!252884 d!61485))

(declare-fun d!61487 () Bool)

(declare-fun e!164138 () Bool)

(assert (=> d!61487 e!164138))

(declare-fun res!123919 () Bool)

(assert (=> d!61487 (=> (not res!123919) (not e!164138))))

(assert (=> d!61487 (= res!123919 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6205 (_keys!6820 thiss!1504)))))))

(declare-fun lt!126905 () Unit!7793)

(declare-fun choose!41 (array!12361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3658) Unit!7793)

(assert (=> d!61487 (= lt!126905 (choose!41 (_keys!6820 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3655))))

(assert (=> d!61487 (bvslt (size!6205 (_keys!6820 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61487 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6820 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3655) lt!126905)))

(declare-fun b!253159 () Bool)

(assert (=> b!253159 (= e!164138 (arrayNoDuplicates!0 (array!12362 (store (arr!5858 (_keys!6820 thiss!1504)) index!297 key!932) (size!6205 (_keys!6820 thiss!1504))) #b00000000000000000000000000000000 Nil!3655))))

(assert (= (and d!61487 res!123919) b!253159))

(declare-fun m!269253 () Bool)

(assert (=> d!61487 m!269253))

(assert (=> b!253159 m!269035))

(declare-fun m!269255 () Bool)

(assert (=> b!253159 m!269255))

(assert (=> b!252884 d!61487))

(declare-fun b!253160 () Bool)

(declare-fun e!164140 () (_ BitVec 32))

(assert (=> b!253160 (= e!164140 #b00000000000000000000000000000000)))

(declare-fun b!253161 () Bool)

(declare-fun e!164139 () (_ BitVec 32))

(declare-fun call!23851 () (_ BitVec 32))

(assert (=> b!253161 (= e!164139 call!23851)))

(declare-fun d!61489 () Bool)

(declare-fun lt!126906 () (_ BitVec 32))

(assert (=> d!61489 (and (bvsge lt!126906 #b00000000000000000000000000000000) (bvsle lt!126906 (bvsub (size!6205 lt!126791) #b00000000000000000000000000000000)))))

(assert (=> d!61489 (= lt!126906 e!164140)))

(declare-fun c!42685 () Bool)

(assert (=> d!61489 (= c!42685 (bvsge #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))))))

(assert (=> d!61489 (and (bvsle #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6205 (_keys!6820 thiss!1504)) (size!6205 lt!126791)))))

(assert (=> d!61489 (= (arrayCountValidKeys!0 lt!126791 #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))) lt!126906)))

(declare-fun bm!23848 () Bool)

(assert (=> bm!23848 (= call!23851 (arrayCountValidKeys!0 lt!126791 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6205 (_keys!6820 thiss!1504))))))

(declare-fun b!253162 () Bool)

(assert (=> b!253162 (= e!164140 e!164139)))

(declare-fun c!42686 () Bool)

(assert (=> b!253162 (= c!42686 (validKeyInArray!0 (select (arr!5858 lt!126791) #b00000000000000000000000000000000)))))

(declare-fun b!253163 () Bool)

(assert (=> b!253163 (= e!164139 (bvadd #b00000000000000000000000000000001 call!23851))))

(assert (= (and d!61489 c!42685) b!253160))

(assert (= (and d!61489 (not c!42685)) b!253162))

(assert (= (and b!253162 c!42686) b!253163))

(assert (= (and b!253162 (not c!42686)) b!253161))

(assert (= (or b!253163 b!253161) bm!23848))

(declare-fun m!269257 () Bool)

(assert (=> bm!23848 m!269257))

(assert (=> b!253162 m!269235))

(assert (=> b!253162 m!269235))

(assert (=> b!253162 m!269239))

(assert (=> b!252884 d!61489))

(assert (=> b!252884 d!61467))

(declare-fun d!61491 () Bool)

(declare-fun e!164143 () Bool)

(assert (=> d!61491 e!164143))

(declare-fun res!123922 () Bool)

(assert (=> d!61491 (=> (not res!123922) (not e!164143))))

(assert (=> d!61491 (= res!123922 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6205 (_keys!6820 thiss!1504)))))))

(declare-fun lt!126909 () Unit!7793)

(declare-fun choose!102 ((_ BitVec 64) array!12361 (_ BitVec 32) (_ BitVec 32)) Unit!7793)

(assert (=> d!61491 (= lt!126909 (choose!102 key!932 (_keys!6820 thiss!1504) index!297 (mask!10896 thiss!1504)))))

(assert (=> d!61491 (validMask!0 (mask!10896 thiss!1504))))

(assert (=> d!61491 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6820 thiss!1504) index!297 (mask!10896 thiss!1504)) lt!126909)))

(declare-fun b!253166 () Bool)

(assert (=> b!253166 (= e!164143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12362 (store (arr!5858 (_keys!6820 thiss!1504)) index!297 key!932) (size!6205 (_keys!6820 thiss!1504))) (mask!10896 thiss!1504)))))

(assert (= (and d!61491 res!123922) b!253166))

(declare-fun m!269259 () Bool)

(assert (=> d!61491 m!269259))

(assert (=> d!61491 m!269021))

(assert (=> b!253166 m!269035))

(declare-fun m!269261 () Bool)

(assert (=> b!253166 m!269261))

(assert (=> b!252884 d!61491))

(declare-fun d!61493 () Bool)

(assert (=> d!61493 (= (inRange!0 index!297 (mask!10896 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10896 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!252872 d!61493))

(declare-fun d!61495 () Bool)

(declare-fun e!164149 () Bool)

(assert (=> d!61495 e!164149))

(declare-fun res!123925 () Bool)

(assert (=> d!61495 (=> res!123925 e!164149)))

(declare-fun lt!126919 () Bool)

(assert (=> d!61495 (= res!123925 (not lt!126919))))

(declare-fun lt!126918 () Bool)

(assert (=> d!61495 (= lt!126919 lt!126918)))

(declare-fun lt!126921 () Unit!7793)

(declare-fun e!164148 () Unit!7793)

(assert (=> d!61495 (= lt!126921 e!164148)))

(declare-fun c!42689 () Bool)

(assert (=> d!61495 (= c!42689 lt!126918)))

(declare-fun containsKey!295 (List!3659 (_ BitVec 64)) Bool)

(assert (=> d!61495 (= lt!126918 (containsKey!295 (toList!1863 (getCurrentListMap!1395 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504))) key!932))))

(assert (=> d!61495 (= (contains!1807 (getCurrentListMap!1395 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)) key!932) lt!126919)))

(declare-fun b!253173 () Bool)

(declare-fun lt!126920 () Unit!7793)

(assert (=> b!253173 (= e!164148 lt!126920)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!243 (List!3659 (_ BitVec 64)) Unit!7793)

(assert (=> b!253173 (= lt!126920 (lemmaContainsKeyImpliesGetValueByKeyDefined!243 (toList!1863 (getCurrentListMap!1395 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504))) key!932))))

(declare-datatypes ((Option!310 0))(
  ( (Some!309 (v!5379 V!8337)) (None!308) )
))
(declare-fun isDefined!244 (Option!310) Bool)

(declare-fun getValueByKey!304 (List!3659 (_ BitVec 64)) Option!310)

(assert (=> b!253173 (isDefined!244 (getValueByKey!304 (toList!1863 (getCurrentListMap!1395 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504))) key!932))))

(declare-fun b!253174 () Bool)

(declare-fun Unit!7803 () Unit!7793)

(assert (=> b!253174 (= e!164148 Unit!7803)))

(declare-fun b!253175 () Bool)

(assert (=> b!253175 (= e!164149 (isDefined!244 (getValueByKey!304 (toList!1863 (getCurrentListMap!1395 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504))) key!932)))))

(assert (= (and d!61495 c!42689) b!253173))

(assert (= (and d!61495 (not c!42689)) b!253174))

(assert (= (and d!61495 (not res!123925)) b!253175))

(declare-fun m!269263 () Bool)

(assert (=> d!61495 m!269263))

(declare-fun m!269265 () Bool)

(assert (=> b!253173 m!269265))

(declare-fun m!269267 () Bool)

(assert (=> b!253173 m!269267))

(assert (=> b!253173 m!269267))

(declare-fun m!269269 () Bool)

(assert (=> b!253173 m!269269))

(assert (=> b!253175 m!269267))

(assert (=> b!253175 m!269267))

(assert (=> b!253175 m!269269))

(assert (=> b!252872 d!61495))

(declare-fun bm!23863 () Bool)

(declare-fun call!23867 () Bool)

(declare-fun lt!126976 () ListLongMap!3695)

(assert (=> bm!23863 (= call!23867 (contains!1807 lt!126976 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253218 () Bool)

(declare-fun e!164183 () Unit!7793)

(declare-fun lt!126973 () Unit!7793)

(assert (=> b!253218 (= e!164183 lt!126973)))

(declare-fun lt!126974 () ListLongMap!3695)

(declare-fun getCurrentListMapNoExtraKeys!561 (array!12361 array!12359 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 32) Int) ListLongMap!3695)

(assert (=> b!253218 (= lt!126974 (getCurrentListMapNoExtraKeys!561 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(declare-fun lt!126978 () (_ BitVec 64))

(assert (=> b!253218 (= lt!126978 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126971 () (_ BitVec 64))

(assert (=> b!253218 (= lt!126971 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126981 () Unit!7793)

(declare-fun addStillContains!221 (ListLongMap!3695 (_ BitVec 64) V!8337 (_ BitVec 64)) Unit!7793)

(assert (=> b!253218 (= lt!126981 (addStillContains!221 lt!126974 lt!126978 (zeroValue!4511 thiss!1504) lt!126971))))

(declare-fun +!672 (ListLongMap!3695 tuple2!4780) ListLongMap!3695)

(assert (=> b!253218 (contains!1807 (+!672 lt!126974 (tuple2!4781 lt!126978 (zeroValue!4511 thiss!1504))) lt!126971)))

(declare-fun lt!126980 () Unit!7793)

(assert (=> b!253218 (= lt!126980 lt!126981)))

(declare-fun lt!126970 () ListLongMap!3695)

(assert (=> b!253218 (= lt!126970 (getCurrentListMapNoExtraKeys!561 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(declare-fun lt!126975 () (_ BitVec 64))

(assert (=> b!253218 (= lt!126975 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126979 () (_ BitVec 64))

(assert (=> b!253218 (= lt!126979 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126966 () Unit!7793)

(declare-fun addApplyDifferent!221 (ListLongMap!3695 (_ BitVec 64) V!8337 (_ BitVec 64)) Unit!7793)

(assert (=> b!253218 (= lt!126966 (addApplyDifferent!221 lt!126970 lt!126975 (minValue!4511 thiss!1504) lt!126979))))

(declare-fun apply!245 (ListLongMap!3695 (_ BitVec 64)) V!8337)

(assert (=> b!253218 (= (apply!245 (+!672 lt!126970 (tuple2!4781 lt!126975 (minValue!4511 thiss!1504))) lt!126979) (apply!245 lt!126970 lt!126979))))

(declare-fun lt!126985 () Unit!7793)

(assert (=> b!253218 (= lt!126985 lt!126966)))

(declare-fun lt!126977 () ListLongMap!3695)

(assert (=> b!253218 (= lt!126977 (getCurrentListMapNoExtraKeys!561 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(declare-fun lt!126968 () (_ BitVec 64))

(assert (=> b!253218 (= lt!126968 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126984 () (_ BitVec 64))

(assert (=> b!253218 (= lt!126984 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126986 () Unit!7793)

(assert (=> b!253218 (= lt!126986 (addApplyDifferent!221 lt!126977 lt!126968 (zeroValue!4511 thiss!1504) lt!126984))))

(assert (=> b!253218 (= (apply!245 (+!672 lt!126977 (tuple2!4781 lt!126968 (zeroValue!4511 thiss!1504))) lt!126984) (apply!245 lt!126977 lt!126984))))

(declare-fun lt!126969 () Unit!7793)

(assert (=> b!253218 (= lt!126969 lt!126986)))

(declare-fun lt!126967 () ListLongMap!3695)

(assert (=> b!253218 (= lt!126967 (getCurrentListMapNoExtraKeys!561 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(declare-fun lt!126987 () (_ BitVec 64))

(assert (=> b!253218 (= lt!126987 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126972 () (_ BitVec 64))

(assert (=> b!253218 (= lt!126972 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!253218 (= lt!126973 (addApplyDifferent!221 lt!126967 lt!126987 (minValue!4511 thiss!1504) lt!126972))))

(assert (=> b!253218 (= (apply!245 (+!672 lt!126967 (tuple2!4781 lt!126987 (minValue!4511 thiss!1504))) lt!126972) (apply!245 lt!126967 lt!126972))))

(declare-fun b!253219 () Bool)

(declare-fun e!164178 () Bool)

(declare-fun e!164179 () Bool)

(assert (=> b!253219 (= e!164178 e!164179)))

(declare-fun res!123945 () Bool)

(assert (=> b!253219 (=> (not res!123945) (not e!164179))))

(assert (=> b!253219 (= res!123945 (contains!1807 lt!126976 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!253219 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))))))

(declare-fun b!253220 () Bool)

(declare-fun e!164185 () Bool)

(assert (=> b!253220 (= e!164185 (validKeyInArray!0 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253221 () Bool)

(declare-fun res!123947 () Bool)

(declare-fun e!164181 () Bool)

(assert (=> b!253221 (=> (not res!123947) (not e!164181))))

(assert (=> b!253221 (= res!123947 e!164178)))

(declare-fun res!123948 () Bool)

(assert (=> b!253221 (=> res!123948 e!164178)))

(assert (=> b!253221 (= res!123948 (not e!164185))))

(declare-fun res!123950 () Bool)

(assert (=> b!253221 (=> (not res!123950) (not e!164185))))

(assert (=> b!253221 (= res!123950 (bvslt #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))))))

(declare-fun bm!23864 () Bool)

(declare-fun call!23870 () ListLongMap!3695)

(assert (=> bm!23864 (= call!23870 (getCurrentListMapNoExtraKeys!561 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(declare-fun b!253222 () Bool)

(declare-fun e!164187 () ListLongMap!3695)

(declare-fun call!23868 () ListLongMap!3695)

(assert (=> b!253222 (= e!164187 call!23868)))

(declare-fun bm!23865 () Bool)

(declare-fun call!23872 () ListLongMap!3695)

(assert (=> bm!23865 (= call!23872 call!23870)))

(declare-fun b!253223 () Bool)

(declare-fun res!123951 () Bool)

(assert (=> b!253223 (=> (not res!123951) (not e!164181))))

(declare-fun e!164184 () Bool)

(assert (=> b!253223 (= res!123951 e!164184)))

(declare-fun c!42706 () Bool)

(assert (=> b!253223 (= c!42706 (not (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!253224 () Bool)

(declare-fun e!164188 () Bool)

(declare-fun call!23871 () Bool)

(assert (=> b!253224 (= e!164188 (not call!23871))))

(declare-fun d!61497 () Bool)

(assert (=> d!61497 e!164181))

(declare-fun res!123946 () Bool)

(assert (=> d!61497 (=> (not res!123946) (not e!164181))))

(assert (=> d!61497 (= res!123946 (or (bvsge #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))))))))

(declare-fun lt!126982 () ListLongMap!3695)

(assert (=> d!61497 (= lt!126976 lt!126982)))

(declare-fun lt!126983 () Unit!7793)

(assert (=> d!61497 (= lt!126983 e!164183)))

(declare-fun c!42703 () Bool)

(declare-fun e!164180 () Bool)

(assert (=> d!61497 (= c!42703 e!164180)))

(declare-fun res!123949 () Bool)

(assert (=> d!61497 (=> (not res!123949) (not e!164180))))

(assert (=> d!61497 (= res!123949 (bvslt #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))))))

(declare-fun e!164177 () ListLongMap!3695)

(assert (=> d!61497 (= lt!126982 e!164177)))

(declare-fun c!42707 () Bool)

(assert (=> d!61497 (= c!42707 (and (not (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61497 (validMask!0 (mask!10896 thiss!1504))))

(assert (=> d!61497 (= (getCurrentListMap!1395 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)) lt!126976)))

(declare-fun bm!23866 () Bool)

(declare-fun call!23869 () ListLongMap!3695)

(assert (=> bm!23866 (= call!23869 call!23872)))

(declare-fun b!253225 () Bool)

(declare-fun e!164176 () Bool)

(assert (=> b!253225 (= e!164184 e!164176)))

(declare-fun res!123944 () Bool)

(assert (=> b!253225 (= res!123944 call!23867)))

(assert (=> b!253225 (=> (not res!123944) (not e!164176))))

(declare-fun b!253226 () Bool)

(declare-fun call!23866 () ListLongMap!3695)

(assert (=> b!253226 (= e!164177 (+!672 call!23866 (tuple2!4781 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4511 thiss!1504))))))

(declare-fun b!253227 () Bool)

(declare-fun get!3024 (ValueCell!2915 V!8337) V!8337)

(declare-fun dynLambda!588 (Int (_ BitVec 64)) V!8337)

(assert (=> b!253227 (= e!164179 (= (apply!245 lt!126976 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000)) (get!3024 (select (arr!5857 (_values!4653 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!588 (defaultEntry!4670 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!253227 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6204 (_values!4653 thiss!1504))))))

(assert (=> b!253227 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6205 (_keys!6820 thiss!1504))))))

(declare-fun b!253228 () Bool)

(declare-fun e!164182 () Bool)

(assert (=> b!253228 (= e!164182 (= (apply!245 lt!126976 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4511 thiss!1504)))))

(declare-fun b!253229 () Bool)

(declare-fun e!164186 () ListLongMap!3695)

(assert (=> b!253229 (= e!164186 call!23868)))

(declare-fun b!253230 () Bool)

(assert (=> b!253230 (= e!164177 e!164187)))

(declare-fun c!42702 () Bool)

(assert (=> b!253230 (= c!42702 (and (not (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!253231 () Bool)

(assert (=> b!253231 (= e!164176 (= (apply!245 lt!126976 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4511 thiss!1504)))))

(declare-fun b!253232 () Bool)

(assert (=> b!253232 (= e!164184 (not call!23867))))

(declare-fun b!253233 () Bool)

(assert (=> b!253233 (= e!164188 e!164182)))

(declare-fun res!123952 () Bool)

(assert (=> b!253233 (= res!123952 call!23871)))

(assert (=> b!253233 (=> (not res!123952) (not e!164182))))

(declare-fun b!253234 () Bool)

(assert (=> b!253234 (= e!164186 call!23869)))

(declare-fun bm!23867 () Bool)

(assert (=> bm!23867 (= call!23871 (contains!1807 lt!126976 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253235 () Bool)

(assert (=> b!253235 (= e!164181 e!164188)))

(declare-fun c!42704 () Bool)

(assert (=> b!253235 (= c!42704 (not (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23868 () Bool)

(assert (=> bm!23868 (= call!23866 (+!672 (ite c!42707 call!23870 (ite c!42702 call!23872 call!23869)) (ite (or c!42707 c!42702) (tuple2!4781 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4511 thiss!1504)) (tuple2!4781 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4511 thiss!1504)))))))

(declare-fun b!253236 () Bool)

(assert (=> b!253236 (= e!164180 (validKeyInArray!0 (select (arr!5858 (_keys!6820 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253237 () Bool)

(declare-fun c!42705 () Bool)

(assert (=> b!253237 (= c!42705 (and (not (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4407 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!253237 (= e!164187 e!164186)))

(declare-fun bm!23869 () Bool)

(assert (=> bm!23869 (= call!23868 call!23866)))

(declare-fun b!253238 () Bool)

(declare-fun Unit!7804 () Unit!7793)

(assert (=> b!253238 (= e!164183 Unit!7804)))

(assert (= (and d!61497 c!42707) b!253226))

(assert (= (and d!61497 (not c!42707)) b!253230))

(assert (= (and b!253230 c!42702) b!253222))

(assert (= (and b!253230 (not c!42702)) b!253237))

(assert (= (and b!253237 c!42705) b!253229))

(assert (= (and b!253237 (not c!42705)) b!253234))

(assert (= (or b!253229 b!253234) bm!23866))

(assert (= (or b!253222 bm!23866) bm!23865))

(assert (= (or b!253222 b!253229) bm!23869))

(assert (= (or b!253226 bm!23865) bm!23864))

(assert (= (or b!253226 bm!23869) bm!23868))

(assert (= (and d!61497 res!123949) b!253236))

(assert (= (and d!61497 c!42703) b!253218))

(assert (= (and d!61497 (not c!42703)) b!253238))

(assert (= (and d!61497 res!123946) b!253221))

(assert (= (and b!253221 res!123950) b!253220))

(assert (= (and b!253221 (not res!123948)) b!253219))

(assert (= (and b!253219 res!123945) b!253227))

(assert (= (and b!253221 res!123947) b!253223))

(assert (= (and b!253223 c!42706) b!253225))

(assert (= (and b!253223 (not c!42706)) b!253232))

(assert (= (and b!253225 res!123944) b!253231))

(assert (= (or b!253225 b!253232) bm!23863))

(assert (= (and b!253223 res!123951) b!253235))

(assert (= (and b!253235 c!42704) b!253233))

(assert (= (and b!253235 (not c!42704)) b!253224))

(assert (= (and b!253233 res!123952) b!253228))

(assert (= (or b!253233 b!253224) bm!23867))

(declare-fun b_lambda!8145 () Bool)

(assert (=> (not b_lambda!8145) (not b!253227)))

(declare-fun t!8698 () Bool)

(declare-fun tb!2995 () Bool)

(assert (=> (and b!252867 (= (defaultEntry!4670 thiss!1504) (defaultEntry!4670 thiss!1504)) t!8698) tb!2995))

(declare-fun result!5323 () Bool)

(assert (=> tb!2995 (= result!5323 tp_is_empty!6517)))

(assert (=> b!253227 t!8698))

(declare-fun b_and!13713 () Bool)

(assert (= b_and!13707 (and (=> t!8698 result!5323) b_and!13713)))

(assert (=> b!253220 m!269197))

(assert (=> b!253220 m!269197))

(assert (=> b!253220 m!269201))

(assert (=> b!253236 m!269197))

(assert (=> b!253236 m!269197))

(assert (=> b!253236 m!269201))

(declare-fun m!269271 () Bool)

(assert (=> bm!23868 m!269271))

(declare-fun m!269273 () Bool)

(assert (=> b!253227 m!269273))

(assert (=> b!253227 m!269197))

(declare-fun m!269275 () Bool)

(assert (=> b!253227 m!269275))

(assert (=> b!253227 m!269197))

(declare-fun m!269277 () Bool)

(assert (=> b!253227 m!269277))

(assert (=> b!253227 m!269275))

(assert (=> b!253227 m!269273))

(declare-fun m!269279 () Bool)

(assert (=> b!253227 m!269279))

(assert (=> d!61497 m!269021))

(declare-fun m!269281 () Bool)

(assert (=> bm!23863 m!269281))

(declare-fun m!269283 () Bool)

(assert (=> b!253218 m!269283))

(declare-fun m!269285 () Bool)

(assert (=> b!253218 m!269285))

(declare-fun m!269287 () Bool)

(assert (=> b!253218 m!269287))

(declare-fun m!269289 () Bool)

(assert (=> b!253218 m!269289))

(declare-fun m!269291 () Bool)

(assert (=> b!253218 m!269291))

(declare-fun m!269293 () Bool)

(assert (=> b!253218 m!269293))

(declare-fun m!269295 () Bool)

(assert (=> b!253218 m!269295))

(assert (=> b!253218 m!269287))

(declare-fun m!269297 () Bool)

(assert (=> b!253218 m!269297))

(declare-fun m!269299 () Bool)

(assert (=> b!253218 m!269299))

(assert (=> b!253218 m!269291))

(declare-fun m!269301 () Bool)

(assert (=> b!253218 m!269301))

(declare-fun m!269303 () Bool)

(assert (=> b!253218 m!269303))

(declare-fun m!269305 () Bool)

(assert (=> b!253218 m!269305))

(assert (=> b!253218 m!269197))

(declare-fun m!269307 () Bool)

(assert (=> b!253218 m!269307))

(declare-fun m!269309 () Bool)

(assert (=> b!253218 m!269309))

(declare-fun m!269311 () Bool)

(assert (=> b!253218 m!269311))

(declare-fun m!269313 () Bool)

(assert (=> b!253218 m!269313))

(assert (=> b!253218 m!269293))

(assert (=> b!253218 m!269307))

(declare-fun m!269315 () Bool)

(assert (=> b!253231 m!269315))

(assert (=> bm!23864 m!269311))

(declare-fun m!269317 () Bool)

(assert (=> b!253228 m!269317))

(declare-fun m!269319 () Bool)

(assert (=> b!253226 m!269319))

(declare-fun m!269321 () Bool)

(assert (=> bm!23867 m!269321))

(assert (=> b!253219 m!269197))

(assert (=> b!253219 m!269197))

(declare-fun m!269323 () Bool)

(assert (=> b!253219 m!269323))

(assert (=> b!252872 d!61497))

(declare-fun d!61499 () Bool)

(assert (=> d!61499 (= (inRange!0 (ite c!42629 (index!6570 lt!126792) (index!6573 lt!126792)) (mask!10896 thiss!1504)) (and (bvsge (ite c!42629 (index!6570 lt!126792) (index!6573 lt!126792)) #b00000000000000000000000000000000) (bvslt (ite c!42629 (index!6570 lt!126792) (index!6573 lt!126792)) (bvadd (mask!10896 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23817 d!61499))

(declare-fun mapIsEmpty!11094 () Bool)

(declare-fun mapRes!11094 () Bool)

(assert (=> mapIsEmpty!11094 mapRes!11094))

(declare-fun b!253247 () Bool)

(declare-fun e!164194 () Bool)

(assert (=> b!253247 (= e!164194 tp_is_empty!6517)))

(declare-fun b!253248 () Bool)

(declare-fun e!164193 () Bool)

(assert (=> b!253248 (= e!164193 tp_is_empty!6517)))

(declare-fun mapNonEmpty!11094 () Bool)

(declare-fun tp!23262 () Bool)

(assert (=> mapNonEmpty!11094 (= mapRes!11094 (and tp!23262 e!164194))))

(declare-fun mapValue!11094 () ValueCell!2915)

(declare-fun mapRest!11094 () (Array (_ BitVec 32) ValueCell!2915))

(declare-fun mapKey!11094 () (_ BitVec 32))

(assert (=> mapNonEmpty!11094 (= mapRest!11085 (store mapRest!11094 mapKey!11094 mapValue!11094))))

(declare-fun condMapEmpty!11094 () Bool)

(declare-fun mapDefault!11094 () ValueCell!2915)

(assert (=> mapNonEmpty!11085 (= condMapEmpty!11094 (= mapRest!11085 ((as const (Array (_ BitVec 32) ValueCell!2915)) mapDefault!11094)))))

(assert (=> mapNonEmpty!11085 (= tp!23247 (and e!164193 mapRes!11094))))

(assert (= (and mapNonEmpty!11085 condMapEmpty!11094) mapIsEmpty!11094))

(assert (= (and mapNonEmpty!11085 (not condMapEmpty!11094)) mapNonEmpty!11094))

(assert (= (and mapNonEmpty!11094 ((_ is ValueCellFull!2915) mapValue!11094)) b!253247))

(assert (= (and mapNonEmpty!11085 ((_ is ValueCellFull!2915) mapDefault!11094)) b!253248))

(declare-fun m!269325 () Bool)

(assert (=> mapNonEmpty!11094 m!269325))

(declare-fun b_lambda!8147 () Bool)

(assert (= b_lambda!8145 (or (and b!252867 b_free!6655) b_lambda!8147)))

(check-sat (not b!253135) (not b!253155) (not b!253117) (not b!253151) (not b!253228) (not b!253132) (not b!253089) (not b!253156) (not b!253115) (not b!253108) (not b!253175) (not b!253162) (not d!61457) (not b!253139) (not bm!23836) (not d!61477) (not bm!23864) (not b!253133) (not bm!23863) (not b!253116) (not b_lambda!8147) (not d!61475) (not bm!23868) (not b!253096) (not bm!23842) (not bm!23867) (not d!61473) (not b!253173) (not b!253231) b_and!13713 (not d!61491) (not b!253219) (not b!253159) (not b!253218) (not b!253166) (not b!253087) (not b!253227) tp_is_empty!6517 (not bm!23848) (not b!253236) (not b_next!6655) (not bm!23847) (not b!253140) (not bm!23843) (not b!253220) (not d!61459) (not b!253122) (not b!253137) (not b!253090) (not bm!23846) (not bm!23835) (not b!253072) (not d!61495) (not mapNonEmpty!11094) (not d!61471) (not bm!23839) (not b!253226) (not b!253107) (not d!61497) (not d!61487))
(check-sat b_and!13713 (not b_next!6655))
