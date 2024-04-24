; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21986 () Bool)

(assert start!21986)

(declare-fun b!225559 () Bool)

(declare-fun b_free!6049 () Bool)

(declare-fun b_next!6049 () Bool)

(assert (=> b!225559 (= b_free!6049 (not b_next!6049))))

(declare-fun tp!21289 () Bool)

(declare-fun b_and!12961 () Bool)

(assert (=> b!225559 (= tp!21289 b_and!12961)))

(declare-fun b!225549 () Bool)

(declare-fun res!111006 () Bool)

(declare-fun e!146390 () Bool)

(assert (=> b!225549 (=> res!111006 e!146390)))

(declare-datatypes ((V!7529 0))(
  ( (V!7530 (val!3000 Int)) )
))
(declare-datatypes ((ValueCell!2612 0))(
  ( (ValueCellFull!2612 (v!5021 V!7529)) (EmptyCell!2612) )
))
(declare-datatypes ((array!11063 0))(
  ( (array!11064 (arr!5251 (Array (_ BitVec 32) ValueCell!2612)) (size!5584 (_ BitVec 32))) )
))
(declare-datatypes ((array!11065 0))(
  ( (array!11066 (arr!5252 (Array (_ BitVec 32) (_ BitVec 64))) (size!5585 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3124 0))(
  ( (LongMapFixedSize!3125 (defaultEntry!4221 Int) (mask!10065 (_ BitVec 32)) (extraKeys!3958 (_ BitVec 32)) (zeroValue!4062 V!7529) (minValue!4062 V!7529) (_size!1611 (_ BitVec 32)) (_keys!6275 array!11065) (_values!4204 array!11063) (_vacant!1611 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3124)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11065 (_ BitVec 32)) Bool)

(assert (=> b!225549 (= res!111006 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6275 thiss!1504) (mask!10065 thiss!1504))))))

(declare-fun b!225550 () Bool)

(declare-datatypes ((Unit!6774 0))(
  ( (Unit!6775) )
))
(declare-fun e!146389 () Unit!6774)

(declare-fun Unit!6776 () Unit!6774)

(assert (=> b!225550 (= e!146389 Unit!6776)))

(declare-fun lt!113635 () Unit!6774)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!248 (array!11065 array!11063 (_ BitVec 32) (_ BitVec 32) V!7529 V!7529 (_ BitVec 64) Int) Unit!6774)

(assert (=> b!225550 (= lt!113635 (lemmaInListMapThenSeekEntryOrOpenFindsIt!248 (_keys!6275 thiss!1504) (_values!4204 thiss!1504) (mask!10065 thiss!1504) (extraKeys!3958 thiss!1504) (zeroValue!4062 thiss!1504) (minValue!4062 thiss!1504) key!932 (defaultEntry!4221 thiss!1504)))))

(assert (=> b!225550 false))

(declare-fun res!111013 () Bool)

(declare-fun e!146392 () Bool)

(assert (=> start!21986 (=> (not res!111013) (not e!146392))))

(declare-fun valid!1263 (LongMapFixedSize!3124) Bool)

(assert (=> start!21986 (= res!111013 (valid!1263 thiss!1504))))

(assert (=> start!21986 e!146392))

(declare-fun e!146386 () Bool)

(assert (=> start!21986 e!146386))

(assert (=> start!21986 true))

(declare-fun b!225551 () Bool)

(declare-fun lt!113639 () Unit!6774)

(assert (=> b!225551 (= e!146389 lt!113639)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!239 (array!11065 array!11063 (_ BitVec 32) (_ BitVec 32) V!7529 V!7529 (_ BitVec 64) Int) Unit!6774)

(assert (=> b!225551 (= lt!113639 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!239 (_keys!6275 thiss!1504) (_values!4204 thiss!1504) (mask!10065 thiss!1504) (extraKeys!3958 thiss!1504) (zeroValue!4062 thiss!1504) (minValue!4062 thiss!1504) key!932 (defaultEntry!4221 thiss!1504)))))

(declare-fun c!37402 () Bool)

(declare-datatypes ((SeekEntryResult!843 0))(
  ( (MissingZero!843 (index!5542 (_ BitVec 32))) (Found!843 (index!5543 (_ BitVec 32))) (Intermediate!843 (undefined!1655 Bool) (index!5544 (_ BitVec 32)) (x!23159 (_ BitVec 32))) (Undefined!843) (MissingVacant!843 (index!5545 (_ BitVec 32))) )
))
(declare-fun lt!113633 () SeekEntryResult!843)

(get-info :version)

(assert (=> b!225551 (= c!37402 ((_ is MissingZero!843) lt!113633))))

(declare-fun e!146391 () Bool)

(assert (=> b!225551 e!146391))

(declare-fun b!225552 () Bool)

(declare-fun e!146383 () Unit!6774)

(declare-fun Unit!6777 () Unit!6774)

(assert (=> b!225552 (= e!146383 Unit!6777)))

(declare-fun lt!113641 () Unit!6774)

(declare-fun lemmaArrayContainsKeyThenInListMap!85 (array!11065 array!11063 (_ BitVec 32) (_ BitVec 32) V!7529 V!7529 (_ BitVec 64) (_ BitVec 32) Int) Unit!6774)

(assert (=> b!225552 (= lt!113641 (lemmaArrayContainsKeyThenInListMap!85 (_keys!6275 thiss!1504) (_values!4204 thiss!1504) (mask!10065 thiss!1504) (extraKeys!3958 thiss!1504) (zeroValue!4062 thiss!1504) (minValue!4062 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4221 thiss!1504)))))

(assert (=> b!225552 false))

(declare-fun b!225553 () Bool)

(declare-fun e!146387 () Bool)

(declare-fun call!20970 () Bool)

(assert (=> b!225553 (= e!146387 (not call!20970))))

(declare-fun b!225554 () Bool)

(declare-fun e!146379 () Bool)

(declare-fun tp_is_empty!5911 () Bool)

(assert (=> b!225554 (= e!146379 tp_is_empty!5911)))

(declare-fun b!225555 () Bool)

(declare-fun res!111002 () Bool)

(assert (=> b!225555 (=> (not res!111002) (not e!146392))))

(assert (=> b!225555 (= res!111002 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20966 () Bool)

(declare-fun call!20969 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20966 (= call!20969 (inRange!0 (ite c!37402 (index!5542 lt!113633) (index!5545 lt!113633)) (mask!10065 thiss!1504)))))

(declare-fun b!225556 () Bool)

(declare-fun res!111009 () Bool)

(assert (=> b!225556 (=> res!111009 e!146390)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!225556 (= res!111009 (or (not (= (size!5585 (_keys!6275 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10065 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5585 (_keys!6275 thiss!1504)))))))

(declare-fun bm!20967 () Bool)

(declare-fun arrayContainsKey!0 (array!11065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20967 (= call!20970 (arrayContainsKey!0 (_keys!6275 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225557 () Bool)

(declare-fun e!146384 () Bool)

(declare-fun mapRes!10036 () Bool)

(assert (=> b!225557 (= e!146384 (and e!146379 mapRes!10036))))

(declare-fun condMapEmpty!10036 () Bool)

(declare-fun mapDefault!10036 () ValueCell!2612)

(assert (=> b!225557 (= condMapEmpty!10036 (= (arr!5251 (_values!4204 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2612)) mapDefault!10036)))))

(declare-fun b!225558 () Bool)

(assert (=> b!225558 (= e!146390 true)))

(declare-fun lt!113637 () Bool)

(declare-datatypes ((List!3266 0))(
  ( (Nil!3263) (Cons!3262 (h!3910 (_ BitVec 64)) (t!8217 List!3266)) )
))
(declare-fun arrayNoDuplicates!0 (array!11065 (_ BitVec 32) List!3266) Bool)

(assert (=> b!225558 (= lt!113637 (arrayNoDuplicates!0 (_keys!6275 thiss!1504) #b00000000000000000000000000000000 Nil!3263))))

(declare-fun array_inv!3451 (array!11065) Bool)

(declare-fun array_inv!3452 (array!11063) Bool)

(assert (=> b!225559 (= e!146386 (and tp!21289 tp_is_empty!5911 (array_inv!3451 (_keys!6275 thiss!1504)) (array_inv!3452 (_values!4204 thiss!1504)) e!146384))))

(declare-fun b!225560 () Bool)

(declare-fun res!111003 () Bool)

(assert (=> b!225560 (=> (not res!111003) (not e!146387))))

(assert (=> b!225560 (= res!111003 call!20969)))

(assert (=> b!225560 (= e!146391 e!146387)))

(declare-fun mapIsEmpty!10036 () Bool)

(assert (=> mapIsEmpty!10036 mapRes!10036))

(declare-fun b!225561 () Bool)

(declare-fun e!146382 () Bool)

(declare-fun e!146388 () Bool)

(assert (=> b!225561 (= e!146382 e!146388)))

(declare-fun res!111005 () Bool)

(assert (=> b!225561 (= res!111005 call!20969)))

(assert (=> b!225561 (=> (not res!111005) (not e!146388))))

(declare-fun b!225562 () Bool)

(assert (=> b!225562 (= e!146382 ((_ is Undefined!843) lt!113633))))

(declare-fun b!225563 () Bool)

(declare-fun res!111007 () Bool)

(assert (=> b!225563 (=> (not res!111007) (not e!146387))))

(assert (=> b!225563 (= res!111007 (= (select (arr!5252 (_keys!6275 thiss!1504)) (index!5542 lt!113633)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!10036 () Bool)

(declare-fun tp!21288 () Bool)

(declare-fun e!146393 () Bool)

(assert (=> mapNonEmpty!10036 (= mapRes!10036 (and tp!21288 e!146393))))

(declare-fun mapRest!10036 () (Array (_ BitVec 32) ValueCell!2612))

(declare-fun mapKey!10036 () (_ BitVec 32))

(declare-fun mapValue!10036 () ValueCell!2612)

(assert (=> mapNonEmpty!10036 (= (arr!5251 (_values!4204 thiss!1504)) (store mapRest!10036 mapKey!10036 mapValue!10036))))

(declare-fun b!225564 () Bool)

(declare-fun Unit!6778 () Unit!6774)

(assert (=> b!225564 (= e!146383 Unit!6778)))

(declare-fun b!225565 () Bool)

(declare-fun e!146385 () Bool)

(assert (=> b!225565 (= e!146385 (not e!146390))))

(declare-fun res!111004 () Bool)

(assert (=> b!225565 (=> res!111004 e!146390)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225565 (= res!111004 (not (validMask!0 (mask!10065 thiss!1504))))))

(declare-fun lt!113638 () array!11065)

(declare-fun arrayCountValidKeys!0 (array!11065 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225565 (= (arrayCountValidKeys!0 lt!113638 #b00000000000000000000000000000000 (size!5585 (_keys!6275 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6275 thiss!1504) #b00000000000000000000000000000000 (size!5585 (_keys!6275 thiss!1504)))))))

(declare-fun lt!113640 () Unit!6774)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11065 (_ BitVec 32) (_ BitVec 64)) Unit!6774)

(assert (=> b!225565 (= lt!113640 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6275 thiss!1504) index!297 key!932))))

(assert (=> b!225565 (arrayNoDuplicates!0 lt!113638 #b00000000000000000000000000000000 Nil!3263)))

(assert (=> b!225565 (= lt!113638 (array!11066 (store (arr!5252 (_keys!6275 thiss!1504)) index!297 key!932) (size!5585 (_keys!6275 thiss!1504))))))

(declare-fun lt!113632 () Unit!6774)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11065 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3266) Unit!6774)

(assert (=> b!225565 (= lt!113632 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6275 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3263))))

(declare-fun lt!113631 () Unit!6774)

(assert (=> b!225565 (= lt!113631 e!146383)))

(declare-fun c!37405 () Bool)

(declare-fun lt!113634 () Bool)

(assert (=> b!225565 (= c!37405 lt!113634)))

(assert (=> b!225565 (= lt!113634 (arrayContainsKey!0 (_keys!6275 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225566 () Bool)

(declare-fun res!111008 () Bool)

(assert (=> b!225566 (=> res!111008 e!146390)))

(assert (=> b!225566 (= res!111008 lt!113634)))

(declare-fun b!225567 () Bool)

(declare-fun res!111001 () Bool)

(assert (=> b!225567 (= res!111001 (= (select (arr!5252 (_keys!6275 thiss!1504)) (index!5545 lt!113633)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!225567 (=> (not res!111001) (not e!146388))))

(declare-fun b!225568 () Bool)

(declare-fun c!37404 () Bool)

(assert (=> b!225568 (= c!37404 ((_ is MissingVacant!843) lt!113633))))

(assert (=> b!225568 (= e!146391 e!146382)))

(declare-fun b!225569 () Bool)

(declare-fun e!146381 () Bool)

(assert (=> b!225569 (= e!146381 e!146385)))

(declare-fun res!111012 () Bool)

(assert (=> b!225569 (=> (not res!111012) (not e!146385))))

(assert (=> b!225569 (= res!111012 (inRange!0 index!297 (mask!10065 thiss!1504)))))

(declare-fun lt!113636 () Unit!6774)

(assert (=> b!225569 (= lt!113636 e!146389)))

(declare-fun c!37403 () Bool)

(declare-datatypes ((tuple2!4358 0))(
  ( (tuple2!4359 (_1!2190 (_ BitVec 64)) (_2!2190 V!7529)) )
))
(declare-datatypes ((List!3267 0))(
  ( (Nil!3264) (Cons!3263 (h!3911 tuple2!4358) (t!8218 List!3267)) )
))
(declare-datatypes ((ListLongMap!3273 0))(
  ( (ListLongMap!3274 (toList!1652 List!3267)) )
))
(declare-fun contains!1541 (ListLongMap!3273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1184 (array!11065 array!11063 (_ BitVec 32) (_ BitVec 32) V!7529 V!7529 (_ BitVec 32) Int) ListLongMap!3273)

(assert (=> b!225569 (= c!37403 (contains!1541 (getCurrentListMap!1184 (_keys!6275 thiss!1504) (_values!4204 thiss!1504) (mask!10065 thiss!1504) (extraKeys!3958 thiss!1504) (zeroValue!4062 thiss!1504) (minValue!4062 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4221 thiss!1504)) key!932))))

(declare-fun b!225570 () Bool)

(assert (=> b!225570 (= e!146393 tp_is_empty!5911)))

(declare-fun b!225571 () Bool)

(declare-fun res!111010 () Bool)

(assert (=> b!225571 (=> res!111010 e!146390)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225571 (= res!111010 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225572 () Bool)

(assert (=> b!225572 (= e!146392 e!146381)))

(declare-fun res!111011 () Bool)

(assert (=> b!225572 (=> (not res!111011) (not e!146381))))

(assert (=> b!225572 (= res!111011 (or (= lt!113633 (MissingZero!843 index!297)) (= lt!113633 (MissingVacant!843 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11065 (_ BitVec 32)) SeekEntryResult!843)

(assert (=> b!225572 (= lt!113633 (seekEntryOrOpen!0 key!932 (_keys!6275 thiss!1504) (mask!10065 thiss!1504)))))

(declare-fun b!225573 () Bool)

(assert (=> b!225573 (= e!146388 (not call!20970))))

(assert (= (and start!21986 res!111013) b!225555))

(assert (= (and b!225555 res!111002) b!225572))

(assert (= (and b!225572 res!111011) b!225569))

(assert (= (and b!225569 c!37403) b!225550))

(assert (= (and b!225569 (not c!37403)) b!225551))

(assert (= (and b!225551 c!37402) b!225560))

(assert (= (and b!225551 (not c!37402)) b!225568))

(assert (= (and b!225560 res!111003) b!225563))

(assert (= (and b!225563 res!111007) b!225553))

(assert (= (and b!225568 c!37404) b!225561))

(assert (= (and b!225568 (not c!37404)) b!225562))

(assert (= (and b!225561 res!111005) b!225567))

(assert (= (and b!225567 res!111001) b!225573))

(assert (= (or b!225560 b!225561) bm!20966))

(assert (= (or b!225553 b!225573) bm!20967))

(assert (= (and b!225569 res!111012) b!225565))

(assert (= (and b!225565 c!37405) b!225552))

(assert (= (and b!225565 (not c!37405)) b!225564))

(assert (= (and b!225565 (not res!111004)) b!225556))

(assert (= (and b!225556 (not res!111009)) b!225571))

(assert (= (and b!225571 (not res!111010)) b!225566))

(assert (= (and b!225566 (not res!111008)) b!225549))

(assert (= (and b!225549 (not res!111006)) b!225558))

(assert (= (and b!225557 condMapEmpty!10036) mapIsEmpty!10036))

(assert (= (and b!225557 (not condMapEmpty!10036)) mapNonEmpty!10036))

(assert (= (and mapNonEmpty!10036 ((_ is ValueCellFull!2612) mapValue!10036)) b!225570))

(assert (= (and b!225557 ((_ is ValueCellFull!2612) mapDefault!10036)) b!225554))

(assert (= b!225559 b!225557))

(assert (= start!21986 b!225559))

(declare-fun m!248281 () Bool)

(assert (=> b!225558 m!248281))

(declare-fun m!248283 () Bool)

(assert (=> b!225563 m!248283))

(declare-fun m!248285 () Bool)

(assert (=> b!225552 m!248285))

(declare-fun m!248287 () Bool)

(assert (=> b!225571 m!248287))

(declare-fun m!248289 () Bool)

(assert (=> mapNonEmpty!10036 m!248289))

(declare-fun m!248291 () Bool)

(assert (=> b!225565 m!248291))

(declare-fun m!248293 () Bool)

(assert (=> b!225565 m!248293))

(declare-fun m!248295 () Bool)

(assert (=> b!225565 m!248295))

(declare-fun m!248297 () Bool)

(assert (=> b!225565 m!248297))

(declare-fun m!248299 () Bool)

(assert (=> b!225565 m!248299))

(declare-fun m!248301 () Bool)

(assert (=> b!225565 m!248301))

(declare-fun m!248303 () Bool)

(assert (=> b!225565 m!248303))

(declare-fun m!248305 () Bool)

(assert (=> b!225565 m!248305))

(declare-fun m!248307 () Bool)

(assert (=> start!21986 m!248307))

(declare-fun m!248309 () Bool)

(assert (=> b!225549 m!248309))

(declare-fun m!248311 () Bool)

(assert (=> b!225551 m!248311))

(declare-fun m!248313 () Bool)

(assert (=> b!225550 m!248313))

(declare-fun m!248315 () Bool)

(assert (=> bm!20966 m!248315))

(declare-fun m!248317 () Bool)

(assert (=> b!225569 m!248317))

(declare-fun m!248319 () Bool)

(assert (=> b!225569 m!248319))

(assert (=> b!225569 m!248319))

(declare-fun m!248321 () Bool)

(assert (=> b!225569 m!248321))

(assert (=> bm!20967 m!248293))

(declare-fun m!248323 () Bool)

(assert (=> b!225559 m!248323))

(declare-fun m!248325 () Bool)

(assert (=> b!225559 m!248325))

(declare-fun m!248327 () Bool)

(assert (=> b!225567 m!248327))

(declare-fun m!248329 () Bool)

(assert (=> b!225572 m!248329))

(check-sat (not b!225558) (not b_next!6049) (not b!225549) tp_is_empty!5911 b_and!12961 (not start!21986) (not b!225571) (not b!225559) (not bm!20966) (not b!225552) (not b!225551) (not b!225565) (not b!225569) (not b!225550) (not mapNonEmpty!10036) (not bm!20967) (not b!225572))
(check-sat b_and!12961 (not b_next!6049))
