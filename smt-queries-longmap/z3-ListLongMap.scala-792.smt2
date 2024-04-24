; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18840 () Bool)

(assert start!18840)

(declare-fun b!186185 () Bool)

(declare-fun b_free!4591 () Bool)

(declare-fun b_next!4591 () Bool)

(assert (=> b!186185 (= b_free!4591 (not b_next!4591))))

(declare-fun tp!16575 () Bool)

(declare-fun b_and!11209 () Bool)

(assert (=> b!186185 (= tp!16575 b_and!11209)))

(declare-fun res!88076 () Bool)

(declare-fun e!122525 () Bool)

(assert (=> start!18840 (=> (not res!88076) (not e!122525))))

(declare-datatypes ((V!5465 0))(
  ( (V!5466 (val!2226 Int)) )
))
(declare-datatypes ((ValueCell!1838 0))(
  ( (ValueCellFull!1838 (v!4139 V!5465)) (EmptyCell!1838) )
))
(declare-datatypes ((array!7923 0))(
  ( (array!7924 (arr!3740 (Array (_ BitVec 32) (_ BitVec 64))) (size!4056 (_ BitVec 32))) )
))
(declare-datatypes ((array!7925 0))(
  ( (array!7926 (arr!3741 (Array (_ BitVec 32) ValueCell!1838)) (size!4057 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2584 0))(
  ( (LongMapFixedSize!2585 (defaultEntry!3797 Int) (mask!8919 (_ BitVec 32)) (extraKeys!3534 (_ BitVec 32)) (zeroValue!3638 V!5465) (minValue!3638 V!5465) (_size!1341 (_ BitVec 32)) (_keys!5739 array!7923) (_values!3780 array!7925) (_vacant!1341 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2584)

(declare-fun valid!1088 (LongMapFixedSize!2584) Bool)

(assert (=> start!18840 (= res!88076 (valid!1088 thiss!1248))))

(assert (=> start!18840 e!122525))

(declare-fun e!122530 () Bool)

(assert (=> start!18840 e!122530))

(assert (=> start!18840 true))

(declare-fun e!122527 () Bool)

(declare-fun tp_is_empty!4363 () Bool)

(declare-fun array_inv!2411 (array!7923) Bool)

(declare-fun array_inv!2412 (array!7925) Bool)

(assert (=> b!186185 (= e!122530 (and tp!16575 tp_is_empty!4363 (array_inv!2411 (_keys!5739 thiss!1248)) (array_inv!2412 (_values!3780 thiss!1248)) e!122527))))

(declare-fun b!186186 () Bool)

(declare-fun res!88078 () Bool)

(assert (=> b!186186 (=> (not res!88078) (not e!122525))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!186186 (= res!88078 (not (= key!828 (bvneg key!828))))))

(declare-fun b!186187 () Bool)

(declare-fun e!122533 () Bool)

(assert (=> b!186187 (= e!122533 tp_is_empty!4363)))

(declare-fun mapIsEmpty!7509 () Bool)

(declare-fun mapRes!7509 () Bool)

(assert (=> mapIsEmpty!7509 mapRes!7509))

(declare-fun b!186188 () Bool)

(declare-fun e!122528 () Bool)

(assert (=> b!186188 (= e!122525 e!122528)))

(declare-fun res!88075 () Bool)

(assert (=> b!186188 (=> (not res!88075) (not e!122528))))

(declare-datatypes ((SeekEntryResult!631 0))(
  ( (MissingZero!631 (index!4694 (_ BitVec 32))) (Found!631 (index!4695 (_ BitVec 32))) (Intermediate!631 (undefined!1443 Bool) (index!4696 (_ BitVec 32)) (x!20195 (_ BitVec 32))) (Undefined!631) (MissingVacant!631 (index!4697 (_ BitVec 32))) )
))
(declare-fun lt!92090 () SeekEntryResult!631)

(get-info :version)

(assert (=> b!186188 (= res!88075 (and (not ((_ is Undefined!631) lt!92090)) (not ((_ is MissingVacant!631) lt!92090)) (not ((_ is MissingZero!631) lt!92090)) ((_ is Found!631) lt!92090)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7923 (_ BitVec 32)) SeekEntryResult!631)

(assert (=> b!186188 (= lt!92090 (seekEntryOrOpen!0 key!828 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)))))

(declare-fun b!186189 () Bool)

(declare-fun e!122524 () Bool)

(assert (=> b!186189 (= e!122524 (not (= (size!4057 (_values!3780 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8919 thiss!1248)))))))

(declare-fun b!186190 () Bool)

(declare-datatypes ((Unit!5613 0))(
  ( (Unit!5614) )
))
(declare-fun e!122532 () Unit!5613)

(declare-fun lt!92093 () Unit!5613)

(assert (=> b!186190 (= e!122532 lt!92093)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!148 (array!7923 array!7925 (_ BitVec 32) (_ BitVec 32) V!5465 V!5465 (_ BitVec 64) Int) Unit!5613)

(assert (=> b!186190 (= lt!92093 (lemmaInListMapThenSeekEntryOrOpenFindsIt!148 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)))))

(declare-fun res!88079 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186190 (= res!88079 (inRange!0 (index!4695 lt!92090) (mask!8919 thiss!1248)))))

(declare-fun e!122529 () Bool)

(assert (=> b!186190 (=> (not res!88079) (not e!122529))))

(assert (=> b!186190 e!122529))

(declare-fun b!186191 () Bool)

(assert (=> b!186191 (= e!122528 e!122524)))

(declare-fun res!88077 () Bool)

(assert (=> b!186191 (=> (not res!88077) (not e!122524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!186191 (= res!88077 (validMask!0 (mask!8919 thiss!1248)))))

(declare-fun lt!92091 () Unit!5613)

(assert (=> b!186191 (= lt!92091 e!122532)))

(declare-fun c!33383 () Bool)

(declare-datatypes ((tuple2!3414 0))(
  ( (tuple2!3415 (_1!1718 (_ BitVec 64)) (_2!1718 V!5465)) )
))
(declare-datatypes ((List!2340 0))(
  ( (Nil!2337) (Cons!2336 (h!2969 tuple2!3414) (t!7218 List!2340)) )
))
(declare-datatypes ((ListLongMap!2335 0))(
  ( (ListLongMap!2336 (toList!1183 List!2340)) )
))
(declare-fun contains!1291 (ListLongMap!2335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!835 (array!7923 array!7925 (_ BitVec 32) (_ BitVec 32) V!5465 V!5465 (_ BitVec 32) Int) ListLongMap!2335)

(assert (=> b!186191 (= c!33383 (contains!1291 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7509 () Bool)

(declare-fun tp!16574 () Bool)

(assert (=> mapNonEmpty!7509 (= mapRes!7509 (and tp!16574 e!122533))))

(declare-fun mapRest!7509 () (Array (_ BitVec 32) ValueCell!1838))

(declare-fun mapValue!7509 () ValueCell!1838)

(declare-fun mapKey!7509 () (_ BitVec 32))

(assert (=> mapNonEmpty!7509 (= (arr!3741 (_values!3780 thiss!1248)) (store mapRest!7509 mapKey!7509 mapValue!7509))))

(declare-fun b!186192 () Bool)

(assert (=> b!186192 (= e!122529 (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4695 lt!92090)) key!828))))

(declare-fun b!186193 () Bool)

(declare-fun Unit!5615 () Unit!5613)

(assert (=> b!186193 (= e!122532 Unit!5615)))

(declare-fun lt!92092 () Unit!5613)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!140 (array!7923 array!7925 (_ BitVec 32) (_ BitVec 32) V!5465 V!5465 (_ BitVec 64) Int) Unit!5613)

(assert (=> b!186193 (= lt!92092 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!140 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)))))

(assert (=> b!186193 false))

(declare-fun b!186194 () Bool)

(declare-fun e!122526 () Bool)

(assert (=> b!186194 (= e!122526 tp_is_empty!4363)))

(declare-fun b!186195 () Bool)

(assert (=> b!186195 (= e!122527 (and e!122526 mapRes!7509))))

(declare-fun condMapEmpty!7509 () Bool)

(declare-fun mapDefault!7509 () ValueCell!1838)

(assert (=> b!186195 (= condMapEmpty!7509 (= (arr!3741 (_values!3780 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1838)) mapDefault!7509)))))

(assert (= (and start!18840 res!88076) b!186186))

(assert (= (and b!186186 res!88078) b!186188))

(assert (= (and b!186188 res!88075) b!186191))

(assert (= (and b!186191 c!33383) b!186190))

(assert (= (and b!186191 (not c!33383)) b!186193))

(assert (= (and b!186190 res!88079) b!186192))

(assert (= (and b!186191 res!88077) b!186189))

(assert (= (and b!186195 condMapEmpty!7509) mapIsEmpty!7509))

(assert (= (and b!186195 (not condMapEmpty!7509)) mapNonEmpty!7509))

(assert (= (and mapNonEmpty!7509 ((_ is ValueCellFull!1838) mapValue!7509)) b!186187))

(assert (= (and b!186195 ((_ is ValueCellFull!1838) mapDefault!7509)) b!186194))

(assert (= b!186185 b!186195))

(assert (= start!18840 b!186185))

(declare-fun m!213333 () Bool)

(assert (=> b!186190 m!213333))

(declare-fun m!213335 () Bool)

(assert (=> b!186190 m!213335))

(declare-fun m!213337 () Bool)

(assert (=> b!186191 m!213337))

(declare-fun m!213339 () Bool)

(assert (=> b!186191 m!213339))

(assert (=> b!186191 m!213339))

(declare-fun m!213341 () Bool)

(assert (=> b!186191 m!213341))

(declare-fun m!213343 () Bool)

(assert (=> b!186185 m!213343))

(declare-fun m!213345 () Bool)

(assert (=> b!186185 m!213345))

(declare-fun m!213347 () Bool)

(assert (=> b!186192 m!213347))

(declare-fun m!213349 () Bool)

(assert (=> b!186193 m!213349))

(declare-fun m!213351 () Bool)

(assert (=> b!186188 m!213351))

(declare-fun m!213353 () Bool)

(assert (=> mapNonEmpty!7509 m!213353))

(declare-fun m!213355 () Bool)

(assert (=> start!18840 m!213355))

(check-sat (not mapNonEmpty!7509) (not b!186190) (not b_next!4591) (not b!186188) (not b!186193) b_and!11209 (not b!186191) tp_is_empty!4363 (not b!186185) (not start!18840))
(check-sat b_and!11209 (not b_next!4591))
(get-model)

(declare-fun d!55239 () Bool)

(declare-fun lt!92124 () SeekEntryResult!631)

(assert (=> d!55239 (and (or ((_ is Undefined!631) lt!92124) (not ((_ is Found!631) lt!92124)) (and (bvsge (index!4695 lt!92124) #b00000000000000000000000000000000) (bvslt (index!4695 lt!92124) (size!4056 (_keys!5739 thiss!1248))))) (or ((_ is Undefined!631) lt!92124) ((_ is Found!631) lt!92124) (not ((_ is MissingZero!631) lt!92124)) (and (bvsge (index!4694 lt!92124) #b00000000000000000000000000000000) (bvslt (index!4694 lt!92124) (size!4056 (_keys!5739 thiss!1248))))) (or ((_ is Undefined!631) lt!92124) ((_ is Found!631) lt!92124) ((_ is MissingZero!631) lt!92124) (not ((_ is MissingVacant!631) lt!92124)) (and (bvsge (index!4697 lt!92124) #b00000000000000000000000000000000) (bvslt (index!4697 lt!92124) (size!4056 (_keys!5739 thiss!1248))))) (or ((_ is Undefined!631) lt!92124) (ite ((_ is Found!631) lt!92124) (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4695 lt!92124)) key!828) (ite ((_ is MissingZero!631) lt!92124) (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4694 lt!92124)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!631) lt!92124) (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4697 lt!92124)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!122601 () SeekEntryResult!631)

(assert (=> d!55239 (= lt!92124 e!122601)))

(declare-fun c!33397 () Bool)

(declare-fun lt!92126 () SeekEntryResult!631)

(assert (=> d!55239 (= c!33397 (and ((_ is Intermediate!631) lt!92126) (undefined!1443 lt!92126)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7923 (_ BitVec 32)) SeekEntryResult!631)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55239 (= lt!92126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8919 thiss!1248)) key!828 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)))))

(assert (=> d!55239 (validMask!0 (mask!8919 thiss!1248))))

(assert (=> d!55239 (= (seekEntryOrOpen!0 key!828 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)) lt!92124)))

(declare-fun b!186274 () Bool)

(declare-fun e!122602 () SeekEntryResult!631)

(assert (=> b!186274 (= e!122601 e!122602)))

(declare-fun lt!92125 () (_ BitVec 64))

(assert (=> b!186274 (= lt!92125 (select (arr!3740 (_keys!5739 thiss!1248)) (index!4696 lt!92126)))))

(declare-fun c!33396 () Bool)

(assert (=> b!186274 (= c!33396 (= lt!92125 key!828))))

(declare-fun b!186275 () Bool)

(declare-fun c!33398 () Bool)

(assert (=> b!186275 (= c!33398 (= lt!92125 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!122600 () SeekEntryResult!631)

(assert (=> b!186275 (= e!122602 e!122600)))

(declare-fun b!186276 () Bool)

(assert (=> b!186276 (= e!122600 (MissingZero!631 (index!4696 lt!92126)))))

(declare-fun b!186277 () Bool)

(assert (=> b!186277 (= e!122601 Undefined!631)))

(declare-fun b!186278 () Bool)

(assert (=> b!186278 (= e!122602 (Found!631 (index!4696 lt!92126)))))

(declare-fun b!186279 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7923 (_ BitVec 32)) SeekEntryResult!631)

(assert (=> b!186279 (= e!122600 (seekKeyOrZeroReturnVacant!0 (x!20195 lt!92126) (index!4696 lt!92126) (index!4696 lt!92126) key!828 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)))))

(assert (= (and d!55239 c!33397) b!186277))

(assert (= (and d!55239 (not c!33397)) b!186274))

(assert (= (and b!186274 c!33396) b!186278))

(assert (= (and b!186274 (not c!33396)) b!186275))

(assert (= (and b!186275 c!33398) b!186276))

(assert (= (and b!186275 (not c!33398)) b!186279))

(declare-fun m!213405 () Bool)

(assert (=> d!55239 m!213405))

(declare-fun m!213407 () Bool)

(assert (=> d!55239 m!213407))

(declare-fun m!213409 () Bool)

(assert (=> d!55239 m!213409))

(declare-fun m!213411 () Bool)

(assert (=> d!55239 m!213411))

(declare-fun m!213413 () Bool)

(assert (=> d!55239 m!213413))

(assert (=> d!55239 m!213337))

(assert (=> d!55239 m!213411))

(declare-fun m!213415 () Bool)

(assert (=> b!186274 m!213415))

(declare-fun m!213417 () Bool)

(assert (=> b!186279 m!213417))

(assert (=> b!186188 d!55239))

(declare-fun d!55241 () Bool)

(declare-fun res!88116 () Bool)

(declare-fun e!122605 () Bool)

(assert (=> d!55241 (=> (not res!88116) (not e!122605))))

(declare-fun simpleValid!184 (LongMapFixedSize!2584) Bool)

(assert (=> d!55241 (= res!88116 (simpleValid!184 thiss!1248))))

(assert (=> d!55241 (= (valid!1088 thiss!1248) e!122605)))

(declare-fun b!186286 () Bool)

(declare-fun res!88117 () Bool)

(assert (=> b!186286 (=> (not res!88117) (not e!122605))))

(declare-fun arrayCountValidKeys!0 (array!7923 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186286 (= res!88117 (= (arrayCountValidKeys!0 (_keys!5739 thiss!1248) #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))) (_size!1341 thiss!1248)))))

(declare-fun b!186287 () Bool)

(declare-fun res!88118 () Bool)

(assert (=> b!186287 (=> (not res!88118) (not e!122605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7923 (_ BitVec 32)) Bool)

(assert (=> b!186287 (= res!88118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)))))

(declare-fun b!186288 () Bool)

(declare-datatypes ((List!2343 0))(
  ( (Nil!2340) (Cons!2339 (h!2972 (_ BitVec 64)) (t!7223 List!2343)) )
))
(declare-fun arrayNoDuplicates!0 (array!7923 (_ BitVec 32) List!2343) Bool)

(assert (=> b!186288 (= e!122605 (arrayNoDuplicates!0 (_keys!5739 thiss!1248) #b00000000000000000000000000000000 Nil!2340))))

(assert (= (and d!55241 res!88116) b!186286))

(assert (= (and b!186286 res!88117) b!186287))

(assert (= (and b!186287 res!88118) b!186288))

(declare-fun m!213419 () Bool)

(assert (=> d!55241 m!213419))

(declare-fun m!213421 () Bool)

(assert (=> b!186286 m!213421))

(declare-fun m!213423 () Bool)

(assert (=> b!186287 m!213423))

(declare-fun m!213425 () Bool)

(assert (=> b!186288 m!213425))

(assert (=> start!18840 d!55241))

(declare-fun b!186305 () Bool)

(declare-fun e!122615 () Bool)

(declare-fun e!122614 () Bool)

(assert (=> b!186305 (= e!122615 e!122614)))

(declare-fun c!33404 () Bool)

(declare-fun lt!92131 () SeekEntryResult!631)

(assert (=> b!186305 (= c!33404 ((_ is MissingVacant!631) lt!92131))))

(declare-fun b!186306 () Bool)

(assert (=> b!186306 (= e!122614 ((_ is Undefined!631) lt!92131))))

(declare-fun b!186307 () Bool)

(declare-fun e!122617 () Bool)

(assert (=> b!186307 (= e!122615 e!122617)))

(declare-fun res!88127 () Bool)

(declare-fun call!18760 () Bool)

(assert (=> b!186307 (= res!88127 call!18760)))

(assert (=> b!186307 (=> (not res!88127) (not e!122617))))

(declare-fun bm!18756 () Bool)

(declare-fun call!18759 () Bool)

(declare-fun arrayContainsKey!0 (array!7923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18756 (= call!18759 (arrayContainsKey!0 (_keys!5739 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!186308 () Bool)

(assert (=> b!186308 (= e!122617 (not call!18759))))

(declare-fun b!186309 () Bool)

(declare-fun e!122616 () Bool)

(assert (=> b!186309 (= e!122616 (not call!18759))))

(declare-fun bm!18757 () Bool)

(declare-fun c!33403 () Bool)

(assert (=> bm!18757 (= call!18760 (inRange!0 (ite c!33403 (index!4694 lt!92131) (index!4697 lt!92131)) (mask!8919 thiss!1248)))))

(declare-fun b!186311 () Bool)

(assert (=> b!186311 (and (bvsge (index!4694 lt!92131) #b00000000000000000000000000000000) (bvslt (index!4694 lt!92131) (size!4056 (_keys!5739 thiss!1248))))))

(declare-fun res!88130 () Bool)

(assert (=> b!186311 (= res!88130 (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4694 lt!92131)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186311 (=> (not res!88130) (not e!122617))))

(declare-fun b!186312 () Bool)

(declare-fun res!88129 () Bool)

(assert (=> b!186312 (=> (not res!88129) (not e!122616))))

(assert (=> b!186312 (= res!88129 (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4697 lt!92131)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186312 (and (bvsge (index!4697 lt!92131) #b00000000000000000000000000000000) (bvslt (index!4697 lt!92131) (size!4056 (_keys!5739 thiss!1248))))))

(declare-fun b!186310 () Bool)

(declare-fun res!88128 () Bool)

(assert (=> b!186310 (=> (not res!88128) (not e!122616))))

(assert (=> b!186310 (= res!88128 call!18760)))

(assert (=> b!186310 (= e!122614 e!122616)))

(declare-fun d!55243 () Bool)

(assert (=> d!55243 e!122615))

(assert (=> d!55243 (= c!33403 ((_ is MissingZero!631) lt!92131))))

(assert (=> d!55243 (= lt!92131 (seekEntryOrOpen!0 key!828 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)))))

(declare-fun lt!92132 () Unit!5613)

(declare-fun choose!991 (array!7923 array!7925 (_ BitVec 32) (_ BitVec 32) V!5465 V!5465 (_ BitVec 64) Int) Unit!5613)

(assert (=> d!55243 (= lt!92132 (choose!991 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)))))

(assert (=> d!55243 (validMask!0 (mask!8919 thiss!1248))))

(assert (=> d!55243 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!140 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)) lt!92132)))

(assert (= (and d!55243 c!33403) b!186307))

(assert (= (and d!55243 (not c!33403)) b!186305))

(assert (= (and b!186307 res!88127) b!186311))

(assert (= (and b!186311 res!88130) b!186308))

(assert (= (and b!186305 c!33404) b!186310))

(assert (= (and b!186305 (not c!33404)) b!186306))

(assert (= (and b!186310 res!88128) b!186312))

(assert (= (and b!186312 res!88129) b!186309))

(assert (= (or b!186307 b!186310) bm!18757))

(assert (= (or b!186308 b!186309) bm!18756))

(declare-fun m!213427 () Bool)

(assert (=> b!186311 m!213427))

(declare-fun m!213429 () Bool)

(assert (=> b!186312 m!213429))

(declare-fun m!213431 () Bool)

(assert (=> bm!18756 m!213431))

(assert (=> d!55243 m!213351))

(declare-fun m!213433 () Bool)

(assert (=> d!55243 m!213433))

(assert (=> d!55243 m!213337))

(declare-fun m!213435 () Bool)

(assert (=> bm!18757 m!213435))

(assert (=> b!186193 d!55243))

(declare-fun d!55245 () Bool)

(assert (=> d!55245 (= (array_inv!2411 (_keys!5739 thiss!1248)) (bvsge (size!4056 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186185 d!55245))

(declare-fun d!55247 () Bool)

(assert (=> d!55247 (= (array_inv!2412 (_values!3780 thiss!1248)) (bvsge (size!4057 (_values!3780 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186185 d!55247))

(declare-fun d!55249 () Bool)

(declare-fun e!122620 () Bool)

(assert (=> d!55249 e!122620))

(declare-fun res!88135 () Bool)

(assert (=> d!55249 (=> (not res!88135) (not e!122620))))

(declare-fun lt!92137 () SeekEntryResult!631)

(assert (=> d!55249 (= res!88135 ((_ is Found!631) lt!92137))))

(assert (=> d!55249 (= lt!92137 (seekEntryOrOpen!0 key!828 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)))))

(declare-fun lt!92138 () Unit!5613)

(declare-fun choose!992 (array!7923 array!7925 (_ BitVec 32) (_ BitVec 32) V!5465 V!5465 (_ BitVec 64) Int) Unit!5613)

(assert (=> d!55249 (= lt!92138 (choose!992 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)))))

(assert (=> d!55249 (validMask!0 (mask!8919 thiss!1248))))

(assert (=> d!55249 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!148 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)) lt!92138)))

(declare-fun b!186317 () Bool)

(declare-fun res!88136 () Bool)

(assert (=> b!186317 (=> (not res!88136) (not e!122620))))

(assert (=> b!186317 (= res!88136 (inRange!0 (index!4695 lt!92137) (mask!8919 thiss!1248)))))

(declare-fun b!186318 () Bool)

(assert (=> b!186318 (= e!122620 (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4695 lt!92137)) key!828))))

(assert (=> b!186318 (and (bvsge (index!4695 lt!92137) #b00000000000000000000000000000000) (bvslt (index!4695 lt!92137) (size!4056 (_keys!5739 thiss!1248))))))

(assert (= (and d!55249 res!88135) b!186317))

(assert (= (and b!186317 res!88136) b!186318))

(assert (=> d!55249 m!213351))

(declare-fun m!213437 () Bool)

(assert (=> d!55249 m!213437))

(assert (=> d!55249 m!213337))

(declare-fun m!213439 () Bool)

(assert (=> b!186317 m!213439))

(declare-fun m!213441 () Bool)

(assert (=> b!186318 m!213441))

(assert (=> b!186190 d!55249))

(declare-fun d!55251 () Bool)

(assert (=> d!55251 (= (inRange!0 (index!4695 lt!92090) (mask!8919 thiss!1248)) (and (bvsge (index!4695 lt!92090) #b00000000000000000000000000000000) (bvslt (index!4695 lt!92090) (bvadd (mask!8919 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186190 d!55251))

(declare-fun d!55253 () Bool)

(assert (=> d!55253 (= (validMask!0 (mask!8919 thiss!1248)) (and (or (= (mask!8919 thiss!1248) #b00000000000000000000000000000111) (= (mask!8919 thiss!1248) #b00000000000000000000000000001111) (= (mask!8919 thiss!1248) #b00000000000000000000000000011111) (= (mask!8919 thiss!1248) #b00000000000000000000000000111111) (= (mask!8919 thiss!1248) #b00000000000000000000000001111111) (= (mask!8919 thiss!1248) #b00000000000000000000000011111111) (= (mask!8919 thiss!1248) #b00000000000000000000000111111111) (= (mask!8919 thiss!1248) #b00000000000000000000001111111111) (= (mask!8919 thiss!1248) #b00000000000000000000011111111111) (= (mask!8919 thiss!1248) #b00000000000000000000111111111111) (= (mask!8919 thiss!1248) #b00000000000000000001111111111111) (= (mask!8919 thiss!1248) #b00000000000000000011111111111111) (= (mask!8919 thiss!1248) #b00000000000000000111111111111111) (= (mask!8919 thiss!1248) #b00000000000000001111111111111111) (= (mask!8919 thiss!1248) #b00000000000000011111111111111111) (= (mask!8919 thiss!1248) #b00000000000000111111111111111111) (= (mask!8919 thiss!1248) #b00000000000001111111111111111111) (= (mask!8919 thiss!1248) #b00000000000011111111111111111111) (= (mask!8919 thiss!1248) #b00000000000111111111111111111111) (= (mask!8919 thiss!1248) #b00000000001111111111111111111111) (= (mask!8919 thiss!1248) #b00000000011111111111111111111111) (= (mask!8919 thiss!1248) #b00000000111111111111111111111111) (= (mask!8919 thiss!1248) #b00000001111111111111111111111111) (= (mask!8919 thiss!1248) #b00000011111111111111111111111111) (= (mask!8919 thiss!1248) #b00000111111111111111111111111111) (= (mask!8919 thiss!1248) #b00001111111111111111111111111111) (= (mask!8919 thiss!1248) #b00011111111111111111111111111111) (= (mask!8919 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8919 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!186191 d!55253))

(declare-fun d!55255 () Bool)

(declare-fun e!122625 () Bool)

(assert (=> d!55255 e!122625))

(declare-fun res!88139 () Bool)

(assert (=> d!55255 (=> res!88139 e!122625)))

(declare-fun lt!92147 () Bool)

(assert (=> d!55255 (= res!88139 (not lt!92147))))

(declare-fun lt!92148 () Bool)

(assert (=> d!55255 (= lt!92147 lt!92148)))

(declare-fun lt!92150 () Unit!5613)

(declare-fun e!122626 () Unit!5613)

(assert (=> d!55255 (= lt!92150 e!122626)))

(declare-fun c!33407 () Bool)

(assert (=> d!55255 (= c!33407 lt!92148)))

(declare-fun containsKey!229 (List!2340 (_ BitVec 64)) Bool)

(assert (=> d!55255 (= lt!92148 (containsKey!229 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))

(assert (=> d!55255 (= (contains!1291 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)) key!828) lt!92147)))

(declare-fun b!186325 () Bool)

(declare-fun lt!92149 () Unit!5613)

(assert (=> b!186325 (= e!122626 lt!92149)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!177 (List!2340 (_ BitVec 64)) Unit!5613)

(assert (=> b!186325 (= lt!92149 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))

(declare-datatypes ((Option!232 0))(
  ( (Some!231 (v!4142 V!5465)) (None!230) )
))
(declare-fun isDefined!178 (Option!232) Bool)

(declare-fun getValueByKey!226 (List!2340 (_ BitVec 64)) Option!232)

(assert (=> b!186325 (isDefined!178 (getValueByKey!226 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))

(declare-fun b!186326 () Bool)

(declare-fun Unit!5622 () Unit!5613)

(assert (=> b!186326 (= e!122626 Unit!5622)))

(declare-fun b!186327 () Bool)

(assert (=> b!186327 (= e!122625 (isDefined!178 (getValueByKey!226 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828)))))

(assert (= (and d!55255 c!33407) b!186325))

(assert (= (and d!55255 (not c!33407)) b!186326))

(assert (= (and d!55255 (not res!88139)) b!186327))

(declare-fun m!213443 () Bool)

(assert (=> d!55255 m!213443))

(declare-fun m!213445 () Bool)

(assert (=> b!186325 m!213445))

(declare-fun m!213447 () Bool)

(assert (=> b!186325 m!213447))

(assert (=> b!186325 m!213447))

(declare-fun m!213449 () Bool)

(assert (=> b!186325 m!213449))

(assert (=> b!186327 m!213447))

(assert (=> b!186327 m!213447))

(assert (=> b!186327 m!213449))

(assert (=> b!186191 d!55255))

(declare-fun b!186370 () Bool)

(declare-fun e!122656 () Bool)

(declare-fun e!122654 () Bool)

(assert (=> b!186370 (= e!122656 e!122654)))

(declare-fun c!33423 () Bool)

(assert (=> b!186370 (= c!33423 (not (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!186371 () Bool)

(declare-fun e!122659 () ListLongMap!2335)

(declare-fun call!18776 () ListLongMap!2335)

(assert (=> b!186371 (= e!122659 call!18776)))

(declare-fun b!186372 () Bool)

(declare-fun res!88159 () Bool)

(assert (=> b!186372 (=> (not res!88159) (not e!122656))))

(declare-fun e!122655 () Bool)

(assert (=> b!186372 (= res!88159 e!122655)))

(declare-fun c!33421 () Bool)

(assert (=> b!186372 (= c!33421 (not (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!186373 () Bool)

(declare-fun call!18780 () ListLongMap!2335)

(assert (=> b!186373 (= e!122659 call!18780)))

(declare-fun b!186374 () Bool)

(declare-fun e!122660 () Bool)

(assert (=> b!186374 (= e!122654 e!122660)))

(declare-fun res!88164 () Bool)

(declare-fun call!18779 () Bool)

(assert (=> b!186374 (= res!88164 call!18779)))

(assert (=> b!186374 (=> (not res!88164) (not e!122660))))

(declare-fun b!186375 () Bool)

(declare-fun e!122658 () Bool)

(assert (=> b!186375 (= e!122655 e!122658)))

(declare-fun res!88162 () Bool)

(declare-fun call!18781 () Bool)

(assert (=> b!186375 (= res!88162 call!18781)))

(assert (=> b!186375 (=> (not res!88162) (not e!122658))))

(declare-fun bm!18772 () Bool)

(declare-fun lt!92200 () ListLongMap!2335)

(assert (=> bm!18772 (= call!18781 (contains!1291 lt!92200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18773 () Bool)

(assert (=> bm!18773 (= call!18779 (contains!1291 lt!92200 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18774 () Bool)

(declare-fun call!18777 () ListLongMap!2335)

(declare-fun call!18775 () ListLongMap!2335)

(assert (=> bm!18774 (= call!18777 call!18775)))

(declare-fun b!186376 () Bool)

(declare-fun e!122661 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!186376 (= e!122661 (validKeyInArray!0 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186377 () Bool)

(declare-fun apply!168 (ListLongMap!2335 (_ BitVec 64)) V!5465)

(assert (=> b!186377 (= e!122658 (= (apply!168 lt!92200 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3638 thiss!1248)))))

(declare-fun b!186378 () Bool)

(declare-fun e!122665 () ListLongMap!2335)

(declare-fun call!18778 () ListLongMap!2335)

(declare-fun +!288 (ListLongMap!2335 tuple2!3414) ListLongMap!2335)

(assert (=> b!186378 (= e!122665 (+!288 call!18778 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))

(declare-fun b!186379 () Bool)

(declare-fun e!122663 () ListLongMap!2335)

(assert (=> b!186379 (= e!122665 e!122663)))

(declare-fun c!33420 () Bool)

(assert (=> b!186379 (= c!33420 (and (not (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!186380 () Bool)

(declare-fun res!88161 () Bool)

(assert (=> b!186380 (=> (not res!88161) (not e!122656))))

(declare-fun e!122664 () Bool)

(assert (=> b!186380 (= res!88161 e!122664)))

(declare-fun res!88166 () Bool)

(assert (=> b!186380 (=> res!88166 e!122664)))

(assert (=> b!186380 (= res!88166 (not e!122661))))

(declare-fun res!88160 () Bool)

(assert (=> b!186380 (=> (not res!88160) (not e!122661))))

(assert (=> b!186380 (= res!88160 (bvslt #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))

(declare-fun d!55257 () Bool)

(assert (=> d!55257 e!122656))

(declare-fun res!88158 () Bool)

(assert (=> d!55257 (=> (not res!88158) (not e!122656))))

(assert (=> d!55257 (= res!88158 (or (bvsge #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))))

(declare-fun lt!92213 () ListLongMap!2335)

(assert (=> d!55257 (= lt!92200 lt!92213)))

(declare-fun lt!92196 () Unit!5613)

(declare-fun e!122653 () Unit!5613)

(assert (=> d!55257 (= lt!92196 e!122653)))

(declare-fun c!33424 () Bool)

(declare-fun e!122662 () Bool)

(assert (=> d!55257 (= c!33424 e!122662)))

(declare-fun res!88163 () Bool)

(assert (=> d!55257 (=> (not res!88163) (not e!122662))))

(assert (=> d!55257 (= res!88163 (bvslt #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))

(assert (=> d!55257 (= lt!92213 e!122665)))

(declare-fun c!33422 () Bool)

(assert (=> d!55257 (= c!33422 (and (not (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55257 (validMask!0 (mask!8919 thiss!1248))))

(assert (=> d!55257 (= (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)) lt!92200)))

(declare-fun b!186381 () Bool)

(assert (=> b!186381 (= e!122663 call!18780)))

(declare-fun b!186382 () Bool)

(assert (=> b!186382 (= e!122654 (not call!18779))))

(declare-fun b!186383 () Bool)

(declare-fun Unit!5623 () Unit!5613)

(assert (=> b!186383 (= e!122653 Unit!5623)))

(declare-fun bm!18775 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!199 (array!7923 array!7925 (_ BitVec 32) (_ BitVec 32) V!5465 V!5465 (_ BitVec 32) Int) ListLongMap!2335)

(assert (=> bm!18775 (= call!18775 (getCurrentListMapNoExtraKeys!199 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))

(declare-fun b!186384 () Bool)

(declare-fun e!122657 () Bool)

(assert (=> b!186384 (= e!122664 e!122657)))

(declare-fun res!88165 () Bool)

(assert (=> b!186384 (=> (not res!88165) (not e!122657))))

(assert (=> b!186384 (= res!88165 (contains!1291 lt!92200 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186384 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))

(declare-fun b!186385 () Bool)

(declare-fun get!2157 (ValueCell!1838 V!5465) V!5465)

(declare-fun dynLambda!511 (Int (_ BitVec 64)) V!5465)

(assert (=> b!186385 (= e!122657 (= (apply!168 lt!92200 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)) (get!2157 (select (arr!3741 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4057 (_values!3780 thiss!1248))))))

(assert (=> b!186385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))

(declare-fun b!186386 () Bool)

(declare-fun lt!92214 () Unit!5613)

(assert (=> b!186386 (= e!122653 lt!92214)))

(declare-fun lt!92205 () ListLongMap!2335)

(assert (=> b!186386 (= lt!92205 (getCurrentListMapNoExtraKeys!199 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))

(declare-fun lt!92204 () (_ BitVec 64))

(assert (=> b!186386 (= lt!92204 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92199 () (_ BitVec 64))

(assert (=> b!186386 (= lt!92199 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92216 () Unit!5613)

(declare-fun addStillContains!144 (ListLongMap!2335 (_ BitVec 64) V!5465 (_ BitVec 64)) Unit!5613)

(assert (=> b!186386 (= lt!92216 (addStillContains!144 lt!92205 lt!92204 (zeroValue!3638 thiss!1248) lt!92199))))

(assert (=> b!186386 (contains!1291 (+!288 lt!92205 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248))) lt!92199)))

(declare-fun lt!92203 () Unit!5613)

(assert (=> b!186386 (= lt!92203 lt!92216)))

(declare-fun lt!92215 () ListLongMap!2335)

(assert (=> b!186386 (= lt!92215 (getCurrentListMapNoExtraKeys!199 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))

(declare-fun lt!92201 () (_ BitVec 64))

(assert (=> b!186386 (= lt!92201 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92207 () (_ BitVec 64))

(assert (=> b!186386 (= lt!92207 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92211 () Unit!5613)

(declare-fun addApplyDifferent!144 (ListLongMap!2335 (_ BitVec 64) V!5465 (_ BitVec 64)) Unit!5613)

(assert (=> b!186386 (= lt!92211 (addApplyDifferent!144 lt!92215 lt!92201 (minValue!3638 thiss!1248) lt!92207))))

(assert (=> b!186386 (= (apply!168 (+!288 lt!92215 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248))) lt!92207) (apply!168 lt!92215 lt!92207))))

(declare-fun lt!92197 () Unit!5613)

(assert (=> b!186386 (= lt!92197 lt!92211)))

(declare-fun lt!92195 () ListLongMap!2335)

(assert (=> b!186386 (= lt!92195 (getCurrentListMapNoExtraKeys!199 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))

(declare-fun lt!92206 () (_ BitVec 64))

(assert (=> b!186386 (= lt!92206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92212 () (_ BitVec 64))

(assert (=> b!186386 (= lt!92212 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92202 () Unit!5613)

(assert (=> b!186386 (= lt!92202 (addApplyDifferent!144 lt!92195 lt!92206 (zeroValue!3638 thiss!1248) lt!92212))))

(assert (=> b!186386 (= (apply!168 (+!288 lt!92195 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248))) lt!92212) (apply!168 lt!92195 lt!92212))))

(declare-fun lt!92210 () Unit!5613)

(assert (=> b!186386 (= lt!92210 lt!92202)))

(declare-fun lt!92198 () ListLongMap!2335)

(assert (=> b!186386 (= lt!92198 (getCurrentListMapNoExtraKeys!199 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))

(declare-fun lt!92208 () (_ BitVec 64))

(assert (=> b!186386 (= lt!92208 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92209 () (_ BitVec 64))

(assert (=> b!186386 (= lt!92209 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186386 (= lt!92214 (addApplyDifferent!144 lt!92198 lt!92208 (minValue!3638 thiss!1248) lt!92209))))

(assert (=> b!186386 (= (apply!168 (+!288 lt!92198 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248))) lt!92209) (apply!168 lt!92198 lt!92209))))

(declare-fun b!186387 () Bool)

(declare-fun c!33425 () Bool)

(assert (=> b!186387 (= c!33425 (and (not (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!186387 (= e!122663 e!122659)))

(declare-fun b!186388 () Bool)

(assert (=> b!186388 (= e!122655 (not call!18781))))

(declare-fun bm!18776 () Bool)

(assert (=> bm!18776 (= call!18776 call!18777)))

(declare-fun bm!18777 () Bool)

(assert (=> bm!18777 (= call!18778 (+!288 (ite c!33422 call!18775 (ite c!33420 call!18777 call!18776)) (ite (or c!33422 c!33420) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))

(declare-fun b!186389 () Bool)

(assert (=> b!186389 (= e!122662 (validKeyInArray!0 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186390 () Bool)

(assert (=> b!186390 (= e!122660 (= (apply!168 lt!92200 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3638 thiss!1248)))))

(declare-fun bm!18778 () Bool)

(assert (=> bm!18778 (= call!18780 call!18778)))

(assert (= (and d!55257 c!33422) b!186378))

(assert (= (and d!55257 (not c!33422)) b!186379))

(assert (= (and b!186379 c!33420) b!186381))

(assert (= (and b!186379 (not c!33420)) b!186387))

(assert (= (and b!186387 c!33425) b!186373))

(assert (= (and b!186387 (not c!33425)) b!186371))

(assert (= (or b!186373 b!186371) bm!18776))

(assert (= (or b!186381 bm!18776) bm!18774))

(assert (= (or b!186381 b!186373) bm!18778))

(assert (= (or b!186378 bm!18774) bm!18775))

(assert (= (or b!186378 bm!18778) bm!18777))

(assert (= (and d!55257 res!88163) b!186389))

(assert (= (and d!55257 c!33424) b!186386))

(assert (= (and d!55257 (not c!33424)) b!186383))

(assert (= (and d!55257 res!88158) b!186380))

(assert (= (and b!186380 res!88160) b!186376))

(assert (= (and b!186380 (not res!88166)) b!186384))

(assert (= (and b!186384 res!88165) b!186385))

(assert (= (and b!186380 res!88161) b!186372))

(assert (= (and b!186372 c!33421) b!186375))

(assert (= (and b!186372 (not c!33421)) b!186388))

(assert (= (and b!186375 res!88162) b!186377))

(assert (= (or b!186375 b!186388) bm!18772))

(assert (= (and b!186372 res!88159) b!186370))

(assert (= (and b!186370 c!33423) b!186374))

(assert (= (and b!186370 (not c!33423)) b!186382))

(assert (= (and b!186374 res!88164) b!186390))

(assert (= (or b!186374 b!186382) bm!18773))

(declare-fun b_lambda!7281 () Bool)

(assert (=> (not b_lambda!7281) (not b!186385)))

(declare-fun t!7222 () Bool)

(declare-fun tb!2839 () Bool)

(assert (=> (and b!186185 (= (defaultEntry!3797 thiss!1248) (defaultEntry!3797 thiss!1248)) t!7222) tb!2839))

(declare-fun result!4811 () Bool)

(assert (=> tb!2839 (= result!4811 tp_is_empty!4363)))

(assert (=> b!186385 t!7222))

(declare-fun b_and!11215 () Bool)

(assert (= b_and!11209 (and (=> t!7222 result!4811) b_and!11215)))

(declare-fun m!213451 () Bool)

(assert (=> b!186376 m!213451))

(assert (=> b!186376 m!213451))

(declare-fun m!213453 () Bool)

(assert (=> b!186376 m!213453))

(declare-fun m!213455 () Bool)

(assert (=> b!186385 m!213455))

(declare-fun m!213457 () Bool)

(assert (=> b!186385 m!213457))

(assert (=> b!186385 m!213457))

(assert (=> b!186385 m!213455))

(declare-fun m!213459 () Bool)

(assert (=> b!186385 m!213459))

(assert (=> b!186385 m!213451))

(declare-fun m!213461 () Bool)

(assert (=> b!186385 m!213461))

(assert (=> b!186385 m!213451))

(assert (=> b!186389 m!213451))

(assert (=> b!186389 m!213451))

(assert (=> b!186389 m!213453))

(declare-fun m!213463 () Bool)

(assert (=> b!186377 m!213463))

(declare-fun m!213465 () Bool)

(assert (=> b!186378 m!213465))

(declare-fun m!213467 () Bool)

(assert (=> bm!18777 m!213467))

(assert (=> d!55257 m!213337))

(declare-fun m!213469 () Bool)

(assert (=> bm!18773 m!213469))

(assert (=> b!186386 m!213451))

(declare-fun m!213471 () Bool)

(assert (=> b!186386 m!213471))

(declare-fun m!213473 () Bool)

(assert (=> b!186386 m!213473))

(declare-fun m!213475 () Bool)

(assert (=> b!186386 m!213475))

(declare-fun m!213477 () Bool)

(assert (=> b!186386 m!213477))

(declare-fun m!213479 () Bool)

(assert (=> b!186386 m!213479))

(declare-fun m!213481 () Bool)

(assert (=> b!186386 m!213481))

(assert (=> b!186386 m!213477))

(declare-fun m!213483 () Bool)

(assert (=> b!186386 m!213483))

(declare-fun m!213485 () Bool)

(assert (=> b!186386 m!213485))

(declare-fun m!213487 () Bool)

(assert (=> b!186386 m!213487))

(assert (=> b!186386 m!213481))

(declare-fun m!213489 () Bool)

(assert (=> b!186386 m!213489))

(assert (=> b!186386 m!213483))

(declare-fun m!213491 () Bool)

(assert (=> b!186386 m!213491))

(declare-fun m!213493 () Bool)

(assert (=> b!186386 m!213493))

(declare-fun m!213495 () Bool)

(assert (=> b!186386 m!213495))

(declare-fun m!213497 () Bool)

(assert (=> b!186386 m!213497))

(declare-fun m!213499 () Bool)

(assert (=> b!186386 m!213499))

(assert (=> b!186386 m!213487))

(declare-fun m!213501 () Bool)

(assert (=> b!186386 m!213501))

(declare-fun m!213503 () Bool)

(assert (=> bm!18772 m!213503))

(assert (=> bm!18775 m!213493))

(assert (=> b!186384 m!213451))

(assert (=> b!186384 m!213451))

(declare-fun m!213505 () Bool)

(assert (=> b!186384 m!213505))

(declare-fun m!213507 () Bool)

(assert (=> b!186390 m!213507))

(assert (=> b!186191 d!55257))

(declare-fun condMapEmpty!7518 () Bool)

(declare-fun mapDefault!7518 () ValueCell!1838)

(assert (=> mapNonEmpty!7509 (= condMapEmpty!7518 (= mapRest!7509 ((as const (Array (_ BitVec 32) ValueCell!1838)) mapDefault!7518)))))

(declare-fun e!122670 () Bool)

(declare-fun mapRes!7518 () Bool)

(assert (=> mapNonEmpty!7509 (= tp!16574 (and e!122670 mapRes!7518))))

(declare-fun b!186400 () Bool)

(assert (=> b!186400 (= e!122670 tp_is_empty!4363)))

(declare-fun mapNonEmpty!7518 () Bool)

(declare-fun tp!16590 () Bool)

(declare-fun e!122671 () Bool)

(assert (=> mapNonEmpty!7518 (= mapRes!7518 (and tp!16590 e!122671))))

(declare-fun mapValue!7518 () ValueCell!1838)

(declare-fun mapRest!7518 () (Array (_ BitVec 32) ValueCell!1838))

(declare-fun mapKey!7518 () (_ BitVec 32))

(assert (=> mapNonEmpty!7518 (= mapRest!7509 (store mapRest!7518 mapKey!7518 mapValue!7518))))

(declare-fun b!186399 () Bool)

(assert (=> b!186399 (= e!122671 tp_is_empty!4363)))

(declare-fun mapIsEmpty!7518 () Bool)

(assert (=> mapIsEmpty!7518 mapRes!7518))

(assert (= (and mapNonEmpty!7509 condMapEmpty!7518) mapIsEmpty!7518))

(assert (= (and mapNonEmpty!7509 (not condMapEmpty!7518)) mapNonEmpty!7518))

(assert (= (and mapNonEmpty!7518 ((_ is ValueCellFull!1838) mapValue!7518)) b!186399))

(assert (= (and mapNonEmpty!7509 ((_ is ValueCellFull!1838) mapDefault!7518)) b!186400))

(declare-fun m!213509 () Bool)

(assert (=> mapNonEmpty!7518 m!213509))

(declare-fun b_lambda!7283 () Bool)

(assert (= b_lambda!7281 (or (and b!186185 b_free!4591) b_lambda!7283)))

(check-sat (not bm!18757) (not d!55255) (not d!55257) (not b_next!4591) (not b!186287) (not b!186317) (not b!186386) (not b!186378) (not bm!18775) (not b!186327) (not b!186325) (not b!186288) (not d!55243) (not d!55239) (not b!186377) (not b_lambda!7283) (not b!186286) (not b!186390) (not b!186279) (not b!186384) (not b!186389) (not mapNonEmpty!7518) (not b!186376) (not bm!18756) (not bm!18777) (not d!55241) (not b!186385) (not bm!18772) tp_is_empty!4363 (not d!55249) b_and!11215 (not bm!18773))
(check-sat b_and!11215 (not b_next!4591))
(get-model)

(declare-fun d!55259 () Bool)

(assert (=> d!55259 (= (inRange!0 (index!4695 lt!92137) (mask!8919 thiss!1248)) (and (bvsge (index!4695 lt!92137) #b00000000000000000000000000000000) (bvslt (index!4695 lt!92137) (bvadd (mask!8919 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186317 d!55259))

(declare-fun d!55261 () Bool)

(declare-fun res!88171 () Bool)

(declare-fun e!122676 () Bool)

(assert (=> d!55261 (=> res!88171 e!122676)))

(assert (=> d!55261 (= res!88171 (and ((_ is Cons!2336) (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))) (= (_1!1718 (h!2969 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))))) key!828)))))

(assert (=> d!55261 (= (containsKey!229 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828) e!122676)))

(declare-fun b!186405 () Bool)

(declare-fun e!122677 () Bool)

(assert (=> b!186405 (= e!122676 e!122677)))

(declare-fun res!88172 () Bool)

(assert (=> b!186405 (=> (not res!88172) (not e!122677))))

(assert (=> b!186405 (= res!88172 (and (or (not ((_ is Cons!2336) (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))))) (bvsle (_1!1718 (h!2969 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))))) key!828)) ((_ is Cons!2336) (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))) (bvslt (_1!1718 (h!2969 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))))) key!828)))))

(declare-fun b!186406 () Bool)

(assert (=> b!186406 (= e!122677 (containsKey!229 (t!7218 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))) key!828))))

(assert (= (and d!55261 (not res!88171)) b!186405))

(assert (= (and b!186405 res!88172) b!186406))

(declare-fun m!213511 () Bool)

(assert (=> b!186406 m!213511))

(assert (=> d!55255 d!55261))

(declare-fun b!186425 () Bool)

(declare-fun e!122691 () SeekEntryResult!631)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186425 (= e!122691 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8919 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8919 thiss!1248)) key!828 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)))))

(declare-fun b!186426 () Bool)

(declare-fun e!122688 () Bool)

(declare-fun e!122689 () Bool)

(assert (=> b!186426 (= e!122688 e!122689)))

(declare-fun res!88180 () Bool)

(declare-fun lt!92222 () SeekEntryResult!631)

(assert (=> b!186426 (= res!88180 (and ((_ is Intermediate!631) lt!92222) (not (undefined!1443 lt!92222)) (bvslt (x!20195 lt!92222) #b01111111111111111111111111111110) (bvsge (x!20195 lt!92222) #b00000000000000000000000000000000) (bvsge (x!20195 lt!92222) #b00000000000000000000000000000000)))))

(assert (=> b!186426 (=> (not res!88180) (not e!122689))))

(declare-fun b!186427 () Bool)

(assert (=> b!186427 (= e!122691 (Intermediate!631 false (toIndex!0 key!828 (mask!8919 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!186428 () Bool)

(assert (=> b!186428 (and (bvsge (index!4696 lt!92222) #b00000000000000000000000000000000) (bvslt (index!4696 lt!92222) (size!4056 (_keys!5739 thiss!1248))))))

(declare-fun res!88181 () Bool)

(assert (=> b!186428 (= res!88181 (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4696 lt!92222)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!122692 () Bool)

(assert (=> b!186428 (=> res!88181 e!122692)))

(declare-fun d!55263 () Bool)

(assert (=> d!55263 e!122688))

(declare-fun c!33434 () Bool)

(assert (=> d!55263 (= c!33434 (and ((_ is Intermediate!631) lt!92222) (undefined!1443 lt!92222)))))

(declare-fun e!122690 () SeekEntryResult!631)

(assert (=> d!55263 (= lt!92222 e!122690)))

(declare-fun c!33433 () Bool)

(assert (=> d!55263 (= c!33433 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!92221 () (_ BitVec 64))

(assert (=> d!55263 (= lt!92221 (select (arr!3740 (_keys!5739 thiss!1248)) (toIndex!0 key!828 (mask!8919 thiss!1248))))))

(assert (=> d!55263 (validMask!0 (mask!8919 thiss!1248))))

(assert (=> d!55263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8919 thiss!1248)) key!828 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)) lt!92222)))

(declare-fun b!186429 () Bool)

(assert (=> b!186429 (= e!122690 e!122691)))

(declare-fun c!33432 () Bool)

(assert (=> b!186429 (= c!33432 (or (= lt!92221 key!828) (= (bvadd lt!92221 lt!92221) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186430 () Bool)

(assert (=> b!186430 (and (bvsge (index!4696 lt!92222) #b00000000000000000000000000000000) (bvslt (index!4696 lt!92222) (size!4056 (_keys!5739 thiss!1248))))))

(declare-fun res!88179 () Bool)

(assert (=> b!186430 (= res!88179 (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4696 lt!92222)) key!828))))

(assert (=> b!186430 (=> res!88179 e!122692)))

(assert (=> b!186430 (= e!122689 e!122692)))

(declare-fun b!186431 () Bool)

(assert (=> b!186431 (and (bvsge (index!4696 lt!92222) #b00000000000000000000000000000000) (bvslt (index!4696 lt!92222) (size!4056 (_keys!5739 thiss!1248))))))

(assert (=> b!186431 (= e!122692 (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4696 lt!92222)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186432 () Bool)

(assert (=> b!186432 (= e!122690 (Intermediate!631 true (toIndex!0 key!828 (mask!8919 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!186433 () Bool)

(assert (=> b!186433 (= e!122688 (bvsge (x!20195 lt!92222) #b01111111111111111111111111111110))))

(assert (= (and d!55263 c!33433) b!186432))

(assert (= (and d!55263 (not c!33433)) b!186429))

(assert (= (and b!186429 c!33432) b!186427))

(assert (= (and b!186429 (not c!33432)) b!186425))

(assert (= (and d!55263 c!33434) b!186433))

(assert (= (and d!55263 (not c!33434)) b!186426))

(assert (= (and b!186426 res!88180) b!186430))

(assert (= (and b!186430 (not res!88179)) b!186428))

(assert (= (and b!186428 (not res!88181)) b!186431))

(declare-fun m!213513 () Bool)

(assert (=> b!186431 m!213513))

(assert (=> b!186425 m!213411))

(declare-fun m!213515 () Bool)

(assert (=> b!186425 m!213515))

(assert (=> b!186425 m!213515))

(declare-fun m!213517 () Bool)

(assert (=> b!186425 m!213517))

(assert (=> b!186430 m!213513))

(assert (=> d!55263 m!213411))

(declare-fun m!213519 () Bool)

(assert (=> d!55263 m!213519))

(assert (=> d!55263 m!213337))

(assert (=> b!186428 m!213513))

(assert (=> d!55239 d!55263))

(declare-fun d!55265 () Bool)

(declare-fun lt!92228 () (_ BitVec 32))

(declare-fun lt!92227 () (_ BitVec 32))

(assert (=> d!55265 (= lt!92228 (bvmul (bvxor lt!92227 (bvlshr lt!92227 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55265 (= lt!92227 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55265 (and (bvsge (mask!8919 thiss!1248) #b00000000000000000000000000000000) (let ((res!88182 (let ((h!2973 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20213 (bvmul (bvxor h!2973 (bvlshr h!2973 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20213 (bvlshr x!20213 #b00000000000000000000000000001101)) (mask!8919 thiss!1248)))))) (and (bvslt res!88182 (bvadd (mask!8919 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!88182 #b00000000000000000000000000000000))))))

(assert (=> d!55265 (= (toIndex!0 key!828 (mask!8919 thiss!1248)) (bvand (bvxor lt!92228 (bvlshr lt!92228 #b00000000000000000000000000001101)) (mask!8919 thiss!1248)))))

(assert (=> d!55239 d!55265))

(assert (=> d!55239 d!55253))

(declare-fun d!55267 () Bool)

(declare-fun e!122695 () Bool)

(assert (=> d!55267 e!122695))

(declare-fun res!88188 () Bool)

(assert (=> d!55267 (=> (not res!88188) (not e!122695))))

(declare-fun lt!92237 () ListLongMap!2335)

(assert (=> d!55267 (= res!88188 (contains!1291 lt!92237 (_1!1718 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))

(declare-fun lt!92239 () List!2340)

(assert (=> d!55267 (= lt!92237 (ListLongMap!2336 lt!92239))))

(declare-fun lt!92238 () Unit!5613)

(declare-fun lt!92240 () Unit!5613)

(assert (=> d!55267 (= lt!92238 lt!92240)))

(assert (=> d!55267 (= (getValueByKey!226 lt!92239 (_1!1718 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))) (Some!231 (_2!1718 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!118 (List!2340 (_ BitVec 64) V!5465) Unit!5613)

(assert (=> d!55267 (= lt!92240 (lemmaContainsTupThenGetReturnValue!118 lt!92239 (_1!1718 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))) (_2!1718 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))

(declare-fun insertStrictlySorted!121 (List!2340 (_ BitVec 64) V!5465) List!2340)

(assert (=> d!55267 (= lt!92239 (insertStrictlySorted!121 (toList!1183 call!18778) (_1!1718 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))) (_2!1718 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))

(assert (=> d!55267 (= (+!288 call!18778 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))) lt!92237)))

(declare-fun b!186438 () Bool)

(declare-fun res!88187 () Bool)

(assert (=> b!186438 (=> (not res!88187) (not e!122695))))

(assert (=> b!186438 (= res!88187 (= (getValueByKey!226 (toList!1183 lt!92237) (_1!1718 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))) (Some!231 (_2!1718 (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))))

(declare-fun b!186439 () Bool)

(declare-fun contains!1294 (List!2340 tuple2!3414) Bool)

(assert (=> b!186439 (= e!122695 (contains!1294 (toList!1183 lt!92237) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))

(assert (= (and d!55267 res!88188) b!186438))

(assert (= (and b!186438 res!88187) b!186439))

(declare-fun m!213521 () Bool)

(assert (=> d!55267 m!213521))

(declare-fun m!213523 () Bool)

(assert (=> d!55267 m!213523))

(declare-fun m!213525 () Bool)

(assert (=> d!55267 m!213525))

(declare-fun m!213527 () Bool)

(assert (=> d!55267 m!213527))

(declare-fun m!213529 () Bool)

(assert (=> b!186438 m!213529))

(declare-fun m!213531 () Bool)

(assert (=> b!186439 m!213531))

(assert (=> b!186378 d!55267))

(declare-fun d!55269 () Bool)

(declare-fun res!88193 () Bool)

(declare-fun e!122700 () Bool)

(assert (=> d!55269 (=> res!88193 e!122700)))

(assert (=> d!55269 (= res!88193 (= (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55269 (= (arrayContainsKey!0 (_keys!5739 thiss!1248) key!828 #b00000000000000000000000000000000) e!122700)))

(declare-fun b!186444 () Bool)

(declare-fun e!122701 () Bool)

(assert (=> b!186444 (= e!122700 e!122701)))

(declare-fun res!88194 () Bool)

(assert (=> b!186444 (=> (not res!88194) (not e!122701))))

(assert (=> b!186444 (= res!88194 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4056 (_keys!5739 thiss!1248))))))

(declare-fun b!186445 () Bool)

(assert (=> b!186445 (= e!122701 (arrayContainsKey!0 (_keys!5739 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55269 (not res!88193)) b!186444))

(assert (= (and b!186444 res!88194) b!186445))

(assert (=> d!55269 m!213451))

(declare-fun m!213533 () Bool)

(assert (=> b!186445 m!213533))

(assert (=> bm!18756 d!55269))

(declare-fun bm!18781 () Bool)

(declare-fun call!18784 () Bool)

(declare-fun c!33437 () Bool)

(assert (=> bm!18781 (= call!18784 (arrayNoDuplicates!0 (_keys!5739 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33437 (Cons!2339 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000) Nil!2340) Nil!2340)))))

(declare-fun d!55271 () Bool)

(declare-fun res!88201 () Bool)

(declare-fun e!122712 () Bool)

(assert (=> d!55271 (=> res!88201 e!122712)))

(assert (=> d!55271 (= res!88201 (bvsge #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))

(assert (=> d!55271 (= (arrayNoDuplicates!0 (_keys!5739 thiss!1248) #b00000000000000000000000000000000 Nil!2340) e!122712)))

(declare-fun b!186456 () Bool)

(declare-fun e!122713 () Bool)

(declare-fun contains!1295 (List!2343 (_ BitVec 64)) Bool)

(assert (=> b!186456 (= e!122713 (contains!1295 Nil!2340 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186457 () Bool)

(declare-fun e!122711 () Bool)

(assert (=> b!186457 (= e!122712 e!122711)))

(declare-fun res!88203 () Bool)

(assert (=> b!186457 (=> (not res!88203) (not e!122711))))

(assert (=> b!186457 (= res!88203 (not e!122713))))

(declare-fun res!88202 () Bool)

(assert (=> b!186457 (=> (not res!88202) (not e!122713))))

(assert (=> b!186457 (= res!88202 (validKeyInArray!0 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186458 () Bool)

(declare-fun e!122710 () Bool)

(assert (=> b!186458 (= e!122710 call!18784)))

(declare-fun b!186459 () Bool)

(assert (=> b!186459 (= e!122711 e!122710)))

(assert (=> b!186459 (= c!33437 (validKeyInArray!0 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186460 () Bool)

(assert (=> b!186460 (= e!122710 call!18784)))

(assert (= (and d!55271 (not res!88201)) b!186457))

(assert (= (and b!186457 res!88202) b!186456))

(assert (= (and b!186457 res!88203) b!186459))

(assert (= (and b!186459 c!33437) b!186460))

(assert (= (and b!186459 (not c!33437)) b!186458))

(assert (= (or b!186460 b!186458) bm!18781))

(assert (=> bm!18781 m!213451))

(declare-fun m!213535 () Bool)

(assert (=> bm!18781 m!213535))

(assert (=> b!186456 m!213451))

(assert (=> b!186456 m!213451))

(declare-fun m!213537 () Bool)

(assert (=> b!186456 m!213537))

(assert (=> b!186457 m!213451))

(assert (=> b!186457 m!213451))

(assert (=> b!186457 m!213453))

(assert (=> b!186459 m!213451))

(assert (=> b!186459 m!213451))

(assert (=> b!186459 m!213453))

(assert (=> b!186288 d!55271))

(declare-fun d!55273 () Bool)

(declare-fun get!2158 (Option!232) V!5465)

(assert (=> d!55273 (= (apply!168 lt!92198 lt!92209) (get!2158 (getValueByKey!226 (toList!1183 lt!92198) lt!92209)))))

(declare-fun bs!7550 () Bool)

(assert (= bs!7550 d!55273))

(declare-fun m!213539 () Bool)

(assert (=> bs!7550 m!213539))

(assert (=> bs!7550 m!213539))

(declare-fun m!213541 () Bool)

(assert (=> bs!7550 m!213541))

(assert (=> b!186386 d!55273))

(declare-fun b!186485 () Bool)

(declare-fun lt!92260 () Unit!5613)

(declare-fun lt!92258 () Unit!5613)

(assert (=> b!186485 (= lt!92260 lt!92258)))

(declare-fun lt!92257 () ListLongMap!2335)

(declare-fun lt!92255 () V!5465)

(declare-fun lt!92256 () (_ BitVec 64))

(declare-fun lt!92261 () (_ BitVec 64))

(assert (=> b!186485 (not (contains!1291 (+!288 lt!92257 (tuple2!3415 lt!92256 lt!92255)) lt!92261))))

(declare-fun addStillNotContains!91 (ListLongMap!2335 (_ BitVec 64) V!5465 (_ BitVec 64)) Unit!5613)

(assert (=> b!186485 (= lt!92258 (addStillNotContains!91 lt!92257 lt!92256 lt!92255 lt!92261))))

(assert (=> b!186485 (= lt!92261 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!186485 (= lt!92255 (get!2157 (select (arr!3741 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186485 (= lt!92256 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18787 () ListLongMap!2335)

(assert (=> b!186485 (= lt!92257 call!18787)))

(declare-fun e!122733 () ListLongMap!2335)

(assert (=> b!186485 (= e!122733 (+!288 call!18787 (tuple2!3415 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000) (get!2157 (select (arr!3741 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!186486 () Bool)

(declare-fun e!122731 () Bool)

(declare-fun e!122729 () Bool)

(assert (=> b!186486 (= e!122731 e!122729)))

(declare-fun c!33446 () Bool)

(assert (=> b!186486 (= c!33446 (bvslt #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))

(declare-fun b!186487 () Bool)

(declare-fun lt!92259 () ListLongMap!2335)

(assert (=> b!186487 (= e!122729 (= lt!92259 (getCurrentListMapNoExtraKeys!199 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3797 thiss!1248))))))

(declare-fun b!186488 () Bool)

(declare-fun e!122734 () ListLongMap!2335)

(assert (=> b!186488 (= e!122734 (ListLongMap!2336 Nil!2337))))

(declare-fun d!55275 () Bool)

(declare-fun e!122728 () Bool)

(assert (=> d!55275 e!122728))

(declare-fun res!88214 () Bool)

(assert (=> d!55275 (=> (not res!88214) (not e!122728))))

(assert (=> d!55275 (= res!88214 (not (contains!1291 lt!92259 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55275 (= lt!92259 e!122734)))

(declare-fun c!33447 () Bool)

(assert (=> d!55275 (= c!33447 (bvsge #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))

(assert (=> d!55275 (validMask!0 (mask!8919 thiss!1248))))

(assert (=> d!55275 (= (getCurrentListMapNoExtraKeys!199 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)) lt!92259)))

(declare-fun b!186489 () Bool)

(declare-fun e!122732 () Bool)

(assert (=> b!186489 (= e!122732 (validKeyInArray!0 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186489 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!186490 () Bool)

(assert (=> b!186490 (= e!122733 call!18787)))

(declare-fun b!186491 () Bool)

(declare-fun e!122730 () Bool)

(assert (=> b!186491 (= e!122731 e!122730)))

(assert (=> b!186491 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))

(declare-fun res!88213 () Bool)

(assert (=> b!186491 (= res!88213 (contains!1291 lt!92259 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186491 (=> (not res!88213) (not e!122730))))

(declare-fun b!186492 () Bool)

(declare-fun res!88215 () Bool)

(assert (=> b!186492 (=> (not res!88215) (not e!122728))))

(assert (=> b!186492 (= res!88215 (not (contains!1291 lt!92259 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186493 () Bool)

(assert (=> b!186493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))

(assert (=> b!186493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4057 (_values!3780 thiss!1248))))))

(assert (=> b!186493 (= e!122730 (= (apply!168 lt!92259 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)) (get!2157 (select (arr!3741 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!186494 () Bool)

(assert (=> b!186494 (= e!122734 e!122733)))

(declare-fun c!33448 () Bool)

(assert (=> b!186494 (= c!33448 (validKeyInArray!0 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18784 () Bool)

(assert (=> bm!18784 (= call!18787 (getCurrentListMapNoExtraKeys!199 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3797 thiss!1248)))))

(declare-fun b!186495 () Bool)

(declare-fun isEmpty!477 (ListLongMap!2335) Bool)

(assert (=> b!186495 (= e!122729 (isEmpty!477 lt!92259))))

(declare-fun b!186496 () Bool)

(assert (=> b!186496 (= e!122728 e!122731)))

(declare-fun c!33449 () Bool)

(assert (=> b!186496 (= c!33449 e!122732)))

(declare-fun res!88212 () Bool)

(assert (=> b!186496 (=> (not res!88212) (not e!122732))))

(assert (=> b!186496 (= res!88212 (bvslt #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))

(assert (= (and d!55275 c!33447) b!186488))

(assert (= (and d!55275 (not c!33447)) b!186494))

(assert (= (and b!186494 c!33448) b!186485))

(assert (= (and b!186494 (not c!33448)) b!186490))

(assert (= (or b!186485 b!186490) bm!18784))

(assert (= (and d!55275 res!88214) b!186492))

(assert (= (and b!186492 res!88215) b!186496))

(assert (= (and b!186496 res!88212) b!186489))

(assert (= (and b!186496 c!33449) b!186491))

(assert (= (and b!186496 (not c!33449)) b!186486))

(assert (= (and b!186491 res!88213) b!186493))

(assert (= (and b!186486 c!33446) b!186487))

(assert (= (and b!186486 (not c!33446)) b!186495))

(declare-fun b_lambda!7285 () Bool)

(assert (=> (not b_lambda!7285) (not b!186485)))

(assert (=> b!186485 t!7222))

(declare-fun b_and!11217 () Bool)

(assert (= b_and!11215 (and (=> t!7222 result!4811) b_and!11217)))

(declare-fun b_lambda!7287 () Bool)

(assert (=> (not b_lambda!7287) (not b!186493)))

(assert (=> b!186493 t!7222))

(declare-fun b_and!11219 () Bool)

(assert (= b_and!11217 (and (=> t!7222 result!4811) b_and!11219)))

(declare-fun m!213543 () Bool)

(assert (=> d!55275 m!213543))

(assert (=> d!55275 m!213337))

(assert (=> b!186491 m!213451))

(assert (=> b!186491 m!213451))

(declare-fun m!213545 () Bool)

(assert (=> b!186491 m!213545))

(declare-fun m!213547 () Bool)

(assert (=> bm!18784 m!213547))

(assert (=> b!186494 m!213451))

(assert (=> b!186494 m!213451))

(assert (=> b!186494 m!213453))

(assert (=> b!186489 m!213451))

(assert (=> b!186489 m!213451))

(assert (=> b!186489 m!213453))

(assert (=> b!186487 m!213547))

(declare-fun m!213549 () Bool)

(assert (=> b!186492 m!213549))

(assert (=> b!186493 m!213451))

(declare-fun m!213551 () Bool)

(assert (=> b!186493 m!213551))

(assert (=> b!186493 m!213457))

(assert (=> b!186493 m!213455))

(assert (=> b!186493 m!213459))

(assert (=> b!186493 m!213457))

(assert (=> b!186493 m!213451))

(assert (=> b!186493 m!213455))

(declare-fun m!213553 () Bool)

(assert (=> b!186495 m!213553))

(declare-fun m!213555 () Bool)

(assert (=> b!186485 m!213555))

(assert (=> b!186485 m!213457))

(assert (=> b!186485 m!213455))

(assert (=> b!186485 m!213459))

(assert (=> b!186485 m!213555))

(declare-fun m!213557 () Bool)

(assert (=> b!186485 m!213557))

(assert (=> b!186485 m!213457))

(assert (=> b!186485 m!213451))

(declare-fun m!213559 () Bool)

(assert (=> b!186485 m!213559))

(assert (=> b!186485 m!213455))

(declare-fun m!213561 () Bool)

(assert (=> b!186485 m!213561))

(assert (=> b!186386 d!55275))

(declare-fun d!55277 () Bool)

(assert (=> d!55277 (= (apply!168 (+!288 lt!92215 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248))) lt!92207) (get!2158 (getValueByKey!226 (toList!1183 (+!288 lt!92215 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248)))) lt!92207)))))

(declare-fun bs!7551 () Bool)

(assert (= bs!7551 d!55277))

(declare-fun m!213563 () Bool)

(assert (=> bs!7551 m!213563))

(assert (=> bs!7551 m!213563))

(declare-fun m!213565 () Bool)

(assert (=> bs!7551 m!213565))

(assert (=> b!186386 d!55277))

(declare-fun d!55279 () Bool)

(assert (=> d!55279 (= (apply!168 (+!288 lt!92195 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248))) lt!92212) (get!2158 (getValueByKey!226 (toList!1183 (+!288 lt!92195 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248)))) lt!92212)))))

(declare-fun bs!7552 () Bool)

(assert (= bs!7552 d!55279))

(declare-fun m!213567 () Bool)

(assert (=> bs!7552 m!213567))

(assert (=> bs!7552 m!213567))

(declare-fun m!213569 () Bool)

(assert (=> bs!7552 m!213569))

(assert (=> b!186386 d!55279))

(declare-fun d!55281 () Bool)

(declare-fun e!122735 () Bool)

(assert (=> d!55281 e!122735))

(declare-fun res!88217 () Bool)

(assert (=> d!55281 (=> (not res!88217) (not e!122735))))

(declare-fun lt!92262 () ListLongMap!2335)

(assert (=> d!55281 (= res!88217 (contains!1291 lt!92262 (_1!1718 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248)))))))

(declare-fun lt!92264 () List!2340)

(assert (=> d!55281 (= lt!92262 (ListLongMap!2336 lt!92264))))

(declare-fun lt!92263 () Unit!5613)

(declare-fun lt!92265 () Unit!5613)

(assert (=> d!55281 (= lt!92263 lt!92265)))

(assert (=> d!55281 (= (getValueByKey!226 lt!92264 (_1!1718 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248)))) (Some!231 (_2!1718 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248)))))))

(assert (=> d!55281 (= lt!92265 (lemmaContainsTupThenGetReturnValue!118 lt!92264 (_1!1718 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248))) (_2!1718 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248)))))))

(assert (=> d!55281 (= lt!92264 (insertStrictlySorted!121 (toList!1183 lt!92198) (_1!1718 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248))) (_2!1718 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248)))))))

(assert (=> d!55281 (= (+!288 lt!92198 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248))) lt!92262)))

(declare-fun b!186497 () Bool)

(declare-fun res!88216 () Bool)

(assert (=> b!186497 (=> (not res!88216) (not e!122735))))

(assert (=> b!186497 (= res!88216 (= (getValueByKey!226 (toList!1183 lt!92262) (_1!1718 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248)))) (Some!231 (_2!1718 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248))))))))

(declare-fun b!186498 () Bool)

(assert (=> b!186498 (= e!122735 (contains!1294 (toList!1183 lt!92262) (tuple2!3415 lt!92208 (minValue!3638 thiss!1248))))))

(assert (= (and d!55281 res!88217) b!186497))

(assert (= (and b!186497 res!88216) b!186498))

(declare-fun m!213571 () Bool)

(assert (=> d!55281 m!213571))

(declare-fun m!213573 () Bool)

(assert (=> d!55281 m!213573))

(declare-fun m!213575 () Bool)

(assert (=> d!55281 m!213575))

(declare-fun m!213577 () Bool)

(assert (=> d!55281 m!213577))

(declare-fun m!213579 () Bool)

(assert (=> b!186497 m!213579))

(declare-fun m!213581 () Bool)

(assert (=> b!186498 m!213581))

(assert (=> b!186386 d!55281))

(declare-fun d!55283 () Bool)

(assert (=> d!55283 (= (apply!168 (+!288 lt!92215 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248))) lt!92207) (apply!168 lt!92215 lt!92207))))

(declare-fun lt!92268 () Unit!5613)

(declare-fun choose!993 (ListLongMap!2335 (_ BitVec 64) V!5465 (_ BitVec 64)) Unit!5613)

(assert (=> d!55283 (= lt!92268 (choose!993 lt!92215 lt!92201 (minValue!3638 thiss!1248) lt!92207))))

(declare-fun e!122738 () Bool)

(assert (=> d!55283 e!122738))

(declare-fun res!88220 () Bool)

(assert (=> d!55283 (=> (not res!88220) (not e!122738))))

(assert (=> d!55283 (= res!88220 (contains!1291 lt!92215 lt!92207))))

(assert (=> d!55283 (= (addApplyDifferent!144 lt!92215 lt!92201 (minValue!3638 thiss!1248) lt!92207) lt!92268)))

(declare-fun b!186502 () Bool)

(assert (=> b!186502 (= e!122738 (not (= lt!92207 lt!92201)))))

(assert (= (and d!55283 res!88220) b!186502))

(assert (=> d!55283 m!213483))

(assert (=> d!55283 m!213485))

(declare-fun m!213583 () Bool)

(assert (=> d!55283 m!213583))

(declare-fun m!213585 () Bool)

(assert (=> d!55283 m!213585))

(assert (=> d!55283 m!213483))

(assert (=> d!55283 m!213471))

(assert (=> b!186386 d!55283))

(declare-fun d!55285 () Bool)

(assert (=> d!55285 (= (apply!168 (+!288 lt!92198 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248))) lt!92209) (get!2158 (getValueByKey!226 (toList!1183 (+!288 lt!92198 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248)))) lt!92209)))))

(declare-fun bs!7553 () Bool)

(assert (= bs!7553 d!55285))

(declare-fun m!213587 () Bool)

(assert (=> bs!7553 m!213587))

(assert (=> bs!7553 m!213587))

(declare-fun m!213589 () Bool)

(assert (=> bs!7553 m!213589))

(assert (=> b!186386 d!55285))

(declare-fun d!55287 () Bool)

(declare-fun e!122739 () Bool)

(assert (=> d!55287 e!122739))

(declare-fun res!88222 () Bool)

(assert (=> d!55287 (=> (not res!88222) (not e!122739))))

(declare-fun lt!92269 () ListLongMap!2335)

(assert (=> d!55287 (= res!88222 (contains!1291 lt!92269 (_1!1718 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248)))))))

(declare-fun lt!92271 () List!2340)

(assert (=> d!55287 (= lt!92269 (ListLongMap!2336 lt!92271))))

(declare-fun lt!92270 () Unit!5613)

(declare-fun lt!92272 () Unit!5613)

(assert (=> d!55287 (= lt!92270 lt!92272)))

(assert (=> d!55287 (= (getValueByKey!226 lt!92271 (_1!1718 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248)))) (Some!231 (_2!1718 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248)))))))

(assert (=> d!55287 (= lt!92272 (lemmaContainsTupThenGetReturnValue!118 lt!92271 (_1!1718 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248))) (_2!1718 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248)))))))

(assert (=> d!55287 (= lt!92271 (insertStrictlySorted!121 (toList!1183 lt!92195) (_1!1718 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248))) (_2!1718 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248)))))))

(assert (=> d!55287 (= (+!288 lt!92195 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248))) lt!92269)))

(declare-fun b!186503 () Bool)

(declare-fun res!88221 () Bool)

(assert (=> b!186503 (=> (not res!88221) (not e!122739))))

(assert (=> b!186503 (= res!88221 (= (getValueByKey!226 (toList!1183 lt!92269) (_1!1718 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248)))) (Some!231 (_2!1718 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248))))))))

(declare-fun b!186504 () Bool)

(assert (=> b!186504 (= e!122739 (contains!1294 (toList!1183 lt!92269) (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248))))))

(assert (= (and d!55287 res!88222) b!186503))

(assert (= (and b!186503 res!88221) b!186504))

(declare-fun m!213591 () Bool)

(assert (=> d!55287 m!213591))

(declare-fun m!213593 () Bool)

(assert (=> d!55287 m!213593))

(declare-fun m!213595 () Bool)

(assert (=> d!55287 m!213595))

(declare-fun m!213597 () Bool)

(assert (=> d!55287 m!213597))

(declare-fun m!213599 () Bool)

(assert (=> b!186503 m!213599))

(declare-fun m!213601 () Bool)

(assert (=> b!186504 m!213601))

(assert (=> b!186386 d!55287))

(declare-fun d!55289 () Bool)

(assert (=> d!55289 (contains!1291 (+!288 lt!92205 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248))) lt!92199)))

(declare-fun lt!92275 () Unit!5613)

(declare-fun choose!994 (ListLongMap!2335 (_ BitVec 64) V!5465 (_ BitVec 64)) Unit!5613)

(assert (=> d!55289 (= lt!92275 (choose!994 lt!92205 lt!92204 (zeroValue!3638 thiss!1248) lt!92199))))

(assert (=> d!55289 (contains!1291 lt!92205 lt!92199)))

(assert (=> d!55289 (= (addStillContains!144 lt!92205 lt!92204 (zeroValue!3638 thiss!1248) lt!92199) lt!92275)))

(declare-fun bs!7554 () Bool)

(assert (= bs!7554 d!55289))

(assert (=> bs!7554 m!213487))

(assert (=> bs!7554 m!213487))

(assert (=> bs!7554 m!213501))

(declare-fun m!213603 () Bool)

(assert (=> bs!7554 m!213603))

(declare-fun m!213605 () Bool)

(assert (=> bs!7554 m!213605))

(assert (=> b!186386 d!55289))

(declare-fun d!55291 () Bool)

(declare-fun e!122740 () Bool)

(assert (=> d!55291 e!122740))

(declare-fun res!88224 () Bool)

(assert (=> d!55291 (=> (not res!88224) (not e!122740))))

(declare-fun lt!92276 () ListLongMap!2335)

(assert (=> d!55291 (= res!88224 (contains!1291 lt!92276 (_1!1718 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248)))))))

(declare-fun lt!92278 () List!2340)

(assert (=> d!55291 (= lt!92276 (ListLongMap!2336 lt!92278))))

(declare-fun lt!92277 () Unit!5613)

(declare-fun lt!92279 () Unit!5613)

(assert (=> d!55291 (= lt!92277 lt!92279)))

(assert (=> d!55291 (= (getValueByKey!226 lt!92278 (_1!1718 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248)))) (Some!231 (_2!1718 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248)))))))

(assert (=> d!55291 (= lt!92279 (lemmaContainsTupThenGetReturnValue!118 lt!92278 (_1!1718 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248))) (_2!1718 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248)))))))

(assert (=> d!55291 (= lt!92278 (insertStrictlySorted!121 (toList!1183 lt!92205) (_1!1718 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248))) (_2!1718 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248)))))))

(assert (=> d!55291 (= (+!288 lt!92205 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248))) lt!92276)))

(declare-fun b!186506 () Bool)

(declare-fun res!88223 () Bool)

(assert (=> b!186506 (=> (not res!88223) (not e!122740))))

(assert (=> b!186506 (= res!88223 (= (getValueByKey!226 (toList!1183 lt!92276) (_1!1718 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248)))) (Some!231 (_2!1718 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248))))))))

(declare-fun b!186507 () Bool)

(assert (=> b!186507 (= e!122740 (contains!1294 (toList!1183 lt!92276) (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248))))))

(assert (= (and d!55291 res!88224) b!186506))

(assert (= (and b!186506 res!88223) b!186507))

(declare-fun m!213607 () Bool)

(assert (=> d!55291 m!213607))

(declare-fun m!213609 () Bool)

(assert (=> d!55291 m!213609))

(declare-fun m!213611 () Bool)

(assert (=> d!55291 m!213611))

(declare-fun m!213613 () Bool)

(assert (=> d!55291 m!213613))

(declare-fun m!213615 () Bool)

(assert (=> b!186506 m!213615))

(declare-fun m!213617 () Bool)

(assert (=> b!186507 m!213617))

(assert (=> b!186386 d!55291))

(declare-fun d!55293 () Bool)

(assert (=> d!55293 (= (apply!168 (+!288 lt!92198 (tuple2!3415 lt!92208 (minValue!3638 thiss!1248))) lt!92209) (apply!168 lt!92198 lt!92209))))

(declare-fun lt!92280 () Unit!5613)

(assert (=> d!55293 (= lt!92280 (choose!993 lt!92198 lt!92208 (minValue!3638 thiss!1248) lt!92209))))

(declare-fun e!122741 () Bool)

(assert (=> d!55293 e!122741))

(declare-fun res!88225 () Bool)

(assert (=> d!55293 (=> (not res!88225) (not e!122741))))

(assert (=> d!55293 (= res!88225 (contains!1291 lt!92198 lt!92209))))

(assert (=> d!55293 (= (addApplyDifferent!144 lt!92198 lt!92208 (minValue!3638 thiss!1248) lt!92209) lt!92280)))

(declare-fun b!186508 () Bool)

(assert (=> b!186508 (= e!122741 (not (= lt!92209 lt!92208)))))

(assert (= (and d!55293 res!88225) b!186508))

(assert (=> d!55293 m!213477))

(assert (=> d!55293 m!213479))

(declare-fun m!213619 () Bool)

(assert (=> d!55293 m!213619))

(declare-fun m!213621 () Bool)

(assert (=> d!55293 m!213621))

(assert (=> d!55293 m!213477))

(assert (=> d!55293 m!213497))

(assert (=> b!186386 d!55293))

(declare-fun d!55295 () Bool)

(declare-fun e!122742 () Bool)

(assert (=> d!55295 e!122742))

(declare-fun res!88227 () Bool)

(assert (=> d!55295 (=> (not res!88227) (not e!122742))))

(declare-fun lt!92281 () ListLongMap!2335)

(assert (=> d!55295 (= res!88227 (contains!1291 lt!92281 (_1!1718 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248)))))))

(declare-fun lt!92283 () List!2340)

(assert (=> d!55295 (= lt!92281 (ListLongMap!2336 lt!92283))))

(declare-fun lt!92282 () Unit!5613)

(declare-fun lt!92284 () Unit!5613)

(assert (=> d!55295 (= lt!92282 lt!92284)))

(assert (=> d!55295 (= (getValueByKey!226 lt!92283 (_1!1718 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248)))) (Some!231 (_2!1718 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248)))))))

(assert (=> d!55295 (= lt!92284 (lemmaContainsTupThenGetReturnValue!118 lt!92283 (_1!1718 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248))) (_2!1718 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248)))))))

(assert (=> d!55295 (= lt!92283 (insertStrictlySorted!121 (toList!1183 lt!92215) (_1!1718 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248))) (_2!1718 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248)))))))

(assert (=> d!55295 (= (+!288 lt!92215 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248))) lt!92281)))

(declare-fun b!186509 () Bool)

(declare-fun res!88226 () Bool)

(assert (=> b!186509 (=> (not res!88226) (not e!122742))))

(assert (=> b!186509 (= res!88226 (= (getValueByKey!226 (toList!1183 lt!92281) (_1!1718 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248)))) (Some!231 (_2!1718 (tuple2!3415 lt!92201 (minValue!3638 thiss!1248))))))))

(declare-fun b!186510 () Bool)

(assert (=> b!186510 (= e!122742 (contains!1294 (toList!1183 lt!92281) (tuple2!3415 lt!92201 (minValue!3638 thiss!1248))))))

(assert (= (and d!55295 res!88227) b!186509))

(assert (= (and b!186509 res!88226) b!186510))

(declare-fun m!213623 () Bool)

(assert (=> d!55295 m!213623))

(declare-fun m!213625 () Bool)

(assert (=> d!55295 m!213625))

(declare-fun m!213627 () Bool)

(assert (=> d!55295 m!213627))

(declare-fun m!213629 () Bool)

(assert (=> d!55295 m!213629))

(declare-fun m!213631 () Bool)

(assert (=> b!186509 m!213631))

(declare-fun m!213633 () Bool)

(assert (=> b!186510 m!213633))

(assert (=> b!186386 d!55295))

(declare-fun d!55297 () Bool)

(assert (=> d!55297 (= (apply!168 lt!92195 lt!92212) (get!2158 (getValueByKey!226 (toList!1183 lt!92195) lt!92212)))))

(declare-fun bs!7555 () Bool)

(assert (= bs!7555 d!55297))

(declare-fun m!213635 () Bool)

(assert (=> bs!7555 m!213635))

(assert (=> bs!7555 m!213635))

(declare-fun m!213637 () Bool)

(assert (=> bs!7555 m!213637))

(assert (=> b!186386 d!55297))

(declare-fun d!55299 () Bool)

(declare-fun e!122743 () Bool)

(assert (=> d!55299 e!122743))

(declare-fun res!88228 () Bool)

(assert (=> d!55299 (=> res!88228 e!122743)))

(declare-fun lt!92285 () Bool)

(assert (=> d!55299 (= res!88228 (not lt!92285))))

(declare-fun lt!92286 () Bool)

(assert (=> d!55299 (= lt!92285 lt!92286)))

(declare-fun lt!92288 () Unit!5613)

(declare-fun e!122744 () Unit!5613)

(assert (=> d!55299 (= lt!92288 e!122744)))

(declare-fun c!33450 () Bool)

(assert (=> d!55299 (= c!33450 lt!92286)))

(assert (=> d!55299 (= lt!92286 (containsKey!229 (toList!1183 (+!288 lt!92205 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248)))) lt!92199))))

(assert (=> d!55299 (= (contains!1291 (+!288 lt!92205 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248))) lt!92199) lt!92285)))

(declare-fun b!186511 () Bool)

(declare-fun lt!92287 () Unit!5613)

(assert (=> b!186511 (= e!122744 lt!92287)))

(assert (=> b!186511 (= lt!92287 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1183 (+!288 lt!92205 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248)))) lt!92199))))

(assert (=> b!186511 (isDefined!178 (getValueByKey!226 (toList!1183 (+!288 lt!92205 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248)))) lt!92199))))

(declare-fun b!186512 () Bool)

(declare-fun Unit!5624 () Unit!5613)

(assert (=> b!186512 (= e!122744 Unit!5624)))

(declare-fun b!186513 () Bool)

(assert (=> b!186513 (= e!122743 (isDefined!178 (getValueByKey!226 (toList!1183 (+!288 lt!92205 (tuple2!3415 lt!92204 (zeroValue!3638 thiss!1248)))) lt!92199)))))

(assert (= (and d!55299 c!33450) b!186511))

(assert (= (and d!55299 (not c!33450)) b!186512))

(assert (= (and d!55299 (not res!88228)) b!186513))

(declare-fun m!213639 () Bool)

(assert (=> d!55299 m!213639))

(declare-fun m!213641 () Bool)

(assert (=> b!186511 m!213641))

(declare-fun m!213643 () Bool)

(assert (=> b!186511 m!213643))

(assert (=> b!186511 m!213643))

(declare-fun m!213645 () Bool)

(assert (=> b!186511 m!213645))

(assert (=> b!186513 m!213643))

(assert (=> b!186513 m!213643))

(assert (=> b!186513 m!213645))

(assert (=> b!186386 d!55299))

(declare-fun d!55301 () Bool)

(assert (=> d!55301 (= (apply!168 lt!92215 lt!92207) (get!2158 (getValueByKey!226 (toList!1183 lt!92215) lt!92207)))))

(declare-fun bs!7556 () Bool)

(assert (= bs!7556 d!55301))

(declare-fun m!213647 () Bool)

(assert (=> bs!7556 m!213647))

(assert (=> bs!7556 m!213647))

(declare-fun m!213649 () Bool)

(assert (=> bs!7556 m!213649))

(assert (=> b!186386 d!55301))

(declare-fun d!55303 () Bool)

(assert (=> d!55303 (= (apply!168 (+!288 lt!92195 (tuple2!3415 lt!92206 (zeroValue!3638 thiss!1248))) lt!92212) (apply!168 lt!92195 lt!92212))))

(declare-fun lt!92289 () Unit!5613)

(assert (=> d!55303 (= lt!92289 (choose!993 lt!92195 lt!92206 (zeroValue!3638 thiss!1248) lt!92212))))

(declare-fun e!122745 () Bool)

(assert (=> d!55303 e!122745))

(declare-fun res!88229 () Bool)

(assert (=> d!55303 (=> (not res!88229) (not e!122745))))

(assert (=> d!55303 (= res!88229 (contains!1291 lt!92195 lt!92212))))

(assert (=> d!55303 (= (addApplyDifferent!144 lt!92195 lt!92206 (zeroValue!3638 thiss!1248) lt!92212) lt!92289)))

(declare-fun b!186514 () Bool)

(assert (=> b!186514 (= e!122745 (not (= lt!92212 lt!92206)))))

(assert (= (and d!55303 res!88229) b!186514))

(assert (=> d!55303 m!213481))

(assert (=> d!55303 m!213489))

(declare-fun m!213651 () Bool)

(assert (=> d!55303 m!213651))

(declare-fun m!213653 () Bool)

(assert (=> d!55303 m!213653))

(assert (=> d!55303 m!213481))

(assert (=> d!55303 m!213475))

(assert (=> b!186386 d!55303))

(declare-fun b!186523 () Bool)

(declare-fun e!122752 () Bool)

(declare-fun e!122753 () Bool)

(assert (=> b!186523 (= e!122752 e!122753)))

(declare-fun c!33453 () Bool)

(assert (=> b!186523 (= c!33453 (validKeyInArray!0 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186525 () Bool)

(declare-fun e!122754 () Bool)

(declare-fun call!18790 () Bool)

(assert (=> b!186525 (= e!122754 call!18790)))

(declare-fun b!186526 () Bool)

(assert (=> b!186526 (= e!122753 e!122754)))

(declare-fun lt!92296 () (_ BitVec 64))

(assert (=> b!186526 (= lt!92296 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92297 () Unit!5613)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7923 (_ BitVec 64) (_ BitVec 32)) Unit!5613)

(assert (=> b!186526 (= lt!92297 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5739 thiss!1248) lt!92296 #b00000000000000000000000000000000))))

(assert (=> b!186526 (arrayContainsKey!0 (_keys!5739 thiss!1248) lt!92296 #b00000000000000000000000000000000)))

(declare-fun lt!92298 () Unit!5613)

(assert (=> b!186526 (= lt!92298 lt!92297)))

(declare-fun res!88234 () Bool)

(assert (=> b!186526 (= res!88234 (= (seekEntryOrOpen!0 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000) (_keys!5739 thiss!1248) (mask!8919 thiss!1248)) (Found!631 #b00000000000000000000000000000000)))))

(assert (=> b!186526 (=> (not res!88234) (not e!122754))))

(declare-fun bm!18787 () Bool)

(assert (=> bm!18787 (= call!18790 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5739 thiss!1248) (mask!8919 thiss!1248)))))

(declare-fun d!55305 () Bool)

(declare-fun res!88235 () Bool)

(assert (=> d!55305 (=> res!88235 e!122752)))

(assert (=> d!55305 (= res!88235 (bvsge #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))

(assert (=> d!55305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)) e!122752)))

(declare-fun b!186524 () Bool)

(assert (=> b!186524 (= e!122753 call!18790)))

(assert (= (and d!55305 (not res!88235)) b!186523))

(assert (= (and b!186523 c!33453) b!186526))

(assert (= (and b!186523 (not c!33453)) b!186524))

(assert (= (and b!186526 res!88234) b!186525))

(assert (= (or b!186525 b!186524) bm!18787))

(assert (=> b!186523 m!213451))

(assert (=> b!186523 m!213451))

(assert (=> b!186523 m!213453))

(assert (=> b!186526 m!213451))

(declare-fun m!213655 () Bool)

(assert (=> b!186526 m!213655))

(declare-fun m!213657 () Bool)

(assert (=> b!186526 m!213657))

(assert (=> b!186526 m!213451))

(declare-fun m!213659 () Bool)

(assert (=> b!186526 m!213659))

(declare-fun m!213661 () Bool)

(assert (=> bm!18787 m!213661))

(assert (=> b!186287 d!55305))

(declare-fun d!55307 () Bool)

(assert (=> d!55307 (= (apply!168 lt!92200 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)) (get!2158 (getValueByKey!226 (toList!1183 lt!92200) (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7557 () Bool)

(assert (= bs!7557 d!55307))

(assert (=> bs!7557 m!213451))

(declare-fun m!213663 () Bool)

(assert (=> bs!7557 m!213663))

(assert (=> bs!7557 m!213663))

(declare-fun m!213665 () Bool)

(assert (=> bs!7557 m!213665))

(assert (=> b!186385 d!55307))

(declare-fun d!55309 () Bool)

(declare-fun c!33456 () Bool)

(assert (=> d!55309 (= c!33456 ((_ is ValueCellFull!1838) (select (arr!3741 (_values!3780 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!122757 () V!5465)

(assert (=> d!55309 (= (get!2157 (select (arr!3741 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!122757)))

(declare-fun b!186531 () Bool)

(declare-fun get!2159 (ValueCell!1838 V!5465) V!5465)

(assert (=> b!186531 (= e!122757 (get!2159 (select (arr!3741 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186532 () Bool)

(declare-fun get!2160 (ValueCell!1838 V!5465) V!5465)

(assert (=> b!186532 (= e!122757 (get!2160 (select (arr!3741 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55309 c!33456) b!186531))

(assert (= (and d!55309 (not c!33456)) b!186532))

(assert (=> b!186531 m!213457))

(assert (=> b!186531 m!213455))

(declare-fun m!213667 () Bool)

(assert (=> b!186531 m!213667))

(assert (=> b!186532 m!213457))

(assert (=> b!186532 m!213455))

(declare-fun m!213669 () Bool)

(assert (=> b!186532 m!213669))

(assert (=> b!186385 d!55309))

(declare-fun b!186541 () Bool)

(declare-fun e!122763 () (_ BitVec 32))

(declare-fun e!122762 () (_ BitVec 32))

(assert (=> b!186541 (= e!122763 e!122762)))

(declare-fun c!33462 () Bool)

(assert (=> b!186541 (= c!33462 (validKeyInArray!0 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186542 () Bool)

(declare-fun call!18793 () (_ BitVec 32))

(assert (=> b!186542 (= e!122762 call!18793)))

(declare-fun b!186543 () Bool)

(assert (=> b!186543 (= e!122762 (bvadd #b00000000000000000000000000000001 call!18793))))

(declare-fun d!55311 () Bool)

(declare-fun lt!92301 () (_ BitVec 32))

(assert (=> d!55311 (and (bvsge lt!92301 #b00000000000000000000000000000000) (bvsle lt!92301 (bvsub (size!4056 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55311 (= lt!92301 e!122763)))

(declare-fun c!33461 () Bool)

(assert (=> d!55311 (= c!33461 (bvsge #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))))))

(assert (=> d!55311 (and (bvsle #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4056 (_keys!5739 thiss!1248)) (size!4056 (_keys!5739 thiss!1248))))))

(assert (=> d!55311 (= (arrayCountValidKeys!0 (_keys!5739 thiss!1248) #b00000000000000000000000000000000 (size!4056 (_keys!5739 thiss!1248))) lt!92301)))

(declare-fun bm!18790 () Bool)

(assert (=> bm!18790 (= call!18793 (arrayCountValidKeys!0 (_keys!5739 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4056 (_keys!5739 thiss!1248))))))

(declare-fun b!186544 () Bool)

(assert (=> b!186544 (= e!122763 #b00000000000000000000000000000000)))

(assert (= (and d!55311 c!33461) b!186544))

(assert (= (and d!55311 (not c!33461)) b!186541))

(assert (= (and b!186541 c!33462) b!186543))

(assert (= (and b!186541 (not c!33462)) b!186542))

(assert (= (or b!186543 b!186542) bm!18790))

(assert (=> b!186541 m!213451))

(assert (=> b!186541 m!213451))

(assert (=> b!186541 m!213453))

(declare-fun m!213671 () Bool)

(assert (=> bm!18790 m!213671))

(assert (=> b!186286 d!55311))

(declare-fun d!55313 () Bool)

(declare-fun e!122764 () Bool)

(assert (=> d!55313 e!122764))

(declare-fun res!88236 () Bool)

(assert (=> d!55313 (=> res!88236 e!122764)))

(declare-fun lt!92302 () Bool)

(assert (=> d!55313 (= res!88236 (not lt!92302))))

(declare-fun lt!92303 () Bool)

(assert (=> d!55313 (= lt!92302 lt!92303)))

(declare-fun lt!92305 () Unit!5613)

(declare-fun e!122765 () Unit!5613)

(assert (=> d!55313 (= lt!92305 e!122765)))

(declare-fun c!33463 () Bool)

(assert (=> d!55313 (= c!33463 lt!92303)))

(assert (=> d!55313 (= lt!92303 (containsKey!229 (toList!1183 lt!92200) (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55313 (= (contains!1291 lt!92200 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)) lt!92302)))

(declare-fun b!186545 () Bool)

(declare-fun lt!92304 () Unit!5613)

(assert (=> b!186545 (= e!122765 lt!92304)))

(assert (=> b!186545 (= lt!92304 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1183 lt!92200) (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186545 (isDefined!178 (getValueByKey!226 (toList!1183 lt!92200) (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186546 () Bool)

(declare-fun Unit!5625 () Unit!5613)

(assert (=> b!186546 (= e!122765 Unit!5625)))

(declare-fun b!186547 () Bool)

(assert (=> b!186547 (= e!122764 (isDefined!178 (getValueByKey!226 (toList!1183 lt!92200) (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55313 c!33463) b!186545))

(assert (= (and d!55313 (not c!33463)) b!186546))

(assert (= (and d!55313 (not res!88236)) b!186547))

(assert (=> d!55313 m!213451))

(declare-fun m!213673 () Bool)

(assert (=> d!55313 m!213673))

(assert (=> b!186545 m!213451))

(declare-fun m!213675 () Bool)

(assert (=> b!186545 m!213675))

(assert (=> b!186545 m!213451))

(assert (=> b!186545 m!213663))

(assert (=> b!186545 m!213663))

(declare-fun m!213677 () Bool)

(assert (=> b!186545 m!213677))

(assert (=> b!186547 m!213451))

(assert (=> b!186547 m!213663))

(assert (=> b!186547 m!213663))

(assert (=> b!186547 m!213677))

(assert (=> b!186384 d!55313))

(assert (=> d!55257 d!55253))

(declare-fun b!186559 () Bool)

(declare-fun e!122768 () Bool)

(assert (=> b!186559 (= e!122768 (and (bvsge (extraKeys!3534 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3534 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1341 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!186558 () Bool)

(declare-fun res!88247 () Bool)

(assert (=> b!186558 (=> (not res!88247) (not e!122768))))

(declare-fun size!4062 (LongMapFixedSize!2584) (_ BitVec 32))

(assert (=> b!186558 (= res!88247 (= (size!4062 thiss!1248) (bvadd (_size!1341 thiss!1248) (bvsdiv (bvadd (extraKeys!3534 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!186557 () Bool)

(declare-fun res!88246 () Bool)

(assert (=> b!186557 (=> (not res!88246) (not e!122768))))

(assert (=> b!186557 (= res!88246 (bvsge (size!4062 thiss!1248) (_size!1341 thiss!1248)))))

(declare-fun b!186556 () Bool)

(declare-fun res!88245 () Bool)

(assert (=> b!186556 (=> (not res!88245) (not e!122768))))

(assert (=> b!186556 (= res!88245 (and (= (size!4057 (_values!3780 thiss!1248)) (bvadd (mask!8919 thiss!1248) #b00000000000000000000000000000001)) (= (size!4056 (_keys!5739 thiss!1248)) (size!4057 (_values!3780 thiss!1248))) (bvsge (_size!1341 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1341 thiss!1248) (bvadd (mask!8919 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!55315 () Bool)

(declare-fun res!88248 () Bool)

(assert (=> d!55315 (=> (not res!88248) (not e!122768))))

(assert (=> d!55315 (= res!88248 (validMask!0 (mask!8919 thiss!1248)))))

(assert (=> d!55315 (= (simpleValid!184 thiss!1248) e!122768)))

(assert (= (and d!55315 res!88248) b!186556))

(assert (= (and b!186556 res!88245) b!186557))

(assert (= (and b!186557 res!88246) b!186558))

(assert (= (and b!186558 res!88247) b!186559))

(declare-fun m!213679 () Bool)

(assert (=> b!186558 m!213679))

(assert (=> b!186557 m!213679))

(assert (=> d!55315 m!213337))

(assert (=> d!55241 d!55315))

(assert (=> bm!18775 d!55275))

(declare-fun d!55317 () Bool)

(assert (=> d!55317 (= (apply!168 lt!92200 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2158 (getValueByKey!226 (toList!1183 lt!92200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7558 () Bool)

(assert (= bs!7558 d!55317))

(declare-fun m!213681 () Bool)

(assert (=> bs!7558 m!213681))

(assert (=> bs!7558 m!213681))

(declare-fun m!213683 () Bool)

(assert (=> bs!7558 m!213683))

(assert (=> b!186390 d!55317))

(declare-fun d!55319 () Bool)

(assert (=> d!55319 (= (validKeyInArray!0 (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3740 (_keys!5739 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186389 d!55319))

(declare-fun d!55321 () Bool)

(declare-fun e!122769 () Bool)

(assert (=> d!55321 e!122769))

(declare-fun res!88250 () Bool)

(assert (=> d!55321 (=> (not res!88250) (not e!122769))))

(declare-fun lt!92306 () ListLongMap!2335)

(assert (=> d!55321 (= res!88250 (contains!1291 lt!92306 (_1!1718 (ite (or c!33422 c!33420) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))))

(declare-fun lt!92308 () List!2340)

(assert (=> d!55321 (= lt!92306 (ListLongMap!2336 lt!92308))))

(declare-fun lt!92307 () Unit!5613)

(declare-fun lt!92309 () Unit!5613)

(assert (=> d!55321 (= lt!92307 lt!92309)))

(assert (=> d!55321 (= (getValueByKey!226 lt!92308 (_1!1718 (ite (or c!33422 c!33420) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))) (Some!231 (_2!1718 (ite (or c!33422 c!33420) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))))

(assert (=> d!55321 (= lt!92309 (lemmaContainsTupThenGetReturnValue!118 lt!92308 (_1!1718 (ite (or c!33422 c!33420) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))) (_2!1718 (ite (or c!33422 c!33420) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))))

(assert (=> d!55321 (= lt!92308 (insertStrictlySorted!121 (toList!1183 (ite c!33422 call!18775 (ite c!33420 call!18777 call!18776))) (_1!1718 (ite (or c!33422 c!33420) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))) (_2!1718 (ite (or c!33422 c!33420) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))))

(assert (=> d!55321 (= (+!288 (ite c!33422 call!18775 (ite c!33420 call!18777 call!18776)) (ite (or c!33422 c!33420) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))) lt!92306)))

(declare-fun b!186560 () Bool)

(declare-fun res!88249 () Bool)

(assert (=> b!186560 (=> (not res!88249) (not e!122769))))

(assert (=> b!186560 (= res!88249 (= (getValueByKey!226 (toList!1183 lt!92306) (_1!1718 (ite (or c!33422 c!33420) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))) (Some!231 (_2!1718 (ite (or c!33422 c!33420) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))))

(declare-fun b!186561 () Bool)

(assert (=> b!186561 (= e!122769 (contains!1294 (toList!1183 lt!92306) (ite (or c!33422 c!33420) (tuple2!3415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3415 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))

(assert (= (and d!55321 res!88250) b!186560))

(assert (= (and b!186560 res!88249) b!186561))

(declare-fun m!213685 () Bool)

(assert (=> d!55321 m!213685))

(declare-fun m!213687 () Bool)

(assert (=> d!55321 m!213687))

(declare-fun m!213689 () Bool)

(assert (=> d!55321 m!213689))

(declare-fun m!213691 () Bool)

(assert (=> d!55321 m!213691))

(declare-fun m!213693 () Bool)

(assert (=> b!186560 m!213693))

(declare-fun m!213695 () Bool)

(assert (=> b!186561 m!213695))

(assert (=> bm!18777 d!55321))

(declare-fun d!55323 () Bool)

(assert (=> d!55323 (= (inRange!0 (ite c!33403 (index!4694 lt!92131) (index!4697 lt!92131)) (mask!8919 thiss!1248)) (and (bvsge (ite c!33403 (index!4694 lt!92131) (index!4697 lt!92131)) #b00000000000000000000000000000000) (bvslt (ite c!33403 (index!4694 lt!92131) (index!4697 lt!92131)) (bvadd (mask!8919 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!18757 d!55323))

(declare-fun b!186574 () Bool)

(declare-fun e!122777 () SeekEntryResult!631)

(assert (=> b!186574 (= e!122777 Undefined!631)))

(declare-fun lt!92315 () SeekEntryResult!631)

(declare-fun d!55325 () Bool)

(assert (=> d!55325 (and (or ((_ is Undefined!631) lt!92315) (not ((_ is Found!631) lt!92315)) (and (bvsge (index!4695 lt!92315) #b00000000000000000000000000000000) (bvslt (index!4695 lt!92315) (size!4056 (_keys!5739 thiss!1248))))) (or ((_ is Undefined!631) lt!92315) ((_ is Found!631) lt!92315) (not ((_ is MissingVacant!631) lt!92315)) (not (= (index!4697 lt!92315) (index!4696 lt!92126))) (and (bvsge (index!4697 lt!92315) #b00000000000000000000000000000000) (bvslt (index!4697 lt!92315) (size!4056 (_keys!5739 thiss!1248))))) (or ((_ is Undefined!631) lt!92315) (ite ((_ is Found!631) lt!92315) (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4695 lt!92315)) key!828) (and ((_ is MissingVacant!631) lt!92315) (= (index!4697 lt!92315) (index!4696 lt!92126)) (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4697 lt!92315)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55325 (= lt!92315 e!122777)))

(declare-fun c!33470 () Bool)

(assert (=> d!55325 (= c!33470 (bvsge (x!20195 lt!92126) #b01111111111111111111111111111110))))

(declare-fun lt!92314 () (_ BitVec 64))

(assert (=> d!55325 (= lt!92314 (select (arr!3740 (_keys!5739 thiss!1248)) (index!4696 lt!92126)))))

(assert (=> d!55325 (validMask!0 (mask!8919 thiss!1248))))

(assert (=> d!55325 (= (seekKeyOrZeroReturnVacant!0 (x!20195 lt!92126) (index!4696 lt!92126) (index!4696 lt!92126) key!828 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)) lt!92315)))

(declare-fun b!186575 () Bool)

(declare-fun e!122778 () SeekEntryResult!631)

(assert (=> b!186575 (= e!122778 (Found!631 (index!4696 lt!92126)))))

(declare-fun b!186576 () Bool)

(declare-fun c!33472 () Bool)

(assert (=> b!186576 (= c!33472 (= lt!92314 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!122776 () SeekEntryResult!631)

(assert (=> b!186576 (= e!122778 e!122776)))

(declare-fun b!186577 () Bool)

(assert (=> b!186577 (= e!122776 (MissingVacant!631 (index!4696 lt!92126)))))

(declare-fun b!186578 () Bool)

(assert (=> b!186578 (= e!122776 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20195 lt!92126) #b00000000000000000000000000000001) (nextIndex!0 (index!4696 lt!92126) (bvadd (x!20195 lt!92126) #b00000000000000000000000000000001) (mask!8919 thiss!1248)) (index!4696 lt!92126) key!828 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)))))

(declare-fun b!186579 () Bool)

(assert (=> b!186579 (= e!122777 e!122778)))

(declare-fun c!33471 () Bool)

(assert (=> b!186579 (= c!33471 (= lt!92314 key!828))))

(assert (= (and d!55325 c!33470) b!186574))

(assert (= (and d!55325 (not c!33470)) b!186579))

(assert (= (and b!186579 c!33471) b!186575))

(assert (= (and b!186579 (not c!33471)) b!186576))

(assert (= (and b!186576 c!33472) b!186577))

(assert (= (and b!186576 (not c!33472)) b!186578))

(declare-fun m!213697 () Bool)

(assert (=> d!55325 m!213697))

(declare-fun m!213699 () Bool)

(assert (=> d!55325 m!213699))

(assert (=> d!55325 m!213415))

(assert (=> d!55325 m!213337))

(declare-fun m!213701 () Bool)

(assert (=> b!186578 m!213701))

(assert (=> b!186578 m!213701))

(declare-fun m!213703 () Bool)

(assert (=> b!186578 m!213703))

(assert (=> b!186279 d!55325))

(declare-fun d!55327 () Bool)

(assert (=> d!55327 (= (apply!168 lt!92200 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2158 (getValueByKey!226 (toList!1183 lt!92200) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7559 () Bool)

(assert (= bs!7559 d!55327))

(declare-fun m!213705 () Bool)

(assert (=> bs!7559 m!213705))

(assert (=> bs!7559 m!213705))

(declare-fun m!213707 () Bool)

(assert (=> bs!7559 m!213707))

(assert (=> b!186377 d!55327))

(assert (=> b!186376 d!55319))

(assert (=> d!55243 d!55239))

(declare-fun b!186596 () Bool)

(declare-fun e!122787 () Bool)

(declare-fun lt!92318 () SeekEntryResult!631)

(assert (=> b!186596 (= e!122787 ((_ is Undefined!631) lt!92318))))

(declare-fun b!186598 () Bool)

(declare-fun res!88259 () Bool)

(assert (=> b!186598 (= res!88259 (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4694 lt!92318)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!122788 () Bool)

(assert (=> b!186598 (=> (not res!88259) (not e!122788))))

(declare-fun b!186599 () Bool)

(declare-fun call!18798 () Bool)

(assert (=> b!186599 (= e!122788 (not call!18798))))

(declare-fun b!186600 () Bool)

(declare-fun res!88262 () Bool)

(declare-fun e!122789 () Bool)

(assert (=> b!186600 (=> (not res!88262) (not e!122789))))

(assert (=> b!186600 (= res!88262 (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4697 lt!92318)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186601 () Bool)

(assert (=> b!186601 (= e!122789 (not call!18798))))

(declare-fun bm!18795 () Bool)

(assert (=> bm!18795 (= call!18798 (arrayContainsKey!0 (_keys!5739 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!186602 () Bool)

(declare-fun e!122790 () Bool)

(assert (=> b!186602 (= e!122790 e!122787)))

(declare-fun c!33478 () Bool)

(assert (=> b!186602 (= c!33478 ((_ is MissingVacant!631) lt!92318))))

(declare-fun d!55329 () Bool)

(assert (=> d!55329 e!122790))

(declare-fun c!33477 () Bool)

(assert (=> d!55329 (= c!33477 ((_ is MissingZero!631) lt!92318))))

(assert (=> d!55329 (= lt!92318 (seekEntryOrOpen!0 key!828 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)))))

(assert (=> d!55329 true))

(declare-fun _$34!1063 () Unit!5613)

(assert (=> d!55329 (= (choose!991 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)) _$34!1063)))

(declare-fun b!186597 () Bool)

(assert (=> b!186597 (= e!122790 e!122788)))

(declare-fun res!88260 () Bool)

(declare-fun call!18799 () Bool)

(assert (=> b!186597 (= res!88260 call!18799)))

(assert (=> b!186597 (=> (not res!88260) (not e!122788))))

(declare-fun bm!18796 () Bool)

(assert (=> bm!18796 (= call!18799 (inRange!0 (ite c!33477 (index!4694 lt!92318) (index!4697 lt!92318)) (mask!8919 thiss!1248)))))

(declare-fun b!186603 () Bool)

(declare-fun res!88261 () Bool)

(assert (=> b!186603 (=> (not res!88261) (not e!122789))))

(assert (=> b!186603 (= res!88261 call!18799)))

(assert (=> b!186603 (= e!122787 e!122789)))

(assert (= (and d!55329 c!33477) b!186597))

(assert (= (and d!55329 (not c!33477)) b!186602))

(assert (= (and b!186597 res!88260) b!186598))

(assert (= (and b!186598 res!88259) b!186599))

(assert (= (and b!186602 c!33478) b!186603))

(assert (= (and b!186602 (not c!33478)) b!186596))

(assert (= (and b!186603 res!88261) b!186600))

(assert (= (and b!186600 res!88262) b!186601))

(assert (= (or b!186597 b!186603) bm!18796))

(assert (= (or b!186599 b!186601) bm!18795))

(assert (=> bm!18795 m!213431))

(declare-fun m!213709 () Bool)

(assert (=> b!186600 m!213709))

(assert (=> d!55329 m!213351))

(declare-fun m!213711 () Bool)

(assert (=> b!186598 m!213711))

(declare-fun m!213713 () Bool)

(assert (=> bm!18796 m!213713))

(assert (=> d!55243 d!55329))

(assert (=> d!55243 d!55253))

(declare-fun d!55331 () Bool)

(declare-fun isEmpty!478 (Option!232) Bool)

(assert (=> d!55331 (= (isDefined!178 (getValueByKey!226 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828)) (not (isEmpty!478 (getValueByKey!226 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))))

(declare-fun bs!7560 () Bool)

(assert (= bs!7560 d!55331))

(assert (=> bs!7560 m!213447))

(declare-fun m!213715 () Bool)

(assert (=> bs!7560 m!213715))

(assert (=> b!186327 d!55331))

(declare-fun b!186612 () Bool)

(declare-fun e!122795 () Option!232)

(assert (=> b!186612 (= e!122795 (Some!231 (_2!1718 (h!2969 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))))))

(declare-fun b!186614 () Bool)

(declare-fun e!122796 () Option!232)

(assert (=> b!186614 (= e!122796 (getValueByKey!226 (t!7218 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))) key!828))))

(declare-fun d!55333 () Bool)

(declare-fun c!33483 () Bool)

(assert (=> d!55333 (= c!33483 (and ((_ is Cons!2336) (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))) (= (_1!1718 (h!2969 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))))) key!828)))))

(assert (=> d!55333 (= (getValueByKey!226 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828) e!122795)))

(declare-fun b!186613 () Bool)

(assert (=> b!186613 (= e!122795 e!122796)))

(declare-fun c!33484 () Bool)

(assert (=> b!186613 (= c!33484 (and ((_ is Cons!2336) (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))) (not (= (_1!1718 (h!2969 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))))) key!828))))))

(declare-fun b!186615 () Bool)

(assert (=> b!186615 (= e!122796 None!230)))

(assert (= (and d!55333 c!33483) b!186612))

(assert (= (and d!55333 (not c!33483)) b!186613))

(assert (= (and b!186613 c!33484) b!186614))

(assert (= (and b!186613 (not c!33484)) b!186615))

(declare-fun m!213717 () Bool)

(assert (=> b!186614 m!213717))

(assert (=> b!186327 d!55333))

(declare-fun d!55335 () Bool)

(declare-fun e!122797 () Bool)

(assert (=> d!55335 e!122797))

(declare-fun res!88263 () Bool)

(assert (=> d!55335 (=> res!88263 e!122797)))

(declare-fun lt!92319 () Bool)

(assert (=> d!55335 (= res!88263 (not lt!92319))))

(declare-fun lt!92320 () Bool)

(assert (=> d!55335 (= lt!92319 lt!92320)))

(declare-fun lt!92322 () Unit!5613)

(declare-fun e!122798 () Unit!5613)

(assert (=> d!55335 (= lt!92322 e!122798)))

(declare-fun c!33485 () Bool)

(assert (=> d!55335 (= c!33485 lt!92320)))

(assert (=> d!55335 (= lt!92320 (containsKey!229 (toList!1183 lt!92200) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55335 (= (contains!1291 lt!92200 #b1000000000000000000000000000000000000000000000000000000000000000) lt!92319)))

(declare-fun b!186616 () Bool)

(declare-fun lt!92321 () Unit!5613)

(assert (=> b!186616 (= e!122798 lt!92321)))

(assert (=> b!186616 (= lt!92321 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1183 lt!92200) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186616 (isDefined!178 (getValueByKey!226 (toList!1183 lt!92200) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186617 () Bool)

(declare-fun Unit!5626 () Unit!5613)

(assert (=> b!186617 (= e!122798 Unit!5626)))

(declare-fun b!186618 () Bool)

(assert (=> b!186618 (= e!122797 (isDefined!178 (getValueByKey!226 (toList!1183 lt!92200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55335 c!33485) b!186616))

(assert (= (and d!55335 (not c!33485)) b!186617))

(assert (= (and d!55335 (not res!88263)) b!186618))

(declare-fun m!213719 () Bool)

(assert (=> d!55335 m!213719))

(declare-fun m!213721 () Bool)

(assert (=> b!186616 m!213721))

(assert (=> b!186616 m!213681))

(assert (=> b!186616 m!213681))

(declare-fun m!213723 () Bool)

(assert (=> b!186616 m!213723))

(assert (=> b!186618 m!213681))

(assert (=> b!186618 m!213681))

(assert (=> b!186618 m!213723))

(assert (=> bm!18773 d!55335))

(assert (=> d!55249 d!55239))

(declare-fun d!55337 () Bool)

(declare-fun e!122801 () Bool)

(assert (=> d!55337 e!122801))

(declare-fun res!88269 () Bool)

(assert (=> d!55337 (=> (not res!88269) (not e!122801))))

(declare-fun lt!92325 () SeekEntryResult!631)

(assert (=> d!55337 (= res!88269 ((_ is Found!631) lt!92325))))

(assert (=> d!55337 (= lt!92325 (seekEntryOrOpen!0 key!828 (_keys!5739 thiss!1248) (mask!8919 thiss!1248)))))

(assert (=> d!55337 true))

(declare-fun _$33!126 () Unit!5613)

(assert (=> d!55337 (= (choose!992 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)) _$33!126)))

(declare-fun b!186623 () Bool)

(declare-fun res!88268 () Bool)

(assert (=> b!186623 (=> (not res!88268) (not e!122801))))

(assert (=> b!186623 (= res!88268 (inRange!0 (index!4695 lt!92325) (mask!8919 thiss!1248)))))

(declare-fun b!186624 () Bool)

(assert (=> b!186624 (= e!122801 (= (select (arr!3740 (_keys!5739 thiss!1248)) (index!4695 lt!92325)) key!828))))

(assert (= (and d!55337 res!88269) b!186623))

(assert (= (and b!186623 res!88268) b!186624))

(assert (=> d!55337 m!213351))

(declare-fun m!213725 () Bool)

(assert (=> b!186623 m!213725))

(declare-fun m!213727 () Bool)

(assert (=> b!186624 m!213727))

(assert (=> d!55249 d!55337))

(assert (=> d!55249 d!55253))

(declare-fun d!55339 () Bool)

(declare-fun e!122802 () Bool)

(assert (=> d!55339 e!122802))

(declare-fun res!88270 () Bool)

(assert (=> d!55339 (=> res!88270 e!122802)))

(declare-fun lt!92326 () Bool)

(assert (=> d!55339 (= res!88270 (not lt!92326))))

(declare-fun lt!92327 () Bool)

(assert (=> d!55339 (= lt!92326 lt!92327)))

(declare-fun lt!92329 () Unit!5613)

(declare-fun e!122803 () Unit!5613)

(assert (=> d!55339 (= lt!92329 e!122803)))

(declare-fun c!33486 () Bool)

(assert (=> d!55339 (= c!33486 lt!92327)))

(assert (=> d!55339 (= lt!92327 (containsKey!229 (toList!1183 lt!92200) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55339 (= (contains!1291 lt!92200 #b0000000000000000000000000000000000000000000000000000000000000000) lt!92326)))

(declare-fun b!186625 () Bool)

(declare-fun lt!92328 () Unit!5613)

(assert (=> b!186625 (= e!122803 lt!92328)))

(assert (=> b!186625 (= lt!92328 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1183 lt!92200) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186625 (isDefined!178 (getValueByKey!226 (toList!1183 lt!92200) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186626 () Bool)

(declare-fun Unit!5627 () Unit!5613)

(assert (=> b!186626 (= e!122803 Unit!5627)))

(declare-fun b!186627 () Bool)

(assert (=> b!186627 (= e!122802 (isDefined!178 (getValueByKey!226 (toList!1183 lt!92200) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55339 c!33486) b!186625))

(assert (= (and d!55339 (not c!33486)) b!186626))

(assert (= (and d!55339 (not res!88270)) b!186627))

(declare-fun m!213729 () Bool)

(assert (=> d!55339 m!213729))

(declare-fun m!213731 () Bool)

(assert (=> b!186625 m!213731))

(assert (=> b!186625 m!213705))

(assert (=> b!186625 m!213705))

(declare-fun m!213733 () Bool)

(assert (=> b!186625 m!213733))

(assert (=> b!186627 m!213705))

(assert (=> b!186627 m!213705))

(assert (=> b!186627 m!213733))

(assert (=> bm!18772 d!55339))

(declare-fun d!55341 () Bool)

(assert (=> d!55341 (isDefined!178 (getValueByKey!226 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))

(declare-fun lt!92332 () Unit!5613)

(declare-fun choose!995 (List!2340 (_ BitVec 64)) Unit!5613)

(assert (=> d!55341 (= lt!92332 (choose!995 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))

(declare-fun e!122806 () Bool)

(assert (=> d!55341 e!122806))

(declare-fun res!88273 () Bool)

(assert (=> d!55341 (=> (not res!88273) (not e!122806))))

(declare-fun isStrictlySorted!336 (List!2340) Bool)

(assert (=> d!55341 (= res!88273 (isStrictlySorted!336 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))))

(assert (=> d!55341 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828) lt!92332)))

(declare-fun b!186630 () Bool)

(assert (=> b!186630 (= e!122806 (containsKey!229 (toList!1183 (getCurrentListMap!835 (_keys!5739 thiss!1248) (_values!3780 thiss!1248) (mask!8919 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))

(assert (= (and d!55341 res!88273) b!186630))

(assert (=> d!55341 m!213447))

(assert (=> d!55341 m!213447))

(assert (=> d!55341 m!213449))

(declare-fun m!213735 () Bool)

(assert (=> d!55341 m!213735))

(declare-fun m!213737 () Bool)

(assert (=> d!55341 m!213737))

(assert (=> b!186630 m!213443))

(assert (=> b!186325 d!55341))

(assert (=> b!186325 d!55331))

(assert (=> b!186325 d!55333))

(declare-fun condMapEmpty!7519 () Bool)

(declare-fun mapDefault!7519 () ValueCell!1838)

(assert (=> mapNonEmpty!7518 (= condMapEmpty!7519 (= mapRest!7518 ((as const (Array (_ BitVec 32) ValueCell!1838)) mapDefault!7519)))))

(declare-fun e!122807 () Bool)

(declare-fun mapRes!7519 () Bool)

(assert (=> mapNonEmpty!7518 (= tp!16590 (and e!122807 mapRes!7519))))

(declare-fun b!186632 () Bool)

(assert (=> b!186632 (= e!122807 tp_is_empty!4363)))

(declare-fun mapNonEmpty!7519 () Bool)

(declare-fun tp!16591 () Bool)

(declare-fun e!122808 () Bool)

(assert (=> mapNonEmpty!7519 (= mapRes!7519 (and tp!16591 e!122808))))

(declare-fun mapKey!7519 () (_ BitVec 32))

(declare-fun mapValue!7519 () ValueCell!1838)

(declare-fun mapRest!7519 () (Array (_ BitVec 32) ValueCell!1838))

(assert (=> mapNonEmpty!7519 (= mapRest!7518 (store mapRest!7519 mapKey!7519 mapValue!7519))))

(declare-fun b!186631 () Bool)

(assert (=> b!186631 (= e!122808 tp_is_empty!4363)))

(declare-fun mapIsEmpty!7519 () Bool)

(assert (=> mapIsEmpty!7519 mapRes!7519))

(assert (= (and mapNonEmpty!7518 condMapEmpty!7519) mapIsEmpty!7519))

(assert (= (and mapNonEmpty!7518 (not condMapEmpty!7519)) mapNonEmpty!7519))

(assert (= (and mapNonEmpty!7519 ((_ is ValueCellFull!1838) mapValue!7519)) b!186631))

(assert (= (and mapNonEmpty!7518 ((_ is ValueCellFull!1838) mapDefault!7519)) b!186632))

(declare-fun m!213739 () Bool)

(assert (=> mapNonEmpty!7519 m!213739))

(declare-fun b_lambda!7289 () Bool)

(assert (= b_lambda!7285 (or (and b!186185 b_free!4591) b_lambda!7289)))

(declare-fun b_lambda!7291 () Bool)

(assert (= b_lambda!7287 (or (and b!186185 b_free!4591) b_lambda!7291)))

(check-sat (not b!186506) (not b!186578) (not b!186507) (not b!186531) (not b!186459) (not b!186485) (not b!186457) (not b!186425) (not d!55335) (not d!55275) (not b_lambda!7291) (not b!186532) (not d!55293) (not b!186509) (not d!55285) (not b!186560) (not d!55339) (not b!186445) (not d!55337) (not bm!18781) (not b_next!4591) (not b_lambda!7289) (not b_lambda!7283) (not d!55297) (not d!55329) (not d!55267) (not b!186526) (not b!186541) (not d!55315) (not b!186523) (not mapNonEmpty!7519) (not d!55281) (not d!55295) (not b!186545) (not d!55325) (not b!186625) (not b!186623) (not b!186547) (not d!55331) (not b!186497) (not d!55307) (not d!55287) (not d!55289) (not d!55313) (not d!55321) (not b!186510) (not b!186614) (not b!186511) (not b!186503) (not b!186504) (not b!186627) (not d!55277) (not b!186456) (not d!55263) (not b!186491) (not d!55341) (not b!186493) (not b!186439) (not d!55279) (not d!55317) (not d!55299) (not b!186492) (not b!186558) (not b!186487) (not d!55273) (not b!186513) (not d!55283) (not d!55301) (not d!55291) (not b!186489) (not b!186561) (not d!55327) (not b!186618) (not b!186630) (not d!55303) (not b!186438) (not b!186494) (not b!186495) (not bm!18790) (not b!186406) tp_is_empty!4363 (not b!186498) (not b!186557) b_and!11219 (not bm!18784) (not bm!18795) (not bm!18787) (not b!186616) (not bm!18796))
(check-sat b_and!11219 (not b_next!4591))
