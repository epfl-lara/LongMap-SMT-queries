; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21984 () Bool)

(assert start!21984)

(declare-fun b!225581 () Bool)

(declare-fun b_free!6051 () Bool)

(declare-fun b_next!6051 () Bool)

(assert (=> b!225581 (= b_free!6051 (not b_next!6051))))

(declare-fun tp!21294 () Bool)

(declare-fun b_and!12949 () Bool)

(assert (=> b!225581 (= tp!21294 b_and!12949)))

(declare-fun b!225577 () Bool)

(declare-datatypes ((Unit!6804 0))(
  ( (Unit!6805) )
))
(declare-fun e!146413 () Unit!6804)

(declare-fun Unit!6806 () Unit!6804)

(assert (=> b!225577 (= e!146413 Unit!6806)))

(declare-fun lt!113615 () Unit!6804)

(declare-datatypes ((V!7531 0))(
  ( (V!7532 (val!3001 Int)) )
))
(declare-datatypes ((ValueCell!2613 0))(
  ( (ValueCellFull!2613 (v!5021 V!7531)) (EmptyCell!2613) )
))
(declare-datatypes ((array!11069 0))(
  ( (array!11070 (arr!5254 (Array (_ BitVec 32) ValueCell!2613)) (size!5587 (_ BitVec 32))) )
))
(declare-datatypes ((array!11071 0))(
  ( (array!11072 (arr!5255 (Array (_ BitVec 32) (_ BitVec 64))) (size!5588 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3126 0))(
  ( (LongMapFixedSize!3127 (defaultEntry!4222 Int) (mask!10066 (_ BitVec 32)) (extraKeys!3959 (_ BitVec 32)) (zeroValue!4063 V!7531) (minValue!4063 V!7531) (_size!1612 (_ BitVec 32)) (_keys!6276 array!11071) (_values!4205 array!11069) (_vacant!1612 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3126)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!88 (array!11071 array!11069 (_ BitVec 32) (_ BitVec 32) V!7531 V!7531 (_ BitVec 64) (_ BitVec 32) Int) Unit!6804)

(assert (=> b!225577 (= lt!113615 (lemmaArrayContainsKeyThenInListMap!88 (_keys!6276 thiss!1504) (_values!4205 thiss!1504) (mask!10066 thiss!1504) (extraKeys!3959 thiss!1504) (zeroValue!4063 thiss!1504) (minValue!4063 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4222 thiss!1504)))))

(assert (=> b!225577 false))

(declare-fun b!225578 () Bool)

(declare-fun res!111031 () Bool)

(declare-fun e!146409 () Bool)

(assert (=> b!225578 (=> (not res!111031) (not e!146409))))

(declare-fun call!20987 () Bool)

(assert (=> b!225578 (= res!111031 call!20987)))

(declare-fun e!146403 () Bool)

(assert (=> b!225578 (= e!146403 e!146409)))

(declare-fun res!111028 () Bool)

(declare-fun e!146400 () Bool)

(assert (=> start!21984 (=> (not res!111028) (not e!146400))))

(declare-fun valid!1259 (LongMapFixedSize!3126) Bool)

(assert (=> start!21984 (= res!111028 (valid!1259 thiss!1504))))

(assert (=> start!21984 e!146400))

(declare-fun e!146411 () Bool)

(assert (=> start!21984 e!146411))

(assert (=> start!21984 true))

(declare-fun b!225579 () Bool)

(declare-fun e!146405 () Bool)

(assert (=> b!225579 (= e!146400 e!146405)))

(declare-fun res!111022 () Bool)

(assert (=> b!225579 (=> (not res!111022) (not e!146405))))

(declare-datatypes ((SeekEntryResult!871 0))(
  ( (MissingZero!871 (index!5654 (_ BitVec 32))) (Found!871 (index!5655 (_ BitVec 32))) (Intermediate!871 (undefined!1683 Bool) (index!5656 (_ BitVec 32)) (x!23187 (_ BitVec 32))) (Undefined!871) (MissingVacant!871 (index!5657 (_ BitVec 32))) )
))
(declare-fun lt!113606 () SeekEntryResult!871)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!225579 (= res!111022 (or (= lt!113606 (MissingZero!871 index!297)) (= lt!113606 (MissingVacant!871 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11071 (_ BitVec 32)) SeekEntryResult!871)

(assert (=> b!225579 (= lt!113606 (seekEntryOrOpen!0 key!932 (_keys!6276 thiss!1504) (mask!10066 thiss!1504)))))

(declare-fun b!225580 () Bool)

(declare-fun e!146412 () Unit!6804)

(declare-fun lt!113607 () Unit!6804)

(assert (=> b!225580 (= e!146412 lt!113607)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!261 (array!11071 array!11069 (_ BitVec 32) (_ BitVec 32) V!7531 V!7531 (_ BitVec 64) Int) Unit!6804)

(assert (=> b!225580 (= lt!113607 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!261 (_keys!6276 thiss!1504) (_values!4205 thiss!1504) (mask!10066 thiss!1504) (extraKeys!3959 thiss!1504) (zeroValue!4063 thiss!1504) (minValue!4063 thiss!1504) key!932 (defaultEntry!4222 thiss!1504)))))

(declare-fun c!37403 () Bool)

(get-info :version)

(assert (=> b!225580 (= c!37403 ((_ is MissingZero!871) lt!113606))))

(assert (=> b!225580 e!146403))

(declare-fun tp_is_empty!5913 () Bool)

(declare-fun e!146406 () Bool)

(declare-fun array_inv!3477 (array!11071) Bool)

(declare-fun array_inv!3478 (array!11069) Bool)

(assert (=> b!225581 (= e!146411 (and tp!21294 tp_is_empty!5913 (array_inv!3477 (_keys!6276 thiss!1504)) (array_inv!3478 (_values!4205 thiss!1504)) e!146406))))

(declare-fun b!225582 () Bool)

(declare-fun res!111021 () Bool)

(assert (=> b!225582 (= res!111021 (= (select (arr!5255 (_keys!6276 thiss!1504)) (index!5657 lt!113606)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!146404 () Bool)

(assert (=> b!225582 (=> (not res!111021) (not e!146404))))

(declare-fun b!225583 () Bool)

(declare-fun call!20988 () Bool)

(assert (=> b!225583 (= e!146404 (not call!20988))))

(declare-fun b!225584 () Bool)

(declare-fun Unit!6807 () Unit!6804)

(assert (=> b!225584 (= e!146413 Unit!6807)))

(declare-fun b!225585 () Bool)

(declare-fun e!146408 () Bool)

(declare-fun mapRes!10039 () Bool)

(assert (=> b!225585 (= e!146406 (and e!146408 mapRes!10039))))

(declare-fun condMapEmpty!10039 () Bool)

(declare-fun mapDefault!10039 () ValueCell!2613)

(assert (=> b!225585 (= condMapEmpty!10039 (= (arr!5254 (_values!4205 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2613)) mapDefault!10039)))))

(declare-fun b!225586 () Bool)

(declare-fun res!111030 () Bool)

(declare-fun e!146410 () Bool)

(assert (=> b!225586 (=> res!111030 e!146410)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225586 (= res!111030 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225587 () Bool)

(declare-fun e!146414 () Bool)

(assert (=> b!225587 (= e!146414 e!146404)))

(declare-fun res!111019 () Bool)

(assert (=> b!225587 (= res!111019 call!20987)))

(assert (=> b!225587 (=> (not res!111019) (not e!146404))))

(declare-fun b!225588 () Bool)

(declare-fun res!111029 () Bool)

(assert (=> b!225588 (=> res!111029 e!146410)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11071 (_ BitVec 32)) Bool)

(assert (=> b!225588 (= res!111029 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6276 thiss!1504) (mask!10066 thiss!1504))))))

(declare-fun b!225589 () Bool)

(assert (=> b!225589 (= e!146410 true)))

(declare-fun lt!113608 () Bool)

(declare-datatypes ((List!3357 0))(
  ( (Nil!3354) (Cons!3353 (h!4001 (_ BitVec 64)) (t!8316 List!3357)) )
))
(declare-fun arrayNoDuplicates!0 (array!11071 (_ BitVec 32) List!3357) Bool)

(assert (=> b!225589 (= lt!113608 (arrayNoDuplicates!0 (_keys!6276 thiss!1504) #b00000000000000000000000000000000 Nil!3354))))

(declare-fun bm!20984 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20984 (= call!20987 (inRange!0 (ite c!37403 (index!5654 lt!113606) (index!5657 lt!113606)) (mask!10066 thiss!1504)))))

(declare-fun b!225590 () Bool)

(declare-fun e!146401 () Bool)

(assert (=> b!225590 (= e!146405 e!146401)))

(declare-fun res!111020 () Bool)

(assert (=> b!225590 (=> (not res!111020) (not e!146401))))

(assert (=> b!225590 (= res!111020 (inRange!0 index!297 (mask!10066 thiss!1504)))))

(declare-fun lt!113613 () Unit!6804)

(assert (=> b!225590 (= lt!113613 e!146412)))

(declare-fun c!37401 () Bool)

(declare-datatypes ((tuple2!4444 0))(
  ( (tuple2!4445 (_1!2233 (_ BitVec 64)) (_2!2233 V!7531)) )
))
(declare-datatypes ((List!3358 0))(
  ( (Nil!3355) (Cons!3354 (h!4002 tuple2!4444) (t!8317 List!3358)) )
))
(declare-datatypes ((ListLongMap!3357 0))(
  ( (ListLongMap!3358 (toList!1694 List!3358)) )
))
(declare-fun contains!1568 (ListLongMap!3357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1222 (array!11071 array!11069 (_ BitVec 32) (_ BitVec 32) V!7531 V!7531 (_ BitVec 32) Int) ListLongMap!3357)

(assert (=> b!225590 (= c!37401 (contains!1568 (getCurrentListMap!1222 (_keys!6276 thiss!1504) (_values!4205 thiss!1504) (mask!10066 thiss!1504) (extraKeys!3959 thiss!1504) (zeroValue!4063 thiss!1504) (minValue!4063 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4222 thiss!1504)) key!932))))

(declare-fun b!225591 () Bool)

(assert (=> b!225591 (= e!146401 (not e!146410))))

(declare-fun res!111026 () Bool)

(assert (=> b!225591 (=> res!111026 e!146410)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225591 (= res!111026 (not (validMask!0 (mask!10066 thiss!1504))))))

(declare-fun lt!113609 () array!11071)

(declare-fun arrayCountValidKeys!0 (array!11071 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225591 (= (arrayCountValidKeys!0 lt!113609 #b00000000000000000000000000000000 (size!5588 (_keys!6276 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6276 thiss!1504) #b00000000000000000000000000000000 (size!5588 (_keys!6276 thiss!1504)))))))

(declare-fun lt!113612 () Unit!6804)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11071 (_ BitVec 32) (_ BitVec 64)) Unit!6804)

(assert (=> b!225591 (= lt!113612 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6276 thiss!1504) index!297 key!932))))

(assert (=> b!225591 (arrayNoDuplicates!0 lt!113609 #b00000000000000000000000000000000 Nil!3354)))

(assert (=> b!225591 (= lt!113609 (array!11072 (store (arr!5255 (_keys!6276 thiss!1504)) index!297 key!932) (size!5588 (_keys!6276 thiss!1504))))))

(declare-fun lt!113610 () Unit!6804)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11071 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3357) Unit!6804)

(assert (=> b!225591 (= lt!113610 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6276 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3354))))

(declare-fun lt!113614 () Unit!6804)

(assert (=> b!225591 (= lt!113614 e!146413)))

(declare-fun c!37404 () Bool)

(declare-fun lt!113605 () Bool)

(assert (=> b!225591 (= c!37404 lt!113605)))

(declare-fun arrayContainsKey!0 (array!11071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225591 (= lt!113605 (arrayContainsKey!0 (_keys!6276 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225592 () Bool)

(declare-fun c!37402 () Bool)

(assert (=> b!225592 (= c!37402 ((_ is MissingVacant!871) lt!113606))))

(assert (=> b!225592 (= e!146403 e!146414)))

(declare-fun b!225593 () Bool)

(assert (=> b!225593 (= e!146408 tp_is_empty!5913)))

(declare-fun b!225594 () Bool)

(declare-fun e!146407 () Bool)

(assert (=> b!225594 (= e!146407 tp_is_empty!5913)))

(declare-fun mapIsEmpty!10039 () Bool)

(assert (=> mapIsEmpty!10039 mapRes!10039))

(declare-fun b!225595 () Bool)

(declare-fun res!111027 () Bool)

(assert (=> b!225595 (=> res!111027 e!146410)))

(assert (=> b!225595 (= res!111027 (or (not (= (size!5588 (_keys!6276 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10066 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5588 (_keys!6276 thiss!1504)))))))

(declare-fun b!225596 () Bool)

(assert (=> b!225596 (= e!146414 ((_ is Undefined!871) lt!113606))))

(declare-fun b!225597 () Bool)

(declare-fun res!111025 () Bool)

(assert (=> b!225597 (=> (not res!111025) (not e!146400))))

(assert (=> b!225597 (= res!111025 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10039 () Bool)

(declare-fun tp!21295 () Bool)

(assert (=> mapNonEmpty!10039 (= mapRes!10039 (and tp!21295 e!146407))))

(declare-fun mapKey!10039 () (_ BitVec 32))

(declare-fun mapValue!10039 () ValueCell!2613)

(declare-fun mapRest!10039 () (Array (_ BitVec 32) ValueCell!2613))

(assert (=> mapNonEmpty!10039 (= (arr!5254 (_values!4205 thiss!1504)) (store mapRest!10039 mapKey!10039 mapValue!10039))))

(declare-fun b!225598 () Bool)

(declare-fun Unit!6808 () Unit!6804)

(assert (=> b!225598 (= e!146412 Unit!6808)))

(declare-fun lt!113611 () Unit!6804)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!248 (array!11071 array!11069 (_ BitVec 32) (_ BitVec 32) V!7531 V!7531 (_ BitVec 64) Int) Unit!6804)

(assert (=> b!225598 (= lt!113611 (lemmaInListMapThenSeekEntryOrOpenFindsIt!248 (_keys!6276 thiss!1504) (_values!4205 thiss!1504) (mask!10066 thiss!1504) (extraKeys!3959 thiss!1504) (zeroValue!4063 thiss!1504) (minValue!4063 thiss!1504) key!932 (defaultEntry!4222 thiss!1504)))))

(assert (=> b!225598 false))

(declare-fun b!225599 () Bool)

(declare-fun res!111024 () Bool)

(assert (=> b!225599 (=> (not res!111024) (not e!146409))))

(assert (=> b!225599 (= res!111024 (= (select (arr!5255 (_keys!6276 thiss!1504)) (index!5654 lt!113606)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225600 () Bool)

(assert (=> b!225600 (= e!146409 (not call!20988))))

(declare-fun bm!20985 () Bool)

(assert (=> bm!20985 (= call!20988 (arrayContainsKey!0 (_keys!6276 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225601 () Bool)

(declare-fun res!111023 () Bool)

(assert (=> b!225601 (=> res!111023 e!146410)))

(assert (=> b!225601 (= res!111023 lt!113605)))

(assert (= (and start!21984 res!111028) b!225597))

(assert (= (and b!225597 res!111025) b!225579))

(assert (= (and b!225579 res!111022) b!225590))

(assert (= (and b!225590 c!37401) b!225598))

(assert (= (and b!225590 (not c!37401)) b!225580))

(assert (= (and b!225580 c!37403) b!225578))

(assert (= (and b!225580 (not c!37403)) b!225592))

(assert (= (and b!225578 res!111031) b!225599))

(assert (= (and b!225599 res!111024) b!225600))

(assert (= (and b!225592 c!37402) b!225587))

(assert (= (and b!225592 (not c!37402)) b!225596))

(assert (= (and b!225587 res!111019) b!225582))

(assert (= (and b!225582 res!111021) b!225583))

(assert (= (or b!225578 b!225587) bm!20984))

(assert (= (or b!225600 b!225583) bm!20985))

(assert (= (and b!225590 res!111020) b!225591))

(assert (= (and b!225591 c!37404) b!225577))

(assert (= (and b!225591 (not c!37404)) b!225584))

(assert (= (and b!225591 (not res!111026)) b!225595))

(assert (= (and b!225595 (not res!111027)) b!225586))

(assert (= (and b!225586 (not res!111030)) b!225601))

(assert (= (and b!225601 (not res!111023)) b!225588))

(assert (= (and b!225588 (not res!111029)) b!225589))

(assert (= (and b!225585 condMapEmpty!10039) mapIsEmpty!10039))

(assert (= (and b!225585 (not condMapEmpty!10039)) mapNonEmpty!10039))

(assert (= (and mapNonEmpty!10039 ((_ is ValueCellFull!2613) mapValue!10039)) b!225594))

(assert (= (and b!225585 ((_ is ValueCellFull!2613) mapDefault!10039)) b!225593))

(assert (= b!225581 b!225585))

(assert (= start!21984 b!225581))

(declare-fun m!248149 () Bool)

(assert (=> b!225580 m!248149))

(declare-fun m!248151 () Bool)

(assert (=> b!225588 m!248151))

(declare-fun m!248153 () Bool)

(assert (=> bm!20985 m!248153))

(declare-fun m!248155 () Bool)

(assert (=> b!225577 m!248155))

(declare-fun m!248157 () Bool)

(assert (=> b!225599 m!248157))

(declare-fun m!248159 () Bool)

(assert (=> b!225586 m!248159))

(declare-fun m!248161 () Bool)

(assert (=> b!225582 m!248161))

(declare-fun m!248163 () Bool)

(assert (=> b!225589 m!248163))

(declare-fun m!248165 () Bool)

(assert (=> b!225579 m!248165))

(declare-fun m!248167 () Bool)

(assert (=> start!21984 m!248167))

(declare-fun m!248169 () Bool)

(assert (=> b!225591 m!248169))

(assert (=> b!225591 m!248153))

(declare-fun m!248171 () Bool)

(assert (=> b!225591 m!248171))

(declare-fun m!248173 () Bool)

(assert (=> b!225591 m!248173))

(declare-fun m!248175 () Bool)

(assert (=> b!225591 m!248175))

(declare-fun m!248177 () Bool)

(assert (=> b!225591 m!248177))

(declare-fun m!248179 () Bool)

(assert (=> b!225591 m!248179))

(declare-fun m!248181 () Bool)

(assert (=> b!225591 m!248181))

(declare-fun m!248183 () Bool)

(assert (=> mapNonEmpty!10039 m!248183))

(declare-fun m!248185 () Bool)

(assert (=> b!225581 m!248185))

(declare-fun m!248187 () Bool)

(assert (=> b!225581 m!248187))

(declare-fun m!248189 () Bool)

(assert (=> bm!20984 m!248189))

(declare-fun m!248191 () Bool)

(assert (=> b!225598 m!248191))

(declare-fun m!248193 () Bool)

(assert (=> b!225590 m!248193))

(declare-fun m!248195 () Bool)

(assert (=> b!225590 m!248195))

(assert (=> b!225590 m!248195))

(declare-fun m!248197 () Bool)

(assert (=> b!225590 m!248197))

(check-sat (not b!225579) (not bm!20985) tp_is_empty!5913 (not b!225590) (not b!225581) (not b!225598) (not b_next!6051) (not b!225580) (not b!225577) (not b!225591) (not bm!20984) b_and!12949 (not b!225588) (not b!225586) (not mapNonEmpty!10039) (not start!21984) (not b!225589))
(check-sat b_and!12949 (not b_next!6051))
