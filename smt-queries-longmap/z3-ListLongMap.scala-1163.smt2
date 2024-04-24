; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24562 () Bool)

(assert start!24562)

(declare-fun b!257142 () Bool)

(declare-fun b_free!6727 () Bool)

(declare-fun b_next!6727 () Bool)

(assert (=> b!257142 (= b_free!6727 (not b_next!6727))))

(declare-fun tp!23486 () Bool)

(declare-fun b_and!13807 () Bool)

(assert (=> b!257142 (= tp!23486 b_and!13807)))

(declare-fun mapIsEmpty!11217 () Bool)

(declare-fun mapRes!11217 () Bool)

(assert (=> mapIsEmpty!11217 mapRes!11217))

(declare-fun b!257138 () Bool)

(declare-datatypes ((Unit!7955 0))(
  ( (Unit!7956) )
))
(declare-fun e!166676 () Unit!7955)

(declare-fun Unit!7957 () Unit!7955)

(assert (=> b!257138 (= e!166676 Unit!7957)))

(declare-fun b!257139 () Bool)

(declare-fun e!166679 () Bool)

(declare-fun tp_is_empty!6589 () Bool)

(assert (=> b!257139 (= e!166679 tp_is_empty!6589)))

(declare-fun b!257140 () Bool)

(declare-fun c!43500 () Bool)

(declare-datatypes ((SeekEntryResult!1135 0))(
  ( (MissingZero!1135 (index!6710 (_ BitVec 32))) (Found!1135 (index!6711 (_ BitVec 32))) (Intermediate!1135 (undefined!1947 Bool) (index!6712 (_ BitVec 32)) (x!24967 (_ BitVec 32))) (Undefined!1135) (MissingVacant!1135 (index!6713 (_ BitVec 32))) )
))
(declare-fun lt!129252 () SeekEntryResult!1135)

(get-info :version)

(assert (=> b!257140 (= c!43500 ((_ is MissingVacant!1135) lt!129252))))

(declare-fun e!166681 () Bool)

(declare-fun e!166685 () Bool)

(assert (=> b!257140 (= e!166681 e!166685)))

(declare-fun b!257141 () Bool)

(assert (=> b!257141 (= e!166685 ((_ is Undefined!1135) lt!129252))))

(declare-fun e!166680 () Bool)

(declare-datatypes ((V!8433 0))(
  ( (V!8434 (val!3339 Int)) )
))
(declare-datatypes ((ValueCell!2951 0))(
  ( (ValueCellFull!2951 (v!5432 V!8433)) (EmptyCell!2951) )
))
(declare-datatypes ((array!12519 0))(
  ( (array!12520 (arr!5929 (Array (_ BitVec 32) ValueCell!2951)) (size!6276 (_ BitVec 32))) )
))
(declare-datatypes ((array!12521 0))(
  ( (array!12522 (arr!5930 (Array (_ BitVec 32) (_ BitVec 64))) (size!6277 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3802 0))(
  ( (LongMapFixedSize!3803 (defaultEntry!4744 Int) (mask!11028 (_ BitVec 32)) (extraKeys!4481 (_ BitVec 32)) (zeroValue!4585 V!8433) (minValue!4585 V!8433) (_size!1950 (_ BitVec 32)) (_keys!6910 array!12521) (_values!4727 array!12519) (_vacant!1950 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3802)

(declare-fun e!166672 () Bool)

(declare-fun array_inv!3901 (array!12521) Bool)

(declare-fun array_inv!3902 (array!12519) Bool)

(assert (=> b!257142 (= e!166672 (and tp!23486 tp_is_empty!6589 (array_inv!3901 (_keys!6910 thiss!1504)) (array_inv!3902 (_values!4727 thiss!1504)) e!166680))))

(declare-fun b!257143 () Bool)

(declare-fun e!166684 () Unit!7955)

(declare-fun Unit!7958 () Unit!7955)

(assert (=> b!257143 (= e!166684 Unit!7958)))

(declare-fun lt!129251 () Unit!7955)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!427 (array!12521 array!12519 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) Int) Unit!7955)

(assert (=> b!257143 (= lt!129251 (lemmaInListMapThenSeekEntryOrOpenFindsIt!427 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)))))

(assert (=> b!257143 false))

(declare-fun b!257144 () Bool)

(declare-fun e!166673 () Bool)

(declare-fun e!166682 () Bool)

(assert (=> b!257144 (= e!166673 e!166682)))

(declare-fun res!125786 () Bool)

(assert (=> b!257144 (=> (not res!125786) (not e!166682))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!257144 (= res!125786 (or (= lt!129252 (MissingZero!1135 index!297)) (= lt!129252 (MissingVacant!1135 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12521 (_ BitVec 32)) SeekEntryResult!1135)

(assert (=> b!257144 (= lt!129252 (seekEntryOrOpen!0 key!932 (_keys!6910 thiss!1504) (mask!11028 thiss!1504)))))

(declare-fun b!257145 () Bool)

(declare-fun res!125788 () Bool)

(assert (=> b!257145 (=> (not res!125788) (not e!166673))))

(assert (=> b!257145 (= res!125788 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!125785 () Bool)

(assert (=> start!24562 (=> (not res!125785) (not e!166673))))

(declare-fun valid!1492 (LongMapFixedSize!3802) Bool)

(assert (=> start!24562 (= res!125785 (valid!1492 thiss!1504))))

(assert (=> start!24562 e!166673))

(assert (=> start!24562 e!166672))

(assert (=> start!24562 true))

(assert (=> start!24562 tp_is_empty!6589))

(declare-fun b!257146 () Bool)

(declare-fun Unit!7959 () Unit!7955)

(assert (=> b!257146 (= e!166676 Unit!7959)))

(declare-fun lt!129246 () Unit!7955)

(declare-fun lemmaArrayContainsKeyThenInListMap!244 (array!12521 array!12519 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) (_ BitVec 32) Int) Unit!7955)

(assert (=> b!257146 (= lt!129246 (lemmaArrayContainsKeyThenInListMap!244 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(assert (=> b!257146 false))

(declare-fun b!257147 () Bool)

(declare-fun lt!129248 () Unit!7955)

(assert (=> b!257147 (= e!166684 lt!129248)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!420 (array!12521 array!12519 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) Int) Unit!7955)

(assert (=> b!257147 (= lt!129248 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!420 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)))))

(declare-fun c!43501 () Bool)

(assert (=> b!257147 (= c!43501 ((_ is MissingZero!1135) lt!129252))))

(assert (=> b!257147 e!166681))

(declare-fun b!257148 () Bool)

(declare-fun res!125787 () Bool)

(assert (=> b!257148 (= res!125787 (= (select (arr!5930 (_keys!6910 thiss!1504)) (index!6713 lt!129252)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166678 () Bool)

(assert (=> b!257148 (=> (not res!125787) (not e!166678))))

(declare-fun mapNonEmpty!11217 () Bool)

(declare-fun tp!23487 () Bool)

(declare-fun e!166677 () Bool)

(assert (=> mapNonEmpty!11217 (= mapRes!11217 (and tp!23487 e!166677))))

(declare-fun mapRest!11217 () (Array (_ BitVec 32) ValueCell!2951))

(declare-fun mapValue!11217 () ValueCell!2951)

(declare-fun mapKey!11217 () (_ BitVec 32))

(assert (=> mapNonEmpty!11217 (= (arr!5929 (_values!4727 thiss!1504)) (store mapRest!11217 mapKey!11217 mapValue!11217))))

(declare-fun bm!24375 () Bool)

(declare-fun call!24379 () Bool)

(declare-fun arrayContainsKey!0 (array!12521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24375 (= call!24379 (arrayContainsKey!0 (_keys!6910 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257149 () Bool)

(declare-fun res!125791 () Bool)

(declare-fun e!166675 () Bool)

(assert (=> b!257149 (=> (not res!125791) (not e!166675))))

(declare-fun call!24378 () Bool)

(assert (=> b!257149 (= res!125791 call!24378)))

(assert (=> b!257149 (= e!166681 e!166675)))

(declare-fun b!257150 () Bool)

(assert (=> b!257150 (= e!166675 (not call!24379))))

(declare-fun b!257151 () Bool)

(assert (=> b!257151 (= e!166677 tp_is_empty!6589)))

(declare-fun bm!24376 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24376 (= call!24378 (inRange!0 (ite c!43501 (index!6710 lt!129252) (index!6713 lt!129252)) (mask!11028 thiss!1504)))))

(declare-fun b!257152 () Bool)

(assert (=> b!257152 (= e!166680 (and e!166679 mapRes!11217))))

(declare-fun condMapEmpty!11217 () Bool)

(declare-fun mapDefault!11217 () ValueCell!2951)

(assert (=> b!257152 (= condMapEmpty!11217 (= (arr!5929 (_values!4727 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2951)) mapDefault!11217)))))

(declare-fun b!257153 () Bool)

(declare-fun e!166674 () Bool)

(assert (=> b!257153 (= e!166674 (not (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6276 (_values!4727 thiss!1504))))))))

(declare-fun lt!129254 () array!12521)

(declare-fun arrayCountValidKeys!0 (array!12521 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!257153 (= (arrayCountValidKeys!0 lt!129254 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!129259 () Unit!7955)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12521 (_ BitVec 32)) Unit!7955)

(assert (=> b!257153 (= lt!129259 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129254 index!297))))

(assert (=> b!257153 (arrayContainsKey!0 lt!129254 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129257 () Unit!7955)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12521 (_ BitVec 64) (_ BitVec 32)) Unit!7955)

(assert (=> b!257153 (= lt!129257 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129254 key!932 index!297))))

(declare-datatypes ((tuple2!4834 0))(
  ( (tuple2!4835 (_1!2428 (_ BitVec 64)) (_2!2428 V!8433)) )
))
(declare-datatypes ((List!3712 0))(
  ( (Nil!3709) (Cons!3708 (h!4370 tuple2!4834) (t!8763 List!3712)) )
))
(declare-datatypes ((ListLongMap!3749 0))(
  ( (ListLongMap!3750 (toList!1890 List!3712)) )
))
(declare-fun lt!129255 () ListLongMap!3749)

(declare-fun v!346 () V!8433)

(declare-fun +!687 (ListLongMap!3749 tuple2!4834) ListLongMap!3749)

(declare-fun getCurrentListMap!1422 (array!12521 array!12519 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 32) Int) ListLongMap!3749)

(assert (=> b!257153 (= (+!687 lt!129255 (tuple2!4835 key!932 v!346)) (getCurrentListMap!1422 lt!129254 (array!12520 (store (arr!5929 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6276 (_values!4727 thiss!1504))) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129250 () Unit!7955)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!102 (array!12521 array!12519 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 32) (_ BitVec 64) V!8433 Int) Unit!7955)

(assert (=> b!257153 (= lt!129250 (lemmaAddValidKeyToArrayThenAddPairToListMap!102 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) index!297 key!932 v!346 (defaultEntry!4744 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12521 (_ BitVec 32)) Bool)

(assert (=> b!257153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129254 (mask!11028 thiss!1504))))

(declare-fun lt!129256 () Unit!7955)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12521 (_ BitVec 32) (_ BitVec 32)) Unit!7955)

(assert (=> b!257153 (= lt!129256 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6910 thiss!1504) index!297 (mask!11028 thiss!1504)))))

(assert (=> b!257153 (= (arrayCountValidKeys!0 lt!129254 #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6910 thiss!1504) #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504)))))))

(declare-fun lt!129258 () Unit!7955)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12521 (_ BitVec 32) (_ BitVec 64)) Unit!7955)

(assert (=> b!257153 (= lt!129258 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6910 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3713 0))(
  ( (Nil!3710) (Cons!3709 (h!4371 (_ BitVec 64)) (t!8764 List!3713)) )
))
(declare-fun arrayNoDuplicates!0 (array!12521 (_ BitVec 32) List!3713) Bool)

(assert (=> b!257153 (arrayNoDuplicates!0 lt!129254 #b00000000000000000000000000000000 Nil!3710)))

(assert (=> b!257153 (= lt!129254 (array!12522 (store (arr!5930 (_keys!6910 thiss!1504)) index!297 key!932) (size!6277 (_keys!6910 thiss!1504))))))

(declare-fun lt!129249 () Unit!7955)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12521 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3713) Unit!7955)

(assert (=> b!257153 (= lt!129249 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6910 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3710))))

(declare-fun lt!129253 () Unit!7955)

(assert (=> b!257153 (= lt!129253 e!166676)))

(declare-fun c!43503 () Bool)

(assert (=> b!257153 (= c!43503 (arrayContainsKey!0 (_keys!6910 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257154 () Bool)

(declare-fun res!125790 () Bool)

(assert (=> b!257154 (=> (not res!125790) (not e!166675))))

(assert (=> b!257154 (= res!125790 (= (select (arr!5930 (_keys!6910 thiss!1504)) (index!6710 lt!129252)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257155 () Bool)

(assert (=> b!257155 (= e!166682 e!166674)))

(declare-fun res!125789 () Bool)

(assert (=> b!257155 (=> (not res!125789) (not e!166674))))

(assert (=> b!257155 (= res!125789 (inRange!0 index!297 (mask!11028 thiss!1504)))))

(declare-fun lt!129247 () Unit!7955)

(assert (=> b!257155 (= lt!129247 e!166684)))

(declare-fun c!43502 () Bool)

(declare-fun contains!1847 (ListLongMap!3749 (_ BitVec 64)) Bool)

(assert (=> b!257155 (= c!43502 (contains!1847 lt!129255 key!932))))

(assert (=> b!257155 (= lt!129255 (getCurrentListMap!1422 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun b!257156 () Bool)

(assert (=> b!257156 (= e!166678 (not call!24379))))

(declare-fun b!257157 () Bool)

(assert (=> b!257157 (= e!166685 e!166678)))

(declare-fun res!125784 () Bool)

(assert (=> b!257157 (= res!125784 call!24378)))

(assert (=> b!257157 (=> (not res!125784) (not e!166678))))

(assert (= (and start!24562 res!125785) b!257145))

(assert (= (and b!257145 res!125788) b!257144))

(assert (= (and b!257144 res!125786) b!257155))

(assert (= (and b!257155 c!43502) b!257143))

(assert (= (and b!257155 (not c!43502)) b!257147))

(assert (= (and b!257147 c!43501) b!257149))

(assert (= (and b!257147 (not c!43501)) b!257140))

(assert (= (and b!257149 res!125791) b!257154))

(assert (= (and b!257154 res!125790) b!257150))

(assert (= (and b!257140 c!43500) b!257157))

(assert (= (and b!257140 (not c!43500)) b!257141))

(assert (= (and b!257157 res!125784) b!257148))

(assert (= (and b!257148 res!125787) b!257156))

(assert (= (or b!257149 b!257157) bm!24376))

(assert (= (or b!257150 b!257156) bm!24375))

(assert (= (and b!257155 res!125789) b!257153))

(assert (= (and b!257153 c!43503) b!257146))

(assert (= (and b!257153 (not c!43503)) b!257138))

(assert (= (and b!257152 condMapEmpty!11217) mapIsEmpty!11217))

(assert (= (and b!257152 (not condMapEmpty!11217)) mapNonEmpty!11217))

(assert (= (and mapNonEmpty!11217 ((_ is ValueCellFull!2951) mapValue!11217)) b!257151))

(assert (= (and b!257152 ((_ is ValueCellFull!2951) mapDefault!11217)) b!257139))

(assert (= b!257142 b!257152))

(assert (= start!24562 b!257142))

(declare-fun m!272597 () Bool)

(assert (=> b!257154 m!272597))

(declare-fun m!272599 () Bool)

(assert (=> bm!24375 m!272599))

(declare-fun m!272601 () Bool)

(assert (=> b!257155 m!272601))

(declare-fun m!272603 () Bool)

(assert (=> b!257155 m!272603))

(declare-fun m!272605 () Bool)

(assert (=> b!257155 m!272605))

(declare-fun m!272607 () Bool)

(assert (=> b!257142 m!272607))

(declare-fun m!272609 () Bool)

(assert (=> b!257142 m!272609))

(declare-fun m!272611 () Bool)

(assert (=> start!24562 m!272611))

(declare-fun m!272613 () Bool)

(assert (=> b!257148 m!272613))

(declare-fun m!272615 () Bool)

(assert (=> b!257153 m!272615))

(declare-fun m!272617 () Bool)

(assert (=> b!257153 m!272617))

(declare-fun m!272619 () Bool)

(assert (=> b!257153 m!272619))

(declare-fun m!272621 () Bool)

(assert (=> b!257153 m!272621))

(declare-fun m!272623 () Bool)

(assert (=> b!257153 m!272623))

(declare-fun m!272625 () Bool)

(assert (=> b!257153 m!272625))

(declare-fun m!272627 () Bool)

(assert (=> b!257153 m!272627))

(declare-fun m!272629 () Bool)

(assert (=> b!257153 m!272629))

(assert (=> b!257153 m!272599))

(declare-fun m!272631 () Bool)

(assert (=> b!257153 m!272631))

(declare-fun m!272633 () Bool)

(assert (=> b!257153 m!272633))

(declare-fun m!272635 () Bool)

(assert (=> b!257153 m!272635))

(declare-fun m!272637 () Bool)

(assert (=> b!257153 m!272637))

(declare-fun m!272639 () Bool)

(assert (=> b!257153 m!272639))

(declare-fun m!272641 () Bool)

(assert (=> b!257153 m!272641))

(declare-fun m!272643 () Bool)

(assert (=> b!257153 m!272643))

(declare-fun m!272645 () Bool)

(assert (=> b!257153 m!272645))

(declare-fun m!272647 () Bool)

(assert (=> b!257146 m!272647))

(declare-fun m!272649 () Bool)

(assert (=> bm!24376 m!272649))

(declare-fun m!272651 () Bool)

(assert (=> b!257144 m!272651))

(declare-fun m!272653 () Bool)

(assert (=> mapNonEmpty!11217 m!272653))

(declare-fun m!272655 () Bool)

(assert (=> b!257143 m!272655))

(declare-fun m!272657 () Bool)

(assert (=> b!257147 m!272657))

(check-sat b_and!13807 (not start!24562) (not b!257143) (not b!257147) (not b!257155) (not b_next!6727) (not mapNonEmpty!11217) (not bm!24375) (not bm!24376) (not b!257142) (not b!257144) (not b!257146) (not b!257153) tp_is_empty!6589)
(check-sat b_and!13807 (not b_next!6727))
(get-model)

(declare-fun d!61843 () Bool)

(assert (=> d!61843 (contains!1847 (getCurrentListMap!1422 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)) key!932)))

(declare-fun lt!129346 () Unit!7955)

(declare-fun choose!1243 (array!12521 array!12519 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) (_ BitVec 32) Int) Unit!7955)

(assert (=> d!61843 (= lt!129346 (choose!1243 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61843 (validMask!0 (mask!11028 thiss!1504))))

(assert (=> d!61843 (= (lemmaArrayContainsKeyThenInListMap!244 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)) lt!129346)))

(declare-fun bs!9099 () Bool)

(assert (= bs!9099 d!61843))

(assert (=> bs!9099 m!272605))

(assert (=> bs!9099 m!272605))

(declare-fun m!272783 () Bool)

(assert (=> bs!9099 m!272783))

(declare-fun m!272785 () Bool)

(assert (=> bs!9099 m!272785))

(declare-fun m!272787 () Bool)

(assert (=> bs!9099 m!272787))

(assert (=> b!257146 d!61843))

(declare-fun d!61845 () Bool)

(assert (=> d!61845 (= (inRange!0 index!297 (mask!11028 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11028 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!257155 d!61845))

(declare-fun d!61847 () Bool)

(declare-fun e!166774 () Bool)

(assert (=> d!61847 e!166774))

(declare-fun res!125842 () Bool)

(assert (=> d!61847 (=> res!125842 e!166774)))

(declare-fun lt!129357 () Bool)

(assert (=> d!61847 (= res!125842 (not lt!129357))))

(declare-fun lt!129355 () Bool)

(assert (=> d!61847 (= lt!129357 lt!129355)))

(declare-fun lt!129356 () Unit!7955)

(declare-fun e!166775 () Unit!7955)

(assert (=> d!61847 (= lt!129356 e!166775)))

(declare-fun c!43530 () Bool)

(assert (=> d!61847 (= c!43530 lt!129355)))

(declare-fun containsKey!303 (List!3712 (_ BitVec 64)) Bool)

(assert (=> d!61847 (= lt!129355 (containsKey!303 (toList!1890 lt!129255) key!932))))

(assert (=> d!61847 (= (contains!1847 lt!129255 key!932) lt!129357)))

(declare-fun b!257284 () Bool)

(declare-fun lt!129358 () Unit!7955)

(assert (=> b!257284 (= e!166775 lt!129358)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!251 (List!3712 (_ BitVec 64)) Unit!7955)

(assert (=> b!257284 (= lt!129358 (lemmaContainsKeyImpliesGetValueByKeyDefined!251 (toList!1890 lt!129255) key!932))))

(declare-datatypes ((Option!318 0))(
  ( (Some!317 (v!5437 V!8433)) (None!316) )
))
(declare-fun isDefined!252 (Option!318) Bool)

(declare-fun getValueByKey!312 (List!3712 (_ BitVec 64)) Option!318)

(assert (=> b!257284 (isDefined!252 (getValueByKey!312 (toList!1890 lt!129255) key!932))))

(declare-fun b!257285 () Bool)

(declare-fun Unit!7968 () Unit!7955)

(assert (=> b!257285 (= e!166775 Unit!7968)))

(declare-fun b!257286 () Bool)

(assert (=> b!257286 (= e!166774 (isDefined!252 (getValueByKey!312 (toList!1890 lt!129255) key!932)))))

(assert (= (and d!61847 c!43530) b!257284))

(assert (= (and d!61847 (not c!43530)) b!257285))

(assert (= (and d!61847 (not res!125842)) b!257286))

(declare-fun m!272789 () Bool)

(assert (=> d!61847 m!272789))

(declare-fun m!272791 () Bool)

(assert (=> b!257284 m!272791))

(declare-fun m!272793 () Bool)

(assert (=> b!257284 m!272793))

(assert (=> b!257284 m!272793))

(declare-fun m!272795 () Bool)

(assert (=> b!257284 m!272795))

(assert (=> b!257286 m!272793))

(assert (=> b!257286 m!272793))

(assert (=> b!257286 m!272795))

(assert (=> b!257155 d!61847))

(declare-fun bm!24403 () Bool)

(declare-fun call!24406 () Bool)

(declare-fun lt!129424 () ListLongMap!3749)

(assert (=> bm!24403 (= call!24406 (contains!1847 lt!129424 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257329 () Bool)

(declare-fun e!166805 () Unit!7955)

(declare-fun Unit!7969 () Unit!7955)

(assert (=> b!257329 (= e!166805 Unit!7969)))

(declare-fun bm!24404 () Bool)

(declare-fun call!24407 () Bool)

(assert (=> bm!24404 (= call!24407 (contains!1847 lt!129424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257331 () Bool)

(declare-fun e!166809 () Bool)

(declare-fun e!166806 () Bool)

(assert (=> b!257331 (= e!166809 e!166806)))

(declare-fun res!125867 () Bool)

(assert (=> b!257331 (= res!125867 call!24407)))

(assert (=> b!257331 (=> (not res!125867) (not e!166806))))

(declare-fun b!257332 () Bool)

(declare-fun e!166812 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!257332 (= e!166812 (validKeyInArray!0 (select (arr!5930 (_keys!6910 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!257333 () Bool)

(declare-fun e!166804 () Bool)

(assert (=> b!257333 (= e!166804 (validKeyInArray!0 (select (arr!5930 (_keys!6910 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!257334 () Bool)

(declare-fun e!166807 () ListLongMap!3749)

(declare-fun call!24409 () ListLongMap!3749)

(assert (=> b!257334 (= e!166807 call!24409)))

(declare-fun b!257335 () Bool)

(declare-fun e!166811 () ListLongMap!3749)

(assert (=> b!257335 (= e!166811 call!24409)))

(declare-fun c!43545 () Bool)

(declare-fun c!43548 () Bool)

(declare-fun call!24410 () ListLongMap!3749)

(declare-fun call!24412 () ListLongMap!3749)

(declare-fun call!24408 () ListLongMap!3749)

(declare-fun call!24411 () ListLongMap!3749)

(declare-fun bm!24405 () Bool)

(assert (=> bm!24405 (= call!24410 (+!687 (ite c!43545 call!24412 (ite c!43548 call!24408 call!24411)) (ite (or c!43545 c!43548) (tuple2!4835 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4585 thiss!1504)) (tuple2!4835 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4585 thiss!1504)))))))

(declare-fun b!257336 () Bool)

(declare-fun e!166808 () Bool)

(declare-fun e!166810 () Bool)

(assert (=> b!257336 (= e!166808 e!166810)))

(declare-fun res!125861 () Bool)

(assert (=> b!257336 (=> (not res!125861) (not e!166810))))

(assert (=> b!257336 (= res!125861 (contains!1847 lt!129424 (select (arr!5930 (_keys!6910 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!257336 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))))))

(declare-fun d!61849 () Bool)

(declare-fun e!166802 () Bool)

(assert (=> d!61849 e!166802))

(declare-fun res!125865 () Bool)

(assert (=> d!61849 (=> (not res!125865) (not e!166802))))

(assert (=> d!61849 (= res!125865 (or (bvsge #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))))))))

(declare-fun lt!129408 () ListLongMap!3749)

(assert (=> d!61849 (= lt!129424 lt!129408)))

(declare-fun lt!129420 () Unit!7955)

(assert (=> d!61849 (= lt!129420 e!166805)))

(declare-fun c!43544 () Bool)

(assert (=> d!61849 (= c!43544 e!166804)))

(declare-fun res!125869 () Bool)

(assert (=> d!61849 (=> (not res!125869) (not e!166804))))

(assert (=> d!61849 (= res!125869 (bvslt #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))))))

(declare-fun e!166814 () ListLongMap!3749)

(assert (=> d!61849 (= lt!129408 e!166814)))

(assert (=> d!61849 (= c!43545 (and (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61849 (validMask!0 (mask!11028 thiss!1504))))

(assert (=> d!61849 (= (getCurrentListMap!1422 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)) lt!129424)))

(declare-fun b!257330 () Bool)

(assert (=> b!257330 (= e!166807 call!24411)))

(declare-fun bm!24406 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!569 (array!12521 array!12519 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 32) Int) ListLongMap!3749)

(assert (=> bm!24406 (= call!24412 (getCurrentListMapNoExtraKeys!569 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun b!257337 () Bool)

(assert (=> b!257337 (= e!166809 (not call!24407))))

(declare-fun bm!24407 () Bool)

(assert (=> bm!24407 (= call!24411 call!24408)))

(declare-fun b!257338 () Bool)

(assert (=> b!257338 (= e!166814 e!166811)))

(assert (=> b!257338 (= c!43548 (and (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257339 () Bool)

(declare-fun apply!253 (ListLongMap!3749 (_ BitVec 64)) V!8433)

(declare-fun get!3056 (ValueCell!2951 V!8433) V!8433)

(declare-fun dynLambda!596 (Int (_ BitVec 64)) V!8433)

(assert (=> b!257339 (= e!166810 (= (apply!253 lt!129424 (select (arr!5930 (_keys!6910 thiss!1504)) #b00000000000000000000000000000000)) (get!3056 (select (arr!5929 (_values!4727 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4744 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257339 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6276 (_values!4727 thiss!1504))))))

(assert (=> b!257339 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))))))

(declare-fun b!257340 () Bool)

(assert (=> b!257340 (= e!166814 (+!687 call!24410 (tuple2!4835 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4585 thiss!1504))))))

(declare-fun b!257341 () Bool)

(assert (=> b!257341 (= e!166806 (= (apply!253 lt!129424 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4585 thiss!1504)))))

(declare-fun b!257342 () Bool)

(declare-fun e!166803 () Bool)

(assert (=> b!257342 (= e!166803 (= (apply!253 lt!129424 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4585 thiss!1504)))))

(declare-fun b!257343 () Bool)

(declare-fun lt!129414 () Unit!7955)

(assert (=> b!257343 (= e!166805 lt!129414)))

(declare-fun lt!129406 () ListLongMap!3749)

(assert (=> b!257343 (= lt!129406 (getCurrentListMapNoExtraKeys!569 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129413 () (_ BitVec 64))

(assert (=> b!257343 (= lt!129413 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129421 () (_ BitVec 64))

(assert (=> b!257343 (= lt!129421 (select (arr!5930 (_keys!6910 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129411 () Unit!7955)

(declare-fun addStillContains!229 (ListLongMap!3749 (_ BitVec 64) V!8433 (_ BitVec 64)) Unit!7955)

(assert (=> b!257343 (= lt!129411 (addStillContains!229 lt!129406 lt!129413 (zeroValue!4585 thiss!1504) lt!129421))))

(assert (=> b!257343 (contains!1847 (+!687 lt!129406 (tuple2!4835 lt!129413 (zeroValue!4585 thiss!1504))) lt!129421)))

(declare-fun lt!129410 () Unit!7955)

(assert (=> b!257343 (= lt!129410 lt!129411)))

(declare-fun lt!129423 () ListLongMap!3749)

(assert (=> b!257343 (= lt!129423 (getCurrentListMapNoExtraKeys!569 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129407 () (_ BitVec 64))

(assert (=> b!257343 (= lt!129407 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129417 () (_ BitVec 64))

(assert (=> b!257343 (= lt!129417 (select (arr!5930 (_keys!6910 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129403 () Unit!7955)

(declare-fun addApplyDifferent!229 (ListLongMap!3749 (_ BitVec 64) V!8433 (_ BitVec 64)) Unit!7955)

(assert (=> b!257343 (= lt!129403 (addApplyDifferent!229 lt!129423 lt!129407 (minValue!4585 thiss!1504) lt!129417))))

(assert (=> b!257343 (= (apply!253 (+!687 lt!129423 (tuple2!4835 lt!129407 (minValue!4585 thiss!1504))) lt!129417) (apply!253 lt!129423 lt!129417))))

(declare-fun lt!129418 () Unit!7955)

(assert (=> b!257343 (= lt!129418 lt!129403)))

(declare-fun lt!129409 () ListLongMap!3749)

(assert (=> b!257343 (= lt!129409 (getCurrentListMapNoExtraKeys!569 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129419 () (_ BitVec 64))

(assert (=> b!257343 (= lt!129419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129415 () (_ BitVec 64))

(assert (=> b!257343 (= lt!129415 (select (arr!5930 (_keys!6910 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129405 () Unit!7955)

(assert (=> b!257343 (= lt!129405 (addApplyDifferent!229 lt!129409 lt!129419 (zeroValue!4585 thiss!1504) lt!129415))))

(assert (=> b!257343 (= (apply!253 (+!687 lt!129409 (tuple2!4835 lt!129419 (zeroValue!4585 thiss!1504))) lt!129415) (apply!253 lt!129409 lt!129415))))

(declare-fun lt!129404 () Unit!7955)

(assert (=> b!257343 (= lt!129404 lt!129405)))

(declare-fun lt!129412 () ListLongMap!3749)

(assert (=> b!257343 (= lt!129412 (getCurrentListMapNoExtraKeys!569 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129422 () (_ BitVec 64))

(assert (=> b!257343 (= lt!129422 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129416 () (_ BitVec 64))

(assert (=> b!257343 (= lt!129416 (select (arr!5930 (_keys!6910 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257343 (= lt!129414 (addApplyDifferent!229 lt!129412 lt!129422 (minValue!4585 thiss!1504) lt!129416))))

(assert (=> b!257343 (= (apply!253 (+!687 lt!129412 (tuple2!4835 lt!129422 (minValue!4585 thiss!1504))) lt!129416) (apply!253 lt!129412 lt!129416))))

(declare-fun b!257344 () Bool)

(declare-fun res!125862 () Bool)

(assert (=> b!257344 (=> (not res!125862) (not e!166802))))

(assert (=> b!257344 (= res!125862 e!166808)))

(declare-fun res!125863 () Bool)

(assert (=> b!257344 (=> res!125863 e!166808)))

(assert (=> b!257344 (= res!125863 (not e!166812))))

(declare-fun res!125864 () Bool)

(assert (=> b!257344 (=> (not res!125864) (not e!166812))))

(assert (=> b!257344 (= res!125864 (bvslt #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))))))

(declare-fun bm!24408 () Bool)

(assert (=> bm!24408 (= call!24408 call!24412)))

(declare-fun b!257345 () Bool)

(declare-fun e!166813 () Bool)

(assert (=> b!257345 (= e!166802 e!166813)))

(declare-fun c!43543 () Bool)

(assert (=> b!257345 (= c!43543 (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24409 () Bool)

(assert (=> bm!24409 (= call!24409 call!24410)))

(declare-fun b!257346 () Bool)

(assert (=> b!257346 (= e!166813 (not call!24406))))

(declare-fun b!257347 () Bool)

(declare-fun res!125868 () Bool)

(assert (=> b!257347 (=> (not res!125868) (not e!166802))))

(assert (=> b!257347 (= res!125868 e!166809)))

(declare-fun c!43546 () Bool)

(assert (=> b!257347 (= c!43546 (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!257348 () Bool)

(declare-fun c!43547 () Bool)

(assert (=> b!257348 (= c!43547 (and (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!257348 (= e!166811 e!166807)))

(declare-fun b!257349 () Bool)

(assert (=> b!257349 (= e!166813 e!166803)))

(declare-fun res!125866 () Bool)

(assert (=> b!257349 (= res!125866 call!24406)))

(assert (=> b!257349 (=> (not res!125866) (not e!166803))))

(assert (= (and d!61849 c!43545) b!257340))

(assert (= (and d!61849 (not c!43545)) b!257338))

(assert (= (and b!257338 c!43548) b!257335))

(assert (= (and b!257338 (not c!43548)) b!257348))

(assert (= (and b!257348 c!43547) b!257334))

(assert (= (and b!257348 (not c!43547)) b!257330))

(assert (= (or b!257334 b!257330) bm!24407))

(assert (= (or b!257335 bm!24407) bm!24408))

(assert (= (or b!257335 b!257334) bm!24409))

(assert (= (or b!257340 bm!24408) bm!24406))

(assert (= (or b!257340 bm!24409) bm!24405))

(assert (= (and d!61849 res!125869) b!257333))

(assert (= (and d!61849 c!43544) b!257343))

(assert (= (and d!61849 (not c!43544)) b!257329))

(assert (= (and d!61849 res!125865) b!257344))

(assert (= (and b!257344 res!125864) b!257332))

(assert (= (and b!257344 (not res!125863)) b!257336))

(assert (= (and b!257336 res!125861) b!257339))

(assert (= (and b!257344 res!125862) b!257347))

(assert (= (and b!257347 c!43546) b!257331))

(assert (= (and b!257347 (not c!43546)) b!257337))

(assert (= (and b!257331 res!125867) b!257341))

(assert (= (or b!257331 b!257337) bm!24404))

(assert (= (and b!257347 res!125868) b!257345))

(assert (= (and b!257345 c!43543) b!257349))

(assert (= (and b!257345 (not c!43543)) b!257346))

(assert (= (and b!257349 res!125866) b!257342))

(assert (= (or b!257349 b!257346) bm!24403))

(declare-fun b_lambda!8201 () Bool)

(assert (=> (not b_lambda!8201) (not b!257339)))

(declare-fun t!8766 () Bool)

(declare-fun tb!3011 () Bool)

(assert (=> (and b!257142 (= (defaultEntry!4744 thiss!1504) (defaultEntry!4744 thiss!1504)) t!8766) tb!3011))

(declare-fun result!5371 () Bool)

(assert (=> tb!3011 (= result!5371 tp_is_empty!6589)))

(assert (=> b!257339 t!8766))

(declare-fun b_and!13813 () Bool)

(assert (= b_and!13807 (and (=> t!8766 result!5371) b_and!13813)))

(assert (=> d!61849 m!272787))

(declare-fun m!272797 () Bool)

(assert (=> bm!24404 m!272797))

(declare-fun m!272799 () Bool)

(assert (=> b!257340 m!272799))

(declare-fun m!272801 () Bool)

(assert (=> bm!24406 m!272801))

(declare-fun m!272803 () Bool)

(assert (=> b!257342 m!272803))

(declare-fun m!272805 () Bool)

(assert (=> b!257339 m!272805))

(assert (=> b!257339 m!272805))

(declare-fun m!272807 () Bool)

(assert (=> b!257339 m!272807))

(declare-fun m!272809 () Bool)

(assert (=> b!257339 m!272809))

(declare-fun m!272811 () Bool)

(assert (=> b!257339 m!272811))

(assert (=> b!257339 m!272811))

(declare-fun m!272813 () Bool)

(assert (=> b!257339 m!272813))

(assert (=> b!257339 m!272807))

(assert (=> b!257336 m!272811))

(assert (=> b!257336 m!272811))

(declare-fun m!272815 () Bool)

(assert (=> b!257336 m!272815))

(declare-fun m!272817 () Bool)

(assert (=> bm!24403 m!272817))

(declare-fun m!272819 () Bool)

(assert (=> bm!24405 m!272819))

(assert (=> b!257332 m!272811))

(assert (=> b!257332 m!272811))

(declare-fun m!272821 () Bool)

(assert (=> b!257332 m!272821))

(declare-fun m!272823 () Bool)

(assert (=> b!257341 m!272823))

(assert (=> b!257333 m!272811))

(assert (=> b!257333 m!272811))

(assert (=> b!257333 m!272821))

(declare-fun m!272825 () Bool)

(assert (=> b!257343 m!272825))

(declare-fun m!272827 () Bool)

(assert (=> b!257343 m!272827))

(declare-fun m!272829 () Bool)

(assert (=> b!257343 m!272829))

(declare-fun m!272831 () Bool)

(assert (=> b!257343 m!272831))

(declare-fun m!272833 () Bool)

(assert (=> b!257343 m!272833))

(declare-fun m!272835 () Bool)

(assert (=> b!257343 m!272835))

(assert (=> b!257343 m!272833))

(declare-fun m!272837 () Bool)

(assert (=> b!257343 m!272837))

(assert (=> b!257343 m!272825))

(declare-fun m!272839 () Bool)

(assert (=> b!257343 m!272839))

(declare-fun m!272841 () Bool)

(assert (=> b!257343 m!272841))

(declare-fun m!272843 () Bool)

(assert (=> b!257343 m!272843))

(declare-fun m!272845 () Bool)

(assert (=> b!257343 m!272845))

(declare-fun m!272847 () Bool)

(assert (=> b!257343 m!272847))

(assert (=> b!257343 m!272841))

(assert (=> b!257343 m!272811))

(assert (=> b!257343 m!272801))

(declare-fun m!272849 () Bool)

(assert (=> b!257343 m!272849))

(assert (=> b!257343 m!272829))

(declare-fun m!272851 () Bool)

(assert (=> b!257343 m!272851))

(declare-fun m!272853 () Bool)

(assert (=> b!257343 m!272853))

(assert (=> b!257155 d!61849))

(declare-fun d!61851 () Bool)

(assert (=> d!61851 (= (array_inv!3901 (_keys!6910 thiss!1504)) (bvsge (size!6277 (_keys!6910 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257142 d!61851))

(declare-fun d!61853 () Bool)

(assert (=> d!61853 (= (array_inv!3902 (_values!4727 thiss!1504)) (bvsge (size!6276 (_values!4727 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257142 d!61853))

(declare-fun b!257368 () Bool)

(declare-fun e!166826 () Bool)

(declare-fun lt!129429 () SeekEntryResult!1135)

(assert (=> b!257368 (= e!166826 ((_ is Undefined!1135) lt!129429))))

(declare-fun b!257369 () Bool)

(declare-fun e!166825 () Bool)

(declare-fun call!24417 () Bool)

(assert (=> b!257369 (= e!166825 (not call!24417))))

(declare-fun b!257370 () Bool)

(declare-fun e!166824 () Bool)

(assert (=> b!257370 (= e!166824 e!166825)))

(declare-fun res!125879 () Bool)

(declare-fun call!24418 () Bool)

(assert (=> b!257370 (= res!125879 call!24418)))

(assert (=> b!257370 (=> (not res!125879) (not e!166825))))

(declare-fun b!257371 () Bool)

(declare-fun e!166823 () Bool)

(assert (=> b!257371 (= e!166823 (not call!24417))))

(declare-fun c!43553 () Bool)

(declare-fun bm!24414 () Bool)

(assert (=> bm!24414 (= call!24418 (inRange!0 (ite c!43553 (index!6710 lt!129429) (index!6713 lt!129429)) (mask!11028 thiss!1504)))))

(declare-fun bm!24415 () Bool)

(assert (=> bm!24415 (= call!24417 (arrayContainsKey!0 (_keys!6910 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257372 () Bool)

(declare-fun res!125880 () Bool)

(assert (=> b!257372 (=> (not res!125880) (not e!166823))))

(assert (=> b!257372 (= res!125880 call!24418)))

(assert (=> b!257372 (= e!166826 e!166823)))

(declare-fun d!61855 () Bool)

(assert (=> d!61855 e!166824))

(assert (=> d!61855 (= c!43553 ((_ is MissingZero!1135) lt!129429))))

(assert (=> d!61855 (= lt!129429 (seekEntryOrOpen!0 key!932 (_keys!6910 thiss!1504) (mask!11028 thiss!1504)))))

(declare-fun lt!129430 () Unit!7955)

(declare-fun choose!1244 (array!12521 array!12519 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) Int) Unit!7955)

(assert (=> d!61855 (= lt!129430 (choose!1244 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)))))

(assert (=> d!61855 (validMask!0 (mask!11028 thiss!1504))))

(assert (=> d!61855 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!420 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)) lt!129430)))

(declare-fun b!257373 () Bool)

(assert (=> b!257373 (and (bvsge (index!6710 lt!129429) #b00000000000000000000000000000000) (bvslt (index!6710 lt!129429) (size!6277 (_keys!6910 thiss!1504))))))

(declare-fun res!125878 () Bool)

(assert (=> b!257373 (= res!125878 (= (select (arr!5930 (_keys!6910 thiss!1504)) (index!6710 lt!129429)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257373 (=> (not res!125878) (not e!166825))))

(declare-fun b!257374 () Bool)

(declare-fun res!125881 () Bool)

(assert (=> b!257374 (=> (not res!125881) (not e!166823))))

(assert (=> b!257374 (= res!125881 (= (select (arr!5930 (_keys!6910 thiss!1504)) (index!6713 lt!129429)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257374 (and (bvsge (index!6713 lt!129429) #b00000000000000000000000000000000) (bvslt (index!6713 lt!129429) (size!6277 (_keys!6910 thiss!1504))))))

(declare-fun b!257375 () Bool)

(assert (=> b!257375 (= e!166824 e!166826)))

(declare-fun c!43554 () Bool)

(assert (=> b!257375 (= c!43554 ((_ is MissingVacant!1135) lt!129429))))

(assert (= (and d!61855 c!43553) b!257370))

(assert (= (and d!61855 (not c!43553)) b!257375))

(assert (= (and b!257370 res!125879) b!257373))

(assert (= (and b!257373 res!125878) b!257369))

(assert (= (and b!257375 c!43554) b!257372))

(assert (= (and b!257375 (not c!43554)) b!257368))

(assert (= (and b!257372 res!125880) b!257374))

(assert (= (and b!257374 res!125881) b!257371))

(assert (= (or b!257370 b!257372) bm!24414))

(assert (= (or b!257369 b!257371) bm!24415))

(declare-fun m!272855 () Bool)

(assert (=> b!257373 m!272855))

(assert (=> d!61855 m!272651))

(declare-fun m!272857 () Bool)

(assert (=> d!61855 m!272857))

(assert (=> d!61855 m!272787))

(declare-fun m!272859 () Bool)

(assert (=> b!257374 m!272859))

(assert (=> bm!24415 m!272599))

(declare-fun m!272861 () Bool)

(assert (=> bm!24414 m!272861))

(assert (=> b!257147 d!61855))

(declare-fun b!257388 () Bool)

(declare-fun e!166835 () SeekEntryResult!1135)

(declare-fun lt!129437 () SeekEntryResult!1135)

(assert (=> b!257388 (= e!166835 (MissingZero!1135 (index!6712 lt!129437)))))

(declare-fun b!257389 () Bool)

(declare-fun e!166833 () SeekEntryResult!1135)

(assert (=> b!257389 (= e!166833 Undefined!1135)))

(declare-fun d!61857 () Bool)

(declare-fun lt!129438 () SeekEntryResult!1135)

(assert (=> d!61857 (and (or ((_ is Undefined!1135) lt!129438) (not ((_ is Found!1135) lt!129438)) (and (bvsge (index!6711 lt!129438) #b00000000000000000000000000000000) (bvslt (index!6711 lt!129438) (size!6277 (_keys!6910 thiss!1504))))) (or ((_ is Undefined!1135) lt!129438) ((_ is Found!1135) lt!129438) (not ((_ is MissingZero!1135) lt!129438)) (and (bvsge (index!6710 lt!129438) #b00000000000000000000000000000000) (bvslt (index!6710 lt!129438) (size!6277 (_keys!6910 thiss!1504))))) (or ((_ is Undefined!1135) lt!129438) ((_ is Found!1135) lt!129438) ((_ is MissingZero!1135) lt!129438) (not ((_ is MissingVacant!1135) lt!129438)) (and (bvsge (index!6713 lt!129438) #b00000000000000000000000000000000) (bvslt (index!6713 lt!129438) (size!6277 (_keys!6910 thiss!1504))))) (or ((_ is Undefined!1135) lt!129438) (ite ((_ is Found!1135) lt!129438) (= (select (arr!5930 (_keys!6910 thiss!1504)) (index!6711 lt!129438)) key!932) (ite ((_ is MissingZero!1135) lt!129438) (= (select (arr!5930 (_keys!6910 thiss!1504)) (index!6710 lt!129438)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1135) lt!129438) (= (select (arr!5930 (_keys!6910 thiss!1504)) (index!6713 lt!129438)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61857 (= lt!129438 e!166833)))

(declare-fun c!43562 () Bool)

(assert (=> d!61857 (= c!43562 (and ((_ is Intermediate!1135) lt!129437) (undefined!1947 lt!129437)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12521 (_ BitVec 32)) SeekEntryResult!1135)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61857 (= lt!129437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11028 thiss!1504)) key!932 (_keys!6910 thiss!1504) (mask!11028 thiss!1504)))))

(assert (=> d!61857 (validMask!0 (mask!11028 thiss!1504))))

(assert (=> d!61857 (= (seekEntryOrOpen!0 key!932 (_keys!6910 thiss!1504) (mask!11028 thiss!1504)) lt!129438)))

(declare-fun b!257390 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12521 (_ BitVec 32)) SeekEntryResult!1135)

(assert (=> b!257390 (= e!166835 (seekKeyOrZeroReturnVacant!0 (x!24967 lt!129437) (index!6712 lt!129437) (index!6712 lt!129437) key!932 (_keys!6910 thiss!1504) (mask!11028 thiss!1504)))))

(declare-fun b!257391 () Bool)

(declare-fun e!166834 () SeekEntryResult!1135)

(assert (=> b!257391 (= e!166834 (Found!1135 (index!6712 lt!129437)))))

(declare-fun b!257392 () Bool)

(assert (=> b!257392 (= e!166833 e!166834)))

(declare-fun lt!129439 () (_ BitVec 64))

(assert (=> b!257392 (= lt!129439 (select (arr!5930 (_keys!6910 thiss!1504)) (index!6712 lt!129437)))))

(declare-fun c!43563 () Bool)

(assert (=> b!257392 (= c!43563 (= lt!129439 key!932))))

(declare-fun b!257393 () Bool)

(declare-fun c!43561 () Bool)

(assert (=> b!257393 (= c!43561 (= lt!129439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257393 (= e!166834 e!166835)))

(assert (= (and d!61857 c!43562) b!257389))

(assert (= (and d!61857 (not c!43562)) b!257392))

(assert (= (and b!257392 c!43563) b!257391))

(assert (= (and b!257392 (not c!43563)) b!257393))

(assert (= (and b!257393 c!43561) b!257388))

(assert (= (and b!257393 (not c!43561)) b!257390))

(assert (=> d!61857 m!272787))

(declare-fun m!272863 () Bool)

(assert (=> d!61857 m!272863))

(declare-fun m!272865 () Bool)

(assert (=> d!61857 m!272865))

(declare-fun m!272867 () Bool)

(assert (=> d!61857 m!272867))

(declare-fun m!272869 () Bool)

(assert (=> d!61857 m!272869))

(assert (=> d!61857 m!272863))

(declare-fun m!272871 () Bool)

(assert (=> d!61857 m!272871))

(declare-fun m!272873 () Bool)

(assert (=> b!257390 m!272873))

(declare-fun m!272875 () Bool)

(assert (=> b!257392 m!272875))

(assert (=> b!257144 d!61857))

(declare-fun d!61859 () Bool)

(declare-fun res!125888 () Bool)

(declare-fun e!166838 () Bool)

(assert (=> d!61859 (=> (not res!125888) (not e!166838))))

(declare-fun simpleValid!276 (LongMapFixedSize!3802) Bool)

(assert (=> d!61859 (= res!125888 (simpleValid!276 thiss!1504))))

(assert (=> d!61859 (= (valid!1492 thiss!1504) e!166838)))

(declare-fun b!257400 () Bool)

(declare-fun res!125889 () Bool)

(assert (=> b!257400 (=> (not res!125889) (not e!166838))))

(assert (=> b!257400 (= res!125889 (= (arrayCountValidKeys!0 (_keys!6910 thiss!1504) #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))) (_size!1950 thiss!1504)))))

(declare-fun b!257401 () Bool)

(declare-fun res!125890 () Bool)

(assert (=> b!257401 (=> (not res!125890) (not e!166838))))

(assert (=> b!257401 (= res!125890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6910 thiss!1504) (mask!11028 thiss!1504)))))

(declare-fun b!257402 () Bool)

(assert (=> b!257402 (= e!166838 (arrayNoDuplicates!0 (_keys!6910 thiss!1504) #b00000000000000000000000000000000 Nil!3710))))

(assert (= (and d!61859 res!125888) b!257400))

(assert (= (and b!257400 res!125889) b!257401))

(assert (= (and b!257401 res!125890) b!257402))

(declare-fun m!272877 () Bool)

(assert (=> d!61859 m!272877))

(assert (=> b!257400 m!272625))

(declare-fun m!272879 () Bool)

(assert (=> b!257401 m!272879))

(declare-fun m!272881 () Bool)

(assert (=> b!257402 m!272881))

(assert (=> start!24562 d!61859))

(declare-fun d!61861 () Bool)

(assert (=> d!61861 (= (inRange!0 (ite c!43501 (index!6710 lt!129252) (index!6713 lt!129252)) (mask!11028 thiss!1504)) (and (bvsge (ite c!43501 (index!6710 lt!129252) (index!6713 lt!129252)) #b00000000000000000000000000000000) (bvslt (ite c!43501 (index!6710 lt!129252) (index!6713 lt!129252)) (bvadd (mask!11028 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24376 d!61861))

(declare-fun d!61863 () Bool)

(declare-fun e!166841 () Bool)

(assert (=> d!61863 e!166841))

(declare-fun res!125895 () Bool)

(assert (=> d!61863 (=> (not res!125895) (not e!166841))))

(declare-fun lt!129444 () SeekEntryResult!1135)

(assert (=> d!61863 (= res!125895 ((_ is Found!1135) lt!129444))))

(assert (=> d!61863 (= lt!129444 (seekEntryOrOpen!0 key!932 (_keys!6910 thiss!1504) (mask!11028 thiss!1504)))))

(declare-fun lt!129445 () Unit!7955)

(declare-fun choose!1245 (array!12521 array!12519 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 64) Int) Unit!7955)

(assert (=> d!61863 (= lt!129445 (choose!1245 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)))))

(assert (=> d!61863 (validMask!0 (mask!11028 thiss!1504))))

(assert (=> d!61863 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!427 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) key!932 (defaultEntry!4744 thiss!1504)) lt!129445)))

(declare-fun b!257407 () Bool)

(declare-fun res!125896 () Bool)

(assert (=> b!257407 (=> (not res!125896) (not e!166841))))

(assert (=> b!257407 (= res!125896 (inRange!0 (index!6711 lt!129444) (mask!11028 thiss!1504)))))

(declare-fun b!257408 () Bool)

(assert (=> b!257408 (= e!166841 (= (select (arr!5930 (_keys!6910 thiss!1504)) (index!6711 lt!129444)) key!932))))

(assert (=> b!257408 (and (bvsge (index!6711 lt!129444) #b00000000000000000000000000000000) (bvslt (index!6711 lt!129444) (size!6277 (_keys!6910 thiss!1504))))))

(assert (= (and d!61863 res!125895) b!257407))

(assert (= (and b!257407 res!125896) b!257408))

(assert (=> d!61863 m!272651))

(declare-fun m!272883 () Bool)

(assert (=> d!61863 m!272883))

(assert (=> d!61863 m!272787))

(declare-fun m!272885 () Bool)

(assert (=> b!257407 m!272885))

(declare-fun m!272887 () Bool)

(assert (=> b!257408 m!272887))

(assert (=> b!257143 d!61863))

(declare-fun d!61865 () Bool)

(declare-fun e!166844 () Bool)

(assert (=> d!61865 e!166844))

(declare-fun res!125902 () Bool)

(assert (=> d!61865 (=> (not res!125902) (not e!166844))))

(declare-fun lt!129455 () ListLongMap!3749)

(assert (=> d!61865 (= res!125902 (contains!1847 lt!129455 (_1!2428 (tuple2!4835 key!932 v!346))))))

(declare-fun lt!129456 () List!3712)

(assert (=> d!61865 (= lt!129455 (ListLongMap!3750 lt!129456))))

(declare-fun lt!129457 () Unit!7955)

(declare-fun lt!129454 () Unit!7955)

(assert (=> d!61865 (= lt!129457 lt!129454)))

(assert (=> d!61865 (= (getValueByKey!312 lt!129456 (_1!2428 (tuple2!4835 key!932 v!346))) (Some!317 (_2!2428 (tuple2!4835 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!168 (List!3712 (_ BitVec 64) V!8433) Unit!7955)

(assert (=> d!61865 (= lt!129454 (lemmaContainsTupThenGetReturnValue!168 lt!129456 (_1!2428 (tuple2!4835 key!932 v!346)) (_2!2428 (tuple2!4835 key!932 v!346))))))

(declare-fun insertStrictlySorted!171 (List!3712 (_ BitVec 64) V!8433) List!3712)

(assert (=> d!61865 (= lt!129456 (insertStrictlySorted!171 (toList!1890 lt!129255) (_1!2428 (tuple2!4835 key!932 v!346)) (_2!2428 (tuple2!4835 key!932 v!346))))))

(assert (=> d!61865 (= (+!687 lt!129255 (tuple2!4835 key!932 v!346)) lt!129455)))

(declare-fun b!257413 () Bool)

(declare-fun res!125901 () Bool)

(assert (=> b!257413 (=> (not res!125901) (not e!166844))))

(assert (=> b!257413 (= res!125901 (= (getValueByKey!312 (toList!1890 lt!129455) (_1!2428 (tuple2!4835 key!932 v!346))) (Some!317 (_2!2428 (tuple2!4835 key!932 v!346)))))))

(declare-fun b!257414 () Bool)

(declare-fun contains!1848 (List!3712 tuple2!4834) Bool)

(assert (=> b!257414 (= e!166844 (contains!1848 (toList!1890 lt!129455) (tuple2!4835 key!932 v!346)))))

(assert (= (and d!61865 res!125902) b!257413))

(assert (= (and b!257413 res!125901) b!257414))

(declare-fun m!272889 () Bool)

(assert (=> d!61865 m!272889))

(declare-fun m!272891 () Bool)

(assert (=> d!61865 m!272891))

(declare-fun m!272893 () Bool)

(assert (=> d!61865 m!272893))

(declare-fun m!272895 () Bool)

(assert (=> d!61865 m!272895))

(declare-fun m!272897 () Bool)

(assert (=> b!257413 m!272897))

(declare-fun m!272899 () Bool)

(assert (=> b!257414 m!272899))

(assert (=> b!257153 d!61865))

(declare-fun d!61867 () Bool)

(declare-fun e!166849 () Bool)

(assert (=> d!61867 e!166849))

(declare-fun res!125914 () Bool)

(assert (=> d!61867 (=> (not res!125914) (not e!166849))))

(assert (=> d!61867 (= res!125914 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6277 (_keys!6910 thiss!1504)))))))

(declare-fun lt!129460 () Unit!7955)

(declare-fun choose!1 (array!12521 (_ BitVec 32) (_ BitVec 64)) Unit!7955)

(assert (=> d!61867 (= lt!129460 (choose!1 (_keys!6910 thiss!1504) index!297 key!932))))

(declare-fun e!166850 () Bool)

(assert (=> d!61867 e!166850))

(declare-fun res!125913 () Bool)

(assert (=> d!61867 (=> (not res!125913) (not e!166850))))

(assert (=> d!61867 (= res!125913 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6277 (_keys!6910 thiss!1504)))))))

(assert (=> d!61867 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6910 thiss!1504) index!297 key!932) lt!129460)))

(declare-fun b!257424 () Bool)

(declare-fun res!125911 () Bool)

(assert (=> b!257424 (=> (not res!125911) (not e!166850))))

(assert (=> b!257424 (= res!125911 (validKeyInArray!0 key!932))))

(declare-fun b!257425 () Bool)

(assert (=> b!257425 (= e!166850 (bvslt (size!6277 (_keys!6910 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!257423 () Bool)

(declare-fun res!125912 () Bool)

(assert (=> b!257423 (=> (not res!125912) (not e!166850))))

(assert (=> b!257423 (= res!125912 (not (validKeyInArray!0 (select (arr!5930 (_keys!6910 thiss!1504)) index!297))))))

(declare-fun b!257426 () Bool)

(assert (=> b!257426 (= e!166849 (= (arrayCountValidKeys!0 (array!12522 (store (arr!5930 (_keys!6910 thiss!1504)) index!297 key!932) (size!6277 (_keys!6910 thiss!1504))) #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6910 thiss!1504) #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!61867 res!125913) b!257423))

(assert (= (and b!257423 res!125912) b!257424))

(assert (= (and b!257424 res!125911) b!257425))

(assert (= (and d!61867 res!125914) b!257426))

(declare-fun m!272901 () Bool)

(assert (=> d!61867 m!272901))

(declare-fun m!272903 () Bool)

(assert (=> b!257424 m!272903))

(declare-fun m!272905 () Bool)

(assert (=> b!257423 m!272905))

(assert (=> b!257423 m!272905))

(declare-fun m!272907 () Bool)

(assert (=> b!257423 m!272907))

(assert (=> b!257426 m!272623))

(declare-fun m!272909 () Bool)

(assert (=> b!257426 m!272909))

(assert (=> b!257426 m!272625))

(assert (=> b!257153 d!61867))

(declare-fun b!257435 () Bool)

(declare-fun e!166855 () (_ BitVec 32))

(declare-fun call!24421 () (_ BitVec 32))

(assert (=> b!257435 (= e!166855 (bvadd #b00000000000000000000000000000001 call!24421))))

(declare-fun d!61869 () Bool)

(declare-fun lt!129463 () (_ BitVec 32))

(assert (=> d!61869 (and (bvsge lt!129463 #b00000000000000000000000000000000) (bvsle lt!129463 (bvsub (size!6277 lt!129254) index!297)))))

(declare-fun e!166856 () (_ BitVec 32))

(assert (=> d!61869 (= lt!129463 e!166856)))

(declare-fun c!43569 () Bool)

(assert (=> d!61869 (= c!43569 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!61869 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6277 lt!129254)))))

(assert (=> d!61869 (= (arrayCountValidKeys!0 lt!129254 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!129463)))

(declare-fun b!257436 () Bool)

(assert (=> b!257436 (= e!166856 #b00000000000000000000000000000000)))

(declare-fun b!257437 () Bool)

(assert (=> b!257437 (= e!166856 e!166855)))

(declare-fun c!43568 () Bool)

(assert (=> b!257437 (= c!43568 (validKeyInArray!0 (select (arr!5930 lt!129254) index!297)))))

(declare-fun bm!24418 () Bool)

(assert (=> bm!24418 (= call!24421 (arrayCountValidKeys!0 lt!129254 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!257438 () Bool)

(assert (=> b!257438 (= e!166855 call!24421)))

(assert (= (and d!61869 c!43569) b!257436))

(assert (= (and d!61869 (not c!43569)) b!257437))

(assert (= (and b!257437 c!43568) b!257435))

(assert (= (and b!257437 (not c!43568)) b!257438))

(assert (= (or b!257435 b!257438) bm!24418))

(declare-fun m!272911 () Bool)

(assert (=> b!257437 m!272911))

(assert (=> b!257437 m!272911))

(declare-fun m!272913 () Bool)

(assert (=> b!257437 m!272913))

(declare-fun m!272915 () Bool)

(assert (=> bm!24418 m!272915))

(assert (=> b!257153 d!61869))

(declare-fun bm!24419 () Bool)

(declare-fun call!24422 () Bool)

(declare-fun lt!129485 () ListLongMap!3749)

(assert (=> bm!24419 (= call!24422 (contains!1847 lt!129485 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257439 () Bool)

(declare-fun e!166860 () Unit!7955)

(declare-fun Unit!7970 () Unit!7955)

(assert (=> b!257439 (= e!166860 Unit!7970)))

(declare-fun bm!24420 () Bool)

(declare-fun call!24423 () Bool)

(assert (=> bm!24420 (= call!24423 (contains!1847 lt!129485 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257441 () Bool)

(declare-fun e!166864 () Bool)

(declare-fun e!166861 () Bool)

(assert (=> b!257441 (= e!166864 e!166861)))

(declare-fun res!125921 () Bool)

(assert (=> b!257441 (= res!125921 call!24423)))

(assert (=> b!257441 (=> (not res!125921) (not e!166861))))

(declare-fun b!257442 () Bool)

(declare-fun e!166867 () Bool)

(assert (=> b!257442 (= e!166867 (validKeyInArray!0 (select (arr!5930 lt!129254) #b00000000000000000000000000000000)))))

(declare-fun b!257443 () Bool)

(declare-fun e!166859 () Bool)

(assert (=> b!257443 (= e!166859 (validKeyInArray!0 (select (arr!5930 lt!129254) #b00000000000000000000000000000000)))))

(declare-fun b!257444 () Bool)

(declare-fun e!166862 () ListLongMap!3749)

(declare-fun call!24425 () ListLongMap!3749)

(assert (=> b!257444 (= e!166862 call!24425)))

(declare-fun b!257445 () Bool)

(declare-fun e!166866 () ListLongMap!3749)

(assert (=> b!257445 (= e!166866 call!24425)))

(declare-fun call!24428 () ListLongMap!3749)

(declare-fun call!24424 () ListLongMap!3749)

(declare-fun bm!24421 () Bool)

(declare-fun c!43572 () Bool)

(declare-fun c!43575 () Bool)

(declare-fun call!24426 () ListLongMap!3749)

(declare-fun call!24427 () ListLongMap!3749)

(assert (=> bm!24421 (= call!24426 (+!687 (ite c!43572 call!24428 (ite c!43575 call!24424 call!24427)) (ite (or c!43572 c!43575) (tuple2!4835 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4585 thiss!1504)) (tuple2!4835 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4585 thiss!1504)))))))

(declare-fun b!257446 () Bool)

(declare-fun e!166863 () Bool)

(declare-fun e!166865 () Bool)

(assert (=> b!257446 (= e!166863 e!166865)))

(declare-fun res!125915 () Bool)

(assert (=> b!257446 (=> (not res!125915) (not e!166865))))

(assert (=> b!257446 (= res!125915 (contains!1847 lt!129485 (select (arr!5930 lt!129254) #b00000000000000000000000000000000)))))

(assert (=> b!257446 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6277 lt!129254)))))

(declare-fun d!61871 () Bool)

(declare-fun e!166857 () Bool)

(assert (=> d!61871 e!166857))

(declare-fun res!125919 () Bool)

(assert (=> d!61871 (=> (not res!125919) (not e!166857))))

(assert (=> d!61871 (= res!125919 (or (bvsge #b00000000000000000000000000000000 (size!6277 lt!129254)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6277 lt!129254)))))))

(declare-fun lt!129469 () ListLongMap!3749)

(assert (=> d!61871 (= lt!129485 lt!129469)))

(declare-fun lt!129481 () Unit!7955)

(assert (=> d!61871 (= lt!129481 e!166860)))

(declare-fun c!43571 () Bool)

(assert (=> d!61871 (= c!43571 e!166859)))

(declare-fun res!125923 () Bool)

(assert (=> d!61871 (=> (not res!125923) (not e!166859))))

(assert (=> d!61871 (= res!125923 (bvslt #b00000000000000000000000000000000 (size!6277 lt!129254)))))

(declare-fun e!166869 () ListLongMap!3749)

(assert (=> d!61871 (= lt!129469 e!166869)))

(assert (=> d!61871 (= c!43572 (and (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61871 (validMask!0 (mask!11028 thiss!1504))))

(assert (=> d!61871 (= (getCurrentListMap!1422 lt!129254 (array!12520 (store (arr!5929 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6276 (_values!4727 thiss!1504))) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)) lt!129485)))

(declare-fun b!257440 () Bool)

(assert (=> b!257440 (= e!166862 call!24427)))

(declare-fun bm!24422 () Bool)

(assert (=> bm!24422 (= call!24428 (getCurrentListMapNoExtraKeys!569 lt!129254 (array!12520 (store (arr!5929 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6276 (_values!4727 thiss!1504))) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun b!257447 () Bool)

(assert (=> b!257447 (= e!166864 (not call!24423))))

(declare-fun bm!24423 () Bool)

(assert (=> bm!24423 (= call!24427 call!24424)))

(declare-fun b!257448 () Bool)

(assert (=> b!257448 (= e!166869 e!166866)))

(assert (=> b!257448 (= c!43575 (and (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257449 () Bool)

(assert (=> b!257449 (= e!166865 (= (apply!253 lt!129485 (select (arr!5930 lt!129254) #b00000000000000000000000000000000)) (get!3056 (select (arr!5929 (array!12520 (store (arr!5929 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6276 (_values!4727 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4744 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6276 (array!12520 (store (arr!5929 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6276 (_values!4727 thiss!1504))))))))

(assert (=> b!257449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6277 lt!129254)))))

(declare-fun b!257450 () Bool)

(assert (=> b!257450 (= e!166869 (+!687 call!24426 (tuple2!4835 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4585 thiss!1504))))))

(declare-fun b!257451 () Bool)

(assert (=> b!257451 (= e!166861 (= (apply!253 lt!129485 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4585 thiss!1504)))))

(declare-fun b!257452 () Bool)

(declare-fun e!166858 () Bool)

(assert (=> b!257452 (= e!166858 (= (apply!253 lt!129485 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4585 thiss!1504)))))

(declare-fun b!257453 () Bool)

(declare-fun lt!129475 () Unit!7955)

(assert (=> b!257453 (= e!166860 lt!129475)))

(declare-fun lt!129467 () ListLongMap!3749)

(assert (=> b!257453 (= lt!129467 (getCurrentListMapNoExtraKeys!569 lt!129254 (array!12520 (store (arr!5929 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6276 (_values!4727 thiss!1504))) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129474 () (_ BitVec 64))

(assert (=> b!257453 (= lt!129474 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129482 () (_ BitVec 64))

(assert (=> b!257453 (= lt!129482 (select (arr!5930 lt!129254) #b00000000000000000000000000000000))))

(declare-fun lt!129472 () Unit!7955)

(assert (=> b!257453 (= lt!129472 (addStillContains!229 lt!129467 lt!129474 (zeroValue!4585 thiss!1504) lt!129482))))

(assert (=> b!257453 (contains!1847 (+!687 lt!129467 (tuple2!4835 lt!129474 (zeroValue!4585 thiss!1504))) lt!129482)))

(declare-fun lt!129471 () Unit!7955)

(assert (=> b!257453 (= lt!129471 lt!129472)))

(declare-fun lt!129484 () ListLongMap!3749)

(assert (=> b!257453 (= lt!129484 (getCurrentListMapNoExtraKeys!569 lt!129254 (array!12520 (store (arr!5929 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6276 (_values!4727 thiss!1504))) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129468 () (_ BitVec 64))

(assert (=> b!257453 (= lt!129468 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129478 () (_ BitVec 64))

(assert (=> b!257453 (= lt!129478 (select (arr!5930 lt!129254) #b00000000000000000000000000000000))))

(declare-fun lt!129464 () Unit!7955)

(assert (=> b!257453 (= lt!129464 (addApplyDifferent!229 lt!129484 lt!129468 (minValue!4585 thiss!1504) lt!129478))))

(assert (=> b!257453 (= (apply!253 (+!687 lt!129484 (tuple2!4835 lt!129468 (minValue!4585 thiss!1504))) lt!129478) (apply!253 lt!129484 lt!129478))))

(declare-fun lt!129479 () Unit!7955)

(assert (=> b!257453 (= lt!129479 lt!129464)))

(declare-fun lt!129470 () ListLongMap!3749)

(assert (=> b!257453 (= lt!129470 (getCurrentListMapNoExtraKeys!569 lt!129254 (array!12520 (store (arr!5929 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6276 (_values!4727 thiss!1504))) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129480 () (_ BitVec 64))

(assert (=> b!257453 (= lt!129480 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129476 () (_ BitVec 64))

(assert (=> b!257453 (= lt!129476 (select (arr!5930 lt!129254) #b00000000000000000000000000000000))))

(declare-fun lt!129466 () Unit!7955)

(assert (=> b!257453 (= lt!129466 (addApplyDifferent!229 lt!129470 lt!129480 (zeroValue!4585 thiss!1504) lt!129476))))

(assert (=> b!257453 (= (apply!253 (+!687 lt!129470 (tuple2!4835 lt!129480 (zeroValue!4585 thiss!1504))) lt!129476) (apply!253 lt!129470 lt!129476))))

(declare-fun lt!129465 () Unit!7955)

(assert (=> b!257453 (= lt!129465 lt!129466)))

(declare-fun lt!129473 () ListLongMap!3749)

(assert (=> b!257453 (= lt!129473 (getCurrentListMapNoExtraKeys!569 lt!129254 (array!12520 (store (arr!5929 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6276 (_values!4727 thiss!1504))) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)))))

(declare-fun lt!129483 () (_ BitVec 64))

(assert (=> b!257453 (= lt!129483 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129477 () (_ BitVec 64))

(assert (=> b!257453 (= lt!129477 (select (arr!5930 lt!129254) #b00000000000000000000000000000000))))

(assert (=> b!257453 (= lt!129475 (addApplyDifferent!229 lt!129473 lt!129483 (minValue!4585 thiss!1504) lt!129477))))

(assert (=> b!257453 (= (apply!253 (+!687 lt!129473 (tuple2!4835 lt!129483 (minValue!4585 thiss!1504))) lt!129477) (apply!253 lt!129473 lt!129477))))

(declare-fun b!257454 () Bool)

(declare-fun res!125916 () Bool)

(assert (=> b!257454 (=> (not res!125916) (not e!166857))))

(assert (=> b!257454 (= res!125916 e!166863)))

(declare-fun res!125917 () Bool)

(assert (=> b!257454 (=> res!125917 e!166863)))

(assert (=> b!257454 (= res!125917 (not e!166867))))

(declare-fun res!125918 () Bool)

(assert (=> b!257454 (=> (not res!125918) (not e!166867))))

(assert (=> b!257454 (= res!125918 (bvslt #b00000000000000000000000000000000 (size!6277 lt!129254)))))

(declare-fun bm!24424 () Bool)

(assert (=> bm!24424 (= call!24424 call!24428)))

(declare-fun b!257455 () Bool)

(declare-fun e!166868 () Bool)

(assert (=> b!257455 (= e!166857 e!166868)))

(declare-fun c!43570 () Bool)

(assert (=> b!257455 (= c!43570 (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24425 () Bool)

(assert (=> bm!24425 (= call!24425 call!24426)))

(declare-fun b!257456 () Bool)

(assert (=> b!257456 (= e!166868 (not call!24422))))

(declare-fun b!257457 () Bool)

(declare-fun res!125922 () Bool)

(assert (=> b!257457 (=> (not res!125922) (not e!166857))))

(assert (=> b!257457 (= res!125922 e!166864)))

(declare-fun c!43573 () Bool)

(assert (=> b!257457 (= c!43573 (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!257458 () Bool)

(declare-fun c!43574 () Bool)

(assert (=> b!257458 (= c!43574 (and (not (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4481 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!257458 (= e!166866 e!166862)))

(declare-fun b!257459 () Bool)

(assert (=> b!257459 (= e!166868 e!166858)))

(declare-fun res!125920 () Bool)

(assert (=> b!257459 (= res!125920 call!24422)))

(assert (=> b!257459 (=> (not res!125920) (not e!166858))))

(assert (= (and d!61871 c!43572) b!257450))

(assert (= (and d!61871 (not c!43572)) b!257448))

(assert (= (and b!257448 c!43575) b!257445))

(assert (= (and b!257448 (not c!43575)) b!257458))

(assert (= (and b!257458 c!43574) b!257444))

(assert (= (and b!257458 (not c!43574)) b!257440))

(assert (= (or b!257444 b!257440) bm!24423))

(assert (= (or b!257445 bm!24423) bm!24424))

(assert (= (or b!257445 b!257444) bm!24425))

(assert (= (or b!257450 bm!24424) bm!24422))

(assert (= (or b!257450 bm!24425) bm!24421))

(assert (= (and d!61871 res!125923) b!257443))

(assert (= (and d!61871 c!43571) b!257453))

(assert (= (and d!61871 (not c!43571)) b!257439))

(assert (= (and d!61871 res!125919) b!257454))

(assert (= (and b!257454 res!125918) b!257442))

(assert (= (and b!257454 (not res!125917)) b!257446))

(assert (= (and b!257446 res!125915) b!257449))

(assert (= (and b!257454 res!125916) b!257457))

(assert (= (and b!257457 c!43573) b!257441))

(assert (= (and b!257457 (not c!43573)) b!257447))

(assert (= (and b!257441 res!125921) b!257451))

(assert (= (or b!257441 b!257447) bm!24420))

(assert (= (and b!257457 res!125922) b!257455))

(assert (= (and b!257455 c!43570) b!257459))

(assert (= (and b!257455 (not c!43570)) b!257456))

(assert (= (and b!257459 res!125920) b!257452))

(assert (= (or b!257459 b!257456) bm!24419))

(declare-fun b_lambda!8203 () Bool)

(assert (=> (not b_lambda!8203) (not b!257449)))

(assert (=> b!257449 t!8766))

(declare-fun b_and!13815 () Bool)

(assert (= b_and!13813 (and (=> t!8766 result!5371) b_and!13815)))

(assert (=> d!61871 m!272787))

(declare-fun m!272917 () Bool)

(assert (=> bm!24420 m!272917))

(declare-fun m!272919 () Bool)

(assert (=> b!257450 m!272919))

(declare-fun m!272921 () Bool)

(assert (=> bm!24422 m!272921))

(declare-fun m!272923 () Bool)

(assert (=> b!257452 m!272923))

(declare-fun m!272925 () Bool)

(assert (=> b!257449 m!272925))

(assert (=> b!257449 m!272925))

(assert (=> b!257449 m!272807))

(declare-fun m!272927 () Bool)

(assert (=> b!257449 m!272927))

(declare-fun m!272929 () Bool)

(assert (=> b!257449 m!272929))

(assert (=> b!257449 m!272929))

(declare-fun m!272931 () Bool)

(assert (=> b!257449 m!272931))

(assert (=> b!257449 m!272807))

(assert (=> b!257446 m!272929))

(assert (=> b!257446 m!272929))

(declare-fun m!272933 () Bool)

(assert (=> b!257446 m!272933))

(declare-fun m!272935 () Bool)

(assert (=> bm!24419 m!272935))

(declare-fun m!272937 () Bool)

(assert (=> bm!24421 m!272937))

(assert (=> b!257442 m!272929))

(assert (=> b!257442 m!272929))

(declare-fun m!272939 () Bool)

(assert (=> b!257442 m!272939))

(declare-fun m!272941 () Bool)

(assert (=> b!257451 m!272941))

(assert (=> b!257443 m!272929))

(assert (=> b!257443 m!272929))

(assert (=> b!257443 m!272939))

(declare-fun m!272943 () Bool)

(assert (=> b!257453 m!272943))

(declare-fun m!272945 () Bool)

(assert (=> b!257453 m!272945))

(declare-fun m!272947 () Bool)

(assert (=> b!257453 m!272947))

(declare-fun m!272949 () Bool)

(assert (=> b!257453 m!272949))

(declare-fun m!272951 () Bool)

(assert (=> b!257453 m!272951))

(declare-fun m!272953 () Bool)

(assert (=> b!257453 m!272953))

(assert (=> b!257453 m!272951))

(declare-fun m!272955 () Bool)

(assert (=> b!257453 m!272955))

(assert (=> b!257453 m!272943))

(declare-fun m!272957 () Bool)

(assert (=> b!257453 m!272957))

(declare-fun m!272959 () Bool)

(assert (=> b!257453 m!272959))

(declare-fun m!272961 () Bool)

(assert (=> b!257453 m!272961))

(declare-fun m!272963 () Bool)

(assert (=> b!257453 m!272963))

(declare-fun m!272965 () Bool)

(assert (=> b!257453 m!272965))

(assert (=> b!257453 m!272959))

(assert (=> b!257453 m!272929))

(assert (=> b!257453 m!272921))

(declare-fun m!272967 () Bool)

(assert (=> b!257453 m!272967))

(assert (=> b!257453 m!272947))

(declare-fun m!272969 () Bool)

(assert (=> b!257453 m!272969))

(declare-fun m!272971 () Bool)

(assert (=> b!257453 m!272971))

(assert (=> b!257153 d!61871))

(declare-fun d!61873 () Bool)

(declare-fun e!166872 () Bool)

(assert (=> d!61873 e!166872))

(declare-fun res!125926 () Bool)

(assert (=> d!61873 (=> (not res!125926) (not e!166872))))

(assert (=> d!61873 (= res!125926 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6277 (_keys!6910 thiss!1504))) (bvslt index!297 (size!6276 (_values!4727 thiss!1504)))))))

(declare-fun lt!129488 () Unit!7955)

(declare-fun choose!1246 (array!12521 array!12519 (_ BitVec 32) (_ BitVec 32) V!8433 V!8433 (_ BitVec 32) (_ BitVec 64) V!8433 Int) Unit!7955)

(assert (=> d!61873 (= lt!129488 (choose!1246 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) index!297 key!932 v!346 (defaultEntry!4744 thiss!1504)))))

(assert (=> d!61873 (validMask!0 (mask!11028 thiss!1504))))

(assert (=> d!61873 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!102 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) index!297 key!932 v!346 (defaultEntry!4744 thiss!1504)) lt!129488)))

(declare-fun b!257462 () Bool)

(assert (=> b!257462 (= e!166872 (= (+!687 (getCurrentListMap!1422 (_keys!6910 thiss!1504) (_values!4727 thiss!1504) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504)) (tuple2!4835 key!932 v!346)) (getCurrentListMap!1422 (array!12522 (store (arr!5930 (_keys!6910 thiss!1504)) index!297 key!932) (size!6277 (_keys!6910 thiss!1504))) (array!12520 (store (arr!5929 (_values!4727 thiss!1504)) index!297 (ValueCellFull!2951 v!346)) (size!6276 (_values!4727 thiss!1504))) (mask!11028 thiss!1504) (extraKeys!4481 thiss!1504) (zeroValue!4585 thiss!1504) (minValue!4585 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4744 thiss!1504))))))

(assert (= (and d!61873 res!125926) b!257462))

(declare-fun m!272973 () Bool)

(assert (=> d!61873 m!272973))

(assert (=> d!61873 m!272787))

(assert (=> b!257462 m!272605))

(declare-fun m!272975 () Bool)

(assert (=> b!257462 m!272975))

(assert (=> b!257462 m!272623))

(assert (=> b!257462 m!272605))

(declare-fun m!272977 () Bool)

(assert (=> b!257462 m!272977))

(assert (=> b!257462 m!272615))

(assert (=> b!257153 d!61873))

(declare-fun d!61875 () Bool)

(assert (=> d!61875 (arrayContainsKey!0 lt!129254 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129491 () Unit!7955)

(declare-fun choose!13 (array!12521 (_ BitVec 64) (_ BitVec 32)) Unit!7955)

(assert (=> d!61875 (= lt!129491 (choose!13 lt!129254 key!932 index!297))))

(assert (=> d!61875 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!61875 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129254 key!932 index!297) lt!129491)))

(declare-fun bs!9100 () Bool)

(assert (= bs!9100 d!61875))

(assert (=> bs!9100 m!272645))

(declare-fun m!272979 () Bool)

(assert (=> bs!9100 m!272979))

(assert (=> b!257153 d!61875))

(declare-fun d!61877 () Bool)

(assert (=> d!61877 (= (arrayCountValidKeys!0 lt!129254 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!129494 () Unit!7955)

(declare-fun choose!2 (array!12521 (_ BitVec 32)) Unit!7955)

(assert (=> d!61877 (= lt!129494 (choose!2 lt!129254 index!297))))

(declare-fun e!166875 () Bool)

(assert (=> d!61877 e!166875))

(declare-fun res!125931 () Bool)

(assert (=> d!61877 (=> (not res!125931) (not e!166875))))

(assert (=> d!61877 (= res!125931 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6277 lt!129254))))))

(assert (=> d!61877 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129254 index!297) lt!129494)))

(declare-fun b!257467 () Bool)

(declare-fun res!125932 () Bool)

(assert (=> b!257467 (=> (not res!125932) (not e!166875))))

(assert (=> b!257467 (= res!125932 (validKeyInArray!0 (select (arr!5930 lt!129254) index!297)))))

(declare-fun b!257468 () Bool)

(assert (=> b!257468 (= e!166875 (bvslt (size!6277 lt!129254) #b01111111111111111111111111111111))))

(assert (= (and d!61877 res!125931) b!257467))

(assert (= (and b!257467 res!125932) b!257468))

(declare-fun m!272981 () Bool)

(assert (=> d!61877 m!272981))

(declare-fun m!272983 () Bool)

(assert (=> d!61877 m!272983))

(assert (=> b!257467 m!272911))

(assert (=> b!257467 m!272911))

(assert (=> b!257467 m!272913))

(assert (=> b!257153 d!61877))

(declare-fun d!61879 () Bool)

(declare-fun e!166878 () Bool)

(assert (=> d!61879 e!166878))

(declare-fun res!125935 () Bool)

(assert (=> d!61879 (=> (not res!125935) (not e!166878))))

(assert (=> d!61879 (= res!125935 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6277 (_keys!6910 thiss!1504)))))))

(declare-fun lt!129497 () Unit!7955)

(declare-fun choose!41 (array!12521 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3713) Unit!7955)

(assert (=> d!61879 (= lt!129497 (choose!41 (_keys!6910 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3710))))

(assert (=> d!61879 (bvslt (size!6277 (_keys!6910 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61879 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6910 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3710) lt!129497)))

(declare-fun b!257471 () Bool)

(assert (=> b!257471 (= e!166878 (arrayNoDuplicates!0 (array!12522 (store (arr!5930 (_keys!6910 thiss!1504)) index!297 key!932) (size!6277 (_keys!6910 thiss!1504))) #b00000000000000000000000000000000 Nil!3710))))

(assert (= (and d!61879 res!125935) b!257471))

(declare-fun m!272985 () Bool)

(assert (=> d!61879 m!272985))

(assert (=> b!257471 m!272623))

(declare-fun m!272987 () Bool)

(assert (=> b!257471 m!272987))

(assert (=> b!257153 d!61879))

(declare-fun d!61881 () Bool)

(declare-fun res!125940 () Bool)

(declare-fun e!166883 () Bool)

(assert (=> d!61881 (=> res!125940 e!166883)))

(assert (=> d!61881 (= res!125940 (= (select (arr!5930 lt!129254) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61881 (= (arrayContainsKey!0 lt!129254 key!932 #b00000000000000000000000000000000) e!166883)))

(declare-fun b!257476 () Bool)

(declare-fun e!166884 () Bool)

(assert (=> b!257476 (= e!166883 e!166884)))

(declare-fun res!125941 () Bool)

(assert (=> b!257476 (=> (not res!125941) (not e!166884))))

(assert (=> b!257476 (= res!125941 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6277 lt!129254)))))

(declare-fun b!257477 () Bool)

(assert (=> b!257477 (= e!166884 (arrayContainsKey!0 lt!129254 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61881 (not res!125940)) b!257476))

(assert (= (and b!257476 res!125941) b!257477))

(assert (=> d!61881 m!272929))

(declare-fun m!272989 () Bool)

(assert (=> b!257477 m!272989))

(assert (=> b!257153 d!61881))

(declare-fun d!61883 () Bool)

(declare-fun res!125942 () Bool)

(declare-fun e!166885 () Bool)

(assert (=> d!61883 (=> res!125942 e!166885)))

(assert (=> d!61883 (= res!125942 (= (select (arr!5930 (_keys!6910 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61883 (= (arrayContainsKey!0 (_keys!6910 thiss!1504) key!932 #b00000000000000000000000000000000) e!166885)))

(declare-fun b!257478 () Bool)

(declare-fun e!166886 () Bool)

(assert (=> b!257478 (= e!166885 e!166886)))

(declare-fun res!125943 () Bool)

(assert (=> b!257478 (=> (not res!125943) (not e!166886))))

(assert (=> b!257478 (= res!125943 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6277 (_keys!6910 thiss!1504))))))

(declare-fun b!257479 () Bool)

(assert (=> b!257479 (= e!166886 (arrayContainsKey!0 (_keys!6910 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61883 (not res!125942)) b!257478))

(assert (= (and b!257478 res!125943) b!257479))

(assert (=> d!61883 m!272811))

(declare-fun m!272991 () Bool)

(assert (=> b!257479 m!272991))

(assert (=> b!257153 d!61883))

(declare-fun d!61885 () Bool)

(declare-fun e!166889 () Bool)

(assert (=> d!61885 e!166889))

(declare-fun res!125946 () Bool)

(assert (=> d!61885 (=> (not res!125946) (not e!166889))))

(assert (=> d!61885 (= res!125946 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6277 (_keys!6910 thiss!1504)))))))

(declare-fun lt!129500 () Unit!7955)

(declare-fun choose!102 ((_ BitVec 64) array!12521 (_ BitVec 32) (_ BitVec 32)) Unit!7955)

(assert (=> d!61885 (= lt!129500 (choose!102 key!932 (_keys!6910 thiss!1504) index!297 (mask!11028 thiss!1504)))))

(assert (=> d!61885 (validMask!0 (mask!11028 thiss!1504))))

(assert (=> d!61885 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6910 thiss!1504) index!297 (mask!11028 thiss!1504)) lt!129500)))

(declare-fun b!257482 () Bool)

(assert (=> b!257482 (= e!166889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12522 (store (arr!5930 (_keys!6910 thiss!1504)) index!297 key!932) (size!6277 (_keys!6910 thiss!1504))) (mask!11028 thiss!1504)))))

(assert (= (and d!61885 res!125946) b!257482))

(declare-fun m!272993 () Bool)

(assert (=> d!61885 m!272993))

(assert (=> d!61885 m!272787))

(assert (=> b!257482 m!272623))

(declare-fun m!272995 () Bool)

(assert (=> b!257482 m!272995))

(assert (=> b!257153 d!61885))

(declare-fun b!257483 () Bool)

(declare-fun e!166890 () (_ BitVec 32))

(declare-fun call!24429 () (_ BitVec 32))

(assert (=> b!257483 (= e!166890 (bvadd #b00000000000000000000000000000001 call!24429))))

(declare-fun d!61887 () Bool)

(declare-fun lt!129501 () (_ BitVec 32))

(assert (=> d!61887 (and (bvsge lt!129501 #b00000000000000000000000000000000) (bvsle lt!129501 (bvsub (size!6277 (_keys!6910 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!166891 () (_ BitVec 32))

(assert (=> d!61887 (= lt!129501 e!166891)))

(declare-fun c!43577 () Bool)

(assert (=> d!61887 (= c!43577 (bvsge #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))))))

(assert (=> d!61887 (and (bvsle #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6277 (_keys!6910 thiss!1504)) (size!6277 (_keys!6910 thiss!1504))))))

(assert (=> d!61887 (= (arrayCountValidKeys!0 (_keys!6910 thiss!1504) #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))) lt!129501)))

(declare-fun b!257484 () Bool)

(assert (=> b!257484 (= e!166891 #b00000000000000000000000000000000)))

(declare-fun b!257485 () Bool)

(assert (=> b!257485 (= e!166891 e!166890)))

(declare-fun c!43576 () Bool)

(assert (=> b!257485 (= c!43576 (validKeyInArray!0 (select (arr!5930 (_keys!6910 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24426 () Bool)

(assert (=> bm!24426 (= call!24429 (arrayCountValidKeys!0 (_keys!6910 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6277 (_keys!6910 thiss!1504))))))

(declare-fun b!257486 () Bool)

(assert (=> b!257486 (= e!166890 call!24429)))

(assert (= (and d!61887 c!43577) b!257484))

(assert (= (and d!61887 (not c!43577)) b!257485))

(assert (= (and b!257485 c!43576) b!257483))

(assert (= (and b!257485 (not c!43576)) b!257486))

(assert (= (or b!257483 b!257486) bm!24426))

(assert (=> b!257485 m!272811))

(assert (=> b!257485 m!272811))

(assert (=> b!257485 m!272821))

(declare-fun m!272997 () Bool)

(assert (=> bm!24426 m!272997))

(assert (=> b!257153 d!61887))

(declare-fun b!257487 () Bool)

(declare-fun e!166892 () (_ BitVec 32))

(declare-fun call!24430 () (_ BitVec 32))

(assert (=> b!257487 (= e!166892 (bvadd #b00000000000000000000000000000001 call!24430))))

(declare-fun d!61889 () Bool)

(declare-fun lt!129502 () (_ BitVec 32))

(assert (=> d!61889 (and (bvsge lt!129502 #b00000000000000000000000000000000) (bvsle lt!129502 (bvsub (size!6277 lt!129254) #b00000000000000000000000000000000)))))

(declare-fun e!166893 () (_ BitVec 32))

(assert (=> d!61889 (= lt!129502 e!166893)))

(declare-fun c!43579 () Bool)

(assert (=> d!61889 (= c!43579 (bvsge #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))))))

(assert (=> d!61889 (and (bvsle #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6277 (_keys!6910 thiss!1504)) (size!6277 lt!129254)))))

(assert (=> d!61889 (= (arrayCountValidKeys!0 lt!129254 #b00000000000000000000000000000000 (size!6277 (_keys!6910 thiss!1504))) lt!129502)))

(declare-fun b!257488 () Bool)

(assert (=> b!257488 (= e!166893 #b00000000000000000000000000000000)))

(declare-fun b!257489 () Bool)

(assert (=> b!257489 (= e!166893 e!166892)))

(declare-fun c!43578 () Bool)

(assert (=> b!257489 (= c!43578 (validKeyInArray!0 (select (arr!5930 lt!129254) #b00000000000000000000000000000000)))))

(declare-fun bm!24427 () Bool)

(assert (=> bm!24427 (= call!24430 (arrayCountValidKeys!0 lt!129254 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6277 (_keys!6910 thiss!1504))))))

(declare-fun b!257490 () Bool)

(assert (=> b!257490 (= e!166892 call!24430)))

(assert (= (and d!61889 c!43579) b!257488))

(assert (= (and d!61889 (not c!43579)) b!257489))

(assert (= (and b!257489 c!43578) b!257487))

(assert (= (and b!257489 (not c!43578)) b!257490))

(assert (= (or b!257487 b!257490) bm!24427))

(assert (=> b!257489 m!272929))

(assert (=> b!257489 m!272929))

(assert (=> b!257489 m!272939))

(declare-fun m!272999 () Bool)

(assert (=> bm!24427 m!272999))

(assert (=> b!257153 d!61889))

(declare-fun bm!24430 () Bool)

(declare-fun call!24433 () Bool)

(assert (=> bm!24430 (= call!24433 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!129254 (mask!11028 thiss!1504)))))

(declare-fun b!257500 () Bool)

(declare-fun e!166900 () Bool)

(assert (=> b!257500 (= e!166900 call!24433)))

(declare-fun b!257501 () Bool)

(declare-fun e!166902 () Bool)

(assert (=> b!257501 (= e!166900 e!166902)))

(declare-fun lt!129509 () (_ BitVec 64))

(assert (=> b!257501 (= lt!129509 (select (arr!5930 lt!129254) #b00000000000000000000000000000000))))

(declare-fun lt!129510 () Unit!7955)

(assert (=> b!257501 (= lt!129510 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129254 lt!129509 #b00000000000000000000000000000000))))

(assert (=> b!257501 (arrayContainsKey!0 lt!129254 lt!129509 #b00000000000000000000000000000000)))

(declare-fun lt!129511 () Unit!7955)

(assert (=> b!257501 (= lt!129511 lt!129510)))

(declare-fun res!125951 () Bool)

(assert (=> b!257501 (= res!125951 (= (seekEntryOrOpen!0 (select (arr!5930 lt!129254) #b00000000000000000000000000000000) lt!129254 (mask!11028 thiss!1504)) (Found!1135 #b00000000000000000000000000000000)))))

(assert (=> b!257501 (=> (not res!125951) (not e!166902))))

(declare-fun b!257502 () Bool)

(assert (=> b!257502 (= e!166902 call!24433)))

(declare-fun d!61891 () Bool)

(declare-fun res!125952 () Bool)

(declare-fun e!166901 () Bool)

(assert (=> d!61891 (=> res!125952 e!166901)))

(assert (=> d!61891 (= res!125952 (bvsge #b00000000000000000000000000000000 (size!6277 lt!129254)))))

(assert (=> d!61891 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129254 (mask!11028 thiss!1504)) e!166901)))

(declare-fun b!257499 () Bool)

(assert (=> b!257499 (= e!166901 e!166900)))

(declare-fun c!43582 () Bool)

(assert (=> b!257499 (= c!43582 (validKeyInArray!0 (select (arr!5930 lt!129254) #b00000000000000000000000000000000)))))

(assert (= (and d!61891 (not res!125952)) b!257499))

(assert (= (and b!257499 c!43582) b!257501))

(assert (= (and b!257499 (not c!43582)) b!257500))

(assert (= (and b!257501 res!125951) b!257502))

(assert (= (or b!257502 b!257500) bm!24430))

(declare-fun m!273001 () Bool)

(assert (=> bm!24430 m!273001))

(assert (=> b!257501 m!272929))

(declare-fun m!273003 () Bool)

(assert (=> b!257501 m!273003))

(declare-fun m!273005 () Bool)

(assert (=> b!257501 m!273005))

(assert (=> b!257501 m!272929))

(declare-fun m!273007 () Bool)

(assert (=> b!257501 m!273007))

(assert (=> b!257499 m!272929))

(assert (=> b!257499 m!272929))

(assert (=> b!257499 m!272939))

(assert (=> b!257153 d!61891))

(declare-fun d!61893 () Bool)

(declare-fun res!125961 () Bool)

(declare-fun e!166913 () Bool)

(assert (=> d!61893 (=> res!125961 e!166913)))

(assert (=> d!61893 (= res!125961 (bvsge #b00000000000000000000000000000000 (size!6277 lt!129254)))))

(assert (=> d!61893 (= (arrayNoDuplicates!0 lt!129254 #b00000000000000000000000000000000 Nil!3710) e!166913)))

(declare-fun b!257513 () Bool)

(declare-fun e!166912 () Bool)

(declare-fun e!166911 () Bool)

(assert (=> b!257513 (= e!166912 e!166911)))

(declare-fun c!43585 () Bool)

(assert (=> b!257513 (= c!43585 (validKeyInArray!0 (select (arr!5930 lt!129254) #b00000000000000000000000000000000)))))

(declare-fun b!257514 () Bool)

(declare-fun call!24436 () Bool)

(assert (=> b!257514 (= e!166911 call!24436)))

(declare-fun b!257515 () Bool)

(assert (=> b!257515 (= e!166913 e!166912)))

(declare-fun res!125959 () Bool)

(assert (=> b!257515 (=> (not res!125959) (not e!166912))))

(declare-fun e!166914 () Bool)

(assert (=> b!257515 (= res!125959 (not e!166914))))

(declare-fun res!125960 () Bool)

(assert (=> b!257515 (=> (not res!125960) (not e!166914))))

(assert (=> b!257515 (= res!125960 (validKeyInArray!0 (select (arr!5930 lt!129254) #b00000000000000000000000000000000)))))

(declare-fun bm!24433 () Bool)

(assert (=> bm!24433 (= call!24436 (arrayNoDuplicates!0 lt!129254 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43585 (Cons!3709 (select (arr!5930 lt!129254) #b00000000000000000000000000000000) Nil!3710) Nil!3710)))))

(declare-fun b!257516 () Bool)

(declare-fun contains!1849 (List!3713 (_ BitVec 64)) Bool)

(assert (=> b!257516 (= e!166914 (contains!1849 Nil!3710 (select (arr!5930 lt!129254) #b00000000000000000000000000000000)))))

(declare-fun b!257517 () Bool)

(assert (=> b!257517 (= e!166911 call!24436)))

(assert (= (and d!61893 (not res!125961)) b!257515))

(assert (= (and b!257515 res!125960) b!257516))

(assert (= (and b!257515 res!125959) b!257513))

(assert (= (and b!257513 c!43585) b!257517))

(assert (= (and b!257513 (not c!43585)) b!257514))

(assert (= (or b!257517 b!257514) bm!24433))

(assert (=> b!257513 m!272929))

(assert (=> b!257513 m!272929))

(assert (=> b!257513 m!272939))

(assert (=> b!257515 m!272929))

(assert (=> b!257515 m!272929))

(assert (=> b!257515 m!272939))

(assert (=> bm!24433 m!272929))

(declare-fun m!273009 () Bool)

(assert (=> bm!24433 m!273009))

(assert (=> b!257516 m!272929))

(assert (=> b!257516 m!272929))

(declare-fun m!273011 () Bool)

(assert (=> b!257516 m!273011))

(assert (=> b!257153 d!61893))

(assert (=> bm!24375 d!61883))

(declare-fun b!257524 () Bool)

(declare-fun e!166920 () Bool)

(assert (=> b!257524 (= e!166920 tp_is_empty!6589)))

(declare-fun mapIsEmpty!11226 () Bool)

(declare-fun mapRes!11226 () Bool)

(assert (=> mapIsEmpty!11226 mapRes!11226))

(declare-fun b!257525 () Bool)

(declare-fun e!166919 () Bool)

(assert (=> b!257525 (= e!166919 tp_is_empty!6589)))

(declare-fun condMapEmpty!11226 () Bool)

(declare-fun mapDefault!11226 () ValueCell!2951)

(assert (=> mapNonEmpty!11217 (= condMapEmpty!11226 (= mapRest!11217 ((as const (Array (_ BitVec 32) ValueCell!2951)) mapDefault!11226)))))

(assert (=> mapNonEmpty!11217 (= tp!23487 (and e!166919 mapRes!11226))))

(declare-fun mapNonEmpty!11226 () Bool)

(declare-fun tp!23502 () Bool)

(assert (=> mapNonEmpty!11226 (= mapRes!11226 (and tp!23502 e!166920))))

(declare-fun mapValue!11226 () ValueCell!2951)

(declare-fun mapRest!11226 () (Array (_ BitVec 32) ValueCell!2951))

(declare-fun mapKey!11226 () (_ BitVec 32))

(assert (=> mapNonEmpty!11226 (= mapRest!11217 (store mapRest!11226 mapKey!11226 mapValue!11226))))

(assert (= (and mapNonEmpty!11217 condMapEmpty!11226) mapIsEmpty!11226))

(assert (= (and mapNonEmpty!11217 (not condMapEmpty!11226)) mapNonEmpty!11226))

(assert (= (and mapNonEmpty!11226 ((_ is ValueCellFull!2951) mapValue!11226)) b!257524))

(assert (= (and mapNonEmpty!11217 ((_ is ValueCellFull!2951) mapDefault!11226)) b!257525))

(declare-fun m!273013 () Bool)

(assert (=> mapNonEmpty!11226 m!273013))

(declare-fun b_lambda!8205 () Bool)

(assert (= b_lambda!8203 (or (and b!257142 b_free!6727) b_lambda!8205)))

(declare-fun b_lambda!8207 () Bool)

(assert (= b_lambda!8201 (or (and b!257142 b_free!6727) b_lambda!8207)))

(check-sat (not d!61871) (not d!61847) (not b_lambda!8207) (not b!257482) (not b!257401) (not b!257513) (not b!257424) (not bm!24406) (not bm!24427) (not bm!24415) (not b!257453) (not b!257452) (not bm!24404) (not b!257339) (not b!257515) (not b!257407) (not b!257443) (not b!257286) (not bm!24419) (not b!257343) (not d!61855) (not b!257471) (not b!257446) (not b!257426) (not bm!24421) b_and!13815 (not b!257489) (not b!257479) (not bm!24426) (not b!257284) (not d!61849) (not bm!24414) (not b!257390) (not mapNonEmpty!11226) (not b!257340) (not bm!24418) (not b_next!6727) (not b!257499) (not b!257332) (not b_lambda!8205) (not d!61865) (not d!61859) (not b!257451) (not b!257437) (not b!257501) (not d!61857) (not d!61873) (not bm!24405) (not b!257467) (not b!257402) (not b!257423) (not b!257449) (not bm!24403) (not b!257336) (not b!257450) (not bm!24433) (not d!61863) (not d!61885) (not d!61877) (not b!257341) (not b!257413) (not b!257414) (not b!257477) (not bm!24430) (not d!61867) (not b!257442) (not bm!24420) (not b!257333) (not b!257342) (not bm!24422) (not b!257516) (not b!257462) (not b!257400) tp_is_empty!6589 (not d!61875) (not d!61879) (not b!257485) (not d!61843))
(check-sat b_and!13815 (not b_next!6727))
