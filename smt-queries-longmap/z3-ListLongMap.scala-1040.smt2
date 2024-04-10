; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21924 () Bool)

(assert start!21924)

(declare-fun b!223056 () Bool)

(declare-fun b_free!5991 () Bool)

(declare-fun b_next!5991 () Bool)

(assert (=> b!223056 (= b_free!5991 (not b_next!5991))))

(declare-fun tp!21115 () Bool)

(declare-fun b_and!12889 () Bool)

(assert (=> b!223056 (= tp!21115 b_and!12889)))

(declare-fun mapIsEmpty!9949 () Bool)

(declare-fun mapRes!9949 () Bool)

(assert (=> mapIsEmpty!9949 mapRes!9949))

(declare-fun res!109567 () Bool)

(declare-fun e!144913 () Bool)

(assert (=> start!21924 (=> (not res!109567) (not e!144913))))

(declare-datatypes ((V!7451 0))(
  ( (V!7452 (val!2971 Int)) )
))
(declare-datatypes ((ValueCell!2583 0))(
  ( (ValueCellFull!2583 (v!4991 V!7451)) (EmptyCell!2583) )
))
(declare-datatypes ((array!10949 0))(
  ( (array!10950 (arr!5194 (Array (_ BitVec 32) ValueCell!2583)) (size!5527 (_ BitVec 32))) )
))
(declare-datatypes ((array!10951 0))(
  ( (array!10952 (arr!5195 (Array (_ BitVec 32) (_ BitVec 64))) (size!5528 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3066 0))(
  ( (LongMapFixedSize!3067 (defaultEntry!4192 Int) (mask!10016 (_ BitVec 32)) (extraKeys!3929 (_ BitVec 32)) (zeroValue!4033 V!7451) (minValue!4033 V!7451) (_size!1582 (_ BitVec 32)) (_keys!6246 array!10951) (_values!4175 array!10949) (_vacant!1582 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3066)

(declare-fun valid!1235 (LongMapFixedSize!3066) Bool)

(assert (=> start!21924 (= res!109567 (valid!1235 thiss!1504))))

(assert (=> start!21924 e!144913))

(declare-fun e!144922 () Bool)

(assert (=> start!21924 e!144922))

(assert (=> start!21924 true))

(declare-fun b!223025 () Bool)

(declare-datatypes ((Unit!6695 0))(
  ( (Unit!6696) )
))
(declare-fun e!144923 () Unit!6695)

(declare-fun Unit!6697 () Unit!6695)

(assert (=> b!223025 (= e!144923 Unit!6697)))

(declare-fun lt!112803 () Unit!6695)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!67 (array!10951 array!10949 (_ BitVec 32) (_ BitVec 32) V!7451 V!7451 (_ BitVec 64) (_ BitVec 32) Int) Unit!6695)

(assert (=> b!223025 (= lt!112803 (lemmaArrayContainsKeyThenInListMap!67 (_keys!6246 thiss!1504) (_values!4175 thiss!1504) (mask!10016 thiss!1504) (extraKeys!3929 thiss!1504) (zeroValue!4033 thiss!1504) (minValue!4033 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4192 thiss!1504)))))

(assert (=> b!223025 false))

(declare-fun b!223026 () Bool)

(declare-fun e!144924 () Bool)

(declare-fun e!144925 () Bool)

(assert (=> b!223026 (= e!144924 (and e!144925 mapRes!9949))))

(declare-fun condMapEmpty!9949 () Bool)

(declare-fun mapDefault!9949 () ValueCell!2583)

(assert (=> b!223026 (= condMapEmpty!9949 (= (arr!5194 (_values!4175 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2583)) mapDefault!9949)))))

(declare-fun b!223027 () Bool)

(declare-fun e!144927 () Bool)

(declare-fun e!144915 () Bool)

(assert (=> b!223027 (= e!144927 e!144915)))

(declare-fun res!109565 () Bool)

(declare-fun call!20807 () Bool)

(assert (=> b!223027 (= res!109565 call!20807)))

(assert (=> b!223027 (=> (not res!109565) (not e!144915))))

(declare-fun b!223028 () Bool)

(declare-fun e!144926 () Bool)

(declare-fun tp_is_empty!5853 () Bool)

(assert (=> b!223028 (= e!144926 tp_is_empty!5853)))

(declare-fun b!223029 () Bool)

(declare-fun res!109566 () Bool)

(declare-fun e!144916 () Bool)

(assert (=> b!223029 (=> res!109566 e!144916)))

(declare-datatypes ((List!3314 0))(
  ( (Nil!3311) (Cons!3310 (h!3958 (_ BitVec 64)) (t!8273 List!3314)) )
))
(declare-fun contains!1534 (List!3314 (_ BitVec 64)) Bool)

(assert (=> b!223029 (= res!109566 (contains!1534 Nil!3311 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223030 () Bool)

(declare-fun res!109550 () Bool)

(assert (=> b!223030 (=> (not res!109550) (not e!144913))))

(assert (=> b!223030 (= res!109550 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223031 () Bool)

(declare-fun e!144929 () Bool)

(declare-fun call!20808 () Bool)

(assert (=> b!223031 (= e!144929 (not call!20808))))

(declare-fun b!223032 () Bool)

(declare-fun res!109561 () Bool)

(assert (=> b!223032 (=> res!109561 e!144916)))

(declare-fun arrayNoDuplicates!0 (array!10951 (_ BitVec 32) List!3314) Bool)

(assert (=> b!223032 (= res!109561 (not (arrayNoDuplicates!0 (_keys!6246 thiss!1504) #b00000000000000000000000000000000 Nil!3311)))))

(declare-fun b!223033 () Bool)

(declare-fun res!109551 () Bool)

(assert (=> b!223033 (=> (not res!109551) (not e!144929))))

(declare-datatypes ((SeekEntryResult!844 0))(
  ( (MissingZero!844 (index!5546 (_ BitVec 32))) (Found!844 (index!5547 (_ BitVec 32))) (Intermediate!844 (undefined!1656 Bool) (index!5548 (_ BitVec 32)) (x!23080 (_ BitVec 32))) (Undefined!844) (MissingVacant!844 (index!5549 (_ BitVec 32))) )
))
(declare-fun lt!112798 () SeekEntryResult!844)

(assert (=> b!223033 (= res!109551 (= (select (arr!5195 (_keys!6246 thiss!1504)) (index!5546 lt!112798)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20804 () Bool)

(declare-fun c!37044 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20804 (= call!20807 (inRange!0 (ite c!37044 (index!5546 lt!112798) (index!5549 lt!112798)) (mask!10016 thiss!1504)))))

(declare-fun b!223034 () Bool)

(get-info :version)

(assert (=> b!223034 (= e!144927 ((_ is Undefined!844) lt!112798))))

(declare-fun b!223035 () Bool)

(declare-fun res!109559 () Bool)

(assert (=> b!223035 (=> res!109559 e!144916)))

(declare-fun noDuplicate!75 (List!3314) Bool)

(assert (=> b!223035 (= res!109559 (not (noDuplicate!75 Nil!3311)))))

(declare-fun b!223036 () Bool)

(declare-fun e!144914 () Bool)

(assert (=> b!223036 (= e!144913 e!144914)))

(declare-fun res!109558 () Bool)

(assert (=> b!223036 (=> (not res!109558) (not e!144914))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!223036 (= res!109558 (or (= lt!112798 (MissingZero!844 index!297)) (= lt!112798 (MissingVacant!844 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10951 (_ BitVec 32)) SeekEntryResult!844)

(assert (=> b!223036 (= lt!112798 (seekEntryOrOpen!0 key!932 (_keys!6246 thiss!1504) (mask!10016 thiss!1504)))))

(declare-fun b!223037 () Bool)

(assert (=> b!223037 (= e!144916 true)))

(declare-fun b!223038 () Bool)

(declare-fun res!109563 () Bool)

(assert (=> b!223038 (=> res!109563 e!144916)))

(declare-fun lt!112802 () Bool)

(assert (=> b!223038 (= res!109563 lt!112802)))

(declare-fun b!223039 () Bool)

(assert (=> b!223039 (= e!144915 (not call!20808))))

(declare-fun b!223040 () Bool)

(declare-fun e!144918 () Bool)

(assert (=> b!223040 (= e!144918 false)))

(declare-fun lt!112804 () Bool)

(assert (=> b!223040 (= lt!112804 e!144916)))

(declare-fun res!109548 () Bool)

(assert (=> b!223040 (=> res!109548 e!144916)))

(assert (=> b!223040 (= res!109548 (or (bvsge (size!5528 (_keys!6246 thiss!1504)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!5528 (_keys!6246 thiss!1504)))))))

(declare-fun lt!112801 () Unit!6695)

(assert (=> b!223040 (= lt!112801 e!144923)))

(declare-fun c!37043 () Bool)

(assert (=> b!223040 (= c!37043 lt!112802)))

(declare-fun arrayContainsKey!0 (array!10951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223040 (= lt!112802 (arrayContainsKey!0 (_keys!6246 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223041 () Bool)

(declare-fun res!109547 () Bool)

(assert (=> b!223041 (=> res!109547 e!144916)))

(declare-fun e!144919 () Bool)

(assert (=> b!223041 (= res!109547 e!144919)))

(declare-fun res!109560 () Bool)

(assert (=> b!223041 (=> (not res!109560) (not e!144919))))

(declare-fun e!144920 () Bool)

(assert (=> b!223041 (= res!109560 e!144920)))

(declare-fun res!109556 () Bool)

(assert (=> b!223041 (=> res!109556 e!144920)))

(assert (=> b!223041 (= res!109556 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!223042 () Bool)

(declare-fun e!144921 () Unit!6695)

(declare-fun lt!112800 () Unit!6695)

(assert (=> b!223042 (= e!144921 lt!112800)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!240 (array!10951 array!10949 (_ BitVec 32) (_ BitVec 32) V!7451 V!7451 (_ BitVec 64) Int) Unit!6695)

(assert (=> b!223042 (= lt!112800 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!240 (_keys!6246 thiss!1504) (_values!4175 thiss!1504) (mask!10016 thiss!1504) (extraKeys!3929 thiss!1504) (zeroValue!4033 thiss!1504) (minValue!4033 thiss!1504) key!932 (defaultEntry!4192 thiss!1504)))))

(assert (=> b!223042 (= c!37044 ((_ is MissingZero!844) lt!112798))))

(declare-fun e!144928 () Bool)

(assert (=> b!223042 e!144928))

(declare-fun b!223043 () Bool)

(declare-fun res!109564 () Bool)

(assert (=> b!223043 (=> res!109564 e!144916)))

(assert (=> b!223043 (= res!109564 (not (contains!1534 Nil!3311 key!932)))))

(declare-fun b!223044 () Bool)

(assert (=> b!223044 (= e!144925 tp_is_empty!5853)))

(declare-fun b!223045 () Bool)

(assert (=> b!223045 (= e!144920 (not (contains!1534 Nil!3311 key!932)))))

(declare-fun b!223046 () Bool)

(declare-fun res!109555 () Bool)

(assert (=> b!223046 (=> (not res!109555) (not e!144929))))

(assert (=> b!223046 (= res!109555 call!20807)))

(assert (=> b!223046 (= e!144928 e!144929)))

(declare-fun b!223047 () Bool)

(declare-fun Unit!6698 () Unit!6695)

(assert (=> b!223047 (= e!144923 Unit!6698)))

(declare-fun b!223048 () Bool)

(declare-fun e!144917 () Bool)

(assert (=> b!223048 (= e!144919 e!144917)))

(declare-fun res!109553 () Bool)

(assert (=> b!223048 (=> res!109553 e!144917)))

(assert (=> b!223048 (= res!109553 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!223049 () Bool)

(declare-fun c!37042 () Bool)

(assert (=> b!223049 (= c!37042 ((_ is MissingVacant!844) lt!112798))))

(assert (=> b!223049 (= e!144928 e!144927)))

(declare-fun b!223050 () Bool)

(declare-fun res!109562 () Bool)

(assert (=> b!223050 (= res!109562 (= (select (arr!5195 (_keys!6246 thiss!1504)) (index!5549 lt!112798)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!223050 (=> (not res!109562) (not e!144915))))

(declare-fun b!223051 () Bool)

(declare-fun Unit!6699 () Unit!6695)

(assert (=> b!223051 (= e!144921 Unit!6699)))

(declare-fun lt!112799 () Unit!6695)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!229 (array!10951 array!10949 (_ BitVec 32) (_ BitVec 32) V!7451 V!7451 (_ BitVec 64) Int) Unit!6695)

(assert (=> b!223051 (= lt!112799 (lemmaInListMapThenSeekEntryOrOpenFindsIt!229 (_keys!6246 thiss!1504) (_values!4175 thiss!1504) (mask!10016 thiss!1504) (extraKeys!3929 thiss!1504) (zeroValue!4033 thiss!1504) (minValue!4033 thiss!1504) key!932 (defaultEntry!4192 thiss!1504)))))

(assert (=> b!223051 false))

(declare-fun b!223052 () Bool)

(assert (=> b!223052 (= e!144914 e!144918)))

(declare-fun res!109552 () Bool)

(assert (=> b!223052 (=> (not res!109552) (not e!144918))))

(assert (=> b!223052 (= res!109552 (inRange!0 index!297 (mask!10016 thiss!1504)))))

(declare-fun lt!112805 () Unit!6695)

(assert (=> b!223052 (= lt!112805 e!144921)))

(declare-fun c!37041 () Bool)

(declare-datatypes ((tuple2!4408 0))(
  ( (tuple2!4409 (_1!2215 (_ BitVec 64)) (_2!2215 V!7451)) )
))
(declare-datatypes ((List!3315 0))(
  ( (Nil!3312) (Cons!3311 (h!3959 tuple2!4408) (t!8274 List!3315)) )
))
(declare-datatypes ((ListLongMap!3321 0))(
  ( (ListLongMap!3322 (toList!1676 List!3315)) )
))
(declare-fun contains!1535 (ListLongMap!3321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1204 (array!10951 array!10949 (_ BitVec 32) (_ BitVec 32) V!7451 V!7451 (_ BitVec 32) Int) ListLongMap!3321)

(assert (=> b!223052 (= c!37041 (contains!1535 (getCurrentListMap!1204 (_keys!6246 thiss!1504) (_values!4175 thiss!1504) (mask!10016 thiss!1504) (extraKeys!3929 thiss!1504) (zeroValue!4033 thiss!1504) (minValue!4033 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4192 thiss!1504)) key!932))))

(declare-fun b!223053 () Bool)

(declare-fun res!109549 () Bool)

(assert (=> b!223053 (=> res!109549 e!144916)))

(assert (=> b!223053 (= res!109549 (contains!1534 Nil!3311 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223054 () Bool)

(declare-fun res!109557 () Bool)

(assert (=> b!223054 (=> res!109557 e!144916)))

(assert (=> b!223054 (= res!109557 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5528 (_keys!6246 thiss!1504)))))))

(declare-fun b!223055 () Bool)

(declare-fun res!109554 () Bool)

(assert (=> b!223055 (=> res!109554 e!144916)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223055 (= res!109554 (not (validKeyInArray!0 key!932)))))

(declare-fun bm!20805 () Bool)

(assert (=> bm!20805 (= call!20808 (arrayContainsKey!0 (_keys!6246 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9949 () Bool)

(declare-fun tp!21114 () Bool)

(assert (=> mapNonEmpty!9949 (= mapRes!9949 (and tp!21114 e!144926))))

(declare-fun mapKey!9949 () (_ BitVec 32))

(declare-fun mapRest!9949 () (Array (_ BitVec 32) ValueCell!2583))

(declare-fun mapValue!9949 () ValueCell!2583)

(assert (=> mapNonEmpty!9949 (= (arr!5194 (_values!4175 thiss!1504)) (store mapRest!9949 mapKey!9949 mapValue!9949))))

(declare-fun array_inv!3439 (array!10951) Bool)

(declare-fun array_inv!3440 (array!10949) Bool)

(assert (=> b!223056 (= e!144922 (and tp!21115 tp_is_empty!5853 (array_inv!3439 (_keys!6246 thiss!1504)) (array_inv!3440 (_values!4175 thiss!1504)) e!144924))))

(declare-fun b!223057 () Bool)

(assert (=> b!223057 (= e!144917 (contains!1534 Nil!3311 key!932))))

(assert (= (and start!21924 res!109567) b!223030))

(assert (= (and b!223030 res!109550) b!223036))

(assert (= (and b!223036 res!109558) b!223052))

(assert (= (and b!223052 c!37041) b!223051))

(assert (= (and b!223052 (not c!37041)) b!223042))

(assert (= (and b!223042 c!37044) b!223046))

(assert (= (and b!223042 (not c!37044)) b!223049))

(assert (= (and b!223046 res!109555) b!223033))

(assert (= (and b!223033 res!109551) b!223031))

(assert (= (and b!223049 c!37042) b!223027))

(assert (= (and b!223049 (not c!37042)) b!223034))

(assert (= (and b!223027 res!109565) b!223050))

(assert (= (and b!223050 res!109562) b!223039))

(assert (= (or b!223046 b!223027) bm!20804))

(assert (= (or b!223031 b!223039) bm!20805))

(assert (= (and b!223052 res!109552) b!223040))

(assert (= (and b!223040 c!37043) b!223025))

(assert (= (and b!223040 (not c!37043)) b!223047))

(assert (= (and b!223040 (not res!109548)) b!223035))

(assert (= (and b!223035 (not res!109559)) b!223029))

(assert (= (and b!223029 (not res!109566)) b!223053))

(assert (= (and b!223053 (not res!109549)) b!223041))

(assert (= (and b!223041 (not res!109556)) b!223045))

(assert (= (and b!223041 res!109560) b!223048))

(assert (= (and b!223048 (not res!109553)) b!223057))

(assert (= (and b!223041 (not res!109547)) b!223032))

(assert (= (and b!223032 (not res!109561)) b!223054))

(assert (= (and b!223054 (not res!109557)) b!223055))

(assert (= (and b!223055 (not res!109554)) b!223038))

(assert (= (and b!223038 (not res!109563)) b!223043))

(assert (= (and b!223043 (not res!109564)) b!223037))

(assert (= (and b!223026 condMapEmpty!9949) mapIsEmpty!9949))

(assert (= (and b!223026 (not condMapEmpty!9949)) mapNonEmpty!9949))

(assert (= (and mapNonEmpty!9949 ((_ is ValueCellFull!2583) mapValue!9949)) b!223028))

(assert (= (and b!223026 ((_ is ValueCellFull!2583) mapDefault!9949)) b!223044))

(assert (= b!223056 b!223026))

(assert (= start!21924 b!223056))

(declare-fun m!246827 () Bool)

(assert (=> b!223040 m!246827))

(declare-fun m!246829 () Bool)

(assert (=> b!223052 m!246829))

(declare-fun m!246831 () Bool)

(assert (=> b!223052 m!246831))

(assert (=> b!223052 m!246831))

(declare-fun m!246833 () Bool)

(assert (=> b!223052 m!246833))

(declare-fun m!246835 () Bool)

(assert (=> b!223042 m!246835))

(declare-fun m!246837 () Bool)

(assert (=> b!223045 m!246837))

(assert (=> b!223043 m!246837))

(declare-fun m!246839 () Bool)

(assert (=> b!223053 m!246839))

(declare-fun m!246841 () Bool)

(assert (=> b!223029 m!246841))

(declare-fun m!246843 () Bool)

(assert (=> b!223050 m!246843))

(assert (=> b!223057 m!246837))

(declare-fun m!246845 () Bool)

(assert (=> start!21924 m!246845))

(declare-fun m!246847 () Bool)

(assert (=> b!223036 m!246847))

(declare-fun m!246849 () Bool)

(assert (=> b!223056 m!246849))

(declare-fun m!246851 () Bool)

(assert (=> b!223056 m!246851))

(declare-fun m!246853 () Bool)

(assert (=> b!223025 m!246853))

(assert (=> bm!20805 m!246827))

(declare-fun m!246855 () Bool)

(assert (=> b!223035 m!246855))

(declare-fun m!246857 () Bool)

(assert (=> b!223033 m!246857))

(declare-fun m!246859 () Bool)

(assert (=> mapNonEmpty!9949 m!246859))

(declare-fun m!246861 () Bool)

(assert (=> bm!20804 m!246861))

(declare-fun m!246863 () Bool)

(assert (=> b!223051 m!246863))

(declare-fun m!246865 () Bool)

(assert (=> b!223032 m!246865))

(declare-fun m!246867 () Bool)

(assert (=> b!223055 m!246867))

(check-sat (not b!223057) tp_is_empty!5853 (not b!223056) (not mapNonEmpty!9949) (not start!21924) (not b!223040) (not b!223051) (not b!223052) (not b!223042) (not b!223029) (not b!223032) (not b_next!5991) (not b!223053) (not b!223035) b_and!12889 (not b!223045) (not b!223025) (not b!223043) (not bm!20805) (not b!223036) (not bm!20804) (not b!223055))
(check-sat b_and!12889 (not b_next!5991))
