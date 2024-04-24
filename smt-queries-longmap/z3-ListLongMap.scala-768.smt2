; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18080 () Bool)

(assert start!18080)

(declare-fun b!180080 () Bool)

(declare-fun b_free!4447 () Bool)

(declare-fun b_next!4447 () Bool)

(assert (=> b!180080 (= b_free!4447 (not b_next!4447))))

(declare-fun tp!16072 () Bool)

(declare-fun b_and!10995 () Bool)

(assert (=> b!180080 (= tp!16072 b_and!10995)))

(declare-fun b!180070 () Bool)

(declare-fun e!118595 () Bool)

(declare-fun tp_is_empty!4219 () Bool)

(assert (=> b!180070 (= e!118595 tp_is_empty!4219)))

(declare-fun b!180071 () Bool)

(declare-fun e!118596 () Bool)

(declare-fun e!118602 () Bool)

(assert (=> b!180071 (= e!118596 e!118602)))

(declare-fun c!32262 () Bool)

(declare-datatypes ((V!5273 0))(
  ( (V!5274 (val!2154 Int)) )
))
(declare-datatypes ((ValueCell!1766 0))(
  ( (ValueCellFull!1766 (v!4044 V!5273)) (EmptyCell!1766) )
))
(declare-datatypes ((array!7593 0))(
  ( (array!7594 (arr!3596 (Array (_ BitVec 32) (_ BitVec 64))) (size!3904 (_ BitVec 32))) )
))
(declare-datatypes ((array!7595 0))(
  ( (array!7596 (arr!3597 (Array (_ BitVec 32) ValueCell!1766)) (size!3905 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2440 0))(
  ( (LongMapFixedSize!2441 (defaultEntry!3696 Int) (mask!8691 (_ BitVec 32)) (extraKeys!3433 (_ BitVec 32)) (zeroValue!3537 V!5273) (minValue!3537 V!5273) (_size!1269 (_ BitVec 32)) (_keys!5587 array!7593) (_values!3679 array!7595) (_vacant!1269 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3298 0))(
  ( (tuple2!3299 (_1!1660 Bool) (_2!1660 LongMapFixedSize!2440)) )
))
(declare-fun lt!88939 () tuple2!3298)

(assert (=> b!180071 (= c!32262 (_1!1660 lt!88939))))

(declare-datatypes ((tuple2!3300 0))(
  ( (tuple2!3301 (_1!1661 (_ BitVec 64)) (_2!1661 V!5273)) )
))
(declare-datatypes ((List!2259 0))(
  ( (Nil!2256) (Cons!2255 (h!2880 tuple2!3300) (t!7099 List!2259)) )
))
(declare-datatypes ((ListLongMap!2231 0))(
  ( (ListLongMap!2232 (toList!1131 List!2259)) )
))
(declare-fun lt!88938 () ListLongMap!2231)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!5273)

(declare-fun e!118601 () Bool)

(declare-fun b!180072 () Bool)

(declare-fun call!18169 () ListLongMap!2231)

(declare-fun +!266 (ListLongMap!2231 tuple2!3300) ListLongMap!2231)

(assert (=> b!180072 (= e!118601 (not (= lt!88938 (+!266 call!18169 (tuple2!3301 key!828 v!309)))))))

(declare-fun mapNonEmpty!7222 () Bool)

(declare-fun mapRes!7222 () Bool)

(declare-fun tp!16071 () Bool)

(declare-fun e!118600 () Bool)

(assert (=> mapNonEmpty!7222 (= mapRes!7222 (and tp!16071 e!118600))))

(declare-fun mapKey!7222 () (_ BitVec 32))

(declare-fun mapRest!7222 () (Array (_ BitVec 32) ValueCell!1766))

(declare-fun mapValue!7222 () ValueCell!1766)

(declare-fun thiss!1248 () LongMapFixedSize!2440)

(assert (=> mapNonEmpty!7222 (= (arr!3597 (_values!3679 thiss!1248)) (store mapRest!7222 mapKey!7222 mapValue!7222))))

(declare-fun b!180073 () Bool)

(declare-fun res!85298 () Bool)

(declare-fun e!118599 () Bool)

(assert (=> b!180073 (=> (not res!85298) (not e!118599))))

(assert (=> b!180073 (= res!85298 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7222 () Bool)

(assert (=> mapIsEmpty!7222 mapRes!7222))

(declare-fun b!180074 () Bool)

(declare-fun e!118603 () Bool)

(assert (=> b!180074 (= e!118603 e!118596)))

(declare-fun res!85296 () Bool)

(assert (=> b!180074 (=> res!85296 e!118596)))

(declare-fun valid!1039 (LongMapFixedSize!2440) Bool)

(assert (=> b!180074 (= res!85296 (not (valid!1039 (_2!1660 lt!88939))))))

(declare-datatypes ((SeekEntryResult!582 0))(
  ( (MissingZero!582 (index!4496 (_ BitVec 32))) (Found!582 (index!4497 (_ BitVec 32))) (Intermediate!582 (undefined!1394 Bool) (index!4498 (_ BitVec 32)) (x!19672 (_ BitVec 32))) (Undefined!582) (MissingVacant!582 (index!4499 (_ BitVec 32))) )
))
(declare-fun lt!88937 () SeekEntryResult!582)

(declare-fun updateHelperNewKey!90 (LongMapFixedSize!2440 (_ BitVec 64) V!5273 (_ BitVec 32)) tuple2!3298)

(assert (=> b!180074 (= lt!88939 (updateHelperNewKey!90 thiss!1248 key!828 v!309 (index!4499 lt!88937)))))

(declare-fun bm!18165 () Bool)

(declare-fun map!1924 (LongMapFixedSize!2440) ListLongMap!2231)

(assert (=> bm!18165 (= call!18169 (map!1924 thiss!1248))))

(declare-fun bm!18166 () Bool)

(declare-fun call!18168 () ListLongMap!2231)

(assert (=> bm!18166 (= call!18168 (map!1924 (_2!1660 lt!88939)))))

(declare-fun res!85300 () Bool)

(assert (=> start!18080 (=> (not res!85300) (not e!118599))))

(assert (=> start!18080 (= res!85300 (valid!1039 thiss!1248))))

(assert (=> start!18080 e!118599))

(declare-fun e!118598 () Bool)

(assert (=> start!18080 e!118598))

(assert (=> start!18080 true))

(assert (=> start!18080 tp_is_empty!4219))

(declare-fun b!180075 () Bool)

(assert (=> b!180075 (= e!118602 e!118601)))

(assert (=> b!180075 (= lt!88938 call!18168)))

(declare-fun res!85299 () Bool)

(declare-fun contains!1218 (ListLongMap!2231 (_ BitVec 64)) Bool)

(assert (=> b!180075 (= res!85299 (not (contains!1218 lt!88938 key!828)))))

(assert (=> b!180075 (=> res!85299 e!118601)))

(declare-fun b!180076 () Bool)

(assert (=> b!180076 (= e!118599 e!118603)))

(declare-fun res!85297 () Bool)

(assert (=> b!180076 (=> (not res!85297) (not e!118603))))

(get-info :version)

(assert (=> b!180076 (= res!85297 (and (not ((_ is Undefined!582) lt!88937)) ((_ is MissingVacant!582) lt!88937)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7593 (_ BitVec 32)) SeekEntryResult!582)

(assert (=> b!180076 (= lt!88937 (seekEntryOrOpen!0 key!828 (_keys!5587 thiss!1248) (mask!8691 thiss!1248)))))

(declare-fun b!180077 () Bool)

(declare-fun e!118597 () Bool)

(assert (=> b!180077 (= e!118597 (and e!118595 mapRes!7222))))

(declare-fun condMapEmpty!7222 () Bool)

(declare-fun mapDefault!7222 () ValueCell!1766)

(assert (=> b!180077 (= condMapEmpty!7222 (= (arr!3597 (_values!3679 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1766)) mapDefault!7222)))))

(declare-fun b!180078 () Bool)

(assert (=> b!180078 (= e!118602 (not (= call!18168 call!18169)))))

(declare-fun b!180079 () Bool)

(assert (=> b!180079 (= e!118600 tp_is_empty!4219)))

(declare-fun array_inv!2321 (array!7593) Bool)

(declare-fun array_inv!2322 (array!7595) Bool)

(assert (=> b!180080 (= e!118598 (and tp!16072 tp_is_empty!4219 (array_inv!2321 (_keys!5587 thiss!1248)) (array_inv!2322 (_values!3679 thiss!1248)) e!118597))))

(assert (= (and start!18080 res!85300) b!180073))

(assert (= (and b!180073 res!85298) b!180076))

(assert (= (and b!180076 res!85297) b!180074))

(assert (= (and b!180074 (not res!85296)) b!180071))

(assert (= (and b!180071 c!32262) b!180075))

(assert (= (and b!180071 (not c!32262)) b!180078))

(assert (= (and b!180075 (not res!85299)) b!180072))

(assert (= (or b!180072 b!180078) bm!18165))

(assert (= (or b!180075 b!180078) bm!18166))

(assert (= (and b!180077 condMapEmpty!7222) mapIsEmpty!7222))

(assert (= (and b!180077 (not condMapEmpty!7222)) mapNonEmpty!7222))

(assert (= (and mapNonEmpty!7222 ((_ is ValueCellFull!1766) mapValue!7222)) b!180079))

(assert (= (and b!180077 ((_ is ValueCellFull!1766) mapDefault!7222)) b!180070))

(assert (= b!180080 b!180077))

(assert (= start!18080 b!180080))

(declare-fun m!208267 () Bool)

(assert (=> b!180075 m!208267))

(declare-fun m!208269 () Bool)

(assert (=> b!180080 m!208269))

(declare-fun m!208271 () Bool)

(assert (=> b!180080 m!208271))

(declare-fun m!208273 () Bool)

(assert (=> b!180072 m!208273))

(declare-fun m!208275 () Bool)

(assert (=> start!18080 m!208275))

(declare-fun m!208277 () Bool)

(assert (=> b!180076 m!208277))

(declare-fun m!208279 () Bool)

(assert (=> mapNonEmpty!7222 m!208279))

(declare-fun m!208281 () Bool)

(assert (=> bm!18166 m!208281))

(declare-fun m!208283 () Bool)

(assert (=> b!180074 m!208283))

(declare-fun m!208285 () Bool)

(assert (=> b!180074 m!208285))

(declare-fun m!208287 () Bool)

(assert (=> bm!18165 m!208287))

(check-sat (not b!180072) tp_is_empty!4219 (not bm!18166) (not b!180075) (not b_next!4447) (not b!180074) (not mapNonEmpty!7222) (not bm!18165) (not b!180080) (not start!18080) (not b!180076) b_and!10995)
(check-sat b_and!10995 (not b_next!4447))
(get-model)

(declare-fun d!54263 () Bool)

(declare-fun res!85337 () Bool)

(declare-fun e!118666 () Bool)

(assert (=> d!54263 (=> (not res!85337) (not e!118666))))

(declare-fun simpleValid!163 (LongMapFixedSize!2440) Bool)

(assert (=> d!54263 (= res!85337 (simpleValid!163 (_2!1660 lt!88939)))))

(assert (=> d!54263 (= (valid!1039 (_2!1660 lt!88939)) e!118666)))

(declare-fun b!180153 () Bool)

(declare-fun res!85338 () Bool)

(assert (=> b!180153 (=> (not res!85338) (not e!118666))))

(declare-fun arrayCountValidKeys!0 (array!7593 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180153 (= res!85338 (= (arrayCountValidKeys!0 (_keys!5587 (_2!1660 lt!88939)) #b00000000000000000000000000000000 (size!3904 (_keys!5587 (_2!1660 lt!88939)))) (_size!1269 (_2!1660 lt!88939))))))

(declare-fun b!180154 () Bool)

(declare-fun res!85339 () Bool)

(assert (=> b!180154 (=> (not res!85339) (not e!118666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7593 (_ BitVec 32)) Bool)

(assert (=> b!180154 (= res!85339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5587 (_2!1660 lt!88939)) (mask!8691 (_2!1660 lt!88939))))))

(declare-fun b!180155 () Bool)

(declare-datatypes ((List!2261 0))(
  ( (Nil!2258) (Cons!2257 (h!2882 (_ BitVec 64)) (t!7101 List!2261)) )
))
(declare-fun arrayNoDuplicates!0 (array!7593 (_ BitVec 32) List!2261) Bool)

(assert (=> b!180155 (= e!118666 (arrayNoDuplicates!0 (_keys!5587 (_2!1660 lt!88939)) #b00000000000000000000000000000000 Nil!2258))))

(assert (= (and d!54263 res!85337) b!180153))

(assert (= (and b!180153 res!85338) b!180154))

(assert (= (and b!180154 res!85339) b!180155))

(declare-fun m!208333 () Bool)

(assert (=> d!54263 m!208333))

(declare-fun m!208335 () Bool)

(assert (=> b!180153 m!208335))

(declare-fun m!208337 () Bool)

(assert (=> b!180154 m!208337))

(declare-fun m!208339 () Bool)

(assert (=> b!180155 m!208339))

(assert (=> b!180074 d!54263))

(declare-fun b!180190 () Bool)

(declare-fun e!118686 () Bool)

(declare-fun call!18193 () Bool)

(assert (=> b!180190 (= e!118686 (not call!18193))))

(declare-fun b!180191 () Bool)

(declare-fun res!85362 () Bool)

(declare-fun e!118683 () Bool)

(assert (=> b!180191 (=> (not res!85362) (not e!118683))))

(declare-fun lt!89038 () tuple2!3298)

(assert (=> b!180191 (= res!85362 (contains!1218 (map!1924 (_2!1660 lt!89038)) key!828))))

(declare-fun b!180193 () Bool)

(declare-datatypes ((Unit!5480 0))(
  ( (Unit!5481) )
))
(declare-fun e!118690 () Unit!5480)

(declare-fun lt!89032 () Unit!5480)

(assert (=> b!180193 (= e!118690 lt!89032)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!132 (array!7593 array!7595 (_ BitVec 32) (_ BitVec 32) V!5273 V!5273 (_ BitVec 64) Int) Unit!5480)

(assert (=> b!180193 (= lt!89032 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!132 (_keys!5587 thiss!1248) (_values!3679 thiss!1248) (mask!8691 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) key!828 (defaultEntry!3696 thiss!1248)))))

(declare-fun lt!89044 () SeekEntryResult!582)

(declare-fun call!18190 () SeekEntryResult!582)

(assert (=> b!180193 (= lt!89044 call!18190)))

(declare-fun c!32279 () Bool)

(assert (=> b!180193 (= c!32279 ((_ is MissingZero!582) lt!89044))))

(declare-fun e!118689 () Bool)

(assert (=> b!180193 e!118689))

(declare-fun bm!18187 () Bool)

(declare-fun arrayContainsKey!0 (array!7593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18187 (= call!18193 (arrayContainsKey!0 (_keys!5587 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!180194 () Bool)

(declare-fun e!118684 () Bool)

(assert (=> b!180194 (= e!118684 (not call!18193))))

(declare-fun lt!89036 () SeekEntryResult!582)

(declare-fun b!180195 () Bool)

(declare-fun e!118688 () Bool)

(assert (=> b!180195 (= e!118688 (= (select (arr!3596 (_keys!5587 thiss!1248)) (index!4497 lt!89036)) key!828))))

(declare-fun b!180196 () Bool)

(declare-fun res!85366 () Bool)

(assert (=> b!180196 (= res!85366 (= (select (arr!3596 (_keys!5587 thiss!1248)) (index!4499 lt!89044)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180196 (=> (not res!85366) (not e!118684))))

(declare-fun b!180197 () Bool)

(declare-fun e!118687 () Unit!5480)

(declare-fun Unit!5482 () Unit!5480)

(assert (=> b!180197 (= e!118687 Unit!5482)))

(declare-fun lt!89022 () Unit!5480)

(declare-fun lemmaArrayContainsKeyThenInListMap!50 (array!7593 array!7595 (_ BitVec 32) (_ BitVec 32) V!5273 V!5273 (_ BitVec 64) (_ BitVec 32) Int) Unit!5480)

(assert (=> b!180197 (= lt!89022 (lemmaArrayContainsKeyThenInListMap!50 (_keys!5587 thiss!1248) (_values!3679 thiss!1248) (mask!8691 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) key!828 #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)))))

(declare-fun getCurrentListMap!786 (array!7593 array!7595 (_ BitVec 32) (_ BitVec 32) V!5273 V!5273 (_ BitVec 32) Int) ListLongMap!2231)

(assert (=> b!180197 (contains!1218 (getCurrentListMap!786 (_keys!5587 thiss!1248) (_values!3679 thiss!1248) (mask!8691 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)) key!828)))

(declare-fun lt!89045 () Unit!5480)

(assert (=> b!180197 (= lt!89045 lt!89022)))

(assert (=> b!180197 false))

(declare-fun b!180192 () Bool)

(assert (=> b!180192 (= e!118683 (= (map!1924 (_2!1660 lt!89038)) (+!266 (map!1924 thiss!1248) (tuple2!3301 key!828 v!309))))))

(declare-fun d!54265 () Bool)

(assert (=> d!54265 e!118683))

(declare-fun res!85365 () Bool)

(assert (=> d!54265 (=> (not res!85365) (not e!118683))))

(assert (=> d!54265 (= res!85365 (_1!1660 lt!89038))))

(assert (=> d!54265 (= lt!89038 (tuple2!3299 true (LongMapFixedSize!2441 (defaultEntry!3696 thiss!1248) (mask!8691 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) (bvadd (_size!1269 thiss!1248) #b00000000000000000000000000000001) (array!7594 (store (arr!3596 (_keys!5587 thiss!1248)) (index!4499 lt!88937) key!828) (size!3904 (_keys!5587 thiss!1248))) (array!7596 (store (arr!3597 (_values!3679 thiss!1248)) (index!4499 lt!88937) (ValueCellFull!1766 v!309)) (size!3905 (_values!3679 thiss!1248))) (_vacant!1269 thiss!1248))))))

(declare-fun lt!89043 () Unit!5480)

(declare-fun lt!89024 () Unit!5480)

(assert (=> d!54265 (= lt!89043 lt!89024)))

(declare-fun lt!89035 () array!7595)

(declare-fun lt!89026 () array!7593)

(assert (=> d!54265 (contains!1218 (getCurrentListMap!786 lt!89026 lt!89035 (mask!8691 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)) (select (store (arr!3596 (_keys!5587 thiss!1248)) (index!4499 lt!88937) key!828) (index!4499 lt!88937)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!141 (array!7593 array!7595 (_ BitVec 32) (_ BitVec 32) V!5273 V!5273 (_ BitVec 32) Int) Unit!5480)

(assert (=> d!54265 (= lt!89024 (lemmaValidKeyInArrayIsInListMap!141 lt!89026 lt!89035 (mask!8691 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) (index!4499 lt!88937) (defaultEntry!3696 thiss!1248)))))

(assert (=> d!54265 (= lt!89035 (array!7596 (store (arr!3597 (_values!3679 thiss!1248)) (index!4499 lt!88937) (ValueCellFull!1766 v!309)) (size!3905 (_values!3679 thiss!1248))))))

(assert (=> d!54265 (= lt!89026 (array!7594 (store (arr!3596 (_keys!5587 thiss!1248)) (index!4499 lt!88937) key!828) (size!3904 (_keys!5587 thiss!1248))))))

(declare-fun lt!89029 () Unit!5480)

(declare-fun lt!89040 () Unit!5480)

(assert (=> d!54265 (= lt!89029 lt!89040)))

(declare-fun lt!89042 () array!7593)

(assert (=> d!54265 (= (arrayCountValidKeys!0 lt!89042 (index!4499 lt!88937) (bvadd (index!4499 lt!88937) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!7593 (_ BitVec 32)) Unit!5480)

(assert (=> d!54265 (= lt!89040 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!89042 (index!4499 lt!88937)))))

(assert (=> d!54265 (= lt!89042 (array!7594 (store (arr!3596 (_keys!5587 thiss!1248)) (index!4499 lt!88937) key!828) (size!3904 (_keys!5587 thiss!1248))))))

(declare-fun lt!89031 () Unit!5480)

(declare-fun lt!89018 () Unit!5480)

(assert (=> d!54265 (= lt!89031 lt!89018)))

(declare-fun lt!89028 () array!7593)

(assert (=> d!54265 (arrayContainsKey!0 lt!89028 key!828 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7593 (_ BitVec 64) (_ BitVec 32)) Unit!5480)

(assert (=> d!54265 (= lt!89018 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!89028 key!828 (index!4499 lt!88937)))))

(assert (=> d!54265 (= lt!89028 (array!7594 (store (arr!3596 (_keys!5587 thiss!1248)) (index!4499 lt!88937) key!828) (size!3904 (_keys!5587 thiss!1248))))))

(declare-fun lt!89034 () Unit!5480)

(declare-fun lt!89021 () Unit!5480)

(assert (=> d!54265 (= lt!89034 lt!89021)))

(assert (=> d!54265 (= (+!266 (getCurrentListMap!786 (_keys!5587 thiss!1248) (_values!3679 thiss!1248) (mask!8691 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)) (tuple2!3301 key!828 v!309)) (getCurrentListMap!786 (array!7594 (store (arr!3596 (_keys!5587 thiss!1248)) (index!4499 lt!88937) key!828) (size!3904 (_keys!5587 thiss!1248))) (array!7596 (store (arr!3597 (_values!3679 thiss!1248)) (index!4499 lt!88937) (ValueCellFull!1766 v!309)) (size!3905 (_values!3679 thiss!1248))) (mask!8691 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!50 (array!7593 array!7595 (_ BitVec 32) (_ BitVec 32) V!5273 V!5273 (_ BitVec 32) (_ BitVec 64) V!5273 Int) Unit!5480)

(assert (=> d!54265 (= lt!89021 (lemmaAddValidKeyToArrayThenAddPairToListMap!50 (_keys!5587 thiss!1248) (_values!3679 thiss!1248) (mask!8691 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) (index!4499 lt!88937) key!828 v!309 (defaultEntry!3696 thiss!1248)))))

(declare-fun lt!89037 () Unit!5480)

(declare-fun lt!89033 () Unit!5480)

(assert (=> d!54265 (= lt!89037 lt!89033)))

(assert (=> d!54265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!7594 (store (arr!3596 (_keys!5587 thiss!1248)) (index!4499 lt!88937) key!828) (size!3904 (_keys!5587 thiss!1248))) (mask!8691 thiss!1248))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!7593 (_ BitVec 32) (_ BitVec 32)) Unit!5480)

(assert (=> d!54265 (= lt!89033 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!828 (_keys!5587 thiss!1248) (index!4499 lt!88937) (mask!8691 thiss!1248)))))

(declare-fun lt!89020 () Unit!5480)

(declare-fun lt!89041 () Unit!5480)

(assert (=> d!54265 (= lt!89020 lt!89041)))

(assert (=> d!54265 (= (arrayCountValidKeys!0 (array!7594 (store (arr!3596 (_keys!5587 thiss!1248)) (index!4499 lt!88937) key!828) (size!3904 (_keys!5587 thiss!1248))) #b00000000000000000000000000000000 (size!3904 (_keys!5587 thiss!1248))) (bvadd (arrayCountValidKeys!0 (_keys!5587 thiss!1248) #b00000000000000000000000000000000 (size!3904 (_keys!5587 thiss!1248))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!7593 (_ BitVec 32) (_ BitVec 64)) Unit!5480)

(assert (=> d!54265 (= lt!89041 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!5587 thiss!1248) (index!4499 lt!88937) key!828))))

(declare-fun lt!89025 () Unit!5480)

(declare-fun lt!89023 () Unit!5480)

(assert (=> d!54265 (= lt!89025 lt!89023)))

(declare-fun lt!89046 () List!2261)

(declare-fun lt!89027 () (_ BitVec 32))

(assert (=> d!54265 (arrayNoDuplicates!0 (array!7594 (store (arr!3596 (_keys!5587 thiss!1248)) (index!4499 lt!88937) key!828) (size!3904 (_keys!5587 thiss!1248))) lt!89027 lt!89046)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!7593 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!2261) Unit!5480)

(assert (=> d!54265 (= lt!89023 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!5587 thiss!1248) key!828 (index!4499 lt!88937) lt!89027 lt!89046))))

(assert (=> d!54265 (= lt!89046 Nil!2258)))

(assert (=> d!54265 (= lt!89027 #b00000000000000000000000000000000)))

(declare-fun lt!89030 () Unit!5480)

(assert (=> d!54265 (= lt!89030 e!118687)))

(declare-fun c!32280 () Bool)

(assert (=> d!54265 (= c!32280 (arrayContainsKey!0 (_keys!5587 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun lt!89047 () Unit!5480)

(assert (=> d!54265 (= lt!89047 e!118690)))

(declare-fun c!32277 () Bool)

(assert (=> d!54265 (= c!32277 (contains!1218 (getCurrentListMap!786 (_keys!5587 thiss!1248) (_values!3679 thiss!1248) (mask!8691 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)) key!828))))

(assert (=> d!54265 (valid!1039 thiss!1248)))

(assert (=> d!54265 (= (updateHelperNewKey!90 thiss!1248 key!828 v!309 (index!4499 lt!88937)) lt!89038)))

(declare-fun b!180198 () Bool)

(declare-fun e!118685 () Bool)

(assert (=> b!180198 (= e!118685 ((_ is Undefined!582) lt!89044))))

(declare-fun b!180199 () Bool)

(declare-fun res!85364 () Bool)

(assert (=> b!180199 (=> (not res!85364) (not e!118686))))

(assert (=> b!180199 (= res!85364 (= (select (arr!3596 (_keys!5587 thiss!1248)) (index!4496 lt!89044)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!18191 () Bool)

(declare-fun bm!18188 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!18188 (= call!18191 (inRange!0 (ite c!32277 (index!4497 lt!89036) (ite c!32279 (index!4496 lt!89044) (index!4499 lt!89044))) (mask!8691 thiss!1248)))))

(declare-fun b!180200 () Bool)

(declare-fun c!32278 () Bool)

(assert (=> b!180200 (= c!32278 ((_ is MissingVacant!582) lt!89044))))

(assert (=> b!180200 (= e!118689 e!118685)))

(declare-fun b!180201 () Bool)

(declare-fun res!85361 () Bool)

(assert (=> b!180201 (= res!85361 call!18191)))

(assert (=> b!180201 (=> (not res!85361) (not e!118688))))

(declare-fun b!180202 () Bool)

(declare-fun res!85358 () Bool)

(assert (=> b!180202 (=> (not res!85358) (not e!118683))))

(assert (=> b!180202 (= res!85358 (valid!1039 (_2!1660 lt!89038)))))

(declare-fun b!180203 () Bool)

(declare-fun Unit!5483 () Unit!5480)

(assert (=> b!180203 (= e!118690 Unit!5483)))

(declare-fun lt!89019 () Unit!5480)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!143 (array!7593 array!7595 (_ BitVec 32) (_ BitVec 32) V!5273 V!5273 (_ BitVec 64) Int) Unit!5480)

(assert (=> b!180203 (= lt!89019 (lemmaInListMapThenSeekEntryOrOpenFindsIt!143 (_keys!5587 thiss!1248) (_values!3679 thiss!1248) (mask!8691 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) key!828 (defaultEntry!3696 thiss!1248)))))

(assert (=> b!180203 (= lt!89036 call!18190)))

(declare-fun res!85363 () Bool)

(assert (=> b!180203 (= res!85363 ((_ is Found!582) lt!89036))))

(assert (=> b!180203 (=> (not res!85363) (not e!118688))))

(assert (=> b!180203 e!118688))

(declare-fun lt!89039 () Unit!5480)

(assert (=> b!180203 (= lt!89039 lt!89019)))

(assert (=> b!180203 false))

(declare-fun b!180204 () Bool)

(declare-fun res!85360 () Bool)

(assert (=> b!180204 (=> (not res!85360) (not e!118686))))

(declare-fun call!18192 () Bool)

(assert (=> b!180204 (= res!85360 call!18192)))

(assert (=> b!180204 (= e!118689 e!118686)))

(declare-fun b!180205 () Bool)

(declare-fun Unit!5484 () Unit!5480)

(assert (=> b!180205 (= e!118687 Unit!5484)))

(declare-fun b!180206 () Bool)

(assert (=> b!180206 (= e!118685 e!118684)))

(declare-fun res!85359 () Bool)

(assert (=> b!180206 (= res!85359 call!18192)))

(assert (=> b!180206 (=> (not res!85359) (not e!118684))))

(declare-fun bm!18189 () Bool)

(assert (=> bm!18189 (= call!18192 call!18191)))

(declare-fun bm!18190 () Bool)

(assert (=> bm!18190 (= call!18190 (seekEntryOrOpen!0 key!828 (_keys!5587 thiss!1248) (mask!8691 thiss!1248)))))

(assert (= (and d!54265 c!32277) b!180203))

(assert (= (and d!54265 (not c!32277)) b!180193))

(assert (= (and b!180203 res!85363) b!180201))

(assert (= (and b!180201 res!85361) b!180195))

(assert (= (and b!180193 c!32279) b!180204))

(assert (= (and b!180193 (not c!32279)) b!180200))

(assert (= (and b!180204 res!85360) b!180199))

(assert (= (and b!180199 res!85364) b!180190))

(assert (= (and b!180200 c!32278) b!180206))

(assert (= (and b!180200 (not c!32278)) b!180198))

(assert (= (and b!180206 res!85359) b!180196))

(assert (= (and b!180196 res!85366) b!180194))

(assert (= (or b!180204 b!180206) bm!18189))

(assert (= (or b!180190 b!180194) bm!18187))

(assert (= (or b!180201 bm!18189) bm!18188))

(assert (= (or b!180203 b!180193) bm!18190))

(assert (= (and d!54265 c!32280) b!180197))

(assert (= (and d!54265 (not c!32280)) b!180205))

(assert (= (and d!54265 res!85365) b!180202))

(assert (= (and b!180202 res!85358) b!180191))

(assert (= (and b!180191 res!85362) b!180192))

(assert (=> bm!18190 m!208277))

(declare-fun m!208341 () Bool)

(assert (=> b!180191 m!208341))

(assert (=> b!180191 m!208341))

(declare-fun m!208343 () Bool)

(assert (=> b!180191 m!208343))

(declare-fun m!208345 () Bool)

(assert (=> b!180197 m!208345))

(declare-fun m!208347 () Bool)

(assert (=> b!180197 m!208347))

(assert (=> b!180197 m!208347))

(declare-fun m!208349 () Bool)

(assert (=> b!180197 m!208349))

(declare-fun m!208351 () Bool)

(assert (=> bm!18188 m!208351))

(declare-fun m!208353 () Bool)

(assert (=> bm!18187 m!208353))

(declare-fun m!208355 () Bool)

(assert (=> b!180195 m!208355))

(declare-fun m!208357 () Bool)

(assert (=> b!180196 m!208357))

(declare-fun m!208359 () Bool)

(assert (=> b!180203 m!208359))

(declare-fun m!208361 () Bool)

(assert (=> b!180199 m!208361))

(declare-fun m!208363 () Bool)

(assert (=> b!180193 m!208363))

(assert (=> b!180192 m!208341))

(assert (=> b!180192 m!208287))

(assert (=> b!180192 m!208287))

(declare-fun m!208365 () Bool)

(assert (=> b!180192 m!208365))

(declare-fun m!208367 () Bool)

(assert (=> d!54265 m!208367))

(assert (=> d!54265 m!208347))

(assert (=> d!54265 m!208349))

(declare-fun m!208369 () Bool)

(assert (=> d!54265 m!208369))

(declare-fun m!208371 () Bool)

(assert (=> d!54265 m!208371))

(declare-fun m!208373 () Bool)

(assert (=> d!54265 m!208373))

(assert (=> d!54265 m!208347))

(declare-fun m!208375 () Bool)

(assert (=> d!54265 m!208375))

(assert (=> d!54265 m!208347))

(declare-fun m!208377 () Bool)

(assert (=> d!54265 m!208377))

(declare-fun m!208379 () Bool)

(assert (=> d!54265 m!208379))

(declare-fun m!208381 () Bool)

(assert (=> d!54265 m!208381))

(declare-fun m!208383 () Bool)

(assert (=> d!54265 m!208383))

(declare-fun m!208385 () Bool)

(assert (=> d!54265 m!208385))

(assert (=> d!54265 m!208353))

(declare-fun m!208387 () Bool)

(assert (=> d!54265 m!208387))

(declare-fun m!208389 () Bool)

(assert (=> d!54265 m!208389))

(declare-fun m!208391 () Bool)

(assert (=> d!54265 m!208391))

(declare-fun m!208393 () Bool)

(assert (=> d!54265 m!208393))

(declare-fun m!208395 () Bool)

(assert (=> d!54265 m!208395))

(declare-fun m!208397 () Bool)

(assert (=> d!54265 m!208397))

(declare-fun m!208399 () Bool)

(assert (=> d!54265 m!208399))

(assert (=> d!54265 m!208399))

(assert (=> d!54265 m!208381))

(declare-fun m!208401 () Bool)

(assert (=> d!54265 m!208401))

(assert (=> d!54265 m!208275))

(declare-fun m!208403 () Bool)

(assert (=> d!54265 m!208403))

(declare-fun m!208405 () Bool)

(assert (=> d!54265 m!208405))

(declare-fun m!208407 () Bool)

(assert (=> b!180202 m!208407))

(assert (=> b!180074 d!54265))

(declare-fun d!54267 () Bool)

(assert (=> d!54267 (= (map!1924 (_2!1660 lt!88939)) (getCurrentListMap!786 (_keys!5587 (_2!1660 lt!88939)) (_values!3679 (_2!1660 lt!88939)) (mask!8691 (_2!1660 lt!88939)) (extraKeys!3433 (_2!1660 lt!88939)) (zeroValue!3537 (_2!1660 lt!88939)) (minValue!3537 (_2!1660 lt!88939)) #b00000000000000000000000000000000 (defaultEntry!3696 (_2!1660 lt!88939))))))

(declare-fun bs!7386 () Bool)

(assert (= bs!7386 d!54267))

(declare-fun m!208409 () Bool)

(assert (=> bs!7386 m!208409))

(assert (=> bm!18166 d!54267))

(declare-fun d!54269 () Bool)

(declare-fun res!85367 () Bool)

(declare-fun e!118691 () Bool)

(assert (=> d!54269 (=> (not res!85367) (not e!118691))))

(assert (=> d!54269 (= res!85367 (simpleValid!163 thiss!1248))))

(assert (=> d!54269 (= (valid!1039 thiss!1248) e!118691)))

(declare-fun b!180207 () Bool)

(declare-fun res!85368 () Bool)

(assert (=> b!180207 (=> (not res!85368) (not e!118691))))

(assert (=> b!180207 (= res!85368 (= (arrayCountValidKeys!0 (_keys!5587 thiss!1248) #b00000000000000000000000000000000 (size!3904 (_keys!5587 thiss!1248))) (_size!1269 thiss!1248)))))

(declare-fun b!180208 () Bool)

(declare-fun res!85369 () Bool)

(assert (=> b!180208 (=> (not res!85369) (not e!118691))))

(assert (=> b!180208 (= res!85369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5587 thiss!1248) (mask!8691 thiss!1248)))))

(declare-fun b!180209 () Bool)

(assert (=> b!180209 (= e!118691 (arrayNoDuplicates!0 (_keys!5587 thiss!1248) #b00000000000000000000000000000000 Nil!2258))))

(assert (= (and d!54269 res!85367) b!180207))

(assert (= (and b!180207 res!85368) b!180208))

(assert (= (and b!180208 res!85369) b!180209))

(declare-fun m!208411 () Bool)

(assert (=> d!54269 m!208411))

(assert (=> b!180207 m!208391))

(declare-fun m!208413 () Bool)

(assert (=> b!180208 m!208413))

(declare-fun m!208415 () Bool)

(assert (=> b!180209 m!208415))

(assert (=> start!18080 d!54269))

(declare-fun d!54271 () Bool)

(declare-fun e!118694 () Bool)

(assert (=> d!54271 e!118694))

(declare-fun res!85375 () Bool)

(assert (=> d!54271 (=> (not res!85375) (not e!118694))))

(declare-fun lt!89058 () ListLongMap!2231)

(assert (=> d!54271 (= res!85375 (contains!1218 lt!89058 (_1!1661 (tuple2!3301 key!828 v!309))))))

(declare-fun lt!89057 () List!2259)

(assert (=> d!54271 (= lt!89058 (ListLongMap!2232 lt!89057))))

(declare-fun lt!89056 () Unit!5480)

(declare-fun lt!89059 () Unit!5480)

(assert (=> d!54271 (= lt!89056 lt!89059)))

(declare-datatypes ((Option!211 0))(
  ( (Some!210 (v!4048 V!5273)) (None!209) )
))
(declare-fun getValueByKey!205 (List!2259 (_ BitVec 64)) Option!211)

(assert (=> d!54271 (= (getValueByKey!205 lt!89057 (_1!1661 (tuple2!3301 key!828 v!309))) (Some!210 (_2!1661 (tuple2!3301 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!108 (List!2259 (_ BitVec 64) V!5273) Unit!5480)

(assert (=> d!54271 (= lt!89059 (lemmaContainsTupThenGetReturnValue!108 lt!89057 (_1!1661 (tuple2!3301 key!828 v!309)) (_2!1661 (tuple2!3301 key!828 v!309))))))

(declare-fun insertStrictlySorted!111 (List!2259 (_ BitVec 64) V!5273) List!2259)

(assert (=> d!54271 (= lt!89057 (insertStrictlySorted!111 (toList!1131 call!18169) (_1!1661 (tuple2!3301 key!828 v!309)) (_2!1661 (tuple2!3301 key!828 v!309))))))

(assert (=> d!54271 (= (+!266 call!18169 (tuple2!3301 key!828 v!309)) lt!89058)))

(declare-fun b!180214 () Bool)

(declare-fun res!85374 () Bool)

(assert (=> b!180214 (=> (not res!85374) (not e!118694))))

(assert (=> b!180214 (= res!85374 (= (getValueByKey!205 (toList!1131 lt!89058) (_1!1661 (tuple2!3301 key!828 v!309))) (Some!210 (_2!1661 (tuple2!3301 key!828 v!309)))))))

(declare-fun b!180215 () Bool)

(declare-fun contains!1220 (List!2259 tuple2!3300) Bool)

(assert (=> b!180215 (= e!118694 (contains!1220 (toList!1131 lt!89058) (tuple2!3301 key!828 v!309)))))

(assert (= (and d!54271 res!85375) b!180214))

(assert (= (and b!180214 res!85374) b!180215))

(declare-fun m!208417 () Bool)

(assert (=> d!54271 m!208417))

(declare-fun m!208419 () Bool)

(assert (=> d!54271 m!208419))

(declare-fun m!208421 () Bool)

(assert (=> d!54271 m!208421))

(declare-fun m!208423 () Bool)

(assert (=> d!54271 m!208423))

(declare-fun m!208425 () Bool)

(assert (=> b!180214 m!208425))

(declare-fun m!208427 () Bool)

(assert (=> b!180215 m!208427))

(assert (=> b!180072 d!54271))

(declare-fun d!54273 () Bool)

(assert (=> d!54273 (= (map!1924 thiss!1248) (getCurrentListMap!786 (_keys!5587 thiss!1248) (_values!3679 thiss!1248) (mask!8691 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)))))

(declare-fun bs!7387 () Bool)

(assert (= bs!7387 d!54273))

(assert (=> bs!7387 m!208347))

(assert (=> bm!18165 d!54273))

(declare-fun d!54275 () Bool)

(declare-fun e!118700 () Bool)

(assert (=> d!54275 e!118700))

(declare-fun res!85378 () Bool)

(assert (=> d!54275 (=> res!85378 e!118700)))

(declare-fun lt!89068 () Bool)

(assert (=> d!54275 (= res!85378 (not lt!89068))))

(declare-fun lt!89070 () Bool)

(assert (=> d!54275 (= lt!89068 lt!89070)))

(declare-fun lt!89071 () Unit!5480)

(declare-fun e!118699 () Unit!5480)

(assert (=> d!54275 (= lt!89071 e!118699)))

(declare-fun c!32283 () Bool)

(assert (=> d!54275 (= c!32283 lt!89070)))

(declare-fun containsKey!208 (List!2259 (_ BitVec 64)) Bool)

(assert (=> d!54275 (= lt!89070 (containsKey!208 (toList!1131 lt!88938) key!828))))

(assert (=> d!54275 (= (contains!1218 lt!88938 key!828) lt!89068)))

(declare-fun b!180222 () Bool)

(declare-fun lt!89069 () Unit!5480)

(assert (=> b!180222 (= e!118699 lt!89069)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!156 (List!2259 (_ BitVec 64)) Unit!5480)

(assert (=> b!180222 (= lt!89069 (lemmaContainsKeyImpliesGetValueByKeyDefined!156 (toList!1131 lt!88938) key!828))))

(declare-fun isDefined!157 (Option!211) Bool)

(assert (=> b!180222 (isDefined!157 (getValueByKey!205 (toList!1131 lt!88938) key!828))))

(declare-fun b!180223 () Bool)

(declare-fun Unit!5485 () Unit!5480)

(assert (=> b!180223 (= e!118699 Unit!5485)))

(declare-fun b!180224 () Bool)

(assert (=> b!180224 (= e!118700 (isDefined!157 (getValueByKey!205 (toList!1131 lt!88938) key!828)))))

(assert (= (and d!54275 c!32283) b!180222))

(assert (= (and d!54275 (not c!32283)) b!180223))

(assert (= (and d!54275 (not res!85378)) b!180224))

(declare-fun m!208429 () Bool)

(assert (=> d!54275 m!208429))

(declare-fun m!208431 () Bool)

(assert (=> b!180222 m!208431))

(declare-fun m!208433 () Bool)

(assert (=> b!180222 m!208433))

(assert (=> b!180222 m!208433))

(declare-fun m!208435 () Bool)

(assert (=> b!180222 m!208435))

(assert (=> b!180224 m!208433))

(assert (=> b!180224 m!208433))

(assert (=> b!180224 m!208435))

(assert (=> b!180075 d!54275))

(declare-fun d!54277 () Bool)

(assert (=> d!54277 (= (array_inv!2321 (_keys!5587 thiss!1248)) (bvsge (size!3904 (_keys!5587 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180080 d!54277))

(declare-fun d!54279 () Bool)

(assert (=> d!54279 (= (array_inv!2322 (_values!3679 thiss!1248)) (bvsge (size!3905 (_values!3679 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180080 d!54279))

(declare-fun b!180237 () Bool)

(declare-fun e!118707 () SeekEntryResult!582)

(declare-fun lt!89079 () SeekEntryResult!582)

(assert (=> b!180237 (= e!118707 (MissingZero!582 (index!4498 lt!89079)))))

(declare-fun b!180238 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7593 (_ BitVec 32)) SeekEntryResult!582)

(assert (=> b!180238 (= e!118707 (seekKeyOrZeroReturnVacant!0 (x!19672 lt!89079) (index!4498 lt!89079) (index!4498 lt!89079) key!828 (_keys!5587 thiss!1248) (mask!8691 thiss!1248)))))

(declare-fun b!180239 () Bool)

(declare-fun e!118709 () SeekEntryResult!582)

(declare-fun e!118708 () SeekEntryResult!582)

(assert (=> b!180239 (= e!118709 e!118708)))

(declare-fun lt!89078 () (_ BitVec 64))

(assert (=> b!180239 (= lt!89078 (select (arr!3596 (_keys!5587 thiss!1248)) (index!4498 lt!89079)))))

(declare-fun c!32290 () Bool)

(assert (=> b!180239 (= c!32290 (= lt!89078 key!828))))

(declare-fun b!180241 () Bool)

(assert (=> b!180241 (= e!118708 (Found!582 (index!4498 lt!89079)))))

(declare-fun b!180242 () Bool)

(assert (=> b!180242 (= e!118709 Undefined!582)))

(declare-fun d!54281 () Bool)

(declare-fun lt!89080 () SeekEntryResult!582)

(assert (=> d!54281 (and (or ((_ is Undefined!582) lt!89080) (not ((_ is Found!582) lt!89080)) (and (bvsge (index!4497 lt!89080) #b00000000000000000000000000000000) (bvslt (index!4497 lt!89080) (size!3904 (_keys!5587 thiss!1248))))) (or ((_ is Undefined!582) lt!89080) ((_ is Found!582) lt!89080) (not ((_ is MissingZero!582) lt!89080)) (and (bvsge (index!4496 lt!89080) #b00000000000000000000000000000000) (bvslt (index!4496 lt!89080) (size!3904 (_keys!5587 thiss!1248))))) (or ((_ is Undefined!582) lt!89080) ((_ is Found!582) lt!89080) ((_ is MissingZero!582) lt!89080) (not ((_ is MissingVacant!582) lt!89080)) (and (bvsge (index!4499 lt!89080) #b00000000000000000000000000000000) (bvslt (index!4499 lt!89080) (size!3904 (_keys!5587 thiss!1248))))) (or ((_ is Undefined!582) lt!89080) (ite ((_ is Found!582) lt!89080) (= (select (arr!3596 (_keys!5587 thiss!1248)) (index!4497 lt!89080)) key!828) (ite ((_ is MissingZero!582) lt!89080) (= (select (arr!3596 (_keys!5587 thiss!1248)) (index!4496 lt!89080)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!582) lt!89080) (= (select (arr!3596 (_keys!5587 thiss!1248)) (index!4499 lt!89080)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54281 (= lt!89080 e!118709)))

(declare-fun c!32292 () Bool)

(assert (=> d!54281 (= c!32292 (and ((_ is Intermediate!582) lt!89079) (undefined!1394 lt!89079)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7593 (_ BitVec 32)) SeekEntryResult!582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54281 (= lt!89079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8691 thiss!1248)) key!828 (_keys!5587 thiss!1248) (mask!8691 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!54281 (validMask!0 (mask!8691 thiss!1248))))

(assert (=> d!54281 (= (seekEntryOrOpen!0 key!828 (_keys!5587 thiss!1248) (mask!8691 thiss!1248)) lt!89080)))

(declare-fun b!180240 () Bool)

(declare-fun c!32291 () Bool)

(assert (=> b!180240 (= c!32291 (= lt!89078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180240 (= e!118708 e!118707)))

(assert (= (and d!54281 c!32292) b!180242))

(assert (= (and d!54281 (not c!32292)) b!180239))

(assert (= (and b!180239 c!32290) b!180241))

(assert (= (and b!180239 (not c!32290)) b!180240))

(assert (= (and b!180240 c!32291) b!180237))

(assert (= (and b!180240 (not c!32291)) b!180238))

(declare-fun m!208437 () Bool)

(assert (=> b!180238 m!208437))

(declare-fun m!208439 () Bool)

(assert (=> b!180239 m!208439))

(declare-fun m!208441 () Bool)

(assert (=> d!54281 m!208441))

(declare-fun m!208443 () Bool)

(assert (=> d!54281 m!208443))

(declare-fun m!208445 () Bool)

(assert (=> d!54281 m!208445))

(declare-fun m!208447 () Bool)

(assert (=> d!54281 m!208447))

(declare-fun m!208449 () Bool)

(assert (=> d!54281 m!208449))

(declare-fun m!208451 () Bool)

(assert (=> d!54281 m!208451))

(assert (=> d!54281 m!208443))

(assert (=> b!180076 d!54281))

(declare-fun mapNonEmpty!7231 () Bool)

(declare-fun mapRes!7231 () Bool)

(declare-fun tp!16087 () Bool)

(declare-fun e!118714 () Bool)

(assert (=> mapNonEmpty!7231 (= mapRes!7231 (and tp!16087 e!118714))))

(declare-fun mapKey!7231 () (_ BitVec 32))

(declare-fun mapRest!7231 () (Array (_ BitVec 32) ValueCell!1766))

(declare-fun mapValue!7231 () ValueCell!1766)

(assert (=> mapNonEmpty!7231 (= mapRest!7222 (store mapRest!7231 mapKey!7231 mapValue!7231))))

(declare-fun b!180249 () Bool)

(assert (=> b!180249 (= e!118714 tp_is_empty!4219)))

(declare-fun b!180250 () Bool)

(declare-fun e!118715 () Bool)

(assert (=> b!180250 (= e!118715 tp_is_empty!4219)))

(declare-fun mapIsEmpty!7231 () Bool)

(assert (=> mapIsEmpty!7231 mapRes!7231))

(declare-fun condMapEmpty!7231 () Bool)

(declare-fun mapDefault!7231 () ValueCell!1766)

(assert (=> mapNonEmpty!7222 (= condMapEmpty!7231 (= mapRest!7222 ((as const (Array (_ BitVec 32) ValueCell!1766)) mapDefault!7231)))))

(assert (=> mapNonEmpty!7222 (= tp!16071 (and e!118715 mapRes!7231))))

(assert (= (and mapNonEmpty!7222 condMapEmpty!7231) mapIsEmpty!7231))

(assert (= (and mapNonEmpty!7222 (not condMapEmpty!7231)) mapNonEmpty!7231))

(assert (= (and mapNonEmpty!7231 ((_ is ValueCellFull!1766) mapValue!7231)) b!180249))

(assert (= (and mapNonEmpty!7222 ((_ is ValueCellFull!1766) mapDefault!7231)) b!180250))

(declare-fun m!208453 () Bool)

(assert (=> mapNonEmpty!7231 m!208453))

(check-sat (not b!180203) (not d!54267) b_and!10995 (not b!180224) (not d!54265) (not b!180154) (not d!54271) (not b_next!4447) (not b!180191) (not b!180193) (not b!180192) (not b!180208) (not b!180215) (not d!54269) (not b!180155) (not b!180207) (not b!180238) tp_is_empty!4219 (not mapNonEmpty!7231) (not b!180214) (not d!54281) (not d!54275) (not d!54263) (not b!180153) (not b!180209) (not b!180202) (not bm!18188) (not bm!18187) (not d!54273) (not b!180222) (not b!180197) (not bm!18190))
(check-sat b_and!10995 (not b_next!4447))
