; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19322 () Bool)

(assert start!19322)

(declare-fun b!190110 () Bool)

(declare-fun b_free!4663 () Bool)

(declare-fun b_next!4663 () Bool)

(assert (=> b!190110 (= b_free!4663 (not b_next!4663))))

(declare-fun tp!16827 () Bool)

(declare-fun b_and!11323 () Bool)

(assert (=> b!190110 (= tp!16827 b_and!11323)))

(declare-fun b!190100 () Bool)

(declare-datatypes ((Unit!5733 0))(
  ( (Unit!5734) )
))
(declare-fun e!125107 () Unit!5733)

(declare-fun lt!94230 () Unit!5733)

(assert (=> b!190100 (= e!125107 lt!94230)))

(declare-datatypes ((V!5561 0))(
  ( (V!5562 (val!2262 Int)) )
))
(declare-datatypes ((ValueCell!1874 0))(
  ( (ValueCellFull!1874 (v!4190 V!5561)) (EmptyCell!1874) )
))
(declare-datatypes ((array!8089 0))(
  ( (array!8090 (arr!3812 (Array (_ BitVec 32) (_ BitVec 64))) (size!4132 (_ BitVec 32))) )
))
(declare-datatypes ((array!8091 0))(
  ( (array!8092 (arr!3813 (Array (_ BitVec 32) ValueCell!1874)) (size!4133 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2656 0))(
  ( (LongMapFixedSize!2657 (defaultEntry!3880 Int) (mask!9078 (_ BitVec 32)) (extraKeys!3617 (_ BitVec 32)) (zeroValue!3721 V!5561) (minValue!3721 V!5561) (_size!1377 (_ BitVec 32)) (_keys!5849 array!8089) (_values!3863 array!8091) (_vacant!1377 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2656)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!170 (array!8089 array!8091 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 64) Int) Unit!5733)

(assert (=> b!190100 (= lt!94230 (lemmaInListMapThenSeekEntryOrOpenFindsIt!170 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)))))

(declare-fun res!89875 () Bool)

(declare-datatypes ((SeekEntryResult!660 0))(
  ( (MissingZero!660 (index!4810 (_ BitVec 32))) (Found!660 (index!4811 (_ BitVec 32))) (Intermediate!660 (undefined!1472 Bool) (index!4812 (_ BitVec 32)) (x!20462 (_ BitVec 32))) (Undefined!660) (MissingVacant!660 (index!4813 (_ BitVec 32))) )
))
(declare-fun lt!94229 () SeekEntryResult!660)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190100 (= res!89875 (inRange!0 (index!4811 lt!94229) (mask!9078 thiss!1248)))))

(declare-fun e!125110 () Bool)

(assert (=> b!190100 (=> (not res!89875) (not e!125110))))

(assert (=> b!190100 e!125110))

(declare-fun b!190101 () Bool)

(declare-fun e!125104 () Bool)

(declare-fun tp_is_empty!4435 () Bool)

(assert (=> b!190101 (= e!125104 tp_is_empty!4435)))

(declare-fun mapIsEmpty!7654 () Bool)

(declare-fun mapRes!7654 () Bool)

(assert (=> mapIsEmpty!7654 mapRes!7654))

(declare-fun mapNonEmpty!7654 () Bool)

(declare-fun tp!16828 () Bool)

(declare-fun e!125106 () Bool)

(assert (=> mapNonEmpty!7654 (= mapRes!7654 (and tp!16828 e!125106))))

(declare-fun mapRest!7654 () (Array (_ BitVec 32) ValueCell!1874))

(declare-fun mapValue!7654 () ValueCell!1874)

(declare-fun mapKey!7654 () (_ BitVec 32))

(assert (=> mapNonEmpty!7654 (= (arr!3813 (_values!3863 thiss!1248)) (store mapRest!7654 mapKey!7654 mapValue!7654))))

(declare-fun b!190102 () Bool)

(declare-fun e!125105 () Bool)

(assert (=> b!190102 (= e!125105 (= (size!4133 (_values!3863 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9078 thiss!1248))))))

(declare-fun b!190103 () Bool)

(declare-fun e!125111 () Bool)

(assert (=> b!190103 (= e!125111 (not e!125105))))

(declare-fun res!89876 () Bool)

(assert (=> b!190103 (=> res!89876 e!125105)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!190103 (= res!89876 (not (validMask!0 (mask!9078 thiss!1248))))))

(declare-datatypes ((tuple2!3462 0))(
  ( (tuple2!3463 (_1!1742 (_ BitVec 64)) (_2!1742 V!5561)) )
))
(declare-datatypes ((List!2377 0))(
  ( (Nil!2374) (Cons!2373 (h!3010 tuple2!3462) (t!7277 List!2377)) )
))
(declare-datatypes ((ListLongMap!2383 0))(
  ( (ListLongMap!2384 (toList!1207 List!2377)) )
))
(declare-fun lt!94227 () ListLongMap!2383)

(declare-fun v!309 () V!5561)

(declare-fun +!300 (ListLongMap!2383 tuple2!3462) ListLongMap!2383)

(declare-fun getCurrentListMap!859 (array!8089 array!8091 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 32) Int) ListLongMap!2383)

(assert (=> b!190103 (= (+!300 lt!94227 (tuple2!3463 key!828 v!309)) (getCurrentListMap!859 (_keys!5849 thiss!1248) (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94226 () Unit!5733)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!104 (array!8089 array!8091 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 32) (_ BitVec 64) V!5561 Int) Unit!5733)

(assert (=> b!190103 (= lt!94226 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!104 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (index!4811 lt!94229) key!828 v!309 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94225 () Unit!5733)

(assert (=> b!190103 (= lt!94225 e!125107)))

(declare-fun c!34164 () Bool)

(declare-fun contains!1328 (ListLongMap!2383 (_ BitVec 64)) Bool)

(assert (=> b!190103 (= c!34164 (contains!1328 lt!94227 key!828))))

(assert (=> b!190103 (= lt!94227 (getCurrentListMap!859 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun b!190105 () Bool)

(declare-fun e!125108 () Bool)

(assert (=> b!190105 (= e!125108 (and e!125104 mapRes!7654))))

(declare-fun condMapEmpty!7654 () Bool)

(declare-fun mapDefault!7654 () ValueCell!1874)

(assert (=> b!190105 (= condMapEmpty!7654 (= (arr!3813 (_values!3863 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1874)) mapDefault!7654)))))

(declare-fun b!190106 () Bool)

(declare-fun e!125103 () Bool)

(assert (=> b!190106 (= e!125103 e!125111)))

(declare-fun res!89877 () Bool)

(assert (=> b!190106 (=> (not res!89877) (not e!125111))))

(get-info :version)

(assert (=> b!190106 (= res!89877 (and (not ((_ is Undefined!660) lt!94229)) (not ((_ is MissingVacant!660) lt!94229)) (not ((_ is MissingZero!660) lt!94229)) ((_ is Found!660) lt!94229)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8089 (_ BitVec 32)) SeekEntryResult!660)

(assert (=> b!190106 (= lt!94229 (seekEntryOrOpen!0 key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)))))

(declare-fun b!190107 () Bool)

(assert (=> b!190107 (= e!125106 tp_is_empty!4435)))

(declare-fun b!190108 () Bool)

(assert (=> b!190108 (= e!125110 (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4811 lt!94229)) key!828))))

(declare-fun b!190109 () Bool)

(declare-fun res!89874 () Bool)

(assert (=> b!190109 (=> (not res!89874) (not e!125103))))

(assert (=> b!190109 (= res!89874 (not (= key!828 (bvneg key!828))))))

(declare-fun e!125102 () Bool)

(declare-fun array_inv!2459 (array!8089) Bool)

(declare-fun array_inv!2460 (array!8091) Bool)

(assert (=> b!190110 (= e!125102 (and tp!16827 tp_is_empty!4435 (array_inv!2459 (_keys!5849 thiss!1248)) (array_inv!2460 (_values!3863 thiss!1248)) e!125108))))

(declare-fun res!89878 () Bool)

(assert (=> start!19322 (=> (not res!89878) (not e!125103))))

(declare-fun valid!1117 (LongMapFixedSize!2656) Bool)

(assert (=> start!19322 (= res!89878 (valid!1117 thiss!1248))))

(assert (=> start!19322 e!125103))

(assert (=> start!19322 e!125102))

(assert (=> start!19322 true))

(assert (=> start!19322 tp_is_empty!4435))

(declare-fun b!190104 () Bool)

(declare-fun Unit!5735 () Unit!5733)

(assert (=> b!190104 (= e!125107 Unit!5735)))

(declare-fun lt!94228 () Unit!5733)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!164 (array!8089 array!8091 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 64) Int) Unit!5733)

(assert (=> b!190104 (= lt!94228 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!164 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)))))

(assert (=> b!190104 false))

(assert (= (and start!19322 res!89878) b!190109))

(assert (= (and b!190109 res!89874) b!190106))

(assert (= (and b!190106 res!89877) b!190103))

(assert (= (and b!190103 c!34164) b!190100))

(assert (= (and b!190103 (not c!34164)) b!190104))

(assert (= (and b!190100 res!89875) b!190108))

(assert (= (and b!190103 (not res!89876)) b!190102))

(assert (= (and b!190105 condMapEmpty!7654) mapIsEmpty!7654))

(assert (= (and b!190105 (not condMapEmpty!7654)) mapNonEmpty!7654))

(assert (= (and mapNonEmpty!7654 ((_ is ValueCellFull!1874) mapValue!7654)) b!190107))

(assert (= (and b!190105 ((_ is ValueCellFull!1874) mapDefault!7654)) b!190101))

(assert (= b!190110 b!190105))

(assert (= start!19322 b!190110))

(declare-fun m!216559 () Bool)

(assert (=> b!190110 m!216559))

(declare-fun m!216561 () Bool)

(assert (=> b!190110 m!216561))

(declare-fun m!216563 () Bool)

(assert (=> b!190103 m!216563))

(declare-fun m!216565 () Bool)

(assert (=> b!190103 m!216565))

(declare-fun m!216567 () Bool)

(assert (=> b!190103 m!216567))

(declare-fun m!216569 () Bool)

(assert (=> b!190103 m!216569))

(declare-fun m!216571 () Bool)

(assert (=> b!190103 m!216571))

(declare-fun m!216573 () Bool)

(assert (=> b!190103 m!216573))

(declare-fun m!216575 () Bool)

(assert (=> b!190103 m!216575))

(declare-fun m!216577 () Bool)

(assert (=> b!190108 m!216577))

(declare-fun m!216579 () Bool)

(assert (=> b!190104 m!216579))

(declare-fun m!216581 () Bool)

(assert (=> b!190106 m!216581))

(declare-fun m!216583 () Bool)

(assert (=> b!190100 m!216583))

(declare-fun m!216585 () Bool)

(assert (=> b!190100 m!216585))

(declare-fun m!216587 () Bool)

(assert (=> start!19322 m!216587))

(declare-fun m!216589 () Bool)

(assert (=> mapNonEmpty!7654 m!216589))

(check-sat tp_is_empty!4435 (not b!190104) (not mapNonEmpty!7654) (not b!190106) b_and!11323 (not b!190103) (not b_next!4663) (not b!190100) (not start!19322) (not b!190110))
(check-sat b_and!11323 (not b_next!4663))
(get-model)

(declare-fun d!55845 () Bool)

(assert (=> d!55845 (= (array_inv!2459 (_keys!5849 thiss!1248)) (bvsge (size!4132 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190110 d!55845))

(declare-fun d!55847 () Bool)

(assert (=> d!55847 (= (array_inv!2460 (_values!3863 thiss!1248)) (bvsge (size!4133 (_values!3863 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190110 d!55847))

(declare-fun b!190193 () Bool)

(declare-fun e!125182 () Bool)

(declare-fun e!125181 () Bool)

(assert (=> b!190193 (= e!125182 e!125181)))

(declare-fun c!34175 () Bool)

(declare-fun lt!94271 () SeekEntryResult!660)

(assert (=> b!190193 (= c!34175 ((_ is MissingVacant!660) lt!94271))))

(declare-fun b!190194 () Bool)

(declare-fun e!125183 () Bool)

(declare-fun call!19163 () Bool)

(assert (=> b!190194 (= e!125183 (not call!19163))))

(declare-fun b!190195 () Bool)

(declare-fun res!89918 () Bool)

(declare-fun e!125180 () Bool)

(assert (=> b!190195 (=> (not res!89918) (not e!125180))))

(declare-fun call!19164 () Bool)

(assert (=> b!190195 (= res!89918 call!19164)))

(assert (=> b!190195 (= e!125181 e!125180)))

(declare-fun b!190196 () Bool)

(assert (=> b!190196 (= e!125181 ((_ is Undefined!660) lt!94271))))

(declare-fun d!55849 () Bool)

(assert (=> d!55849 e!125182))

(declare-fun c!34176 () Bool)

(assert (=> d!55849 (= c!34176 ((_ is MissingZero!660) lt!94271))))

(assert (=> d!55849 (= lt!94271 (seekEntryOrOpen!0 key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)))))

(declare-fun lt!94272 () Unit!5733)

(declare-fun choose!1027 (array!8089 array!8091 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 64) Int) Unit!5733)

(assert (=> d!55849 (= lt!94272 (choose!1027 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)))))

(assert (=> d!55849 (validMask!0 (mask!9078 thiss!1248))))

(assert (=> d!55849 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!164 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)) lt!94272)))

(declare-fun bm!19160 () Bool)

(assert (=> bm!19160 (= call!19164 (inRange!0 (ite c!34176 (index!4810 lt!94271) (index!4813 lt!94271)) (mask!9078 thiss!1248)))))

(declare-fun b!190197 () Bool)

(assert (=> b!190197 (= e!125180 (not call!19163))))

(declare-fun b!190198 () Bool)

(assert (=> b!190198 (and (bvsge (index!4810 lt!94271) #b00000000000000000000000000000000) (bvslt (index!4810 lt!94271) (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun res!89920 () Bool)

(assert (=> b!190198 (= res!89920 (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4810 lt!94271)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190198 (=> (not res!89920) (not e!125183))))

(declare-fun bm!19161 () Bool)

(declare-fun arrayContainsKey!0 (array!8089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19161 (= call!19163 (arrayContainsKey!0 (_keys!5849 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!190199 () Bool)

(assert (=> b!190199 (= e!125182 e!125183)))

(declare-fun res!89917 () Bool)

(assert (=> b!190199 (= res!89917 call!19164)))

(assert (=> b!190199 (=> (not res!89917) (not e!125183))))

(declare-fun b!190200 () Bool)

(declare-fun res!89919 () Bool)

(assert (=> b!190200 (=> (not res!89919) (not e!125180))))

(assert (=> b!190200 (= res!89919 (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4813 lt!94271)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190200 (and (bvsge (index!4813 lt!94271) #b00000000000000000000000000000000) (bvslt (index!4813 lt!94271) (size!4132 (_keys!5849 thiss!1248))))))

(assert (= (and d!55849 c!34176) b!190199))

(assert (= (and d!55849 (not c!34176)) b!190193))

(assert (= (and b!190199 res!89917) b!190198))

(assert (= (and b!190198 res!89920) b!190194))

(assert (= (and b!190193 c!34175) b!190195))

(assert (= (and b!190193 (not c!34175)) b!190196))

(assert (= (and b!190195 res!89918) b!190200))

(assert (= (and b!190200 res!89919) b!190197))

(assert (= (or b!190199 b!190195) bm!19160))

(assert (= (or b!190194 b!190197) bm!19161))

(declare-fun m!216655 () Bool)

(assert (=> bm!19160 m!216655))

(declare-fun m!216657 () Bool)

(assert (=> b!190198 m!216657))

(declare-fun m!216659 () Bool)

(assert (=> bm!19161 m!216659))

(assert (=> d!55849 m!216581))

(declare-fun m!216661 () Bool)

(assert (=> d!55849 m!216661))

(assert (=> d!55849 m!216571))

(declare-fun m!216663 () Bool)

(assert (=> b!190200 m!216663))

(assert (=> b!190104 d!55849))

(declare-fun b!190213 () Bool)

(declare-fun e!125192 () SeekEntryResult!660)

(declare-fun e!125190 () SeekEntryResult!660)

(assert (=> b!190213 (= e!125192 e!125190)))

(declare-fun lt!94279 () (_ BitVec 64))

(declare-fun lt!94280 () SeekEntryResult!660)

(assert (=> b!190213 (= lt!94279 (select (arr!3812 (_keys!5849 thiss!1248)) (index!4812 lt!94280)))))

(declare-fun c!34184 () Bool)

(assert (=> b!190213 (= c!34184 (= lt!94279 key!828))))

(declare-fun b!190214 () Bool)

(declare-fun e!125191 () SeekEntryResult!660)

(assert (=> b!190214 (= e!125191 (MissingZero!660 (index!4812 lt!94280)))))

(declare-fun d!55851 () Bool)

(declare-fun lt!94281 () SeekEntryResult!660)

(assert (=> d!55851 (and (or ((_ is Undefined!660) lt!94281) (not ((_ is Found!660) lt!94281)) (and (bvsge (index!4811 lt!94281) #b00000000000000000000000000000000) (bvslt (index!4811 lt!94281) (size!4132 (_keys!5849 thiss!1248))))) (or ((_ is Undefined!660) lt!94281) ((_ is Found!660) lt!94281) (not ((_ is MissingZero!660) lt!94281)) (and (bvsge (index!4810 lt!94281) #b00000000000000000000000000000000) (bvslt (index!4810 lt!94281) (size!4132 (_keys!5849 thiss!1248))))) (or ((_ is Undefined!660) lt!94281) ((_ is Found!660) lt!94281) ((_ is MissingZero!660) lt!94281) (not ((_ is MissingVacant!660) lt!94281)) (and (bvsge (index!4813 lt!94281) #b00000000000000000000000000000000) (bvslt (index!4813 lt!94281) (size!4132 (_keys!5849 thiss!1248))))) (or ((_ is Undefined!660) lt!94281) (ite ((_ is Found!660) lt!94281) (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4811 lt!94281)) key!828) (ite ((_ is MissingZero!660) lt!94281) (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4810 lt!94281)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!660) lt!94281) (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4813 lt!94281)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55851 (= lt!94281 e!125192)))

(declare-fun c!34183 () Bool)

(assert (=> d!55851 (= c!34183 (and ((_ is Intermediate!660) lt!94280) (undefined!1472 lt!94280)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8089 (_ BitVec 32)) SeekEntryResult!660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55851 (= lt!94280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9078 thiss!1248)) key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)))))

(assert (=> d!55851 (validMask!0 (mask!9078 thiss!1248))))

(assert (=> d!55851 (= (seekEntryOrOpen!0 key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)) lt!94281)))

(declare-fun b!190215 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8089 (_ BitVec 32)) SeekEntryResult!660)

(assert (=> b!190215 (= e!125191 (seekKeyOrZeroReturnVacant!0 (x!20462 lt!94280) (index!4812 lt!94280) (index!4812 lt!94280) key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)))))

(declare-fun b!190216 () Bool)

(assert (=> b!190216 (= e!125192 Undefined!660)))

(declare-fun b!190217 () Bool)

(declare-fun c!34185 () Bool)

(assert (=> b!190217 (= c!34185 (= lt!94279 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190217 (= e!125190 e!125191)))

(declare-fun b!190218 () Bool)

(assert (=> b!190218 (= e!125190 (Found!660 (index!4812 lt!94280)))))

(assert (= (and d!55851 c!34183) b!190216))

(assert (= (and d!55851 (not c!34183)) b!190213))

(assert (= (and b!190213 c!34184) b!190218))

(assert (= (and b!190213 (not c!34184)) b!190217))

(assert (= (and b!190217 c!34185) b!190214))

(assert (= (and b!190217 (not c!34185)) b!190215))

(declare-fun m!216665 () Bool)

(assert (=> b!190213 m!216665))

(declare-fun m!216667 () Bool)

(assert (=> d!55851 m!216667))

(assert (=> d!55851 m!216571))

(declare-fun m!216669 () Bool)

(assert (=> d!55851 m!216669))

(declare-fun m!216671 () Bool)

(assert (=> d!55851 m!216671))

(assert (=> d!55851 m!216669))

(declare-fun m!216673 () Bool)

(assert (=> d!55851 m!216673))

(declare-fun m!216675 () Bool)

(assert (=> d!55851 m!216675))

(declare-fun m!216677 () Bool)

(assert (=> b!190215 m!216677))

(assert (=> b!190106 d!55851))

(declare-fun d!55853 () Bool)

(declare-fun res!89927 () Bool)

(declare-fun e!125195 () Bool)

(assert (=> d!55853 (=> (not res!89927) (not e!125195))))

(declare-fun simpleValid!195 (LongMapFixedSize!2656) Bool)

(assert (=> d!55853 (= res!89927 (simpleValid!195 thiss!1248))))

(assert (=> d!55853 (= (valid!1117 thiss!1248) e!125195)))

(declare-fun b!190225 () Bool)

(declare-fun res!89928 () Bool)

(assert (=> b!190225 (=> (not res!89928) (not e!125195))))

(declare-fun arrayCountValidKeys!0 (array!8089 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190225 (= res!89928 (= (arrayCountValidKeys!0 (_keys!5849 thiss!1248) #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))) (_size!1377 thiss!1248)))))

(declare-fun b!190226 () Bool)

(declare-fun res!89929 () Bool)

(assert (=> b!190226 (=> (not res!89929) (not e!125195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8089 (_ BitVec 32)) Bool)

(assert (=> b!190226 (= res!89929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)))))

(declare-fun b!190227 () Bool)

(declare-datatypes ((List!2380 0))(
  ( (Nil!2377) (Cons!2376 (h!3013 (_ BitVec 64)) (t!7282 List!2380)) )
))
(declare-fun arrayNoDuplicates!0 (array!8089 (_ BitVec 32) List!2380) Bool)

(assert (=> b!190227 (= e!125195 (arrayNoDuplicates!0 (_keys!5849 thiss!1248) #b00000000000000000000000000000000 Nil!2377))))

(assert (= (and d!55853 res!89927) b!190225))

(assert (= (and b!190225 res!89928) b!190226))

(assert (= (and b!190226 res!89929) b!190227))

(declare-fun m!216679 () Bool)

(assert (=> d!55853 m!216679))

(declare-fun m!216681 () Bool)

(assert (=> b!190225 m!216681))

(declare-fun m!216683 () Bool)

(assert (=> b!190226 m!216683))

(declare-fun m!216685 () Bool)

(assert (=> b!190227 m!216685))

(assert (=> start!19322 d!55853))

(declare-fun d!55855 () Bool)

(declare-fun e!125198 () Bool)

(assert (=> d!55855 e!125198))

(declare-fun res!89934 () Bool)

(assert (=> d!55855 (=> (not res!89934) (not e!125198))))

(declare-fun lt!94290 () ListLongMap!2383)

(assert (=> d!55855 (= res!89934 (contains!1328 lt!94290 (_1!1742 (tuple2!3463 key!828 v!309))))))

(declare-fun lt!94291 () List!2377)

(assert (=> d!55855 (= lt!94290 (ListLongMap!2384 lt!94291))))

(declare-fun lt!94293 () Unit!5733)

(declare-fun lt!94292 () Unit!5733)

(assert (=> d!55855 (= lt!94293 lt!94292)))

(declare-datatypes ((Option!243 0))(
  ( (Some!242 (v!4195 V!5561)) (None!241) )
))
(declare-fun getValueByKey!237 (List!2377 (_ BitVec 64)) Option!243)

(assert (=> d!55855 (= (getValueByKey!237 lt!94291 (_1!1742 (tuple2!3463 key!828 v!309))) (Some!242 (_2!1742 (tuple2!3463 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!124 (List!2377 (_ BitVec 64) V!5561) Unit!5733)

(assert (=> d!55855 (= lt!94292 (lemmaContainsTupThenGetReturnValue!124 lt!94291 (_1!1742 (tuple2!3463 key!828 v!309)) (_2!1742 (tuple2!3463 key!828 v!309))))))

(declare-fun insertStrictlySorted!127 (List!2377 (_ BitVec 64) V!5561) List!2377)

(assert (=> d!55855 (= lt!94291 (insertStrictlySorted!127 (toList!1207 lt!94227) (_1!1742 (tuple2!3463 key!828 v!309)) (_2!1742 (tuple2!3463 key!828 v!309))))))

(assert (=> d!55855 (= (+!300 lt!94227 (tuple2!3463 key!828 v!309)) lt!94290)))

(declare-fun b!190232 () Bool)

(declare-fun res!89935 () Bool)

(assert (=> b!190232 (=> (not res!89935) (not e!125198))))

(assert (=> b!190232 (= res!89935 (= (getValueByKey!237 (toList!1207 lt!94290) (_1!1742 (tuple2!3463 key!828 v!309))) (Some!242 (_2!1742 (tuple2!3463 key!828 v!309)))))))

(declare-fun b!190233 () Bool)

(declare-fun contains!1331 (List!2377 tuple2!3462) Bool)

(assert (=> b!190233 (= e!125198 (contains!1331 (toList!1207 lt!94290) (tuple2!3463 key!828 v!309)))))

(assert (= (and d!55855 res!89934) b!190232))

(assert (= (and b!190232 res!89935) b!190233))

(declare-fun m!216687 () Bool)

(assert (=> d!55855 m!216687))

(declare-fun m!216689 () Bool)

(assert (=> d!55855 m!216689))

(declare-fun m!216691 () Bool)

(assert (=> d!55855 m!216691))

(declare-fun m!216693 () Bool)

(assert (=> d!55855 m!216693))

(declare-fun m!216695 () Bool)

(assert (=> b!190232 m!216695))

(declare-fun m!216697 () Bool)

(assert (=> b!190233 m!216697))

(assert (=> b!190103 d!55855))

(declare-fun d!55857 () Bool)

(declare-fun e!125201 () Bool)

(assert (=> d!55857 e!125201))

(declare-fun res!89938 () Bool)

(assert (=> d!55857 (=> (not res!89938) (not e!125201))))

(assert (=> d!55857 (= res!89938 (and (bvsge (index!4811 lt!94229) #b00000000000000000000000000000000) (bvslt (index!4811 lt!94229) (size!4133 (_values!3863 thiss!1248)))))))

(declare-fun lt!94296 () Unit!5733)

(declare-fun choose!1028 (array!8089 array!8091 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 32) (_ BitVec 64) V!5561 Int) Unit!5733)

(assert (=> d!55857 (= lt!94296 (choose!1028 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (index!4811 lt!94229) key!828 v!309 (defaultEntry!3880 thiss!1248)))))

(assert (=> d!55857 (validMask!0 (mask!9078 thiss!1248))))

(assert (=> d!55857 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!104 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (index!4811 lt!94229) key!828 v!309 (defaultEntry!3880 thiss!1248)) lt!94296)))

(declare-fun b!190236 () Bool)

(assert (=> b!190236 (= e!125201 (= (+!300 (getCurrentListMap!859 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) (tuple2!3463 key!828 v!309)) (getCurrentListMap!859 (_keys!5849 thiss!1248) (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248))))))

(assert (= (and d!55857 res!89938) b!190236))

(declare-fun m!216699 () Bool)

(assert (=> d!55857 m!216699))

(assert (=> d!55857 m!216571))

(assert (=> b!190236 m!216567))

(assert (=> b!190236 m!216567))

(declare-fun m!216701 () Bool)

(assert (=> b!190236 m!216701))

(assert (=> b!190236 m!216565))

(assert (=> b!190236 m!216573))

(assert (=> b!190103 d!55857))

(declare-fun d!55859 () Bool)

(assert (=> d!55859 (= (validMask!0 (mask!9078 thiss!1248)) (and (or (= (mask!9078 thiss!1248) #b00000000000000000000000000000111) (= (mask!9078 thiss!1248) #b00000000000000000000000000001111) (= (mask!9078 thiss!1248) #b00000000000000000000000000011111) (= (mask!9078 thiss!1248) #b00000000000000000000000000111111) (= (mask!9078 thiss!1248) #b00000000000000000000000001111111) (= (mask!9078 thiss!1248) #b00000000000000000000000011111111) (= (mask!9078 thiss!1248) #b00000000000000000000000111111111) (= (mask!9078 thiss!1248) #b00000000000000000000001111111111) (= (mask!9078 thiss!1248) #b00000000000000000000011111111111) (= (mask!9078 thiss!1248) #b00000000000000000000111111111111) (= (mask!9078 thiss!1248) #b00000000000000000001111111111111) (= (mask!9078 thiss!1248) #b00000000000000000011111111111111) (= (mask!9078 thiss!1248) #b00000000000000000111111111111111) (= (mask!9078 thiss!1248) #b00000000000000001111111111111111) (= (mask!9078 thiss!1248) #b00000000000000011111111111111111) (= (mask!9078 thiss!1248) #b00000000000000111111111111111111) (= (mask!9078 thiss!1248) #b00000000000001111111111111111111) (= (mask!9078 thiss!1248) #b00000000000011111111111111111111) (= (mask!9078 thiss!1248) #b00000000000111111111111111111111) (= (mask!9078 thiss!1248) #b00000000001111111111111111111111) (= (mask!9078 thiss!1248) #b00000000011111111111111111111111) (= (mask!9078 thiss!1248) #b00000000111111111111111111111111) (= (mask!9078 thiss!1248) #b00000001111111111111111111111111) (= (mask!9078 thiss!1248) #b00000011111111111111111111111111) (= (mask!9078 thiss!1248) #b00000111111111111111111111111111) (= (mask!9078 thiss!1248) #b00001111111111111111111111111111) (= (mask!9078 thiss!1248) #b00011111111111111111111111111111) (= (mask!9078 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9078 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!190103 d!55859))

(declare-fun b!190279 () Bool)

(declare-fun c!34203 () Bool)

(assert (=> b!190279 (= c!34203 (and (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!125237 () ListLongMap!2383)

(declare-fun e!125230 () ListLongMap!2383)

(assert (=> b!190279 (= e!125237 e!125230)))

(declare-fun c!34198 () Bool)

(declare-fun call!19179 () ListLongMap!2383)

(declare-fun c!34199 () Bool)

(declare-fun bm!19176 () Bool)

(declare-fun call!19184 () ListLongMap!2383)

(declare-fun call!19183 () ListLongMap!2383)

(declare-fun call!19181 () ListLongMap!2383)

(assert (=> bm!19176 (= call!19181 (+!300 (ite c!34199 call!19183 (ite c!34198 call!19184 call!19179)) (ite (or c!34199 c!34198) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(declare-fun b!190280 () Bool)

(declare-fun e!125228 () Bool)

(declare-fun call!19182 () Bool)

(assert (=> b!190280 (= e!125228 (not call!19182))))

(declare-fun d!55861 () Bool)

(declare-fun e!125234 () Bool)

(assert (=> d!55861 e!125234))

(declare-fun res!89961 () Bool)

(assert (=> d!55861 (=> (not res!89961) (not e!125234))))

(assert (=> d!55861 (= res!89961 (or (bvsge #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))))

(declare-fun lt!94347 () ListLongMap!2383)

(declare-fun lt!94355 () ListLongMap!2383)

(assert (=> d!55861 (= lt!94347 lt!94355)))

(declare-fun lt!94354 () Unit!5733)

(declare-fun e!125238 () Unit!5733)

(assert (=> d!55861 (= lt!94354 e!125238)))

(declare-fun c!34202 () Bool)

(declare-fun e!125239 () Bool)

(assert (=> d!55861 (= c!34202 e!125239)))

(declare-fun res!89960 () Bool)

(assert (=> d!55861 (=> (not res!89960) (not e!125239))))

(assert (=> d!55861 (= res!89960 (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun e!125236 () ListLongMap!2383)

(assert (=> d!55861 (= lt!94355 e!125236)))

(assert (=> d!55861 (= c!34199 (and (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55861 (validMask!0 (mask!9078 thiss!1248))))

(assert (=> d!55861 (= (getCurrentListMap!859 (_keys!5849 thiss!1248) (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) lt!94347)))

(declare-fun b!190281 () Bool)

(declare-fun e!125240 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!190281 (= e!125240 (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190282 () Bool)

(declare-fun e!125231 () Bool)

(declare-fun e!125235 () Bool)

(assert (=> b!190282 (= e!125231 e!125235)))

(declare-fun res!89957 () Bool)

(assert (=> b!190282 (=> (not res!89957) (not e!125235))))

(assert (=> b!190282 (= res!89957 (contains!1328 lt!94347 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun b!190283 () Bool)

(declare-fun res!89958 () Bool)

(assert (=> b!190283 (=> (not res!89958) (not e!125234))))

(declare-fun e!125233 () Bool)

(assert (=> b!190283 (= res!89958 e!125233)))

(declare-fun c!34201 () Bool)

(assert (=> b!190283 (= c!34201 (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!190284 () Bool)

(declare-fun e!125232 () Bool)

(assert (=> b!190284 (= e!125233 e!125232)))

(declare-fun res!89965 () Bool)

(declare-fun call!19185 () Bool)

(assert (=> b!190284 (= res!89965 call!19185)))

(assert (=> b!190284 (=> (not res!89965) (not e!125232))))

(declare-fun bm!19177 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!210 (array!8089 array!8091 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 32) Int) ListLongMap!2383)

(assert (=> bm!19177 (= call!19183 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun bm!19178 () Bool)

(declare-fun call!19180 () ListLongMap!2383)

(assert (=> bm!19178 (= call!19180 call!19181)))

(declare-fun b!190285 () Bool)

(declare-fun apply!179 (ListLongMap!2383 (_ BitVec 64)) V!5561)

(assert (=> b!190285 (= e!125232 (= (apply!179 lt!94347 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3721 thiss!1248)))))

(declare-fun bm!19179 () Bool)

(assert (=> bm!19179 (= call!19185 (contains!1328 lt!94347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190286 () Bool)

(declare-fun get!2204 (ValueCell!1874 V!5561) V!5561)

(declare-fun dynLambda!522 (Int (_ BitVec 64)) V!5561)

(assert (=> b!190286 (= e!125235 (= (apply!179 lt!94347 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)) (get!2204 (select (arr!3813 (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4133 (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))))))))

(assert (=> b!190286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun bm!19180 () Bool)

(assert (=> bm!19180 (= call!19182 (contains!1328 lt!94347 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190287 () Bool)

(assert (=> b!190287 (= e!125230 call!19180)))

(declare-fun b!190288 () Bool)

(assert (=> b!190288 (= e!125236 e!125237)))

(assert (=> b!190288 (= c!34198 (and (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190289 () Bool)

(declare-fun lt!94361 () Unit!5733)

(assert (=> b!190289 (= e!125238 lt!94361)))

(declare-fun lt!94343 () ListLongMap!2383)

(assert (=> b!190289 (= lt!94343 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94341 () (_ BitVec 64))

(assert (=> b!190289 (= lt!94341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94348 () (_ BitVec 64))

(assert (=> b!190289 (= lt!94348 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94342 () Unit!5733)

(declare-fun addStillContains!155 (ListLongMap!2383 (_ BitVec 64) V!5561 (_ BitVec 64)) Unit!5733)

(assert (=> b!190289 (= lt!94342 (addStillContains!155 lt!94343 lt!94341 (zeroValue!3721 thiss!1248) lt!94348))))

(assert (=> b!190289 (contains!1328 (+!300 lt!94343 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248))) lt!94348)))

(declare-fun lt!94360 () Unit!5733)

(assert (=> b!190289 (= lt!94360 lt!94342)))

(declare-fun lt!94352 () ListLongMap!2383)

(assert (=> b!190289 (= lt!94352 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94345 () (_ BitVec 64))

(assert (=> b!190289 (= lt!94345 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94353 () (_ BitVec 64))

(assert (=> b!190289 (= lt!94353 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94346 () Unit!5733)

(declare-fun addApplyDifferent!155 (ListLongMap!2383 (_ BitVec 64) V!5561 (_ BitVec 64)) Unit!5733)

(assert (=> b!190289 (= lt!94346 (addApplyDifferent!155 lt!94352 lt!94345 (minValue!3721 thiss!1248) lt!94353))))

(assert (=> b!190289 (= (apply!179 (+!300 lt!94352 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248))) lt!94353) (apply!179 lt!94352 lt!94353))))

(declare-fun lt!94356 () Unit!5733)

(assert (=> b!190289 (= lt!94356 lt!94346)))

(declare-fun lt!94362 () ListLongMap!2383)

(assert (=> b!190289 (= lt!94362 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94357 () (_ BitVec 64))

(assert (=> b!190289 (= lt!94357 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94350 () (_ BitVec 64))

(assert (=> b!190289 (= lt!94350 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94358 () Unit!5733)

(assert (=> b!190289 (= lt!94358 (addApplyDifferent!155 lt!94362 lt!94357 (zeroValue!3721 thiss!1248) lt!94350))))

(assert (=> b!190289 (= (apply!179 (+!300 lt!94362 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248))) lt!94350) (apply!179 lt!94362 lt!94350))))

(declare-fun lt!94344 () Unit!5733)

(assert (=> b!190289 (= lt!94344 lt!94358)))

(declare-fun lt!94351 () ListLongMap!2383)

(assert (=> b!190289 (= lt!94351 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94359 () (_ BitVec 64))

(assert (=> b!190289 (= lt!94359 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94349 () (_ BitVec 64))

(assert (=> b!190289 (= lt!94349 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190289 (= lt!94361 (addApplyDifferent!155 lt!94351 lt!94359 (minValue!3721 thiss!1248) lt!94349))))

(assert (=> b!190289 (= (apply!179 (+!300 lt!94351 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248))) lt!94349) (apply!179 lt!94351 lt!94349))))

(declare-fun b!190290 () Bool)

(assert (=> b!190290 (= e!125236 (+!300 call!19181 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))

(declare-fun b!190291 () Bool)

(assert (=> b!190291 (= e!125233 (not call!19185))))

(declare-fun b!190292 () Bool)

(declare-fun e!125229 () Bool)

(assert (=> b!190292 (= e!125228 e!125229)))

(declare-fun res!89962 () Bool)

(assert (=> b!190292 (= res!89962 call!19182)))

(assert (=> b!190292 (=> (not res!89962) (not e!125229))))

(declare-fun b!190293 () Bool)

(declare-fun res!89963 () Bool)

(assert (=> b!190293 (=> (not res!89963) (not e!125234))))

(assert (=> b!190293 (= res!89963 e!125231)))

(declare-fun res!89959 () Bool)

(assert (=> b!190293 (=> res!89959 e!125231)))

(assert (=> b!190293 (= res!89959 (not e!125240))))

(declare-fun res!89964 () Bool)

(assert (=> b!190293 (=> (not res!89964) (not e!125240))))

(assert (=> b!190293 (= res!89964 (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun b!190294 () Bool)

(assert (=> b!190294 (= e!125234 e!125228)))

(declare-fun c!34200 () Bool)

(assert (=> b!190294 (= c!34200 (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19181 () Bool)

(assert (=> bm!19181 (= call!19179 call!19184)))

(declare-fun b!190295 () Bool)

(declare-fun Unit!5741 () Unit!5733)

(assert (=> b!190295 (= e!125238 Unit!5741)))

(declare-fun bm!19182 () Bool)

(assert (=> bm!19182 (= call!19184 call!19183)))

(declare-fun b!190296 () Bool)

(assert (=> b!190296 (= e!125230 call!19179)))

(declare-fun b!190297 () Bool)

(assert (=> b!190297 (= e!125239 (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190298 () Bool)

(assert (=> b!190298 (= e!125237 call!19180)))

(declare-fun b!190299 () Bool)

(assert (=> b!190299 (= e!125229 (= (apply!179 lt!94347 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3721 thiss!1248)))))

(assert (= (and d!55861 c!34199) b!190290))

(assert (= (and d!55861 (not c!34199)) b!190288))

(assert (= (and b!190288 c!34198) b!190298))

(assert (= (and b!190288 (not c!34198)) b!190279))

(assert (= (and b!190279 c!34203) b!190287))

(assert (= (and b!190279 (not c!34203)) b!190296))

(assert (= (or b!190287 b!190296) bm!19181))

(assert (= (or b!190298 bm!19181) bm!19182))

(assert (= (or b!190298 b!190287) bm!19178))

(assert (= (or b!190290 bm!19182) bm!19177))

(assert (= (or b!190290 bm!19178) bm!19176))

(assert (= (and d!55861 res!89960) b!190297))

(assert (= (and d!55861 c!34202) b!190289))

(assert (= (and d!55861 (not c!34202)) b!190295))

(assert (= (and d!55861 res!89961) b!190293))

(assert (= (and b!190293 res!89964) b!190281))

(assert (= (and b!190293 (not res!89959)) b!190282))

(assert (= (and b!190282 res!89957) b!190286))

(assert (= (and b!190293 res!89963) b!190283))

(assert (= (and b!190283 c!34201) b!190284))

(assert (= (and b!190283 (not c!34201)) b!190291))

(assert (= (and b!190284 res!89965) b!190285))

(assert (= (or b!190284 b!190291) bm!19179))

(assert (= (and b!190283 res!89958) b!190294))

(assert (= (and b!190294 c!34200) b!190292))

(assert (= (and b!190294 (not c!34200)) b!190280))

(assert (= (and b!190292 res!89962) b!190299))

(assert (= (or b!190292 b!190280) bm!19180))

(declare-fun b_lambda!7365 () Bool)

(assert (=> (not b_lambda!7365) (not b!190286)))

(declare-fun t!7281 () Bool)

(declare-fun tb!2861 () Bool)

(assert (=> (and b!190110 (= (defaultEntry!3880 thiss!1248) (defaultEntry!3880 thiss!1248)) t!7281) tb!2861))

(declare-fun result!4877 () Bool)

(assert (=> tb!2861 (= result!4877 tp_is_empty!4435)))

(assert (=> b!190286 t!7281))

(declare-fun b_and!11329 () Bool)

(assert (= b_and!11323 (and (=> t!7281 result!4877) b_and!11329)))

(declare-fun m!216703 () Bool)

(assert (=> b!190299 m!216703))

(declare-fun m!216705 () Bool)

(assert (=> b!190286 m!216705))

(declare-fun m!216707 () Bool)

(assert (=> b!190286 m!216707))

(assert (=> b!190286 m!216707))

(assert (=> b!190286 m!216705))

(declare-fun m!216709 () Bool)

(assert (=> b!190286 m!216709))

(declare-fun m!216711 () Bool)

(assert (=> b!190286 m!216711))

(declare-fun m!216713 () Bool)

(assert (=> b!190286 m!216713))

(assert (=> b!190286 m!216711))

(declare-fun m!216715 () Bool)

(assert (=> bm!19177 m!216715))

(declare-fun m!216717 () Bool)

(assert (=> bm!19179 m!216717))

(declare-fun m!216719 () Bool)

(assert (=> bm!19180 m!216719))

(assert (=> b!190281 m!216711))

(assert (=> b!190281 m!216711))

(declare-fun m!216721 () Bool)

(assert (=> b!190281 m!216721))

(declare-fun m!216723 () Bool)

(assert (=> b!190289 m!216723))

(declare-fun m!216725 () Bool)

(assert (=> b!190289 m!216725))

(declare-fun m!216727 () Bool)

(assert (=> b!190289 m!216727))

(declare-fun m!216729 () Bool)

(assert (=> b!190289 m!216729))

(declare-fun m!216731 () Bool)

(assert (=> b!190289 m!216731))

(declare-fun m!216733 () Bool)

(assert (=> b!190289 m!216733))

(assert (=> b!190289 m!216715))

(assert (=> b!190289 m!216731))

(declare-fun m!216735 () Bool)

(assert (=> b!190289 m!216735))

(declare-fun m!216737 () Bool)

(assert (=> b!190289 m!216737))

(declare-fun m!216739 () Bool)

(assert (=> b!190289 m!216739))

(declare-fun m!216741 () Bool)

(assert (=> b!190289 m!216741))

(declare-fun m!216743 () Bool)

(assert (=> b!190289 m!216743))

(declare-fun m!216745 () Bool)

(assert (=> b!190289 m!216745))

(assert (=> b!190289 m!216727))

(declare-fun m!216747 () Bool)

(assert (=> b!190289 m!216747))

(assert (=> b!190289 m!216743))

(declare-fun m!216749 () Bool)

(assert (=> b!190289 m!216749))

(assert (=> b!190289 m!216737))

(declare-fun m!216751 () Bool)

(assert (=> b!190289 m!216751))

(assert (=> b!190289 m!216711))

(declare-fun m!216753 () Bool)

(assert (=> bm!19176 m!216753))

(assert (=> b!190297 m!216711))

(assert (=> b!190297 m!216711))

(assert (=> b!190297 m!216721))

(assert (=> b!190282 m!216711))

(assert (=> b!190282 m!216711))

(declare-fun m!216755 () Bool)

(assert (=> b!190282 m!216755))

(declare-fun m!216757 () Bool)

(assert (=> b!190285 m!216757))

(declare-fun m!216759 () Bool)

(assert (=> b!190290 m!216759))

(assert (=> d!55861 m!216571))

(assert (=> b!190103 d!55861))

(declare-fun d!55863 () Bool)

(declare-fun e!125246 () Bool)

(assert (=> d!55863 e!125246))

(declare-fun res!89968 () Bool)

(assert (=> d!55863 (=> res!89968 e!125246)))

(declare-fun lt!94371 () Bool)

(assert (=> d!55863 (= res!89968 (not lt!94371))))

(declare-fun lt!94372 () Bool)

(assert (=> d!55863 (= lt!94371 lt!94372)))

(declare-fun lt!94373 () Unit!5733)

(declare-fun e!125245 () Unit!5733)

(assert (=> d!55863 (= lt!94373 e!125245)))

(declare-fun c!34206 () Bool)

(assert (=> d!55863 (= c!34206 lt!94372)))

(declare-fun containsKey!240 (List!2377 (_ BitVec 64)) Bool)

(assert (=> d!55863 (= lt!94372 (containsKey!240 (toList!1207 lt!94227) key!828))))

(assert (=> d!55863 (= (contains!1328 lt!94227 key!828) lt!94371)))

(declare-fun b!190308 () Bool)

(declare-fun lt!94374 () Unit!5733)

(assert (=> b!190308 (= e!125245 lt!94374)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!188 (List!2377 (_ BitVec 64)) Unit!5733)

(assert (=> b!190308 (= lt!94374 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1207 lt!94227) key!828))))

(declare-fun isDefined!189 (Option!243) Bool)

(assert (=> b!190308 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94227) key!828))))

(declare-fun b!190309 () Bool)

(declare-fun Unit!5742 () Unit!5733)

(assert (=> b!190309 (= e!125245 Unit!5742)))

(declare-fun b!190310 () Bool)

(assert (=> b!190310 (= e!125246 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94227) key!828)))))

(assert (= (and d!55863 c!34206) b!190308))

(assert (= (and d!55863 (not c!34206)) b!190309))

(assert (= (and d!55863 (not res!89968)) b!190310))

(declare-fun m!216761 () Bool)

(assert (=> d!55863 m!216761))

(declare-fun m!216763 () Bool)

(assert (=> b!190308 m!216763))

(declare-fun m!216765 () Bool)

(assert (=> b!190308 m!216765))

(assert (=> b!190308 m!216765))

(declare-fun m!216767 () Bool)

(assert (=> b!190308 m!216767))

(assert (=> b!190310 m!216765))

(assert (=> b!190310 m!216765))

(assert (=> b!190310 m!216767))

(assert (=> b!190103 d!55863))

(declare-fun b!190311 () Bool)

(declare-fun c!34212 () Bool)

(assert (=> b!190311 (= c!34212 (and (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!125256 () ListLongMap!2383)

(declare-fun e!125249 () ListLongMap!2383)

(assert (=> b!190311 (= e!125256 e!125249)))

(declare-fun call!19188 () ListLongMap!2383)

(declare-fun c!34207 () Bool)

(declare-fun c!34208 () Bool)

(declare-fun bm!19183 () Bool)

(declare-fun call!19191 () ListLongMap!2383)

(declare-fun call!19190 () ListLongMap!2383)

(declare-fun call!19186 () ListLongMap!2383)

(assert (=> bm!19183 (= call!19188 (+!300 (ite c!34208 call!19190 (ite c!34207 call!19191 call!19186)) (ite (or c!34208 c!34207) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(declare-fun b!190312 () Bool)

(declare-fun e!125247 () Bool)

(declare-fun call!19189 () Bool)

(assert (=> b!190312 (= e!125247 (not call!19189))))

(declare-fun d!55865 () Bool)

(declare-fun e!125253 () Bool)

(assert (=> d!55865 e!125253))

(declare-fun res!89973 () Bool)

(assert (=> d!55865 (=> (not res!89973) (not e!125253))))

(assert (=> d!55865 (= res!89973 (or (bvsge #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))))

(declare-fun lt!94381 () ListLongMap!2383)

(declare-fun lt!94389 () ListLongMap!2383)

(assert (=> d!55865 (= lt!94381 lt!94389)))

(declare-fun lt!94388 () Unit!5733)

(declare-fun e!125257 () Unit!5733)

(assert (=> d!55865 (= lt!94388 e!125257)))

(declare-fun c!34211 () Bool)

(declare-fun e!125258 () Bool)

(assert (=> d!55865 (= c!34211 e!125258)))

(declare-fun res!89972 () Bool)

(assert (=> d!55865 (=> (not res!89972) (not e!125258))))

(assert (=> d!55865 (= res!89972 (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun e!125255 () ListLongMap!2383)

(assert (=> d!55865 (= lt!94389 e!125255)))

(assert (=> d!55865 (= c!34208 (and (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55865 (validMask!0 (mask!9078 thiss!1248))))

(assert (=> d!55865 (= (getCurrentListMap!859 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) lt!94381)))

(declare-fun b!190313 () Bool)

(declare-fun e!125259 () Bool)

(assert (=> b!190313 (= e!125259 (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190314 () Bool)

(declare-fun e!125250 () Bool)

(declare-fun e!125254 () Bool)

(assert (=> b!190314 (= e!125250 e!125254)))

(declare-fun res!89969 () Bool)

(assert (=> b!190314 (=> (not res!89969) (not e!125254))))

(assert (=> b!190314 (= res!89969 (contains!1328 lt!94381 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190314 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun b!190315 () Bool)

(declare-fun res!89970 () Bool)

(assert (=> b!190315 (=> (not res!89970) (not e!125253))))

(declare-fun e!125252 () Bool)

(assert (=> b!190315 (= res!89970 e!125252)))

(declare-fun c!34210 () Bool)

(assert (=> b!190315 (= c!34210 (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!190316 () Bool)

(declare-fun e!125251 () Bool)

(assert (=> b!190316 (= e!125252 e!125251)))

(declare-fun res!89977 () Bool)

(declare-fun call!19192 () Bool)

(assert (=> b!190316 (= res!89977 call!19192)))

(assert (=> b!190316 (=> (not res!89977) (not e!125251))))

(declare-fun bm!19184 () Bool)

(assert (=> bm!19184 (= call!19190 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun bm!19185 () Bool)

(declare-fun call!19187 () ListLongMap!2383)

(assert (=> bm!19185 (= call!19187 call!19188)))

(declare-fun b!190317 () Bool)

(assert (=> b!190317 (= e!125251 (= (apply!179 lt!94381 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3721 thiss!1248)))))

(declare-fun bm!19186 () Bool)

(assert (=> bm!19186 (= call!19192 (contains!1328 lt!94381 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190318 () Bool)

(assert (=> b!190318 (= e!125254 (= (apply!179 lt!94381 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)) (get!2204 (select (arr!3813 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190318 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4133 (_values!3863 thiss!1248))))))

(assert (=> b!190318 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun bm!19187 () Bool)

(assert (=> bm!19187 (= call!19189 (contains!1328 lt!94381 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190319 () Bool)

(assert (=> b!190319 (= e!125249 call!19187)))

(declare-fun b!190320 () Bool)

(assert (=> b!190320 (= e!125255 e!125256)))

(assert (=> b!190320 (= c!34207 (and (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190321 () Bool)

(declare-fun lt!94395 () Unit!5733)

(assert (=> b!190321 (= e!125257 lt!94395)))

(declare-fun lt!94377 () ListLongMap!2383)

(assert (=> b!190321 (= lt!94377 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94375 () (_ BitVec 64))

(assert (=> b!190321 (= lt!94375 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94382 () (_ BitVec 64))

(assert (=> b!190321 (= lt!94382 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94376 () Unit!5733)

(assert (=> b!190321 (= lt!94376 (addStillContains!155 lt!94377 lt!94375 (zeroValue!3721 thiss!1248) lt!94382))))

(assert (=> b!190321 (contains!1328 (+!300 lt!94377 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248))) lt!94382)))

(declare-fun lt!94394 () Unit!5733)

(assert (=> b!190321 (= lt!94394 lt!94376)))

(declare-fun lt!94386 () ListLongMap!2383)

(assert (=> b!190321 (= lt!94386 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94379 () (_ BitVec 64))

(assert (=> b!190321 (= lt!94379 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94387 () (_ BitVec 64))

(assert (=> b!190321 (= lt!94387 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94380 () Unit!5733)

(assert (=> b!190321 (= lt!94380 (addApplyDifferent!155 lt!94386 lt!94379 (minValue!3721 thiss!1248) lt!94387))))

(assert (=> b!190321 (= (apply!179 (+!300 lt!94386 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248))) lt!94387) (apply!179 lt!94386 lt!94387))))

(declare-fun lt!94390 () Unit!5733)

(assert (=> b!190321 (= lt!94390 lt!94380)))

(declare-fun lt!94396 () ListLongMap!2383)

(assert (=> b!190321 (= lt!94396 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94391 () (_ BitVec 64))

(assert (=> b!190321 (= lt!94391 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94384 () (_ BitVec 64))

(assert (=> b!190321 (= lt!94384 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94392 () Unit!5733)

(assert (=> b!190321 (= lt!94392 (addApplyDifferent!155 lt!94396 lt!94391 (zeroValue!3721 thiss!1248) lt!94384))))

(assert (=> b!190321 (= (apply!179 (+!300 lt!94396 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248))) lt!94384) (apply!179 lt!94396 lt!94384))))

(declare-fun lt!94378 () Unit!5733)

(assert (=> b!190321 (= lt!94378 lt!94392)))

(declare-fun lt!94385 () ListLongMap!2383)

(assert (=> b!190321 (= lt!94385 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(declare-fun lt!94393 () (_ BitVec 64))

(assert (=> b!190321 (= lt!94393 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94383 () (_ BitVec 64))

(assert (=> b!190321 (= lt!94383 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190321 (= lt!94395 (addApplyDifferent!155 lt!94385 lt!94393 (minValue!3721 thiss!1248) lt!94383))))

(assert (=> b!190321 (= (apply!179 (+!300 lt!94385 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248))) lt!94383) (apply!179 lt!94385 lt!94383))))

(declare-fun b!190322 () Bool)

(assert (=> b!190322 (= e!125255 (+!300 call!19188 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))

(declare-fun b!190323 () Bool)

(assert (=> b!190323 (= e!125252 (not call!19192))))

(declare-fun b!190324 () Bool)

(declare-fun e!125248 () Bool)

(assert (=> b!190324 (= e!125247 e!125248)))

(declare-fun res!89974 () Bool)

(assert (=> b!190324 (= res!89974 call!19189)))

(assert (=> b!190324 (=> (not res!89974) (not e!125248))))

(declare-fun b!190325 () Bool)

(declare-fun res!89975 () Bool)

(assert (=> b!190325 (=> (not res!89975) (not e!125253))))

(assert (=> b!190325 (= res!89975 e!125250)))

(declare-fun res!89971 () Bool)

(assert (=> b!190325 (=> res!89971 e!125250)))

(assert (=> b!190325 (= res!89971 (not e!125259))))

(declare-fun res!89976 () Bool)

(assert (=> b!190325 (=> (not res!89976) (not e!125259))))

(assert (=> b!190325 (= res!89976 (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun b!190326 () Bool)

(assert (=> b!190326 (= e!125253 e!125247)))

(declare-fun c!34209 () Bool)

(assert (=> b!190326 (= c!34209 (not (= (bvand (extraKeys!3617 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19188 () Bool)

(assert (=> bm!19188 (= call!19186 call!19191)))

(declare-fun b!190327 () Bool)

(declare-fun Unit!5743 () Unit!5733)

(assert (=> b!190327 (= e!125257 Unit!5743)))

(declare-fun bm!19189 () Bool)

(assert (=> bm!19189 (= call!19191 call!19190)))

(declare-fun b!190328 () Bool)

(assert (=> b!190328 (= e!125249 call!19186)))

(declare-fun b!190329 () Bool)

(assert (=> b!190329 (= e!125258 (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190330 () Bool)

(assert (=> b!190330 (= e!125256 call!19187)))

(declare-fun b!190331 () Bool)

(assert (=> b!190331 (= e!125248 (= (apply!179 lt!94381 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3721 thiss!1248)))))

(assert (= (and d!55865 c!34208) b!190322))

(assert (= (and d!55865 (not c!34208)) b!190320))

(assert (= (and b!190320 c!34207) b!190330))

(assert (= (and b!190320 (not c!34207)) b!190311))

(assert (= (and b!190311 c!34212) b!190319))

(assert (= (and b!190311 (not c!34212)) b!190328))

(assert (= (or b!190319 b!190328) bm!19188))

(assert (= (or b!190330 bm!19188) bm!19189))

(assert (= (or b!190330 b!190319) bm!19185))

(assert (= (or b!190322 bm!19189) bm!19184))

(assert (= (or b!190322 bm!19185) bm!19183))

(assert (= (and d!55865 res!89972) b!190329))

(assert (= (and d!55865 c!34211) b!190321))

(assert (= (and d!55865 (not c!34211)) b!190327))

(assert (= (and d!55865 res!89973) b!190325))

(assert (= (and b!190325 res!89976) b!190313))

(assert (= (and b!190325 (not res!89971)) b!190314))

(assert (= (and b!190314 res!89969) b!190318))

(assert (= (and b!190325 res!89975) b!190315))

(assert (= (and b!190315 c!34210) b!190316))

(assert (= (and b!190315 (not c!34210)) b!190323))

(assert (= (and b!190316 res!89977) b!190317))

(assert (= (or b!190316 b!190323) bm!19186))

(assert (= (and b!190315 res!89970) b!190326))

(assert (= (and b!190326 c!34209) b!190324))

(assert (= (and b!190326 (not c!34209)) b!190312))

(assert (= (and b!190324 res!89974) b!190331))

(assert (= (or b!190324 b!190312) bm!19187))

(declare-fun b_lambda!7367 () Bool)

(assert (=> (not b_lambda!7367) (not b!190318)))

(assert (=> b!190318 t!7281))

(declare-fun b_and!11331 () Bool)

(assert (= b_and!11329 (and (=> t!7281 result!4877) b_and!11331)))

(declare-fun m!216769 () Bool)

(assert (=> b!190331 m!216769))

(assert (=> b!190318 m!216705))

(declare-fun m!216771 () Bool)

(assert (=> b!190318 m!216771))

(assert (=> b!190318 m!216771))

(assert (=> b!190318 m!216705))

(declare-fun m!216773 () Bool)

(assert (=> b!190318 m!216773))

(assert (=> b!190318 m!216711))

(declare-fun m!216775 () Bool)

(assert (=> b!190318 m!216775))

(assert (=> b!190318 m!216711))

(declare-fun m!216777 () Bool)

(assert (=> bm!19184 m!216777))

(declare-fun m!216779 () Bool)

(assert (=> bm!19186 m!216779))

(declare-fun m!216781 () Bool)

(assert (=> bm!19187 m!216781))

(assert (=> b!190313 m!216711))

(assert (=> b!190313 m!216711))

(assert (=> b!190313 m!216721))

(declare-fun m!216783 () Bool)

(assert (=> b!190321 m!216783))

(declare-fun m!216785 () Bool)

(assert (=> b!190321 m!216785))

(declare-fun m!216787 () Bool)

(assert (=> b!190321 m!216787))

(declare-fun m!216789 () Bool)

(assert (=> b!190321 m!216789))

(declare-fun m!216791 () Bool)

(assert (=> b!190321 m!216791))

(declare-fun m!216793 () Bool)

(assert (=> b!190321 m!216793))

(assert (=> b!190321 m!216777))

(assert (=> b!190321 m!216791))

(declare-fun m!216795 () Bool)

(assert (=> b!190321 m!216795))

(declare-fun m!216797 () Bool)

(assert (=> b!190321 m!216797))

(declare-fun m!216799 () Bool)

(assert (=> b!190321 m!216799))

(declare-fun m!216801 () Bool)

(assert (=> b!190321 m!216801))

(declare-fun m!216803 () Bool)

(assert (=> b!190321 m!216803))

(declare-fun m!216805 () Bool)

(assert (=> b!190321 m!216805))

(assert (=> b!190321 m!216787))

(declare-fun m!216807 () Bool)

(assert (=> b!190321 m!216807))

(assert (=> b!190321 m!216803))

(declare-fun m!216809 () Bool)

(assert (=> b!190321 m!216809))

(assert (=> b!190321 m!216797))

(declare-fun m!216811 () Bool)

(assert (=> b!190321 m!216811))

(assert (=> b!190321 m!216711))

(declare-fun m!216813 () Bool)

(assert (=> bm!19183 m!216813))

(assert (=> b!190329 m!216711))

(assert (=> b!190329 m!216711))

(assert (=> b!190329 m!216721))

(assert (=> b!190314 m!216711))

(assert (=> b!190314 m!216711))

(declare-fun m!216815 () Bool)

(assert (=> b!190314 m!216815))

(declare-fun m!216817 () Bool)

(assert (=> b!190317 m!216817))

(declare-fun m!216819 () Bool)

(assert (=> b!190322 m!216819))

(assert (=> d!55865 m!216571))

(assert (=> b!190103 d!55865))

(declare-fun d!55867 () Bool)

(declare-fun e!125262 () Bool)

(assert (=> d!55867 e!125262))

(declare-fun res!89983 () Bool)

(assert (=> d!55867 (=> (not res!89983) (not e!125262))))

(declare-fun lt!94401 () SeekEntryResult!660)

(assert (=> d!55867 (= res!89983 ((_ is Found!660) lt!94401))))

(assert (=> d!55867 (= lt!94401 (seekEntryOrOpen!0 key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)))))

(declare-fun lt!94402 () Unit!5733)

(declare-fun choose!1029 (array!8089 array!8091 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 64) Int) Unit!5733)

(assert (=> d!55867 (= lt!94402 (choose!1029 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)))))

(assert (=> d!55867 (validMask!0 (mask!9078 thiss!1248))))

(assert (=> d!55867 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!170 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)) lt!94402)))

(declare-fun b!190336 () Bool)

(declare-fun res!89982 () Bool)

(assert (=> b!190336 (=> (not res!89982) (not e!125262))))

(assert (=> b!190336 (= res!89982 (inRange!0 (index!4811 lt!94401) (mask!9078 thiss!1248)))))

(declare-fun b!190337 () Bool)

(assert (=> b!190337 (= e!125262 (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4811 lt!94401)) key!828))))

(assert (=> b!190337 (and (bvsge (index!4811 lt!94401) #b00000000000000000000000000000000) (bvslt (index!4811 lt!94401) (size!4132 (_keys!5849 thiss!1248))))))

(assert (= (and d!55867 res!89983) b!190336))

(assert (= (and b!190336 res!89982) b!190337))

(assert (=> d!55867 m!216581))

(declare-fun m!216821 () Bool)

(assert (=> d!55867 m!216821))

(assert (=> d!55867 m!216571))

(declare-fun m!216823 () Bool)

(assert (=> b!190336 m!216823))

(declare-fun m!216825 () Bool)

(assert (=> b!190337 m!216825))

(assert (=> b!190100 d!55867))

(declare-fun d!55869 () Bool)

(assert (=> d!55869 (= (inRange!0 (index!4811 lt!94229) (mask!9078 thiss!1248)) (and (bvsge (index!4811 lt!94229) #b00000000000000000000000000000000) (bvslt (index!4811 lt!94229) (bvadd (mask!9078 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!190100 d!55869))

(declare-fun mapNonEmpty!7663 () Bool)

(declare-fun mapRes!7663 () Bool)

(declare-fun tp!16843 () Bool)

(declare-fun e!125268 () Bool)

(assert (=> mapNonEmpty!7663 (= mapRes!7663 (and tp!16843 e!125268))))

(declare-fun mapValue!7663 () ValueCell!1874)

(declare-fun mapRest!7663 () (Array (_ BitVec 32) ValueCell!1874))

(declare-fun mapKey!7663 () (_ BitVec 32))

(assert (=> mapNonEmpty!7663 (= mapRest!7654 (store mapRest!7663 mapKey!7663 mapValue!7663))))

(declare-fun b!190345 () Bool)

(declare-fun e!125267 () Bool)

(assert (=> b!190345 (= e!125267 tp_is_empty!4435)))

(declare-fun b!190344 () Bool)

(assert (=> b!190344 (= e!125268 tp_is_empty!4435)))

(declare-fun mapIsEmpty!7663 () Bool)

(assert (=> mapIsEmpty!7663 mapRes!7663))

(declare-fun condMapEmpty!7663 () Bool)

(declare-fun mapDefault!7663 () ValueCell!1874)

(assert (=> mapNonEmpty!7654 (= condMapEmpty!7663 (= mapRest!7654 ((as const (Array (_ BitVec 32) ValueCell!1874)) mapDefault!7663)))))

(assert (=> mapNonEmpty!7654 (= tp!16828 (and e!125267 mapRes!7663))))

(assert (= (and mapNonEmpty!7654 condMapEmpty!7663) mapIsEmpty!7663))

(assert (= (and mapNonEmpty!7654 (not condMapEmpty!7663)) mapNonEmpty!7663))

(assert (= (and mapNonEmpty!7663 ((_ is ValueCellFull!1874) mapValue!7663)) b!190344))

(assert (= (and mapNonEmpty!7654 ((_ is ValueCellFull!1874) mapDefault!7663)) b!190345))

(declare-fun m!216827 () Bool)

(assert (=> mapNonEmpty!7663 m!216827))

(declare-fun b_lambda!7369 () Bool)

(assert (= b_lambda!7365 (or (and b!190110 b_free!4663) b_lambda!7369)))

(declare-fun b_lambda!7371 () Bool)

(assert (= b_lambda!7367 (or (and b!190110 b_free!4663) b_lambda!7371)))

(check-sat (not d!55855) (not d!55853) (not b_lambda!7371) (not bm!19187) (not b!190281) (not b!190236) (not b!190313) (not bm!19186) (not d!55867) (not b_next!4663) (not b!190336) (not b!190329) (not d!55851) (not b!190290) (not bm!19180) (not bm!19161) tp_is_empty!4435 (not mapNonEmpty!7663) (not d!55849) (not b!190331) (not bm!19177) (not b!190225) (not b!190314) (not b!190308) (not b!190233) (not b_lambda!7369) (not b!190317) (not b!190226) (not bm!19183) (not b!190227) (not b!190289) (not b!190286) b_and!11331 (not bm!19176) (not b!190285) (not bm!19184) (not bm!19179) (not b!190215) (not d!55857) (not b!190232) (not bm!19160) (not b!190297) (not d!55861) (not b!190321) (not d!55863) (not b!190318) (not b!190299) (not b!190282) (not b!190310) (not d!55865) (not b!190322))
(check-sat b_and!11331 (not b_next!4663))
(get-model)

(declare-fun d!55871 () Bool)

(declare-fun e!125270 () Bool)

(assert (=> d!55871 e!125270))

(declare-fun res!89984 () Bool)

(assert (=> d!55871 (=> res!89984 e!125270)))

(declare-fun lt!94403 () Bool)

(assert (=> d!55871 (= res!89984 (not lt!94403))))

(declare-fun lt!94404 () Bool)

(assert (=> d!55871 (= lt!94403 lt!94404)))

(declare-fun lt!94405 () Unit!5733)

(declare-fun e!125269 () Unit!5733)

(assert (=> d!55871 (= lt!94405 e!125269)))

(declare-fun c!34213 () Bool)

(assert (=> d!55871 (= c!34213 lt!94404)))

(assert (=> d!55871 (= lt!94404 (containsKey!240 (toList!1207 lt!94290) (_1!1742 (tuple2!3463 key!828 v!309))))))

(assert (=> d!55871 (= (contains!1328 lt!94290 (_1!1742 (tuple2!3463 key!828 v!309))) lt!94403)))

(declare-fun b!190346 () Bool)

(declare-fun lt!94406 () Unit!5733)

(assert (=> b!190346 (= e!125269 lt!94406)))

(assert (=> b!190346 (= lt!94406 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1207 lt!94290) (_1!1742 (tuple2!3463 key!828 v!309))))))

(assert (=> b!190346 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94290) (_1!1742 (tuple2!3463 key!828 v!309))))))

(declare-fun b!190347 () Bool)

(declare-fun Unit!5744 () Unit!5733)

(assert (=> b!190347 (= e!125269 Unit!5744)))

(declare-fun b!190348 () Bool)

(assert (=> b!190348 (= e!125270 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94290) (_1!1742 (tuple2!3463 key!828 v!309)))))))

(assert (= (and d!55871 c!34213) b!190346))

(assert (= (and d!55871 (not c!34213)) b!190347))

(assert (= (and d!55871 (not res!89984)) b!190348))

(declare-fun m!216829 () Bool)

(assert (=> d!55871 m!216829))

(declare-fun m!216831 () Bool)

(assert (=> b!190346 m!216831))

(assert (=> b!190346 m!216695))

(assert (=> b!190346 m!216695))

(declare-fun m!216833 () Bool)

(assert (=> b!190346 m!216833))

(assert (=> b!190348 m!216695))

(assert (=> b!190348 m!216695))

(assert (=> b!190348 m!216833))

(assert (=> d!55855 d!55871))

(declare-fun e!125276 () Option!243)

(declare-fun b!190359 () Bool)

(assert (=> b!190359 (= e!125276 (getValueByKey!237 (t!7277 lt!94291) (_1!1742 (tuple2!3463 key!828 v!309))))))

(declare-fun d!55873 () Bool)

(declare-fun c!34218 () Bool)

(assert (=> d!55873 (= c!34218 (and ((_ is Cons!2373) lt!94291) (= (_1!1742 (h!3010 lt!94291)) (_1!1742 (tuple2!3463 key!828 v!309)))))))

(declare-fun e!125275 () Option!243)

(assert (=> d!55873 (= (getValueByKey!237 lt!94291 (_1!1742 (tuple2!3463 key!828 v!309))) e!125275)))

(declare-fun b!190360 () Bool)

(assert (=> b!190360 (= e!125276 None!241)))

(declare-fun b!190357 () Bool)

(assert (=> b!190357 (= e!125275 (Some!242 (_2!1742 (h!3010 lt!94291))))))

(declare-fun b!190358 () Bool)

(assert (=> b!190358 (= e!125275 e!125276)))

(declare-fun c!34219 () Bool)

(assert (=> b!190358 (= c!34219 (and ((_ is Cons!2373) lt!94291) (not (= (_1!1742 (h!3010 lt!94291)) (_1!1742 (tuple2!3463 key!828 v!309))))))))

(assert (= (and d!55873 c!34218) b!190357))

(assert (= (and d!55873 (not c!34218)) b!190358))

(assert (= (and b!190358 c!34219) b!190359))

(assert (= (and b!190358 (not c!34219)) b!190360))

(declare-fun m!216835 () Bool)

(assert (=> b!190359 m!216835))

(assert (=> d!55855 d!55873))

(declare-fun d!55875 () Bool)

(assert (=> d!55875 (= (getValueByKey!237 lt!94291 (_1!1742 (tuple2!3463 key!828 v!309))) (Some!242 (_2!1742 (tuple2!3463 key!828 v!309))))))

(declare-fun lt!94409 () Unit!5733)

(declare-fun choose!1030 (List!2377 (_ BitVec 64) V!5561) Unit!5733)

(assert (=> d!55875 (= lt!94409 (choose!1030 lt!94291 (_1!1742 (tuple2!3463 key!828 v!309)) (_2!1742 (tuple2!3463 key!828 v!309))))))

(declare-fun e!125279 () Bool)

(assert (=> d!55875 e!125279))

(declare-fun res!89989 () Bool)

(assert (=> d!55875 (=> (not res!89989) (not e!125279))))

(declare-fun isStrictlySorted!340 (List!2377) Bool)

(assert (=> d!55875 (= res!89989 (isStrictlySorted!340 lt!94291))))

(assert (=> d!55875 (= (lemmaContainsTupThenGetReturnValue!124 lt!94291 (_1!1742 (tuple2!3463 key!828 v!309)) (_2!1742 (tuple2!3463 key!828 v!309))) lt!94409)))

(declare-fun b!190365 () Bool)

(declare-fun res!89990 () Bool)

(assert (=> b!190365 (=> (not res!89990) (not e!125279))))

(assert (=> b!190365 (= res!89990 (containsKey!240 lt!94291 (_1!1742 (tuple2!3463 key!828 v!309))))))

(declare-fun b!190366 () Bool)

(assert (=> b!190366 (= e!125279 (contains!1331 lt!94291 (tuple2!3463 (_1!1742 (tuple2!3463 key!828 v!309)) (_2!1742 (tuple2!3463 key!828 v!309)))))))

(assert (= (and d!55875 res!89989) b!190365))

(assert (= (and b!190365 res!89990) b!190366))

(assert (=> d!55875 m!216689))

(declare-fun m!216837 () Bool)

(assert (=> d!55875 m!216837))

(declare-fun m!216839 () Bool)

(assert (=> d!55875 m!216839))

(declare-fun m!216841 () Bool)

(assert (=> b!190365 m!216841))

(declare-fun m!216843 () Bool)

(assert (=> b!190366 m!216843))

(assert (=> d!55855 d!55875))

(declare-fun b!190387 () Bool)

(declare-fun e!125292 () List!2377)

(declare-fun call!19201 () List!2377)

(assert (=> b!190387 (= e!125292 call!19201)))

(declare-fun b!190388 () Bool)

(declare-fun e!125290 () List!2377)

(assert (=> b!190388 (= e!125290 e!125292)))

(declare-fun c!34231 () Bool)

(assert (=> b!190388 (= c!34231 (and ((_ is Cons!2373) (toList!1207 lt!94227)) (= (_1!1742 (h!3010 (toList!1207 lt!94227))) (_1!1742 (tuple2!3463 key!828 v!309)))))))

(declare-fun b!190389 () Bool)

(declare-fun e!125291 () List!2377)

(declare-fun call!19199 () List!2377)

(assert (=> b!190389 (= e!125291 call!19199)))

(declare-fun b!190390 () Bool)

(declare-fun e!125293 () List!2377)

(assert (=> b!190390 (= e!125293 (insertStrictlySorted!127 (t!7277 (toList!1207 lt!94227)) (_1!1742 (tuple2!3463 key!828 v!309)) (_2!1742 (tuple2!3463 key!828 v!309))))))

(declare-fun d!55877 () Bool)

(declare-fun e!125294 () Bool)

(assert (=> d!55877 e!125294))

(declare-fun res!89996 () Bool)

(assert (=> d!55877 (=> (not res!89996) (not e!125294))))

(declare-fun lt!94412 () List!2377)

(assert (=> d!55877 (= res!89996 (isStrictlySorted!340 lt!94412))))

(assert (=> d!55877 (= lt!94412 e!125290)))

(declare-fun c!34228 () Bool)

(assert (=> d!55877 (= c!34228 (and ((_ is Cons!2373) (toList!1207 lt!94227)) (bvslt (_1!1742 (h!3010 (toList!1207 lt!94227))) (_1!1742 (tuple2!3463 key!828 v!309)))))))

(assert (=> d!55877 (isStrictlySorted!340 (toList!1207 lt!94227))))

(assert (=> d!55877 (= (insertStrictlySorted!127 (toList!1207 lt!94227) (_1!1742 (tuple2!3463 key!828 v!309)) (_2!1742 (tuple2!3463 key!828 v!309))) lt!94412)))

(declare-fun bm!19196 () Bool)

(assert (=> bm!19196 (= call!19199 call!19201)))

(declare-fun b!190391 () Bool)

(declare-fun c!34230 () Bool)

(assert (=> b!190391 (= e!125293 (ite c!34231 (t!7277 (toList!1207 lt!94227)) (ite c!34230 (Cons!2373 (h!3010 (toList!1207 lt!94227)) (t!7277 (toList!1207 lt!94227))) Nil!2374)))))

(declare-fun b!190392 () Bool)

(assert (=> b!190392 (= e!125291 call!19199)))

(declare-fun b!190393 () Bool)

(assert (=> b!190393 (= c!34230 (and ((_ is Cons!2373) (toList!1207 lt!94227)) (bvsgt (_1!1742 (h!3010 (toList!1207 lt!94227))) (_1!1742 (tuple2!3463 key!828 v!309)))))))

(assert (=> b!190393 (= e!125292 e!125291)))

(declare-fun bm!19197 () Bool)

(declare-fun call!19200 () List!2377)

(assert (=> bm!19197 (= call!19201 call!19200)))

(declare-fun bm!19198 () Bool)

(declare-fun $colon$colon!98 (List!2377 tuple2!3462) List!2377)

(assert (=> bm!19198 (= call!19200 ($colon$colon!98 e!125293 (ite c!34228 (h!3010 (toList!1207 lt!94227)) (tuple2!3463 (_1!1742 (tuple2!3463 key!828 v!309)) (_2!1742 (tuple2!3463 key!828 v!309))))))))

(declare-fun c!34229 () Bool)

(assert (=> bm!19198 (= c!34229 c!34228)))

(declare-fun b!190394 () Bool)

(assert (=> b!190394 (= e!125294 (contains!1331 lt!94412 (tuple2!3463 (_1!1742 (tuple2!3463 key!828 v!309)) (_2!1742 (tuple2!3463 key!828 v!309)))))))

(declare-fun b!190395 () Bool)

(declare-fun res!89995 () Bool)

(assert (=> b!190395 (=> (not res!89995) (not e!125294))))

(assert (=> b!190395 (= res!89995 (containsKey!240 lt!94412 (_1!1742 (tuple2!3463 key!828 v!309))))))

(declare-fun b!190396 () Bool)

(assert (=> b!190396 (= e!125290 call!19200)))

(assert (= (and d!55877 c!34228) b!190396))

(assert (= (and d!55877 (not c!34228)) b!190388))

(assert (= (and b!190388 c!34231) b!190387))

(assert (= (and b!190388 (not c!34231)) b!190393))

(assert (= (and b!190393 c!34230) b!190392))

(assert (= (and b!190393 (not c!34230)) b!190389))

(assert (= (or b!190392 b!190389) bm!19196))

(assert (= (or b!190387 bm!19196) bm!19197))

(assert (= (or b!190396 bm!19197) bm!19198))

(assert (= (and bm!19198 c!34229) b!190390))

(assert (= (and bm!19198 (not c!34229)) b!190391))

(assert (= (and d!55877 res!89996) b!190395))

(assert (= (and b!190395 res!89995) b!190394))

(declare-fun m!216845 () Bool)

(assert (=> bm!19198 m!216845))

(declare-fun m!216847 () Bool)

(assert (=> b!190395 m!216847))

(declare-fun m!216849 () Bool)

(assert (=> b!190390 m!216849))

(declare-fun m!216851 () Bool)

(assert (=> d!55877 m!216851))

(declare-fun m!216853 () Bool)

(assert (=> d!55877 m!216853))

(declare-fun m!216855 () Bool)

(assert (=> b!190394 m!216855))

(assert (=> d!55855 d!55877))

(assert (=> d!55865 d!55859))

(declare-fun d!55879 () Bool)

(declare-fun get!2205 (Option!243) V!5561)

(assert (=> d!55879 (= (apply!179 lt!94381 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2205 (getValueByKey!237 (toList!1207 lt!94381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7630 () Bool)

(assert (= bs!7630 d!55879))

(declare-fun m!216857 () Bool)

(assert (=> bs!7630 m!216857))

(assert (=> bs!7630 m!216857))

(declare-fun m!216859 () Bool)

(assert (=> bs!7630 m!216859))

(assert (=> b!190331 d!55879))

(declare-fun d!55881 () Bool)

(declare-fun e!125295 () Bool)

(assert (=> d!55881 e!125295))

(declare-fun res!89997 () Bool)

(assert (=> d!55881 (=> (not res!89997) (not e!125295))))

(declare-fun lt!94413 () ListLongMap!2383)

(assert (=> d!55881 (= res!89997 (contains!1328 lt!94413 (_1!1742 (ite (or c!34199 c!34198) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(declare-fun lt!94414 () List!2377)

(assert (=> d!55881 (= lt!94413 (ListLongMap!2384 lt!94414))))

(declare-fun lt!94416 () Unit!5733)

(declare-fun lt!94415 () Unit!5733)

(assert (=> d!55881 (= lt!94416 lt!94415)))

(assert (=> d!55881 (= (getValueByKey!237 lt!94414 (_1!1742 (ite (or c!34199 c!34198) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))) (Some!242 (_2!1742 (ite (or c!34199 c!34198) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(assert (=> d!55881 (= lt!94415 (lemmaContainsTupThenGetReturnValue!124 lt!94414 (_1!1742 (ite (or c!34199 c!34198) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (_2!1742 (ite (or c!34199 c!34198) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(assert (=> d!55881 (= lt!94414 (insertStrictlySorted!127 (toList!1207 (ite c!34199 call!19183 (ite c!34198 call!19184 call!19179))) (_1!1742 (ite (or c!34199 c!34198) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (_2!1742 (ite (or c!34199 c!34198) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(assert (=> d!55881 (= (+!300 (ite c!34199 call!19183 (ite c!34198 call!19184 call!19179)) (ite (or c!34199 c!34198) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) lt!94413)))

(declare-fun b!190397 () Bool)

(declare-fun res!89998 () Bool)

(assert (=> b!190397 (=> (not res!89998) (not e!125295))))

(assert (=> b!190397 (= res!89998 (= (getValueByKey!237 (toList!1207 lt!94413) (_1!1742 (ite (or c!34199 c!34198) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))) (Some!242 (_2!1742 (ite (or c!34199 c!34198) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))))

(declare-fun b!190398 () Bool)

(assert (=> b!190398 (= e!125295 (contains!1331 (toList!1207 lt!94413) (ite (or c!34199 c!34198) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (= (and d!55881 res!89997) b!190397))

(assert (= (and b!190397 res!89998) b!190398))

(declare-fun m!216861 () Bool)

(assert (=> d!55881 m!216861))

(declare-fun m!216863 () Bool)

(assert (=> d!55881 m!216863))

(declare-fun m!216865 () Bool)

(assert (=> d!55881 m!216865))

(declare-fun m!216867 () Bool)

(assert (=> d!55881 m!216867))

(declare-fun m!216869 () Bool)

(assert (=> b!190397 m!216869))

(declare-fun m!216871 () Bool)

(assert (=> b!190398 m!216871))

(assert (=> bm!19176 d!55881))

(declare-fun b!190423 () Bool)

(declare-fun e!125316 () Bool)

(declare-fun e!125311 () Bool)

(assert (=> b!190423 (= e!125316 e!125311)))

(declare-fun c!34241 () Bool)

(declare-fun e!125313 () Bool)

(assert (=> b!190423 (= c!34241 e!125313)))

(declare-fun res!90007 () Bool)

(assert (=> b!190423 (=> (not res!90007) (not e!125313))))

(assert (=> b!190423 (= res!90007 (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun b!190424 () Bool)

(declare-fun e!125314 () Bool)

(assert (=> b!190424 (= e!125311 e!125314)))

(declare-fun c!34240 () Bool)

(assert (=> b!190424 (= c!34240 (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun b!190425 () Bool)

(declare-fun e!125310 () ListLongMap!2383)

(declare-fun call!19204 () ListLongMap!2383)

(assert (=> b!190425 (= e!125310 call!19204)))

(declare-fun b!190426 () Bool)

(declare-fun e!125315 () ListLongMap!2383)

(assert (=> b!190426 (= e!125315 e!125310)))

(declare-fun c!34242 () Bool)

(assert (=> b!190426 (= c!34242 (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19201 () Bool)

(assert (=> bm!19201 (= call!19204 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3880 thiss!1248)))))

(declare-fun b!190427 () Bool)

(declare-fun lt!94436 () ListLongMap!2383)

(declare-fun isEmpty!485 (ListLongMap!2383) Bool)

(assert (=> b!190427 (= e!125314 (isEmpty!485 lt!94436))))

(declare-fun b!190428 () Bool)

(declare-fun e!125312 () Bool)

(assert (=> b!190428 (= e!125311 e!125312)))

(assert (=> b!190428 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun res!90010 () Bool)

(assert (=> b!190428 (= res!90010 (contains!1328 lt!94436 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190428 (=> (not res!90010) (not e!125312))))

(declare-fun d!55883 () Bool)

(assert (=> d!55883 e!125316))

(declare-fun res!90009 () Bool)

(assert (=> d!55883 (=> (not res!90009) (not e!125316))))

(assert (=> d!55883 (= res!90009 (not (contains!1328 lt!94436 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55883 (= lt!94436 e!125315)))

(declare-fun c!34243 () Bool)

(assert (=> d!55883 (= c!34243 (bvsge #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(assert (=> d!55883 (validMask!0 (mask!9078 thiss!1248))))

(assert (=> d!55883 (= (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) lt!94436)))

(declare-fun b!190429 () Bool)

(assert (=> b!190429 (= e!125315 (ListLongMap!2384 Nil!2374))))

(declare-fun b!190430 () Bool)

(assert (=> b!190430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(assert (=> b!190430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4133 (_values!3863 thiss!1248))))))

(assert (=> b!190430 (= e!125312 (= (apply!179 lt!94436 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)) (get!2204 (select (arr!3813 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!190431 () Bool)

(assert (=> b!190431 (= e!125313 (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190431 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!190432 () Bool)

(declare-fun lt!94434 () Unit!5733)

(declare-fun lt!94431 () Unit!5733)

(assert (=> b!190432 (= lt!94434 lt!94431)))

(declare-fun lt!94437 () (_ BitVec 64))

(declare-fun lt!94435 () (_ BitVec 64))

(declare-fun lt!94433 () V!5561)

(declare-fun lt!94432 () ListLongMap!2383)

(assert (=> b!190432 (not (contains!1328 (+!300 lt!94432 (tuple2!3463 lt!94437 lt!94433)) lt!94435))))

(declare-fun addStillNotContains!95 (ListLongMap!2383 (_ BitVec 64) V!5561 (_ BitVec 64)) Unit!5733)

(assert (=> b!190432 (= lt!94431 (addStillNotContains!95 lt!94432 lt!94437 lt!94433 lt!94435))))

(assert (=> b!190432 (= lt!94435 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!190432 (= lt!94433 (get!2204 (select (arr!3813 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190432 (= lt!94437 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190432 (= lt!94432 call!19204)))

(assert (=> b!190432 (= e!125310 (+!300 call!19204 (tuple2!3463 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000) (get!2204 (select (arr!3813 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!190433 () Bool)

(declare-fun res!90008 () Bool)

(assert (=> b!190433 (=> (not res!90008) (not e!125316))))

(assert (=> b!190433 (= res!90008 (not (contains!1328 lt!94436 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190434 () Bool)

(assert (=> b!190434 (= e!125314 (= lt!94436 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3880 thiss!1248))))))

(assert (= (and d!55883 c!34243) b!190429))

(assert (= (and d!55883 (not c!34243)) b!190426))

(assert (= (and b!190426 c!34242) b!190432))

(assert (= (and b!190426 (not c!34242)) b!190425))

(assert (= (or b!190432 b!190425) bm!19201))

(assert (= (and d!55883 res!90009) b!190433))

(assert (= (and b!190433 res!90008) b!190423))

(assert (= (and b!190423 res!90007) b!190431))

(assert (= (and b!190423 c!34241) b!190428))

(assert (= (and b!190423 (not c!34241)) b!190424))

(assert (= (and b!190428 res!90010) b!190430))

(assert (= (and b!190424 c!34240) b!190434))

(assert (= (and b!190424 (not c!34240)) b!190427))

(declare-fun b_lambda!7373 () Bool)

(assert (=> (not b_lambda!7373) (not b!190430)))

(assert (=> b!190430 t!7281))

(declare-fun b_and!11333 () Bool)

(assert (= b_and!11331 (and (=> t!7281 result!4877) b_and!11333)))

(declare-fun b_lambda!7375 () Bool)

(assert (=> (not b_lambda!7375) (not b!190432)))

(assert (=> b!190432 t!7281))

(declare-fun b_and!11335 () Bool)

(assert (= b_and!11333 (and (=> t!7281 result!4877) b_and!11335)))

(declare-fun m!216873 () Bool)

(assert (=> b!190433 m!216873))

(assert (=> b!190426 m!216711))

(assert (=> b!190426 m!216711))

(assert (=> b!190426 m!216721))

(assert (=> b!190430 m!216771))

(assert (=> b!190430 m!216705))

(assert (=> b!190430 m!216773))

(assert (=> b!190430 m!216711))

(assert (=> b!190430 m!216771))

(assert (=> b!190430 m!216711))

(declare-fun m!216875 () Bool)

(assert (=> b!190430 m!216875))

(assert (=> b!190430 m!216705))

(assert (=> b!190432 m!216771))

(assert (=> b!190432 m!216705))

(assert (=> b!190432 m!216773))

(declare-fun m!216877 () Bool)

(assert (=> b!190432 m!216877))

(assert (=> b!190432 m!216705))

(declare-fun m!216879 () Bool)

(assert (=> b!190432 m!216879))

(declare-fun m!216881 () Bool)

(assert (=> b!190432 m!216881))

(assert (=> b!190432 m!216711))

(assert (=> b!190432 m!216771))

(assert (=> b!190432 m!216881))

(declare-fun m!216883 () Bool)

(assert (=> b!190432 m!216883))

(declare-fun m!216885 () Bool)

(assert (=> bm!19201 m!216885))

(assert (=> b!190431 m!216711))

(assert (=> b!190431 m!216711))

(assert (=> b!190431 m!216721))

(declare-fun m!216887 () Bool)

(assert (=> b!190427 m!216887))

(assert (=> b!190428 m!216711))

(assert (=> b!190428 m!216711))

(declare-fun m!216889 () Bool)

(assert (=> b!190428 m!216889))

(declare-fun m!216891 () Bool)

(assert (=> d!55883 m!216891))

(assert (=> d!55883 m!216571))

(assert (=> b!190434 m!216885))

(assert (=> bm!19184 d!55883))

(declare-fun d!55885 () Bool)

(assert (=> d!55885 (= (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190313 d!55885))

(declare-fun d!55887 () Bool)

(declare-fun e!125318 () Bool)

(assert (=> d!55887 e!125318))

(declare-fun res!90011 () Bool)

(assert (=> d!55887 (=> res!90011 e!125318)))

(declare-fun lt!94438 () Bool)

(assert (=> d!55887 (= res!90011 (not lt!94438))))

(declare-fun lt!94439 () Bool)

(assert (=> d!55887 (= lt!94438 lt!94439)))

(declare-fun lt!94440 () Unit!5733)

(declare-fun e!125317 () Unit!5733)

(assert (=> d!55887 (= lt!94440 e!125317)))

(declare-fun c!34244 () Bool)

(assert (=> d!55887 (= c!34244 lt!94439)))

(assert (=> d!55887 (= lt!94439 (containsKey!240 (toList!1207 lt!94381) (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55887 (= (contains!1328 lt!94381 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)) lt!94438)))

(declare-fun b!190435 () Bool)

(declare-fun lt!94441 () Unit!5733)

(assert (=> b!190435 (= e!125317 lt!94441)))

(assert (=> b!190435 (= lt!94441 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1207 lt!94381) (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190435 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94381) (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190436 () Bool)

(declare-fun Unit!5745 () Unit!5733)

(assert (=> b!190436 (= e!125317 Unit!5745)))

(declare-fun b!190437 () Bool)

(assert (=> b!190437 (= e!125318 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94381) (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55887 c!34244) b!190435))

(assert (= (and d!55887 (not c!34244)) b!190436))

(assert (= (and d!55887 (not res!90011)) b!190437))

(assert (=> d!55887 m!216711))

(declare-fun m!216893 () Bool)

(assert (=> d!55887 m!216893))

(assert (=> b!190435 m!216711))

(declare-fun m!216895 () Bool)

(assert (=> b!190435 m!216895))

(assert (=> b!190435 m!216711))

(declare-fun m!216897 () Bool)

(assert (=> b!190435 m!216897))

(assert (=> b!190435 m!216897))

(declare-fun m!216899 () Bool)

(assert (=> b!190435 m!216899))

(assert (=> b!190437 m!216711))

(assert (=> b!190437 m!216897))

(assert (=> b!190437 m!216897))

(assert (=> b!190437 m!216899))

(assert (=> b!190314 d!55887))

(assert (=> b!190329 d!55885))

(assert (=> d!55849 d!55851))

(declare-fun d!55889 () Bool)

(declare-fun e!125327 () Bool)

(assert (=> d!55889 e!125327))

(declare-fun c!34250 () Bool)

(declare-fun lt!94444 () SeekEntryResult!660)

(assert (=> d!55889 (= c!34250 ((_ is MissingZero!660) lt!94444))))

(assert (=> d!55889 (= lt!94444 (seekEntryOrOpen!0 key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)))))

(assert (=> d!55889 true))

(declare-fun _$34!1075 () Unit!5733)

(assert (=> d!55889 (= (choose!1027 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)) _$34!1075)))

(declare-fun b!190454 () Bool)

(declare-fun res!90023 () Bool)

(declare-fun e!125329 () Bool)

(assert (=> b!190454 (=> (not res!90023) (not e!125329))))

(assert (=> b!190454 (= res!90023 (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4813 lt!94444)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190455 () Bool)

(declare-fun e!125330 () Bool)

(assert (=> b!190455 (= e!125327 e!125330)))

(declare-fun res!90022 () Bool)

(declare-fun call!19209 () Bool)

(assert (=> b!190455 (= res!90022 call!19209)))

(assert (=> b!190455 (=> (not res!90022) (not e!125330))))

(declare-fun b!190456 () Bool)

(declare-fun e!125328 () Bool)

(assert (=> b!190456 (= e!125328 ((_ is Undefined!660) lt!94444))))

(declare-fun b!190457 () Bool)

(declare-fun call!19210 () Bool)

(assert (=> b!190457 (= e!125330 (not call!19210))))

(declare-fun b!190458 () Bool)

(assert (=> b!190458 (= e!125327 e!125328)))

(declare-fun c!34249 () Bool)

(assert (=> b!190458 (= c!34249 ((_ is MissingVacant!660) lt!94444))))

(declare-fun bm!19206 () Bool)

(assert (=> bm!19206 (= call!19209 (inRange!0 (ite c!34250 (index!4810 lt!94444) (index!4813 lt!94444)) (mask!9078 thiss!1248)))))

(declare-fun b!190459 () Bool)

(assert (=> b!190459 (= e!125329 (not call!19210))))

(declare-fun b!190460 () Bool)

(declare-fun res!90021 () Bool)

(assert (=> b!190460 (= res!90021 (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4810 lt!94444)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190460 (=> (not res!90021) (not e!125330))))

(declare-fun bm!19207 () Bool)

(assert (=> bm!19207 (= call!19210 (arrayContainsKey!0 (_keys!5849 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!190461 () Bool)

(declare-fun res!90020 () Bool)

(assert (=> b!190461 (=> (not res!90020) (not e!125329))))

(assert (=> b!190461 (= res!90020 call!19209)))

(assert (=> b!190461 (= e!125328 e!125329)))

(assert (= (and d!55889 c!34250) b!190455))

(assert (= (and d!55889 (not c!34250)) b!190458))

(assert (= (and b!190455 res!90022) b!190460))

(assert (= (and b!190460 res!90021) b!190457))

(assert (= (and b!190458 c!34249) b!190461))

(assert (= (and b!190458 (not c!34249)) b!190456))

(assert (= (and b!190461 res!90020) b!190454))

(assert (= (and b!190454 res!90023) b!190459))

(assert (= (or b!190455 b!190461) bm!19206))

(assert (= (or b!190457 b!190459) bm!19207))

(declare-fun m!216901 () Bool)

(assert (=> b!190460 m!216901))

(assert (=> bm!19207 m!216659))

(assert (=> d!55889 m!216581))

(declare-fun m!216903 () Bool)

(assert (=> bm!19206 m!216903))

(declare-fun m!216905 () Bool)

(assert (=> b!190454 m!216905))

(assert (=> d!55849 d!55889))

(assert (=> d!55849 d!55859))

(declare-fun d!55891 () Bool)

(declare-fun e!125331 () Bool)

(assert (=> d!55891 e!125331))

(declare-fun res!90024 () Bool)

(assert (=> d!55891 (=> (not res!90024) (not e!125331))))

(declare-fun lt!94445 () ListLongMap!2383)

(assert (=> d!55891 (= res!90024 (contains!1328 lt!94445 (_1!1742 (ite (or c!34208 c!34207) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(declare-fun lt!94446 () List!2377)

(assert (=> d!55891 (= lt!94445 (ListLongMap!2384 lt!94446))))

(declare-fun lt!94448 () Unit!5733)

(declare-fun lt!94447 () Unit!5733)

(assert (=> d!55891 (= lt!94448 lt!94447)))

(assert (=> d!55891 (= (getValueByKey!237 lt!94446 (_1!1742 (ite (or c!34208 c!34207) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))) (Some!242 (_2!1742 (ite (or c!34208 c!34207) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(assert (=> d!55891 (= lt!94447 (lemmaContainsTupThenGetReturnValue!124 lt!94446 (_1!1742 (ite (or c!34208 c!34207) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (_2!1742 (ite (or c!34208 c!34207) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(assert (=> d!55891 (= lt!94446 (insertStrictlySorted!127 (toList!1207 (ite c!34208 call!19190 (ite c!34207 call!19191 call!19186))) (_1!1742 (ite (or c!34208 c!34207) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (_2!1742 (ite (or c!34208 c!34207) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(assert (=> d!55891 (= (+!300 (ite c!34208 call!19190 (ite c!34207 call!19191 call!19186)) (ite (or c!34208 c!34207) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) lt!94445)))

(declare-fun b!190462 () Bool)

(declare-fun res!90025 () Bool)

(assert (=> b!190462 (=> (not res!90025) (not e!125331))))

(assert (=> b!190462 (= res!90025 (= (getValueByKey!237 (toList!1207 lt!94445) (_1!1742 (ite (or c!34208 c!34207) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))) (Some!242 (_2!1742 (ite (or c!34208 c!34207) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))))

(declare-fun b!190463 () Bool)

(assert (=> b!190463 (= e!125331 (contains!1331 (toList!1207 lt!94445) (ite (or c!34208 c!34207) (tuple2!3463 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3721 thiss!1248)) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (= (and d!55891 res!90024) b!190462))

(assert (= (and b!190462 res!90025) b!190463))

(declare-fun m!216907 () Bool)

(assert (=> d!55891 m!216907))

(declare-fun m!216909 () Bool)

(assert (=> d!55891 m!216909))

(declare-fun m!216911 () Bool)

(assert (=> d!55891 m!216911))

(declare-fun m!216913 () Bool)

(assert (=> d!55891 m!216913))

(declare-fun m!216915 () Bool)

(assert (=> b!190462 m!216915))

(declare-fun m!216917 () Bool)

(assert (=> b!190463 m!216917))

(assert (=> bm!19183 d!55891))

(declare-fun d!55893 () Bool)

(declare-fun res!90030 () Bool)

(declare-fun e!125336 () Bool)

(assert (=> d!55893 (=> res!90030 e!125336)))

(assert (=> d!55893 (= res!90030 (and ((_ is Cons!2373) (toList!1207 lt!94227)) (= (_1!1742 (h!3010 (toList!1207 lt!94227))) key!828)))))

(assert (=> d!55893 (= (containsKey!240 (toList!1207 lt!94227) key!828) e!125336)))

(declare-fun b!190468 () Bool)

(declare-fun e!125337 () Bool)

(assert (=> b!190468 (= e!125336 e!125337)))

(declare-fun res!90031 () Bool)

(assert (=> b!190468 (=> (not res!90031) (not e!125337))))

(assert (=> b!190468 (= res!90031 (and (or (not ((_ is Cons!2373) (toList!1207 lt!94227))) (bvsle (_1!1742 (h!3010 (toList!1207 lt!94227))) key!828)) ((_ is Cons!2373) (toList!1207 lt!94227)) (bvslt (_1!1742 (h!3010 (toList!1207 lt!94227))) key!828)))))

(declare-fun b!190469 () Bool)

(assert (=> b!190469 (= e!125337 (containsKey!240 (t!7277 (toList!1207 lt!94227)) key!828))))

(assert (= (and d!55893 (not res!90030)) b!190468))

(assert (= (and b!190468 res!90031) b!190469))

(declare-fun m!216919 () Bool)

(assert (=> b!190469 m!216919))

(assert (=> d!55863 d!55893))

(assert (=> d!55861 d!55859))

(declare-fun d!55895 () Bool)

(declare-fun e!125339 () Bool)

(assert (=> d!55895 e!125339))

(declare-fun res!90032 () Bool)

(assert (=> d!55895 (=> res!90032 e!125339)))

(declare-fun lt!94449 () Bool)

(assert (=> d!55895 (= res!90032 (not lt!94449))))

(declare-fun lt!94450 () Bool)

(assert (=> d!55895 (= lt!94449 lt!94450)))

(declare-fun lt!94451 () Unit!5733)

(declare-fun e!125338 () Unit!5733)

(assert (=> d!55895 (= lt!94451 e!125338)))

(declare-fun c!34251 () Bool)

(assert (=> d!55895 (= c!34251 lt!94450)))

(assert (=> d!55895 (= lt!94450 (containsKey!240 (toList!1207 (+!300 lt!94343 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248)))) lt!94348))))

(assert (=> d!55895 (= (contains!1328 (+!300 lt!94343 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248))) lt!94348) lt!94449)))

(declare-fun b!190470 () Bool)

(declare-fun lt!94452 () Unit!5733)

(assert (=> b!190470 (= e!125338 lt!94452)))

(assert (=> b!190470 (= lt!94452 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1207 (+!300 lt!94343 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248)))) lt!94348))))

(assert (=> b!190470 (isDefined!189 (getValueByKey!237 (toList!1207 (+!300 lt!94343 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248)))) lt!94348))))

(declare-fun b!190471 () Bool)

(declare-fun Unit!5746 () Unit!5733)

(assert (=> b!190471 (= e!125338 Unit!5746)))

(declare-fun b!190472 () Bool)

(assert (=> b!190472 (= e!125339 (isDefined!189 (getValueByKey!237 (toList!1207 (+!300 lt!94343 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248)))) lt!94348)))))

(assert (= (and d!55895 c!34251) b!190470))

(assert (= (and d!55895 (not c!34251)) b!190471))

(assert (= (and d!55895 (not res!90032)) b!190472))

(declare-fun m!216921 () Bool)

(assert (=> d!55895 m!216921))

(declare-fun m!216923 () Bool)

(assert (=> b!190470 m!216923))

(declare-fun m!216925 () Bool)

(assert (=> b!190470 m!216925))

(assert (=> b!190470 m!216925))

(declare-fun m!216927 () Bool)

(assert (=> b!190470 m!216927))

(assert (=> b!190472 m!216925))

(assert (=> b!190472 m!216925))

(assert (=> b!190472 m!216927))

(assert (=> b!190289 d!55895))

(declare-fun d!55897 () Bool)

(assert (=> d!55897 (= (apply!179 lt!94351 lt!94349) (get!2205 (getValueByKey!237 (toList!1207 lt!94351) lt!94349)))))

(declare-fun bs!7631 () Bool)

(assert (= bs!7631 d!55897))

(declare-fun m!216929 () Bool)

(assert (=> bs!7631 m!216929))

(assert (=> bs!7631 m!216929))

(declare-fun m!216931 () Bool)

(assert (=> bs!7631 m!216931))

(assert (=> b!190289 d!55897))

(declare-fun d!55899 () Bool)

(assert (=> d!55899 (= (apply!179 (+!300 lt!94351 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248))) lt!94349) (apply!179 lt!94351 lt!94349))))

(declare-fun lt!94455 () Unit!5733)

(declare-fun choose!1031 (ListLongMap!2383 (_ BitVec 64) V!5561 (_ BitVec 64)) Unit!5733)

(assert (=> d!55899 (= lt!94455 (choose!1031 lt!94351 lt!94359 (minValue!3721 thiss!1248) lt!94349))))

(declare-fun e!125342 () Bool)

(assert (=> d!55899 e!125342))

(declare-fun res!90035 () Bool)

(assert (=> d!55899 (=> (not res!90035) (not e!125342))))

(assert (=> d!55899 (= res!90035 (contains!1328 lt!94351 lt!94349))))

(assert (=> d!55899 (= (addApplyDifferent!155 lt!94351 lt!94359 (minValue!3721 thiss!1248) lt!94349) lt!94455)))

(declare-fun b!190476 () Bool)

(assert (=> b!190476 (= e!125342 (not (= lt!94349 lt!94359)))))

(assert (= (and d!55899 res!90035) b!190476))

(declare-fun m!216933 () Bool)

(assert (=> d!55899 m!216933))

(assert (=> d!55899 m!216737))

(assert (=> d!55899 m!216751))

(assert (=> d!55899 m!216749))

(declare-fun m!216935 () Bool)

(assert (=> d!55899 m!216935))

(assert (=> d!55899 m!216737))

(assert (=> b!190289 d!55899))

(declare-fun d!55901 () Bool)

(declare-fun e!125343 () Bool)

(assert (=> d!55901 e!125343))

(declare-fun res!90036 () Bool)

(assert (=> d!55901 (=> (not res!90036) (not e!125343))))

(declare-fun lt!94456 () ListLongMap!2383)

(assert (=> d!55901 (= res!90036 (contains!1328 lt!94456 (_1!1742 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248)))))))

(declare-fun lt!94457 () List!2377)

(assert (=> d!55901 (= lt!94456 (ListLongMap!2384 lt!94457))))

(declare-fun lt!94459 () Unit!5733)

(declare-fun lt!94458 () Unit!5733)

(assert (=> d!55901 (= lt!94459 lt!94458)))

(assert (=> d!55901 (= (getValueByKey!237 lt!94457 (_1!1742 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55901 (= lt!94458 (lemmaContainsTupThenGetReturnValue!124 lt!94457 (_1!1742 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55901 (= lt!94457 (insertStrictlySorted!127 (toList!1207 lt!94343) (_1!1742 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55901 (= (+!300 lt!94343 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248))) lt!94456)))

(declare-fun b!190477 () Bool)

(declare-fun res!90037 () Bool)

(assert (=> b!190477 (=> (not res!90037) (not e!125343))))

(assert (=> b!190477 (= res!90037 (= (getValueByKey!237 (toList!1207 lt!94456) (_1!1742 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248))))))))

(declare-fun b!190478 () Bool)

(assert (=> b!190478 (= e!125343 (contains!1331 (toList!1207 lt!94456) (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248))))))

(assert (= (and d!55901 res!90036) b!190477))

(assert (= (and b!190477 res!90037) b!190478))

(declare-fun m!216937 () Bool)

(assert (=> d!55901 m!216937))

(declare-fun m!216939 () Bool)

(assert (=> d!55901 m!216939))

(declare-fun m!216941 () Bool)

(assert (=> d!55901 m!216941))

(declare-fun m!216943 () Bool)

(assert (=> d!55901 m!216943))

(declare-fun m!216945 () Bool)

(assert (=> b!190477 m!216945))

(declare-fun m!216947 () Bool)

(assert (=> b!190478 m!216947))

(assert (=> b!190289 d!55901))

(declare-fun b!190479 () Bool)

(declare-fun e!125350 () Bool)

(declare-fun e!125345 () Bool)

(assert (=> b!190479 (= e!125350 e!125345)))

(declare-fun c!34253 () Bool)

(declare-fun e!125347 () Bool)

(assert (=> b!190479 (= c!34253 e!125347)))

(declare-fun res!90038 () Bool)

(assert (=> b!190479 (=> (not res!90038) (not e!125347))))

(assert (=> b!190479 (= res!90038 (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun b!190480 () Bool)

(declare-fun e!125348 () Bool)

(assert (=> b!190480 (= e!125345 e!125348)))

(declare-fun c!34252 () Bool)

(assert (=> b!190480 (= c!34252 (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun b!190481 () Bool)

(declare-fun e!125344 () ListLongMap!2383)

(declare-fun call!19211 () ListLongMap!2383)

(assert (=> b!190481 (= e!125344 call!19211)))

(declare-fun b!190482 () Bool)

(declare-fun e!125349 () ListLongMap!2383)

(assert (=> b!190482 (= e!125349 e!125344)))

(declare-fun c!34254 () Bool)

(assert (=> b!190482 (= c!34254 (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19208 () Bool)

(assert (=> bm!19208 (= call!19211 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3880 thiss!1248)))))

(declare-fun b!190483 () Bool)

(declare-fun lt!94465 () ListLongMap!2383)

(assert (=> b!190483 (= e!125348 (isEmpty!485 lt!94465))))

(declare-fun b!190484 () Bool)

(declare-fun e!125346 () Bool)

(assert (=> b!190484 (= e!125345 e!125346)))

(assert (=> b!190484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun res!90041 () Bool)

(assert (=> b!190484 (= res!90041 (contains!1328 lt!94465 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190484 (=> (not res!90041) (not e!125346))))

(declare-fun d!55903 () Bool)

(assert (=> d!55903 e!125350))

(declare-fun res!90040 () Bool)

(assert (=> d!55903 (=> (not res!90040) (not e!125350))))

(assert (=> d!55903 (= res!90040 (not (contains!1328 lt!94465 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55903 (= lt!94465 e!125349)))

(declare-fun c!34255 () Bool)

(assert (=> d!55903 (= c!34255 (bvsge #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(assert (=> d!55903 (validMask!0 (mask!9078 thiss!1248))))

(assert (=> d!55903 (= (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) lt!94465)))

(declare-fun b!190485 () Bool)

(assert (=> b!190485 (= e!125349 (ListLongMap!2384 Nil!2374))))

(declare-fun b!190486 () Bool)

(assert (=> b!190486 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(assert (=> b!190486 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4133 (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))))))))

(assert (=> b!190486 (= e!125346 (= (apply!179 lt!94465 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)) (get!2204 (select (arr!3813 (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!190487 () Bool)

(assert (=> b!190487 (= e!125347 (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190487 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!190488 () Bool)

(declare-fun lt!94463 () Unit!5733)

(declare-fun lt!94460 () Unit!5733)

(assert (=> b!190488 (= lt!94463 lt!94460)))

(declare-fun lt!94466 () (_ BitVec 64))

(declare-fun lt!94461 () ListLongMap!2383)

(declare-fun lt!94464 () (_ BitVec 64))

(declare-fun lt!94462 () V!5561)

(assert (=> b!190488 (not (contains!1328 (+!300 lt!94461 (tuple2!3463 lt!94466 lt!94462)) lt!94464))))

(assert (=> b!190488 (= lt!94460 (addStillNotContains!95 lt!94461 lt!94466 lt!94462 lt!94464))))

(assert (=> b!190488 (= lt!94464 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!190488 (= lt!94462 (get!2204 (select (arr!3813 (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190488 (= lt!94466 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190488 (= lt!94461 call!19211)))

(assert (=> b!190488 (= e!125344 (+!300 call!19211 (tuple2!3463 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000) (get!2204 (select (arr!3813 (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!190489 () Bool)

(declare-fun res!90039 () Bool)

(assert (=> b!190489 (=> (not res!90039) (not e!125350))))

(assert (=> b!190489 (= res!90039 (not (contains!1328 lt!94465 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190490 () Bool)

(assert (=> b!190490 (= e!125348 (= lt!94465 (getCurrentListMapNoExtraKeys!210 (_keys!5849 thiss!1248) (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3880 thiss!1248))))))

(assert (= (and d!55903 c!34255) b!190485))

(assert (= (and d!55903 (not c!34255)) b!190482))

(assert (= (and b!190482 c!34254) b!190488))

(assert (= (and b!190482 (not c!34254)) b!190481))

(assert (= (or b!190488 b!190481) bm!19208))

(assert (= (and d!55903 res!90040) b!190489))

(assert (= (and b!190489 res!90039) b!190479))

(assert (= (and b!190479 res!90038) b!190487))

(assert (= (and b!190479 c!34253) b!190484))

(assert (= (and b!190479 (not c!34253)) b!190480))

(assert (= (and b!190484 res!90041) b!190486))

(assert (= (and b!190480 c!34252) b!190490))

(assert (= (and b!190480 (not c!34252)) b!190483))

(declare-fun b_lambda!7377 () Bool)

(assert (=> (not b_lambda!7377) (not b!190486)))

(assert (=> b!190486 t!7281))

(declare-fun b_and!11337 () Bool)

(assert (= b_and!11335 (and (=> t!7281 result!4877) b_and!11337)))

(declare-fun b_lambda!7379 () Bool)

(assert (=> (not b_lambda!7379) (not b!190488)))

(assert (=> b!190488 t!7281))

(declare-fun b_and!11339 () Bool)

(assert (= b_and!11337 (and (=> t!7281 result!4877) b_and!11339)))

(declare-fun m!216949 () Bool)

(assert (=> b!190489 m!216949))

(assert (=> b!190482 m!216711))

(assert (=> b!190482 m!216711))

(assert (=> b!190482 m!216721))

(assert (=> b!190486 m!216707))

(assert (=> b!190486 m!216705))

(assert (=> b!190486 m!216709))

(assert (=> b!190486 m!216711))

(assert (=> b!190486 m!216707))

(assert (=> b!190486 m!216711))

(declare-fun m!216951 () Bool)

(assert (=> b!190486 m!216951))

(assert (=> b!190486 m!216705))

(assert (=> b!190488 m!216707))

(assert (=> b!190488 m!216705))

(assert (=> b!190488 m!216709))

(declare-fun m!216953 () Bool)

(assert (=> b!190488 m!216953))

(assert (=> b!190488 m!216705))

(declare-fun m!216955 () Bool)

(assert (=> b!190488 m!216955))

(declare-fun m!216957 () Bool)

(assert (=> b!190488 m!216957))

(assert (=> b!190488 m!216711))

(assert (=> b!190488 m!216707))

(assert (=> b!190488 m!216957))

(declare-fun m!216959 () Bool)

(assert (=> b!190488 m!216959))

(declare-fun m!216961 () Bool)

(assert (=> bm!19208 m!216961))

(assert (=> b!190487 m!216711))

(assert (=> b!190487 m!216711))

(assert (=> b!190487 m!216721))

(declare-fun m!216963 () Bool)

(assert (=> b!190483 m!216963))

(assert (=> b!190484 m!216711))

(assert (=> b!190484 m!216711))

(declare-fun m!216965 () Bool)

(assert (=> b!190484 m!216965))

(declare-fun m!216967 () Bool)

(assert (=> d!55903 m!216967))

(assert (=> d!55903 m!216571))

(assert (=> b!190490 m!216961))

(assert (=> b!190289 d!55903))

(declare-fun d!55905 () Bool)

(assert (=> d!55905 (= (apply!179 (+!300 lt!94362 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248))) lt!94350) (get!2205 (getValueByKey!237 (toList!1207 (+!300 lt!94362 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248)))) lt!94350)))))

(declare-fun bs!7632 () Bool)

(assert (= bs!7632 d!55905))

(declare-fun m!216969 () Bool)

(assert (=> bs!7632 m!216969))

(assert (=> bs!7632 m!216969))

(declare-fun m!216971 () Bool)

(assert (=> bs!7632 m!216971))

(assert (=> b!190289 d!55905))

(declare-fun d!55907 () Bool)

(declare-fun e!125351 () Bool)

(assert (=> d!55907 e!125351))

(declare-fun res!90042 () Bool)

(assert (=> d!55907 (=> (not res!90042) (not e!125351))))

(declare-fun lt!94467 () ListLongMap!2383)

(assert (=> d!55907 (= res!90042 (contains!1328 lt!94467 (_1!1742 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248)))))))

(declare-fun lt!94468 () List!2377)

(assert (=> d!55907 (= lt!94467 (ListLongMap!2384 lt!94468))))

(declare-fun lt!94470 () Unit!5733)

(declare-fun lt!94469 () Unit!5733)

(assert (=> d!55907 (= lt!94470 lt!94469)))

(assert (=> d!55907 (= (getValueByKey!237 lt!94468 (_1!1742 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248)))))))

(assert (=> d!55907 (= lt!94469 (lemmaContainsTupThenGetReturnValue!124 lt!94468 (_1!1742 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248)))))))

(assert (=> d!55907 (= lt!94468 (insertStrictlySorted!127 (toList!1207 lt!94352) (_1!1742 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248)))))))

(assert (=> d!55907 (= (+!300 lt!94352 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248))) lt!94467)))

(declare-fun b!190491 () Bool)

(declare-fun res!90043 () Bool)

(assert (=> b!190491 (=> (not res!90043) (not e!125351))))

(assert (=> b!190491 (= res!90043 (= (getValueByKey!237 (toList!1207 lt!94467) (_1!1742 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248))))))))

(declare-fun b!190492 () Bool)

(assert (=> b!190492 (= e!125351 (contains!1331 (toList!1207 lt!94467) (tuple2!3463 lt!94345 (minValue!3721 thiss!1248))))))

(assert (= (and d!55907 res!90042) b!190491))

(assert (= (and b!190491 res!90043) b!190492))

(declare-fun m!216973 () Bool)

(assert (=> d!55907 m!216973))

(declare-fun m!216975 () Bool)

(assert (=> d!55907 m!216975))

(declare-fun m!216977 () Bool)

(assert (=> d!55907 m!216977))

(declare-fun m!216979 () Bool)

(assert (=> d!55907 m!216979))

(declare-fun m!216981 () Bool)

(assert (=> b!190491 m!216981))

(declare-fun m!216983 () Bool)

(assert (=> b!190492 m!216983))

(assert (=> b!190289 d!55907))

(declare-fun d!55909 () Bool)

(assert (=> d!55909 (= (apply!179 (+!300 lt!94362 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248))) lt!94350) (apply!179 lt!94362 lt!94350))))

(declare-fun lt!94471 () Unit!5733)

(assert (=> d!55909 (= lt!94471 (choose!1031 lt!94362 lt!94357 (zeroValue!3721 thiss!1248) lt!94350))))

(declare-fun e!125352 () Bool)

(assert (=> d!55909 e!125352))

(declare-fun res!90044 () Bool)

(assert (=> d!55909 (=> (not res!90044) (not e!125352))))

(assert (=> d!55909 (= res!90044 (contains!1328 lt!94362 lt!94350))))

(assert (=> d!55909 (= (addApplyDifferent!155 lt!94362 lt!94357 (zeroValue!3721 thiss!1248) lt!94350) lt!94471)))

(declare-fun b!190493 () Bool)

(assert (=> b!190493 (= e!125352 (not (= lt!94350 lt!94357)))))

(assert (= (and d!55909 res!90044) b!190493))

(declare-fun m!216985 () Bool)

(assert (=> d!55909 m!216985))

(assert (=> d!55909 m!216743))

(assert (=> d!55909 m!216745))

(assert (=> d!55909 m!216729))

(declare-fun m!216987 () Bool)

(assert (=> d!55909 m!216987))

(assert (=> d!55909 m!216743))

(assert (=> b!190289 d!55909))

(declare-fun d!55911 () Bool)

(assert (=> d!55911 (= (apply!179 (+!300 lt!94352 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248))) lt!94353) (get!2205 (getValueByKey!237 (toList!1207 (+!300 lt!94352 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248)))) lt!94353)))))

(declare-fun bs!7633 () Bool)

(assert (= bs!7633 d!55911))

(declare-fun m!216989 () Bool)

(assert (=> bs!7633 m!216989))

(assert (=> bs!7633 m!216989))

(declare-fun m!216991 () Bool)

(assert (=> bs!7633 m!216991))

(assert (=> b!190289 d!55911))

(declare-fun d!55913 () Bool)

(declare-fun e!125353 () Bool)

(assert (=> d!55913 e!125353))

(declare-fun res!90045 () Bool)

(assert (=> d!55913 (=> (not res!90045) (not e!125353))))

(declare-fun lt!94472 () ListLongMap!2383)

(assert (=> d!55913 (= res!90045 (contains!1328 lt!94472 (_1!1742 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248)))))))

(declare-fun lt!94473 () List!2377)

(assert (=> d!55913 (= lt!94472 (ListLongMap!2384 lt!94473))))

(declare-fun lt!94475 () Unit!5733)

(declare-fun lt!94474 () Unit!5733)

(assert (=> d!55913 (= lt!94475 lt!94474)))

(assert (=> d!55913 (= (getValueByKey!237 lt!94473 (_1!1742 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248)))))))

(assert (=> d!55913 (= lt!94474 (lemmaContainsTupThenGetReturnValue!124 lt!94473 (_1!1742 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248)))))))

(assert (=> d!55913 (= lt!94473 (insertStrictlySorted!127 (toList!1207 lt!94351) (_1!1742 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248)))))))

(assert (=> d!55913 (= (+!300 lt!94351 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248))) lt!94472)))

(declare-fun b!190494 () Bool)

(declare-fun res!90046 () Bool)

(assert (=> b!190494 (=> (not res!90046) (not e!125353))))

(assert (=> b!190494 (= res!90046 (= (getValueByKey!237 (toList!1207 lt!94472) (_1!1742 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248))))))))

(declare-fun b!190495 () Bool)

(assert (=> b!190495 (= e!125353 (contains!1331 (toList!1207 lt!94472) (tuple2!3463 lt!94359 (minValue!3721 thiss!1248))))))

(assert (= (and d!55913 res!90045) b!190494))

(assert (= (and b!190494 res!90046) b!190495))

(declare-fun m!216993 () Bool)

(assert (=> d!55913 m!216993))

(declare-fun m!216995 () Bool)

(assert (=> d!55913 m!216995))

(declare-fun m!216997 () Bool)

(assert (=> d!55913 m!216997))

(declare-fun m!216999 () Bool)

(assert (=> d!55913 m!216999))

(declare-fun m!217001 () Bool)

(assert (=> b!190494 m!217001))

(declare-fun m!217003 () Bool)

(assert (=> b!190495 m!217003))

(assert (=> b!190289 d!55913))

(declare-fun d!55915 () Bool)

(assert (=> d!55915 (= (apply!179 lt!94352 lt!94353) (get!2205 (getValueByKey!237 (toList!1207 lt!94352) lt!94353)))))

(declare-fun bs!7634 () Bool)

(assert (= bs!7634 d!55915))

(declare-fun m!217005 () Bool)

(assert (=> bs!7634 m!217005))

(assert (=> bs!7634 m!217005))

(declare-fun m!217007 () Bool)

(assert (=> bs!7634 m!217007))

(assert (=> b!190289 d!55915))

(declare-fun d!55917 () Bool)

(declare-fun e!125354 () Bool)

(assert (=> d!55917 e!125354))

(declare-fun res!90047 () Bool)

(assert (=> d!55917 (=> (not res!90047) (not e!125354))))

(declare-fun lt!94476 () ListLongMap!2383)

(assert (=> d!55917 (= res!90047 (contains!1328 lt!94476 (_1!1742 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248)))))))

(declare-fun lt!94477 () List!2377)

(assert (=> d!55917 (= lt!94476 (ListLongMap!2384 lt!94477))))

(declare-fun lt!94479 () Unit!5733)

(declare-fun lt!94478 () Unit!5733)

(assert (=> d!55917 (= lt!94479 lt!94478)))

(assert (=> d!55917 (= (getValueByKey!237 lt!94477 (_1!1742 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55917 (= lt!94478 (lemmaContainsTupThenGetReturnValue!124 lt!94477 (_1!1742 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55917 (= lt!94477 (insertStrictlySorted!127 (toList!1207 lt!94362) (_1!1742 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55917 (= (+!300 lt!94362 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248))) lt!94476)))

(declare-fun b!190496 () Bool)

(declare-fun res!90048 () Bool)

(assert (=> b!190496 (=> (not res!90048) (not e!125354))))

(assert (=> b!190496 (= res!90048 (= (getValueByKey!237 (toList!1207 lt!94476) (_1!1742 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248))))))))

(declare-fun b!190497 () Bool)

(assert (=> b!190497 (= e!125354 (contains!1331 (toList!1207 lt!94476) (tuple2!3463 lt!94357 (zeroValue!3721 thiss!1248))))))

(assert (= (and d!55917 res!90047) b!190496))

(assert (= (and b!190496 res!90048) b!190497))

(declare-fun m!217009 () Bool)

(assert (=> d!55917 m!217009))

(declare-fun m!217011 () Bool)

(assert (=> d!55917 m!217011))

(declare-fun m!217013 () Bool)

(assert (=> d!55917 m!217013))

(declare-fun m!217015 () Bool)

(assert (=> d!55917 m!217015))

(declare-fun m!217017 () Bool)

(assert (=> b!190496 m!217017))

(declare-fun m!217019 () Bool)

(assert (=> b!190497 m!217019))

(assert (=> b!190289 d!55917))

(declare-fun d!55919 () Bool)

(assert (=> d!55919 (contains!1328 (+!300 lt!94343 (tuple2!3463 lt!94341 (zeroValue!3721 thiss!1248))) lt!94348)))

(declare-fun lt!94482 () Unit!5733)

(declare-fun choose!1032 (ListLongMap!2383 (_ BitVec 64) V!5561 (_ BitVec 64)) Unit!5733)

(assert (=> d!55919 (= lt!94482 (choose!1032 lt!94343 lt!94341 (zeroValue!3721 thiss!1248) lt!94348))))

(assert (=> d!55919 (contains!1328 lt!94343 lt!94348)))

(assert (=> d!55919 (= (addStillContains!155 lt!94343 lt!94341 (zeroValue!3721 thiss!1248) lt!94348) lt!94482)))

(declare-fun bs!7635 () Bool)

(assert (= bs!7635 d!55919))

(assert (=> bs!7635 m!216727))

(assert (=> bs!7635 m!216727))

(assert (=> bs!7635 m!216747))

(declare-fun m!217021 () Bool)

(assert (=> bs!7635 m!217021))

(declare-fun m!217023 () Bool)

(assert (=> bs!7635 m!217023))

(assert (=> b!190289 d!55919))

(declare-fun d!55921 () Bool)

(assert (=> d!55921 (= (apply!179 (+!300 lt!94352 (tuple2!3463 lt!94345 (minValue!3721 thiss!1248))) lt!94353) (apply!179 lt!94352 lt!94353))))

(declare-fun lt!94483 () Unit!5733)

(assert (=> d!55921 (= lt!94483 (choose!1031 lt!94352 lt!94345 (minValue!3721 thiss!1248) lt!94353))))

(declare-fun e!125355 () Bool)

(assert (=> d!55921 e!125355))

(declare-fun res!90049 () Bool)

(assert (=> d!55921 (=> (not res!90049) (not e!125355))))

(assert (=> d!55921 (= res!90049 (contains!1328 lt!94352 lt!94353))))

(assert (=> d!55921 (= (addApplyDifferent!155 lt!94352 lt!94345 (minValue!3721 thiss!1248) lt!94353) lt!94483)))

(declare-fun b!190499 () Bool)

(assert (=> b!190499 (= e!125355 (not (= lt!94353 lt!94345)))))

(assert (= (and d!55921 res!90049) b!190499))

(declare-fun m!217025 () Bool)

(assert (=> d!55921 m!217025))

(assert (=> d!55921 m!216731))

(assert (=> d!55921 m!216733))

(assert (=> d!55921 m!216741))

(declare-fun m!217027 () Bool)

(assert (=> d!55921 m!217027))

(assert (=> d!55921 m!216731))

(assert (=> b!190289 d!55921))

(declare-fun d!55923 () Bool)

(assert (=> d!55923 (= (apply!179 (+!300 lt!94351 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248))) lt!94349) (get!2205 (getValueByKey!237 (toList!1207 (+!300 lt!94351 (tuple2!3463 lt!94359 (minValue!3721 thiss!1248)))) lt!94349)))))

(declare-fun bs!7636 () Bool)

(assert (= bs!7636 d!55923))

(declare-fun m!217029 () Bool)

(assert (=> bs!7636 m!217029))

(assert (=> bs!7636 m!217029))

(declare-fun m!217031 () Bool)

(assert (=> bs!7636 m!217031))

(assert (=> b!190289 d!55923))

(declare-fun d!55925 () Bool)

(assert (=> d!55925 (= (apply!179 lt!94362 lt!94350) (get!2205 (getValueByKey!237 (toList!1207 lt!94362) lt!94350)))))

(declare-fun bs!7637 () Bool)

(assert (= bs!7637 d!55925))

(declare-fun m!217033 () Bool)

(assert (=> bs!7637 m!217033))

(assert (=> bs!7637 m!217033))

(declare-fun m!217035 () Bool)

(assert (=> bs!7637 m!217035))

(assert (=> b!190289 d!55925))

(declare-fun d!55927 () Bool)

(declare-fun e!125356 () Bool)

(assert (=> d!55927 e!125356))

(declare-fun res!90050 () Bool)

(assert (=> d!55927 (=> (not res!90050) (not e!125356))))

(declare-fun lt!94484 () ListLongMap!2383)

(assert (=> d!55927 (= res!90050 (contains!1328 lt!94484 (_1!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(declare-fun lt!94485 () List!2377)

(assert (=> d!55927 (= lt!94484 (ListLongMap!2384 lt!94485))))

(declare-fun lt!94487 () Unit!5733)

(declare-fun lt!94486 () Unit!5733)

(assert (=> d!55927 (= lt!94487 lt!94486)))

(assert (=> d!55927 (= (getValueByKey!237 lt!94485 (_1!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (=> d!55927 (= lt!94486 (lemmaContainsTupThenGetReturnValue!124 lt!94485 (_1!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (=> d!55927 (= lt!94485 (insertStrictlySorted!127 (toList!1207 call!19181) (_1!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (=> d!55927 (= (+!300 call!19181 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))) lt!94484)))

(declare-fun b!190500 () Bool)

(declare-fun res!90051 () Bool)

(assert (=> b!190500 (=> (not res!90051) (not e!125356))))

(assert (=> b!190500 (= res!90051 (= (getValueByKey!237 (toList!1207 lt!94484) (_1!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(declare-fun b!190501 () Bool)

(assert (=> b!190501 (= e!125356 (contains!1331 (toList!1207 lt!94484) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))

(assert (= (and d!55927 res!90050) b!190500))

(assert (= (and b!190500 res!90051) b!190501))

(declare-fun m!217037 () Bool)

(assert (=> d!55927 m!217037))

(declare-fun m!217039 () Bool)

(assert (=> d!55927 m!217039))

(declare-fun m!217041 () Bool)

(assert (=> d!55927 m!217041))

(declare-fun m!217043 () Bool)

(assert (=> d!55927 m!217043))

(declare-fun m!217045 () Bool)

(assert (=> b!190500 m!217045))

(declare-fun m!217047 () Bool)

(assert (=> b!190501 m!217047))

(assert (=> b!190290 d!55927))

(assert (=> d!55867 d!55851))

(declare-fun d!55929 () Bool)

(declare-fun e!125359 () Bool)

(assert (=> d!55929 e!125359))

(declare-fun res!90056 () Bool)

(assert (=> d!55929 (=> (not res!90056) (not e!125359))))

(declare-fun lt!94490 () SeekEntryResult!660)

(assert (=> d!55929 (= res!90056 ((_ is Found!660) lt!94490))))

(assert (=> d!55929 (= lt!94490 (seekEntryOrOpen!0 key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)))))

(assert (=> d!55929 true))

(declare-fun _$33!138 () Unit!5733)

(assert (=> d!55929 (= (choose!1029 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)) _$33!138)))

(declare-fun b!190506 () Bool)

(declare-fun res!90057 () Bool)

(assert (=> b!190506 (=> (not res!90057) (not e!125359))))

(assert (=> b!190506 (= res!90057 (inRange!0 (index!4811 lt!94490) (mask!9078 thiss!1248)))))

(declare-fun b!190507 () Bool)

(assert (=> b!190507 (= e!125359 (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4811 lt!94490)) key!828))))

(assert (= (and d!55929 res!90056) b!190506))

(assert (= (and b!190506 res!90057) b!190507))

(assert (=> d!55929 m!216581))

(declare-fun m!217049 () Bool)

(assert (=> b!190506 m!217049))

(declare-fun m!217051 () Bool)

(assert (=> b!190507 m!217051))

(assert (=> d!55867 d!55929))

(assert (=> d!55867 d!55859))

(declare-fun d!55931 () Bool)

(declare-fun lt!94495 () SeekEntryResult!660)

(assert (=> d!55931 (and (or ((_ is Undefined!660) lt!94495) (not ((_ is Found!660) lt!94495)) (and (bvsge (index!4811 lt!94495) #b00000000000000000000000000000000) (bvslt (index!4811 lt!94495) (size!4132 (_keys!5849 thiss!1248))))) (or ((_ is Undefined!660) lt!94495) ((_ is Found!660) lt!94495) (not ((_ is MissingVacant!660) lt!94495)) (not (= (index!4813 lt!94495) (index!4812 lt!94280))) (and (bvsge (index!4813 lt!94495) #b00000000000000000000000000000000) (bvslt (index!4813 lt!94495) (size!4132 (_keys!5849 thiss!1248))))) (or ((_ is Undefined!660) lt!94495) (ite ((_ is Found!660) lt!94495) (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4811 lt!94495)) key!828) (and ((_ is MissingVacant!660) lt!94495) (= (index!4813 lt!94495) (index!4812 lt!94280)) (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4813 lt!94495)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!125368 () SeekEntryResult!660)

(assert (=> d!55931 (= lt!94495 e!125368)))

(declare-fun c!34264 () Bool)

(assert (=> d!55931 (= c!34264 (bvsge (x!20462 lt!94280) #b01111111111111111111111111111110))))

(declare-fun lt!94496 () (_ BitVec 64))

(assert (=> d!55931 (= lt!94496 (select (arr!3812 (_keys!5849 thiss!1248)) (index!4812 lt!94280)))))

(assert (=> d!55931 (validMask!0 (mask!9078 thiss!1248))))

(assert (=> d!55931 (= (seekKeyOrZeroReturnVacant!0 (x!20462 lt!94280) (index!4812 lt!94280) (index!4812 lt!94280) key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)) lt!94495)))

(declare-fun b!190520 () Bool)

(declare-fun e!125366 () SeekEntryResult!660)

(assert (=> b!190520 (= e!125366 (MissingVacant!660 (index!4812 lt!94280)))))

(declare-fun b!190521 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190521 (= e!125366 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20462 lt!94280) #b00000000000000000000000000000001) (nextIndex!0 (index!4812 lt!94280) (bvadd (x!20462 lt!94280) #b00000000000000000000000000000001) (mask!9078 thiss!1248)) (index!4812 lt!94280) key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)))))

(declare-fun b!190522 () Bool)

(declare-fun c!34262 () Bool)

(assert (=> b!190522 (= c!34262 (= lt!94496 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125367 () SeekEntryResult!660)

(assert (=> b!190522 (= e!125367 e!125366)))

(declare-fun b!190523 () Bool)

(assert (=> b!190523 (= e!125367 (Found!660 (index!4812 lt!94280)))))

(declare-fun b!190524 () Bool)

(assert (=> b!190524 (= e!125368 e!125367)))

(declare-fun c!34263 () Bool)

(assert (=> b!190524 (= c!34263 (= lt!94496 key!828))))

(declare-fun b!190525 () Bool)

(assert (=> b!190525 (= e!125368 Undefined!660)))

(assert (= (and d!55931 c!34264) b!190525))

(assert (= (and d!55931 (not c!34264)) b!190524))

(assert (= (and b!190524 c!34263) b!190523))

(assert (= (and b!190524 (not c!34263)) b!190522))

(assert (= (and b!190522 c!34262) b!190520))

(assert (= (and b!190522 (not c!34262)) b!190521))

(declare-fun m!217053 () Bool)

(assert (=> d!55931 m!217053))

(declare-fun m!217055 () Bool)

(assert (=> d!55931 m!217055))

(assert (=> d!55931 m!216665))

(assert (=> d!55931 m!216571))

(declare-fun m!217057 () Bool)

(assert (=> b!190521 m!217057))

(assert (=> b!190521 m!217057))

(declare-fun m!217059 () Bool)

(assert (=> b!190521 m!217059))

(assert (=> b!190215 d!55931))

(declare-fun d!55933 () Bool)

(declare-fun res!90062 () Bool)

(declare-fun e!125373 () Bool)

(assert (=> d!55933 (=> res!90062 e!125373)))

(assert (=> d!55933 (= res!90062 (= (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55933 (= (arrayContainsKey!0 (_keys!5849 thiss!1248) key!828 #b00000000000000000000000000000000) e!125373)))

(declare-fun b!190530 () Bool)

(declare-fun e!125374 () Bool)

(assert (=> b!190530 (= e!125373 e!125374)))

(declare-fun res!90063 () Bool)

(assert (=> b!190530 (=> (not res!90063) (not e!125374))))

(assert (=> b!190530 (= res!90063 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun b!190531 () Bool)

(assert (=> b!190531 (= e!125374 (arrayContainsKey!0 (_keys!5849 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55933 (not res!90062)) b!190530))

(assert (= (and b!190530 res!90063) b!190531))

(assert (=> d!55933 m!216711))

(declare-fun m!217061 () Bool)

(assert (=> b!190531 m!217061))

(assert (=> bm!19161 d!55933))

(declare-fun d!55935 () Bool)

(assert (=> d!55935 (= (apply!179 lt!94347 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)) (get!2205 (getValueByKey!237 (toList!1207 lt!94347) (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7638 () Bool)

(assert (= bs!7638 d!55935))

(assert (=> bs!7638 m!216711))

(declare-fun m!217063 () Bool)

(assert (=> bs!7638 m!217063))

(assert (=> bs!7638 m!217063))

(declare-fun m!217065 () Bool)

(assert (=> bs!7638 m!217065))

(assert (=> b!190286 d!55935))

(declare-fun d!55937 () Bool)

(declare-fun c!34267 () Bool)

(assert (=> d!55937 (= c!34267 ((_ is ValueCellFull!1874) (select (arr!3813 (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!125377 () V!5561)

(assert (=> d!55937 (= (get!2204 (select (arr!3813 (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!125377)))

(declare-fun b!190536 () Bool)

(declare-fun get!2206 (ValueCell!1874 V!5561) V!5561)

(assert (=> b!190536 (= e!125377 (get!2206 (select (arr!3813 (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190537 () Bool)

(declare-fun get!2207 (ValueCell!1874 V!5561) V!5561)

(assert (=> b!190537 (= e!125377 (get!2207 (select (arr!3813 (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55937 c!34267) b!190536))

(assert (= (and d!55937 (not c!34267)) b!190537))

(assert (=> b!190536 m!216707))

(assert (=> b!190536 m!216705))

(declare-fun m!217067 () Bool)

(assert (=> b!190536 m!217067))

(assert (=> b!190537 m!216707))

(assert (=> b!190537 m!216705))

(declare-fun m!217069 () Bool)

(assert (=> b!190537 m!217069))

(assert (=> b!190286 d!55937))

(declare-fun d!55939 () Bool)

(declare-fun e!125379 () Bool)

(assert (=> d!55939 e!125379))

(declare-fun res!90064 () Bool)

(assert (=> d!55939 (=> res!90064 e!125379)))

(declare-fun lt!94497 () Bool)

(assert (=> d!55939 (= res!90064 (not lt!94497))))

(declare-fun lt!94498 () Bool)

(assert (=> d!55939 (= lt!94497 lt!94498)))

(declare-fun lt!94499 () Unit!5733)

(declare-fun e!125378 () Unit!5733)

(assert (=> d!55939 (= lt!94499 e!125378)))

(declare-fun c!34268 () Bool)

(assert (=> d!55939 (= c!34268 lt!94498)))

(assert (=> d!55939 (= lt!94498 (containsKey!240 (toList!1207 lt!94347) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55939 (= (contains!1328 lt!94347 #b1000000000000000000000000000000000000000000000000000000000000000) lt!94497)))

(declare-fun b!190538 () Bool)

(declare-fun lt!94500 () Unit!5733)

(assert (=> b!190538 (= e!125378 lt!94500)))

(assert (=> b!190538 (= lt!94500 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1207 lt!94347) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190538 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94347) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190539 () Bool)

(declare-fun Unit!5747 () Unit!5733)

(assert (=> b!190539 (= e!125378 Unit!5747)))

(declare-fun b!190540 () Bool)

(assert (=> b!190540 (= e!125379 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94347) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55939 c!34268) b!190538))

(assert (= (and d!55939 (not c!34268)) b!190539))

(assert (= (and d!55939 (not res!90064)) b!190540))

(declare-fun m!217071 () Bool)

(assert (=> d!55939 m!217071))

(declare-fun m!217073 () Bool)

(assert (=> b!190538 m!217073))

(declare-fun m!217075 () Bool)

(assert (=> b!190538 m!217075))

(assert (=> b!190538 m!217075))

(declare-fun m!217077 () Bool)

(assert (=> b!190538 m!217077))

(assert (=> b!190540 m!217075))

(assert (=> b!190540 m!217075))

(assert (=> b!190540 m!217077))

(assert (=> bm!19180 d!55939))

(declare-fun d!55941 () Bool)

(declare-fun isEmpty!486 (Option!243) Bool)

(assert (=> d!55941 (= (isDefined!189 (getValueByKey!237 (toList!1207 lt!94227) key!828)) (not (isEmpty!486 (getValueByKey!237 (toList!1207 lt!94227) key!828))))))

(declare-fun bs!7639 () Bool)

(assert (= bs!7639 d!55941))

(assert (=> bs!7639 m!216765))

(declare-fun m!217079 () Bool)

(assert (=> bs!7639 m!217079))

(assert (=> b!190310 d!55941))

(declare-fun b!190543 () Bool)

(declare-fun e!125381 () Option!243)

(assert (=> b!190543 (= e!125381 (getValueByKey!237 (t!7277 (toList!1207 lt!94227)) key!828))))

(declare-fun d!55943 () Bool)

(declare-fun c!34269 () Bool)

(assert (=> d!55943 (= c!34269 (and ((_ is Cons!2373) (toList!1207 lt!94227)) (= (_1!1742 (h!3010 (toList!1207 lt!94227))) key!828)))))

(declare-fun e!125380 () Option!243)

(assert (=> d!55943 (= (getValueByKey!237 (toList!1207 lt!94227) key!828) e!125380)))

(declare-fun b!190544 () Bool)

(assert (=> b!190544 (= e!125381 None!241)))

(declare-fun b!190541 () Bool)

(assert (=> b!190541 (= e!125380 (Some!242 (_2!1742 (h!3010 (toList!1207 lt!94227)))))))

(declare-fun b!190542 () Bool)

(assert (=> b!190542 (= e!125380 e!125381)))

(declare-fun c!34270 () Bool)

(assert (=> b!190542 (= c!34270 (and ((_ is Cons!2373) (toList!1207 lt!94227)) (not (= (_1!1742 (h!3010 (toList!1207 lt!94227))) key!828))))))

(assert (= (and d!55943 c!34269) b!190541))

(assert (= (and d!55943 (not c!34269)) b!190542))

(assert (= (and b!190542 c!34270) b!190543))

(assert (= (and b!190542 (not c!34270)) b!190544))

(declare-fun m!217081 () Bool)

(assert (=> b!190543 m!217081))

(assert (=> b!190310 d!55943))

(declare-fun b!190553 () Bool)

(declare-fun e!125390 () Bool)

(declare-fun e!125389 () Bool)

(assert (=> b!190553 (= e!125390 e!125389)))

(declare-fun lt!94507 () (_ BitVec 64))

(assert (=> b!190553 (= lt!94507 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94509 () Unit!5733)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8089 (_ BitVec 64) (_ BitVec 32)) Unit!5733)

(assert (=> b!190553 (= lt!94509 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5849 thiss!1248) lt!94507 #b00000000000000000000000000000000))))

(assert (=> b!190553 (arrayContainsKey!0 (_keys!5849 thiss!1248) lt!94507 #b00000000000000000000000000000000)))

(declare-fun lt!94508 () Unit!5733)

(assert (=> b!190553 (= lt!94508 lt!94509)))

(declare-fun res!90070 () Bool)

(assert (=> b!190553 (= res!90070 (= (seekEntryOrOpen!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000) (_keys!5849 thiss!1248) (mask!9078 thiss!1248)) (Found!660 #b00000000000000000000000000000000)))))

(assert (=> b!190553 (=> (not res!90070) (not e!125389))))

(declare-fun b!190554 () Bool)

(declare-fun e!125388 () Bool)

(assert (=> b!190554 (= e!125388 e!125390)))

(declare-fun c!34273 () Bool)

(assert (=> b!190554 (= c!34273 (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19211 () Bool)

(declare-fun call!19214 () Bool)

(assert (=> bm!19211 (= call!19214 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5849 thiss!1248) (mask!9078 thiss!1248)))))

(declare-fun d!55945 () Bool)

(declare-fun res!90069 () Bool)

(assert (=> d!55945 (=> res!90069 e!125388)))

(assert (=> d!55945 (= res!90069 (bvsge #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(assert (=> d!55945 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)) e!125388)))

(declare-fun b!190555 () Bool)

(assert (=> b!190555 (= e!125389 call!19214)))

(declare-fun b!190556 () Bool)

(assert (=> b!190556 (= e!125390 call!19214)))

(assert (= (and d!55945 (not res!90069)) b!190554))

(assert (= (and b!190554 c!34273) b!190553))

(assert (= (and b!190554 (not c!34273)) b!190556))

(assert (= (and b!190553 res!90070) b!190555))

(assert (= (or b!190555 b!190556) bm!19211))

(assert (=> b!190553 m!216711))

(declare-fun m!217083 () Bool)

(assert (=> b!190553 m!217083))

(declare-fun m!217085 () Bool)

(assert (=> b!190553 m!217085))

(assert (=> b!190553 m!216711))

(declare-fun m!217087 () Bool)

(assert (=> b!190553 m!217087))

(assert (=> b!190554 m!216711))

(assert (=> b!190554 m!216711))

(assert (=> b!190554 m!216721))

(declare-fun m!217089 () Bool)

(assert (=> bm!19211 m!217089))

(assert (=> b!190226 d!55945))

(declare-fun b!190567 () Bool)

(declare-fun e!125402 () Bool)

(declare-fun e!125399 () Bool)

(assert (=> b!190567 (= e!125402 e!125399)))

(declare-fun res!90077 () Bool)

(assert (=> b!190567 (=> (not res!90077) (not e!125399))))

(declare-fun e!125401 () Bool)

(assert (=> b!190567 (= res!90077 (not e!125401))))

(declare-fun res!90078 () Bool)

(assert (=> b!190567 (=> (not res!90078) (not e!125401))))

(assert (=> b!190567 (= res!90078 (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190568 () Bool)

(declare-fun contains!1332 (List!2380 (_ BitVec 64)) Bool)

(assert (=> b!190568 (= e!125401 (contains!1332 Nil!2377 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19214 () Bool)

(declare-fun call!19217 () Bool)

(declare-fun c!34276 () Bool)

(assert (=> bm!19214 (= call!19217 (arrayNoDuplicates!0 (_keys!5849 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34276 (Cons!2376 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000) Nil!2377) Nil!2377)))))

(declare-fun b!190569 () Bool)

(declare-fun e!125400 () Bool)

(assert (=> b!190569 (= e!125399 e!125400)))

(assert (=> b!190569 (= c!34276 (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190570 () Bool)

(assert (=> b!190570 (= e!125400 call!19217)))

(declare-fun b!190571 () Bool)

(assert (=> b!190571 (= e!125400 call!19217)))

(declare-fun d!55947 () Bool)

(declare-fun res!90079 () Bool)

(assert (=> d!55947 (=> res!90079 e!125402)))

(assert (=> d!55947 (= res!90079 (bvsge #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(assert (=> d!55947 (= (arrayNoDuplicates!0 (_keys!5849 thiss!1248) #b00000000000000000000000000000000 Nil!2377) e!125402)))

(assert (= (and d!55947 (not res!90079)) b!190567))

(assert (= (and b!190567 res!90078) b!190568))

(assert (= (and b!190567 res!90077) b!190569))

(assert (= (and b!190569 c!34276) b!190570))

(assert (= (and b!190569 (not c!34276)) b!190571))

(assert (= (or b!190570 b!190571) bm!19214))

(assert (=> b!190567 m!216711))

(assert (=> b!190567 m!216711))

(assert (=> b!190567 m!216721))

(assert (=> b!190568 m!216711))

(assert (=> b!190568 m!216711))

(declare-fun m!217091 () Bool)

(assert (=> b!190568 m!217091))

(assert (=> bm!19214 m!216711))

(declare-fun m!217093 () Bool)

(assert (=> bm!19214 m!217093))

(assert (=> b!190569 m!216711))

(assert (=> b!190569 m!216711))

(assert (=> b!190569 m!216721))

(assert (=> b!190227 d!55947))

(declare-fun d!55949 () Bool)

(assert (=> d!55949 (= (inRange!0 (ite c!34176 (index!4810 lt!94271) (index!4813 lt!94271)) (mask!9078 thiss!1248)) (and (bvsge (ite c!34176 (index!4810 lt!94271) (index!4813 lt!94271)) #b00000000000000000000000000000000) (bvslt (ite c!34176 (index!4810 lt!94271) (index!4813 lt!94271)) (bvadd (mask!9078 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19160 d!55949))

(declare-fun d!55951 () Bool)

(assert (=> d!55951 (= (apply!179 lt!94347 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2205 (getValueByKey!237 (toList!1207 lt!94347) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7640 () Bool)

(assert (= bs!7640 d!55951))

(declare-fun m!217095 () Bool)

(assert (=> bs!7640 m!217095))

(assert (=> bs!7640 m!217095))

(declare-fun m!217097 () Bool)

(assert (=> bs!7640 m!217097))

(assert (=> b!190285 d!55951))

(declare-fun b!190580 () Bool)

(declare-fun e!125408 () (_ BitVec 32))

(declare-fun e!125407 () (_ BitVec 32))

(assert (=> b!190580 (= e!125408 e!125407)))

(declare-fun c!34282 () Bool)

(assert (=> b!190580 (= c!34282 (validKeyInArray!0 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19217 () Bool)

(declare-fun call!19220 () (_ BitVec 32))

(assert (=> bm!19217 (= call!19220 (arrayCountValidKeys!0 (_keys!5849 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun d!55953 () Bool)

(declare-fun lt!94512 () (_ BitVec 32))

(assert (=> d!55953 (and (bvsge lt!94512 #b00000000000000000000000000000000) (bvsle lt!94512 (bvsub (size!4132 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55953 (= lt!94512 e!125408)))

(declare-fun c!34281 () Bool)

(assert (=> d!55953 (= c!34281 (bvsge #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))))))

(assert (=> d!55953 (and (bvsle #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4132 (_keys!5849 thiss!1248)) (size!4132 (_keys!5849 thiss!1248))))))

(assert (=> d!55953 (= (arrayCountValidKeys!0 (_keys!5849 thiss!1248) #b00000000000000000000000000000000 (size!4132 (_keys!5849 thiss!1248))) lt!94512)))

(declare-fun b!190581 () Bool)

(assert (=> b!190581 (= e!125407 call!19220)))

(declare-fun b!190582 () Bool)

(assert (=> b!190582 (= e!125408 #b00000000000000000000000000000000)))

(declare-fun b!190583 () Bool)

(assert (=> b!190583 (= e!125407 (bvadd #b00000000000000000000000000000001 call!19220))))

(assert (= (and d!55953 c!34281) b!190582))

(assert (= (and d!55953 (not c!34281)) b!190580))

(assert (= (and b!190580 c!34282) b!190583))

(assert (= (and b!190580 (not c!34282)) b!190581))

(assert (= (or b!190583 b!190581) bm!19217))

(assert (=> b!190580 m!216711))

(assert (=> b!190580 m!216711))

(assert (=> b!190580 m!216721))

(declare-fun m!217099 () Bool)

(assert (=> bm!19217 m!217099))

(assert (=> b!190225 d!55953))

(declare-fun d!55955 () Bool)

(declare-fun e!125410 () Bool)

(assert (=> d!55955 e!125410))

(declare-fun res!90080 () Bool)

(assert (=> d!55955 (=> res!90080 e!125410)))

(declare-fun lt!94513 () Bool)

(assert (=> d!55955 (= res!90080 (not lt!94513))))

(declare-fun lt!94514 () Bool)

(assert (=> d!55955 (= lt!94513 lt!94514)))

(declare-fun lt!94515 () Unit!5733)

(declare-fun e!125409 () Unit!5733)

(assert (=> d!55955 (= lt!94515 e!125409)))

(declare-fun c!34283 () Bool)

(assert (=> d!55955 (= c!34283 lt!94514)))

(assert (=> d!55955 (= lt!94514 (containsKey!240 (toList!1207 lt!94347) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55955 (= (contains!1328 lt!94347 #b0000000000000000000000000000000000000000000000000000000000000000) lt!94513)))

(declare-fun b!190584 () Bool)

(declare-fun lt!94516 () Unit!5733)

(assert (=> b!190584 (= e!125409 lt!94516)))

(assert (=> b!190584 (= lt!94516 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1207 lt!94347) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190584 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94347) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190585 () Bool)

(declare-fun Unit!5748 () Unit!5733)

(assert (=> b!190585 (= e!125409 Unit!5748)))

(declare-fun b!190586 () Bool)

(assert (=> b!190586 (= e!125410 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94347) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55955 c!34283) b!190584))

(assert (= (and d!55955 (not c!34283)) b!190585))

(assert (= (and d!55955 (not res!90080)) b!190586))

(declare-fun m!217101 () Bool)

(assert (=> d!55955 m!217101))

(declare-fun m!217103 () Bool)

(assert (=> b!190584 m!217103))

(assert (=> b!190584 m!217095))

(assert (=> b!190584 m!217095))

(declare-fun m!217105 () Bool)

(assert (=> b!190584 m!217105))

(assert (=> b!190586 m!217095))

(assert (=> b!190586 m!217095))

(assert (=> b!190586 m!217105))

(assert (=> bm!19179 d!55955))

(declare-fun d!55957 () Bool)

(assert (=> d!55957 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94227) key!828))))

(declare-fun lt!94519 () Unit!5733)

(declare-fun choose!1033 (List!2377 (_ BitVec 64)) Unit!5733)

(assert (=> d!55957 (= lt!94519 (choose!1033 (toList!1207 lt!94227) key!828))))

(declare-fun e!125413 () Bool)

(assert (=> d!55957 e!125413))

(declare-fun res!90083 () Bool)

(assert (=> d!55957 (=> (not res!90083) (not e!125413))))

(assert (=> d!55957 (= res!90083 (isStrictlySorted!340 (toList!1207 lt!94227)))))

(assert (=> d!55957 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1207 lt!94227) key!828) lt!94519)))

(declare-fun b!190589 () Bool)

(assert (=> b!190589 (= e!125413 (containsKey!240 (toList!1207 lt!94227) key!828))))

(assert (= (and d!55957 res!90083) b!190589))

(assert (=> d!55957 m!216765))

(assert (=> d!55957 m!216765))

(assert (=> d!55957 m!216767))

(declare-fun m!217107 () Bool)

(assert (=> d!55957 m!217107))

(assert (=> d!55957 m!216853))

(assert (=> b!190589 m!216761))

(assert (=> b!190308 d!55957))

(assert (=> b!190308 d!55941))

(assert (=> b!190308 d!55943))

(declare-fun d!55959 () Bool)

(declare-fun lt!94522 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!152 (List!2377) (InoxSet tuple2!3462))

(assert (=> d!55959 (= lt!94522 (select (content!152 (toList!1207 lt!94290)) (tuple2!3463 key!828 v!309)))))

(declare-fun e!125418 () Bool)

(assert (=> d!55959 (= lt!94522 e!125418)))

(declare-fun res!90088 () Bool)

(assert (=> d!55959 (=> (not res!90088) (not e!125418))))

(assert (=> d!55959 (= res!90088 ((_ is Cons!2373) (toList!1207 lt!94290)))))

(assert (=> d!55959 (= (contains!1331 (toList!1207 lt!94290) (tuple2!3463 key!828 v!309)) lt!94522)))

(declare-fun b!190594 () Bool)

(declare-fun e!125419 () Bool)

(assert (=> b!190594 (= e!125418 e!125419)))

(declare-fun res!90089 () Bool)

(assert (=> b!190594 (=> res!90089 e!125419)))

(assert (=> b!190594 (= res!90089 (= (h!3010 (toList!1207 lt!94290)) (tuple2!3463 key!828 v!309)))))

(declare-fun b!190595 () Bool)

(assert (=> b!190595 (= e!125419 (contains!1331 (t!7277 (toList!1207 lt!94290)) (tuple2!3463 key!828 v!309)))))

(assert (= (and d!55959 res!90088) b!190594))

(assert (= (and b!190594 (not res!90089)) b!190595))

(declare-fun m!217109 () Bool)

(assert (=> d!55959 m!217109))

(declare-fun m!217111 () Bool)

(assert (=> d!55959 m!217111))

(declare-fun m!217113 () Bool)

(assert (=> b!190595 m!217113))

(assert (=> b!190233 d!55959))

(declare-fun d!55961 () Bool)

(assert (=> d!55961 (= (apply!179 (+!300 lt!94396 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248))) lt!94384) (apply!179 lt!94396 lt!94384))))

(declare-fun lt!94523 () Unit!5733)

(assert (=> d!55961 (= lt!94523 (choose!1031 lt!94396 lt!94391 (zeroValue!3721 thiss!1248) lt!94384))))

(declare-fun e!125420 () Bool)

(assert (=> d!55961 e!125420))

(declare-fun res!90090 () Bool)

(assert (=> d!55961 (=> (not res!90090) (not e!125420))))

(assert (=> d!55961 (= res!90090 (contains!1328 lt!94396 lt!94384))))

(assert (=> d!55961 (= (addApplyDifferent!155 lt!94396 lt!94391 (zeroValue!3721 thiss!1248) lt!94384) lt!94523)))

(declare-fun b!190596 () Bool)

(assert (=> b!190596 (= e!125420 (not (= lt!94384 lt!94391)))))

(assert (= (and d!55961 res!90090) b!190596))

(declare-fun m!217115 () Bool)

(assert (=> d!55961 m!217115))

(assert (=> d!55961 m!216803))

(assert (=> d!55961 m!216805))

(assert (=> d!55961 m!216789))

(declare-fun m!217117 () Bool)

(assert (=> d!55961 m!217117))

(assert (=> d!55961 m!216803))

(assert (=> b!190321 d!55961))

(assert (=> b!190321 d!55883))

(declare-fun d!55963 () Bool)

(assert (=> d!55963 (= (apply!179 lt!94385 lt!94383) (get!2205 (getValueByKey!237 (toList!1207 lt!94385) lt!94383)))))

(declare-fun bs!7641 () Bool)

(assert (= bs!7641 d!55963))

(declare-fun m!217119 () Bool)

(assert (=> bs!7641 m!217119))

(assert (=> bs!7641 m!217119))

(declare-fun m!217121 () Bool)

(assert (=> bs!7641 m!217121))

(assert (=> b!190321 d!55963))

(declare-fun d!55965 () Bool)

(assert (=> d!55965 (contains!1328 (+!300 lt!94377 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248))) lt!94382)))

(declare-fun lt!94524 () Unit!5733)

(assert (=> d!55965 (= lt!94524 (choose!1032 lt!94377 lt!94375 (zeroValue!3721 thiss!1248) lt!94382))))

(assert (=> d!55965 (contains!1328 lt!94377 lt!94382)))

(assert (=> d!55965 (= (addStillContains!155 lt!94377 lt!94375 (zeroValue!3721 thiss!1248) lt!94382) lt!94524)))

(declare-fun bs!7642 () Bool)

(assert (= bs!7642 d!55965))

(assert (=> bs!7642 m!216787))

(assert (=> bs!7642 m!216787))

(assert (=> bs!7642 m!216807))

(declare-fun m!217123 () Bool)

(assert (=> bs!7642 m!217123))

(declare-fun m!217125 () Bool)

(assert (=> bs!7642 m!217125))

(assert (=> b!190321 d!55965))

(declare-fun d!55967 () Bool)

(assert (=> d!55967 (= (apply!179 (+!300 lt!94396 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248))) lt!94384) (get!2205 (getValueByKey!237 (toList!1207 (+!300 lt!94396 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248)))) lt!94384)))))

(declare-fun bs!7643 () Bool)

(assert (= bs!7643 d!55967))

(declare-fun m!217127 () Bool)

(assert (=> bs!7643 m!217127))

(assert (=> bs!7643 m!217127))

(declare-fun m!217129 () Bool)

(assert (=> bs!7643 m!217129))

(assert (=> b!190321 d!55967))

(declare-fun d!55969 () Bool)

(assert (=> d!55969 (= (apply!179 (+!300 lt!94385 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248))) lt!94383) (apply!179 lt!94385 lt!94383))))

(declare-fun lt!94525 () Unit!5733)

(assert (=> d!55969 (= lt!94525 (choose!1031 lt!94385 lt!94393 (minValue!3721 thiss!1248) lt!94383))))

(declare-fun e!125421 () Bool)

(assert (=> d!55969 e!125421))

(declare-fun res!90091 () Bool)

(assert (=> d!55969 (=> (not res!90091) (not e!125421))))

(assert (=> d!55969 (= res!90091 (contains!1328 lt!94385 lt!94383))))

(assert (=> d!55969 (= (addApplyDifferent!155 lt!94385 lt!94393 (minValue!3721 thiss!1248) lt!94383) lt!94525)))

(declare-fun b!190597 () Bool)

(assert (=> b!190597 (= e!125421 (not (= lt!94383 lt!94393)))))

(assert (= (and d!55969 res!90091) b!190597))

(declare-fun m!217131 () Bool)

(assert (=> d!55969 m!217131))

(assert (=> d!55969 m!216797))

(assert (=> d!55969 m!216811))

(assert (=> d!55969 m!216809))

(declare-fun m!217133 () Bool)

(assert (=> d!55969 m!217133))

(assert (=> d!55969 m!216797))

(assert (=> b!190321 d!55969))

(declare-fun d!55971 () Bool)

(declare-fun e!125422 () Bool)

(assert (=> d!55971 e!125422))

(declare-fun res!90092 () Bool)

(assert (=> d!55971 (=> (not res!90092) (not e!125422))))

(declare-fun lt!94526 () ListLongMap!2383)

(assert (=> d!55971 (= res!90092 (contains!1328 lt!94526 (_1!1742 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248)))))))

(declare-fun lt!94527 () List!2377)

(assert (=> d!55971 (= lt!94526 (ListLongMap!2384 lt!94527))))

(declare-fun lt!94529 () Unit!5733)

(declare-fun lt!94528 () Unit!5733)

(assert (=> d!55971 (= lt!94529 lt!94528)))

(assert (=> d!55971 (= (getValueByKey!237 lt!94527 (_1!1742 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248)))))))

(assert (=> d!55971 (= lt!94528 (lemmaContainsTupThenGetReturnValue!124 lt!94527 (_1!1742 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248)))))))

(assert (=> d!55971 (= lt!94527 (insertStrictlySorted!127 (toList!1207 lt!94385) (_1!1742 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248)))))))

(assert (=> d!55971 (= (+!300 lt!94385 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248))) lt!94526)))

(declare-fun b!190598 () Bool)

(declare-fun res!90093 () Bool)

(assert (=> b!190598 (=> (not res!90093) (not e!125422))))

(assert (=> b!190598 (= res!90093 (= (getValueByKey!237 (toList!1207 lt!94526) (_1!1742 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248))))))))

(declare-fun b!190599 () Bool)

(assert (=> b!190599 (= e!125422 (contains!1331 (toList!1207 lt!94526) (tuple2!3463 lt!94393 (minValue!3721 thiss!1248))))))

(assert (= (and d!55971 res!90092) b!190598))

(assert (= (and b!190598 res!90093) b!190599))

(declare-fun m!217135 () Bool)

(assert (=> d!55971 m!217135))

(declare-fun m!217137 () Bool)

(assert (=> d!55971 m!217137))

(declare-fun m!217139 () Bool)

(assert (=> d!55971 m!217139))

(declare-fun m!217141 () Bool)

(assert (=> d!55971 m!217141))

(declare-fun m!217143 () Bool)

(assert (=> b!190598 m!217143))

(declare-fun m!217145 () Bool)

(assert (=> b!190599 m!217145))

(assert (=> b!190321 d!55971))

(declare-fun d!55973 () Bool)

(declare-fun e!125424 () Bool)

(assert (=> d!55973 e!125424))

(declare-fun res!90094 () Bool)

(assert (=> d!55973 (=> res!90094 e!125424)))

(declare-fun lt!94530 () Bool)

(assert (=> d!55973 (= res!90094 (not lt!94530))))

(declare-fun lt!94531 () Bool)

(assert (=> d!55973 (= lt!94530 lt!94531)))

(declare-fun lt!94532 () Unit!5733)

(declare-fun e!125423 () Unit!5733)

(assert (=> d!55973 (= lt!94532 e!125423)))

(declare-fun c!34284 () Bool)

(assert (=> d!55973 (= c!34284 lt!94531)))

(assert (=> d!55973 (= lt!94531 (containsKey!240 (toList!1207 (+!300 lt!94377 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248)))) lt!94382))))

(assert (=> d!55973 (= (contains!1328 (+!300 lt!94377 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248))) lt!94382) lt!94530)))

(declare-fun b!190600 () Bool)

(declare-fun lt!94533 () Unit!5733)

(assert (=> b!190600 (= e!125423 lt!94533)))

(assert (=> b!190600 (= lt!94533 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1207 (+!300 lt!94377 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248)))) lt!94382))))

(assert (=> b!190600 (isDefined!189 (getValueByKey!237 (toList!1207 (+!300 lt!94377 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248)))) lt!94382))))

(declare-fun b!190601 () Bool)

(declare-fun Unit!5749 () Unit!5733)

(assert (=> b!190601 (= e!125423 Unit!5749)))

(declare-fun b!190602 () Bool)

(assert (=> b!190602 (= e!125424 (isDefined!189 (getValueByKey!237 (toList!1207 (+!300 lt!94377 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248)))) lt!94382)))))

(assert (= (and d!55973 c!34284) b!190600))

(assert (= (and d!55973 (not c!34284)) b!190601))

(assert (= (and d!55973 (not res!90094)) b!190602))

(declare-fun m!217147 () Bool)

(assert (=> d!55973 m!217147))

(declare-fun m!217149 () Bool)

(assert (=> b!190600 m!217149))

(declare-fun m!217151 () Bool)

(assert (=> b!190600 m!217151))

(assert (=> b!190600 m!217151))

(declare-fun m!217153 () Bool)

(assert (=> b!190600 m!217153))

(assert (=> b!190602 m!217151))

(assert (=> b!190602 m!217151))

(assert (=> b!190602 m!217153))

(assert (=> b!190321 d!55973))

(declare-fun d!55975 () Bool)

(assert (=> d!55975 (= (apply!179 (+!300 lt!94386 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248))) lt!94387) (apply!179 lt!94386 lt!94387))))

(declare-fun lt!94534 () Unit!5733)

(assert (=> d!55975 (= lt!94534 (choose!1031 lt!94386 lt!94379 (minValue!3721 thiss!1248) lt!94387))))

(declare-fun e!125425 () Bool)

(assert (=> d!55975 e!125425))

(declare-fun res!90095 () Bool)

(assert (=> d!55975 (=> (not res!90095) (not e!125425))))

(assert (=> d!55975 (= res!90095 (contains!1328 lt!94386 lt!94387))))

(assert (=> d!55975 (= (addApplyDifferent!155 lt!94386 lt!94379 (minValue!3721 thiss!1248) lt!94387) lt!94534)))

(declare-fun b!190603 () Bool)

(assert (=> b!190603 (= e!125425 (not (= lt!94387 lt!94379)))))

(assert (= (and d!55975 res!90095) b!190603))

(declare-fun m!217155 () Bool)

(assert (=> d!55975 m!217155))

(assert (=> d!55975 m!216791))

(assert (=> d!55975 m!216793))

(assert (=> d!55975 m!216801))

(declare-fun m!217157 () Bool)

(assert (=> d!55975 m!217157))

(assert (=> d!55975 m!216791))

(assert (=> b!190321 d!55975))

(declare-fun d!55977 () Bool)

(assert (=> d!55977 (= (apply!179 lt!94386 lt!94387) (get!2205 (getValueByKey!237 (toList!1207 lt!94386) lt!94387)))))

(declare-fun bs!7644 () Bool)

(assert (= bs!7644 d!55977))

(declare-fun m!217159 () Bool)

(assert (=> bs!7644 m!217159))

(assert (=> bs!7644 m!217159))

(declare-fun m!217161 () Bool)

(assert (=> bs!7644 m!217161))

(assert (=> b!190321 d!55977))

(declare-fun d!55979 () Bool)

(declare-fun e!125426 () Bool)

(assert (=> d!55979 e!125426))

(declare-fun res!90096 () Bool)

(assert (=> d!55979 (=> (not res!90096) (not e!125426))))

(declare-fun lt!94535 () ListLongMap!2383)

(assert (=> d!55979 (= res!90096 (contains!1328 lt!94535 (_1!1742 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248)))))))

(declare-fun lt!94536 () List!2377)

(assert (=> d!55979 (= lt!94535 (ListLongMap!2384 lt!94536))))

(declare-fun lt!94538 () Unit!5733)

(declare-fun lt!94537 () Unit!5733)

(assert (=> d!55979 (= lt!94538 lt!94537)))

(assert (=> d!55979 (= (getValueByKey!237 lt!94536 (_1!1742 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55979 (= lt!94537 (lemmaContainsTupThenGetReturnValue!124 lt!94536 (_1!1742 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55979 (= lt!94536 (insertStrictlySorted!127 (toList!1207 lt!94377) (_1!1742 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55979 (= (+!300 lt!94377 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248))) lt!94535)))

(declare-fun b!190604 () Bool)

(declare-fun res!90097 () Bool)

(assert (=> b!190604 (=> (not res!90097) (not e!125426))))

(assert (=> b!190604 (= res!90097 (= (getValueByKey!237 (toList!1207 lt!94535) (_1!1742 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248))))))))

(declare-fun b!190605 () Bool)

(assert (=> b!190605 (= e!125426 (contains!1331 (toList!1207 lt!94535) (tuple2!3463 lt!94375 (zeroValue!3721 thiss!1248))))))

(assert (= (and d!55979 res!90096) b!190604))

(assert (= (and b!190604 res!90097) b!190605))

(declare-fun m!217163 () Bool)

(assert (=> d!55979 m!217163))

(declare-fun m!217165 () Bool)

(assert (=> d!55979 m!217165))

(declare-fun m!217167 () Bool)

(assert (=> d!55979 m!217167))

(declare-fun m!217169 () Bool)

(assert (=> d!55979 m!217169))

(declare-fun m!217171 () Bool)

(assert (=> b!190604 m!217171))

(declare-fun m!217173 () Bool)

(assert (=> b!190605 m!217173))

(assert (=> b!190321 d!55979))

(declare-fun d!55981 () Bool)

(assert (=> d!55981 (= (apply!179 lt!94396 lt!94384) (get!2205 (getValueByKey!237 (toList!1207 lt!94396) lt!94384)))))

(declare-fun bs!7645 () Bool)

(assert (= bs!7645 d!55981))

(declare-fun m!217175 () Bool)

(assert (=> bs!7645 m!217175))

(assert (=> bs!7645 m!217175))

(declare-fun m!217177 () Bool)

(assert (=> bs!7645 m!217177))

(assert (=> b!190321 d!55981))

(declare-fun d!55983 () Bool)

(assert (=> d!55983 (= (apply!179 (+!300 lt!94385 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248))) lt!94383) (get!2205 (getValueByKey!237 (toList!1207 (+!300 lt!94385 (tuple2!3463 lt!94393 (minValue!3721 thiss!1248)))) lt!94383)))))

(declare-fun bs!7646 () Bool)

(assert (= bs!7646 d!55983))

(declare-fun m!217179 () Bool)

(assert (=> bs!7646 m!217179))

(assert (=> bs!7646 m!217179))

(declare-fun m!217181 () Bool)

(assert (=> bs!7646 m!217181))

(assert (=> b!190321 d!55983))

(declare-fun d!55985 () Bool)

(declare-fun e!125427 () Bool)

(assert (=> d!55985 e!125427))

(declare-fun res!90098 () Bool)

(assert (=> d!55985 (=> (not res!90098) (not e!125427))))

(declare-fun lt!94539 () ListLongMap!2383)

(assert (=> d!55985 (= res!90098 (contains!1328 lt!94539 (_1!1742 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248)))))))

(declare-fun lt!94540 () List!2377)

(assert (=> d!55985 (= lt!94539 (ListLongMap!2384 lt!94540))))

(declare-fun lt!94542 () Unit!5733)

(declare-fun lt!94541 () Unit!5733)

(assert (=> d!55985 (= lt!94542 lt!94541)))

(assert (=> d!55985 (= (getValueByKey!237 lt!94540 (_1!1742 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55985 (= lt!94541 (lemmaContainsTupThenGetReturnValue!124 lt!94540 (_1!1742 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55985 (= lt!94540 (insertStrictlySorted!127 (toList!1207 lt!94396) (_1!1742 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248)))))))

(assert (=> d!55985 (= (+!300 lt!94396 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248))) lt!94539)))

(declare-fun b!190606 () Bool)

(declare-fun res!90099 () Bool)

(assert (=> b!190606 (=> (not res!90099) (not e!125427))))

(assert (=> b!190606 (= res!90099 (= (getValueByKey!237 (toList!1207 lt!94539) (_1!1742 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248))))))))

(declare-fun b!190607 () Bool)

(assert (=> b!190607 (= e!125427 (contains!1331 (toList!1207 lt!94539) (tuple2!3463 lt!94391 (zeroValue!3721 thiss!1248))))))

(assert (= (and d!55985 res!90098) b!190606))

(assert (= (and b!190606 res!90099) b!190607))

(declare-fun m!217183 () Bool)

(assert (=> d!55985 m!217183))

(declare-fun m!217185 () Bool)

(assert (=> d!55985 m!217185))

(declare-fun m!217187 () Bool)

(assert (=> d!55985 m!217187))

(declare-fun m!217189 () Bool)

(assert (=> d!55985 m!217189))

(declare-fun m!217191 () Bool)

(assert (=> b!190606 m!217191))

(declare-fun m!217193 () Bool)

(assert (=> b!190607 m!217193))

(assert (=> b!190321 d!55985))

(declare-fun d!55987 () Bool)

(declare-fun e!125428 () Bool)

(assert (=> d!55987 e!125428))

(declare-fun res!90100 () Bool)

(assert (=> d!55987 (=> (not res!90100) (not e!125428))))

(declare-fun lt!94543 () ListLongMap!2383)

(assert (=> d!55987 (= res!90100 (contains!1328 lt!94543 (_1!1742 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248)))))))

(declare-fun lt!94544 () List!2377)

(assert (=> d!55987 (= lt!94543 (ListLongMap!2384 lt!94544))))

(declare-fun lt!94546 () Unit!5733)

(declare-fun lt!94545 () Unit!5733)

(assert (=> d!55987 (= lt!94546 lt!94545)))

(assert (=> d!55987 (= (getValueByKey!237 lt!94544 (_1!1742 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248)))))))

(assert (=> d!55987 (= lt!94545 (lemmaContainsTupThenGetReturnValue!124 lt!94544 (_1!1742 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248)))))))

(assert (=> d!55987 (= lt!94544 (insertStrictlySorted!127 (toList!1207 lt!94386) (_1!1742 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248)))))))

(assert (=> d!55987 (= (+!300 lt!94386 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248))) lt!94543)))

(declare-fun b!190608 () Bool)

(declare-fun res!90101 () Bool)

(assert (=> b!190608 (=> (not res!90101) (not e!125428))))

(assert (=> b!190608 (= res!90101 (= (getValueByKey!237 (toList!1207 lt!94543) (_1!1742 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248))))))))

(declare-fun b!190609 () Bool)

(assert (=> b!190609 (= e!125428 (contains!1331 (toList!1207 lt!94543) (tuple2!3463 lt!94379 (minValue!3721 thiss!1248))))))

(assert (= (and d!55987 res!90100) b!190608))

(assert (= (and b!190608 res!90101) b!190609))

(declare-fun m!217195 () Bool)

(assert (=> d!55987 m!217195))

(declare-fun m!217197 () Bool)

(assert (=> d!55987 m!217197))

(declare-fun m!217199 () Bool)

(assert (=> d!55987 m!217199))

(declare-fun m!217201 () Bool)

(assert (=> d!55987 m!217201))

(declare-fun m!217203 () Bool)

(assert (=> b!190608 m!217203))

(declare-fun m!217205 () Bool)

(assert (=> b!190609 m!217205))

(assert (=> b!190321 d!55987))

(declare-fun d!55989 () Bool)

(assert (=> d!55989 (= (apply!179 (+!300 lt!94386 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248))) lt!94387) (get!2205 (getValueByKey!237 (toList!1207 (+!300 lt!94386 (tuple2!3463 lt!94379 (minValue!3721 thiss!1248)))) lt!94387)))))

(declare-fun bs!7647 () Bool)

(assert (= bs!7647 d!55989))

(declare-fun m!217207 () Bool)

(assert (=> bs!7647 m!217207))

(assert (=> bs!7647 m!217207))

(declare-fun m!217209 () Bool)

(assert (=> bs!7647 m!217209))

(assert (=> b!190321 d!55989))

(declare-fun b!190621 () Bool)

(declare-fun e!125431 () Bool)

(assert (=> b!190621 (= e!125431 (and (bvsge (extraKeys!3617 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3617 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1377 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!55991 () Bool)

(declare-fun res!90110 () Bool)

(assert (=> d!55991 (=> (not res!90110) (not e!125431))))

(assert (=> d!55991 (= res!90110 (validMask!0 (mask!9078 thiss!1248)))))

(assert (=> d!55991 (= (simpleValid!195 thiss!1248) e!125431)))

(declare-fun b!190619 () Bool)

(declare-fun res!90111 () Bool)

(assert (=> b!190619 (=> (not res!90111) (not e!125431))))

(declare-fun size!4138 (LongMapFixedSize!2656) (_ BitVec 32))

(assert (=> b!190619 (= res!90111 (bvsge (size!4138 thiss!1248) (_size!1377 thiss!1248)))))

(declare-fun b!190618 () Bool)

(declare-fun res!90112 () Bool)

(assert (=> b!190618 (=> (not res!90112) (not e!125431))))

(assert (=> b!190618 (= res!90112 (and (= (size!4133 (_values!3863 thiss!1248)) (bvadd (mask!9078 thiss!1248) #b00000000000000000000000000000001)) (= (size!4132 (_keys!5849 thiss!1248)) (size!4133 (_values!3863 thiss!1248))) (bvsge (_size!1377 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1377 thiss!1248) (bvadd (mask!9078 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!190620 () Bool)

(declare-fun res!90113 () Bool)

(assert (=> b!190620 (=> (not res!90113) (not e!125431))))

(assert (=> b!190620 (= res!90113 (= (size!4138 thiss!1248) (bvadd (_size!1377 thiss!1248) (bvsdiv (bvadd (extraKeys!3617 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!55991 res!90110) b!190618))

(assert (= (and b!190618 res!90112) b!190619))

(assert (= (and b!190619 res!90111) b!190620))

(assert (= (and b!190620 res!90113) b!190621))

(assert (=> d!55991 m!216571))

(declare-fun m!217211 () Bool)

(assert (=> b!190619 m!217211))

(assert (=> b!190620 m!217211))

(assert (=> d!55853 d!55991))

(declare-fun b!190624 () Bool)

(declare-fun e!125433 () Option!243)

(assert (=> b!190624 (= e!125433 (getValueByKey!237 (t!7277 (toList!1207 lt!94290)) (_1!1742 (tuple2!3463 key!828 v!309))))))

(declare-fun d!55993 () Bool)

(declare-fun c!34285 () Bool)

(assert (=> d!55993 (= c!34285 (and ((_ is Cons!2373) (toList!1207 lt!94290)) (= (_1!1742 (h!3010 (toList!1207 lt!94290))) (_1!1742 (tuple2!3463 key!828 v!309)))))))

(declare-fun e!125432 () Option!243)

(assert (=> d!55993 (= (getValueByKey!237 (toList!1207 lt!94290) (_1!1742 (tuple2!3463 key!828 v!309))) e!125432)))

(declare-fun b!190625 () Bool)

(assert (=> b!190625 (= e!125433 None!241)))

(declare-fun b!190622 () Bool)

(assert (=> b!190622 (= e!125432 (Some!242 (_2!1742 (h!3010 (toList!1207 lt!94290)))))))

(declare-fun b!190623 () Bool)

(assert (=> b!190623 (= e!125432 e!125433)))

(declare-fun c!34286 () Bool)

(assert (=> b!190623 (= c!34286 (and ((_ is Cons!2373) (toList!1207 lt!94290)) (not (= (_1!1742 (h!3010 (toList!1207 lt!94290))) (_1!1742 (tuple2!3463 key!828 v!309))))))))

(assert (= (and d!55993 c!34285) b!190622))

(assert (= (and d!55993 (not c!34285)) b!190623))

(assert (= (and b!190623 c!34286) b!190624))

(assert (= (and b!190623 (not c!34286)) b!190625))

(declare-fun m!217213 () Bool)

(assert (=> b!190624 m!217213))

(assert (=> b!190232 d!55993))

(declare-fun d!55995 () Bool)

(declare-fun e!125434 () Bool)

(assert (=> d!55995 e!125434))

(declare-fun res!90114 () Bool)

(assert (=> d!55995 (=> (not res!90114) (not e!125434))))

(declare-fun lt!94547 () ListLongMap!2383)

(assert (=> d!55995 (= res!90114 (contains!1328 lt!94547 (_1!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(declare-fun lt!94548 () List!2377)

(assert (=> d!55995 (= lt!94547 (ListLongMap!2384 lt!94548))))

(declare-fun lt!94550 () Unit!5733)

(declare-fun lt!94549 () Unit!5733)

(assert (=> d!55995 (= lt!94550 lt!94549)))

(assert (=> d!55995 (= (getValueByKey!237 lt!94548 (_1!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (=> d!55995 (= lt!94549 (lemmaContainsTupThenGetReturnValue!124 lt!94548 (_1!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (=> d!55995 (= lt!94548 (insertStrictlySorted!127 (toList!1207 call!19188) (_1!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))) (_2!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))))))

(assert (=> d!55995 (= (+!300 call!19188 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))) lt!94547)))

(declare-fun b!190626 () Bool)

(declare-fun res!90115 () Bool)

(assert (=> b!190626 (=> (not res!90115) (not e!125434))))

(assert (=> b!190626 (= res!90115 (= (getValueByKey!237 (toList!1207 lt!94547) (_1!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248)))) (Some!242 (_2!1742 (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))))

(declare-fun b!190627 () Bool)

(assert (=> b!190627 (= e!125434 (contains!1331 (toList!1207 lt!94547) (tuple2!3463 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3721 thiss!1248))))))

(assert (= (and d!55995 res!90114) b!190626))

(assert (= (and b!190626 res!90115) b!190627))

(declare-fun m!217215 () Bool)

(assert (=> d!55995 m!217215))

(declare-fun m!217217 () Bool)

(assert (=> d!55995 m!217217))

(declare-fun m!217219 () Bool)

(assert (=> d!55995 m!217219))

(declare-fun m!217221 () Bool)

(assert (=> d!55995 m!217221))

(declare-fun m!217223 () Bool)

(assert (=> b!190626 m!217223))

(declare-fun m!217225 () Bool)

(assert (=> b!190627 m!217225))

(assert (=> b!190322 d!55995))

(declare-fun d!55997 () Bool)

(assert (=> d!55997 (= (apply!179 lt!94381 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)) (get!2205 (getValueByKey!237 (toList!1207 lt!94381) (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7648 () Bool)

(assert (= bs!7648 d!55997))

(assert (=> bs!7648 m!216711))

(assert (=> bs!7648 m!216897))

(assert (=> bs!7648 m!216897))

(declare-fun m!217227 () Bool)

(assert (=> bs!7648 m!217227))

(assert (=> b!190318 d!55997))

(declare-fun d!55999 () Bool)

(declare-fun c!34287 () Bool)

(assert (=> d!55999 (= c!34287 ((_ is ValueCellFull!1874) (select (arr!3813 (_values!3863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!125435 () V!5561)

(assert (=> d!55999 (= (get!2204 (select (arr!3813 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!125435)))

(declare-fun b!190628 () Bool)

(assert (=> b!190628 (= e!125435 (get!2206 (select (arr!3813 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190629 () Bool)

(assert (=> b!190629 (= e!125435 (get!2207 (select (arr!3813 (_values!3863 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3880 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55999 c!34287) b!190628))

(assert (= (and d!55999 (not c!34287)) b!190629))

(assert (=> b!190628 m!216771))

(assert (=> b!190628 m!216705))

(declare-fun m!217229 () Bool)

(assert (=> b!190628 m!217229))

(assert (=> b!190629 m!216771))

(assert (=> b!190629 m!216705))

(declare-fun m!217231 () Bool)

(assert (=> b!190629 m!217231))

(assert (=> b!190318 d!55999))

(declare-fun d!56001 () Bool)

(assert (=> d!56001 (= (apply!179 lt!94347 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2205 (getValueByKey!237 (toList!1207 lt!94347) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7649 () Bool)

(assert (= bs!7649 d!56001))

(assert (=> bs!7649 m!217075))

(assert (=> bs!7649 m!217075))

(declare-fun m!217233 () Bool)

(assert (=> bs!7649 m!217233))

(assert (=> b!190299 d!56001))

(declare-fun d!56003 () Bool)

(declare-fun e!125437 () Bool)

(assert (=> d!56003 e!125437))

(declare-fun res!90116 () Bool)

(assert (=> d!56003 (=> res!90116 e!125437)))

(declare-fun lt!94551 () Bool)

(assert (=> d!56003 (= res!90116 (not lt!94551))))

(declare-fun lt!94552 () Bool)

(assert (=> d!56003 (= lt!94551 lt!94552)))

(declare-fun lt!94553 () Unit!5733)

(declare-fun e!125436 () Unit!5733)

(assert (=> d!56003 (= lt!94553 e!125436)))

(declare-fun c!34288 () Bool)

(assert (=> d!56003 (= c!34288 lt!94552)))

(assert (=> d!56003 (= lt!94552 (containsKey!240 (toList!1207 lt!94381) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56003 (= (contains!1328 lt!94381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!94551)))

(declare-fun b!190630 () Bool)

(declare-fun lt!94554 () Unit!5733)

(assert (=> b!190630 (= e!125436 lt!94554)))

(assert (=> b!190630 (= lt!94554 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1207 lt!94381) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190630 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94381) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190631 () Bool)

(declare-fun Unit!5750 () Unit!5733)

(assert (=> b!190631 (= e!125436 Unit!5750)))

(declare-fun b!190632 () Bool)

(assert (=> b!190632 (= e!125437 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56003 c!34288) b!190630))

(assert (= (and d!56003 (not c!34288)) b!190631))

(assert (= (and d!56003 (not res!90116)) b!190632))

(declare-fun m!217235 () Bool)

(assert (=> d!56003 m!217235))

(declare-fun m!217237 () Bool)

(assert (=> b!190630 m!217237))

(assert (=> b!190630 m!216857))

(assert (=> b!190630 m!216857))

(declare-fun m!217239 () Bool)

(assert (=> b!190630 m!217239))

(assert (=> b!190632 m!216857))

(assert (=> b!190632 m!216857))

(assert (=> b!190632 m!217239))

(assert (=> bm!19187 d!56003))

(assert (=> bm!19177 d!55903))

(declare-fun d!56005 () Bool)

(declare-fun e!125438 () Bool)

(assert (=> d!56005 e!125438))

(declare-fun res!90117 () Bool)

(assert (=> d!56005 (=> (not res!90117) (not e!125438))))

(declare-fun lt!94555 () ListLongMap!2383)

(assert (=> d!56005 (= res!90117 (contains!1328 lt!94555 (_1!1742 (tuple2!3463 key!828 v!309))))))

(declare-fun lt!94556 () List!2377)

(assert (=> d!56005 (= lt!94555 (ListLongMap!2384 lt!94556))))

(declare-fun lt!94558 () Unit!5733)

(declare-fun lt!94557 () Unit!5733)

(assert (=> d!56005 (= lt!94558 lt!94557)))

(assert (=> d!56005 (= (getValueByKey!237 lt!94556 (_1!1742 (tuple2!3463 key!828 v!309))) (Some!242 (_2!1742 (tuple2!3463 key!828 v!309))))))

(assert (=> d!56005 (= lt!94557 (lemmaContainsTupThenGetReturnValue!124 lt!94556 (_1!1742 (tuple2!3463 key!828 v!309)) (_2!1742 (tuple2!3463 key!828 v!309))))))

(assert (=> d!56005 (= lt!94556 (insertStrictlySorted!127 (toList!1207 (getCurrentListMap!859 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248))) (_1!1742 (tuple2!3463 key!828 v!309)) (_2!1742 (tuple2!3463 key!828 v!309))))))

(assert (=> d!56005 (= (+!300 (getCurrentListMap!859 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) (tuple2!3463 key!828 v!309)) lt!94555)))

(declare-fun b!190633 () Bool)

(declare-fun res!90118 () Bool)

(assert (=> b!190633 (=> (not res!90118) (not e!125438))))

(assert (=> b!190633 (= res!90118 (= (getValueByKey!237 (toList!1207 lt!94555) (_1!1742 (tuple2!3463 key!828 v!309))) (Some!242 (_2!1742 (tuple2!3463 key!828 v!309)))))))

(declare-fun b!190634 () Bool)

(assert (=> b!190634 (= e!125438 (contains!1331 (toList!1207 lt!94555) (tuple2!3463 key!828 v!309)))))

(assert (= (and d!56005 res!90117) b!190633))

(assert (= (and b!190633 res!90118) b!190634))

(declare-fun m!217241 () Bool)

(assert (=> d!56005 m!217241))

(declare-fun m!217243 () Bool)

(assert (=> d!56005 m!217243))

(declare-fun m!217245 () Bool)

(assert (=> d!56005 m!217245))

(declare-fun m!217247 () Bool)

(assert (=> d!56005 m!217247))

(declare-fun m!217249 () Bool)

(assert (=> b!190633 m!217249))

(declare-fun m!217251 () Bool)

(assert (=> b!190634 m!217251))

(assert (=> b!190236 d!56005))

(assert (=> b!190236 d!55865))

(assert (=> b!190236 d!55861))

(declare-fun d!56007 () Bool)

(assert (=> d!56007 (= (inRange!0 (index!4811 lt!94401) (mask!9078 thiss!1248)) (and (bvsge (index!4811 lt!94401) #b00000000000000000000000000000000) (bvslt (index!4811 lt!94401) (bvadd (mask!9078 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!190336 d!56007))

(assert (=> b!190281 d!55885))

(declare-fun d!56009 () Bool)

(declare-fun e!125440 () Bool)

(assert (=> d!56009 e!125440))

(declare-fun res!90119 () Bool)

(assert (=> d!56009 (=> res!90119 e!125440)))

(declare-fun lt!94559 () Bool)

(assert (=> d!56009 (= res!90119 (not lt!94559))))

(declare-fun lt!94560 () Bool)

(assert (=> d!56009 (= lt!94559 lt!94560)))

(declare-fun lt!94561 () Unit!5733)

(declare-fun e!125439 () Unit!5733)

(assert (=> d!56009 (= lt!94561 e!125439)))

(declare-fun c!34289 () Bool)

(assert (=> d!56009 (= c!34289 lt!94560)))

(assert (=> d!56009 (= lt!94560 (containsKey!240 (toList!1207 lt!94347) (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56009 (= (contains!1328 lt!94347 (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)) lt!94559)))

(declare-fun b!190635 () Bool)

(declare-fun lt!94562 () Unit!5733)

(assert (=> b!190635 (= e!125439 lt!94562)))

(assert (=> b!190635 (= lt!94562 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1207 lt!94347) (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190635 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94347) (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190636 () Bool)

(declare-fun Unit!5751 () Unit!5733)

(assert (=> b!190636 (= e!125439 Unit!5751)))

(declare-fun b!190637 () Bool)

(assert (=> b!190637 (= e!125440 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94347) (select (arr!3812 (_keys!5849 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56009 c!34289) b!190635))

(assert (= (and d!56009 (not c!34289)) b!190636))

(assert (= (and d!56009 (not res!90119)) b!190637))

(assert (=> d!56009 m!216711))

(declare-fun m!217253 () Bool)

(assert (=> d!56009 m!217253))

(assert (=> b!190635 m!216711))

(declare-fun m!217255 () Bool)

(assert (=> b!190635 m!217255))

(assert (=> b!190635 m!216711))

(assert (=> b!190635 m!217063))

(assert (=> b!190635 m!217063))

(declare-fun m!217257 () Bool)

(assert (=> b!190635 m!217257))

(assert (=> b!190637 m!216711))

(assert (=> b!190637 m!217063))

(assert (=> b!190637 m!217063))

(assert (=> b!190637 m!217257))

(assert (=> b!190282 d!56009))

(declare-fun d!56011 () Bool)

(assert (=> d!56011 (= (+!300 (getCurrentListMap!859 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)) (tuple2!3463 key!828 v!309)) (getCurrentListMap!859 (_keys!5849 thiss!1248) (array!8092 (store (arr!3813 (_values!3863 thiss!1248)) (index!4811 lt!94229) (ValueCellFull!1874 v!309)) (size!4133 (_values!3863 thiss!1248))) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3880 thiss!1248)))))

(assert (=> d!56011 true))

(declare-fun _$5!146 () Unit!5733)

(assert (=> d!56011 (= (choose!1028 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) (index!4811 lt!94229) key!828 v!309 (defaultEntry!3880 thiss!1248)) _$5!146)))

(declare-fun bs!7650 () Bool)

(assert (= bs!7650 d!56011))

(assert (=> bs!7650 m!216567))

(assert (=> bs!7650 m!216567))

(assert (=> bs!7650 m!216701))

(assert (=> bs!7650 m!216565))

(assert (=> bs!7650 m!216573))

(assert (=> d!55857 d!56011))

(assert (=> d!55857 d!55859))

(declare-fun d!56013 () Bool)

(assert (=> d!56013 (= (apply!179 lt!94381 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2205 (getValueByKey!237 (toList!1207 lt!94381) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7651 () Bool)

(assert (= bs!7651 d!56013))

(declare-fun m!217259 () Bool)

(assert (=> bs!7651 m!217259))

(assert (=> bs!7651 m!217259))

(declare-fun m!217261 () Bool)

(assert (=> bs!7651 m!217261))

(assert (=> b!190317 d!56013))

(assert (=> b!190297 d!55885))

(declare-fun d!56015 () Bool)

(declare-fun e!125442 () Bool)

(assert (=> d!56015 e!125442))

(declare-fun res!90120 () Bool)

(assert (=> d!56015 (=> res!90120 e!125442)))

(declare-fun lt!94563 () Bool)

(assert (=> d!56015 (= res!90120 (not lt!94563))))

(declare-fun lt!94564 () Bool)

(assert (=> d!56015 (= lt!94563 lt!94564)))

(declare-fun lt!94565 () Unit!5733)

(declare-fun e!125441 () Unit!5733)

(assert (=> d!56015 (= lt!94565 e!125441)))

(declare-fun c!34290 () Bool)

(assert (=> d!56015 (= c!34290 lt!94564)))

(assert (=> d!56015 (= lt!94564 (containsKey!240 (toList!1207 lt!94381) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56015 (= (contains!1328 lt!94381 #b0000000000000000000000000000000000000000000000000000000000000000) lt!94563)))

(declare-fun b!190638 () Bool)

(declare-fun lt!94566 () Unit!5733)

(assert (=> b!190638 (= e!125441 lt!94566)))

(assert (=> b!190638 (= lt!94566 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1207 lt!94381) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190638 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94381) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190639 () Bool)

(declare-fun Unit!5752 () Unit!5733)

(assert (=> b!190639 (= e!125441 Unit!5752)))

(declare-fun b!190640 () Bool)

(assert (=> b!190640 (= e!125442 (isDefined!189 (getValueByKey!237 (toList!1207 lt!94381) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56015 c!34290) b!190638))

(assert (= (and d!56015 (not c!34290)) b!190639))

(assert (= (and d!56015 (not res!90120)) b!190640))

(declare-fun m!217263 () Bool)

(assert (=> d!56015 m!217263))

(declare-fun m!217265 () Bool)

(assert (=> b!190638 m!217265))

(assert (=> b!190638 m!217259))

(assert (=> b!190638 m!217259))

(declare-fun m!217267 () Bool)

(assert (=> b!190638 m!217267))

(assert (=> b!190640 m!217259))

(assert (=> b!190640 m!217259))

(assert (=> b!190640 m!217267))

(assert (=> bm!19186 d!56015))

(declare-fun b!190659 () Bool)

(declare-fun e!125457 () Bool)

(declare-fun e!125454 () Bool)

(assert (=> b!190659 (= e!125457 e!125454)))

(declare-fun res!90128 () Bool)

(declare-fun lt!94571 () SeekEntryResult!660)

(assert (=> b!190659 (= res!90128 (and ((_ is Intermediate!660) lt!94571) (not (undefined!1472 lt!94571)) (bvslt (x!20462 lt!94571) #b01111111111111111111111111111110) (bvsge (x!20462 lt!94571) #b00000000000000000000000000000000) (bvsge (x!20462 lt!94571) #b00000000000000000000000000000000)))))

(assert (=> b!190659 (=> (not res!90128) (not e!125454))))

(declare-fun b!190660 () Bool)

(declare-fun e!125455 () SeekEntryResult!660)

(declare-fun e!125456 () SeekEntryResult!660)

(assert (=> b!190660 (= e!125455 e!125456)))

(declare-fun c!34297 () Bool)

(declare-fun lt!94572 () (_ BitVec 64))

(assert (=> b!190660 (= c!34297 (or (= lt!94572 key!828) (= (bvadd lt!94572 lt!94572) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190661 () Bool)

(assert (=> b!190661 (= e!125455 (Intermediate!660 true (toIndex!0 key!828 (mask!9078 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!190662 () Bool)

(assert (=> b!190662 (= e!125456 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9078 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9078 thiss!1248)) key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)))))

(declare-fun b!190664 () Bool)

(assert (=> b!190664 (and (bvsge (index!4812 lt!94571) #b00000000000000000000000000000000) (bvslt (index!4812 lt!94571) (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun res!90127 () Bool)

(assert (=> b!190664 (= res!90127 (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4812 lt!94571)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125453 () Bool)

(assert (=> b!190664 (=> res!90127 e!125453)))

(declare-fun b!190665 () Bool)

(assert (=> b!190665 (= e!125457 (bvsge (x!20462 lt!94571) #b01111111111111111111111111111110))))

(declare-fun b!190663 () Bool)

(assert (=> b!190663 (= e!125456 (Intermediate!660 false (toIndex!0 key!828 (mask!9078 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!56017 () Bool)

(assert (=> d!56017 e!125457))

(declare-fun c!34299 () Bool)

(assert (=> d!56017 (= c!34299 (and ((_ is Intermediate!660) lt!94571) (undefined!1472 lt!94571)))))

(assert (=> d!56017 (= lt!94571 e!125455)))

(declare-fun c!34298 () Bool)

(assert (=> d!56017 (= c!34298 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!56017 (= lt!94572 (select (arr!3812 (_keys!5849 thiss!1248)) (toIndex!0 key!828 (mask!9078 thiss!1248))))))

(assert (=> d!56017 (validMask!0 (mask!9078 thiss!1248))))

(assert (=> d!56017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9078 thiss!1248)) key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)) lt!94571)))

(declare-fun b!190666 () Bool)

(assert (=> b!190666 (and (bvsge (index!4812 lt!94571) #b00000000000000000000000000000000) (bvslt (index!4812 lt!94571) (size!4132 (_keys!5849 thiss!1248))))))

(declare-fun res!90129 () Bool)

(assert (=> b!190666 (= res!90129 (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4812 lt!94571)) key!828))))

(assert (=> b!190666 (=> res!90129 e!125453)))

(assert (=> b!190666 (= e!125454 e!125453)))

(declare-fun b!190667 () Bool)

(assert (=> b!190667 (and (bvsge (index!4812 lt!94571) #b00000000000000000000000000000000) (bvslt (index!4812 lt!94571) (size!4132 (_keys!5849 thiss!1248))))))

(assert (=> b!190667 (= e!125453 (= (select (arr!3812 (_keys!5849 thiss!1248)) (index!4812 lt!94571)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56017 c!34298) b!190661))

(assert (= (and d!56017 (not c!34298)) b!190660))

(assert (= (and b!190660 c!34297) b!190663))

(assert (= (and b!190660 (not c!34297)) b!190662))

(assert (= (and d!56017 c!34299) b!190665))

(assert (= (and d!56017 (not c!34299)) b!190659))

(assert (= (and b!190659 res!90128) b!190666))

(assert (= (and b!190666 (not res!90129)) b!190664))

(assert (= (and b!190664 (not res!90127)) b!190667))

(assert (=> d!56017 m!216669))

(declare-fun m!217269 () Bool)

(assert (=> d!56017 m!217269))

(assert (=> d!56017 m!216571))

(declare-fun m!217271 () Bool)

(assert (=> b!190664 m!217271))

(assert (=> b!190662 m!216669))

(declare-fun m!217273 () Bool)

(assert (=> b!190662 m!217273))

(assert (=> b!190662 m!217273))

(declare-fun m!217275 () Bool)

(assert (=> b!190662 m!217275))

(assert (=> b!190666 m!217271))

(assert (=> b!190667 m!217271))

(assert (=> d!55851 d!56017))

(declare-fun d!56019 () Bool)

(declare-fun lt!94578 () (_ BitVec 32))

(declare-fun lt!94577 () (_ BitVec 32))

(assert (=> d!56019 (= lt!94578 (bvmul (bvxor lt!94577 (bvlshr lt!94577 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!56019 (= lt!94577 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!56019 (and (bvsge (mask!9078 thiss!1248) #b00000000000000000000000000000000) (let ((res!90130 (let ((h!3014 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20482 (bvmul (bvxor h!3014 (bvlshr h!3014 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20482 (bvlshr x!20482 #b00000000000000000000000000001101)) (mask!9078 thiss!1248)))))) (and (bvslt res!90130 (bvadd (mask!9078 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!90130 #b00000000000000000000000000000000))))))

(assert (=> d!56019 (= (toIndex!0 key!828 (mask!9078 thiss!1248)) (bvand (bvxor lt!94578 (bvlshr lt!94578 #b00000000000000000000000000001101)) (mask!9078 thiss!1248)))))

(assert (=> d!55851 d!56019))

(assert (=> d!55851 d!55859))

(declare-fun mapNonEmpty!7664 () Bool)

(declare-fun mapRes!7664 () Bool)

(declare-fun tp!16844 () Bool)

(declare-fun e!125459 () Bool)

(assert (=> mapNonEmpty!7664 (= mapRes!7664 (and tp!16844 e!125459))))

(declare-fun mapKey!7664 () (_ BitVec 32))

(declare-fun mapRest!7664 () (Array (_ BitVec 32) ValueCell!1874))

(declare-fun mapValue!7664 () ValueCell!1874)

(assert (=> mapNonEmpty!7664 (= mapRest!7663 (store mapRest!7664 mapKey!7664 mapValue!7664))))

(declare-fun b!190669 () Bool)

(declare-fun e!125458 () Bool)

(assert (=> b!190669 (= e!125458 tp_is_empty!4435)))

(declare-fun b!190668 () Bool)

(assert (=> b!190668 (= e!125459 tp_is_empty!4435)))

(declare-fun mapIsEmpty!7664 () Bool)

(assert (=> mapIsEmpty!7664 mapRes!7664))

(declare-fun condMapEmpty!7664 () Bool)

(declare-fun mapDefault!7664 () ValueCell!1874)

(assert (=> mapNonEmpty!7663 (= condMapEmpty!7664 (= mapRest!7663 ((as const (Array (_ BitVec 32) ValueCell!1874)) mapDefault!7664)))))

(assert (=> mapNonEmpty!7663 (= tp!16843 (and e!125458 mapRes!7664))))

(assert (= (and mapNonEmpty!7663 condMapEmpty!7664) mapIsEmpty!7664))

(assert (= (and mapNonEmpty!7663 (not condMapEmpty!7664)) mapNonEmpty!7664))

(assert (= (and mapNonEmpty!7664 ((_ is ValueCellFull!1874) mapValue!7664)) b!190668))

(assert (= (and mapNonEmpty!7663 ((_ is ValueCellFull!1874) mapDefault!7664)) b!190669))

(declare-fun m!217277 () Bool)

(assert (=> mapNonEmpty!7664 m!217277))

(declare-fun b_lambda!7381 () Bool)

(assert (= b_lambda!7379 (or (and b!190110 b_free!4663) b_lambda!7381)))

(declare-fun b_lambda!7383 () Bool)

(assert (= b_lambda!7373 (or (and b!190110 b_free!4663) b_lambda!7383)))

(declare-fun b_lambda!7385 () Bool)

(assert (= b_lambda!7375 (or (and b!190110 b_free!4663) b_lambda!7385)))

(declare-fun b_lambda!7387 () Bool)

(assert (= b_lambda!7377 (or (and b!190110 b_free!4663) b_lambda!7387)))

(check-sat (not b!190626) (not d!55919) (not d!56015) (not d!55871) (not d!55909) (not b!190543) (not b!190433) (not bm!19214) tp_is_empty!4435 (not bm!19198) (not b!190397) (not b!190536) (not b!190584) (not d!56001) (not d!55979) (not d!55971) (not d!55927) (not b!190395) (not b!190568) (not b!190635) (not b!190359) (not b!190630) (not b!190628) (not b!190637) (not b!190567) (not b_lambda!7383) (not d!55981) (not b!190489) (not b!190608) (not b!190365) (not d!55973) (not b!190569) (not b!190346) (not d!55963) (not b!190431) (not b!190624) (not b!190348) (not d!55901) (not b!190483) (not d!56017) (not b!190497) (not d!55987) (not b!190494) (not b!190495) (not b!190553) (not d!55891) (not bm!19211) (not b_lambda!7369) (not d!56005) b_and!11339 (not b!190599) (not b!190366) (not bm!19206) (not d!55941) (not b!190620) (not b!190426) (not b!190398) (not b!190484) (not d!55899) (not d!55983) (not b_lambda!7371) (not d!55887) (not b!190629) (not d!55957) (not d!55881) (not b!190634) (not b!190602) (not d!56013) (not b!190586) (not d!56009) (not b!190490) (not b_lambda!7381) (not b!190432) (not d!55997) (not d!55877) (not d!55889) (not d!55989) (not bm!19208) (not b!190500) (not b!190554) (not b!190609) (not d!55913) (not d!55985) (not d!55903) (not b!190394) (not b!190580) (not d!55875) (not d!55959) (not b!190521) (not b!190662) (not b!190472) (not bm!19207) (not b!190478) (not b!190595) (not b!190482) (not d!55911) (not b!190619) (not b!190538) (not b_lambda!7387) (not d!55951) (not b!190537) (not d!55975) (not d!55897) (not b!190627) (not mapNonEmpty!7664) (not d!55879) (not b!190435) (not b!190640) (not b!190470) (not b_lambda!7385) (not b!190463) (not b!190491) (not d!55921) (not b!190488) (not b!190434) (not d!55907) (not b!190633) (not d!55929) (not b!190540) (not d!55935) (not d!55991) (not bm!19217) (not b!190607) (not d!56003) (not b!190427) (not b!190492) (not d!55961) (not d!55915) (not d!55969) (not b!190606) (not b!190600) (not d!56011) (not d!55965) (not b!190496) (not d!55955) (not d!55931) (not b!190487) (not d!55917) (not b_next!4663) (not d!55905) (not b!190632) (not d!55977) (not b!190501) (not b!190486) (not bm!19201) (not b!190437) (not d!55939) (not b!190428) (not d!55995) (not b!190469) (not d!55923) (not b!190477) (not b!190390) (not b!190589) (not d!55883) (not b!190462) (not d!55925) (not b!190506) (not b!190605) (not b!190430) (not b!190531) (not d!55967) (not b!190604) (not d!55895) (not b!190638) (not b!190598))
(check-sat b_and!11339 (not b_next!4663))
