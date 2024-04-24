; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17940 () Bool)

(assert start!17940)

(declare-fun b!178813 () Bool)

(declare-fun b_free!4411 () Bool)

(declare-fun b_next!4411 () Bool)

(assert (=> b!178813 (= b_free!4411 (not b_next!4411))))

(declare-fun tp!15951 () Bool)

(declare-fun b_and!10947 () Bool)

(assert (=> b!178813 (= tp!15951 b_and!10947)))

(declare-fun b!178810 () Bool)

(declare-fun e!117837 () Bool)

(declare-fun tp_is_empty!4183 () Bool)

(assert (=> b!178810 (= e!117837 tp_is_empty!4183)))

(declare-fun mapNonEmpty!7155 () Bool)

(declare-fun mapRes!7155 () Bool)

(declare-fun tp!15950 () Bool)

(declare-fun e!117834 () Bool)

(assert (=> mapNonEmpty!7155 (= mapRes!7155 (and tp!15950 e!117834))))

(declare-datatypes ((V!5225 0))(
  ( (V!5226 (val!2136 Int)) )
))
(declare-datatypes ((ValueCell!1748 0))(
  ( (ValueCellFull!1748 (v!4022 V!5225)) (EmptyCell!1748) )
))
(declare-fun mapValue!7155 () ValueCell!1748)

(declare-fun mapRest!7155 () (Array (_ BitVec 32) ValueCell!1748))

(declare-fun mapKey!7155 () (_ BitVec 32))

(declare-datatypes ((array!7513 0))(
  ( (array!7514 (arr!3560 (Array (_ BitVec 32) (_ BitVec 64))) (size!3867 (_ BitVec 32))) )
))
(declare-datatypes ((array!7515 0))(
  ( (array!7516 (arr!3561 (Array (_ BitVec 32) ValueCell!1748)) (size!3868 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2404 0))(
  ( (LongMapFixedSize!2405 (defaultEntry!3673 Int) (mask!8641 (_ BitVec 32)) (extraKeys!3410 (_ BitVec 32)) (zeroValue!3514 V!5225) (minValue!3514 V!5225) (_size!1251 (_ BitVec 32)) (_keys!5554 array!7513) (_values!3656 array!7515) (_vacant!1251 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2404)

(assert (=> mapNonEmpty!7155 (= (arr!3561 (_values!3656 thiss!1248)) (store mapRest!7155 mapKey!7155 mapValue!7155))))

(declare-fun b!178811 () Bool)

(declare-fun e!117839 () Bool)

(assert (=> b!178811 (= e!117839 (and (= (size!3868 (_values!3656 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8641 thiss!1248))) (= (size!3867 (_keys!5554 thiss!1248)) (size!3868 (_values!3656 thiss!1248))) (bvsge (mask!8641 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3410 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3410 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!178812 () Bool)

(declare-fun e!117836 () Bool)

(assert (=> b!178812 (= e!117836 (and e!117837 mapRes!7155))))

(declare-fun condMapEmpty!7155 () Bool)

(declare-fun mapDefault!7155 () ValueCell!1748)

(assert (=> b!178812 (= condMapEmpty!7155 (= (arr!3561 (_values!3656 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1748)) mapDefault!7155)))))

(declare-fun e!117835 () Bool)

(declare-fun array_inv!2301 (array!7513) Bool)

(declare-fun array_inv!2302 (array!7515) Bool)

(assert (=> b!178813 (= e!117835 (and tp!15951 tp_is_empty!4183 (array_inv!2301 (_keys!5554 thiss!1248)) (array_inv!2302 (_values!3656 thiss!1248)) e!117836))))

(declare-fun b!178814 () Bool)

(declare-fun res!84701 () Bool)

(assert (=> b!178814 (=> (not res!84701) (not e!117839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!178814 (= res!84701 (validMask!0 (mask!8641 thiss!1248)))))

(declare-fun b!178815 () Bool)

(declare-fun res!84699 () Bool)

(assert (=> b!178815 (=> (not res!84699) (not e!117839))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!573 0))(
  ( (MissingZero!573 (index!4460 (_ BitVec 32))) (Found!573 (index!4461 (_ BitVec 32))) (Intermediate!573 (undefined!1385 Bool) (index!4462 (_ BitVec 32)) (x!19567 (_ BitVec 32))) (Undefined!573) (MissingVacant!573 (index!4463 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7513 (_ BitVec 32)) SeekEntryResult!573)

(assert (=> b!178815 (= res!84699 ((_ is Undefined!573) (seekEntryOrOpen!0 key!828 (_keys!5554 thiss!1248) (mask!8641 thiss!1248))))))

(declare-fun b!178816 () Bool)

(declare-fun res!84698 () Bool)

(assert (=> b!178816 (=> (not res!84698) (not e!117839))))

(declare-datatypes ((tuple2!3278 0))(
  ( (tuple2!3279 (_1!1650 (_ BitVec 64)) (_2!1650 V!5225)) )
))
(declare-datatypes ((List!2243 0))(
  ( (Nil!2240) (Cons!2239 (h!2863 tuple2!3278) (t!7075 List!2243)) )
))
(declare-datatypes ((ListLongMap!2211 0))(
  ( (ListLongMap!2212 (toList!1121 List!2243)) )
))
(declare-fun contains!1204 (ListLongMap!2211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!776 (array!7513 array!7515 (_ BitVec 32) (_ BitVec 32) V!5225 V!5225 (_ BitVec 32) Int) ListLongMap!2211)

(assert (=> b!178816 (= res!84698 (not (contains!1204 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!7155 () Bool)

(assert (=> mapIsEmpty!7155 mapRes!7155))

(declare-fun res!84697 () Bool)

(assert (=> start!17940 (=> (not res!84697) (not e!117839))))

(declare-fun valid!1027 (LongMapFixedSize!2404) Bool)

(assert (=> start!17940 (= res!84697 (valid!1027 thiss!1248))))

(assert (=> start!17940 e!117839))

(assert (=> start!17940 e!117835))

(assert (=> start!17940 true))

(declare-fun b!178817 () Bool)

(assert (=> b!178817 (= e!117834 tp_is_empty!4183)))

(declare-fun b!178818 () Bool)

(declare-fun res!84700 () Bool)

(assert (=> b!178818 (=> (not res!84700) (not e!117839))))

(assert (=> b!178818 (= res!84700 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!17940 res!84697) b!178818))

(assert (= (and b!178818 res!84700) b!178815))

(assert (= (and b!178815 res!84699) b!178816))

(assert (= (and b!178816 res!84698) b!178814))

(assert (= (and b!178814 res!84701) b!178811))

(assert (= (and b!178812 condMapEmpty!7155) mapIsEmpty!7155))

(assert (= (and b!178812 (not condMapEmpty!7155)) mapNonEmpty!7155))

(assert (= (and mapNonEmpty!7155 ((_ is ValueCellFull!1748) mapValue!7155)) b!178817))

(assert (= (and b!178812 ((_ is ValueCellFull!1748) mapDefault!7155)) b!178810))

(assert (= b!178813 b!178812))

(assert (= start!17940 b!178813))

(declare-fun m!207319 () Bool)

(assert (=> mapNonEmpty!7155 m!207319))

(declare-fun m!207321 () Bool)

(assert (=> b!178816 m!207321))

(assert (=> b!178816 m!207321))

(declare-fun m!207323 () Bool)

(assert (=> b!178816 m!207323))

(declare-fun m!207325 () Bool)

(assert (=> start!17940 m!207325))

(declare-fun m!207327 () Bool)

(assert (=> b!178813 m!207327))

(declare-fun m!207329 () Bool)

(assert (=> b!178813 m!207329))

(declare-fun m!207331 () Bool)

(assert (=> b!178814 m!207331))

(declare-fun m!207333 () Bool)

(assert (=> b!178815 m!207333))

(check-sat tp_is_empty!4183 (not b!178814) (not b!178815) (not start!17940) (not b_next!4411) b_and!10947 (not b!178813) (not b!178816) (not mapNonEmpty!7155))
(check-sat b_and!10947 (not b_next!4411))
(get-model)

(declare-fun d!54109 () Bool)

(assert (=> d!54109 (= (validMask!0 (mask!8641 thiss!1248)) (and (or (= (mask!8641 thiss!1248) #b00000000000000000000000000000111) (= (mask!8641 thiss!1248) #b00000000000000000000000000001111) (= (mask!8641 thiss!1248) #b00000000000000000000000000011111) (= (mask!8641 thiss!1248) #b00000000000000000000000000111111) (= (mask!8641 thiss!1248) #b00000000000000000000000001111111) (= (mask!8641 thiss!1248) #b00000000000000000000000011111111) (= (mask!8641 thiss!1248) #b00000000000000000000000111111111) (= (mask!8641 thiss!1248) #b00000000000000000000001111111111) (= (mask!8641 thiss!1248) #b00000000000000000000011111111111) (= (mask!8641 thiss!1248) #b00000000000000000000111111111111) (= (mask!8641 thiss!1248) #b00000000000000000001111111111111) (= (mask!8641 thiss!1248) #b00000000000000000011111111111111) (= (mask!8641 thiss!1248) #b00000000000000000111111111111111) (= (mask!8641 thiss!1248) #b00000000000000001111111111111111) (= (mask!8641 thiss!1248) #b00000000000000011111111111111111) (= (mask!8641 thiss!1248) #b00000000000000111111111111111111) (= (mask!8641 thiss!1248) #b00000000000001111111111111111111) (= (mask!8641 thiss!1248) #b00000000000011111111111111111111) (= (mask!8641 thiss!1248) #b00000000000111111111111111111111) (= (mask!8641 thiss!1248) #b00000000001111111111111111111111) (= (mask!8641 thiss!1248) #b00000000011111111111111111111111) (= (mask!8641 thiss!1248) #b00000000111111111111111111111111) (= (mask!8641 thiss!1248) #b00000001111111111111111111111111) (= (mask!8641 thiss!1248) #b00000011111111111111111111111111) (= (mask!8641 thiss!1248) #b00000111111111111111111111111111) (= (mask!8641 thiss!1248) #b00001111111111111111111111111111) (= (mask!8641 thiss!1248) #b00011111111111111111111111111111) (= (mask!8641 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8641 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!178814 d!54109))

(declare-fun b!178885 () Bool)

(declare-fun e!117883 () SeekEntryResult!573)

(declare-fun e!117882 () SeekEntryResult!573)

(assert (=> b!178885 (= e!117883 e!117882)))

(declare-fun lt!88416 () (_ BitVec 64))

(declare-fun lt!88418 () SeekEntryResult!573)

(assert (=> b!178885 (= lt!88416 (select (arr!3560 (_keys!5554 thiss!1248)) (index!4462 lt!88418)))))

(declare-fun c!32069 () Bool)

(assert (=> b!178885 (= c!32069 (= lt!88416 key!828))))

(declare-fun d!54111 () Bool)

(declare-fun lt!88417 () SeekEntryResult!573)

(assert (=> d!54111 (and (or ((_ is Undefined!573) lt!88417) (not ((_ is Found!573) lt!88417)) (and (bvsge (index!4461 lt!88417) #b00000000000000000000000000000000) (bvslt (index!4461 lt!88417) (size!3867 (_keys!5554 thiss!1248))))) (or ((_ is Undefined!573) lt!88417) ((_ is Found!573) lt!88417) (not ((_ is MissingZero!573) lt!88417)) (and (bvsge (index!4460 lt!88417) #b00000000000000000000000000000000) (bvslt (index!4460 lt!88417) (size!3867 (_keys!5554 thiss!1248))))) (or ((_ is Undefined!573) lt!88417) ((_ is Found!573) lt!88417) ((_ is MissingZero!573) lt!88417) (not ((_ is MissingVacant!573) lt!88417)) (and (bvsge (index!4463 lt!88417) #b00000000000000000000000000000000) (bvslt (index!4463 lt!88417) (size!3867 (_keys!5554 thiss!1248))))) (or ((_ is Undefined!573) lt!88417) (ite ((_ is Found!573) lt!88417) (= (select (arr!3560 (_keys!5554 thiss!1248)) (index!4461 lt!88417)) key!828) (ite ((_ is MissingZero!573) lt!88417) (= (select (arr!3560 (_keys!5554 thiss!1248)) (index!4460 lt!88417)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!573) lt!88417) (= (select (arr!3560 (_keys!5554 thiss!1248)) (index!4463 lt!88417)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54111 (= lt!88417 e!117883)))

(declare-fun c!32068 () Bool)

(assert (=> d!54111 (= c!32068 (and ((_ is Intermediate!573) lt!88418) (undefined!1385 lt!88418)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7513 (_ BitVec 32)) SeekEntryResult!573)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54111 (= lt!88418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8641 thiss!1248)) key!828 (_keys!5554 thiss!1248) (mask!8641 thiss!1248)))))

(assert (=> d!54111 (validMask!0 (mask!8641 thiss!1248))))

(assert (=> d!54111 (= (seekEntryOrOpen!0 key!828 (_keys!5554 thiss!1248) (mask!8641 thiss!1248)) lt!88417)))

(declare-fun b!178886 () Bool)

(declare-fun e!117884 () SeekEntryResult!573)

(assert (=> b!178886 (= e!117884 (MissingZero!573 (index!4462 lt!88418)))))

(declare-fun b!178887 () Bool)

(assert (=> b!178887 (= e!117883 Undefined!573)))

(declare-fun b!178888 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7513 (_ BitVec 32)) SeekEntryResult!573)

(assert (=> b!178888 (= e!117884 (seekKeyOrZeroReturnVacant!0 (x!19567 lt!88418) (index!4462 lt!88418) (index!4462 lt!88418) key!828 (_keys!5554 thiss!1248) (mask!8641 thiss!1248)))))

(declare-fun b!178889 () Bool)

(assert (=> b!178889 (= e!117882 (Found!573 (index!4462 lt!88418)))))

(declare-fun b!178890 () Bool)

(declare-fun c!32067 () Bool)

(assert (=> b!178890 (= c!32067 (= lt!88416 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178890 (= e!117882 e!117884)))

(assert (= (and d!54111 c!32068) b!178887))

(assert (= (and d!54111 (not c!32068)) b!178885))

(assert (= (and b!178885 c!32069) b!178889))

(assert (= (and b!178885 (not c!32069)) b!178890))

(assert (= (and b!178890 c!32067) b!178886))

(assert (= (and b!178890 (not c!32067)) b!178888))

(declare-fun m!207367 () Bool)

(assert (=> b!178885 m!207367))

(declare-fun m!207369 () Bool)

(assert (=> d!54111 m!207369))

(declare-fun m!207371 () Bool)

(assert (=> d!54111 m!207371))

(declare-fun m!207373 () Bool)

(assert (=> d!54111 m!207373))

(declare-fun m!207375 () Bool)

(assert (=> d!54111 m!207375))

(assert (=> d!54111 m!207371))

(declare-fun m!207377 () Bool)

(assert (=> d!54111 m!207377))

(assert (=> d!54111 m!207331))

(declare-fun m!207379 () Bool)

(assert (=> b!178888 m!207379))

(assert (=> b!178815 d!54111))

(declare-fun d!54113 () Bool)

(declare-fun res!84738 () Bool)

(declare-fun e!117887 () Bool)

(assert (=> d!54113 (=> (not res!84738) (not e!117887))))

(declare-fun simpleValid!159 (LongMapFixedSize!2404) Bool)

(assert (=> d!54113 (= res!84738 (simpleValid!159 thiss!1248))))

(assert (=> d!54113 (= (valid!1027 thiss!1248) e!117887)))

(declare-fun b!178897 () Bool)

(declare-fun res!84739 () Bool)

(assert (=> b!178897 (=> (not res!84739) (not e!117887))))

(declare-fun arrayCountValidKeys!0 (array!7513 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178897 (= res!84739 (= (arrayCountValidKeys!0 (_keys!5554 thiss!1248) #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))) (_size!1251 thiss!1248)))))

(declare-fun b!178898 () Bool)

(declare-fun res!84740 () Bool)

(assert (=> b!178898 (=> (not res!84740) (not e!117887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7513 (_ BitVec 32)) Bool)

(assert (=> b!178898 (= res!84740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5554 thiss!1248) (mask!8641 thiss!1248)))))

(declare-fun b!178899 () Bool)

(declare-datatypes ((List!2244 0))(
  ( (Nil!2241) (Cons!2240 (h!2864 (_ BitVec 64)) (t!7078 List!2244)) )
))
(declare-fun arrayNoDuplicates!0 (array!7513 (_ BitVec 32) List!2244) Bool)

(assert (=> b!178899 (= e!117887 (arrayNoDuplicates!0 (_keys!5554 thiss!1248) #b00000000000000000000000000000000 Nil!2241))))

(assert (= (and d!54113 res!84738) b!178897))

(assert (= (and b!178897 res!84739) b!178898))

(assert (= (and b!178898 res!84740) b!178899))

(declare-fun m!207381 () Bool)

(assert (=> d!54113 m!207381))

(declare-fun m!207383 () Bool)

(assert (=> b!178897 m!207383))

(declare-fun m!207385 () Bool)

(assert (=> b!178898 m!207385))

(declare-fun m!207387 () Bool)

(assert (=> b!178899 m!207387))

(assert (=> start!17940 d!54113))

(declare-fun d!54115 () Bool)

(declare-fun e!117892 () Bool)

(assert (=> d!54115 e!117892))

(declare-fun res!84743 () Bool)

(assert (=> d!54115 (=> res!84743 e!117892)))

(declare-fun lt!88427 () Bool)

(assert (=> d!54115 (= res!84743 (not lt!88427))))

(declare-fun lt!88428 () Bool)

(assert (=> d!54115 (= lt!88427 lt!88428)))

(declare-datatypes ((Unit!5451 0))(
  ( (Unit!5452) )
))
(declare-fun lt!88430 () Unit!5451)

(declare-fun e!117893 () Unit!5451)

(assert (=> d!54115 (= lt!88430 e!117893)))

(declare-fun c!32072 () Bool)

(assert (=> d!54115 (= c!32072 lt!88428)))

(declare-fun containsKey!204 (List!2243 (_ BitVec 64)) Bool)

(assert (=> d!54115 (= lt!88428 (containsKey!204 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))

(assert (=> d!54115 (= (contains!1204 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)) key!828) lt!88427)))

(declare-fun b!178906 () Bool)

(declare-fun lt!88429 () Unit!5451)

(assert (=> b!178906 (= e!117893 lt!88429)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!152 (List!2243 (_ BitVec 64)) Unit!5451)

(assert (=> b!178906 (= lt!88429 (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))

(declare-datatypes ((Option!207 0))(
  ( (Some!206 (v!4025 V!5225)) (None!205) )
))
(declare-fun isDefined!153 (Option!207) Bool)

(declare-fun getValueByKey!201 (List!2243 (_ BitVec 64)) Option!207)

(assert (=> b!178906 (isDefined!153 (getValueByKey!201 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))

(declare-fun b!178907 () Bool)

(declare-fun Unit!5453 () Unit!5451)

(assert (=> b!178907 (= e!117893 Unit!5453)))

(declare-fun b!178908 () Bool)

(assert (=> b!178908 (= e!117892 (isDefined!153 (getValueByKey!201 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828)))))

(assert (= (and d!54115 c!32072) b!178906))

(assert (= (and d!54115 (not c!32072)) b!178907))

(assert (= (and d!54115 (not res!84743)) b!178908))

(declare-fun m!207389 () Bool)

(assert (=> d!54115 m!207389))

(declare-fun m!207391 () Bool)

(assert (=> b!178906 m!207391))

(declare-fun m!207393 () Bool)

(assert (=> b!178906 m!207393))

(assert (=> b!178906 m!207393))

(declare-fun m!207395 () Bool)

(assert (=> b!178906 m!207395))

(assert (=> b!178908 m!207393))

(assert (=> b!178908 m!207393))

(assert (=> b!178908 m!207395))

(assert (=> b!178816 d!54115))

(declare-fun bm!18064 () Bool)

(declare-fun call!18069 () ListLongMap!2211)

(declare-fun call!18071 () ListLongMap!2211)

(assert (=> bm!18064 (= call!18069 call!18071)))

(declare-fun b!178951 () Bool)

(declare-fun c!32087 () Bool)

(assert (=> b!178951 (= c!32087 (and (not (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!117925 () ListLongMap!2211)

(declare-fun e!117920 () ListLongMap!2211)

(assert (=> b!178951 (= e!117925 e!117920)))

(declare-fun bm!18065 () Bool)

(declare-fun call!18068 () Bool)

(declare-fun lt!88496 () ListLongMap!2211)

(assert (=> bm!18065 (= call!18068 (contains!1204 lt!88496 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178952 () Bool)

(declare-fun e!117922 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!178952 (= e!117922 (validKeyInArray!0 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178953 () Bool)

(declare-fun call!18070 () ListLongMap!2211)

(assert (=> b!178953 (= e!117920 call!18070)))

(declare-fun b!178954 () Bool)

(declare-fun e!117930 () Unit!5451)

(declare-fun Unit!5454 () Unit!5451)

(assert (=> b!178954 (= e!117930 Unit!5454)))

(declare-fun bm!18066 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!176 (array!7513 array!7515 (_ BitVec 32) (_ BitVec 32) V!5225 V!5225 (_ BitVec 32) Int) ListLongMap!2211)

(assert (=> bm!18066 (= call!18071 (getCurrentListMapNoExtraKeys!176 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))

(declare-fun bm!18067 () Bool)

(declare-fun call!18072 () ListLongMap!2211)

(declare-fun call!18067 () ListLongMap!2211)

(assert (=> bm!18067 (= call!18072 call!18067)))

(declare-fun b!178955 () Bool)

(declare-fun e!117931 () ListLongMap!2211)

(assert (=> b!178955 (= e!117931 e!117925)))

(declare-fun c!32086 () Bool)

(assert (=> b!178955 (= c!32086 (and (not (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178956 () Bool)

(declare-fun e!117921 () Bool)

(assert (=> b!178956 (= e!117921 (validKeyInArray!0 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178957 () Bool)

(declare-fun e!117926 () Bool)

(assert (=> b!178957 (= e!117926 (not call!18068))))

(declare-fun b!178958 () Bool)

(declare-fun e!117924 () Bool)

(declare-fun apply!145 (ListLongMap!2211 (_ BitVec 64)) V!5225)

(assert (=> b!178958 (= e!117924 (= (apply!145 lt!88496 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3514 thiss!1248)))))

(declare-fun b!178959 () Bool)

(declare-fun e!117932 () Bool)

(declare-fun e!117927 () Bool)

(assert (=> b!178959 (= e!117932 e!117927)))

(declare-fun c!32088 () Bool)

(assert (=> b!178959 (= c!32088 (not (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178960 () Bool)

(declare-fun lt!88484 () Unit!5451)

(assert (=> b!178960 (= e!117930 lt!88484)))

(declare-fun lt!88476 () ListLongMap!2211)

(assert (=> b!178960 (= lt!88476 (getCurrentListMapNoExtraKeys!176 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))

(declare-fun lt!88487 () (_ BitVec 64))

(assert (=> b!178960 (= lt!88487 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88488 () (_ BitVec 64))

(assert (=> b!178960 (= lt!88488 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88486 () Unit!5451)

(declare-fun addStillContains!121 (ListLongMap!2211 (_ BitVec 64) V!5225 (_ BitVec 64)) Unit!5451)

(assert (=> b!178960 (= lt!88486 (addStillContains!121 lt!88476 lt!88487 (zeroValue!3514 thiss!1248) lt!88488))))

(declare-fun +!262 (ListLongMap!2211 tuple2!3278) ListLongMap!2211)

(assert (=> b!178960 (contains!1204 (+!262 lt!88476 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248))) lt!88488)))

(declare-fun lt!88490 () Unit!5451)

(assert (=> b!178960 (= lt!88490 lt!88486)))

(declare-fun lt!88480 () ListLongMap!2211)

(assert (=> b!178960 (= lt!88480 (getCurrentListMapNoExtraKeys!176 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))

(declare-fun lt!88493 () (_ BitVec 64))

(assert (=> b!178960 (= lt!88493 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88481 () (_ BitVec 64))

(assert (=> b!178960 (= lt!88481 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88491 () Unit!5451)

(declare-fun addApplyDifferent!121 (ListLongMap!2211 (_ BitVec 64) V!5225 (_ BitVec 64)) Unit!5451)

(assert (=> b!178960 (= lt!88491 (addApplyDifferent!121 lt!88480 lt!88493 (minValue!3514 thiss!1248) lt!88481))))

(assert (=> b!178960 (= (apply!145 (+!262 lt!88480 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248))) lt!88481) (apply!145 lt!88480 lt!88481))))

(declare-fun lt!88478 () Unit!5451)

(assert (=> b!178960 (= lt!88478 lt!88491)))

(declare-fun lt!88479 () ListLongMap!2211)

(assert (=> b!178960 (= lt!88479 (getCurrentListMapNoExtraKeys!176 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))

(declare-fun lt!88492 () (_ BitVec 64))

(assert (=> b!178960 (= lt!88492 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88494 () (_ BitVec 64))

(assert (=> b!178960 (= lt!88494 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88475 () Unit!5451)

(assert (=> b!178960 (= lt!88475 (addApplyDifferent!121 lt!88479 lt!88492 (zeroValue!3514 thiss!1248) lt!88494))))

(assert (=> b!178960 (= (apply!145 (+!262 lt!88479 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248))) lt!88494) (apply!145 lt!88479 lt!88494))))

(declare-fun lt!88483 () Unit!5451)

(assert (=> b!178960 (= lt!88483 lt!88475)))

(declare-fun lt!88485 () ListLongMap!2211)

(assert (=> b!178960 (= lt!88485 (getCurrentListMapNoExtraKeys!176 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))

(declare-fun lt!88482 () (_ BitVec 64))

(assert (=> b!178960 (= lt!88482 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88495 () (_ BitVec 64))

(assert (=> b!178960 (= lt!88495 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178960 (= lt!88484 (addApplyDifferent!121 lt!88485 lt!88482 (minValue!3514 thiss!1248) lt!88495))))

(assert (=> b!178960 (= (apply!145 (+!262 lt!88485 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248))) lt!88495) (apply!145 lt!88485 lt!88495))))

(declare-fun b!178961 () Bool)

(declare-fun e!117928 () Bool)

(assert (=> b!178961 (= e!117928 (= (apply!145 lt!88496 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3514 thiss!1248)))))

(declare-fun b!178962 () Bool)

(declare-fun res!84767 () Bool)

(assert (=> b!178962 (=> (not res!84767) (not e!117932))))

(declare-fun e!117923 () Bool)

(assert (=> b!178962 (= res!84767 e!117923)))

(declare-fun res!84762 () Bool)

(assert (=> b!178962 (=> res!84762 e!117923)))

(assert (=> b!178962 (= res!84762 (not e!117922))))

(declare-fun res!84765 () Bool)

(assert (=> b!178962 (=> (not res!84765) (not e!117922))))

(assert (=> b!178962 (= res!84765 (bvslt #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))

(declare-fun b!178963 () Bool)

(assert (=> b!178963 (= e!117931 (+!262 call!18067 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))

(declare-fun bm!18068 () Bool)

(declare-fun call!18073 () Bool)

(assert (=> bm!18068 (= call!18073 (contains!1204 lt!88496 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178964 () Bool)

(assert (=> b!178964 (= e!117927 (not call!18073))))

(declare-fun b!178965 () Bool)

(assert (=> b!178965 (= e!117925 call!18072)))

(declare-fun b!178966 () Bool)

(declare-fun e!117929 () Bool)

(declare-fun get!2047 (ValueCell!1748 V!5225) V!5225)

(declare-fun dynLambda!488 (Int (_ BitVec 64)) V!5225)

(assert (=> b!178966 (= e!117929 (= (apply!145 lt!88496 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)) (get!2047 (select (arr!3561 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3868 (_values!3656 thiss!1248))))))

(assert (=> b!178966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))

(declare-fun c!32085 () Bool)

(declare-fun bm!18069 () Bool)

(assert (=> bm!18069 (= call!18067 (+!262 (ite c!32085 call!18071 (ite c!32086 call!18069 call!18070)) (ite (or c!32085 c!32086) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))

(declare-fun b!178967 () Bool)

(assert (=> b!178967 (= e!117923 e!117929)))

(declare-fun res!84763 () Bool)

(assert (=> b!178967 (=> (not res!84763) (not e!117929))))

(assert (=> b!178967 (= res!84763 (contains!1204 lt!88496 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178967 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))

(declare-fun b!178968 () Bool)

(assert (=> b!178968 (= e!117927 e!117924)))

(declare-fun res!84768 () Bool)

(assert (=> b!178968 (= res!84768 call!18073)))

(assert (=> b!178968 (=> (not res!84768) (not e!117924))))

(declare-fun b!178969 () Bool)

(declare-fun res!84769 () Bool)

(assert (=> b!178969 (=> (not res!84769) (not e!117932))))

(assert (=> b!178969 (= res!84769 e!117926)))

(declare-fun c!32090 () Bool)

(assert (=> b!178969 (= c!32090 (not (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!178970 () Bool)

(assert (=> b!178970 (= e!117920 call!18072)))

(declare-fun d!54117 () Bool)

(assert (=> d!54117 e!117932))

(declare-fun res!84770 () Bool)

(assert (=> d!54117 (=> (not res!84770) (not e!117932))))

(assert (=> d!54117 (= res!84770 (or (bvsge #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))))

(declare-fun lt!88489 () ListLongMap!2211)

(assert (=> d!54117 (= lt!88496 lt!88489)))

(declare-fun lt!88477 () Unit!5451)

(assert (=> d!54117 (= lt!88477 e!117930)))

(declare-fun c!32089 () Bool)

(assert (=> d!54117 (= c!32089 e!117921)))

(declare-fun res!84764 () Bool)

(assert (=> d!54117 (=> (not res!84764) (not e!117921))))

(assert (=> d!54117 (= res!84764 (bvslt #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))

(assert (=> d!54117 (= lt!88489 e!117931)))

(assert (=> d!54117 (= c!32085 (and (not (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3410 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54117 (validMask!0 (mask!8641 thiss!1248))))

(assert (=> d!54117 (= (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)) lt!88496)))

(declare-fun bm!18070 () Bool)

(assert (=> bm!18070 (= call!18070 call!18069)))

(declare-fun b!178971 () Bool)

(assert (=> b!178971 (= e!117926 e!117928)))

(declare-fun res!84766 () Bool)

(assert (=> b!178971 (= res!84766 call!18068)))

(assert (=> b!178971 (=> (not res!84766) (not e!117928))))

(assert (= (and d!54117 c!32085) b!178963))

(assert (= (and d!54117 (not c!32085)) b!178955))

(assert (= (and b!178955 c!32086) b!178965))

(assert (= (and b!178955 (not c!32086)) b!178951))

(assert (= (and b!178951 c!32087) b!178970))

(assert (= (and b!178951 (not c!32087)) b!178953))

(assert (= (or b!178970 b!178953) bm!18070))

(assert (= (or b!178965 bm!18070) bm!18064))

(assert (= (or b!178965 b!178970) bm!18067))

(assert (= (or b!178963 bm!18064) bm!18066))

(assert (= (or b!178963 bm!18067) bm!18069))

(assert (= (and d!54117 res!84764) b!178956))

(assert (= (and d!54117 c!32089) b!178960))

(assert (= (and d!54117 (not c!32089)) b!178954))

(assert (= (and d!54117 res!84770) b!178962))

(assert (= (and b!178962 res!84765) b!178952))

(assert (= (and b!178962 (not res!84762)) b!178967))

(assert (= (and b!178967 res!84763) b!178966))

(assert (= (and b!178962 res!84767) b!178969))

(assert (= (and b!178969 c!32090) b!178971))

(assert (= (and b!178969 (not c!32090)) b!178957))

(assert (= (and b!178971 res!84766) b!178961))

(assert (= (or b!178971 b!178957) bm!18065))

(assert (= (and b!178969 res!84769) b!178959))

(assert (= (and b!178959 c!32088) b!178968))

(assert (= (and b!178959 (not c!32088)) b!178964))

(assert (= (and b!178968 res!84768) b!178958))

(assert (= (or b!178968 b!178964) bm!18068))

(declare-fun b_lambda!7117 () Bool)

(assert (=> (not b_lambda!7117) (not b!178966)))

(declare-fun t!7077 () Bool)

(declare-fun tb!2793 () Bool)

(assert (=> (and b!178813 (= (defaultEntry!3673 thiss!1248) (defaultEntry!3673 thiss!1248)) t!7077) tb!2793))

(declare-fun result!4669 () Bool)

(assert (=> tb!2793 (= result!4669 tp_is_empty!4183)))

(assert (=> b!178966 t!7077))

(declare-fun b_and!10953 () Bool)

(assert (= b_and!10947 (and (=> t!7077 result!4669) b_and!10953)))

(declare-fun m!207397 () Bool)

(assert (=> b!178966 m!207397))

(declare-fun m!207399 () Bool)

(assert (=> b!178966 m!207399))

(declare-fun m!207401 () Bool)

(assert (=> b!178966 m!207401))

(declare-fun m!207403 () Bool)

(assert (=> b!178966 m!207403))

(declare-fun m!207405 () Bool)

(assert (=> b!178966 m!207405))

(assert (=> b!178966 m!207401))

(assert (=> b!178966 m!207397))

(assert (=> b!178966 m!207403))

(declare-fun m!207407 () Bool)

(assert (=> bm!18065 m!207407))

(declare-fun m!207409 () Bool)

(assert (=> b!178963 m!207409))

(declare-fun m!207411 () Bool)

(assert (=> b!178958 m!207411))

(declare-fun m!207413 () Bool)

(assert (=> bm!18066 m!207413))

(declare-fun m!207415 () Bool)

(assert (=> b!178961 m!207415))

(assert (=> d!54117 m!207331))

(assert (=> b!178967 m!207397))

(assert (=> b!178967 m!207397))

(declare-fun m!207417 () Bool)

(assert (=> b!178967 m!207417))

(assert (=> b!178952 m!207397))

(assert (=> b!178952 m!207397))

(declare-fun m!207419 () Bool)

(assert (=> b!178952 m!207419))

(declare-fun m!207421 () Bool)

(assert (=> bm!18069 m!207421))

(declare-fun m!207423 () Bool)

(assert (=> bm!18068 m!207423))

(declare-fun m!207425 () Bool)

(assert (=> b!178960 m!207425))

(declare-fun m!207427 () Bool)

(assert (=> b!178960 m!207427))

(declare-fun m!207429 () Bool)

(assert (=> b!178960 m!207429))

(declare-fun m!207431 () Bool)

(assert (=> b!178960 m!207431))

(declare-fun m!207433 () Bool)

(assert (=> b!178960 m!207433))

(declare-fun m!207435 () Bool)

(assert (=> b!178960 m!207435))

(declare-fun m!207437 () Bool)

(assert (=> b!178960 m!207437))

(assert (=> b!178960 m!207425))

(declare-fun m!207439 () Bool)

(assert (=> b!178960 m!207439))

(declare-fun m!207441 () Bool)

(assert (=> b!178960 m!207441))

(declare-fun m!207443 () Bool)

(assert (=> b!178960 m!207443))

(declare-fun m!207445 () Bool)

(assert (=> b!178960 m!207445))

(assert (=> b!178960 m!207445))

(declare-fun m!207447 () Bool)

(assert (=> b!178960 m!207447))

(declare-fun m!207449 () Bool)

(assert (=> b!178960 m!207449))

(assert (=> b!178960 m!207397))

(declare-fun m!207451 () Bool)

(assert (=> b!178960 m!207451))

(assert (=> b!178960 m!207433))

(assert (=> b!178960 m!207413))

(assert (=> b!178960 m!207429))

(declare-fun m!207453 () Bool)

(assert (=> b!178960 m!207453))

(assert (=> b!178956 m!207397))

(assert (=> b!178956 m!207397))

(assert (=> b!178956 m!207419))

(assert (=> b!178816 d!54117))

(declare-fun d!54119 () Bool)

(assert (=> d!54119 (= (array_inv!2301 (_keys!5554 thiss!1248)) (bvsge (size!3867 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178813 d!54119))

(declare-fun d!54121 () Bool)

(assert (=> d!54121 (= (array_inv!2302 (_values!3656 thiss!1248)) (bvsge (size!3868 (_values!3656 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178813 d!54121))

(declare-fun b!178980 () Bool)

(declare-fun e!117938 () Bool)

(assert (=> b!178980 (= e!117938 tp_is_empty!4183)))

(declare-fun b!178981 () Bool)

(declare-fun e!117937 () Bool)

(assert (=> b!178981 (= e!117937 tp_is_empty!4183)))

(declare-fun mapIsEmpty!7164 () Bool)

(declare-fun mapRes!7164 () Bool)

(assert (=> mapIsEmpty!7164 mapRes!7164))

(declare-fun mapNonEmpty!7164 () Bool)

(declare-fun tp!15966 () Bool)

(assert (=> mapNonEmpty!7164 (= mapRes!7164 (and tp!15966 e!117938))))

(declare-fun mapKey!7164 () (_ BitVec 32))

(declare-fun mapRest!7164 () (Array (_ BitVec 32) ValueCell!1748))

(declare-fun mapValue!7164 () ValueCell!1748)

(assert (=> mapNonEmpty!7164 (= mapRest!7155 (store mapRest!7164 mapKey!7164 mapValue!7164))))

(declare-fun condMapEmpty!7164 () Bool)

(declare-fun mapDefault!7164 () ValueCell!1748)

(assert (=> mapNonEmpty!7155 (= condMapEmpty!7164 (= mapRest!7155 ((as const (Array (_ BitVec 32) ValueCell!1748)) mapDefault!7164)))))

(assert (=> mapNonEmpty!7155 (= tp!15950 (and e!117937 mapRes!7164))))

(assert (= (and mapNonEmpty!7155 condMapEmpty!7164) mapIsEmpty!7164))

(assert (= (and mapNonEmpty!7155 (not condMapEmpty!7164)) mapNonEmpty!7164))

(assert (= (and mapNonEmpty!7164 ((_ is ValueCellFull!1748) mapValue!7164)) b!178980))

(assert (= (and mapNonEmpty!7155 ((_ is ValueCellFull!1748) mapDefault!7164)) b!178981))

(declare-fun m!207455 () Bool)

(assert (=> mapNonEmpty!7164 m!207455))

(declare-fun b_lambda!7119 () Bool)

(assert (= b_lambda!7117 (or (and b!178813 b_free!4411) b_lambda!7119)))

(check-sat tp_is_empty!4183 (not b!178898) (not b!178956) (not bm!18066) (not mapNonEmpty!7164) (not b!178899) (not b!178908) (not b!178888) (not b!178961) (not b!178958) (not bm!18069) (not b!178906) (not d!54117) (not b!178966) (not d!54113) (not bm!18068) (not b!178960) (not d!54115) (not bm!18065) (not d!54111) (not b!178897) b_and!10953 (not b!178967) (not b!178952) (not b_lambda!7119) (not b!178963) (not b_next!4411))
(check-sat b_and!10953 (not b_next!4411))
(get-model)

(declare-fun d!54123 () Bool)

(declare-fun isEmpty!459 (Option!207) Bool)

(assert (=> d!54123 (= (isDefined!153 (getValueByKey!201 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828)) (not (isEmpty!459 (getValueByKey!201 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))))

(declare-fun bs!7357 () Bool)

(assert (= bs!7357 d!54123))

(assert (=> bs!7357 m!207393))

(declare-fun m!207457 () Bool)

(assert (=> bs!7357 m!207457))

(assert (=> b!178908 d!54123))

(declare-fun d!54125 () Bool)

(declare-fun c!32095 () Bool)

(assert (=> d!54125 (= c!32095 (and ((_ is Cons!2239) (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))) (= (_1!1650 (h!2863 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))))) key!828)))))

(declare-fun e!117943 () Option!207)

(assert (=> d!54125 (= (getValueByKey!201 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828) e!117943)))

(declare-fun b!178991 () Bool)

(declare-fun e!117944 () Option!207)

(assert (=> b!178991 (= e!117943 e!117944)))

(declare-fun c!32096 () Bool)

(assert (=> b!178991 (= c!32096 (and ((_ is Cons!2239) (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))) (not (= (_1!1650 (h!2863 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))))) key!828))))))

(declare-fun b!178990 () Bool)

(assert (=> b!178990 (= e!117943 (Some!206 (_2!1650 (h!2863 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))))))

(declare-fun b!178992 () Bool)

(assert (=> b!178992 (= e!117944 (getValueByKey!201 (t!7075 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))) key!828))))

(declare-fun b!178993 () Bool)

(assert (=> b!178993 (= e!117944 None!205)))

(assert (= (and d!54125 c!32095) b!178990))

(assert (= (and d!54125 (not c!32095)) b!178991))

(assert (= (and b!178991 c!32096) b!178992))

(assert (= (and b!178991 (not c!32096)) b!178993))

(declare-fun m!207459 () Bool)

(assert (=> b!178992 m!207459))

(assert (=> b!178908 d!54125))

(assert (=> d!54117 d!54109))

(declare-fun d!54127 () Bool)

(declare-fun get!2048 (Option!207) V!5225)

(assert (=> d!54127 (= (apply!145 lt!88496 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)) (get!2048 (getValueByKey!201 (toList!1121 lt!88496) (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7358 () Bool)

(assert (= bs!7358 d!54127))

(assert (=> bs!7358 m!207397))

(declare-fun m!207461 () Bool)

(assert (=> bs!7358 m!207461))

(assert (=> bs!7358 m!207461))

(declare-fun m!207463 () Bool)

(assert (=> bs!7358 m!207463))

(assert (=> b!178966 d!54127))

(declare-fun d!54129 () Bool)

(declare-fun c!32099 () Bool)

(assert (=> d!54129 (= c!32099 ((_ is ValueCellFull!1748) (select (arr!3561 (_values!3656 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117947 () V!5225)

(assert (=> d!54129 (= (get!2047 (select (arr!3561 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!117947)))

(declare-fun b!178998 () Bool)

(declare-fun get!2049 (ValueCell!1748 V!5225) V!5225)

(assert (=> b!178998 (= e!117947 (get!2049 (select (arr!3561 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178999 () Bool)

(declare-fun get!2050 (ValueCell!1748 V!5225) V!5225)

(assert (=> b!178999 (= e!117947 (get!2050 (select (arr!3561 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54129 c!32099) b!178998))

(assert (= (and d!54129 (not c!32099)) b!178999))

(assert (=> b!178998 m!207401))

(assert (=> b!178998 m!207403))

(declare-fun m!207465 () Bool)

(assert (=> b!178998 m!207465))

(assert (=> b!178999 m!207401))

(assert (=> b!178999 m!207403))

(declare-fun m!207467 () Bool)

(assert (=> b!178999 m!207467))

(assert (=> b!178966 d!54129))

(declare-fun d!54131 () Bool)

(assert (=> d!54131 (= (validKeyInArray!0 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178956 d!54131))

(declare-fun b!179012 () Bool)

(declare-fun c!32106 () Bool)

(declare-fun lt!88501 () (_ BitVec 64))

(assert (=> b!179012 (= c!32106 (= lt!88501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117955 () SeekEntryResult!573)

(declare-fun e!117956 () SeekEntryResult!573)

(assert (=> b!179012 (= e!117955 e!117956)))

(declare-fun b!179013 () Bool)

(assert (=> b!179013 (= e!117956 (MissingVacant!573 (index!4462 lt!88418)))))

(declare-fun b!179014 () Bool)

(declare-fun e!117954 () SeekEntryResult!573)

(assert (=> b!179014 (= e!117954 Undefined!573)))

(declare-fun b!179015 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!179015 (= e!117956 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19567 lt!88418) #b00000000000000000000000000000001) (nextIndex!0 (index!4462 lt!88418) (bvadd (x!19567 lt!88418) #b00000000000000000000000000000001) (mask!8641 thiss!1248)) (index!4462 lt!88418) key!828 (_keys!5554 thiss!1248) (mask!8641 thiss!1248)))))

(declare-fun b!179016 () Bool)

(assert (=> b!179016 (= e!117954 e!117955)))

(declare-fun c!32108 () Bool)

(assert (=> b!179016 (= c!32108 (= lt!88501 key!828))))

(declare-fun b!179017 () Bool)

(assert (=> b!179017 (= e!117955 (Found!573 (index!4462 lt!88418)))))

(declare-fun d!54133 () Bool)

(declare-fun lt!88502 () SeekEntryResult!573)

(assert (=> d!54133 (and (or ((_ is Undefined!573) lt!88502) (not ((_ is Found!573) lt!88502)) (and (bvsge (index!4461 lt!88502) #b00000000000000000000000000000000) (bvslt (index!4461 lt!88502) (size!3867 (_keys!5554 thiss!1248))))) (or ((_ is Undefined!573) lt!88502) ((_ is Found!573) lt!88502) (not ((_ is MissingVacant!573) lt!88502)) (not (= (index!4463 lt!88502) (index!4462 lt!88418))) (and (bvsge (index!4463 lt!88502) #b00000000000000000000000000000000) (bvslt (index!4463 lt!88502) (size!3867 (_keys!5554 thiss!1248))))) (or ((_ is Undefined!573) lt!88502) (ite ((_ is Found!573) lt!88502) (= (select (arr!3560 (_keys!5554 thiss!1248)) (index!4461 lt!88502)) key!828) (and ((_ is MissingVacant!573) lt!88502) (= (index!4463 lt!88502) (index!4462 lt!88418)) (= (select (arr!3560 (_keys!5554 thiss!1248)) (index!4463 lt!88502)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54133 (= lt!88502 e!117954)))

(declare-fun c!32107 () Bool)

(assert (=> d!54133 (= c!32107 (bvsge (x!19567 lt!88418) #b01111111111111111111111111111110))))

(assert (=> d!54133 (= lt!88501 (select (arr!3560 (_keys!5554 thiss!1248)) (index!4462 lt!88418)))))

(assert (=> d!54133 (validMask!0 (mask!8641 thiss!1248))))

(assert (=> d!54133 (= (seekKeyOrZeroReturnVacant!0 (x!19567 lt!88418) (index!4462 lt!88418) (index!4462 lt!88418) key!828 (_keys!5554 thiss!1248) (mask!8641 thiss!1248)) lt!88502)))

(assert (= (and d!54133 c!32107) b!179014))

(assert (= (and d!54133 (not c!32107)) b!179016))

(assert (= (and b!179016 c!32108) b!179017))

(assert (= (and b!179016 (not c!32108)) b!179012))

(assert (= (and b!179012 c!32106) b!179013))

(assert (= (and b!179012 (not c!32106)) b!179015))

(declare-fun m!207469 () Bool)

(assert (=> b!179015 m!207469))

(assert (=> b!179015 m!207469))

(declare-fun m!207471 () Bool)

(assert (=> b!179015 m!207471))

(declare-fun m!207473 () Bool)

(assert (=> d!54133 m!207473))

(declare-fun m!207475 () Bool)

(assert (=> d!54133 m!207475))

(assert (=> d!54133 m!207367))

(assert (=> d!54133 m!207331))

(assert (=> b!178888 d!54133))

(declare-fun d!54135 () Bool)

(declare-fun e!117959 () Bool)

(assert (=> d!54135 e!117959))

(declare-fun res!84775 () Bool)

(assert (=> d!54135 (=> (not res!84775) (not e!117959))))

(declare-fun lt!88513 () ListLongMap!2211)

(assert (=> d!54135 (= res!84775 (contains!1204 lt!88513 (_1!1650 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))

(declare-fun lt!88514 () List!2243)

(assert (=> d!54135 (= lt!88513 (ListLongMap!2212 lt!88514))))

(declare-fun lt!88512 () Unit!5451)

(declare-fun lt!88511 () Unit!5451)

(assert (=> d!54135 (= lt!88512 lt!88511)))

(assert (=> d!54135 (= (getValueByKey!201 lt!88514 (_1!1650 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))) (Some!206 (_2!1650 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!107 (List!2243 (_ BitVec 64) V!5225) Unit!5451)

(assert (=> d!54135 (= lt!88511 (lemmaContainsTupThenGetReturnValue!107 lt!88514 (_1!1650 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))) (_2!1650 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))

(declare-fun insertStrictlySorted!110 (List!2243 (_ BitVec 64) V!5225) List!2243)

(assert (=> d!54135 (= lt!88514 (insertStrictlySorted!110 (toList!1121 call!18067) (_1!1650 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))) (_2!1650 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))

(assert (=> d!54135 (= (+!262 call!18067 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))) lt!88513)))

(declare-fun b!179022 () Bool)

(declare-fun res!84776 () Bool)

(assert (=> b!179022 (=> (not res!84776) (not e!117959))))

(assert (=> b!179022 (= res!84776 (= (getValueByKey!201 (toList!1121 lt!88513) (_1!1650 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))) (Some!206 (_2!1650 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))))

(declare-fun b!179023 () Bool)

(declare-fun contains!1205 (List!2243 tuple2!3278) Bool)

(assert (=> b!179023 (= e!117959 (contains!1205 (toList!1121 lt!88513) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))

(assert (= (and d!54135 res!84775) b!179022))

(assert (= (and b!179022 res!84776) b!179023))

(declare-fun m!207477 () Bool)

(assert (=> d!54135 m!207477))

(declare-fun m!207479 () Bool)

(assert (=> d!54135 m!207479))

(declare-fun m!207481 () Bool)

(assert (=> d!54135 m!207481))

(declare-fun m!207483 () Bool)

(assert (=> d!54135 m!207483))

(declare-fun m!207485 () Bool)

(assert (=> b!179022 m!207485))

(declare-fun m!207487 () Bool)

(assert (=> b!179023 m!207487))

(assert (=> b!178963 d!54135))

(declare-fun b!179048 () Bool)

(declare-fun e!117980 () Bool)

(assert (=> b!179048 (= e!117980 (validKeyInArray!0 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179048 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!179049 () Bool)

(declare-fun e!117979 () Bool)

(declare-fun e!117974 () Bool)

(assert (=> b!179049 (= e!117979 e!117974)))

(declare-fun c!32119 () Bool)

(assert (=> b!179049 (= c!32119 e!117980)))

(declare-fun res!84787 () Bool)

(assert (=> b!179049 (=> (not res!84787) (not e!117980))))

(assert (=> b!179049 (= res!84787 (bvslt #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))

(declare-fun bm!18073 () Bool)

(declare-fun call!18076 () ListLongMap!2211)

(assert (=> bm!18073 (= call!18076 (getCurrentListMapNoExtraKeys!176 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3673 thiss!1248)))))

(declare-fun b!179050 () Bool)

(declare-fun lt!88530 () Unit!5451)

(declare-fun lt!88535 () Unit!5451)

(assert (=> b!179050 (= lt!88530 lt!88535)))

(declare-fun lt!88529 () V!5225)

(declare-fun lt!88532 () (_ BitVec 64))

(declare-fun lt!88534 () (_ BitVec 64))

(declare-fun lt!88533 () ListLongMap!2211)

(assert (=> b!179050 (not (contains!1204 (+!262 lt!88533 (tuple2!3279 lt!88532 lt!88529)) lt!88534))))

(declare-fun addStillNotContains!82 (ListLongMap!2211 (_ BitVec 64) V!5225 (_ BitVec 64)) Unit!5451)

(assert (=> b!179050 (= lt!88535 (addStillNotContains!82 lt!88533 lt!88532 lt!88529 lt!88534))))

(assert (=> b!179050 (= lt!88534 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!179050 (= lt!88529 (get!2047 (select (arr!3561 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179050 (= lt!88532 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179050 (= lt!88533 call!18076)))

(declare-fun e!117977 () ListLongMap!2211)

(assert (=> b!179050 (= e!117977 (+!262 call!18076 (tuple2!3279 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000) (get!2047 (select (arr!3561 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!179051 () Bool)

(declare-fun e!117978 () Bool)

(assert (=> b!179051 (= e!117974 e!117978)))

(assert (=> b!179051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))

(declare-fun res!84786 () Bool)

(declare-fun lt!88531 () ListLongMap!2211)

(assert (=> b!179051 (= res!84786 (contains!1204 lt!88531 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179051 (=> (not res!84786) (not e!117978))))

(declare-fun b!179052 () Bool)

(declare-fun e!117976 () Bool)

(assert (=> b!179052 (= e!117974 e!117976)))

(declare-fun c!32118 () Bool)

(assert (=> b!179052 (= c!32118 (bvslt #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))

(declare-fun b!179053 () Bool)

(declare-fun res!84785 () Bool)

(assert (=> b!179053 (=> (not res!84785) (not e!117979))))

(assert (=> b!179053 (= res!84785 (not (contains!1204 lt!88531 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179054 () Bool)

(assert (=> b!179054 (= e!117976 (= lt!88531 (getCurrentListMapNoExtraKeys!176 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3673 thiss!1248))))))

(declare-fun b!179055 () Bool)

(declare-fun e!117975 () ListLongMap!2211)

(assert (=> b!179055 (= e!117975 (ListLongMap!2212 Nil!2240))))

(declare-fun b!179057 () Bool)

(declare-fun isEmpty!460 (ListLongMap!2211) Bool)

(assert (=> b!179057 (= e!117976 (isEmpty!460 lt!88531))))

(declare-fun b!179058 () Bool)

(assert (=> b!179058 (= e!117975 e!117977)))

(declare-fun c!32117 () Bool)

(assert (=> b!179058 (= c!32117 (validKeyInArray!0 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179059 () Bool)

(assert (=> b!179059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))

(assert (=> b!179059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3868 (_values!3656 thiss!1248))))))

(assert (=> b!179059 (= e!117978 (= (apply!145 lt!88531 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)) (get!2047 (select (arr!3561 (_values!3656 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3673 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!54137 () Bool)

(assert (=> d!54137 e!117979))

(declare-fun res!84788 () Bool)

(assert (=> d!54137 (=> (not res!84788) (not e!117979))))

(assert (=> d!54137 (= res!84788 (not (contains!1204 lt!88531 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54137 (= lt!88531 e!117975)))

(declare-fun c!32120 () Bool)

(assert (=> d!54137 (= c!32120 (bvsge #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))

(assert (=> d!54137 (validMask!0 (mask!8641 thiss!1248))))

(assert (=> d!54137 (= (getCurrentListMapNoExtraKeys!176 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)) lt!88531)))

(declare-fun b!179056 () Bool)

(assert (=> b!179056 (= e!117977 call!18076)))

(assert (= (and d!54137 c!32120) b!179055))

(assert (= (and d!54137 (not c!32120)) b!179058))

(assert (= (and b!179058 c!32117) b!179050))

(assert (= (and b!179058 (not c!32117)) b!179056))

(assert (= (or b!179050 b!179056) bm!18073))

(assert (= (and d!54137 res!84788) b!179053))

(assert (= (and b!179053 res!84785) b!179049))

(assert (= (and b!179049 res!84787) b!179048))

(assert (= (and b!179049 c!32119) b!179051))

(assert (= (and b!179049 (not c!32119)) b!179052))

(assert (= (and b!179051 res!84786) b!179059))

(assert (= (and b!179052 c!32118) b!179054))

(assert (= (and b!179052 (not c!32118)) b!179057))

(declare-fun b_lambda!7121 () Bool)

(assert (=> (not b_lambda!7121) (not b!179050)))

(assert (=> b!179050 t!7077))

(declare-fun b_and!10955 () Bool)

(assert (= b_and!10953 (and (=> t!7077 result!4669) b_and!10955)))

(declare-fun b_lambda!7123 () Bool)

(assert (=> (not b_lambda!7123) (not b!179059)))

(assert (=> b!179059 t!7077))

(declare-fun b_and!10957 () Bool)

(assert (= b_and!10955 (and (=> t!7077 result!4669) b_and!10957)))

(declare-fun m!207489 () Bool)

(assert (=> d!54137 m!207489))

(assert (=> d!54137 m!207331))

(assert (=> b!179059 m!207401))

(assert (=> b!179059 m!207403))

(assert (=> b!179059 m!207405))

(assert (=> b!179059 m!207403))

(assert (=> b!179059 m!207397))

(assert (=> b!179059 m!207397))

(declare-fun m!207491 () Bool)

(assert (=> b!179059 m!207491))

(assert (=> b!179059 m!207401))

(declare-fun m!207493 () Bool)

(assert (=> b!179053 m!207493))

(declare-fun m!207495 () Bool)

(assert (=> bm!18073 m!207495))

(assert (=> b!179048 m!207397))

(assert (=> b!179048 m!207397))

(assert (=> b!179048 m!207419))

(assert (=> b!179050 m!207403))

(declare-fun m!207497 () Bool)

(assert (=> b!179050 m!207497))

(declare-fun m!207499 () Bool)

(assert (=> b!179050 m!207499))

(assert (=> b!179050 m!207401))

(declare-fun m!207501 () Bool)

(assert (=> b!179050 m!207501))

(assert (=> b!179050 m!207397))

(assert (=> b!179050 m!207499))

(declare-fun m!207503 () Bool)

(assert (=> b!179050 m!207503))

(assert (=> b!179050 m!207401))

(assert (=> b!179050 m!207403))

(assert (=> b!179050 m!207405))

(assert (=> b!179058 m!207397))

(assert (=> b!179058 m!207397))

(assert (=> b!179058 m!207419))

(declare-fun m!207505 () Bool)

(assert (=> b!179057 m!207505))

(assert (=> b!179051 m!207397))

(assert (=> b!179051 m!207397))

(declare-fun m!207507 () Bool)

(assert (=> b!179051 m!207507))

(assert (=> b!179054 m!207495))

(assert (=> bm!18066 d!54137))

(declare-fun b!179078 () Bool)

(declare-fun e!117993 () SeekEntryResult!573)

(assert (=> b!179078 (= e!117993 (Intermediate!573 false (toIndex!0 key!828 (mask!8641 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!179079 () Bool)

(declare-fun lt!88541 () SeekEntryResult!573)

(assert (=> b!179079 (and (bvsge (index!4462 lt!88541) #b00000000000000000000000000000000) (bvslt (index!4462 lt!88541) (size!3867 (_keys!5554 thiss!1248))))))

(declare-fun res!84796 () Bool)

(assert (=> b!179079 (= res!84796 (= (select (arr!3560 (_keys!5554 thiss!1248)) (index!4462 lt!88541)) key!828))))

(declare-fun e!117995 () Bool)

(assert (=> b!179079 (=> res!84796 e!117995)))

(declare-fun e!117992 () Bool)

(assert (=> b!179079 (= e!117992 e!117995)))

(declare-fun b!179080 () Bool)

(declare-fun e!117994 () SeekEntryResult!573)

(assert (=> b!179080 (= e!117994 (Intermediate!573 true (toIndex!0 key!828 (mask!8641 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!179081 () Bool)

(declare-fun e!117991 () Bool)

(assert (=> b!179081 (= e!117991 (bvsge (x!19567 lt!88541) #b01111111111111111111111111111110))))

(declare-fun b!179082 () Bool)

(assert (=> b!179082 (= e!117993 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8641 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8641 thiss!1248)) key!828 (_keys!5554 thiss!1248) (mask!8641 thiss!1248)))))

(declare-fun b!179083 () Bool)

(assert (=> b!179083 (= e!117994 e!117993)))

(declare-fun c!32129 () Bool)

(declare-fun lt!88540 () (_ BitVec 64))

(assert (=> b!179083 (= c!32129 (or (= lt!88540 key!828) (= (bvadd lt!88540 lt!88540) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!54139 () Bool)

(assert (=> d!54139 e!117991))

(declare-fun c!32127 () Bool)

(assert (=> d!54139 (= c!32127 (and ((_ is Intermediate!573) lt!88541) (undefined!1385 lt!88541)))))

(assert (=> d!54139 (= lt!88541 e!117994)))

(declare-fun c!32128 () Bool)

(assert (=> d!54139 (= c!32128 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!54139 (= lt!88540 (select (arr!3560 (_keys!5554 thiss!1248)) (toIndex!0 key!828 (mask!8641 thiss!1248))))))

(assert (=> d!54139 (validMask!0 (mask!8641 thiss!1248))))

(assert (=> d!54139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8641 thiss!1248)) key!828 (_keys!5554 thiss!1248) (mask!8641 thiss!1248)) lt!88541)))

(declare-fun b!179084 () Bool)

(assert (=> b!179084 (and (bvsge (index!4462 lt!88541) #b00000000000000000000000000000000) (bvslt (index!4462 lt!88541) (size!3867 (_keys!5554 thiss!1248))))))

(declare-fun res!84797 () Bool)

(assert (=> b!179084 (= res!84797 (= (select (arr!3560 (_keys!5554 thiss!1248)) (index!4462 lt!88541)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!179084 (=> res!84797 e!117995)))

(declare-fun b!179085 () Bool)

(assert (=> b!179085 (= e!117991 e!117992)))

(declare-fun res!84795 () Bool)

(assert (=> b!179085 (= res!84795 (and ((_ is Intermediate!573) lt!88541) (not (undefined!1385 lt!88541)) (bvslt (x!19567 lt!88541) #b01111111111111111111111111111110) (bvsge (x!19567 lt!88541) #b00000000000000000000000000000000) (bvsge (x!19567 lt!88541) #b00000000000000000000000000000000)))))

(assert (=> b!179085 (=> (not res!84795) (not e!117992))))

(declare-fun b!179086 () Bool)

(assert (=> b!179086 (and (bvsge (index!4462 lt!88541) #b00000000000000000000000000000000) (bvslt (index!4462 lt!88541) (size!3867 (_keys!5554 thiss!1248))))))

(assert (=> b!179086 (= e!117995 (= (select (arr!3560 (_keys!5554 thiss!1248)) (index!4462 lt!88541)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!54139 c!32128) b!179080))

(assert (= (and d!54139 (not c!32128)) b!179083))

(assert (= (and b!179083 c!32129) b!179078))

(assert (= (and b!179083 (not c!32129)) b!179082))

(assert (= (and d!54139 c!32127) b!179081))

(assert (= (and d!54139 (not c!32127)) b!179085))

(assert (= (and b!179085 res!84795) b!179079))

(assert (= (and b!179079 (not res!84796)) b!179084))

(assert (= (and b!179084 (not res!84797)) b!179086))

(declare-fun m!207509 () Bool)

(assert (=> b!179086 m!207509))

(assert (=> d!54139 m!207371))

(declare-fun m!207511 () Bool)

(assert (=> d!54139 m!207511))

(assert (=> d!54139 m!207331))

(assert (=> b!179082 m!207371))

(declare-fun m!207513 () Bool)

(assert (=> b!179082 m!207513))

(assert (=> b!179082 m!207513))

(declare-fun m!207515 () Bool)

(assert (=> b!179082 m!207515))

(assert (=> b!179084 m!207509))

(assert (=> b!179079 m!207509))

(assert (=> d!54111 d!54139))

(declare-fun d!54141 () Bool)

(declare-fun lt!88547 () (_ BitVec 32))

(declare-fun lt!88546 () (_ BitVec 32))

(assert (=> d!54141 (= lt!88547 (bvmul (bvxor lt!88546 (bvlshr lt!88546 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54141 (= lt!88546 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54141 (and (bvsge (mask!8641 thiss!1248) #b00000000000000000000000000000000) (let ((res!84798 (let ((h!2865 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19585 (bvmul (bvxor h!2865 (bvlshr h!2865 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19585 (bvlshr x!19585 #b00000000000000000000000000001101)) (mask!8641 thiss!1248)))))) (and (bvslt res!84798 (bvadd (mask!8641 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!84798 #b00000000000000000000000000000000))))))

(assert (=> d!54141 (= (toIndex!0 key!828 (mask!8641 thiss!1248)) (bvand (bvxor lt!88547 (bvlshr lt!88547 #b00000000000000000000000000001101)) (mask!8641 thiss!1248)))))

(assert (=> d!54111 d!54141))

(assert (=> d!54111 d!54109))

(declare-fun d!54143 () Bool)

(assert (=> d!54143 (isDefined!153 (getValueByKey!201 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))

(declare-fun lt!88550 () Unit!5451)

(declare-fun choose!962 (List!2243 (_ BitVec 64)) Unit!5451)

(assert (=> d!54143 (= lt!88550 (choose!962 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))

(declare-fun e!117998 () Bool)

(assert (=> d!54143 e!117998))

(declare-fun res!84801 () Bool)

(assert (=> d!54143 (=> (not res!84801) (not e!117998))))

(declare-fun isStrictlySorted!327 (List!2243) Bool)

(assert (=> d!54143 (= res!84801 (isStrictlySorted!327 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))))))

(assert (=> d!54143 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828) lt!88550)))

(declare-fun b!179089 () Bool)

(assert (=> b!179089 (= e!117998 (containsKey!204 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828))))

(assert (= (and d!54143 res!84801) b!179089))

(assert (=> d!54143 m!207393))

(assert (=> d!54143 m!207393))

(assert (=> d!54143 m!207395))

(declare-fun m!207517 () Bool)

(assert (=> d!54143 m!207517))

(declare-fun m!207519 () Bool)

(assert (=> d!54143 m!207519))

(assert (=> b!179089 m!207389))

(assert (=> b!178906 d!54143))

(assert (=> b!178906 d!54123))

(assert (=> b!178906 d!54125))

(declare-fun d!54145 () Bool)

(declare-fun e!117999 () Bool)

(assert (=> d!54145 e!117999))

(declare-fun res!84802 () Bool)

(assert (=> d!54145 (=> res!84802 e!117999)))

(declare-fun lt!88551 () Bool)

(assert (=> d!54145 (= res!84802 (not lt!88551))))

(declare-fun lt!88552 () Bool)

(assert (=> d!54145 (= lt!88551 lt!88552)))

(declare-fun lt!88554 () Unit!5451)

(declare-fun e!118000 () Unit!5451)

(assert (=> d!54145 (= lt!88554 e!118000)))

(declare-fun c!32130 () Bool)

(assert (=> d!54145 (= c!32130 lt!88552)))

(assert (=> d!54145 (= lt!88552 (containsKey!204 (toList!1121 lt!88496) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54145 (= (contains!1204 lt!88496 #b1000000000000000000000000000000000000000000000000000000000000000) lt!88551)))

(declare-fun b!179090 () Bool)

(declare-fun lt!88553 () Unit!5451)

(assert (=> b!179090 (= e!118000 lt!88553)))

(assert (=> b!179090 (= lt!88553 (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1121 lt!88496) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!179090 (isDefined!153 (getValueByKey!201 (toList!1121 lt!88496) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179091 () Bool)

(declare-fun Unit!5455 () Unit!5451)

(assert (=> b!179091 (= e!118000 Unit!5455)))

(declare-fun b!179092 () Bool)

(assert (=> b!179092 (= e!117999 (isDefined!153 (getValueByKey!201 (toList!1121 lt!88496) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54145 c!32130) b!179090))

(assert (= (and d!54145 (not c!32130)) b!179091))

(assert (= (and d!54145 (not res!84802)) b!179092))

(declare-fun m!207521 () Bool)

(assert (=> d!54145 m!207521))

(declare-fun m!207523 () Bool)

(assert (=> b!179090 m!207523))

(declare-fun m!207525 () Bool)

(assert (=> b!179090 m!207525))

(assert (=> b!179090 m!207525))

(declare-fun m!207527 () Bool)

(assert (=> b!179090 m!207527))

(assert (=> b!179092 m!207525))

(assert (=> b!179092 m!207525))

(assert (=> b!179092 m!207527))

(assert (=> bm!18068 d!54145))

(declare-fun d!54147 () Bool)

(declare-fun e!118001 () Bool)

(assert (=> d!54147 e!118001))

(declare-fun res!84803 () Bool)

(assert (=> d!54147 (=> res!84803 e!118001)))

(declare-fun lt!88555 () Bool)

(assert (=> d!54147 (= res!84803 (not lt!88555))))

(declare-fun lt!88556 () Bool)

(assert (=> d!54147 (= lt!88555 lt!88556)))

(declare-fun lt!88558 () Unit!5451)

(declare-fun e!118002 () Unit!5451)

(assert (=> d!54147 (= lt!88558 e!118002)))

(declare-fun c!32131 () Bool)

(assert (=> d!54147 (= c!32131 lt!88556)))

(assert (=> d!54147 (= lt!88556 (containsKey!204 (toList!1121 lt!88496) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54147 (= (contains!1204 lt!88496 #b0000000000000000000000000000000000000000000000000000000000000000) lt!88555)))

(declare-fun b!179093 () Bool)

(declare-fun lt!88557 () Unit!5451)

(assert (=> b!179093 (= e!118002 lt!88557)))

(assert (=> b!179093 (= lt!88557 (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1121 lt!88496) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!179093 (isDefined!153 (getValueByKey!201 (toList!1121 lt!88496) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179094 () Bool)

(declare-fun Unit!5456 () Unit!5451)

(assert (=> b!179094 (= e!118002 Unit!5456)))

(declare-fun b!179095 () Bool)

(assert (=> b!179095 (= e!118001 (isDefined!153 (getValueByKey!201 (toList!1121 lt!88496) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54147 c!32131) b!179093))

(assert (= (and d!54147 (not c!32131)) b!179094))

(assert (= (and d!54147 (not res!84803)) b!179095))

(declare-fun m!207529 () Bool)

(assert (=> d!54147 m!207529))

(declare-fun m!207531 () Bool)

(assert (=> b!179093 m!207531))

(declare-fun m!207533 () Bool)

(assert (=> b!179093 m!207533))

(assert (=> b!179093 m!207533))

(declare-fun m!207535 () Bool)

(assert (=> b!179093 m!207535))

(assert (=> b!179095 m!207533))

(assert (=> b!179095 m!207533))

(assert (=> b!179095 m!207535))

(assert (=> bm!18065 d!54147))

(declare-fun d!54149 () Bool)

(declare-fun res!84809 () Bool)

(declare-fun e!118009 () Bool)

(assert (=> d!54149 (=> res!84809 e!118009)))

(assert (=> d!54149 (= res!84809 (bvsge #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))

(assert (=> d!54149 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5554 thiss!1248) (mask!8641 thiss!1248)) e!118009)))

(declare-fun b!179104 () Bool)

(declare-fun e!118010 () Bool)

(declare-fun e!118011 () Bool)

(assert (=> b!179104 (= e!118010 e!118011)))

(declare-fun lt!88565 () (_ BitVec 64))

(assert (=> b!179104 (= lt!88565 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88566 () Unit!5451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7513 (_ BitVec 64) (_ BitVec 32)) Unit!5451)

(assert (=> b!179104 (= lt!88566 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5554 thiss!1248) lt!88565 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!179104 (arrayContainsKey!0 (_keys!5554 thiss!1248) lt!88565 #b00000000000000000000000000000000)))

(declare-fun lt!88567 () Unit!5451)

(assert (=> b!179104 (= lt!88567 lt!88566)))

(declare-fun res!84808 () Bool)

(assert (=> b!179104 (= res!84808 (= (seekEntryOrOpen!0 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000) (_keys!5554 thiss!1248) (mask!8641 thiss!1248)) (Found!573 #b00000000000000000000000000000000)))))

(assert (=> b!179104 (=> (not res!84808) (not e!118011))))

(declare-fun bm!18076 () Bool)

(declare-fun call!18079 () Bool)

(assert (=> bm!18076 (= call!18079 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5554 thiss!1248) (mask!8641 thiss!1248)))))

(declare-fun b!179105 () Bool)

(assert (=> b!179105 (= e!118011 call!18079)))

(declare-fun b!179106 () Bool)

(assert (=> b!179106 (= e!118009 e!118010)))

(declare-fun c!32134 () Bool)

(assert (=> b!179106 (= c!32134 (validKeyInArray!0 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179107 () Bool)

(assert (=> b!179107 (= e!118010 call!18079)))

(assert (= (and d!54149 (not res!84809)) b!179106))

(assert (= (and b!179106 c!32134) b!179104))

(assert (= (and b!179106 (not c!32134)) b!179107))

(assert (= (and b!179104 res!84808) b!179105))

(assert (= (or b!179105 b!179107) bm!18076))

(assert (=> b!179104 m!207397))

(declare-fun m!207537 () Bool)

(assert (=> b!179104 m!207537))

(declare-fun m!207539 () Bool)

(assert (=> b!179104 m!207539))

(assert (=> b!179104 m!207397))

(declare-fun m!207541 () Bool)

(assert (=> b!179104 m!207541))

(declare-fun m!207543 () Bool)

(assert (=> bm!18076 m!207543))

(assert (=> b!179106 m!207397))

(assert (=> b!179106 m!207397))

(assert (=> b!179106 m!207419))

(assert (=> b!178898 d!54149))

(declare-fun bm!18079 () Bool)

(declare-fun call!18082 () (_ BitVec 32))

(assert (=> bm!18079 (= call!18082 (arrayCountValidKeys!0 (_keys!5554 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3867 (_keys!5554 thiss!1248))))))

(declare-fun b!179116 () Bool)

(declare-fun e!118016 () (_ BitVec 32))

(assert (=> b!179116 (= e!118016 #b00000000000000000000000000000000)))

(declare-fun d!54151 () Bool)

(declare-fun lt!88570 () (_ BitVec 32))

(assert (=> d!54151 (and (bvsge lt!88570 #b00000000000000000000000000000000) (bvsle lt!88570 (bvsub (size!3867 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54151 (= lt!88570 e!118016)))

(declare-fun c!32139 () Bool)

(assert (=> d!54151 (= c!32139 (bvsge #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))

(assert (=> d!54151 (and (bvsle #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3867 (_keys!5554 thiss!1248)) (size!3867 (_keys!5554 thiss!1248))))))

(assert (=> d!54151 (= (arrayCountValidKeys!0 (_keys!5554 thiss!1248) #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))) lt!88570)))

(declare-fun b!179117 () Bool)

(declare-fun e!118017 () (_ BitVec 32))

(assert (=> b!179117 (= e!118017 (bvadd #b00000000000000000000000000000001 call!18082))))

(declare-fun b!179118 () Bool)

(assert (=> b!179118 (= e!118016 e!118017)))

(declare-fun c!32140 () Bool)

(assert (=> b!179118 (= c!32140 (validKeyInArray!0 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179119 () Bool)

(assert (=> b!179119 (= e!118017 call!18082)))

(assert (= (and d!54151 c!32139) b!179116))

(assert (= (and d!54151 (not c!32139)) b!179118))

(assert (= (and b!179118 c!32140) b!179117))

(assert (= (and b!179118 (not c!32140)) b!179119))

(assert (= (or b!179117 b!179119) bm!18079))

(declare-fun m!207545 () Bool)

(assert (=> bm!18079 m!207545))

(assert (=> b!179118 m!207397))

(assert (=> b!179118 m!207397))

(assert (=> b!179118 m!207419))

(assert (=> b!178897 d!54151))

(declare-fun d!54153 () Bool)

(assert (=> d!54153 (= (apply!145 lt!88480 lt!88481) (get!2048 (getValueByKey!201 (toList!1121 lt!88480) lt!88481)))))

(declare-fun bs!7359 () Bool)

(assert (= bs!7359 d!54153))

(declare-fun m!207547 () Bool)

(assert (=> bs!7359 m!207547))

(assert (=> bs!7359 m!207547))

(declare-fun m!207549 () Bool)

(assert (=> bs!7359 m!207549))

(assert (=> b!178960 d!54153))

(declare-fun d!54155 () Bool)

(assert (=> d!54155 (= (apply!145 lt!88479 lt!88494) (get!2048 (getValueByKey!201 (toList!1121 lt!88479) lt!88494)))))

(declare-fun bs!7360 () Bool)

(assert (= bs!7360 d!54155))

(declare-fun m!207551 () Bool)

(assert (=> bs!7360 m!207551))

(assert (=> bs!7360 m!207551))

(declare-fun m!207553 () Bool)

(assert (=> bs!7360 m!207553))

(assert (=> b!178960 d!54155))

(declare-fun d!54157 () Bool)

(assert (=> d!54157 (= (apply!145 (+!262 lt!88485 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248))) lt!88495) (apply!145 lt!88485 lt!88495))))

(declare-fun lt!88573 () Unit!5451)

(declare-fun choose!963 (ListLongMap!2211 (_ BitVec 64) V!5225 (_ BitVec 64)) Unit!5451)

(assert (=> d!54157 (= lt!88573 (choose!963 lt!88485 lt!88482 (minValue!3514 thiss!1248) lt!88495))))

(declare-fun e!118020 () Bool)

(assert (=> d!54157 e!118020))

(declare-fun res!84812 () Bool)

(assert (=> d!54157 (=> (not res!84812) (not e!118020))))

(assert (=> d!54157 (= res!84812 (contains!1204 lt!88485 lt!88495))))

(assert (=> d!54157 (= (addApplyDifferent!121 lt!88485 lt!88482 (minValue!3514 thiss!1248) lt!88495) lt!88573)))

(declare-fun b!179123 () Bool)

(assert (=> b!179123 (= e!118020 (not (= lt!88495 lt!88482)))))

(assert (= (and d!54157 res!84812) b!179123))

(assert (=> d!54157 m!207443))

(declare-fun m!207555 () Bool)

(assert (=> d!54157 m!207555))

(assert (=> d!54157 m!207433))

(declare-fun m!207557 () Bool)

(assert (=> d!54157 m!207557))

(assert (=> d!54157 m!207433))

(assert (=> d!54157 m!207435))

(assert (=> b!178960 d!54157))

(declare-fun d!54159 () Bool)

(declare-fun e!118021 () Bool)

(assert (=> d!54159 e!118021))

(declare-fun res!84813 () Bool)

(assert (=> d!54159 (=> res!84813 e!118021)))

(declare-fun lt!88574 () Bool)

(assert (=> d!54159 (= res!84813 (not lt!88574))))

(declare-fun lt!88575 () Bool)

(assert (=> d!54159 (= lt!88574 lt!88575)))

(declare-fun lt!88577 () Unit!5451)

(declare-fun e!118022 () Unit!5451)

(assert (=> d!54159 (= lt!88577 e!118022)))

(declare-fun c!32141 () Bool)

(assert (=> d!54159 (= c!32141 lt!88575)))

(assert (=> d!54159 (= lt!88575 (containsKey!204 (toList!1121 (+!262 lt!88476 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248)))) lt!88488))))

(assert (=> d!54159 (= (contains!1204 (+!262 lt!88476 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248))) lt!88488) lt!88574)))

(declare-fun b!179124 () Bool)

(declare-fun lt!88576 () Unit!5451)

(assert (=> b!179124 (= e!118022 lt!88576)))

(assert (=> b!179124 (= lt!88576 (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1121 (+!262 lt!88476 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248)))) lt!88488))))

(assert (=> b!179124 (isDefined!153 (getValueByKey!201 (toList!1121 (+!262 lt!88476 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248)))) lt!88488))))

(declare-fun b!179125 () Bool)

(declare-fun Unit!5457 () Unit!5451)

(assert (=> b!179125 (= e!118022 Unit!5457)))

(declare-fun b!179126 () Bool)

(assert (=> b!179126 (= e!118021 (isDefined!153 (getValueByKey!201 (toList!1121 (+!262 lt!88476 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248)))) lt!88488)))))

(assert (= (and d!54159 c!32141) b!179124))

(assert (= (and d!54159 (not c!32141)) b!179125))

(assert (= (and d!54159 (not res!84813)) b!179126))

(declare-fun m!207559 () Bool)

(assert (=> d!54159 m!207559))

(declare-fun m!207561 () Bool)

(assert (=> b!179124 m!207561))

(declare-fun m!207563 () Bool)

(assert (=> b!179124 m!207563))

(assert (=> b!179124 m!207563))

(declare-fun m!207565 () Bool)

(assert (=> b!179124 m!207565))

(assert (=> b!179126 m!207563))

(assert (=> b!179126 m!207563))

(assert (=> b!179126 m!207565))

(assert (=> b!178960 d!54159))

(declare-fun d!54161 () Bool)

(declare-fun e!118023 () Bool)

(assert (=> d!54161 e!118023))

(declare-fun res!84814 () Bool)

(assert (=> d!54161 (=> (not res!84814) (not e!118023))))

(declare-fun lt!88580 () ListLongMap!2211)

(assert (=> d!54161 (= res!84814 (contains!1204 lt!88580 (_1!1650 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248)))))))

(declare-fun lt!88581 () List!2243)

(assert (=> d!54161 (= lt!88580 (ListLongMap!2212 lt!88581))))

(declare-fun lt!88579 () Unit!5451)

(declare-fun lt!88578 () Unit!5451)

(assert (=> d!54161 (= lt!88579 lt!88578)))

(assert (=> d!54161 (= (getValueByKey!201 lt!88581 (_1!1650 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248)))) (Some!206 (_2!1650 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248)))))))

(assert (=> d!54161 (= lt!88578 (lemmaContainsTupThenGetReturnValue!107 lt!88581 (_1!1650 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248))) (_2!1650 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248)))))))

(assert (=> d!54161 (= lt!88581 (insertStrictlySorted!110 (toList!1121 lt!88479) (_1!1650 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248))) (_2!1650 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248)))))))

(assert (=> d!54161 (= (+!262 lt!88479 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248))) lt!88580)))

(declare-fun b!179127 () Bool)

(declare-fun res!84815 () Bool)

(assert (=> b!179127 (=> (not res!84815) (not e!118023))))

(assert (=> b!179127 (= res!84815 (= (getValueByKey!201 (toList!1121 lt!88580) (_1!1650 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248)))) (Some!206 (_2!1650 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248))))))))

(declare-fun b!179128 () Bool)

(assert (=> b!179128 (= e!118023 (contains!1205 (toList!1121 lt!88580) (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248))))))

(assert (= (and d!54161 res!84814) b!179127))

(assert (= (and b!179127 res!84815) b!179128))

(declare-fun m!207567 () Bool)

(assert (=> d!54161 m!207567))

(declare-fun m!207569 () Bool)

(assert (=> d!54161 m!207569))

(declare-fun m!207571 () Bool)

(assert (=> d!54161 m!207571))

(declare-fun m!207573 () Bool)

(assert (=> d!54161 m!207573))

(declare-fun m!207575 () Bool)

(assert (=> b!179127 m!207575))

(declare-fun m!207577 () Bool)

(assert (=> b!179128 m!207577))

(assert (=> b!178960 d!54161))

(declare-fun d!54163 () Bool)

(assert (=> d!54163 (= (apply!145 (+!262 lt!88480 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248))) lt!88481) (apply!145 lt!88480 lt!88481))))

(declare-fun lt!88582 () Unit!5451)

(assert (=> d!54163 (= lt!88582 (choose!963 lt!88480 lt!88493 (minValue!3514 thiss!1248) lt!88481))))

(declare-fun e!118024 () Bool)

(assert (=> d!54163 e!118024))

(declare-fun res!84816 () Bool)

(assert (=> d!54163 (=> (not res!84816) (not e!118024))))

(assert (=> d!54163 (= res!84816 (contains!1204 lt!88480 lt!88481))))

(assert (=> d!54163 (= (addApplyDifferent!121 lt!88480 lt!88493 (minValue!3514 thiss!1248) lt!88481) lt!88582)))

(declare-fun b!179129 () Bool)

(assert (=> b!179129 (= e!118024 (not (= lt!88481 lt!88493)))))

(assert (= (and d!54163 res!84816) b!179129))

(assert (=> d!54163 m!207441))

(declare-fun m!207579 () Bool)

(assert (=> d!54163 m!207579))

(assert (=> d!54163 m!207445))

(declare-fun m!207581 () Bool)

(assert (=> d!54163 m!207581))

(assert (=> d!54163 m!207445))

(assert (=> d!54163 m!207447))

(assert (=> b!178960 d!54163))

(declare-fun d!54165 () Bool)

(assert (=> d!54165 (= (apply!145 lt!88485 lt!88495) (get!2048 (getValueByKey!201 (toList!1121 lt!88485) lt!88495)))))

(declare-fun bs!7361 () Bool)

(assert (= bs!7361 d!54165))

(declare-fun m!207583 () Bool)

(assert (=> bs!7361 m!207583))

(assert (=> bs!7361 m!207583))

(declare-fun m!207585 () Bool)

(assert (=> bs!7361 m!207585))

(assert (=> b!178960 d!54165))

(declare-fun d!54167 () Bool)

(declare-fun e!118025 () Bool)

(assert (=> d!54167 e!118025))

(declare-fun res!84817 () Bool)

(assert (=> d!54167 (=> (not res!84817) (not e!118025))))

(declare-fun lt!88585 () ListLongMap!2211)

(assert (=> d!54167 (= res!84817 (contains!1204 lt!88585 (_1!1650 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248)))))))

(declare-fun lt!88586 () List!2243)

(assert (=> d!54167 (= lt!88585 (ListLongMap!2212 lt!88586))))

(declare-fun lt!88584 () Unit!5451)

(declare-fun lt!88583 () Unit!5451)

(assert (=> d!54167 (= lt!88584 lt!88583)))

(assert (=> d!54167 (= (getValueByKey!201 lt!88586 (_1!1650 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248)))) (Some!206 (_2!1650 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248)))))))

(assert (=> d!54167 (= lt!88583 (lemmaContainsTupThenGetReturnValue!107 lt!88586 (_1!1650 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248))) (_2!1650 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248)))))))

(assert (=> d!54167 (= lt!88586 (insertStrictlySorted!110 (toList!1121 lt!88476) (_1!1650 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248))) (_2!1650 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248)))))))

(assert (=> d!54167 (= (+!262 lt!88476 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248))) lt!88585)))

(declare-fun b!179130 () Bool)

(declare-fun res!84818 () Bool)

(assert (=> b!179130 (=> (not res!84818) (not e!118025))))

(assert (=> b!179130 (= res!84818 (= (getValueByKey!201 (toList!1121 lt!88585) (_1!1650 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248)))) (Some!206 (_2!1650 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248))))))))

(declare-fun b!179131 () Bool)

(assert (=> b!179131 (= e!118025 (contains!1205 (toList!1121 lt!88585) (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248))))))

(assert (= (and d!54167 res!84817) b!179130))

(assert (= (and b!179130 res!84818) b!179131))

(declare-fun m!207587 () Bool)

(assert (=> d!54167 m!207587))

(declare-fun m!207589 () Bool)

(assert (=> d!54167 m!207589))

(declare-fun m!207591 () Bool)

(assert (=> d!54167 m!207591))

(declare-fun m!207593 () Bool)

(assert (=> d!54167 m!207593))

(declare-fun m!207595 () Bool)

(assert (=> b!179130 m!207595))

(declare-fun m!207597 () Bool)

(assert (=> b!179131 m!207597))

(assert (=> b!178960 d!54167))

(declare-fun d!54169 () Bool)

(assert (=> d!54169 (= (apply!145 (+!262 lt!88480 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248))) lt!88481) (get!2048 (getValueByKey!201 (toList!1121 (+!262 lt!88480 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248)))) lt!88481)))))

(declare-fun bs!7362 () Bool)

(assert (= bs!7362 d!54169))

(declare-fun m!207599 () Bool)

(assert (=> bs!7362 m!207599))

(assert (=> bs!7362 m!207599))

(declare-fun m!207601 () Bool)

(assert (=> bs!7362 m!207601))

(assert (=> b!178960 d!54169))

(declare-fun d!54171 () Bool)

(assert (=> d!54171 (= (apply!145 (+!262 lt!88485 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248))) lt!88495) (get!2048 (getValueByKey!201 (toList!1121 (+!262 lt!88485 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248)))) lt!88495)))))

(declare-fun bs!7363 () Bool)

(assert (= bs!7363 d!54171))

(declare-fun m!207603 () Bool)

(assert (=> bs!7363 m!207603))

(assert (=> bs!7363 m!207603))

(declare-fun m!207605 () Bool)

(assert (=> bs!7363 m!207605))

(assert (=> b!178960 d!54171))

(declare-fun d!54173 () Bool)

(declare-fun e!118026 () Bool)

(assert (=> d!54173 e!118026))

(declare-fun res!84819 () Bool)

(assert (=> d!54173 (=> (not res!84819) (not e!118026))))

(declare-fun lt!88589 () ListLongMap!2211)

(assert (=> d!54173 (= res!84819 (contains!1204 lt!88589 (_1!1650 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248)))))))

(declare-fun lt!88590 () List!2243)

(assert (=> d!54173 (= lt!88589 (ListLongMap!2212 lt!88590))))

(declare-fun lt!88588 () Unit!5451)

(declare-fun lt!88587 () Unit!5451)

(assert (=> d!54173 (= lt!88588 lt!88587)))

(assert (=> d!54173 (= (getValueByKey!201 lt!88590 (_1!1650 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248)))) (Some!206 (_2!1650 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248)))))))

(assert (=> d!54173 (= lt!88587 (lemmaContainsTupThenGetReturnValue!107 lt!88590 (_1!1650 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248))) (_2!1650 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248)))))))

(assert (=> d!54173 (= lt!88590 (insertStrictlySorted!110 (toList!1121 lt!88485) (_1!1650 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248))) (_2!1650 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248)))))))

(assert (=> d!54173 (= (+!262 lt!88485 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248))) lt!88589)))

(declare-fun b!179132 () Bool)

(declare-fun res!84820 () Bool)

(assert (=> b!179132 (=> (not res!84820) (not e!118026))))

(assert (=> b!179132 (= res!84820 (= (getValueByKey!201 (toList!1121 lt!88589) (_1!1650 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248)))) (Some!206 (_2!1650 (tuple2!3279 lt!88482 (minValue!3514 thiss!1248))))))))

(declare-fun b!179133 () Bool)

(assert (=> b!179133 (= e!118026 (contains!1205 (toList!1121 lt!88589) (tuple2!3279 lt!88482 (minValue!3514 thiss!1248))))))

(assert (= (and d!54173 res!84819) b!179132))

(assert (= (and b!179132 res!84820) b!179133))

(declare-fun m!207607 () Bool)

(assert (=> d!54173 m!207607))

(declare-fun m!207609 () Bool)

(assert (=> d!54173 m!207609))

(declare-fun m!207611 () Bool)

(assert (=> d!54173 m!207611))

(declare-fun m!207613 () Bool)

(assert (=> d!54173 m!207613))

(declare-fun m!207615 () Bool)

(assert (=> b!179132 m!207615))

(declare-fun m!207617 () Bool)

(assert (=> b!179133 m!207617))

(assert (=> b!178960 d!54173))

(declare-fun d!54175 () Bool)

(assert (=> d!54175 (contains!1204 (+!262 lt!88476 (tuple2!3279 lt!88487 (zeroValue!3514 thiss!1248))) lt!88488)))

(declare-fun lt!88593 () Unit!5451)

(declare-fun choose!964 (ListLongMap!2211 (_ BitVec 64) V!5225 (_ BitVec 64)) Unit!5451)

(assert (=> d!54175 (= lt!88593 (choose!964 lt!88476 lt!88487 (zeroValue!3514 thiss!1248) lt!88488))))

(assert (=> d!54175 (contains!1204 lt!88476 lt!88488)))

(assert (=> d!54175 (= (addStillContains!121 lt!88476 lt!88487 (zeroValue!3514 thiss!1248) lt!88488) lt!88593)))

(declare-fun bs!7364 () Bool)

(assert (= bs!7364 d!54175))

(assert (=> bs!7364 m!207429))

(assert (=> bs!7364 m!207429))

(assert (=> bs!7364 m!207453))

(declare-fun m!207619 () Bool)

(assert (=> bs!7364 m!207619))

(declare-fun m!207621 () Bool)

(assert (=> bs!7364 m!207621))

(assert (=> b!178960 d!54175))

(declare-fun d!54177 () Bool)

(assert (=> d!54177 (= (apply!145 (+!262 lt!88479 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248))) lt!88494) (get!2048 (getValueByKey!201 (toList!1121 (+!262 lt!88479 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248)))) lt!88494)))))

(declare-fun bs!7365 () Bool)

(assert (= bs!7365 d!54177))

(declare-fun m!207623 () Bool)

(assert (=> bs!7365 m!207623))

(assert (=> bs!7365 m!207623))

(declare-fun m!207625 () Bool)

(assert (=> bs!7365 m!207625))

(assert (=> b!178960 d!54177))

(assert (=> b!178960 d!54137))

(declare-fun d!54179 () Bool)

(assert (=> d!54179 (= (apply!145 (+!262 lt!88479 (tuple2!3279 lt!88492 (zeroValue!3514 thiss!1248))) lt!88494) (apply!145 lt!88479 lt!88494))))

(declare-fun lt!88594 () Unit!5451)

(assert (=> d!54179 (= lt!88594 (choose!963 lt!88479 lt!88492 (zeroValue!3514 thiss!1248) lt!88494))))

(declare-fun e!118027 () Bool)

(assert (=> d!54179 e!118027))

(declare-fun res!84821 () Bool)

(assert (=> d!54179 (=> (not res!84821) (not e!118027))))

(assert (=> d!54179 (= res!84821 (contains!1204 lt!88479 lt!88494))))

(assert (=> d!54179 (= (addApplyDifferent!121 lt!88479 lt!88492 (zeroValue!3514 thiss!1248) lt!88494) lt!88594)))

(declare-fun b!179135 () Bool)

(assert (=> b!179135 (= e!118027 (not (= lt!88494 lt!88492)))))

(assert (= (and d!54179 res!84821) b!179135))

(assert (=> d!54179 m!207439))

(declare-fun m!207627 () Bool)

(assert (=> d!54179 m!207627))

(assert (=> d!54179 m!207425))

(declare-fun m!207629 () Bool)

(assert (=> d!54179 m!207629))

(assert (=> d!54179 m!207425))

(assert (=> d!54179 m!207427))

(assert (=> b!178960 d!54179))

(declare-fun d!54181 () Bool)

(declare-fun e!118028 () Bool)

(assert (=> d!54181 e!118028))

(declare-fun res!84822 () Bool)

(assert (=> d!54181 (=> (not res!84822) (not e!118028))))

(declare-fun lt!88597 () ListLongMap!2211)

(assert (=> d!54181 (= res!84822 (contains!1204 lt!88597 (_1!1650 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248)))))))

(declare-fun lt!88598 () List!2243)

(assert (=> d!54181 (= lt!88597 (ListLongMap!2212 lt!88598))))

(declare-fun lt!88596 () Unit!5451)

(declare-fun lt!88595 () Unit!5451)

(assert (=> d!54181 (= lt!88596 lt!88595)))

(assert (=> d!54181 (= (getValueByKey!201 lt!88598 (_1!1650 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248)))) (Some!206 (_2!1650 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248)))))))

(assert (=> d!54181 (= lt!88595 (lemmaContainsTupThenGetReturnValue!107 lt!88598 (_1!1650 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248))) (_2!1650 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248)))))))

(assert (=> d!54181 (= lt!88598 (insertStrictlySorted!110 (toList!1121 lt!88480) (_1!1650 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248))) (_2!1650 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248)))))))

(assert (=> d!54181 (= (+!262 lt!88480 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248))) lt!88597)))

(declare-fun b!179136 () Bool)

(declare-fun res!84823 () Bool)

(assert (=> b!179136 (=> (not res!84823) (not e!118028))))

(assert (=> b!179136 (= res!84823 (= (getValueByKey!201 (toList!1121 lt!88597) (_1!1650 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248)))) (Some!206 (_2!1650 (tuple2!3279 lt!88493 (minValue!3514 thiss!1248))))))))

(declare-fun b!179137 () Bool)

(assert (=> b!179137 (= e!118028 (contains!1205 (toList!1121 lt!88597) (tuple2!3279 lt!88493 (minValue!3514 thiss!1248))))))

(assert (= (and d!54181 res!84822) b!179136))

(assert (= (and b!179136 res!84823) b!179137))

(declare-fun m!207631 () Bool)

(assert (=> d!54181 m!207631))

(declare-fun m!207633 () Bool)

(assert (=> d!54181 m!207633))

(declare-fun m!207635 () Bool)

(assert (=> d!54181 m!207635))

(declare-fun m!207637 () Bool)

(assert (=> d!54181 m!207637))

(declare-fun m!207639 () Bool)

(assert (=> b!179136 m!207639))

(declare-fun m!207641 () Bool)

(assert (=> b!179137 m!207641))

(assert (=> b!178960 d!54181))

(declare-fun d!54183 () Bool)

(declare-fun res!84830 () Bool)

(declare-fun e!118038 () Bool)

(assert (=> d!54183 (=> res!84830 e!118038)))

(assert (=> d!54183 (= res!84830 (bvsge #b00000000000000000000000000000000 (size!3867 (_keys!5554 thiss!1248))))))

(assert (=> d!54183 (= (arrayNoDuplicates!0 (_keys!5554 thiss!1248) #b00000000000000000000000000000000 Nil!2241) e!118038)))

(declare-fun b!179148 () Bool)

(declare-fun e!118039 () Bool)

(declare-fun e!118037 () Bool)

(assert (=> b!179148 (= e!118039 e!118037)))

(declare-fun c!32144 () Bool)

(assert (=> b!179148 (= c!32144 (validKeyInArray!0 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18082 () Bool)

(declare-fun call!18085 () Bool)

(assert (=> bm!18082 (= call!18085 (arrayNoDuplicates!0 (_keys!5554 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32144 (Cons!2240 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000) Nil!2241) Nil!2241)))))

(declare-fun b!179149 () Bool)

(assert (=> b!179149 (= e!118038 e!118039)))

(declare-fun res!84832 () Bool)

(assert (=> b!179149 (=> (not res!84832) (not e!118039))))

(declare-fun e!118040 () Bool)

(assert (=> b!179149 (= res!84832 (not e!118040))))

(declare-fun res!84831 () Bool)

(assert (=> b!179149 (=> (not res!84831) (not e!118040))))

(assert (=> b!179149 (= res!84831 (validKeyInArray!0 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179150 () Bool)

(assert (=> b!179150 (= e!118037 call!18085)))

(declare-fun b!179151 () Bool)

(assert (=> b!179151 (= e!118037 call!18085)))

(declare-fun b!179152 () Bool)

(declare-fun contains!1206 (List!2244 (_ BitVec 64)) Bool)

(assert (=> b!179152 (= e!118040 (contains!1206 Nil!2241 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54183 (not res!84830)) b!179149))

(assert (= (and b!179149 res!84831) b!179152))

(assert (= (and b!179149 res!84832) b!179148))

(assert (= (and b!179148 c!32144) b!179151))

(assert (= (and b!179148 (not c!32144)) b!179150))

(assert (= (or b!179151 b!179150) bm!18082))

(assert (=> b!179148 m!207397))

(assert (=> b!179148 m!207397))

(assert (=> b!179148 m!207419))

(assert (=> bm!18082 m!207397))

(declare-fun m!207643 () Bool)

(assert (=> bm!18082 m!207643))

(assert (=> b!179149 m!207397))

(assert (=> b!179149 m!207397))

(assert (=> b!179149 m!207419))

(assert (=> b!179152 m!207397))

(assert (=> b!179152 m!207397))

(declare-fun m!207645 () Bool)

(assert (=> b!179152 m!207645))

(assert (=> b!178899 d!54183))

(declare-fun d!54185 () Bool)

(assert (=> d!54185 (= (apply!145 lt!88496 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2048 (getValueByKey!201 (toList!1121 lt!88496) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7366 () Bool)

(assert (= bs!7366 d!54185))

(assert (=> bs!7366 m!207533))

(assert (=> bs!7366 m!207533))

(declare-fun m!207647 () Bool)

(assert (=> bs!7366 m!207647))

(assert (=> b!178961 d!54185))

(assert (=> b!178952 d!54131))

(declare-fun d!54187 () Bool)

(declare-fun res!84837 () Bool)

(declare-fun e!118045 () Bool)

(assert (=> d!54187 (=> res!84837 e!118045)))

(assert (=> d!54187 (= res!84837 (and ((_ is Cons!2239) (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))) (= (_1!1650 (h!2863 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))))) key!828)))))

(assert (=> d!54187 (= (containsKey!204 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))) key!828) e!118045)))

(declare-fun b!179157 () Bool)

(declare-fun e!118046 () Bool)

(assert (=> b!179157 (= e!118045 e!118046)))

(declare-fun res!84838 () Bool)

(assert (=> b!179157 (=> (not res!84838) (not e!118046))))

(assert (=> b!179157 (= res!84838 (and (or (not ((_ is Cons!2239) (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))))) (bvsle (_1!1650 (h!2863 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))))) key!828)) ((_ is Cons!2239) (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))) (bvslt (_1!1650 (h!2863 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248))))) key!828)))))

(declare-fun b!179158 () Bool)

(assert (=> b!179158 (= e!118046 (containsKey!204 (t!7075 (toList!1121 (getCurrentListMap!776 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)))) key!828))))

(assert (= (and d!54187 (not res!84837)) b!179157))

(assert (= (and b!179157 res!84838) b!179158))

(declare-fun m!207649 () Bool)

(assert (=> b!179158 m!207649))

(assert (=> d!54115 d!54187))

(declare-fun d!54189 () Bool)

(declare-fun e!118047 () Bool)

(assert (=> d!54189 e!118047))

(declare-fun res!84839 () Bool)

(assert (=> d!54189 (=> (not res!84839) (not e!118047))))

(declare-fun lt!88601 () ListLongMap!2211)

(assert (=> d!54189 (= res!84839 (contains!1204 lt!88601 (_1!1650 (ite (or c!32085 c!32086) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))))

(declare-fun lt!88602 () List!2243)

(assert (=> d!54189 (= lt!88601 (ListLongMap!2212 lt!88602))))

(declare-fun lt!88600 () Unit!5451)

(declare-fun lt!88599 () Unit!5451)

(assert (=> d!54189 (= lt!88600 lt!88599)))

(assert (=> d!54189 (= (getValueByKey!201 lt!88602 (_1!1650 (ite (or c!32085 c!32086) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))) (Some!206 (_2!1650 (ite (or c!32085 c!32086) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))))

(assert (=> d!54189 (= lt!88599 (lemmaContainsTupThenGetReturnValue!107 lt!88602 (_1!1650 (ite (or c!32085 c!32086) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))) (_2!1650 (ite (or c!32085 c!32086) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))))

(assert (=> d!54189 (= lt!88602 (insertStrictlySorted!110 (toList!1121 (ite c!32085 call!18071 (ite c!32086 call!18069 call!18070))) (_1!1650 (ite (or c!32085 c!32086) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))) (_2!1650 (ite (or c!32085 c!32086) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))))))

(assert (=> d!54189 (= (+!262 (ite c!32085 call!18071 (ite c!32086 call!18069 call!18070)) (ite (or c!32085 c!32086) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))) lt!88601)))

(declare-fun b!179159 () Bool)

(declare-fun res!84840 () Bool)

(assert (=> b!179159 (=> (not res!84840) (not e!118047))))

(assert (=> b!179159 (= res!84840 (= (getValueByKey!201 (toList!1121 lt!88601) (_1!1650 (ite (or c!32085 c!32086) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248))))) (Some!206 (_2!1650 (ite (or c!32085 c!32086) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))))

(declare-fun b!179160 () Bool)

(assert (=> b!179160 (= e!118047 (contains!1205 (toList!1121 lt!88601) (ite (or c!32085 c!32086) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3514 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3514 thiss!1248)))))))

(assert (= (and d!54189 res!84839) b!179159))

(assert (= (and b!179159 res!84840) b!179160))

(declare-fun m!207651 () Bool)

(assert (=> d!54189 m!207651))

(declare-fun m!207653 () Bool)

(assert (=> d!54189 m!207653))

(declare-fun m!207655 () Bool)

(assert (=> d!54189 m!207655))

(declare-fun m!207657 () Bool)

(assert (=> d!54189 m!207657))

(declare-fun m!207659 () Bool)

(assert (=> b!179159 m!207659))

(declare-fun m!207661 () Bool)

(assert (=> b!179160 m!207661))

(assert (=> bm!18069 d!54189))

(declare-fun b!179171 () Bool)

(declare-fun res!84852 () Bool)

(declare-fun e!118050 () Bool)

(assert (=> b!179171 (=> (not res!84852) (not e!118050))))

(declare-fun size!3873 (LongMapFixedSize!2404) (_ BitVec 32))

(assert (=> b!179171 (= res!84852 (= (size!3873 thiss!1248) (bvadd (_size!1251 thiss!1248) (bvsdiv (bvadd (extraKeys!3410 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!179170 () Bool)

(declare-fun res!84849 () Bool)

(assert (=> b!179170 (=> (not res!84849) (not e!118050))))

(assert (=> b!179170 (= res!84849 (bvsge (size!3873 thiss!1248) (_size!1251 thiss!1248)))))

(declare-fun b!179169 () Bool)

(declare-fun res!84851 () Bool)

(assert (=> b!179169 (=> (not res!84851) (not e!118050))))

(assert (=> b!179169 (= res!84851 (and (= (size!3868 (_values!3656 thiss!1248)) (bvadd (mask!8641 thiss!1248) #b00000000000000000000000000000001)) (= (size!3867 (_keys!5554 thiss!1248)) (size!3868 (_values!3656 thiss!1248))) (bvsge (_size!1251 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1251 thiss!1248) (bvadd (mask!8641 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!179172 () Bool)

(assert (=> b!179172 (= e!118050 (and (bvsge (extraKeys!3410 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3410 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1251 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!54191 () Bool)

(declare-fun res!84850 () Bool)

(assert (=> d!54191 (=> (not res!84850) (not e!118050))))

(assert (=> d!54191 (= res!84850 (validMask!0 (mask!8641 thiss!1248)))))

(assert (=> d!54191 (= (simpleValid!159 thiss!1248) e!118050)))

(assert (= (and d!54191 res!84850) b!179169))

(assert (= (and b!179169 res!84851) b!179170))

(assert (= (and b!179170 res!84849) b!179171))

(assert (= (and b!179171 res!84852) b!179172))

(declare-fun m!207663 () Bool)

(assert (=> b!179171 m!207663))

(assert (=> b!179170 m!207663))

(assert (=> d!54191 m!207331))

(assert (=> d!54113 d!54191))

(declare-fun d!54193 () Bool)

(declare-fun e!118051 () Bool)

(assert (=> d!54193 e!118051))

(declare-fun res!84853 () Bool)

(assert (=> d!54193 (=> res!84853 e!118051)))

(declare-fun lt!88603 () Bool)

(assert (=> d!54193 (= res!84853 (not lt!88603))))

(declare-fun lt!88604 () Bool)

(assert (=> d!54193 (= lt!88603 lt!88604)))

(declare-fun lt!88606 () Unit!5451)

(declare-fun e!118052 () Unit!5451)

(assert (=> d!54193 (= lt!88606 e!118052)))

(declare-fun c!32145 () Bool)

(assert (=> d!54193 (= c!32145 lt!88604)))

(assert (=> d!54193 (= lt!88604 (containsKey!204 (toList!1121 lt!88496) (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54193 (= (contains!1204 lt!88496 (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)) lt!88603)))

(declare-fun b!179173 () Bool)

(declare-fun lt!88605 () Unit!5451)

(assert (=> b!179173 (= e!118052 lt!88605)))

(assert (=> b!179173 (= lt!88605 (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1121 lt!88496) (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179173 (isDefined!153 (getValueByKey!201 (toList!1121 lt!88496) (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179174 () Bool)

(declare-fun Unit!5458 () Unit!5451)

(assert (=> b!179174 (= e!118052 Unit!5458)))

(declare-fun b!179175 () Bool)

(assert (=> b!179175 (= e!118051 (isDefined!153 (getValueByKey!201 (toList!1121 lt!88496) (select (arr!3560 (_keys!5554 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54193 c!32145) b!179173))

(assert (= (and d!54193 (not c!32145)) b!179174))

(assert (= (and d!54193 (not res!84853)) b!179175))

(assert (=> d!54193 m!207397))

(declare-fun m!207665 () Bool)

(assert (=> d!54193 m!207665))

(assert (=> b!179173 m!207397))

(declare-fun m!207667 () Bool)

(assert (=> b!179173 m!207667))

(assert (=> b!179173 m!207397))

(assert (=> b!179173 m!207461))

(assert (=> b!179173 m!207461))

(declare-fun m!207669 () Bool)

(assert (=> b!179173 m!207669))

(assert (=> b!179175 m!207397))

(assert (=> b!179175 m!207461))

(assert (=> b!179175 m!207461))

(assert (=> b!179175 m!207669))

(assert (=> b!178967 d!54193))

(declare-fun d!54195 () Bool)

(assert (=> d!54195 (= (apply!145 lt!88496 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2048 (getValueByKey!201 (toList!1121 lt!88496) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7367 () Bool)

(assert (= bs!7367 d!54195))

(assert (=> bs!7367 m!207525))

(assert (=> bs!7367 m!207525))

(declare-fun m!207671 () Bool)

(assert (=> bs!7367 m!207671))

(assert (=> b!178958 d!54195))

(declare-fun b!179176 () Bool)

(declare-fun e!118054 () Bool)

(assert (=> b!179176 (= e!118054 tp_is_empty!4183)))

(declare-fun b!179177 () Bool)

(declare-fun e!118053 () Bool)

(assert (=> b!179177 (= e!118053 tp_is_empty!4183)))

(declare-fun mapIsEmpty!7165 () Bool)

(declare-fun mapRes!7165 () Bool)

(assert (=> mapIsEmpty!7165 mapRes!7165))

(declare-fun mapNonEmpty!7165 () Bool)

(declare-fun tp!15967 () Bool)

(assert (=> mapNonEmpty!7165 (= mapRes!7165 (and tp!15967 e!118054))))

(declare-fun mapValue!7165 () ValueCell!1748)

(declare-fun mapRest!7165 () (Array (_ BitVec 32) ValueCell!1748))

(declare-fun mapKey!7165 () (_ BitVec 32))

(assert (=> mapNonEmpty!7165 (= mapRest!7164 (store mapRest!7165 mapKey!7165 mapValue!7165))))

(declare-fun condMapEmpty!7165 () Bool)

(declare-fun mapDefault!7165 () ValueCell!1748)

(assert (=> mapNonEmpty!7164 (= condMapEmpty!7165 (= mapRest!7164 ((as const (Array (_ BitVec 32) ValueCell!1748)) mapDefault!7165)))))

(assert (=> mapNonEmpty!7164 (= tp!15966 (and e!118053 mapRes!7165))))

(assert (= (and mapNonEmpty!7164 condMapEmpty!7165) mapIsEmpty!7165))

(assert (= (and mapNonEmpty!7164 (not condMapEmpty!7165)) mapNonEmpty!7165))

(assert (= (and mapNonEmpty!7165 ((_ is ValueCellFull!1748) mapValue!7165)) b!179176))

(assert (= (and mapNonEmpty!7164 ((_ is ValueCellFull!1748) mapDefault!7165)) b!179177))

(declare-fun m!207673 () Bool)

(assert (=> mapNonEmpty!7165 m!207673))

(declare-fun b_lambda!7125 () Bool)

(assert (= b_lambda!7123 (or (and b!178813 b_free!4411) b_lambda!7125)))

(declare-fun b_lambda!7127 () Bool)

(assert (= b_lambda!7121 (or (and b!178813 b_free!4411) b_lambda!7127)))

(check-sat (not bm!18079) (not d!54175) (not b!179082) (not d!54165) (not b!179089) (not b!179090) (not d!54159) (not d!54163) (not bm!18082) tp_is_empty!4183 (not b!179106) (not d!54157) (not d!54195) (not b!179118) (not d!54137) (not d!54181) (not b!179136) (not bm!18073) (not b!179092) (not b!179124) (not d!54143) (not d!54167) (not b!178998) (not b!179152) (not d!54189) (not b!179130) (not d!54173) (not b!178992) (not b!179170) (not b!179050) (not b!179054) (not b!178999) (not d!54185) (not d!54177) (not b_lambda!7119) (not b!179160) (not mapNonEmpty!7165) (not b!179171) (not b!179015) (not b!179158) (not d!54127) (not d!54155) (not b!179058) (not b!179127) (not b!179023) (not b!179126) (not b!179053) (not b!179173) (not b!179149) (not d!54153) (not d!54139) (not b_lambda!7125) (not b!179159) (not b!179048) (not b_lambda!7127) (not b!179132) (not b!179128) (not b!179133) (not b!179051) (not b!179104) (not b!179093) (not b_next!4411) b_and!10957 (not d!54161) (not d!54135) (not d!54193) (not d!54123) (not d!54133) (not d!54171) (not b!179057) (not b!179131) (not d!54145) (not d!54169) (not b!179148) (not bm!18076) (not b!179059) (not d!54191) (not b!179137) (not b!179095) (not d!54179) (not d!54147) (not b!179022) (not b!179175))
(check-sat b_and!10957 (not b_next!4411))
