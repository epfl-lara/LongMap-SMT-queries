; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24560 () Bool)

(assert start!24560)

(declare-fun b!257163 () Bool)

(declare-fun b_free!6729 () Bool)

(declare-fun b_next!6729 () Bool)

(assert (=> b!257163 (= b_free!6729 (not b_next!6729))))

(declare-fun tp!23492 () Bool)

(declare-fun b_and!13795 () Bool)

(assert (=> b!257163 (= tp!23492 b_and!13795)))

(declare-fun b!257151 () Bool)

(declare-fun res!125790 () Bool)

(declare-fun e!166690 () Bool)

(assert (=> b!257151 (=> (not res!125790) (not e!166690))))

(declare-datatypes ((V!8435 0))(
  ( (V!8436 (val!3340 Int)) )
))
(declare-datatypes ((ValueCell!2952 0))(
  ( (ValueCellFull!2952 (v!5432 V!8435)) (EmptyCell!2952) )
))
(declare-datatypes ((array!12525 0))(
  ( (array!12526 (arr!5932 (Array (_ BitVec 32) ValueCell!2952)) (size!6279 (_ BitVec 32))) )
))
(declare-datatypes ((array!12527 0))(
  ( (array!12528 (arr!5933 (Array (_ BitVec 32) (_ BitVec 64))) (size!6280 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3804 0))(
  ( (LongMapFixedSize!3805 (defaultEntry!4745 Int) (mask!11029 (_ BitVec 32)) (extraKeys!4482 (_ BitVec 32)) (zeroValue!4586 V!8435) (minValue!4586 V!8435) (_size!1951 (_ BitVec 32)) (_keys!6911 array!12527) (_values!4728 array!12525) (_vacant!1951 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3804)

(declare-datatypes ((SeekEntryResult!1168 0))(
  ( (MissingZero!1168 (index!6842 (_ BitVec 32))) (Found!1168 (index!6843 (_ BitVec 32))) (Intermediate!1168 (undefined!1980 Bool) (index!6844 (_ BitVec 32)) (x!25000 (_ BitVec 32))) (Undefined!1168) (MissingVacant!1168 (index!6845 (_ BitVec 32))) )
))
(declare-fun lt!129230 () SeekEntryResult!1168)

(assert (=> b!257151 (= res!125790 (= (select (arr!5933 (_keys!6911 thiss!1504)) (index!6842 lt!129230)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257152 () Bool)

(declare-fun call!24397 () Bool)

(assert (=> b!257152 (= e!166690 (not call!24397))))

(declare-fun b!257153 () Bool)

(declare-fun e!166692 () Bool)

(declare-fun e!166694 () Bool)

(assert (=> b!257153 (= e!166692 e!166694)))

(declare-fun res!125792 () Bool)

(assert (=> b!257153 (=> (not res!125792) (not e!166694))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!257153 (= res!125792 (or (= lt!129230 (MissingZero!1168 index!297)) (= lt!129230 (MissingVacant!1168 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12527 (_ BitVec 32)) SeekEntryResult!1168)

(assert (=> b!257153 (= lt!129230 (seekEntryOrOpen!0 key!932 (_keys!6911 thiss!1504) (mask!11029 thiss!1504)))))

(declare-fun c!43500 () Bool)

(declare-fun bm!24393 () Bool)

(declare-fun call!24396 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24393 (= call!24396 (inRange!0 (ite c!43500 (index!6842 lt!129230) (index!6845 lt!129230)) (mask!11029 thiss!1504)))))

(declare-fun b!257154 () Bool)

(declare-datatypes ((Unit!7985 0))(
  ( (Unit!7986) )
))
(declare-fun e!166698 () Unit!7985)

(declare-fun lt!129239 () Unit!7985)

(assert (=> b!257154 (= e!166698 lt!129239)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!434 (array!12527 array!12525 (_ BitVec 32) (_ BitVec 32) V!8435 V!8435 (_ BitVec 64) Int) Unit!7985)

(assert (=> b!257154 (= lt!129239 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!434 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) key!932 (defaultEntry!4745 thiss!1504)))))

(get-info :version)

(assert (=> b!257154 (= c!43500 ((_ is MissingZero!1168) lt!129230))))

(declare-fun e!166701 () Bool)

(assert (=> b!257154 e!166701))

(declare-fun b!257155 () Bool)

(declare-fun e!166700 () Bool)

(assert (=> b!257155 (= e!166694 e!166700)))

(declare-fun res!125788 () Bool)

(assert (=> b!257155 (=> (not res!125788) (not e!166700))))

(assert (=> b!257155 (= res!125788 (inRange!0 index!297 (mask!11029 thiss!1504)))))

(declare-fun lt!129233 () Unit!7985)

(assert (=> b!257155 (= lt!129233 e!166698)))

(declare-fun c!43502 () Bool)

(declare-datatypes ((tuple2!4920 0))(
  ( (tuple2!4921 (_1!2471 (_ BitVec 64)) (_2!2471 V!8435)) )
))
(declare-datatypes ((List!3799 0))(
  ( (Nil!3796) (Cons!3795 (h!4457 tuple2!4920) (t!8858 List!3799)) )
))
(declare-datatypes ((ListLongMap!3833 0))(
  ( (ListLongMap!3834 (toList!1932 List!3799)) )
))
(declare-fun lt!129238 () ListLongMap!3833)

(declare-fun contains!1871 (ListLongMap!3833 (_ BitVec 64)) Bool)

(assert (=> b!257155 (= c!43502 (contains!1871 lt!129238 key!932))))

(declare-fun getCurrentListMap!1460 (array!12527 array!12525 (_ BitVec 32) (_ BitVec 32) V!8435 V!8435 (_ BitVec 32) Int) ListLongMap!3833)

(assert (=> b!257155 (= lt!129238 (getCurrentListMap!1460 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun b!257156 () Bool)

(declare-fun e!166697 () Bool)

(declare-fun e!166699 () Bool)

(declare-fun mapRes!11220 () Bool)

(assert (=> b!257156 (= e!166697 (and e!166699 mapRes!11220))))

(declare-fun condMapEmpty!11220 () Bool)

(declare-fun mapDefault!11220 () ValueCell!2952)

(assert (=> b!257156 (= condMapEmpty!11220 (= (arr!5932 (_values!4728 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2952)) mapDefault!11220)))))

(declare-fun b!257157 () Bool)

(assert (=> b!257157 (= e!166700 (not (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6279 (_values!4728 thiss!1504))))))))

(declare-fun lt!129237 () array!12527)

(declare-fun arrayCountValidKeys!0 (array!12527 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!257157 (= (arrayCountValidKeys!0 lt!129237 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!129232 () Unit!7985)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12527 (_ BitVec 32)) Unit!7985)

(assert (=> b!257157 (= lt!129232 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129237 index!297))))

(declare-fun arrayContainsKey!0 (array!12527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!257157 (arrayContainsKey!0 lt!129237 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129240 () Unit!7985)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12527 (_ BitVec 64) (_ BitVec 32)) Unit!7985)

(assert (=> b!257157 (= lt!129240 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129237 key!932 index!297))))

(declare-fun v!346 () V!8435)

(declare-fun +!686 (ListLongMap!3833 tuple2!4920) ListLongMap!3833)

(assert (=> b!257157 (= (+!686 lt!129238 (tuple2!4921 key!932 v!346)) (getCurrentListMap!1460 lt!129237 (array!12526 (store (arr!5932 (_values!4728 thiss!1504)) index!297 (ValueCellFull!2952 v!346)) (size!6279 (_values!4728 thiss!1504))) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun lt!129235 () Unit!7985)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!96 (array!12527 array!12525 (_ BitVec 32) (_ BitVec 32) V!8435 V!8435 (_ BitVec 32) (_ BitVec 64) V!8435 Int) Unit!7985)

(assert (=> b!257157 (= lt!129235 (lemmaAddValidKeyToArrayThenAddPairToListMap!96 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) index!297 key!932 v!346 (defaultEntry!4745 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12527 (_ BitVec 32)) Bool)

(assert (=> b!257157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129237 (mask!11029 thiss!1504))))

(declare-fun lt!129234 () Unit!7985)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12527 (_ BitVec 32) (_ BitVec 32)) Unit!7985)

(assert (=> b!257157 (= lt!129234 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6911 thiss!1504) index!297 (mask!11029 thiss!1504)))))

(assert (=> b!257157 (= (arrayCountValidKeys!0 lt!129237 #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6911 thiss!1504) #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504)))))))

(declare-fun lt!129231 () Unit!7985)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12527 (_ BitVec 32) (_ BitVec 64)) Unit!7985)

(assert (=> b!257157 (= lt!129231 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6911 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3800 0))(
  ( (Nil!3797) (Cons!3796 (h!4458 (_ BitVec 64)) (t!8859 List!3800)) )
))
(declare-fun arrayNoDuplicates!0 (array!12527 (_ BitVec 32) List!3800) Bool)

(assert (=> b!257157 (arrayNoDuplicates!0 lt!129237 #b00000000000000000000000000000000 Nil!3797)))

(assert (=> b!257157 (= lt!129237 (array!12528 (store (arr!5933 (_keys!6911 thiss!1504)) index!297 key!932) (size!6280 (_keys!6911 thiss!1504))))))

(declare-fun lt!129236 () Unit!7985)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12527 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3800) Unit!7985)

(assert (=> b!257157 (= lt!129236 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6911 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3797))))

(declare-fun lt!129241 () Unit!7985)

(declare-fun e!166693 () Unit!7985)

(assert (=> b!257157 (= lt!129241 e!166693)))

(declare-fun c!43501 () Bool)

(assert (=> b!257157 (= c!43501 (arrayContainsKey!0 (_keys!6911 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257158 () Bool)

(declare-fun res!125793 () Bool)

(assert (=> b!257158 (=> (not res!125793) (not e!166690))))

(assert (=> b!257158 (= res!125793 call!24396)))

(assert (=> b!257158 (= e!166701 e!166690)))

(declare-fun mapNonEmpty!11220 () Bool)

(declare-fun tp!23493 () Bool)

(declare-fun e!166696 () Bool)

(assert (=> mapNonEmpty!11220 (= mapRes!11220 (and tp!23493 e!166696))))

(declare-fun mapValue!11220 () ValueCell!2952)

(declare-fun mapKey!11220 () (_ BitVec 32))

(declare-fun mapRest!11220 () (Array (_ BitVec 32) ValueCell!2952))

(assert (=> mapNonEmpty!11220 (= (arr!5932 (_values!4728 thiss!1504)) (store mapRest!11220 mapKey!11220 mapValue!11220))))

(declare-fun b!257160 () Bool)

(declare-fun tp_is_empty!6591 () Bool)

(assert (=> b!257160 (= e!166696 tp_is_empty!6591)))

(declare-fun b!257161 () Bool)

(declare-fun Unit!7987 () Unit!7985)

(assert (=> b!257161 (= e!166698 Unit!7987)))

(declare-fun lt!129229 () Unit!7985)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!431 (array!12527 array!12525 (_ BitVec 32) (_ BitVec 32) V!8435 V!8435 (_ BitVec 64) Int) Unit!7985)

(assert (=> b!257161 (= lt!129229 (lemmaInListMapThenSeekEntryOrOpenFindsIt!431 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) key!932 (defaultEntry!4745 thiss!1504)))))

(assert (=> b!257161 false))

(declare-fun b!257162 () Bool)

(assert (=> b!257162 (= e!166699 tp_is_empty!6591)))

(declare-fun e!166695 () Bool)

(declare-fun array_inv!3919 (array!12527) Bool)

(declare-fun array_inv!3920 (array!12525) Bool)

(assert (=> b!257163 (= e!166695 (and tp!23492 tp_is_empty!6591 (array_inv!3919 (_keys!6911 thiss!1504)) (array_inv!3920 (_values!4728 thiss!1504)) e!166697))))

(declare-fun b!257164 () Bool)

(declare-fun res!125794 () Bool)

(assert (=> b!257164 (=> (not res!125794) (not e!166692))))

(assert (=> b!257164 (= res!125794 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!257165 () Bool)

(declare-fun Unit!7988 () Unit!7985)

(assert (=> b!257165 (= e!166693 Unit!7988)))

(declare-fun b!257166 () Bool)

(declare-fun res!125789 () Bool)

(assert (=> b!257166 (= res!125789 (= (select (arr!5933 (_keys!6911 thiss!1504)) (index!6845 lt!129230)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166702 () Bool)

(assert (=> b!257166 (=> (not res!125789) (not e!166702))))

(declare-fun b!257159 () Bool)

(declare-fun c!43499 () Bool)

(assert (=> b!257159 (= c!43499 ((_ is MissingVacant!1168) lt!129230))))

(declare-fun e!166691 () Bool)

(assert (=> b!257159 (= e!166701 e!166691)))

(declare-fun res!125791 () Bool)

(assert (=> start!24560 (=> (not res!125791) (not e!166692))))

(declare-fun valid!1487 (LongMapFixedSize!3804) Bool)

(assert (=> start!24560 (= res!125791 (valid!1487 thiss!1504))))

(assert (=> start!24560 e!166692))

(assert (=> start!24560 e!166695))

(assert (=> start!24560 true))

(assert (=> start!24560 tp_is_empty!6591))

(declare-fun mapIsEmpty!11220 () Bool)

(assert (=> mapIsEmpty!11220 mapRes!11220))

(declare-fun b!257167 () Bool)

(declare-fun Unit!7989 () Unit!7985)

(assert (=> b!257167 (= e!166693 Unit!7989)))

(declare-fun lt!129242 () Unit!7985)

(declare-fun lemmaArrayContainsKeyThenInListMap!238 (array!12527 array!12525 (_ BitVec 32) (_ BitVec 32) V!8435 V!8435 (_ BitVec 64) (_ BitVec 32) Int) Unit!7985)

(assert (=> b!257167 (= lt!129242 (lemmaArrayContainsKeyThenInListMap!238 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(assert (=> b!257167 false))

(declare-fun b!257168 () Bool)

(assert (=> b!257168 (= e!166691 ((_ is Undefined!1168) lt!129230))))

(declare-fun bm!24394 () Bool)

(assert (=> bm!24394 (= call!24397 (arrayContainsKey!0 (_keys!6911 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257169 () Bool)

(assert (=> b!257169 (= e!166702 (not call!24397))))

(declare-fun b!257170 () Bool)

(assert (=> b!257170 (= e!166691 e!166702)))

(declare-fun res!125787 () Bool)

(assert (=> b!257170 (= res!125787 call!24396)))

(assert (=> b!257170 (=> (not res!125787) (not e!166702))))

(assert (= (and start!24560 res!125791) b!257164))

(assert (= (and b!257164 res!125794) b!257153))

(assert (= (and b!257153 res!125792) b!257155))

(assert (= (and b!257155 c!43502) b!257161))

(assert (= (and b!257155 (not c!43502)) b!257154))

(assert (= (and b!257154 c!43500) b!257158))

(assert (= (and b!257154 (not c!43500)) b!257159))

(assert (= (and b!257158 res!125793) b!257151))

(assert (= (and b!257151 res!125790) b!257152))

(assert (= (and b!257159 c!43499) b!257170))

(assert (= (and b!257159 (not c!43499)) b!257168))

(assert (= (and b!257170 res!125787) b!257166))

(assert (= (and b!257166 res!125789) b!257169))

(assert (= (or b!257158 b!257170) bm!24393))

(assert (= (or b!257152 b!257169) bm!24394))

(assert (= (and b!257155 res!125788) b!257157))

(assert (= (and b!257157 c!43501) b!257167))

(assert (= (and b!257157 (not c!43501)) b!257165))

(assert (= (and b!257156 condMapEmpty!11220) mapIsEmpty!11220))

(assert (= (and b!257156 (not condMapEmpty!11220)) mapNonEmpty!11220))

(assert (= (and mapNonEmpty!11220 ((_ is ValueCellFull!2952) mapValue!11220)) b!257160))

(assert (= (and b!257156 ((_ is ValueCellFull!2952) mapDefault!11220)) b!257162))

(assert (= b!257163 b!257156))

(assert (= start!24560 b!257163))

(declare-fun m!272477 () Bool)

(assert (=> bm!24394 m!272477))

(declare-fun m!272479 () Bool)

(assert (=> mapNonEmpty!11220 m!272479))

(assert (=> b!257157 m!272477))

(declare-fun m!272481 () Bool)

(assert (=> b!257157 m!272481))

(declare-fun m!272483 () Bool)

(assert (=> b!257157 m!272483))

(declare-fun m!272485 () Bool)

(assert (=> b!257157 m!272485))

(declare-fun m!272487 () Bool)

(assert (=> b!257157 m!272487))

(declare-fun m!272489 () Bool)

(assert (=> b!257157 m!272489))

(declare-fun m!272491 () Bool)

(assert (=> b!257157 m!272491))

(declare-fun m!272493 () Bool)

(assert (=> b!257157 m!272493))

(declare-fun m!272495 () Bool)

(assert (=> b!257157 m!272495))

(declare-fun m!272497 () Bool)

(assert (=> b!257157 m!272497))

(declare-fun m!272499 () Bool)

(assert (=> b!257157 m!272499))

(declare-fun m!272501 () Bool)

(assert (=> b!257157 m!272501))

(declare-fun m!272503 () Bool)

(assert (=> b!257157 m!272503))

(declare-fun m!272505 () Bool)

(assert (=> b!257157 m!272505))

(declare-fun m!272507 () Bool)

(assert (=> b!257157 m!272507))

(declare-fun m!272509 () Bool)

(assert (=> b!257157 m!272509))

(declare-fun m!272511 () Bool)

(assert (=> b!257157 m!272511))

(declare-fun m!272513 () Bool)

(assert (=> b!257167 m!272513))

(declare-fun m!272515 () Bool)

(assert (=> b!257155 m!272515))

(declare-fun m!272517 () Bool)

(assert (=> b!257155 m!272517))

(declare-fun m!272519 () Bool)

(assert (=> b!257155 m!272519))

(declare-fun m!272521 () Bool)

(assert (=> b!257166 m!272521))

(declare-fun m!272523 () Bool)

(assert (=> start!24560 m!272523))

(declare-fun m!272525 () Bool)

(assert (=> b!257154 m!272525))

(declare-fun m!272527 () Bool)

(assert (=> b!257163 m!272527))

(declare-fun m!272529 () Bool)

(assert (=> b!257163 m!272529))

(declare-fun m!272531 () Bool)

(assert (=> b!257161 m!272531))

(declare-fun m!272533 () Bool)

(assert (=> bm!24393 m!272533))

(declare-fun m!272535 () Bool)

(assert (=> b!257153 m!272535))

(declare-fun m!272537 () Bool)

(assert (=> b!257151 m!272537))

(check-sat (not b!257154) b_and!13795 (not b!257167) (not mapNonEmpty!11220) (not bm!24393) (not b!257163) (not start!24560) tp_is_empty!6591 (not b!257157) (not b!257161) (not bm!24394) (not b_next!6729) (not b!257155) (not b!257153))
(check-sat b_and!13795 (not b_next!6729))
(get-model)

(declare-fun d!61769 () Bool)

(assert (=> d!61769 (contains!1871 (getCurrentListMap!1460 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)) key!932)))

(declare-fun lt!129287 () Unit!7985)

(declare-fun choose!1236 (array!12527 array!12525 (_ BitVec 32) (_ BitVec 32) V!8435 V!8435 (_ BitVec 64) (_ BitVec 32) Int) Unit!7985)

(assert (=> d!61769 (= lt!129287 (choose!1236 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61769 (validMask!0 (mask!11029 thiss!1504))))

(assert (=> d!61769 (= (lemmaArrayContainsKeyThenInListMap!238 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)) lt!129287)))

(declare-fun bs!9080 () Bool)

(assert (= bs!9080 d!61769))

(assert (=> bs!9080 m!272519))

(assert (=> bs!9080 m!272519))

(declare-fun m!272601 () Bool)

(assert (=> bs!9080 m!272601))

(declare-fun m!272603 () Bool)

(assert (=> bs!9080 m!272603))

(declare-fun m!272605 () Bool)

(assert (=> bs!9080 m!272605))

(assert (=> b!257167 d!61769))

(declare-fun d!61771 () Bool)

(assert (=> d!61771 (= (inRange!0 (ite c!43500 (index!6842 lt!129230) (index!6845 lt!129230)) (mask!11029 thiss!1504)) (and (bvsge (ite c!43500 (index!6842 lt!129230) (index!6845 lt!129230)) #b00000000000000000000000000000000) (bvslt (ite c!43500 (index!6842 lt!129230) (index!6845 lt!129230)) (bvadd (mask!11029 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24393 d!61771))

(declare-fun d!61773 () Bool)

(assert (=> d!61773 (= (array_inv!3919 (_keys!6911 thiss!1504)) (bvsge (size!6280 (_keys!6911 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257163 d!61773))

(declare-fun d!61775 () Bool)

(assert (=> d!61775 (= (array_inv!3920 (_values!4728 thiss!1504)) (bvsge (size!6279 (_values!4728 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257163 d!61775))

(declare-fun b!257247 () Bool)

(declare-fun res!125827 () Bool)

(declare-fun e!166755 () Bool)

(assert (=> b!257247 (=> (not res!125827) (not e!166755))))

(declare-fun call!24409 () Bool)

(assert (=> b!257247 (= res!125827 call!24409)))

(declare-fun e!166757 () Bool)

(assert (=> b!257247 (= e!166757 e!166755)))

(declare-fun b!257248 () Bool)

(declare-fun e!166754 () Bool)

(declare-fun call!24408 () Bool)

(assert (=> b!257248 (= e!166754 (not call!24408))))

(declare-fun bm!24405 () Bool)

(assert (=> bm!24405 (= call!24408 (arrayContainsKey!0 (_keys!6911 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257249 () Bool)

(declare-fun e!166756 () Bool)

(assert (=> b!257249 (= e!166756 e!166754)))

(declare-fun res!125829 () Bool)

(assert (=> b!257249 (= res!125829 call!24409)))

(assert (=> b!257249 (=> (not res!125829) (not e!166754))))

(declare-fun c!43520 () Bool)

(declare-fun lt!129293 () SeekEntryResult!1168)

(declare-fun bm!24406 () Bool)

(assert (=> bm!24406 (= call!24409 (inRange!0 (ite c!43520 (index!6842 lt!129293) (index!6845 lt!129293)) (mask!11029 thiss!1504)))))

(declare-fun b!257250 () Bool)

(assert (=> b!257250 (= e!166756 e!166757)))

(declare-fun c!43519 () Bool)

(assert (=> b!257250 (= c!43519 ((_ is MissingVacant!1168) lt!129293))))

(declare-fun b!257251 () Bool)

(assert (=> b!257251 (= e!166757 ((_ is Undefined!1168) lt!129293))))

(declare-fun b!257252 () Bool)

(declare-fun res!125830 () Bool)

(assert (=> b!257252 (=> (not res!125830) (not e!166755))))

(assert (=> b!257252 (= res!125830 (= (select (arr!5933 (_keys!6911 thiss!1504)) (index!6845 lt!129293)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257252 (and (bvsge (index!6845 lt!129293) #b00000000000000000000000000000000) (bvslt (index!6845 lt!129293) (size!6280 (_keys!6911 thiss!1504))))))

(declare-fun d!61777 () Bool)

(assert (=> d!61777 e!166756))

(assert (=> d!61777 (= c!43520 ((_ is MissingZero!1168) lt!129293))))

(assert (=> d!61777 (= lt!129293 (seekEntryOrOpen!0 key!932 (_keys!6911 thiss!1504) (mask!11029 thiss!1504)))))

(declare-fun lt!129292 () Unit!7985)

(declare-fun choose!1237 (array!12527 array!12525 (_ BitVec 32) (_ BitVec 32) V!8435 V!8435 (_ BitVec 64) Int) Unit!7985)

(assert (=> d!61777 (= lt!129292 (choose!1237 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) key!932 (defaultEntry!4745 thiss!1504)))))

(assert (=> d!61777 (validMask!0 (mask!11029 thiss!1504))))

(assert (=> d!61777 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!434 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) key!932 (defaultEntry!4745 thiss!1504)) lt!129292)))

(declare-fun b!257253 () Bool)

(assert (=> b!257253 (= e!166755 (not call!24408))))

(declare-fun b!257254 () Bool)

(assert (=> b!257254 (and (bvsge (index!6842 lt!129293) #b00000000000000000000000000000000) (bvslt (index!6842 lt!129293) (size!6280 (_keys!6911 thiss!1504))))))

(declare-fun res!125828 () Bool)

(assert (=> b!257254 (= res!125828 (= (select (arr!5933 (_keys!6911 thiss!1504)) (index!6842 lt!129293)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257254 (=> (not res!125828) (not e!166754))))

(assert (= (and d!61777 c!43520) b!257249))

(assert (= (and d!61777 (not c!43520)) b!257250))

(assert (= (and b!257249 res!125829) b!257254))

(assert (= (and b!257254 res!125828) b!257248))

(assert (= (and b!257250 c!43519) b!257247))

(assert (= (and b!257250 (not c!43519)) b!257251))

(assert (= (and b!257247 res!125827) b!257252))

(assert (= (and b!257252 res!125830) b!257253))

(assert (= (or b!257249 b!257247) bm!24406))

(assert (= (or b!257248 b!257253) bm!24405))

(declare-fun m!272607 () Bool)

(assert (=> b!257254 m!272607))

(assert (=> d!61777 m!272535))

(declare-fun m!272609 () Bool)

(assert (=> d!61777 m!272609))

(assert (=> d!61777 m!272605))

(declare-fun m!272611 () Bool)

(assert (=> bm!24406 m!272611))

(declare-fun m!272613 () Bool)

(assert (=> b!257252 m!272613))

(assert (=> bm!24405 m!272477))

(assert (=> b!257154 d!61777))

(declare-fun d!61779 () Bool)

(declare-fun res!125835 () Bool)

(declare-fun e!166762 () Bool)

(assert (=> d!61779 (=> res!125835 e!166762)))

(assert (=> d!61779 (= res!125835 (= (select (arr!5933 (_keys!6911 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61779 (= (arrayContainsKey!0 (_keys!6911 thiss!1504) key!932 #b00000000000000000000000000000000) e!166762)))

(declare-fun b!257259 () Bool)

(declare-fun e!166763 () Bool)

(assert (=> b!257259 (= e!166762 e!166763)))

(declare-fun res!125836 () Bool)

(assert (=> b!257259 (=> (not res!125836) (not e!166763))))

(assert (=> b!257259 (= res!125836 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6280 (_keys!6911 thiss!1504))))))

(declare-fun b!257260 () Bool)

(assert (=> b!257260 (= e!166763 (arrayContainsKey!0 (_keys!6911 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61779 (not res!125835)) b!257259))

(assert (= (and b!257259 res!125836) b!257260))

(declare-fun m!272615 () Bool)

(assert (=> d!61779 m!272615))

(declare-fun m!272617 () Bool)

(assert (=> b!257260 m!272617))

(assert (=> bm!24394 d!61779))

(declare-fun d!61781 () Bool)

(assert (=> d!61781 (= (inRange!0 index!297 (mask!11029 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11029 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!257155 d!61781))

(declare-fun d!61783 () Bool)

(declare-fun e!166769 () Bool)

(assert (=> d!61783 e!166769))

(declare-fun res!125839 () Bool)

(assert (=> d!61783 (=> res!125839 e!166769)))

(declare-fun lt!129303 () Bool)

(assert (=> d!61783 (= res!125839 (not lt!129303))))

(declare-fun lt!129305 () Bool)

(assert (=> d!61783 (= lt!129303 lt!129305)))

(declare-fun lt!129304 () Unit!7985)

(declare-fun e!166768 () Unit!7985)

(assert (=> d!61783 (= lt!129304 e!166768)))

(declare-fun c!43523 () Bool)

(assert (=> d!61783 (= c!43523 lt!129305)))

(declare-fun containsKey!303 (List!3799 (_ BitVec 64)) Bool)

(assert (=> d!61783 (= lt!129305 (containsKey!303 (toList!1932 lt!129238) key!932))))

(assert (=> d!61783 (= (contains!1871 lt!129238 key!932) lt!129303)))

(declare-fun b!257267 () Bool)

(declare-fun lt!129302 () Unit!7985)

(assert (=> b!257267 (= e!166768 lt!129302)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!251 (List!3799 (_ BitVec 64)) Unit!7985)

(assert (=> b!257267 (= lt!129302 (lemmaContainsKeyImpliesGetValueByKeyDefined!251 (toList!1932 lt!129238) key!932))))

(declare-datatypes ((Option!317 0))(
  ( (Some!316 (v!5436 V!8435)) (None!315) )
))
(declare-fun isDefined!252 (Option!317) Bool)

(declare-fun getValueByKey!311 (List!3799 (_ BitVec 64)) Option!317)

(assert (=> b!257267 (isDefined!252 (getValueByKey!311 (toList!1932 lt!129238) key!932))))

(declare-fun b!257268 () Bool)

(declare-fun Unit!7995 () Unit!7985)

(assert (=> b!257268 (= e!166768 Unit!7995)))

(declare-fun b!257269 () Bool)

(assert (=> b!257269 (= e!166769 (isDefined!252 (getValueByKey!311 (toList!1932 lt!129238) key!932)))))

(assert (= (and d!61783 c!43523) b!257267))

(assert (= (and d!61783 (not c!43523)) b!257268))

(assert (= (and d!61783 (not res!125839)) b!257269))

(declare-fun m!272619 () Bool)

(assert (=> d!61783 m!272619))

(declare-fun m!272621 () Bool)

(assert (=> b!257267 m!272621))

(declare-fun m!272623 () Bool)

(assert (=> b!257267 m!272623))

(assert (=> b!257267 m!272623))

(declare-fun m!272625 () Bool)

(assert (=> b!257267 m!272625))

(assert (=> b!257269 m!272623))

(assert (=> b!257269 m!272623))

(assert (=> b!257269 m!272625))

(assert (=> b!257155 d!61783))

(declare-fun b!257312 () Bool)

(declare-fun e!166797 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!257312 (= e!166797 (validKeyInArray!0 (select (arr!5933 (_keys!6911 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!257314 () Bool)

(declare-fun e!166803 () Bool)

(declare-fun e!166804 () Bool)

(assert (=> b!257314 (= e!166803 e!166804)))

(declare-fun c!43538 () Bool)

(assert (=> b!257314 (= c!43538 (not (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!43536 () Bool)

(declare-fun call!24427 () ListLongMap!3833)

(declare-fun c!43537 () Bool)

(declare-fun call!24430 () ListLongMap!3833)

(declare-fun bm!24421 () Bool)

(declare-fun call!24429 () ListLongMap!3833)

(declare-fun call!24424 () ListLongMap!3833)

(assert (=> bm!24421 (= call!24424 (+!686 (ite c!43536 call!24427 (ite c!43537 call!24430 call!24429)) (ite (or c!43536 c!43537) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4586 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4586 thiss!1504)))))))

(declare-fun b!257315 () Bool)

(declare-fun e!166805 () Bool)

(declare-fun e!166807 () Bool)

(assert (=> b!257315 (= e!166805 e!166807)))

(declare-fun res!125858 () Bool)

(assert (=> b!257315 (=> (not res!125858) (not e!166807))))

(declare-fun lt!129370 () ListLongMap!3833)

(assert (=> b!257315 (= res!125858 (contains!1871 lt!129370 (select (arr!5933 (_keys!6911 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!257315 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))))))

(declare-fun bm!24422 () Bool)

(declare-fun call!24425 () ListLongMap!3833)

(assert (=> bm!24422 (= call!24425 call!24424)))

(declare-fun b!257316 () Bool)

(declare-fun apply!253 (ListLongMap!3833 (_ BitVec 64)) V!8435)

(declare-fun get!3050 (ValueCell!2952 V!8435) V!8435)

(declare-fun dynLambda!596 (Int (_ BitVec 64)) V!8435)

(assert (=> b!257316 (= e!166807 (= (apply!253 lt!129370 (select (arr!5933 (_keys!6911 thiss!1504)) #b00000000000000000000000000000000)) (get!3050 (select (arr!5932 (_values!4728 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4745 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257316 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6279 (_values!4728 thiss!1504))))))

(assert (=> b!257316 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))))))

(declare-fun b!257317 () Bool)

(declare-fun e!166798 () Bool)

(assert (=> b!257317 (= e!166804 e!166798)))

(declare-fun res!125860 () Bool)

(declare-fun call!24428 () Bool)

(assert (=> b!257317 (= res!125860 call!24428)))

(assert (=> b!257317 (=> (not res!125860) (not e!166798))))

(declare-fun bm!24423 () Bool)

(assert (=> bm!24423 (= call!24429 call!24430)))

(declare-fun bm!24424 () Bool)

(declare-fun call!24426 () Bool)

(assert (=> bm!24424 (= call!24426 (contains!1871 lt!129370 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257318 () Bool)

(declare-fun e!166800 () Bool)

(assert (=> b!257318 (= e!166800 (not call!24426))))

(declare-fun b!257319 () Bool)

(declare-fun e!166796 () ListLongMap!3833)

(assert (=> b!257319 (= e!166796 call!24425)))

(declare-fun b!257320 () Bool)

(declare-fun e!166801 () Bool)

(assert (=> b!257320 (= e!166800 e!166801)))

(declare-fun res!125863 () Bool)

(assert (=> b!257320 (= res!125863 call!24426)))

(assert (=> b!257320 (=> (not res!125863) (not e!166801))))

(declare-fun b!257321 () Bool)

(declare-fun e!166806 () ListLongMap!3833)

(declare-fun e!166808 () ListLongMap!3833)

(assert (=> b!257321 (= e!166806 e!166808)))

(assert (=> b!257321 (= c!43537 (and (not (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!61785 () Bool)

(assert (=> d!61785 e!166803))

(declare-fun res!125864 () Bool)

(assert (=> d!61785 (=> (not res!125864) (not e!166803))))

(assert (=> d!61785 (= res!125864 (or (bvsge #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))))))))

(declare-fun lt!129354 () ListLongMap!3833)

(assert (=> d!61785 (= lt!129370 lt!129354)))

(declare-fun lt!129365 () Unit!7985)

(declare-fun e!166799 () Unit!7985)

(assert (=> d!61785 (= lt!129365 e!166799)))

(declare-fun c!43541 () Bool)

(assert (=> d!61785 (= c!43541 e!166797)))

(declare-fun res!125862 () Bool)

(assert (=> d!61785 (=> (not res!125862) (not e!166797))))

(assert (=> d!61785 (= res!125862 (bvslt #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))))))

(assert (=> d!61785 (= lt!129354 e!166806)))

(assert (=> d!61785 (= c!43536 (and (not (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61785 (validMask!0 (mask!11029 thiss!1504))))

(assert (=> d!61785 (= (getCurrentListMap!1460 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)) lt!129370)))

(declare-fun b!257313 () Bool)

(declare-fun e!166802 () Bool)

(assert (=> b!257313 (= e!166802 (validKeyInArray!0 (select (arr!5933 (_keys!6911 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!257322 () Bool)

(declare-fun Unit!7996 () Unit!7985)

(assert (=> b!257322 (= e!166799 Unit!7996)))

(declare-fun b!257323 () Bool)

(assert (=> b!257323 (= e!166798 (= (apply!253 lt!129370 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4586 thiss!1504)))))

(declare-fun b!257324 () Bool)

(declare-fun res!125859 () Bool)

(assert (=> b!257324 (=> (not res!125859) (not e!166803))))

(assert (=> b!257324 (= res!125859 e!166800)))

(declare-fun c!43539 () Bool)

(assert (=> b!257324 (= c!43539 (not (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24425 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!575 (array!12527 array!12525 (_ BitVec 32) (_ BitVec 32) V!8435 V!8435 (_ BitVec 32) Int) ListLongMap!3833)

(assert (=> bm!24425 (= call!24427 (getCurrentListMapNoExtraKeys!575 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun bm!24426 () Bool)

(assert (=> bm!24426 (= call!24428 (contains!1871 lt!129370 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257325 () Bool)

(assert (=> b!257325 (= e!166801 (= (apply!253 lt!129370 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4586 thiss!1504)))))

(declare-fun b!257326 () Bool)

(assert (=> b!257326 (= e!166806 (+!686 call!24424 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4586 thiss!1504))))))

(declare-fun b!257327 () Bool)

(assert (=> b!257327 (= e!166796 call!24429)))

(declare-fun bm!24427 () Bool)

(assert (=> bm!24427 (= call!24430 call!24427)))

(declare-fun b!257328 () Bool)

(assert (=> b!257328 (= e!166804 (not call!24428))))

(declare-fun b!257329 () Bool)

(assert (=> b!257329 (= e!166808 call!24425)))

(declare-fun b!257330 () Bool)

(declare-fun c!43540 () Bool)

(assert (=> b!257330 (= c!43540 (and (not (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!257330 (= e!166808 e!166796)))

(declare-fun b!257331 () Bool)

(declare-fun res!125866 () Bool)

(assert (=> b!257331 (=> (not res!125866) (not e!166803))))

(assert (=> b!257331 (= res!125866 e!166805)))

(declare-fun res!125865 () Bool)

(assert (=> b!257331 (=> res!125865 e!166805)))

(assert (=> b!257331 (= res!125865 (not e!166802))))

(declare-fun res!125861 () Bool)

(assert (=> b!257331 (=> (not res!125861) (not e!166802))))

(assert (=> b!257331 (= res!125861 (bvslt #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))))))

(declare-fun b!257332 () Bool)

(declare-fun lt!129357 () Unit!7985)

(assert (=> b!257332 (= e!166799 lt!129357)))

(declare-fun lt!129352 () ListLongMap!3833)

(assert (=> b!257332 (= lt!129352 (getCurrentListMapNoExtraKeys!575 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun lt!129362 () (_ BitVec 64))

(assert (=> b!257332 (= lt!129362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129355 () (_ BitVec 64))

(assert (=> b!257332 (= lt!129355 (select (arr!5933 (_keys!6911 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129350 () Unit!7985)

(declare-fun addStillContains!229 (ListLongMap!3833 (_ BitVec 64) V!8435 (_ BitVec 64)) Unit!7985)

(assert (=> b!257332 (= lt!129350 (addStillContains!229 lt!129352 lt!129362 (zeroValue!4586 thiss!1504) lt!129355))))

(assert (=> b!257332 (contains!1871 (+!686 lt!129352 (tuple2!4921 lt!129362 (zeroValue!4586 thiss!1504))) lt!129355)))

(declare-fun lt!129369 () Unit!7985)

(assert (=> b!257332 (= lt!129369 lt!129350)))

(declare-fun lt!129360 () ListLongMap!3833)

(assert (=> b!257332 (= lt!129360 (getCurrentListMapNoExtraKeys!575 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun lt!129361 () (_ BitVec 64))

(assert (=> b!257332 (= lt!129361 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129363 () (_ BitVec 64))

(assert (=> b!257332 (= lt!129363 (select (arr!5933 (_keys!6911 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129359 () Unit!7985)

(declare-fun addApplyDifferent!229 (ListLongMap!3833 (_ BitVec 64) V!8435 (_ BitVec 64)) Unit!7985)

(assert (=> b!257332 (= lt!129359 (addApplyDifferent!229 lt!129360 lt!129361 (minValue!4586 thiss!1504) lt!129363))))

(assert (=> b!257332 (= (apply!253 (+!686 lt!129360 (tuple2!4921 lt!129361 (minValue!4586 thiss!1504))) lt!129363) (apply!253 lt!129360 lt!129363))))

(declare-fun lt!129371 () Unit!7985)

(assert (=> b!257332 (= lt!129371 lt!129359)))

(declare-fun lt!129358 () ListLongMap!3833)

(assert (=> b!257332 (= lt!129358 (getCurrentListMapNoExtraKeys!575 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun lt!129356 () (_ BitVec 64))

(assert (=> b!257332 (= lt!129356 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129351 () (_ BitVec 64))

(assert (=> b!257332 (= lt!129351 (select (arr!5933 (_keys!6911 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129367 () Unit!7985)

(assert (=> b!257332 (= lt!129367 (addApplyDifferent!229 lt!129358 lt!129356 (zeroValue!4586 thiss!1504) lt!129351))))

(assert (=> b!257332 (= (apply!253 (+!686 lt!129358 (tuple2!4921 lt!129356 (zeroValue!4586 thiss!1504))) lt!129351) (apply!253 lt!129358 lt!129351))))

(declare-fun lt!129366 () Unit!7985)

(assert (=> b!257332 (= lt!129366 lt!129367)))

(declare-fun lt!129353 () ListLongMap!3833)

(assert (=> b!257332 (= lt!129353 (getCurrentListMapNoExtraKeys!575 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun lt!129368 () (_ BitVec 64))

(assert (=> b!257332 (= lt!129368 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129364 () (_ BitVec 64))

(assert (=> b!257332 (= lt!129364 (select (arr!5933 (_keys!6911 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257332 (= lt!129357 (addApplyDifferent!229 lt!129353 lt!129368 (minValue!4586 thiss!1504) lt!129364))))

(assert (=> b!257332 (= (apply!253 (+!686 lt!129353 (tuple2!4921 lt!129368 (minValue!4586 thiss!1504))) lt!129364) (apply!253 lt!129353 lt!129364))))

(assert (= (and d!61785 c!43536) b!257326))

(assert (= (and d!61785 (not c!43536)) b!257321))

(assert (= (and b!257321 c!43537) b!257329))

(assert (= (and b!257321 (not c!43537)) b!257330))

(assert (= (and b!257330 c!43540) b!257319))

(assert (= (and b!257330 (not c!43540)) b!257327))

(assert (= (or b!257319 b!257327) bm!24423))

(assert (= (or b!257329 bm!24423) bm!24427))

(assert (= (or b!257329 b!257319) bm!24422))

(assert (= (or b!257326 bm!24427) bm!24425))

(assert (= (or b!257326 bm!24422) bm!24421))

(assert (= (and d!61785 res!125862) b!257312))

(assert (= (and d!61785 c!43541) b!257332))

(assert (= (and d!61785 (not c!43541)) b!257322))

(assert (= (and d!61785 res!125864) b!257331))

(assert (= (and b!257331 res!125861) b!257313))

(assert (= (and b!257331 (not res!125865)) b!257315))

(assert (= (and b!257315 res!125858) b!257316))

(assert (= (and b!257331 res!125866) b!257324))

(assert (= (and b!257324 c!43539) b!257320))

(assert (= (and b!257324 (not c!43539)) b!257318))

(assert (= (and b!257320 res!125863) b!257325))

(assert (= (or b!257320 b!257318) bm!24424))

(assert (= (and b!257324 res!125859) b!257314))

(assert (= (and b!257314 c!43538) b!257317))

(assert (= (and b!257314 (not c!43538)) b!257328))

(assert (= (and b!257317 res!125860) b!257323))

(assert (= (or b!257317 b!257328) bm!24426))

(declare-fun b_lambda!8179 () Bool)

(assert (=> (not b_lambda!8179) (not b!257316)))

(declare-fun t!8863 () Bool)

(declare-fun tb!3019 () Bool)

(assert (=> (and b!257163 (= (defaultEntry!4745 thiss!1504) (defaultEntry!4745 thiss!1504)) t!8863) tb!3019))

(declare-fun result!5379 () Bool)

(assert (=> tb!3019 (= result!5379 tp_is_empty!6591)))

(assert (=> b!257316 t!8863))

(declare-fun b_and!13799 () Bool)

(assert (= b_and!13795 (and (=> t!8863 result!5379) b_and!13799)))

(declare-fun m!272627 () Bool)

(assert (=> b!257332 m!272627))

(declare-fun m!272629 () Bool)

(assert (=> b!257332 m!272629))

(declare-fun m!272631 () Bool)

(assert (=> b!257332 m!272631))

(declare-fun m!272633 () Bool)

(assert (=> b!257332 m!272633))

(assert (=> b!257332 m!272615))

(declare-fun m!272635 () Bool)

(assert (=> b!257332 m!272635))

(declare-fun m!272637 () Bool)

(assert (=> b!257332 m!272637))

(declare-fun m!272639 () Bool)

(assert (=> b!257332 m!272639))

(declare-fun m!272641 () Bool)

(assert (=> b!257332 m!272641))

(declare-fun m!272643 () Bool)

(assert (=> b!257332 m!272643))

(declare-fun m!272645 () Bool)

(assert (=> b!257332 m!272645))

(declare-fun m!272647 () Bool)

(assert (=> b!257332 m!272647))

(assert (=> b!257332 m!272635))

(assert (=> b!257332 m!272631))

(declare-fun m!272649 () Bool)

(assert (=> b!257332 m!272649))

(assert (=> b!257332 m!272645))

(declare-fun m!272651 () Bool)

(assert (=> b!257332 m!272651))

(declare-fun m!272653 () Bool)

(assert (=> b!257332 m!272653))

(declare-fun m!272655 () Bool)

(assert (=> b!257332 m!272655))

(assert (=> b!257332 m!272629))

(declare-fun m!272657 () Bool)

(assert (=> b!257332 m!272657))

(assert (=> b!257315 m!272615))

(assert (=> b!257315 m!272615))

(declare-fun m!272659 () Bool)

(assert (=> b!257315 m!272659))

(assert (=> bm!24425 m!272633))

(declare-fun m!272661 () Bool)

(assert (=> b!257316 m!272661))

(declare-fun m!272663 () Bool)

(assert (=> b!257316 m!272663))

(assert (=> b!257316 m!272661))

(declare-fun m!272665 () Bool)

(assert (=> b!257316 m!272665))

(assert (=> b!257316 m!272615))

(declare-fun m!272667 () Bool)

(assert (=> b!257316 m!272667))

(assert (=> b!257316 m!272663))

(assert (=> b!257316 m!272615))

(declare-fun m!272669 () Bool)

(assert (=> b!257325 m!272669))

(assert (=> d!61785 m!272605))

(declare-fun m!272671 () Bool)

(assert (=> b!257326 m!272671))

(declare-fun m!272673 () Bool)

(assert (=> bm!24424 m!272673))

(assert (=> b!257312 m!272615))

(assert (=> b!257312 m!272615))

(declare-fun m!272675 () Bool)

(assert (=> b!257312 m!272675))

(declare-fun m!272677 () Bool)

(assert (=> bm!24421 m!272677))

(declare-fun m!272679 () Bool)

(assert (=> b!257323 m!272679))

(declare-fun m!272681 () Bool)

(assert (=> bm!24426 m!272681))

(assert (=> b!257313 m!272615))

(assert (=> b!257313 m!272615))

(assert (=> b!257313 m!272675))

(assert (=> b!257155 d!61785))

(declare-fun d!61787 () Bool)

(declare-fun e!166811 () Bool)

(assert (=> d!61787 e!166811))

(declare-fun res!125872 () Bool)

(assert (=> d!61787 (=> (not res!125872) (not e!166811))))

(declare-fun lt!129380 () ListLongMap!3833)

(assert (=> d!61787 (= res!125872 (contains!1871 lt!129380 (_1!2471 (tuple2!4921 key!932 v!346))))))

(declare-fun lt!129382 () List!3799)

(assert (=> d!61787 (= lt!129380 (ListLongMap!3834 lt!129382))))

(declare-fun lt!129383 () Unit!7985)

(declare-fun lt!129381 () Unit!7985)

(assert (=> d!61787 (= lt!129383 lt!129381)))

(assert (=> d!61787 (= (getValueByKey!311 lt!129382 (_1!2471 (tuple2!4921 key!932 v!346))) (Some!316 (_2!2471 (tuple2!4921 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!167 (List!3799 (_ BitVec 64) V!8435) Unit!7985)

(assert (=> d!61787 (= lt!129381 (lemmaContainsTupThenGetReturnValue!167 lt!129382 (_1!2471 (tuple2!4921 key!932 v!346)) (_2!2471 (tuple2!4921 key!932 v!346))))))

(declare-fun insertStrictlySorted!170 (List!3799 (_ BitVec 64) V!8435) List!3799)

(assert (=> d!61787 (= lt!129382 (insertStrictlySorted!170 (toList!1932 lt!129238) (_1!2471 (tuple2!4921 key!932 v!346)) (_2!2471 (tuple2!4921 key!932 v!346))))))

(assert (=> d!61787 (= (+!686 lt!129238 (tuple2!4921 key!932 v!346)) lt!129380)))

(declare-fun b!257339 () Bool)

(declare-fun res!125871 () Bool)

(assert (=> b!257339 (=> (not res!125871) (not e!166811))))

(assert (=> b!257339 (= res!125871 (= (getValueByKey!311 (toList!1932 lt!129380) (_1!2471 (tuple2!4921 key!932 v!346))) (Some!316 (_2!2471 (tuple2!4921 key!932 v!346)))))))

(declare-fun b!257340 () Bool)

(declare-fun contains!1873 (List!3799 tuple2!4920) Bool)

(assert (=> b!257340 (= e!166811 (contains!1873 (toList!1932 lt!129380) (tuple2!4921 key!932 v!346)))))

(assert (= (and d!61787 res!125872) b!257339))

(assert (= (and b!257339 res!125871) b!257340))

(declare-fun m!272683 () Bool)

(assert (=> d!61787 m!272683))

(declare-fun m!272685 () Bool)

(assert (=> d!61787 m!272685))

(declare-fun m!272687 () Bool)

(assert (=> d!61787 m!272687))

(declare-fun m!272689 () Bool)

(assert (=> d!61787 m!272689))

(declare-fun m!272691 () Bool)

(assert (=> b!257339 m!272691))

(declare-fun m!272693 () Bool)

(assert (=> b!257340 m!272693))

(assert (=> b!257157 d!61787))

(declare-fun b!257349 () Bool)

(declare-fun res!125884 () Bool)

(declare-fun e!166816 () Bool)

(assert (=> b!257349 (=> (not res!125884) (not e!166816))))

(assert (=> b!257349 (= res!125884 (not (validKeyInArray!0 (select (arr!5933 (_keys!6911 thiss!1504)) index!297))))))

(declare-fun b!257352 () Bool)

(declare-fun e!166817 () Bool)

(assert (=> b!257352 (= e!166817 (= (arrayCountValidKeys!0 (array!12528 (store (arr!5933 (_keys!6911 thiss!1504)) index!297 key!932) (size!6280 (_keys!6911 thiss!1504))) #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6911 thiss!1504) #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!257351 () Bool)

(assert (=> b!257351 (= e!166816 (bvslt (size!6280 (_keys!6911 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!61789 () Bool)

(assert (=> d!61789 e!166817))

(declare-fun res!125883 () Bool)

(assert (=> d!61789 (=> (not res!125883) (not e!166817))))

(assert (=> d!61789 (= res!125883 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6280 (_keys!6911 thiss!1504)))))))

(declare-fun lt!129386 () Unit!7985)

(declare-fun choose!1 (array!12527 (_ BitVec 32) (_ BitVec 64)) Unit!7985)

(assert (=> d!61789 (= lt!129386 (choose!1 (_keys!6911 thiss!1504) index!297 key!932))))

(assert (=> d!61789 e!166816))

(declare-fun res!125882 () Bool)

(assert (=> d!61789 (=> (not res!125882) (not e!166816))))

(assert (=> d!61789 (= res!125882 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6280 (_keys!6911 thiss!1504)))))))

(assert (=> d!61789 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6911 thiss!1504) index!297 key!932) lt!129386)))

(declare-fun b!257350 () Bool)

(declare-fun res!125881 () Bool)

(assert (=> b!257350 (=> (not res!125881) (not e!166816))))

(assert (=> b!257350 (= res!125881 (validKeyInArray!0 key!932))))

(assert (= (and d!61789 res!125882) b!257349))

(assert (= (and b!257349 res!125884) b!257350))

(assert (= (and b!257350 res!125881) b!257351))

(assert (= (and d!61789 res!125883) b!257352))

(declare-fun m!272695 () Bool)

(assert (=> b!257349 m!272695))

(assert (=> b!257349 m!272695))

(declare-fun m!272697 () Bool)

(assert (=> b!257349 m!272697))

(assert (=> b!257352 m!272495))

(declare-fun m!272699 () Bool)

(assert (=> b!257352 m!272699))

(assert (=> b!257352 m!272497))

(declare-fun m!272701 () Bool)

(assert (=> d!61789 m!272701))

(declare-fun m!272703 () Bool)

(assert (=> b!257350 m!272703))

(assert (=> b!257157 d!61789))

(declare-fun d!61791 () Bool)

(declare-fun res!125885 () Bool)

(declare-fun e!166818 () Bool)

(assert (=> d!61791 (=> res!125885 e!166818)))

(assert (=> d!61791 (= res!125885 (= (select (arr!5933 lt!129237) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61791 (= (arrayContainsKey!0 lt!129237 key!932 #b00000000000000000000000000000000) e!166818)))

(declare-fun b!257353 () Bool)

(declare-fun e!166819 () Bool)

(assert (=> b!257353 (= e!166818 e!166819)))

(declare-fun res!125886 () Bool)

(assert (=> b!257353 (=> (not res!125886) (not e!166819))))

(assert (=> b!257353 (= res!125886 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6280 lt!129237)))))

(declare-fun b!257354 () Bool)

(assert (=> b!257354 (= e!166819 (arrayContainsKey!0 lt!129237 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61791 (not res!125885)) b!257353))

(assert (= (and b!257353 res!125886) b!257354))

(declare-fun m!272705 () Bool)

(assert (=> d!61791 m!272705))

(declare-fun m!272707 () Bool)

(assert (=> b!257354 m!272707))

(assert (=> b!257157 d!61791))

(declare-fun b!257363 () Bool)

(declare-fun e!166824 () (_ BitVec 32))

(assert (=> b!257363 (= e!166824 #b00000000000000000000000000000000)))

(declare-fun b!257364 () Bool)

(declare-fun e!166825 () (_ BitVec 32))

(assert (=> b!257364 (= e!166824 e!166825)))

(declare-fun c!43546 () Bool)

(assert (=> b!257364 (= c!43546 (validKeyInArray!0 (select (arr!5933 (_keys!6911 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61793 () Bool)

(declare-fun lt!129389 () (_ BitVec 32))

(assert (=> d!61793 (and (bvsge lt!129389 #b00000000000000000000000000000000) (bvsle lt!129389 (bvsub (size!6280 (_keys!6911 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61793 (= lt!129389 e!166824)))

(declare-fun c!43547 () Bool)

(assert (=> d!61793 (= c!43547 (bvsge #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))))))

(assert (=> d!61793 (and (bvsle #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6280 (_keys!6911 thiss!1504)) (size!6280 (_keys!6911 thiss!1504))))))

(assert (=> d!61793 (= (arrayCountValidKeys!0 (_keys!6911 thiss!1504) #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))) lt!129389)))

(declare-fun b!257365 () Bool)

(declare-fun call!24433 () (_ BitVec 32))

(assert (=> b!257365 (= e!166825 call!24433)))

(declare-fun b!257366 () Bool)

(assert (=> b!257366 (= e!166825 (bvadd #b00000000000000000000000000000001 call!24433))))

(declare-fun bm!24430 () Bool)

(assert (=> bm!24430 (= call!24433 (arrayCountValidKeys!0 (_keys!6911 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6280 (_keys!6911 thiss!1504))))))

(assert (= (and d!61793 c!43547) b!257363))

(assert (= (and d!61793 (not c!43547)) b!257364))

(assert (= (and b!257364 c!43546) b!257366))

(assert (= (and b!257364 (not c!43546)) b!257365))

(assert (= (or b!257366 b!257365) bm!24430))

(assert (=> b!257364 m!272615))

(assert (=> b!257364 m!272615))

(assert (=> b!257364 m!272675))

(declare-fun m!272709 () Bool)

(assert (=> bm!24430 m!272709))

(assert (=> b!257157 d!61793))

(declare-fun b!257367 () Bool)

(declare-fun e!166826 () (_ BitVec 32))

(assert (=> b!257367 (= e!166826 #b00000000000000000000000000000000)))

(declare-fun b!257368 () Bool)

(declare-fun e!166827 () (_ BitVec 32))

(assert (=> b!257368 (= e!166826 e!166827)))

(declare-fun c!43548 () Bool)

(assert (=> b!257368 (= c!43548 (validKeyInArray!0 (select (arr!5933 lt!129237) #b00000000000000000000000000000000)))))

(declare-fun d!61795 () Bool)

(declare-fun lt!129390 () (_ BitVec 32))

(assert (=> d!61795 (and (bvsge lt!129390 #b00000000000000000000000000000000) (bvsle lt!129390 (bvsub (size!6280 lt!129237) #b00000000000000000000000000000000)))))

(assert (=> d!61795 (= lt!129390 e!166826)))

(declare-fun c!43549 () Bool)

(assert (=> d!61795 (= c!43549 (bvsge #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))))))

(assert (=> d!61795 (and (bvsle #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6280 (_keys!6911 thiss!1504)) (size!6280 lt!129237)))))

(assert (=> d!61795 (= (arrayCountValidKeys!0 lt!129237 #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))) lt!129390)))

(declare-fun b!257369 () Bool)

(declare-fun call!24434 () (_ BitVec 32))

(assert (=> b!257369 (= e!166827 call!24434)))

(declare-fun b!257370 () Bool)

(assert (=> b!257370 (= e!166827 (bvadd #b00000000000000000000000000000001 call!24434))))

(declare-fun bm!24431 () Bool)

(assert (=> bm!24431 (= call!24434 (arrayCountValidKeys!0 lt!129237 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6280 (_keys!6911 thiss!1504))))))

(assert (= (and d!61795 c!43549) b!257367))

(assert (= (and d!61795 (not c!43549)) b!257368))

(assert (= (and b!257368 c!43548) b!257370))

(assert (= (and b!257368 (not c!43548)) b!257369))

(assert (= (or b!257370 b!257369) bm!24431))

(assert (=> b!257368 m!272705))

(assert (=> b!257368 m!272705))

(declare-fun m!272711 () Bool)

(assert (=> b!257368 m!272711))

(declare-fun m!272713 () Bool)

(assert (=> bm!24431 m!272713))

(assert (=> b!257157 d!61795))

(declare-fun b!257371 () Bool)

(declare-fun e!166828 () (_ BitVec 32))

(assert (=> b!257371 (= e!166828 #b00000000000000000000000000000000)))

(declare-fun b!257372 () Bool)

(declare-fun e!166829 () (_ BitVec 32))

(assert (=> b!257372 (= e!166828 e!166829)))

(declare-fun c!43550 () Bool)

(assert (=> b!257372 (= c!43550 (validKeyInArray!0 (select (arr!5933 lt!129237) index!297)))))

(declare-fun d!61797 () Bool)

(declare-fun lt!129391 () (_ BitVec 32))

(assert (=> d!61797 (and (bvsge lt!129391 #b00000000000000000000000000000000) (bvsle lt!129391 (bvsub (size!6280 lt!129237) index!297)))))

(assert (=> d!61797 (= lt!129391 e!166828)))

(declare-fun c!43551 () Bool)

(assert (=> d!61797 (= c!43551 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!61797 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6280 lt!129237)))))

(assert (=> d!61797 (= (arrayCountValidKeys!0 lt!129237 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!129391)))

(declare-fun b!257373 () Bool)

(declare-fun call!24435 () (_ BitVec 32))

(assert (=> b!257373 (= e!166829 call!24435)))

(declare-fun b!257374 () Bool)

(assert (=> b!257374 (= e!166829 (bvadd #b00000000000000000000000000000001 call!24435))))

(declare-fun bm!24432 () Bool)

(assert (=> bm!24432 (= call!24435 (arrayCountValidKeys!0 lt!129237 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (= (and d!61797 c!43551) b!257371))

(assert (= (and d!61797 (not c!43551)) b!257372))

(assert (= (and b!257372 c!43550) b!257374))

(assert (= (and b!257372 (not c!43550)) b!257373))

(assert (= (or b!257374 b!257373) bm!24432))

(declare-fun m!272715 () Bool)

(assert (=> b!257372 m!272715))

(assert (=> b!257372 m!272715))

(declare-fun m!272717 () Bool)

(assert (=> b!257372 m!272717))

(declare-fun m!272719 () Bool)

(assert (=> bm!24432 m!272719))

(assert (=> b!257157 d!61797))

(declare-fun d!61799 () Bool)

(assert (=> d!61799 (arrayContainsKey!0 lt!129237 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129394 () Unit!7985)

(declare-fun choose!13 (array!12527 (_ BitVec 64) (_ BitVec 32)) Unit!7985)

(assert (=> d!61799 (= lt!129394 (choose!13 lt!129237 key!932 index!297))))

(assert (=> d!61799 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!61799 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129237 key!932 index!297) lt!129394)))

(declare-fun bs!9081 () Bool)

(assert (= bs!9081 d!61799))

(assert (=> bs!9081 m!272481))

(declare-fun m!272721 () Bool)

(assert (=> bs!9081 m!272721))

(assert (=> b!257157 d!61799))

(declare-fun b!257383 () Bool)

(declare-fun e!166837 () Bool)

(declare-fun call!24438 () Bool)

(assert (=> b!257383 (= e!166837 call!24438)))

(declare-fun b!257384 () Bool)

(declare-fun e!166836 () Bool)

(assert (=> b!257384 (= e!166836 call!24438)))

(declare-fun d!61801 () Bool)

(declare-fun res!125891 () Bool)

(declare-fun e!166838 () Bool)

(assert (=> d!61801 (=> res!125891 e!166838)))

(assert (=> d!61801 (= res!125891 (bvsge #b00000000000000000000000000000000 (size!6280 lt!129237)))))

(assert (=> d!61801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129237 (mask!11029 thiss!1504)) e!166838)))

(declare-fun b!257385 () Bool)

(assert (=> b!257385 (= e!166836 e!166837)))

(declare-fun lt!129403 () (_ BitVec 64))

(assert (=> b!257385 (= lt!129403 (select (arr!5933 lt!129237) #b00000000000000000000000000000000))))

(declare-fun lt!129402 () Unit!7985)

(assert (=> b!257385 (= lt!129402 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129237 lt!129403 #b00000000000000000000000000000000))))

(assert (=> b!257385 (arrayContainsKey!0 lt!129237 lt!129403 #b00000000000000000000000000000000)))

(declare-fun lt!129401 () Unit!7985)

(assert (=> b!257385 (= lt!129401 lt!129402)))

(declare-fun res!125892 () Bool)

(assert (=> b!257385 (= res!125892 (= (seekEntryOrOpen!0 (select (arr!5933 lt!129237) #b00000000000000000000000000000000) lt!129237 (mask!11029 thiss!1504)) (Found!1168 #b00000000000000000000000000000000)))))

(assert (=> b!257385 (=> (not res!125892) (not e!166837))))

(declare-fun b!257386 () Bool)

(assert (=> b!257386 (= e!166838 e!166836)))

(declare-fun c!43554 () Bool)

(assert (=> b!257386 (= c!43554 (validKeyInArray!0 (select (arr!5933 lt!129237) #b00000000000000000000000000000000)))))

(declare-fun bm!24435 () Bool)

(assert (=> bm!24435 (= call!24438 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!129237 (mask!11029 thiss!1504)))))

(assert (= (and d!61801 (not res!125891)) b!257386))

(assert (= (and b!257386 c!43554) b!257385))

(assert (= (and b!257386 (not c!43554)) b!257384))

(assert (= (and b!257385 res!125892) b!257383))

(assert (= (or b!257383 b!257384) bm!24435))

(assert (=> b!257385 m!272705))

(declare-fun m!272723 () Bool)

(assert (=> b!257385 m!272723))

(declare-fun m!272725 () Bool)

(assert (=> b!257385 m!272725))

(assert (=> b!257385 m!272705))

(declare-fun m!272727 () Bool)

(assert (=> b!257385 m!272727))

(assert (=> b!257386 m!272705))

(assert (=> b!257386 m!272705))

(assert (=> b!257386 m!272711))

(declare-fun m!272729 () Bool)

(assert (=> bm!24435 m!272729))

(assert (=> b!257157 d!61801))

(declare-fun b!257387 () Bool)

(declare-fun e!166840 () Bool)

(assert (=> b!257387 (= e!166840 (validKeyInArray!0 (select (arr!5933 lt!129237) #b00000000000000000000000000000000)))))

(declare-fun b!257389 () Bool)

(declare-fun e!166846 () Bool)

(declare-fun e!166847 () Bool)

(assert (=> b!257389 (= e!166846 e!166847)))

(declare-fun c!43557 () Bool)

(assert (=> b!257389 (= c!43557 (not (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!24439 () ListLongMap!3833)

(declare-fun call!24444 () ListLongMap!3833)

(declare-fun call!24445 () ListLongMap!3833)

(declare-fun bm!24436 () Bool)

(declare-fun c!43556 () Bool)

(declare-fun c!43555 () Bool)

(declare-fun call!24442 () ListLongMap!3833)

(assert (=> bm!24436 (= call!24439 (+!686 (ite c!43555 call!24442 (ite c!43556 call!24445 call!24444)) (ite (or c!43555 c!43556) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4586 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4586 thiss!1504)))))))

(declare-fun b!257390 () Bool)

(declare-fun e!166848 () Bool)

(declare-fun e!166850 () Bool)

(assert (=> b!257390 (= e!166848 e!166850)))

(declare-fun res!125893 () Bool)

(assert (=> b!257390 (=> (not res!125893) (not e!166850))))

(declare-fun lt!129424 () ListLongMap!3833)

(assert (=> b!257390 (= res!125893 (contains!1871 lt!129424 (select (arr!5933 lt!129237) #b00000000000000000000000000000000)))))

(assert (=> b!257390 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6280 lt!129237)))))

(declare-fun bm!24437 () Bool)

(declare-fun call!24440 () ListLongMap!3833)

(assert (=> bm!24437 (= call!24440 call!24439)))

(declare-fun b!257391 () Bool)

(assert (=> b!257391 (= e!166850 (= (apply!253 lt!129424 (select (arr!5933 lt!129237) #b00000000000000000000000000000000)) (get!3050 (select (arr!5932 (array!12526 (store (arr!5932 (_values!4728 thiss!1504)) index!297 (ValueCellFull!2952 v!346)) (size!6279 (_values!4728 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4745 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257391 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6279 (array!12526 (store (arr!5932 (_values!4728 thiss!1504)) index!297 (ValueCellFull!2952 v!346)) (size!6279 (_values!4728 thiss!1504))))))))

(assert (=> b!257391 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6280 lt!129237)))))

(declare-fun b!257392 () Bool)

(declare-fun e!166841 () Bool)

(assert (=> b!257392 (= e!166847 e!166841)))

(declare-fun res!125895 () Bool)

(declare-fun call!24443 () Bool)

(assert (=> b!257392 (= res!125895 call!24443)))

(assert (=> b!257392 (=> (not res!125895) (not e!166841))))

(declare-fun bm!24438 () Bool)

(assert (=> bm!24438 (= call!24444 call!24445)))

(declare-fun bm!24439 () Bool)

(declare-fun call!24441 () Bool)

(assert (=> bm!24439 (= call!24441 (contains!1871 lt!129424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257393 () Bool)

(declare-fun e!166843 () Bool)

(assert (=> b!257393 (= e!166843 (not call!24441))))

(declare-fun b!257394 () Bool)

(declare-fun e!166839 () ListLongMap!3833)

(assert (=> b!257394 (= e!166839 call!24440)))

(declare-fun b!257395 () Bool)

(declare-fun e!166844 () Bool)

(assert (=> b!257395 (= e!166843 e!166844)))

(declare-fun res!125898 () Bool)

(assert (=> b!257395 (= res!125898 call!24441)))

(assert (=> b!257395 (=> (not res!125898) (not e!166844))))

(declare-fun b!257396 () Bool)

(declare-fun e!166849 () ListLongMap!3833)

(declare-fun e!166851 () ListLongMap!3833)

(assert (=> b!257396 (= e!166849 e!166851)))

(assert (=> b!257396 (= c!43556 (and (not (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!61803 () Bool)

(assert (=> d!61803 e!166846))

(declare-fun res!125899 () Bool)

(assert (=> d!61803 (=> (not res!125899) (not e!166846))))

(assert (=> d!61803 (= res!125899 (or (bvsge #b00000000000000000000000000000000 (size!6280 lt!129237)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6280 lt!129237)))))))

(declare-fun lt!129408 () ListLongMap!3833)

(assert (=> d!61803 (= lt!129424 lt!129408)))

(declare-fun lt!129419 () Unit!7985)

(declare-fun e!166842 () Unit!7985)

(assert (=> d!61803 (= lt!129419 e!166842)))

(declare-fun c!43560 () Bool)

(assert (=> d!61803 (= c!43560 e!166840)))

(declare-fun res!125897 () Bool)

(assert (=> d!61803 (=> (not res!125897) (not e!166840))))

(assert (=> d!61803 (= res!125897 (bvslt #b00000000000000000000000000000000 (size!6280 lt!129237)))))

(assert (=> d!61803 (= lt!129408 e!166849)))

(assert (=> d!61803 (= c!43555 (and (not (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61803 (validMask!0 (mask!11029 thiss!1504))))

(assert (=> d!61803 (= (getCurrentListMap!1460 lt!129237 (array!12526 (store (arr!5932 (_values!4728 thiss!1504)) index!297 (ValueCellFull!2952 v!346)) (size!6279 (_values!4728 thiss!1504))) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)) lt!129424)))

(declare-fun b!257388 () Bool)

(declare-fun e!166845 () Bool)

(assert (=> b!257388 (= e!166845 (validKeyInArray!0 (select (arr!5933 lt!129237) #b00000000000000000000000000000000)))))

(declare-fun b!257397 () Bool)

(declare-fun Unit!7997 () Unit!7985)

(assert (=> b!257397 (= e!166842 Unit!7997)))

(declare-fun b!257398 () Bool)

(assert (=> b!257398 (= e!166841 (= (apply!253 lt!129424 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4586 thiss!1504)))))

(declare-fun b!257399 () Bool)

(declare-fun res!125894 () Bool)

(assert (=> b!257399 (=> (not res!125894) (not e!166846))))

(assert (=> b!257399 (= res!125894 e!166843)))

(declare-fun c!43558 () Bool)

(assert (=> b!257399 (= c!43558 (not (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24440 () Bool)

(assert (=> bm!24440 (= call!24442 (getCurrentListMapNoExtraKeys!575 lt!129237 (array!12526 (store (arr!5932 (_values!4728 thiss!1504)) index!297 (ValueCellFull!2952 v!346)) (size!6279 (_values!4728 thiss!1504))) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun bm!24441 () Bool)

(assert (=> bm!24441 (= call!24443 (contains!1871 lt!129424 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257400 () Bool)

(assert (=> b!257400 (= e!166844 (= (apply!253 lt!129424 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4586 thiss!1504)))))

(declare-fun b!257401 () Bool)

(assert (=> b!257401 (= e!166849 (+!686 call!24439 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4586 thiss!1504))))))

(declare-fun b!257402 () Bool)

(assert (=> b!257402 (= e!166839 call!24444)))

(declare-fun bm!24442 () Bool)

(assert (=> bm!24442 (= call!24445 call!24442)))

(declare-fun b!257403 () Bool)

(assert (=> b!257403 (= e!166847 (not call!24443))))

(declare-fun b!257404 () Bool)

(assert (=> b!257404 (= e!166851 call!24440)))

(declare-fun b!257405 () Bool)

(declare-fun c!43559 () Bool)

(assert (=> b!257405 (= c!43559 (and (not (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4482 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!257405 (= e!166851 e!166839)))

(declare-fun b!257406 () Bool)

(declare-fun res!125901 () Bool)

(assert (=> b!257406 (=> (not res!125901) (not e!166846))))

(assert (=> b!257406 (= res!125901 e!166848)))

(declare-fun res!125900 () Bool)

(assert (=> b!257406 (=> res!125900 e!166848)))

(assert (=> b!257406 (= res!125900 (not e!166845))))

(declare-fun res!125896 () Bool)

(assert (=> b!257406 (=> (not res!125896) (not e!166845))))

(assert (=> b!257406 (= res!125896 (bvslt #b00000000000000000000000000000000 (size!6280 lt!129237)))))

(declare-fun b!257407 () Bool)

(declare-fun lt!129411 () Unit!7985)

(assert (=> b!257407 (= e!166842 lt!129411)))

(declare-fun lt!129406 () ListLongMap!3833)

(assert (=> b!257407 (= lt!129406 (getCurrentListMapNoExtraKeys!575 lt!129237 (array!12526 (store (arr!5932 (_values!4728 thiss!1504)) index!297 (ValueCellFull!2952 v!346)) (size!6279 (_values!4728 thiss!1504))) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun lt!129416 () (_ BitVec 64))

(assert (=> b!257407 (= lt!129416 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129409 () (_ BitVec 64))

(assert (=> b!257407 (= lt!129409 (select (arr!5933 lt!129237) #b00000000000000000000000000000000))))

(declare-fun lt!129404 () Unit!7985)

(assert (=> b!257407 (= lt!129404 (addStillContains!229 lt!129406 lt!129416 (zeroValue!4586 thiss!1504) lt!129409))))

(assert (=> b!257407 (contains!1871 (+!686 lt!129406 (tuple2!4921 lt!129416 (zeroValue!4586 thiss!1504))) lt!129409)))

(declare-fun lt!129423 () Unit!7985)

(assert (=> b!257407 (= lt!129423 lt!129404)))

(declare-fun lt!129414 () ListLongMap!3833)

(assert (=> b!257407 (= lt!129414 (getCurrentListMapNoExtraKeys!575 lt!129237 (array!12526 (store (arr!5932 (_values!4728 thiss!1504)) index!297 (ValueCellFull!2952 v!346)) (size!6279 (_values!4728 thiss!1504))) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun lt!129415 () (_ BitVec 64))

(assert (=> b!257407 (= lt!129415 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129417 () (_ BitVec 64))

(assert (=> b!257407 (= lt!129417 (select (arr!5933 lt!129237) #b00000000000000000000000000000000))))

(declare-fun lt!129413 () Unit!7985)

(assert (=> b!257407 (= lt!129413 (addApplyDifferent!229 lt!129414 lt!129415 (minValue!4586 thiss!1504) lt!129417))))

(assert (=> b!257407 (= (apply!253 (+!686 lt!129414 (tuple2!4921 lt!129415 (minValue!4586 thiss!1504))) lt!129417) (apply!253 lt!129414 lt!129417))))

(declare-fun lt!129425 () Unit!7985)

(assert (=> b!257407 (= lt!129425 lt!129413)))

(declare-fun lt!129412 () ListLongMap!3833)

(assert (=> b!257407 (= lt!129412 (getCurrentListMapNoExtraKeys!575 lt!129237 (array!12526 (store (arr!5932 (_values!4728 thiss!1504)) index!297 (ValueCellFull!2952 v!346)) (size!6279 (_values!4728 thiss!1504))) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun lt!129410 () (_ BitVec 64))

(assert (=> b!257407 (= lt!129410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129405 () (_ BitVec 64))

(assert (=> b!257407 (= lt!129405 (select (arr!5933 lt!129237) #b00000000000000000000000000000000))))

(declare-fun lt!129421 () Unit!7985)

(assert (=> b!257407 (= lt!129421 (addApplyDifferent!229 lt!129412 lt!129410 (zeroValue!4586 thiss!1504) lt!129405))))

(assert (=> b!257407 (= (apply!253 (+!686 lt!129412 (tuple2!4921 lt!129410 (zeroValue!4586 thiss!1504))) lt!129405) (apply!253 lt!129412 lt!129405))))

(declare-fun lt!129420 () Unit!7985)

(assert (=> b!257407 (= lt!129420 lt!129421)))

(declare-fun lt!129407 () ListLongMap!3833)

(assert (=> b!257407 (= lt!129407 (getCurrentListMapNoExtraKeys!575 lt!129237 (array!12526 (store (arr!5932 (_values!4728 thiss!1504)) index!297 (ValueCellFull!2952 v!346)) (size!6279 (_values!4728 thiss!1504))) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)))))

(declare-fun lt!129422 () (_ BitVec 64))

(assert (=> b!257407 (= lt!129422 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129418 () (_ BitVec 64))

(assert (=> b!257407 (= lt!129418 (select (arr!5933 lt!129237) #b00000000000000000000000000000000))))

(assert (=> b!257407 (= lt!129411 (addApplyDifferent!229 lt!129407 lt!129422 (minValue!4586 thiss!1504) lt!129418))))

(assert (=> b!257407 (= (apply!253 (+!686 lt!129407 (tuple2!4921 lt!129422 (minValue!4586 thiss!1504))) lt!129418) (apply!253 lt!129407 lt!129418))))

(assert (= (and d!61803 c!43555) b!257401))

(assert (= (and d!61803 (not c!43555)) b!257396))

(assert (= (and b!257396 c!43556) b!257404))

(assert (= (and b!257396 (not c!43556)) b!257405))

(assert (= (and b!257405 c!43559) b!257394))

(assert (= (and b!257405 (not c!43559)) b!257402))

(assert (= (or b!257394 b!257402) bm!24438))

(assert (= (or b!257404 bm!24438) bm!24442))

(assert (= (or b!257404 b!257394) bm!24437))

(assert (= (or b!257401 bm!24442) bm!24440))

(assert (= (or b!257401 bm!24437) bm!24436))

(assert (= (and d!61803 res!125897) b!257387))

(assert (= (and d!61803 c!43560) b!257407))

(assert (= (and d!61803 (not c!43560)) b!257397))

(assert (= (and d!61803 res!125899) b!257406))

(assert (= (and b!257406 res!125896) b!257388))

(assert (= (and b!257406 (not res!125900)) b!257390))

(assert (= (and b!257390 res!125893) b!257391))

(assert (= (and b!257406 res!125901) b!257399))

(assert (= (and b!257399 c!43558) b!257395))

(assert (= (and b!257399 (not c!43558)) b!257393))

(assert (= (and b!257395 res!125898) b!257400))

(assert (= (or b!257395 b!257393) bm!24439))

(assert (= (and b!257399 res!125894) b!257389))

(assert (= (and b!257389 c!43557) b!257392))

(assert (= (and b!257389 (not c!43557)) b!257403))

(assert (= (and b!257392 res!125895) b!257398))

(assert (= (or b!257392 b!257403) bm!24441))

(declare-fun b_lambda!8181 () Bool)

(assert (=> (not b_lambda!8181) (not b!257391)))

(assert (=> b!257391 t!8863))

(declare-fun b_and!13801 () Bool)

(assert (= b_and!13799 (and (=> t!8863 result!5379) b_and!13801)))

(declare-fun m!272731 () Bool)

(assert (=> b!257407 m!272731))

(declare-fun m!272733 () Bool)

(assert (=> b!257407 m!272733))

(declare-fun m!272735 () Bool)

(assert (=> b!257407 m!272735))

(declare-fun m!272737 () Bool)

(assert (=> b!257407 m!272737))

(assert (=> b!257407 m!272705))

(declare-fun m!272739 () Bool)

(assert (=> b!257407 m!272739))

(declare-fun m!272741 () Bool)

(assert (=> b!257407 m!272741))

(declare-fun m!272743 () Bool)

(assert (=> b!257407 m!272743))

(declare-fun m!272745 () Bool)

(assert (=> b!257407 m!272745))

(declare-fun m!272747 () Bool)

(assert (=> b!257407 m!272747))

(declare-fun m!272749 () Bool)

(assert (=> b!257407 m!272749))

(declare-fun m!272751 () Bool)

(assert (=> b!257407 m!272751))

(assert (=> b!257407 m!272739))

(assert (=> b!257407 m!272735))

(declare-fun m!272753 () Bool)

(assert (=> b!257407 m!272753))

(assert (=> b!257407 m!272749))

(declare-fun m!272755 () Bool)

(assert (=> b!257407 m!272755))

(declare-fun m!272757 () Bool)

(assert (=> b!257407 m!272757))

(declare-fun m!272759 () Bool)

(assert (=> b!257407 m!272759))

(assert (=> b!257407 m!272733))

(declare-fun m!272761 () Bool)

(assert (=> b!257407 m!272761))

(assert (=> b!257390 m!272705))

(assert (=> b!257390 m!272705))

(declare-fun m!272763 () Bool)

(assert (=> b!257390 m!272763))

(assert (=> bm!24440 m!272737))

(assert (=> b!257391 m!272661))

(declare-fun m!272765 () Bool)

(assert (=> b!257391 m!272765))

(assert (=> b!257391 m!272661))

(declare-fun m!272767 () Bool)

(assert (=> b!257391 m!272767))

(assert (=> b!257391 m!272705))

(declare-fun m!272769 () Bool)

(assert (=> b!257391 m!272769))

(assert (=> b!257391 m!272765))

(assert (=> b!257391 m!272705))

(declare-fun m!272771 () Bool)

(assert (=> b!257400 m!272771))

(assert (=> d!61803 m!272605))

(declare-fun m!272773 () Bool)

(assert (=> b!257401 m!272773))

(declare-fun m!272775 () Bool)

(assert (=> bm!24439 m!272775))

(assert (=> b!257387 m!272705))

(assert (=> b!257387 m!272705))

(assert (=> b!257387 m!272711))

(declare-fun m!272777 () Bool)

(assert (=> bm!24436 m!272777))

(declare-fun m!272779 () Bool)

(assert (=> b!257398 m!272779))

(declare-fun m!272781 () Bool)

(assert (=> bm!24441 m!272781))

(assert (=> b!257388 m!272705))

(assert (=> b!257388 m!272705))

(assert (=> b!257388 m!272711))

(assert (=> b!257157 d!61803))

(declare-fun b!257418 () Bool)

(declare-fun e!166861 () Bool)

(declare-fun call!24448 () Bool)

(assert (=> b!257418 (= e!166861 call!24448)))

(declare-fun bm!24445 () Bool)

(declare-fun c!43563 () Bool)

(assert (=> bm!24445 (= call!24448 (arrayNoDuplicates!0 lt!129237 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43563 (Cons!3796 (select (arr!5933 lt!129237) #b00000000000000000000000000000000) Nil!3797) Nil!3797)))))

(declare-fun b!257419 () Bool)

(declare-fun e!166860 () Bool)

(declare-fun contains!1874 (List!3800 (_ BitVec 64)) Bool)

(assert (=> b!257419 (= e!166860 (contains!1874 Nil!3797 (select (arr!5933 lt!129237) #b00000000000000000000000000000000)))))

(declare-fun b!257420 () Bool)

(assert (=> b!257420 (= e!166861 call!24448)))

(declare-fun b!257421 () Bool)

(declare-fun e!166863 () Bool)

(declare-fun e!166862 () Bool)

(assert (=> b!257421 (= e!166863 e!166862)))

(declare-fun res!125909 () Bool)

(assert (=> b!257421 (=> (not res!125909) (not e!166862))))

(assert (=> b!257421 (= res!125909 (not e!166860))))

(declare-fun res!125910 () Bool)

(assert (=> b!257421 (=> (not res!125910) (not e!166860))))

(assert (=> b!257421 (= res!125910 (validKeyInArray!0 (select (arr!5933 lt!129237) #b00000000000000000000000000000000)))))

(declare-fun b!257422 () Bool)

(assert (=> b!257422 (= e!166862 e!166861)))

(assert (=> b!257422 (= c!43563 (validKeyInArray!0 (select (arr!5933 lt!129237) #b00000000000000000000000000000000)))))

(declare-fun d!61805 () Bool)

(declare-fun res!125908 () Bool)

(assert (=> d!61805 (=> res!125908 e!166863)))

(assert (=> d!61805 (= res!125908 (bvsge #b00000000000000000000000000000000 (size!6280 lt!129237)))))

(assert (=> d!61805 (= (arrayNoDuplicates!0 lt!129237 #b00000000000000000000000000000000 Nil!3797) e!166863)))

(assert (= (and d!61805 (not res!125908)) b!257421))

(assert (= (and b!257421 res!125910) b!257419))

(assert (= (and b!257421 res!125909) b!257422))

(assert (= (and b!257422 c!43563) b!257420))

(assert (= (and b!257422 (not c!43563)) b!257418))

(assert (= (or b!257420 b!257418) bm!24445))

(assert (=> bm!24445 m!272705))

(declare-fun m!272783 () Bool)

(assert (=> bm!24445 m!272783))

(assert (=> b!257419 m!272705))

(assert (=> b!257419 m!272705))

(declare-fun m!272785 () Bool)

(assert (=> b!257419 m!272785))

(assert (=> b!257421 m!272705))

(assert (=> b!257421 m!272705))

(assert (=> b!257421 m!272711))

(assert (=> b!257422 m!272705))

(assert (=> b!257422 m!272705))

(assert (=> b!257422 m!272711))

(assert (=> b!257157 d!61805))

(declare-fun d!61807 () Bool)

(declare-fun e!166866 () Bool)

(assert (=> d!61807 e!166866))

(declare-fun res!125913 () Bool)

(assert (=> d!61807 (=> (not res!125913) (not e!166866))))

(assert (=> d!61807 (= res!125913 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6280 (_keys!6911 thiss!1504)))))))

(declare-fun lt!129428 () Unit!7985)

(declare-fun choose!41 (array!12527 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3800) Unit!7985)

(assert (=> d!61807 (= lt!129428 (choose!41 (_keys!6911 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3797))))

(assert (=> d!61807 (bvslt (size!6280 (_keys!6911 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61807 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6911 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3797) lt!129428)))

(declare-fun b!257425 () Bool)

(assert (=> b!257425 (= e!166866 (arrayNoDuplicates!0 (array!12528 (store (arr!5933 (_keys!6911 thiss!1504)) index!297 key!932) (size!6280 (_keys!6911 thiss!1504))) #b00000000000000000000000000000000 Nil!3797))))

(assert (= (and d!61807 res!125913) b!257425))

(declare-fun m!272787 () Bool)

(assert (=> d!61807 m!272787))

(assert (=> b!257425 m!272495))

(declare-fun m!272789 () Bool)

(assert (=> b!257425 m!272789))

(assert (=> b!257157 d!61807))

(assert (=> b!257157 d!61779))

(declare-fun d!61809 () Bool)

(declare-fun e!166869 () Bool)

(assert (=> d!61809 e!166869))

(declare-fun res!125916 () Bool)

(assert (=> d!61809 (=> (not res!125916) (not e!166869))))

(assert (=> d!61809 (= res!125916 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6280 (_keys!6911 thiss!1504)))))))

(declare-fun lt!129431 () Unit!7985)

(declare-fun choose!102 ((_ BitVec 64) array!12527 (_ BitVec 32) (_ BitVec 32)) Unit!7985)

(assert (=> d!61809 (= lt!129431 (choose!102 key!932 (_keys!6911 thiss!1504) index!297 (mask!11029 thiss!1504)))))

(assert (=> d!61809 (validMask!0 (mask!11029 thiss!1504))))

(assert (=> d!61809 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6911 thiss!1504) index!297 (mask!11029 thiss!1504)) lt!129431)))

(declare-fun b!257428 () Bool)

(assert (=> b!257428 (= e!166869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12528 (store (arr!5933 (_keys!6911 thiss!1504)) index!297 key!932) (size!6280 (_keys!6911 thiss!1504))) (mask!11029 thiss!1504)))))

(assert (= (and d!61809 res!125916) b!257428))

(declare-fun m!272791 () Bool)

(assert (=> d!61809 m!272791))

(assert (=> d!61809 m!272605))

(assert (=> b!257428 m!272495))

(declare-fun m!272793 () Bool)

(assert (=> b!257428 m!272793))

(assert (=> b!257157 d!61809))

(declare-fun d!61811 () Bool)

(declare-fun e!166872 () Bool)

(assert (=> d!61811 e!166872))

(declare-fun res!125919 () Bool)

(assert (=> d!61811 (=> (not res!125919) (not e!166872))))

(assert (=> d!61811 (= res!125919 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6280 (_keys!6911 thiss!1504))) (bvslt index!297 (size!6279 (_values!4728 thiss!1504)))))))

(declare-fun lt!129434 () Unit!7985)

(declare-fun choose!1238 (array!12527 array!12525 (_ BitVec 32) (_ BitVec 32) V!8435 V!8435 (_ BitVec 32) (_ BitVec 64) V!8435 Int) Unit!7985)

(assert (=> d!61811 (= lt!129434 (choose!1238 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) index!297 key!932 v!346 (defaultEntry!4745 thiss!1504)))))

(assert (=> d!61811 (validMask!0 (mask!11029 thiss!1504))))

(assert (=> d!61811 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!96 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) index!297 key!932 v!346 (defaultEntry!4745 thiss!1504)) lt!129434)))

(declare-fun b!257431 () Bool)

(assert (=> b!257431 (= e!166872 (= (+!686 (getCurrentListMap!1460 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504)) (tuple2!4921 key!932 v!346)) (getCurrentListMap!1460 (array!12528 (store (arr!5933 (_keys!6911 thiss!1504)) index!297 key!932) (size!6280 (_keys!6911 thiss!1504))) (array!12526 (store (arr!5932 (_values!4728 thiss!1504)) index!297 (ValueCellFull!2952 v!346)) (size!6279 (_values!4728 thiss!1504))) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4745 thiss!1504))))))

(assert (= (and d!61811 res!125919) b!257431))

(declare-fun m!272795 () Bool)

(assert (=> d!61811 m!272795))

(assert (=> d!61811 m!272605))

(assert (=> b!257431 m!272503))

(assert (=> b!257431 m!272519))

(assert (=> b!257431 m!272495))

(declare-fun m!272797 () Bool)

(assert (=> b!257431 m!272797))

(assert (=> b!257431 m!272519))

(declare-fun m!272799 () Bool)

(assert (=> b!257431 m!272799))

(assert (=> b!257157 d!61811))

(declare-fun d!61813 () Bool)

(assert (=> d!61813 (= (arrayCountValidKeys!0 lt!129237 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!129437 () Unit!7985)

(declare-fun choose!2 (array!12527 (_ BitVec 32)) Unit!7985)

(assert (=> d!61813 (= lt!129437 (choose!2 lt!129237 index!297))))

(declare-fun e!166875 () Bool)

(assert (=> d!61813 e!166875))

(declare-fun res!125924 () Bool)

(assert (=> d!61813 (=> (not res!125924) (not e!166875))))

(assert (=> d!61813 (= res!125924 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6280 lt!129237))))))

(assert (=> d!61813 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129237 index!297) lt!129437)))

(declare-fun b!257436 () Bool)

(declare-fun res!125925 () Bool)

(assert (=> b!257436 (=> (not res!125925) (not e!166875))))

(assert (=> b!257436 (= res!125925 (validKeyInArray!0 (select (arr!5933 lt!129237) index!297)))))

(declare-fun b!257437 () Bool)

(assert (=> b!257437 (= e!166875 (bvslt (size!6280 lt!129237) #b01111111111111111111111111111111))))

(assert (= (and d!61813 res!125924) b!257436))

(assert (= (and b!257436 res!125925) b!257437))

(declare-fun m!272801 () Bool)

(assert (=> d!61813 m!272801))

(declare-fun m!272803 () Bool)

(assert (=> d!61813 m!272803))

(assert (=> b!257436 m!272715))

(assert (=> b!257436 m!272715))

(assert (=> b!257436 m!272717))

(assert (=> b!257157 d!61813))

(declare-fun d!61815 () Bool)

(declare-fun res!125932 () Bool)

(declare-fun e!166878 () Bool)

(assert (=> d!61815 (=> (not res!125932) (not e!166878))))

(declare-fun simpleValid!276 (LongMapFixedSize!3804) Bool)

(assert (=> d!61815 (= res!125932 (simpleValid!276 thiss!1504))))

(assert (=> d!61815 (= (valid!1487 thiss!1504) e!166878)))

(declare-fun b!257444 () Bool)

(declare-fun res!125933 () Bool)

(assert (=> b!257444 (=> (not res!125933) (not e!166878))))

(assert (=> b!257444 (= res!125933 (= (arrayCountValidKeys!0 (_keys!6911 thiss!1504) #b00000000000000000000000000000000 (size!6280 (_keys!6911 thiss!1504))) (_size!1951 thiss!1504)))))

(declare-fun b!257445 () Bool)

(declare-fun res!125934 () Bool)

(assert (=> b!257445 (=> (not res!125934) (not e!166878))))

(assert (=> b!257445 (= res!125934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6911 thiss!1504) (mask!11029 thiss!1504)))))

(declare-fun b!257446 () Bool)

(assert (=> b!257446 (= e!166878 (arrayNoDuplicates!0 (_keys!6911 thiss!1504) #b00000000000000000000000000000000 Nil!3797))))

(assert (= (and d!61815 res!125932) b!257444))

(assert (= (and b!257444 res!125933) b!257445))

(assert (= (and b!257445 res!125934) b!257446))

(declare-fun m!272805 () Bool)

(assert (=> d!61815 m!272805))

(assert (=> b!257444 m!272497))

(declare-fun m!272807 () Bool)

(assert (=> b!257445 m!272807))

(declare-fun m!272809 () Bool)

(assert (=> b!257446 m!272809))

(assert (=> start!24560 d!61815))

(declare-fun b!257459 () Bool)

(declare-fun e!166887 () SeekEntryResult!1168)

(declare-fun e!166886 () SeekEntryResult!1168)

(assert (=> b!257459 (= e!166887 e!166886)))

(declare-fun lt!129445 () (_ BitVec 64))

(declare-fun lt!129446 () SeekEntryResult!1168)

(assert (=> b!257459 (= lt!129445 (select (arr!5933 (_keys!6911 thiss!1504)) (index!6844 lt!129446)))))

(declare-fun c!43572 () Bool)

(assert (=> b!257459 (= c!43572 (= lt!129445 key!932))))

(declare-fun d!61817 () Bool)

(declare-fun lt!129444 () SeekEntryResult!1168)

(assert (=> d!61817 (and (or ((_ is Undefined!1168) lt!129444) (not ((_ is Found!1168) lt!129444)) (and (bvsge (index!6843 lt!129444) #b00000000000000000000000000000000) (bvslt (index!6843 lt!129444) (size!6280 (_keys!6911 thiss!1504))))) (or ((_ is Undefined!1168) lt!129444) ((_ is Found!1168) lt!129444) (not ((_ is MissingZero!1168) lt!129444)) (and (bvsge (index!6842 lt!129444) #b00000000000000000000000000000000) (bvslt (index!6842 lt!129444) (size!6280 (_keys!6911 thiss!1504))))) (or ((_ is Undefined!1168) lt!129444) ((_ is Found!1168) lt!129444) ((_ is MissingZero!1168) lt!129444) (not ((_ is MissingVacant!1168) lt!129444)) (and (bvsge (index!6845 lt!129444) #b00000000000000000000000000000000) (bvslt (index!6845 lt!129444) (size!6280 (_keys!6911 thiss!1504))))) (or ((_ is Undefined!1168) lt!129444) (ite ((_ is Found!1168) lt!129444) (= (select (arr!5933 (_keys!6911 thiss!1504)) (index!6843 lt!129444)) key!932) (ite ((_ is MissingZero!1168) lt!129444) (= (select (arr!5933 (_keys!6911 thiss!1504)) (index!6842 lt!129444)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1168) lt!129444) (= (select (arr!5933 (_keys!6911 thiss!1504)) (index!6845 lt!129444)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61817 (= lt!129444 e!166887)))

(declare-fun c!43571 () Bool)

(assert (=> d!61817 (= c!43571 (and ((_ is Intermediate!1168) lt!129446) (undefined!1980 lt!129446)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12527 (_ BitVec 32)) SeekEntryResult!1168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61817 (= lt!129446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11029 thiss!1504)) key!932 (_keys!6911 thiss!1504) (mask!11029 thiss!1504)))))

(assert (=> d!61817 (validMask!0 (mask!11029 thiss!1504))))

(assert (=> d!61817 (= (seekEntryOrOpen!0 key!932 (_keys!6911 thiss!1504) (mask!11029 thiss!1504)) lt!129444)))

(declare-fun b!257460 () Bool)

(declare-fun e!166885 () SeekEntryResult!1168)

(assert (=> b!257460 (= e!166885 (MissingZero!1168 (index!6844 lt!129446)))))

(declare-fun b!257461 () Bool)

(assert (=> b!257461 (= e!166886 (Found!1168 (index!6844 lt!129446)))))

(declare-fun b!257462 () Bool)

(assert (=> b!257462 (= e!166887 Undefined!1168)))

(declare-fun b!257463 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12527 (_ BitVec 32)) SeekEntryResult!1168)

(assert (=> b!257463 (= e!166885 (seekKeyOrZeroReturnVacant!0 (x!25000 lt!129446) (index!6844 lt!129446) (index!6844 lt!129446) key!932 (_keys!6911 thiss!1504) (mask!11029 thiss!1504)))))

(declare-fun b!257464 () Bool)

(declare-fun c!43570 () Bool)

(assert (=> b!257464 (= c!43570 (= lt!129445 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257464 (= e!166886 e!166885)))

(assert (= (and d!61817 c!43571) b!257462))

(assert (= (and d!61817 (not c!43571)) b!257459))

(assert (= (and b!257459 c!43572) b!257461))

(assert (= (and b!257459 (not c!43572)) b!257464))

(assert (= (and b!257464 c!43570) b!257460))

(assert (= (and b!257464 (not c!43570)) b!257463))

(declare-fun m!272811 () Bool)

(assert (=> b!257459 m!272811))

(declare-fun m!272813 () Bool)

(assert (=> d!61817 m!272813))

(declare-fun m!272815 () Bool)

(assert (=> d!61817 m!272815))

(declare-fun m!272817 () Bool)

(assert (=> d!61817 m!272817))

(assert (=> d!61817 m!272605))

(declare-fun m!272819 () Bool)

(assert (=> d!61817 m!272819))

(assert (=> d!61817 m!272817))

(declare-fun m!272821 () Bool)

(assert (=> d!61817 m!272821))

(declare-fun m!272823 () Bool)

(assert (=> b!257463 m!272823))

(assert (=> b!257153 d!61817))

(declare-fun d!61819 () Bool)

(declare-fun e!166890 () Bool)

(assert (=> d!61819 e!166890))

(declare-fun res!125939 () Bool)

(assert (=> d!61819 (=> (not res!125939) (not e!166890))))

(declare-fun lt!129451 () SeekEntryResult!1168)

(assert (=> d!61819 (= res!125939 ((_ is Found!1168) lt!129451))))

(assert (=> d!61819 (= lt!129451 (seekEntryOrOpen!0 key!932 (_keys!6911 thiss!1504) (mask!11029 thiss!1504)))))

(declare-fun lt!129452 () Unit!7985)

(declare-fun choose!1239 (array!12527 array!12525 (_ BitVec 32) (_ BitVec 32) V!8435 V!8435 (_ BitVec 64) Int) Unit!7985)

(assert (=> d!61819 (= lt!129452 (choose!1239 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) key!932 (defaultEntry!4745 thiss!1504)))))

(assert (=> d!61819 (validMask!0 (mask!11029 thiss!1504))))

(assert (=> d!61819 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!431 (_keys!6911 thiss!1504) (_values!4728 thiss!1504) (mask!11029 thiss!1504) (extraKeys!4482 thiss!1504) (zeroValue!4586 thiss!1504) (minValue!4586 thiss!1504) key!932 (defaultEntry!4745 thiss!1504)) lt!129452)))

(declare-fun b!257469 () Bool)

(declare-fun res!125940 () Bool)

(assert (=> b!257469 (=> (not res!125940) (not e!166890))))

(assert (=> b!257469 (= res!125940 (inRange!0 (index!6843 lt!129451) (mask!11029 thiss!1504)))))

(declare-fun b!257470 () Bool)

(assert (=> b!257470 (= e!166890 (= (select (arr!5933 (_keys!6911 thiss!1504)) (index!6843 lt!129451)) key!932))))

(assert (=> b!257470 (and (bvsge (index!6843 lt!129451) #b00000000000000000000000000000000) (bvslt (index!6843 lt!129451) (size!6280 (_keys!6911 thiss!1504))))))

(assert (= (and d!61819 res!125939) b!257469))

(assert (= (and b!257469 res!125940) b!257470))

(assert (=> d!61819 m!272535))

(declare-fun m!272825 () Bool)

(assert (=> d!61819 m!272825))

(assert (=> d!61819 m!272605))

(declare-fun m!272827 () Bool)

(assert (=> b!257469 m!272827))

(declare-fun m!272829 () Bool)

(assert (=> b!257470 m!272829))

(assert (=> b!257161 d!61819))

(declare-fun mapIsEmpty!11226 () Bool)

(declare-fun mapRes!11226 () Bool)

(assert (=> mapIsEmpty!11226 mapRes!11226))

(declare-fun b!257477 () Bool)

(declare-fun e!166896 () Bool)

(assert (=> b!257477 (= e!166896 tp_is_empty!6591)))

(declare-fun condMapEmpty!11226 () Bool)

(declare-fun mapDefault!11226 () ValueCell!2952)

(assert (=> mapNonEmpty!11220 (= condMapEmpty!11226 (= mapRest!11220 ((as const (Array (_ BitVec 32) ValueCell!2952)) mapDefault!11226)))))

(declare-fun e!166895 () Bool)

(assert (=> mapNonEmpty!11220 (= tp!23493 (and e!166895 mapRes!11226))))

(declare-fun mapNonEmpty!11226 () Bool)

(declare-fun tp!23502 () Bool)

(assert (=> mapNonEmpty!11226 (= mapRes!11226 (and tp!23502 e!166896))))

(declare-fun mapRest!11226 () (Array (_ BitVec 32) ValueCell!2952))

(declare-fun mapValue!11226 () ValueCell!2952)

(declare-fun mapKey!11226 () (_ BitVec 32))

(assert (=> mapNonEmpty!11226 (= mapRest!11220 (store mapRest!11226 mapKey!11226 mapValue!11226))))

(declare-fun b!257478 () Bool)

(assert (=> b!257478 (= e!166895 tp_is_empty!6591)))

(assert (= (and mapNonEmpty!11220 condMapEmpty!11226) mapIsEmpty!11226))

(assert (= (and mapNonEmpty!11220 (not condMapEmpty!11226)) mapNonEmpty!11226))

(assert (= (and mapNonEmpty!11226 ((_ is ValueCellFull!2952) mapValue!11226)) b!257477))

(assert (= (and mapNonEmpty!11220 ((_ is ValueCellFull!2952) mapDefault!11226)) b!257478))

(declare-fun m!272831 () Bool)

(assert (=> mapNonEmpty!11226 m!272831))

(declare-fun b_lambda!8183 () Bool)

(assert (= b_lambda!8181 (or (and b!257163 b_free!6729) b_lambda!8183)))

(declare-fun b_lambda!8185 () Bool)

(assert (= b_lambda!8179 (or (and b!257163 b_free!6729) b_lambda!8185)))

(check-sat (not bm!24430) (not b!257313) (not d!61811) (not b!257388) (not b!257340) (not b_lambda!8183) (not b!257445) (not b!257400) (not b!257352) (not bm!24421) (not d!61807) (not b_next!6729) (not b!257387) (not bm!24405) (not b!257339) (not b!257364) (not d!61809) (not bm!24436) (not b!257391) (not d!61817) (not b!257425) (not bm!24424) (not b!257428) (not b!257316) (not b!257444) (not d!61785) (not bm!24431) (not bm!24425) (not b!257407) (not b!257401) (not b!257398) (not bm!24426) (not b!257386) (not d!61799) (not b!257469) (not b!257422) (not b!257326) (not b!257463) (not bm!24445) (not b!257436) (not b!257269) (not b!257390) (not b!257350) b_and!13801 (not b!257419) (not mapNonEmpty!11226) (not d!61815) (not b!257385) (not b!257349) (not d!61813) (not b!257332) (not b!257372) (not b!257431) (not d!61819) (not d!61777) (not b!257267) (not b!257446) (not b!257421) (not d!61783) (not bm!24432) (not b!257312) (not b!257323) (not d!61789) tp_is_empty!6591 (not bm!24441) (not d!61787) (not bm!24435) (not b!257315) (not b!257368) (not d!61803) (not b_lambda!8185) (not b!257325) (not bm!24440) (not bm!24406) (not d!61769) (not b!257354) (not b!257260) (not bm!24439))
(check-sat b_and!13801 (not b_next!6729))
