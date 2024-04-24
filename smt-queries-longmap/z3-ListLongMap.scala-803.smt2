; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19292 () Bool)

(assert start!19292)

(declare-fun b!189839 () Bool)

(declare-fun b_free!4657 () Bool)

(declare-fun b_next!4657 () Bool)

(assert (=> b!189839 (= b_free!4657 (not b_next!4657))))

(declare-fun tp!16807 () Bool)

(declare-fun b_and!11313 () Bool)

(assert (=> b!189839 (= tp!16807 b_and!11313)))

(declare-fun e!124928 () Bool)

(declare-datatypes ((V!5553 0))(
  ( (V!5554 (val!2259 Int)) )
))
(declare-datatypes ((ValueCell!1871 0))(
  ( (ValueCellFull!1871 (v!4184 V!5553)) (EmptyCell!1871) )
))
(declare-datatypes ((array!8075 0))(
  ( (array!8076 (arr!3806 (Array (_ BitVec 32) (_ BitVec 64))) (size!4126 (_ BitVec 32))) )
))
(declare-datatypes ((array!8077 0))(
  ( (array!8078 (arr!3807 (Array (_ BitVec 32) ValueCell!1871)) (size!4127 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2650 0))(
  ( (LongMapFixedSize!2651 (defaultEntry!3873 Int) (mask!9066 (_ BitVec 32)) (extraKeys!3610 (_ BitVec 32)) (zeroValue!3714 V!5553) (minValue!3714 V!5553) (_size!1374 (_ BitVec 32)) (_keys!5841 array!8075) (_values!3856 array!8077) (_vacant!1374 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2650)

(declare-fun e!124930 () Bool)

(declare-fun tp_is_empty!4429 () Bool)

(declare-fun array_inv!2455 (array!8075) Bool)

(declare-fun array_inv!2456 (array!8077) Bool)

(assert (=> b!189839 (= e!124930 (and tp!16807 tp_is_empty!4429 (array_inv!2455 (_keys!5841 thiss!1248)) (array_inv!2456 (_values!3856 thiss!1248)) e!124928))))

(declare-fun b!189840 () Bool)

(declare-fun e!124922 () Bool)

(assert (=> b!189840 (= e!124922 tp_is_empty!4429)))

(declare-fun res!89762 () Bool)

(declare-fun e!124923 () Bool)

(assert (=> start!19292 (=> (not res!89762) (not e!124923))))

(declare-fun valid!1115 (LongMapFixedSize!2650) Bool)

(assert (=> start!19292 (= res!89762 (valid!1115 thiss!1248))))

(assert (=> start!19292 e!124923))

(assert (=> start!19292 e!124930))

(assert (=> start!19292 true))

(assert (=> start!19292 tp_is_empty!4429))

(declare-fun b!189841 () Bool)

(declare-fun res!89763 () Bool)

(assert (=> b!189841 (=> (not res!89763) (not e!124923))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!189841 (= res!89763 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189842 () Bool)

(declare-fun e!124925 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!189842 (= e!124925 (not (validMask!0 (mask!9066 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!658 0))(
  ( (MissingZero!658 (index!4802 (_ BitVec 32))) (Found!658 (index!4803 (_ BitVec 32))) (Intermediate!658 (undefined!1470 Bool) (index!4804 (_ BitVec 32)) (x!20442 (_ BitVec 32))) (Undefined!658) (MissingVacant!658 (index!4805 (_ BitVec 32))) )
))
(declare-fun lt!94035 () SeekEntryResult!658)

(declare-datatypes ((tuple2!3458 0))(
  ( (tuple2!3459 (_1!1740 (_ BitVec 64)) (_2!1740 V!5553)) )
))
(declare-datatypes ((List!2374 0))(
  ( (Nil!2371) (Cons!2370 (h!3007 tuple2!3458) (t!7272 List!2374)) )
))
(declare-datatypes ((ListLongMap!2379 0))(
  ( (ListLongMap!2380 (toList!1205 List!2374)) )
))
(declare-fun lt!94040 () ListLongMap!2379)

(declare-fun v!309 () V!5553)

(declare-fun +!298 (ListLongMap!2379 tuple2!3458) ListLongMap!2379)

(declare-fun getCurrentListMap!857 (array!8075 array!8077 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 32) Int) ListLongMap!2379)

(assert (=> b!189842 (= (+!298 lt!94040 (tuple2!3459 key!828 v!309)) (getCurrentListMap!857 (_keys!5841 thiss!1248) (array!8078 (store (arr!3807 (_values!3856 thiss!1248)) (index!4803 lt!94035) (ValueCellFull!1871 v!309)) (size!4127 (_values!3856 thiss!1248))) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-datatypes ((Unit!5724 0))(
  ( (Unit!5725) )
))
(declare-fun lt!94038 () Unit!5724)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!102 (array!8075 array!8077 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 32) (_ BitVec 64) V!5553 Int) Unit!5724)

(assert (=> b!189842 (= lt!94038 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!102 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) (index!4803 lt!94035) key!828 v!309 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!94036 () Unit!5724)

(declare-fun e!124929 () Unit!5724)

(assert (=> b!189842 (= lt!94036 e!124929)))

(declare-fun c!34113 () Bool)

(declare-fun contains!1325 (ListLongMap!2379 (_ BitVec 64)) Bool)

(assert (=> b!189842 (= c!34113 (contains!1325 lt!94040 key!828))))

(assert (=> b!189842 (= lt!94040 (getCurrentListMap!857 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun mapIsEmpty!7642 () Bool)

(declare-fun mapRes!7642 () Bool)

(assert (=> mapIsEmpty!7642 mapRes!7642))

(declare-fun b!189843 () Bool)

(declare-fun e!124926 () Bool)

(assert (=> b!189843 (= e!124926 (= (select (arr!3806 (_keys!5841 thiss!1248)) (index!4803 lt!94035)) key!828))))

(declare-fun b!189844 () Bool)

(declare-fun Unit!5726 () Unit!5724)

(assert (=> b!189844 (= e!124929 Unit!5726)))

(declare-fun lt!94037 () Unit!5724)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!162 (array!8075 array!8077 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 64) Int) Unit!5724)

(assert (=> b!189844 (= lt!94037 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!162 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)))))

(assert (=> b!189844 false))

(declare-fun mapNonEmpty!7642 () Bool)

(declare-fun tp!16806 () Bool)

(assert (=> mapNonEmpty!7642 (= mapRes!7642 (and tp!16806 e!124922))))

(declare-fun mapValue!7642 () ValueCell!1871)

(declare-fun mapKey!7642 () (_ BitVec 32))

(declare-fun mapRest!7642 () (Array (_ BitVec 32) ValueCell!1871))

(assert (=> mapNonEmpty!7642 (= (arr!3807 (_values!3856 thiss!1248)) (store mapRest!7642 mapKey!7642 mapValue!7642))))

(declare-fun b!189845 () Bool)

(declare-fun e!124927 () Bool)

(assert (=> b!189845 (= e!124928 (and e!124927 mapRes!7642))))

(declare-fun condMapEmpty!7642 () Bool)

(declare-fun mapDefault!7642 () ValueCell!1871)

(assert (=> b!189845 (= condMapEmpty!7642 (= (arr!3807 (_values!3856 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1871)) mapDefault!7642)))))

(declare-fun b!189846 () Bool)

(assert (=> b!189846 (= e!124923 e!124925)))

(declare-fun res!89764 () Bool)

(assert (=> b!189846 (=> (not res!89764) (not e!124925))))

(get-info :version)

(assert (=> b!189846 (= res!89764 (and (not ((_ is Undefined!658) lt!94035)) (not ((_ is MissingVacant!658) lt!94035)) (not ((_ is MissingZero!658) lt!94035)) ((_ is Found!658) lt!94035)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8075 (_ BitVec 32)) SeekEntryResult!658)

(assert (=> b!189846 (= lt!94035 (seekEntryOrOpen!0 key!828 (_keys!5841 thiss!1248) (mask!9066 thiss!1248)))))

(declare-fun b!189847 () Bool)

(assert (=> b!189847 (= e!124927 tp_is_empty!4429)))

(declare-fun b!189848 () Bool)

(declare-fun lt!94039 () Unit!5724)

(assert (=> b!189848 (= e!124929 lt!94039)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!168 (array!8075 array!8077 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 64) Int) Unit!5724)

(assert (=> b!189848 (= lt!94039 (lemmaInListMapThenSeekEntryOrOpenFindsIt!168 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)))))

(declare-fun res!89761 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189848 (= res!89761 (inRange!0 (index!4803 lt!94035) (mask!9066 thiss!1248)))))

(assert (=> b!189848 (=> (not res!89761) (not e!124926))))

(assert (=> b!189848 e!124926))

(assert (= (and start!19292 res!89762) b!189841))

(assert (= (and b!189841 res!89763) b!189846))

(assert (= (and b!189846 res!89764) b!189842))

(assert (= (and b!189842 c!34113) b!189848))

(assert (= (and b!189842 (not c!34113)) b!189844))

(assert (= (and b!189848 res!89761) b!189843))

(assert (= (and b!189845 condMapEmpty!7642) mapIsEmpty!7642))

(assert (= (and b!189845 (not condMapEmpty!7642)) mapNonEmpty!7642))

(assert (= (and mapNonEmpty!7642 ((_ is ValueCellFull!1871) mapValue!7642)) b!189840))

(assert (= (and b!189845 ((_ is ValueCellFull!1871) mapDefault!7642)) b!189847))

(assert (= b!189839 b!189845))

(assert (= start!19292 b!189839))

(declare-fun m!216289 () Bool)

(assert (=> b!189848 m!216289))

(declare-fun m!216291 () Bool)

(assert (=> b!189848 m!216291))

(declare-fun m!216293 () Bool)

(assert (=> b!189843 m!216293))

(declare-fun m!216295 () Bool)

(assert (=> start!19292 m!216295))

(declare-fun m!216297 () Bool)

(assert (=> b!189844 m!216297))

(declare-fun m!216299 () Bool)

(assert (=> b!189842 m!216299))

(declare-fun m!216301 () Bool)

(assert (=> b!189842 m!216301))

(declare-fun m!216303 () Bool)

(assert (=> b!189842 m!216303))

(declare-fun m!216305 () Bool)

(assert (=> b!189842 m!216305))

(declare-fun m!216307 () Bool)

(assert (=> b!189842 m!216307))

(declare-fun m!216309 () Bool)

(assert (=> b!189842 m!216309))

(declare-fun m!216311 () Bool)

(assert (=> b!189842 m!216311))

(declare-fun m!216313 () Bool)

(assert (=> b!189846 m!216313))

(declare-fun m!216315 () Bool)

(assert (=> mapNonEmpty!7642 m!216315))

(declare-fun m!216317 () Bool)

(assert (=> b!189839 m!216317))

(declare-fun m!216319 () Bool)

(assert (=> b!189839 m!216319))

(check-sat tp_is_empty!4429 (not b!189848) b_and!11313 (not b!189846) (not b_next!4657) (not mapNonEmpty!7642) (not b!189839) (not start!19292) (not b!189842) (not b!189844))
(check-sat b_and!11313 (not b_next!4657))
(get-model)

(declare-fun b!189951 () Bool)

(declare-fun e!125014 () ListLongMap!2379)

(declare-fun call!19141 () ListLongMap!2379)

(assert (=> b!189951 (= e!125014 call!19141)))

(declare-fun b!189952 () Bool)

(declare-fun e!125022 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!189952 (= e!125022 (validKeyInArray!0 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189953 () Bool)

(declare-fun res!89808 () Bool)

(declare-fun e!125020 () Bool)

(assert (=> b!189953 (=> (not res!89808) (not e!125020))))

(declare-fun e!125018 () Bool)

(assert (=> b!189953 (= res!89808 e!125018)))

(declare-fun res!89814 () Bool)

(assert (=> b!189953 (=> res!89814 e!125018)))

(declare-fun e!125012 () Bool)

(assert (=> b!189953 (= res!89814 (not e!125012))))

(declare-fun res!89815 () Bool)

(assert (=> b!189953 (=> (not res!89815) (not e!125012))))

(assert (=> b!189953 (= res!89815 (bvslt #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))))))

(declare-fun b!189954 () Bool)

(declare-fun e!125013 () ListLongMap!2379)

(declare-fun e!125019 () ListLongMap!2379)

(assert (=> b!189954 (= e!125013 e!125019)))

(declare-fun c!34137 () Bool)

(assert (=> b!189954 (= c!34137 (and (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189955 () Bool)

(declare-fun call!19145 () ListLongMap!2379)

(assert (=> b!189955 (= e!125013 (+!298 call!19145 (tuple2!3459 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3714 thiss!1248))))))

(declare-fun b!189956 () Bool)

(declare-fun e!125017 () Bool)

(assert (=> b!189956 (= e!125020 e!125017)))

(declare-fun c!34132 () Bool)

(assert (=> b!189956 (= c!34132 (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19136 () Bool)

(declare-fun call!19139 () ListLongMap!2379)

(assert (=> bm!19136 (= call!19141 call!19139)))

(declare-fun b!189957 () Bool)

(declare-fun call!19142 () ListLongMap!2379)

(assert (=> b!189957 (= e!125014 call!19142)))

(declare-fun b!189958 () Bool)

(declare-fun e!125023 () Bool)

(declare-fun call!19143 () Bool)

(assert (=> b!189958 (= e!125023 (not call!19143))))

(declare-fun bm!19138 () Bool)

(declare-fun call!19140 () ListLongMap!2379)

(assert (=> bm!19138 (= call!19139 call!19140)))

(declare-fun b!189959 () Bool)

(declare-fun e!125015 () Bool)

(declare-fun lt!94135 () ListLongMap!2379)

(declare-fun apply!178 (ListLongMap!2379 (_ BitVec 64)) V!5553)

(assert (=> b!189959 (= e!125015 (= (apply!178 lt!94135 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3714 thiss!1248)))))

(declare-fun bm!19139 () Bool)

(assert (=> bm!19139 (= call!19142 call!19145)))

(declare-fun b!189960 () Bool)

(declare-fun e!125021 () Unit!5724)

(declare-fun lt!94125 () Unit!5724)

(assert (=> b!189960 (= e!125021 lt!94125)))

(declare-fun lt!94126 () ListLongMap!2379)

(declare-fun getCurrentListMapNoExtraKeys!209 (array!8075 array!8077 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 32) Int) ListLongMap!2379)

(assert (=> b!189960 (= lt!94126 (getCurrentListMapNoExtraKeys!209 (_keys!5841 thiss!1248) (array!8078 (store (arr!3807 (_values!3856 thiss!1248)) (index!4803 lt!94035) (ValueCellFull!1871 v!309)) (size!4127 (_values!3856 thiss!1248))) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!94123 () (_ BitVec 64))

(assert (=> b!189960 (= lt!94123 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94130 () (_ BitVec 64))

(assert (=> b!189960 (= lt!94130 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94136 () Unit!5724)

(declare-fun addStillContains!154 (ListLongMap!2379 (_ BitVec 64) V!5553 (_ BitVec 64)) Unit!5724)

(assert (=> b!189960 (= lt!94136 (addStillContains!154 lt!94126 lt!94123 (zeroValue!3714 thiss!1248) lt!94130))))

(assert (=> b!189960 (contains!1325 (+!298 lt!94126 (tuple2!3459 lt!94123 (zeroValue!3714 thiss!1248))) lt!94130)))

(declare-fun lt!94131 () Unit!5724)

(assert (=> b!189960 (= lt!94131 lt!94136)))

(declare-fun lt!94139 () ListLongMap!2379)

(assert (=> b!189960 (= lt!94139 (getCurrentListMapNoExtraKeys!209 (_keys!5841 thiss!1248) (array!8078 (store (arr!3807 (_values!3856 thiss!1248)) (index!4803 lt!94035) (ValueCellFull!1871 v!309)) (size!4127 (_values!3856 thiss!1248))) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!94134 () (_ BitVec 64))

(assert (=> b!189960 (= lt!94134 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94133 () (_ BitVec 64))

(assert (=> b!189960 (= lt!94133 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94124 () Unit!5724)

(declare-fun addApplyDifferent!154 (ListLongMap!2379 (_ BitVec 64) V!5553 (_ BitVec 64)) Unit!5724)

(assert (=> b!189960 (= lt!94124 (addApplyDifferent!154 lt!94139 lt!94134 (minValue!3714 thiss!1248) lt!94133))))

(assert (=> b!189960 (= (apply!178 (+!298 lt!94139 (tuple2!3459 lt!94134 (minValue!3714 thiss!1248))) lt!94133) (apply!178 lt!94139 lt!94133))))

(declare-fun lt!94127 () Unit!5724)

(assert (=> b!189960 (= lt!94127 lt!94124)))

(declare-fun lt!94132 () ListLongMap!2379)

(assert (=> b!189960 (= lt!94132 (getCurrentListMapNoExtraKeys!209 (_keys!5841 thiss!1248) (array!8078 (store (arr!3807 (_values!3856 thiss!1248)) (index!4803 lt!94035) (ValueCellFull!1871 v!309)) (size!4127 (_values!3856 thiss!1248))) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!94142 () (_ BitVec 64))

(assert (=> b!189960 (= lt!94142 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94138 () (_ BitVec 64))

(assert (=> b!189960 (= lt!94138 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94128 () Unit!5724)

(assert (=> b!189960 (= lt!94128 (addApplyDifferent!154 lt!94132 lt!94142 (zeroValue!3714 thiss!1248) lt!94138))))

(assert (=> b!189960 (= (apply!178 (+!298 lt!94132 (tuple2!3459 lt!94142 (zeroValue!3714 thiss!1248))) lt!94138) (apply!178 lt!94132 lt!94138))))

(declare-fun lt!94141 () Unit!5724)

(assert (=> b!189960 (= lt!94141 lt!94128)))

(declare-fun lt!94129 () ListLongMap!2379)

(assert (=> b!189960 (= lt!94129 (getCurrentListMapNoExtraKeys!209 (_keys!5841 thiss!1248) (array!8078 (store (arr!3807 (_values!3856 thiss!1248)) (index!4803 lt!94035) (ValueCellFull!1871 v!309)) (size!4127 (_values!3856 thiss!1248))) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!94137 () (_ BitVec 64))

(assert (=> b!189960 (= lt!94137 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94140 () (_ BitVec 64))

(assert (=> b!189960 (= lt!94140 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189960 (= lt!94125 (addApplyDifferent!154 lt!94129 lt!94137 (minValue!3714 thiss!1248) lt!94140))))

(assert (=> b!189960 (= (apply!178 (+!298 lt!94129 (tuple2!3459 lt!94137 (minValue!3714 thiss!1248))) lt!94140) (apply!178 lt!94129 lt!94140))))

(declare-fun bm!19140 () Bool)

(declare-fun call!19144 () Bool)

(assert (=> bm!19140 (= call!19144 (contains!1325 lt!94135 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189961 () Bool)

(declare-fun e!125016 () Bool)

(assert (=> b!189961 (= e!125023 e!125016)))

(declare-fun res!89813 () Bool)

(assert (=> b!189961 (= res!89813 call!19143)))

(assert (=> b!189961 (=> (not res!89813) (not e!125016))))

(declare-fun b!189962 () Bool)

(declare-fun e!125011 () Bool)

(assert (=> b!189962 (= e!125018 e!125011)))

(declare-fun res!89807 () Bool)

(assert (=> b!189962 (=> (not res!89807) (not e!125011))))

(assert (=> b!189962 (= res!89807 (contains!1325 lt!94135 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189962 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))))))

(declare-fun bm!19141 () Bool)

(assert (=> bm!19141 (= call!19140 (getCurrentListMapNoExtraKeys!209 (_keys!5841 thiss!1248) (array!8078 (store (arr!3807 (_values!3856 thiss!1248)) (index!4803 lt!94035) (ValueCellFull!1871 v!309)) (size!4127 (_values!3856 thiss!1248))) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun b!189963 () Bool)

(declare-fun get!2201 (ValueCell!1871 V!5553) V!5553)

(declare-fun dynLambda!521 (Int (_ BitVec 64)) V!5553)

(assert (=> b!189963 (= e!125011 (= (apply!178 lt!94135 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000)) (get!2201 (select (arr!3807 (array!8078 (store (arr!3807 (_values!3856 thiss!1248)) (index!4803 lt!94035) (ValueCellFull!1871 v!309)) (size!4127 (_values!3856 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!521 (defaultEntry!3873 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4127 (array!8078 (store (arr!3807 (_values!3856 thiss!1248)) (index!4803 lt!94035) (ValueCellFull!1871 v!309)) (size!4127 (_values!3856 thiss!1248))))))))

(assert (=> b!189963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))))))

(declare-fun b!189964 () Bool)

(assert (=> b!189964 (= e!125017 e!125015)))

(declare-fun res!89811 () Bool)

(assert (=> b!189964 (= res!89811 call!19144)))

(assert (=> b!189964 (=> (not res!89811) (not e!125015))))

(declare-fun b!189965 () Bool)

(assert (=> b!189965 (= e!125019 call!19142)))

(declare-fun b!189966 () Bool)

(assert (=> b!189966 (= e!125017 (not call!19144))))

(declare-fun b!189967 () Bool)

(declare-fun res!89809 () Bool)

(assert (=> b!189967 (=> (not res!89809) (not e!125020))))

(assert (=> b!189967 (= res!89809 e!125023)))

(declare-fun c!34135 () Bool)

(assert (=> b!189967 (= c!34135 (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!189968 () Bool)

(assert (=> b!189968 (= e!125012 (validKeyInArray!0 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189969 () Bool)

(declare-fun c!34134 () Bool)

(assert (=> b!189969 (= c!34134 (and (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!189969 (= e!125019 e!125014)))

(declare-fun b!189970 () Bool)

(assert (=> b!189970 (= e!125016 (= (apply!178 lt!94135 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3714 thiss!1248)))))

(declare-fun d!55817 () Bool)

(assert (=> d!55817 e!125020))

(declare-fun res!89810 () Bool)

(assert (=> d!55817 (=> (not res!89810) (not e!125020))))

(assert (=> d!55817 (= res!89810 (or (bvsge #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))))))))

(declare-fun lt!94122 () ListLongMap!2379)

(assert (=> d!55817 (= lt!94135 lt!94122)))

(declare-fun lt!94121 () Unit!5724)

(assert (=> d!55817 (= lt!94121 e!125021)))

(declare-fun c!34133 () Bool)

(assert (=> d!55817 (= c!34133 e!125022)))

(declare-fun res!89812 () Bool)

(assert (=> d!55817 (=> (not res!89812) (not e!125022))))

(assert (=> d!55817 (= res!89812 (bvslt #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))))))

(assert (=> d!55817 (= lt!94122 e!125013)))

(declare-fun c!34136 () Bool)

(assert (=> d!55817 (= c!34136 (and (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55817 (validMask!0 (mask!9066 thiss!1248))))

(assert (=> d!55817 (= (getCurrentListMap!857 (_keys!5841 thiss!1248) (array!8078 (store (arr!3807 (_values!3856 thiss!1248)) (index!4803 lt!94035) (ValueCellFull!1871 v!309)) (size!4127 (_values!3856 thiss!1248))) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)) lt!94135)))

(declare-fun bm!19137 () Bool)

(assert (=> bm!19137 (= call!19143 (contains!1325 lt!94135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189971 () Bool)

(declare-fun Unit!5730 () Unit!5724)

(assert (=> b!189971 (= e!125021 Unit!5730)))

(declare-fun bm!19142 () Bool)

(assert (=> bm!19142 (= call!19145 (+!298 (ite c!34136 call!19140 (ite c!34137 call!19139 call!19141)) (ite (or c!34136 c!34137) (tuple2!3459 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3714 thiss!1248)) (tuple2!3459 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3714 thiss!1248)))))))

(assert (= (and d!55817 c!34136) b!189955))

(assert (= (and d!55817 (not c!34136)) b!189954))

(assert (= (and b!189954 c!34137) b!189965))

(assert (= (and b!189954 (not c!34137)) b!189969))

(assert (= (and b!189969 c!34134) b!189957))

(assert (= (and b!189969 (not c!34134)) b!189951))

(assert (= (or b!189957 b!189951) bm!19136))

(assert (= (or b!189965 bm!19136) bm!19138))

(assert (= (or b!189965 b!189957) bm!19139))

(assert (= (or b!189955 bm!19138) bm!19141))

(assert (= (or b!189955 bm!19139) bm!19142))

(assert (= (and d!55817 res!89812) b!189952))

(assert (= (and d!55817 c!34133) b!189960))

(assert (= (and d!55817 (not c!34133)) b!189971))

(assert (= (and d!55817 res!89810) b!189953))

(assert (= (and b!189953 res!89815) b!189968))

(assert (= (and b!189953 (not res!89814)) b!189962))

(assert (= (and b!189962 res!89807) b!189963))

(assert (= (and b!189953 res!89808) b!189967))

(assert (= (and b!189967 c!34135) b!189961))

(assert (= (and b!189967 (not c!34135)) b!189958))

(assert (= (and b!189961 res!89813) b!189970))

(assert (= (or b!189961 b!189958) bm!19137))

(assert (= (and b!189967 res!89809) b!189956))

(assert (= (and b!189956 c!34132) b!189964))

(assert (= (and b!189956 (not c!34132)) b!189966))

(assert (= (and b!189964 res!89811) b!189959))

(assert (= (or b!189964 b!189966) bm!19140))

(declare-fun b_lambda!7357 () Bool)

(assert (=> (not b_lambda!7357) (not b!189963)))

(declare-fun t!7275 () Bool)

(declare-fun tb!2859 () Bool)

(assert (=> (and b!189839 (= (defaultEntry!3873 thiss!1248) (defaultEntry!3873 thiss!1248)) t!7275) tb!2859))

(declare-fun result!4871 () Bool)

(assert (=> tb!2859 (= result!4871 tp_is_empty!4429)))

(assert (=> b!189963 t!7275))

(declare-fun b_and!11319 () Bool)

(assert (= b_and!11313 (and (=> t!7275 result!4871) b_and!11319)))

(declare-fun m!216385 () Bool)

(assert (=> bm!19142 m!216385))

(declare-fun m!216387 () Bool)

(assert (=> bm!19137 m!216387))

(declare-fun m!216389 () Bool)

(assert (=> b!189955 m!216389))

(declare-fun m!216391 () Bool)

(assert (=> b!189960 m!216391))

(declare-fun m!216393 () Bool)

(assert (=> b!189960 m!216393))

(declare-fun m!216395 () Bool)

(assert (=> b!189960 m!216395))

(declare-fun m!216397 () Bool)

(assert (=> b!189960 m!216397))

(declare-fun m!216399 () Bool)

(assert (=> b!189960 m!216399))

(declare-fun m!216401 () Bool)

(assert (=> b!189960 m!216401))

(assert (=> b!189960 m!216391))

(declare-fun m!216403 () Bool)

(assert (=> b!189960 m!216403))

(declare-fun m!216405 () Bool)

(assert (=> b!189960 m!216405))

(assert (=> b!189960 m!216403))

(declare-fun m!216407 () Bool)

(assert (=> b!189960 m!216407))

(declare-fun m!216409 () Bool)

(assert (=> b!189960 m!216409))

(assert (=> b!189960 m!216407))

(declare-fun m!216411 () Bool)

(assert (=> b!189960 m!216411))

(declare-fun m!216413 () Bool)

(assert (=> b!189960 m!216413))

(declare-fun m!216415 () Bool)

(assert (=> b!189960 m!216415))

(declare-fun m!216417 () Bool)

(assert (=> b!189960 m!216417))

(declare-fun m!216419 () Bool)

(assert (=> b!189960 m!216419))

(declare-fun m!216421 () Bool)

(assert (=> b!189960 m!216421))

(assert (=> b!189960 m!216395))

(declare-fun m!216423 () Bool)

(assert (=> b!189960 m!216423))

(declare-fun m!216425 () Bool)

(assert (=> bm!19140 m!216425))

(assert (=> d!55817 m!216307))

(declare-fun m!216427 () Bool)

(assert (=> b!189959 m!216427))

(assert (=> b!189962 m!216411))

(assert (=> b!189962 m!216411))

(declare-fun m!216429 () Bool)

(assert (=> b!189962 m!216429))

(assert (=> bm!19141 m!216413))

(assert (=> b!189968 m!216411))

(assert (=> b!189968 m!216411))

(declare-fun m!216431 () Bool)

(assert (=> b!189968 m!216431))

(assert (=> b!189952 m!216411))

(assert (=> b!189952 m!216411))

(assert (=> b!189952 m!216431))

(declare-fun m!216433 () Bool)

(assert (=> b!189963 m!216433))

(declare-fun m!216435 () Bool)

(assert (=> b!189963 m!216435))

(assert (=> b!189963 m!216411))

(declare-fun m!216437 () Bool)

(assert (=> b!189963 m!216437))

(assert (=> b!189963 m!216411))

(assert (=> b!189963 m!216433))

(assert (=> b!189963 m!216435))

(declare-fun m!216439 () Bool)

(assert (=> b!189963 m!216439))

(declare-fun m!216441 () Bool)

(assert (=> b!189970 m!216441))

(assert (=> b!189842 d!55817))

(declare-fun d!55819 () Bool)

(assert (=> d!55819 (= (validMask!0 (mask!9066 thiss!1248)) (and (or (= (mask!9066 thiss!1248) #b00000000000000000000000000000111) (= (mask!9066 thiss!1248) #b00000000000000000000000000001111) (= (mask!9066 thiss!1248) #b00000000000000000000000000011111) (= (mask!9066 thiss!1248) #b00000000000000000000000000111111) (= (mask!9066 thiss!1248) #b00000000000000000000000001111111) (= (mask!9066 thiss!1248) #b00000000000000000000000011111111) (= (mask!9066 thiss!1248) #b00000000000000000000000111111111) (= (mask!9066 thiss!1248) #b00000000000000000000001111111111) (= (mask!9066 thiss!1248) #b00000000000000000000011111111111) (= (mask!9066 thiss!1248) #b00000000000000000000111111111111) (= (mask!9066 thiss!1248) #b00000000000000000001111111111111) (= (mask!9066 thiss!1248) #b00000000000000000011111111111111) (= (mask!9066 thiss!1248) #b00000000000000000111111111111111) (= (mask!9066 thiss!1248) #b00000000000000001111111111111111) (= (mask!9066 thiss!1248) #b00000000000000011111111111111111) (= (mask!9066 thiss!1248) #b00000000000000111111111111111111) (= (mask!9066 thiss!1248) #b00000000000001111111111111111111) (= (mask!9066 thiss!1248) #b00000000000011111111111111111111) (= (mask!9066 thiss!1248) #b00000000000111111111111111111111) (= (mask!9066 thiss!1248) #b00000000001111111111111111111111) (= (mask!9066 thiss!1248) #b00000000011111111111111111111111) (= (mask!9066 thiss!1248) #b00000000111111111111111111111111) (= (mask!9066 thiss!1248) #b00000001111111111111111111111111) (= (mask!9066 thiss!1248) #b00000011111111111111111111111111) (= (mask!9066 thiss!1248) #b00000111111111111111111111111111) (= (mask!9066 thiss!1248) #b00001111111111111111111111111111) (= (mask!9066 thiss!1248) #b00011111111111111111111111111111) (= (mask!9066 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9066 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!189842 d!55819))

(declare-fun d!55821 () Bool)

(declare-fun e!125026 () Bool)

(assert (=> d!55821 e!125026))

(declare-fun res!89821 () Bool)

(assert (=> d!55821 (=> (not res!89821) (not e!125026))))

(declare-fun lt!94154 () ListLongMap!2379)

(assert (=> d!55821 (= res!89821 (contains!1325 lt!94154 (_1!1740 (tuple2!3459 key!828 v!309))))))

(declare-fun lt!94152 () List!2374)

(assert (=> d!55821 (= lt!94154 (ListLongMap!2380 lt!94152))))

(declare-fun lt!94151 () Unit!5724)

(declare-fun lt!94153 () Unit!5724)

(assert (=> d!55821 (= lt!94151 lt!94153)))

(declare-datatypes ((Option!242 0))(
  ( (Some!241 (v!4189 V!5553)) (None!240) )
))
(declare-fun getValueByKey!236 (List!2374 (_ BitVec 64)) Option!242)

(assert (=> d!55821 (= (getValueByKey!236 lt!94152 (_1!1740 (tuple2!3459 key!828 v!309))) (Some!241 (_2!1740 (tuple2!3459 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!123 (List!2374 (_ BitVec 64) V!5553) Unit!5724)

(assert (=> d!55821 (= lt!94153 (lemmaContainsTupThenGetReturnValue!123 lt!94152 (_1!1740 (tuple2!3459 key!828 v!309)) (_2!1740 (tuple2!3459 key!828 v!309))))))

(declare-fun insertStrictlySorted!126 (List!2374 (_ BitVec 64) V!5553) List!2374)

(assert (=> d!55821 (= lt!94152 (insertStrictlySorted!126 (toList!1205 lt!94040) (_1!1740 (tuple2!3459 key!828 v!309)) (_2!1740 (tuple2!3459 key!828 v!309))))))

(assert (=> d!55821 (= (+!298 lt!94040 (tuple2!3459 key!828 v!309)) lt!94154)))

(declare-fun b!189978 () Bool)

(declare-fun res!89820 () Bool)

(assert (=> b!189978 (=> (not res!89820) (not e!125026))))

(assert (=> b!189978 (= res!89820 (= (getValueByKey!236 (toList!1205 lt!94154) (_1!1740 (tuple2!3459 key!828 v!309))) (Some!241 (_2!1740 (tuple2!3459 key!828 v!309)))))))

(declare-fun b!189979 () Bool)

(declare-fun contains!1327 (List!2374 tuple2!3458) Bool)

(assert (=> b!189979 (= e!125026 (contains!1327 (toList!1205 lt!94154) (tuple2!3459 key!828 v!309)))))

(assert (= (and d!55821 res!89821) b!189978))

(assert (= (and b!189978 res!89820) b!189979))

(declare-fun m!216443 () Bool)

(assert (=> d!55821 m!216443))

(declare-fun m!216445 () Bool)

(assert (=> d!55821 m!216445))

(declare-fun m!216447 () Bool)

(assert (=> d!55821 m!216447))

(declare-fun m!216449 () Bool)

(assert (=> d!55821 m!216449))

(declare-fun m!216451 () Bool)

(assert (=> b!189978 m!216451))

(declare-fun m!216453 () Bool)

(assert (=> b!189979 m!216453))

(assert (=> b!189842 d!55821))

(declare-fun b!189980 () Bool)

(declare-fun e!125030 () ListLongMap!2379)

(declare-fun call!19148 () ListLongMap!2379)

(assert (=> b!189980 (= e!125030 call!19148)))

(declare-fun b!189981 () Bool)

(declare-fun e!125038 () Bool)

(assert (=> b!189981 (= e!125038 (validKeyInArray!0 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189982 () Bool)

(declare-fun res!89823 () Bool)

(declare-fun e!125036 () Bool)

(assert (=> b!189982 (=> (not res!89823) (not e!125036))))

(declare-fun e!125034 () Bool)

(assert (=> b!189982 (= res!89823 e!125034)))

(declare-fun res!89829 () Bool)

(assert (=> b!189982 (=> res!89829 e!125034)))

(declare-fun e!125028 () Bool)

(assert (=> b!189982 (= res!89829 (not e!125028))))

(declare-fun res!89830 () Bool)

(assert (=> b!189982 (=> (not res!89830) (not e!125028))))

(assert (=> b!189982 (= res!89830 (bvslt #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))))))

(declare-fun b!189983 () Bool)

(declare-fun e!125029 () ListLongMap!2379)

(declare-fun e!125035 () ListLongMap!2379)

(assert (=> b!189983 (= e!125029 e!125035)))

(declare-fun c!34143 () Bool)

(assert (=> b!189983 (= c!34143 (and (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189984 () Bool)

(declare-fun call!19152 () ListLongMap!2379)

(assert (=> b!189984 (= e!125029 (+!298 call!19152 (tuple2!3459 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3714 thiss!1248))))))

(declare-fun b!189985 () Bool)

(declare-fun e!125033 () Bool)

(assert (=> b!189985 (= e!125036 e!125033)))

(declare-fun c!34138 () Bool)

(assert (=> b!189985 (= c!34138 (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19143 () Bool)

(declare-fun call!19146 () ListLongMap!2379)

(assert (=> bm!19143 (= call!19148 call!19146)))

(declare-fun b!189986 () Bool)

(declare-fun call!19149 () ListLongMap!2379)

(assert (=> b!189986 (= e!125030 call!19149)))

(declare-fun b!189987 () Bool)

(declare-fun e!125039 () Bool)

(declare-fun call!19150 () Bool)

(assert (=> b!189987 (= e!125039 (not call!19150))))

(declare-fun bm!19145 () Bool)

(declare-fun call!19147 () ListLongMap!2379)

(assert (=> bm!19145 (= call!19146 call!19147)))

(declare-fun b!189988 () Bool)

(declare-fun e!125031 () Bool)

(declare-fun lt!94169 () ListLongMap!2379)

(assert (=> b!189988 (= e!125031 (= (apply!178 lt!94169 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3714 thiss!1248)))))

(declare-fun bm!19146 () Bool)

(assert (=> bm!19146 (= call!19149 call!19152)))

(declare-fun b!189989 () Bool)

(declare-fun e!125037 () Unit!5724)

(declare-fun lt!94159 () Unit!5724)

(assert (=> b!189989 (= e!125037 lt!94159)))

(declare-fun lt!94160 () ListLongMap!2379)

(assert (=> b!189989 (= lt!94160 (getCurrentListMapNoExtraKeys!209 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!94157 () (_ BitVec 64))

(assert (=> b!189989 (= lt!94157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94164 () (_ BitVec 64))

(assert (=> b!189989 (= lt!94164 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94170 () Unit!5724)

(assert (=> b!189989 (= lt!94170 (addStillContains!154 lt!94160 lt!94157 (zeroValue!3714 thiss!1248) lt!94164))))

(assert (=> b!189989 (contains!1325 (+!298 lt!94160 (tuple2!3459 lt!94157 (zeroValue!3714 thiss!1248))) lt!94164)))

(declare-fun lt!94165 () Unit!5724)

(assert (=> b!189989 (= lt!94165 lt!94170)))

(declare-fun lt!94173 () ListLongMap!2379)

(assert (=> b!189989 (= lt!94173 (getCurrentListMapNoExtraKeys!209 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!94168 () (_ BitVec 64))

(assert (=> b!189989 (= lt!94168 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94167 () (_ BitVec 64))

(assert (=> b!189989 (= lt!94167 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94158 () Unit!5724)

(assert (=> b!189989 (= lt!94158 (addApplyDifferent!154 lt!94173 lt!94168 (minValue!3714 thiss!1248) lt!94167))))

(assert (=> b!189989 (= (apply!178 (+!298 lt!94173 (tuple2!3459 lt!94168 (minValue!3714 thiss!1248))) lt!94167) (apply!178 lt!94173 lt!94167))))

(declare-fun lt!94161 () Unit!5724)

(assert (=> b!189989 (= lt!94161 lt!94158)))

(declare-fun lt!94166 () ListLongMap!2379)

(assert (=> b!189989 (= lt!94166 (getCurrentListMapNoExtraKeys!209 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!94176 () (_ BitVec 64))

(assert (=> b!189989 (= lt!94176 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94172 () (_ BitVec 64))

(assert (=> b!189989 (= lt!94172 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94162 () Unit!5724)

(assert (=> b!189989 (= lt!94162 (addApplyDifferent!154 lt!94166 lt!94176 (zeroValue!3714 thiss!1248) lt!94172))))

(assert (=> b!189989 (= (apply!178 (+!298 lt!94166 (tuple2!3459 lt!94176 (zeroValue!3714 thiss!1248))) lt!94172) (apply!178 lt!94166 lt!94172))))

(declare-fun lt!94175 () Unit!5724)

(assert (=> b!189989 (= lt!94175 lt!94162)))

(declare-fun lt!94163 () ListLongMap!2379)

(assert (=> b!189989 (= lt!94163 (getCurrentListMapNoExtraKeys!209 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!94171 () (_ BitVec 64))

(assert (=> b!189989 (= lt!94171 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94174 () (_ BitVec 64))

(assert (=> b!189989 (= lt!94174 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189989 (= lt!94159 (addApplyDifferent!154 lt!94163 lt!94171 (minValue!3714 thiss!1248) lt!94174))))

(assert (=> b!189989 (= (apply!178 (+!298 lt!94163 (tuple2!3459 lt!94171 (minValue!3714 thiss!1248))) lt!94174) (apply!178 lt!94163 lt!94174))))

(declare-fun bm!19147 () Bool)

(declare-fun call!19151 () Bool)

(assert (=> bm!19147 (= call!19151 (contains!1325 lt!94169 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189990 () Bool)

(declare-fun e!125032 () Bool)

(assert (=> b!189990 (= e!125039 e!125032)))

(declare-fun res!89828 () Bool)

(assert (=> b!189990 (= res!89828 call!19150)))

(assert (=> b!189990 (=> (not res!89828) (not e!125032))))

(declare-fun b!189991 () Bool)

(declare-fun e!125027 () Bool)

(assert (=> b!189991 (= e!125034 e!125027)))

(declare-fun res!89822 () Bool)

(assert (=> b!189991 (=> (not res!89822) (not e!125027))))

(assert (=> b!189991 (= res!89822 (contains!1325 lt!94169 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189991 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))))))

(declare-fun bm!19148 () Bool)

(assert (=> bm!19148 (= call!19147 (getCurrentListMapNoExtraKeys!209 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun b!189992 () Bool)

(assert (=> b!189992 (= e!125027 (= (apply!178 lt!94169 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000)) (get!2201 (select (arr!3807 (_values!3856 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!521 (defaultEntry!3873 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189992 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4127 (_values!3856 thiss!1248))))))

(assert (=> b!189992 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))))))

(declare-fun b!189993 () Bool)

(assert (=> b!189993 (= e!125033 e!125031)))

(declare-fun res!89826 () Bool)

(assert (=> b!189993 (= res!89826 call!19151)))

(assert (=> b!189993 (=> (not res!89826) (not e!125031))))

(declare-fun b!189994 () Bool)

(assert (=> b!189994 (= e!125035 call!19149)))

(declare-fun b!189995 () Bool)

(assert (=> b!189995 (= e!125033 (not call!19151))))

(declare-fun b!189996 () Bool)

(declare-fun res!89824 () Bool)

(assert (=> b!189996 (=> (not res!89824) (not e!125036))))

(assert (=> b!189996 (= res!89824 e!125039)))

(declare-fun c!34141 () Bool)

(assert (=> b!189996 (= c!34141 (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!189997 () Bool)

(assert (=> b!189997 (= e!125028 (validKeyInArray!0 (select (arr!3806 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189998 () Bool)

(declare-fun c!34140 () Bool)

(assert (=> b!189998 (= c!34140 (and (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!189998 (= e!125035 e!125030)))

(declare-fun b!189999 () Bool)

(assert (=> b!189999 (= e!125032 (= (apply!178 lt!94169 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3714 thiss!1248)))))

(declare-fun d!55823 () Bool)

(assert (=> d!55823 e!125036))

(declare-fun res!89825 () Bool)

(assert (=> d!55823 (=> (not res!89825) (not e!125036))))

(assert (=> d!55823 (= res!89825 (or (bvsge #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))))))))

(declare-fun lt!94156 () ListLongMap!2379)

(assert (=> d!55823 (= lt!94169 lt!94156)))

(declare-fun lt!94155 () Unit!5724)

(assert (=> d!55823 (= lt!94155 e!125037)))

(declare-fun c!34139 () Bool)

(assert (=> d!55823 (= c!34139 e!125038)))

(declare-fun res!89827 () Bool)

(assert (=> d!55823 (=> (not res!89827) (not e!125038))))

(assert (=> d!55823 (= res!89827 (bvslt #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))))))

(assert (=> d!55823 (= lt!94156 e!125029)))

(declare-fun c!34142 () Bool)

(assert (=> d!55823 (= c!34142 (and (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55823 (validMask!0 (mask!9066 thiss!1248))))

(assert (=> d!55823 (= (getCurrentListMap!857 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)) lt!94169)))

(declare-fun bm!19144 () Bool)

(assert (=> bm!19144 (= call!19150 (contains!1325 lt!94169 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190000 () Bool)

(declare-fun Unit!5731 () Unit!5724)

(assert (=> b!190000 (= e!125037 Unit!5731)))

(declare-fun bm!19149 () Bool)

(assert (=> bm!19149 (= call!19152 (+!298 (ite c!34142 call!19147 (ite c!34143 call!19146 call!19148)) (ite (or c!34142 c!34143) (tuple2!3459 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3714 thiss!1248)) (tuple2!3459 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3714 thiss!1248)))))))

(assert (= (and d!55823 c!34142) b!189984))

(assert (= (and d!55823 (not c!34142)) b!189983))

(assert (= (and b!189983 c!34143) b!189994))

(assert (= (and b!189983 (not c!34143)) b!189998))

(assert (= (and b!189998 c!34140) b!189986))

(assert (= (and b!189998 (not c!34140)) b!189980))

(assert (= (or b!189986 b!189980) bm!19143))

(assert (= (or b!189994 bm!19143) bm!19145))

(assert (= (or b!189994 b!189986) bm!19146))

(assert (= (or b!189984 bm!19145) bm!19148))

(assert (= (or b!189984 bm!19146) bm!19149))

(assert (= (and d!55823 res!89827) b!189981))

(assert (= (and d!55823 c!34139) b!189989))

(assert (= (and d!55823 (not c!34139)) b!190000))

(assert (= (and d!55823 res!89825) b!189982))

(assert (= (and b!189982 res!89830) b!189997))

(assert (= (and b!189982 (not res!89829)) b!189991))

(assert (= (and b!189991 res!89822) b!189992))

(assert (= (and b!189982 res!89823) b!189996))

(assert (= (and b!189996 c!34141) b!189990))

(assert (= (and b!189996 (not c!34141)) b!189987))

(assert (= (and b!189990 res!89828) b!189999))

(assert (= (or b!189990 b!189987) bm!19144))

(assert (= (and b!189996 res!89824) b!189985))

(assert (= (and b!189985 c!34138) b!189993))

(assert (= (and b!189985 (not c!34138)) b!189995))

(assert (= (and b!189993 res!89826) b!189988))

(assert (= (or b!189993 b!189995) bm!19147))

(declare-fun b_lambda!7359 () Bool)

(assert (=> (not b_lambda!7359) (not b!189992)))

(assert (=> b!189992 t!7275))

(declare-fun b_and!11321 () Bool)

(assert (= b_and!11319 (and (=> t!7275 result!4871) b_and!11321)))

(declare-fun m!216455 () Bool)

(assert (=> bm!19149 m!216455))

(declare-fun m!216457 () Bool)

(assert (=> bm!19144 m!216457))

(declare-fun m!216459 () Bool)

(assert (=> b!189984 m!216459))

(declare-fun m!216461 () Bool)

(assert (=> b!189989 m!216461))

(declare-fun m!216463 () Bool)

(assert (=> b!189989 m!216463))

(declare-fun m!216465 () Bool)

(assert (=> b!189989 m!216465))

(declare-fun m!216467 () Bool)

(assert (=> b!189989 m!216467))

(declare-fun m!216469 () Bool)

(assert (=> b!189989 m!216469))

(declare-fun m!216471 () Bool)

(assert (=> b!189989 m!216471))

(assert (=> b!189989 m!216461))

(declare-fun m!216473 () Bool)

(assert (=> b!189989 m!216473))

(declare-fun m!216475 () Bool)

(assert (=> b!189989 m!216475))

(assert (=> b!189989 m!216473))

(declare-fun m!216477 () Bool)

(assert (=> b!189989 m!216477))

(declare-fun m!216479 () Bool)

(assert (=> b!189989 m!216479))

(assert (=> b!189989 m!216477))

(assert (=> b!189989 m!216411))

(declare-fun m!216481 () Bool)

(assert (=> b!189989 m!216481))

(declare-fun m!216483 () Bool)

(assert (=> b!189989 m!216483))

(declare-fun m!216485 () Bool)

(assert (=> b!189989 m!216485))

(declare-fun m!216487 () Bool)

(assert (=> b!189989 m!216487))

(declare-fun m!216489 () Bool)

(assert (=> b!189989 m!216489))

(assert (=> b!189989 m!216465))

(declare-fun m!216491 () Bool)

(assert (=> b!189989 m!216491))

(declare-fun m!216493 () Bool)

(assert (=> bm!19147 m!216493))

(assert (=> d!55823 m!216307))

(declare-fun m!216495 () Bool)

(assert (=> b!189988 m!216495))

(assert (=> b!189991 m!216411))

(assert (=> b!189991 m!216411))

(declare-fun m!216497 () Bool)

(assert (=> b!189991 m!216497))

(assert (=> bm!19148 m!216481))

(assert (=> b!189997 m!216411))

(assert (=> b!189997 m!216411))

(assert (=> b!189997 m!216431))

(assert (=> b!189981 m!216411))

(assert (=> b!189981 m!216411))

(assert (=> b!189981 m!216431))

(declare-fun m!216499 () Bool)

(assert (=> b!189992 m!216499))

(assert (=> b!189992 m!216435))

(assert (=> b!189992 m!216411))

(declare-fun m!216501 () Bool)

(assert (=> b!189992 m!216501))

(assert (=> b!189992 m!216411))

(assert (=> b!189992 m!216499))

(assert (=> b!189992 m!216435))

(declare-fun m!216503 () Bool)

(assert (=> b!189992 m!216503))

(declare-fun m!216505 () Bool)

(assert (=> b!189999 m!216505))

(assert (=> b!189842 d!55823))

(declare-fun d!55825 () Bool)

(declare-fun e!125042 () Bool)

(assert (=> d!55825 e!125042))

(declare-fun res!89833 () Bool)

(assert (=> d!55825 (=> (not res!89833) (not e!125042))))

(assert (=> d!55825 (= res!89833 (and (bvsge (index!4803 lt!94035) #b00000000000000000000000000000000) (bvslt (index!4803 lt!94035) (size!4127 (_values!3856 thiss!1248)))))))

(declare-fun lt!94179 () Unit!5724)

(declare-fun choose!1024 (array!8075 array!8077 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 32) (_ BitVec 64) V!5553 Int) Unit!5724)

(assert (=> d!55825 (= lt!94179 (choose!1024 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) (index!4803 lt!94035) key!828 v!309 (defaultEntry!3873 thiss!1248)))))

(assert (=> d!55825 (validMask!0 (mask!9066 thiss!1248))))

(assert (=> d!55825 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!102 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) (index!4803 lt!94035) key!828 v!309 (defaultEntry!3873 thiss!1248)) lt!94179)))

(declare-fun b!190003 () Bool)

(assert (=> b!190003 (= e!125042 (= (+!298 (getCurrentListMap!857 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)) (tuple2!3459 key!828 v!309)) (getCurrentListMap!857 (_keys!5841 thiss!1248) (array!8078 (store (arr!3807 (_values!3856 thiss!1248)) (index!4803 lt!94035) (ValueCellFull!1871 v!309)) (size!4127 (_values!3856 thiss!1248))) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248))))))

(assert (= (and d!55825 res!89833) b!190003))

(declare-fun m!216507 () Bool)

(assert (=> d!55825 m!216507))

(assert (=> d!55825 m!216307))

(assert (=> b!190003 m!216301))

(assert (=> b!190003 m!216301))

(declare-fun m!216509 () Bool)

(assert (=> b!190003 m!216509))

(assert (=> b!190003 m!216299))

(assert (=> b!190003 m!216309))

(assert (=> b!189842 d!55825))

(declare-fun d!55827 () Bool)

(declare-fun e!125047 () Bool)

(assert (=> d!55827 e!125047))

(declare-fun res!89836 () Bool)

(assert (=> d!55827 (=> res!89836 e!125047)))

(declare-fun lt!94189 () Bool)

(assert (=> d!55827 (= res!89836 (not lt!94189))))

(declare-fun lt!94191 () Bool)

(assert (=> d!55827 (= lt!94189 lt!94191)))

(declare-fun lt!94188 () Unit!5724)

(declare-fun e!125048 () Unit!5724)

(assert (=> d!55827 (= lt!94188 e!125048)))

(declare-fun c!34146 () Bool)

(assert (=> d!55827 (= c!34146 lt!94191)))

(declare-fun containsKey!239 (List!2374 (_ BitVec 64)) Bool)

(assert (=> d!55827 (= lt!94191 (containsKey!239 (toList!1205 lt!94040) key!828))))

(assert (=> d!55827 (= (contains!1325 lt!94040 key!828) lt!94189)))

(declare-fun b!190010 () Bool)

(declare-fun lt!94190 () Unit!5724)

(assert (=> b!190010 (= e!125048 lt!94190)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!187 (List!2374 (_ BitVec 64)) Unit!5724)

(assert (=> b!190010 (= lt!94190 (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1205 lt!94040) key!828))))

(declare-fun isDefined!188 (Option!242) Bool)

(assert (=> b!190010 (isDefined!188 (getValueByKey!236 (toList!1205 lt!94040) key!828))))

(declare-fun b!190011 () Bool)

(declare-fun Unit!5732 () Unit!5724)

(assert (=> b!190011 (= e!125048 Unit!5732)))

(declare-fun b!190012 () Bool)

(assert (=> b!190012 (= e!125047 (isDefined!188 (getValueByKey!236 (toList!1205 lt!94040) key!828)))))

(assert (= (and d!55827 c!34146) b!190010))

(assert (= (and d!55827 (not c!34146)) b!190011))

(assert (= (and d!55827 (not res!89836)) b!190012))

(declare-fun m!216511 () Bool)

(assert (=> d!55827 m!216511))

(declare-fun m!216513 () Bool)

(assert (=> b!190010 m!216513))

(declare-fun m!216515 () Bool)

(assert (=> b!190010 m!216515))

(assert (=> b!190010 m!216515))

(declare-fun m!216517 () Bool)

(assert (=> b!190010 m!216517))

(assert (=> b!190012 m!216515))

(assert (=> b!190012 m!216515))

(assert (=> b!190012 m!216517))

(assert (=> b!189842 d!55827))

(declare-fun b!190025 () Bool)

(declare-fun e!125056 () SeekEntryResult!658)

(assert (=> b!190025 (= e!125056 Undefined!658)))

(declare-fun b!190026 () Bool)

(declare-fun c!34153 () Bool)

(declare-fun lt!94198 () (_ BitVec 64))

(assert (=> b!190026 (= c!34153 (= lt!94198 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125057 () SeekEntryResult!658)

(declare-fun e!125055 () SeekEntryResult!658)

(assert (=> b!190026 (= e!125057 e!125055)))

(declare-fun b!190027 () Bool)

(assert (=> b!190027 (= e!125056 e!125057)))

(declare-fun lt!94200 () SeekEntryResult!658)

(assert (=> b!190027 (= lt!94198 (select (arr!3806 (_keys!5841 thiss!1248)) (index!4804 lt!94200)))))

(declare-fun c!34154 () Bool)

(assert (=> b!190027 (= c!34154 (= lt!94198 key!828))))

(declare-fun b!190028 () Bool)

(assert (=> b!190028 (= e!125055 (MissingZero!658 (index!4804 lt!94200)))))

(declare-fun b!190029 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8075 (_ BitVec 32)) SeekEntryResult!658)

(assert (=> b!190029 (= e!125055 (seekKeyOrZeroReturnVacant!0 (x!20442 lt!94200) (index!4804 lt!94200) (index!4804 lt!94200) key!828 (_keys!5841 thiss!1248) (mask!9066 thiss!1248)))))

(declare-fun d!55829 () Bool)

(declare-fun lt!94199 () SeekEntryResult!658)

(assert (=> d!55829 (and (or ((_ is Undefined!658) lt!94199) (not ((_ is Found!658) lt!94199)) (and (bvsge (index!4803 lt!94199) #b00000000000000000000000000000000) (bvslt (index!4803 lt!94199) (size!4126 (_keys!5841 thiss!1248))))) (or ((_ is Undefined!658) lt!94199) ((_ is Found!658) lt!94199) (not ((_ is MissingZero!658) lt!94199)) (and (bvsge (index!4802 lt!94199) #b00000000000000000000000000000000) (bvslt (index!4802 lt!94199) (size!4126 (_keys!5841 thiss!1248))))) (or ((_ is Undefined!658) lt!94199) ((_ is Found!658) lt!94199) ((_ is MissingZero!658) lt!94199) (not ((_ is MissingVacant!658) lt!94199)) (and (bvsge (index!4805 lt!94199) #b00000000000000000000000000000000) (bvslt (index!4805 lt!94199) (size!4126 (_keys!5841 thiss!1248))))) (or ((_ is Undefined!658) lt!94199) (ite ((_ is Found!658) lt!94199) (= (select (arr!3806 (_keys!5841 thiss!1248)) (index!4803 lt!94199)) key!828) (ite ((_ is MissingZero!658) lt!94199) (= (select (arr!3806 (_keys!5841 thiss!1248)) (index!4802 lt!94199)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!658) lt!94199) (= (select (arr!3806 (_keys!5841 thiss!1248)) (index!4805 lt!94199)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55829 (= lt!94199 e!125056)))

(declare-fun c!34155 () Bool)

(assert (=> d!55829 (= c!34155 (and ((_ is Intermediate!658) lt!94200) (undefined!1470 lt!94200)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8075 (_ BitVec 32)) SeekEntryResult!658)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55829 (= lt!94200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9066 thiss!1248)) key!828 (_keys!5841 thiss!1248) (mask!9066 thiss!1248)))))

(assert (=> d!55829 (validMask!0 (mask!9066 thiss!1248))))

(assert (=> d!55829 (= (seekEntryOrOpen!0 key!828 (_keys!5841 thiss!1248) (mask!9066 thiss!1248)) lt!94199)))

(declare-fun b!190030 () Bool)

(assert (=> b!190030 (= e!125057 (Found!658 (index!4804 lt!94200)))))

(assert (= (and d!55829 c!34155) b!190025))

(assert (= (and d!55829 (not c!34155)) b!190027))

(assert (= (and b!190027 c!34154) b!190030))

(assert (= (and b!190027 (not c!34154)) b!190026))

(assert (= (and b!190026 c!34153) b!190028))

(assert (= (and b!190026 (not c!34153)) b!190029))

(declare-fun m!216519 () Bool)

(assert (=> b!190027 m!216519))

(declare-fun m!216521 () Bool)

(assert (=> b!190029 m!216521))

(declare-fun m!216523 () Bool)

(assert (=> d!55829 m!216523))

(declare-fun m!216525 () Bool)

(assert (=> d!55829 m!216525))

(assert (=> d!55829 m!216523))

(declare-fun m!216527 () Bool)

(assert (=> d!55829 m!216527))

(declare-fun m!216529 () Bool)

(assert (=> d!55829 m!216529))

(assert (=> d!55829 m!216307))

(declare-fun m!216531 () Bool)

(assert (=> d!55829 m!216531))

(assert (=> b!189846 d!55829))

(declare-fun d!55831 () Bool)

(declare-fun e!125060 () Bool)

(assert (=> d!55831 e!125060))

(declare-fun res!89842 () Bool)

(assert (=> d!55831 (=> (not res!89842) (not e!125060))))

(declare-fun lt!94206 () SeekEntryResult!658)

(assert (=> d!55831 (= res!89842 ((_ is Found!658) lt!94206))))

(assert (=> d!55831 (= lt!94206 (seekEntryOrOpen!0 key!828 (_keys!5841 thiss!1248) (mask!9066 thiss!1248)))))

(declare-fun lt!94205 () Unit!5724)

(declare-fun choose!1025 (array!8075 array!8077 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 64) Int) Unit!5724)

(assert (=> d!55831 (= lt!94205 (choose!1025 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)))))

(assert (=> d!55831 (validMask!0 (mask!9066 thiss!1248))))

(assert (=> d!55831 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!168 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)) lt!94205)))

(declare-fun b!190035 () Bool)

(declare-fun res!89841 () Bool)

(assert (=> b!190035 (=> (not res!89841) (not e!125060))))

(assert (=> b!190035 (= res!89841 (inRange!0 (index!4803 lt!94206) (mask!9066 thiss!1248)))))

(declare-fun b!190036 () Bool)

(assert (=> b!190036 (= e!125060 (= (select (arr!3806 (_keys!5841 thiss!1248)) (index!4803 lt!94206)) key!828))))

(assert (=> b!190036 (and (bvsge (index!4803 lt!94206) #b00000000000000000000000000000000) (bvslt (index!4803 lt!94206) (size!4126 (_keys!5841 thiss!1248))))))

(assert (= (and d!55831 res!89842) b!190035))

(assert (= (and b!190035 res!89841) b!190036))

(assert (=> d!55831 m!216313))

(declare-fun m!216533 () Bool)

(assert (=> d!55831 m!216533))

(assert (=> d!55831 m!216307))

(declare-fun m!216535 () Bool)

(assert (=> b!190035 m!216535))

(declare-fun m!216537 () Bool)

(assert (=> b!190036 m!216537))

(assert (=> b!189848 d!55831))

(declare-fun d!55833 () Bool)

(assert (=> d!55833 (= (inRange!0 (index!4803 lt!94035) (mask!9066 thiss!1248)) (and (bvsge (index!4803 lt!94035) #b00000000000000000000000000000000) (bvslt (index!4803 lt!94035) (bvadd (mask!9066 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!189848 d!55833))

(declare-fun b!190053 () Bool)

(declare-fun e!125070 () Bool)

(declare-fun lt!94211 () SeekEntryResult!658)

(assert (=> b!190053 (= e!125070 ((_ is Undefined!658) lt!94211))))

(declare-fun call!19158 () Bool)

(declare-fun c!34160 () Bool)

(declare-fun bm!19154 () Bool)

(assert (=> bm!19154 (= call!19158 (inRange!0 (ite c!34160 (index!4802 lt!94211) (index!4805 lt!94211)) (mask!9066 thiss!1248)))))

(declare-fun b!190054 () Bool)

(declare-fun e!125069 () Bool)

(declare-fun call!19157 () Bool)

(assert (=> b!190054 (= e!125069 (not call!19157))))

(declare-fun bm!19155 () Bool)

(declare-fun arrayContainsKey!0 (array!8075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19155 (= call!19157 (arrayContainsKey!0 (_keys!5841 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!190055 () Bool)

(declare-fun res!89852 () Bool)

(declare-fun e!125071 () Bool)

(assert (=> b!190055 (=> (not res!89852) (not e!125071))))

(assert (=> b!190055 (= res!89852 (= (select (arr!3806 (_keys!5841 thiss!1248)) (index!4805 lt!94211)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190055 (and (bvsge (index!4805 lt!94211) #b00000000000000000000000000000000) (bvslt (index!4805 lt!94211) (size!4126 (_keys!5841 thiss!1248))))))

(declare-fun b!190056 () Bool)

(assert (=> b!190056 (and (bvsge (index!4802 lt!94211) #b00000000000000000000000000000000) (bvslt (index!4802 lt!94211) (size!4126 (_keys!5841 thiss!1248))))))

(declare-fun res!89853 () Bool)

(assert (=> b!190056 (= res!89853 (= (select (arr!3806 (_keys!5841 thiss!1248)) (index!4802 lt!94211)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190056 (=> (not res!89853) (not e!125069))))

(declare-fun d!55835 () Bool)

(declare-fun e!125072 () Bool)

(assert (=> d!55835 e!125072))

(assert (=> d!55835 (= c!34160 ((_ is MissingZero!658) lt!94211))))

(assert (=> d!55835 (= lt!94211 (seekEntryOrOpen!0 key!828 (_keys!5841 thiss!1248) (mask!9066 thiss!1248)))))

(declare-fun lt!94212 () Unit!5724)

(declare-fun choose!1026 (array!8075 array!8077 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 64) Int) Unit!5724)

(assert (=> d!55835 (= lt!94212 (choose!1026 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)))))

(assert (=> d!55835 (validMask!0 (mask!9066 thiss!1248))))

(assert (=> d!55835 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!162 (_keys!5841 thiss!1248) (_values!3856 thiss!1248) (mask!9066 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)) lt!94212)))

(declare-fun b!190057 () Bool)

(assert (=> b!190057 (= e!125071 (not call!19157))))

(declare-fun b!190058 () Bool)

(assert (=> b!190058 (= e!125072 e!125070)))

(declare-fun c!34161 () Bool)

(assert (=> b!190058 (= c!34161 ((_ is MissingVacant!658) lt!94211))))

(declare-fun b!190059 () Bool)

(assert (=> b!190059 (= e!125072 e!125069)))

(declare-fun res!89851 () Bool)

(assert (=> b!190059 (= res!89851 call!19158)))

(assert (=> b!190059 (=> (not res!89851) (not e!125069))))

(declare-fun b!190060 () Bool)

(declare-fun res!89854 () Bool)

(assert (=> b!190060 (=> (not res!89854) (not e!125071))))

(assert (=> b!190060 (= res!89854 call!19158)))

(assert (=> b!190060 (= e!125070 e!125071)))

(assert (= (and d!55835 c!34160) b!190059))

(assert (= (and d!55835 (not c!34160)) b!190058))

(assert (= (and b!190059 res!89851) b!190056))

(assert (= (and b!190056 res!89853) b!190054))

(assert (= (and b!190058 c!34161) b!190060))

(assert (= (and b!190058 (not c!34161)) b!190053))

(assert (= (and b!190060 res!89854) b!190055))

(assert (= (and b!190055 res!89852) b!190057))

(assert (= (or b!190059 b!190060) bm!19154))

(assert (= (or b!190054 b!190057) bm!19155))

(declare-fun m!216539 () Bool)

(assert (=> bm!19155 m!216539))

(declare-fun m!216541 () Bool)

(assert (=> b!190055 m!216541))

(declare-fun m!216543 () Bool)

(assert (=> bm!19154 m!216543))

(declare-fun m!216545 () Bool)

(assert (=> b!190056 m!216545))

(assert (=> d!55835 m!216313))

(declare-fun m!216547 () Bool)

(assert (=> d!55835 m!216547))

(assert (=> d!55835 m!216307))

(assert (=> b!189844 d!55835))

(declare-fun d!55837 () Bool)

(declare-fun res!89861 () Bool)

(declare-fun e!125075 () Bool)

(assert (=> d!55837 (=> (not res!89861) (not e!125075))))

(declare-fun simpleValid!194 (LongMapFixedSize!2650) Bool)

(assert (=> d!55837 (= res!89861 (simpleValid!194 thiss!1248))))

(assert (=> d!55837 (= (valid!1115 thiss!1248) e!125075)))

(declare-fun b!190067 () Bool)

(declare-fun res!89862 () Bool)

(assert (=> b!190067 (=> (not res!89862) (not e!125075))))

(declare-fun arrayCountValidKeys!0 (array!8075 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190067 (= res!89862 (= (arrayCountValidKeys!0 (_keys!5841 thiss!1248) #b00000000000000000000000000000000 (size!4126 (_keys!5841 thiss!1248))) (_size!1374 thiss!1248)))))

(declare-fun b!190068 () Bool)

(declare-fun res!89863 () Bool)

(assert (=> b!190068 (=> (not res!89863) (not e!125075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8075 (_ BitVec 32)) Bool)

(assert (=> b!190068 (= res!89863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5841 thiss!1248) (mask!9066 thiss!1248)))))

(declare-fun b!190069 () Bool)

(declare-datatypes ((List!2376 0))(
  ( (Nil!2373) (Cons!2372 (h!3009 (_ BitVec 64)) (t!7276 List!2376)) )
))
(declare-fun arrayNoDuplicates!0 (array!8075 (_ BitVec 32) List!2376) Bool)

(assert (=> b!190069 (= e!125075 (arrayNoDuplicates!0 (_keys!5841 thiss!1248) #b00000000000000000000000000000000 Nil!2373))))

(assert (= (and d!55837 res!89861) b!190067))

(assert (= (and b!190067 res!89862) b!190068))

(assert (= (and b!190068 res!89863) b!190069))

(declare-fun m!216549 () Bool)

(assert (=> d!55837 m!216549))

(declare-fun m!216551 () Bool)

(assert (=> b!190067 m!216551))

(declare-fun m!216553 () Bool)

(assert (=> b!190068 m!216553))

(declare-fun m!216555 () Bool)

(assert (=> b!190069 m!216555))

(assert (=> start!19292 d!55837))

(declare-fun d!55839 () Bool)

(assert (=> d!55839 (= (array_inv!2455 (_keys!5841 thiss!1248)) (bvsge (size!4126 (_keys!5841 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189839 d!55839))

(declare-fun d!55841 () Bool)

(assert (=> d!55841 (= (array_inv!2456 (_values!3856 thiss!1248)) (bvsge (size!4127 (_values!3856 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189839 d!55841))

(declare-fun b!190076 () Bool)

(declare-fun e!125080 () Bool)

(assert (=> b!190076 (= e!125080 tp_is_empty!4429)))

(declare-fun condMapEmpty!7651 () Bool)

(declare-fun mapDefault!7651 () ValueCell!1871)

(assert (=> mapNonEmpty!7642 (= condMapEmpty!7651 (= mapRest!7642 ((as const (Array (_ BitVec 32) ValueCell!1871)) mapDefault!7651)))))

(declare-fun e!125081 () Bool)

(declare-fun mapRes!7651 () Bool)

(assert (=> mapNonEmpty!7642 (= tp!16806 (and e!125081 mapRes!7651))))

(declare-fun mapNonEmpty!7651 () Bool)

(declare-fun tp!16822 () Bool)

(assert (=> mapNonEmpty!7651 (= mapRes!7651 (and tp!16822 e!125080))))

(declare-fun mapRest!7651 () (Array (_ BitVec 32) ValueCell!1871))

(declare-fun mapKey!7651 () (_ BitVec 32))

(declare-fun mapValue!7651 () ValueCell!1871)

(assert (=> mapNonEmpty!7651 (= mapRest!7642 (store mapRest!7651 mapKey!7651 mapValue!7651))))

(declare-fun mapIsEmpty!7651 () Bool)

(assert (=> mapIsEmpty!7651 mapRes!7651))

(declare-fun b!190077 () Bool)

(assert (=> b!190077 (= e!125081 tp_is_empty!4429)))

(assert (= (and mapNonEmpty!7642 condMapEmpty!7651) mapIsEmpty!7651))

(assert (= (and mapNonEmpty!7642 (not condMapEmpty!7651)) mapNonEmpty!7651))

(assert (= (and mapNonEmpty!7651 ((_ is ValueCellFull!1871) mapValue!7651)) b!190076))

(assert (= (and mapNonEmpty!7642 ((_ is ValueCellFull!1871) mapDefault!7651)) b!190077))

(declare-fun m!216557 () Bool)

(assert (=> mapNonEmpty!7651 m!216557))

(declare-fun b_lambda!7361 () Bool)

(assert (= b_lambda!7359 (or (and b!189839 b_free!4657) b_lambda!7361)))

(declare-fun b_lambda!7363 () Bool)

(assert (= b_lambda!7357 (or (and b!189839 b_free!4657) b_lambda!7363)))

(check-sat (not bm!19142) (not mapNonEmpty!7651) (not b!190069) (not b!189968) (not b!189997) (not d!55823) (not b!189978) (not d!55821) (not bm!19149) (not bm!19147) (not bm!19144) (not d!55829) (not bm!19137) tp_is_empty!4429 (not b!189970) (not bm!19140) (not b!189962) (not d!55835) (not b!190003) (not b!189959) (not bm!19154) (not d!55831) (not bm!19141) (not b!189989) (not b!190068) (not bm!19155) (not b!190010) (not d!55825) (not b!189981) (not d!55827) b_and!11321 (not b!190029) (not b_lambda!7363) (not b!189960) (not b_next!4657) (not b!189999) (not b!189988) (not b!190035) (not b!189952) (not bm!19148) (not b_lambda!7361) (not b!189984) (not d!55837) (not b!189992) (not b!189955) (not b!190012) (not b!189991) (not b!190067) (not d!55817) (not b!189963) (not b!189979))
(check-sat b_and!11321 (not b_next!4657))
