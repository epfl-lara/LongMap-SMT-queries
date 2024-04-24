; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19696 () Bool)

(assert start!19696)

(declare-fun b!193033 () Bool)

(declare-fun b_free!4699 () Bool)

(declare-fun b_next!4699 () Bool)

(assert (=> b!193033 (= b_free!4699 (not b_next!4699))))

(declare-fun tp!16958 () Bool)

(declare-fun b_and!11415 () Bool)

(assert (=> b!193033 (= tp!16958 b_and!11415)))

(declare-fun b!193029 () Bool)

(declare-fun e!126997 () Bool)

(declare-datatypes ((V!5609 0))(
  ( (V!5610 (val!2280 Int)) )
))
(declare-datatypes ((ValueCell!1892 0))(
  ( (ValueCellFull!1892 (v!4234 V!5609)) (EmptyCell!1892) )
))
(declare-datatypes ((array!8173 0))(
  ( (array!8174 (arr!3848 (Array (_ BitVec 32) (_ BitVec 64))) (size!4172 (_ BitVec 32))) )
))
(declare-datatypes ((array!8175 0))(
  ( (array!8176 (arr!3849 (Array (_ BitVec 32) ValueCell!1892)) (size!4173 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2692 0))(
  ( (LongMapFixedSize!2693 (defaultEntry!3938 Int) (mask!9183 (_ BitVec 32)) (extraKeys!3675 (_ BitVec 32)) (zeroValue!3779 V!5609) (minValue!3779 V!5609) (_size!1395 (_ BitVec 32)) (_keys!5926 array!8173) (_values!3921 array!8175) (_vacant!1395 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2692)

(declare-datatypes ((List!2396 0))(
  ( (Nil!2393) (Cons!2392 (h!3033 (_ BitVec 64)) (t!7308 List!2396)) )
))
(declare-fun arrayNoDuplicates!0 (array!8173 (_ BitVec 32) List!2396) Bool)

(assert (=> b!193029 (= e!126997 (arrayNoDuplicates!0 (_keys!5926 thiss!1248) #b00000000000000000000000000000000 Nil!2393))))

(declare-fun mapIsEmpty!7730 () Bool)

(declare-fun mapRes!7730 () Bool)

(assert (=> mapIsEmpty!7730 mapRes!7730))

(declare-fun b!193030 () Bool)

(declare-fun e!126998 () Bool)

(assert (=> b!193030 (= e!126998 (not e!126997))))

(declare-fun res!91201 () Bool)

(assert (=> b!193030 (=> res!91201 e!126997)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193030 (= res!91201 (not (validMask!0 (mask!9183 thiss!1248))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!5609)

(declare-datatypes ((SeekEntryResult!674 0))(
  ( (MissingZero!674 (index!4866 (_ BitVec 32))) (Found!674 (index!4867 (_ BitVec 32))) (Intermediate!674 (undefined!1486 Bool) (index!4868 (_ BitVec 32)) (x!20616 (_ BitVec 32))) (Undefined!674) (MissingVacant!674 (index!4869 (_ BitVec 32))) )
))
(declare-fun lt!96081 () SeekEntryResult!674)

(declare-datatypes ((tuple2!3488 0))(
  ( (tuple2!3489 (_1!1755 (_ BitVec 64)) (_2!1755 V!5609)) )
))
(declare-datatypes ((List!2397 0))(
  ( (Nil!2394) (Cons!2393 (h!3034 tuple2!3488) (t!7309 List!2397)) )
))
(declare-datatypes ((ListLongMap!2409 0))(
  ( (ListLongMap!2410 (toList!1220 List!2397)) )
))
(declare-fun lt!96079 () ListLongMap!2409)

(declare-fun +!313 (ListLongMap!2409 tuple2!3488) ListLongMap!2409)

(declare-fun getCurrentListMap!872 (array!8173 array!8175 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 32) Int) ListLongMap!2409)

(assert (=> b!193030 (= (+!313 lt!96079 (tuple2!3489 key!828 v!309)) (getCurrentListMap!872 (_keys!5926 thiss!1248) (array!8176 (store (arr!3849 (_values!3921 thiss!1248)) (index!4867 lt!96081) (ValueCellFull!1892 v!309)) (size!4173 (_values!3921 thiss!1248))) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-datatypes ((Unit!5829 0))(
  ( (Unit!5830) )
))
(declare-fun lt!96082 () Unit!5829)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!117 (array!8173 array!8175 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 32) (_ BitVec 64) V!5609 Int) Unit!5829)

(assert (=> b!193030 (= lt!96082 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!117 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) (index!4867 lt!96081) key!828 v!309 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!96078 () Unit!5829)

(declare-fun e!127004 () Unit!5829)

(assert (=> b!193030 (= lt!96078 e!127004)))

(declare-fun c!34821 () Bool)

(declare-fun contains!1351 (ListLongMap!2409 (_ BitVec 64)) Bool)

(assert (=> b!193030 (= c!34821 (contains!1351 lt!96079 key!828))))

(assert (=> b!193030 (= lt!96079 (getCurrentListMap!872 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun b!193031 () Bool)

(declare-fun e!126999 () Bool)

(assert (=> b!193031 (= e!126999 e!126998)))

(declare-fun res!91202 () Bool)

(assert (=> b!193031 (=> (not res!91202) (not e!126998))))

(get-info :version)

(assert (=> b!193031 (= res!91202 (and (not ((_ is Undefined!674) lt!96081)) (not ((_ is MissingVacant!674) lt!96081)) (not ((_ is MissingZero!674) lt!96081)) ((_ is Found!674) lt!96081)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8173 (_ BitVec 32)) SeekEntryResult!674)

(assert (=> b!193031 (= lt!96081 (seekEntryOrOpen!0 key!828 (_keys!5926 thiss!1248) (mask!9183 thiss!1248)))))

(declare-fun res!91204 () Bool)

(assert (=> start!19696 (=> (not res!91204) (not e!126999))))

(declare-fun valid!1126 (LongMapFixedSize!2692) Bool)

(assert (=> start!19696 (= res!91204 (valid!1126 thiss!1248))))

(assert (=> start!19696 e!126999))

(declare-fun e!127002 () Bool)

(assert (=> start!19696 e!127002))

(assert (=> start!19696 true))

(declare-fun tp_is_empty!4471 () Bool)

(assert (=> start!19696 tp_is_empty!4471))

(declare-fun b!193032 () Bool)

(declare-fun lt!96080 () Unit!5829)

(assert (=> b!193032 (= e!127004 lt!96080)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!178 (array!8173 array!8175 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 64) Int) Unit!5829)

(assert (=> b!193032 (= lt!96080 (lemmaInListMapThenSeekEntryOrOpenFindsIt!178 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)))))

(declare-fun res!91205 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193032 (= res!91205 (inRange!0 (index!4867 lt!96081) (mask!9183 thiss!1248)))))

(declare-fun e!127003 () Bool)

(assert (=> b!193032 (=> (not res!91205) (not e!127003))))

(assert (=> b!193032 e!127003))

(declare-fun e!127001 () Bool)

(declare-fun array_inv!2481 (array!8173) Bool)

(declare-fun array_inv!2482 (array!8175) Bool)

(assert (=> b!193033 (= e!127002 (and tp!16958 tp_is_empty!4471 (array_inv!2481 (_keys!5926 thiss!1248)) (array_inv!2482 (_values!3921 thiss!1248)) e!127001))))

(declare-fun b!193034 () Bool)

(declare-fun Unit!5831 () Unit!5829)

(assert (=> b!193034 (= e!127004 Unit!5831)))

(declare-fun lt!96083 () Unit!5829)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!176 (array!8173 array!8175 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 64) Int) Unit!5829)

(assert (=> b!193034 (= lt!96083 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!176 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)))))

(assert (=> b!193034 false))

(declare-fun b!193035 () Bool)

(declare-fun res!91206 () Bool)

(assert (=> b!193035 (=> res!91206 e!126997)))

(assert (=> b!193035 (= res!91206 (or (not (= (size!4173 (_values!3921 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9183 thiss!1248)))) (not (= (size!4172 (_keys!5926 thiss!1248)) (size!4173 (_values!3921 thiss!1248)))) (bvslt (mask!9183 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3675 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3675 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!193036 () Bool)

(assert (=> b!193036 (= e!127003 (= (select (arr!3848 (_keys!5926 thiss!1248)) (index!4867 lt!96081)) key!828))))

(declare-fun mapNonEmpty!7730 () Bool)

(declare-fun tp!16957 () Bool)

(declare-fun e!127006 () Bool)

(assert (=> mapNonEmpty!7730 (= mapRes!7730 (and tp!16957 e!127006))))

(declare-fun mapKey!7730 () (_ BitVec 32))

(declare-fun mapRest!7730 () (Array (_ BitVec 32) ValueCell!1892))

(declare-fun mapValue!7730 () ValueCell!1892)

(assert (=> mapNonEmpty!7730 (= (arr!3849 (_values!3921 thiss!1248)) (store mapRest!7730 mapKey!7730 mapValue!7730))))

(declare-fun b!193037 () Bool)

(declare-fun res!91203 () Bool)

(assert (=> b!193037 (=> res!91203 e!126997)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8173 (_ BitVec 32)) Bool)

(assert (=> b!193037 (= res!91203 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5926 thiss!1248) (mask!9183 thiss!1248))))))

(declare-fun b!193038 () Bool)

(declare-fun e!127005 () Bool)

(assert (=> b!193038 (= e!127005 tp_is_empty!4471)))

(declare-fun b!193039 () Bool)

(assert (=> b!193039 (= e!127006 tp_is_empty!4471)))

(declare-fun b!193040 () Bool)

(declare-fun res!91207 () Bool)

(assert (=> b!193040 (=> (not res!91207) (not e!126999))))

(assert (=> b!193040 (= res!91207 (not (= key!828 (bvneg key!828))))))

(declare-fun b!193041 () Bool)

(assert (=> b!193041 (= e!127001 (and e!127005 mapRes!7730))))

(declare-fun condMapEmpty!7730 () Bool)

(declare-fun mapDefault!7730 () ValueCell!1892)

(assert (=> b!193041 (= condMapEmpty!7730 (= (arr!3849 (_values!3921 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1892)) mapDefault!7730)))))

(assert (= (and start!19696 res!91204) b!193040))

(assert (= (and b!193040 res!91207) b!193031))

(assert (= (and b!193031 res!91202) b!193030))

(assert (= (and b!193030 c!34821) b!193032))

(assert (= (and b!193030 (not c!34821)) b!193034))

(assert (= (and b!193032 res!91205) b!193036))

(assert (= (and b!193030 (not res!91201)) b!193035))

(assert (= (and b!193035 (not res!91206)) b!193037))

(assert (= (and b!193037 (not res!91203)) b!193029))

(assert (= (and b!193041 condMapEmpty!7730) mapIsEmpty!7730))

(assert (= (and b!193041 (not condMapEmpty!7730)) mapNonEmpty!7730))

(assert (= (and mapNonEmpty!7730 ((_ is ValueCellFull!1892) mapValue!7730)) b!193039))

(assert (= (and b!193041 ((_ is ValueCellFull!1892) mapDefault!7730)) b!193038))

(assert (= b!193033 b!193041))

(assert (= start!19696 b!193033))

(declare-fun m!219991 () Bool)

(assert (=> b!193031 m!219991))

(declare-fun m!219993 () Bool)

(assert (=> b!193029 m!219993))

(declare-fun m!219995 () Bool)

(assert (=> mapNonEmpty!7730 m!219995))

(declare-fun m!219997 () Bool)

(assert (=> b!193030 m!219997))

(declare-fun m!219999 () Bool)

(assert (=> b!193030 m!219999))

(declare-fun m!220001 () Bool)

(assert (=> b!193030 m!220001))

(declare-fun m!220003 () Bool)

(assert (=> b!193030 m!220003))

(declare-fun m!220005 () Bool)

(assert (=> b!193030 m!220005))

(declare-fun m!220007 () Bool)

(assert (=> b!193030 m!220007))

(declare-fun m!220009 () Bool)

(assert (=> b!193030 m!220009))

(declare-fun m!220011 () Bool)

(assert (=> b!193037 m!220011))

(declare-fun m!220013 () Bool)

(assert (=> start!19696 m!220013))

(declare-fun m!220015 () Bool)

(assert (=> b!193036 m!220015))

(declare-fun m!220017 () Bool)

(assert (=> b!193032 m!220017))

(declare-fun m!220019 () Bool)

(assert (=> b!193032 m!220019))

(declare-fun m!220021 () Bool)

(assert (=> b!193033 m!220021))

(declare-fun m!220023 () Bool)

(assert (=> b!193033 m!220023))

(declare-fun m!220025 () Bool)

(assert (=> b!193034 m!220025))

(check-sat (not b!193034) (not mapNonEmpty!7730) (not b_next!4699) (not b!193032) (not b!193031) b_and!11415 (not b!193030) (not b!193029) (not start!19696) tp_is_empty!4471 (not b!193033) (not b!193037))
(check-sat b_and!11415 (not b_next!4699))
(get-model)

(declare-fun d!56615 () Bool)

(assert (=> d!56615 (= (validMask!0 (mask!9183 thiss!1248)) (and (or (= (mask!9183 thiss!1248) #b00000000000000000000000000000111) (= (mask!9183 thiss!1248) #b00000000000000000000000000001111) (= (mask!9183 thiss!1248) #b00000000000000000000000000011111) (= (mask!9183 thiss!1248) #b00000000000000000000000000111111) (= (mask!9183 thiss!1248) #b00000000000000000000000001111111) (= (mask!9183 thiss!1248) #b00000000000000000000000011111111) (= (mask!9183 thiss!1248) #b00000000000000000000000111111111) (= (mask!9183 thiss!1248) #b00000000000000000000001111111111) (= (mask!9183 thiss!1248) #b00000000000000000000011111111111) (= (mask!9183 thiss!1248) #b00000000000000000000111111111111) (= (mask!9183 thiss!1248) #b00000000000000000001111111111111) (= (mask!9183 thiss!1248) #b00000000000000000011111111111111) (= (mask!9183 thiss!1248) #b00000000000000000111111111111111) (= (mask!9183 thiss!1248) #b00000000000000001111111111111111) (= (mask!9183 thiss!1248) #b00000000000000011111111111111111) (= (mask!9183 thiss!1248) #b00000000000000111111111111111111) (= (mask!9183 thiss!1248) #b00000000000001111111111111111111) (= (mask!9183 thiss!1248) #b00000000000011111111111111111111) (= (mask!9183 thiss!1248) #b00000000000111111111111111111111) (= (mask!9183 thiss!1248) #b00000000001111111111111111111111) (= (mask!9183 thiss!1248) #b00000000011111111111111111111111) (= (mask!9183 thiss!1248) #b00000000111111111111111111111111) (= (mask!9183 thiss!1248) #b00000001111111111111111111111111) (= (mask!9183 thiss!1248) #b00000011111111111111111111111111) (= (mask!9183 thiss!1248) #b00000111111111111111111111111111) (= (mask!9183 thiss!1248) #b00001111111111111111111111111111) (= (mask!9183 thiss!1248) #b00011111111111111111111111111111) (= (mask!9183 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9183 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!193030 d!56615))

(declare-fun d!56617 () Bool)

(declare-fun e!127071 () Bool)

(assert (=> d!56617 e!127071))

(declare-fun res!91252 () Bool)

(assert (=> d!56617 (=> res!91252 e!127071)))

(declare-fun lt!96128 () Bool)

(assert (=> d!56617 (= res!91252 (not lt!96128))))

(declare-fun lt!96131 () Bool)

(assert (=> d!56617 (= lt!96128 lt!96131)))

(declare-fun lt!96130 () Unit!5829)

(declare-fun e!127072 () Unit!5829)

(assert (=> d!56617 (= lt!96130 e!127072)))

(declare-fun c!34830 () Bool)

(assert (=> d!56617 (= c!34830 lt!96131)))

(declare-fun containsKey!246 (List!2397 (_ BitVec 64)) Bool)

(assert (=> d!56617 (= lt!96131 (containsKey!246 (toList!1220 lt!96079) key!828))))

(assert (=> d!56617 (= (contains!1351 lt!96079 key!828) lt!96128)))

(declare-fun b!193126 () Bool)

(declare-fun lt!96129 () Unit!5829)

(assert (=> b!193126 (= e!127072 lt!96129)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!194 (List!2397 (_ BitVec 64)) Unit!5829)

(assert (=> b!193126 (= lt!96129 (lemmaContainsKeyImpliesGetValueByKeyDefined!194 (toList!1220 lt!96079) key!828))))

(declare-datatypes ((Option!249 0))(
  ( (Some!248 (v!4239 V!5609)) (None!247) )
))
(declare-fun isDefined!195 (Option!249) Bool)

(declare-fun getValueByKey!243 (List!2397 (_ BitVec 64)) Option!249)

(assert (=> b!193126 (isDefined!195 (getValueByKey!243 (toList!1220 lt!96079) key!828))))

(declare-fun b!193127 () Bool)

(declare-fun Unit!5834 () Unit!5829)

(assert (=> b!193127 (= e!127072 Unit!5834)))

(declare-fun b!193128 () Bool)

(assert (=> b!193128 (= e!127071 (isDefined!195 (getValueByKey!243 (toList!1220 lt!96079) key!828)))))

(assert (= (and d!56617 c!34830) b!193126))

(assert (= (and d!56617 (not c!34830)) b!193127))

(assert (= (and d!56617 (not res!91252)) b!193128))

(declare-fun m!220099 () Bool)

(assert (=> d!56617 m!220099))

(declare-fun m!220101 () Bool)

(assert (=> b!193126 m!220101))

(declare-fun m!220103 () Bool)

(assert (=> b!193126 m!220103))

(assert (=> b!193126 m!220103))

(declare-fun m!220105 () Bool)

(assert (=> b!193126 m!220105))

(assert (=> b!193128 m!220103))

(assert (=> b!193128 m!220103))

(assert (=> b!193128 m!220105))

(assert (=> b!193030 d!56617))

(declare-fun d!56619 () Bool)

(declare-fun e!127075 () Bool)

(assert (=> d!56619 e!127075))

(declare-fun res!91255 () Bool)

(assert (=> d!56619 (=> (not res!91255) (not e!127075))))

(assert (=> d!56619 (= res!91255 (and (bvsge (index!4867 lt!96081) #b00000000000000000000000000000000) (bvslt (index!4867 lt!96081) (size!4173 (_values!3921 thiss!1248)))))))

(declare-fun lt!96134 () Unit!5829)

(declare-fun choose!1061 (array!8173 array!8175 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 32) (_ BitVec 64) V!5609 Int) Unit!5829)

(assert (=> d!56619 (= lt!96134 (choose!1061 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) (index!4867 lt!96081) key!828 v!309 (defaultEntry!3938 thiss!1248)))))

(assert (=> d!56619 (validMask!0 (mask!9183 thiss!1248))))

(assert (=> d!56619 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!117 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) (index!4867 lt!96081) key!828 v!309 (defaultEntry!3938 thiss!1248)) lt!96134)))

(declare-fun b!193131 () Bool)

(assert (=> b!193131 (= e!127075 (= (+!313 (getCurrentListMap!872 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)) (tuple2!3489 key!828 v!309)) (getCurrentListMap!872 (_keys!5926 thiss!1248) (array!8176 (store (arr!3849 (_values!3921 thiss!1248)) (index!4867 lt!96081) (ValueCellFull!1892 v!309)) (size!4173 (_values!3921 thiss!1248))) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248))))))

(assert (= (and d!56619 res!91255) b!193131))

(declare-fun m!220107 () Bool)

(assert (=> d!56619 m!220107))

(assert (=> d!56619 m!220007))

(assert (=> b!193131 m!220001))

(assert (=> b!193131 m!220001))

(declare-fun m!220109 () Bool)

(assert (=> b!193131 m!220109))

(assert (=> b!193131 m!219997))

(assert (=> b!193131 m!219999))

(assert (=> b!193030 d!56619))

(declare-fun d!56621 () Bool)

(declare-fun e!127078 () Bool)

(assert (=> d!56621 e!127078))

(declare-fun res!91261 () Bool)

(assert (=> d!56621 (=> (not res!91261) (not e!127078))))

(declare-fun lt!96145 () ListLongMap!2409)

(assert (=> d!56621 (= res!91261 (contains!1351 lt!96145 (_1!1755 (tuple2!3489 key!828 v!309))))))

(declare-fun lt!96146 () List!2397)

(assert (=> d!56621 (= lt!96145 (ListLongMap!2410 lt!96146))))

(declare-fun lt!96144 () Unit!5829)

(declare-fun lt!96143 () Unit!5829)

(assert (=> d!56621 (= lt!96144 lt!96143)))

(assert (=> d!56621 (= (getValueByKey!243 lt!96146 (_1!1755 (tuple2!3489 key!828 v!309))) (Some!248 (_2!1755 (tuple2!3489 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!130 (List!2397 (_ BitVec 64) V!5609) Unit!5829)

(assert (=> d!56621 (= lt!96143 (lemmaContainsTupThenGetReturnValue!130 lt!96146 (_1!1755 (tuple2!3489 key!828 v!309)) (_2!1755 (tuple2!3489 key!828 v!309))))))

(declare-fun insertStrictlySorted!133 (List!2397 (_ BitVec 64) V!5609) List!2397)

(assert (=> d!56621 (= lt!96146 (insertStrictlySorted!133 (toList!1220 lt!96079) (_1!1755 (tuple2!3489 key!828 v!309)) (_2!1755 (tuple2!3489 key!828 v!309))))))

(assert (=> d!56621 (= (+!313 lt!96079 (tuple2!3489 key!828 v!309)) lt!96145)))

(declare-fun b!193136 () Bool)

(declare-fun res!91260 () Bool)

(assert (=> b!193136 (=> (not res!91260) (not e!127078))))

(assert (=> b!193136 (= res!91260 (= (getValueByKey!243 (toList!1220 lt!96145) (_1!1755 (tuple2!3489 key!828 v!309))) (Some!248 (_2!1755 (tuple2!3489 key!828 v!309)))))))

(declare-fun b!193137 () Bool)

(declare-fun contains!1353 (List!2397 tuple2!3488) Bool)

(assert (=> b!193137 (= e!127078 (contains!1353 (toList!1220 lt!96145) (tuple2!3489 key!828 v!309)))))

(assert (= (and d!56621 res!91261) b!193136))

(assert (= (and b!193136 res!91260) b!193137))

(declare-fun m!220111 () Bool)

(assert (=> d!56621 m!220111))

(declare-fun m!220113 () Bool)

(assert (=> d!56621 m!220113))

(declare-fun m!220115 () Bool)

(assert (=> d!56621 m!220115))

(declare-fun m!220117 () Bool)

(assert (=> d!56621 m!220117))

(declare-fun m!220119 () Bool)

(assert (=> b!193136 m!220119))

(declare-fun m!220121 () Bool)

(assert (=> b!193137 m!220121))

(assert (=> b!193030 d!56621))

(declare-fun bm!19489 () Bool)

(declare-fun call!19497 () ListLongMap!2409)

(declare-fun getCurrentListMapNoExtraKeys!216 (array!8173 array!8175 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 32) Int) ListLongMap!2409)

(assert (=> bm!19489 (= call!19497 (getCurrentListMapNoExtraKeys!216 (_keys!5926 thiss!1248) (array!8176 (store (arr!3849 (_values!3921 thiss!1248)) (index!4867 lt!96081) (ValueCellFull!1892 v!309)) (size!4173 (_values!3921 thiss!1248))) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun bm!19490 () Bool)

(declare-fun call!19493 () ListLongMap!2409)

(declare-fun call!19494 () ListLongMap!2409)

(assert (=> bm!19490 (= call!19493 call!19494)))

(declare-fun b!193180 () Bool)

(declare-fun e!127117 () Unit!5829)

(declare-fun Unit!5835 () Unit!5829)

(assert (=> b!193180 (= e!127117 Unit!5835)))

(declare-fun b!193181 () Bool)

(declare-fun e!127110 () ListLongMap!2409)

(assert (=> b!193181 (= e!127110 call!19493)))

(declare-fun b!193182 () Bool)

(declare-fun e!127116 () Bool)

(declare-fun e!127112 () Bool)

(assert (=> b!193182 (= e!127116 e!127112)))

(declare-fun res!91281 () Bool)

(declare-fun call!19498 () Bool)

(assert (=> b!193182 (= res!91281 call!19498)))

(assert (=> b!193182 (=> (not res!91281) (not e!127112))))

(declare-fun bm!19491 () Bool)

(declare-fun call!19495 () ListLongMap!2409)

(assert (=> bm!19491 (= call!19495 call!19497)))

(declare-fun b!193183 () Bool)

(declare-fun e!127109 () Bool)

(declare-fun e!127113 () Bool)

(assert (=> b!193183 (= e!127109 e!127113)))

(declare-fun res!91280 () Bool)

(declare-fun call!19496 () Bool)

(assert (=> b!193183 (= res!91280 call!19496)))

(assert (=> b!193183 (=> (not res!91280) (not e!127113))))

(declare-fun b!193184 () Bool)

(declare-fun e!127107 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!193184 (= e!127107 (validKeyInArray!0 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193185 () Bool)

(declare-fun lt!96202 () ListLongMap!2409)

(declare-fun apply!185 (ListLongMap!2409 (_ BitVec 64)) V!5609)

(assert (=> b!193185 (= e!127113 (= (apply!185 lt!96202 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3779 thiss!1248)))))

(declare-fun b!193186 () Bool)

(declare-fun e!127105 () ListLongMap!2409)

(assert (=> b!193186 (= e!127105 (+!313 call!19494 (tuple2!3489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3779 thiss!1248))))))

(declare-fun b!193187 () Bool)

(assert (=> b!193187 (= e!127112 (= (apply!185 lt!96202 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3779 thiss!1248)))))

(declare-fun bm!19492 () Bool)

(assert (=> bm!19492 (= call!19498 (contains!1351 lt!96202 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193188 () Bool)

(declare-fun e!127108 () Bool)

(assert (=> b!193188 (= e!127108 (validKeyInArray!0 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun call!19492 () ListLongMap!2409)

(declare-fun c!34848 () Bool)

(declare-fun c!34843 () Bool)

(declare-fun bm!19493 () Bool)

(assert (=> bm!19493 (= call!19494 (+!313 (ite c!34848 call!19497 (ite c!34843 call!19495 call!19492)) (ite (or c!34848 c!34843) (tuple2!3489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3779 thiss!1248)) (tuple2!3489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3779 thiss!1248)))))))

(declare-fun b!193189 () Bool)

(assert (=> b!193189 (= e!127110 call!19492)))

(declare-fun b!193190 () Bool)

(declare-fun e!127114 () Bool)

(assert (=> b!193190 (= e!127114 e!127116)))

(declare-fun c!34845 () Bool)

(assert (=> b!193190 (= c!34845 (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193191 () Bool)

(declare-fun e!127111 () ListLongMap!2409)

(assert (=> b!193191 (= e!127105 e!127111)))

(assert (=> b!193191 (= c!34843 (and (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193192 () Bool)

(declare-fun e!127115 () Bool)

(declare-fun e!127106 () Bool)

(assert (=> b!193192 (= e!127115 e!127106)))

(declare-fun res!91285 () Bool)

(assert (=> b!193192 (=> (not res!91285) (not e!127106))))

(assert (=> b!193192 (= res!91285 (contains!1351 lt!96202 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193192 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))))))

(declare-fun b!193193 () Bool)

(assert (=> b!193193 (= e!127116 (not call!19498))))

(declare-fun b!193194 () Bool)

(assert (=> b!193194 (= e!127109 (not call!19496))))

(declare-fun b!193195 () Bool)

(assert (=> b!193195 (= e!127111 call!19493)))

(declare-fun d!56623 () Bool)

(assert (=> d!56623 e!127114))

(declare-fun res!91282 () Bool)

(assert (=> d!56623 (=> (not res!91282) (not e!127114))))

(assert (=> d!56623 (= res!91282 (or (bvsge #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))))))))

(declare-fun lt!96196 () ListLongMap!2409)

(assert (=> d!56623 (= lt!96202 lt!96196)))

(declare-fun lt!96200 () Unit!5829)

(assert (=> d!56623 (= lt!96200 e!127117)))

(declare-fun c!34847 () Bool)

(assert (=> d!56623 (= c!34847 e!127108)))

(declare-fun res!91286 () Bool)

(assert (=> d!56623 (=> (not res!91286) (not e!127108))))

(assert (=> d!56623 (= res!91286 (bvslt #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))))))

(assert (=> d!56623 (= lt!96196 e!127105)))

(assert (=> d!56623 (= c!34848 (and (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56623 (validMask!0 (mask!9183 thiss!1248))))

(assert (=> d!56623 (= (getCurrentListMap!872 (_keys!5926 thiss!1248) (array!8176 (store (arr!3849 (_values!3921 thiss!1248)) (index!4867 lt!96081) (ValueCellFull!1892 v!309)) (size!4173 (_values!3921 thiss!1248))) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)) lt!96202)))

(declare-fun b!193196 () Bool)

(declare-fun c!34844 () Bool)

(assert (=> b!193196 (= c!34844 (and (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!193196 (= e!127111 e!127110)))

(declare-fun bm!19494 () Bool)

(assert (=> bm!19494 (= call!19496 (contains!1351 lt!96202 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193197 () Bool)

(declare-fun res!91288 () Bool)

(assert (=> b!193197 (=> (not res!91288) (not e!127114))))

(assert (=> b!193197 (= res!91288 e!127115)))

(declare-fun res!91283 () Bool)

(assert (=> b!193197 (=> res!91283 e!127115)))

(assert (=> b!193197 (= res!91283 (not e!127107))))

(declare-fun res!91284 () Bool)

(assert (=> b!193197 (=> (not res!91284) (not e!127107))))

(assert (=> b!193197 (= res!91284 (bvslt #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))))))

(declare-fun b!193198 () Bool)

(declare-fun lt!96212 () Unit!5829)

(assert (=> b!193198 (= e!127117 lt!96212)))

(declare-fun lt!96198 () ListLongMap!2409)

(assert (=> b!193198 (= lt!96198 (getCurrentListMapNoExtraKeys!216 (_keys!5926 thiss!1248) (array!8176 (store (arr!3849 (_values!3921 thiss!1248)) (index!4867 lt!96081) (ValueCellFull!1892 v!309)) (size!4173 (_values!3921 thiss!1248))) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!96192 () (_ BitVec 64))

(assert (=> b!193198 (= lt!96192 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96207 () (_ BitVec 64))

(assert (=> b!193198 (= lt!96207 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96204 () Unit!5829)

(declare-fun addStillContains!161 (ListLongMap!2409 (_ BitVec 64) V!5609 (_ BitVec 64)) Unit!5829)

(assert (=> b!193198 (= lt!96204 (addStillContains!161 lt!96198 lt!96192 (zeroValue!3779 thiss!1248) lt!96207))))

(assert (=> b!193198 (contains!1351 (+!313 lt!96198 (tuple2!3489 lt!96192 (zeroValue!3779 thiss!1248))) lt!96207)))

(declare-fun lt!96199 () Unit!5829)

(assert (=> b!193198 (= lt!96199 lt!96204)))

(declare-fun lt!96194 () ListLongMap!2409)

(assert (=> b!193198 (= lt!96194 (getCurrentListMapNoExtraKeys!216 (_keys!5926 thiss!1248) (array!8176 (store (arr!3849 (_values!3921 thiss!1248)) (index!4867 lt!96081) (ValueCellFull!1892 v!309)) (size!4173 (_values!3921 thiss!1248))) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!96205 () (_ BitVec 64))

(assert (=> b!193198 (= lt!96205 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96203 () (_ BitVec 64))

(assert (=> b!193198 (= lt!96203 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96210 () Unit!5829)

(declare-fun addApplyDifferent!161 (ListLongMap!2409 (_ BitVec 64) V!5609 (_ BitVec 64)) Unit!5829)

(assert (=> b!193198 (= lt!96210 (addApplyDifferent!161 lt!96194 lt!96205 (minValue!3779 thiss!1248) lt!96203))))

(assert (=> b!193198 (= (apply!185 (+!313 lt!96194 (tuple2!3489 lt!96205 (minValue!3779 thiss!1248))) lt!96203) (apply!185 lt!96194 lt!96203))))

(declare-fun lt!96206 () Unit!5829)

(assert (=> b!193198 (= lt!96206 lt!96210)))

(declare-fun lt!96195 () ListLongMap!2409)

(assert (=> b!193198 (= lt!96195 (getCurrentListMapNoExtraKeys!216 (_keys!5926 thiss!1248) (array!8176 (store (arr!3849 (_values!3921 thiss!1248)) (index!4867 lt!96081) (ValueCellFull!1892 v!309)) (size!4173 (_values!3921 thiss!1248))) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!96201 () (_ BitVec 64))

(assert (=> b!193198 (= lt!96201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96211 () (_ BitVec 64))

(assert (=> b!193198 (= lt!96211 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96208 () Unit!5829)

(assert (=> b!193198 (= lt!96208 (addApplyDifferent!161 lt!96195 lt!96201 (zeroValue!3779 thiss!1248) lt!96211))))

(assert (=> b!193198 (= (apply!185 (+!313 lt!96195 (tuple2!3489 lt!96201 (zeroValue!3779 thiss!1248))) lt!96211) (apply!185 lt!96195 lt!96211))))

(declare-fun lt!96193 () Unit!5829)

(assert (=> b!193198 (= lt!96193 lt!96208)))

(declare-fun lt!96209 () ListLongMap!2409)

(assert (=> b!193198 (= lt!96209 (getCurrentListMapNoExtraKeys!216 (_keys!5926 thiss!1248) (array!8176 (store (arr!3849 (_values!3921 thiss!1248)) (index!4867 lt!96081) (ValueCellFull!1892 v!309)) (size!4173 (_values!3921 thiss!1248))) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!96191 () (_ BitVec 64))

(assert (=> b!193198 (= lt!96191 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96197 () (_ BitVec 64))

(assert (=> b!193198 (= lt!96197 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193198 (= lt!96212 (addApplyDifferent!161 lt!96209 lt!96191 (minValue!3779 thiss!1248) lt!96197))))

(assert (=> b!193198 (= (apply!185 (+!313 lt!96209 (tuple2!3489 lt!96191 (minValue!3779 thiss!1248))) lt!96197) (apply!185 lt!96209 lt!96197))))

(declare-fun b!193199 () Bool)

(declare-fun get!2234 (ValueCell!1892 V!5609) V!5609)

(declare-fun dynLambda!528 (Int (_ BitVec 64)) V!5609)

(assert (=> b!193199 (= e!127106 (= (apply!185 lt!96202 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000)) (get!2234 (select (arr!3849 (array!8176 (store (arr!3849 (_values!3921 thiss!1248)) (index!4867 lt!96081) (ValueCellFull!1892 v!309)) (size!4173 (_values!3921 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!528 (defaultEntry!3938 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193199 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4173 (array!8176 (store (arr!3849 (_values!3921 thiss!1248)) (index!4867 lt!96081) (ValueCellFull!1892 v!309)) (size!4173 (_values!3921 thiss!1248))))))))

(assert (=> b!193199 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))))))

(declare-fun bm!19495 () Bool)

(assert (=> bm!19495 (= call!19492 call!19495)))

(declare-fun b!193200 () Bool)

(declare-fun res!91287 () Bool)

(assert (=> b!193200 (=> (not res!91287) (not e!127114))))

(assert (=> b!193200 (= res!91287 e!127109)))

(declare-fun c!34846 () Bool)

(assert (=> b!193200 (= c!34846 (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!56623 c!34848) b!193186))

(assert (= (and d!56623 (not c!34848)) b!193191))

(assert (= (and b!193191 c!34843) b!193195))

(assert (= (and b!193191 (not c!34843)) b!193196))

(assert (= (and b!193196 c!34844) b!193181))

(assert (= (and b!193196 (not c!34844)) b!193189))

(assert (= (or b!193181 b!193189) bm!19495))

(assert (= (or b!193195 bm!19495) bm!19491))

(assert (= (or b!193195 b!193181) bm!19490))

(assert (= (or b!193186 bm!19491) bm!19489))

(assert (= (or b!193186 bm!19490) bm!19493))

(assert (= (and d!56623 res!91286) b!193188))

(assert (= (and d!56623 c!34847) b!193198))

(assert (= (and d!56623 (not c!34847)) b!193180))

(assert (= (and d!56623 res!91282) b!193197))

(assert (= (and b!193197 res!91284) b!193184))

(assert (= (and b!193197 (not res!91283)) b!193192))

(assert (= (and b!193192 res!91285) b!193199))

(assert (= (and b!193197 res!91288) b!193200))

(assert (= (and b!193200 c!34846) b!193183))

(assert (= (and b!193200 (not c!34846)) b!193194))

(assert (= (and b!193183 res!91280) b!193185))

(assert (= (or b!193183 b!193194) bm!19494))

(assert (= (and b!193200 res!91287) b!193190))

(assert (= (and b!193190 c!34845) b!193182))

(assert (= (and b!193190 (not c!34845)) b!193193))

(assert (= (and b!193182 res!91281) b!193187))

(assert (= (or b!193182 b!193193) bm!19492))

(declare-fun b_lambda!7477 () Bool)

(assert (=> (not b_lambda!7477) (not b!193199)))

(declare-fun t!7313 () Bool)

(declare-fun tb!2873 () Bool)

(assert (=> (and b!193033 (= (defaultEntry!3938 thiss!1248) (defaultEntry!3938 thiss!1248)) t!7313) tb!2873))

(declare-fun result!4913 () Bool)

(assert (=> tb!2873 (= result!4913 tp_is_empty!4471)))

(assert (=> b!193199 t!7313))

(declare-fun b_and!11421 () Bool)

(assert (= b_and!11415 (and (=> t!7313 result!4913) b_and!11421)))

(declare-fun m!220123 () Bool)

(assert (=> b!193188 m!220123))

(assert (=> b!193188 m!220123))

(declare-fun m!220125 () Bool)

(assert (=> b!193188 m!220125))

(declare-fun m!220127 () Bool)

(assert (=> bm!19494 m!220127))

(declare-fun m!220129 () Bool)

(assert (=> bm!19492 m!220129))

(assert (=> d!56623 m!220007))

(assert (=> b!193192 m!220123))

(assert (=> b!193192 m!220123))

(declare-fun m!220131 () Bool)

(assert (=> b!193192 m!220131))

(declare-fun m!220133 () Bool)

(assert (=> bm!19489 m!220133))

(assert (=> b!193199 m!220123))

(declare-fun m!220135 () Bool)

(assert (=> b!193199 m!220135))

(declare-fun m!220137 () Bool)

(assert (=> b!193199 m!220137))

(assert (=> b!193199 m!220135))

(assert (=> b!193199 m!220137))

(declare-fun m!220139 () Bool)

(assert (=> b!193199 m!220139))

(assert (=> b!193199 m!220123))

(declare-fun m!220141 () Bool)

(assert (=> b!193199 m!220141))

(declare-fun m!220143 () Bool)

(assert (=> b!193198 m!220143))

(declare-fun m!220145 () Bool)

(assert (=> b!193198 m!220145))

(declare-fun m!220147 () Bool)

(assert (=> b!193198 m!220147))

(declare-fun m!220149 () Bool)

(assert (=> b!193198 m!220149))

(declare-fun m!220151 () Bool)

(assert (=> b!193198 m!220151))

(declare-fun m!220153 () Bool)

(assert (=> b!193198 m!220153))

(assert (=> b!193198 m!220133))

(declare-fun m!220155 () Bool)

(assert (=> b!193198 m!220155))

(declare-fun m!220157 () Bool)

(assert (=> b!193198 m!220157))

(declare-fun m!220159 () Bool)

(assert (=> b!193198 m!220159))

(declare-fun m!220161 () Bool)

(assert (=> b!193198 m!220161))

(assert (=> b!193198 m!220151))

(declare-fun m!220163 () Bool)

(assert (=> b!193198 m!220163))

(declare-fun m!220165 () Bool)

(assert (=> b!193198 m!220165))

(assert (=> b!193198 m!220143))

(declare-fun m!220167 () Bool)

(assert (=> b!193198 m!220167))

(assert (=> b!193198 m!220165))

(declare-fun m!220169 () Bool)

(assert (=> b!193198 m!220169))

(assert (=> b!193198 m!220123))

(declare-fun m!220171 () Bool)

(assert (=> b!193198 m!220171))

(assert (=> b!193198 m!220155))

(declare-fun m!220173 () Bool)

(assert (=> bm!19493 m!220173))

(assert (=> b!193184 m!220123))

(assert (=> b!193184 m!220123))

(assert (=> b!193184 m!220125))

(declare-fun m!220175 () Bool)

(assert (=> b!193186 m!220175))

(declare-fun m!220177 () Bool)

(assert (=> b!193187 m!220177))

(declare-fun m!220179 () Bool)

(assert (=> b!193185 m!220179))

(assert (=> b!193030 d!56623))

(declare-fun bm!19496 () Bool)

(declare-fun call!19504 () ListLongMap!2409)

(assert (=> bm!19496 (= call!19504 (getCurrentListMapNoExtraKeys!216 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun bm!19497 () Bool)

(declare-fun call!19500 () ListLongMap!2409)

(declare-fun call!19501 () ListLongMap!2409)

(assert (=> bm!19497 (= call!19500 call!19501)))

(declare-fun b!193203 () Bool)

(declare-fun e!127130 () Unit!5829)

(declare-fun Unit!5836 () Unit!5829)

(assert (=> b!193203 (= e!127130 Unit!5836)))

(declare-fun b!193204 () Bool)

(declare-fun e!127123 () ListLongMap!2409)

(assert (=> b!193204 (= e!127123 call!19500)))

(declare-fun b!193205 () Bool)

(declare-fun e!127129 () Bool)

(declare-fun e!127125 () Bool)

(assert (=> b!193205 (= e!127129 e!127125)))

(declare-fun res!91290 () Bool)

(declare-fun call!19505 () Bool)

(assert (=> b!193205 (= res!91290 call!19505)))

(assert (=> b!193205 (=> (not res!91290) (not e!127125))))

(declare-fun bm!19498 () Bool)

(declare-fun call!19502 () ListLongMap!2409)

(assert (=> bm!19498 (= call!19502 call!19504)))

(declare-fun b!193206 () Bool)

(declare-fun e!127122 () Bool)

(declare-fun e!127126 () Bool)

(assert (=> b!193206 (= e!127122 e!127126)))

(declare-fun res!91289 () Bool)

(declare-fun call!19503 () Bool)

(assert (=> b!193206 (= res!91289 call!19503)))

(assert (=> b!193206 (=> (not res!91289) (not e!127126))))

(declare-fun b!193207 () Bool)

(declare-fun e!127120 () Bool)

(assert (=> b!193207 (= e!127120 (validKeyInArray!0 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193208 () Bool)

(declare-fun lt!96224 () ListLongMap!2409)

(assert (=> b!193208 (= e!127126 (= (apply!185 lt!96224 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3779 thiss!1248)))))

(declare-fun b!193209 () Bool)

(declare-fun e!127118 () ListLongMap!2409)

(assert (=> b!193209 (= e!127118 (+!313 call!19501 (tuple2!3489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3779 thiss!1248))))))

(declare-fun b!193210 () Bool)

(assert (=> b!193210 (= e!127125 (= (apply!185 lt!96224 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3779 thiss!1248)))))

(declare-fun bm!19499 () Bool)

(assert (=> bm!19499 (= call!19505 (contains!1351 lt!96224 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193211 () Bool)

(declare-fun e!127121 () Bool)

(assert (=> b!193211 (= e!127121 (validKeyInArray!0 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19500 () Bool)

(declare-fun call!19499 () ListLongMap!2409)

(declare-fun c!34854 () Bool)

(declare-fun c!34849 () Bool)

(assert (=> bm!19500 (= call!19501 (+!313 (ite c!34854 call!19504 (ite c!34849 call!19502 call!19499)) (ite (or c!34854 c!34849) (tuple2!3489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3779 thiss!1248)) (tuple2!3489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3779 thiss!1248)))))))

(declare-fun b!193212 () Bool)

(assert (=> b!193212 (= e!127123 call!19499)))

(declare-fun b!193213 () Bool)

(declare-fun e!127127 () Bool)

(assert (=> b!193213 (= e!127127 e!127129)))

(declare-fun c!34851 () Bool)

(assert (=> b!193213 (= c!34851 (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193214 () Bool)

(declare-fun e!127124 () ListLongMap!2409)

(assert (=> b!193214 (= e!127118 e!127124)))

(assert (=> b!193214 (= c!34849 (and (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193215 () Bool)

(declare-fun e!127128 () Bool)

(declare-fun e!127119 () Bool)

(assert (=> b!193215 (= e!127128 e!127119)))

(declare-fun res!91294 () Bool)

(assert (=> b!193215 (=> (not res!91294) (not e!127119))))

(assert (=> b!193215 (= res!91294 (contains!1351 lt!96224 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193215 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))))))

(declare-fun b!193216 () Bool)

(assert (=> b!193216 (= e!127129 (not call!19505))))

(declare-fun b!193217 () Bool)

(assert (=> b!193217 (= e!127122 (not call!19503))))

(declare-fun b!193218 () Bool)

(assert (=> b!193218 (= e!127124 call!19500)))

(declare-fun d!56625 () Bool)

(assert (=> d!56625 e!127127))

(declare-fun res!91291 () Bool)

(assert (=> d!56625 (=> (not res!91291) (not e!127127))))

(assert (=> d!56625 (= res!91291 (or (bvsge #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))))))))

(declare-fun lt!96218 () ListLongMap!2409)

(assert (=> d!56625 (= lt!96224 lt!96218)))

(declare-fun lt!96222 () Unit!5829)

(assert (=> d!56625 (= lt!96222 e!127130)))

(declare-fun c!34853 () Bool)

(assert (=> d!56625 (= c!34853 e!127121)))

(declare-fun res!91295 () Bool)

(assert (=> d!56625 (=> (not res!91295) (not e!127121))))

(assert (=> d!56625 (= res!91295 (bvslt #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))))))

(assert (=> d!56625 (= lt!96218 e!127118)))

(assert (=> d!56625 (= c!34854 (and (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56625 (validMask!0 (mask!9183 thiss!1248))))

(assert (=> d!56625 (= (getCurrentListMap!872 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)) lt!96224)))

(declare-fun b!193219 () Bool)

(declare-fun c!34850 () Bool)

(assert (=> b!193219 (= c!34850 (and (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!193219 (= e!127124 e!127123)))

(declare-fun bm!19501 () Bool)

(assert (=> bm!19501 (= call!19503 (contains!1351 lt!96224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193220 () Bool)

(declare-fun res!91297 () Bool)

(assert (=> b!193220 (=> (not res!91297) (not e!127127))))

(assert (=> b!193220 (= res!91297 e!127128)))

(declare-fun res!91292 () Bool)

(assert (=> b!193220 (=> res!91292 e!127128)))

(assert (=> b!193220 (= res!91292 (not e!127120))))

(declare-fun res!91293 () Bool)

(assert (=> b!193220 (=> (not res!91293) (not e!127120))))

(assert (=> b!193220 (= res!91293 (bvslt #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))))))

(declare-fun b!193221 () Bool)

(declare-fun lt!96234 () Unit!5829)

(assert (=> b!193221 (= e!127130 lt!96234)))

(declare-fun lt!96220 () ListLongMap!2409)

(assert (=> b!193221 (= lt!96220 (getCurrentListMapNoExtraKeys!216 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!96214 () (_ BitVec 64))

(assert (=> b!193221 (= lt!96214 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96229 () (_ BitVec 64))

(assert (=> b!193221 (= lt!96229 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96226 () Unit!5829)

(assert (=> b!193221 (= lt!96226 (addStillContains!161 lt!96220 lt!96214 (zeroValue!3779 thiss!1248) lt!96229))))

(assert (=> b!193221 (contains!1351 (+!313 lt!96220 (tuple2!3489 lt!96214 (zeroValue!3779 thiss!1248))) lt!96229)))

(declare-fun lt!96221 () Unit!5829)

(assert (=> b!193221 (= lt!96221 lt!96226)))

(declare-fun lt!96216 () ListLongMap!2409)

(assert (=> b!193221 (= lt!96216 (getCurrentListMapNoExtraKeys!216 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!96227 () (_ BitVec 64))

(assert (=> b!193221 (= lt!96227 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96225 () (_ BitVec 64))

(assert (=> b!193221 (= lt!96225 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96232 () Unit!5829)

(assert (=> b!193221 (= lt!96232 (addApplyDifferent!161 lt!96216 lt!96227 (minValue!3779 thiss!1248) lt!96225))))

(assert (=> b!193221 (= (apply!185 (+!313 lt!96216 (tuple2!3489 lt!96227 (minValue!3779 thiss!1248))) lt!96225) (apply!185 lt!96216 lt!96225))))

(declare-fun lt!96228 () Unit!5829)

(assert (=> b!193221 (= lt!96228 lt!96232)))

(declare-fun lt!96217 () ListLongMap!2409)

(assert (=> b!193221 (= lt!96217 (getCurrentListMapNoExtraKeys!216 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!96223 () (_ BitVec 64))

(assert (=> b!193221 (= lt!96223 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96233 () (_ BitVec 64))

(assert (=> b!193221 (= lt!96233 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96230 () Unit!5829)

(assert (=> b!193221 (= lt!96230 (addApplyDifferent!161 lt!96217 lt!96223 (zeroValue!3779 thiss!1248) lt!96233))))

(assert (=> b!193221 (= (apply!185 (+!313 lt!96217 (tuple2!3489 lt!96223 (zeroValue!3779 thiss!1248))) lt!96233) (apply!185 lt!96217 lt!96233))))

(declare-fun lt!96215 () Unit!5829)

(assert (=> b!193221 (= lt!96215 lt!96230)))

(declare-fun lt!96231 () ListLongMap!2409)

(assert (=> b!193221 (= lt!96231 (getCurrentListMapNoExtraKeys!216 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3938 thiss!1248)))))

(declare-fun lt!96213 () (_ BitVec 64))

(assert (=> b!193221 (= lt!96213 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96219 () (_ BitVec 64))

(assert (=> b!193221 (= lt!96219 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193221 (= lt!96234 (addApplyDifferent!161 lt!96231 lt!96213 (minValue!3779 thiss!1248) lt!96219))))

(assert (=> b!193221 (= (apply!185 (+!313 lt!96231 (tuple2!3489 lt!96213 (minValue!3779 thiss!1248))) lt!96219) (apply!185 lt!96231 lt!96219))))

(declare-fun b!193222 () Bool)

(assert (=> b!193222 (= e!127119 (= (apply!185 lt!96224 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000)) (get!2234 (select (arr!3849 (_values!3921 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!528 (defaultEntry!3938 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193222 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4173 (_values!3921 thiss!1248))))))

(assert (=> b!193222 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))))))

(declare-fun bm!19502 () Bool)

(assert (=> bm!19502 (= call!19499 call!19502)))

(declare-fun b!193223 () Bool)

(declare-fun res!91296 () Bool)

(assert (=> b!193223 (=> (not res!91296) (not e!127127))))

(assert (=> b!193223 (= res!91296 e!127122)))

(declare-fun c!34852 () Bool)

(assert (=> b!193223 (= c!34852 (not (= (bvand (extraKeys!3675 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!56625 c!34854) b!193209))

(assert (= (and d!56625 (not c!34854)) b!193214))

(assert (= (and b!193214 c!34849) b!193218))

(assert (= (and b!193214 (not c!34849)) b!193219))

(assert (= (and b!193219 c!34850) b!193204))

(assert (= (and b!193219 (not c!34850)) b!193212))

(assert (= (or b!193204 b!193212) bm!19502))

(assert (= (or b!193218 bm!19502) bm!19498))

(assert (= (or b!193218 b!193204) bm!19497))

(assert (= (or b!193209 bm!19498) bm!19496))

(assert (= (or b!193209 bm!19497) bm!19500))

(assert (= (and d!56625 res!91295) b!193211))

(assert (= (and d!56625 c!34853) b!193221))

(assert (= (and d!56625 (not c!34853)) b!193203))

(assert (= (and d!56625 res!91291) b!193220))

(assert (= (and b!193220 res!91293) b!193207))

(assert (= (and b!193220 (not res!91292)) b!193215))

(assert (= (and b!193215 res!91294) b!193222))

(assert (= (and b!193220 res!91297) b!193223))

(assert (= (and b!193223 c!34852) b!193206))

(assert (= (and b!193223 (not c!34852)) b!193217))

(assert (= (and b!193206 res!91289) b!193208))

(assert (= (or b!193206 b!193217) bm!19501))

(assert (= (and b!193223 res!91296) b!193213))

(assert (= (and b!193213 c!34851) b!193205))

(assert (= (and b!193213 (not c!34851)) b!193216))

(assert (= (and b!193205 res!91290) b!193210))

(assert (= (or b!193205 b!193216) bm!19499))

(declare-fun b_lambda!7479 () Bool)

(assert (=> (not b_lambda!7479) (not b!193222)))

(assert (=> b!193222 t!7313))

(declare-fun b_and!11423 () Bool)

(assert (= b_and!11421 (and (=> t!7313 result!4913) b_and!11423)))

(assert (=> b!193211 m!220123))

(assert (=> b!193211 m!220123))

(assert (=> b!193211 m!220125))

(declare-fun m!220181 () Bool)

(assert (=> bm!19501 m!220181))

(declare-fun m!220183 () Bool)

(assert (=> bm!19499 m!220183))

(assert (=> d!56625 m!220007))

(assert (=> b!193215 m!220123))

(assert (=> b!193215 m!220123))

(declare-fun m!220185 () Bool)

(assert (=> b!193215 m!220185))

(declare-fun m!220187 () Bool)

(assert (=> bm!19496 m!220187))

(assert (=> b!193222 m!220123))

(declare-fun m!220189 () Bool)

(assert (=> b!193222 m!220189))

(assert (=> b!193222 m!220137))

(assert (=> b!193222 m!220189))

(assert (=> b!193222 m!220137))

(declare-fun m!220191 () Bool)

(assert (=> b!193222 m!220191))

(assert (=> b!193222 m!220123))

(declare-fun m!220193 () Bool)

(assert (=> b!193222 m!220193))

(declare-fun m!220195 () Bool)

(assert (=> b!193221 m!220195))

(declare-fun m!220197 () Bool)

(assert (=> b!193221 m!220197))

(declare-fun m!220199 () Bool)

(assert (=> b!193221 m!220199))

(declare-fun m!220201 () Bool)

(assert (=> b!193221 m!220201))

(declare-fun m!220203 () Bool)

(assert (=> b!193221 m!220203))

(declare-fun m!220205 () Bool)

(assert (=> b!193221 m!220205))

(assert (=> b!193221 m!220187))

(declare-fun m!220207 () Bool)

(assert (=> b!193221 m!220207))

(declare-fun m!220209 () Bool)

(assert (=> b!193221 m!220209))

(declare-fun m!220211 () Bool)

(assert (=> b!193221 m!220211))

(declare-fun m!220213 () Bool)

(assert (=> b!193221 m!220213))

(assert (=> b!193221 m!220203))

(declare-fun m!220215 () Bool)

(assert (=> b!193221 m!220215))

(declare-fun m!220217 () Bool)

(assert (=> b!193221 m!220217))

(assert (=> b!193221 m!220195))

(declare-fun m!220219 () Bool)

(assert (=> b!193221 m!220219))

(assert (=> b!193221 m!220217))

(declare-fun m!220221 () Bool)

(assert (=> b!193221 m!220221))

(assert (=> b!193221 m!220123))

(declare-fun m!220223 () Bool)

(assert (=> b!193221 m!220223))

(assert (=> b!193221 m!220207))

(declare-fun m!220225 () Bool)

(assert (=> bm!19500 m!220225))

(assert (=> b!193207 m!220123))

(assert (=> b!193207 m!220123))

(assert (=> b!193207 m!220125))

(declare-fun m!220227 () Bool)

(assert (=> b!193209 m!220227))

(declare-fun m!220229 () Bool)

(assert (=> b!193210 m!220229))

(declare-fun m!220231 () Bool)

(assert (=> b!193208 m!220231))

(assert (=> b!193030 d!56625))

(declare-fun b!193236 () Bool)

(declare-fun e!127138 () SeekEntryResult!674)

(assert (=> b!193236 (= e!127138 Undefined!674)))

(declare-fun e!127139 () SeekEntryResult!674)

(declare-fun b!193237 () Bool)

(declare-fun lt!96243 () SeekEntryResult!674)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8173 (_ BitVec 32)) SeekEntryResult!674)

(assert (=> b!193237 (= e!127139 (seekKeyOrZeroReturnVacant!0 (x!20616 lt!96243) (index!4868 lt!96243) (index!4868 lt!96243) key!828 (_keys!5926 thiss!1248) (mask!9183 thiss!1248)))))

(declare-fun b!193238 () Bool)

(assert (=> b!193238 (= e!127139 (MissingZero!674 (index!4868 lt!96243)))))

(declare-fun b!193239 () Bool)

(declare-fun e!127137 () SeekEntryResult!674)

(assert (=> b!193239 (= e!127137 (Found!674 (index!4868 lt!96243)))))

(declare-fun b!193240 () Bool)

(assert (=> b!193240 (= e!127138 e!127137)))

(declare-fun lt!96241 () (_ BitVec 64))

(assert (=> b!193240 (= lt!96241 (select (arr!3848 (_keys!5926 thiss!1248)) (index!4868 lt!96243)))))

(declare-fun c!34863 () Bool)

(assert (=> b!193240 (= c!34863 (= lt!96241 key!828))))

(declare-fun b!193241 () Bool)

(declare-fun c!34862 () Bool)

(assert (=> b!193241 (= c!34862 (= lt!96241 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193241 (= e!127137 e!127139)))

(declare-fun d!56627 () Bool)

(declare-fun lt!96242 () SeekEntryResult!674)

(assert (=> d!56627 (and (or ((_ is Undefined!674) lt!96242) (not ((_ is Found!674) lt!96242)) (and (bvsge (index!4867 lt!96242) #b00000000000000000000000000000000) (bvslt (index!4867 lt!96242) (size!4172 (_keys!5926 thiss!1248))))) (or ((_ is Undefined!674) lt!96242) ((_ is Found!674) lt!96242) (not ((_ is MissingZero!674) lt!96242)) (and (bvsge (index!4866 lt!96242) #b00000000000000000000000000000000) (bvslt (index!4866 lt!96242) (size!4172 (_keys!5926 thiss!1248))))) (or ((_ is Undefined!674) lt!96242) ((_ is Found!674) lt!96242) ((_ is MissingZero!674) lt!96242) (not ((_ is MissingVacant!674) lt!96242)) (and (bvsge (index!4869 lt!96242) #b00000000000000000000000000000000) (bvslt (index!4869 lt!96242) (size!4172 (_keys!5926 thiss!1248))))) (or ((_ is Undefined!674) lt!96242) (ite ((_ is Found!674) lt!96242) (= (select (arr!3848 (_keys!5926 thiss!1248)) (index!4867 lt!96242)) key!828) (ite ((_ is MissingZero!674) lt!96242) (= (select (arr!3848 (_keys!5926 thiss!1248)) (index!4866 lt!96242)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!674) lt!96242) (= (select (arr!3848 (_keys!5926 thiss!1248)) (index!4869 lt!96242)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56627 (= lt!96242 e!127138)))

(declare-fun c!34861 () Bool)

(assert (=> d!56627 (= c!34861 (and ((_ is Intermediate!674) lt!96243) (undefined!1486 lt!96243)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8173 (_ BitVec 32)) SeekEntryResult!674)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56627 (= lt!96243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9183 thiss!1248)) key!828 (_keys!5926 thiss!1248) (mask!9183 thiss!1248)))))

(assert (=> d!56627 (validMask!0 (mask!9183 thiss!1248))))

(assert (=> d!56627 (= (seekEntryOrOpen!0 key!828 (_keys!5926 thiss!1248) (mask!9183 thiss!1248)) lt!96242)))

(assert (= (and d!56627 c!34861) b!193236))

(assert (= (and d!56627 (not c!34861)) b!193240))

(assert (= (and b!193240 c!34863) b!193239))

(assert (= (and b!193240 (not c!34863)) b!193241))

(assert (= (and b!193241 c!34862) b!193238))

(assert (= (and b!193241 (not c!34862)) b!193237))

(declare-fun m!220233 () Bool)

(assert (=> b!193237 m!220233))

(declare-fun m!220235 () Bool)

(assert (=> b!193240 m!220235))

(declare-fun m!220237 () Bool)

(assert (=> d!56627 m!220237))

(declare-fun m!220239 () Bool)

(assert (=> d!56627 m!220239))

(declare-fun m!220241 () Bool)

(assert (=> d!56627 m!220241))

(assert (=> d!56627 m!220007))

(declare-fun m!220243 () Bool)

(assert (=> d!56627 m!220243))

(assert (=> d!56627 m!220237))

(declare-fun m!220245 () Bool)

(assert (=> d!56627 m!220245))

(assert (=> b!193031 d!56627))

(declare-fun d!56629 () Bool)

(declare-fun res!91303 () Bool)

(declare-fun e!127148 () Bool)

(assert (=> d!56629 (=> res!91303 e!127148)))

(assert (=> d!56629 (= res!91303 (bvsge #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))))))

(assert (=> d!56629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5926 thiss!1248) (mask!9183 thiss!1248)) e!127148)))

(declare-fun b!193250 () Bool)

(declare-fun e!127146 () Bool)

(assert (=> b!193250 (= e!127148 e!127146)))

(declare-fun c!34866 () Bool)

(assert (=> b!193250 (= c!34866 (validKeyInArray!0 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193251 () Bool)

(declare-fun e!127147 () Bool)

(assert (=> b!193251 (= e!127146 e!127147)))

(declare-fun lt!96250 () (_ BitVec 64))

(assert (=> b!193251 (= lt!96250 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96251 () Unit!5829)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8173 (_ BitVec 64) (_ BitVec 32)) Unit!5829)

(assert (=> b!193251 (= lt!96251 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5926 thiss!1248) lt!96250 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!193251 (arrayContainsKey!0 (_keys!5926 thiss!1248) lt!96250 #b00000000000000000000000000000000)))

(declare-fun lt!96252 () Unit!5829)

(assert (=> b!193251 (= lt!96252 lt!96251)))

(declare-fun res!91302 () Bool)

(assert (=> b!193251 (= res!91302 (= (seekEntryOrOpen!0 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000) (_keys!5926 thiss!1248) (mask!9183 thiss!1248)) (Found!674 #b00000000000000000000000000000000)))))

(assert (=> b!193251 (=> (not res!91302) (not e!127147))))

(declare-fun b!193252 () Bool)

(declare-fun call!19508 () Bool)

(assert (=> b!193252 (= e!127146 call!19508)))

(declare-fun b!193253 () Bool)

(assert (=> b!193253 (= e!127147 call!19508)))

(declare-fun bm!19505 () Bool)

(assert (=> bm!19505 (= call!19508 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5926 thiss!1248) (mask!9183 thiss!1248)))))

(assert (= (and d!56629 (not res!91303)) b!193250))

(assert (= (and b!193250 c!34866) b!193251))

(assert (= (and b!193250 (not c!34866)) b!193252))

(assert (= (and b!193251 res!91302) b!193253))

(assert (= (or b!193253 b!193252) bm!19505))

(assert (=> b!193250 m!220123))

(assert (=> b!193250 m!220123))

(assert (=> b!193250 m!220125))

(assert (=> b!193251 m!220123))

(declare-fun m!220247 () Bool)

(assert (=> b!193251 m!220247))

(declare-fun m!220249 () Bool)

(assert (=> b!193251 m!220249))

(assert (=> b!193251 m!220123))

(declare-fun m!220251 () Bool)

(assert (=> b!193251 m!220251))

(declare-fun m!220253 () Bool)

(assert (=> bm!19505 m!220253))

(assert (=> b!193037 d!56629))

(declare-fun d!56631 () Bool)

(assert (=> d!56631 (= (array_inv!2481 (_keys!5926 thiss!1248)) (bvsge (size!4172 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193033 d!56631))

(declare-fun d!56633 () Bool)

(assert (=> d!56633 (= (array_inv!2482 (_values!3921 thiss!1248)) (bvsge (size!4173 (_values!3921 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193033 d!56633))

(declare-fun d!56635 () Bool)

(declare-fun e!127151 () Bool)

(assert (=> d!56635 e!127151))

(declare-fun res!91308 () Bool)

(assert (=> d!56635 (=> (not res!91308) (not e!127151))))

(declare-fun lt!96258 () SeekEntryResult!674)

(assert (=> d!56635 (= res!91308 ((_ is Found!674) lt!96258))))

(assert (=> d!56635 (= lt!96258 (seekEntryOrOpen!0 key!828 (_keys!5926 thiss!1248) (mask!9183 thiss!1248)))))

(declare-fun lt!96257 () Unit!5829)

(declare-fun choose!1062 (array!8173 array!8175 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 64) Int) Unit!5829)

(assert (=> d!56635 (= lt!96257 (choose!1062 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)))))

(assert (=> d!56635 (validMask!0 (mask!9183 thiss!1248))))

(assert (=> d!56635 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!178 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)) lt!96257)))

(declare-fun b!193258 () Bool)

(declare-fun res!91309 () Bool)

(assert (=> b!193258 (=> (not res!91309) (not e!127151))))

(assert (=> b!193258 (= res!91309 (inRange!0 (index!4867 lt!96258) (mask!9183 thiss!1248)))))

(declare-fun b!193259 () Bool)

(assert (=> b!193259 (= e!127151 (= (select (arr!3848 (_keys!5926 thiss!1248)) (index!4867 lt!96258)) key!828))))

(assert (=> b!193259 (and (bvsge (index!4867 lt!96258) #b00000000000000000000000000000000) (bvslt (index!4867 lt!96258) (size!4172 (_keys!5926 thiss!1248))))))

(assert (= (and d!56635 res!91308) b!193258))

(assert (= (and b!193258 res!91309) b!193259))

(assert (=> d!56635 m!219991))

(declare-fun m!220255 () Bool)

(assert (=> d!56635 m!220255))

(assert (=> d!56635 m!220007))

(declare-fun m!220257 () Bool)

(assert (=> b!193258 m!220257))

(declare-fun m!220259 () Bool)

(assert (=> b!193259 m!220259))

(assert (=> b!193032 d!56635))

(declare-fun d!56637 () Bool)

(assert (=> d!56637 (= (inRange!0 (index!4867 lt!96081) (mask!9183 thiss!1248)) (and (bvsge (index!4867 lt!96081) #b00000000000000000000000000000000) (bvslt (index!4867 lt!96081) (bvadd (mask!9183 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!193032 d!56637))

(declare-fun d!56639 () Bool)

(declare-fun res!91316 () Bool)

(declare-fun e!127154 () Bool)

(assert (=> d!56639 (=> (not res!91316) (not e!127154))))

(declare-fun simpleValid!201 (LongMapFixedSize!2692) Bool)

(assert (=> d!56639 (= res!91316 (simpleValid!201 thiss!1248))))

(assert (=> d!56639 (= (valid!1126 thiss!1248) e!127154)))

(declare-fun b!193266 () Bool)

(declare-fun res!91317 () Bool)

(assert (=> b!193266 (=> (not res!91317) (not e!127154))))

(declare-fun arrayCountValidKeys!0 (array!8173 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!193266 (= res!91317 (= (arrayCountValidKeys!0 (_keys!5926 thiss!1248) #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))) (_size!1395 thiss!1248)))))

(declare-fun b!193267 () Bool)

(declare-fun res!91318 () Bool)

(assert (=> b!193267 (=> (not res!91318) (not e!127154))))

(assert (=> b!193267 (= res!91318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5926 thiss!1248) (mask!9183 thiss!1248)))))

(declare-fun b!193268 () Bool)

(assert (=> b!193268 (= e!127154 (arrayNoDuplicates!0 (_keys!5926 thiss!1248) #b00000000000000000000000000000000 Nil!2393))))

(assert (= (and d!56639 res!91316) b!193266))

(assert (= (and b!193266 res!91317) b!193267))

(assert (= (and b!193267 res!91318) b!193268))

(declare-fun m!220261 () Bool)

(assert (=> d!56639 m!220261))

(declare-fun m!220263 () Bool)

(assert (=> b!193266 m!220263))

(assert (=> b!193267 m!220011))

(assert (=> b!193268 m!219993))

(assert (=> start!19696 d!56639))

(declare-fun d!56641 () Bool)

(declare-fun e!127166 () Bool)

(assert (=> d!56641 e!127166))

(declare-fun c!34872 () Bool)

(declare-fun lt!96264 () SeekEntryResult!674)

(assert (=> d!56641 (= c!34872 ((_ is MissingZero!674) lt!96264))))

(assert (=> d!56641 (= lt!96264 (seekEntryOrOpen!0 key!828 (_keys!5926 thiss!1248) (mask!9183 thiss!1248)))))

(declare-fun lt!96263 () Unit!5829)

(declare-fun choose!1063 (array!8173 array!8175 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 64) Int) Unit!5829)

(assert (=> d!56641 (= lt!96263 (choose!1063 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)))))

(assert (=> d!56641 (validMask!0 (mask!9183 thiss!1248))))

(assert (=> d!56641 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!176 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)) lt!96263)))

(declare-fun b!193285 () Bool)

(assert (=> b!193285 (and (bvsge (index!4866 lt!96264) #b00000000000000000000000000000000) (bvslt (index!4866 lt!96264) (size!4172 (_keys!5926 thiss!1248))))))

(declare-fun res!91327 () Bool)

(assert (=> b!193285 (= res!91327 (= (select (arr!3848 (_keys!5926 thiss!1248)) (index!4866 lt!96264)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127165 () Bool)

(assert (=> b!193285 (=> (not res!91327) (not e!127165))))

(declare-fun b!193286 () Bool)

(declare-fun call!19513 () Bool)

(assert (=> b!193286 (= e!127165 (not call!19513))))

(declare-fun b!193287 () Bool)

(assert (=> b!193287 (= e!127166 e!127165)))

(declare-fun res!91328 () Bool)

(declare-fun call!19514 () Bool)

(assert (=> b!193287 (= res!91328 call!19514)))

(assert (=> b!193287 (=> (not res!91328) (not e!127165))))

(declare-fun b!193288 () Bool)

(declare-fun e!127163 () Bool)

(assert (=> b!193288 (= e!127166 e!127163)))

(declare-fun c!34871 () Bool)

(assert (=> b!193288 (= c!34871 ((_ is MissingVacant!674) lt!96264))))

(declare-fun b!193289 () Bool)

(assert (=> b!193289 (= e!127163 ((_ is Undefined!674) lt!96264))))

(declare-fun bm!19510 () Bool)

(assert (=> bm!19510 (= call!19513 (arrayContainsKey!0 (_keys!5926 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun bm!19511 () Bool)

(assert (=> bm!19511 (= call!19514 (inRange!0 (ite c!34872 (index!4866 lt!96264) (index!4869 lt!96264)) (mask!9183 thiss!1248)))))

(declare-fun b!193290 () Bool)

(declare-fun res!91330 () Bool)

(declare-fun e!127164 () Bool)

(assert (=> b!193290 (=> (not res!91330) (not e!127164))))

(assert (=> b!193290 (= res!91330 (= (select (arr!3848 (_keys!5926 thiss!1248)) (index!4869 lt!96264)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193290 (and (bvsge (index!4869 lt!96264) #b00000000000000000000000000000000) (bvslt (index!4869 lt!96264) (size!4172 (_keys!5926 thiss!1248))))))

(declare-fun b!193291 () Bool)

(assert (=> b!193291 (= e!127164 (not call!19513))))

(declare-fun b!193292 () Bool)

(declare-fun res!91329 () Bool)

(assert (=> b!193292 (=> (not res!91329) (not e!127164))))

(assert (=> b!193292 (= res!91329 call!19514)))

(assert (=> b!193292 (= e!127163 e!127164)))

(assert (= (and d!56641 c!34872) b!193287))

(assert (= (and d!56641 (not c!34872)) b!193288))

(assert (= (and b!193287 res!91328) b!193285))

(assert (= (and b!193285 res!91327) b!193286))

(assert (= (and b!193288 c!34871) b!193292))

(assert (= (and b!193288 (not c!34871)) b!193289))

(assert (= (and b!193292 res!91329) b!193290))

(assert (= (and b!193290 res!91330) b!193291))

(assert (= (or b!193287 b!193292) bm!19511))

(assert (= (or b!193286 b!193291) bm!19510))

(assert (=> d!56641 m!219991))

(declare-fun m!220265 () Bool)

(assert (=> d!56641 m!220265))

(assert (=> d!56641 m!220007))

(declare-fun m!220267 () Bool)

(assert (=> b!193285 m!220267))

(declare-fun m!220269 () Bool)

(assert (=> b!193290 m!220269))

(declare-fun m!220271 () Bool)

(assert (=> bm!19511 m!220271))

(declare-fun m!220273 () Bool)

(assert (=> bm!19510 m!220273))

(assert (=> b!193034 d!56641))

(declare-fun b!193303 () Bool)

(declare-fun e!127176 () Bool)

(declare-fun e!127178 () Bool)

(assert (=> b!193303 (= e!127176 e!127178)))

(declare-fun res!91337 () Bool)

(assert (=> b!193303 (=> (not res!91337) (not e!127178))))

(declare-fun e!127175 () Bool)

(assert (=> b!193303 (= res!91337 (not e!127175))))

(declare-fun res!91339 () Bool)

(assert (=> b!193303 (=> (not res!91339) (not e!127175))))

(assert (=> b!193303 (= res!91339 (validKeyInArray!0 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193304 () Bool)

(declare-fun e!127177 () Bool)

(assert (=> b!193304 (= e!127178 e!127177)))

(declare-fun c!34875 () Bool)

(assert (=> b!193304 (= c!34875 (validKeyInArray!0 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193305 () Bool)

(declare-fun call!19517 () Bool)

(assert (=> b!193305 (= e!127177 call!19517)))

(declare-fun d!56643 () Bool)

(declare-fun res!91338 () Bool)

(assert (=> d!56643 (=> res!91338 e!127176)))

(assert (=> d!56643 (= res!91338 (bvsge #b00000000000000000000000000000000 (size!4172 (_keys!5926 thiss!1248))))))

(assert (=> d!56643 (= (arrayNoDuplicates!0 (_keys!5926 thiss!1248) #b00000000000000000000000000000000 Nil!2393) e!127176)))

(declare-fun b!193306 () Bool)

(declare-fun contains!1354 (List!2396 (_ BitVec 64)) Bool)

(assert (=> b!193306 (= e!127175 (contains!1354 Nil!2393 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193307 () Bool)

(assert (=> b!193307 (= e!127177 call!19517)))

(declare-fun bm!19514 () Bool)

(assert (=> bm!19514 (= call!19517 (arrayNoDuplicates!0 (_keys!5926 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34875 (Cons!2392 (select (arr!3848 (_keys!5926 thiss!1248)) #b00000000000000000000000000000000) Nil!2393) Nil!2393)))))

(assert (= (and d!56643 (not res!91338)) b!193303))

(assert (= (and b!193303 res!91339) b!193306))

(assert (= (and b!193303 res!91337) b!193304))

(assert (= (and b!193304 c!34875) b!193305))

(assert (= (and b!193304 (not c!34875)) b!193307))

(assert (= (or b!193305 b!193307) bm!19514))

(assert (=> b!193303 m!220123))

(assert (=> b!193303 m!220123))

(assert (=> b!193303 m!220125))

(assert (=> b!193304 m!220123))

(assert (=> b!193304 m!220123))

(assert (=> b!193304 m!220125))

(assert (=> b!193306 m!220123))

(assert (=> b!193306 m!220123))

(declare-fun m!220275 () Bool)

(assert (=> b!193306 m!220275))

(assert (=> bm!19514 m!220123))

(declare-fun m!220277 () Bool)

(assert (=> bm!19514 m!220277))

(assert (=> b!193029 d!56643))

(declare-fun mapNonEmpty!7739 () Bool)

(declare-fun mapRes!7739 () Bool)

(declare-fun tp!16973 () Bool)

(declare-fun e!127183 () Bool)

(assert (=> mapNonEmpty!7739 (= mapRes!7739 (and tp!16973 e!127183))))

(declare-fun mapValue!7739 () ValueCell!1892)

(declare-fun mapRest!7739 () (Array (_ BitVec 32) ValueCell!1892))

(declare-fun mapKey!7739 () (_ BitVec 32))

(assert (=> mapNonEmpty!7739 (= mapRest!7730 (store mapRest!7739 mapKey!7739 mapValue!7739))))

(declare-fun b!193314 () Bool)

(assert (=> b!193314 (= e!127183 tp_is_empty!4471)))

(declare-fun b!193315 () Bool)

(declare-fun e!127184 () Bool)

(assert (=> b!193315 (= e!127184 tp_is_empty!4471)))

(declare-fun mapIsEmpty!7739 () Bool)

(assert (=> mapIsEmpty!7739 mapRes!7739))

(declare-fun condMapEmpty!7739 () Bool)

(declare-fun mapDefault!7739 () ValueCell!1892)

(assert (=> mapNonEmpty!7730 (= condMapEmpty!7739 (= mapRest!7730 ((as const (Array (_ BitVec 32) ValueCell!1892)) mapDefault!7739)))))

(assert (=> mapNonEmpty!7730 (= tp!16957 (and e!127184 mapRes!7739))))

(assert (= (and mapNonEmpty!7730 condMapEmpty!7739) mapIsEmpty!7739))

(assert (= (and mapNonEmpty!7730 (not condMapEmpty!7739)) mapNonEmpty!7739))

(assert (= (and mapNonEmpty!7739 ((_ is ValueCellFull!1892) mapValue!7739)) b!193314))

(assert (= (and mapNonEmpty!7730 ((_ is ValueCellFull!1892) mapDefault!7739)) b!193315))

(declare-fun m!220279 () Bool)

(assert (=> mapNonEmpty!7739 m!220279))

(declare-fun b_lambda!7481 () Bool)

(assert (= b_lambda!7479 (or (and b!193033 b_free!4699) b_lambda!7481)))

(declare-fun b_lambda!7483 () Bool)

(assert (= b_lambda!7477 (or (and b!193033 b_free!4699) b_lambda!7483)))

(check-sat (not bm!19496) (not b!193267) (not b!193185) (not bm!19494) (not bm!19492) (not b!193187) (not b!193136) (not b!193210) (not b!193304) (not b!193184) (not b!193251) (not bm!19500) (not d!56639) (not b!193188) (not d!56617) (not b!193128) tp_is_empty!4471 (not bm!19493) (not b!193208) (not d!56627) (not d!56621) (not b!193199) (not b_next!4699) (not bm!19489) (not bm!19501) (not bm!19499) b_and!11423 (not b_lambda!7483) (not b!193222) (not bm!19510) (not bm!19505) (not mapNonEmpty!7739) (not b!193250) (not d!56619) (not d!56623) (not b!193207) (not b!193221) (not d!56635) (not b!193211) (not b!193306) (not d!56641) (not b!193137) (not b!193237) (not b!193126) (not b!193192) (not b!193215) (not b!193186) (not bm!19514) (not b!193198) (not b!193258) (not b_lambda!7481) (not b!193303) (not bm!19511) (not b!193131) (not b!193266) (not b!193209) (not b!193268) (not d!56625))
(check-sat b_and!11423 (not b_next!4699))
