; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22352 () Bool)

(assert start!22352)

(declare-fun b!234137 () Bool)

(declare-fun b_free!6301 () Bool)

(declare-fun b_next!6301 () Bool)

(assert (=> b!234137 (= b_free!6301 (not b_next!6301))))

(declare-fun tp!22056 () Bool)

(declare-fun b_and!13227 () Bool)

(assert (=> b!234137 (= tp!22056 b_and!13227)))

(declare-fun b!234129 () Bool)

(declare-fun res!114862 () Bool)

(declare-fun e!152072 () Bool)

(assert (=> b!234129 (=> (not res!114862) (not e!152072))))

(declare-datatypes ((V!7865 0))(
  ( (V!7866 (val!3126 Int)) )
))
(declare-datatypes ((ValueCell!2738 0))(
  ( (ValueCellFull!2738 (v!5150 V!7865)) (EmptyCell!2738) )
))
(declare-datatypes ((array!11573 0))(
  ( (array!11574 (arr!5503 (Array (_ BitVec 32) ValueCell!2738)) (size!5838 (_ BitVec 32))) )
))
(declare-datatypes ((array!11575 0))(
  ( (array!11576 (arr!5504 (Array (_ BitVec 32) (_ BitVec 64))) (size!5839 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3376 0))(
  ( (LongMapFixedSize!3377 (defaultEntry!4352 Int) (mask!10294 (_ BitVec 32)) (extraKeys!4089 (_ BitVec 32)) (zeroValue!4193 V!7865) (minValue!4193 V!7865) (_size!1737 (_ BitVec 32)) (_keys!6415 array!11575) (_values!4335 array!11573) (_vacant!1737 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3376)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234129 (= res!114862 (validMask!0 (mask!10294 thiss!1504)))))

(declare-fun res!114861 () Bool)

(declare-fun e!152073 () Bool)

(assert (=> start!22352 (=> (not res!114861) (not e!152073))))

(declare-fun valid!1348 (LongMapFixedSize!3376) Bool)

(assert (=> start!22352 (= res!114861 (valid!1348 thiss!1504))))

(assert (=> start!22352 e!152073))

(declare-fun e!152068 () Bool)

(assert (=> start!22352 e!152068))

(assert (=> start!22352 true))

(declare-fun b!234130 () Bool)

(declare-fun e!152071 () Bool)

(declare-fun tp_is_empty!6163 () Bool)

(assert (=> b!234130 (= e!152071 tp_is_empty!6163)))

(declare-fun b!234131 () Bool)

(assert (=> b!234131 (= e!152072 (and (= (size!5838 (_values!4335 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10294 thiss!1504))) (= (size!5839 (_keys!6415 thiss!1504)) (size!5838 (_values!4335 thiss!1504))) (bvslt (mask!10294 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!10425 () Bool)

(declare-fun mapRes!10425 () Bool)

(assert (=> mapIsEmpty!10425 mapRes!10425))

(declare-fun mapNonEmpty!10425 () Bool)

(declare-fun tp!22055 () Bool)

(declare-fun e!152069 () Bool)

(assert (=> mapNonEmpty!10425 (= mapRes!10425 (and tp!22055 e!152069))))

(declare-fun mapValue!10425 () ValueCell!2738)

(declare-fun mapKey!10425 () (_ BitVec 32))

(declare-fun mapRest!10425 () (Array (_ BitVec 32) ValueCell!2738))

(assert (=> mapNonEmpty!10425 (= (arr!5503 (_values!4335 thiss!1504)) (store mapRest!10425 mapKey!10425 mapValue!10425))))

(declare-fun b!234132 () Bool)

(assert (=> b!234132 (= e!152073 e!152072)))

(declare-fun res!114860 () Bool)

(assert (=> b!234132 (=> (not res!114860) (not e!152072))))

(declare-datatypes ((SeekEntryResult!949 0))(
  ( (MissingZero!949 (index!5966 (_ BitVec 32))) (Found!949 (index!5967 (_ BitVec 32))) (Intermediate!949 (undefined!1761 Bool) (index!5968 (_ BitVec 32)) (x!23647 (_ BitVec 32))) (Undefined!949) (MissingVacant!949 (index!5969 (_ BitVec 32))) )
))
(declare-fun lt!118475 () SeekEntryResult!949)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!234132 (= res!114860 (or (= lt!118475 (MissingZero!949 index!297)) (= lt!118475 (MissingVacant!949 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11575 (_ BitVec 32)) SeekEntryResult!949)

(assert (=> b!234132 (= lt!118475 (seekEntryOrOpen!0 key!932 (_keys!6415 thiss!1504) (mask!10294 thiss!1504)))))

(declare-fun b!234133 () Bool)

(declare-fun res!114863 () Bool)

(assert (=> b!234133 (=> (not res!114863) (not e!152072))))

(declare-datatypes ((tuple2!4542 0))(
  ( (tuple2!4543 (_1!2282 (_ BitVec 64)) (_2!2282 V!7865)) )
))
(declare-datatypes ((List!3445 0))(
  ( (Nil!3442) (Cons!3441 (h!4091 tuple2!4542) (t!8402 List!3445)) )
))
(declare-datatypes ((ListLongMap!3457 0))(
  ( (ListLongMap!3458 (toList!1744 List!3445)) )
))
(declare-fun contains!1630 (ListLongMap!3457 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1276 (array!11575 array!11573 (_ BitVec 32) (_ BitVec 32) V!7865 V!7865 (_ BitVec 32) Int) ListLongMap!3457)

(assert (=> b!234133 (= res!114863 (contains!1630 (getCurrentListMap!1276 (_keys!6415 thiss!1504) (_values!4335 thiss!1504) (mask!10294 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)) key!932))))

(declare-fun b!234134 () Bool)

(declare-fun res!114859 () Bool)

(assert (=> b!234134 (=> (not res!114859) (not e!152073))))

(assert (=> b!234134 (= res!114859 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234135 () Bool)

(declare-fun e!152067 () Bool)

(assert (=> b!234135 (= e!152067 (and e!152071 mapRes!10425))))

(declare-fun condMapEmpty!10425 () Bool)

(declare-fun mapDefault!10425 () ValueCell!2738)

(assert (=> b!234135 (= condMapEmpty!10425 (= (arr!5503 (_values!4335 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2738)) mapDefault!10425)))))

(declare-fun b!234136 () Bool)

(assert (=> b!234136 (= e!152069 tp_is_empty!6163)))

(declare-fun array_inv!3607 (array!11575) Bool)

(declare-fun array_inv!3608 (array!11573) Bool)

(assert (=> b!234137 (= e!152068 (and tp!22056 tp_is_empty!6163 (array_inv!3607 (_keys!6415 thiss!1504)) (array_inv!3608 (_values!4335 thiss!1504)) e!152067))))

(assert (= (and start!22352 res!114861) b!234134))

(assert (= (and b!234134 res!114859) b!234132))

(assert (= (and b!234132 res!114860) b!234133))

(assert (= (and b!234133 res!114863) b!234129))

(assert (= (and b!234129 res!114862) b!234131))

(assert (= (and b!234135 condMapEmpty!10425) mapIsEmpty!10425))

(assert (= (and b!234135 (not condMapEmpty!10425)) mapNonEmpty!10425))

(get-info :version)

(assert (= (and mapNonEmpty!10425 ((_ is ValueCellFull!2738) mapValue!10425)) b!234136))

(assert (= (and b!234135 ((_ is ValueCellFull!2738) mapDefault!10425)) b!234130))

(assert (= b!234137 b!234135))

(assert (= start!22352 b!234137))

(declare-fun m!255617 () Bool)

(assert (=> b!234137 m!255617))

(declare-fun m!255619 () Bool)

(assert (=> b!234137 m!255619))

(declare-fun m!255621 () Bool)

(assert (=> b!234132 m!255621))

(declare-fun m!255623 () Bool)

(assert (=> mapNonEmpty!10425 m!255623))

(declare-fun m!255625 () Bool)

(assert (=> b!234129 m!255625))

(declare-fun m!255627 () Bool)

(assert (=> b!234133 m!255627))

(assert (=> b!234133 m!255627))

(declare-fun m!255629 () Bool)

(assert (=> b!234133 m!255629))

(declare-fun m!255631 () Bool)

(assert (=> start!22352 m!255631))

(check-sat (not b!234129) (not mapNonEmpty!10425) (not b_next!6301) tp_is_empty!6163 (not b!234132) (not b!234137) (not b!234133) (not start!22352) b_and!13227)
(check-sat b_and!13227 (not b_next!6301))
(get-model)

(declare-fun d!59133 () Bool)

(assert (=> d!59133 (= (array_inv!3607 (_keys!6415 thiss!1504)) (bvsge (size!5839 (_keys!6415 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234137 d!59133))

(declare-fun d!59135 () Bool)

(assert (=> d!59135 (= (array_inv!3608 (_values!4335 thiss!1504)) (bvsge (size!5838 (_values!4335 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234137 d!59135))

(declare-fun b!234204 () Bool)

(declare-fun e!152123 () SeekEntryResult!949)

(assert (=> b!234204 (= e!152123 Undefined!949)))

(declare-fun lt!118489 () SeekEntryResult!949)

(declare-fun e!152122 () SeekEntryResult!949)

(declare-fun b!234205 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11575 (_ BitVec 32)) SeekEntryResult!949)

(assert (=> b!234205 (= e!152122 (seekKeyOrZeroReturnVacant!0 (x!23647 lt!118489) (index!5968 lt!118489) (index!5968 lt!118489) key!932 (_keys!6415 thiss!1504) (mask!10294 thiss!1504)))))

(declare-fun d!59137 () Bool)

(declare-fun lt!118490 () SeekEntryResult!949)

(assert (=> d!59137 (and (or ((_ is Undefined!949) lt!118490) (not ((_ is Found!949) lt!118490)) (and (bvsge (index!5967 lt!118490) #b00000000000000000000000000000000) (bvslt (index!5967 lt!118490) (size!5839 (_keys!6415 thiss!1504))))) (or ((_ is Undefined!949) lt!118490) ((_ is Found!949) lt!118490) (not ((_ is MissingZero!949) lt!118490)) (and (bvsge (index!5966 lt!118490) #b00000000000000000000000000000000) (bvslt (index!5966 lt!118490) (size!5839 (_keys!6415 thiss!1504))))) (or ((_ is Undefined!949) lt!118490) ((_ is Found!949) lt!118490) ((_ is MissingZero!949) lt!118490) (not ((_ is MissingVacant!949) lt!118490)) (and (bvsge (index!5969 lt!118490) #b00000000000000000000000000000000) (bvslt (index!5969 lt!118490) (size!5839 (_keys!6415 thiss!1504))))) (or ((_ is Undefined!949) lt!118490) (ite ((_ is Found!949) lt!118490) (= (select (arr!5504 (_keys!6415 thiss!1504)) (index!5967 lt!118490)) key!932) (ite ((_ is MissingZero!949) lt!118490) (= (select (arr!5504 (_keys!6415 thiss!1504)) (index!5966 lt!118490)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!949) lt!118490) (= (select (arr!5504 (_keys!6415 thiss!1504)) (index!5969 lt!118490)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59137 (= lt!118490 e!152123)))

(declare-fun c!38995 () Bool)

(assert (=> d!59137 (= c!38995 (and ((_ is Intermediate!949) lt!118489) (undefined!1761 lt!118489)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11575 (_ BitVec 32)) SeekEntryResult!949)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59137 (= lt!118489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10294 thiss!1504)) key!932 (_keys!6415 thiss!1504) (mask!10294 thiss!1504)))))

(assert (=> d!59137 (validMask!0 (mask!10294 thiss!1504))))

(assert (=> d!59137 (= (seekEntryOrOpen!0 key!932 (_keys!6415 thiss!1504) (mask!10294 thiss!1504)) lt!118490)))

(declare-fun b!234206 () Bool)

(declare-fun c!38996 () Bool)

(declare-fun lt!118488 () (_ BitVec 64))

(assert (=> b!234206 (= c!38996 (= lt!118488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152124 () SeekEntryResult!949)

(assert (=> b!234206 (= e!152124 e!152122)))

(declare-fun b!234207 () Bool)

(assert (=> b!234207 (= e!152122 (MissingZero!949 (index!5968 lt!118489)))))

(declare-fun b!234208 () Bool)

(assert (=> b!234208 (= e!152124 (Found!949 (index!5968 lt!118489)))))

(declare-fun b!234209 () Bool)

(assert (=> b!234209 (= e!152123 e!152124)))

(assert (=> b!234209 (= lt!118488 (select (arr!5504 (_keys!6415 thiss!1504)) (index!5968 lt!118489)))))

(declare-fun c!38997 () Bool)

(assert (=> b!234209 (= c!38997 (= lt!118488 key!932))))

(assert (= (and d!59137 c!38995) b!234204))

(assert (= (and d!59137 (not c!38995)) b!234209))

(assert (= (and b!234209 c!38997) b!234208))

(assert (= (and b!234209 (not c!38997)) b!234206))

(assert (= (and b!234206 c!38996) b!234207))

(assert (= (and b!234206 (not c!38996)) b!234205))

(declare-fun m!255665 () Bool)

(assert (=> b!234205 m!255665))

(declare-fun m!255667 () Bool)

(assert (=> d!59137 m!255667))

(declare-fun m!255669 () Bool)

(assert (=> d!59137 m!255669))

(declare-fun m!255671 () Bool)

(assert (=> d!59137 m!255671))

(declare-fun m!255673 () Bool)

(assert (=> d!59137 m!255673))

(assert (=> d!59137 m!255625))

(declare-fun m!255675 () Bool)

(assert (=> d!59137 m!255675))

(assert (=> d!59137 m!255667))

(declare-fun m!255677 () Bool)

(assert (=> b!234209 m!255677))

(assert (=> b!234132 d!59137))

(declare-fun d!59139 () Bool)

(assert (=> d!59139 (= (validMask!0 (mask!10294 thiss!1504)) (and (or (= (mask!10294 thiss!1504) #b00000000000000000000000000000111) (= (mask!10294 thiss!1504) #b00000000000000000000000000001111) (= (mask!10294 thiss!1504) #b00000000000000000000000000011111) (= (mask!10294 thiss!1504) #b00000000000000000000000000111111) (= (mask!10294 thiss!1504) #b00000000000000000000000001111111) (= (mask!10294 thiss!1504) #b00000000000000000000000011111111) (= (mask!10294 thiss!1504) #b00000000000000000000000111111111) (= (mask!10294 thiss!1504) #b00000000000000000000001111111111) (= (mask!10294 thiss!1504) #b00000000000000000000011111111111) (= (mask!10294 thiss!1504) #b00000000000000000000111111111111) (= (mask!10294 thiss!1504) #b00000000000000000001111111111111) (= (mask!10294 thiss!1504) #b00000000000000000011111111111111) (= (mask!10294 thiss!1504) #b00000000000000000111111111111111) (= (mask!10294 thiss!1504) #b00000000000000001111111111111111) (= (mask!10294 thiss!1504) #b00000000000000011111111111111111) (= (mask!10294 thiss!1504) #b00000000000000111111111111111111) (= (mask!10294 thiss!1504) #b00000000000001111111111111111111) (= (mask!10294 thiss!1504) #b00000000000011111111111111111111) (= (mask!10294 thiss!1504) #b00000000000111111111111111111111) (= (mask!10294 thiss!1504) #b00000000001111111111111111111111) (= (mask!10294 thiss!1504) #b00000000011111111111111111111111) (= (mask!10294 thiss!1504) #b00000000111111111111111111111111) (= (mask!10294 thiss!1504) #b00000001111111111111111111111111) (= (mask!10294 thiss!1504) #b00000011111111111111111111111111) (= (mask!10294 thiss!1504) #b00000111111111111111111111111111) (= (mask!10294 thiss!1504) #b00001111111111111111111111111111) (= (mask!10294 thiss!1504) #b00011111111111111111111111111111) (= (mask!10294 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10294 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!234129 d!59139))

(declare-fun d!59141 () Bool)

(declare-fun res!114900 () Bool)

(declare-fun e!152127 () Bool)

(assert (=> d!59141 (=> (not res!114900) (not e!152127))))

(declare-fun simpleValid!229 (LongMapFixedSize!3376) Bool)

(assert (=> d!59141 (= res!114900 (simpleValid!229 thiss!1504))))

(assert (=> d!59141 (= (valid!1348 thiss!1504) e!152127)))

(declare-fun b!234216 () Bool)

(declare-fun res!114901 () Bool)

(assert (=> b!234216 (=> (not res!114901) (not e!152127))))

(declare-fun arrayCountValidKeys!0 (array!11575 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234216 (= res!114901 (= (arrayCountValidKeys!0 (_keys!6415 thiss!1504) #b00000000000000000000000000000000 (size!5839 (_keys!6415 thiss!1504))) (_size!1737 thiss!1504)))))

(declare-fun b!234217 () Bool)

(declare-fun res!114902 () Bool)

(assert (=> b!234217 (=> (not res!114902) (not e!152127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11575 (_ BitVec 32)) Bool)

(assert (=> b!234217 (= res!114902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6415 thiss!1504) (mask!10294 thiss!1504)))))

(declare-fun b!234218 () Bool)

(declare-datatypes ((List!3447 0))(
  ( (Nil!3444) (Cons!3443 (h!4093 (_ BitVec 64)) (t!8406 List!3447)) )
))
(declare-fun arrayNoDuplicates!0 (array!11575 (_ BitVec 32) List!3447) Bool)

(assert (=> b!234218 (= e!152127 (arrayNoDuplicates!0 (_keys!6415 thiss!1504) #b00000000000000000000000000000000 Nil!3444))))

(assert (= (and d!59141 res!114900) b!234216))

(assert (= (and b!234216 res!114901) b!234217))

(assert (= (and b!234217 res!114902) b!234218))

(declare-fun m!255679 () Bool)

(assert (=> d!59141 m!255679))

(declare-fun m!255681 () Bool)

(assert (=> b!234216 m!255681))

(declare-fun m!255683 () Bool)

(assert (=> b!234217 m!255683))

(declare-fun m!255685 () Bool)

(assert (=> b!234218 m!255685))

(assert (=> start!22352 d!59141))

(declare-fun d!59143 () Bool)

(declare-fun e!152133 () Bool)

(assert (=> d!59143 e!152133))

(declare-fun res!114905 () Bool)

(assert (=> d!59143 (=> res!114905 e!152133)))

(declare-fun lt!118499 () Bool)

(assert (=> d!59143 (= res!114905 (not lt!118499))))

(declare-fun lt!118501 () Bool)

(assert (=> d!59143 (= lt!118499 lt!118501)))

(declare-datatypes ((Unit!7219 0))(
  ( (Unit!7220) )
))
(declare-fun lt!118500 () Unit!7219)

(declare-fun e!152132 () Unit!7219)

(assert (=> d!59143 (= lt!118500 e!152132)))

(declare-fun c!39000 () Bool)

(assert (=> d!59143 (= c!39000 lt!118501)))

(declare-fun containsKey!256 (List!3445 (_ BitVec 64)) Bool)

(assert (=> d!59143 (= lt!118501 (containsKey!256 (toList!1744 (getCurrentListMap!1276 (_keys!6415 thiss!1504) (_values!4335 thiss!1504) (mask!10294 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504))) key!932))))

(assert (=> d!59143 (= (contains!1630 (getCurrentListMap!1276 (_keys!6415 thiss!1504) (_values!4335 thiss!1504) (mask!10294 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)) key!932) lt!118499)))

(declare-fun b!234225 () Bool)

(declare-fun lt!118502 () Unit!7219)

(assert (=> b!234225 (= e!152132 lt!118502)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!204 (List!3445 (_ BitVec 64)) Unit!7219)

(assert (=> b!234225 (= lt!118502 (lemmaContainsKeyImpliesGetValueByKeyDefined!204 (toList!1744 (getCurrentListMap!1276 (_keys!6415 thiss!1504) (_values!4335 thiss!1504) (mask!10294 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504))) key!932))))

(declare-datatypes ((Option!271 0))(
  ( (Some!270 (v!5153 V!7865)) (None!269) )
))
(declare-fun isDefined!205 (Option!271) Bool)

(declare-fun getValueByKey!265 (List!3445 (_ BitVec 64)) Option!271)

(assert (=> b!234225 (isDefined!205 (getValueByKey!265 (toList!1744 (getCurrentListMap!1276 (_keys!6415 thiss!1504) (_values!4335 thiss!1504) (mask!10294 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504))) key!932))))

(declare-fun b!234226 () Bool)

(declare-fun Unit!7221 () Unit!7219)

(assert (=> b!234226 (= e!152132 Unit!7221)))

(declare-fun b!234227 () Bool)

(assert (=> b!234227 (= e!152133 (isDefined!205 (getValueByKey!265 (toList!1744 (getCurrentListMap!1276 (_keys!6415 thiss!1504) (_values!4335 thiss!1504) (mask!10294 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504))) key!932)))))

(assert (= (and d!59143 c!39000) b!234225))

(assert (= (and d!59143 (not c!39000)) b!234226))

(assert (= (and d!59143 (not res!114905)) b!234227))

(declare-fun m!255687 () Bool)

(assert (=> d!59143 m!255687))

(declare-fun m!255689 () Bool)

(assert (=> b!234225 m!255689))

(declare-fun m!255691 () Bool)

(assert (=> b!234225 m!255691))

(assert (=> b!234225 m!255691))

(declare-fun m!255693 () Bool)

(assert (=> b!234225 m!255693))

(assert (=> b!234227 m!255691))

(assert (=> b!234227 m!255691))

(assert (=> b!234227 m!255693))

(assert (=> b!234133 d!59143))

(declare-fun b!234270 () Bool)

(declare-fun e!152171 () Bool)

(declare-fun call!21768 () Bool)

(assert (=> b!234270 (= e!152171 (not call!21768))))

(declare-fun b!234271 () Bool)

(declare-fun res!114931 () Bool)

(declare-fun e!152172 () Bool)

(assert (=> b!234271 (=> (not res!114931) (not e!152172))))

(assert (=> b!234271 (= res!114931 e!152171)))

(declare-fun c!39016 () Bool)

(assert (=> b!234271 (= c!39016 (not (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!21765 () Bool)

(declare-fun call!21773 () ListLongMap!3457)

(declare-fun call!21770 () ListLongMap!3457)

(assert (=> bm!21765 (= call!21773 call!21770)))

(declare-fun b!234272 () Bool)

(declare-fun e!152162 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!234272 (= e!152162 (validKeyInArray!0 (select (arr!5504 (_keys!6415 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234273 () Bool)

(declare-fun e!152166 () Bool)

(assert (=> b!234273 (= e!152166 (validKeyInArray!0 (select (arr!5504 (_keys!6415 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun c!39018 () Bool)

(declare-fun call!21769 () ListLongMap!3457)

(declare-fun call!21774 () ListLongMap!3457)

(declare-fun bm!21766 () Bool)

(declare-fun c!39015 () Bool)

(declare-fun +!633 (ListLongMap!3457 tuple2!4542) ListLongMap!3457)

(assert (=> bm!21766 (= call!21774 (+!633 (ite c!39018 call!21770 (ite c!39015 call!21773 call!21769)) (ite (or c!39018 c!39015) (tuple2!4543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4193 thiss!1504)) (tuple2!4543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4193 thiss!1504)))))))

(declare-fun b!234274 () Bool)

(declare-fun c!39014 () Bool)

(assert (=> b!234274 (= c!39014 (and (not (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!152169 () ListLongMap!3457)

(declare-fun e!152168 () ListLongMap!3457)

(assert (=> b!234274 (= e!152169 e!152168)))

(declare-fun b!234275 () Bool)

(declare-fun call!21771 () ListLongMap!3457)

(assert (=> b!234275 (= e!152169 call!21771)))

(declare-fun bm!21767 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!522 (array!11575 array!11573 (_ BitVec 32) (_ BitVec 32) V!7865 V!7865 (_ BitVec 32) Int) ListLongMap!3457)

(assert (=> bm!21767 (= call!21770 (getCurrentListMapNoExtraKeys!522 (_keys!6415 thiss!1504) (_values!4335 thiss!1504) (mask!10294 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)))))

(declare-fun b!234276 () Bool)

(assert (=> b!234276 (= e!152168 call!21771)))

(declare-fun bm!21768 () Bool)

(declare-fun call!21772 () Bool)

(declare-fun lt!118559 () ListLongMap!3457)

(assert (=> bm!21768 (= call!21772 (contains!1630 lt!118559 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234277 () Bool)

(declare-fun e!152167 () Bool)

(assert (=> b!234277 (= e!152172 e!152167)))

(declare-fun c!39013 () Bool)

(assert (=> b!234277 (= c!39013 (not (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234278 () Bool)

(declare-fun e!152170 () Unit!7219)

(declare-fun Unit!7222 () Unit!7219)

(assert (=> b!234278 (= e!152170 Unit!7222)))

(declare-fun b!234279 () Bool)

(declare-fun e!152163 () Bool)

(assert (=> b!234279 (= e!152171 e!152163)))

(declare-fun res!114925 () Bool)

(assert (=> b!234279 (= res!114925 call!21768)))

(assert (=> b!234279 (=> (not res!114925) (not e!152163))))

(declare-fun b!234280 () Bool)

(assert (=> b!234280 (= e!152167 (not call!21772))))

(declare-fun b!234281 () Bool)

(declare-fun apply!206 (ListLongMap!3457 (_ BitVec 64)) V!7865)

(assert (=> b!234281 (= e!152163 (= (apply!206 lt!118559 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4193 thiss!1504)))))

(declare-fun b!234282 () Bool)

(declare-fun lt!118557 () Unit!7219)

(assert (=> b!234282 (= e!152170 lt!118557)))

(declare-fun lt!118556 () ListLongMap!3457)

(assert (=> b!234282 (= lt!118556 (getCurrentListMapNoExtraKeys!522 (_keys!6415 thiss!1504) (_values!4335 thiss!1504) (mask!10294 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)))))

(declare-fun lt!118565 () (_ BitVec 64))

(assert (=> b!234282 (= lt!118565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118563 () (_ BitVec 64))

(assert (=> b!234282 (= lt!118563 (select (arr!5504 (_keys!6415 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118561 () Unit!7219)

(declare-fun addStillContains!182 (ListLongMap!3457 (_ BitVec 64) V!7865 (_ BitVec 64)) Unit!7219)

(assert (=> b!234282 (= lt!118561 (addStillContains!182 lt!118556 lt!118565 (zeroValue!4193 thiss!1504) lt!118563))))

(assert (=> b!234282 (contains!1630 (+!633 lt!118556 (tuple2!4543 lt!118565 (zeroValue!4193 thiss!1504))) lt!118563)))

(declare-fun lt!118548 () Unit!7219)

(assert (=> b!234282 (= lt!118548 lt!118561)))

(declare-fun lt!118547 () ListLongMap!3457)

(assert (=> b!234282 (= lt!118547 (getCurrentListMapNoExtraKeys!522 (_keys!6415 thiss!1504) (_values!4335 thiss!1504) (mask!10294 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)))))

(declare-fun lt!118552 () (_ BitVec 64))

(assert (=> b!234282 (= lt!118552 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118562 () (_ BitVec 64))

(assert (=> b!234282 (= lt!118562 (select (arr!5504 (_keys!6415 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118560 () Unit!7219)

(declare-fun addApplyDifferent!182 (ListLongMap!3457 (_ BitVec 64) V!7865 (_ BitVec 64)) Unit!7219)

(assert (=> b!234282 (= lt!118560 (addApplyDifferent!182 lt!118547 lt!118552 (minValue!4193 thiss!1504) lt!118562))))

(assert (=> b!234282 (= (apply!206 (+!633 lt!118547 (tuple2!4543 lt!118552 (minValue!4193 thiss!1504))) lt!118562) (apply!206 lt!118547 lt!118562))))

(declare-fun lt!118555 () Unit!7219)

(assert (=> b!234282 (= lt!118555 lt!118560)))

(declare-fun lt!118550 () ListLongMap!3457)

(assert (=> b!234282 (= lt!118550 (getCurrentListMapNoExtraKeys!522 (_keys!6415 thiss!1504) (_values!4335 thiss!1504) (mask!10294 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)))))

(declare-fun lt!118558 () (_ BitVec 64))

(assert (=> b!234282 (= lt!118558 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118564 () (_ BitVec 64))

(assert (=> b!234282 (= lt!118564 (select (arr!5504 (_keys!6415 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118551 () Unit!7219)

(assert (=> b!234282 (= lt!118551 (addApplyDifferent!182 lt!118550 lt!118558 (zeroValue!4193 thiss!1504) lt!118564))))

(assert (=> b!234282 (= (apply!206 (+!633 lt!118550 (tuple2!4543 lt!118558 (zeroValue!4193 thiss!1504))) lt!118564) (apply!206 lt!118550 lt!118564))))

(declare-fun lt!118549 () Unit!7219)

(assert (=> b!234282 (= lt!118549 lt!118551)))

(declare-fun lt!118567 () ListLongMap!3457)

(assert (=> b!234282 (= lt!118567 (getCurrentListMapNoExtraKeys!522 (_keys!6415 thiss!1504) (_values!4335 thiss!1504) (mask!10294 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)))))

(declare-fun lt!118566 () (_ BitVec 64))

(assert (=> b!234282 (= lt!118566 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118554 () (_ BitVec 64))

(assert (=> b!234282 (= lt!118554 (select (arr!5504 (_keys!6415 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234282 (= lt!118557 (addApplyDifferent!182 lt!118567 lt!118566 (minValue!4193 thiss!1504) lt!118554))))

(assert (=> b!234282 (= (apply!206 (+!633 lt!118567 (tuple2!4543 lt!118566 (minValue!4193 thiss!1504))) lt!118554) (apply!206 lt!118567 lt!118554))))

(declare-fun b!234283 () Bool)

(declare-fun e!152160 () Bool)

(assert (=> b!234283 (= e!152160 (= (apply!206 lt!118559 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4193 thiss!1504)))))

(declare-fun b!234284 () Bool)

(assert (=> b!234284 (= e!152167 e!152160)))

(declare-fun res!114927 () Bool)

(assert (=> b!234284 (= res!114927 call!21772)))

(assert (=> b!234284 (=> (not res!114927) (not e!152160))))

(declare-fun d!59145 () Bool)

(assert (=> d!59145 e!152172))

(declare-fun res!114926 () Bool)

(assert (=> d!59145 (=> (not res!114926) (not e!152172))))

(assert (=> d!59145 (= res!114926 (or (bvsge #b00000000000000000000000000000000 (size!5839 (_keys!6415 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5839 (_keys!6415 thiss!1504))))))))

(declare-fun lt!118568 () ListLongMap!3457)

(assert (=> d!59145 (= lt!118559 lt!118568)))

(declare-fun lt!118553 () Unit!7219)

(assert (=> d!59145 (= lt!118553 e!152170)))

(declare-fun c!39017 () Bool)

(assert (=> d!59145 (= c!39017 e!152166)))

(declare-fun res!114928 () Bool)

(assert (=> d!59145 (=> (not res!114928) (not e!152166))))

(assert (=> d!59145 (= res!114928 (bvslt #b00000000000000000000000000000000 (size!5839 (_keys!6415 thiss!1504))))))

(declare-fun e!152161 () ListLongMap!3457)

(assert (=> d!59145 (= lt!118568 e!152161)))

(assert (=> d!59145 (= c!39018 (and (not (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59145 (validMask!0 (mask!10294 thiss!1504))))

(assert (=> d!59145 (= (getCurrentListMap!1276 (_keys!6415 thiss!1504) (_values!4335 thiss!1504) (mask!10294 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)) lt!118559)))

(declare-fun b!234285 () Bool)

(assert (=> b!234285 (= e!152168 call!21769)))

(declare-fun b!234286 () Bool)

(declare-fun res!114924 () Bool)

(assert (=> b!234286 (=> (not res!114924) (not e!152172))))

(declare-fun e!152165 () Bool)

(assert (=> b!234286 (= res!114924 e!152165)))

(declare-fun res!114932 () Bool)

(assert (=> b!234286 (=> res!114932 e!152165)))

(assert (=> b!234286 (= res!114932 (not e!152162))))

(declare-fun res!114929 () Bool)

(assert (=> b!234286 (=> (not res!114929) (not e!152162))))

(assert (=> b!234286 (= res!114929 (bvslt #b00000000000000000000000000000000 (size!5839 (_keys!6415 thiss!1504))))))

(declare-fun b!234287 () Bool)

(declare-fun e!152164 () Bool)

(assert (=> b!234287 (= e!152165 e!152164)))

(declare-fun res!114930 () Bool)

(assert (=> b!234287 (=> (not res!114930) (not e!152164))))

(assert (=> b!234287 (= res!114930 (contains!1630 lt!118559 (select (arr!5504 (_keys!6415 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5839 (_keys!6415 thiss!1504))))))

(declare-fun bm!21769 () Bool)

(assert (=> bm!21769 (= call!21768 (contains!1630 lt!118559 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234288 () Bool)

(assert (=> b!234288 (= e!152161 e!152169)))

(assert (=> b!234288 (= c!39015 (and (not (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234289 () Bool)

(declare-fun get!2831 (ValueCell!2738 V!7865) V!7865)

(declare-fun dynLambda!549 (Int (_ BitVec 64)) V!7865)

(assert (=> b!234289 (= e!152164 (= (apply!206 lt!118559 (select (arr!5504 (_keys!6415 thiss!1504)) #b00000000000000000000000000000000)) (get!2831 (select (arr!5503 (_values!4335 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!549 (defaultEntry!4352 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234289 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5838 (_values!4335 thiss!1504))))))

(assert (=> b!234289 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5839 (_keys!6415 thiss!1504))))))

(declare-fun b!234290 () Bool)

(assert (=> b!234290 (= e!152161 (+!633 call!21774 (tuple2!4543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4193 thiss!1504))))))

(declare-fun bm!21770 () Bool)

(assert (=> bm!21770 (= call!21769 call!21773)))

(declare-fun bm!21771 () Bool)

(assert (=> bm!21771 (= call!21771 call!21774)))

(assert (= (and d!59145 c!39018) b!234290))

(assert (= (and d!59145 (not c!39018)) b!234288))

(assert (= (and b!234288 c!39015) b!234275))

(assert (= (and b!234288 (not c!39015)) b!234274))

(assert (= (and b!234274 c!39014) b!234276))

(assert (= (and b!234274 (not c!39014)) b!234285))

(assert (= (or b!234276 b!234285) bm!21770))

(assert (= (or b!234275 bm!21770) bm!21765))

(assert (= (or b!234275 b!234276) bm!21771))

(assert (= (or b!234290 bm!21765) bm!21767))

(assert (= (or b!234290 bm!21771) bm!21766))

(assert (= (and d!59145 res!114928) b!234273))

(assert (= (and d!59145 c!39017) b!234282))

(assert (= (and d!59145 (not c!39017)) b!234278))

(assert (= (and d!59145 res!114926) b!234286))

(assert (= (and b!234286 res!114929) b!234272))

(assert (= (and b!234286 (not res!114932)) b!234287))

(assert (= (and b!234287 res!114930) b!234289))

(assert (= (and b!234286 res!114924) b!234271))

(assert (= (and b!234271 c!39016) b!234279))

(assert (= (and b!234271 (not c!39016)) b!234270))

(assert (= (and b!234279 res!114925) b!234281))

(assert (= (or b!234279 b!234270) bm!21769))

(assert (= (and b!234271 res!114931) b!234277))

(assert (= (and b!234277 c!39013) b!234284))

(assert (= (and b!234277 (not c!39013)) b!234280))

(assert (= (and b!234284 res!114927) b!234283))

(assert (= (or b!234284 b!234280) bm!21768))

(declare-fun b_lambda!7893 () Bool)

(assert (=> (not b_lambda!7893) (not b!234289)))

(declare-fun t!8405 () Bool)

(declare-fun tb!2917 () Bool)

(assert (=> (and b!234137 (= (defaultEntry!4352 thiss!1504) (defaultEntry!4352 thiss!1504)) t!8405) tb!2917))

(declare-fun result!5089 () Bool)

(assert (=> tb!2917 (= result!5089 tp_is_empty!6163)))

(assert (=> b!234289 t!8405))

(declare-fun b_and!13233 () Bool)

(assert (= b_and!13227 (and (=> t!8405 result!5089) b_and!13233)))

(declare-fun m!255695 () Bool)

(assert (=> b!234290 m!255695))

(declare-fun m!255697 () Bool)

(assert (=> b!234287 m!255697))

(assert (=> b!234287 m!255697))

(declare-fun m!255699 () Bool)

(assert (=> b!234287 m!255699))

(declare-fun m!255701 () Bool)

(assert (=> bm!21768 m!255701))

(declare-fun m!255703 () Bool)

(assert (=> bm!21766 m!255703))

(declare-fun m!255705 () Bool)

(assert (=> b!234283 m!255705))

(declare-fun m!255707 () Bool)

(assert (=> b!234281 m!255707))

(declare-fun m!255709 () Bool)

(assert (=> b!234282 m!255709))

(declare-fun m!255711 () Bool)

(assert (=> b!234282 m!255711))

(declare-fun m!255713 () Bool)

(assert (=> b!234282 m!255713))

(declare-fun m!255715 () Bool)

(assert (=> b!234282 m!255715))

(declare-fun m!255717 () Bool)

(assert (=> b!234282 m!255717))

(declare-fun m!255719 () Bool)

(assert (=> b!234282 m!255719))

(declare-fun m!255721 () Bool)

(assert (=> b!234282 m!255721))

(declare-fun m!255723 () Bool)

(assert (=> b!234282 m!255723))

(assert (=> b!234282 m!255713))

(declare-fun m!255725 () Bool)

(assert (=> b!234282 m!255725))

(declare-fun m!255727 () Bool)

(assert (=> b!234282 m!255727))

(declare-fun m!255729 () Bool)

(assert (=> b!234282 m!255729))

(declare-fun m!255731 () Bool)

(assert (=> b!234282 m!255731))

(declare-fun m!255733 () Bool)

(assert (=> b!234282 m!255733))

(assert (=> b!234282 m!255697))

(assert (=> b!234282 m!255719))

(assert (=> b!234282 m!255715))

(declare-fun m!255735 () Bool)

(assert (=> b!234282 m!255735))

(declare-fun m!255737 () Bool)

(assert (=> b!234282 m!255737))

(declare-fun m!255739 () Bool)

(assert (=> b!234282 m!255739))

(assert (=> b!234282 m!255731))

(declare-fun m!255741 () Bool)

(assert (=> bm!21769 m!255741))

(assert (=> d!59145 m!255625))

(assert (=> b!234273 m!255697))

(assert (=> b!234273 m!255697))

(declare-fun m!255743 () Bool)

(assert (=> b!234273 m!255743))

(assert (=> b!234272 m!255697))

(assert (=> b!234272 m!255697))

(assert (=> b!234272 m!255743))

(declare-fun m!255745 () Bool)

(assert (=> b!234289 m!255745))

(declare-fun m!255747 () Bool)

(assert (=> b!234289 m!255747))

(declare-fun m!255749 () Bool)

(assert (=> b!234289 m!255749))

(assert (=> b!234289 m!255747))

(assert (=> b!234289 m!255745))

(assert (=> b!234289 m!255697))

(declare-fun m!255751 () Bool)

(assert (=> b!234289 m!255751))

(assert (=> b!234289 m!255697))

(assert (=> bm!21767 m!255735))

(assert (=> b!234133 d!59145))

(declare-fun condMapEmpty!10434 () Bool)

(declare-fun mapDefault!10434 () ValueCell!2738)

(assert (=> mapNonEmpty!10425 (= condMapEmpty!10434 (= mapRest!10425 ((as const (Array (_ BitVec 32) ValueCell!2738)) mapDefault!10434)))))

(declare-fun e!152177 () Bool)

(declare-fun mapRes!10434 () Bool)

(assert (=> mapNonEmpty!10425 (= tp!22055 (and e!152177 mapRes!10434))))

(declare-fun b!234299 () Bool)

(declare-fun e!152178 () Bool)

(assert (=> b!234299 (= e!152178 tp_is_empty!6163)))

(declare-fun b!234300 () Bool)

(assert (=> b!234300 (= e!152177 tp_is_empty!6163)))

(declare-fun mapNonEmpty!10434 () Bool)

(declare-fun tp!22071 () Bool)

(assert (=> mapNonEmpty!10434 (= mapRes!10434 (and tp!22071 e!152178))))

(declare-fun mapRest!10434 () (Array (_ BitVec 32) ValueCell!2738))

(declare-fun mapKey!10434 () (_ BitVec 32))

(declare-fun mapValue!10434 () ValueCell!2738)

(assert (=> mapNonEmpty!10434 (= mapRest!10425 (store mapRest!10434 mapKey!10434 mapValue!10434))))

(declare-fun mapIsEmpty!10434 () Bool)

(assert (=> mapIsEmpty!10434 mapRes!10434))

(assert (= (and mapNonEmpty!10425 condMapEmpty!10434) mapIsEmpty!10434))

(assert (= (and mapNonEmpty!10425 (not condMapEmpty!10434)) mapNonEmpty!10434))

(assert (= (and mapNonEmpty!10434 ((_ is ValueCellFull!2738) mapValue!10434)) b!234299))

(assert (= (and mapNonEmpty!10425 ((_ is ValueCellFull!2738) mapDefault!10434)) b!234300))

(declare-fun m!255753 () Bool)

(assert (=> mapNonEmpty!10434 m!255753))

(declare-fun b_lambda!7895 () Bool)

(assert (= b_lambda!7893 (or (and b!234137 b_free!6301) b_lambda!7895)))

(check-sat (not bm!21769) (not b!234289) (not b!234273) (not mapNonEmpty!10434) (not b_next!6301) (not d!59143) (not d!59137) b_and!13233 (not b!234216) (not b!234227) (not b!234281) (not b!234205) (not b!234217) (not d!59145) (not b_lambda!7895) (not bm!21768) (not bm!21767) (not d!59141) (not b!234225) (not b!234272) (not bm!21766) tp_is_empty!6163 (not b!234287) (not b!234282) (not b!234283) (not b!234218) (not b!234290))
(check-sat b_and!13233 (not b_next!6301))
