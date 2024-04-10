; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21996 () Bool)

(assert start!21996)

(declare-fun b!226043 () Bool)

(declare-fun b_free!6063 () Bool)

(declare-fun b_next!6063 () Bool)

(assert (=> b!226043 (= b_free!6063 (not b_next!6063))))

(declare-fun tp!21331 () Bool)

(declare-fun b_and!12961 () Bool)

(assert (=> b!226043 (= tp!21331 b_and!12961)))

(declare-fun b!226027 () Bool)

(declare-fun e!146676 () Bool)

(declare-fun e!146673 () Bool)

(assert (=> b!226027 (= e!146676 e!146673)))

(declare-fun res!111264 () Bool)

(assert (=> b!226027 (=> (not res!111264) (not e!146673))))

(declare-datatypes ((SeekEntryResult!877 0))(
  ( (MissingZero!877 (index!5678 (_ BitVec 32))) (Found!877 (index!5679 (_ BitVec 32))) (Intermediate!877 (undefined!1689 Bool) (index!5680 (_ BitVec 32)) (x!23209 (_ BitVec 32))) (Undefined!877) (MissingVacant!877 (index!5681 (_ BitVec 32))) )
))
(declare-fun lt!113806 () SeekEntryResult!877)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!226027 (= res!111264 (or (= lt!113806 (MissingZero!877 index!297)) (= lt!113806 (MissingVacant!877 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7547 0))(
  ( (V!7548 (val!3007 Int)) )
))
(declare-datatypes ((ValueCell!2619 0))(
  ( (ValueCellFull!2619 (v!5027 V!7547)) (EmptyCell!2619) )
))
(declare-datatypes ((array!11093 0))(
  ( (array!11094 (arr!5266 (Array (_ BitVec 32) ValueCell!2619)) (size!5599 (_ BitVec 32))) )
))
(declare-datatypes ((array!11095 0))(
  ( (array!11096 (arr!5267 (Array (_ BitVec 32) (_ BitVec 64))) (size!5600 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3138 0))(
  ( (LongMapFixedSize!3139 (defaultEntry!4228 Int) (mask!10076 (_ BitVec 32)) (extraKeys!3965 (_ BitVec 32)) (zeroValue!4069 V!7547) (minValue!4069 V!7547) (_size!1618 (_ BitVec 32)) (_keys!6282 array!11095) (_values!4211 array!11093) (_vacant!1618 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3138)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11095 (_ BitVec 32)) SeekEntryResult!877)

(assert (=> b!226027 (= lt!113806 (seekEntryOrOpen!0 key!932 (_keys!6282 thiss!1504) (mask!10076 thiss!1504)))))

(declare-fun b!226028 () Bool)

(declare-fun e!146677 () Bool)

(get-info :version)

(assert (=> b!226028 (= e!146677 ((_ is Undefined!877) lt!113806))))

(declare-fun call!21023 () Bool)

(declare-fun c!37476 () Bool)

(declare-fun bm!21020 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21020 (= call!21023 (inRange!0 (ite c!37476 (index!5678 lt!113806) (index!5681 lt!113806)) (mask!10076 thiss!1504)))))

(declare-fun bm!21021 () Bool)

(declare-fun call!21024 () Bool)

(declare-fun arrayContainsKey!0 (array!11095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21021 (= call!21024 (arrayContainsKey!0 (_keys!6282 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226029 () Bool)

(declare-datatypes ((Unit!6825 0))(
  ( (Unit!6826) )
))
(declare-fun e!146678 () Unit!6825)

(declare-fun Unit!6827 () Unit!6825)

(assert (=> b!226029 (= e!146678 Unit!6827)))

(declare-fun b!226030 () Bool)

(declare-fun e!146680 () Bool)

(declare-fun tp_is_empty!5925 () Bool)

(assert (=> b!226030 (= e!146680 tp_is_empty!5925)))

(declare-fun b!226031 () Bool)

(declare-fun res!111260 () Bool)

(assert (=> b!226031 (= res!111260 (= (select (arr!5267 (_keys!6282 thiss!1504)) (index!5681 lt!113806)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!146682 () Bool)

(assert (=> b!226031 (=> (not res!111260) (not e!146682))))

(declare-fun b!226032 () Bool)

(declare-fun Unit!6828 () Unit!6825)

(assert (=> b!226032 (= e!146678 Unit!6828)))

(declare-fun lt!113804 () Unit!6825)

(declare-fun lemmaArrayContainsKeyThenInListMap!91 (array!11095 array!11093 (_ BitVec 32) (_ BitVec 32) V!7547 V!7547 (_ BitVec 64) (_ BitVec 32) Int) Unit!6825)

(assert (=> b!226032 (= lt!113804 (lemmaArrayContainsKeyThenInListMap!91 (_keys!6282 thiss!1504) (_values!4211 thiss!1504) (mask!10076 thiss!1504) (extraKeys!3965 thiss!1504) (zeroValue!4069 thiss!1504) (minValue!4069 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4228 thiss!1504)))))

(assert (=> b!226032 false))

(declare-fun b!226033 () Bool)

(declare-fun res!111256 () Bool)

(declare-fun e!146670 () Bool)

(assert (=> b!226033 (=> res!111256 e!146670)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226033 (= res!111256 (not (validKeyInArray!0 key!932)))))

(declare-fun b!226034 () Bool)

(declare-fun res!111255 () Bool)

(declare-fun e!146675 () Bool)

(assert (=> b!226034 (=> (not res!111255) (not e!146675))))

(assert (=> b!226034 (= res!111255 (= (select (arr!5267 (_keys!6282 thiss!1504)) (index!5678 lt!113806)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226035 () Bool)

(declare-fun e!146681 () Unit!6825)

(declare-fun Unit!6829 () Unit!6825)

(assert (=> b!226035 (= e!146681 Unit!6829)))

(declare-fun lt!113809 () Unit!6825)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!252 (array!11095 array!11093 (_ BitVec 32) (_ BitVec 32) V!7547 V!7547 (_ BitVec 64) Int) Unit!6825)

(assert (=> b!226035 (= lt!113809 (lemmaInListMapThenSeekEntryOrOpenFindsIt!252 (_keys!6282 thiss!1504) (_values!4211 thiss!1504) (mask!10076 thiss!1504) (extraKeys!3965 thiss!1504) (zeroValue!4069 thiss!1504) (minValue!4069 thiss!1504) key!932 (defaultEntry!4228 thiss!1504)))))

(assert (=> b!226035 false))

(declare-fun b!226036 () Bool)

(declare-fun res!111257 () Bool)

(assert (=> b!226036 (=> (not res!111257) (not e!146675))))

(assert (=> b!226036 (= res!111257 call!21023)))

(declare-fun e!146684 () Bool)

(assert (=> b!226036 (= e!146684 e!146675)))

(declare-fun b!226038 () Bool)

(declare-fun res!111258 () Bool)

(assert (=> b!226038 (=> res!111258 e!146670)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11095 (_ BitVec 32)) Bool)

(assert (=> b!226038 (= res!111258 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6282 thiss!1504) (mask!10076 thiss!1504))))))

(declare-fun mapIsEmpty!10057 () Bool)

(declare-fun mapRes!10057 () Bool)

(assert (=> mapIsEmpty!10057 mapRes!10057))

(declare-fun b!226039 () Bool)

(declare-fun e!146683 () Bool)

(assert (=> b!226039 (= e!146683 (not e!146670))))

(declare-fun res!111262 () Bool)

(assert (=> b!226039 (=> res!111262 e!146670)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226039 (= res!111262 (not (validMask!0 (mask!10076 thiss!1504))))))

(declare-fun lt!113811 () array!11095)

(declare-fun arrayCountValidKeys!0 (array!11095 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226039 (= (arrayCountValidKeys!0 lt!113811 #b00000000000000000000000000000000 (size!5600 (_keys!6282 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6282 thiss!1504) #b00000000000000000000000000000000 (size!5600 (_keys!6282 thiss!1504)))))))

(declare-fun lt!113812 () Unit!6825)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11095 (_ BitVec 32) (_ BitVec 64)) Unit!6825)

(assert (=> b!226039 (= lt!113812 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6282 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3365 0))(
  ( (Nil!3362) (Cons!3361 (h!4009 (_ BitVec 64)) (t!8324 List!3365)) )
))
(declare-fun arrayNoDuplicates!0 (array!11095 (_ BitVec 32) List!3365) Bool)

(assert (=> b!226039 (arrayNoDuplicates!0 lt!113811 #b00000000000000000000000000000000 Nil!3362)))

(assert (=> b!226039 (= lt!113811 (array!11096 (store (arr!5267 (_keys!6282 thiss!1504)) index!297 key!932) (size!5600 (_keys!6282 thiss!1504))))))

(declare-fun lt!113813 () Unit!6825)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11095 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3365) Unit!6825)

(assert (=> b!226039 (= lt!113813 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6282 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3362))))

(declare-fun lt!113803 () Unit!6825)

(assert (=> b!226039 (= lt!113803 e!146678)))

(declare-fun c!37473 () Bool)

(declare-fun lt!113808 () Bool)

(assert (=> b!226039 (= c!37473 lt!113808)))

(assert (=> b!226039 (= lt!113808 (arrayContainsKey!0 (_keys!6282 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226040 () Bool)

(declare-fun res!111263 () Bool)

(assert (=> b!226040 (=> (not res!111263) (not e!146676))))

(assert (=> b!226040 (= res!111263 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226041 () Bool)

(assert (=> b!226041 (= e!146677 e!146682)))

(declare-fun res!111253 () Bool)

(assert (=> b!226041 (= res!111253 call!21023)))

(assert (=> b!226041 (=> (not res!111253) (not e!146682))))

(declare-fun b!226042 () Bool)

(assert (=> b!226042 (= e!146682 (not call!21024))))

(declare-fun e!146679 () Bool)

(declare-fun e!146671 () Bool)

(declare-fun array_inv!3483 (array!11095) Bool)

(declare-fun array_inv!3484 (array!11093) Bool)

(assert (=> b!226043 (= e!146671 (and tp!21331 tp_is_empty!5925 (array_inv!3483 (_keys!6282 thiss!1504)) (array_inv!3484 (_values!4211 thiss!1504)) e!146679))))

(declare-fun b!226044 () Bool)

(declare-fun e!146674 () Bool)

(assert (=> b!226044 (= e!146674 tp_is_empty!5925)))

(declare-fun b!226045 () Bool)

(declare-fun res!111265 () Bool)

(assert (=> b!226045 (=> res!111265 e!146670)))

(assert (=> b!226045 (= res!111265 lt!113808)))

(declare-fun b!226046 () Bool)

(declare-fun lt!113807 () Unit!6825)

(assert (=> b!226046 (= e!146681 lt!113807)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!265 (array!11095 array!11093 (_ BitVec 32) (_ BitVec 32) V!7547 V!7547 (_ BitVec 64) Int) Unit!6825)

(assert (=> b!226046 (= lt!113807 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!265 (_keys!6282 thiss!1504) (_values!4211 thiss!1504) (mask!10076 thiss!1504) (extraKeys!3965 thiss!1504) (zeroValue!4069 thiss!1504) (minValue!4069 thiss!1504) key!932 (defaultEntry!4228 thiss!1504)))))

(assert (=> b!226046 (= c!37476 ((_ is MissingZero!877) lt!113806))))

(assert (=> b!226046 e!146684))

(declare-fun b!226047 () Bool)

(assert (=> b!226047 (= e!146670 true)))

(declare-fun lt!113810 () Bool)

(assert (=> b!226047 (= lt!113810 (arrayNoDuplicates!0 (_keys!6282 thiss!1504) #b00000000000000000000000000000000 Nil!3362))))

(declare-fun res!111254 () Bool)

(assert (=> start!21996 (=> (not res!111254) (not e!146676))))

(declare-fun valid!1262 (LongMapFixedSize!3138) Bool)

(assert (=> start!21996 (= res!111254 (valid!1262 thiss!1504))))

(assert (=> start!21996 e!146676))

(assert (=> start!21996 e!146671))

(assert (=> start!21996 true))

(declare-fun b!226037 () Bool)

(declare-fun c!37474 () Bool)

(assert (=> b!226037 (= c!37474 ((_ is MissingVacant!877) lt!113806))))

(assert (=> b!226037 (= e!146684 e!146677)))

(declare-fun mapNonEmpty!10057 () Bool)

(declare-fun tp!21330 () Bool)

(assert (=> mapNonEmpty!10057 (= mapRes!10057 (and tp!21330 e!146680))))

(declare-fun mapRest!10057 () (Array (_ BitVec 32) ValueCell!2619))

(declare-fun mapValue!10057 () ValueCell!2619)

(declare-fun mapKey!10057 () (_ BitVec 32))

(assert (=> mapNonEmpty!10057 (= (arr!5266 (_values!4211 thiss!1504)) (store mapRest!10057 mapKey!10057 mapValue!10057))))

(declare-fun b!226048 () Bool)

(declare-fun res!111259 () Bool)

(assert (=> b!226048 (=> res!111259 e!146670)))

(assert (=> b!226048 (= res!111259 (or (not (= (size!5600 (_keys!6282 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10076 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5600 (_keys!6282 thiss!1504)))))))

(declare-fun b!226049 () Bool)

(assert (=> b!226049 (= e!146679 (and e!146674 mapRes!10057))))

(declare-fun condMapEmpty!10057 () Bool)

(declare-fun mapDefault!10057 () ValueCell!2619)

(assert (=> b!226049 (= condMapEmpty!10057 (= (arr!5266 (_values!4211 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2619)) mapDefault!10057)))))

(declare-fun b!226050 () Bool)

(assert (=> b!226050 (= e!146675 (not call!21024))))

(declare-fun b!226051 () Bool)

(assert (=> b!226051 (= e!146673 e!146683)))

(declare-fun res!111261 () Bool)

(assert (=> b!226051 (=> (not res!111261) (not e!146683))))

(assert (=> b!226051 (= res!111261 (inRange!0 index!297 (mask!10076 thiss!1504)))))

(declare-fun lt!113805 () Unit!6825)

(assert (=> b!226051 (= lt!113805 e!146681)))

(declare-fun c!37475 () Bool)

(declare-datatypes ((tuple2!4450 0))(
  ( (tuple2!4451 (_1!2236 (_ BitVec 64)) (_2!2236 V!7547)) )
))
(declare-datatypes ((List!3366 0))(
  ( (Nil!3363) (Cons!3362 (h!4010 tuple2!4450) (t!8325 List!3366)) )
))
(declare-datatypes ((ListLongMap!3363 0))(
  ( (ListLongMap!3364 (toList!1697 List!3366)) )
))
(declare-fun contains!1571 (ListLongMap!3363 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1225 (array!11095 array!11093 (_ BitVec 32) (_ BitVec 32) V!7547 V!7547 (_ BitVec 32) Int) ListLongMap!3363)

(assert (=> b!226051 (= c!37475 (contains!1571 (getCurrentListMap!1225 (_keys!6282 thiss!1504) (_values!4211 thiss!1504) (mask!10076 thiss!1504) (extraKeys!3965 thiss!1504) (zeroValue!4069 thiss!1504) (minValue!4069 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4228 thiss!1504)) key!932))))

(assert (= (and start!21996 res!111254) b!226040))

(assert (= (and b!226040 res!111263) b!226027))

(assert (= (and b!226027 res!111264) b!226051))

(assert (= (and b!226051 c!37475) b!226035))

(assert (= (and b!226051 (not c!37475)) b!226046))

(assert (= (and b!226046 c!37476) b!226036))

(assert (= (and b!226046 (not c!37476)) b!226037))

(assert (= (and b!226036 res!111257) b!226034))

(assert (= (and b!226034 res!111255) b!226050))

(assert (= (and b!226037 c!37474) b!226041))

(assert (= (and b!226037 (not c!37474)) b!226028))

(assert (= (and b!226041 res!111253) b!226031))

(assert (= (and b!226031 res!111260) b!226042))

(assert (= (or b!226036 b!226041) bm!21020))

(assert (= (or b!226050 b!226042) bm!21021))

(assert (= (and b!226051 res!111261) b!226039))

(assert (= (and b!226039 c!37473) b!226032))

(assert (= (and b!226039 (not c!37473)) b!226029))

(assert (= (and b!226039 (not res!111262)) b!226048))

(assert (= (and b!226048 (not res!111259)) b!226033))

(assert (= (and b!226033 (not res!111256)) b!226045))

(assert (= (and b!226045 (not res!111265)) b!226038))

(assert (= (and b!226038 (not res!111258)) b!226047))

(assert (= (and b!226049 condMapEmpty!10057) mapIsEmpty!10057))

(assert (= (and b!226049 (not condMapEmpty!10057)) mapNonEmpty!10057))

(assert (= (and mapNonEmpty!10057 ((_ is ValueCellFull!2619) mapValue!10057)) b!226030))

(assert (= (and b!226049 ((_ is ValueCellFull!2619) mapDefault!10057)) b!226044))

(assert (= b!226043 b!226049))

(assert (= start!21996 b!226043))

(declare-fun m!248449 () Bool)

(assert (=> mapNonEmpty!10057 m!248449))

(declare-fun m!248451 () Bool)

(assert (=> b!226039 m!248451))

(declare-fun m!248453 () Bool)

(assert (=> b!226039 m!248453))

(declare-fun m!248455 () Bool)

(assert (=> b!226039 m!248455))

(declare-fun m!248457 () Bool)

(assert (=> b!226039 m!248457))

(declare-fun m!248459 () Bool)

(assert (=> b!226039 m!248459))

(declare-fun m!248461 () Bool)

(assert (=> b!226039 m!248461))

(declare-fun m!248463 () Bool)

(assert (=> b!226039 m!248463))

(declare-fun m!248465 () Bool)

(assert (=> b!226039 m!248465))

(declare-fun m!248467 () Bool)

(assert (=> b!226032 m!248467))

(declare-fun m!248469 () Bool)

(assert (=> b!226047 m!248469))

(declare-fun m!248471 () Bool)

(assert (=> b!226038 m!248471))

(declare-fun m!248473 () Bool)

(assert (=> b!226035 m!248473))

(declare-fun m!248475 () Bool)

(assert (=> start!21996 m!248475))

(declare-fun m!248477 () Bool)

(assert (=> bm!21020 m!248477))

(assert (=> bm!21021 m!248453))

(declare-fun m!248479 () Bool)

(assert (=> b!226051 m!248479))

(declare-fun m!248481 () Bool)

(assert (=> b!226051 m!248481))

(assert (=> b!226051 m!248481))

(declare-fun m!248483 () Bool)

(assert (=> b!226051 m!248483))

(declare-fun m!248485 () Bool)

(assert (=> b!226043 m!248485))

(declare-fun m!248487 () Bool)

(assert (=> b!226043 m!248487))

(declare-fun m!248489 () Bool)

(assert (=> b!226034 m!248489))

(declare-fun m!248491 () Bool)

(assert (=> b!226027 m!248491))

(declare-fun m!248493 () Bool)

(assert (=> b!226046 m!248493))

(declare-fun m!248495 () Bool)

(assert (=> b!226031 m!248495))

(declare-fun m!248497 () Bool)

(assert (=> b!226033 m!248497))

(check-sat tp_is_empty!5925 (not bm!21021) b_and!12961 (not bm!21020) (not start!21996) (not b!226043) (not b!226038) (not b_next!6063) (not b!226047) (not b!226051) (not b!226046) (not b!226032) (not mapNonEmpty!10057) (not b!226033) (not b!226039) (not b!226035) (not b!226027))
(check-sat b_and!12961 (not b_next!6063))
