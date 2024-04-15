; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23882 () Bool)

(assert start!23882)

(declare-fun b!250180 () Bool)

(declare-fun b_free!6625 () Bool)

(declare-fun b_next!6625 () Bool)

(assert (=> b!250180 (= b_free!6625 (not b_next!6625))))

(declare-fun tp!23140 () Bool)

(declare-fun b_and!13619 () Bool)

(assert (=> b!250180 (= tp!23140 b_and!13619)))

(declare-fun b!250167 () Bool)

(declare-fun e!162239 () Bool)

(declare-fun e!162246 () Bool)

(assert (=> b!250167 (= e!162239 e!162246)))

(declare-fun res!122513 () Bool)

(assert (=> b!250167 (=> (not res!122513) (not e!162246))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8297 0))(
  ( (V!8298 (val!3288 Int)) )
))
(declare-datatypes ((ValueCell!2900 0))(
  ( (ValueCellFull!2900 (v!5347 V!8297)) (EmptyCell!2900) )
))
(declare-datatypes ((array!12283 0))(
  ( (array!12284 (arr!5823 (Array (_ BitVec 32) ValueCell!2900)) (size!6169 (_ BitVec 32))) )
))
(declare-datatypes ((array!12285 0))(
  ( (array!12286 (arr!5824 (Array (_ BitVec 32) (_ BitVec 64))) (size!6170 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3700 0))(
  ( (LongMapFixedSize!3701 (defaultEntry!4627 Int) (mask!10809 (_ BitVec 32)) (extraKeys!4364 (_ BitVec 32)) (zeroValue!4468 V!8297) (minValue!4468 V!8297) (_size!1899 (_ BitVec 32)) (_keys!6762 array!12285) (_values!4610 array!12283) (_vacant!1899 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3700)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250167 (= res!122513 (inRange!0 index!297 (mask!10809 thiss!1504)))))

(declare-datatypes ((Unit!7723 0))(
  ( (Unit!7724) )
))
(declare-fun lt!125231 () Unit!7723)

(declare-fun e!162243 () Unit!7723)

(assert (=> b!250167 (= lt!125231 e!162243)))

(declare-fun c!42028 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4804 0))(
  ( (tuple2!4805 (_1!2413 (_ BitVec 64)) (_2!2413 V!8297)) )
))
(declare-datatypes ((List!3703 0))(
  ( (Nil!3700) (Cons!3699 (h!4359 tuple2!4804) (t!8727 List!3703)) )
))
(declare-datatypes ((ListLongMap!3707 0))(
  ( (ListLongMap!3708 (toList!1869 List!3703)) )
))
(declare-fun contains!1795 (ListLongMap!3707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1378 (array!12285 array!12283 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 32) Int) ListLongMap!3707)

(assert (=> b!250167 (= c!42028 (contains!1795 (getCurrentListMap!1378 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)) key!932))))

(declare-fun b!250168 () Bool)

(declare-fun e!162249 () Bool)

(declare-datatypes ((SeekEntryResult!1119 0))(
  ( (MissingZero!1119 (index!6646 (_ BitVec 32))) (Found!1119 (index!6647 (_ BitVec 32))) (Intermediate!1119 (undefined!1931 Bool) (index!6648 (_ BitVec 32)) (x!24668 (_ BitVec 32))) (Undefined!1119) (MissingVacant!1119 (index!6649 (_ BitVec 32))) )
))
(declare-fun lt!125225 () SeekEntryResult!1119)

(get-info :version)

(assert (=> b!250168 (= e!162249 ((_ is Undefined!1119) lt!125225))))

(declare-fun b!250169 () Bool)

(declare-fun lt!125232 () Unit!7723)

(assert (=> b!250169 (= e!162243 lt!125232)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!396 (array!12285 array!12283 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) Int) Unit!7723)

(assert (=> b!250169 (= lt!125232 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!396 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)))))

(declare-fun c!42030 () Bool)

(assert (=> b!250169 (= c!42030 ((_ is MissingZero!1119) lt!125225))))

(declare-fun e!162242 () Bool)

(assert (=> b!250169 e!162242))

(declare-fun b!250170 () Bool)

(declare-fun res!122512 () Bool)

(declare-fun e!162238 () Bool)

(assert (=> b!250170 (=> (not res!122512) (not e!162238))))

(declare-fun call!23494 () Bool)

(assert (=> b!250170 (= res!122512 call!23494)))

(assert (=> b!250170 (= e!162242 e!162238)))

(declare-fun b!250171 () Bool)

(declare-fun c!42031 () Bool)

(assert (=> b!250171 (= c!42031 ((_ is MissingVacant!1119) lt!125225))))

(assert (=> b!250171 (= e!162242 e!162249)))

(declare-fun b!250172 () Bool)

(declare-fun res!122505 () Bool)

(assert (=> b!250172 (= res!122505 (= (select (arr!5824 (_keys!6762 thiss!1504)) (index!6649 lt!125225)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162240 () Bool)

(assert (=> b!250172 (=> (not res!122505) (not e!162240))))

(declare-fun b!250173 () Bool)

(declare-fun res!122506 () Bool)

(assert (=> b!250173 (=> (not res!122506) (not e!162238))))

(assert (=> b!250173 (= res!122506 (= (select (arr!5824 (_keys!6762 thiss!1504)) (index!6646 lt!125225)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!122510 () Bool)

(declare-fun e!162241 () Bool)

(assert (=> start!23882 (=> (not res!122510) (not e!162241))))

(declare-fun valid!1451 (LongMapFixedSize!3700) Bool)

(assert (=> start!23882 (= res!122510 (valid!1451 thiss!1504))))

(assert (=> start!23882 e!162241))

(declare-fun e!162248 () Bool)

(assert (=> start!23882 e!162248))

(assert (=> start!23882 true))

(declare-fun b!250174 () Bool)

(declare-fun e!162236 () Bool)

(declare-fun tp_is_empty!6487 () Bool)

(assert (=> b!250174 (= e!162236 tp_is_empty!6487)))

(declare-fun b!250175 () Bool)

(declare-fun call!23495 () Bool)

(assert (=> b!250175 (= e!162240 (not call!23495))))

(declare-fun b!250176 () Bool)

(declare-fun e!162237 () Unit!7723)

(declare-fun Unit!7725 () Unit!7723)

(assert (=> b!250176 (= e!162237 Unit!7725)))

(declare-fun mapNonEmpty!11023 () Bool)

(declare-fun mapRes!11023 () Bool)

(declare-fun tp!23139 () Bool)

(assert (=> mapNonEmpty!11023 (= mapRes!11023 (and tp!23139 e!162236))))

(declare-fun mapKey!11023 () (_ BitVec 32))

(declare-fun mapRest!11023 () (Array (_ BitVec 32) ValueCell!2900))

(declare-fun mapValue!11023 () ValueCell!2900)

(assert (=> mapNonEmpty!11023 (= (arr!5823 (_values!4610 thiss!1504)) (store mapRest!11023 mapKey!11023 mapValue!11023))))

(declare-fun b!250177 () Bool)

(assert (=> b!250177 (= e!162241 e!162239)))

(declare-fun res!122508 () Bool)

(assert (=> b!250177 (=> (not res!122508) (not e!162239))))

(assert (=> b!250177 (= res!122508 (or (= lt!125225 (MissingZero!1119 index!297)) (= lt!125225 (MissingVacant!1119 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12285 (_ BitVec 32)) SeekEntryResult!1119)

(assert (=> b!250177 (= lt!125225 (seekEntryOrOpen!0 key!932 (_keys!6762 thiss!1504) (mask!10809 thiss!1504)))))

(declare-fun b!250178 () Bool)

(declare-fun e!162245 () Bool)

(assert (=> b!250178 (= e!162246 (not e!162245))))

(declare-fun res!122507 () Bool)

(assert (=> b!250178 (=> res!122507 e!162245)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!250178 (= res!122507 (not (validMask!0 (mask!10809 thiss!1504))))))

(declare-fun lt!125227 () array!12285)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12285 (_ BitVec 32)) Bool)

(assert (=> b!250178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125227 (mask!10809 thiss!1504))))

(declare-fun lt!125230 () Unit!7723)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12285 (_ BitVec 32) (_ BitVec 32)) Unit!7723)

(assert (=> b!250178 (= lt!125230 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6762 thiss!1504) index!297 (mask!10809 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12285 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!250178 (= (arrayCountValidKeys!0 lt!125227 #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6762 thiss!1504) #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504)))))))

(declare-fun lt!125234 () Unit!7723)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12285 (_ BitVec 32) (_ BitVec 64)) Unit!7723)

(assert (=> b!250178 (= lt!125234 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6762 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3704 0))(
  ( (Nil!3701) (Cons!3700 (h!4360 (_ BitVec 64)) (t!8728 List!3704)) )
))
(declare-fun arrayNoDuplicates!0 (array!12285 (_ BitVec 32) List!3704) Bool)

(assert (=> b!250178 (arrayNoDuplicates!0 lt!125227 #b00000000000000000000000000000000 Nil!3701)))

(assert (=> b!250178 (= lt!125227 (array!12286 (store (arr!5824 (_keys!6762 thiss!1504)) index!297 key!932) (size!6170 (_keys!6762 thiss!1504))))))

(declare-fun lt!125233 () Unit!7723)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12285 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3704) Unit!7723)

(assert (=> b!250178 (= lt!125233 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6762 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3701))))

(declare-fun lt!125226 () Unit!7723)

(assert (=> b!250178 (= lt!125226 e!162237)))

(declare-fun c!42029 () Bool)

(declare-fun arrayContainsKey!0 (array!12285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!250178 (= c!42029 (arrayContainsKey!0 (_keys!6762 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!23491 () Bool)

(assert (=> bm!23491 (= call!23495 (arrayContainsKey!0 (_keys!6762 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250179 () Bool)

(assert (=> b!250179 (= e!162245 (or (not (= (size!6169 (_values!4610 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10809 thiss!1504)))) (not (= (size!6170 (_keys!6762 thiss!1504)) (size!6169 (_values!4610 thiss!1504)))) (bvsge (mask!10809 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun bm!23492 () Bool)

(assert (=> bm!23492 (= call!23494 (inRange!0 (ite c!42030 (index!6646 lt!125225) (index!6649 lt!125225)) (mask!10809 thiss!1504)))))

(declare-fun mapIsEmpty!11023 () Bool)

(assert (=> mapIsEmpty!11023 mapRes!11023))

(declare-fun e!162235 () Bool)

(declare-fun array_inv!3839 (array!12285) Bool)

(declare-fun array_inv!3840 (array!12283) Bool)

(assert (=> b!250180 (= e!162248 (and tp!23140 tp_is_empty!6487 (array_inv!3839 (_keys!6762 thiss!1504)) (array_inv!3840 (_values!4610 thiss!1504)) e!162235))))

(declare-fun b!250181 () Bool)

(declare-fun e!162247 () Bool)

(assert (=> b!250181 (= e!162235 (and e!162247 mapRes!11023))))

(declare-fun condMapEmpty!11023 () Bool)

(declare-fun mapDefault!11023 () ValueCell!2900)

(assert (=> b!250181 (= condMapEmpty!11023 (= (arr!5823 (_values!4610 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2900)) mapDefault!11023)))))

(declare-fun b!250182 () Bool)

(assert (=> b!250182 (= e!162238 (not call!23495))))

(declare-fun b!250183 () Bool)

(declare-fun Unit!7726 () Unit!7723)

(assert (=> b!250183 (= e!162243 Unit!7726)))

(declare-fun lt!125228 () Unit!7723)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!398 (array!12285 array!12283 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) Int) Unit!7723)

(assert (=> b!250183 (= lt!125228 (lemmaInListMapThenSeekEntryOrOpenFindsIt!398 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)))))

(assert (=> b!250183 false))

(declare-fun b!250184 () Bool)

(declare-fun res!122509 () Bool)

(assert (=> b!250184 (=> (not res!122509) (not e!162241))))

(assert (=> b!250184 (= res!122509 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!250185 () Bool)

(assert (=> b!250185 (= e!162249 e!162240)))

(declare-fun res!122511 () Bool)

(assert (=> b!250185 (= res!122511 call!23494)))

(assert (=> b!250185 (=> (not res!122511) (not e!162240))))

(declare-fun b!250186 () Bool)

(declare-fun Unit!7727 () Unit!7723)

(assert (=> b!250186 (= e!162237 Unit!7727)))

(declare-fun lt!125229 () Unit!7723)

(declare-fun lemmaArrayContainsKeyThenInListMap!206 (array!12285 array!12283 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) (_ BitVec 32) Int) Unit!7723)

(assert (=> b!250186 (= lt!125229 (lemmaArrayContainsKeyThenInListMap!206 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(assert (=> b!250186 false))

(declare-fun b!250187 () Bool)

(assert (=> b!250187 (= e!162247 tp_is_empty!6487)))

(assert (= (and start!23882 res!122510) b!250184))

(assert (= (and b!250184 res!122509) b!250177))

(assert (= (and b!250177 res!122508) b!250167))

(assert (= (and b!250167 c!42028) b!250183))

(assert (= (and b!250167 (not c!42028)) b!250169))

(assert (= (and b!250169 c!42030) b!250170))

(assert (= (and b!250169 (not c!42030)) b!250171))

(assert (= (and b!250170 res!122512) b!250173))

(assert (= (and b!250173 res!122506) b!250182))

(assert (= (and b!250171 c!42031) b!250185))

(assert (= (and b!250171 (not c!42031)) b!250168))

(assert (= (and b!250185 res!122511) b!250172))

(assert (= (and b!250172 res!122505) b!250175))

(assert (= (or b!250170 b!250185) bm!23492))

(assert (= (or b!250182 b!250175) bm!23491))

(assert (= (and b!250167 res!122513) b!250178))

(assert (= (and b!250178 c!42029) b!250186))

(assert (= (and b!250178 (not c!42029)) b!250176))

(assert (= (and b!250178 (not res!122507)) b!250179))

(assert (= (and b!250181 condMapEmpty!11023) mapIsEmpty!11023))

(assert (= (and b!250181 (not condMapEmpty!11023)) mapNonEmpty!11023))

(assert (= (and mapNonEmpty!11023 ((_ is ValueCellFull!2900) mapValue!11023)) b!250174))

(assert (= (and b!250181 ((_ is ValueCellFull!2900) mapDefault!11023)) b!250187))

(assert (= b!250180 b!250181))

(assert (= start!23882 b!250180))

(declare-fun m!266161 () Bool)

(assert (=> bm!23492 m!266161))

(declare-fun m!266163 () Bool)

(assert (=> bm!23491 m!266163))

(declare-fun m!266165 () Bool)

(assert (=> b!250169 m!266165))

(declare-fun m!266167 () Bool)

(assert (=> b!250180 m!266167))

(declare-fun m!266169 () Bool)

(assert (=> b!250180 m!266169))

(declare-fun m!266171 () Bool)

(assert (=> start!23882 m!266171))

(declare-fun m!266173 () Bool)

(assert (=> b!250178 m!266173))

(assert (=> b!250178 m!266163))

(declare-fun m!266175 () Bool)

(assert (=> b!250178 m!266175))

(declare-fun m!266177 () Bool)

(assert (=> b!250178 m!266177))

(declare-fun m!266179 () Bool)

(assert (=> b!250178 m!266179))

(declare-fun m!266181 () Bool)

(assert (=> b!250178 m!266181))

(declare-fun m!266183 () Bool)

(assert (=> b!250178 m!266183))

(declare-fun m!266185 () Bool)

(assert (=> b!250178 m!266185))

(declare-fun m!266187 () Bool)

(assert (=> b!250178 m!266187))

(declare-fun m!266189 () Bool)

(assert (=> b!250178 m!266189))

(declare-fun m!266191 () Bool)

(assert (=> b!250167 m!266191))

(declare-fun m!266193 () Bool)

(assert (=> b!250167 m!266193))

(assert (=> b!250167 m!266193))

(declare-fun m!266195 () Bool)

(assert (=> b!250167 m!266195))

(declare-fun m!266197 () Bool)

(assert (=> b!250177 m!266197))

(declare-fun m!266199 () Bool)

(assert (=> b!250172 m!266199))

(declare-fun m!266201 () Bool)

(assert (=> b!250173 m!266201))

(declare-fun m!266203 () Bool)

(assert (=> mapNonEmpty!11023 m!266203))

(declare-fun m!266205 () Bool)

(assert (=> b!250186 m!266205))

(declare-fun m!266207 () Bool)

(assert (=> b!250183 m!266207))

(check-sat (not b!250177) (not b!250167) (not b!250183) (not start!23882) b_and!13619 (not b_next!6625) (not b!250178) (not b!250180) (not mapNonEmpty!11023) (not bm!23491) tp_is_empty!6487 (not b!250186) (not bm!23492) (not b!250169))
(check-sat b_and!13619 (not b_next!6625))
(get-model)

(declare-fun b!250324 () Bool)

(declare-fun e!162349 () Bool)

(declare-fun contains!1797 (List!3704 (_ BitVec 64)) Bool)

(assert (=> b!250324 (= e!162349 (contains!1797 Nil!3701 (select (arr!5824 lt!125227) #b00000000000000000000000000000000)))))

(declare-fun b!250325 () Bool)

(declare-fun e!162348 () Bool)

(declare-fun call!23510 () Bool)

(assert (=> b!250325 (= e!162348 call!23510)))

(declare-fun d!60783 () Bool)

(declare-fun res!122576 () Bool)

(declare-fun e!162350 () Bool)

(assert (=> d!60783 (=> res!122576 e!162350)))

(assert (=> d!60783 (= res!122576 (bvsge #b00000000000000000000000000000000 (size!6170 lt!125227)))))

(assert (=> d!60783 (= (arrayNoDuplicates!0 lt!125227 #b00000000000000000000000000000000 Nil!3701) e!162350)))

(declare-fun b!250326 () Bool)

(declare-fun e!162351 () Bool)

(assert (=> b!250326 (= e!162350 e!162351)))

(declare-fun res!122575 () Bool)

(assert (=> b!250326 (=> (not res!122575) (not e!162351))))

(assert (=> b!250326 (= res!122575 (not e!162349))))

(declare-fun res!122574 () Bool)

(assert (=> b!250326 (=> (not res!122574) (not e!162349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!250326 (= res!122574 (validKeyInArray!0 (select (arr!5824 lt!125227) #b00000000000000000000000000000000)))))

(declare-fun bm!23507 () Bool)

(declare-fun c!42058 () Bool)

(assert (=> bm!23507 (= call!23510 (arrayNoDuplicates!0 lt!125227 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42058 (Cons!3700 (select (arr!5824 lt!125227) #b00000000000000000000000000000000) Nil!3701) Nil!3701)))))

(declare-fun b!250327 () Bool)

(assert (=> b!250327 (= e!162348 call!23510)))

(declare-fun b!250328 () Bool)

(assert (=> b!250328 (= e!162351 e!162348)))

(assert (=> b!250328 (= c!42058 (validKeyInArray!0 (select (arr!5824 lt!125227) #b00000000000000000000000000000000)))))

(assert (= (and d!60783 (not res!122576)) b!250326))

(assert (= (and b!250326 res!122574) b!250324))

(assert (= (and b!250326 res!122575) b!250328))

(assert (= (and b!250328 c!42058) b!250325))

(assert (= (and b!250328 (not c!42058)) b!250327))

(assert (= (or b!250325 b!250327) bm!23507))

(declare-fun m!266305 () Bool)

(assert (=> b!250324 m!266305))

(assert (=> b!250324 m!266305))

(declare-fun m!266307 () Bool)

(assert (=> b!250324 m!266307))

(assert (=> b!250326 m!266305))

(assert (=> b!250326 m!266305))

(declare-fun m!266309 () Bool)

(assert (=> b!250326 m!266309))

(assert (=> bm!23507 m!266305))

(declare-fun m!266311 () Bool)

(assert (=> bm!23507 m!266311))

(assert (=> b!250328 m!266305))

(assert (=> b!250328 m!266305))

(assert (=> b!250328 m!266309))

(assert (=> b!250178 d!60783))

(declare-fun e!162357 () Bool)

(declare-fun b!250340 () Bool)

(assert (=> b!250340 (= e!162357 (= (arrayCountValidKeys!0 (array!12286 (store (arr!5824 (_keys!6762 thiss!1504)) index!297 key!932) (size!6170 (_keys!6762 thiss!1504))) #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6762 thiss!1504) #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!250337 () Bool)

(declare-fun res!122585 () Bool)

(declare-fun e!162356 () Bool)

(assert (=> b!250337 (=> (not res!122585) (not e!162356))))

(assert (=> b!250337 (= res!122585 (not (validKeyInArray!0 (select (arr!5824 (_keys!6762 thiss!1504)) index!297))))))

(declare-fun b!250338 () Bool)

(declare-fun res!122587 () Bool)

(assert (=> b!250338 (=> (not res!122587) (not e!162356))))

(assert (=> b!250338 (= res!122587 (validKeyInArray!0 key!932))))

(declare-fun d!60785 () Bool)

(assert (=> d!60785 e!162357))

(declare-fun res!122588 () Bool)

(assert (=> d!60785 (=> (not res!122588) (not e!162357))))

(assert (=> d!60785 (= res!122588 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6170 (_keys!6762 thiss!1504)))))))

(declare-fun lt!125297 () Unit!7723)

(declare-fun choose!1 (array!12285 (_ BitVec 32) (_ BitVec 64)) Unit!7723)

(assert (=> d!60785 (= lt!125297 (choose!1 (_keys!6762 thiss!1504) index!297 key!932))))

(assert (=> d!60785 e!162356))

(declare-fun res!122586 () Bool)

(assert (=> d!60785 (=> (not res!122586) (not e!162356))))

(assert (=> d!60785 (= res!122586 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6170 (_keys!6762 thiss!1504)))))))

(assert (=> d!60785 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6762 thiss!1504) index!297 key!932) lt!125297)))

(declare-fun b!250339 () Bool)

(assert (=> b!250339 (= e!162356 (bvslt (size!6170 (_keys!6762 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!60785 res!122586) b!250337))

(assert (= (and b!250337 res!122585) b!250338))

(assert (= (and b!250338 res!122587) b!250339))

(assert (= (and d!60785 res!122588) b!250340))

(assert (=> b!250340 m!266179))

(declare-fun m!266313 () Bool)

(assert (=> b!250340 m!266313))

(assert (=> b!250340 m!266181))

(declare-fun m!266315 () Bool)

(assert (=> b!250337 m!266315))

(assert (=> b!250337 m!266315))

(declare-fun m!266317 () Bool)

(assert (=> b!250337 m!266317))

(declare-fun m!266319 () Bool)

(assert (=> b!250338 m!266319))

(declare-fun m!266321 () Bool)

(assert (=> d!60785 m!266321))

(assert (=> b!250178 d!60785))

(declare-fun b!250349 () Bool)

(declare-fun e!162363 () (_ BitVec 32))

(declare-fun e!162362 () (_ BitVec 32))

(assert (=> b!250349 (= e!162363 e!162362)))

(declare-fun c!42063 () Bool)

(assert (=> b!250349 (= c!42063 (validKeyInArray!0 (select (arr!5824 lt!125227) #b00000000000000000000000000000000)))))

(declare-fun b!250350 () Bool)

(assert (=> b!250350 (= e!162363 #b00000000000000000000000000000000)))

(declare-fun bm!23510 () Bool)

(declare-fun call!23513 () (_ BitVec 32))

(assert (=> bm!23510 (= call!23513 (arrayCountValidKeys!0 lt!125227 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6170 (_keys!6762 thiss!1504))))))

(declare-fun b!250351 () Bool)

(assert (=> b!250351 (= e!162362 call!23513)))

(declare-fun b!250352 () Bool)

(assert (=> b!250352 (= e!162362 (bvadd #b00000000000000000000000000000001 call!23513))))

(declare-fun d!60787 () Bool)

(declare-fun lt!125300 () (_ BitVec 32))

(assert (=> d!60787 (and (bvsge lt!125300 #b00000000000000000000000000000000) (bvsle lt!125300 (bvsub (size!6170 lt!125227) #b00000000000000000000000000000000)))))

(assert (=> d!60787 (= lt!125300 e!162363)))

(declare-fun c!42064 () Bool)

(assert (=> d!60787 (= c!42064 (bvsge #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))))))

(assert (=> d!60787 (and (bvsle #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6170 (_keys!6762 thiss!1504)) (size!6170 lt!125227)))))

(assert (=> d!60787 (= (arrayCountValidKeys!0 lt!125227 #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))) lt!125300)))

(assert (= (and d!60787 c!42064) b!250350))

(assert (= (and d!60787 (not c!42064)) b!250349))

(assert (= (and b!250349 c!42063) b!250352))

(assert (= (and b!250349 (not c!42063)) b!250351))

(assert (= (or b!250352 b!250351) bm!23510))

(assert (=> b!250349 m!266305))

(assert (=> b!250349 m!266305))

(assert (=> b!250349 m!266309))

(declare-fun m!266323 () Bool)

(assert (=> bm!23510 m!266323))

(assert (=> b!250178 d!60787))

(declare-fun b!250362 () Bool)

(declare-fun e!162370 () Bool)

(declare-fun call!23516 () Bool)

(assert (=> b!250362 (= e!162370 call!23516)))

(declare-fun b!250363 () Bool)

(declare-fun e!162371 () Bool)

(assert (=> b!250363 (= e!162370 e!162371)))

(declare-fun lt!125307 () (_ BitVec 64))

(assert (=> b!250363 (= lt!125307 (select (arr!5824 lt!125227) #b00000000000000000000000000000000))))

(declare-fun lt!125309 () Unit!7723)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12285 (_ BitVec 64) (_ BitVec 32)) Unit!7723)

(assert (=> b!250363 (= lt!125309 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125227 lt!125307 #b00000000000000000000000000000000))))

(assert (=> b!250363 (arrayContainsKey!0 lt!125227 lt!125307 #b00000000000000000000000000000000)))

(declare-fun lt!125308 () Unit!7723)

(assert (=> b!250363 (= lt!125308 lt!125309)))

(declare-fun res!122594 () Bool)

(assert (=> b!250363 (= res!122594 (= (seekEntryOrOpen!0 (select (arr!5824 lt!125227) #b00000000000000000000000000000000) lt!125227 (mask!10809 thiss!1504)) (Found!1119 #b00000000000000000000000000000000)))))

(assert (=> b!250363 (=> (not res!122594) (not e!162371))))

(declare-fun b!250364 () Bool)

(declare-fun e!162372 () Bool)

(assert (=> b!250364 (= e!162372 e!162370)))

(declare-fun c!42067 () Bool)

(assert (=> b!250364 (= c!42067 (validKeyInArray!0 (select (arr!5824 lt!125227) #b00000000000000000000000000000000)))))

(declare-fun bm!23513 () Bool)

(assert (=> bm!23513 (= call!23516 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125227 (mask!10809 thiss!1504)))))

(declare-fun d!60789 () Bool)

(declare-fun res!122593 () Bool)

(assert (=> d!60789 (=> res!122593 e!162372)))

(assert (=> d!60789 (= res!122593 (bvsge #b00000000000000000000000000000000 (size!6170 lt!125227)))))

(assert (=> d!60789 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125227 (mask!10809 thiss!1504)) e!162372)))

(declare-fun b!250361 () Bool)

(assert (=> b!250361 (= e!162371 call!23516)))

(assert (= (and d!60789 (not res!122593)) b!250364))

(assert (= (and b!250364 c!42067) b!250363))

(assert (= (and b!250364 (not c!42067)) b!250362))

(assert (= (and b!250363 res!122594) b!250361))

(assert (= (or b!250361 b!250362) bm!23513))

(assert (=> b!250363 m!266305))

(declare-fun m!266325 () Bool)

(assert (=> b!250363 m!266325))

(declare-fun m!266327 () Bool)

(assert (=> b!250363 m!266327))

(assert (=> b!250363 m!266305))

(declare-fun m!266329 () Bool)

(assert (=> b!250363 m!266329))

(assert (=> b!250364 m!266305))

(assert (=> b!250364 m!266305))

(assert (=> b!250364 m!266309))

(declare-fun m!266331 () Bool)

(assert (=> bm!23513 m!266331))

(assert (=> b!250178 d!60789))

(declare-fun b!250365 () Bool)

(declare-fun e!162374 () (_ BitVec 32))

(declare-fun e!162373 () (_ BitVec 32))

(assert (=> b!250365 (= e!162374 e!162373)))

(declare-fun c!42068 () Bool)

(assert (=> b!250365 (= c!42068 (validKeyInArray!0 (select (arr!5824 (_keys!6762 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250366 () Bool)

(assert (=> b!250366 (= e!162374 #b00000000000000000000000000000000)))

(declare-fun bm!23514 () Bool)

(declare-fun call!23517 () (_ BitVec 32))

(assert (=> bm!23514 (= call!23517 (arrayCountValidKeys!0 (_keys!6762 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6170 (_keys!6762 thiss!1504))))))

(declare-fun b!250367 () Bool)

(assert (=> b!250367 (= e!162373 call!23517)))

(declare-fun b!250368 () Bool)

(assert (=> b!250368 (= e!162373 (bvadd #b00000000000000000000000000000001 call!23517))))

(declare-fun d!60791 () Bool)

(declare-fun lt!125310 () (_ BitVec 32))

(assert (=> d!60791 (and (bvsge lt!125310 #b00000000000000000000000000000000) (bvsle lt!125310 (bvsub (size!6170 (_keys!6762 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60791 (= lt!125310 e!162374)))

(declare-fun c!42069 () Bool)

(assert (=> d!60791 (= c!42069 (bvsge #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))))))

(assert (=> d!60791 (and (bvsle #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6170 (_keys!6762 thiss!1504)) (size!6170 (_keys!6762 thiss!1504))))))

(assert (=> d!60791 (= (arrayCountValidKeys!0 (_keys!6762 thiss!1504) #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))) lt!125310)))

(assert (= (and d!60791 c!42069) b!250366))

(assert (= (and d!60791 (not c!42069)) b!250365))

(assert (= (and b!250365 c!42068) b!250368))

(assert (= (and b!250365 (not c!42068)) b!250367))

(assert (= (or b!250368 b!250367) bm!23514))

(declare-fun m!266333 () Bool)

(assert (=> b!250365 m!266333))

(assert (=> b!250365 m!266333))

(declare-fun m!266335 () Bool)

(assert (=> b!250365 m!266335))

(declare-fun m!266337 () Bool)

(assert (=> bm!23514 m!266337))

(assert (=> b!250178 d!60791))

(declare-fun d!60793 () Bool)

(assert (=> d!60793 (= (validMask!0 (mask!10809 thiss!1504)) (and (or (= (mask!10809 thiss!1504) #b00000000000000000000000000000111) (= (mask!10809 thiss!1504) #b00000000000000000000000000001111) (= (mask!10809 thiss!1504) #b00000000000000000000000000011111) (= (mask!10809 thiss!1504) #b00000000000000000000000000111111) (= (mask!10809 thiss!1504) #b00000000000000000000000001111111) (= (mask!10809 thiss!1504) #b00000000000000000000000011111111) (= (mask!10809 thiss!1504) #b00000000000000000000000111111111) (= (mask!10809 thiss!1504) #b00000000000000000000001111111111) (= (mask!10809 thiss!1504) #b00000000000000000000011111111111) (= (mask!10809 thiss!1504) #b00000000000000000000111111111111) (= (mask!10809 thiss!1504) #b00000000000000000001111111111111) (= (mask!10809 thiss!1504) #b00000000000000000011111111111111) (= (mask!10809 thiss!1504) #b00000000000000000111111111111111) (= (mask!10809 thiss!1504) #b00000000000000001111111111111111) (= (mask!10809 thiss!1504) #b00000000000000011111111111111111) (= (mask!10809 thiss!1504) #b00000000000000111111111111111111) (= (mask!10809 thiss!1504) #b00000000000001111111111111111111) (= (mask!10809 thiss!1504) #b00000000000011111111111111111111) (= (mask!10809 thiss!1504) #b00000000000111111111111111111111) (= (mask!10809 thiss!1504) #b00000000001111111111111111111111) (= (mask!10809 thiss!1504) #b00000000011111111111111111111111) (= (mask!10809 thiss!1504) #b00000000111111111111111111111111) (= (mask!10809 thiss!1504) #b00000001111111111111111111111111) (= (mask!10809 thiss!1504) #b00000011111111111111111111111111) (= (mask!10809 thiss!1504) #b00000111111111111111111111111111) (= (mask!10809 thiss!1504) #b00001111111111111111111111111111) (= (mask!10809 thiss!1504) #b00011111111111111111111111111111) (= (mask!10809 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10809 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!250178 d!60793))

(declare-fun d!60795 () Bool)

(declare-fun e!162377 () Bool)

(assert (=> d!60795 e!162377))

(declare-fun res!122597 () Bool)

(assert (=> d!60795 (=> (not res!122597) (not e!162377))))

(assert (=> d!60795 (= res!122597 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6170 (_keys!6762 thiss!1504)))))))

(declare-fun lt!125313 () Unit!7723)

(declare-fun choose!41 (array!12285 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3704) Unit!7723)

(assert (=> d!60795 (= lt!125313 (choose!41 (_keys!6762 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3701))))

(assert (=> d!60795 (bvslt (size!6170 (_keys!6762 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60795 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6762 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3701) lt!125313)))

(declare-fun b!250371 () Bool)

(assert (=> b!250371 (= e!162377 (arrayNoDuplicates!0 (array!12286 (store (arr!5824 (_keys!6762 thiss!1504)) index!297 key!932) (size!6170 (_keys!6762 thiss!1504))) #b00000000000000000000000000000000 Nil!3701))))

(assert (= (and d!60795 res!122597) b!250371))

(declare-fun m!266339 () Bool)

(assert (=> d!60795 m!266339))

(assert (=> b!250371 m!266179))

(declare-fun m!266341 () Bool)

(assert (=> b!250371 m!266341))

(assert (=> b!250178 d!60795))

(declare-fun d!60797 () Bool)

(declare-fun res!122602 () Bool)

(declare-fun e!162382 () Bool)

(assert (=> d!60797 (=> res!122602 e!162382)))

(assert (=> d!60797 (= res!122602 (= (select (arr!5824 (_keys!6762 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60797 (= (arrayContainsKey!0 (_keys!6762 thiss!1504) key!932 #b00000000000000000000000000000000) e!162382)))

(declare-fun b!250376 () Bool)

(declare-fun e!162383 () Bool)

(assert (=> b!250376 (= e!162382 e!162383)))

(declare-fun res!122603 () Bool)

(assert (=> b!250376 (=> (not res!122603) (not e!162383))))

(assert (=> b!250376 (= res!122603 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6170 (_keys!6762 thiss!1504))))))

(declare-fun b!250377 () Bool)

(assert (=> b!250377 (= e!162383 (arrayContainsKey!0 (_keys!6762 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60797 (not res!122602)) b!250376))

(assert (= (and b!250376 res!122603) b!250377))

(assert (=> d!60797 m!266333))

(declare-fun m!266343 () Bool)

(assert (=> b!250377 m!266343))

(assert (=> b!250178 d!60797))

(declare-fun d!60799 () Bool)

(declare-fun e!162386 () Bool)

(assert (=> d!60799 e!162386))

(declare-fun res!122606 () Bool)

(assert (=> d!60799 (=> (not res!122606) (not e!162386))))

(assert (=> d!60799 (= res!122606 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6170 (_keys!6762 thiss!1504)))))))

(declare-fun lt!125316 () Unit!7723)

(declare-fun choose!102 ((_ BitVec 64) array!12285 (_ BitVec 32) (_ BitVec 32)) Unit!7723)

(assert (=> d!60799 (= lt!125316 (choose!102 key!932 (_keys!6762 thiss!1504) index!297 (mask!10809 thiss!1504)))))

(assert (=> d!60799 (validMask!0 (mask!10809 thiss!1504))))

(assert (=> d!60799 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6762 thiss!1504) index!297 (mask!10809 thiss!1504)) lt!125316)))

(declare-fun b!250380 () Bool)

(assert (=> b!250380 (= e!162386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12286 (store (arr!5824 (_keys!6762 thiss!1504)) index!297 key!932) (size!6170 (_keys!6762 thiss!1504))) (mask!10809 thiss!1504)))))

(assert (= (and d!60799 res!122606) b!250380))

(declare-fun m!266345 () Bool)

(assert (=> d!60799 m!266345))

(assert (=> d!60799 m!266173))

(assert (=> b!250380 m!266179))

(declare-fun m!266347 () Bool)

(assert (=> b!250380 m!266347))

(assert (=> b!250178 d!60799))

(declare-fun d!60801 () Bool)

(assert (=> d!60801 (contains!1795 (getCurrentListMap!1378 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)) key!932)))

(declare-fun lt!125319 () Unit!7723)

(declare-fun choose!1192 (array!12285 array!12283 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) (_ BitVec 32) Int) Unit!7723)

(assert (=> d!60801 (= lt!125319 (choose!1192 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(assert (=> d!60801 (validMask!0 (mask!10809 thiss!1504))))

(assert (=> d!60801 (= (lemmaArrayContainsKeyThenInListMap!206 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)) lt!125319)))

(declare-fun bs!8958 () Bool)

(assert (= bs!8958 d!60801))

(assert (=> bs!8958 m!266193))

(assert (=> bs!8958 m!266193))

(assert (=> bs!8958 m!266195))

(declare-fun m!266349 () Bool)

(assert (=> bs!8958 m!266349))

(assert (=> bs!8958 m!266173))

(assert (=> b!250186 d!60801))

(declare-fun bm!23519 () Bool)

(declare-fun call!23523 () Bool)

(assert (=> bm!23519 (= call!23523 (arrayContainsKey!0 (_keys!6762 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250398 () Bool)

(declare-fun e!162397 () Bool)

(declare-fun e!162395 () Bool)

(assert (=> b!250398 (= e!162397 e!162395)))

(declare-fun c!42075 () Bool)

(declare-fun lt!125325 () SeekEntryResult!1119)

(assert (=> b!250398 (= c!42075 ((_ is MissingVacant!1119) lt!125325))))

(declare-fun b!250399 () Bool)

(assert (=> b!250399 (= e!162395 ((_ is Undefined!1119) lt!125325))))

(declare-fun b!250400 () Bool)

(declare-fun e!162398 () Bool)

(assert (=> b!250400 (= e!162398 (not call!23523))))

(declare-fun d!60803 () Bool)

(assert (=> d!60803 e!162397))

(declare-fun c!42074 () Bool)

(assert (=> d!60803 (= c!42074 ((_ is MissingZero!1119) lt!125325))))

(assert (=> d!60803 (= lt!125325 (seekEntryOrOpen!0 key!932 (_keys!6762 thiss!1504) (mask!10809 thiss!1504)))))

(declare-fun lt!125324 () Unit!7723)

(declare-fun choose!1193 (array!12285 array!12283 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) Int) Unit!7723)

(assert (=> d!60803 (= lt!125324 (choose!1193 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)))))

(assert (=> d!60803 (validMask!0 (mask!10809 thiss!1504))))

(assert (=> d!60803 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!396 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)) lt!125324)))

(declare-fun b!250397 () Bool)

(declare-fun e!162396 () Bool)

(assert (=> b!250397 (= e!162396 (not call!23523))))

(declare-fun b!250401 () Bool)

(declare-fun res!122617 () Bool)

(assert (=> b!250401 (=> (not res!122617) (not e!162396))))

(assert (=> b!250401 (= res!122617 (= (select (arr!5824 (_keys!6762 thiss!1504)) (index!6649 lt!125325)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250401 (and (bvsge (index!6649 lt!125325) #b00000000000000000000000000000000) (bvslt (index!6649 lt!125325) (size!6170 (_keys!6762 thiss!1504))))))

(declare-fun b!250402 () Bool)

(declare-fun res!122618 () Bool)

(assert (=> b!250402 (=> (not res!122618) (not e!162396))))

(declare-fun call!23522 () Bool)

(assert (=> b!250402 (= res!122618 call!23522)))

(assert (=> b!250402 (= e!162395 e!162396)))

(declare-fun bm!23520 () Bool)

(assert (=> bm!23520 (= call!23522 (inRange!0 (ite c!42074 (index!6646 lt!125325) (index!6649 lt!125325)) (mask!10809 thiss!1504)))))

(declare-fun b!250403 () Bool)

(assert (=> b!250403 (= e!162397 e!162398)))

(declare-fun res!122615 () Bool)

(assert (=> b!250403 (= res!122615 call!23522)))

(assert (=> b!250403 (=> (not res!122615) (not e!162398))))

(declare-fun b!250404 () Bool)

(assert (=> b!250404 (and (bvsge (index!6646 lt!125325) #b00000000000000000000000000000000) (bvslt (index!6646 lt!125325) (size!6170 (_keys!6762 thiss!1504))))))

(declare-fun res!122616 () Bool)

(assert (=> b!250404 (= res!122616 (= (select (arr!5824 (_keys!6762 thiss!1504)) (index!6646 lt!125325)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250404 (=> (not res!122616) (not e!162398))))

(assert (= (and d!60803 c!42074) b!250403))

(assert (= (and d!60803 (not c!42074)) b!250398))

(assert (= (and b!250403 res!122615) b!250404))

(assert (= (and b!250404 res!122616) b!250400))

(assert (= (and b!250398 c!42075) b!250402))

(assert (= (and b!250398 (not c!42075)) b!250399))

(assert (= (and b!250402 res!122618) b!250401))

(assert (= (and b!250401 res!122617) b!250397))

(assert (= (or b!250403 b!250402) bm!23520))

(assert (= (or b!250400 b!250397) bm!23519))

(assert (=> bm!23519 m!266163))

(assert (=> d!60803 m!266197))

(declare-fun m!266351 () Bool)

(assert (=> d!60803 m!266351))

(assert (=> d!60803 m!266173))

(declare-fun m!266353 () Bool)

(assert (=> b!250404 m!266353))

(declare-fun m!266355 () Bool)

(assert (=> b!250401 m!266355))

(declare-fun m!266357 () Bool)

(assert (=> bm!23520 m!266357))

(assert (=> b!250169 d!60803))

(assert (=> bm!23491 d!60797))

(declare-fun d!60805 () Bool)

(declare-fun e!162401 () Bool)

(assert (=> d!60805 e!162401))

(declare-fun res!122624 () Bool)

(assert (=> d!60805 (=> (not res!122624) (not e!162401))))

(declare-fun lt!125331 () SeekEntryResult!1119)

(assert (=> d!60805 (= res!122624 ((_ is Found!1119) lt!125331))))

(assert (=> d!60805 (= lt!125331 (seekEntryOrOpen!0 key!932 (_keys!6762 thiss!1504) (mask!10809 thiss!1504)))))

(declare-fun lt!125330 () Unit!7723)

(declare-fun choose!1194 (array!12285 array!12283 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) Int) Unit!7723)

(assert (=> d!60805 (= lt!125330 (choose!1194 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)))))

(assert (=> d!60805 (validMask!0 (mask!10809 thiss!1504))))

(assert (=> d!60805 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!398 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)) lt!125330)))

(declare-fun b!250409 () Bool)

(declare-fun res!122623 () Bool)

(assert (=> b!250409 (=> (not res!122623) (not e!162401))))

(assert (=> b!250409 (= res!122623 (inRange!0 (index!6647 lt!125331) (mask!10809 thiss!1504)))))

(declare-fun b!250410 () Bool)

(assert (=> b!250410 (= e!162401 (= (select (arr!5824 (_keys!6762 thiss!1504)) (index!6647 lt!125331)) key!932))))

(assert (=> b!250410 (and (bvsge (index!6647 lt!125331) #b00000000000000000000000000000000) (bvslt (index!6647 lt!125331) (size!6170 (_keys!6762 thiss!1504))))))

(assert (= (and d!60805 res!122624) b!250409))

(assert (= (and b!250409 res!122623) b!250410))

(assert (=> d!60805 m!266197))

(declare-fun m!266359 () Bool)

(assert (=> d!60805 m!266359))

(assert (=> d!60805 m!266173))

(declare-fun m!266361 () Bool)

(assert (=> b!250409 m!266361))

(declare-fun m!266363 () Bool)

(assert (=> b!250410 m!266363))

(assert (=> b!250183 d!60805))

(declare-fun d!60807 () Bool)

(assert (=> d!60807 (= (inRange!0 (ite c!42030 (index!6646 lt!125225) (index!6649 lt!125225)) (mask!10809 thiss!1504)) (and (bvsge (ite c!42030 (index!6646 lt!125225) (index!6649 lt!125225)) #b00000000000000000000000000000000) (bvslt (ite c!42030 (index!6646 lt!125225) (index!6649 lt!125225)) (bvadd (mask!10809 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23492 d!60807))

(declare-fun d!60809 () Bool)

(assert (=> d!60809 (= (inRange!0 index!297 (mask!10809 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10809 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!250167 d!60809))

(declare-fun d!60811 () Bool)

(declare-fun e!162407 () Bool)

(assert (=> d!60811 e!162407))

(declare-fun res!122627 () Bool)

(assert (=> d!60811 (=> res!122627 e!162407)))

(declare-fun lt!125341 () Bool)

(assert (=> d!60811 (= res!122627 (not lt!125341))))

(declare-fun lt!125343 () Bool)

(assert (=> d!60811 (= lt!125341 lt!125343)))

(declare-fun lt!125342 () Unit!7723)

(declare-fun e!162406 () Unit!7723)

(assert (=> d!60811 (= lt!125342 e!162406)))

(declare-fun c!42078 () Bool)

(assert (=> d!60811 (= c!42078 lt!125343)))

(declare-fun containsKey!288 (List!3703 (_ BitVec 64)) Bool)

(assert (=> d!60811 (= lt!125343 (containsKey!288 (toList!1869 (getCurrentListMap!1378 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504))) key!932))))

(assert (=> d!60811 (= (contains!1795 (getCurrentListMap!1378 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)) key!932) lt!125341)))

(declare-fun b!250417 () Bool)

(declare-fun lt!125340 () Unit!7723)

(assert (=> b!250417 (= e!162406 lt!125340)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!237 (List!3703 (_ BitVec 64)) Unit!7723)

(assert (=> b!250417 (= lt!125340 (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1869 (getCurrentListMap!1378 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504))) key!932))))

(declare-datatypes ((Option!302 0))(
  ( (Some!301 (v!5350 V!8297)) (None!300) )
))
(declare-fun isDefined!238 (Option!302) Bool)

(declare-fun getValueByKey!296 (List!3703 (_ BitVec 64)) Option!302)

(assert (=> b!250417 (isDefined!238 (getValueByKey!296 (toList!1869 (getCurrentListMap!1378 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504))) key!932))))

(declare-fun b!250418 () Bool)

(declare-fun Unit!7733 () Unit!7723)

(assert (=> b!250418 (= e!162406 Unit!7733)))

(declare-fun b!250419 () Bool)

(assert (=> b!250419 (= e!162407 (isDefined!238 (getValueByKey!296 (toList!1869 (getCurrentListMap!1378 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504))) key!932)))))

(assert (= (and d!60811 c!42078) b!250417))

(assert (= (and d!60811 (not c!42078)) b!250418))

(assert (= (and d!60811 (not res!122627)) b!250419))

(declare-fun m!266365 () Bool)

(assert (=> d!60811 m!266365))

(declare-fun m!266367 () Bool)

(assert (=> b!250417 m!266367))

(declare-fun m!266369 () Bool)

(assert (=> b!250417 m!266369))

(assert (=> b!250417 m!266369))

(declare-fun m!266371 () Bool)

(assert (=> b!250417 m!266371))

(assert (=> b!250419 m!266369))

(assert (=> b!250419 m!266369))

(assert (=> b!250419 m!266371))

(assert (=> b!250167 d!60811))

(declare-fun b!250462 () Bool)

(declare-fun e!162439 () Bool)

(declare-fun lt!125394 () ListLongMap!3707)

(declare-fun apply!240 (ListLongMap!3707 (_ BitVec 64)) V!8297)

(assert (=> b!250462 (= e!162439 (= (apply!240 lt!125394 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4468 thiss!1504)))))

(declare-fun bm!23535 () Bool)

(declare-fun call!23544 () ListLongMap!3707)

(declare-fun getCurrentListMapNoExtraKeys!556 (array!12285 array!12283 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 32) Int) ListLongMap!3707)

(assert (=> bm!23535 (= call!23544 (getCurrentListMapNoExtraKeys!556 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(declare-fun b!250464 () Bool)

(declare-fun e!162443 () Unit!7723)

(declare-fun lt!125404 () Unit!7723)

(assert (=> b!250464 (= e!162443 lt!125404)))

(declare-fun lt!125396 () ListLongMap!3707)

(assert (=> b!250464 (= lt!125396 (getCurrentListMapNoExtraKeys!556 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(declare-fun lt!125392 () (_ BitVec 64))

(assert (=> b!250464 (= lt!125392 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125390 () (_ BitVec 64))

(assert (=> b!250464 (= lt!125390 (select (arr!5824 (_keys!6762 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125409 () Unit!7723)

(declare-fun addStillContains!216 (ListLongMap!3707 (_ BitVec 64) V!8297 (_ BitVec 64)) Unit!7723)

(assert (=> b!250464 (= lt!125409 (addStillContains!216 lt!125396 lt!125392 (zeroValue!4468 thiss!1504) lt!125390))))

(declare-fun +!673 (ListLongMap!3707 tuple2!4804) ListLongMap!3707)

(assert (=> b!250464 (contains!1795 (+!673 lt!125396 (tuple2!4805 lt!125392 (zeroValue!4468 thiss!1504))) lt!125390)))

(declare-fun lt!125397 () Unit!7723)

(assert (=> b!250464 (= lt!125397 lt!125409)))

(declare-fun lt!125395 () ListLongMap!3707)

(assert (=> b!250464 (= lt!125395 (getCurrentListMapNoExtraKeys!556 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(declare-fun lt!125391 () (_ BitVec 64))

(assert (=> b!250464 (= lt!125391 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125408 () (_ BitVec 64))

(assert (=> b!250464 (= lt!125408 (select (arr!5824 (_keys!6762 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125402 () Unit!7723)

(declare-fun addApplyDifferent!216 (ListLongMap!3707 (_ BitVec 64) V!8297 (_ BitVec 64)) Unit!7723)

(assert (=> b!250464 (= lt!125402 (addApplyDifferent!216 lt!125395 lt!125391 (minValue!4468 thiss!1504) lt!125408))))

(assert (=> b!250464 (= (apply!240 (+!673 lt!125395 (tuple2!4805 lt!125391 (minValue!4468 thiss!1504))) lt!125408) (apply!240 lt!125395 lt!125408))))

(declare-fun lt!125399 () Unit!7723)

(assert (=> b!250464 (= lt!125399 lt!125402)))

(declare-fun lt!125401 () ListLongMap!3707)

(assert (=> b!250464 (= lt!125401 (getCurrentListMapNoExtraKeys!556 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(declare-fun lt!125389 () (_ BitVec 64))

(assert (=> b!250464 (= lt!125389 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125403 () (_ BitVec 64))

(assert (=> b!250464 (= lt!125403 (select (arr!5824 (_keys!6762 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125398 () Unit!7723)

(assert (=> b!250464 (= lt!125398 (addApplyDifferent!216 lt!125401 lt!125389 (zeroValue!4468 thiss!1504) lt!125403))))

(assert (=> b!250464 (= (apply!240 (+!673 lt!125401 (tuple2!4805 lt!125389 (zeroValue!4468 thiss!1504))) lt!125403) (apply!240 lt!125401 lt!125403))))

(declare-fun lt!125407 () Unit!7723)

(assert (=> b!250464 (= lt!125407 lt!125398)))

(declare-fun lt!125405 () ListLongMap!3707)

(assert (=> b!250464 (= lt!125405 (getCurrentListMapNoExtraKeys!556 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(declare-fun lt!125400 () (_ BitVec 64))

(assert (=> b!250464 (= lt!125400 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125406 () (_ BitVec 64))

(assert (=> b!250464 (= lt!125406 (select (arr!5824 (_keys!6762 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250464 (= lt!125404 (addApplyDifferent!216 lt!125405 lt!125400 (minValue!4468 thiss!1504) lt!125406))))

(assert (=> b!250464 (= (apply!240 (+!673 lt!125405 (tuple2!4805 lt!125400 (minValue!4468 thiss!1504))) lt!125406) (apply!240 lt!125405 lt!125406))))

(declare-fun b!250465 () Bool)

(declare-fun e!162441 () Bool)

(declare-fun e!162445 () Bool)

(assert (=> b!250465 (= e!162441 e!162445)))

(declare-fun res!122646 () Bool)

(assert (=> b!250465 (=> (not res!122646) (not e!162445))))

(assert (=> b!250465 (= res!122646 (contains!1795 lt!125394 (select (arr!5824 (_keys!6762 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250465 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))))))

(declare-fun b!250466 () Bool)

(declare-fun e!162440 () Bool)

(declare-fun call!23542 () Bool)

(assert (=> b!250466 (= e!162440 (not call!23542))))

(declare-fun call!23543 () ListLongMap!3707)

(declare-fun c!42094 () Bool)

(declare-fun call!23541 () ListLongMap!3707)

(declare-fun c!42096 () Bool)

(declare-fun bm!23536 () Bool)

(declare-fun call!23539 () ListLongMap!3707)

(assert (=> bm!23536 (= call!23539 (+!673 (ite c!42094 call!23544 (ite c!42096 call!23543 call!23541)) (ite (or c!42094 c!42096) (tuple2!4805 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4468 thiss!1504)) (tuple2!4805 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4468 thiss!1504)))))))

(declare-fun bm!23537 () Bool)

(declare-fun call!23538 () ListLongMap!3707)

(assert (=> bm!23537 (= call!23538 call!23539)))

(declare-fun b!250467 () Bool)

(declare-fun e!162434 () ListLongMap!3707)

(assert (=> b!250467 (= e!162434 (+!673 call!23539 (tuple2!4805 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4468 thiss!1504))))))

(declare-fun b!250468 () Bool)

(declare-fun get!2991 (ValueCell!2900 V!8297) V!8297)

(declare-fun dynLambda!574 (Int (_ BitVec 64)) V!8297)

(assert (=> b!250468 (= e!162445 (= (apply!240 lt!125394 (select (arr!5824 (_keys!6762 thiss!1504)) #b00000000000000000000000000000000)) (get!2991 (select (arr!5823 (_values!4610 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4627 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6169 (_values!4610 thiss!1504))))))

(assert (=> b!250468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))))))

(declare-fun bm!23538 () Bool)

(assert (=> bm!23538 (= call!23541 call!23543)))

(declare-fun b!250469 () Bool)

(declare-fun e!162438 () ListLongMap!3707)

(assert (=> b!250469 (= e!162438 call!23541)))

(declare-fun b!250470 () Bool)

(declare-fun e!162436 () Bool)

(declare-fun call!23540 () Bool)

(assert (=> b!250470 (= e!162436 (not call!23540))))

(declare-fun b!250471 () Bool)

(declare-fun e!162442 () Bool)

(assert (=> b!250471 (= e!162442 (validKeyInArray!0 (select (arr!5824 (_keys!6762 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250472 () Bool)

(declare-fun Unit!7734 () Unit!7723)

(assert (=> b!250472 (= e!162443 Unit!7734)))

(declare-fun b!250473 () Bool)

(declare-fun c!42095 () Bool)

(assert (=> b!250473 (= c!42095 (and (not (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!162435 () ListLongMap!3707)

(assert (=> b!250473 (= e!162435 e!162438)))

(declare-fun b!250474 () Bool)

(declare-fun e!162437 () Bool)

(assert (=> b!250474 (= e!162437 (= (apply!240 lt!125394 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4468 thiss!1504)))))

(declare-fun b!250475 () Bool)

(declare-fun e!162444 () Bool)

(assert (=> b!250475 (= e!162444 (validKeyInArray!0 (select (arr!5824 (_keys!6762 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23539 () Bool)

(assert (=> bm!23539 (= call!23543 call!23544)))

(declare-fun b!250476 () Bool)

(assert (=> b!250476 (= e!162436 e!162437)))

(declare-fun res!122647 () Bool)

(assert (=> b!250476 (= res!122647 call!23540)))

(assert (=> b!250476 (=> (not res!122647) (not e!162437))))

(declare-fun b!250477 () Bool)

(declare-fun res!122648 () Bool)

(declare-fun e!162446 () Bool)

(assert (=> b!250477 (=> (not res!122648) (not e!162446))))

(assert (=> b!250477 (= res!122648 e!162441)))

(declare-fun res!122653 () Bool)

(assert (=> b!250477 (=> res!122653 e!162441)))

(assert (=> b!250477 (= res!122653 (not e!162444))))

(declare-fun res!122652 () Bool)

(assert (=> b!250477 (=> (not res!122652) (not e!162444))))

(assert (=> b!250477 (= res!122652 (bvslt #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))))))

(declare-fun b!250478 () Bool)

(assert (=> b!250478 (= e!162440 e!162439)))

(declare-fun res!122650 () Bool)

(assert (=> b!250478 (= res!122650 call!23542)))

(assert (=> b!250478 (=> (not res!122650) (not e!162439))))

(declare-fun b!250463 () Bool)

(assert (=> b!250463 (= e!162435 call!23538)))

(declare-fun d!60813 () Bool)

(assert (=> d!60813 e!162446))

(declare-fun res!122651 () Bool)

(assert (=> d!60813 (=> (not res!122651) (not e!162446))))

(assert (=> d!60813 (= res!122651 (or (bvsge #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))))))))

(declare-fun lt!125393 () ListLongMap!3707)

(assert (=> d!60813 (= lt!125394 lt!125393)))

(declare-fun lt!125388 () Unit!7723)

(assert (=> d!60813 (= lt!125388 e!162443)))

(declare-fun c!42091 () Bool)

(assert (=> d!60813 (= c!42091 e!162442)))

(declare-fun res!122654 () Bool)

(assert (=> d!60813 (=> (not res!122654) (not e!162442))))

(assert (=> d!60813 (= res!122654 (bvslt #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))))))

(assert (=> d!60813 (= lt!125393 e!162434)))

(assert (=> d!60813 (= c!42094 (and (not (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60813 (validMask!0 (mask!10809 thiss!1504))))

(assert (=> d!60813 (= (getCurrentListMap!1378 (_keys!6762 thiss!1504) (_values!4610 thiss!1504) (mask!10809 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)) lt!125394)))

(declare-fun b!250479 () Bool)

(assert (=> b!250479 (= e!162434 e!162435)))

(assert (=> b!250479 (= c!42096 (and (not (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!250480 () Bool)

(assert (=> b!250480 (= e!162446 e!162440)))

(declare-fun c!42093 () Bool)

(assert (=> b!250480 (= c!42093 (not (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!250481 () Bool)

(assert (=> b!250481 (= e!162438 call!23538)))

(declare-fun bm!23540 () Bool)

(assert (=> bm!23540 (= call!23540 (contains!1795 lt!125394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23541 () Bool)

(assert (=> bm!23541 (= call!23542 (contains!1795 lt!125394 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250482 () Bool)

(declare-fun res!122649 () Bool)

(assert (=> b!250482 (=> (not res!122649) (not e!162446))))

(assert (=> b!250482 (= res!122649 e!162436)))

(declare-fun c!42092 () Bool)

(assert (=> b!250482 (= c!42092 (not (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!60813 c!42094) b!250467))

(assert (= (and d!60813 (not c!42094)) b!250479))

(assert (= (and b!250479 c!42096) b!250463))

(assert (= (and b!250479 (not c!42096)) b!250473))

(assert (= (and b!250473 c!42095) b!250481))

(assert (= (and b!250473 (not c!42095)) b!250469))

(assert (= (or b!250481 b!250469) bm!23538))

(assert (= (or b!250463 bm!23538) bm!23539))

(assert (= (or b!250463 b!250481) bm!23537))

(assert (= (or b!250467 bm!23539) bm!23535))

(assert (= (or b!250467 bm!23537) bm!23536))

(assert (= (and d!60813 res!122654) b!250471))

(assert (= (and d!60813 c!42091) b!250464))

(assert (= (and d!60813 (not c!42091)) b!250472))

(assert (= (and d!60813 res!122651) b!250477))

(assert (= (and b!250477 res!122652) b!250475))

(assert (= (and b!250477 (not res!122653)) b!250465))

(assert (= (and b!250465 res!122646) b!250468))

(assert (= (and b!250477 res!122648) b!250482))

(assert (= (and b!250482 c!42092) b!250476))

(assert (= (and b!250482 (not c!42092)) b!250470))

(assert (= (and b!250476 res!122647) b!250474))

(assert (= (or b!250476 b!250470) bm!23540))

(assert (= (and b!250482 res!122649) b!250480))

(assert (= (and b!250480 c!42093) b!250478))

(assert (= (and b!250480 (not c!42093)) b!250466))

(assert (= (and b!250478 res!122650) b!250462))

(assert (= (or b!250478 b!250466) bm!23541))

(declare-fun b_lambda!8069 () Bool)

(assert (=> (not b_lambda!8069) (not b!250468)))

(declare-fun t!8732 () Bool)

(declare-fun tb!2985 () Bool)

(assert (=> (and b!250180 (= (defaultEntry!4627 thiss!1504) (defaultEntry!4627 thiss!1504)) t!8732) tb!2985))

(declare-fun result!5293 () Bool)

(assert (=> tb!2985 (= result!5293 tp_is_empty!6487)))

(assert (=> b!250468 t!8732))

(declare-fun b_and!13625 () Bool)

(assert (= b_and!13619 (and (=> t!8732 result!5293) b_and!13625)))

(declare-fun m!266373 () Bool)

(assert (=> b!250468 m!266373))

(declare-fun m!266375 () Bool)

(assert (=> b!250468 m!266375))

(declare-fun m!266377 () Bool)

(assert (=> b!250468 m!266377))

(assert (=> b!250468 m!266375))

(assert (=> b!250468 m!266373))

(assert (=> b!250468 m!266333))

(assert (=> b!250468 m!266333))

(declare-fun m!266379 () Bool)

(assert (=> b!250468 m!266379))

(declare-fun m!266381 () Bool)

(assert (=> b!250464 m!266381))

(declare-fun m!266383 () Bool)

(assert (=> b!250464 m!266383))

(declare-fun m!266385 () Bool)

(assert (=> b!250464 m!266385))

(declare-fun m!266387 () Bool)

(assert (=> b!250464 m!266387))

(declare-fun m!266389 () Bool)

(assert (=> b!250464 m!266389))

(declare-fun m!266391 () Bool)

(assert (=> b!250464 m!266391))

(declare-fun m!266393 () Bool)

(assert (=> b!250464 m!266393))

(declare-fun m!266395 () Bool)

(assert (=> b!250464 m!266395))

(assert (=> b!250464 m!266395))

(declare-fun m!266397 () Bool)

(assert (=> b!250464 m!266397))

(declare-fun m!266399 () Bool)

(assert (=> b!250464 m!266399))

(declare-fun m!266401 () Bool)

(assert (=> b!250464 m!266401))

(declare-fun m!266403 () Bool)

(assert (=> b!250464 m!266403))

(assert (=> b!250464 m!266389))

(declare-fun m!266405 () Bool)

(assert (=> b!250464 m!266405))

(assert (=> b!250464 m!266333))

(declare-fun m!266407 () Bool)

(assert (=> b!250464 m!266407))

(assert (=> b!250464 m!266399))

(declare-fun m!266409 () Bool)

(assert (=> b!250464 m!266409))

(assert (=> b!250464 m!266381))

(declare-fun m!266411 () Bool)

(assert (=> b!250464 m!266411))

(declare-fun m!266413 () Bool)

(assert (=> b!250467 m!266413))

(declare-fun m!266415 () Bool)

(assert (=> b!250462 m!266415))

(assert (=> b!250475 m!266333))

(assert (=> b!250475 m!266333))

(assert (=> b!250475 m!266335))

(assert (=> b!250465 m!266333))

(assert (=> b!250465 m!266333))

(declare-fun m!266417 () Bool)

(assert (=> b!250465 m!266417))

(assert (=> b!250471 m!266333))

(assert (=> b!250471 m!266333))

(assert (=> b!250471 m!266335))

(declare-fun m!266419 () Bool)

(assert (=> bm!23541 m!266419))

(declare-fun m!266421 () Bool)

(assert (=> bm!23536 m!266421))

(assert (=> d!60813 m!266173))

(declare-fun m!266423 () Bool)

(assert (=> b!250474 m!266423))

(declare-fun m!266425 () Bool)

(assert (=> bm!23540 m!266425))

(assert (=> bm!23535 m!266385))

(assert (=> b!250167 d!60813))

(declare-fun d!60815 () Bool)

(declare-fun lt!125418 () SeekEntryResult!1119)

(assert (=> d!60815 (and (or ((_ is Undefined!1119) lt!125418) (not ((_ is Found!1119) lt!125418)) (and (bvsge (index!6647 lt!125418) #b00000000000000000000000000000000) (bvslt (index!6647 lt!125418) (size!6170 (_keys!6762 thiss!1504))))) (or ((_ is Undefined!1119) lt!125418) ((_ is Found!1119) lt!125418) (not ((_ is MissingZero!1119) lt!125418)) (and (bvsge (index!6646 lt!125418) #b00000000000000000000000000000000) (bvslt (index!6646 lt!125418) (size!6170 (_keys!6762 thiss!1504))))) (or ((_ is Undefined!1119) lt!125418) ((_ is Found!1119) lt!125418) ((_ is MissingZero!1119) lt!125418) (not ((_ is MissingVacant!1119) lt!125418)) (and (bvsge (index!6649 lt!125418) #b00000000000000000000000000000000) (bvslt (index!6649 lt!125418) (size!6170 (_keys!6762 thiss!1504))))) (or ((_ is Undefined!1119) lt!125418) (ite ((_ is Found!1119) lt!125418) (= (select (arr!5824 (_keys!6762 thiss!1504)) (index!6647 lt!125418)) key!932) (ite ((_ is MissingZero!1119) lt!125418) (= (select (arr!5824 (_keys!6762 thiss!1504)) (index!6646 lt!125418)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1119) lt!125418) (= (select (arr!5824 (_keys!6762 thiss!1504)) (index!6649 lt!125418)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!162455 () SeekEntryResult!1119)

(assert (=> d!60815 (= lt!125418 e!162455)))

(declare-fun c!42105 () Bool)

(declare-fun lt!125417 () SeekEntryResult!1119)

(assert (=> d!60815 (= c!42105 (and ((_ is Intermediate!1119) lt!125417) (undefined!1931 lt!125417)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12285 (_ BitVec 32)) SeekEntryResult!1119)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60815 (= lt!125417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10809 thiss!1504)) key!932 (_keys!6762 thiss!1504) (mask!10809 thiss!1504)))))

(assert (=> d!60815 (validMask!0 (mask!10809 thiss!1504))))

(assert (=> d!60815 (= (seekEntryOrOpen!0 key!932 (_keys!6762 thiss!1504) (mask!10809 thiss!1504)) lt!125418)))

(declare-fun b!250497 () Bool)

(declare-fun e!162454 () SeekEntryResult!1119)

(assert (=> b!250497 (= e!162454 (MissingZero!1119 (index!6648 lt!125417)))))

(declare-fun b!250498 () Bool)

(declare-fun e!162453 () SeekEntryResult!1119)

(assert (=> b!250498 (= e!162453 (Found!1119 (index!6648 lt!125417)))))

(declare-fun b!250499 () Bool)

(assert (=> b!250499 (= e!162455 Undefined!1119)))

(declare-fun b!250500 () Bool)

(declare-fun c!42103 () Bool)

(declare-fun lt!125416 () (_ BitVec 64))

(assert (=> b!250500 (= c!42103 (= lt!125416 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250500 (= e!162453 e!162454)))

(declare-fun b!250501 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12285 (_ BitVec 32)) SeekEntryResult!1119)

(assert (=> b!250501 (= e!162454 (seekKeyOrZeroReturnVacant!0 (x!24668 lt!125417) (index!6648 lt!125417) (index!6648 lt!125417) key!932 (_keys!6762 thiss!1504) (mask!10809 thiss!1504)))))

(declare-fun b!250502 () Bool)

(assert (=> b!250502 (= e!162455 e!162453)))

(assert (=> b!250502 (= lt!125416 (select (arr!5824 (_keys!6762 thiss!1504)) (index!6648 lt!125417)))))

(declare-fun c!42104 () Bool)

(assert (=> b!250502 (= c!42104 (= lt!125416 key!932))))

(assert (= (and d!60815 c!42105) b!250499))

(assert (= (and d!60815 (not c!42105)) b!250502))

(assert (= (and b!250502 c!42104) b!250498))

(assert (= (and b!250502 (not c!42104)) b!250500))

(assert (= (and b!250500 c!42103) b!250497))

(assert (= (and b!250500 (not c!42103)) b!250501))

(declare-fun m!266427 () Bool)

(assert (=> d!60815 m!266427))

(assert (=> d!60815 m!266173))

(declare-fun m!266429 () Bool)

(assert (=> d!60815 m!266429))

(assert (=> d!60815 m!266429))

(declare-fun m!266431 () Bool)

(assert (=> d!60815 m!266431))

(declare-fun m!266433 () Bool)

(assert (=> d!60815 m!266433))

(declare-fun m!266435 () Bool)

(assert (=> d!60815 m!266435))

(declare-fun m!266437 () Bool)

(assert (=> b!250501 m!266437))

(declare-fun m!266439 () Bool)

(assert (=> b!250502 m!266439))

(assert (=> b!250177 d!60815))

(declare-fun d!60817 () Bool)

(declare-fun res!122661 () Bool)

(declare-fun e!162458 () Bool)

(assert (=> d!60817 (=> (not res!122661) (not e!162458))))

(declare-fun simpleValid!263 (LongMapFixedSize!3700) Bool)

(assert (=> d!60817 (= res!122661 (simpleValid!263 thiss!1504))))

(assert (=> d!60817 (= (valid!1451 thiss!1504) e!162458)))

(declare-fun b!250509 () Bool)

(declare-fun res!122662 () Bool)

(assert (=> b!250509 (=> (not res!122662) (not e!162458))))

(assert (=> b!250509 (= res!122662 (= (arrayCountValidKeys!0 (_keys!6762 thiss!1504) #b00000000000000000000000000000000 (size!6170 (_keys!6762 thiss!1504))) (_size!1899 thiss!1504)))))

(declare-fun b!250510 () Bool)

(declare-fun res!122663 () Bool)

(assert (=> b!250510 (=> (not res!122663) (not e!162458))))

(assert (=> b!250510 (= res!122663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6762 thiss!1504) (mask!10809 thiss!1504)))))

(declare-fun b!250511 () Bool)

(assert (=> b!250511 (= e!162458 (arrayNoDuplicates!0 (_keys!6762 thiss!1504) #b00000000000000000000000000000000 Nil!3701))))

(assert (= (and d!60817 res!122661) b!250509))

(assert (= (and b!250509 res!122662) b!250510))

(assert (= (and b!250510 res!122663) b!250511))

(declare-fun m!266441 () Bool)

(assert (=> d!60817 m!266441))

(assert (=> b!250509 m!266181))

(declare-fun m!266443 () Bool)

(assert (=> b!250510 m!266443))

(declare-fun m!266445 () Bool)

(assert (=> b!250511 m!266445))

(assert (=> start!23882 d!60817))

(declare-fun d!60819 () Bool)

(assert (=> d!60819 (= (array_inv!3839 (_keys!6762 thiss!1504)) (bvsge (size!6170 (_keys!6762 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250180 d!60819))

(declare-fun d!60821 () Bool)

(assert (=> d!60821 (= (array_inv!3840 (_values!4610 thiss!1504)) (bvsge (size!6169 (_values!4610 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250180 d!60821))

(declare-fun mapIsEmpty!11032 () Bool)

(declare-fun mapRes!11032 () Bool)

(assert (=> mapIsEmpty!11032 mapRes!11032))

(declare-fun condMapEmpty!11032 () Bool)

(declare-fun mapDefault!11032 () ValueCell!2900)

(assert (=> mapNonEmpty!11023 (= condMapEmpty!11032 (= mapRest!11023 ((as const (Array (_ BitVec 32) ValueCell!2900)) mapDefault!11032)))))

(declare-fun e!162463 () Bool)

(assert (=> mapNonEmpty!11023 (= tp!23139 (and e!162463 mapRes!11032))))

(declare-fun b!250518 () Bool)

(declare-fun e!162464 () Bool)

(assert (=> b!250518 (= e!162464 tp_is_empty!6487)))

(declare-fun b!250519 () Bool)

(assert (=> b!250519 (= e!162463 tp_is_empty!6487)))

(declare-fun mapNonEmpty!11032 () Bool)

(declare-fun tp!23155 () Bool)

(assert (=> mapNonEmpty!11032 (= mapRes!11032 (and tp!23155 e!162464))))

(declare-fun mapKey!11032 () (_ BitVec 32))

(declare-fun mapValue!11032 () ValueCell!2900)

(declare-fun mapRest!11032 () (Array (_ BitVec 32) ValueCell!2900))

(assert (=> mapNonEmpty!11032 (= mapRest!11023 (store mapRest!11032 mapKey!11032 mapValue!11032))))

(assert (= (and mapNonEmpty!11023 condMapEmpty!11032) mapIsEmpty!11032))

(assert (= (and mapNonEmpty!11023 (not condMapEmpty!11032)) mapNonEmpty!11032))

(assert (= (and mapNonEmpty!11032 ((_ is ValueCellFull!2900) mapValue!11032)) b!250518))

(assert (= (and mapNonEmpty!11023 ((_ is ValueCellFull!2900) mapDefault!11032)) b!250519))

(declare-fun m!266447 () Bool)

(assert (=> mapNonEmpty!11032 m!266447))

(declare-fun b_lambda!8071 () Bool)

(assert (= b_lambda!8069 (or (and b!250180 b_free!6625) b_lambda!8071)))

(check-sat (not d!60803) (not b!250326) (not bm!23541) (not d!60799) (not d!60815) (not d!60811) (not b_lambda!8071) (not bm!23535) (not bm!23510) (not b!250464) (not d!60805) (not bm!23519) (not b!250328) (not b!250371) (not b!250349) (not bm!23520) (not d!60785) (not bm!23536) (not d!60795) (not b!250465) (not b!250365) (not b!250462) (not d!60813) (not b!250417) (not b!250475) (not b!250409) (not b!250364) (not b!250474) tp_is_empty!6487 (not d!60801) (not b!250377) (not b!250324) (not b!250501) (not b_next!6625) (not b!250338) (not bm!23540) (not b!250419) (not bm!23514) (not b!250509) (not bm!23507) (not b!250468) (not b!250471) (not b!250510) (not b!250363) (not d!60817) (not b!250467) (not mapNonEmpty!11032) (not bm!23513) (not b!250340) (not b!250511) (not b!250337) (not b!250380) b_and!13625)
(check-sat b_and!13625 (not b_next!6625))
