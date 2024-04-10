; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22370 () Bool)

(assert start!22370)

(declare-fun b!234306 () Bool)

(declare-fun b_free!6309 () Bool)

(declare-fun b_next!6309 () Bool)

(assert (=> b!234306 (= b_free!6309 (not b_next!6309))))

(declare-fun tp!22082 () Bool)

(declare-fun b_and!13223 () Bool)

(assert (=> b!234306 (= tp!22082 b_and!13223)))

(declare-fun b!234299 () Bool)

(declare-fun res!114938 () Bool)

(declare-fun e!152191 () Bool)

(assert (=> b!234299 (=> (not res!114938) (not e!152191))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!234299 (= res!114938 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234300 () Bool)

(declare-fun e!152195 () Bool)

(declare-fun e!152192 () Bool)

(declare-fun mapRes!10440 () Bool)

(assert (=> b!234300 (= e!152195 (and e!152192 mapRes!10440))))

(declare-fun condMapEmpty!10440 () Bool)

(declare-datatypes ((V!7875 0))(
  ( (V!7876 (val!3130 Int)) )
))
(declare-datatypes ((ValueCell!2742 0))(
  ( (ValueCellFull!2742 (v!5154 V!7875)) (EmptyCell!2742) )
))
(declare-datatypes ((array!11593 0))(
  ( (array!11594 (arr!5512 (Array (_ BitVec 32) ValueCell!2742)) (size!5847 (_ BitVec 32))) )
))
(declare-datatypes ((array!11595 0))(
  ( (array!11596 (arr!5513 (Array (_ BitVec 32) (_ BitVec 64))) (size!5848 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3384 0))(
  ( (LongMapFixedSize!3385 (defaultEntry!4357 Int) (mask!10303 (_ BitVec 32)) (extraKeys!4094 (_ BitVec 32)) (zeroValue!4198 V!7875) (minValue!4198 V!7875) (_size!1741 (_ BitVec 32)) (_keys!6421 array!11595) (_values!4340 array!11593) (_vacant!1741 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3384)

(declare-fun mapDefault!10440 () ValueCell!2742)

(assert (=> b!234300 (= condMapEmpty!10440 (= (arr!5512 (_values!4340 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2742)) mapDefault!10440)))))

(declare-fun b!234301 () Bool)

(declare-fun res!114941 () Bool)

(declare-fun e!152193 () Bool)

(assert (=> b!234301 (=> (not res!114941) (not e!152193))))

(declare-datatypes ((tuple2!4614 0))(
  ( (tuple2!4615 (_1!2318 (_ BitVec 64)) (_2!2318 V!7875)) )
))
(declare-datatypes ((List!3524 0))(
  ( (Nil!3521) (Cons!3520 (h!4170 tuple2!4614) (t!8491 List!3524)) )
))
(declare-datatypes ((ListLongMap!3527 0))(
  ( (ListLongMap!3528 (toList!1779 List!3524)) )
))
(declare-fun contains!1651 (ListLongMap!3527 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1307 (array!11595 array!11593 (_ BitVec 32) (_ BitVec 32) V!7875 V!7875 (_ BitVec 32) Int) ListLongMap!3527)

(assert (=> b!234301 (= res!114941 (contains!1651 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)) key!932))))

(declare-fun res!114937 () Bool)

(assert (=> start!22370 (=> (not res!114937) (not e!152191))))

(declare-fun valid!1336 (LongMapFixedSize!3384) Bool)

(assert (=> start!22370 (= res!114937 (valid!1336 thiss!1504))))

(assert (=> start!22370 e!152191))

(declare-fun e!152190 () Bool)

(assert (=> start!22370 e!152190))

(assert (=> start!22370 true))

(declare-fun b!234302 () Bool)

(declare-fun res!114939 () Bool)

(assert (=> b!234302 (=> (not res!114939) (not e!152193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234302 (= res!114939 (validMask!0 (mask!10303 thiss!1504)))))

(declare-fun mapIsEmpty!10440 () Bool)

(assert (=> mapIsEmpty!10440 mapRes!10440))

(declare-fun b!234303 () Bool)

(declare-fun tp_is_empty!6171 () Bool)

(assert (=> b!234303 (= e!152192 tp_is_empty!6171)))

(declare-fun mapNonEmpty!10440 () Bool)

(declare-fun tp!22083 () Bool)

(declare-fun e!152194 () Bool)

(assert (=> mapNonEmpty!10440 (= mapRes!10440 (and tp!22083 e!152194))))

(declare-fun mapRest!10440 () (Array (_ BitVec 32) ValueCell!2742))

(declare-fun mapKey!10440 () (_ BitVec 32))

(declare-fun mapValue!10440 () ValueCell!2742)

(assert (=> mapNonEmpty!10440 (= (arr!5512 (_values!4340 thiss!1504)) (store mapRest!10440 mapKey!10440 mapValue!10440))))

(declare-fun b!234304 () Bool)

(assert (=> b!234304 (= e!152193 (and (= (size!5847 (_values!4340 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10303 thiss!1504))) (= (size!5848 (_keys!6421 thiss!1504)) (size!5847 (_values!4340 thiss!1504))) (bvsge (mask!10303 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4094 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!234305 () Bool)

(assert (=> b!234305 (= e!152191 e!152193)))

(declare-fun res!114940 () Bool)

(assert (=> b!234305 (=> (not res!114940) (not e!152193))))

(declare-datatypes ((SeekEntryResult!980 0))(
  ( (MissingZero!980 (index!6090 (_ BitVec 32))) (Found!980 (index!6091 (_ BitVec 32))) (Intermediate!980 (undefined!1792 Bool) (index!6092 (_ BitVec 32)) (x!23696 (_ BitVec 32))) (Undefined!980) (MissingVacant!980 (index!6093 (_ BitVec 32))) )
))
(declare-fun lt!118515 () SeekEntryResult!980)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!234305 (= res!114940 (or (= lt!118515 (MissingZero!980 index!297)) (= lt!118515 (MissingVacant!980 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11595 (_ BitVec 32)) SeekEntryResult!980)

(assert (=> b!234305 (= lt!118515 (seekEntryOrOpen!0 key!932 (_keys!6421 thiss!1504) (mask!10303 thiss!1504)))))

(declare-fun array_inv!3633 (array!11595) Bool)

(declare-fun array_inv!3634 (array!11593) Bool)

(assert (=> b!234306 (= e!152190 (and tp!22082 tp_is_empty!6171 (array_inv!3633 (_keys!6421 thiss!1504)) (array_inv!3634 (_values!4340 thiss!1504)) e!152195))))

(declare-fun b!234307 () Bool)

(assert (=> b!234307 (= e!152194 tp_is_empty!6171)))

(assert (= (and start!22370 res!114937) b!234299))

(assert (= (and b!234299 res!114938) b!234305))

(assert (= (and b!234305 res!114940) b!234301))

(assert (= (and b!234301 res!114941) b!234302))

(assert (= (and b!234302 res!114939) b!234304))

(assert (= (and b!234300 condMapEmpty!10440) mapIsEmpty!10440))

(assert (= (and b!234300 (not condMapEmpty!10440)) mapNonEmpty!10440))

(get-info :version)

(assert (= (and mapNonEmpty!10440 ((_ is ValueCellFull!2742) mapValue!10440)) b!234307))

(assert (= (and b!234300 ((_ is ValueCellFull!2742) mapDefault!10440)) b!234303))

(assert (= b!234306 b!234300))

(assert (= start!22370 b!234306))

(declare-fun m!255589 () Bool)

(assert (=> b!234306 m!255589))

(declare-fun m!255591 () Bool)

(assert (=> b!234306 m!255591))

(declare-fun m!255593 () Bool)

(assert (=> b!234302 m!255593))

(declare-fun m!255595 () Bool)

(assert (=> b!234305 m!255595))

(declare-fun m!255597 () Bool)

(assert (=> mapNonEmpty!10440 m!255597))

(declare-fun m!255599 () Bool)

(assert (=> start!22370 m!255599))

(declare-fun m!255601 () Bool)

(assert (=> b!234301 m!255601))

(assert (=> b!234301 m!255601))

(declare-fun m!255603 () Bool)

(assert (=> b!234301 m!255603))

(check-sat (not start!22370) (not mapNonEmpty!10440) (not b_next!6309) (not b!234305) (not b!234306) (not b!234302) (not b!234301) b_and!13223 tp_is_empty!6171)
(check-sat b_and!13223 (not b_next!6309))
(get-model)

(declare-fun b!234347 () Bool)

(declare-fun e!152224 () SeekEntryResult!980)

(declare-fun lt!118527 () SeekEntryResult!980)

(assert (=> b!234347 (= e!152224 (MissingZero!980 (index!6092 lt!118527)))))

(declare-fun b!234348 () Bool)

(declare-fun c!39012 () Bool)

(declare-fun lt!118526 () (_ BitVec 64))

(assert (=> b!234348 (= c!39012 (= lt!118526 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152226 () SeekEntryResult!980)

(assert (=> b!234348 (= e!152226 e!152224)))

(declare-fun b!234349 () Bool)

(declare-fun e!152225 () SeekEntryResult!980)

(assert (=> b!234349 (= e!152225 e!152226)))

(assert (=> b!234349 (= lt!118526 (select (arr!5513 (_keys!6421 thiss!1504)) (index!6092 lt!118527)))))

(declare-fun c!39014 () Bool)

(assert (=> b!234349 (= c!39014 (= lt!118526 key!932))))

(declare-fun b!234351 () Bool)

(assert (=> b!234351 (= e!152225 Undefined!980)))

(declare-fun b!234352 () Bool)

(assert (=> b!234352 (= e!152226 (Found!980 (index!6092 lt!118527)))))

(declare-fun b!234350 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11595 (_ BitVec 32)) SeekEntryResult!980)

(assert (=> b!234350 (= e!152224 (seekKeyOrZeroReturnVacant!0 (x!23696 lt!118527) (index!6092 lt!118527) (index!6092 lt!118527) key!932 (_keys!6421 thiss!1504) (mask!10303 thiss!1504)))))

(declare-fun d!59075 () Bool)

(declare-fun lt!118525 () SeekEntryResult!980)

(assert (=> d!59075 (and (or ((_ is Undefined!980) lt!118525) (not ((_ is Found!980) lt!118525)) (and (bvsge (index!6091 lt!118525) #b00000000000000000000000000000000) (bvslt (index!6091 lt!118525) (size!5848 (_keys!6421 thiss!1504))))) (or ((_ is Undefined!980) lt!118525) ((_ is Found!980) lt!118525) (not ((_ is MissingZero!980) lt!118525)) (and (bvsge (index!6090 lt!118525) #b00000000000000000000000000000000) (bvslt (index!6090 lt!118525) (size!5848 (_keys!6421 thiss!1504))))) (or ((_ is Undefined!980) lt!118525) ((_ is Found!980) lt!118525) ((_ is MissingZero!980) lt!118525) (not ((_ is MissingVacant!980) lt!118525)) (and (bvsge (index!6093 lt!118525) #b00000000000000000000000000000000) (bvslt (index!6093 lt!118525) (size!5848 (_keys!6421 thiss!1504))))) (or ((_ is Undefined!980) lt!118525) (ite ((_ is Found!980) lt!118525) (= (select (arr!5513 (_keys!6421 thiss!1504)) (index!6091 lt!118525)) key!932) (ite ((_ is MissingZero!980) lt!118525) (= (select (arr!5513 (_keys!6421 thiss!1504)) (index!6090 lt!118525)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!980) lt!118525) (= (select (arr!5513 (_keys!6421 thiss!1504)) (index!6093 lt!118525)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59075 (= lt!118525 e!152225)))

(declare-fun c!39013 () Bool)

(assert (=> d!59075 (= c!39013 (and ((_ is Intermediate!980) lt!118527) (undefined!1792 lt!118527)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11595 (_ BitVec 32)) SeekEntryResult!980)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59075 (= lt!118527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10303 thiss!1504)) key!932 (_keys!6421 thiss!1504) (mask!10303 thiss!1504)))))

(assert (=> d!59075 (validMask!0 (mask!10303 thiss!1504))))

(assert (=> d!59075 (= (seekEntryOrOpen!0 key!932 (_keys!6421 thiss!1504) (mask!10303 thiss!1504)) lt!118525)))

(assert (= (and d!59075 c!39013) b!234351))

(assert (= (and d!59075 (not c!39013)) b!234349))

(assert (= (and b!234349 c!39014) b!234352))

(assert (= (and b!234349 (not c!39014)) b!234348))

(assert (= (and b!234348 c!39012) b!234347))

(assert (= (and b!234348 (not c!39012)) b!234350))

(declare-fun m!255621 () Bool)

(assert (=> b!234349 m!255621))

(declare-fun m!255623 () Bool)

(assert (=> b!234350 m!255623))

(assert (=> d!59075 m!255593))

(declare-fun m!255625 () Bool)

(assert (=> d!59075 m!255625))

(declare-fun m!255627 () Bool)

(assert (=> d!59075 m!255627))

(declare-fun m!255629 () Bool)

(assert (=> d!59075 m!255629))

(declare-fun m!255631 () Bool)

(assert (=> d!59075 m!255631))

(assert (=> d!59075 m!255629))

(declare-fun m!255633 () Bool)

(assert (=> d!59075 m!255633))

(assert (=> b!234305 d!59075))

(declare-fun d!59077 () Bool)

(declare-fun res!114963 () Bool)

(declare-fun e!152229 () Bool)

(assert (=> d!59077 (=> (not res!114963) (not e!152229))))

(declare-fun simpleValid!230 (LongMapFixedSize!3384) Bool)

(assert (=> d!59077 (= res!114963 (simpleValid!230 thiss!1504))))

(assert (=> d!59077 (= (valid!1336 thiss!1504) e!152229)))

(declare-fun b!234359 () Bool)

(declare-fun res!114964 () Bool)

(assert (=> b!234359 (=> (not res!114964) (not e!152229))))

(declare-fun arrayCountValidKeys!0 (array!11595 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234359 (= res!114964 (= (arrayCountValidKeys!0 (_keys!6421 thiss!1504) #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))) (_size!1741 thiss!1504)))))

(declare-fun b!234360 () Bool)

(declare-fun res!114965 () Bool)

(assert (=> b!234360 (=> (not res!114965) (not e!152229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11595 (_ BitVec 32)) Bool)

(assert (=> b!234360 (= res!114965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6421 thiss!1504) (mask!10303 thiss!1504)))))

(declare-fun b!234361 () Bool)

(declare-datatypes ((List!3525 0))(
  ( (Nil!3522) (Cons!3521 (h!4171 (_ BitVec 64)) (t!8494 List!3525)) )
))
(declare-fun arrayNoDuplicates!0 (array!11595 (_ BitVec 32) List!3525) Bool)

(assert (=> b!234361 (= e!152229 (arrayNoDuplicates!0 (_keys!6421 thiss!1504) #b00000000000000000000000000000000 Nil!3522))))

(assert (= (and d!59077 res!114963) b!234359))

(assert (= (and b!234359 res!114964) b!234360))

(assert (= (and b!234360 res!114965) b!234361))

(declare-fun m!255635 () Bool)

(assert (=> d!59077 m!255635))

(declare-fun m!255637 () Bool)

(assert (=> b!234359 m!255637))

(declare-fun m!255639 () Bool)

(assert (=> b!234360 m!255639))

(declare-fun m!255641 () Bool)

(assert (=> b!234361 m!255641))

(assert (=> start!22370 d!59077))

(declare-fun d!59079 () Bool)

(assert (=> d!59079 (= (validMask!0 (mask!10303 thiss!1504)) (and (or (= (mask!10303 thiss!1504) #b00000000000000000000000000000111) (= (mask!10303 thiss!1504) #b00000000000000000000000000001111) (= (mask!10303 thiss!1504) #b00000000000000000000000000011111) (= (mask!10303 thiss!1504) #b00000000000000000000000000111111) (= (mask!10303 thiss!1504) #b00000000000000000000000001111111) (= (mask!10303 thiss!1504) #b00000000000000000000000011111111) (= (mask!10303 thiss!1504) #b00000000000000000000000111111111) (= (mask!10303 thiss!1504) #b00000000000000000000001111111111) (= (mask!10303 thiss!1504) #b00000000000000000000011111111111) (= (mask!10303 thiss!1504) #b00000000000000000000111111111111) (= (mask!10303 thiss!1504) #b00000000000000000001111111111111) (= (mask!10303 thiss!1504) #b00000000000000000011111111111111) (= (mask!10303 thiss!1504) #b00000000000000000111111111111111) (= (mask!10303 thiss!1504) #b00000000000000001111111111111111) (= (mask!10303 thiss!1504) #b00000000000000011111111111111111) (= (mask!10303 thiss!1504) #b00000000000000111111111111111111) (= (mask!10303 thiss!1504) #b00000000000001111111111111111111) (= (mask!10303 thiss!1504) #b00000000000011111111111111111111) (= (mask!10303 thiss!1504) #b00000000000111111111111111111111) (= (mask!10303 thiss!1504) #b00000000001111111111111111111111) (= (mask!10303 thiss!1504) #b00000000011111111111111111111111) (= (mask!10303 thiss!1504) #b00000000111111111111111111111111) (= (mask!10303 thiss!1504) #b00000001111111111111111111111111) (= (mask!10303 thiss!1504) #b00000011111111111111111111111111) (= (mask!10303 thiss!1504) #b00000111111111111111111111111111) (= (mask!10303 thiss!1504) #b00001111111111111111111111111111) (= (mask!10303 thiss!1504) #b00011111111111111111111111111111) (= (mask!10303 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10303 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!234302 d!59079))

(declare-fun d!59081 () Bool)

(declare-fun e!152235 () Bool)

(assert (=> d!59081 e!152235))

(declare-fun res!114968 () Bool)

(assert (=> d!59081 (=> res!114968 e!152235)))

(declare-fun lt!118538 () Bool)

(assert (=> d!59081 (= res!114968 (not lt!118538))))

(declare-fun lt!118537 () Bool)

(assert (=> d!59081 (= lt!118538 lt!118537)))

(declare-datatypes ((Unit!7234 0))(
  ( (Unit!7235) )
))
(declare-fun lt!118539 () Unit!7234)

(declare-fun e!152234 () Unit!7234)

(assert (=> d!59081 (= lt!118539 e!152234)))

(declare-fun c!39017 () Bool)

(assert (=> d!59081 (= c!39017 lt!118537)))

(declare-fun containsKey!257 (List!3524 (_ BitVec 64)) Bool)

(assert (=> d!59081 (= lt!118537 (containsKey!257 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))) key!932))))

(assert (=> d!59081 (= (contains!1651 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)) key!932) lt!118538)))

(declare-fun b!234368 () Bool)

(declare-fun lt!118536 () Unit!7234)

(assert (=> b!234368 (= e!152234 lt!118536)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!205 (List!3524 (_ BitVec 64)) Unit!7234)

(assert (=> b!234368 (= lt!118536 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))) key!932))))

(declare-datatypes ((Option!271 0))(
  ( (Some!270 (v!5156 V!7875)) (None!269) )
))
(declare-fun isDefined!206 (Option!271) Bool)

(declare-fun getValueByKey!265 (List!3524 (_ BitVec 64)) Option!271)

(assert (=> b!234368 (isDefined!206 (getValueByKey!265 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))) key!932))))

(declare-fun b!234369 () Bool)

(declare-fun Unit!7236 () Unit!7234)

(assert (=> b!234369 (= e!152234 Unit!7236)))

(declare-fun b!234370 () Bool)

(assert (=> b!234370 (= e!152235 (isDefined!206 (getValueByKey!265 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))) key!932)))))

(assert (= (and d!59081 c!39017) b!234368))

(assert (= (and d!59081 (not c!39017)) b!234369))

(assert (= (and d!59081 (not res!114968)) b!234370))

(declare-fun m!255643 () Bool)

(assert (=> d!59081 m!255643))

(declare-fun m!255645 () Bool)

(assert (=> b!234368 m!255645))

(declare-fun m!255647 () Bool)

(assert (=> b!234368 m!255647))

(assert (=> b!234368 m!255647))

(declare-fun m!255649 () Bool)

(assert (=> b!234368 m!255649))

(assert (=> b!234370 m!255647))

(assert (=> b!234370 m!255647))

(assert (=> b!234370 m!255649))

(assert (=> b!234301 d!59081))

(declare-fun b!234413 () Bool)

(declare-fun e!152263 () Bool)

(declare-fun e!152269 () Bool)

(assert (=> b!234413 (= e!152263 e!152269)))

(declare-fun res!114987 () Bool)

(assert (=> b!234413 (=> (not res!114987) (not e!152269))))

(declare-fun lt!118590 () ListLongMap!3527)

(assert (=> b!234413 (= res!114987 (contains!1651 lt!118590 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))

(declare-fun b!234414 () Bool)

(declare-fun e!152271 () Bool)

(declare-fun call!21804 () Bool)

(assert (=> b!234414 (= e!152271 (not call!21804))))

(declare-fun bm!21798 () Bool)

(assert (=> bm!21798 (= call!21804 (contains!1651 lt!118590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234415 () Bool)

(declare-fun e!152266 () Bool)

(declare-fun e!152270 () Bool)

(assert (=> b!234415 (= e!152266 e!152270)))

(declare-fun res!114990 () Bool)

(declare-fun call!21801 () Bool)

(assert (=> b!234415 (= res!114990 call!21801)))

(assert (=> b!234415 (=> (not res!114990) (not e!152270))))

(declare-fun b!234416 () Bool)

(declare-fun e!152272 () Bool)

(declare-fun apply!207 (ListLongMap!3527 (_ BitVec 64)) V!7875)

(assert (=> b!234416 (= e!152272 (= (apply!207 lt!118590 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4198 thiss!1504)))))

(declare-fun b!234417 () Bool)

(declare-fun get!2828 (ValueCell!2742 V!7875) V!7875)

(declare-fun dynLambda!550 (Int (_ BitVec 64)) V!7875)

(assert (=> b!234417 (= e!152269 (= (apply!207 lt!118590 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)) (get!2828 (select (arr!5512 (_values!4340 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4357 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5847 (_values!4340 thiss!1504))))))

(assert (=> b!234417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))

(declare-fun b!234418 () Bool)

(declare-fun e!152273 () ListLongMap!3527)

(declare-fun call!21807 () ListLongMap!3527)

(assert (=> b!234418 (= e!152273 call!21807)))

(declare-fun b!234419 () Bool)

(declare-fun e!152265 () Unit!7234)

(declare-fun lt!118585 () Unit!7234)

(assert (=> b!234419 (= e!152265 lt!118585)))

(declare-fun lt!118591 () ListLongMap!3527)

(declare-fun getCurrentListMapNoExtraKeys!529 (array!11595 array!11593 (_ BitVec 32) (_ BitVec 32) V!7875 V!7875 (_ BitVec 32) Int) ListLongMap!3527)

(assert (=> b!234419 (= lt!118591 (getCurrentListMapNoExtraKeys!529 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))))

(declare-fun lt!118595 () (_ BitVec 64))

(assert (=> b!234419 (= lt!118595 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118605 () (_ BitVec 64))

(assert (=> b!234419 (= lt!118605 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118588 () Unit!7234)

(declare-fun addStillContains!183 (ListLongMap!3527 (_ BitVec 64) V!7875 (_ BitVec 64)) Unit!7234)

(assert (=> b!234419 (= lt!118588 (addStillContains!183 lt!118591 lt!118595 (zeroValue!4198 thiss!1504) lt!118605))))

(declare-fun +!634 (ListLongMap!3527 tuple2!4614) ListLongMap!3527)

(assert (=> b!234419 (contains!1651 (+!634 lt!118591 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504))) lt!118605)))

(declare-fun lt!118604 () Unit!7234)

(assert (=> b!234419 (= lt!118604 lt!118588)))

(declare-fun lt!118603 () ListLongMap!3527)

(assert (=> b!234419 (= lt!118603 (getCurrentListMapNoExtraKeys!529 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))))

(declare-fun lt!118601 () (_ BitVec 64))

(assert (=> b!234419 (= lt!118601 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118599 () (_ BitVec 64))

(assert (=> b!234419 (= lt!118599 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118586 () Unit!7234)

(declare-fun addApplyDifferent!183 (ListLongMap!3527 (_ BitVec 64) V!7875 (_ BitVec 64)) Unit!7234)

(assert (=> b!234419 (= lt!118586 (addApplyDifferent!183 lt!118603 lt!118601 (minValue!4198 thiss!1504) lt!118599))))

(assert (=> b!234419 (= (apply!207 (+!634 lt!118603 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504))) lt!118599) (apply!207 lt!118603 lt!118599))))

(declare-fun lt!118598 () Unit!7234)

(assert (=> b!234419 (= lt!118598 lt!118586)))

(declare-fun lt!118592 () ListLongMap!3527)

(assert (=> b!234419 (= lt!118592 (getCurrentListMapNoExtraKeys!529 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))))

(declare-fun lt!118596 () (_ BitVec 64))

(assert (=> b!234419 (= lt!118596 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118593 () (_ BitVec 64))

(assert (=> b!234419 (= lt!118593 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118597 () Unit!7234)

(assert (=> b!234419 (= lt!118597 (addApplyDifferent!183 lt!118592 lt!118596 (zeroValue!4198 thiss!1504) lt!118593))))

(assert (=> b!234419 (= (apply!207 (+!634 lt!118592 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504))) lt!118593) (apply!207 lt!118592 lt!118593))))

(declare-fun lt!118602 () Unit!7234)

(assert (=> b!234419 (= lt!118602 lt!118597)))

(declare-fun lt!118594 () ListLongMap!3527)

(assert (=> b!234419 (= lt!118594 (getCurrentListMapNoExtraKeys!529 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))))

(declare-fun lt!118589 () (_ BitVec 64))

(assert (=> b!234419 (= lt!118589 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118600 () (_ BitVec 64))

(assert (=> b!234419 (= lt!118600 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234419 (= lt!118585 (addApplyDifferent!183 lt!118594 lt!118589 (minValue!4198 thiss!1504) lt!118600))))

(assert (=> b!234419 (= (apply!207 (+!634 lt!118594 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504))) lt!118600) (apply!207 lt!118594 lt!118600))))

(declare-fun b!234420 () Bool)

(assert (=> b!234420 (= e!152271 e!152272)))

(declare-fun res!114995 () Bool)

(assert (=> b!234420 (= res!114995 call!21804)))

(assert (=> b!234420 (=> (not res!114995) (not e!152272))))

(declare-fun d!59083 () Bool)

(declare-fun e!152264 () Bool)

(assert (=> d!59083 e!152264))

(declare-fun res!114991 () Bool)

(assert (=> d!59083 (=> (not res!114991) (not e!152264))))

(assert (=> d!59083 (= res!114991 (or (bvsge #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))))

(declare-fun lt!118584 () ListLongMap!3527)

(assert (=> d!59083 (= lt!118590 lt!118584)))

(declare-fun lt!118587 () Unit!7234)

(assert (=> d!59083 (= lt!118587 e!152265)))

(declare-fun c!39035 () Bool)

(declare-fun e!152268 () Bool)

(assert (=> d!59083 (= c!39035 e!152268)))

(declare-fun res!114993 () Bool)

(assert (=> d!59083 (=> (not res!114993) (not e!152268))))

(assert (=> d!59083 (= res!114993 (bvslt #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))

(declare-fun e!152262 () ListLongMap!3527)

(assert (=> d!59083 (= lt!118584 e!152262)))

(declare-fun c!39030 () Bool)

(assert (=> d!59083 (= c!39030 (and (not (= (bvand (extraKeys!4094 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4094 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59083 (validMask!0 (mask!10303 thiss!1504))))

(assert (=> d!59083 (= (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)) lt!118590)))

(declare-fun b!234421 () Bool)

(declare-fun e!152274 () ListLongMap!3527)

(declare-fun call!21805 () ListLongMap!3527)

(assert (=> b!234421 (= e!152274 call!21805)))

(declare-fun b!234422 () Bool)

(assert (=> b!234422 (= e!152264 e!152266)))

(declare-fun c!39032 () Bool)

(assert (=> b!234422 (= c!39032 (not (= (bvand (extraKeys!4094 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234423 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!234423 (= e!152268 (validKeyInArray!0 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234424 () Bool)

(assert (=> b!234424 (= e!152262 e!152274)))

(declare-fun c!39033 () Bool)

(assert (=> b!234424 (= c!39033 (and (not (= (bvand (extraKeys!4094 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4094 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234425 () Bool)

(assert (=> b!234425 (= e!152270 (= (apply!207 lt!118590 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4198 thiss!1504)))))

(declare-fun b!234426 () Bool)

(declare-fun e!152267 () Bool)

(assert (=> b!234426 (= e!152267 (validKeyInArray!0 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21799 () Bool)

(declare-fun call!21803 () ListLongMap!3527)

(assert (=> bm!21799 (= call!21803 (getCurrentListMapNoExtraKeys!529 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))))

(declare-fun b!234427 () Bool)

(assert (=> b!234427 (= e!152273 call!21805)))

(declare-fun b!234428 () Bool)

(declare-fun c!39034 () Bool)

(assert (=> b!234428 (= c!39034 (and (not (= (bvand (extraKeys!4094 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4094 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!234428 (= e!152274 e!152273)))

(declare-fun b!234429 () Bool)

(declare-fun res!114989 () Bool)

(assert (=> b!234429 (=> (not res!114989) (not e!152264))))

(assert (=> b!234429 (= res!114989 e!152271)))

(declare-fun c!39031 () Bool)

(assert (=> b!234429 (= c!39031 (not (= (bvand (extraKeys!4094 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!21800 () Bool)

(declare-fun call!21802 () ListLongMap!3527)

(declare-fun call!21806 () ListLongMap!3527)

(assert (=> bm!21800 (= call!21802 (+!634 (ite c!39030 call!21803 (ite c!39033 call!21806 call!21807)) (ite (or c!39030 c!39033) (tuple2!4615 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4198 thiss!1504)) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504)))))))

(declare-fun b!234430 () Bool)

(declare-fun res!114988 () Bool)

(assert (=> b!234430 (=> (not res!114988) (not e!152264))))

(assert (=> b!234430 (= res!114988 e!152263)))

(declare-fun res!114992 () Bool)

(assert (=> b!234430 (=> res!114992 e!152263)))

(assert (=> b!234430 (= res!114992 (not e!152267))))

(declare-fun res!114994 () Bool)

(assert (=> b!234430 (=> (not res!114994) (not e!152267))))

(assert (=> b!234430 (= res!114994 (bvslt #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))

(declare-fun b!234431 () Bool)

(assert (=> b!234431 (= e!152266 (not call!21801))))

(declare-fun bm!21801 () Bool)

(assert (=> bm!21801 (= call!21805 call!21802)))

(declare-fun b!234432 () Bool)

(declare-fun Unit!7237 () Unit!7234)

(assert (=> b!234432 (= e!152265 Unit!7237)))

(declare-fun bm!21802 () Bool)

(assert (=> bm!21802 (= call!21801 (contains!1651 lt!118590 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21803 () Bool)

(assert (=> bm!21803 (= call!21806 call!21803)))

(declare-fun b!234433 () Bool)

(assert (=> b!234433 (= e!152262 (+!634 call!21802 (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504))))))

(declare-fun bm!21804 () Bool)

(assert (=> bm!21804 (= call!21807 call!21806)))

(assert (= (and d!59083 c!39030) b!234433))

(assert (= (and d!59083 (not c!39030)) b!234424))

(assert (= (and b!234424 c!39033) b!234421))

(assert (= (and b!234424 (not c!39033)) b!234428))

(assert (= (and b!234428 c!39034) b!234427))

(assert (= (and b!234428 (not c!39034)) b!234418))

(assert (= (or b!234427 b!234418) bm!21804))

(assert (= (or b!234421 bm!21804) bm!21803))

(assert (= (or b!234421 b!234427) bm!21801))

(assert (= (or b!234433 bm!21803) bm!21799))

(assert (= (or b!234433 bm!21801) bm!21800))

(assert (= (and d!59083 res!114993) b!234423))

(assert (= (and d!59083 c!39035) b!234419))

(assert (= (and d!59083 (not c!39035)) b!234432))

(assert (= (and d!59083 res!114991) b!234430))

(assert (= (and b!234430 res!114994) b!234426))

(assert (= (and b!234430 (not res!114992)) b!234413))

(assert (= (and b!234413 res!114987) b!234417))

(assert (= (and b!234430 res!114988) b!234429))

(assert (= (and b!234429 c!39031) b!234420))

(assert (= (and b!234429 (not c!39031)) b!234414))

(assert (= (and b!234420 res!114995) b!234416))

(assert (= (or b!234420 b!234414) bm!21798))

(assert (= (and b!234429 res!114989) b!234422))

(assert (= (and b!234422 c!39032) b!234415))

(assert (= (and b!234422 (not c!39032)) b!234431))

(assert (= (and b!234415 res!114990) b!234425))

(assert (= (or b!234415 b!234431) bm!21802))

(declare-fun b_lambda!7875 () Bool)

(assert (=> (not b_lambda!7875) (not b!234417)))

(declare-fun t!8493 () Bool)

(declare-fun tb!2927 () Bool)

(assert (=> (and b!234306 (= (defaultEntry!4357 thiss!1504) (defaultEntry!4357 thiss!1504)) t!8493) tb!2927))

(declare-fun result!5103 () Bool)

(assert (=> tb!2927 (= result!5103 tp_is_empty!6171)))

(assert (=> b!234417 t!8493))

(declare-fun b_and!13227 () Bool)

(assert (= b_and!13223 (and (=> t!8493 result!5103) b_and!13227)))

(declare-fun m!255651 () Bool)

(assert (=> b!234419 m!255651))

(declare-fun m!255653 () Bool)

(assert (=> b!234419 m!255653))

(declare-fun m!255655 () Bool)

(assert (=> b!234419 m!255655))

(declare-fun m!255657 () Bool)

(assert (=> b!234419 m!255657))

(declare-fun m!255659 () Bool)

(assert (=> b!234419 m!255659))

(declare-fun m!255661 () Bool)

(assert (=> b!234419 m!255661))

(declare-fun m!255663 () Bool)

(assert (=> b!234419 m!255663))

(declare-fun m!255665 () Bool)

(assert (=> b!234419 m!255665))

(declare-fun m!255667 () Bool)

(assert (=> b!234419 m!255667))

(declare-fun m!255669 () Bool)

(assert (=> b!234419 m!255669))

(declare-fun m!255671 () Bool)

(assert (=> b!234419 m!255671))

(declare-fun m!255673 () Bool)

(assert (=> b!234419 m!255673))

(declare-fun m!255675 () Bool)

(assert (=> b!234419 m!255675))

(assert (=> b!234419 m!255663))

(assert (=> b!234419 m!255659))

(assert (=> b!234419 m!255667))

(declare-fun m!255677 () Bool)

(assert (=> b!234419 m!255677))

(declare-fun m!255679 () Bool)

(assert (=> b!234419 m!255679))

(declare-fun m!255681 () Bool)

(assert (=> b!234419 m!255681))

(assert (=> b!234419 m!255673))

(declare-fun m!255683 () Bool)

(assert (=> b!234419 m!255683))

(declare-fun m!255685 () Bool)

(assert (=> bm!21802 m!255685))

(assert (=> bm!21799 m!255651))

(assert (=> b!234417 m!255671))

(assert (=> b!234417 m!255671))

(declare-fun m!255687 () Bool)

(assert (=> b!234417 m!255687))

(declare-fun m!255689 () Bool)

(assert (=> b!234417 m!255689))

(declare-fun m!255691 () Bool)

(assert (=> b!234417 m!255691))

(declare-fun m!255693 () Bool)

(assert (=> b!234417 m!255693))

(assert (=> b!234417 m!255691))

(assert (=> b!234417 m!255689))

(assert (=> b!234423 m!255671))

(assert (=> b!234423 m!255671))

(declare-fun m!255695 () Bool)

(assert (=> b!234423 m!255695))

(assert (=> b!234426 m!255671))

(assert (=> b!234426 m!255671))

(assert (=> b!234426 m!255695))

(declare-fun m!255697 () Bool)

(assert (=> bm!21800 m!255697))

(declare-fun m!255699 () Bool)

(assert (=> b!234425 m!255699))

(declare-fun m!255701 () Bool)

(assert (=> b!234416 m!255701))

(assert (=> d!59083 m!255593))

(declare-fun m!255703 () Bool)

(assert (=> b!234433 m!255703))

(assert (=> b!234413 m!255671))

(assert (=> b!234413 m!255671))

(declare-fun m!255705 () Bool)

(assert (=> b!234413 m!255705))

(declare-fun m!255707 () Bool)

(assert (=> bm!21798 m!255707))

(assert (=> b!234301 d!59083))

(declare-fun d!59085 () Bool)

(assert (=> d!59085 (= (array_inv!3633 (_keys!6421 thiss!1504)) (bvsge (size!5848 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234306 d!59085))

(declare-fun d!59087 () Bool)

(assert (=> d!59087 (= (array_inv!3634 (_values!4340 thiss!1504)) (bvsge (size!5847 (_values!4340 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234306 d!59087))

(declare-fun b!234442 () Bool)

(declare-fun e!152279 () Bool)

(assert (=> b!234442 (= e!152279 tp_is_empty!6171)))

(declare-fun mapNonEmpty!10446 () Bool)

(declare-fun mapRes!10446 () Bool)

(declare-fun tp!22092 () Bool)

(assert (=> mapNonEmpty!10446 (= mapRes!10446 (and tp!22092 e!152279))))

(declare-fun mapKey!10446 () (_ BitVec 32))

(declare-fun mapRest!10446 () (Array (_ BitVec 32) ValueCell!2742))

(declare-fun mapValue!10446 () ValueCell!2742)

(assert (=> mapNonEmpty!10446 (= mapRest!10440 (store mapRest!10446 mapKey!10446 mapValue!10446))))

(declare-fun condMapEmpty!10446 () Bool)

(declare-fun mapDefault!10446 () ValueCell!2742)

(assert (=> mapNonEmpty!10440 (= condMapEmpty!10446 (= mapRest!10440 ((as const (Array (_ BitVec 32) ValueCell!2742)) mapDefault!10446)))))

(declare-fun e!152280 () Bool)

(assert (=> mapNonEmpty!10440 (= tp!22083 (and e!152280 mapRes!10446))))

(declare-fun b!234443 () Bool)

(assert (=> b!234443 (= e!152280 tp_is_empty!6171)))

(declare-fun mapIsEmpty!10446 () Bool)

(assert (=> mapIsEmpty!10446 mapRes!10446))

(assert (= (and mapNonEmpty!10440 condMapEmpty!10446) mapIsEmpty!10446))

(assert (= (and mapNonEmpty!10440 (not condMapEmpty!10446)) mapNonEmpty!10446))

(assert (= (and mapNonEmpty!10446 ((_ is ValueCellFull!2742) mapValue!10446)) b!234442))

(assert (= (and mapNonEmpty!10440 ((_ is ValueCellFull!2742) mapDefault!10446)) b!234443))

(declare-fun m!255709 () Bool)

(assert (=> mapNonEmpty!10446 m!255709))

(declare-fun b_lambda!7877 () Bool)

(assert (= b_lambda!7875 (or (and b!234306 b_free!6309) b_lambda!7877)))

(check-sat (not d!59077) (not b!234360) (not b_lambda!7877) (not mapNonEmpty!10446) (not b!234359) (not b!234417) (not bm!21800) (not b_next!6309) (not b!234370) (not bm!21802) (not bm!21799) (not b!234350) (not b!234368) (not b!234433) (not d!59075) (not b!234416) (not b!234419) (not b!234426) (not d!59081) (not d!59083) (not b!234361) (not bm!21798) b_and!13227 (not b!234425) (not b!234423) tp_is_empty!6171 (not b!234413))
(check-sat b_and!13227 (not b_next!6309))
(get-model)

(declare-fun b!234454 () Bool)

(declare-fun e!152290 () Bool)

(declare-fun e!152291 () Bool)

(assert (=> b!234454 (= e!152290 e!152291)))

(declare-fun c!39038 () Bool)

(assert (=> b!234454 (= c!39038 (validKeyInArray!0 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21807 () Bool)

(declare-fun call!21810 () Bool)

(assert (=> bm!21807 (= call!21810 (arrayNoDuplicates!0 (_keys!6421 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39038 (Cons!3521 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000) Nil!3522) Nil!3522)))))

(declare-fun b!234455 () Bool)

(declare-fun e!152289 () Bool)

(declare-fun contains!1652 (List!3525 (_ BitVec 64)) Bool)

(assert (=> b!234455 (= e!152289 (contains!1652 Nil!3522 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234456 () Bool)

(assert (=> b!234456 (= e!152291 call!21810)))

(declare-fun d!59089 () Bool)

(declare-fun res!115004 () Bool)

(declare-fun e!152292 () Bool)

(assert (=> d!59089 (=> res!115004 e!152292)))

(assert (=> d!59089 (= res!115004 (bvsge #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))

(assert (=> d!59089 (= (arrayNoDuplicates!0 (_keys!6421 thiss!1504) #b00000000000000000000000000000000 Nil!3522) e!152292)))

(declare-fun b!234457 () Bool)

(assert (=> b!234457 (= e!152292 e!152290)))

(declare-fun res!115003 () Bool)

(assert (=> b!234457 (=> (not res!115003) (not e!152290))))

(assert (=> b!234457 (= res!115003 (not e!152289))))

(declare-fun res!115002 () Bool)

(assert (=> b!234457 (=> (not res!115002) (not e!152289))))

(assert (=> b!234457 (= res!115002 (validKeyInArray!0 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234458 () Bool)

(assert (=> b!234458 (= e!152291 call!21810)))

(assert (= (and d!59089 (not res!115004)) b!234457))

(assert (= (and b!234457 res!115002) b!234455))

(assert (= (and b!234457 res!115003) b!234454))

(assert (= (and b!234454 c!39038) b!234458))

(assert (= (and b!234454 (not c!39038)) b!234456))

(assert (= (or b!234458 b!234456) bm!21807))

(assert (=> b!234454 m!255671))

(assert (=> b!234454 m!255671))

(assert (=> b!234454 m!255695))

(assert (=> bm!21807 m!255671))

(declare-fun m!255711 () Bool)

(assert (=> bm!21807 m!255711))

(assert (=> b!234455 m!255671))

(assert (=> b!234455 m!255671))

(declare-fun m!255713 () Bool)

(assert (=> b!234455 m!255713))

(assert (=> b!234457 m!255671))

(assert (=> b!234457 m!255671))

(assert (=> b!234457 m!255695))

(assert (=> b!234361 d!59089))

(declare-fun b!234471 () Bool)

(declare-fun e!152300 () SeekEntryResult!980)

(assert (=> b!234471 (= e!152300 (MissingVacant!980 (index!6092 lt!118527)))))

(declare-fun b!234472 () Bool)

(declare-fun e!152301 () SeekEntryResult!980)

(assert (=> b!234472 (= e!152301 (Found!980 (index!6092 lt!118527)))))

(declare-fun b!234473 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234473 (= e!152300 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23696 lt!118527) #b00000000000000000000000000000001) (nextIndex!0 (index!6092 lt!118527) (x!23696 lt!118527) (mask!10303 thiss!1504)) (index!6092 lt!118527) key!932 (_keys!6421 thiss!1504) (mask!10303 thiss!1504)))))

(declare-fun d!59091 () Bool)

(declare-fun lt!118611 () SeekEntryResult!980)

(assert (=> d!59091 (and (or ((_ is Undefined!980) lt!118611) (not ((_ is Found!980) lt!118611)) (and (bvsge (index!6091 lt!118611) #b00000000000000000000000000000000) (bvslt (index!6091 lt!118611) (size!5848 (_keys!6421 thiss!1504))))) (or ((_ is Undefined!980) lt!118611) ((_ is Found!980) lt!118611) (not ((_ is MissingVacant!980) lt!118611)) (not (= (index!6093 lt!118611) (index!6092 lt!118527))) (and (bvsge (index!6093 lt!118611) #b00000000000000000000000000000000) (bvslt (index!6093 lt!118611) (size!5848 (_keys!6421 thiss!1504))))) (or ((_ is Undefined!980) lt!118611) (ite ((_ is Found!980) lt!118611) (= (select (arr!5513 (_keys!6421 thiss!1504)) (index!6091 lt!118611)) key!932) (and ((_ is MissingVacant!980) lt!118611) (= (index!6093 lt!118611) (index!6092 lt!118527)) (= (select (arr!5513 (_keys!6421 thiss!1504)) (index!6093 lt!118611)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!152299 () SeekEntryResult!980)

(assert (=> d!59091 (= lt!118611 e!152299)))

(declare-fun c!39047 () Bool)

(assert (=> d!59091 (= c!39047 (bvsge (x!23696 lt!118527) #b01111111111111111111111111111110))))

(declare-fun lt!118610 () (_ BitVec 64))

(assert (=> d!59091 (= lt!118610 (select (arr!5513 (_keys!6421 thiss!1504)) (index!6092 lt!118527)))))

(assert (=> d!59091 (validMask!0 (mask!10303 thiss!1504))))

(assert (=> d!59091 (= (seekKeyOrZeroReturnVacant!0 (x!23696 lt!118527) (index!6092 lt!118527) (index!6092 lt!118527) key!932 (_keys!6421 thiss!1504) (mask!10303 thiss!1504)) lt!118611)))

(declare-fun b!234474 () Bool)

(declare-fun c!39045 () Bool)

(assert (=> b!234474 (= c!39045 (= lt!118610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234474 (= e!152301 e!152300)))

(declare-fun b!234475 () Bool)

(assert (=> b!234475 (= e!152299 Undefined!980)))

(declare-fun b!234476 () Bool)

(assert (=> b!234476 (= e!152299 e!152301)))

(declare-fun c!39046 () Bool)

(assert (=> b!234476 (= c!39046 (= lt!118610 key!932))))

(assert (= (and d!59091 c!39047) b!234475))

(assert (= (and d!59091 (not c!39047)) b!234476))

(assert (= (and b!234476 c!39046) b!234472))

(assert (= (and b!234476 (not c!39046)) b!234474))

(assert (= (and b!234474 c!39045) b!234471))

(assert (= (and b!234474 (not c!39045)) b!234473))

(declare-fun m!255715 () Bool)

(assert (=> b!234473 m!255715))

(assert (=> b!234473 m!255715))

(declare-fun m!255717 () Bool)

(assert (=> b!234473 m!255717))

(declare-fun m!255719 () Bool)

(assert (=> d!59091 m!255719))

(declare-fun m!255721 () Bool)

(assert (=> d!59091 m!255721))

(assert (=> d!59091 m!255621))

(assert (=> d!59091 m!255593))

(assert (=> b!234350 d!59091))

(declare-fun d!59093 () Bool)

(assert (=> d!59093 (= (validKeyInArray!0 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234423 d!59093))

(declare-fun d!59095 () Bool)

(declare-fun e!152303 () Bool)

(assert (=> d!59095 e!152303))

(declare-fun res!115005 () Bool)

(assert (=> d!59095 (=> res!115005 e!152303)))

(declare-fun lt!118614 () Bool)

(assert (=> d!59095 (= res!115005 (not lt!118614))))

(declare-fun lt!118613 () Bool)

(assert (=> d!59095 (= lt!118614 lt!118613)))

(declare-fun lt!118615 () Unit!7234)

(declare-fun e!152302 () Unit!7234)

(assert (=> d!59095 (= lt!118615 e!152302)))

(declare-fun c!39048 () Bool)

(assert (=> d!59095 (= c!39048 lt!118613)))

(assert (=> d!59095 (= lt!118613 (containsKey!257 (toList!1779 lt!118590) (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59095 (= (contains!1651 lt!118590 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)) lt!118614)))

(declare-fun b!234477 () Bool)

(declare-fun lt!118612 () Unit!7234)

(assert (=> b!234477 (= e!152302 lt!118612)))

(assert (=> b!234477 (= lt!118612 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1779 lt!118590) (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234477 (isDefined!206 (getValueByKey!265 (toList!1779 lt!118590) (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234478 () Bool)

(declare-fun Unit!7238 () Unit!7234)

(assert (=> b!234478 (= e!152302 Unit!7238)))

(declare-fun b!234479 () Bool)

(assert (=> b!234479 (= e!152303 (isDefined!206 (getValueByKey!265 (toList!1779 lt!118590) (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59095 c!39048) b!234477))

(assert (= (and d!59095 (not c!39048)) b!234478))

(assert (= (and d!59095 (not res!115005)) b!234479))

(assert (=> d!59095 m!255671))

(declare-fun m!255723 () Bool)

(assert (=> d!59095 m!255723))

(assert (=> b!234477 m!255671))

(declare-fun m!255725 () Bool)

(assert (=> b!234477 m!255725))

(assert (=> b!234477 m!255671))

(declare-fun m!255727 () Bool)

(assert (=> b!234477 m!255727))

(assert (=> b!234477 m!255727))

(declare-fun m!255729 () Bool)

(assert (=> b!234477 m!255729))

(assert (=> b!234479 m!255671))

(assert (=> b!234479 m!255727))

(assert (=> b!234479 m!255727))

(assert (=> b!234479 m!255729))

(assert (=> b!234413 d!59095))

(declare-fun d!59097 () Bool)

(declare-fun e!152306 () Bool)

(assert (=> d!59097 e!152306))

(declare-fun res!115010 () Bool)

(assert (=> d!59097 (=> (not res!115010) (not e!152306))))

(declare-fun lt!118626 () ListLongMap!3527)

(assert (=> d!59097 (= res!115010 (contains!1651 lt!118626 (_1!2318 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504)))))))

(declare-fun lt!118625 () List!3524)

(assert (=> d!59097 (= lt!118626 (ListLongMap!3528 lt!118625))))

(declare-fun lt!118624 () Unit!7234)

(declare-fun lt!118627 () Unit!7234)

(assert (=> d!59097 (= lt!118624 lt!118627)))

(assert (=> d!59097 (= (getValueByKey!265 lt!118625 (_1!2318 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504)))) (Some!270 (_2!2318 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!149 (List!3524 (_ BitVec 64) V!7875) Unit!7234)

(assert (=> d!59097 (= lt!118627 (lemmaContainsTupThenGetReturnValue!149 lt!118625 (_1!2318 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504))) (_2!2318 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504)))))))

(declare-fun insertStrictlySorted!152 (List!3524 (_ BitVec 64) V!7875) List!3524)

(assert (=> d!59097 (= lt!118625 (insertStrictlySorted!152 (toList!1779 lt!118603) (_1!2318 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504))) (_2!2318 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504)))))))

(assert (=> d!59097 (= (+!634 lt!118603 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504))) lt!118626)))

(declare-fun b!234484 () Bool)

(declare-fun res!115011 () Bool)

(assert (=> b!234484 (=> (not res!115011) (not e!152306))))

(assert (=> b!234484 (= res!115011 (= (getValueByKey!265 (toList!1779 lt!118626) (_1!2318 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504)))) (Some!270 (_2!2318 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504))))))))

(declare-fun b!234485 () Bool)

(declare-fun contains!1653 (List!3524 tuple2!4614) Bool)

(assert (=> b!234485 (= e!152306 (contains!1653 (toList!1779 lt!118626) (tuple2!4615 lt!118601 (minValue!4198 thiss!1504))))))

(assert (= (and d!59097 res!115010) b!234484))

(assert (= (and b!234484 res!115011) b!234485))

(declare-fun m!255731 () Bool)

(assert (=> d!59097 m!255731))

(declare-fun m!255733 () Bool)

(assert (=> d!59097 m!255733))

(declare-fun m!255735 () Bool)

(assert (=> d!59097 m!255735))

(declare-fun m!255737 () Bool)

(assert (=> d!59097 m!255737))

(declare-fun m!255739 () Bool)

(assert (=> b!234484 m!255739))

(declare-fun m!255741 () Bool)

(assert (=> b!234485 m!255741))

(assert (=> b!234419 d!59097))

(declare-fun d!59099 () Bool)

(declare-fun get!2829 (Option!271) V!7875)

(assert (=> d!59099 (= (apply!207 lt!118603 lt!118599) (get!2829 (getValueByKey!265 (toList!1779 lt!118603) lt!118599)))))

(declare-fun bs!8681 () Bool)

(assert (= bs!8681 d!59099))

(declare-fun m!255743 () Bool)

(assert (=> bs!8681 m!255743))

(assert (=> bs!8681 m!255743))

(declare-fun m!255745 () Bool)

(assert (=> bs!8681 m!255745))

(assert (=> b!234419 d!59099))

(declare-fun d!59101 () Bool)

(assert (=> d!59101 (= (apply!207 (+!634 lt!118592 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504))) lt!118593) (apply!207 lt!118592 lt!118593))))

(declare-fun lt!118630 () Unit!7234)

(declare-fun choose!1098 (ListLongMap!3527 (_ BitVec 64) V!7875 (_ BitVec 64)) Unit!7234)

(assert (=> d!59101 (= lt!118630 (choose!1098 lt!118592 lt!118596 (zeroValue!4198 thiss!1504) lt!118593))))

(declare-fun e!152309 () Bool)

(assert (=> d!59101 e!152309))

(declare-fun res!115014 () Bool)

(assert (=> d!59101 (=> (not res!115014) (not e!152309))))

(assert (=> d!59101 (= res!115014 (contains!1651 lt!118592 lt!118593))))

(assert (=> d!59101 (= (addApplyDifferent!183 lt!118592 lt!118596 (zeroValue!4198 thiss!1504) lt!118593) lt!118630)))

(declare-fun b!234489 () Bool)

(assert (=> b!234489 (= e!152309 (not (= lt!118593 lt!118596)))))

(assert (= (and d!59101 res!115014) b!234489))

(declare-fun m!255747 () Bool)

(assert (=> d!59101 m!255747))

(declare-fun m!255749 () Bool)

(assert (=> d!59101 m!255749))

(assert (=> d!59101 m!255673))

(assert (=> d!59101 m!255675))

(assert (=> d!59101 m!255673))

(assert (=> d!59101 m!255679))

(assert (=> b!234419 d!59101))

(declare-fun d!59103 () Bool)

(assert (=> d!59103 (= (apply!207 (+!634 lt!118592 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504))) lt!118593) (get!2829 (getValueByKey!265 (toList!1779 (+!634 lt!118592 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504)))) lt!118593)))))

(declare-fun bs!8682 () Bool)

(assert (= bs!8682 d!59103))

(declare-fun m!255751 () Bool)

(assert (=> bs!8682 m!255751))

(assert (=> bs!8682 m!255751))

(declare-fun m!255753 () Bool)

(assert (=> bs!8682 m!255753))

(assert (=> b!234419 d!59103))

(declare-fun d!59105 () Bool)

(assert (=> d!59105 (= (apply!207 (+!634 lt!118603 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504))) lt!118599) (get!2829 (getValueByKey!265 (toList!1779 (+!634 lt!118603 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504)))) lt!118599)))))

(declare-fun bs!8683 () Bool)

(assert (= bs!8683 d!59105))

(declare-fun m!255755 () Bool)

(assert (=> bs!8683 m!255755))

(assert (=> bs!8683 m!255755))

(declare-fun m!255757 () Bool)

(assert (=> bs!8683 m!255757))

(assert (=> b!234419 d!59105))

(declare-fun d!59107 () Bool)

(declare-fun e!152310 () Bool)

(assert (=> d!59107 e!152310))

(declare-fun res!115015 () Bool)

(assert (=> d!59107 (=> (not res!115015) (not e!152310))))

(declare-fun lt!118633 () ListLongMap!3527)

(assert (=> d!59107 (= res!115015 (contains!1651 lt!118633 (_1!2318 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504)))))))

(declare-fun lt!118632 () List!3524)

(assert (=> d!59107 (= lt!118633 (ListLongMap!3528 lt!118632))))

(declare-fun lt!118631 () Unit!7234)

(declare-fun lt!118634 () Unit!7234)

(assert (=> d!59107 (= lt!118631 lt!118634)))

(assert (=> d!59107 (= (getValueByKey!265 lt!118632 (_1!2318 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504)))) (Some!270 (_2!2318 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504)))))))

(assert (=> d!59107 (= lt!118634 (lemmaContainsTupThenGetReturnValue!149 lt!118632 (_1!2318 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504))) (_2!2318 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504)))))))

(assert (=> d!59107 (= lt!118632 (insertStrictlySorted!152 (toList!1779 lt!118594) (_1!2318 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504))) (_2!2318 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504)))))))

(assert (=> d!59107 (= (+!634 lt!118594 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504))) lt!118633)))

(declare-fun b!234490 () Bool)

(declare-fun res!115016 () Bool)

(assert (=> b!234490 (=> (not res!115016) (not e!152310))))

(assert (=> b!234490 (= res!115016 (= (getValueByKey!265 (toList!1779 lt!118633) (_1!2318 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504)))) (Some!270 (_2!2318 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504))))))))

(declare-fun b!234491 () Bool)

(assert (=> b!234491 (= e!152310 (contains!1653 (toList!1779 lt!118633) (tuple2!4615 lt!118589 (minValue!4198 thiss!1504))))))

(assert (= (and d!59107 res!115015) b!234490))

(assert (= (and b!234490 res!115016) b!234491))

(declare-fun m!255759 () Bool)

(assert (=> d!59107 m!255759))

(declare-fun m!255761 () Bool)

(assert (=> d!59107 m!255761))

(declare-fun m!255763 () Bool)

(assert (=> d!59107 m!255763))

(declare-fun m!255765 () Bool)

(assert (=> d!59107 m!255765))

(declare-fun m!255767 () Bool)

(assert (=> b!234490 m!255767))

(declare-fun m!255769 () Bool)

(assert (=> b!234491 m!255769))

(assert (=> b!234419 d!59107))

(declare-fun d!59109 () Bool)

(declare-fun e!152312 () Bool)

(assert (=> d!59109 e!152312))

(declare-fun res!115017 () Bool)

(assert (=> d!59109 (=> res!115017 e!152312)))

(declare-fun lt!118637 () Bool)

(assert (=> d!59109 (= res!115017 (not lt!118637))))

(declare-fun lt!118636 () Bool)

(assert (=> d!59109 (= lt!118637 lt!118636)))

(declare-fun lt!118638 () Unit!7234)

(declare-fun e!152311 () Unit!7234)

(assert (=> d!59109 (= lt!118638 e!152311)))

(declare-fun c!39049 () Bool)

(assert (=> d!59109 (= c!39049 lt!118636)))

(assert (=> d!59109 (= lt!118636 (containsKey!257 (toList!1779 (+!634 lt!118591 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504)))) lt!118605))))

(assert (=> d!59109 (= (contains!1651 (+!634 lt!118591 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504))) lt!118605) lt!118637)))

(declare-fun b!234492 () Bool)

(declare-fun lt!118635 () Unit!7234)

(assert (=> b!234492 (= e!152311 lt!118635)))

(assert (=> b!234492 (= lt!118635 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1779 (+!634 lt!118591 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504)))) lt!118605))))

(assert (=> b!234492 (isDefined!206 (getValueByKey!265 (toList!1779 (+!634 lt!118591 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504)))) lt!118605))))

(declare-fun b!234493 () Bool)

(declare-fun Unit!7239 () Unit!7234)

(assert (=> b!234493 (= e!152311 Unit!7239)))

(declare-fun b!234494 () Bool)

(assert (=> b!234494 (= e!152312 (isDefined!206 (getValueByKey!265 (toList!1779 (+!634 lt!118591 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504)))) lt!118605)))))

(assert (= (and d!59109 c!39049) b!234492))

(assert (= (and d!59109 (not c!39049)) b!234493))

(assert (= (and d!59109 (not res!115017)) b!234494))

(declare-fun m!255771 () Bool)

(assert (=> d!59109 m!255771))

(declare-fun m!255773 () Bool)

(assert (=> b!234492 m!255773))

(declare-fun m!255775 () Bool)

(assert (=> b!234492 m!255775))

(assert (=> b!234492 m!255775))

(declare-fun m!255777 () Bool)

(assert (=> b!234492 m!255777))

(assert (=> b!234494 m!255775))

(assert (=> b!234494 m!255775))

(assert (=> b!234494 m!255777))

(assert (=> b!234419 d!59109))

(declare-fun d!59111 () Bool)

(assert (=> d!59111 (= (apply!207 lt!118594 lt!118600) (get!2829 (getValueByKey!265 (toList!1779 lt!118594) lt!118600)))))

(declare-fun bs!8684 () Bool)

(assert (= bs!8684 d!59111))

(declare-fun m!255779 () Bool)

(assert (=> bs!8684 m!255779))

(assert (=> bs!8684 m!255779))

(declare-fun m!255781 () Bool)

(assert (=> bs!8684 m!255781))

(assert (=> b!234419 d!59111))

(declare-fun d!59113 () Bool)

(assert (=> d!59113 (= (apply!207 lt!118592 lt!118593) (get!2829 (getValueByKey!265 (toList!1779 lt!118592) lt!118593)))))

(declare-fun bs!8685 () Bool)

(assert (= bs!8685 d!59113))

(declare-fun m!255783 () Bool)

(assert (=> bs!8685 m!255783))

(assert (=> bs!8685 m!255783))

(declare-fun m!255785 () Bool)

(assert (=> bs!8685 m!255785))

(assert (=> b!234419 d!59113))

(declare-fun d!59115 () Bool)

(assert (=> d!59115 (= (apply!207 (+!634 lt!118594 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504))) lt!118600) (get!2829 (getValueByKey!265 (toList!1779 (+!634 lt!118594 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504)))) lt!118600)))))

(declare-fun bs!8686 () Bool)

(assert (= bs!8686 d!59115))

(declare-fun m!255787 () Bool)

(assert (=> bs!8686 m!255787))

(assert (=> bs!8686 m!255787))

(declare-fun m!255789 () Bool)

(assert (=> bs!8686 m!255789))

(assert (=> b!234419 d!59115))

(declare-fun d!59117 () Bool)

(assert (=> d!59117 (contains!1651 (+!634 lt!118591 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504))) lt!118605)))

(declare-fun lt!118641 () Unit!7234)

(declare-fun choose!1099 (ListLongMap!3527 (_ BitVec 64) V!7875 (_ BitVec 64)) Unit!7234)

(assert (=> d!59117 (= lt!118641 (choose!1099 lt!118591 lt!118595 (zeroValue!4198 thiss!1504) lt!118605))))

(assert (=> d!59117 (contains!1651 lt!118591 lt!118605)))

(assert (=> d!59117 (= (addStillContains!183 lt!118591 lt!118595 (zeroValue!4198 thiss!1504) lt!118605) lt!118641)))

(declare-fun bs!8687 () Bool)

(assert (= bs!8687 d!59117))

(assert (=> bs!8687 m!255663))

(assert (=> bs!8687 m!255663))

(assert (=> bs!8687 m!255665))

(declare-fun m!255791 () Bool)

(assert (=> bs!8687 m!255791))

(declare-fun m!255793 () Bool)

(assert (=> bs!8687 m!255793))

(assert (=> b!234419 d!59117))

(declare-fun d!59119 () Bool)

(declare-fun e!152313 () Bool)

(assert (=> d!59119 e!152313))

(declare-fun res!115018 () Bool)

(assert (=> d!59119 (=> (not res!115018) (not e!152313))))

(declare-fun lt!118644 () ListLongMap!3527)

(assert (=> d!59119 (= res!115018 (contains!1651 lt!118644 (_1!2318 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504)))))))

(declare-fun lt!118643 () List!3524)

(assert (=> d!59119 (= lt!118644 (ListLongMap!3528 lt!118643))))

(declare-fun lt!118642 () Unit!7234)

(declare-fun lt!118645 () Unit!7234)

(assert (=> d!59119 (= lt!118642 lt!118645)))

(assert (=> d!59119 (= (getValueByKey!265 lt!118643 (_1!2318 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504)))) (Some!270 (_2!2318 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504)))))))

(assert (=> d!59119 (= lt!118645 (lemmaContainsTupThenGetReturnValue!149 lt!118643 (_1!2318 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504))) (_2!2318 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504)))))))

(assert (=> d!59119 (= lt!118643 (insertStrictlySorted!152 (toList!1779 lt!118592) (_1!2318 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504))) (_2!2318 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504)))))))

(assert (=> d!59119 (= (+!634 lt!118592 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504))) lt!118644)))

(declare-fun b!234496 () Bool)

(declare-fun res!115019 () Bool)

(assert (=> b!234496 (=> (not res!115019) (not e!152313))))

(assert (=> b!234496 (= res!115019 (= (getValueByKey!265 (toList!1779 lt!118644) (_1!2318 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504)))) (Some!270 (_2!2318 (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504))))))))

(declare-fun b!234497 () Bool)

(assert (=> b!234497 (= e!152313 (contains!1653 (toList!1779 lt!118644) (tuple2!4615 lt!118596 (zeroValue!4198 thiss!1504))))))

(assert (= (and d!59119 res!115018) b!234496))

(assert (= (and b!234496 res!115019) b!234497))

(declare-fun m!255795 () Bool)

(assert (=> d!59119 m!255795))

(declare-fun m!255797 () Bool)

(assert (=> d!59119 m!255797))

(declare-fun m!255799 () Bool)

(assert (=> d!59119 m!255799))

(declare-fun m!255801 () Bool)

(assert (=> d!59119 m!255801))

(declare-fun m!255803 () Bool)

(assert (=> b!234496 m!255803))

(declare-fun m!255805 () Bool)

(assert (=> b!234497 m!255805))

(assert (=> b!234419 d!59119))

(declare-fun d!59121 () Bool)

(declare-fun e!152314 () Bool)

(assert (=> d!59121 e!152314))

(declare-fun res!115020 () Bool)

(assert (=> d!59121 (=> (not res!115020) (not e!152314))))

(declare-fun lt!118648 () ListLongMap!3527)

(assert (=> d!59121 (= res!115020 (contains!1651 lt!118648 (_1!2318 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504)))))))

(declare-fun lt!118647 () List!3524)

(assert (=> d!59121 (= lt!118648 (ListLongMap!3528 lt!118647))))

(declare-fun lt!118646 () Unit!7234)

(declare-fun lt!118649 () Unit!7234)

(assert (=> d!59121 (= lt!118646 lt!118649)))

(assert (=> d!59121 (= (getValueByKey!265 lt!118647 (_1!2318 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504)))) (Some!270 (_2!2318 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504)))))))

(assert (=> d!59121 (= lt!118649 (lemmaContainsTupThenGetReturnValue!149 lt!118647 (_1!2318 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504))) (_2!2318 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504)))))))

(assert (=> d!59121 (= lt!118647 (insertStrictlySorted!152 (toList!1779 lt!118591) (_1!2318 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504))) (_2!2318 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504)))))))

(assert (=> d!59121 (= (+!634 lt!118591 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504))) lt!118648)))

(declare-fun b!234498 () Bool)

(declare-fun res!115021 () Bool)

(assert (=> b!234498 (=> (not res!115021) (not e!152314))))

(assert (=> b!234498 (= res!115021 (= (getValueByKey!265 (toList!1779 lt!118648) (_1!2318 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504)))) (Some!270 (_2!2318 (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504))))))))

(declare-fun b!234499 () Bool)

(assert (=> b!234499 (= e!152314 (contains!1653 (toList!1779 lt!118648) (tuple2!4615 lt!118595 (zeroValue!4198 thiss!1504))))))

(assert (= (and d!59121 res!115020) b!234498))

(assert (= (and b!234498 res!115021) b!234499))

(declare-fun m!255807 () Bool)

(assert (=> d!59121 m!255807))

(declare-fun m!255809 () Bool)

(assert (=> d!59121 m!255809))

(declare-fun m!255811 () Bool)

(assert (=> d!59121 m!255811))

(declare-fun m!255813 () Bool)

(assert (=> d!59121 m!255813))

(declare-fun m!255815 () Bool)

(assert (=> b!234498 m!255815))

(declare-fun m!255817 () Bool)

(assert (=> b!234499 m!255817))

(assert (=> b!234419 d!59121))

(declare-fun b!234524 () Bool)

(declare-fun e!152332 () Bool)

(declare-fun e!152329 () Bool)

(assert (=> b!234524 (= e!152332 e!152329)))

(declare-fun c!39058 () Bool)

(declare-fun e!152334 () Bool)

(assert (=> b!234524 (= c!39058 e!152334)))

(declare-fun res!115033 () Bool)

(assert (=> b!234524 (=> (not res!115033) (not e!152334))))

(assert (=> b!234524 (= res!115033 (bvslt #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))

(declare-fun b!234525 () Bool)

(declare-fun res!115031 () Bool)

(assert (=> b!234525 (=> (not res!115031) (not e!152332))))

(declare-fun lt!118667 () ListLongMap!3527)

(assert (=> b!234525 (= res!115031 (not (contains!1651 lt!118667 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234526 () Bool)

(assert (=> b!234526 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))

(assert (=> b!234526 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5847 (_values!4340 thiss!1504))))))

(declare-fun e!152333 () Bool)

(assert (=> b!234526 (= e!152333 (= (apply!207 lt!118667 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)) (get!2828 (select (arr!5512 (_values!4340 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4357 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234528 () Bool)

(declare-fun e!152335 () ListLongMap!3527)

(declare-fun e!152330 () ListLongMap!3527)

(assert (=> b!234528 (= e!152335 e!152330)))

(declare-fun c!39061 () Bool)

(assert (=> b!234528 (= c!39061 (validKeyInArray!0 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234529 () Bool)

(declare-fun call!21813 () ListLongMap!3527)

(assert (=> b!234529 (= e!152330 call!21813)))

(declare-fun b!234530 () Bool)

(assert (=> b!234530 (= e!152329 e!152333)))

(assert (=> b!234530 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))

(declare-fun res!115032 () Bool)

(assert (=> b!234530 (= res!115032 (contains!1651 lt!118667 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234530 (=> (not res!115032) (not e!152333))))

(declare-fun bm!21810 () Bool)

(assert (=> bm!21810 (= call!21813 (getCurrentListMapNoExtraKeys!529 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4357 thiss!1504)))))

(declare-fun b!234531 () Bool)

(declare-fun e!152331 () Bool)

(assert (=> b!234531 (= e!152331 (= lt!118667 (getCurrentListMapNoExtraKeys!529 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4357 thiss!1504))))))

(declare-fun b!234532 () Bool)

(assert (=> b!234532 (= e!152334 (validKeyInArray!0 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234532 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!234533 () Bool)

(declare-fun lt!118666 () Unit!7234)

(declare-fun lt!118665 () Unit!7234)

(assert (=> b!234533 (= lt!118666 lt!118665)))

(declare-fun lt!118664 () (_ BitVec 64))

(declare-fun lt!118669 () V!7875)

(declare-fun lt!118670 () (_ BitVec 64))

(declare-fun lt!118668 () ListLongMap!3527)

(assert (=> b!234533 (not (contains!1651 (+!634 lt!118668 (tuple2!4615 lt!118664 lt!118669)) lt!118670))))

(declare-fun addStillNotContains!113 (ListLongMap!3527 (_ BitVec 64) V!7875 (_ BitVec 64)) Unit!7234)

(assert (=> b!234533 (= lt!118665 (addStillNotContains!113 lt!118668 lt!118664 lt!118669 lt!118670))))

(assert (=> b!234533 (= lt!118670 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!234533 (= lt!118669 (get!2828 (select (arr!5512 (_values!4340 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4357 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234533 (= lt!118664 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234533 (= lt!118668 call!21813)))

(assert (=> b!234533 (= e!152330 (+!634 call!21813 (tuple2!4615 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000) (get!2828 (select (arr!5512 (_values!4340 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4357 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!59123 () Bool)

(assert (=> d!59123 e!152332))

(declare-fun res!115030 () Bool)

(assert (=> d!59123 (=> (not res!115030) (not e!152332))))

(assert (=> d!59123 (= res!115030 (not (contains!1651 lt!118667 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59123 (= lt!118667 e!152335)))

(declare-fun c!39060 () Bool)

(assert (=> d!59123 (= c!39060 (bvsge #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))

(assert (=> d!59123 (validMask!0 (mask!10303 thiss!1504))))

(assert (=> d!59123 (= (getCurrentListMapNoExtraKeys!529 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)) lt!118667)))

(declare-fun b!234527 () Bool)

(assert (=> b!234527 (= e!152335 (ListLongMap!3528 Nil!3521))))

(declare-fun b!234534 () Bool)

(assert (=> b!234534 (= e!152329 e!152331)))

(declare-fun c!39059 () Bool)

(assert (=> b!234534 (= c!39059 (bvslt #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))

(declare-fun b!234535 () Bool)

(declare-fun isEmpty!508 (ListLongMap!3527) Bool)

(assert (=> b!234535 (= e!152331 (isEmpty!508 lt!118667))))

(assert (= (and d!59123 c!39060) b!234527))

(assert (= (and d!59123 (not c!39060)) b!234528))

(assert (= (and b!234528 c!39061) b!234533))

(assert (= (and b!234528 (not c!39061)) b!234529))

(assert (= (or b!234533 b!234529) bm!21810))

(assert (= (and d!59123 res!115030) b!234525))

(assert (= (and b!234525 res!115031) b!234524))

(assert (= (and b!234524 res!115033) b!234532))

(assert (= (and b!234524 c!39058) b!234530))

(assert (= (and b!234524 (not c!39058)) b!234534))

(assert (= (and b!234530 res!115032) b!234526))

(assert (= (and b!234534 c!39059) b!234531))

(assert (= (and b!234534 (not c!39059)) b!234535))

(declare-fun b_lambda!7879 () Bool)

(assert (=> (not b_lambda!7879) (not b!234526)))

(assert (=> b!234526 t!8493))

(declare-fun b_and!13229 () Bool)

(assert (= b_and!13227 (and (=> t!8493 result!5103) b_and!13229)))

(declare-fun b_lambda!7881 () Bool)

(assert (=> (not b_lambda!7881) (not b!234533)))

(assert (=> b!234533 t!8493))

(declare-fun b_and!13231 () Bool)

(assert (= b_and!13229 (and (=> t!8493 result!5103) b_and!13231)))

(assert (=> b!234530 m!255671))

(assert (=> b!234530 m!255671))

(declare-fun m!255819 () Bool)

(assert (=> b!234530 m!255819))

(assert (=> b!234533 m!255691))

(declare-fun m!255821 () Bool)

(assert (=> b!234533 m!255821))

(assert (=> b!234533 m!255689))

(assert (=> b!234533 m!255691))

(assert (=> b!234533 m!255693))

(declare-fun m!255823 () Bool)

(assert (=> b!234533 m!255823))

(assert (=> b!234533 m!255671))

(declare-fun m!255825 () Bool)

(assert (=> b!234533 m!255825))

(assert (=> b!234533 m!255689))

(assert (=> b!234533 m!255823))

(declare-fun m!255827 () Bool)

(assert (=> b!234533 m!255827))

(declare-fun m!255829 () Bool)

(assert (=> b!234535 m!255829))

(assert (=> b!234532 m!255671))

(assert (=> b!234532 m!255671))

(assert (=> b!234532 m!255695))

(assert (=> b!234528 m!255671))

(assert (=> b!234528 m!255671))

(assert (=> b!234528 m!255695))

(declare-fun m!255831 () Bool)

(assert (=> b!234525 m!255831))

(declare-fun m!255833 () Bool)

(assert (=> b!234531 m!255833))

(declare-fun m!255835 () Bool)

(assert (=> d!59123 m!255835))

(assert (=> d!59123 m!255593))

(assert (=> bm!21810 m!255833))

(assert (=> b!234526 m!255689))

(assert (=> b!234526 m!255691))

(assert (=> b!234526 m!255693))

(assert (=> b!234526 m!255671))

(declare-fun m!255837 () Bool)

(assert (=> b!234526 m!255837))

(assert (=> b!234526 m!255691))

(assert (=> b!234526 m!255671))

(assert (=> b!234526 m!255689))

(assert (=> b!234419 d!59123))

(declare-fun d!59125 () Bool)

(assert (=> d!59125 (= (apply!207 (+!634 lt!118603 (tuple2!4615 lt!118601 (minValue!4198 thiss!1504))) lt!118599) (apply!207 lt!118603 lt!118599))))

(declare-fun lt!118671 () Unit!7234)

(assert (=> d!59125 (= lt!118671 (choose!1098 lt!118603 lt!118601 (minValue!4198 thiss!1504) lt!118599))))

(declare-fun e!152336 () Bool)

(assert (=> d!59125 e!152336))

(declare-fun res!115034 () Bool)

(assert (=> d!59125 (=> (not res!115034) (not e!152336))))

(assert (=> d!59125 (= res!115034 (contains!1651 lt!118603 lt!118599))))

(assert (=> d!59125 (= (addApplyDifferent!183 lt!118603 lt!118601 (minValue!4198 thiss!1504) lt!118599) lt!118671)))

(declare-fun b!234536 () Bool)

(assert (=> b!234536 (= e!152336 (not (= lt!118599 lt!118601)))))

(assert (= (and d!59125 res!115034) b!234536))

(declare-fun m!255839 () Bool)

(assert (=> d!59125 m!255839))

(declare-fun m!255841 () Bool)

(assert (=> d!59125 m!255841))

(assert (=> d!59125 m!255667))

(assert (=> d!59125 m!255669))

(assert (=> d!59125 m!255667))

(assert (=> d!59125 m!255677))

(assert (=> b!234419 d!59125))

(declare-fun d!59127 () Bool)

(assert (=> d!59127 (= (apply!207 (+!634 lt!118594 (tuple2!4615 lt!118589 (minValue!4198 thiss!1504))) lt!118600) (apply!207 lt!118594 lt!118600))))

(declare-fun lt!118672 () Unit!7234)

(assert (=> d!59127 (= lt!118672 (choose!1098 lt!118594 lt!118589 (minValue!4198 thiss!1504) lt!118600))))

(declare-fun e!152337 () Bool)

(assert (=> d!59127 e!152337))

(declare-fun res!115035 () Bool)

(assert (=> d!59127 (=> (not res!115035) (not e!152337))))

(assert (=> d!59127 (= res!115035 (contains!1651 lt!118594 lt!118600))))

(assert (=> d!59127 (= (addApplyDifferent!183 lt!118594 lt!118589 (minValue!4198 thiss!1504) lt!118600) lt!118672)))

(declare-fun b!234537 () Bool)

(assert (=> b!234537 (= e!152337 (not (= lt!118600 lt!118589)))))

(assert (= (and d!59127 res!115035) b!234537))

(declare-fun m!255843 () Bool)

(assert (=> d!59127 m!255843))

(declare-fun m!255845 () Bool)

(assert (=> d!59127 m!255845))

(assert (=> d!59127 m!255659))

(assert (=> d!59127 m!255661))

(assert (=> d!59127 m!255659))

(assert (=> d!59127 m!255653))

(assert (=> b!234419 d!59127))

(declare-fun b!234546 () Bool)

(declare-fun res!115047 () Bool)

(declare-fun e!152340 () Bool)

(assert (=> b!234546 (=> (not res!115047) (not e!152340))))

(assert (=> b!234546 (= res!115047 (and (= (size!5847 (_values!4340 thiss!1504)) (bvadd (mask!10303 thiss!1504) #b00000000000000000000000000000001)) (= (size!5848 (_keys!6421 thiss!1504)) (size!5847 (_values!4340 thiss!1504))) (bvsge (_size!1741 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1741 thiss!1504) (bvadd (mask!10303 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!234548 () Bool)

(declare-fun res!115045 () Bool)

(assert (=> b!234548 (=> (not res!115045) (not e!152340))))

(declare-fun size!5851 (LongMapFixedSize!3384) (_ BitVec 32))

(assert (=> b!234548 (= res!115045 (= (size!5851 thiss!1504) (bvadd (_size!1741 thiss!1504) (bvsdiv (bvadd (extraKeys!4094 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!234549 () Bool)

(assert (=> b!234549 (= e!152340 (and (bvsge (extraKeys!4094 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4094 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1741 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!59129 () Bool)

(declare-fun res!115046 () Bool)

(assert (=> d!59129 (=> (not res!115046) (not e!152340))))

(assert (=> d!59129 (= res!115046 (validMask!0 (mask!10303 thiss!1504)))))

(assert (=> d!59129 (= (simpleValid!230 thiss!1504) e!152340)))

(declare-fun b!234547 () Bool)

(declare-fun res!115044 () Bool)

(assert (=> b!234547 (=> (not res!115044) (not e!152340))))

(assert (=> b!234547 (= res!115044 (bvsge (size!5851 thiss!1504) (_size!1741 thiss!1504)))))

(assert (= (and d!59129 res!115046) b!234546))

(assert (= (and b!234546 res!115047) b!234547))

(assert (= (and b!234547 res!115044) b!234548))

(assert (= (and b!234548 res!115045) b!234549))

(declare-fun m!255847 () Bool)

(assert (=> b!234548 m!255847))

(assert (=> d!59129 m!255593))

(assert (=> b!234547 m!255847))

(assert (=> d!59077 d!59129))

(assert (=> d!59083 d!59079))

(declare-fun b!234558 () Bool)

(declare-fun e!152346 () (_ BitVec 32))

(declare-fun call!21816 () (_ BitVec 32))

(assert (=> b!234558 (= e!152346 call!21816)))

(declare-fun d!59131 () Bool)

(declare-fun lt!118675 () (_ BitVec 32))

(assert (=> d!59131 (and (bvsge lt!118675 #b00000000000000000000000000000000) (bvsle lt!118675 (bvsub (size!5848 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!152345 () (_ BitVec 32))

(assert (=> d!59131 (= lt!118675 e!152345)))

(declare-fun c!39066 () Bool)

(assert (=> d!59131 (= c!39066 (bvsge #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))

(assert (=> d!59131 (and (bvsle #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5848 (_keys!6421 thiss!1504)) (size!5848 (_keys!6421 thiss!1504))))))

(assert (=> d!59131 (= (arrayCountValidKeys!0 (_keys!6421 thiss!1504) #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))) lt!118675)))

(declare-fun b!234559 () Bool)

(assert (=> b!234559 (= e!152345 e!152346)))

(declare-fun c!39067 () Bool)

(assert (=> b!234559 (= c!39067 (validKeyInArray!0 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234560 () Bool)

(assert (=> b!234560 (= e!152346 (bvadd #b00000000000000000000000000000001 call!21816))))

(declare-fun b!234561 () Bool)

(assert (=> b!234561 (= e!152345 #b00000000000000000000000000000000)))

(declare-fun bm!21813 () Bool)

(assert (=> bm!21813 (= call!21816 (arrayCountValidKeys!0 (_keys!6421 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5848 (_keys!6421 thiss!1504))))))

(assert (= (and d!59131 c!39066) b!234561))

(assert (= (and d!59131 (not c!39066)) b!234559))

(assert (= (and b!234559 c!39067) b!234560))

(assert (= (and b!234559 (not c!39067)) b!234558))

(assert (= (or b!234560 b!234558) bm!21813))

(assert (=> b!234559 m!255671))

(assert (=> b!234559 m!255671))

(assert (=> b!234559 m!255695))

(declare-fun m!255849 () Bool)

(assert (=> bm!21813 m!255849))

(assert (=> b!234359 d!59131))

(declare-fun d!59133 () Bool)

(declare-fun e!152347 () Bool)

(assert (=> d!59133 e!152347))

(declare-fun res!115048 () Bool)

(assert (=> d!59133 (=> (not res!115048) (not e!152347))))

(declare-fun lt!118678 () ListLongMap!3527)

(assert (=> d!59133 (= res!115048 (contains!1651 lt!118678 (_1!2318 (ite (or c!39030 c!39033) (tuple2!4615 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4198 thiss!1504)) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504))))))))

(declare-fun lt!118677 () List!3524)

(assert (=> d!59133 (= lt!118678 (ListLongMap!3528 lt!118677))))

(declare-fun lt!118676 () Unit!7234)

(declare-fun lt!118679 () Unit!7234)

(assert (=> d!59133 (= lt!118676 lt!118679)))

(assert (=> d!59133 (= (getValueByKey!265 lt!118677 (_1!2318 (ite (or c!39030 c!39033) (tuple2!4615 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4198 thiss!1504)) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504))))) (Some!270 (_2!2318 (ite (or c!39030 c!39033) (tuple2!4615 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4198 thiss!1504)) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504))))))))

(assert (=> d!59133 (= lt!118679 (lemmaContainsTupThenGetReturnValue!149 lt!118677 (_1!2318 (ite (or c!39030 c!39033) (tuple2!4615 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4198 thiss!1504)) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504)))) (_2!2318 (ite (or c!39030 c!39033) (tuple2!4615 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4198 thiss!1504)) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504))))))))

(assert (=> d!59133 (= lt!118677 (insertStrictlySorted!152 (toList!1779 (ite c!39030 call!21803 (ite c!39033 call!21806 call!21807))) (_1!2318 (ite (or c!39030 c!39033) (tuple2!4615 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4198 thiss!1504)) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504)))) (_2!2318 (ite (or c!39030 c!39033) (tuple2!4615 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4198 thiss!1504)) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504))))))))

(assert (=> d!59133 (= (+!634 (ite c!39030 call!21803 (ite c!39033 call!21806 call!21807)) (ite (or c!39030 c!39033) (tuple2!4615 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4198 thiss!1504)) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504)))) lt!118678)))

(declare-fun b!234562 () Bool)

(declare-fun res!115049 () Bool)

(assert (=> b!234562 (=> (not res!115049) (not e!152347))))

(assert (=> b!234562 (= res!115049 (= (getValueByKey!265 (toList!1779 lt!118678) (_1!2318 (ite (or c!39030 c!39033) (tuple2!4615 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4198 thiss!1504)) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504))))) (Some!270 (_2!2318 (ite (or c!39030 c!39033) (tuple2!4615 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4198 thiss!1504)) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504)))))))))

(declare-fun b!234563 () Bool)

(assert (=> b!234563 (= e!152347 (contains!1653 (toList!1779 lt!118678) (ite (or c!39030 c!39033) (tuple2!4615 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4198 thiss!1504)) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504)))))))

(assert (= (and d!59133 res!115048) b!234562))

(assert (= (and b!234562 res!115049) b!234563))

(declare-fun m!255851 () Bool)

(assert (=> d!59133 m!255851))

(declare-fun m!255853 () Bool)

(assert (=> d!59133 m!255853))

(declare-fun m!255855 () Bool)

(assert (=> d!59133 m!255855))

(declare-fun m!255857 () Bool)

(assert (=> d!59133 m!255857))

(declare-fun m!255859 () Bool)

(assert (=> b!234562 m!255859))

(declare-fun m!255861 () Bool)

(assert (=> b!234563 m!255861))

(assert (=> bm!21800 d!59133))

(declare-fun b!234572 () Bool)

(declare-fun e!152355 () Bool)

(declare-fun call!21819 () Bool)

(assert (=> b!234572 (= e!152355 call!21819)))

(declare-fun b!234573 () Bool)

(declare-fun e!152356 () Bool)

(assert (=> b!234573 (= e!152355 e!152356)))

(declare-fun lt!118686 () (_ BitVec 64))

(assert (=> b!234573 (= lt!118686 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118688 () Unit!7234)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11595 (_ BitVec 64) (_ BitVec 32)) Unit!7234)

(assert (=> b!234573 (= lt!118688 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6421 thiss!1504) lt!118686 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!234573 (arrayContainsKey!0 (_keys!6421 thiss!1504) lt!118686 #b00000000000000000000000000000000)))

(declare-fun lt!118687 () Unit!7234)

(assert (=> b!234573 (= lt!118687 lt!118688)))

(declare-fun res!115054 () Bool)

(assert (=> b!234573 (= res!115054 (= (seekEntryOrOpen!0 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000) (_keys!6421 thiss!1504) (mask!10303 thiss!1504)) (Found!980 #b00000000000000000000000000000000)))))

(assert (=> b!234573 (=> (not res!115054) (not e!152356))))

(declare-fun b!234574 () Bool)

(assert (=> b!234574 (= e!152356 call!21819)))

(declare-fun d!59135 () Bool)

(declare-fun res!115055 () Bool)

(declare-fun e!152354 () Bool)

(assert (=> d!59135 (=> res!115055 e!152354)))

(assert (=> d!59135 (= res!115055 (bvsge #b00000000000000000000000000000000 (size!5848 (_keys!6421 thiss!1504))))))

(assert (=> d!59135 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6421 thiss!1504) (mask!10303 thiss!1504)) e!152354)))

(declare-fun b!234575 () Bool)

(assert (=> b!234575 (= e!152354 e!152355)))

(declare-fun c!39070 () Bool)

(assert (=> b!234575 (= c!39070 (validKeyInArray!0 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21816 () Bool)

(assert (=> bm!21816 (= call!21819 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6421 thiss!1504) (mask!10303 thiss!1504)))))

(assert (= (and d!59135 (not res!115055)) b!234575))

(assert (= (and b!234575 c!39070) b!234573))

(assert (= (and b!234575 (not c!39070)) b!234572))

(assert (= (and b!234573 res!115054) b!234574))

(assert (= (or b!234574 b!234572) bm!21816))

(assert (=> b!234573 m!255671))

(declare-fun m!255863 () Bool)

(assert (=> b!234573 m!255863))

(declare-fun m!255865 () Bool)

(assert (=> b!234573 m!255865))

(assert (=> b!234573 m!255671))

(declare-fun m!255867 () Bool)

(assert (=> b!234573 m!255867))

(assert (=> b!234575 m!255671))

(assert (=> b!234575 m!255671))

(assert (=> b!234575 m!255695))

(declare-fun m!255869 () Bool)

(assert (=> bm!21816 m!255869))

(assert (=> b!234360 d!59135))

(declare-fun d!59137 () Bool)

(declare-fun isEmpty!509 (Option!271) Bool)

(assert (=> d!59137 (= (isDefined!206 (getValueByKey!265 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))) key!932)) (not (isEmpty!509 (getValueByKey!265 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))) key!932))))))

(declare-fun bs!8688 () Bool)

(assert (= bs!8688 d!59137))

(assert (=> bs!8688 m!255647))

(declare-fun m!255871 () Bool)

(assert (=> bs!8688 m!255871))

(assert (=> b!234370 d!59137))

(declare-fun b!234587 () Bool)

(declare-fun e!152362 () Option!271)

(assert (=> b!234587 (= e!152362 None!269)))

(declare-fun b!234586 () Bool)

(assert (=> b!234586 (= e!152362 (getValueByKey!265 (t!8491 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))) key!932))))

(declare-fun b!234585 () Bool)

(declare-fun e!152361 () Option!271)

(assert (=> b!234585 (= e!152361 e!152362)))

(declare-fun c!39076 () Bool)

(assert (=> b!234585 (= c!39076 (and ((_ is Cons!3520) (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))) (not (= (_1!2318 (h!4170 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))))) key!932))))))

(declare-fun b!234584 () Bool)

(assert (=> b!234584 (= e!152361 (Some!270 (_2!2318 (h!4170 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))))))))

(declare-fun d!59139 () Bool)

(declare-fun c!39075 () Bool)

(assert (=> d!59139 (= c!39075 (and ((_ is Cons!3520) (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))) (= (_1!2318 (h!4170 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))))) key!932)))))

(assert (=> d!59139 (= (getValueByKey!265 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))) key!932) e!152361)))

(assert (= (and d!59139 c!39075) b!234584))

(assert (= (and d!59139 (not c!39075)) b!234585))

(assert (= (and b!234585 c!39076) b!234586))

(assert (= (and b!234585 (not c!39076)) b!234587))

(declare-fun m!255873 () Bool)

(assert (=> b!234586 m!255873))

(assert (=> b!234370 d!59139))

(assert (=> bm!21799 d!59123))

(declare-fun d!59141 () Bool)

(assert (=> d!59141 (= (apply!207 lt!118590 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2829 (getValueByKey!265 (toList!1779 lt!118590) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8689 () Bool)

(assert (= bs!8689 d!59141))

(declare-fun m!255875 () Bool)

(assert (=> bs!8689 m!255875))

(assert (=> bs!8689 m!255875))

(declare-fun m!255877 () Bool)

(assert (=> bs!8689 m!255877))

(assert (=> b!234416 d!59141))

(declare-fun d!59143 () Bool)

(assert (=> d!59143 (= (apply!207 lt!118590 (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000)) (get!2829 (getValueByKey!265 (toList!1779 lt!118590) (select (arr!5513 (_keys!6421 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8690 () Bool)

(assert (= bs!8690 d!59143))

(assert (=> bs!8690 m!255671))

(assert (=> bs!8690 m!255727))

(assert (=> bs!8690 m!255727))

(declare-fun m!255879 () Bool)

(assert (=> bs!8690 m!255879))

(assert (=> b!234417 d!59143))

(declare-fun d!59145 () Bool)

(declare-fun c!39079 () Bool)

(assert (=> d!59145 (= c!39079 ((_ is ValueCellFull!2742) (select (arr!5512 (_values!4340 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!152365 () V!7875)

(assert (=> d!59145 (= (get!2828 (select (arr!5512 (_values!4340 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4357 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!152365)))

(declare-fun b!234592 () Bool)

(declare-fun get!2830 (ValueCell!2742 V!7875) V!7875)

(assert (=> b!234592 (= e!152365 (get!2830 (select (arr!5512 (_values!4340 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4357 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234593 () Bool)

(declare-fun get!2831 (ValueCell!2742 V!7875) V!7875)

(assert (=> b!234593 (= e!152365 (get!2831 (select (arr!5512 (_values!4340 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4357 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59145 c!39079) b!234592))

(assert (= (and d!59145 (not c!39079)) b!234593))

(assert (=> b!234592 m!255689))

(assert (=> b!234592 m!255691))

(declare-fun m!255881 () Bool)

(assert (=> b!234592 m!255881))

(assert (=> b!234593 m!255689))

(assert (=> b!234593 m!255691))

(declare-fun m!255883 () Bool)

(assert (=> b!234593 m!255883))

(assert (=> b!234417 d!59145))

(declare-fun d!59147 () Bool)

(declare-fun e!152366 () Bool)

(assert (=> d!59147 e!152366))

(declare-fun res!115056 () Bool)

(assert (=> d!59147 (=> (not res!115056) (not e!152366))))

(declare-fun lt!118691 () ListLongMap!3527)

(assert (=> d!59147 (= res!115056 (contains!1651 lt!118691 (_1!2318 (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504)))))))

(declare-fun lt!118690 () List!3524)

(assert (=> d!59147 (= lt!118691 (ListLongMap!3528 lt!118690))))

(declare-fun lt!118689 () Unit!7234)

(declare-fun lt!118692 () Unit!7234)

(assert (=> d!59147 (= lt!118689 lt!118692)))

(assert (=> d!59147 (= (getValueByKey!265 lt!118690 (_1!2318 (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504)))) (Some!270 (_2!2318 (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504)))))))

(assert (=> d!59147 (= lt!118692 (lemmaContainsTupThenGetReturnValue!149 lt!118690 (_1!2318 (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504))) (_2!2318 (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504)))))))

(assert (=> d!59147 (= lt!118690 (insertStrictlySorted!152 (toList!1779 call!21802) (_1!2318 (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504))) (_2!2318 (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504)))))))

(assert (=> d!59147 (= (+!634 call!21802 (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504))) lt!118691)))

(declare-fun b!234594 () Bool)

(declare-fun res!115057 () Bool)

(assert (=> b!234594 (=> (not res!115057) (not e!152366))))

(assert (=> b!234594 (= res!115057 (= (getValueByKey!265 (toList!1779 lt!118691) (_1!2318 (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504)))) (Some!270 (_2!2318 (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504))))))))

(declare-fun b!234595 () Bool)

(assert (=> b!234595 (= e!152366 (contains!1653 (toList!1779 lt!118691) (tuple2!4615 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4198 thiss!1504))))))

(assert (= (and d!59147 res!115056) b!234594))

(assert (= (and b!234594 res!115057) b!234595))

(declare-fun m!255885 () Bool)

(assert (=> d!59147 m!255885))

(declare-fun m!255887 () Bool)

(assert (=> d!59147 m!255887))

(declare-fun m!255889 () Bool)

(assert (=> d!59147 m!255889))

(declare-fun m!255891 () Bool)

(assert (=> d!59147 m!255891))

(declare-fun m!255893 () Bool)

(assert (=> b!234594 m!255893))

(declare-fun m!255895 () Bool)

(assert (=> b!234595 m!255895))

(assert (=> b!234433 d!59147))

(declare-fun d!59149 () Bool)

(assert (=> d!59149 (isDefined!206 (getValueByKey!265 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))) key!932))))

(declare-fun lt!118695 () Unit!7234)

(declare-fun choose!1100 (List!3524 (_ BitVec 64)) Unit!7234)

(assert (=> d!59149 (= lt!118695 (choose!1100 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))) key!932))))

(declare-fun e!152369 () Bool)

(assert (=> d!59149 e!152369))

(declare-fun res!115060 () Bool)

(assert (=> d!59149 (=> (not res!115060) (not e!152369))))

(declare-fun isStrictlySorted!361 (List!3524) Bool)

(assert (=> d!59149 (= res!115060 (isStrictlySorted!361 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))))))

(assert (=> d!59149 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))) key!932) lt!118695)))

(declare-fun b!234598 () Bool)

(assert (=> b!234598 (= e!152369 (containsKey!257 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))) key!932))))

(assert (= (and d!59149 res!115060) b!234598))

(assert (=> d!59149 m!255647))

(assert (=> d!59149 m!255647))

(assert (=> d!59149 m!255649))

(declare-fun m!255897 () Bool)

(assert (=> d!59149 m!255897))

(declare-fun m!255899 () Bool)

(assert (=> d!59149 m!255899))

(assert (=> b!234598 m!255643))

(assert (=> b!234368 d!59149))

(assert (=> b!234368 d!59137))

(assert (=> b!234368 d!59139))

(declare-fun d!59151 () Bool)

(assert (=> d!59151 (= (apply!207 lt!118590 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2829 (getValueByKey!265 (toList!1779 lt!118590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8691 () Bool)

(assert (= bs!8691 d!59151))

(declare-fun m!255901 () Bool)

(assert (=> bs!8691 m!255901))

(assert (=> bs!8691 m!255901))

(declare-fun m!255903 () Bool)

(assert (=> bs!8691 m!255903))

(assert (=> b!234425 d!59151))

(declare-fun b!234618 () Bool)

(declare-fun lt!118700 () SeekEntryResult!980)

(assert (=> b!234618 (and (bvsge (index!6092 lt!118700) #b00000000000000000000000000000000) (bvslt (index!6092 lt!118700) (size!5848 (_keys!6421 thiss!1504))))))

(declare-fun res!115069 () Bool)

(assert (=> b!234618 (= res!115069 (= (select (arr!5513 (_keys!6421 thiss!1504)) (index!6092 lt!118700)) key!932))))

(declare-fun e!152383 () Bool)

(assert (=> b!234618 (=> res!115069 e!152383)))

(declare-fun e!152380 () Bool)

(assert (=> b!234618 (= e!152380 e!152383)))

(declare-fun b!234619 () Bool)

(declare-fun e!152382 () SeekEntryResult!980)

(assert (=> b!234619 (= e!152382 (Intermediate!980 false (toIndex!0 key!932 (mask!10303 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!234620 () Bool)

(declare-fun e!152381 () SeekEntryResult!980)

(assert (=> b!234620 (= e!152381 (Intermediate!980 true (toIndex!0 key!932 (mask!10303 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!234621 () Bool)

(declare-fun e!152384 () Bool)

(assert (=> b!234621 (= e!152384 e!152380)))

(declare-fun res!115067 () Bool)

(assert (=> b!234621 (= res!115067 (and ((_ is Intermediate!980) lt!118700) (not (undefined!1792 lt!118700)) (bvslt (x!23696 lt!118700) #b01111111111111111111111111111110) (bvsge (x!23696 lt!118700) #b00000000000000000000000000000000) (bvsge (x!23696 lt!118700) #b00000000000000000000000000000000)))))

(assert (=> b!234621 (=> (not res!115067) (not e!152380))))

(declare-fun d!59153 () Bool)

(assert (=> d!59153 e!152384))

(declare-fun c!39086 () Bool)

(assert (=> d!59153 (= c!39086 (and ((_ is Intermediate!980) lt!118700) (undefined!1792 lt!118700)))))

(assert (=> d!59153 (= lt!118700 e!152381)))

(declare-fun c!39087 () Bool)

(assert (=> d!59153 (= c!39087 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!118701 () (_ BitVec 64))

(assert (=> d!59153 (= lt!118701 (select (arr!5513 (_keys!6421 thiss!1504)) (toIndex!0 key!932 (mask!10303 thiss!1504))))))

(assert (=> d!59153 (validMask!0 (mask!10303 thiss!1504))))

(assert (=> d!59153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10303 thiss!1504)) key!932 (_keys!6421 thiss!1504) (mask!10303 thiss!1504)) lt!118700)))

(declare-fun b!234617 () Bool)

(assert (=> b!234617 (and (bvsge (index!6092 lt!118700) #b00000000000000000000000000000000) (bvslt (index!6092 lt!118700) (size!5848 (_keys!6421 thiss!1504))))))

(assert (=> b!234617 (= e!152383 (= (select (arr!5513 (_keys!6421 thiss!1504)) (index!6092 lt!118700)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234622 () Bool)

(assert (=> b!234622 (and (bvsge (index!6092 lt!118700) #b00000000000000000000000000000000) (bvslt (index!6092 lt!118700) (size!5848 (_keys!6421 thiss!1504))))))

(declare-fun res!115068 () Bool)

(assert (=> b!234622 (= res!115068 (= (select (arr!5513 (_keys!6421 thiss!1504)) (index!6092 lt!118700)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234622 (=> res!115068 e!152383)))

(declare-fun b!234623 () Bool)

(assert (=> b!234623 (= e!152381 e!152382)))

(declare-fun c!39088 () Bool)

(assert (=> b!234623 (= c!39088 (or (= lt!118701 key!932) (= (bvadd lt!118701 lt!118701) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234624 () Bool)

(assert (=> b!234624 (= e!152382 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10303 thiss!1504)) #b00000000000000000000000000000000 (mask!10303 thiss!1504)) key!932 (_keys!6421 thiss!1504) (mask!10303 thiss!1504)))))

(declare-fun b!234625 () Bool)

(assert (=> b!234625 (= e!152384 (bvsge (x!23696 lt!118700) #b01111111111111111111111111111110))))

(assert (= (and d!59153 c!39087) b!234620))

(assert (= (and d!59153 (not c!39087)) b!234623))

(assert (= (and b!234623 c!39088) b!234619))

(assert (= (and b!234623 (not c!39088)) b!234624))

(assert (= (and d!59153 c!39086) b!234625))

(assert (= (and d!59153 (not c!39086)) b!234621))

(assert (= (and b!234621 res!115067) b!234618))

(assert (= (and b!234618 (not res!115069)) b!234622))

(assert (= (and b!234622 (not res!115068)) b!234617))

(assert (=> d!59153 m!255629))

(declare-fun m!255905 () Bool)

(assert (=> d!59153 m!255905))

(assert (=> d!59153 m!255593))

(declare-fun m!255907 () Bool)

(assert (=> b!234622 m!255907))

(assert (=> b!234624 m!255629))

(declare-fun m!255909 () Bool)

(assert (=> b!234624 m!255909))

(assert (=> b!234624 m!255909))

(declare-fun m!255911 () Bool)

(assert (=> b!234624 m!255911))

(assert (=> b!234618 m!255907))

(assert (=> b!234617 m!255907))

(assert (=> d!59075 d!59153))

(declare-fun d!59155 () Bool)

(declare-fun lt!118707 () (_ BitVec 32))

(declare-fun lt!118706 () (_ BitVec 32))

(assert (=> d!59155 (= lt!118707 (bvmul (bvxor lt!118706 (bvlshr lt!118706 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59155 (= lt!118706 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59155 (and (bvsge (mask!10303 thiss!1504) #b00000000000000000000000000000000) (let ((res!115070 (let ((h!4172 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23714 (bvmul (bvxor h!4172 (bvlshr h!4172 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23714 (bvlshr x!23714 #b00000000000000000000000000001101)) (mask!10303 thiss!1504)))))) (and (bvslt res!115070 (bvadd (mask!10303 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!115070 #b00000000000000000000000000000000))))))

(assert (=> d!59155 (= (toIndex!0 key!932 (mask!10303 thiss!1504)) (bvand (bvxor lt!118707 (bvlshr lt!118707 #b00000000000000000000000000001101)) (mask!10303 thiss!1504)))))

(assert (=> d!59075 d!59155))

(assert (=> d!59075 d!59079))

(declare-fun d!59157 () Bool)

(declare-fun e!152386 () Bool)

(assert (=> d!59157 e!152386))

(declare-fun res!115071 () Bool)

(assert (=> d!59157 (=> res!115071 e!152386)))

(declare-fun lt!118710 () Bool)

(assert (=> d!59157 (= res!115071 (not lt!118710))))

(declare-fun lt!118709 () Bool)

(assert (=> d!59157 (= lt!118710 lt!118709)))

(declare-fun lt!118711 () Unit!7234)

(declare-fun e!152385 () Unit!7234)

(assert (=> d!59157 (= lt!118711 e!152385)))

(declare-fun c!39089 () Bool)

(assert (=> d!59157 (= c!39089 lt!118709)))

(assert (=> d!59157 (= lt!118709 (containsKey!257 (toList!1779 lt!118590) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59157 (= (contains!1651 lt!118590 #b0000000000000000000000000000000000000000000000000000000000000000) lt!118710)))

(declare-fun b!234626 () Bool)

(declare-fun lt!118708 () Unit!7234)

(assert (=> b!234626 (= e!152385 lt!118708)))

(assert (=> b!234626 (= lt!118708 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1779 lt!118590) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234626 (isDefined!206 (getValueByKey!265 (toList!1779 lt!118590) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234627 () Bool)

(declare-fun Unit!7240 () Unit!7234)

(assert (=> b!234627 (= e!152385 Unit!7240)))

(declare-fun b!234628 () Bool)

(assert (=> b!234628 (= e!152386 (isDefined!206 (getValueByKey!265 (toList!1779 lt!118590) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59157 c!39089) b!234626))

(assert (= (and d!59157 (not c!39089)) b!234627))

(assert (= (and d!59157 (not res!115071)) b!234628))

(declare-fun m!255913 () Bool)

(assert (=> d!59157 m!255913))

(declare-fun m!255915 () Bool)

(assert (=> b!234626 m!255915))

(assert (=> b!234626 m!255875))

(assert (=> b!234626 m!255875))

(declare-fun m!255917 () Bool)

(assert (=> b!234626 m!255917))

(assert (=> b!234628 m!255875))

(assert (=> b!234628 m!255875))

(assert (=> b!234628 m!255917))

(assert (=> bm!21798 d!59157))

(declare-fun d!59159 () Bool)

(declare-fun res!115076 () Bool)

(declare-fun e!152391 () Bool)

(assert (=> d!59159 (=> res!115076 e!152391)))

(assert (=> d!59159 (= res!115076 (and ((_ is Cons!3520) (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))) (= (_1!2318 (h!4170 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))))) key!932)))))

(assert (=> d!59159 (= (containsKey!257 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))) key!932) e!152391)))

(declare-fun b!234633 () Bool)

(declare-fun e!152392 () Bool)

(assert (=> b!234633 (= e!152391 e!152392)))

(declare-fun res!115077 () Bool)

(assert (=> b!234633 (=> (not res!115077) (not e!152392))))

(assert (=> b!234633 (= res!115077 (and (or (not ((_ is Cons!3520) (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))))) (bvsle (_1!2318 (h!4170 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))))) key!932)) ((_ is Cons!3520) (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))) (bvslt (_1!2318 (h!4170 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504))))) key!932)))))

(declare-fun b!234634 () Bool)

(assert (=> b!234634 (= e!152392 (containsKey!257 (t!8491 (toList!1779 (getCurrentListMap!1307 (_keys!6421 thiss!1504) (_values!4340 thiss!1504) (mask!10303 thiss!1504) (extraKeys!4094 thiss!1504) (zeroValue!4198 thiss!1504) (minValue!4198 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4357 thiss!1504)))) key!932))))

(assert (= (and d!59159 (not res!115076)) b!234633))

(assert (= (and b!234633 res!115077) b!234634))

(declare-fun m!255919 () Bool)

(assert (=> b!234634 m!255919))

(assert (=> d!59081 d!59159))

(declare-fun d!59161 () Bool)

(declare-fun e!152394 () Bool)

(assert (=> d!59161 e!152394))

(declare-fun res!115078 () Bool)

(assert (=> d!59161 (=> res!115078 e!152394)))

(declare-fun lt!118714 () Bool)

(assert (=> d!59161 (= res!115078 (not lt!118714))))

(declare-fun lt!118713 () Bool)

(assert (=> d!59161 (= lt!118714 lt!118713)))

(declare-fun lt!118715 () Unit!7234)

(declare-fun e!152393 () Unit!7234)

(assert (=> d!59161 (= lt!118715 e!152393)))

(declare-fun c!39090 () Bool)

(assert (=> d!59161 (= c!39090 lt!118713)))

(assert (=> d!59161 (= lt!118713 (containsKey!257 (toList!1779 lt!118590) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59161 (= (contains!1651 lt!118590 #b1000000000000000000000000000000000000000000000000000000000000000) lt!118714)))

(declare-fun b!234635 () Bool)

(declare-fun lt!118712 () Unit!7234)

(assert (=> b!234635 (= e!152393 lt!118712)))

(assert (=> b!234635 (= lt!118712 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1779 lt!118590) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234635 (isDefined!206 (getValueByKey!265 (toList!1779 lt!118590) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234636 () Bool)

(declare-fun Unit!7241 () Unit!7234)

(assert (=> b!234636 (= e!152393 Unit!7241)))

(declare-fun b!234637 () Bool)

(assert (=> b!234637 (= e!152394 (isDefined!206 (getValueByKey!265 (toList!1779 lt!118590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59161 c!39090) b!234635))

(assert (= (and d!59161 (not c!39090)) b!234636))

(assert (= (and d!59161 (not res!115078)) b!234637))

(declare-fun m!255921 () Bool)

(assert (=> d!59161 m!255921))

(declare-fun m!255923 () Bool)

(assert (=> b!234635 m!255923))

(assert (=> b!234635 m!255901))

(assert (=> b!234635 m!255901))

(declare-fun m!255925 () Bool)

(assert (=> b!234635 m!255925))

(assert (=> b!234637 m!255901))

(assert (=> b!234637 m!255901))

(assert (=> b!234637 m!255925))

(assert (=> bm!21802 d!59161))

(assert (=> b!234426 d!59093))

(declare-fun b!234638 () Bool)

(declare-fun e!152395 () Bool)

(assert (=> b!234638 (= e!152395 tp_is_empty!6171)))

(declare-fun mapNonEmpty!10447 () Bool)

(declare-fun mapRes!10447 () Bool)

(declare-fun tp!22093 () Bool)

(assert (=> mapNonEmpty!10447 (= mapRes!10447 (and tp!22093 e!152395))))

(declare-fun mapRest!10447 () (Array (_ BitVec 32) ValueCell!2742))

(declare-fun mapValue!10447 () ValueCell!2742)

(declare-fun mapKey!10447 () (_ BitVec 32))

(assert (=> mapNonEmpty!10447 (= mapRest!10446 (store mapRest!10447 mapKey!10447 mapValue!10447))))

(declare-fun condMapEmpty!10447 () Bool)

(declare-fun mapDefault!10447 () ValueCell!2742)

(assert (=> mapNonEmpty!10446 (= condMapEmpty!10447 (= mapRest!10446 ((as const (Array (_ BitVec 32) ValueCell!2742)) mapDefault!10447)))))

(declare-fun e!152396 () Bool)

(assert (=> mapNonEmpty!10446 (= tp!22092 (and e!152396 mapRes!10447))))

(declare-fun b!234639 () Bool)

(assert (=> b!234639 (= e!152396 tp_is_empty!6171)))

(declare-fun mapIsEmpty!10447 () Bool)

(assert (=> mapIsEmpty!10447 mapRes!10447))

(assert (= (and mapNonEmpty!10446 condMapEmpty!10447) mapIsEmpty!10447))

(assert (= (and mapNonEmpty!10446 (not condMapEmpty!10447)) mapNonEmpty!10447))

(assert (= (and mapNonEmpty!10447 ((_ is ValueCellFull!2742) mapValue!10447)) b!234638))

(assert (= (and mapNonEmpty!10446 ((_ is ValueCellFull!2742) mapDefault!10447)) b!234639))

(declare-fun m!255927 () Bool)

(assert (=> mapNonEmpty!10447 m!255927))

(declare-fun b_lambda!7883 () Bool)

(assert (= b_lambda!7879 (or (and b!234306 b_free!6309) b_lambda!7883)))

(declare-fun b_lambda!7885 () Bool)

(assert (= b_lambda!7881 (or (and b!234306 b_free!6309) b_lambda!7885)))

(check-sat (not d!59153) (not b!234547) (not d!59113) (not b!234628) (not d!59091) (not b!234593) (not b!234490) (not d!59115) (not d!59105) (not b!234479) (not d!59095) (not d!59143) (not b!234526) (not b!234484) (not b!234455) (not b!234637) (not d!59149) (not bm!21816) (not d!59151) (not d!59137) (not b_lambda!7883) (not d!59097) (not b!234592) (not b_lambda!7877) (not d!59111) (not b!234494) (not b!234457) (not b!234575) (not b!234528) (not b!234530) (not b!234548) (not b!234531) (not d!59157) (not b!234473) (not d!59101) (not d!59141) (not b!234498) (not b!234535) (not b!234563) (not d!59109) (not b!234497) (not b!234573) (not b!234594) (not d!59133) (not d!59103) (not b!234496) (not b!234598) (not d!59129) (not b!234586) (not bm!21813) (not d!59119) (not bm!21810) (not b!234595) b_and!13231 (not b!234491) (not d!59147) (not d!59161) (not b!234492) (not bm!21807) (not b!234454) (not b!234562) (not d!59107) (not b!234477) (not b!234635) tp_is_empty!6171 (not b!234533) (not d!59125) (not d!59117) (not b!234499) (not d!59127) (not b_next!6309) (not b!234624) (not b!234532) (not d!59099) (not b!234525) (not b!234485) (not d!59121) (not b!234626) (not mapNonEmpty!10447) (not b!234559) (not b!234634) (not b_lambda!7885) (not d!59123))
(check-sat b_and!13231 (not b_next!6309))
