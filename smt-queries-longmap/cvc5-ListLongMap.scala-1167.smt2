; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24864 () Bool)

(assert start!24864)

(declare-fun b!259560 () Bool)

(declare-fun b_free!6751 () Bool)

(declare-fun b_next!6751 () Bool)

(assert (=> b!259560 (= b_free!6751 (not b_next!6751))))

(declare-fun tp!23573 () Bool)

(declare-fun b_and!13853 () Bool)

(assert (=> b!259560 (= tp!23573 b_and!13853)))

(declare-fun b!259559 () Bool)

(declare-fun e!168215 () Bool)

(declare-datatypes ((V!8465 0))(
  ( (V!8466 (val!3351 Int)) )
))
(declare-datatypes ((ValueCell!2963 0))(
  ( (ValueCellFull!2963 (v!5461 V!8465)) (EmptyCell!2963) )
))
(declare-datatypes ((array!12577 0))(
  ( (array!12578 (arr!5954 (Array (_ BitVec 32) ValueCell!2963)) (size!6303 (_ BitVec 32))) )
))
(declare-datatypes ((array!12579 0))(
  ( (array!12580 (arr!5955 (Array (_ BitVec 32) (_ BitVec 64))) (size!6304 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3826 0))(
  ( (LongMapFixedSize!3827 (defaultEntry!4786 Int) (mask!11105 (_ BitVec 32)) (extraKeys!4523 (_ BitVec 32)) (zeroValue!4627 V!8465) (minValue!4627 V!8465) (_size!1962 (_ BitVec 32)) (_keys!6964 array!12579) (_values!4769 array!12577) (_vacant!1962 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3826)

(assert (=> b!259559 (= e!168215 (or (not (= (size!6303 (_values!4769 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11105 thiss!1504)))) (not (= (size!6304 (_keys!6964 thiss!1504)) (size!6303 (_values!4769 thiss!1504)))) (bvsge (mask!11105 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun e!168223 () Bool)

(declare-fun tp_is_empty!6613 () Bool)

(declare-fun e!168225 () Bool)

(declare-fun array_inv!3933 (array!12579) Bool)

(declare-fun array_inv!3934 (array!12577) Bool)

(assert (=> b!259560 (= e!168225 (and tp!23573 tp_is_empty!6613 (array_inv!3933 (_keys!6964 thiss!1504)) (array_inv!3934 (_values!4769 thiss!1504)) e!168223))))

(declare-fun b!259561 () Bool)

(declare-fun res!126886 () Bool)

(declare-fun e!168228 () Bool)

(assert (=> b!259561 (=> (not res!126886) (not e!168228))))

(declare-datatypes ((SeekEntryResult!1179 0))(
  ( (MissingZero!1179 (index!6886 (_ BitVec 32))) (Found!1179 (index!6887 (_ BitVec 32))) (Intermediate!1179 (undefined!1991 Bool) (index!6888 (_ BitVec 32)) (x!25099 (_ BitVec 32))) (Undefined!1179) (MissingVacant!1179 (index!6889 (_ BitVec 32))) )
))
(declare-fun lt!130788 () SeekEntryResult!1179)

(assert (=> b!259561 (= res!126886 (= (select (arr!5955 (_keys!6964 thiss!1504)) (index!6886 lt!130788)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259562 () Bool)

(declare-fun e!168219 () Bool)

(declare-fun e!168227 () Bool)

(assert (=> b!259562 (= e!168219 e!168227)))

(declare-fun res!126893 () Bool)

(declare-fun call!24716 () Bool)

(assert (=> b!259562 (= res!126893 call!24716)))

(assert (=> b!259562 (=> (not res!126893) (not e!168227))))

(declare-fun b!259563 () Bool)

(assert (=> b!259563 (= e!168219 (is-Undefined!1179 lt!130788))))

(declare-fun b!259564 () Bool)

(declare-fun e!168221 () Bool)

(declare-fun e!168220 () Bool)

(assert (=> b!259564 (= e!168221 e!168220)))

(declare-fun res!126889 () Bool)

(assert (=> b!259564 (=> (not res!126889) (not e!168220))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!259564 (= res!126889 (or (= lt!130788 (MissingZero!1179 index!297)) (= lt!130788 (MissingVacant!1179 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12579 (_ BitVec 32)) SeekEntryResult!1179)

(assert (=> b!259564 (= lt!130788 (seekEntryOrOpen!0 key!932 (_keys!6964 thiss!1504) (mask!11105 thiss!1504)))))

(declare-fun b!259565 () Bool)

(declare-fun e!168222 () Bool)

(assert (=> b!259565 (= e!168220 e!168222)))

(declare-fun res!126892 () Bool)

(assert (=> b!259565 (=> (not res!126892) (not e!168222))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!259565 (= res!126892 (inRange!0 index!297 (mask!11105 thiss!1504)))))

(declare-datatypes ((Unit!8069 0))(
  ( (Unit!8070) )
))
(declare-fun lt!130786 () Unit!8069)

(declare-fun e!168216 () Unit!8069)

(assert (=> b!259565 (= lt!130786 e!168216)))

(declare-fun c!44066 () Bool)

(declare-datatypes ((tuple2!4942 0))(
  ( (tuple2!4943 (_1!2482 (_ BitVec 64)) (_2!2482 V!8465)) )
))
(declare-datatypes ((List!3820 0))(
  ( (Nil!3817) (Cons!3816 (h!4480 tuple2!4942) (t!8887 List!3820)) )
))
(declare-datatypes ((ListLongMap!3855 0))(
  ( (ListLongMap!3856 (toList!1943 List!3820)) )
))
(declare-fun lt!130787 () ListLongMap!3855)

(declare-fun contains!1886 (ListLongMap!3855 (_ BitVec 64)) Bool)

(assert (=> b!259565 (= c!44066 (contains!1886 lt!130787 key!932))))

(declare-fun getCurrentListMap!1471 (array!12579 array!12577 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 32) Int) ListLongMap!3855)

(assert (=> b!259565 (= lt!130787 (getCurrentListMap!1471 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun mapNonEmpty!11267 () Bool)

(declare-fun mapRes!11267 () Bool)

(declare-fun tp!23572 () Bool)

(declare-fun e!168224 () Bool)

(assert (=> mapNonEmpty!11267 (= mapRes!11267 (and tp!23572 e!168224))))

(declare-fun mapKey!11267 () (_ BitVec 32))

(declare-fun mapRest!11267 () (Array (_ BitVec 32) ValueCell!2963))

(declare-fun mapValue!11267 () ValueCell!2963)

(assert (=> mapNonEmpty!11267 (= (arr!5954 (_values!4769 thiss!1504)) (store mapRest!11267 mapKey!11267 mapValue!11267))))

(declare-fun b!259566 () Bool)

(declare-fun e!168217 () Unit!8069)

(declare-fun Unit!8071 () Unit!8069)

(assert (=> b!259566 (= e!168217 Unit!8071)))

(declare-fun b!259567 () Bool)

(declare-fun call!24717 () Bool)

(assert (=> b!259567 (= e!168228 (not call!24717))))

(declare-fun b!259568 () Bool)

(declare-fun lt!130796 () Unit!8069)

(assert (=> b!259568 (= e!168216 lt!130796)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!442 (array!12579 array!12577 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) Int) Unit!8069)

(assert (=> b!259568 (= lt!130796 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!442 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)))))

(declare-fun c!44068 () Bool)

(assert (=> b!259568 (= c!44068 (is-MissingZero!1179 lt!130788))))

(declare-fun e!168226 () Bool)

(assert (=> b!259568 e!168226))

(declare-fun bm!24713 () Bool)

(declare-fun arrayContainsKey!0 (array!12579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24713 (= call!24717 (arrayContainsKey!0 (_keys!6964 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!259569 () Bool)

(declare-fun res!126885 () Bool)

(assert (=> b!259569 (=> (not res!126885) (not e!168221))))

(assert (=> b!259569 (= res!126885 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!11267 () Bool)

(assert (=> mapIsEmpty!11267 mapRes!11267))

(declare-fun res!126887 () Bool)

(assert (=> start!24864 (=> (not res!126887) (not e!168221))))

(declare-fun valid!1494 (LongMapFixedSize!3826) Bool)

(assert (=> start!24864 (= res!126887 (valid!1494 thiss!1504))))

(assert (=> start!24864 e!168221))

(assert (=> start!24864 e!168225))

(assert (=> start!24864 true))

(assert (=> start!24864 tp_is_empty!6613))

(declare-fun b!259570 () Bool)

(assert (=> b!259570 (= e!168222 (not e!168215))))

(declare-fun res!126888 () Bool)

(assert (=> b!259570 (=> res!126888 e!168215)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!259570 (= res!126888 (not (validMask!0 (mask!11105 thiss!1504))))))

(declare-fun lt!130790 () array!12579)

(declare-fun arrayCountValidKeys!0 (array!12579 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!259570 (= (arrayCountValidKeys!0 lt!130790 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!130791 () Unit!8069)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12579 (_ BitVec 32)) Unit!8069)

(assert (=> b!259570 (= lt!130791 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130790 index!297))))

(assert (=> b!259570 (arrayContainsKey!0 lt!130790 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130798 () Unit!8069)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12579 (_ BitVec 64) (_ BitVec 32)) Unit!8069)

(assert (=> b!259570 (= lt!130798 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130790 key!932 index!297))))

(declare-fun v!346 () V!8465)

(declare-fun +!696 (ListLongMap!3855 tuple2!4942) ListLongMap!3855)

(assert (=> b!259570 (= (+!696 lt!130787 (tuple2!4943 key!932 v!346)) (getCurrentListMap!1471 lt!130790 (array!12578 (store (arr!5954 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6303 (_values!4769 thiss!1504))) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!130789 () Unit!8069)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!106 (array!12579 array!12577 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 32) (_ BitVec 64) V!8465 Int) Unit!8069)

(assert (=> b!259570 (= lt!130789 (lemmaAddValidKeyToArrayThenAddPairToListMap!106 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) index!297 key!932 v!346 (defaultEntry!4786 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12579 (_ BitVec 32)) Bool)

(assert (=> b!259570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130790 (mask!11105 thiss!1504))))

(declare-fun lt!130793 () Unit!8069)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12579 (_ BitVec 32) (_ BitVec 32)) Unit!8069)

(assert (=> b!259570 (= lt!130793 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6964 thiss!1504) index!297 (mask!11105 thiss!1504)))))

(assert (=> b!259570 (= (arrayCountValidKeys!0 lt!130790 #b00000000000000000000000000000000 (size!6304 (_keys!6964 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6964 thiss!1504) #b00000000000000000000000000000000 (size!6304 (_keys!6964 thiss!1504)))))))

(declare-fun lt!130785 () Unit!8069)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12579 (_ BitVec 32) (_ BitVec 64)) Unit!8069)

(assert (=> b!259570 (= lt!130785 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6964 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3821 0))(
  ( (Nil!3818) (Cons!3817 (h!4481 (_ BitVec 64)) (t!8888 List!3821)) )
))
(declare-fun arrayNoDuplicates!0 (array!12579 (_ BitVec 32) List!3821) Bool)

(assert (=> b!259570 (arrayNoDuplicates!0 lt!130790 #b00000000000000000000000000000000 Nil!3818)))

(assert (=> b!259570 (= lt!130790 (array!12580 (store (arr!5955 (_keys!6964 thiss!1504)) index!297 key!932) (size!6304 (_keys!6964 thiss!1504))))))

(declare-fun lt!130795 () Unit!8069)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12579 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3821) Unit!8069)

(assert (=> b!259570 (= lt!130795 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6964 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3818))))

(declare-fun lt!130792 () Unit!8069)

(assert (=> b!259570 (= lt!130792 e!168217)))

(declare-fun c!44067 () Bool)

(assert (=> b!259570 (= c!44067 (arrayContainsKey!0 (_keys!6964 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!259571 () Bool)

(declare-fun Unit!8072 () Unit!8069)

(assert (=> b!259571 (= e!168217 Unit!8072)))

(declare-fun lt!130794 () Unit!8069)

(declare-fun lemmaArrayContainsKeyThenInListMap!248 (array!12579 array!12577 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) (_ BitVec 32) Int) Unit!8069)

(assert (=> b!259571 (= lt!130794 (lemmaArrayContainsKeyThenInListMap!248 (_keys!6964 thiss!1504) (_values!4769 thiss!1504) (mask!11105 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(assert (=> b!259571 false))

(declare-fun b!259572 () Bool)

(assert (=> b!259572 (= e!168224 tp_is_empty!6613)))

(declare-fun b!259573 () Bool)

(declare-fun e!168214 () Bool)

(assert (=> b!259573 (= e!168223 (and e!168214 mapRes!11267))))

(declare-fun condMapEmpty!11267 () Bool)

(declare-fun mapDefault!11267 () ValueCell!2963)

