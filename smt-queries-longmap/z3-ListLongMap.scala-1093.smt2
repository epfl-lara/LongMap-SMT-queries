; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22372 () Bool)

(assert start!22372)

(declare-fun b!234323 () Bool)

(declare-fun b_free!6307 () Bool)

(declare-fun b_next!6307 () Bool)

(assert (=> b!234323 (= b_free!6307 (not b_next!6307))))

(declare-fun tp!22076 () Bool)

(declare-fun b_and!13235 () Bool)

(assert (=> b!234323 (= tp!22076 b_and!13235)))

(declare-fun b!234319 () Bool)

(declare-fun res!114947 () Bool)

(declare-fun e!152196 () Bool)

(assert (=> b!234319 (=> (not res!114947) (not e!152196))))

(declare-datatypes ((V!7873 0))(
  ( (V!7874 (val!3129 Int)) )
))
(declare-datatypes ((ValueCell!2741 0))(
  ( (ValueCellFull!2741 (v!5154 V!7873)) (EmptyCell!2741) )
))
(declare-datatypes ((array!11587 0))(
  ( (array!11588 (arr!5509 (Array (_ BitVec 32) ValueCell!2741)) (size!5844 (_ BitVec 32))) )
))
(declare-datatypes ((array!11589 0))(
  ( (array!11590 (arr!5510 (Array (_ BitVec 32) (_ BitVec 64))) (size!5845 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3382 0))(
  ( (LongMapFixedSize!3383 (defaultEntry!4356 Int) (mask!10302 (_ BitVec 32)) (extraKeys!4093 (_ BitVec 32)) (zeroValue!4197 V!7873) (minValue!4197 V!7873) (_size!1740 (_ BitVec 32)) (_keys!6420 array!11589) (_values!4339 array!11587) (_vacant!1740 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3382)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4546 0))(
  ( (tuple2!4547 (_1!2284 (_ BitVec 64)) (_2!2284 V!7873)) )
))
(declare-datatypes ((List!3448 0))(
  ( (Nil!3445) (Cons!3444 (h!4094 tuple2!4546) (t!8407 List!3448)) )
))
(declare-datatypes ((ListLongMap!3461 0))(
  ( (ListLongMap!3462 (toList!1746 List!3448)) )
))
(declare-fun contains!1632 (ListLongMap!3461 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1278 (array!11589 array!11587 (_ BitVec 32) (_ BitVec 32) V!7873 V!7873 (_ BitVec 32) Int) ListLongMap!3461)

(assert (=> b!234319 (= res!114947 (contains!1632 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)) key!932))))

(declare-fun b!234320 () Bool)

(declare-fun e!152199 () Bool)

(declare-fun e!152193 () Bool)

(declare-fun mapRes!10437 () Bool)

(assert (=> b!234320 (= e!152199 (and e!152193 mapRes!10437))))

(declare-fun condMapEmpty!10437 () Bool)

(declare-fun mapDefault!10437 () ValueCell!2741)

(assert (=> b!234320 (= condMapEmpty!10437 (= (arr!5509 (_values!4339 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2741)) mapDefault!10437)))))

(declare-fun res!114945 () Bool)

(declare-fun e!152195 () Bool)

(assert (=> start!22372 (=> (not res!114945) (not e!152195))))

(declare-fun valid!1351 (LongMapFixedSize!3382) Bool)

(assert (=> start!22372 (= res!114945 (valid!1351 thiss!1504))))

(assert (=> start!22372 e!152195))

(declare-fun e!152197 () Bool)

(assert (=> start!22372 e!152197))

(assert (=> start!22372 true))

(declare-fun b!234321 () Bool)

(assert (=> b!234321 (= e!152196 (and (= (size!5844 (_values!4339 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10302 thiss!1504))) (= (size!5845 (_keys!6420 thiss!1504)) (size!5844 (_values!4339 thiss!1504))) (bvsge (mask!10302 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4093 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!234322 () Bool)

(declare-fun res!114943 () Bool)

(assert (=> b!234322 (=> (not res!114943) (not e!152196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234322 (= res!114943 (validMask!0 (mask!10302 thiss!1504)))))

(declare-fun tp_is_empty!6169 () Bool)

(declare-fun array_inv!3613 (array!11589) Bool)

(declare-fun array_inv!3614 (array!11587) Bool)

(assert (=> b!234323 (= e!152197 (and tp!22076 tp_is_empty!6169 (array_inv!3613 (_keys!6420 thiss!1504)) (array_inv!3614 (_values!4339 thiss!1504)) e!152199))))

(declare-fun b!234324 () Bool)

(declare-fun e!152198 () Bool)

(assert (=> b!234324 (= e!152198 tp_is_empty!6169)))

(declare-fun b!234325 () Bool)

(declare-fun res!114944 () Bool)

(assert (=> b!234325 (=> (not res!114944) (not e!152195))))

(assert (=> b!234325 (= res!114944 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10437 () Bool)

(declare-fun tp!22077 () Bool)

(assert (=> mapNonEmpty!10437 (= mapRes!10437 (and tp!22077 e!152198))))

(declare-fun mapRest!10437 () (Array (_ BitVec 32) ValueCell!2741))

(declare-fun mapValue!10437 () ValueCell!2741)

(declare-fun mapKey!10437 () (_ BitVec 32))

(assert (=> mapNonEmpty!10437 (= (arr!5509 (_values!4339 thiss!1504)) (store mapRest!10437 mapKey!10437 mapValue!10437))))

(declare-fun b!234326 () Bool)

(assert (=> b!234326 (= e!152195 e!152196)))

(declare-fun res!114946 () Bool)

(assert (=> b!234326 (=> (not res!114946) (not e!152196))))

(declare-datatypes ((SeekEntryResult!952 0))(
  ( (MissingZero!952 (index!5978 (_ BitVec 32))) (Found!952 (index!5979 (_ BitVec 32))) (Intermediate!952 (undefined!1764 Bool) (index!5980 (_ BitVec 32)) (x!23668 (_ BitVec 32))) (Undefined!952) (MissingVacant!952 (index!5981 (_ BitVec 32))) )
))
(declare-fun lt!118571 () SeekEntryResult!952)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!234326 (= res!114946 (or (= lt!118571 (MissingZero!952 index!297)) (= lt!118571 (MissingVacant!952 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11589 (_ BitVec 32)) SeekEntryResult!952)

(assert (=> b!234326 (= lt!118571 (seekEntryOrOpen!0 key!932 (_keys!6420 thiss!1504) (mask!10302 thiss!1504)))))

(declare-fun b!234327 () Bool)

(assert (=> b!234327 (= e!152193 tp_is_empty!6169)))

(declare-fun mapIsEmpty!10437 () Bool)

(assert (=> mapIsEmpty!10437 mapRes!10437))

(assert (= (and start!22372 res!114945) b!234325))

(assert (= (and b!234325 res!114944) b!234326))

(assert (= (and b!234326 res!114946) b!234319))

(assert (= (and b!234319 res!114947) b!234322))

(assert (= (and b!234322 res!114943) b!234321))

(assert (= (and b!234320 condMapEmpty!10437) mapIsEmpty!10437))

(assert (= (and b!234320 (not condMapEmpty!10437)) mapNonEmpty!10437))

(get-info :version)

(assert (= (and mapNonEmpty!10437 ((_ is ValueCellFull!2741) mapValue!10437)) b!234324))

(assert (= (and b!234320 ((_ is ValueCellFull!2741) mapDefault!10437)) b!234327))

(assert (= b!234323 b!234320))

(assert (= start!22372 b!234323))

(declare-fun m!255755 () Bool)

(assert (=> b!234326 m!255755))

(declare-fun m!255757 () Bool)

(assert (=> b!234323 m!255757))

(declare-fun m!255759 () Bool)

(assert (=> b!234323 m!255759))

(declare-fun m!255761 () Bool)

(assert (=> b!234319 m!255761))

(assert (=> b!234319 m!255761))

(declare-fun m!255763 () Bool)

(assert (=> b!234319 m!255763))

(declare-fun m!255765 () Bool)

(assert (=> b!234322 m!255765))

(declare-fun m!255767 () Bool)

(assert (=> mapNonEmpty!10437 m!255767))

(declare-fun m!255769 () Bool)

(assert (=> start!22372 m!255769))

(check-sat (not b!234326) (not b_next!6307) tp_is_empty!6169 (not b!234322) (not mapNonEmpty!10437) (not start!22372) (not b!234319) b_and!13235 (not b!234323))
(check-sat b_and!13235 (not b_next!6307))
(get-model)

(declare-fun d!59149 () Bool)

(declare-fun res!114984 () Bool)

(declare-fun e!152244 () Bool)

(assert (=> d!59149 (=> (not res!114984) (not e!152244))))

(declare-fun simpleValid!230 (LongMapFixedSize!3382) Bool)

(assert (=> d!59149 (= res!114984 (simpleValid!230 thiss!1504))))

(assert (=> d!59149 (= (valid!1351 thiss!1504) e!152244)))

(declare-fun b!234388 () Bool)

(declare-fun res!114985 () Bool)

(assert (=> b!234388 (=> (not res!114985) (not e!152244))))

(declare-fun arrayCountValidKeys!0 (array!11589 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234388 (= res!114985 (= (arrayCountValidKeys!0 (_keys!6420 thiss!1504) #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))) (_size!1740 thiss!1504)))))

(declare-fun b!234389 () Bool)

(declare-fun res!114986 () Bool)

(assert (=> b!234389 (=> (not res!114986) (not e!152244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11589 (_ BitVec 32)) Bool)

(assert (=> b!234389 (= res!114986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6420 thiss!1504) (mask!10302 thiss!1504)))))

(declare-fun b!234390 () Bool)

(declare-datatypes ((List!3450 0))(
  ( (Nil!3447) (Cons!3446 (h!4096 (_ BitVec 64)) (t!8411 List!3450)) )
))
(declare-fun arrayNoDuplicates!0 (array!11589 (_ BitVec 32) List!3450) Bool)

(assert (=> b!234390 (= e!152244 (arrayNoDuplicates!0 (_keys!6420 thiss!1504) #b00000000000000000000000000000000 Nil!3447))))

(assert (= (and d!59149 res!114984) b!234388))

(assert (= (and b!234388 res!114985) b!234389))

(assert (= (and b!234389 res!114986) b!234390))

(declare-fun m!255803 () Bool)

(assert (=> d!59149 m!255803))

(declare-fun m!255805 () Bool)

(assert (=> b!234388 m!255805))

(declare-fun m!255807 () Bool)

(assert (=> b!234389 m!255807))

(declare-fun m!255809 () Bool)

(assert (=> b!234390 m!255809))

(assert (=> start!22372 d!59149))

(declare-fun b!234403 () Bool)

(declare-fun e!152252 () SeekEntryResult!952)

(declare-fun lt!118585 () SeekEntryResult!952)

(assert (=> b!234403 (= e!152252 (MissingZero!952 (index!5980 lt!118585)))))

(declare-fun d!59151 () Bool)

(declare-fun lt!118584 () SeekEntryResult!952)

(assert (=> d!59151 (and (or ((_ is Undefined!952) lt!118584) (not ((_ is Found!952) lt!118584)) (and (bvsge (index!5979 lt!118584) #b00000000000000000000000000000000) (bvslt (index!5979 lt!118584) (size!5845 (_keys!6420 thiss!1504))))) (or ((_ is Undefined!952) lt!118584) ((_ is Found!952) lt!118584) (not ((_ is MissingZero!952) lt!118584)) (and (bvsge (index!5978 lt!118584) #b00000000000000000000000000000000) (bvslt (index!5978 lt!118584) (size!5845 (_keys!6420 thiss!1504))))) (or ((_ is Undefined!952) lt!118584) ((_ is Found!952) lt!118584) ((_ is MissingZero!952) lt!118584) (not ((_ is MissingVacant!952) lt!118584)) (and (bvsge (index!5981 lt!118584) #b00000000000000000000000000000000) (bvslt (index!5981 lt!118584) (size!5845 (_keys!6420 thiss!1504))))) (or ((_ is Undefined!952) lt!118584) (ite ((_ is Found!952) lt!118584) (= (select (arr!5510 (_keys!6420 thiss!1504)) (index!5979 lt!118584)) key!932) (ite ((_ is MissingZero!952) lt!118584) (= (select (arr!5510 (_keys!6420 thiss!1504)) (index!5978 lt!118584)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!952) lt!118584) (= (select (arr!5510 (_keys!6420 thiss!1504)) (index!5981 lt!118584)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!152253 () SeekEntryResult!952)

(assert (=> d!59151 (= lt!118584 e!152253)))

(declare-fun c!39025 () Bool)

(assert (=> d!59151 (= c!39025 (and ((_ is Intermediate!952) lt!118585) (undefined!1764 lt!118585)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11589 (_ BitVec 32)) SeekEntryResult!952)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59151 (= lt!118585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10302 thiss!1504)) key!932 (_keys!6420 thiss!1504) (mask!10302 thiss!1504)))))

(assert (=> d!59151 (validMask!0 (mask!10302 thiss!1504))))

(assert (=> d!59151 (= (seekEntryOrOpen!0 key!932 (_keys!6420 thiss!1504) (mask!10302 thiss!1504)) lt!118584)))

(declare-fun b!234404 () Bool)

(declare-fun c!39026 () Bool)

(declare-fun lt!118586 () (_ BitVec 64))

(assert (=> b!234404 (= c!39026 (= lt!118586 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152251 () SeekEntryResult!952)

(assert (=> b!234404 (= e!152251 e!152252)))

(declare-fun b!234405 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11589 (_ BitVec 32)) SeekEntryResult!952)

(assert (=> b!234405 (= e!152252 (seekKeyOrZeroReturnVacant!0 (x!23668 lt!118585) (index!5980 lt!118585) (index!5980 lt!118585) key!932 (_keys!6420 thiss!1504) (mask!10302 thiss!1504)))))

(declare-fun b!234406 () Bool)

(assert (=> b!234406 (= e!152251 (Found!952 (index!5980 lt!118585)))))

(declare-fun b!234407 () Bool)

(assert (=> b!234407 (= e!152253 e!152251)))

(assert (=> b!234407 (= lt!118586 (select (arr!5510 (_keys!6420 thiss!1504)) (index!5980 lt!118585)))))

(declare-fun c!39027 () Bool)

(assert (=> b!234407 (= c!39027 (= lt!118586 key!932))))

(declare-fun b!234408 () Bool)

(assert (=> b!234408 (= e!152253 Undefined!952)))

(assert (= (and d!59151 c!39025) b!234408))

(assert (= (and d!59151 (not c!39025)) b!234407))

(assert (= (and b!234407 c!39027) b!234406))

(assert (= (and b!234407 (not c!39027)) b!234404))

(assert (= (and b!234404 c!39026) b!234403))

(assert (= (and b!234404 (not c!39026)) b!234405))

(declare-fun m!255811 () Bool)

(assert (=> d!59151 m!255811))

(declare-fun m!255813 () Bool)

(assert (=> d!59151 m!255813))

(declare-fun m!255815 () Bool)

(assert (=> d!59151 m!255815))

(assert (=> d!59151 m!255765))

(assert (=> d!59151 m!255811))

(declare-fun m!255817 () Bool)

(assert (=> d!59151 m!255817))

(declare-fun m!255819 () Bool)

(assert (=> d!59151 m!255819))

(declare-fun m!255821 () Bool)

(assert (=> b!234405 m!255821))

(declare-fun m!255823 () Bool)

(assert (=> b!234407 m!255823))

(assert (=> b!234326 d!59151))

(declare-fun d!59153 () Bool)

(assert (=> d!59153 (= (array_inv!3613 (_keys!6420 thiss!1504)) (bvsge (size!5845 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234323 d!59153))

(declare-fun d!59155 () Bool)

(assert (=> d!59155 (= (array_inv!3614 (_values!4339 thiss!1504)) (bvsge (size!5844 (_values!4339 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234323 d!59155))

(declare-fun d!59157 () Bool)

(assert (=> d!59157 (= (validMask!0 (mask!10302 thiss!1504)) (and (or (= (mask!10302 thiss!1504) #b00000000000000000000000000000111) (= (mask!10302 thiss!1504) #b00000000000000000000000000001111) (= (mask!10302 thiss!1504) #b00000000000000000000000000011111) (= (mask!10302 thiss!1504) #b00000000000000000000000000111111) (= (mask!10302 thiss!1504) #b00000000000000000000000001111111) (= (mask!10302 thiss!1504) #b00000000000000000000000011111111) (= (mask!10302 thiss!1504) #b00000000000000000000000111111111) (= (mask!10302 thiss!1504) #b00000000000000000000001111111111) (= (mask!10302 thiss!1504) #b00000000000000000000011111111111) (= (mask!10302 thiss!1504) #b00000000000000000000111111111111) (= (mask!10302 thiss!1504) #b00000000000000000001111111111111) (= (mask!10302 thiss!1504) #b00000000000000000011111111111111) (= (mask!10302 thiss!1504) #b00000000000000000111111111111111) (= (mask!10302 thiss!1504) #b00000000000000001111111111111111) (= (mask!10302 thiss!1504) #b00000000000000011111111111111111) (= (mask!10302 thiss!1504) #b00000000000000111111111111111111) (= (mask!10302 thiss!1504) #b00000000000001111111111111111111) (= (mask!10302 thiss!1504) #b00000000000011111111111111111111) (= (mask!10302 thiss!1504) #b00000000000111111111111111111111) (= (mask!10302 thiss!1504) #b00000000001111111111111111111111) (= (mask!10302 thiss!1504) #b00000000011111111111111111111111) (= (mask!10302 thiss!1504) #b00000000111111111111111111111111) (= (mask!10302 thiss!1504) #b00000001111111111111111111111111) (= (mask!10302 thiss!1504) #b00000011111111111111111111111111) (= (mask!10302 thiss!1504) #b00000111111111111111111111111111) (= (mask!10302 thiss!1504) #b00001111111111111111111111111111) (= (mask!10302 thiss!1504) #b00011111111111111111111111111111) (= (mask!10302 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10302 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!234322 d!59157))

(declare-fun d!59159 () Bool)

(declare-fun e!152259 () Bool)

(assert (=> d!59159 e!152259))

(declare-fun res!114989 () Bool)

(assert (=> d!59159 (=> res!114989 e!152259)))

(declare-fun lt!118596 () Bool)

(assert (=> d!59159 (= res!114989 (not lt!118596))))

(declare-fun lt!118598 () Bool)

(assert (=> d!59159 (= lt!118596 lt!118598)))

(declare-datatypes ((Unit!7223 0))(
  ( (Unit!7224) )
))
(declare-fun lt!118595 () Unit!7223)

(declare-fun e!152258 () Unit!7223)

(assert (=> d!59159 (= lt!118595 e!152258)))

(declare-fun c!39030 () Bool)

(assert (=> d!59159 (= c!39030 lt!118598)))

(declare-fun containsKey!257 (List!3448 (_ BitVec 64)) Bool)

(assert (=> d!59159 (= lt!118598 (containsKey!257 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))

(assert (=> d!59159 (= (contains!1632 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)) key!932) lt!118596)))

(declare-fun b!234415 () Bool)

(declare-fun lt!118597 () Unit!7223)

(assert (=> b!234415 (= e!152258 lt!118597)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!205 (List!3448 (_ BitVec 64)) Unit!7223)

(assert (=> b!234415 (= lt!118597 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))

(declare-datatypes ((Option!272 0))(
  ( (Some!271 (v!5157 V!7873)) (None!270) )
))
(declare-fun isDefined!206 (Option!272) Bool)

(declare-fun getValueByKey!266 (List!3448 (_ BitVec 64)) Option!272)

(assert (=> b!234415 (isDefined!206 (getValueByKey!266 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))

(declare-fun b!234416 () Bool)

(declare-fun Unit!7225 () Unit!7223)

(assert (=> b!234416 (= e!152258 Unit!7225)))

(declare-fun b!234417 () Bool)

(assert (=> b!234417 (= e!152259 (isDefined!206 (getValueByKey!266 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932)))))

(assert (= (and d!59159 c!39030) b!234415))

(assert (= (and d!59159 (not c!39030)) b!234416))

(assert (= (and d!59159 (not res!114989)) b!234417))

(declare-fun m!255825 () Bool)

(assert (=> d!59159 m!255825))

(declare-fun m!255827 () Bool)

(assert (=> b!234415 m!255827))

(declare-fun m!255829 () Bool)

(assert (=> b!234415 m!255829))

(assert (=> b!234415 m!255829))

(declare-fun m!255831 () Bool)

(assert (=> b!234415 m!255831))

(assert (=> b!234417 m!255829))

(assert (=> b!234417 m!255829))

(assert (=> b!234417 m!255831))

(assert (=> b!234319 d!59159))

(declare-fun b!234460 () Bool)

(declare-fun e!152290 () ListLongMap!3461)

(declare-fun call!21793 () ListLongMap!3461)

(declare-fun +!634 (ListLongMap!3461 tuple2!4546) ListLongMap!3461)

(assert (=> b!234460 (= e!152290 (+!634 call!21793 (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))

(declare-fun b!234461 () Bool)

(declare-fun e!152294 () Bool)

(declare-fun lt!118650 () ListLongMap!3461)

(declare-fun apply!207 (ListLongMap!3461 (_ BitVec 64)) V!7873)

(assert (=> b!234461 (= e!152294 (= (apply!207 lt!118650 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4197 thiss!1504)))))

(declare-fun b!234462 () Bool)

(declare-fun e!152293 () Bool)

(declare-fun call!21789 () Bool)

(assert (=> b!234462 (= e!152293 (not call!21789))))

(declare-fun bm!21786 () Bool)

(declare-fun call!21790 () ListLongMap!3461)

(declare-fun getCurrentListMapNoExtraKeys!523 (array!11589 array!11587 (_ BitVec 32) (_ BitVec 32) V!7873 V!7873 (_ BitVec 32) Int) ListLongMap!3461)

(assert (=> bm!21786 (= call!21790 (getCurrentListMapNoExtraKeys!523 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))

(declare-fun b!234463 () Bool)

(declare-fun e!152291 () ListLongMap!3461)

(declare-fun call!21794 () ListLongMap!3461)

(assert (=> b!234463 (= e!152291 call!21794)))

(declare-fun b!234464 () Bool)

(declare-fun e!152287 () Bool)

(assert (=> b!234464 (= e!152287 (= (apply!207 lt!118650 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4197 thiss!1504)))))

(declare-fun b!234465 () Bool)

(declare-fun e!152297 () Unit!7223)

(declare-fun lt!118653 () Unit!7223)

(assert (=> b!234465 (= e!152297 lt!118653)))

(declare-fun lt!118654 () ListLongMap!3461)

(assert (=> b!234465 (= lt!118654 (getCurrentListMapNoExtraKeys!523 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))

(declare-fun lt!118643 () (_ BitVec 64))

(assert (=> b!234465 (= lt!118643 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118662 () (_ BitVec 64))

(assert (=> b!234465 (= lt!118662 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118644 () Unit!7223)

(declare-fun addStillContains!183 (ListLongMap!3461 (_ BitVec 64) V!7873 (_ BitVec 64)) Unit!7223)

(assert (=> b!234465 (= lt!118644 (addStillContains!183 lt!118654 lt!118643 (zeroValue!4197 thiss!1504) lt!118662))))

(assert (=> b!234465 (contains!1632 (+!634 lt!118654 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504))) lt!118662)))

(declare-fun lt!118646 () Unit!7223)

(assert (=> b!234465 (= lt!118646 lt!118644)))

(declare-fun lt!118659 () ListLongMap!3461)

(assert (=> b!234465 (= lt!118659 (getCurrentListMapNoExtraKeys!523 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))

(declare-fun lt!118648 () (_ BitVec 64))

(assert (=> b!234465 (= lt!118648 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118645 () (_ BitVec 64))

(assert (=> b!234465 (= lt!118645 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118660 () Unit!7223)

(declare-fun addApplyDifferent!183 (ListLongMap!3461 (_ BitVec 64) V!7873 (_ BitVec 64)) Unit!7223)

(assert (=> b!234465 (= lt!118660 (addApplyDifferent!183 lt!118659 lt!118648 (minValue!4197 thiss!1504) lt!118645))))

(assert (=> b!234465 (= (apply!207 (+!634 lt!118659 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504))) lt!118645) (apply!207 lt!118659 lt!118645))))

(declare-fun lt!118649 () Unit!7223)

(assert (=> b!234465 (= lt!118649 lt!118660)))

(declare-fun lt!118655 () ListLongMap!3461)

(assert (=> b!234465 (= lt!118655 (getCurrentListMapNoExtraKeys!523 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))

(declare-fun lt!118657 () (_ BitVec 64))

(assert (=> b!234465 (= lt!118657 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118661 () (_ BitVec 64))

(assert (=> b!234465 (= lt!118661 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118651 () Unit!7223)

(assert (=> b!234465 (= lt!118651 (addApplyDifferent!183 lt!118655 lt!118657 (zeroValue!4197 thiss!1504) lt!118661))))

(assert (=> b!234465 (= (apply!207 (+!634 lt!118655 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504))) lt!118661) (apply!207 lt!118655 lt!118661))))

(declare-fun lt!118652 () Unit!7223)

(assert (=> b!234465 (= lt!118652 lt!118651)))

(declare-fun lt!118663 () ListLongMap!3461)

(assert (=> b!234465 (= lt!118663 (getCurrentListMapNoExtraKeys!523 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))

(declare-fun lt!118656 () (_ BitVec 64))

(assert (=> b!234465 (= lt!118656 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118647 () (_ BitVec 64))

(assert (=> b!234465 (= lt!118647 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234465 (= lt!118653 (addApplyDifferent!183 lt!118663 lt!118656 (minValue!4197 thiss!1504) lt!118647))))

(assert (=> b!234465 (= (apply!207 (+!634 lt!118663 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504))) lt!118647) (apply!207 lt!118663 lt!118647))))

(declare-fun b!234466 () Bool)

(declare-fun res!115016 () Bool)

(declare-fun e!152295 () Bool)

(assert (=> b!234466 (=> (not res!115016) (not e!152295))))

(assert (=> b!234466 (= res!115016 e!152293)))

(declare-fun c!39046 () Bool)

(assert (=> b!234466 (= c!39046 (not (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!234468 () Bool)

(declare-fun c!39044 () Bool)

(assert (=> b!234468 (= c!39044 (and (not (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!152298 () ListLongMap!3461)

(assert (=> b!234468 (= e!152298 e!152291)))

(declare-fun b!234469 () Bool)

(declare-fun e!152288 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!234469 (= e!152288 (validKeyInArray!0 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21787 () Bool)

(assert (=> bm!21787 (= call!21789 (contains!1632 lt!118650 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21788 () Bool)

(declare-fun call!21792 () Bool)

(assert (=> bm!21788 (= call!21792 (contains!1632 lt!118650 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234470 () Bool)

(declare-fun call!21791 () ListLongMap!3461)

(assert (=> b!234470 (= e!152298 call!21791)))

(declare-fun b!234467 () Bool)

(declare-fun e!152292 () Bool)

(declare-fun e!152289 () Bool)

(assert (=> b!234467 (= e!152292 e!152289)))

(declare-fun res!115011 () Bool)

(assert (=> b!234467 (=> (not res!115011) (not e!152289))))

(assert (=> b!234467 (= res!115011 (contains!1632 lt!118650 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234467 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))

(declare-fun d!59161 () Bool)

(assert (=> d!59161 e!152295))

(declare-fun res!115010 () Bool)

(assert (=> d!59161 (=> (not res!115010) (not e!152295))))

(assert (=> d!59161 (= res!115010 (or (bvsge #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))))

(declare-fun lt!118664 () ListLongMap!3461)

(assert (=> d!59161 (= lt!118650 lt!118664)))

(declare-fun lt!118658 () Unit!7223)

(assert (=> d!59161 (= lt!118658 e!152297)))

(declare-fun c!39045 () Bool)

(assert (=> d!59161 (= c!39045 e!152288)))

(declare-fun res!115013 () Bool)

(assert (=> d!59161 (=> (not res!115013) (not e!152288))))

(assert (=> d!59161 (= res!115013 (bvslt #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))

(assert (=> d!59161 (= lt!118664 e!152290)))

(declare-fun c!39043 () Bool)

(assert (=> d!59161 (= c!39043 (and (not (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59161 (validMask!0 (mask!10302 thiss!1504))))

(assert (=> d!59161 (= (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)) lt!118650)))

(declare-fun b!234471 () Bool)

(declare-fun e!152286 () Bool)

(assert (=> b!234471 (= e!152295 e!152286)))

(declare-fun c!39048 () Bool)

(assert (=> b!234471 (= c!39048 (not (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234472 () Bool)

(declare-fun get!2834 (ValueCell!2741 V!7873) V!7873)

(declare-fun dynLambda!550 (Int (_ BitVec 64)) V!7873)

(assert (=> b!234472 (= e!152289 (= (apply!207 lt!118650 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)) (get!2834 (select (arr!5509 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234472 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5844 (_values!4339 thiss!1504))))))

(assert (=> b!234472 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))

(declare-fun b!234473 () Bool)

(assert (=> b!234473 (= e!152286 e!152294)))

(declare-fun res!115015 () Bool)

(assert (=> b!234473 (= res!115015 call!21792)))

(assert (=> b!234473 (=> (not res!115015) (not e!152294))))

(declare-fun b!234474 () Bool)

(declare-fun Unit!7226 () Unit!7223)

(assert (=> b!234474 (= e!152297 Unit!7226)))

(declare-fun b!234475 () Bool)

(declare-fun res!115012 () Bool)

(assert (=> b!234475 (=> (not res!115012) (not e!152295))))

(assert (=> b!234475 (= res!115012 e!152292)))

(declare-fun res!115008 () Bool)

(assert (=> b!234475 (=> res!115008 e!152292)))

(declare-fun e!152296 () Bool)

(assert (=> b!234475 (= res!115008 (not e!152296))))

(declare-fun res!115014 () Bool)

(assert (=> b!234475 (=> (not res!115014) (not e!152296))))

(assert (=> b!234475 (= res!115014 (bvslt #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))

(declare-fun b!234476 () Bool)

(assert (=> b!234476 (= e!152296 (validKeyInArray!0 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234477 () Bool)

(assert (=> b!234477 (= e!152293 e!152287)))

(declare-fun res!115009 () Bool)

(assert (=> b!234477 (= res!115009 call!21789)))

(assert (=> b!234477 (=> (not res!115009) (not e!152287))))

(declare-fun bm!21789 () Bool)

(assert (=> bm!21789 (= call!21791 call!21793)))

(declare-fun bm!21790 () Bool)

(declare-fun call!21795 () ListLongMap!3461)

(assert (=> bm!21790 (= call!21794 call!21795)))

(declare-fun b!234478 () Bool)

(assert (=> b!234478 (= e!152286 (not call!21792))))

(declare-fun bm!21791 () Bool)

(declare-fun c!39047 () Bool)

(assert (=> bm!21791 (= call!21793 (+!634 (ite c!39043 call!21790 (ite c!39047 call!21795 call!21794)) (ite (or c!39043 c!39047) (tuple2!4547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))

(declare-fun bm!21792 () Bool)

(assert (=> bm!21792 (= call!21795 call!21790)))

(declare-fun b!234479 () Bool)

(assert (=> b!234479 (= e!152291 call!21791)))

(declare-fun b!234480 () Bool)

(assert (=> b!234480 (= e!152290 e!152298)))

(assert (=> b!234480 (= c!39047 (and (not (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!59161 c!39043) b!234460))

(assert (= (and d!59161 (not c!39043)) b!234480))

(assert (= (and b!234480 c!39047) b!234470))

(assert (= (and b!234480 (not c!39047)) b!234468))

(assert (= (and b!234468 c!39044) b!234479))

(assert (= (and b!234468 (not c!39044)) b!234463))

(assert (= (or b!234479 b!234463) bm!21790))

(assert (= (or b!234470 bm!21790) bm!21792))

(assert (= (or b!234470 b!234479) bm!21789))

(assert (= (or b!234460 bm!21792) bm!21786))

(assert (= (or b!234460 bm!21789) bm!21791))

(assert (= (and d!59161 res!115013) b!234469))

(assert (= (and d!59161 c!39045) b!234465))

(assert (= (and d!59161 (not c!39045)) b!234474))

(assert (= (and d!59161 res!115010) b!234475))

(assert (= (and b!234475 res!115014) b!234476))

(assert (= (and b!234475 (not res!115008)) b!234467))

(assert (= (and b!234467 res!115011) b!234472))

(assert (= (and b!234475 res!115012) b!234466))

(assert (= (and b!234466 c!39046) b!234477))

(assert (= (and b!234466 (not c!39046)) b!234462))

(assert (= (and b!234477 res!115009) b!234464))

(assert (= (or b!234477 b!234462) bm!21787))

(assert (= (and b!234466 res!115016) b!234471))

(assert (= (and b!234471 c!39048) b!234473))

(assert (= (and b!234471 (not c!39048)) b!234478))

(assert (= (and b!234473 res!115015) b!234461))

(assert (= (or b!234473 b!234478) bm!21788))

(declare-fun b_lambda!7897 () Bool)

(assert (=> (not b_lambda!7897) (not b!234472)))

(declare-fun t!8410 () Bool)

(declare-fun tb!2919 () Bool)

(assert (=> (and b!234323 (= (defaultEntry!4356 thiss!1504) (defaultEntry!4356 thiss!1504)) t!8410) tb!2919))

(declare-fun result!5095 () Bool)

(assert (=> tb!2919 (= result!5095 tp_is_empty!6169)))

(assert (=> b!234472 t!8410))

(declare-fun b_and!13241 () Bool)

(assert (= b_and!13235 (and (=> t!8410 result!5095) b_and!13241)))

(assert (=> d!59161 m!255765))

(declare-fun m!255833 () Bool)

(assert (=> b!234461 m!255833))

(declare-fun m!255835 () Bool)

(assert (=> b!234465 m!255835))

(declare-fun m!255837 () Bool)

(assert (=> b!234465 m!255837))

(declare-fun m!255839 () Bool)

(assert (=> b!234465 m!255839))

(declare-fun m!255841 () Bool)

(assert (=> b!234465 m!255841))

(declare-fun m!255843 () Bool)

(assert (=> b!234465 m!255843))

(assert (=> b!234465 m!255841))

(assert (=> b!234465 m!255835))

(declare-fun m!255845 () Bool)

(assert (=> b!234465 m!255845))

(declare-fun m!255847 () Bool)

(assert (=> b!234465 m!255847))

(declare-fun m!255849 () Bool)

(assert (=> b!234465 m!255849))

(declare-fun m!255851 () Bool)

(assert (=> b!234465 m!255851))

(declare-fun m!255853 () Bool)

(assert (=> b!234465 m!255853))

(declare-fun m!255855 () Bool)

(assert (=> b!234465 m!255855))

(declare-fun m!255857 () Bool)

(assert (=> b!234465 m!255857))

(declare-fun m!255859 () Bool)

(assert (=> b!234465 m!255859))

(assert (=> b!234465 m!255847))

(declare-fun m!255861 () Bool)

(assert (=> b!234465 m!255861))

(assert (=> b!234465 m!255849))

(declare-fun m!255863 () Bool)

(assert (=> b!234465 m!255863))

(declare-fun m!255865 () Bool)

(assert (=> b!234465 m!255865))

(declare-fun m!255867 () Bool)

(assert (=> b!234465 m!255867))

(declare-fun m!255869 () Bool)

(assert (=> b!234460 m!255869))

(assert (=> b!234476 m!255867))

(assert (=> b!234476 m!255867))

(declare-fun m!255871 () Bool)

(assert (=> b!234476 m!255871))

(declare-fun m!255873 () Bool)

(assert (=> bm!21787 m!255873))

(declare-fun m!255875 () Bool)

(assert (=> b!234472 m!255875))

(assert (=> b!234472 m!255875))

(declare-fun m!255877 () Bool)

(assert (=> b!234472 m!255877))

(declare-fun m!255879 () Bool)

(assert (=> b!234472 m!255879))

(assert (=> b!234472 m!255867))

(assert (=> b!234472 m!255867))

(declare-fun m!255881 () Bool)

(assert (=> b!234472 m!255881))

(assert (=> b!234472 m!255877))

(assert (=> b!234467 m!255867))

(assert (=> b!234467 m!255867))

(declare-fun m!255883 () Bool)

(assert (=> b!234467 m!255883))

(assert (=> bm!21786 m!255857))

(declare-fun m!255885 () Bool)

(assert (=> bm!21788 m!255885))

(assert (=> b!234469 m!255867))

(assert (=> b!234469 m!255867))

(assert (=> b!234469 m!255871))

(declare-fun m!255887 () Bool)

(assert (=> b!234464 m!255887))

(declare-fun m!255889 () Bool)

(assert (=> bm!21791 m!255889))

(assert (=> b!234319 d!59161))

(declare-fun mapNonEmpty!10446 () Bool)

(declare-fun mapRes!10446 () Bool)

(declare-fun tp!22092 () Bool)

(declare-fun e!152304 () Bool)

(assert (=> mapNonEmpty!10446 (= mapRes!10446 (and tp!22092 e!152304))))

(declare-fun mapValue!10446 () ValueCell!2741)

(declare-fun mapKey!10446 () (_ BitVec 32))

(declare-fun mapRest!10446 () (Array (_ BitVec 32) ValueCell!2741))

(assert (=> mapNonEmpty!10446 (= mapRest!10437 (store mapRest!10446 mapKey!10446 mapValue!10446))))

(declare-fun b!234490 () Bool)

(declare-fun e!152303 () Bool)

(assert (=> b!234490 (= e!152303 tp_is_empty!6169)))

(declare-fun mapIsEmpty!10446 () Bool)

(assert (=> mapIsEmpty!10446 mapRes!10446))

(declare-fun condMapEmpty!10446 () Bool)

(declare-fun mapDefault!10446 () ValueCell!2741)

(assert (=> mapNonEmpty!10437 (= condMapEmpty!10446 (= mapRest!10437 ((as const (Array (_ BitVec 32) ValueCell!2741)) mapDefault!10446)))))

(assert (=> mapNonEmpty!10437 (= tp!22077 (and e!152303 mapRes!10446))))

(declare-fun b!234489 () Bool)

(assert (=> b!234489 (= e!152304 tp_is_empty!6169)))

(assert (= (and mapNonEmpty!10437 condMapEmpty!10446) mapIsEmpty!10446))

(assert (= (and mapNonEmpty!10437 (not condMapEmpty!10446)) mapNonEmpty!10446))

(assert (= (and mapNonEmpty!10446 ((_ is ValueCellFull!2741) mapValue!10446)) b!234489))

(assert (= (and mapNonEmpty!10437 ((_ is ValueCellFull!2741) mapDefault!10446)) b!234490))

(declare-fun m!255891 () Bool)

(assert (=> mapNonEmpty!10446 m!255891))

(declare-fun b_lambda!7899 () Bool)

(assert (= b_lambda!7897 (or (and b!234323 b_free!6307) b_lambda!7899)))

(check-sat b_and!13241 (not d!59161) (not b!234469) (not b!234415) (not b_next!6307) (not b!234464) (not bm!21788) (not b!234390) (not bm!21786) (not b_lambda!7899) (not bm!21787) (not b!234417) (not b!234465) (not b!234405) (not b!234460) (not bm!21791) (not b!234389) (not mapNonEmpty!10446) (not d!59159) tp_is_empty!6169 (not b!234467) (not d!59151) (not b!234461) (not b!234388) (not d!59149) (not b!234472) (not b!234476))
(check-sat b_and!13241 (not b_next!6307))
(get-model)

(declare-fun d!59163 () Bool)

(declare-fun get!2835 (Option!272) V!7873)

(assert (=> d!59163 (= (apply!207 lt!118650 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2835 (getValueByKey!266 (toList!1746 lt!118650) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8700 () Bool)

(assert (= bs!8700 d!59163))

(declare-fun m!255893 () Bool)

(assert (=> bs!8700 m!255893))

(assert (=> bs!8700 m!255893))

(declare-fun m!255895 () Bool)

(assert (=> bs!8700 m!255895))

(assert (=> b!234464 d!59163))

(declare-fun b!234501 () Bool)

(declare-fun e!152316 () Bool)

(declare-fun contains!1634 (List!3450 (_ BitVec 64)) Bool)

(assert (=> b!234501 (= e!152316 (contains!1634 Nil!3447 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234502 () Bool)

(declare-fun e!152315 () Bool)

(declare-fun call!21798 () Bool)

(assert (=> b!234502 (= e!152315 call!21798)))

(declare-fun b!234504 () Bool)

(declare-fun e!152314 () Bool)

(declare-fun e!152313 () Bool)

(assert (=> b!234504 (= e!152314 e!152313)))

(declare-fun res!115023 () Bool)

(assert (=> b!234504 (=> (not res!115023) (not e!152313))))

(assert (=> b!234504 (= res!115023 (not e!152316))))

(declare-fun res!115025 () Bool)

(assert (=> b!234504 (=> (not res!115025) (not e!152316))))

(assert (=> b!234504 (= res!115025 (validKeyInArray!0 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21795 () Bool)

(declare-fun c!39051 () Bool)

(assert (=> bm!21795 (= call!21798 (arrayNoDuplicates!0 (_keys!6420 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39051 (Cons!3446 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000) Nil!3447) Nil!3447)))))

(declare-fun b!234505 () Bool)

(assert (=> b!234505 (= e!152315 call!21798)))

(declare-fun d!59165 () Bool)

(declare-fun res!115024 () Bool)

(assert (=> d!59165 (=> res!115024 e!152314)))

(assert (=> d!59165 (= res!115024 (bvsge #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))

(assert (=> d!59165 (= (arrayNoDuplicates!0 (_keys!6420 thiss!1504) #b00000000000000000000000000000000 Nil!3447) e!152314)))

(declare-fun b!234503 () Bool)

(assert (=> b!234503 (= e!152313 e!152315)))

(assert (=> b!234503 (= c!39051 (validKeyInArray!0 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59165 (not res!115024)) b!234504))

(assert (= (and b!234504 res!115025) b!234501))

(assert (= (and b!234504 res!115023) b!234503))

(assert (= (and b!234503 c!39051) b!234502))

(assert (= (and b!234503 (not c!39051)) b!234505))

(assert (= (or b!234502 b!234505) bm!21795))

(assert (=> b!234501 m!255867))

(assert (=> b!234501 m!255867))

(declare-fun m!255897 () Bool)

(assert (=> b!234501 m!255897))

(assert (=> b!234504 m!255867))

(assert (=> b!234504 m!255867))

(assert (=> b!234504 m!255871))

(assert (=> bm!21795 m!255867))

(declare-fun m!255899 () Bool)

(assert (=> bm!21795 m!255899))

(assert (=> b!234503 m!255867))

(assert (=> b!234503 m!255867))

(assert (=> b!234503 m!255871))

(assert (=> b!234390 d!59165))

(declare-fun d!59167 () Bool)

(assert (=> d!59167 (= (apply!207 lt!118650 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)) (get!2835 (getValueByKey!266 (toList!1746 lt!118650) (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8701 () Bool)

(assert (= bs!8701 d!59167))

(assert (=> bs!8701 m!255867))

(declare-fun m!255901 () Bool)

(assert (=> bs!8701 m!255901))

(assert (=> bs!8701 m!255901))

(declare-fun m!255903 () Bool)

(assert (=> bs!8701 m!255903))

(assert (=> b!234472 d!59167))

(declare-fun d!59169 () Bool)

(declare-fun c!39054 () Bool)

(assert (=> d!59169 (= c!39054 ((_ is ValueCellFull!2741) (select (arr!5509 (_values!4339 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!152319 () V!7873)

(assert (=> d!59169 (= (get!2834 (select (arr!5509 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!152319)))

(declare-fun b!234510 () Bool)

(declare-fun get!2836 (ValueCell!2741 V!7873) V!7873)

(assert (=> b!234510 (= e!152319 (get!2836 (select (arr!5509 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234511 () Bool)

(declare-fun get!2837 (ValueCell!2741 V!7873) V!7873)

(assert (=> b!234511 (= e!152319 (get!2837 (select (arr!5509 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59169 c!39054) b!234510))

(assert (= (and d!59169 (not c!39054)) b!234511))

(assert (=> b!234510 m!255875))

(assert (=> b!234510 m!255877))

(declare-fun m!255905 () Bool)

(assert (=> b!234510 m!255905))

(assert (=> b!234511 m!255875))

(assert (=> b!234511 m!255877))

(declare-fun m!255907 () Bool)

(assert (=> b!234511 m!255907))

(assert (=> b!234472 d!59169))

(declare-fun d!59171 () Bool)

(declare-fun e!152331 () Bool)

(assert (=> d!59171 e!152331))

(declare-fun c!39062 () Bool)

(declare-fun lt!118670 () SeekEntryResult!952)

(assert (=> d!59171 (= c!39062 (and ((_ is Intermediate!952) lt!118670) (undefined!1764 lt!118670)))))

(declare-fun e!152334 () SeekEntryResult!952)

(assert (=> d!59171 (= lt!118670 e!152334)))

(declare-fun c!39063 () Bool)

(assert (=> d!59171 (= c!39063 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!118669 () (_ BitVec 64))

(assert (=> d!59171 (= lt!118669 (select (arr!5510 (_keys!6420 thiss!1504)) (toIndex!0 key!932 (mask!10302 thiss!1504))))))

(assert (=> d!59171 (validMask!0 (mask!10302 thiss!1504))))

(assert (=> d!59171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10302 thiss!1504)) key!932 (_keys!6420 thiss!1504) (mask!10302 thiss!1504)) lt!118670)))

(declare-fun b!234530 () Bool)

(assert (=> b!234530 (and (bvsge (index!5980 lt!118670) #b00000000000000000000000000000000) (bvslt (index!5980 lt!118670) (size!5845 (_keys!6420 thiss!1504))))))

(declare-fun res!115034 () Bool)

(assert (=> b!234530 (= res!115034 (= (select (arr!5510 (_keys!6420 thiss!1504)) (index!5980 lt!118670)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152330 () Bool)

(assert (=> b!234530 (=> res!115034 e!152330)))

(declare-fun b!234531 () Bool)

(declare-fun e!152332 () SeekEntryResult!952)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234531 (= e!152332 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10302 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10302 thiss!1504)) key!932 (_keys!6420 thiss!1504) (mask!10302 thiss!1504)))))

(declare-fun b!234532 () Bool)

(assert (=> b!234532 (and (bvsge (index!5980 lt!118670) #b00000000000000000000000000000000) (bvslt (index!5980 lt!118670) (size!5845 (_keys!6420 thiss!1504))))))

(declare-fun res!115033 () Bool)

(assert (=> b!234532 (= res!115033 (= (select (arr!5510 (_keys!6420 thiss!1504)) (index!5980 lt!118670)) key!932))))

(assert (=> b!234532 (=> res!115033 e!152330)))

(declare-fun e!152333 () Bool)

(assert (=> b!234532 (= e!152333 e!152330)))

(declare-fun b!234533 () Bool)

(assert (=> b!234533 (= e!152334 e!152332)))

(declare-fun c!39061 () Bool)

(assert (=> b!234533 (= c!39061 (or (= lt!118669 key!932) (= (bvadd lt!118669 lt!118669) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234534 () Bool)

(assert (=> b!234534 (= e!152331 e!152333)))

(declare-fun res!115032 () Bool)

(assert (=> b!234534 (= res!115032 (and ((_ is Intermediate!952) lt!118670) (not (undefined!1764 lt!118670)) (bvslt (x!23668 lt!118670) #b01111111111111111111111111111110) (bvsge (x!23668 lt!118670) #b00000000000000000000000000000000) (bvsge (x!23668 lt!118670) #b00000000000000000000000000000000)))))

(assert (=> b!234534 (=> (not res!115032) (not e!152333))))

(declare-fun b!234535 () Bool)

(assert (=> b!234535 (= e!152331 (bvsge (x!23668 lt!118670) #b01111111111111111111111111111110))))

(declare-fun b!234536 () Bool)

(assert (=> b!234536 (= e!152332 (Intermediate!952 false (toIndex!0 key!932 (mask!10302 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!234537 () Bool)

(assert (=> b!234537 (and (bvsge (index!5980 lt!118670) #b00000000000000000000000000000000) (bvslt (index!5980 lt!118670) (size!5845 (_keys!6420 thiss!1504))))))

(assert (=> b!234537 (= e!152330 (= (select (arr!5510 (_keys!6420 thiss!1504)) (index!5980 lt!118670)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234538 () Bool)

(assert (=> b!234538 (= e!152334 (Intermediate!952 true (toIndex!0 key!932 (mask!10302 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!59171 c!39063) b!234538))

(assert (= (and d!59171 (not c!39063)) b!234533))

(assert (= (and b!234533 c!39061) b!234536))

(assert (= (and b!234533 (not c!39061)) b!234531))

(assert (= (and d!59171 c!39062) b!234535))

(assert (= (and d!59171 (not c!39062)) b!234534))

(assert (= (and b!234534 res!115032) b!234532))

(assert (= (and b!234532 (not res!115033)) b!234530))

(assert (= (and b!234530 (not res!115034)) b!234537))

(declare-fun m!255909 () Bool)

(assert (=> b!234530 m!255909))

(assert (=> d!59171 m!255811))

(declare-fun m!255911 () Bool)

(assert (=> d!59171 m!255911))

(assert (=> d!59171 m!255765))

(assert (=> b!234537 m!255909))

(assert (=> b!234532 m!255909))

(assert (=> b!234531 m!255811))

(declare-fun m!255913 () Bool)

(assert (=> b!234531 m!255913))

(assert (=> b!234531 m!255913))

(declare-fun m!255915 () Bool)

(assert (=> b!234531 m!255915))

(assert (=> d!59151 d!59171))

(declare-fun d!59173 () Bool)

(declare-fun lt!118676 () (_ BitVec 32))

(declare-fun lt!118675 () (_ BitVec 32))

(assert (=> d!59173 (= lt!118676 (bvmul (bvxor lt!118675 (bvlshr lt!118675 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59173 (= lt!118675 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59173 (and (bvsge (mask!10302 thiss!1504) #b00000000000000000000000000000000) (let ((res!115035 (let ((h!4097 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23685 (bvmul (bvxor h!4097 (bvlshr h!4097 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23685 (bvlshr x!23685 #b00000000000000000000000000001101)) (mask!10302 thiss!1504)))))) (and (bvslt res!115035 (bvadd (mask!10302 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!115035 #b00000000000000000000000000000000))))))

(assert (=> d!59173 (= (toIndex!0 key!932 (mask!10302 thiss!1504)) (bvand (bvxor lt!118676 (bvlshr lt!118676 #b00000000000000000000000000001101)) (mask!10302 thiss!1504)))))

(assert (=> d!59151 d!59173))

(assert (=> d!59151 d!59157))

(declare-fun d!59175 () Bool)

(assert (=> d!59175 (= (apply!207 (+!634 lt!118655 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504))) lt!118661) (apply!207 lt!118655 lt!118661))))

(declare-fun lt!118679 () Unit!7223)

(declare-fun choose!1105 (ListLongMap!3461 (_ BitVec 64) V!7873 (_ BitVec 64)) Unit!7223)

(assert (=> d!59175 (= lt!118679 (choose!1105 lt!118655 lt!118657 (zeroValue!4197 thiss!1504) lt!118661))))

(declare-fun e!152337 () Bool)

(assert (=> d!59175 e!152337))

(declare-fun res!115038 () Bool)

(assert (=> d!59175 (=> (not res!115038) (not e!152337))))

(assert (=> d!59175 (= res!115038 (contains!1632 lt!118655 lt!118661))))

(assert (=> d!59175 (= (addApplyDifferent!183 lt!118655 lt!118657 (zeroValue!4197 thiss!1504) lt!118661) lt!118679)))

(declare-fun b!234542 () Bool)

(assert (=> b!234542 (= e!152337 (not (= lt!118661 lt!118657)))))

(assert (= (and d!59175 res!115038) b!234542))

(assert (=> d!59175 m!255835))

(assert (=> d!59175 m!255837))

(declare-fun m!255917 () Bool)

(assert (=> d!59175 m!255917))

(assert (=> d!59175 m!255865))

(declare-fun m!255919 () Bool)

(assert (=> d!59175 m!255919))

(assert (=> d!59175 m!255835))

(assert (=> b!234465 d!59175))

(declare-fun d!59177 () Bool)

(assert (=> d!59177 (= (apply!207 (+!634 lt!118659 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504))) lt!118645) (apply!207 lt!118659 lt!118645))))

(declare-fun lt!118680 () Unit!7223)

(assert (=> d!59177 (= lt!118680 (choose!1105 lt!118659 lt!118648 (minValue!4197 thiss!1504) lt!118645))))

(declare-fun e!152338 () Bool)

(assert (=> d!59177 e!152338))

(declare-fun res!115039 () Bool)

(assert (=> d!59177 (=> (not res!115039) (not e!152338))))

(assert (=> d!59177 (= res!115039 (contains!1632 lt!118659 lt!118645))))

(assert (=> d!59177 (= (addApplyDifferent!183 lt!118659 lt!118648 (minValue!4197 thiss!1504) lt!118645) lt!118680)))

(declare-fun b!234543 () Bool)

(assert (=> b!234543 (= e!152338 (not (= lt!118645 lt!118648)))))

(assert (= (and d!59177 res!115039) b!234543))

(assert (=> d!59177 m!255847))

(assert (=> d!59177 m!255861))

(declare-fun m!255921 () Bool)

(assert (=> d!59177 m!255921))

(assert (=> d!59177 m!255839))

(declare-fun m!255923 () Bool)

(assert (=> d!59177 m!255923))

(assert (=> d!59177 m!255847))

(assert (=> b!234465 d!59177))

(declare-fun d!59179 () Bool)

(declare-fun e!152341 () Bool)

(assert (=> d!59179 e!152341))

(declare-fun res!115045 () Bool)

(assert (=> d!59179 (=> (not res!115045) (not e!152341))))

(declare-fun lt!118690 () ListLongMap!3461)

(assert (=> d!59179 (= res!115045 (contains!1632 lt!118690 (_1!2284 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504)))))))

(declare-fun lt!118691 () List!3448)

(assert (=> d!59179 (= lt!118690 (ListLongMap!3462 lt!118691))))

(declare-fun lt!118692 () Unit!7223)

(declare-fun lt!118689 () Unit!7223)

(assert (=> d!59179 (= lt!118692 lt!118689)))

(assert (=> d!59179 (= (getValueByKey!266 lt!118691 (_1!2284 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504)))) (Some!271 (_2!2284 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!150 (List!3448 (_ BitVec 64) V!7873) Unit!7223)

(assert (=> d!59179 (= lt!118689 (lemmaContainsTupThenGetReturnValue!150 lt!118691 (_1!2284 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504))) (_2!2284 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504)))))))

(declare-fun insertStrictlySorted!153 (List!3448 (_ BitVec 64) V!7873) List!3448)

(assert (=> d!59179 (= lt!118691 (insertStrictlySorted!153 (toList!1746 lt!118654) (_1!2284 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504))) (_2!2284 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504)))))))

(assert (=> d!59179 (= (+!634 lt!118654 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504))) lt!118690)))

(declare-fun b!234548 () Bool)

(declare-fun res!115044 () Bool)

(assert (=> b!234548 (=> (not res!115044) (not e!152341))))

(assert (=> b!234548 (= res!115044 (= (getValueByKey!266 (toList!1746 lt!118690) (_1!2284 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504)))) (Some!271 (_2!2284 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504))))))))

(declare-fun b!234549 () Bool)

(declare-fun contains!1635 (List!3448 tuple2!4546) Bool)

(assert (=> b!234549 (= e!152341 (contains!1635 (toList!1746 lt!118690) (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504))))))

(assert (= (and d!59179 res!115045) b!234548))

(assert (= (and b!234548 res!115044) b!234549))

(declare-fun m!255925 () Bool)

(assert (=> d!59179 m!255925))

(declare-fun m!255927 () Bool)

(assert (=> d!59179 m!255927))

(declare-fun m!255929 () Bool)

(assert (=> d!59179 m!255929))

(declare-fun m!255931 () Bool)

(assert (=> d!59179 m!255931))

(declare-fun m!255933 () Bool)

(assert (=> b!234548 m!255933))

(declare-fun m!255935 () Bool)

(assert (=> b!234549 m!255935))

(assert (=> b!234465 d!59179))

(declare-fun d!59181 () Bool)

(assert (=> d!59181 (= (apply!207 (+!634 lt!118659 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504))) lt!118645) (get!2835 (getValueByKey!266 (toList!1746 (+!634 lt!118659 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504)))) lt!118645)))))

(declare-fun bs!8702 () Bool)

(assert (= bs!8702 d!59181))

(declare-fun m!255937 () Bool)

(assert (=> bs!8702 m!255937))

(assert (=> bs!8702 m!255937))

(declare-fun m!255939 () Bool)

(assert (=> bs!8702 m!255939))

(assert (=> b!234465 d!59181))

(declare-fun d!59183 () Bool)

(assert (=> d!59183 (= (apply!207 lt!118659 lt!118645) (get!2835 (getValueByKey!266 (toList!1746 lt!118659) lt!118645)))))

(declare-fun bs!8703 () Bool)

(assert (= bs!8703 d!59183))

(declare-fun m!255941 () Bool)

(assert (=> bs!8703 m!255941))

(assert (=> bs!8703 m!255941))

(declare-fun m!255943 () Bool)

(assert (=> bs!8703 m!255943))

(assert (=> b!234465 d!59183))

(declare-fun d!59185 () Bool)

(assert (=> d!59185 (= (apply!207 (+!634 lt!118663 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504))) lt!118647) (get!2835 (getValueByKey!266 (toList!1746 (+!634 lt!118663 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504)))) lt!118647)))))

(declare-fun bs!8704 () Bool)

(assert (= bs!8704 d!59185))

(declare-fun m!255945 () Bool)

(assert (=> bs!8704 m!255945))

(assert (=> bs!8704 m!255945))

(declare-fun m!255947 () Bool)

(assert (=> bs!8704 m!255947))

(assert (=> b!234465 d!59185))

(declare-fun b!234574 () Bool)

(declare-fun e!152362 () Bool)

(declare-fun lt!118712 () ListLongMap!3461)

(declare-fun isEmpty!514 (ListLongMap!3461) Bool)

(assert (=> b!234574 (= e!152362 (isEmpty!514 lt!118712))))

(declare-fun bm!21798 () Bool)

(declare-fun call!21801 () ListLongMap!3461)

(assert (=> bm!21798 (= call!21801 (getCurrentListMapNoExtraKeys!523 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4356 thiss!1504)))))

(declare-fun d!59187 () Bool)

(declare-fun e!152361 () Bool)

(assert (=> d!59187 e!152361))

(declare-fun res!115054 () Bool)

(assert (=> d!59187 (=> (not res!115054) (not e!152361))))

(assert (=> d!59187 (= res!115054 (not (contains!1632 lt!118712 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!152358 () ListLongMap!3461)

(assert (=> d!59187 (= lt!118712 e!152358)))

(declare-fun c!39074 () Bool)

(assert (=> d!59187 (= c!39074 (bvsge #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))

(assert (=> d!59187 (validMask!0 (mask!10302 thiss!1504))))

(assert (=> d!59187 (= (getCurrentListMapNoExtraKeys!523 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)) lt!118712)))

(declare-fun b!234575 () Bool)

(assert (=> b!234575 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))

(assert (=> b!234575 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5844 (_values!4339 thiss!1504))))))

(declare-fun e!152356 () Bool)

(assert (=> b!234575 (= e!152356 (= (apply!207 lt!118712 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)) (get!2834 (select (arr!5509 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234576 () Bool)

(declare-fun e!152359 () Bool)

(assert (=> b!234576 (= e!152359 (validKeyInArray!0 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234576 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!234577 () Bool)

(declare-fun e!152360 () Bool)

(assert (=> b!234577 (= e!152360 e!152356)))

(assert (=> b!234577 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))

(declare-fun res!115056 () Bool)

(assert (=> b!234577 (= res!115056 (contains!1632 lt!118712 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234577 (=> (not res!115056) (not e!152356))))

(declare-fun b!234578 () Bool)

(assert (=> b!234578 (= e!152360 e!152362)))

(declare-fun c!39073 () Bool)

(assert (=> b!234578 (= c!39073 (bvslt #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))

(declare-fun b!234579 () Bool)

(declare-fun e!152357 () ListLongMap!3461)

(assert (=> b!234579 (= e!152358 e!152357)))

(declare-fun c!39072 () Bool)

(assert (=> b!234579 (= c!39072 (validKeyInArray!0 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234580 () Bool)

(declare-fun res!115055 () Bool)

(assert (=> b!234580 (=> (not res!115055) (not e!152361))))

(assert (=> b!234580 (= res!115055 (not (contains!1632 lt!118712 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234581 () Bool)

(assert (=> b!234581 (= e!152357 call!21801)))

(declare-fun b!234582 () Bool)

(declare-fun lt!118713 () Unit!7223)

(declare-fun lt!118709 () Unit!7223)

(assert (=> b!234582 (= lt!118713 lt!118709)))

(declare-fun lt!118707 () (_ BitVec 64))

(declare-fun lt!118711 () V!7873)

(declare-fun lt!118708 () (_ BitVec 64))

(declare-fun lt!118710 () ListLongMap!3461)

(assert (=> b!234582 (not (contains!1632 (+!634 lt!118710 (tuple2!4547 lt!118708 lt!118711)) lt!118707))))

(declare-fun addStillNotContains!115 (ListLongMap!3461 (_ BitVec 64) V!7873 (_ BitVec 64)) Unit!7223)

(assert (=> b!234582 (= lt!118709 (addStillNotContains!115 lt!118710 lt!118708 lt!118711 lt!118707))))

(assert (=> b!234582 (= lt!118707 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!234582 (= lt!118711 (get!2834 (select (arr!5509 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234582 (= lt!118708 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234582 (= lt!118710 call!21801)))

(assert (=> b!234582 (= e!152357 (+!634 call!21801 (tuple2!4547 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000) (get!2834 (select (arr!5509 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!234583 () Bool)

(assert (=> b!234583 (= e!152358 (ListLongMap!3462 Nil!3445))))

(declare-fun b!234584 () Bool)

(assert (=> b!234584 (= e!152361 e!152360)))

(declare-fun c!39075 () Bool)

(assert (=> b!234584 (= c!39075 e!152359)))

(declare-fun res!115057 () Bool)

(assert (=> b!234584 (=> (not res!115057) (not e!152359))))

(assert (=> b!234584 (= res!115057 (bvslt #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))

(declare-fun b!234585 () Bool)

(assert (=> b!234585 (= e!152362 (= lt!118712 (getCurrentListMapNoExtraKeys!523 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4356 thiss!1504))))))

(assert (= (and d!59187 c!39074) b!234583))

(assert (= (and d!59187 (not c!39074)) b!234579))

(assert (= (and b!234579 c!39072) b!234582))

(assert (= (and b!234579 (not c!39072)) b!234581))

(assert (= (or b!234582 b!234581) bm!21798))

(assert (= (and d!59187 res!115054) b!234580))

(assert (= (and b!234580 res!115055) b!234584))

(assert (= (and b!234584 res!115057) b!234576))

(assert (= (and b!234584 c!39075) b!234577))

(assert (= (and b!234584 (not c!39075)) b!234578))

(assert (= (and b!234577 res!115056) b!234575))

(assert (= (and b!234578 c!39073) b!234585))

(assert (= (and b!234578 (not c!39073)) b!234574))

(declare-fun b_lambda!7901 () Bool)

(assert (=> (not b_lambda!7901) (not b!234575)))

(assert (=> b!234575 t!8410))

(declare-fun b_and!13243 () Bool)

(assert (= b_and!13241 (and (=> t!8410 result!5095) b_and!13243)))

(declare-fun b_lambda!7903 () Bool)

(assert (=> (not b_lambda!7903) (not b!234582)))

(assert (=> b!234582 t!8410))

(declare-fun b_and!13245 () Bool)

(assert (= b_and!13243 (and (=> t!8410 result!5095) b_and!13245)))

(assert (=> b!234577 m!255867))

(assert (=> b!234577 m!255867))

(declare-fun m!255949 () Bool)

(assert (=> b!234577 m!255949))

(declare-fun m!255951 () Bool)

(assert (=> b!234585 m!255951))

(declare-fun m!255953 () Bool)

(assert (=> d!59187 m!255953))

(assert (=> d!59187 m!255765))

(declare-fun m!255955 () Bool)

(assert (=> b!234574 m!255955))

(declare-fun m!255957 () Bool)

(assert (=> b!234580 m!255957))

(assert (=> b!234575 m!255875))

(assert (=> b!234575 m!255867))

(declare-fun m!255959 () Bool)

(assert (=> b!234575 m!255959))

(assert (=> b!234575 m!255877))

(assert (=> b!234575 m!255867))

(assert (=> b!234575 m!255875))

(assert (=> b!234575 m!255877))

(assert (=> b!234575 m!255879))

(assert (=> b!234582 m!255875))

(declare-fun m!255961 () Bool)

(assert (=> b!234582 m!255961))

(declare-fun m!255963 () Bool)

(assert (=> b!234582 m!255963))

(assert (=> b!234582 m!255961))

(declare-fun m!255965 () Bool)

(assert (=> b!234582 m!255965))

(declare-fun m!255967 () Bool)

(assert (=> b!234582 m!255967))

(assert (=> b!234582 m!255877))

(assert (=> b!234582 m!255867))

(assert (=> b!234582 m!255875))

(assert (=> b!234582 m!255877))

(assert (=> b!234582 m!255879))

(assert (=> b!234579 m!255867))

(assert (=> b!234579 m!255867))

(assert (=> b!234579 m!255871))

(assert (=> bm!21798 m!255951))

(assert (=> b!234576 m!255867))

(assert (=> b!234576 m!255867))

(assert (=> b!234576 m!255871))

(assert (=> b!234465 d!59187))

(declare-fun d!59189 () Bool)

(assert (=> d!59189 (= (apply!207 lt!118663 lt!118647) (get!2835 (getValueByKey!266 (toList!1746 lt!118663) lt!118647)))))

(declare-fun bs!8705 () Bool)

(assert (= bs!8705 d!59189))

(declare-fun m!255969 () Bool)

(assert (=> bs!8705 m!255969))

(assert (=> bs!8705 m!255969))

(declare-fun m!255971 () Bool)

(assert (=> bs!8705 m!255971))

(assert (=> b!234465 d!59189))

(declare-fun d!59191 () Bool)

(declare-fun e!152363 () Bool)

(assert (=> d!59191 e!152363))

(declare-fun res!115059 () Bool)

(assert (=> d!59191 (=> (not res!115059) (not e!152363))))

(declare-fun lt!118715 () ListLongMap!3461)

(assert (=> d!59191 (= res!115059 (contains!1632 lt!118715 (_1!2284 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504)))))))

(declare-fun lt!118716 () List!3448)

(assert (=> d!59191 (= lt!118715 (ListLongMap!3462 lt!118716))))

(declare-fun lt!118717 () Unit!7223)

(declare-fun lt!118714 () Unit!7223)

(assert (=> d!59191 (= lt!118717 lt!118714)))

(assert (=> d!59191 (= (getValueByKey!266 lt!118716 (_1!2284 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504)))) (Some!271 (_2!2284 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504)))))))

(assert (=> d!59191 (= lt!118714 (lemmaContainsTupThenGetReturnValue!150 lt!118716 (_1!2284 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504))) (_2!2284 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504)))))))

(assert (=> d!59191 (= lt!118716 (insertStrictlySorted!153 (toList!1746 lt!118663) (_1!2284 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504))) (_2!2284 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504)))))))

(assert (=> d!59191 (= (+!634 lt!118663 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504))) lt!118715)))

(declare-fun b!234586 () Bool)

(declare-fun res!115058 () Bool)

(assert (=> b!234586 (=> (not res!115058) (not e!152363))))

(assert (=> b!234586 (= res!115058 (= (getValueByKey!266 (toList!1746 lt!118715) (_1!2284 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504)))) (Some!271 (_2!2284 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504))))))))

(declare-fun b!234587 () Bool)

(assert (=> b!234587 (= e!152363 (contains!1635 (toList!1746 lt!118715) (tuple2!4547 lt!118656 (minValue!4197 thiss!1504))))))

(assert (= (and d!59191 res!115059) b!234586))

(assert (= (and b!234586 res!115058) b!234587))

(declare-fun m!255973 () Bool)

(assert (=> d!59191 m!255973))

(declare-fun m!255975 () Bool)

(assert (=> d!59191 m!255975))

(declare-fun m!255977 () Bool)

(assert (=> d!59191 m!255977))

(declare-fun m!255979 () Bool)

(assert (=> d!59191 m!255979))

(declare-fun m!255981 () Bool)

(assert (=> b!234586 m!255981))

(declare-fun m!255983 () Bool)

(assert (=> b!234587 m!255983))

(assert (=> b!234465 d!59191))

(declare-fun d!59193 () Bool)

(assert (=> d!59193 (= (apply!207 (+!634 lt!118655 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504))) lt!118661) (get!2835 (getValueByKey!266 (toList!1746 (+!634 lt!118655 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504)))) lt!118661)))))

(declare-fun bs!8706 () Bool)

(assert (= bs!8706 d!59193))

(declare-fun m!255985 () Bool)

(assert (=> bs!8706 m!255985))

(assert (=> bs!8706 m!255985))

(declare-fun m!255987 () Bool)

(assert (=> bs!8706 m!255987))

(assert (=> b!234465 d!59193))

(declare-fun d!59195 () Bool)

(declare-fun e!152364 () Bool)

(assert (=> d!59195 e!152364))

(declare-fun res!115061 () Bool)

(assert (=> d!59195 (=> (not res!115061) (not e!152364))))

(declare-fun lt!118719 () ListLongMap!3461)

(assert (=> d!59195 (= res!115061 (contains!1632 lt!118719 (_1!2284 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504)))))))

(declare-fun lt!118720 () List!3448)

(assert (=> d!59195 (= lt!118719 (ListLongMap!3462 lt!118720))))

(declare-fun lt!118721 () Unit!7223)

(declare-fun lt!118718 () Unit!7223)

(assert (=> d!59195 (= lt!118721 lt!118718)))

(assert (=> d!59195 (= (getValueByKey!266 lt!118720 (_1!2284 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504)))) (Some!271 (_2!2284 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504)))))))

(assert (=> d!59195 (= lt!118718 (lemmaContainsTupThenGetReturnValue!150 lt!118720 (_1!2284 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504))) (_2!2284 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504)))))))

(assert (=> d!59195 (= lt!118720 (insertStrictlySorted!153 (toList!1746 lt!118659) (_1!2284 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504))) (_2!2284 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504)))))))

(assert (=> d!59195 (= (+!634 lt!118659 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504))) lt!118719)))

(declare-fun b!234588 () Bool)

(declare-fun res!115060 () Bool)

(assert (=> b!234588 (=> (not res!115060) (not e!152364))))

(assert (=> b!234588 (= res!115060 (= (getValueByKey!266 (toList!1746 lt!118719) (_1!2284 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504)))) (Some!271 (_2!2284 (tuple2!4547 lt!118648 (minValue!4197 thiss!1504))))))))

(declare-fun b!234589 () Bool)

(assert (=> b!234589 (= e!152364 (contains!1635 (toList!1746 lt!118719) (tuple2!4547 lt!118648 (minValue!4197 thiss!1504))))))

(assert (= (and d!59195 res!115061) b!234588))

(assert (= (and b!234588 res!115060) b!234589))

(declare-fun m!255989 () Bool)

(assert (=> d!59195 m!255989))

(declare-fun m!255991 () Bool)

(assert (=> d!59195 m!255991))

(declare-fun m!255993 () Bool)

(assert (=> d!59195 m!255993))

(declare-fun m!255995 () Bool)

(assert (=> d!59195 m!255995))

(declare-fun m!255997 () Bool)

(assert (=> b!234588 m!255997))

(declare-fun m!255999 () Bool)

(assert (=> b!234589 m!255999))

(assert (=> b!234465 d!59195))

(declare-fun d!59197 () Bool)

(assert (=> d!59197 (= (apply!207 lt!118655 lt!118661) (get!2835 (getValueByKey!266 (toList!1746 lt!118655) lt!118661)))))

(declare-fun bs!8707 () Bool)

(assert (= bs!8707 d!59197))

(declare-fun m!256001 () Bool)

(assert (=> bs!8707 m!256001))

(assert (=> bs!8707 m!256001))

(declare-fun m!256003 () Bool)

(assert (=> bs!8707 m!256003))

(assert (=> b!234465 d!59197))

(declare-fun d!59199 () Bool)

(assert (=> d!59199 (contains!1632 (+!634 lt!118654 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504))) lt!118662)))

(declare-fun lt!118724 () Unit!7223)

(declare-fun choose!1106 (ListLongMap!3461 (_ BitVec 64) V!7873 (_ BitVec 64)) Unit!7223)

(assert (=> d!59199 (= lt!118724 (choose!1106 lt!118654 lt!118643 (zeroValue!4197 thiss!1504) lt!118662))))

(assert (=> d!59199 (contains!1632 lt!118654 lt!118662)))

(assert (=> d!59199 (= (addStillContains!183 lt!118654 lt!118643 (zeroValue!4197 thiss!1504) lt!118662) lt!118724)))

(declare-fun bs!8708 () Bool)

(assert (= bs!8708 d!59199))

(assert (=> bs!8708 m!255841))

(assert (=> bs!8708 m!255841))

(assert (=> bs!8708 m!255843))

(declare-fun m!256005 () Bool)

(assert (=> bs!8708 m!256005))

(declare-fun m!256007 () Bool)

(assert (=> bs!8708 m!256007))

(assert (=> b!234465 d!59199))

(declare-fun d!59201 () Bool)

(declare-fun e!152365 () Bool)

(assert (=> d!59201 e!152365))

(declare-fun res!115063 () Bool)

(assert (=> d!59201 (=> (not res!115063) (not e!152365))))

(declare-fun lt!118726 () ListLongMap!3461)

(assert (=> d!59201 (= res!115063 (contains!1632 lt!118726 (_1!2284 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504)))))))

(declare-fun lt!118727 () List!3448)

(assert (=> d!59201 (= lt!118726 (ListLongMap!3462 lt!118727))))

(declare-fun lt!118728 () Unit!7223)

(declare-fun lt!118725 () Unit!7223)

(assert (=> d!59201 (= lt!118728 lt!118725)))

(assert (=> d!59201 (= (getValueByKey!266 lt!118727 (_1!2284 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504)))) (Some!271 (_2!2284 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504)))))))

(assert (=> d!59201 (= lt!118725 (lemmaContainsTupThenGetReturnValue!150 lt!118727 (_1!2284 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504))) (_2!2284 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504)))))))

(assert (=> d!59201 (= lt!118727 (insertStrictlySorted!153 (toList!1746 lt!118655) (_1!2284 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504))) (_2!2284 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504)))))))

(assert (=> d!59201 (= (+!634 lt!118655 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504))) lt!118726)))

(declare-fun b!234591 () Bool)

(declare-fun res!115062 () Bool)

(assert (=> b!234591 (=> (not res!115062) (not e!152365))))

(assert (=> b!234591 (= res!115062 (= (getValueByKey!266 (toList!1746 lt!118726) (_1!2284 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504)))) (Some!271 (_2!2284 (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504))))))))

(declare-fun b!234592 () Bool)

(assert (=> b!234592 (= e!152365 (contains!1635 (toList!1746 lt!118726) (tuple2!4547 lt!118657 (zeroValue!4197 thiss!1504))))))

(assert (= (and d!59201 res!115063) b!234591))

(assert (= (and b!234591 res!115062) b!234592))

(declare-fun m!256009 () Bool)

(assert (=> d!59201 m!256009))

(declare-fun m!256011 () Bool)

(assert (=> d!59201 m!256011))

(declare-fun m!256013 () Bool)

(assert (=> d!59201 m!256013))

(declare-fun m!256015 () Bool)

(assert (=> d!59201 m!256015))

(declare-fun m!256017 () Bool)

(assert (=> b!234591 m!256017))

(declare-fun m!256019 () Bool)

(assert (=> b!234592 m!256019))

(assert (=> b!234465 d!59201))

(declare-fun d!59203 () Bool)

(assert (=> d!59203 (= (apply!207 (+!634 lt!118663 (tuple2!4547 lt!118656 (minValue!4197 thiss!1504))) lt!118647) (apply!207 lt!118663 lt!118647))))

(declare-fun lt!118729 () Unit!7223)

(assert (=> d!59203 (= lt!118729 (choose!1105 lt!118663 lt!118656 (minValue!4197 thiss!1504) lt!118647))))

(declare-fun e!152366 () Bool)

(assert (=> d!59203 e!152366))

(declare-fun res!115064 () Bool)

(assert (=> d!59203 (=> (not res!115064) (not e!152366))))

(assert (=> d!59203 (= res!115064 (contains!1632 lt!118663 lt!118647))))

(assert (=> d!59203 (= (addApplyDifferent!183 lt!118663 lt!118656 (minValue!4197 thiss!1504) lt!118647) lt!118729)))

(declare-fun b!234593 () Bool)

(assert (=> b!234593 (= e!152366 (not (= lt!118647 lt!118656)))))

(assert (= (and d!59203 res!115064) b!234593))

(assert (=> d!59203 m!255849))

(assert (=> d!59203 m!255851))

(declare-fun m!256021 () Bool)

(assert (=> d!59203 m!256021))

(assert (=> d!59203 m!255845))

(declare-fun m!256023 () Bool)

(assert (=> d!59203 m!256023))

(assert (=> d!59203 m!255849))

(assert (=> b!234465 d!59203))

(declare-fun d!59205 () Bool)

(declare-fun e!152368 () Bool)

(assert (=> d!59205 e!152368))

(declare-fun res!115065 () Bool)

(assert (=> d!59205 (=> res!115065 e!152368)))

(declare-fun lt!118731 () Bool)

(assert (=> d!59205 (= res!115065 (not lt!118731))))

(declare-fun lt!118733 () Bool)

(assert (=> d!59205 (= lt!118731 lt!118733)))

(declare-fun lt!118730 () Unit!7223)

(declare-fun e!152367 () Unit!7223)

(assert (=> d!59205 (= lt!118730 e!152367)))

(declare-fun c!39076 () Bool)

(assert (=> d!59205 (= c!39076 lt!118733)))

(assert (=> d!59205 (= lt!118733 (containsKey!257 (toList!1746 (+!634 lt!118654 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504)))) lt!118662))))

(assert (=> d!59205 (= (contains!1632 (+!634 lt!118654 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504))) lt!118662) lt!118731)))

(declare-fun b!234594 () Bool)

(declare-fun lt!118732 () Unit!7223)

(assert (=> b!234594 (= e!152367 lt!118732)))

(assert (=> b!234594 (= lt!118732 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1746 (+!634 lt!118654 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504)))) lt!118662))))

(assert (=> b!234594 (isDefined!206 (getValueByKey!266 (toList!1746 (+!634 lt!118654 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504)))) lt!118662))))

(declare-fun b!234595 () Bool)

(declare-fun Unit!7227 () Unit!7223)

(assert (=> b!234595 (= e!152367 Unit!7227)))

(declare-fun b!234596 () Bool)

(assert (=> b!234596 (= e!152368 (isDefined!206 (getValueByKey!266 (toList!1746 (+!634 lt!118654 (tuple2!4547 lt!118643 (zeroValue!4197 thiss!1504)))) lt!118662)))))

(assert (= (and d!59205 c!39076) b!234594))

(assert (= (and d!59205 (not c!39076)) b!234595))

(assert (= (and d!59205 (not res!115065)) b!234596))

(declare-fun m!256025 () Bool)

(assert (=> d!59205 m!256025))

(declare-fun m!256027 () Bool)

(assert (=> b!234594 m!256027))

(declare-fun m!256029 () Bool)

(assert (=> b!234594 m!256029))

(assert (=> b!234594 m!256029))

(declare-fun m!256031 () Bool)

(assert (=> b!234594 m!256031))

(assert (=> b!234596 m!256029))

(assert (=> b!234596 m!256029))

(assert (=> b!234596 m!256031))

(assert (=> b!234465 d!59205))

(declare-fun d!59207 () Bool)

(assert (=> d!59207 (isDefined!206 (getValueByKey!266 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))

(declare-fun lt!118736 () Unit!7223)

(declare-fun choose!1107 (List!3448 (_ BitVec 64)) Unit!7223)

(assert (=> d!59207 (= lt!118736 (choose!1107 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))

(declare-fun e!152371 () Bool)

(assert (=> d!59207 e!152371))

(declare-fun res!115068 () Bool)

(assert (=> d!59207 (=> (not res!115068) (not e!152371))))

(declare-fun isStrictlySorted!348 (List!3448) Bool)

(assert (=> d!59207 (= res!115068 (isStrictlySorted!348 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))))

(assert (=> d!59207 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932) lt!118736)))

(declare-fun b!234599 () Bool)

(assert (=> b!234599 (= e!152371 (containsKey!257 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))

(assert (= (and d!59207 res!115068) b!234599))

(assert (=> d!59207 m!255829))

(assert (=> d!59207 m!255829))

(assert (=> d!59207 m!255831))

(declare-fun m!256033 () Bool)

(assert (=> d!59207 m!256033))

(declare-fun m!256035 () Bool)

(assert (=> d!59207 m!256035))

(assert (=> b!234599 m!255825))

(assert (=> b!234415 d!59207))

(declare-fun d!59209 () Bool)

(declare-fun isEmpty!515 (Option!272) Bool)

(assert (=> d!59209 (= (isDefined!206 (getValueByKey!266 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932)) (not (isEmpty!515 (getValueByKey!266 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))))

(declare-fun bs!8709 () Bool)

(assert (= bs!8709 d!59209))

(assert (=> bs!8709 m!255829))

(declare-fun m!256037 () Bool)

(assert (=> bs!8709 m!256037))

(assert (=> b!234415 d!59209))

(declare-fun d!59211 () Bool)

(declare-fun c!39081 () Bool)

(assert (=> d!59211 (= c!39081 (and ((_ is Cons!3444) (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))) (= (_1!2284 (h!4094 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))))) key!932)))))

(declare-fun e!152376 () Option!272)

(assert (=> d!59211 (= (getValueByKey!266 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932) e!152376)))

(declare-fun b!234608 () Bool)

(assert (=> b!234608 (= e!152376 (Some!271 (_2!2284 (h!4094 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))))))

(declare-fun b!234611 () Bool)

(declare-fun e!152377 () Option!272)

(assert (=> b!234611 (= e!152377 None!270)))

(declare-fun b!234609 () Bool)

(assert (=> b!234609 (= e!152376 e!152377)))

(declare-fun c!39082 () Bool)

(assert (=> b!234609 (= c!39082 (and ((_ is Cons!3444) (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))) (not (= (_1!2284 (h!4094 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))))) key!932))))))

(declare-fun b!234610 () Bool)

(assert (=> b!234610 (= e!152377 (getValueByKey!266 (t!8407 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))) key!932))))

(assert (= (and d!59211 c!39081) b!234608))

(assert (= (and d!59211 (not c!39081)) b!234609))

(assert (= (and b!234609 c!39082) b!234610))

(assert (= (and b!234609 (not c!39082)) b!234611))

(declare-fun m!256039 () Bool)

(assert (=> b!234610 m!256039))

(assert (=> b!234415 d!59211))

(declare-fun b!234620 () Bool)

(declare-fun res!115079 () Bool)

(declare-fun e!152380 () Bool)

(assert (=> b!234620 (=> (not res!115079) (not e!152380))))

(assert (=> b!234620 (= res!115079 (and (= (size!5844 (_values!4339 thiss!1504)) (bvadd (mask!10302 thiss!1504) #b00000000000000000000000000000001)) (= (size!5845 (_keys!6420 thiss!1504)) (size!5844 (_values!4339 thiss!1504))) (bvsge (_size!1740 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1740 thiss!1504) (bvadd (mask!10302 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!234621 () Bool)

(declare-fun res!115078 () Bool)

(assert (=> b!234621 (=> (not res!115078) (not e!152380))))

(declare-fun size!5850 (LongMapFixedSize!3382) (_ BitVec 32))

(assert (=> b!234621 (= res!115078 (bvsge (size!5850 thiss!1504) (_size!1740 thiss!1504)))))

(declare-fun b!234622 () Bool)

(declare-fun res!115077 () Bool)

(assert (=> b!234622 (=> (not res!115077) (not e!152380))))

(assert (=> b!234622 (= res!115077 (= (size!5850 thiss!1504) (bvadd (_size!1740 thiss!1504) (bvsdiv (bvadd (extraKeys!4093 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!234623 () Bool)

(assert (=> b!234623 (= e!152380 (and (bvsge (extraKeys!4093 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4093 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1740 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!59213 () Bool)

(declare-fun res!115080 () Bool)

(assert (=> d!59213 (=> (not res!115080) (not e!152380))))

(assert (=> d!59213 (= res!115080 (validMask!0 (mask!10302 thiss!1504)))))

(assert (=> d!59213 (= (simpleValid!230 thiss!1504) e!152380)))

(assert (= (and d!59213 res!115080) b!234620))

(assert (= (and b!234620 res!115079) b!234621))

(assert (= (and b!234621 res!115078) b!234622))

(assert (= (and b!234622 res!115077) b!234623))

(declare-fun m!256041 () Bool)

(assert (=> b!234621 m!256041))

(assert (=> b!234622 m!256041))

(assert (=> d!59213 m!255765))

(assert (=> d!59149 d!59213))

(declare-fun d!59215 () Bool)

(declare-fun e!152381 () Bool)

(assert (=> d!59215 e!152381))

(declare-fun res!115082 () Bool)

(assert (=> d!59215 (=> (not res!115082) (not e!152381))))

(declare-fun lt!118738 () ListLongMap!3461)

(assert (=> d!59215 (= res!115082 (contains!1632 lt!118738 (_1!2284 (ite (or c!39043 c!39047) (tuple2!4547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))))

(declare-fun lt!118739 () List!3448)

(assert (=> d!59215 (= lt!118738 (ListLongMap!3462 lt!118739))))

(declare-fun lt!118740 () Unit!7223)

(declare-fun lt!118737 () Unit!7223)

(assert (=> d!59215 (= lt!118740 lt!118737)))

(assert (=> d!59215 (= (getValueByKey!266 lt!118739 (_1!2284 (ite (or c!39043 c!39047) (tuple2!4547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))) (Some!271 (_2!2284 (ite (or c!39043 c!39047) (tuple2!4547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))))

(assert (=> d!59215 (= lt!118737 (lemmaContainsTupThenGetReturnValue!150 lt!118739 (_1!2284 (ite (or c!39043 c!39047) (tuple2!4547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))) (_2!2284 (ite (or c!39043 c!39047) (tuple2!4547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))))

(assert (=> d!59215 (= lt!118739 (insertStrictlySorted!153 (toList!1746 (ite c!39043 call!21790 (ite c!39047 call!21795 call!21794))) (_1!2284 (ite (or c!39043 c!39047) (tuple2!4547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))) (_2!2284 (ite (or c!39043 c!39047) (tuple2!4547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))))

(assert (=> d!59215 (= (+!634 (ite c!39043 call!21790 (ite c!39047 call!21795 call!21794)) (ite (or c!39043 c!39047) (tuple2!4547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))) lt!118738)))

(declare-fun b!234624 () Bool)

(declare-fun res!115081 () Bool)

(assert (=> b!234624 (=> (not res!115081) (not e!152381))))

(assert (=> b!234624 (= res!115081 (= (getValueByKey!266 (toList!1746 lt!118738) (_1!2284 (ite (or c!39043 c!39047) (tuple2!4547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))) (Some!271 (_2!2284 (ite (or c!39043 c!39047) (tuple2!4547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))))

(declare-fun b!234625 () Bool)

(assert (=> b!234625 (= e!152381 (contains!1635 (toList!1746 lt!118738) (ite (or c!39043 c!39047) (tuple2!4547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))

(assert (= (and d!59215 res!115082) b!234624))

(assert (= (and b!234624 res!115081) b!234625))

(declare-fun m!256043 () Bool)

(assert (=> d!59215 m!256043))

(declare-fun m!256045 () Bool)

(assert (=> d!59215 m!256045))

(declare-fun m!256047 () Bool)

(assert (=> d!59215 m!256047))

(declare-fun m!256049 () Bool)

(assert (=> d!59215 m!256049))

(declare-fun m!256051 () Bool)

(assert (=> b!234624 m!256051))

(declare-fun m!256053 () Bool)

(assert (=> b!234625 m!256053))

(assert (=> bm!21791 d!59215))

(declare-fun bm!21801 () Bool)

(declare-fun call!21804 () Bool)

(assert (=> bm!21801 (= call!21804 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6420 thiss!1504) (mask!10302 thiss!1504)))))

(declare-fun d!59217 () Bool)

(declare-fun res!115088 () Bool)

(declare-fun e!152388 () Bool)

(assert (=> d!59217 (=> res!115088 e!152388)))

(assert (=> d!59217 (= res!115088 (bvsge #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))

(assert (=> d!59217 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6420 thiss!1504) (mask!10302 thiss!1504)) e!152388)))

(declare-fun b!234634 () Bool)

(declare-fun e!152389 () Bool)

(assert (=> b!234634 (= e!152389 call!21804)))

(declare-fun b!234635 () Bool)

(declare-fun e!152390 () Bool)

(assert (=> b!234635 (= e!152389 e!152390)))

(declare-fun lt!118749 () (_ BitVec 64))

(assert (=> b!234635 (= lt!118749 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118747 () Unit!7223)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11589 (_ BitVec 64) (_ BitVec 32)) Unit!7223)

(assert (=> b!234635 (= lt!118747 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6420 thiss!1504) lt!118749 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!234635 (arrayContainsKey!0 (_keys!6420 thiss!1504) lt!118749 #b00000000000000000000000000000000)))

(declare-fun lt!118748 () Unit!7223)

(assert (=> b!234635 (= lt!118748 lt!118747)))

(declare-fun res!115087 () Bool)

(assert (=> b!234635 (= res!115087 (= (seekEntryOrOpen!0 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000) (_keys!6420 thiss!1504) (mask!10302 thiss!1504)) (Found!952 #b00000000000000000000000000000000)))))

(assert (=> b!234635 (=> (not res!115087) (not e!152390))))

(declare-fun b!234636 () Bool)

(assert (=> b!234636 (= e!152390 call!21804)))

(declare-fun b!234637 () Bool)

(assert (=> b!234637 (= e!152388 e!152389)))

(declare-fun c!39085 () Bool)

(assert (=> b!234637 (= c!39085 (validKeyInArray!0 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59217 (not res!115088)) b!234637))

(assert (= (and b!234637 c!39085) b!234635))

(assert (= (and b!234637 (not c!39085)) b!234634))

(assert (= (and b!234635 res!115087) b!234636))

(assert (= (or b!234636 b!234634) bm!21801))

(declare-fun m!256055 () Bool)

(assert (=> bm!21801 m!256055))

(assert (=> b!234635 m!255867))

(declare-fun m!256057 () Bool)

(assert (=> b!234635 m!256057))

(declare-fun m!256059 () Bool)

(assert (=> b!234635 m!256059))

(assert (=> b!234635 m!255867))

(declare-fun m!256061 () Bool)

(assert (=> b!234635 m!256061))

(assert (=> b!234637 m!255867))

(assert (=> b!234637 m!255867))

(assert (=> b!234637 m!255871))

(assert (=> b!234389 d!59217))

(assert (=> bm!21786 d!59187))

(declare-fun d!59219 () Bool)

(declare-fun res!115093 () Bool)

(declare-fun e!152395 () Bool)

(assert (=> d!59219 (=> res!115093 e!152395)))

(assert (=> d!59219 (= res!115093 (and ((_ is Cons!3444) (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))) (= (_1!2284 (h!4094 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))))) key!932)))))

(assert (=> d!59219 (= (containsKey!257 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932) e!152395)))

(declare-fun b!234642 () Bool)

(declare-fun e!152396 () Bool)

(assert (=> b!234642 (= e!152395 e!152396)))

(declare-fun res!115094 () Bool)

(assert (=> b!234642 (=> (not res!115094) (not e!152396))))

(assert (=> b!234642 (= res!115094 (and (or (not ((_ is Cons!3444) (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))))) (bvsle (_1!2284 (h!4094 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))))) key!932)) ((_ is Cons!3444) (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))) (bvslt (_1!2284 (h!4094 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))))) key!932)))))

(declare-fun b!234643 () Bool)

(assert (=> b!234643 (= e!152396 (containsKey!257 (t!8407 (toList!1746 (getCurrentListMap!1278 (_keys!6420 thiss!1504) (_values!4339 thiss!1504) (mask!10302 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))) key!932))))

(assert (= (and d!59219 (not res!115093)) b!234642))

(assert (= (and b!234642 res!115094) b!234643))

(declare-fun m!256063 () Bool)

(assert (=> b!234643 m!256063))

(assert (=> d!59159 d!59219))

(declare-fun b!234652 () Bool)

(declare-fun e!152402 () (_ BitVec 32))

(declare-fun e!152401 () (_ BitVec 32))

(assert (=> b!234652 (= e!152402 e!152401)))

(declare-fun c!39091 () Bool)

(assert (=> b!234652 (= c!39091 (validKeyInArray!0 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21804 () Bool)

(declare-fun call!21807 () (_ BitVec 32))

(assert (=> bm!21804 (= call!21807 (arrayCountValidKeys!0 (_keys!6420 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5845 (_keys!6420 thiss!1504))))))

(declare-fun d!59221 () Bool)

(declare-fun lt!118752 () (_ BitVec 32))

(assert (=> d!59221 (and (bvsge lt!118752 #b00000000000000000000000000000000) (bvsle lt!118752 (bvsub (size!5845 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59221 (= lt!118752 e!152402)))

(declare-fun c!39090 () Bool)

(assert (=> d!59221 (= c!39090 (bvsge #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))))))

(assert (=> d!59221 (and (bvsle #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5845 (_keys!6420 thiss!1504)) (size!5845 (_keys!6420 thiss!1504))))))

(assert (=> d!59221 (= (arrayCountValidKeys!0 (_keys!6420 thiss!1504) #b00000000000000000000000000000000 (size!5845 (_keys!6420 thiss!1504))) lt!118752)))

(declare-fun b!234653 () Bool)

(assert (=> b!234653 (= e!152401 (bvadd #b00000000000000000000000000000001 call!21807))))

(declare-fun b!234654 () Bool)

(assert (=> b!234654 (= e!152402 #b00000000000000000000000000000000)))

(declare-fun b!234655 () Bool)

(assert (=> b!234655 (= e!152401 call!21807)))

(assert (= (and d!59221 c!39090) b!234654))

(assert (= (and d!59221 (not c!39090)) b!234652))

(assert (= (and b!234652 c!39091) b!234653))

(assert (= (and b!234652 (not c!39091)) b!234655))

(assert (= (or b!234653 b!234655) bm!21804))

(assert (=> b!234652 m!255867))

(assert (=> b!234652 m!255867))

(assert (=> b!234652 m!255871))

(declare-fun m!256065 () Bool)

(assert (=> bm!21804 m!256065))

(assert (=> b!234388 d!59221))

(declare-fun d!59223 () Bool)

(declare-fun e!152403 () Bool)

(assert (=> d!59223 e!152403))

(declare-fun res!115096 () Bool)

(assert (=> d!59223 (=> (not res!115096) (not e!152403))))

(declare-fun lt!118754 () ListLongMap!3461)

(assert (=> d!59223 (= res!115096 (contains!1632 lt!118754 (_1!2284 (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))

(declare-fun lt!118755 () List!3448)

(assert (=> d!59223 (= lt!118754 (ListLongMap!3462 lt!118755))))

(declare-fun lt!118756 () Unit!7223)

(declare-fun lt!118753 () Unit!7223)

(assert (=> d!59223 (= lt!118756 lt!118753)))

(assert (=> d!59223 (= (getValueByKey!266 lt!118755 (_1!2284 (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))) (Some!271 (_2!2284 (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))

(assert (=> d!59223 (= lt!118753 (lemmaContainsTupThenGetReturnValue!150 lt!118755 (_1!2284 (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))) (_2!2284 (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))

(assert (=> d!59223 (= lt!118755 (insertStrictlySorted!153 (toList!1746 call!21793) (_1!2284 (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))) (_2!2284 (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))

(assert (=> d!59223 (= (+!634 call!21793 (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))) lt!118754)))

(declare-fun b!234656 () Bool)

(declare-fun res!115095 () Bool)

(assert (=> b!234656 (=> (not res!115095) (not e!152403))))

(assert (=> b!234656 (= res!115095 (= (getValueByKey!266 (toList!1746 lt!118754) (_1!2284 (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))) (Some!271 (_2!2284 (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))))

(declare-fun b!234657 () Bool)

(assert (=> b!234657 (= e!152403 (contains!1635 (toList!1746 lt!118754) (tuple2!4547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))

(assert (= (and d!59223 res!115096) b!234656))

(assert (= (and b!234656 res!115095) b!234657))

(declare-fun m!256067 () Bool)

(assert (=> d!59223 m!256067))

(declare-fun m!256069 () Bool)

(assert (=> d!59223 m!256069))

(declare-fun m!256071 () Bool)

(assert (=> d!59223 m!256071))

(declare-fun m!256073 () Bool)

(assert (=> d!59223 m!256073))

(declare-fun m!256075 () Bool)

(assert (=> b!234656 m!256075))

(declare-fun m!256077 () Bool)

(assert (=> b!234657 m!256077))

(assert (=> b!234460 d!59223))

(declare-fun d!59225 () Bool)

(assert (=> d!59225 (= (validKeyInArray!0 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234469 d!59225))

(declare-fun d!59227 () Bool)

(assert (=> d!59227 (= (apply!207 lt!118650 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2835 (getValueByKey!266 (toList!1746 lt!118650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8710 () Bool)

(assert (= bs!8710 d!59227))

(declare-fun m!256079 () Bool)

(assert (=> bs!8710 m!256079))

(assert (=> bs!8710 m!256079))

(declare-fun m!256081 () Bool)

(assert (=> bs!8710 m!256081))

(assert (=> b!234461 d!59227))

(declare-fun b!234670 () Bool)

(declare-fun e!152412 () SeekEntryResult!952)

(declare-fun e!152411 () SeekEntryResult!952)

(assert (=> b!234670 (= e!152412 e!152411)))

(declare-fun c!39099 () Bool)

(declare-fun lt!118762 () (_ BitVec 64))

(assert (=> b!234670 (= c!39099 (= lt!118762 key!932))))

(declare-fun b!234671 () Bool)

(assert (=> b!234671 (= e!152412 Undefined!952)))

(declare-fun e!152410 () SeekEntryResult!952)

(declare-fun b!234672 () Bool)

(assert (=> b!234672 (= e!152410 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23668 lt!118585) #b00000000000000000000000000000001) (nextIndex!0 (index!5980 lt!118585) (bvadd (x!23668 lt!118585) #b00000000000000000000000000000001) (mask!10302 thiss!1504)) (index!5980 lt!118585) key!932 (_keys!6420 thiss!1504) (mask!10302 thiss!1504)))))

(declare-fun b!234673 () Bool)

(assert (=> b!234673 (= e!152410 (MissingVacant!952 (index!5980 lt!118585)))))

(declare-fun b!234674 () Bool)

(assert (=> b!234674 (= e!152411 (Found!952 (index!5980 lt!118585)))))

(declare-fun d!59229 () Bool)

(declare-fun lt!118761 () SeekEntryResult!952)

(assert (=> d!59229 (and (or ((_ is Undefined!952) lt!118761) (not ((_ is Found!952) lt!118761)) (and (bvsge (index!5979 lt!118761) #b00000000000000000000000000000000) (bvslt (index!5979 lt!118761) (size!5845 (_keys!6420 thiss!1504))))) (or ((_ is Undefined!952) lt!118761) ((_ is Found!952) lt!118761) (not ((_ is MissingVacant!952) lt!118761)) (not (= (index!5981 lt!118761) (index!5980 lt!118585))) (and (bvsge (index!5981 lt!118761) #b00000000000000000000000000000000) (bvslt (index!5981 lt!118761) (size!5845 (_keys!6420 thiss!1504))))) (or ((_ is Undefined!952) lt!118761) (ite ((_ is Found!952) lt!118761) (= (select (arr!5510 (_keys!6420 thiss!1504)) (index!5979 lt!118761)) key!932) (and ((_ is MissingVacant!952) lt!118761) (= (index!5981 lt!118761) (index!5980 lt!118585)) (= (select (arr!5510 (_keys!6420 thiss!1504)) (index!5981 lt!118761)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59229 (= lt!118761 e!152412)))

(declare-fun c!39100 () Bool)

(assert (=> d!59229 (= c!39100 (bvsge (x!23668 lt!118585) #b01111111111111111111111111111110))))

(assert (=> d!59229 (= lt!118762 (select (arr!5510 (_keys!6420 thiss!1504)) (index!5980 lt!118585)))))

(assert (=> d!59229 (validMask!0 (mask!10302 thiss!1504))))

(assert (=> d!59229 (= (seekKeyOrZeroReturnVacant!0 (x!23668 lt!118585) (index!5980 lt!118585) (index!5980 lt!118585) key!932 (_keys!6420 thiss!1504) (mask!10302 thiss!1504)) lt!118761)))

(declare-fun b!234675 () Bool)

(declare-fun c!39098 () Bool)

(assert (=> b!234675 (= c!39098 (= lt!118762 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234675 (= e!152411 e!152410)))

(assert (= (and d!59229 c!39100) b!234671))

(assert (= (and d!59229 (not c!39100)) b!234670))

(assert (= (and b!234670 c!39099) b!234674))

(assert (= (and b!234670 (not c!39099)) b!234675))

(assert (= (and b!234675 c!39098) b!234673))

(assert (= (and b!234675 (not c!39098)) b!234672))

(declare-fun m!256083 () Bool)

(assert (=> b!234672 m!256083))

(assert (=> b!234672 m!256083))

(declare-fun m!256085 () Bool)

(assert (=> b!234672 m!256085))

(declare-fun m!256087 () Bool)

(assert (=> d!59229 m!256087))

(declare-fun m!256089 () Bool)

(assert (=> d!59229 m!256089))

(assert (=> d!59229 m!255823))

(assert (=> d!59229 m!255765))

(assert (=> b!234405 d!59229))

(declare-fun d!59231 () Bool)

(declare-fun e!152414 () Bool)

(assert (=> d!59231 e!152414))

(declare-fun res!115097 () Bool)

(assert (=> d!59231 (=> res!115097 e!152414)))

(declare-fun lt!118764 () Bool)

(assert (=> d!59231 (= res!115097 (not lt!118764))))

(declare-fun lt!118766 () Bool)

(assert (=> d!59231 (= lt!118764 lt!118766)))

(declare-fun lt!118763 () Unit!7223)

(declare-fun e!152413 () Unit!7223)

(assert (=> d!59231 (= lt!118763 e!152413)))

(declare-fun c!39101 () Bool)

(assert (=> d!59231 (= c!39101 lt!118766)))

(assert (=> d!59231 (= lt!118766 (containsKey!257 (toList!1746 lt!118650) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59231 (= (contains!1632 lt!118650 #b1000000000000000000000000000000000000000000000000000000000000000) lt!118764)))

(declare-fun b!234676 () Bool)

(declare-fun lt!118765 () Unit!7223)

(assert (=> b!234676 (= e!152413 lt!118765)))

(assert (=> b!234676 (= lt!118765 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1746 lt!118650) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234676 (isDefined!206 (getValueByKey!266 (toList!1746 lt!118650) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234677 () Bool)

(declare-fun Unit!7228 () Unit!7223)

(assert (=> b!234677 (= e!152413 Unit!7228)))

(declare-fun b!234678 () Bool)

(assert (=> b!234678 (= e!152414 (isDefined!206 (getValueByKey!266 (toList!1746 lt!118650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59231 c!39101) b!234676))

(assert (= (and d!59231 (not c!39101)) b!234677))

(assert (= (and d!59231 (not res!115097)) b!234678))

(declare-fun m!256091 () Bool)

(assert (=> d!59231 m!256091))

(declare-fun m!256093 () Bool)

(assert (=> b!234676 m!256093))

(assert (=> b!234676 m!256079))

(assert (=> b!234676 m!256079))

(declare-fun m!256095 () Bool)

(assert (=> b!234676 m!256095))

(assert (=> b!234678 m!256079))

(assert (=> b!234678 m!256079))

(assert (=> b!234678 m!256095))

(assert (=> bm!21788 d!59231))

(declare-fun d!59233 () Bool)

(declare-fun e!152416 () Bool)

(assert (=> d!59233 e!152416))

(declare-fun res!115098 () Bool)

(assert (=> d!59233 (=> res!115098 e!152416)))

(declare-fun lt!118768 () Bool)

(assert (=> d!59233 (= res!115098 (not lt!118768))))

(declare-fun lt!118770 () Bool)

(assert (=> d!59233 (= lt!118768 lt!118770)))

(declare-fun lt!118767 () Unit!7223)

(declare-fun e!152415 () Unit!7223)

(assert (=> d!59233 (= lt!118767 e!152415)))

(declare-fun c!39102 () Bool)

(assert (=> d!59233 (= c!39102 lt!118770)))

(assert (=> d!59233 (= lt!118770 (containsKey!257 (toList!1746 lt!118650) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59233 (= (contains!1632 lt!118650 #b0000000000000000000000000000000000000000000000000000000000000000) lt!118768)))

(declare-fun b!234679 () Bool)

(declare-fun lt!118769 () Unit!7223)

(assert (=> b!234679 (= e!152415 lt!118769)))

(assert (=> b!234679 (= lt!118769 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1746 lt!118650) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234679 (isDefined!206 (getValueByKey!266 (toList!1746 lt!118650) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234680 () Bool)

(declare-fun Unit!7229 () Unit!7223)

(assert (=> b!234680 (= e!152415 Unit!7229)))

(declare-fun b!234681 () Bool)

(assert (=> b!234681 (= e!152416 (isDefined!206 (getValueByKey!266 (toList!1746 lt!118650) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59233 c!39102) b!234679))

(assert (= (and d!59233 (not c!39102)) b!234680))

(assert (= (and d!59233 (not res!115098)) b!234681))

(declare-fun m!256097 () Bool)

(assert (=> d!59233 m!256097))

(declare-fun m!256099 () Bool)

(assert (=> b!234679 m!256099))

(assert (=> b!234679 m!255893))

(assert (=> b!234679 m!255893))

(declare-fun m!256101 () Bool)

(assert (=> b!234679 m!256101))

(assert (=> b!234681 m!255893))

(assert (=> b!234681 m!255893))

(assert (=> b!234681 m!256101))

(assert (=> bm!21787 d!59233))

(declare-fun d!59235 () Bool)

(declare-fun e!152418 () Bool)

(assert (=> d!59235 e!152418))

(declare-fun res!115099 () Bool)

(assert (=> d!59235 (=> res!115099 e!152418)))

(declare-fun lt!118772 () Bool)

(assert (=> d!59235 (= res!115099 (not lt!118772))))

(declare-fun lt!118774 () Bool)

(assert (=> d!59235 (= lt!118772 lt!118774)))

(declare-fun lt!118771 () Unit!7223)

(declare-fun e!152417 () Unit!7223)

(assert (=> d!59235 (= lt!118771 e!152417)))

(declare-fun c!39103 () Bool)

(assert (=> d!59235 (= c!39103 lt!118774)))

(assert (=> d!59235 (= lt!118774 (containsKey!257 (toList!1746 lt!118650) (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59235 (= (contains!1632 lt!118650 (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)) lt!118772)))

(declare-fun b!234682 () Bool)

(declare-fun lt!118773 () Unit!7223)

(assert (=> b!234682 (= e!152417 lt!118773)))

(assert (=> b!234682 (= lt!118773 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1746 lt!118650) (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234682 (isDefined!206 (getValueByKey!266 (toList!1746 lt!118650) (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234683 () Bool)

(declare-fun Unit!7230 () Unit!7223)

(assert (=> b!234683 (= e!152417 Unit!7230)))

(declare-fun b!234684 () Bool)

(assert (=> b!234684 (= e!152418 (isDefined!206 (getValueByKey!266 (toList!1746 lt!118650) (select (arr!5510 (_keys!6420 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59235 c!39103) b!234682))

(assert (= (and d!59235 (not c!39103)) b!234683))

(assert (= (and d!59235 (not res!115099)) b!234684))

(assert (=> d!59235 m!255867))

(declare-fun m!256103 () Bool)

(assert (=> d!59235 m!256103))

(assert (=> b!234682 m!255867))

(declare-fun m!256105 () Bool)

(assert (=> b!234682 m!256105))

(assert (=> b!234682 m!255867))

(assert (=> b!234682 m!255901))

(assert (=> b!234682 m!255901))

(declare-fun m!256107 () Bool)

(assert (=> b!234682 m!256107))

(assert (=> b!234684 m!255867))

(assert (=> b!234684 m!255901))

(assert (=> b!234684 m!255901))

(assert (=> b!234684 m!256107))

(assert (=> b!234467 d!59235))

(assert (=> b!234417 d!59209))

(assert (=> b!234417 d!59211))

(assert (=> d!59161 d!59157))

(assert (=> b!234476 d!59225))

(declare-fun mapNonEmpty!10447 () Bool)

(declare-fun mapRes!10447 () Bool)

(declare-fun tp!22093 () Bool)

(declare-fun e!152420 () Bool)

(assert (=> mapNonEmpty!10447 (= mapRes!10447 (and tp!22093 e!152420))))

(declare-fun mapKey!10447 () (_ BitVec 32))

(declare-fun mapRest!10447 () (Array (_ BitVec 32) ValueCell!2741))

(declare-fun mapValue!10447 () ValueCell!2741)

(assert (=> mapNonEmpty!10447 (= mapRest!10446 (store mapRest!10447 mapKey!10447 mapValue!10447))))

(declare-fun b!234686 () Bool)

(declare-fun e!152419 () Bool)

(assert (=> b!234686 (= e!152419 tp_is_empty!6169)))

(declare-fun mapIsEmpty!10447 () Bool)

(assert (=> mapIsEmpty!10447 mapRes!10447))

(declare-fun condMapEmpty!10447 () Bool)

(declare-fun mapDefault!10447 () ValueCell!2741)

(assert (=> mapNonEmpty!10446 (= condMapEmpty!10447 (= mapRest!10446 ((as const (Array (_ BitVec 32) ValueCell!2741)) mapDefault!10447)))))

(assert (=> mapNonEmpty!10446 (= tp!22092 (and e!152419 mapRes!10447))))

(declare-fun b!234685 () Bool)

(assert (=> b!234685 (= e!152420 tp_is_empty!6169)))

(assert (= (and mapNonEmpty!10446 condMapEmpty!10447) mapIsEmpty!10447))

(assert (= (and mapNonEmpty!10446 (not condMapEmpty!10447)) mapNonEmpty!10447))

(assert (= (and mapNonEmpty!10447 ((_ is ValueCellFull!2741) mapValue!10447)) b!234685))

(assert (= (and mapNonEmpty!10446 ((_ is ValueCellFull!2741) mapDefault!10447)) b!234686))

(declare-fun m!256109 () Bool)

(assert (=> mapNonEmpty!10447 m!256109))

(declare-fun b_lambda!7905 () Bool)

(assert (= b_lambda!7901 (or (and b!234323 b_free!6307) b_lambda!7905)))

(declare-fun b_lambda!7907 () Bool)

(assert (= b_lambda!7903 (or (and b!234323 b_free!6307) b_lambda!7907)))

(check-sat (not b!234657) (not d!59193) (not d!59201) (not d!59229) (not b!234643) (not b!234577) (not d!59227) (not d!59215) (not d!59197) (not d!59223) (not b!234501) (not b!234679) (not d!59235) (not b_lambda!7907) (not b!234599) (not bm!21798) (not d!59205) (not d!59233) (not b!234594) (not d!59231) (not d!59177) (not b!234684) (not b_lambda!7905) (not b!234591) (not d!59209) (not d!59195) (not d!59199) (not d!59175) (not b!234635) (not b!234596) (not b!234637) (not d!59189) (not b!234682) (not d!59187) (not b_lambda!7899) (not b!234579) (not d!59207) (not b!234580) (not d!59171) (not b!234676) (not b!234511) (not b!234656) (not b_next!6307) (not b!234575) (not bm!21801) (not b!234510) (not mapNonEmpty!10447) (not b!234548) (not b!234574) (not b!234503) (not b!234586) tp_is_empty!6169 (not b!234592) (not b!234622) (not d!59163) (not b!234504) (not b!234576) (not b!234624) (not b!234672) (not b!234652) (not b!234678) (not b!234585) (not b!234587) (not bm!21804) (not b!234588) (not d!59203) (not d!59213) (not d!59185) (not d!59167) (not bm!21795) (not b!234549) (not d!59191) (not b!234531) (not d!59179) (not b!234610) (not b!234681) (not d!59181) b_and!13245 (not b!234621) (not b!234625) (not d!59183) (not b!234589) (not b!234582))
(check-sat b_and!13245 (not b_next!6307))
