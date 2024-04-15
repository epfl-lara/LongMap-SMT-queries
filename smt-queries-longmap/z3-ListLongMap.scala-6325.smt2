; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81358 () Bool)

(assert start!81358)

(declare-fun b!951313 () Bool)

(declare-fun b_free!18271 () Bool)

(declare-fun b_next!18271 () Bool)

(assert (=> b!951313 (= b_free!18271 (not b_next!18271))))

(declare-fun tp!63426 () Bool)

(declare-fun b_and!29715 () Bool)

(assert (=> b!951313 (= tp!63426 b_and!29715)))

(declare-fun b!951306 () Bool)

(declare-fun e!535681 () Bool)

(declare-fun tp_is_empty!20779 () Bool)

(assert (=> b!951306 (= e!535681 tp_is_empty!20779)))

(declare-fun b!951307 () Bool)

(declare-fun e!535680 () Bool)

(declare-datatypes ((V!32671 0))(
  ( (V!32672 (val!10440 Int)) )
))
(declare-datatypes ((ValueCell!9908 0))(
  ( (ValueCellFull!9908 (v!12987 V!32671)) (EmptyCell!9908) )
))
(declare-datatypes ((array!57551 0))(
  ( (array!57552 (arr!27671 (Array (_ BitVec 32) ValueCell!9908)) (size!28151 (_ BitVec 32))) )
))
(declare-datatypes ((array!57553 0))(
  ( (array!57554 (arr!27672 (Array (_ BitVec 32) (_ BitVec 64))) (size!28152 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4966 0))(
  ( (LongMapFixedSize!4967 (defaultEntry!5806 Int) (mask!27624 (_ BitVec 32)) (extraKeys!5538 (_ BitVec 32)) (zeroValue!5642 V!32671) (minValue!5642 V!32671) (_size!2538 (_ BitVec 32)) (_keys!10746 array!57553) (_values!5829 array!57551) (_vacant!2538 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4966)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951307 (= e!535680 (not (validMask!0 (mask!27624 thiss!1141))))))

(declare-fun lt!428399 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57553 (_ BitVec 32)) Bool)

(assert (=> b!951307 (arrayForallSeekEntryOrOpenFound!0 lt!428399 (_keys!10746 thiss!1141) (mask!27624 thiss!1141))))

(declare-datatypes ((Unit!31895 0))(
  ( (Unit!31896) )
))
(declare-fun lt!428400 () Unit!31895)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31895)

(assert (=> b!951307 (= lt!428400 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10746 thiss!1141) (mask!27624 thiss!1141) #b00000000000000000000000000000000 lt!428399))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57553 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951307 (= lt!428399 (arrayScanForKey!0 (_keys!10746 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951307 (arrayContainsKey!0 (_keys!10746 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!428401 () Unit!31895)

(declare-fun lemmaKeyInListMapIsInArray!311 (array!57553 array!57551 (_ BitVec 32) (_ BitVec 32) V!32671 V!32671 (_ BitVec 64) Int) Unit!31895)

(assert (=> b!951307 (= lt!428401 (lemmaKeyInListMapIsInArray!311 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) key!756 (defaultEntry!5806 thiss!1141)))))

(declare-fun b!951308 () Bool)

(declare-fun res!637572 () Bool)

(assert (=> b!951308 (=> (not res!637572) (not e!535680))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9150 0))(
  ( (MissingZero!9150 (index!38971 (_ BitVec 32))) (Found!9150 (index!38972 (_ BitVec 32))) (Intermediate!9150 (undefined!9962 Bool) (index!38973 (_ BitVec 32)) (x!81861 (_ BitVec 32))) (Undefined!9150) (MissingVacant!9150 (index!38974 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57553 (_ BitVec 32)) SeekEntryResult!9150)

(assert (=> b!951308 (= res!637572 (not ((_ is Found!9150) (seekEntry!0 key!756 (_keys!10746 thiss!1141) (mask!27624 thiss!1141)))))))

(declare-fun b!951309 () Bool)

(declare-fun res!637575 () Bool)

(assert (=> b!951309 (=> (not res!637575) (not e!535680))))

(declare-datatypes ((tuple2!13616 0))(
  ( (tuple2!13617 (_1!6819 (_ BitVec 64)) (_2!6819 V!32671)) )
))
(declare-datatypes ((List!19358 0))(
  ( (Nil!19355) (Cons!19354 (h!20515 tuple2!13616) (t!27698 List!19358)) )
))
(declare-datatypes ((ListLongMap!12303 0))(
  ( (ListLongMap!12304 (toList!6167 List!19358)) )
))
(declare-fun contains!5203 (ListLongMap!12303 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3329 (array!57553 array!57551 (_ BitVec 32) (_ BitVec 32) V!32671 V!32671 (_ BitVec 32) Int) ListLongMap!12303)

(assert (=> b!951309 (= res!637575 (contains!5203 (getCurrentListMap!3329 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)) key!756))))

(declare-fun b!951310 () Bool)

(declare-fun e!535676 () Bool)

(declare-fun e!535678 () Bool)

(declare-fun mapRes!33096 () Bool)

(assert (=> b!951310 (= e!535676 (and e!535678 mapRes!33096))))

(declare-fun condMapEmpty!33096 () Bool)

(declare-fun mapDefault!33096 () ValueCell!9908)

(assert (=> b!951310 (= condMapEmpty!33096 (= (arr!27671 (_values!5829 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9908)) mapDefault!33096)))))

(declare-fun b!951311 () Bool)

(declare-fun res!637573 () Bool)

(assert (=> b!951311 (=> (not res!637573) (not e!535680))))

(assert (=> b!951311 (= res!637573 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951312 () Bool)

(assert (=> b!951312 (= e!535678 tp_is_empty!20779)))

(declare-fun res!637574 () Bool)

(assert (=> start!81358 (=> (not res!637574) (not e!535680))))

(declare-fun valid!1895 (LongMapFixedSize!4966) Bool)

(assert (=> start!81358 (= res!637574 (valid!1895 thiss!1141))))

(assert (=> start!81358 e!535680))

(declare-fun e!535677 () Bool)

(assert (=> start!81358 e!535677))

(assert (=> start!81358 true))

(declare-fun mapNonEmpty!33096 () Bool)

(declare-fun tp!63425 () Bool)

(assert (=> mapNonEmpty!33096 (= mapRes!33096 (and tp!63425 e!535681))))

(declare-fun mapRest!33096 () (Array (_ BitVec 32) ValueCell!9908))

(declare-fun mapKey!33096 () (_ BitVec 32))

(declare-fun mapValue!33096 () ValueCell!9908)

(assert (=> mapNonEmpty!33096 (= (arr!27671 (_values!5829 thiss!1141)) (store mapRest!33096 mapKey!33096 mapValue!33096))))

(declare-fun mapIsEmpty!33096 () Bool)

(assert (=> mapIsEmpty!33096 mapRes!33096))

(declare-fun array_inv!21536 (array!57553) Bool)

(declare-fun array_inv!21537 (array!57551) Bool)

(assert (=> b!951313 (= e!535677 (and tp!63426 tp_is_empty!20779 (array_inv!21536 (_keys!10746 thiss!1141)) (array_inv!21537 (_values!5829 thiss!1141)) e!535676))))

(assert (= (and start!81358 res!637574) b!951311))

(assert (= (and b!951311 res!637573) b!951308))

(assert (= (and b!951308 res!637572) b!951309))

(assert (= (and b!951309 res!637575) b!951307))

(assert (= (and b!951310 condMapEmpty!33096) mapIsEmpty!33096))

(assert (= (and b!951310 (not condMapEmpty!33096)) mapNonEmpty!33096))

(assert (= (and mapNonEmpty!33096 ((_ is ValueCellFull!9908) mapValue!33096)) b!951306))

(assert (= (and b!951310 ((_ is ValueCellFull!9908) mapDefault!33096)) b!951312))

(assert (= b!951313 b!951310))

(assert (= start!81358 b!951313))

(declare-fun m!883011 () Bool)

(assert (=> b!951308 m!883011))

(declare-fun m!883013 () Bool)

(assert (=> mapNonEmpty!33096 m!883013))

(declare-fun m!883015 () Bool)

(assert (=> b!951309 m!883015))

(assert (=> b!951309 m!883015))

(declare-fun m!883017 () Bool)

(assert (=> b!951309 m!883017))

(declare-fun m!883019 () Bool)

(assert (=> start!81358 m!883019))

(declare-fun m!883021 () Bool)

(assert (=> b!951313 m!883021))

(declare-fun m!883023 () Bool)

(assert (=> b!951313 m!883023))

(declare-fun m!883025 () Bool)

(assert (=> b!951307 m!883025))

(declare-fun m!883027 () Bool)

(assert (=> b!951307 m!883027))

(declare-fun m!883029 () Bool)

(assert (=> b!951307 m!883029))

(declare-fun m!883031 () Bool)

(assert (=> b!951307 m!883031))

(declare-fun m!883033 () Bool)

(assert (=> b!951307 m!883033))

(declare-fun m!883035 () Bool)

(assert (=> b!951307 m!883035))

(check-sat (not b_next!18271) (not b!951313) (not b!951309) (not b!951307) (not b!951308) (not start!81358) tp_is_empty!20779 b_and!29715 (not mapNonEmpty!33096))
(check-sat b_and!29715 (not b_next!18271))
(get-model)

(declare-fun d!115161 () Bool)

(declare-fun lt!428431 () SeekEntryResult!9150)

(assert (=> d!115161 (and (or ((_ is MissingVacant!9150) lt!428431) (not ((_ is Found!9150) lt!428431)) (and (bvsge (index!38972 lt!428431) #b00000000000000000000000000000000) (bvslt (index!38972 lt!428431) (size!28152 (_keys!10746 thiss!1141))))) (not ((_ is MissingVacant!9150) lt!428431)) (or (not ((_ is Found!9150) lt!428431)) (= (select (arr!27672 (_keys!10746 thiss!1141)) (index!38972 lt!428431)) key!756)))))

(declare-fun e!535724 () SeekEntryResult!9150)

(assert (=> d!115161 (= lt!428431 e!535724)))

(declare-fun c!99403 () Bool)

(declare-fun lt!428430 () SeekEntryResult!9150)

(assert (=> d!115161 (= c!99403 (and ((_ is Intermediate!9150) lt!428430) (undefined!9962 lt!428430)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57553 (_ BitVec 32)) SeekEntryResult!9150)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115161 (= lt!428430 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27624 thiss!1141)) key!756 (_keys!10746 thiss!1141) (mask!27624 thiss!1141)))))

(assert (=> d!115161 (validMask!0 (mask!27624 thiss!1141))))

(assert (=> d!115161 (= (seekEntry!0 key!756 (_keys!10746 thiss!1141) (mask!27624 thiss!1141)) lt!428431)))

(declare-fun b!951374 () Bool)

(declare-fun e!535725 () SeekEntryResult!9150)

(assert (=> b!951374 (= e!535725 (Found!9150 (index!38973 lt!428430)))))

(declare-fun b!951375 () Bool)

(assert (=> b!951375 (= e!535724 e!535725)))

(declare-fun lt!428428 () (_ BitVec 64))

(assert (=> b!951375 (= lt!428428 (select (arr!27672 (_keys!10746 thiss!1141)) (index!38973 lt!428430)))))

(declare-fun c!99401 () Bool)

(assert (=> b!951375 (= c!99401 (= lt!428428 key!756))))

(declare-fun b!951376 () Bool)

(declare-fun e!535726 () SeekEntryResult!9150)

(declare-fun lt!428429 () SeekEntryResult!9150)

(assert (=> b!951376 (= e!535726 (ite ((_ is MissingVacant!9150) lt!428429) (MissingZero!9150 (index!38974 lt!428429)) lt!428429))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57553 (_ BitVec 32)) SeekEntryResult!9150)

(assert (=> b!951376 (= lt!428429 (seekKeyOrZeroReturnVacant!0 (x!81861 lt!428430) (index!38973 lt!428430) (index!38973 lt!428430) key!756 (_keys!10746 thiss!1141) (mask!27624 thiss!1141)))))

(declare-fun b!951377 () Bool)

(assert (=> b!951377 (= e!535724 Undefined!9150)))

(declare-fun b!951378 () Bool)

(declare-fun c!99402 () Bool)

(assert (=> b!951378 (= c!99402 (= lt!428428 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!951378 (= e!535725 e!535726)))

(declare-fun b!951379 () Bool)

(assert (=> b!951379 (= e!535726 (MissingZero!9150 (index!38973 lt!428430)))))

(assert (= (and d!115161 c!99403) b!951377))

(assert (= (and d!115161 (not c!99403)) b!951375))

(assert (= (and b!951375 c!99401) b!951374))

(assert (= (and b!951375 (not c!99401)) b!951378))

(assert (= (and b!951378 c!99402) b!951379))

(assert (= (and b!951378 (not c!99402)) b!951376))

(declare-fun m!883089 () Bool)

(assert (=> d!115161 m!883089))

(declare-fun m!883091 () Bool)

(assert (=> d!115161 m!883091))

(assert (=> d!115161 m!883091))

(declare-fun m!883093 () Bool)

(assert (=> d!115161 m!883093))

(assert (=> d!115161 m!883029))

(declare-fun m!883095 () Bool)

(assert (=> b!951375 m!883095))

(declare-fun m!883097 () Bool)

(assert (=> b!951376 m!883097))

(assert (=> b!951308 d!115161))

(declare-fun d!115163 () Bool)

(declare-fun e!535731 () Bool)

(assert (=> d!115163 e!535731))

(declare-fun res!637602 () Bool)

(assert (=> d!115163 (=> res!637602 e!535731)))

(declare-fun lt!428440 () Bool)

(assert (=> d!115163 (= res!637602 (not lt!428440))))

(declare-fun lt!428443 () Bool)

(assert (=> d!115163 (= lt!428440 lt!428443)))

(declare-fun lt!428441 () Unit!31895)

(declare-fun e!535732 () Unit!31895)

(assert (=> d!115163 (= lt!428441 e!535732)))

(declare-fun c!99406 () Bool)

(assert (=> d!115163 (= c!99406 lt!428443)))

(declare-fun containsKey!469 (List!19358 (_ BitVec 64)) Bool)

(assert (=> d!115163 (= lt!428443 (containsKey!469 (toList!6167 (getCurrentListMap!3329 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141))) key!756))))

(assert (=> d!115163 (= (contains!5203 (getCurrentListMap!3329 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)) key!756) lt!428440)))

(declare-fun b!951386 () Bool)

(declare-fun lt!428442 () Unit!31895)

(assert (=> b!951386 (= e!535732 lt!428442)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!364 (List!19358 (_ BitVec 64)) Unit!31895)

(assert (=> b!951386 (= lt!428442 (lemmaContainsKeyImpliesGetValueByKeyDefined!364 (toList!6167 (getCurrentListMap!3329 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141))) key!756))))

(declare-datatypes ((Option!511 0))(
  ( (Some!510 (v!12990 V!32671)) (None!509) )
))
(declare-fun isDefined!377 (Option!511) Bool)

(declare-fun getValueByKey!505 (List!19358 (_ BitVec 64)) Option!511)

(assert (=> b!951386 (isDefined!377 (getValueByKey!505 (toList!6167 (getCurrentListMap!3329 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141))) key!756))))

(declare-fun b!951387 () Bool)

(declare-fun Unit!31899 () Unit!31895)

(assert (=> b!951387 (= e!535732 Unit!31899)))

(declare-fun b!951388 () Bool)

(assert (=> b!951388 (= e!535731 (isDefined!377 (getValueByKey!505 (toList!6167 (getCurrentListMap!3329 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141))) key!756)))))

(assert (= (and d!115163 c!99406) b!951386))

(assert (= (and d!115163 (not c!99406)) b!951387))

(assert (= (and d!115163 (not res!637602)) b!951388))

(declare-fun m!883099 () Bool)

(assert (=> d!115163 m!883099))

(declare-fun m!883101 () Bool)

(assert (=> b!951386 m!883101))

(declare-fun m!883103 () Bool)

(assert (=> b!951386 m!883103))

(assert (=> b!951386 m!883103))

(declare-fun m!883105 () Bool)

(assert (=> b!951386 m!883105))

(assert (=> b!951388 m!883103))

(assert (=> b!951388 m!883103))

(assert (=> b!951388 m!883105))

(assert (=> b!951309 d!115163))

(declare-fun b!951431 () Bool)

(declare-fun res!637629 () Bool)

(declare-fun e!535767 () Bool)

(assert (=> b!951431 (=> (not res!637629) (not e!535767))))

(declare-fun e!535765 () Bool)

(assert (=> b!951431 (= res!637629 e!535765)))

(declare-fun c!99424 () Bool)

(assert (=> b!951431 (= c!99424 (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41476 () Bool)

(declare-fun call!41483 () Bool)

(declare-fun lt!428502 () ListLongMap!12303)

(assert (=> bm!41476 (= call!41483 (contains!5203 lt!428502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951432 () Bool)

(declare-fun e!535771 () Bool)

(declare-fun e!535768 () Bool)

(assert (=> b!951432 (= e!535771 e!535768)))

(declare-fun res!637627 () Bool)

(assert (=> b!951432 (=> (not res!637627) (not e!535768))))

(assert (=> b!951432 (= res!637627 (contains!5203 lt!428502 (select (arr!27672 (_keys!10746 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951432 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28152 (_keys!10746 thiss!1141))))))

(declare-fun b!951433 () Bool)

(declare-fun e!535763 () ListLongMap!12303)

(declare-fun call!41482 () ListLongMap!12303)

(assert (=> b!951433 (= e!535763 call!41482)))

(declare-fun b!951434 () Bool)

(declare-fun call!41485 () ListLongMap!12303)

(assert (=> b!951434 (= e!535763 call!41485)))

(declare-fun b!951435 () Bool)

(declare-fun apply!876 (ListLongMap!12303 (_ BitVec 64)) V!32671)

(declare-fun get!14544 (ValueCell!9908 V!32671) V!32671)

(declare-fun dynLambda!1642 (Int (_ BitVec 64)) V!32671)

(assert (=> b!951435 (= e!535768 (= (apply!876 lt!428502 (select (arr!27672 (_keys!10746 thiss!1141)) #b00000000000000000000000000000000)) (get!14544 (select (arr!27671 (_values!5829 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1642 (defaultEntry!5806 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28151 (_values!5829 thiss!1141))))))

(assert (=> b!951435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28152 (_keys!10746 thiss!1141))))))

(declare-fun b!951436 () Bool)

(declare-fun e!535770 () ListLongMap!12303)

(declare-fun e!535762 () ListLongMap!12303)

(assert (=> b!951436 (= e!535770 e!535762)))

(declare-fun c!99423 () Bool)

(assert (=> b!951436 (= c!99423 (and (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41477 () Bool)

(declare-fun call!41481 () ListLongMap!12303)

(declare-fun call!41479 () ListLongMap!12303)

(assert (=> bm!41477 (= call!41481 call!41479)))

(declare-fun b!951437 () Bool)

(declare-fun e!535760 () Bool)

(declare-fun e!535769 () Bool)

(assert (=> b!951437 (= e!535760 e!535769)))

(declare-fun res!637623 () Bool)

(declare-fun call!41480 () Bool)

(assert (=> b!951437 (= res!637623 call!41480)))

(assert (=> b!951437 (=> (not res!637623) (not e!535769))))

(declare-fun b!951438 () Bool)

(assert (=> b!951438 (= e!535769 (= (apply!876 lt!428502 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5642 thiss!1141)))))

(declare-fun b!951439 () Bool)

(declare-fun e!535764 () Bool)

(assert (=> b!951439 (= e!535764 (= (apply!876 lt!428502 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5642 thiss!1141)))))

(declare-fun b!951440 () Bool)

(declare-fun e!535766 () Unit!31895)

(declare-fun Unit!31900 () Unit!31895)

(assert (=> b!951440 (= e!535766 Unit!31900)))

(declare-fun b!951441 () Bool)

(assert (=> b!951441 (= e!535760 (not call!41480))))

(declare-fun bm!41478 () Bool)

(declare-fun call!41484 () ListLongMap!12303)

(declare-fun c!99419 () Bool)

(declare-fun +!2886 (ListLongMap!12303 tuple2!13616) ListLongMap!12303)

(assert (=> bm!41478 (= call!41484 (+!2886 (ite c!99419 call!41479 (ite c!99423 call!41481 call!41485)) (ite (or c!99419 c!99423) (tuple2!13617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5642 thiss!1141)) (tuple2!13617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5642 thiss!1141)))))))

(declare-fun b!951442 () Bool)

(declare-fun e!535759 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!951442 (= e!535759 (validKeyInArray!0 (select (arr!27672 (_keys!10746 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951443 () Bool)

(assert (=> b!951443 (= e!535767 e!535760)))

(declare-fun c!99421 () Bool)

(assert (=> b!951443 (= c!99421 (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951444 () Bool)

(assert (=> b!951444 (= e!535765 (not call!41483))))

(declare-fun d!115165 () Bool)

(assert (=> d!115165 e!535767))

(declare-fun res!637625 () Bool)

(assert (=> d!115165 (=> (not res!637625) (not e!535767))))

(assert (=> d!115165 (= res!637625 (or (bvsge #b00000000000000000000000000000000 (size!28152 (_keys!10746 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28152 (_keys!10746 thiss!1141))))))))

(declare-fun lt!428505 () ListLongMap!12303)

(assert (=> d!115165 (= lt!428502 lt!428505)))

(declare-fun lt!428501 () Unit!31895)

(assert (=> d!115165 (= lt!428501 e!535766)))

(declare-fun c!99422 () Bool)

(declare-fun e!535761 () Bool)

(assert (=> d!115165 (= c!99422 e!535761)))

(declare-fun res!637626 () Bool)

(assert (=> d!115165 (=> (not res!637626) (not e!535761))))

(assert (=> d!115165 (= res!637626 (bvslt #b00000000000000000000000000000000 (size!28152 (_keys!10746 thiss!1141))))))

(assert (=> d!115165 (= lt!428505 e!535770)))

(assert (=> d!115165 (= c!99419 (and (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115165 (validMask!0 (mask!27624 thiss!1141))))

(assert (=> d!115165 (= (getCurrentListMap!3329 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)) lt!428502)))

(declare-fun b!951445 () Bool)

(assert (=> b!951445 (= e!535761 (validKeyInArray!0 (select (arr!27672 (_keys!10746 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951446 () Bool)

(assert (=> b!951446 (= e!535770 (+!2886 call!41484 (tuple2!13617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5642 thiss!1141))))))

(declare-fun bm!41479 () Bool)

(assert (=> bm!41479 (= call!41482 call!41484)))

(declare-fun b!951447 () Bool)

(assert (=> b!951447 (= e!535762 call!41482)))

(declare-fun b!951448 () Bool)

(assert (=> b!951448 (= e!535765 e!535764)))

(declare-fun res!637621 () Bool)

(assert (=> b!951448 (= res!637621 call!41483)))

(assert (=> b!951448 (=> (not res!637621) (not e!535764))))

(declare-fun b!951449 () Bool)

(declare-fun lt!428492 () Unit!31895)

(assert (=> b!951449 (= e!535766 lt!428492)))

(declare-fun lt!428491 () ListLongMap!12303)

(declare-fun getCurrentListMapNoExtraKeys!3358 (array!57553 array!57551 (_ BitVec 32) (_ BitVec 32) V!32671 V!32671 (_ BitVec 32) Int) ListLongMap!12303)

(assert (=> b!951449 (= lt!428491 (getCurrentListMapNoExtraKeys!3358 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)))))

(declare-fun lt!428493 () (_ BitVec 64))

(assert (=> b!951449 (= lt!428493 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428503 () (_ BitVec 64))

(assert (=> b!951449 (= lt!428503 (select (arr!27672 (_keys!10746 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428497 () Unit!31895)

(declare-fun addStillContains!575 (ListLongMap!12303 (_ BitVec 64) V!32671 (_ BitVec 64)) Unit!31895)

(assert (=> b!951449 (= lt!428497 (addStillContains!575 lt!428491 lt!428493 (zeroValue!5642 thiss!1141) lt!428503))))

(assert (=> b!951449 (contains!5203 (+!2886 lt!428491 (tuple2!13617 lt!428493 (zeroValue!5642 thiss!1141))) lt!428503)))

(declare-fun lt!428500 () Unit!31895)

(assert (=> b!951449 (= lt!428500 lt!428497)))

(declare-fun lt!428494 () ListLongMap!12303)

(assert (=> b!951449 (= lt!428494 (getCurrentListMapNoExtraKeys!3358 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)))))

(declare-fun lt!428498 () (_ BitVec 64))

(assert (=> b!951449 (= lt!428498 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428495 () (_ BitVec 64))

(assert (=> b!951449 (= lt!428495 (select (arr!27672 (_keys!10746 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428489 () Unit!31895)

(declare-fun addApplyDifferent!455 (ListLongMap!12303 (_ BitVec 64) V!32671 (_ BitVec 64)) Unit!31895)

(assert (=> b!951449 (= lt!428489 (addApplyDifferent!455 lt!428494 lt!428498 (minValue!5642 thiss!1141) lt!428495))))

(assert (=> b!951449 (= (apply!876 (+!2886 lt!428494 (tuple2!13617 lt!428498 (minValue!5642 thiss!1141))) lt!428495) (apply!876 lt!428494 lt!428495))))

(declare-fun lt!428504 () Unit!31895)

(assert (=> b!951449 (= lt!428504 lt!428489)))

(declare-fun lt!428496 () ListLongMap!12303)

(assert (=> b!951449 (= lt!428496 (getCurrentListMapNoExtraKeys!3358 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)))))

(declare-fun lt!428508 () (_ BitVec 64))

(assert (=> b!951449 (= lt!428508 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428506 () (_ BitVec 64))

(assert (=> b!951449 (= lt!428506 (select (arr!27672 (_keys!10746 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428507 () Unit!31895)

(assert (=> b!951449 (= lt!428507 (addApplyDifferent!455 lt!428496 lt!428508 (zeroValue!5642 thiss!1141) lt!428506))))

(assert (=> b!951449 (= (apply!876 (+!2886 lt!428496 (tuple2!13617 lt!428508 (zeroValue!5642 thiss!1141))) lt!428506) (apply!876 lt!428496 lt!428506))))

(declare-fun lt!428499 () Unit!31895)

(assert (=> b!951449 (= lt!428499 lt!428507)))

(declare-fun lt!428509 () ListLongMap!12303)

(assert (=> b!951449 (= lt!428509 (getCurrentListMapNoExtraKeys!3358 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)))))

(declare-fun lt!428488 () (_ BitVec 64))

(assert (=> b!951449 (= lt!428488 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428490 () (_ BitVec 64))

(assert (=> b!951449 (= lt!428490 (select (arr!27672 (_keys!10746 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951449 (= lt!428492 (addApplyDifferent!455 lt!428509 lt!428488 (minValue!5642 thiss!1141) lt!428490))))

(assert (=> b!951449 (= (apply!876 (+!2886 lt!428509 (tuple2!13617 lt!428488 (minValue!5642 thiss!1141))) lt!428490) (apply!876 lt!428509 lt!428490))))

(declare-fun b!951450 () Bool)

(declare-fun res!637628 () Bool)

(assert (=> b!951450 (=> (not res!637628) (not e!535767))))

(assert (=> b!951450 (= res!637628 e!535771)))

(declare-fun res!637622 () Bool)

(assert (=> b!951450 (=> res!637622 e!535771)))

(assert (=> b!951450 (= res!637622 (not e!535759))))

(declare-fun res!637624 () Bool)

(assert (=> b!951450 (=> (not res!637624) (not e!535759))))

(assert (=> b!951450 (= res!637624 (bvslt #b00000000000000000000000000000000 (size!28152 (_keys!10746 thiss!1141))))))

(declare-fun bm!41480 () Bool)

(assert (=> bm!41480 (= call!41485 call!41481)))

(declare-fun bm!41481 () Bool)

(assert (=> bm!41481 (= call!41479 (getCurrentListMapNoExtraKeys!3358 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)))))

(declare-fun b!951451 () Bool)

(declare-fun c!99420 () Bool)

(assert (=> b!951451 (= c!99420 (and (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!951451 (= e!535762 e!535763)))

(declare-fun bm!41482 () Bool)

(assert (=> bm!41482 (= call!41480 (contains!5203 lt!428502 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115165 c!99419) b!951446))

(assert (= (and d!115165 (not c!99419)) b!951436))

(assert (= (and b!951436 c!99423) b!951447))

(assert (= (and b!951436 (not c!99423)) b!951451))

(assert (= (and b!951451 c!99420) b!951433))

(assert (= (and b!951451 (not c!99420)) b!951434))

(assert (= (or b!951433 b!951434) bm!41480))

(assert (= (or b!951447 bm!41480) bm!41477))

(assert (= (or b!951447 b!951433) bm!41479))

(assert (= (or b!951446 bm!41477) bm!41481))

(assert (= (or b!951446 bm!41479) bm!41478))

(assert (= (and d!115165 res!637626) b!951445))

(assert (= (and d!115165 c!99422) b!951449))

(assert (= (and d!115165 (not c!99422)) b!951440))

(assert (= (and d!115165 res!637625) b!951450))

(assert (= (and b!951450 res!637624) b!951442))

(assert (= (and b!951450 (not res!637622)) b!951432))

(assert (= (and b!951432 res!637627) b!951435))

(assert (= (and b!951450 res!637628) b!951431))

(assert (= (and b!951431 c!99424) b!951448))

(assert (= (and b!951431 (not c!99424)) b!951444))

(assert (= (and b!951448 res!637621) b!951439))

(assert (= (or b!951448 b!951444) bm!41476))

(assert (= (and b!951431 res!637629) b!951443))

(assert (= (and b!951443 c!99421) b!951437))

(assert (= (and b!951443 (not c!99421)) b!951441))

(assert (= (and b!951437 res!637623) b!951438))

(assert (= (or b!951437 b!951441) bm!41482))

(declare-fun b_lambda!14377 () Bool)

(assert (=> (not b_lambda!14377) (not b!951435)))

(declare-fun t!27701 () Bool)

(declare-fun tb!6193 () Bool)

(assert (=> (and b!951313 (= (defaultEntry!5806 thiss!1141) (defaultEntry!5806 thiss!1141)) t!27701) tb!6193))

(declare-fun result!12317 () Bool)

(assert (=> tb!6193 (= result!12317 tp_is_empty!20779)))

(assert (=> b!951435 t!27701))

(declare-fun b_and!29721 () Bool)

(assert (= b_and!29715 (and (=> t!27701 result!12317) b_and!29721)))

(declare-fun m!883107 () Bool)

(assert (=> bm!41476 m!883107))

(declare-fun m!883109 () Bool)

(assert (=> b!951442 m!883109))

(assert (=> b!951442 m!883109))

(declare-fun m!883111 () Bool)

(assert (=> b!951442 m!883111))

(declare-fun m!883113 () Bool)

(assert (=> bm!41482 m!883113))

(assert (=> b!951432 m!883109))

(assert (=> b!951432 m!883109))

(declare-fun m!883115 () Bool)

(assert (=> b!951432 m!883115))

(declare-fun m!883117 () Bool)

(assert (=> b!951438 m!883117))

(declare-fun m!883119 () Bool)

(assert (=> b!951439 m!883119))

(declare-fun m!883121 () Bool)

(assert (=> b!951446 m!883121))

(declare-fun m!883123 () Bool)

(assert (=> b!951449 m!883123))

(declare-fun m!883125 () Bool)

(assert (=> b!951449 m!883125))

(declare-fun m!883127 () Bool)

(assert (=> b!951449 m!883127))

(assert (=> b!951449 m!883125))

(declare-fun m!883129 () Bool)

(assert (=> b!951449 m!883129))

(declare-fun m!883131 () Bool)

(assert (=> b!951449 m!883131))

(declare-fun m!883133 () Bool)

(assert (=> b!951449 m!883133))

(declare-fun m!883135 () Bool)

(assert (=> b!951449 m!883135))

(declare-fun m!883137 () Bool)

(assert (=> b!951449 m!883137))

(declare-fun m!883139 () Bool)

(assert (=> b!951449 m!883139))

(declare-fun m!883141 () Bool)

(assert (=> b!951449 m!883141))

(declare-fun m!883143 () Bool)

(assert (=> b!951449 m!883143))

(assert (=> b!951449 m!883135))

(assert (=> b!951449 m!883131))

(declare-fun m!883145 () Bool)

(assert (=> b!951449 m!883145))

(declare-fun m!883147 () Bool)

(assert (=> b!951449 m!883147))

(assert (=> b!951449 m!883109))

(declare-fun m!883149 () Bool)

(assert (=> b!951449 m!883149))

(declare-fun m!883151 () Bool)

(assert (=> b!951449 m!883151))

(assert (=> b!951449 m!883147))

(declare-fun m!883153 () Bool)

(assert (=> b!951449 m!883153))

(assert (=> d!115165 m!883029))

(declare-fun m!883155 () Bool)

(assert (=> b!951435 m!883155))

(declare-fun m!883157 () Bool)

(assert (=> b!951435 m!883157))

(assert (=> b!951435 m!883157))

(assert (=> b!951435 m!883155))

(declare-fun m!883159 () Bool)

(assert (=> b!951435 m!883159))

(assert (=> b!951435 m!883109))

(assert (=> b!951435 m!883109))

(declare-fun m!883161 () Bool)

(assert (=> b!951435 m!883161))

(declare-fun m!883163 () Bool)

(assert (=> bm!41478 m!883163))

(assert (=> b!951445 m!883109))

(assert (=> b!951445 m!883109))

(assert (=> b!951445 m!883111))

(assert (=> bm!41481 m!883149))

(assert (=> b!951309 d!115165))

(declare-fun d!115167 () Bool)

(declare-fun e!535774 () Bool)

(assert (=> d!115167 e!535774))

(declare-fun c!99427 () Bool)

(assert (=> d!115167 (= c!99427 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428512 () Unit!31895)

(declare-fun choose!1601 (array!57553 array!57551 (_ BitVec 32) (_ BitVec 32) V!32671 V!32671 (_ BitVec 64) Int) Unit!31895)

(assert (=> d!115167 (= lt!428512 (choose!1601 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) key!756 (defaultEntry!5806 thiss!1141)))))

(assert (=> d!115167 (validMask!0 (mask!27624 thiss!1141))))

(assert (=> d!115167 (= (lemmaKeyInListMapIsInArray!311 (_keys!10746 thiss!1141) (_values!5829 thiss!1141) (mask!27624 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) key!756 (defaultEntry!5806 thiss!1141)) lt!428512)))

(declare-fun b!951458 () Bool)

(assert (=> b!951458 (= e!535774 (arrayContainsKey!0 (_keys!10746 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951459 () Bool)

(assert (=> b!951459 (= e!535774 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115167 c!99427) b!951458))

(assert (= (and d!115167 (not c!99427)) b!951459))

(declare-fun m!883165 () Bool)

(assert (=> d!115167 m!883165))

(assert (=> d!115167 m!883029))

(assert (=> b!951458 m!883035))

(assert (=> b!951307 d!115167))

(declare-fun d!115169 () Bool)

(declare-fun lt!428515 () (_ BitVec 32))

(assert (=> d!115169 (and (or (bvslt lt!428515 #b00000000000000000000000000000000) (bvsge lt!428515 (size!28152 (_keys!10746 thiss!1141))) (and (bvsge lt!428515 #b00000000000000000000000000000000) (bvslt lt!428515 (size!28152 (_keys!10746 thiss!1141))))) (bvsge lt!428515 #b00000000000000000000000000000000) (bvslt lt!428515 (size!28152 (_keys!10746 thiss!1141))) (= (select (arr!27672 (_keys!10746 thiss!1141)) lt!428515) key!756))))

(declare-fun e!535777 () (_ BitVec 32))

(assert (=> d!115169 (= lt!428515 e!535777)))

(declare-fun c!99430 () Bool)

(assert (=> d!115169 (= c!99430 (= (select (arr!27672 (_keys!10746 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28152 (_keys!10746 thiss!1141))) (bvslt (size!28152 (_keys!10746 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115169 (= (arrayScanForKey!0 (_keys!10746 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428515)))

(declare-fun b!951464 () Bool)

(assert (=> b!951464 (= e!535777 #b00000000000000000000000000000000)))

(declare-fun b!951465 () Bool)

(assert (=> b!951465 (= e!535777 (arrayScanForKey!0 (_keys!10746 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115169 c!99430) b!951464))

(assert (= (and d!115169 (not c!99430)) b!951465))

(declare-fun m!883167 () Bool)

(assert (=> d!115169 m!883167))

(assert (=> d!115169 m!883109))

(declare-fun m!883169 () Bool)

(assert (=> b!951465 m!883169))

(assert (=> b!951307 d!115169))

(declare-fun d!115171 () Bool)

(assert (=> d!115171 (= (validMask!0 (mask!27624 thiss!1141)) (and (or (= (mask!27624 thiss!1141) #b00000000000000000000000000000111) (= (mask!27624 thiss!1141) #b00000000000000000000000000001111) (= (mask!27624 thiss!1141) #b00000000000000000000000000011111) (= (mask!27624 thiss!1141) #b00000000000000000000000000111111) (= (mask!27624 thiss!1141) #b00000000000000000000000001111111) (= (mask!27624 thiss!1141) #b00000000000000000000000011111111) (= (mask!27624 thiss!1141) #b00000000000000000000000111111111) (= (mask!27624 thiss!1141) #b00000000000000000000001111111111) (= (mask!27624 thiss!1141) #b00000000000000000000011111111111) (= (mask!27624 thiss!1141) #b00000000000000000000111111111111) (= (mask!27624 thiss!1141) #b00000000000000000001111111111111) (= (mask!27624 thiss!1141) #b00000000000000000011111111111111) (= (mask!27624 thiss!1141) #b00000000000000000111111111111111) (= (mask!27624 thiss!1141) #b00000000000000001111111111111111) (= (mask!27624 thiss!1141) #b00000000000000011111111111111111) (= (mask!27624 thiss!1141) #b00000000000000111111111111111111) (= (mask!27624 thiss!1141) #b00000000000001111111111111111111) (= (mask!27624 thiss!1141) #b00000000000011111111111111111111) (= (mask!27624 thiss!1141) #b00000000000111111111111111111111) (= (mask!27624 thiss!1141) #b00000000001111111111111111111111) (= (mask!27624 thiss!1141) #b00000000011111111111111111111111) (= (mask!27624 thiss!1141) #b00000000111111111111111111111111) (= (mask!27624 thiss!1141) #b00000001111111111111111111111111) (= (mask!27624 thiss!1141) #b00000011111111111111111111111111) (= (mask!27624 thiss!1141) #b00000111111111111111111111111111) (= (mask!27624 thiss!1141) #b00001111111111111111111111111111) (= (mask!27624 thiss!1141) #b00011111111111111111111111111111) (= (mask!27624 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27624 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!951307 d!115171))

(declare-fun d!115173 () Bool)

(assert (=> d!115173 (arrayForallSeekEntryOrOpenFound!0 lt!428399 (_keys!10746 thiss!1141) (mask!27624 thiss!1141))))

(declare-fun lt!428518 () Unit!31895)

(declare-fun choose!38 (array!57553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31895)

(assert (=> d!115173 (= lt!428518 (choose!38 (_keys!10746 thiss!1141) (mask!27624 thiss!1141) #b00000000000000000000000000000000 lt!428399))))

(assert (=> d!115173 (validMask!0 (mask!27624 thiss!1141))))

(assert (=> d!115173 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10746 thiss!1141) (mask!27624 thiss!1141) #b00000000000000000000000000000000 lt!428399) lt!428518)))

(declare-fun bs!26705 () Bool)

(assert (= bs!26705 d!115173))

(assert (=> bs!26705 m!883027))

(declare-fun m!883171 () Bool)

(assert (=> bs!26705 m!883171))

(assert (=> bs!26705 m!883029))

(assert (=> b!951307 d!115173))

(declare-fun d!115175 () Bool)

(declare-fun res!637634 () Bool)

(declare-fun e!535782 () Bool)

(assert (=> d!115175 (=> res!637634 e!535782)))

(assert (=> d!115175 (= res!637634 (= (select (arr!27672 (_keys!10746 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115175 (= (arrayContainsKey!0 (_keys!10746 thiss!1141) key!756 #b00000000000000000000000000000000) e!535782)))

(declare-fun b!951470 () Bool)

(declare-fun e!535783 () Bool)

(assert (=> b!951470 (= e!535782 e!535783)))

(declare-fun res!637635 () Bool)

(assert (=> b!951470 (=> (not res!637635) (not e!535783))))

(assert (=> b!951470 (= res!637635 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28152 (_keys!10746 thiss!1141))))))

(declare-fun b!951471 () Bool)

(assert (=> b!951471 (= e!535783 (arrayContainsKey!0 (_keys!10746 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115175 (not res!637634)) b!951470))

(assert (= (and b!951470 res!637635) b!951471))

(assert (=> d!115175 m!883109))

(declare-fun m!883173 () Bool)

(assert (=> b!951471 m!883173))

(assert (=> b!951307 d!115175))

(declare-fun b!951481 () Bool)

(declare-fun e!535791 () Bool)

(declare-fun call!41488 () Bool)

(assert (=> b!951481 (= e!535791 call!41488)))

(declare-fun b!951482 () Bool)

(declare-fun e!535790 () Bool)

(assert (=> b!951482 (= e!535790 e!535791)))

(declare-fun c!99433 () Bool)

(assert (=> b!951482 (= c!99433 (validKeyInArray!0 (select (arr!27672 (_keys!10746 thiss!1141)) lt!428399)))))

(declare-fun b!951483 () Bool)

(declare-fun e!535792 () Bool)

(assert (=> b!951483 (= e!535791 e!535792)))

(declare-fun lt!428525 () (_ BitVec 64))

(assert (=> b!951483 (= lt!428525 (select (arr!27672 (_keys!10746 thiss!1141)) lt!428399))))

(declare-fun lt!428526 () Unit!31895)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57553 (_ BitVec 64) (_ BitVec 32)) Unit!31895)

(assert (=> b!951483 (= lt!428526 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10746 thiss!1141) lt!428525 lt!428399))))

(assert (=> b!951483 (arrayContainsKey!0 (_keys!10746 thiss!1141) lt!428525 #b00000000000000000000000000000000)))

(declare-fun lt!428527 () Unit!31895)

(assert (=> b!951483 (= lt!428527 lt!428526)))

(declare-fun res!637640 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57553 (_ BitVec 32)) SeekEntryResult!9150)

(assert (=> b!951483 (= res!637640 (= (seekEntryOrOpen!0 (select (arr!27672 (_keys!10746 thiss!1141)) lt!428399) (_keys!10746 thiss!1141) (mask!27624 thiss!1141)) (Found!9150 lt!428399)))))

(assert (=> b!951483 (=> (not res!637640) (not e!535792))))

(declare-fun bm!41485 () Bool)

(assert (=> bm!41485 (= call!41488 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!428399 #b00000000000000000000000000000001) (_keys!10746 thiss!1141) (mask!27624 thiss!1141)))))

(declare-fun d!115177 () Bool)

(declare-fun res!637641 () Bool)

(assert (=> d!115177 (=> res!637641 e!535790)))

(assert (=> d!115177 (= res!637641 (bvsge lt!428399 (size!28152 (_keys!10746 thiss!1141))))))

(assert (=> d!115177 (= (arrayForallSeekEntryOrOpenFound!0 lt!428399 (_keys!10746 thiss!1141) (mask!27624 thiss!1141)) e!535790)))

(declare-fun b!951480 () Bool)

(assert (=> b!951480 (= e!535792 call!41488)))

(assert (= (and d!115177 (not res!637641)) b!951482))

(assert (= (and b!951482 c!99433) b!951483))

(assert (= (and b!951482 (not c!99433)) b!951481))

(assert (= (and b!951483 res!637640) b!951480))

(assert (= (or b!951480 b!951481) bm!41485))

(declare-fun m!883175 () Bool)

(assert (=> b!951482 m!883175))

(assert (=> b!951482 m!883175))

(declare-fun m!883177 () Bool)

(assert (=> b!951482 m!883177))

(assert (=> b!951483 m!883175))

(declare-fun m!883179 () Bool)

(assert (=> b!951483 m!883179))

(declare-fun m!883181 () Bool)

(assert (=> b!951483 m!883181))

(assert (=> b!951483 m!883175))

(declare-fun m!883183 () Bool)

(assert (=> b!951483 m!883183))

(declare-fun m!883185 () Bool)

(assert (=> bm!41485 m!883185))

(assert (=> b!951307 d!115177))

(declare-fun d!115179 () Bool)

(declare-fun res!637648 () Bool)

(declare-fun e!535795 () Bool)

(assert (=> d!115179 (=> (not res!637648) (not e!535795))))

(declare-fun simpleValid!379 (LongMapFixedSize!4966) Bool)

(assert (=> d!115179 (= res!637648 (simpleValid!379 thiss!1141))))

(assert (=> d!115179 (= (valid!1895 thiss!1141) e!535795)))

(declare-fun b!951490 () Bool)

(declare-fun res!637649 () Bool)

(assert (=> b!951490 (=> (not res!637649) (not e!535795))))

(declare-fun arrayCountValidKeys!0 (array!57553 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951490 (= res!637649 (= (arrayCountValidKeys!0 (_keys!10746 thiss!1141) #b00000000000000000000000000000000 (size!28152 (_keys!10746 thiss!1141))) (_size!2538 thiss!1141)))))

(declare-fun b!951491 () Bool)

(declare-fun res!637650 () Bool)

(assert (=> b!951491 (=> (not res!637650) (not e!535795))))

(assert (=> b!951491 (= res!637650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10746 thiss!1141) (mask!27624 thiss!1141)))))

(declare-fun b!951492 () Bool)

(declare-datatypes ((List!19360 0))(
  ( (Nil!19357) (Cons!19356 (h!20517 (_ BitVec 64)) (t!27702 List!19360)) )
))
(declare-fun arrayNoDuplicates!0 (array!57553 (_ BitVec 32) List!19360) Bool)

(assert (=> b!951492 (= e!535795 (arrayNoDuplicates!0 (_keys!10746 thiss!1141) #b00000000000000000000000000000000 Nil!19357))))

(assert (= (and d!115179 res!637648) b!951490))

(assert (= (and b!951490 res!637649) b!951491))

(assert (= (and b!951491 res!637650) b!951492))

(declare-fun m!883187 () Bool)

(assert (=> d!115179 m!883187))

(declare-fun m!883189 () Bool)

(assert (=> b!951490 m!883189))

(declare-fun m!883191 () Bool)

(assert (=> b!951491 m!883191))

(declare-fun m!883193 () Bool)

(assert (=> b!951492 m!883193))

(assert (=> start!81358 d!115179))

(declare-fun d!115181 () Bool)

(assert (=> d!115181 (= (array_inv!21536 (_keys!10746 thiss!1141)) (bvsge (size!28152 (_keys!10746 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951313 d!115181))

(declare-fun d!115183 () Bool)

(assert (=> d!115183 (= (array_inv!21537 (_values!5829 thiss!1141)) (bvsge (size!28151 (_values!5829 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951313 d!115183))

(declare-fun b!951500 () Bool)

(declare-fun e!535801 () Bool)

(assert (=> b!951500 (= e!535801 tp_is_empty!20779)))

(declare-fun condMapEmpty!33105 () Bool)

(declare-fun mapDefault!33105 () ValueCell!9908)

(assert (=> mapNonEmpty!33096 (= condMapEmpty!33105 (= mapRest!33096 ((as const (Array (_ BitVec 32) ValueCell!9908)) mapDefault!33105)))))

(declare-fun mapRes!33105 () Bool)

(assert (=> mapNonEmpty!33096 (= tp!63425 (and e!535801 mapRes!33105))))

(declare-fun b!951499 () Bool)

(declare-fun e!535800 () Bool)

(assert (=> b!951499 (= e!535800 tp_is_empty!20779)))

(declare-fun mapIsEmpty!33105 () Bool)

(assert (=> mapIsEmpty!33105 mapRes!33105))

(declare-fun mapNonEmpty!33105 () Bool)

(declare-fun tp!63441 () Bool)

(assert (=> mapNonEmpty!33105 (= mapRes!33105 (and tp!63441 e!535800))))

(declare-fun mapKey!33105 () (_ BitVec 32))

(declare-fun mapValue!33105 () ValueCell!9908)

(declare-fun mapRest!33105 () (Array (_ BitVec 32) ValueCell!9908))

(assert (=> mapNonEmpty!33105 (= mapRest!33096 (store mapRest!33105 mapKey!33105 mapValue!33105))))

(assert (= (and mapNonEmpty!33096 condMapEmpty!33105) mapIsEmpty!33105))

(assert (= (and mapNonEmpty!33096 (not condMapEmpty!33105)) mapNonEmpty!33105))

(assert (= (and mapNonEmpty!33105 ((_ is ValueCellFull!9908) mapValue!33105)) b!951499))

(assert (= (and mapNonEmpty!33096 ((_ is ValueCellFull!9908) mapDefault!33105)) b!951500))

(declare-fun m!883195 () Bool)

(assert (=> mapNonEmpty!33105 m!883195))

(declare-fun b_lambda!14379 () Bool)

(assert (= b_lambda!14377 (or (and b!951313 b_free!18271) b_lambda!14379)))

(check-sat (not b!951376) (not d!115165) (not d!115163) (not b!951492) (not mapNonEmpty!33105) (not b!951471) (not b!951465) (not b!951490) (not d!115173) (not bm!41478) (not d!115167) (not b!951446) tp_is_empty!20779 (not b_next!18271) (not b!951458) (not b!951491) b_and!29721 (not b!951432) (not b!951435) (not b!951388) (not b!951442) (not bm!41476) (not bm!41482) (not b!951439) (not b!951483) (not b!951438) (not b!951386) (not bm!41485) (not bm!41481) (not d!115179) (not d!115161) (not b_lambda!14379) (not b!951445) (not b!951449) (not b!951482))
(check-sat b_and!29721 (not b_next!18271))
