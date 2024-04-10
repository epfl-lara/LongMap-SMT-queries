; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22110 () Bool)

(assert start!22110)

(declare-fun b!229983 () Bool)

(declare-fun b_free!6177 () Bool)

(declare-fun b_next!6177 () Bool)

(assert (=> b!229983 (= b_free!6177 (not b_next!6177))))

(declare-fun tp!21672 () Bool)

(declare-fun b_and!13075 () Bool)

(assert (=> b!229983 (= tp!21672 b_and!13075)))

(declare-fun b!229980 () Bool)

(declare-fun e!149228 () Bool)

(assert (=> b!229980 (= e!149228 (not true))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((array!11321 0))(
  ( (array!11322 (arr!5380 (Array (_ BitVec 32) (_ BitVec 64))) (size!5713 (_ BitVec 32))) )
))
(declare-fun lt!115708 () array!11321)

(declare-datatypes ((V!7699 0))(
  ( (V!7700 (val!3064 Int)) )
))
(declare-datatypes ((ValueCell!2676 0))(
  ( (ValueCellFull!2676 (v!5084 V!7699)) (EmptyCell!2676) )
))
(declare-datatypes ((array!11323 0))(
  ( (array!11324 (arr!5381 (Array (_ BitVec 32) ValueCell!2676)) (size!5714 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3252 0))(
  ( (LongMapFixedSize!3253 (defaultEntry!4285 Int) (mask!10171 (_ BitVec 32)) (extraKeys!4022 (_ BitVec 32)) (zeroValue!4126 V!7699) (minValue!4126 V!7699) (_size!1675 (_ BitVec 32)) (_keys!6339 array!11321) (_values!4268 array!11323) (_vacant!1675 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3252)

(declare-fun v!346 () V!7699)

(declare-datatypes ((tuple2!4520 0))(
  ( (tuple2!4521 (_1!2271 (_ BitVec 64)) (_2!2271 V!7699)) )
))
(declare-datatypes ((List!3444 0))(
  ( (Nil!3441) (Cons!3440 (h!4088 tuple2!4520) (t!8403 List!3444)) )
))
(declare-datatypes ((ListLongMap!3433 0))(
  ( (ListLongMap!3434 (toList!1732 List!3444)) )
))
(declare-fun lt!115709 () ListLongMap!3433)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun +!601 (ListLongMap!3433 tuple2!4520) ListLongMap!3433)

(declare-fun getCurrentListMap!1260 (array!11321 array!11323 (_ BitVec 32) (_ BitVec 32) V!7699 V!7699 (_ BitVec 32) Int) ListLongMap!3433)

(assert (=> b!229980 (= (+!601 lt!115709 (tuple2!4521 key!932 v!346)) (getCurrentListMap!1260 lt!115708 (array!11324 (store (arr!5381 (_values!4268 thiss!1504)) index!297 (ValueCellFull!2676 v!346)) (size!5714 (_values!4268 thiss!1504))) (mask!10171 thiss!1504) (extraKeys!4022 thiss!1504) (zeroValue!4126 thiss!1504) (minValue!4126 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4285 thiss!1504)))))

(declare-datatypes ((Unit!7028 0))(
  ( (Unit!7029) )
))
(declare-fun lt!115700 () Unit!7028)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!55 (array!11321 array!11323 (_ BitVec 32) (_ BitVec 32) V!7699 V!7699 (_ BitVec 32) (_ BitVec 64) V!7699 Int) Unit!7028)

(assert (=> b!229980 (= lt!115700 (lemmaAddValidKeyToArrayThenAddPairToListMap!55 (_keys!6339 thiss!1504) (_values!4268 thiss!1504) (mask!10171 thiss!1504) (extraKeys!4022 thiss!1504) (zeroValue!4126 thiss!1504) (minValue!4126 thiss!1504) index!297 key!932 v!346 (defaultEntry!4285 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11321 (_ BitVec 32)) Bool)

(assert (=> b!229980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115708 (mask!10171 thiss!1504))))

(declare-fun lt!115706 () Unit!7028)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11321 (_ BitVec 32) (_ BitVec 32)) Unit!7028)

(assert (=> b!229980 (= lt!115706 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6339 thiss!1504) index!297 (mask!10171 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11321 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229980 (= (arrayCountValidKeys!0 lt!115708 #b00000000000000000000000000000000 (size!5713 (_keys!6339 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6339 thiss!1504) #b00000000000000000000000000000000 (size!5713 (_keys!6339 thiss!1504)))))))

(declare-fun lt!115702 () Unit!7028)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11321 (_ BitVec 32) (_ BitVec 64)) Unit!7028)

(assert (=> b!229980 (= lt!115702 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6339 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3445 0))(
  ( (Nil!3442) (Cons!3441 (h!4089 (_ BitVec 64)) (t!8404 List!3445)) )
))
(declare-fun arrayNoDuplicates!0 (array!11321 (_ BitVec 32) List!3445) Bool)

(assert (=> b!229980 (arrayNoDuplicates!0 lt!115708 #b00000000000000000000000000000000 Nil!3442)))

(assert (=> b!229980 (= lt!115708 (array!11322 (store (arr!5380 (_keys!6339 thiss!1504)) index!297 key!932) (size!5713 (_keys!6339 thiss!1504))))))

(declare-fun lt!115701 () Unit!7028)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11321 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3445) Unit!7028)

(assert (=> b!229980 (= lt!115701 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6339 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3442))))

(declare-fun lt!115705 () Unit!7028)

(declare-fun e!149224 () Unit!7028)

(assert (=> b!229980 (= lt!115705 e!149224)))

(declare-fun c!38158 () Bool)

(declare-fun arrayContainsKey!0 (array!11321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229980 (= c!38158 (arrayContainsKey!0 (_keys!6339 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229981 () Bool)

(declare-fun res!113155 () Bool)

(declare-fun e!149223 () Bool)

(assert (=> b!229981 (=> (not res!113155) (not e!149223))))

(declare-datatypes ((SeekEntryResult!930 0))(
  ( (MissingZero!930 (index!5890 (_ BitVec 32))) (Found!930 (index!5891 (_ BitVec 32))) (Intermediate!930 (undefined!1742 Bool) (index!5892 (_ BitVec 32)) (x!23414 (_ BitVec 32))) (Undefined!930) (MissingVacant!930 (index!5893 (_ BitVec 32))) )
))
(declare-fun lt!115699 () SeekEntryResult!930)

(assert (=> b!229981 (= res!113155 (= (select (arr!5380 (_keys!6339 thiss!1504)) (index!5890 lt!115699)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229982 () Bool)

(declare-fun res!113161 () Bool)

(declare-fun e!149232 () Bool)

(assert (=> b!229982 (=> (not res!113161) (not e!149232))))

(assert (=> b!229982 (= res!113161 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!149230 () Bool)

(declare-fun e!149227 () Bool)

(declare-fun tp_is_empty!6039 () Bool)

(declare-fun array_inv!3551 (array!11321) Bool)

(declare-fun array_inv!3552 (array!11323) Bool)

(assert (=> b!229983 (= e!149230 (and tp!21672 tp_is_empty!6039 (array_inv!3551 (_keys!6339 thiss!1504)) (array_inv!3552 (_values!4268 thiss!1504)) e!149227))))

(declare-fun b!229984 () Bool)

(declare-fun e!149234 () Bool)

(assert (=> b!229984 (= e!149234 tp_is_empty!6039)))

(declare-fun b!229985 () Bool)

(declare-fun c!38160 () Bool)

(get-info :version)

(assert (=> b!229985 (= c!38160 ((_ is MissingVacant!930) lt!115699))))

(declare-fun e!149231 () Bool)

(declare-fun e!149225 () Bool)

(assert (=> b!229985 (= e!149231 e!149225)))

(declare-fun b!229986 () Bool)

(declare-fun res!113160 () Bool)

(assert (=> b!229986 (= res!113160 (= (select (arr!5380 (_keys!6339 thiss!1504)) (index!5893 lt!115699)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149233 () Bool)

(assert (=> b!229986 (=> (not res!113160) (not e!149233))))

(declare-fun res!113156 () Bool)

(assert (=> start!22110 (=> (not res!113156) (not e!149232))))

(declare-fun valid!1297 (LongMapFixedSize!3252) Bool)

(assert (=> start!22110 (= res!113156 (valid!1297 thiss!1504))))

(assert (=> start!22110 e!149232))

(assert (=> start!22110 e!149230))

(assert (=> start!22110 true))

(assert (=> start!22110 tp_is_empty!6039))

(declare-fun mapIsEmpty!10228 () Bool)

(declare-fun mapRes!10228 () Bool)

(assert (=> mapIsEmpty!10228 mapRes!10228))

(declare-fun b!229987 () Bool)

(declare-fun e!149226 () Bool)

(assert (=> b!229987 (= e!149226 e!149228)))

(declare-fun res!113154 () Bool)

(assert (=> b!229987 (=> (not res!113154) (not e!149228))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229987 (= res!113154 (inRange!0 index!297 (mask!10171 thiss!1504)))))

(declare-fun lt!115703 () Unit!7028)

(declare-fun e!149222 () Unit!7028)

(assert (=> b!229987 (= lt!115703 e!149222)))

(declare-fun c!38159 () Bool)

(declare-fun contains!1605 (ListLongMap!3433 (_ BitVec 64)) Bool)

(assert (=> b!229987 (= c!38159 (contains!1605 lt!115709 key!932))))

(assert (=> b!229987 (= lt!115709 (getCurrentListMap!1260 (_keys!6339 thiss!1504) (_values!4268 thiss!1504) (mask!10171 thiss!1504) (extraKeys!4022 thiss!1504) (zeroValue!4126 thiss!1504) (minValue!4126 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4285 thiss!1504)))))

(declare-fun b!229988 () Bool)

(declare-fun call!21365 () Bool)

(assert (=> b!229988 (= e!149223 (not call!21365))))

(declare-fun b!229989 () Bool)

(declare-fun Unit!7030 () Unit!7028)

(assert (=> b!229989 (= e!149224 Unit!7030)))

(declare-fun b!229990 () Bool)

(declare-fun e!149229 () Bool)

(assert (=> b!229990 (= e!149229 tp_is_empty!6039)))

(declare-fun b!229991 () Bool)

(declare-fun Unit!7031 () Unit!7028)

(assert (=> b!229991 (= e!149224 Unit!7031)))

(declare-fun lt!115698 () Unit!7028)

(declare-fun lemmaArrayContainsKeyThenInListMap!120 (array!11321 array!11323 (_ BitVec 32) (_ BitVec 32) V!7699 V!7699 (_ BitVec 64) (_ BitVec 32) Int) Unit!7028)

(assert (=> b!229991 (= lt!115698 (lemmaArrayContainsKeyThenInListMap!120 (_keys!6339 thiss!1504) (_values!4268 thiss!1504) (mask!10171 thiss!1504) (extraKeys!4022 thiss!1504) (zeroValue!4126 thiss!1504) (minValue!4126 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4285 thiss!1504)))))

(assert (=> b!229991 false))

(declare-fun b!229992 () Bool)

(assert (=> b!229992 (= e!149225 e!149233)))

(declare-fun res!113157 () Bool)

(declare-fun call!21366 () Bool)

(assert (=> b!229992 (= res!113157 call!21366)))

(assert (=> b!229992 (=> (not res!113157) (not e!149233))))

(declare-fun b!229993 () Bool)

(assert (=> b!229993 (= e!149225 ((_ is Undefined!930) lt!115699))))

(declare-fun b!229994 () Bool)

(assert (=> b!229994 (= e!149227 (and e!149229 mapRes!10228))))

(declare-fun condMapEmpty!10228 () Bool)

(declare-fun mapDefault!10228 () ValueCell!2676)

(assert (=> b!229994 (= condMapEmpty!10228 (= (arr!5381 (_values!4268 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2676)) mapDefault!10228)))))

(declare-fun mapNonEmpty!10228 () Bool)

(declare-fun tp!21673 () Bool)

(assert (=> mapNonEmpty!10228 (= mapRes!10228 (and tp!21673 e!149234))))

(declare-fun mapValue!10228 () ValueCell!2676)

(declare-fun mapKey!10228 () (_ BitVec 32))

(declare-fun mapRest!10228 () (Array (_ BitVec 32) ValueCell!2676))

(assert (=> mapNonEmpty!10228 (= (arr!5381 (_values!4268 thiss!1504)) (store mapRest!10228 mapKey!10228 mapValue!10228))))

(declare-fun b!229995 () Bool)

(declare-fun res!113159 () Bool)

(assert (=> b!229995 (=> (not res!113159) (not e!149223))))

(assert (=> b!229995 (= res!113159 call!21366)))

(assert (=> b!229995 (= e!149231 e!149223)))

(declare-fun bm!21362 () Bool)

(assert (=> bm!21362 (= call!21365 (arrayContainsKey!0 (_keys!6339 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229996 () Bool)

(assert (=> b!229996 (= e!149233 (not call!21365))))

(declare-fun b!229997 () Bool)

(declare-fun Unit!7032 () Unit!7028)

(assert (=> b!229997 (= e!149222 Unit!7032)))

(declare-fun lt!115707 () Unit!7028)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!286 (array!11321 array!11323 (_ BitVec 32) (_ BitVec 32) V!7699 V!7699 (_ BitVec 64) Int) Unit!7028)

(assert (=> b!229997 (= lt!115707 (lemmaInListMapThenSeekEntryOrOpenFindsIt!286 (_keys!6339 thiss!1504) (_values!4268 thiss!1504) (mask!10171 thiss!1504) (extraKeys!4022 thiss!1504) (zeroValue!4126 thiss!1504) (minValue!4126 thiss!1504) key!932 (defaultEntry!4285 thiss!1504)))))

(assert (=> b!229997 false))

(declare-fun bm!21363 () Bool)

(declare-fun c!38157 () Bool)

(assert (=> bm!21363 (= call!21366 (inRange!0 (ite c!38157 (index!5890 lt!115699) (index!5893 lt!115699)) (mask!10171 thiss!1504)))))

(declare-fun b!229998 () Bool)

(assert (=> b!229998 (= e!149232 e!149226)))

(declare-fun res!113158 () Bool)

(assert (=> b!229998 (=> (not res!113158) (not e!149226))))

(assert (=> b!229998 (= res!113158 (or (= lt!115699 (MissingZero!930 index!297)) (= lt!115699 (MissingVacant!930 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11321 (_ BitVec 32)) SeekEntryResult!930)

(assert (=> b!229998 (= lt!115699 (seekEntryOrOpen!0 key!932 (_keys!6339 thiss!1504) (mask!10171 thiss!1504)))))

(declare-fun b!229999 () Bool)

(declare-fun lt!115704 () Unit!7028)

(assert (=> b!229999 (= e!149222 lt!115704)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!303 (array!11321 array!11323 (_ BitVec 32) (_ BitVec 32) V!7699 V!7699 (_ BitVec 64) Int) Unit!7028)

(assert (=> b!229999 (= lt!115704 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!303 (_keys!6339 thiss!1504) (_values!4268 thiss!1504) (mask!10171 thiss!1504) (extraKeys!4022 thiss!1504) (zeroValue!4126 thiss!1504) (minValue!4126 thiss!1504) key!932 (defaultEntry!4285 thiss!1504)))))

(assert (=> b!229999 (= c!38157 ((_ is MissingZero!930) lt!115699))))

(assert (=> b!229999 e!149231))

(assert (= (and start!22110 res!113156) b!229982))

(assert (= (and b!229982 res!113161) b!229998))

(assert (= (and b!229998 res!113158) b!229987))

(assert (= (and b!229987 c!38159) b!229997))

(assert (= (and b!229987 (not c!38159)) b!229999))

(assert (= (and b!229999 c!38157) b!229995))

(assert (= (and b!229999 (not c!38157)) b!229985))

(assert (= (and b!229995 res!113159) b!229981))

(assert (= (and b!229981 res!113155) b!229988))

(assert (= (and b!229985 c!38160) b!229992))

(assert (= (and b!229985 (not c!38160)) b!229993))

(assert (= (and b!229992 res!113157) b!229986))

(assert (= (and b!229986 res!113160) b!229996))

(assert (= (or b!229995 b!229992) bm!21363))

(assert (= (or b!229988 b!229996) bm!21362))

(assert (= (and b!229987 res!113154) b!229980))

(assert (= (and b!229980 c!38158) b!229991))

(assert (= (and b!229980 (not c!38158)) b!229989))

(assert (= (and b!229994 condMapEmpty!10228) mapIsEmpty!10228))

(assert (= (and b!229994 (not condMapEmpty!10228)) mapNonEmpty!10228))

(assert (= (and mapNonEmpty!10228 ((_ is ValueCellFull!2676) mapValue!10228)) b!229984))

(assert (= (and b!229994 ((_ is ValueCellFull!2676) mapDefault!10228)) b!229990))

(assert (= b!229983 b!229994))

(assert (= start!22110 b!229983))

(declare-fun m!251399 () Bool)

(assert (=> b!229983 m!251399))

(declare-fun m!251401 () Bool)

(assert (=> b!229983 m!251401))

(declare-fun m!251403 () Bool)

(assert (=> mapNonEmpty!10228 m!251403))

(declare-fun m!251405 () Bool)

(assert (=> b!229999 m!251405))

(declare-fun m!251407 () Bool)

(assert (=> b!229981 m!251407))

(declare-fun m!251409 () Bool)

(assert (=> b!229997 m!251409))

(declare-fun m!251411 () Bool)

(assert (=> b!229980 m!251411))

(declare-fun m!251413 () Bool)

(assert (=> b!229980 m!251413))

(declare-fun m!251415 () Bool)

(assert (=> b!229980 m!251415))

(declare-fun m!251417 () Bool)

(assert (=> b!229980 m!251417))

(declare-fun m!251419 () Bool)

(assert (=> b!229980 m!251419))

(declare-fun m!251421 () Bool)

(assert (=> b!229980 m!251421))

(declare-fun m!251423 () Bool)

(assert (=> b!229980 m!251423))

(declare-fun m!251425 () Bool)

(assert (=> b!229980 m!251425))

(declare-fun m!251427 () Bool)

(assert (=> b!229980 m!251427))

(declare-fun m!251429 () Bool)

(assert (=> b!229980 m!251429))

(declare-fun m!251431 () Bool)

(assert (=> b!229980 m!251431))

(declare-fun m!251433 () Bool)

(assert (=> b!229980 m!251433))

(declare-fun m!251435 () Bool)

(assert (=> b!229980 m!251435))

(declare-fun m!251437 () Bool)

(assert (=> start!22110 m!251437))

(declare-fun m!251439 () Bool)

(assert (=> b!229991 m!251439))

(declare-fun m!251441 () Bool)

(assert (=> bm!21363 m!251441))

(declare-fun m!251443 () Bool)

(assert (=> b!229986 m!251443))

(declare-fun m!251445 () Bool)

(assert (=> b!229987 m!251445))

(declare-fun m!251447 () Bool)

(assert (=> b!229987 m!251447))

(declare-fun m!251449 () Bool)

(assert (=> b!229987 m!251449))

(declare-fun m!251451 () Bool)

(assert (=> b!229998 m!251451))

(assert (=> bm!21362 m!251411))

(check-sat (not bm!21363) (not b!229987) (not b!229997) (not bm!21362) b_and!13075 (not b!229998) (not b!229991) (not b_next!6177) tp_is_empty!6039 (not mapNonEmpty!10228) (not b!229980) (not b!229983) (not start!22110) (not b!229999))
(check-sat b_and!13075 (not b_next!6177))
