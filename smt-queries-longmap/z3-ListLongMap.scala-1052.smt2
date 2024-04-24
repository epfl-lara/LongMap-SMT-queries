; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21998 () Bool)

(assert start!21998)

(declare-fun b!226005 () Bool)

(declare-fun b_free!6061 () Bool)

(declare-fun b_next!6061 () Bool)

(assert (=> b!226005 (= b_free!6061 (not b_next!6061))))

(declare-fun tp!21324 () Bool)

(declare-fun b_and!12973 () Bool)

(assert (=> b!226005 (= tp!21324 b_and!12973)))

(declare-fun b!225999 () Bool)

(declare-fun e!146659 () Bool)

(declare-fun e!146658 () Bool)

(assert (=> b!225999 (= e!146659 e!146658)))

(declare-fun res!111237 () Bool)

(declare-fun call!21006 () Bool)

(assert (=> b!225999 (= res!111237 call!21006)))

(assert (=> b!225999 (=> (not res!111237) (not e!146658))))

(declare-fun b!226000 () Bool)

(declare-datatypes ((Unit!6798 0))(
  ( (Unit!6799) )
))
(declare-fun e!146663 () Unit!6798)

(declare-fun Unit!6800 () Unit!6798)

(assert (=> b!226000 (= e!146663 Unit!6800)))

(declare-fun b!226001 () Bool)

(declare-fun Unit!6801 () Unit!6798)

(assert (=> b!226001 (= e!146663 Unit!6801)))

(declare-fun lt!113832 () Unit!6798)

(declare-datatypes ((V!7545 0))(
  ( (V!7546 (val!3006 Int)) )
))
(declare-datatypes ((ValueCell!2618 0))(
  ( (ValueCellFull!2618 (v!5027 V!7545)) (EmptyCell!2618) )
))
(declare-datatypes ((array!11087 0))(
  ( (array!11088 (arr!5263 (Array (_ BitVec 32) ValueCell!2618)) (size!5596 (_ BitVec 32))) )
))
(declare-datatypes ((array!11089 0))(
  ( (array!11090 (arr!5264 (Array (_ BitVec 32) (_ BitVec 64))) (size!5597 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3136 0))(
  ( (LongMapFixedSize!3137 (defaultEntry!4227 Int) (mask!10075 (_ BitVec 32)) (extraKeys!3964 (_ BitVec 32)) (zeroValue!4068 V!7545) (minValue!4068 V!7545) (_size!1617 (_ BitVec 32)) (_keys!6281 array!11089) (_values!4210 array!11087) (_vacant!1617 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3136)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!90 (array!11089 array!11087 (_ BitVec 32) (_ BitVec 32) V!7545 V!7545 (_ BitVec 64) (_ BitVec 32) Int) Unit!6798)

(assert (=> b!226001 (= lt!113832 (lemmaArrayContainsKeyThenInListMap!90 (_keys!6281 thiss!1504) (_values!4210 thiss!1504) (mask!10075 thiss!1504) (extraKeys!3964 thiss!1504) (zeroValue!4068 thiss!1504) (minValue!4068 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4227 thiss!1504)))))

(assert (=> b!226001 false))

(declare-fun b!226002 () Bool)

(declare-fun e!146655 () Bool)

(declare-fun e!146649 () Bool)

(declare-fun mapRes!10054 () Bool)

(assert (=> b!226002 (= e!146655 (and e!146649 mapRes!10054))))

(declare-fun condMapEmpty!10054 () Bool)

(declare-fun mapDefault!10054 () ValueCell!2618)

(assert (=> b!226002 (= condMapEmpty!10054 (= (arr!5263 (_values!4210 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2618)) mapDefault!10054)))))

(declare-fun b!226003 () Bool)

(declare-fun res!111245 () Bool)

(declare-fun e!146650 () Bool)

(assert (=> b!226003 (=> res!111245 e!146650)))

(declare-fun lt!113837 () Bool)

(assert (=> b!226003 (= res!111245 lt!113837)))

(declare-fun b!226004 () Bool)

(declare-fun res!111247 () Bool)

(assert (=> b!226004 (=> res!111247 e!146650)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226004 (= res!111247 (not (validKeyInArray!0 key!932)))))

(declare-fun bm!21002 () Bool)

(declare-fun c!37477 () Bool)

(declare-datatypes ((SeekEntryResult!848 0))(
  ( (MissingZero!848 (index!5562 (_ BitVec 32))) (Found!848 (index!5563 (_ BitVec 32))) (Intermediate!848 (undefined!1660 Bool) (index!5564 (_ BitVec 32)) (x!23180 (_ BitVec 32))) (Undefined!848) (MissingVacant!848 (index!5565 (_ BitVec 32))) )
))
(declare-fun lt!113835 () SeekEntryResult!848)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21002 (= call!21006 (inRange!0 (ite c!37477 (index!5562 lt!113835) (index!5565 lt!113835)) (mask!10075 thiss!1504)))))

(declare-fun mapIsEmpty!10054 () Bool)

(assert (=> mapIsEmpty!10054 mapRes!10054))

(declare-fun mapNonEmpty!10054 () Bool)

(declare-fun tp!21325 () Bool)

(declare-fun e!146651 () Bool)

(assert (=> mapNonEmpty!10054 (= mapRes!10054 (and tp!21325 e!146651))))

(declare-fun mapValue!10054 () ValueCell!2618)

(declare-fun mapKey!10054 () (_ BitVec 32))

(declare-fun mapRest!10054 () (Array (_ BitVec 32) ValueCell!2618))

(assert (=> mapNonEmpty!10054 (= (arr!5263 (_values!4210 thiss!1504)) (store mapRest!10054 mapKey!10054 mapValue!10054))))

(declare-fun tp_is_empty!5923 () Bool)

(declare-fun e!146652 () Bool)

(declare-fun array_inv!3459 (array!11089) Bool)

(declare-fun array_inv!3460 (array!11087) Bool)

(assert (=> b!226005 (= e!146652 (and tp!21324 tp_is_empty!5923 (array_inv!3459 (_keys!6281 thiss!1504)) (array_inv!3460 (_values!4210 thiss!1504)) e!146655))))

(declare-fun res!111244 () Bool)

(declare-fun e!146661 () Bool)

(assert (=> start!21998 (=> (not res!111244) (not e!146661))))

(declare-fun valid!1267 (LongMapFixedSize!3136) Bool)

(assert (=> start!21998 (= res!111244 (valid!1267 thiss!1504))))

(assert (=> start!21998 e!146661))

(assert (=> start!21998 e!146652))

(assert (=> start!21998 true))

(declare-fun b!226006 () Bool)

(declare-fun e!146656 () Bool)

(declare-fun e!146660 () Bool)

(assert (=> b!226006 (= e!146656 e!146660)))

(declare-fun res!111235 () Bool)

(assert (=> b!226006 (=> (not res!111235) (not e!146660))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!226006 (= res!111235 (inRange!0 index!297 (mask!10075 thiss!1504)))))

(declare-fun lt!113830 () Unit!6798)

(declare-fun e!146657 () Unit!6798)

(assert (=> b!226006 (= lt!113830 e!146657)))

(declare-fun c!37475 () Bool)

(declare-datatypes ((tuple2!4366 0))(
  ( (tuple2!4367 (_1!2194 (_ BitVec 64)) (_2!2194 V!7545)) )
))
(declare-datatypes ((List!3276 0))(
  ( (Nil!3273) (Cons!3272 (h!3920 tuple2!4366) (t!8227 List!3276)) )
))
(declare-datatypes ((ListLongMap!3281 0))(
  ( (ListLongMap!3282 (toList!1656 List!3276)) )
))
(declare-fun contains!1545 (ListLongMap!3281 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1188 (array!11089 array!11087 (_ BitVec 32) (_ BitVec 32) V!7545 V!7545 (_ BitVec 32) Int) ListLongMap!3281)

(assert (=> b!226006 (= c!37475 (contains!1545 (getCurrentListMap!1188 (_keys!6281 thiss!1504) (_values!4210 thiss!1504) (mask!10075 thiss!1504) (extraKeys!3964 thiss!1504) (zeroValue!4068 thiss!1504) (minValue!4068 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4227 thiss!1504)) key!932))))

(declare-fun b!226007 () Bool)

(declare-fun res!111240 () Bool)

(assert (=> b!226007 (= res!111240 (= (select (arr!5264 (_keys!6281 thiss!1504)) (index!5565 lt!113835)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226007 (=> (not res!111240) (not e!146658))))

(declare-fun b!226008 () Bool)

(declare-fun res!111242 () Bool)

(assert (=> b!226008 (=> res!111242 e!146650)))

(assert (=> b!226008 (= res!111242 (or (not (= (size!5597 (_keys!6281 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10075 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5597 (_keys!6281 thiss!1504)))))))

(declare-fun b!226009 () Bool)

(declare-fun e!146653 () Bool)

(declare-fun call!21005 () Bool)

(assert (=> b!226009 (= e!146653 (not call!21005))))

(declare-fun b!226010 () Bool)

(declare-fun res!111241 () Bool)

(assert (=> b!226010 (=> (not res!111241) (not e!146653))))

(assert (=> b!226010 (= res!111241 (= (select (arr!5264 (_keys!6281 thiss!1504)) (index!5562 lt!113835)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226011 () Bool)

(get-info :version)

(assert (=> b!226011 (= e!146659 ((_ is Undefined!848) lt!113835))))

(declare-fun b!226012 () Bool)

(declare-fun c!37476 () Bool)

(assert (=> b!226012 (= c!37476 ((_ is MissingVacant!848) lt!113835))))

(declare-fun e!146662 () Bool)

(assert (=> b!226012 (= e!146662 e!146659)))

(declare-fun b!226013 () Bool)

(declare-fun res!111236 () Bool)

(assert (=> b!226013 (=> (not res!111236) (not e!146661))))

(assert (=> b!226013 (= res!111236 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226014 () Bool)

(declare-fun res!111239 () Bool)

(assert (=> b!226014 (=> res!111239 e!146650)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11089 (_ BitVec 32)) Bool)

(assert (=> b!226014 (= res!111239 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6281 thiss!1504) (mask!10075 thiss!1504))))))

(declare-fun b!226015 () Bool)

(assert (=> b!226015 (= e!146650 true)))

(declare-fun lt!113838 () Bool)

(declare-datatypes ((List!3277 0))(
  ( (Nil!3274) (Cons!3273 (h!3921 (_ BitVec 64)) (t!8228 List!3277)) )
))
(declare-fun arrayNoDuplicates!0 (array!11089 (_ BitVec 32) List!3277) Bool)

(assert (=> b!226015 (= lt!113838 (arrayNoDuplicates!0 (_keys!6281 thiss!1504) #b00000000000000000000000000000000 Nil!3274))))

(declare-fun b!226016 () Bool)

(assert (=> b!226016 (= e!146660 (not e!146650))))

(declare-fun res!111246 () Bool)

(assert (=> b!226016 (=> res!111246 e!146650)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226016 (= res!111246 (not (validMask!0 (mask!10075 thiss!1504))))))

(declare-fun lt!113834 () array!11089)

(declare-fun arrayCountValidKeys!0 (array!11089 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226016 (= (arrayCountValidKeys!0 lt!113834 #b00000000000000000000000000000000 (size!5597 (_keys!6281 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6281 thiss!1504) #b00000000000000000000000000000000 (size!5597 (_keys!6281 thiss!1504)))))))

(declare-fun lt!113836 () Unit!6798)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11089 (_ BitVec 32) (_ BitVec 64)) Unit!6798)

(assert (=> b!226016 (= lt!113836 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6281 thiss!1504) index!297 key!932))))

(assert (=> b!226016 (arrayNoDuplicates!0 lt!113834 #b00000000000000000000000000000000 Nil!3274)))

(assert (=> b!226016 (= lt!113834 (array!11090 (store (arr!5264 (_keys!6281 thiss!1504)) index!297 key!932) (size!5597 (_keys!6281 thiss!1504))))))

(declare-fun lt!113839 () Unit!6798)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11089 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3277) Unit!6798)

(assert (=> b!226016 (= lt!113839 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6281 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3274))))

(declare-fun lt!113831 () Unit!6798)

(assert (=> b!226016 (= lt!113831 e!146663)))

(declare-fun c!37474 () Bool)

(assert (=> b!226016 (= c!37474 lt!113837)))

(declare-fun arrayContainsKey!0 (array!11089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226016 (= lt!113837 (arrayContainsKey!0 (_keys!6281 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226017 () Bool)

(declare-fun lt!113829 () Unit!6798)

(assert (=> b!226017 (= e!146657 lt!113829)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!243 (array!11089 array!11087 (_ BitVec 32) (_ BitVec 32) V!7545 V!7545 (_ BitVec 64) Int) Unit!6798)

(assert (=> b!226017 (= lt!113829 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!243 (_keys!6281 thiss!1504) (_values!4210 thiss!1504) (mask!10075 thiss!1504) (extraKeys!3964 thiss!1504) (zeroValue!4068 thiss!1504) (minValue!4068 thiss!1504) key!932 (defaultEntry!4227 thiss!1504)))))

(assert (=> b!226017 (= c!37477 ((_ is MissingZero!848) lt!113835))))

(assert (=> b!226017 e!146662))

(declare-fun b!226018 () Bool)

(assert (=> b!226018 (= e!146649 tp_is_empty!5923)))

(declare-fun b!226019 () Bool)

(assert (=> b!226019 (= e!146658 (not call!21005))))

(declare-fun b!226020 () Bool)

(assert (=> b!226020 (= e!146651 tp_is_empty!5923)))

(declare-fun b!226021 () Bool)

(declare-fun res!111243 () Bool)

(assert (=> b!226021 (=> (not res!111243) (not e!146653))))

(assert (=> b!226021 (= res!111243 call!21006)))

(assert (=> b!226021 (= e!146662 e!146653)))

(declare-fun bm!21003 () Bool)

(assert (=> bm!21003 (= call!21005 (arrayContainsKey!0 (_keys!6281 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226022 () Bool)

(declare-fun Unit!6802 () Unit!6798)

(assert (=> b!226022 (= e!146657 Unit!6802)))

(declare-fun lt!113833 () Unit!6798)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!252 (array!11089 array!11087 (_ BitVec 32) (_ BitVec 32) V!7545 V!7545 (_ BitVec 64) Int) Unit!6798)

(assert (=> b!226022 (= lt!113833 (lemmaInListMapThenSeekEntryOrOpenFindsIt!252 (_keys!6281 thiss!1504) (_values!4210 thiss!1504) (mask!10075 thiss!1504) (extraKeys!3964 thiss!1504) (zeroValue!4068 thiss!1504) (minValue!4068 thiss!1504) key!932 (defaultEntry!4227 thiss!1504)))))

(assert (=> b!226022 false))

(declare-fun b!226023 () Bool)

(assert (=> b!226023 (= e!146661 e!146656)))

(declare-fun res!111238 () Bool)

(assert (=> b!226023 (=> (not res!111238) (not e!146656))))

(assert (=> b!226023 (= res!111238 (or (= lt!113835 (MissingZero!848 index!297)) (= lt!113835 (MissingVacant!848 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11089 (_ BitVec 32)) SeekEntryResult!848)

(assert (=> b!226023 (= lt!113835 (seekEntryOrOpen!0 key!932 (_keys!6281 thiss!1504) (mask!10075 thiss!1504)))))

(assert (= (and start!21998 res!111244) b!226013))

(assert (= (and b!226013 res!111236) b!226023))

(assert (= (and b!226023 res!111238) b!226006))

(assert (= (and b!226006 c!37475) b!226022))

(assert (= (and b!226006 (not c!37475)) b!226017))

(assert (= (and b!226017 c!37477) b!226021))

(assert (= (and b!226017 (not c!37477)) b!226012))

(assert (= (and b!226021 res!111243) b!226010))

(assert (= (and b!226010 res!111241) b!226009))

(assert (= (and b!226012 c!37476) b!225999))

(assert (= (and b!226012 (not c!37476)) b!226011))

(assert (= (and b!225999 res!111237) b!226007))

(assert (= (and b!226007 res!111240) b!226019))

(assert (= (or b!226021 b!225999) bm!21002))

(assert (= (or b!226009 b!226019) bm!21003))

(assert (= (and b!226006 res!111235) b!226016))

(assert (= (and b!226016 c!37474) b!226001))

(assert (= (and b!226016 (not c!37474)) b!226000))

(assert (= (and b!226016 (not res!111246)) b!226008))

(assert (= (and b!226008 (not res!111242)) b!226004))

(assert (= (and b!226004 (not res!111247)) b!226003))

(assert (= (and b!226003 (not res!111245)) b!226014))

(assert (= (and b!226014 (not res!111239)) b!226015))

(assert (= (and b!226002 condMapEmpty!10054) mapIsEmpty!10054))

(assert (= (and b!226002 (not condMapEmpty!10054)) mapNonEmpty!10054))

(assert (= (and mapNonEmpty!10054 ((_ is ValueCellFull!2618) mapValue!10054)) b!226020))

(assert (= (and b!226002 ((_ is ValueCellFull!2618) mapDefault!10054)) b!226018))

(assert (= b!226005 b!226002))

(assert (= start!21998 b!226005))

(declare-fun m!248581 () Bool)

(assert (=> b!226010 m!248581))

(declare-fun m!248583 () Bool)

(assert (=> b!226016 m!248583))

(declare-fun m!248585 () Bool)

(assert (=> b!226016 m!248585))

(declare-fun m!248587 () Bool)

(assert (=> b!226016 m!248587))

(declare-fun m!248589 () Bool)

(assert (=> b!226016 m!248589))

(declare-fun m!248591 () Bool)

(assert (=> b!226016 m!248591))

(declare-fun m!248593 () Bool)

(assert (=> b!226016 m!248593))

(declare-fun m!248595 () Bool)

(assert (=> b!226016 m!248595))

(declare-fun m!248597 () Bool)

(assert (=> b!226016 m!248597))

(declare-fun m!248599 () Bool)

(assert (=> b!226015 m!248599))

(declare-fun m!248601 () Bool)

(assert (=> b!226004 m!248601))

(declare-fun m!248603 () Bool)

(assert (=> b!226007 m!248603))

(declare-fun m!248605 () Bool)

(assert (=> mapNonEmpty!10054 m!248605))

(declare-fun m!248607 () Bool)

(assert (=> b!226022 m!248607))

(declare-fun m!248609 () Bool)

(assert (=> b!226001 m!248609))

(declare-fun m!248611 () Bool)

(assert (=> b!226005 m!248611))

(declare-fun m!248613 () Bool)

(assert (=> b!226005 m!248613))

(declare-fun m!248615 () Bool)

(assert (=> b!226006 m!248615))

(declare-fun m!248617 () Bool)

(assert (=> b!226006 m!248617))

(assert (=> b!226006 m!248617))

(declare-fun m!248619 () Bool)

(assert (=> b!226006 m!248619))

(declare-fun m!248621 () Bool)

(assert (=> b!226017 m!248621))

(declare-fun m!248623 () Bool)

(assert (=> b!226014 m!248623))

(declare-fun m!248625 () Bool)

(assert (=> b!226023 m!248625))

(declare-fun m!248627 () Bool)

(assert (=> bm!21002 m!248627))

(assert (=> bm!21003 m!248585))

(declare-fun m!248629 () Bool)

(assert (=> start!21998 m!248629))

(check-sat (not bm!21002) (not b!226014) (not b!226023) (not b!226004) (not b_next!6061) tp_is_empty!5923 (not b!226006) (not b!226017) (not mapNonEmpty!10054) (not start!21998) (not b!226022) (not bm!21003) (not b!226001) (not b!226005) b_and!12973 (not b!226016) (not b!226015))
(check-sat b_and!12973 (not b_next!6061))
