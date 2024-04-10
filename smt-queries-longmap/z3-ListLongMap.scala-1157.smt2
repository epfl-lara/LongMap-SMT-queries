; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24292 () Bool)

(assert start!24292)

(declare-fun b!254624 () Bool)

(declare-fun b_free!6693 () Bool)

(declare-fun b_next!6693 () Bool)

(assert (=> b!254624 (= b_free!6693 (not b_next!6693))))

(declare-fun tp!23367 () Bool)

(declare-fun b_and!13735 () Bool)

(assert (=> b!254624 (= tp!23367 b_and!13735)))

(declare-fun e!165050 () Bool)

(declare-datatypes ((V!8387 0))(
  ( (V!8388 (val!3322 Int)) )
))
(declare-datatypes ((ValueCell!2934 0))(
  ( (ValueCellFull!2934 (v!5396 V!8387)) (EmptyCell!2934) )
))
(declare-datatypes ((array!12441 0))(
  ( (array!12442 (arr!5896 (Array (_ BitVec 32) ValueCell!2934)) (size!6243 (_ BitVec 32))) )
))
(declare-datatypes ((array!12443 0))(
  ( (array!12444 (arr!5897 (Array (_ BitVec 32) (_ BitVec 64))) (size!6244 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3768 0))(
  ( (LongMapFixedSize!3769 (defaultEntry!4697 Int) (mask!10945 (_ BitVec 32)) (extraKeys!4434 (_ BitVec 32)) (zeroValue!4538 V!8387) (minValue!4538 V!8387) (_size!1933 (_ BitVec 32)) (_keys!6851 array!12443) (_values!4680 array!12441) (_vacant!1933 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3768)

(declare-fun e!165053 () Bool)

(declare-fun tp_is_empty!6555 () Bool)

(declare-fun array_inv!3899 (array!12443) Bool)

(declare-fun array_inv!3900 (array!12441) Bool)

(assert (=> b!254624 (= e!165050 (and tp!23367 tp_is_empty!6555 (array_inv!3899 (_keys!6851 thiss!1504)) (array_inv!3900 (_values!4680 thiss!1504)) e!165053))))

(declare-fun b!254625 () Bool)

(declare-fun e!165048 () Bool)

(assert (=> b!254625 (= e!165048 tp_is_empty!6555)))

(declare-fun call!24024 () Bool)

(declare-fun c!42950 () Bool)

(declare-datatypes ((SeekEntryResult!1152 0))(
  ( (MissingZero!1152 (index!6778 (_ BitVec 32))) (Found!1152 (index!6779 (_ BitVec 32))) (Intermediate!1152 (undefined!1964 Bool) (index!6780 (_ BitVec 32)) (x!24876 (_ BitVec 32))) (Undefined!1152) (MissingVacant!1152 (index!6781 (_ BitVec 32))) )
))
(declare-fun lt!127601 () SeekEntryResult!1152)

(declare-fun bm!24021 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24021 (= call!24024 (inRange!0 (ite c!42950 (index!6778 lt!127601) (index!6781 lt!127601)) (mask!10945 thiss!1504)))))

(declare-fun mapIsEmpty!11148 () Bool)

(declare-fun mapRes!11148 () Bool)

(assert (=> mapIsEmpty!11148 mapRes!11148))

(declare-fun b!254627 () Bool)

(declare-fun c!42947 () Bool)

(get-info :version)

(assert (=> b!254627 (= c!42947 ((_ is MissingVacant!1152) lt!127601))))

(declare-fun e!165054 () Bool)

(declare-fun e!165059 () Bool)

(assert (=> b!254627 (= e!165054 e!165059)))

(declare-fun b!254628 () Bool)

(declare-datatypes ((Unit!7896 0))(
  ( (Unit!7897) )
))
(declare-fun e!165056 () Unit!7896)

(declare-fun Unit!7898 () Unit!7896)

(assert (=> b!254628 (= e!165056 Unit!7898)))

(declare-fun lt!127600 () Unit!7896)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!225 (array!12443 array!12441 (_ BitVec 32) (_ BitVec 32) V!8387 V!8387 (_ BitVec 64) (_ BitVec 32) Int) Unit!7896)

(assert (=> b!254628 (= lt!127600 (lemmaArrayContainsKeyThenInListMap!225 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(assert (=> b!254628 false))

(declare-fun b!254629 () Bool)

(declare-fun e!165055 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!254629 (= e!165055 (not (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6244 (_keys!6851 thiss!1504))))))))

(declare-datatypes ((tuple2!4892 0))(
  ( (tuple2!4893 (_1!2457 (_ BitVec 64)) (_2!2457 V!8387)) )
))
(declare-datatypes ((List!3773 0))(
  ( (Nil!3770) (Cons!3769 (h!4431 tuple2!4892) (t!8820 List!3773)) )
))
(declare-datatypes ((ListLongMap!3805 0))(
  ( (ListLongMap!3806 (toList!1918 List!3773)) )
))
(declare-fun lt!127594 () ListLongMap!3805)

(declare-fun v!346 () V!8387)

(declare-fun lt!127595 () array!12443)

(declare-fun +!674 (ListLongMap!3805 tuple2!4892) ListLongMap!3805)

(declare-fun getCurrentListMap!1446 (array!12443 array!12441 (_ BitVec 32) (_ BitVec 32) V!8387 V!8387 (_ BitVec 32) Int) ListLongMap!3805)

(assert (=> b!254629 (= (+!674 lt!127594 (tuple2!4893 key!932 v!346)) (getCurrentListMap!1446 lt!127595 (array!12442 (store (arr!5896 (_values!4680 thiss!1504)) index!297 (ValueCellFull!2934 v!346)) (size!6243 (_values!4680 thiss!1504))) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(declare-fun lt!127593 () Unit!7896)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!84 (array!12443 array!12441 (_ BitVec 32) (_ BitVec 32) V!8387 V!8387 (_ BitVec 32) (_ BitVec 64) V!8387 Int) Unit!7896)

(assert (=> b!254629 (= lt!127593 (lemmaAddValidKeyToArrayThenAddPairToListMap!84 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) index!297 key!932 v!346 (defaultEntry!4697 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12443 (_ BitVec 32)) Bool)

(assert (=> b!254629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127595 (mask!10945 thiss!1504))))

(declare-fun lt!127596 () Unit!7896)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12443 (_ BitVec 32) (_ BitVec 32)) Unit!7896)

(assert (=> b!254629 (= lt!127596 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6851 thiss!1504) index!297 (mask!10945 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12443 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254629 (= (arrayCountValidKeys!0 lt!127595 #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6851 thiss!1504) #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504)))))))

(declare-fun lt!127604 () Unit!7896)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12443 (_ BitVec 32) (_ BitVec 64)) Unit!7896)

(assert (=> b!254629 (= lt!127604 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6851 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3774 0))(
  ( (Nil!3771) (Cons!3770 (h!4432 (_ BitVec 64)) (t!8821 List!3774)) )
))
(declare-fun arrayNoDuplicates!0 (array!12443 (_ BitVec 32) List!3774) Bool)

(assert (=> b!254629 (arrayNoDuplicates!0 lt!127595 #b00000000000000000000000000000000 Nil!3771)))

(assert (=> b!254629 (= lt!127595 (array!12444 (store (arr!5897 (_keys!6851 thiss!1504)) index!297 key!932) (size!6244 (_keys!6851 thiss!1504))))))

(declare-fun lt!127598 () Unit!7896)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12443 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3774) Unit!7896)

(assert (=> b!254629 (= lt!127598 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6851 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3771))))

(declare-fun lt!127602 () Unit!7896)

(assert (=> b!254629 (= lt!127602 e!165056)))

(declare-fun c!42948 () Bool)

(declare-fun arrayContainsKey!0 (array!12443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!254629 (= c!42948 (arrayContainsKey!0 (_keys!6851 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254630 () Bool)

(assert (=> b!254630 (= e!165059 ((_ is Undefined!1152) lt!127601))))

(declare-fun bm!24022 () Bool)

(declare-fun call!24025 () Bool)

(assert (=> bm!24022 (= call!24025 (arrayContainsKey!0 (_keys!6851 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254631 () Bool)

(declare-fun e!165052 () Unit!7896)

(declare-fun lt!127599 () Unit!7896)

(assert (=> b!254631 (= e!165052 lt!127599)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!422 (array!12443 array!12441 (_ BitVec 32) (_ BitVec 32) V!8387 V!8387 (_ BitVec 64) Int) Unit!7896)

(assert (=> b!254631 (= lt!127599 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!422 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) key!932 (defaultEntry!4697 thiss!1504)))))

(assert (=> b!254631 (= c!42950 ((_ is MissingZero!1152) lt!127601))))

(assert (=> b!254631 e!165054))

(declare-fun b!254632 () Bool)

(declare-fun e!165057 () Bool)

(declare-fun e!165051 () Bool)

(assert (=> b!254632 (= e!165057 e!165051)))

(declare-fun res!124644 () Bool)

(assert (=> b!254632 (=> (not res!124644) (not e!165051))))

(assert (=> b!254632 (= res!124644 (or (= lt!127601 (MissingZero!1152 index!297)) (= lt!127601 (MissingVacant!1152 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12443 (_ BitVec 32)) SeekEntryResult!1152)

(assert (=> b!254632 (= lt!127601 (seekEntryOrOpen!0 key!932 (_keys!6851 thiss!1504) (mask!10945 thiss!1504)))))

(declare-fun b!254633 () Bool)

(declare-fun Unit!7899 () Unit!7896)

(assert (=> b!254633 (= e!165056 Unit!7899)))

(declare-fun b!254634 () Bool)

(assert (=> b!254634 (= e!165053 (and e!165048 mapRes!11148))))

(declare-fun condMapEmpty!11148 () Bool)

(declare-fun mapDefault!11148 () ValueCell!2934)

(assert (=> b!254634 (= condMapEmpty!11148 (= (arr!5896 (_values!4680 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2934)) mapDefault!11148)))))

(declare-fun res!124642 () Bool)

(assert (=> start!24292 (=> (not res!124642) (not e!165057))))

(declare-fun valid!1473 (LongMapFixedSize!3768) Bool)

(assert (=> start!24292 (= res!124642 (valid!1473 thiss!1504))))

(assert (=> start!24292 e!165057))

(assert (=> start!24292 e!165050))

(assert (=> start!24292 true))

(assert (=> start!24292 tp_is_empty!6555))

(declare-fun b!254626 () Bool)

(declare-fun res!124641 () Bool)

(assert (=> b!254626 (=> (not res!124641) (not e!165057))))

(assert (=> b!254626 (= res!124641 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!254635 () Bool)

(declare-fun e!165049 () Bool)

(assert (=> b!254635 (= e!165059 e!165049)))

(declare-fun res!124640 () Bool)

(assert (=> b!254635 (= res!124640 call!24024)))

(assert (=> b!254635 (=> (not res!124640) (not e!165049))))

(declare-fun b!254636 () Bool)

(declare-fun e!165061 () Bool)

(assert (=> b!254636 (= e!165061 tp_is_empty!6555)))

(declare-fun b!254637 () Bool)

(declare-fun res!124643 () Bool)

(declare-fun e!165060 () Bool)

(assert (=> b!254637 (=> (not res!124643) (not e!165060))))

(assert (=> b!254637 (= res!124643 (= (select (arr!5897 (_keys!6851 thiss!1504)) (index!6778 lt!127601)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254638 () Bool)

(assert (=> b!254638 (= e!165051 e!165055)))

(declare-fun res!124647 () Bool)

(assert (=> b!254638 (=> (not res!124647) (not e!165055))))

(assert (=> b!254638 (= res!124647 (inRange!0 index!297 (mask!10945 thiss!1504)))))

(declare-fun lt!127603 () Unit!7896)

(assert (=> b!254638 (= lt!127603 e!165052)))

(declare-fun c!42949 () Bool)

(declare-fun contains!1848 (ListLongMap!3805 (_ BitVec 64)) Bool)

(assert (=> b!254638 (= c!42949 (contains!1848 lt!127594 key!932))))

(assert (=> b!254638 (= lt!127594 (getCurrentListMap!1446 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(declare-fun b!254639 () Bool)

(assert (=> b!254639 (= e!165049 (not call!24025))))

(declare-fun b!254640 () Bool)

(declare-fun Unit!7900 () Unit!7896)

(assert (=> b!254640 (= e!165052 Unit!7900)))

(declare-fun lt!127597 () Unit!7896)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!419 (array!12443 array!12441 (_ BitVec 32) (_ BitVec 32) V!8387 V!8387 (_ BitVec 64) Int) Unit!7896)

(assert (=> b!254640 (= lt!127597 (lemmaInListMapThenSeekEntryOrOpenFindsIt!419 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) key!932 (defaultEntry!4697 thiss!1504)))))

(assert (=> b!254640 false))

(declare-fun b!254641 () Bool)

(declare-fun res!124645 () Bool)

(assert (=> b!254641 (= res!124645 (= (select (arr!5897 (_keys!6851 thiss!1504)) (index!6781 lt!127601)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254641 (=> (not res!124645) (not e!165049))))

(declare-fun b!254642 () Bool)

(assert (=> b!254642 (= e!165060 (not call!24025))))

(declare-fun b!254643 () Bool)

(declare-fun res!124646 () Bool)

(assert (=> b!254643 (=> (not res!124646) (not e!165060))))

(assert (=> b!254643 (= res!124646 call!24024)))

(assert (=> b!254643 (= e!165054 e!165060)))

(declare-fun mapNonEmpty!11148 () Bool)

(declare-fun tp!23366 () Bool)

(assert (=> mapNonEmpty!11148 (= mapRes!11148 (and tp!23366 e!165061))))

(declare-fun mapKey!11148 () (_ BitVec 32))

(declare-fun mapValue!11148 () ValueCell!2934)

(declare-fun mapRest!11148 () (Array (_ BitVec 32) ValueCell!2934))

(assert (=> mapNonEmpty!11148 (= (arr!5896 (_values!4680 thiss!1504)) (store mapRest!11148 mapKey!11148 mapValue!11148))))

(assert (= (and start!24292 res!124642) b!254626))

(assert (= (and b!254626 res!124641) b!254632))

(assert (= (and b!254632 res!124644) b!254638))

(assert (= (and b!254638 c!42949) b!254640))

(assert (= (and b!254638 (not c!42949)) b!254631))

(assert (= (and b!254631 c!42950) b!254643))

(assert (= (and b!254631 (not c!42950)) b!254627))

(assert (= (and b!254643 res!124646) b!254637))

(assert (= (and b!254637 res!124643) b!254642))

(assert (= (and b!254627 c!42947) b!254635))

(assert (= (and b!254627 (not c!42947)) b!254630))

(assert (= (and b!254635 res!124640) b!254641))

(assert (= (and b!254641 res!124645) b!254639))

(assert (= (or b!254643 b!254635) bm!24021))

(assert (= (or b!254642 b!254639) bm!24022))

(assert (= (and b!254638 res!124647) b!254629))

(assert (= (and b!254629 c!42948) b!254628))

(assert (= (and b!254629 (not c!42948)) b!254633))

(assert (= (and b!254634 condMapEmpty!11148) mapIsEmpty!11148))

(assert (= (and b!254634 (not condMapEmpty!11148)) mapNonEmpty!11148))

(assert (= (and mapNonEmpty!11148 ((_ is ValueCellFull!2934) mapValue!11148)) b!254636))

(assert (= (and b!254634 ((_ is ValueCellFull!2934) mapDefault!11148)) b!254625))

(assert (= b!254624 b!254634))

(assert (= start!24292 b!254624))

(declare-fun m!270159 () Bool)

(assert (=> start!24292 m!270159))

(declare-fun m!270161 () Bool)

(assert (=> b!254631 m!270161))

(declare-fun m!270163 () Bool)

(assert (=> b!254624 m!270163))

(declare-fun m!270165 () Bool)

(assert (=> b!254624 m!270165))

(declare-fun m!270167 () Bool)

(assert (=> mapNonEmpty!11148 m!270167))

(declare-fun m!270169 () Bool)

(assert (=> b!254641 m!270169))

(declare-fun m!270171 () Bool)

(assert (=> bm!24022 m!270171))

(declare-fun m!270173 () Bool)

(assert (=> b!254628 m!270173))

(declare-fun m!270175 () Bool)

(assert (=> b!254638 m!270175))

(declare-fun m!270177 () Bool)

(assert (=> b!254638 m!270177))

(declare-fun m!270179 () Bool)

(assert (=> b!254638 m!270179))

(declare-fun m!270181 () Bool)

(assert (=> b!254640 m!270181))

(declare-fun m!270183 () Bool)

(assert (=> b!254637 m!270183))

(assert (=> b!254629 m!270171))

(declare-fun m!270185 () Bool)

(assert (=> b!254629 m!270185))

(declare-fun m!270187 () Bool)

(assert (=> b!254629 m!270187))

(declare-fun m!270189 () Bool)

(assert (=> b!254629 m!270189))

(declare-fun m!270191 () Bool)

(assert (=> b!254629 m!270191))

(declare-fun m!270193 () Bool)

(assert (=> b!254629 m!270193))

(declare-fun m!270195 () Bool)

(assert (=> b!254629 m!270195))

(declare-fun m!270197 () Bool)

(assert (=> b!254629 m!270197))

(declare-fun m!270199 () Bool)

(assert (=> b!254629 m!270199))

(declare-fun m!270201 () Bool)

(assert (=> b!254629 m!270201))

(declare-fun m!270203 () Bool)

(assert (=> b!254629 m!270203))

(declare-fun m!270205 () Bool)

(assert (=> b!254629 m!270205))

(declare-fun m!270207 () Bool)

(assert (=> b!254629 m!270207))

(declare-fun m!270209 () Bool)

(assert (=> bm!24021 m!270209))

(declare-fun m!270211 () Bool)

(assert (=> b!254632 m!270211))

(check-sat (not b_next!6693) (not start!24292) (not b!254628) (not b!254638) (not b!254631) (not b!254640) (not bm!24022) tp_is_empty!6555 (not mapNonEmpty!11148) (not b!254624) (not bm!24021) (not b!254629) (not b!254632) b_and!13735)
(check-sat b_and!13735 (not b_next!6693))
(get-model)

(declare-fun d!61485 () Bool)

(declare-fun res!124676 () Bool)

(declare-fun e!165108 () Bool)

(assert (=> d!61485 (=> res!124676 e!165108)))

(assert (=> d!61485 (= res!124676 (= (select (arr!5897 (_keys!6851 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61485 (= (arrayContainsKey!0 (_keys!6851 thiss!1504) key!932 #b00000000000000000000000000000000) e!165108)))

(declare-fun b!254708 () Bool)

(declare-fun e!165109 () Bool)

(assert (=> b!254708 (= e!165108 e!165109)))

(declare-fun res!124677 () Bool)

(assert (=> b!254708 (=> (not res!124677) (not e!165109))))

(assert (=> b!254708 (= res!124677 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6244 (_keys!6851 thiss!1504))))))

(declare-fun b!254709 () Bool)

(assert (=> b!254709 (= e!165109 (arrayContainsKey!0 (_keys!6851 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61485 (not res!124676)) b!254708))

(assert (= (and b!254708 res!124677) b!254709))

(declare-fun m!270267 () Bool)

(assert (=> d!61485 m!270267))

(declare-fun m!270269 () Bool)

(assert (=> b!254709 m!270269))

(assert (=> bm!24022 d!61485))

(declare-fun b!254726 () Bool)

(declare-fun res!124689 () Bool)

(declare-fun e!165121 () Bool)

(assert (=> b!254726 (=> (not res!124689) (not e!165121))))

(declare-fun call!24036 () Bool)

(assert (=> b!254726 (= res!124689 call!24036)))

(declare-fun e!165118 () Bool)

(assert (=> b!254726 (= e!165118 e!165121)))

(declare-fun d!61487 () Bool)

(declare-fun e!165119 () Bool)

(assert (=> d!61487 e!165119))

(declare-fun c!42967 () Bool)

(declare-fun lt!127646 () SeekEntryResult!1152)

(assert (=> d!61487 (= c!42967 ((_ is MissingZero!1152) lt!127646))))

(assert (=> d!61487 (= lt!127646 (seekEntryOrOpen!0 key!932 (_keys!6851 thiss!1504) (mask!10945 thiss!1504)))))

(declare-fun lt!127645 () Unit!7896)

(declare-fun choose!1212 (array!12443 array!12441 (_ BitVec 32) (_ BitVec 32) V!8387 V!8387 (_ BitVec 64) Int) Unit!7896)

(assert (=> d!61487 (= lt!127645 (choose!1212 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) key!932 (defaultEntry!4697 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61487 (validMask!0 (mask!10945 thiss!1504))))

(assert (=> d!61487 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!422 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) key!932 (defaultEntry!4697 thiss!1504)) lt!127645)))

(declare-fun b!254727 () Bool)

(declare-fun e!165120 () Bool)

(declare-fun call!24037 () Bool)

(assert (=> b!254727 (= e!165120 (not call!24037))))

(declare-fun b!254728 () Bool)

(assert (=> b!254728 (= e!165118 ((_ is Undefined!1152) lt!127646))))

(declare-fun b!254729 () Bool)

(assert (=> b!254729 (= e!165119 e!165120)))

(declare-fun res!124686 () Bool)

(assert (=> b!254729 (= res!124686 call!24036)))

(assert (=> b!254729 (=> (not res!124686) (not e!165120))))

(declare-fun b!254730 () Bool)

(assert (=> b!254730 (and (bvsge (index!6778 lt!127646) #b00000000000000000000000000000000) (bvslt (index!6778 lt!127646) (size!6244 (_keys!6851 thiss!1504))))))

(declare-fun res!124687 () Bool)

(assert (=> b!254730 (= res!124687 (= (select (arr!5897 (_keys!6851 thiss!1504)) (index!6778 lt!127646)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254730 (=> (not res!124687) (not e!165120))))

(declare-fun b!254731 () Bool)

(declare-fun res!124688 () Bool)

(assert (=> b!254731 (=> (not res!124688) (not e!165121))))

(assert (=> b!254731 (= res!124688 (= (select (arr!5897 (_keys!6851 thiss!1504)) (index!6781 lt!127646)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254731 (and (bvsge (index!6781 lt!127646) #b00000000000000000000000000000000) (bvslt (index!6781 lt!127646) (size!6244 (_keys!6851 thiss!1504))))))

(declare-fun b!254732 () Bool)

(assert (=> b!254732 (= e!165121 (not call!24037))))

(declare-fun bm!24033 () Bool)

(assert (=> bm!24033 (= call!24037 (arrayContainsKey!0 (_keys!6851 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!24034 () Bool)

(assert (=> bm!24034 (= call!24036 (inRange!0 (ite c!42967 (index!6778 lt!127646) (index!6781 lt!127646)) (mask!10945 thiss!1504)))))

(declare-fun b!254733 () Bool)

(assert (=> b!254733 (= e!165119 e!165118)))

(declare-fun c!42968 () Bool)

(assert (=> b!254733 (= c!42968 ((_ is MissingVacant!1152) lt!127646))))

(assert (= (and d!61487 c!42967) b!254729))

(assert (= (and d!61487 (not c!42967)) b!254733))

(assert (= (and b!254729 res!124686) b!254730))

(assert (= (and b!254730 res!124687) b!254727))

(assert (= (and b!254733 c!42968) b!254726))

(assert (= (and b!254733 (not c!42968)) b!254728))

(assert (= (and b!254726 res!124689) b!254731))

(assert (= (and b!254731 res!124688) b!254732))

(assert (= (or b!254729 b!254726) bm!24034))

(assert (= (or b!254727 b!254732) bm!24033))

(declare-fun m!270271 () Bool)

(assert (=> b!254731 m!270271))

(assert (=> d!61487 m!270211))

(declare-fun m!270273 () Bool)

(assert (=> d!61487 m!270273))

(declare-fun m!270275 () Bool)

(assert (=> d!61487 m!270275))

(declare-fun m!270277 () Bool)

(assert (=> b!254730 m!270277))

(assert (=> bm!24033 m!270171))

(declare-fun m!270279 () Bool)

(assert (=> bm!24034 m!270279))

(assert (=> b!254631 d!61487))

(declare-fun d!61489 () Bool)

(assert (=> d!61489 (= (array_inv!3899 (_keys!6851 thiss!1504)) (bvsge (size!6244 (_keys!6851 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!254624 d!61489))

(declare-fun d!61491 () Bool)

(assert (=> d!61491 (= (array_inv!3900 (_values!4680 thiss!1504)) (bvsge (size!6243 (_values!4680 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!254624 d!61491))

(declare-fun b!254746 () Bool)

(declare-fun e!165129 () SeekEntryResult!1152)

(assert (=> b!254746 (= e!165129 Undefined!1152)))

(declare-fun b!254747 () Bool)

(declare-fun e!165128 () SeekEntryResult!1152)

(declare-fun lt!127655 () SeekEntryResult!1152)

(assert (=> b!254747 (= e!165128 (MissingZero!1152 (index!6780 lt!127655)))))

(declare-fun b!254748 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12443 (_ BitVec 32)) SeekEntryResult!1152)

(assert (=> b!254748 (= e!165128 (seekKeyOrZeroReturnVacant!0 (x!24876 lt!127655) (index!6780 lt!127655) (index!6780 lt!127655) key!932 (_keys!6851 thiss!1504) (mask!10945 thiss!1504)))))

(declare-fun b!254750 () Bool)

(declare-fun c!42975 () Bool)

(declare-fun lt!127654 () (_ BitVec 64))

(assert (=> b!254750 (= c!42975 (= lt!127654 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165130 () SeekEntryResult!1152)

(assert (=> b!254750 (= e!165130 e!165128)))

(declare-fun b!254751 () Bool)

(assert (=> b!254751 (= e!165129 e!165130)))

(assert (=> b!254751 (= lt!127654 (select (arr!5897 (_keys!6851 thiss!1504)) (index!6780 lt!127655)))))

(declare-fun c!42977 () Bool)

(assert (=> b!254751 (= c!42977 (= lt!127654 key!932))))

(declare-fun d!61493 () Bool)

(declare-fun lt!127653 () SeekEntryResult!1152)

(assert (=> d!61493 (and (or ((_ is Undefined!1152) lt!127653) (not ((_ is Found!1152) lt!127653)) (and (bvsge (index!6779 lt!127653) #b00000000000000000000000000000000) (bvslt (index!6779 lt!127653) (size!6244 (_keys!6851 thiss!1504))))) (or ((_ is Undefined!1152) lt!127653) ((_ is Found!1152) lt!127653) (not ((_ is MissingZero!1152) lt!127653)) (and (bvsge (index!6778 lt!127653) #b00000000000000000000000000000000) (bvslt (index!6778 lt!127653) (size!6244 (_keys!6851 thiss!1504))))) (or ((_ is Undefined!1152) lt!127653) ((_ is Found!1152) lt!127653) ((_ is MissingZero!1152) lt!127653) (not ((_ is MissingVacant!1152) lt!127653)) (and (bvsge (index!6781 lt!127653) #b00000000000000000000000000000000) (bvslt (index!6781 lt!127653) (size!6244 (_keys!6851 thiss!1504))))) (or ((_ is Undefined!1152) lt!127653) (ite ((_ is Found!1152) lt!127653) (= (select (arr!5897 (_keys!6851 thiss!1504)) (index!6779 lt!127653)) key!932) (ite ((_ is MissingZero!1152) lt!127653) (= (select (arr!5897 (_keys!6851 thiss!1504)) (index!6778 lt!127653)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1152) lt!127653) (= (select (arr!5897 (_keys!6851 thiss!1504)) (index!6781 lt!127653)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61493 (= lt!127653 e!165129)))

(declare-fun c!42976 () Bool)

(assert (=> d!61493 (= c!42976 (and ((_ is Intermediate!1152) lt!127655) (undefined!1964 lt!127655)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12443 (_ BitVec 32)) SeekEntryResult!1152)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61493 (= lt!127655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10945 thiss!1504)) key!932 (_keys!6851 thiss!1504) (mask!10945 thiss!1504)))))

(assert (=> d!61493 (validMask!0 (mask!10945 thiss!1504))))

(assert (=> d!61493 (= (seekEntryOrOpen!0 key!932 (_keys!6851 thiss!1504) (mask!10945 thiss!1504)) lt!127653)))

(declare-fun b!254749 () Bool)

(assert (=> b!254749 (= e!165130 (Found!1152 (index!6780 lt!127655)))))

(assert (= (and d!61493 c!42976) b!254746))

(assert (= (and d!61493 (not c!42976)) b!254751))

(assert (= (and b!254751 c!42977) b!254749))

(assert (= (and b!254751 (not c!42977)) b!254750))

(assert (= (and b!254750 c!42975) b!254747))

(assert (= (and b!254750 (not c!42975)) b!254748))

(declare-fun m!270281 () Bool)

(assert (=> b!254748 m!270281))

(declare-fun m!270283 () Bool)

(assert (=> b!254751 m!270283))

(declare-fun m!270285 () Bool)

(assert (=> d!61493 m!270285))

(declare-fun m!270287 () Bool)

(assert (=> d!61493 m!270287))

(assert (=> d!61493 m!270285))

(declare-fun m!270289 () Bool)

(assert (=> d!61493 m!270289))

(declare-fun m!270291 () Bool)

(assert (=> d!61493 m!270291))

(assert (=> d!61493 m!270275))

(declare-fun m!270293 () Bool)

(assert (=> d!61493 m!270293))

(assert (=> b!254632 d!61493))

(declare-fun d!61495 () Bool)

(assert (=> d!61495 (contains!1848 (getCurrentListMap!1446 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)) key!932)))

(declare-fun lt!127658 () Unit!7896)

(declare-fun choose!1213 (array!12443 array!12441 (_ BitVec 32) (_ BitVec 32) V!8387 V!8387 (_ BitVec 64) (_ BitVec 32) Int) Unit!7896)

(assert (=> d!61495 (= lt!127658 (choose!1213 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(assert (=> d!61495 (validMask!0 (mask!10945 thiss!1504))))

(assert (=> d!61495 (= (lemmaArrayContainsKeyThenInListMap!225 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)) lt!127658)))

(declare-fun bs!9055 () Bool)

(assert (= bs!9055 d!61495))

(assert (=> bs!9055 m!270179))

(assert (=> bs!9055 m!270179))

(declare-fun m!270295 () Bool)

(assert (=> bs!9055 m!270295))

(declare-fun m!270297 () Bool)

(assert (=> bs!9055 m!270297))

(assert (=> bs!9055 m!270275))

(assert (=> b!254628 d!61495))

(declare-fun d!61497 () Bool)

(assert (=> d!61497 (= (inRange!0 index!297 (mask!10945 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10945 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!254638 d!61497))

(declare-fun d!61499 () Bool)

(declare-fun e!165136 () Bool)

(assert (=> d!61499 e!165136))

(declare-fun res!124692 () Bool)

(assert (=> d!61499 (=> res!124692 e!165136)))

(declare-fun lt!127670 () Bool)

(assert (=> d!61499 (= res!124692 (not lt!127670))))

(declare-fun lt!127667 () Bool)

(assert (=> d!61499 (= lt!127670 lt!127667)))

(declare-fun lt!127669 () Unit!7896)

(declare-fun e!165135 () Unit!7896)

(assert (=> d!61499 (= lt!127669 e!165135)))

(declare-fun c!42980 () Bool)

(assert (=> d!61499 (= c!42980 lt!127667)))

(declare-fun containsKey!297 (List!3773 (_ BitVec 64)) Bool)

(assert (=> d!61499 (= lt!127667 (containsKey!297 (toList!1918 lt!127594) key!932))))

(assert (=> d!61499 (= (contains!1848 lt!127594 key!932) lt!127670)))

(declare-fun b!254758 () Bool)

(declare-fun lt!127668 () Unit!7896)

(assert (=> b!254758 (= e!165135 lt!127668)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!245 (List!3773 (_ BitVec 64)) Unit!7896)

(assert (=> b!254758 (= lt!127668 (lemmaContainsKeyImpliesGetValueByKeyDefined!245 (toList!1918 lt!127594) key!932))))

(declare-datatypes ((Option!311 0))(
  ( (Some!310 (v!5400 V!8387)) (None!309) )
))
(declare-fun isDefined!246 (Option!311) Bool)

(declare-fun getValueByKey!305 (List!3773 (_ BitVec 64)) Option!311)

(assert (=> b!254758 (isDefined!246 (getValueByKey!305 (toList!1918 lt!127594) key!932))))

(declare-fun b!254759 () Bool)

(declare-fun Unit!7906 () Unit!7896)

(assert (=> b!254759 (= e!165135 Unit!7906)))

(declare-fun b!254760 () Bool)

(assert (=> b!254760 (= e!165136 (isDefined!246 (getValueByKey!305 (toList!1918 lt!127594) key!932)))))

(assert (= (and d!61499 c!42980) b!254758))

(assert (= (and d!61499 (not c!42980)) b!254759))

(assert (= (and d!61499 (not res!124692)) b!254760))

(declare-fun m!270299 () Bool)

(assert (=> d!61499 m!270299))

(declare-fun m!270301 () Bool)

(assert (=> b!254758 m!270301))

(declare-fun m!270303 () Bool)

(assert (=> b!254758 m!270303))

(assert (=> b!254758 m!270303))

(declare-fun m!270305 () Bool)

(assert (=> b!254758 m!270305))

(assert (=> b!254760 m!270303))

(assert (=> b!254760 m!270303))

(assert (=> b!254760 m!270305))

(assert (=> b!254638 d!61499))

(declare-fun b!254803 () Bool)

(declare-fun res!124711 () Bool)

(declare-fun e!165164 () Bool)

(assert (=> b!254803 (=> (not res!124711) (not e!165164))))

(declare-fun e!165175 () Bool)

(assert (=> b!254803 (= res!124711 e!165175)))

(declare-fun res!124716 () Bool)

(assert (=> b!254803 (=> res!124716 e!165175)))

(declare-fun e!165172 () Bool)

(assert (=> b!254803 (= res!124716 (not e!165172))))

(declare-fun res!124718 () Bool)

(assert (=> b!254803 (=> (not res!124718) (not e!165172))))

(assert (=> b!254803 (= res!124718 (bvslt #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))))))

(declare-fun b!254804 () Bool)

(declare-fun e!165173 () ListLongMap!3805)

(declare-fun call!24057 () ListLongMap!3805)

(assert (=> b!254804 (= e!165173 (+!674 call!24057 (tuple2!4893 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4538 thiss!1504))))))

(declare-fun b!254805 () Bool)

(declare-fun e!165165 () Unit!7896)

(declare-fun Unit!7907 () Unit!7896)

(assert (=> b!254805 (= e!165165 Unit!7907)))

(declare-fun b!254806 () Bool)

(declare-fun e!165174 () Bool)

(declare-fun lt!127730 () ListLongMap!3805)

(declare-fun apply!247 (ListLongMap!3805 (_ BitVec 64)) V!8387)

(assert (=> b!254806 (= e!165174 (= (apply!247 lt!127730 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4538 thiss!1504)))))

(declare-fun bm!24049 () Bool)

(declare-fun call!24052 () ListLongMap!3805)

(declare-fun call!24053 () ListLongMap!3805)

(assert (=> bm!24049 (= call!24052 call!24053)))

(declare-fun b!254807 () Bool)

(declare-fun e!165163 () ListLongMap!3805)

(assert (=> b!254807 (= e!165173 e!165163)))

(declare-fun c!42993 () Bool)

(assert (=> b!254807 (= c!42993 (and (not (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24050 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!569 (array!12443 array!12441 (_ BitVec 32) (_ BitVec 32) V!8387 V!8387 (_ BitVec 32) Int) ListLongMap!3805)

(assert (=> bm!24050 (= call!24053 (getCurrentListMapNoExtraKeys!569 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(declare-fun bm!24051 () Bool)

(declare-fun call!24055 () Bool)

(assert (=> bm!24051 (= call!24055 (contains!1848 lt!127730 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24052 () Bool)

(declare-fun call!24054 () ListLongMap!3805)

(assert (=> bm!24052 (= call!24054 call!24057)))

(declare-fun bm!24053 () Bool)

(declare-fun call!24058 () Bool)

(assert (=> bm!24053 (= call!24058 (contains!1848 lt!127730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254809 () Bool)

(declare-fun e!165167 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!254809 (= e!165167 (validKeyInArray!0 (select (arr!5897 (_keys!6851 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24054 () Bool)

(declare-fun call!24056 () ListLongMap!3805)

(assert (=> bm!24054 (= call!24056 call!24052)))

(declare-fun b!254810 () Bool)

(declare-fun e!165169 () Bool)

(assert (=> b!254810 (= e!165175 e!165169)))

(declare-fun res!124713 () Bool)

(assert (=> b!254810 (=> (not res!124713) (not e!165169))))

(assert (=> b!254810 (= res!124713 (contains!1848 lt!127730 (select (arr!5897 (_keys!6851 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!254810 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))))))

(declare-fun b!254811 () Bool)

(declare-fun lt!127721 () Unit!7896)

(assert (=> b!254811 (= e!165165 lt!127721)))

(declare-fun lt!127725 () ListLongMap!3805)

(assert (=> b!254811 (= lt!127725 (getCurrentListMapNoExtraKeys!569 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(declare-fun lt!127724 () (_ BitVec 64))

(assert (=> b!254811 (= lt!127724 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127716 () (_ BitVec 64))

(assert (=> b!254811 (= lt!127716 (select (arr!5897 (_keys!6851 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127722 () Unit!7896)

(declare-fun addStillContains!223 (ListLongMap!3805 (_ BitVec 64) V!8387 (_ BitVec 64)) Unit!7896)

(assert (=> b!254811 (= lt!127722 (addStillContains!223 lt!127725 lt!127724 (zeroValue!4538 thiss!1504) lt!127716))))

(assert (=> b!254811 (contains!1848 (+!674 lt!127725 (tuple2!4893 lt!127724 (zeroValue!4538 thiss!1504))) lt!127716)))

(declare-fun lt!127734 () Unit!7896)

(assert (=> b!254811 (= lt!127734 lt!127722)))

(declare-fun lt!127729 () ListLongMap!3805)

(assert (=> b!254811 (= lt!127729 (getCurrentListMapNoExtraKeys!569 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(declare-fun lt!127731 () (_ BitVec 64))

(assert (=> b!254811 (= lt!127731 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127736 () (_ BitVec 64))

(assert (=> b!254811 (= lt!127736 (select (arr!5897 (_keys!6851 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127726 () Unit!7896)

(declare-fun addApplyDifferent!223 (ListLongMap!3805 (_ BitVec 64) V!8387 (_ BitVec 64)) Unit!7896)

(assert (=> b!254811 (= lt!127726 (addApplyDifferent!223 lt!127729 lt!127731 (minValue!4538 thiss!1504) lt!127736))))

(assert (=> b!254811 (= (apply!247 (+!674 lt!127729 (tuple2!4893 lt!127731 (minValue!4538 thiss!1504))) lt!127736) (apply!247 lt!127729 lt!127736))))

(declare-fun lt!127728 () Unit!7896)

(assert (=> b!254811 (= lt!127728 lt!127726)))

(declare-fun lt!127735 () ListLongMap!3805)

(assert (=> b!254811 (= lt!127735 (getCurrentListMapNoExtraKeys!569 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(declare-fun lt!127733 () (_ BitVec 64))

(assert (=> b!254811 (= lt!127733 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127717 () (_ BitVec 64))

(assert (=> b!254811 (= lt!127717 (select (arr!5897 (_keys!6851 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127727 () Unit!7896)

(assert (=> b!254811 (= lt!127727 (addApplyDifferent!223 lt!127735 lt!127733 (zeroValue!4538 thiss!1504) lt!127717))))

(assert (=> b!254811 (= (apply!247 (+!674 lt!127735 (tuple2!4893 lt!127733 (zeroValue!4538 thiss!1504))) lt!127717) (apply!247 lt!127735 lt!127717))))

(declare-fun lt!127715 () Unit!7896)

(assert (=> b!254811 (= lt!127715 lt!127727)))

(declare-fun lt!127719 () ListLongMap!3805)

(assert (=> b!254811 (= lt!127719 (getCurrentListMapNoExtraKeys!569 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(declare-fun lt!127720 () (_ BitVec 64))

(assert (=> b!254811 (= lt!127720 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127732 () (_ BitVec 64))

(assert (=> b!254811 (= lt!127732 (select (arr!5897 (_keys!6851 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!254811 (= lt!127721 (addApplyDifferent!223 lt!127719 lt!127720 (minValue!4538 thiss!1504) lt!127732))))

(assert (=> b!254811 (= (apply!247 (+!674 lt!127719 (tuple2!4893 lt!127720 (minValue!4538 thiss!1504))) lt!127732) (apply!247 lt!127719 lt!127732))))

(declare-fun b!254812 () Bool)

(declare-fun get!3032 (ValueCell!2934 V!8387) V!8387)

(declare-fun dynLambda!590 (Int (_ BitVec 64)) V!8387)

(assert (=> b!254812 (= e!165169 (= (apply!247 lt!127730 (select (arr!5897 (_keys!6851 thiss!1504)) #b00000000000000000000000000000000)) (get!3032 (select (arr!5896 (_values!4680 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4697 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!254812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6243 (_values!4680 thiss!1504))))))

(assert (=> b!254812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))))))

(declare-fun b!254813 () Bool)

(declare-fun e!165171 () ListLongMap!3805)

(assert (=> b!254813 (= e!165171 call!24056)))

(declare-fun b!254814 () Bool)

(assert (=> b!254814 (= e!165172 (validKeyInArray!0 (select (arr!5897 (_keys!6851 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!254815 () Bool)

(declare-fun res!124717 () Bool)

(assert (=> b!254815 (=> (not res!124717) (not e!165164))))

(declare-fun e!165168 () Bool)

(assert (=> b!254815 (= res!124717 e!165168)))

(declare-fun c!42996 () Bool)

(assert (=> b!254815 (= c!42996 (not (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!42994 () Bool)

(declare-fun bm!24055 () Bool)

(assert (=> bm!24055 (= call!24057 (+!674 (ite c!42994 call!24053 (ite c!42993 call!24052 call!24056)) (ite (or c!42994 c!42993) (tuple2!4893 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4538 thiss!1504)) (tuple2!4893 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4538 thiss!1504)))))))

(declare-fun b!254816 () Bool)

(assert (=> b!254816 (= e!165163 call!24054)))

(declare-fun b!254817 () Bool)

(assert (=> b!254817 (= e!165171 call!24054)))

(declare-fun b!254818 () Bool)

(assert (=> b!254818 (= e!165168 e!165174)))

(declare-fun res!124714 () Bool)

(assert (=> b!254818 (= res!124714 call!24058)))

(assert (=> b!254818 (=> (not res!124714) (not e!165174))))

(declare-fun d!61501 () Bool)

(assert (=> d!61501 e!165164))

(declare-fun res!124719 () Bool)

(assert (=> d!61501 (=> (not res!124719) (not e!165164))))

(assert (=> d!61501 (= res!124719 (or (bvsge #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))))))))

(declare-fun lt!127723 () ListLongMap!3805)

(assert (=> d!61501 (= lt!127730 lt!127723)))

(declare-fun lt!127718 () Unit!7896)

(assert (=> d!61501 (= lt!127718 e!165165)))

(declare-fun c!42995 () Bool)

(assert (=> d!61501 (= c!42995 e!165167)))

(declare-fun res!124712 () Bool)

(assert (=> d!61501 (=> (not res!124712) (not e!165167))))

(assert (=> d!61501 (= res!124712 (bvslt #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))))))

(assert (=> d!61501 (= lt!127723 e!165173)))

(assert (=> d!61501 (= c!42994 (and (not (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61501 (validMask!0 (mask!10945 thiss!1504))))

(assert (=> d!61501 (= (getCurrentListMap!1446 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)) lt!127730)))

(declare-fun b!254808 () Bool)

(declare-fun e!165166 () Bool)

(assert (=> b!254808 (= e!165166 (= (apply!247 lt!127730 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4538 thiss!1504)))))

(declare-fun b!254819 () Bool)

(declare-fun e!165170 () Bool)

(assert (=> b!254819 (= e!165170 (not call!24055))))

(declare-fun b!254820 () Bool)

(assert (=> b!254820 (= e!165170 e!165166)))

(declare-fun res!124715 () Bool)

(assert (=> b!254820 (= res!124715 call!24055)))

(assert (=> b!254820 (=> (not res!124715) (not e!165166))))

(declare-fun b!254821 () Bool)

(assert (=> b!254821 (= e!165168 (not call!24058))))

(declare-fun b!254822 () Bool)

(declare-fun c!42998 () Bool)

(assert (=> b!254822 (= c!42998 (and (not (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!254822 (= e!165163 e!165171)))

(declare-fun b!254823 () Bool)

(assert (=> b!254823 (= e!165164 e!165170)))

(declare-fun c!42997 () Bool)

(assert (=> b!254823 (= c!42997 (not (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61501 c!42994) b!254804))

(assert (= (and d!61501 (not c!42994)) b!254807))

(assert (= (and b!254807 c!42993) b!254816))

(assert (= (and b!254807 (not c!42993)) b!254822))

(assert (= (and b!254822 c!42998) b!254817))

(assert (= (and b!254822 (not c!42998)) b!254813))

(assert (= (or b!254817 b!254813) bm!24054))

(assert (= (or b!254816 bm!24054) bm!24049))

(assert (= (or b!254816 b!254817) bm!24052))

(assert (= (or b!254804 bm!24049) bm!24050))

(assert (= (or b!254804 bm!24052) bm!24055))

(assert (= (and d!61501 res!124712) b!254809))

(assert (= (and d!61501 c!42995) b!254811))

(assert (= (and d!61501 (not c!42995)) b!254805))

(assert (= (and d!61501 res!124719) b!254803))

(assert (= (and b!254803 res!124718) b!254814))

(assert (= (and b!254803 (not res!124716)) b!254810))

(assert (= (and b!254810 res!124713) b!254812))

(assert (= (and b!254803 res!124711) b!254815))

(assert (= (and b!254815 c!42996) b!254818))

(assert (= (and b!254815 (not c!42996)) b!254821))

(assert (= (and b!254818 res!124714) b!254806))

(assert (= (or b!254818 b!254821) bm!24053))

(assert (= (and b!254815 res!124717) b!254823))

(assert (= (and b!254823 c!42997) b!254820))

(assert (= (and b!254823 (not c!42997)) b!254819))

(assert (= (and b!254820 res!124715) b!254808))

(assert (= (or b!254820 b!254819) bm!24051))

(declare-fun b_lambda!8131 () Bool)

(assert (=> (not b_lambda!8131) (not b!254812)))

(declare-fun t!8823 () Bool)

(declare-fun tb!3007 () Bool)

(assert (=> (and b!254624 (= (defaultEntry!4697 thiss!1504) (defaultEntry!4697 thiss!1504)) t!8823) tb!3007))

(declare-fun result!5343 () Bool)

(assert (=> tb!3007 (= result!5343 tp_is_empty!6555)))

(assert (=> b!254812 t!8823))

(declare-fun b_and!13739 () Bool)

(assert (= b_and!13735 (and (=> t!8823 result!5343) b_and!13739)))

(assert (=> b!254809 m!270267))

(assert (=> b!254809 m!270267))

(declare-fun m!270307 () Bool)

(assert (=> b!254809 m!270307))

(declare-fun m!270309 () Bool)

(assert (=> b!254812 m!270309))

(declare-fun m!270311 () Bool)

(assert (=> b!254812 m!270311))

(declare-fun m!270313 () Bool)

(assert (=> b!254812 m!270313))

(assert (=> b!254812 m!270309))

(assert (=> b!254812 m!270267))

(assert (=> b!254812 m!270267))

(declare-fun m!270315 () Bool)

(assert (=> b!254812 m!270315))

(assert (=> b!254812 m!270311))

(assert (=> d!61501 m!270275))

(assert (=> b!254810 m!270267))

(assert (=> b!254810 m!270267))

(declare-fun m!270317 () Bool)

(assert (=> b!254810 m!270317))

(declare-fun m!270319 () Bool)

(assert (=> b!254808 m!270319))

(declare-fun m!270321 () Bool)

(assert (=> bm!24050 m!270321))

(declare-fun m!270323 () Bool)

(assert (=> bm!24053 m!270323))

(assert (=> b!254814 m!270267))

(assert (=> b!254814 m!270267))

(assert (=> b!254814 m!270307))

(declare-fun m!270325 () Bool)

(assert (=> b!254806 m!270325))

(declare-fun m!270327 () Bool)

(assert (=> bm!24051 m!270327))

(declare-fun m!270329 () Bool)

(assert (=> b!254804 m!270329))

(declare-fun m!270331 () Bool)

(assert (=> bm!24055 m!270331))

(declare-fun m!270333 () Bool)

(assert (=> b!254811 m!270333))

(declare-fun m!270335 () Bool)

(assert (=> b!254811 m!270335))

(declare-fun m!270337 () Bool)

(assert (=> b!254811 m!270337))

(assert (=> b!254811 m!270335))

(declare-fun m!270339 () Bool)

(assert (=> b!254811 m!270339))

(declare-fun m!270341 () Bool)

(assert (=> b!254811 m!270341))

(declare-fun m!270343 () Bool)

(assert (=> b!254811 m!270343))

(assert (=> b!254811 m!270321))

(assert (=> b!254811 m!270343))

(declare-fun m!270345 () Bool)

(assert (=> b!254811 m!270345))

(declare-fun m!270347 () Bool)

(assert (=> b!254811 m!270347))

(declare-fun m!270349 () Bool)

(assert (=> b!254811 m!270349))

(assert (=> b!254811 m!270339))

(declare-fun m!270351 () Bool)

(assert (=> b!254811 m!270351))

(declare-fun m!270353 () Bool)

(assert (=> b!254811 m!270353))

(declare-fun m!270355 () Bool)

(assert (=> b!254811 m!270355))

(declare-fun m!270357 () Bool)

(assert (=> b!254811 m!270357))

(declare-fun m!270359 () Bool)

(assert (=> b!254811 m!270359))

(declare-fun m!270361 () Bool)

(assert (=> b!254811 m!270361))

(assert (=> b!254811 m!270351))

(assert (=> b!254811 m!270267))

(assert (=> b!254638 d!61501))

(declare-fun b!254826 () Bool)

(declare-fun res!124720 () Bool)

(declare-fun e!165177 () Bool)

(assert (=> b!254826 (=> (not res!124720) (not e!165177))))

(declare-fun e!165188 () Bool)

(assert (=> b!254826 (= res!124720 e!165188)))

(declare-fun res!124725 () Bool)

(assert (=> b!254826 (=> res!124725 e!165188)))

(declare-fun e!165185 () Bool)

(assert (=> b!254826 (= res!124725 (not e!165185))))

(declare-fun res!124727 () Bool)

(assert (=> b!254826 (=> (not res!124727) (not e!165185))))

(assert (=> b!254826 (= res!124727 (bvslt #b00000000000000000000000000000000 (size!6244 lt!127595)))))

(declare-fun b!254827 () Bool)

(declare-fun e!165186 () ListLongMap!3805)

(declare-fun call!24064 () ListLongMap!3805)

(assert (=> b!254827 (= e!165186 (+!674 call!24064 (tuple2!4893 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4538 thiss!1504))))))

(declare-fun b!254828 () Bool)

(declare-fun e!165178 () Unit!7896)

(declare-fun Unit!7908 () Unit!7896)

(assert (=> b!254828 (= e!165178 Unit!7908)))

(declare-fun b!254829 () Bool)

(declare-fun e!165187 () Bool)

(declare-fun lt!127752 () ListLongMap!3805)

(assert (=> b!254829 (= e!165187 (= (apply!247 lt!127752 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4538 thiss!1504)))))

(declare-fun bm!24056 () Bool)

(declare-fun call!24059 () ListLongMap!3805)

(declare-fun call!24060 () ListLongMap!3805)

(assert (=> bm!24056 (= call!24059 call!24060)))

(declare-fun b!254830 () Bool)

(declare-fun e!165176 () ListLongMap!3805)

(assert (=> b!254830 (= e!165186 e!165176)))

(declare-fun c!42999 () Bool)

(assert (=> b!254830 (= c!42999 (and (not (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24057 () Bool)

(assert (=> bm!24057 (= call!24060 (getCurrentListMapNoExtraKeys!569 lt!127595 (array!12442 (store (arr!5896 (_values!4680 thiss!1504)) index!297 (ValueCellFull!2934 v!346)) (size!6243 (_values!4680 thiss!1504))) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(declare-fun bm!24058 () Bool)

(declare-fun call!24062 () Bool)

(assert (=> bm!24058 (= call!24062 (contains!1848 lt!127752 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24059 () Bool)

(declare-fun call!24061 () ListLongMap!3805)

(assert (=> bm!24059 (= call!24061 call!24064)))

(declare-fun bm!24060 () Bool)

(declare-fun call!24065 () Bool)

(assert (=> bm!24060 (= call!24065 (contains!1848 lt!127752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254832 () Bool)

(declare-fun e!165180 () Bool)

(assert (=> b!254832 (= e!165180 (validKeyInArray!0 (select (arr!5897 lt!127595) #b00000000000000000000000000000000)))))

(declare-fun bm!24061 () Bool)

(declare-fun call!24063 () ListLongMap!3805)

(assert (=> bm!24061 (= call!24063 call!24059)))

(declare-fun b!254833 () Bool)

(declare-fun e!165182 () Bool)

(assert (=> b!254833 (= e!165188 e!165182)))

(declare-fun res!124722 () Bool)

(assert (=> b!254833 (=> (not res!124722) (not e!165182))))

(assert (=> b!254833 (= res!124722 (contains!1848 lt!127752 (select (arr!5897 lt!127595) #b00000000000000000000000000000000)))))

(assert (=> b!254833 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6244 lt!127595)))))

(declare-fun b!254834 () Bool)

(declare-fun lt!127743 () Unit!7896)

(assert (=> b!254834 (= e!165178 lt!127743)))

(declare-fun lt!127747 () ListLongMap!3805)

(assert (=> b!254834 (= lt!127747 (getCurrentListMapNoExtraKeys!569 lt!127595 (array!12442 (store (arr!5896 (_values!4680 thiss!1504)) index!297 (ValueCellFull!2934 v!346)) (size!6243 (_values!4680 thiss!1504))) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(declare-fun lt!127746 () (_ BitVec 64))

(assert (=> b!254834 (= lt!127746 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127738 () (_ BitVec 64))

(assert (=> b!254834 (= lt!127738 (select (arr!5897 lt!127595) #b00000000000000000000000000000000))))

(declare-fun lt!127744 () Unit!7896)

(assert (=> b!254834 (= lt!127744 (addStillContains!223 lt!127747 lt!127746 (zeroValue!4538 thiss!1504) lt!127738))))

(assert (=> b!254834 (contains!1848 (+!674 lt!127747 (tuple2!4893 lt!127746 (zeroValue!4538 thiss!1504))) lt!127738)))

(declare-fun lt!127756 () Unit!7896)

(assert (=> b!254834 (= lt!127756 lt!127744)))

(declare-fun lt!127751 () ListLongMap!3805)

(assert (=> b!254834 (= lt!127751 (getCurrentListMapNoExtraKeys!569 lt!127595 (array!12442 (store (arr!5896 (_values!4680 thiss!1504)) index!297 (ValueCellFull!2934 v!346)) (size!6243 (_values!4680 thiss!1504))) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(declare-fun lt!127753 () (_ BitVec 64))

(assert (=> b!254834 (= lt!127753 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127758 () (_ BitVec 64))

(assert (=> b!254834 (= lt!127758 (select (arr!5897 lt!127595) #b00000000000000000000000000000000))))

(declare-fun lt!127748 () Unit!7896)

(assert (=> b!254834 (= lt!127748 (addApplyDifferent!223 lt!127751 lt!127753 (minValue!4538 thiss!1504) lt!127758))))

(assert (=> b!254834 (= (apply!247 (+!674 lt!127751 (tuple2!4893 lt!127753 (minValue!4538 thiss!1504))) lt!127758) (apply!247 lt!127751 lt!127758))))

(declare-fun lt!127750 () Unit!7896)

(assert (=> b!254834 (= lt!127750 lt!127748)))

(declare-fun lt!127757 () ListLongMap!3805)

(assert (=> b!254834 (= lt!127757 (getCurrentListMapNoExtraKeys!569 lt!127595 (array!12442 (store (arr!5896 (_values!4680 thiss!1504)) index!297 (ValueCellFull!2934 v!346)) (size!6243 (_values!4680 thiss!1504))) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(declare-fun lt!127755 () (_ BitVec 64))

(assert (=> b!254834 (= lt!127755 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127739 () (_ BitVec 64))

(assert (=> b!254834 (= lt!127739 (select (arr!5897 lt!127595) #b00000000000000000000000000000000))))

(declare-fun lt!127749 () Unit!7896)

(assert (=> b!254834 (= lt!127749 (addApplyDifferent!223 lt!127757 lt!127755 (zeroValue!4538 thiss!1504) lt!127739))))

(assert (=> b!254834 (= (apply!247 (+!674 lt!127757 (tuple2!4893 lt!127755 (zeroValue!4538 thiss!1504))) lt!127739) (apply!247 lt!127757 lt!127739))))

(declare-fun lt!127737 () Unit!7896)

(assert (=> b!254834 (= lt!127737 lt!127749)))

(declare-fun lt!127741 () ListLongMap!3805)

(assert (=> b!254834 (= lt!127741 (getCurrentListMapNoExtraKeys!569 lt!127595 (array!12442 (store (arr!5896 (_values!4680 thiss!1504)) index!297 (ValueCellFull!2934 v!346)) (size!6243 (_values!4680 thiss!1504))) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)))))

(declare-fun lt!127742 () (_ BitVec 64))

(assert (=> b!254834 (= lt!127742 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127754 () (_ BitVec 64))

(assert (=> b!254834 (= lt!127754 (select (arr!5897 lt!127595) #b00000000000000000000000000000000))))

(assert (=> b!254834 (= lt!127743 (addApplyDifferent!223 lt!127741 lt!127742 (minValue!4538 thiss!1504) lt!127754))))

(assert (=> b!254834 (= (apply!247 (+!674 lt!127741 (tuple2!4893 lt!127742 (minValue!4538 thiss!1504))) lt!127754) (apply!247 lt!127741 lt!127754))))

(declare-fun b!254835 () Bool)

(assert (=> b!254835 (= e!165182 (= (apply!247 lt!127752 (select (arr!5897 lt!127595) #b00000000000000000000000000000000)) (get!3032 (select (arr!5896 (array!12442 (store (arr!5896 (_values!4680 thiss!1504)) index!297 (ValueCellFull!2934 v!346)) (size!6243 (_values!4680 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4697 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!254835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6243 (array!12442 (store (arr!5896 (_values!4680 thiss!1504)) index!297 (ValueCellFull!2934 v!346)) (size!6243 (_values!4680 thiss!1504))))))))

(assert (=> b!254835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6244 lt!127595)))))

(declare-fun b!254836 () Bool)

(declare-fun e!165184 () ListLongMap!3805)

(assert (=> b!254836 (= e!165184 call!24063)))

(declare-fun b!254837 () Bool)

(assert (=> b!254837 (= e!165185 (validKeyInArray!0 (select (arr!5897 lt!127595) #b00000000000000000000000000000000)))))

(declare-fun b!254838 () Bool)

(declare-fun res!124726 () Bool)

(assert (=> b!254838 (=> (not res!124726) (not e!165177))))

(declare-fun e!165181 () Bool)

(assert (=> b!254838 (= res!124726 e!165181)))

(declare-fun c!43002 () Bool)

(assert (=> b!254838 (= c!43002 (not (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!43000 () Bool)

(declare-fun bm!24062 () Bool)

(assert (=> bm!24062 (= call!24064 (+!674 (ite c!43000 call!24060 (ite c!42999 call!24059 call!24063)) (ite (or c!43000 c!42999) (tuple2!4893 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4538 thiss!1504)) (tuple2!4893 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4538 thiss!1504)))))))

(declare-fun b!254839 () Bool)

(assert (=> b!254839 (= e!165176 call!24061)))

(declare-fun b!254840 () Bool)

(assert (=> b!254840 (= e!165184 call!24061)))

(declare-fun b!254841 () Bool)

(assert (=> b!254841 (= e!165181 e!165187)))

(declare-fun res!124723 () Bool)

(assert (=> b!254841 (= res!124723 call!24065)))

(assert (=> b!254841 (=> (not res!124723) (not e!165187))))

(declare-fun d!61503 () Bool)

(assert (=> d!61503 e!165177))

(declare-fun res!124728 () Bool)

(assert (=> d!61503 (=> (not res!124728) (not e!165177))))

(assert (=> d!61503 (= res!124728 (or (bvsge #b00000000000000000000000000000000 (size!6244 lt!127595)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6244 lt!127595)))))))

(declare-fun lt!127745 () ListLongMap!3805)

(assert (=> d!61503 (= lt!127752 lt!127745)))

(declare-fun lt!127740 () Unit!7896)

(assert (=> d!61503 (= lt!127740 e!165178)))

(declare-fun c!43001 () Bool)

(assert (=> d!61503 (= c!43001 e!165180)))

(declare-fun res!124721 () Bool)

(assert (=> d!61503 (=> (not res!124721) (not e!165180))))

(assert (=> d!61503 (= res!124721 (bvslt #b00000000000000000000000000000000 (size!6244 lt!127595)))))

(assert (=> d!61503 (= lt!127745 e!165186)))

(assert (=> d!61503 (= c!43000 (and (not (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61503 (validMask!0 (mask!10945 thiss!1504))))

(assert (=> d!61503 (= (getCurrentListMap!1446 lt!127595 (array!12442 (store (arr!5896 (_values!4680 thiss!1504)) index!297 (ValueCellFull!2934 v!346)) (size!6243 (_values!4680 thiss!1504))) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)) lt!127752)))

(declare-fun b!254831 () Bool)

(declare-fun e!165179 () Bool)

(assert (=> b!254831 (= e!165179 (= (apply!247 lt!127752 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4538 thiss!1504)))))

(declare-fun b!254842 () Bool)

(declare-fun e!165183 () Bool)

(assert (=> b!254842 (= e!165183 (not call!24062))))

(declare-fun b!254843 () Bool)

(assert (=> b!254843 (= e!165183 e!165179)))

(declare-fun res!124724 () Bool)

(assert (=> b!254843 (= res!124724 call!24062)))

(assert (=> b!254843 (=> (not res!124724) (not e!165179))))

(declare-fun b!254844 () Bool)

(assert (=> b!254844 (= e!165181 (not call!24065))))

(declare-fun b!254845 () Bool)

(declare-fun c!43004 () Bool)

(assert (=> b!254845 (= c!43004 (and (not (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!254845 (= e!165176 e!165184)))

(declare-fun b!254846 () Bool)

(assert (=> b!254846 (= e!165177 e!165183)))

(declare-fun c!43003 () Bool)

(assert (=> b!254846 (= c!43003 (not (= (bvand (extraKeys!4434 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61503 c!43000) b!254827))

(assert (= (and d!61503 (not c!43000)) b!254830))

(assert (= (and b!254830 c!42999) b!254839))

(assert (= (and b!254830 (not c!42999)) b!254845))

(assert (= (and b!254845 c!43004) b!254840))

(assert (= (and b!254845 (not c!43004)) b!254836))

(assert (= (or b!254840 b!254836) bm!24061))

(assert (= (or b!254839 bm!24061) bm!24056))

(assert (= (or b!254839 b!254840) bm!24059))

(assert (= (or b!254827 bm!24056) bm!24057))

(assert (= (or b!254827 bm!24059) bm!24062))

(assert (= (and d!61503 res!124721) b!254832))

(assert (= (and d!61503 c!43001) b!254834))

(assert (= (and d!61503 (not c!43001)) b!254828))

(assert (= (and d!61503 res!124728) b!254826))

(assert (= (and b!254826 res!124727) b!254837))

(assert (= (and b!254826 (not res!124725)) b!254833))

(assert (= (and b!254833 res!124722) b!254835))

(assert (= (and b!254826 res!124720) b!254838))

(assert (= (and b!254838 c!43002) b!254841))

(assert (= (and b!254838 (not c!43002)) b!254844))

(assert (= (and b!254841 res!124723) b!254829))

(assert (= (or b!254841 b!254844) bm!24060))

(assert (= (and b!254838 res!124726) b!254846))

(assert (= (and b!254846 c!43003) b!254843))

(assert (= (and b!254846 (not c!43003)) b!254842))

(assert (= (and b!254843 res!124724) b!254831))

(assert (= (or b!254843 b!254842) bm!24058))

(declare-fun b_lambda!8133 () Bool)

(assert (=> (not b_lambda!8133) (not b!254835)))

(assert (=> b!254835 t!8823))

(declare-fun b_and!13741 () Bool)

(assert (= b_and!13739 (and (=> t!8823 result!5343) b_and!13741)))

(declare-fun m!270363 () Bool)

(assert (=> b!254832 m!270363))

(assert (=> b!254832 m!270363))

(declare-fun m!270365 () Bool)

(assert (=> b!254832 m!270365))

(declare-fun m!270367 () Bool)

(assert (=> b!254835 m!270367))

(assert (=> b!254835 m!270311))

(declare-fun m!270369 () Bool)

(assert (=> b!254835 m!270369))

(assert (=> b!254835 m!270367))

(assert (=> b!254835 m!270363))

(assert (=> b!254835 m!270363))

(declare-fun m!270371 () Bool)

(assert (=> b!254835 m!270371))

(assert (=> b!254835 m!270311))

(assert (=> d!61503 m!270275))

(assert (=> b!254833 m!270363))

(assert (=> b!254833 m!270363))

(declare-fun m!270373 () Bool)

(assert (=> b!254833 m!270373))

(declare-fun m!270375 () Bool)

(assert (=> b!254831 m!270375))

(declare-fun m!270377 () Bool)

(assert (=> bm!24057 m!270377))

(declare-fun m!270379 () Bool)

(assert (=> bm!24060 m!270379))

(assert (=> b!254837 m!270363))

(assert (=> b!254837 m!270363))

(assert (=> b!254837 m!270365))

(declare-fun m!270381 () Bool)

(assert (=> b!254829 m!270381))

(declare-fun m!270383 () Bool)

(assert (=> bm!24058 m!270383))

(declare-fun m!270385 () Bool)

(assert (=> b!254827 m!270385))

(declare-fun m!270387 () Bool)

(assert (=> bm!24062 m!270387))

(declare-fun m!270389 () Bool)

(assert (=> b!254834 m!270389))

(declare-fun m!270391 () Bool)

(assert (=> b!254834 m!270391))

(declare-fun m!270393 () Bool)

(assert (=> b!254834 m!270393))

(assert (=> b!254834 m!270391))

(declare-fun m!270395 () Bool)

(assert (=> b!254834 m!270395))

(declare-fun m!270397 () Bool)

(assert (=> b!254834 m!270397))

(declare-fun m!270399 () Bool)

(assert (=> b!254834 m!270399))

(assert (=> b!254834 m!270377))

(assert (=> b!254834 m!270399))

(declare-fun m!270401 () Bool)

(assert (=> b!254834 m!270401))

(declare-fun m!270403 () Bool)

(assert (=> b!254834 m!270403))

(declare-fun m!270405 () Bool)

(assert (=> b!254834 m!270405))

(assert (=> b!254834 m!270395))

(declare-fun m!270407 () Bool)

(assert (=> b!254834 m!270407))

(declare-fun m!270409 () Bool)

(assert (=> b!254834 m!270409))

(declare-fun m!270411 () Bool)

(assert (=> b!254834 m!270411))

(declare-fun m!270413 () Bool)

(assert (=> b!254834 m!270413))

(declare-fun m!270415 () Bool)

(assert (=> b!254834 m!270415))

(declare-fun m!270417 () Bool)

(assert (=> b!254834 m!270417))

(assert (=> b!254834 m!270407))

(assert (=> b!254834 m!270363))

(assert (=> b!254629 d!61503))

(declare-fun e!165193 () Bool)

(declare-fun b!254858 () Bool)

(assert (=> b!254858 (= e!165193 (= (arrayCountValidKeys!0 (array!12444 (store (arr!5897 (_keys!6851 thiss!1504)) index!297 key!932) (size!6244 (_keys!6851 thiss!1504))) #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6851 thiss!1504) #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!254857 () Bool)

(declare-fun e!165194 () Bool)

(assert (=> b!254857 (= e!165194 (bvslt (size!6244 (_keys!6851 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!254856 () Bool)

(declare-fun res!124738 () Bool)

(assert (=> b!254856 (=> (not res!124738) (not e!165194))))

(assert (=> b!254856 (= res!124738 (validKeyInArray!0 key!932))))

(declare-fun d!61505 () Bool)

(assert (=> d!61505 e!165193))

(declare-fun res!124740 () Bool)

(assert (=> d!61505 (=> (not res!124740) (not e!165193))))

(assert (=> d!61505 (= res!124740 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6244 (_keys!6851 thiss!1504)))))))

(declare-fun lt!127761 () Unit!7896)

(declare-fun choose!1 (array!12443 (_ BitVec 32) (_ BitVec 64)) Unit!7896)

(assert (=> d!61505 (= lt!127761 (choose!1 (_keys!6851 thiss!1504) index!297 key!932))))

(assert (=> d!61505 e!165194))

(declare-fun res!124739 () Bool)

(assert (=> d!61505 (=> (not res!124739) (not e!165194))))

(assert (=> d!61505 (= res!124739 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6244 (_keys!6851 thiss!1504)))))))

(assert (=> d!61505 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6851 thiss!1504) index!297 key!932) lt!127761)))

(declare-fun b!254855 () Bool)

(declare-fun res!124737 () Bool)

(assert (=> b!254855 (=> (not res!124737) (not e!165194))))

(assert (=> b!254855 (= res!124737 (not (validKeyInArray!0 (select (arr!5897 (_keys!6851 thiss!1504)) index!297))))))

(assert (= (and d!61505 res!124739) b!254855))

(assert (= (and b!254855 res!124737) b!254856))

(assert (= (and b!254856 res!124738) b!254857))

(assert (= (and d!61505 res!124740) b!254858))

(assert (=> b!254858 m!270201))

(declare-fun m!270419 () Bool)

(assert (=> b!254858 m!270419))

(assert (=> b!254858 m!270203))

(declare-fun m!270421 () Bool)

(assert (=> b!254856 m!270421))

(declare-fun m!270423 () Bool)

(assert (=> d!61505 m!270423))

(declare-fun m!270425 () Bool)

(assert (=> b!254855 m!270425))

(assert (=> b!254855 m!270425))

(declare-fun m!270427 () Bool)

(assert (=> b!254855 m!270427))

(assert (=> b!254629 d!61505))

(declare-fun bm!24065 () Bool)

(declare-fun call!24068 () Bool)

(declare-fun c!43007 () Bool)

(assert (=> bm!24065 (= call!24068 (arrayNoDuplicates!0 lt!127595 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43007 (Cons!3770 (select (arr!5897 lt!127595) #b00000000000000000000000000000000) Nil!3771) Nil!3771)))))

(declare-fun d!61507 () Bool)

(declare-fun res!124747 () Bool)

(declare-fun e!165205 () Bool)

(assert (=> d!61507 (=> res!124747 e!165205)))

(assert (=> d!61507 (= res!124747 (bvsge #b00000000000000000000000000000000 (size!6244 lt!127595)))))

(assert (=> d!61507 (= (arrayNoDuplicates!0 lt!127595 #b00000000000000000000000000000000 Nil!3771) e!165205)))

(declare-fun b!254869 () Bool)

(declare-fun e!165204 () Bool)

(assert (=> b!254869 (= e!165205 e!165204)))

(declare-fun res!124749 () Bool)

(assert (=> b!254869 (=> (not res!124749) (not e!165204))))

(declare-fun e!165206 () Bool)

(assert (=> b!254869 (= res!124749 (not e!165206))))

(declare-fun res!124748 () Bool)

(assert (=> b!254869 (=> (not res!124748) (not e!165206))))

(assert (=> b!254869 (= res!124748 (validKeyInArray!0 (select (arr!5897 lt!127595) #b00000000000000000000000000000000)))))

(declare-fun b!254870 () Bool)

(declare-fun e!165203 () Bool)

(assert (=> b!254870 (= e!165203 call!24068)))

(declare-fun b!254871 () Bool)

(assert (=> b!254871 (= e!165204 e!165203)))

(assert (=> b!254871 (= c!43007 (validKeyInArray!0 (select (arr!5897 lt!127595) #b00000000000000000000000000000000)))))

(declare-fun b!254872 () Bool)

(declare-fun contains!1849 (List!3774 (_ BitVec 64)) Bool)

(assert (=> b!254872 (= e!165206 (contains!1849 Nil!3771 (select (arr!5897 lt!127595) #b00000000000000000000000000000000)))))

(declare-fun b!254873 () Bool)

(assert (=> b!254873 (= e!165203 call!24068)))

(assert (= (and d!61507 (not res!124747)) b!254869))

(assert (= (and b!254869 res!124748) b!254872))

(assert (= (and b!254869 res!124749) b!254871))

(assert (= (and b!254871 c!43007) b!254870))

(assert (= (and b!254871 (not c!43007)) b!254873))

(assert (= (or b!254870 b!254873) bm!24065))

(assert (=> bm!24065 m!270363))

(declare-fun m!270429 () Bool)

(assert (=> bm!24065 m!270429))

(assert (=> b!254869 m!270363))

(assert (=> b!254869 m!270363))

(assert (=> b!254869 m!270365))

(assert (=> b!254871 m!270363))

(assert (=> b!254871 m!270363))

(assert (=> b!254871 m!270365))

(assert (=> b!254872 m!270363))

(assert (=> b!254872 m!270363))

(declare-fun m!270431 () Bool)

(assert (=> b!254872 m!270431))

(assert (=> b!254629 d!61507))

(declare-fun b!254882 () Bool)

(declare-fun e!165212 () (_ BitVec 32))

(declare-fun e!165211 () (_ BitVec 32))

(assert (=> b!254882 (= e!165212 e!165211)))

(declare-fun c!43013 () Bool)

(assert (=> b!254882 (= c!43013 (validKeyInArray!0 (select (arr!5897 (_keys!6851 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!254883 () Bool)

(declare-fun call!24071 () (_ BitVec 32))

(assert (=> b!254883 (= e!165211 call!24071)))

(declare-fun bm!24068 () Bool)

(assert (=> bm!24068 (= call!24071 (arrayCountValidKeys!0 (_keys!6851 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6244 (_keys!6851 thiss!1504))))))

(declare-fun d!61509 () Bool)

(declare-fun lt!127764 () (_ BitVec 32))

(assert (=> d!61509 (and (bvsge lt!127764 #b00000000000000000000000000000000) (bvsle lt!127764 (bvsub (size!6244 (_keys!6851 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61509 (= lt!127764 e!165212)))

(declare-fun c!43012 () Bool)

(assert (=> d!61509 (= c!43012 (bvsge #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))))))

(assert (=> d!61509 (and (bvsle #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6244 (_keys!6851 thiss!1504)) (size!6244 (_keys!6851 thiss!1504))))))

(assert (=> d!61509 (= (arrayCountValidKeys!0 (_keys!6851 thiss!1504) #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))) lt!127764)))

(declare-fun b!254884 () Bool)

(assert (=> b!254884 (= e!165211 (bvadd #b00000000000000000000000000000001 call!24071))))

(declare-fun b!254885 () Bool)

(assert (=> b!254885 (= e!165212 #b00000000000000000000000000000000)))

(assert (= (and d!61509 c!43012) b!254885))

(assert (= (and d!61509 (not c!43012)) b!254882))

(assert (= (and b!254882 c!43013) b!254884))

(assert (= (and b!254882 (not c!43013)) b!254883))

(assert (= (or b!254884 b!254883) bm!24068))

(assert (=> b!254882 m!270267))

(assert (=> b!254882 m!270267))

(assert (=> b!254882 m!270307))

(declare-fun m!270433 () Bool)

(assert (=> bm!24068 m!270433))

(assert (=> b!254629 d!61509))

(declare-fun d!61511 () Bool)

(declare-fun e!165215 () Bool)

(assert (=> d!61511 e!165215))

(declare-fun res!124752 () Bool)

(assert (=> d!61511 (=> (not res!124752) (not e!165215))))

(assert (=> d!61511 (= res!124752 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6244 (_keys!6851 thiss!1504))) (bvslt index!297 (size!6243 (_values!4680 thiss!1504)))))))

(declare-fun lt!127767 () Unit!7896)

(declare-fun choose!1214 (array!12443 array!12441 (_ BitVec 32) (_ BitVec 32) V!8387 V!8387 (_ BitVec 32) (_ BitVec 64) V!8387 Int) Unit!7896)

(assert (=> d!61511 (= lt!127767 (choose!1214 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) index!297 key!932 v!346 (defaultEntry!4697 thiss!1504)))))

(assert (=> d!61511 (validMask!0 (mask!10945 thiss!1504))))

(assert (=> d!61511 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!84 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) index!297 key!932 v!346 (defaultEntry!4697 thiss!1504)) lt!127767)))

(declare-fun b!254888 () Bool)

(assert (=> b!254888 (= e!165215 (= (+!674 (getCurrentListMap!1446 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504)) (tuple2!4893 key!932 v!346)) (getCurrentListMap!1446 (array!12444 (store (arr!5897 (_keys!6851 thiss!1504)) index!297 key!932) (size!6244 (_keys!6851 thiss!1504))) (array!12442 (store (arr!5896 (_values!4680 thiss!1504)) index!297 (ValueCellFull!2934 v!346)) (size!6243 (_values!4680 thiss!1504))) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4697 thiss!1504))))))

(assert (= (and d!61511 res!124752) b!254888))

(declare-fun m!270435 () Bool)

(assert (=> d!61511 m!270435))

(assert (=> d!61511 m!270275))

(assert (=> b!254888 m!270191))

(assert (=> b!254888 m!270201))

(declare-fun m!270437 () Bool)

(assert (=> b!254888 m!270437))

(assert (=> b!254888 m!270179))

(assert (=> b!254888 m!270179))

(declare-fun m!270439 () Bool)

(assert (=> b!254888 m!270439))

(assert (=> b!254629 d!61511))

(declare-fun d!61513 () Bool)

(declare-fun e!165218 () Bool)

(assert (=> d!61513 e!165218))

(declare-fun res!124758 () Bool)

(assert (=> d!61513 (=> (not res!124758) (not e!165218))))

(declare-fun lt!127776 () ListLongMap!3805)

(assert (=> d!61513 (= res!124758 (contains!1848 lt!127776 (_1!2457 (tuple2!4893 key!932 v!346))))))

(declare-fun lt!127779 () List!3773)

(assert (=> d!61513 (= lt!127776 (ListLongMap!3806 lt!127779))))

(declare-fun lt!127778 () Unit!7896)

(declare-fun lt!127777 () Unit!7896)

(assert (=> d!61513 (= lt!127778 lt!127777)))

(assert (=> d!61513 (= (getValueByKey!305 lt!127779 (_1!2457 (tuple2!4893 key!932 v!346))) (Some!310 (_2!2457 (tuple2!4893 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!161 (List!3773 (_ BitVec 64) V!8387) Unit!7896)

(assert (=> d!61513 (= lt!127777 (lemmaContainsTupThenGetReturnValue!161 lt!127779 (_1!2457 (tuple2!4893 key!932 v!346)) (_2!2457 (tuple2!4893 key!932 v!346))))))

(declare-fun insertStrictlySorted!164 (List!3773 (_ BitVec 64) V!8387) List!3773)

(assert (=> d!61513 (= lt!127779 (insertStrictlySorted!164 (toList!1918 lt!127594) (_1!2457 (tuple2!4893 key!932 v!346)) (_2!2457 (tuple2!4893 key!932 v!346))))))

(assert (=> d!61513 (= (+!674 lt!127594 (tuple2!4893 key!932 v!346)) lt!127776)))

(declare-fun b!254893 () Bool)

(declare-fun res!124757 () Bool)

(assert (=> b!254893 (=> (not res!124757) (not e!165218))))

(assert (=> b!254893 (= res!124757 (= (getValueByKey!305 (toList!1918 lt!127776) (_1!2457 (tuple2!4893 key!932 v!346))) (Some!310 (_2!2457 (tuple2!4893 key!932 v!346)))))))

(declare-fun b!254894 () Bool)

(declare-fun contains!1850 (List!3773 tuple2!4892) Bool)

(assert (=> b!254894 (= e!165218 (contains!1850 (toList!1918 lt!127776) (tuple2!4893 key!932 v!346)))))

(assert (= (and d!61513 res!124758) b!254893))

(assert (= (and b!254893 res!124757) b!254894))

(declare-fun m!270441 () Bool)

(assert (=> d!61513 m!270441))

(declare-fun m!270443 () Bool)

(assert (=> d!61513 m!270443))

(declare-fun m!270445 () Bool)

(assert (=> d!61513 m!270445))

(declare-fun m!270447 () Bool)

(assert (=> d!61513 m!270447))

(declare-fun m!270449 () Bool)

(assert (=> b!254893 m!270449))

(declare-fun m!270451 () Bool)

(assert (=> b!254894 m!270451))

(assert (=> b!254629 d!61513))

(declare-fun d!61515 () Bool)

(declare-fun e!165221 () Bool)

(assert (=> d!61515 e!165221))

(declare-fun res!124761 () Bool)

(assert (=> d!61515 (=> (not res!124761) (not e!165221))))

(assert (=> d!61515 (= res!124761 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6244 (_keys!6851 thiss!1504)))))))

(declare-fun lt!127782 () Unit!7896)

(declare-fun choose!41 (array!12443 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3774) Unit!7896)

(assert (=> d!61515 (= lt!127782 (choose!41 (_keys!6851 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3771))))

(assert (=> d!61515 (bvslt (size!6244 (_keys!6851 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61515 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6851 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3771) lt!127782)))

(declare-fun b!254897 () Bool)

(assert (=> b!254897 (= e!165221 (arrayNoDuplicates!0 (array!12444 (store (arr!5897 (_keys!6851 thiss!1504)) index!297 key!932) (size!6244 (_keys!6851 thiss!1504))) #b00000000000000000000000000000000 Nil!3771))))

(assert (= (and d!61515 res!124761) b!254897))

(declare-fun m!270453 () Bool)

(assert (=> d!61515 m!270453))

(assert (=> b!254897 m!270201))

(declare-fun m!270455 () Bool)

(assert (=> b!254897 m!270455))

(assert (=> b!254629 d!61515))

(assert (=> b!254629 d!61485))

(declare-fun d!61517 () Bool)

(declare-fun e!165224 () Bool)

(assert (=> d!61517 e!165224))

(declare-fun res!124764 () Bool)

(assert (=> d!61517 (=> (not res!124764) (not e!165224))))

(assert (=> d!61517 (= res!124764 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6244 (_keys!6851 thiss!1504)))))))

(declare-fun lt!127785 () Unit!7896)

(declare-fun choose!102 ((_ BitVec 64) array!12443 (_ BitVec 32) (_ BitVec 32)) Unit!7896)

(assert (=> d!61517 (= lt!127785 (choose!102 key!932 (_keys!6851 thiss!1504) index!297 (mask!10945 thiss!1504)))))

(assert (=> d!61517 (validMask!0 (mask!10945 thiss!1504))))

(assert (=> d!61517 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6851 thiss!1504) index!297 (mask!10945 thiss!1504)) lt!127785)))

(declare-fun b!254900 () Bool)

(assert (=> b!254900 (= e!165224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12444 (store (arr!5897 (_keys!6851 thiss!1504)) index!297 key!932) (size!6244 (_keys!6851 thiss!1504))) (mask!10945 thiss!1504)))))

(assert (= (and d!61517 res!124764) b!254900))

(declare-fun m!270457 () Bool)

(assert (=> d!61517 m!270457))

(assert (=> d!61517 m!270275))

(assert (=> b!254900 m!270201))

(declare-fun m!270459 () Bool)

(assert (=> b!254900 m!270459))

(assert (=> b!254629 d!61517))

(declare-fun b!254909 () Bool)

(declare-fun e!165233 () Bool)

(declare-fun e!165232 () Bool)

(assert (=> b!254909 (= e!165233 e!165232)))

(declare-fun lt!127792 () (_ BitVec 64))

(assert (=> b!254909 (= lt!127792 (select (arr!5897 lt!127595) #b00000000000000000000000000000000))))

(declare-fun lt!127793 () Unit!7896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12443 (_ BitVec 64) (_ BitVec 32)) Unit!7896)

(assert (=> b!254909 (= lt!127793 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!127595 lt!127792 #b00000000000000000000000000000000))))

(assert (=> b!254909 (arrayContainsKey!0 lt!127595 lt!127792 #b00000000000000000000000000000000)))

(declare-fun lt!127794 () Unit!7896)

(assert (=> b!254909 (= lt!127794 lt!127793)))

(declare-fun res!124770 () Bool)

(assert (=> b!254909 (= res!124770 (= (seekEntryOrOpen!0 (select (arr!5897 lt!127595) #b00000000000000000000000000000000) lt!127595 (mask!10945 thiss!1504)) (Found!1152 #b00000000000000000000000000000000)))))

(assert (=> b!254909 (=> (not res!124770) (not e!165232))))

(declare-fun b!254910 () Bool)

(declare-fun e!165231 () Bool)

(assert (=> b!254910 (= e!165231 e!165233)))

(declare-fun c!43016 () Bool)

(assert (=> b!254910 (= c!43016 (validKeyInArray!0 (select (arr!5897 lt!127595) #b00000000000000000000000000000000)))))

(declare-fun d!61519 () Bool)

(declare-fun res!124769 () Bool)

(assert (=> d!61519 (=> res!124769 e!165231)))

(assert (=> d!61519 (= res!124769 (bvsge #b00000000000000000000000000000000 (size!6244 lt!127595)))))

(assert (=> d!61519 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127595 (mask!10945 thiss!1504)) e!165231)))

(declare-fun bm!24071 () Bool)

(declare-fun call!24074 () Bool)

(assert (=> bm!24071 (= call!24074 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!127595 (mask!10945 thiss!1504)))))

(declare-fun b!254911 () Bool)

(assert (=> b!254911 (= e!165232 call!24074)))

(declare-fun b!254912 () Bool)

(assert (=> b!254912 (= e!165233 call!24074)))

(assert (= (and d!61519 (not res!124769)) b!254910))

(assert (= (and b!254910 c!43016) b!254909))

(assert (= (and b!254910 (not c!43016)) b!254912))

(assert (= (and b!254909 res!124770) b!254911))

(assert (= (or b!254911 b!254912) bm!24071))

(assert (=> b!254909 m!270363))

(declare-fun m!270461 () Bool)

(assert (=> b!254909 m!270461))

(declare-fun m!270463 () Bool)

(assert (=> b!254909 m!270463))

(assert (=> b!254909 m!270363))

(declare-fun m!270465 () Bool)

(assert (=> b!254909 m!270465))

(assert (=> b!254910 m!270363))

(assert (=> b!254910 m!270363))

(assert (=> b!254910 m!270365))

(declare-fun m!270467 () Bool)

(assert (=> bm!24071 m!270467))

(assert (=> b!254629 d!61519))

(declare-fun b!254913 () Bool)

(declare-fun e!165235 () (_ BitVec 32))

(declare-fun e!165234 () (_ BitVec 32))

(assert (=> b!254913 (= e!165235 e!165234)))

(declare-fun c!43018 () Bool)

(assert (=> b!254913 (= c!43018 (validKeyInArray!0 (select (arr!5897 lt!127595) #b00000000000000000000000000000000)))))

(declare-fun b!254914 () Bool)

(declare-fun call!24075 () (_ BitVec 32))

(assert (=> b!254914 (= e!165234 call!24075)))

(declare-fun bm!24072 () Bool)

(assert (=> bm!24072 (= call!24075 (arrayCountValidKeys!0 lt!127595 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6244 (_keys!6851 thiss!1504))))))

(declare-fun d!61521 () Bool)

(declare-fun lt!127795 () (_ BitVec 32))

(assert (=> d!61521 (and (bvsge lt!127795 #b00000000000000000000000000000000) (bvsle lt!127795 (bvsub (size!6244 lt!127595) #b00000000000000000000000000000000)))))

(assert (=> d!61521 (= lt!127795 e!165235)))

(declare-fun c!43017 () Bool)

(assert (=> d!61521 (= c!43017 (bvsge #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))))))

(assert (=> d!61521 (and (bvsle #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6244 (_keys!6851 thiss!1504)) (size!6244 lt!127595)))))

(assert (=> d!61521 (= (arrayCountValidKeys!0 lt!127595 #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))) lt!127795)))

(declare-fun b!254915 () Bool)

(assert (=> b!254915 (= e!165234 (bvadd #b00000000000000000000000000000001 call!24075))))

(declare-fun b!254916 () Bool)

(assert (=> b!254916 (= e!165235 #b00000000000000000000000000000000)))

(assert (= (and d!61521 c!43017) b!254916))

(assert (= (and d!61521 (not c!43017)) b!254913))

(assert (= (and b!254913 c!43018) b!254915))

(assert (= (and b!254913 (not c!43018)) b!254914))

(assert (= (or b!254915 b!254914) bm!24072))

(assert (=> b!254913 m!270363))

(assert (=> b!254913 m!270363))

(assert (=> b!254913 m!270365))

(declare-fun m!270469 () Bool)

(assert (=> bm!24072 m!270469))

(assert (=> b!254629 d!61521))

(declare-fun d!61523 () Bool)

(declare-fun res!124777 () Bool)

(declare-fun e!165238 () Bool)

(assert (=> d!61523 (=> (not res!124777) (not e!165238))))

(declare-fun simpleValid!270 (LongMapFixedSize!3768) Bool)

(assert (=> d!61523 (= res!124777 (simpleValid!270 thiss!1504))))

(assert (=> d!61523 (= (valid!1473 thiss!1504) e!165238)))

(declare-fun b!254923 () Bool)

(declare-fun res!124778 () Bool)

(assert (=> b!254923 (=> (not res!124778) (not e!165238))))

(assert (=> b!254923 (= res!124778 (= (arrayCountValidKeys!0 (_keys!6851 thiss!1504) #b00000000000000000000000000000000 (size!6244 (_keys!6851 thiss!1504))) (_size!1933 thiss!1504)))))

(declare-fun b!254924 () Bool)

(declare-fun res!124779 () Bool)

(assert (=> b!254924 (=> (not res!124779) (not e!165238))))

(assert (=> b!254924 (= res!124779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6851 thiss!1504) (mask!10945 thiss!1504)))))

(declare-fun b!254925 () Bool)

(assert (=> b!254925 (= e!165238 (arrayNoDuplicates!0 (_keys!6851 thiss!1504) #b00000000000000000000000000000000 Nil!3771))))

(assert (= (and d!61523 res!124777) b!254923))

(assert (= (and b!254923 res!124778) b!254924))

(assert (= (and b!254924 res!124779) b!254925))

(declare-fun m!270471 () Bool)

(assert (=> d!61523 m!270471))

(assert (=> b!254923 m!270203))

(declare-fun m!270473 () Bool)

(assert (=> b!254924 m!270473))

(declare-fun m!270475 () Bool)

(assert (=> b!254925 m!270475))

(assert (=> start!24292 d!61523))

(declare-fun d!61525 () Bool)

(assert (=> d!61525 (= (inRange!0 (ite c!42950 (index!6778 lt!127601) (index!6781 lt!127601)) (mask!10945 thiss!1504)) (and (bvsge (ite c!42950 (index!6778 lt!127601) (index!6781 lt!127601)) #b00000000000000000000000000000000) (bvslt (ite c!42950 (index!6778 lt!127601) (index!6781 lt!127601)) (bvadd (mask!10945 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24021 d!61525))

(declare-fun d!61527 () Bool)

(declare-fun e!165241 () Bool)

(assert (=> d!61527 e!165241))

(declare-fun res!124785 () Bool)

(assert (=> d!61527 (=> (not res!124785) (not e!165241))))

(declare-fun lt!127800 () SeekEntryResult!1152)

(assert (=> d!61527 (= res!124785 ((_ is Found!1152) lt!127800))))

(assert (=> d!61527 (= lt!127800 (seekEntryOrOpen!0 key!932 (_keys!6851 thiss!1504) (mask!10945 thiss!1504)))))

(declare-fun lt!127801 () Unit!7896)

(declare-fun choose!1215 (array!12443 array!12441 (_ BitVec 32) (_ BitVec 32) V!8387 V!8387 (_ BitVec 64) Int) Unit!7896)

(assert (=> d!61527 (= lt!127801 (choose!1215 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) key!932 (defaultEntry!4697 thiss!1504)))))

(assert (=> d!61527 (validMask!0 (mask!10945 thiss!1504))))

(assert (=> d!61527 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!419 (_keys!6851 thiss!1504) (_values!4680 thiss!1504) (mask!10945 thiss!1504) (extraKeys!4434 thiss!1504) (zeroValue!4538 thiss!1504) (minValue!4538 thiss!1504) key!932 (defaultEntry!4697 thiss!1504)) lt!127801)))

(declare-fun b!254930 () Bool)

(declare-fun res!124784 () Bool)

(assert (=> b!254930 (=> (not res!124784) (not e!165241))))

(assert (=> b!254930 (= res!124784 (inRange!0 (index!6779 lt!127800) (mask!10945 thiss!1504)))))

(declare-fun b!254931 () Bool)

(assert (=> b!254931 (= e!165241 (= (select (arr!5897 (_keys!6851 thiss!1504)) (index!6779 lt!127800)) key!932))))

(assert (=> b!254931 (and (bvsge (index!6779 lt!127800) #b00000000000000000000000000000000) (bvslt (index!6779 lt!127800) (size!6244 (_keys!6851 thiss!1504))))))

(assert (= (and d!61527 res!124785) b!254930))

(assert (= (and b!254930 res!124784) b!254931))

(assert (=> d!61527 m!270211))

(declare-fun m!270477 () Bool)

(assert (=> d!61527 m!270477))

(assert (=> d!61527 m!270275))

(declare-fun m!270479 () Bool)

(assert (=> b!254930 m!270479))

(declare-fun m!270481 () Bool)

(assert (=> b!254931 m!270481))

(assert (=> b!254640 d!61527))

(declare-fun condMapEmpty!11154 () Bool)

(declare-fun mapDefault!11154 () ValueCell!2934)

(assert (=> mapNonEmpty!11148 (= condMapEmpty!11154 (= mapRest!11148 ((as const (Array (_ BitVec 32) ValueCell!2934)) mapDefault!11154)))))

(declare-fun e!165247 () Bool)

(declare-fun mapRes!11154 () Bool)

(assert (=> mapNonEmpty!11148 (= tp!23366 (and e!165247 mapRes!11154))))

(declare-fun b!254939 () Bool)

(assert (=> b!254939 (= e!165247 tp_is_empty!6555)))

(declare-fun mapIsEmpty!11154 () Bool)

(assert (=> mapIsEmpty!11154 mapRes!11154))

(declare-fun b!254938 () Bool)

(declare-fun e!165246 () Bool)

(assert (=> b!254938 (= e!165246 tp_is_empty!6555)))

(declare-fun mapNonEmpty!11154 () Bool)

(declare-fun tp!23376 () Bool)

(assert (=> mapNonEmpty!11154 (= mapRes!11154 (and tp!23376 e!165246))))

(declare-fun mapValue!11154 () ValueCell!2934)

(declare-fun mapKey!11154 () (_ BitVec 32))

(declare-fun mapRest!11154 () (Array (_ BitVec 32) ValueCell!2934))

(assert (=> mapNonEmpty!11154 (= mapRest!11148 (store mapRest!11154 mapKey!11154 mapValue!11154))))

(assert (= (and mapNonEmpty!11148 condMapEmpty!11154) mapIsEmpty!11154))

(assert (= (and mapNonEmpty!11148 (not condMapEmpty!11154)) mapNonEmpty!11154))

(assert (= (and mapNonEmpty!11154 ((_ is ValueCellFull!2934) mapValue!11154)) b!254938))

(assert (= (and mapNonEmpty!11148 ((_ is ValueCellFull!2934) mapDefault!11154)) b!254939))

(declare-fun m!270483 () Bool)

(assert (=> mapNonEmpty!11154 m!270483))

(declare-fun b_lambda!8135 () Bool)

(assert (= b_lambda!8133 (or (and b!254624 b_free!6693) b_lambda!8135)))

(declare-fun b_lambda!8137 () Bool)

(assert (= b_lambda!8131 (or (and b!254624 b_free!6693) b_lambda!8137)))

(check-sat (not b!254909) (not b!254760) (not d!61527) (not bm!24057) (not b!254832) (not b!254882) (not b!254831) (not b!254869) (not bm!24065) (not d!61511) (not bm!24071) b_and!13741 (not d!61493) (not b!254910) (not b!254804) (not b!254810) (not b_next!6693) (not d!61515) (not b!254835) (not b!254834) (not bm!24051) (not b!254871) (not b!254888) (not b!254913) (not b!254758) (not b!254812) (not b!254855) (not b!254709) (not b_lambda!8137) (not b!254808) (not bm!24058) (not bm!24060) (not b!254809) (not b!254837) (not b!254858) (not b!254806) (not b!254872) (not b!254924) (not b!254811) (not d!61487) (not b!254748) (not b!254897) (not bm!24033) (not b!254894) (not bm!24050) (not d!61503) (not b!254900) (not d!61501) (not bm!24055) (not b!254925) (not bm!24053) (not bm!24062) (not d!61517) (not b!254893) (not d!61523) (not b!254829) (not bm!24068) (not b!254827) (not b!254930) (not d!61505) (not d!61499) tp_is_empty!6555 (not d!61513) (not b_lambda!8135) (not bm!24034) (not bm!24072) (not d!61495) (not b!254856) (not mapNonEmpty!11154) (not b!254814) (not b!254923) (not b!254833))
(check-sat b_and!13741 (not b_next!6693))
