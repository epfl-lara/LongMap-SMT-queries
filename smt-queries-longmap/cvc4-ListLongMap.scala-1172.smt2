; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25138 () Bool)

(assert start!25138)

(declare-fun b!262112 () Bool)

(declare-fun b_free!6785 () Bool)

(declare-fun b_next!6785 () Bool)

(assert (=> b!262112 (= b_free!6785 (not b_next!6785))))

(declare-fun tp!23685 () Bool)

(declare-fun b_and!13919 () Bool)

(assert (=> b!262112 (= tp!23685 b_and!13919)))

(declare-fun b!262092 () Bool)

(declare-fun res!128021 () Bool)

(declare-fun e!169859 () Bool)

(assert (=> b!262092 (=> (not res!128021) (not e!169859))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!262092 (= res!128021 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!262093 () Bool)

(declare-datatypes ((Unit!8165 0))(
  ( (Unit!8166) )
))
(declare-fun e!169861 () Unit!8165)

(declare-fun Unit!8167 () Unit!8165)

(assert (=> b!262093 (= e!169861 Unit!8167)))

(declare-fun lt!132437 () Unit!8165)

(declare-datatypes ((V!8509 0))(
  ( (V!8510 (val!3368 Int)) )
))
(declare-datatypes ((ValueCell!2980 0))(
  ( (ValueCellFull!2980 (v!5493 V!8509)) (EmptyCell!2980) )
))
(declare-datatypes ((array!12651 0))(
  ( (array!12652 (arr!5988 (Array (_ BitVec 32) ValueCell!2980)) (size!6339 (_ BitVec 32))) )
))
(declare-datatypes ((array!12653 0))(
  ( (array!12654 (arr!5989 (Array (_ BitVec 32) (_ BitVec 64))) (size!6340 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3860 0))(
  ( (LongMapFixedSize!3861 (defaultEntry!4828 Int) (mask!11180 (_ BitVec 32)) (extraKeys!4565 (_ BitVec 32)) (zeroValue!4669 V!8509) (minValue!4669 V!8509) (_size!1979 (_ BitVec 32)) (_keys!7016 array!12653) (_values!4811 array!12651) (_vacant!1979 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3860)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!452 (array!12653 array!12651 (_ BitVec 32) (_ BitVec 32) V!8509 V!8509 (_ BitVec 64) Int) Unit!8165)

(assert (=> b!262093 (= lt!132437 (lemmaInListMapThenSeekEntryOrOpenFindsIt!452 (_keys!7016 thiss!1504) (_values!4811 thiss!1504) (mask!11180 thiss!1504) (extraKeys!4565 thiss!1504) (zeroValue!4669 thiss!1504) (minValue!4669 thiss!1504) key!932 (defaultEntry!4828 thiss!1504)))))

(assert (=> b!262093 false))

(declare-fun b!262094 () Bool)

(declare-fun c!44648 () Bool)

(declare-datatypes ((SeekEntryResult!1195 0))(
  ( (MissingZero!1195 (index!6950 (_ BitVec 32))) (Found!1195 (index!6951 (_ BitVec 32))) (Intermediate!1195 (undefined!2007 Bool) (index!6952 (_ BitVec 32)) (x!25201 (_ BitVec 32))) (Undefined!1195) (MissingVacant!1195 (index!6953 (_ BitVec 32))) )
))
(declare-fun lt!132431 () SeekEntryResult!1195)

(assert (=> b!262094 (= c!44648 (is-MissingVacant!1195 lt!132431))))

(declare-fun e!169854 () Bool)

(declare-fun e!169852 () Bool)

(assert (=> b!262094 (= e!169854 e!169852)))

(declare-fun mapIsEmpty!11329 () Bool)

(declare-fun mapRes!11329 () Bool)

(assert (=> mapIsEmpty!11329 mapRes!11329))

(declare-fun b!262096 () Bool)

(declare-fun e!169866 () Bool)

(declare-fun e!169864 () Bool)

(assert (=> b!262096 (= e!169866 (not e!169864))))

(declare-fun res!128023 () Bool)

(assert (=> b!262096 (=> res!128023 e!169864)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!262096 (= res!128023 (not (validMask!0 (mask!11180 thiss!1504))))))

(declare-fun lt!132438 () array!12653)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12653 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!262096 (= (arrayCountValidKeys!0 lt!132438 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132428 () Unit!8165)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12653 (_ BitVec 32)) Unit!8165)

(assert (=> b!262096 (= lt!132428 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132438 index!297))))

(declare-fun arrayContainsKey!0 (array!12653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!262096 (arrayContainsKey!0 lt!132438 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132433 () Unit!8165)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12653 (_ BitVec 64) (_ BitVec 32)) Unit!8165)

(assert (=> b!262096 (= lt!132433 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132438 key!932 index!297))))

(declare-datatypes ((tuple2!4968 0))(
  ( (tuple2!4969 (_1!2495 (_ BitVec 64)) (_2!2495 V!8509)) )
))
(declare-datatypes ((List!3844 0))(
  ( (Nil!3841) (Cons!3840 (h!4506 tuple2!4968) (t!8917 List!3844)) )
))
(declare-datatypes ((ListLongMap!3881 0))(
  ( (ListLongMap!3882 (toList!1956 List!3844)) )
))
(declare-fun lt!132429 () ListLongMap!3881)

(declare-fun v!346 () V!8509)

(declare-fun +!707 (ListLongMap!3881 tuple2!4968) ListLongMap!3881)

(declare-fun getCurrentListMap!1484 (array!12653 array!12651 (_ BitVec 32) (_ BitVec 32) V!8509 V!8509 (_ BitVec 32) Int) ListLongMap!3881)

(assert (=> b!262096 (= (+!707 lt!132429 (tuple2!4969 key!932 v!346)) (getCurrentListMap!1484 lt!132438 (array!12652 (store (arr!5988 (_values!4811 thiss!1504)) index!297 (ValueCellFull!2980 v!346)) (size!6339 (_values!4811 thiss!1504))) (mask!11180 thiss!1504) (extraKeys!4565 thiss!1504) (zeroValue!4669 thiss!1504) (minValue!4669 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4828 thiss!1504)))))

(declare-fun lt!132426 () Unit!8165)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!117 (array!12653 array!12651 (_ BitVec 32) (_ BitVec 32) V!8509 V!8509 (_ BitVec 32) (_ BitVec 64) V!8509 Int) Unit!8165)

(assert (=> b!262096 (= lt!132426 (lemmaAddValidKeyToArrayThenAddPairToListMap!117 (_keys!7016 thiss!1504) (_values!4811 thiss!1504) (mask!11180 thiss!1504) (extraKeys!4565 thiss!1504) (zeroValue!4669 thiss!1504) (minValue!4669 thiss!1504) index!297 key!932 v!346 (defaultEntry!4828 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12653 (_ BitVec 32)) Bool)

(assert (=> b!262096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132438 (mask!11180 thiss!1504))))

(declare-fun lt!132436 () Unit!8165)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12653 (_ BitVec 32) (_ BitVec 32)) Unit!8165)

(assert (=> b!262096 (= lt!132436 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7016 thiss!1504) index!297 (mask!11180 thiss!1504)))))

(assert (=> b!262096 (= (arrayCountValidKeys!0 lt!132438 #b00000000000000000000000000000000 (size!6340 (_keys!7016 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7016 thiss!1504) #b00000000000000000000000000000000 (size!6340 (_keys!7016 thiss!1504)))))))

(declare-fun lt!132427 () Unit!8165)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12653 (_ BitVec 32) (_ BitVec 64)) Unit!8165)

(assert (=> b!262096 (= lt!132427 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7016 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3845 0))(
  ( (Nil!3842) (Cons!3841 (h!4507 (_ BitVec 64)) (t!8918 List!3845)) )
))
(declare-fun arrayNoDuplicates!0 (array!12653 (_ BitVec 32) List!3845) Bool)

(assert (=> b!262096 (arrayNoDuplicates!0 lt!132438 #b00000000000000000000000000000000 Nil!3842)))

(assert (=> b!262096 (= lt!132438 (array!12654 (store (arr!5989 (_keys!7016 thiss!1504)) index!297 key!932) (size!6340 (_keys!7016 thiss!1504))))))

(declare-fun lt!132434 () Unit!8165)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12653 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3845) Unit!8165)

(assert (=> b!262096 (= lt!132434 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7016 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3842))))

(declare-fun lt!132425 () Unit!8165)

(declare-fun e!169865 () Unit!8165)

(assert (=> b!262096 (= lt!132425 e!169865)))

(declare-fun c!44647 () Bool)

(assert (=> b!262096 (= c!44647 (arrayContainsKey!0 (_keys!7016 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262097 () Bool)

(declare-fun e!169862 () Bool)

(declare-fun call!25028 () Bool)

(assert (=> b!262097 (= e!169862 (not call!25028))))

(declare-fun b!262098 () Bool)

(declare-fun Unit!8168 () Unit!8165)

(assert (=> b!262098 (= e!169865 Unit!8168)))

(declare-fun lt!132435 () Unit!8165)

(declare-fun lemmaArrayContainsKeyThenInListMap!259 (array!12653 array!12651 (_ BitVec 32) (_ BitVec 32) V!8509 V!8509 (_ BitVec 64) (_ BitVec 32) Int) Unit!8165)

(assert (=> b!262098 (= lt!132435 (lemmaArrayContainsKeyThenInListMap!259 (_keys!7016 thiss!1504) (_values!4811 thiss!1504) (mask!11180 thiss!1504) (extraKeys!4565 thiss!1504) (zeroValue!4669 thiss!1504) (minValue!4669 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4828 thiss!1504)))))

(assert (=> b!262098 false))

(declare-fun b!262099 () Bool)

(declare-fun e!169856 () Bool)

(assert (=> b!262099 (= e!169856 (not call!25028))))

(declare-fun b!262100 () Bool)

(assert (=> b!262100 (= e!169864 (or (not (= (size!6339 (_values!4811 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11180 thiss!1504)))) (not (= (size!6340 (_keys!7016 thiss!1504)) (size!6339 (_values!4811 thiss!1504)))) (bvslt (mask!11180 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4565 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4565 thiss!1504) #b00000000000000000000000000000011) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6340 (_keys!7016 thiss!1504))))))))

(declare-fun b!262101 () Bool)

(declare-fun Unit!8169 () Unit!8165)

(assert (=> b!262101 (= e!169865 Unit!8169)))

(declare-fun b!262102 () Bool)

(declare-fun res!128019 () Bool)

(assert (=> b!262102 (=> (not res!128019) (not e!169856))))

(assert (=> b!262102 (= res!128019 (= (select (arr!5989 (_keys!7016 thiss!1504)) (index!6950 lt!132431)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262103 () Bool)

(declare-fun lt!132432 () Unit!8165)

(assert (=> b!262103 (= e!169861 lt!132432)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!452 (array!12653 array!12651 (_ BitVec 32) (_ BitVec 32) V!8509 V!8509 (_ BitVec 64) Int) Unit!8165)

(assert (=> b!262103 (= lt!132432 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!452 (_keys!7016 thiss!1504) (_values!4811 thiss!1504) (mask!11180 thiss!1504) (extraKeys!4565 thiss!1504) (zeroValue!4669 thiss!1504) (minValue!4669 thiss!1504) key!932 (defaultEntry!4828 thiss!1504)))))

(declare-fun c!44646 () Bool)

(assert (=> b!262103 (= c!44646 (is-MissingZero!1195 lt!132431))))

(assert (=> b!262103 e!169854))

(declare-fun bm!25024 () Bool)

(assert (=> bm!25024 (= call!25028 (arrayContainsKey!0 (_keys!7016 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262104 () Bool)

(declare-fun e!169855 () Bool)

(assert (=> b!262104 (= e!169855 e!169866)))

(declare-fun res!128020 () Bool)

(assert (=> b!262104 (=> (not res!128020) (not e!169866))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262104 (= res!128020 (inRange!0 index!297 (mask!11180 thiss!1504)))))

(declare-fun lt!132430 () Unit!8165)

(assert (=> b!262104 (= lt!132430 e!169861)))

(declare-fun c!44645 () Bool)

(declare-fun contains!1903 (ListLongMap!3881 (_ BitVec 64)) Bool)

(assert (=> b!262104 (= c!44645 (contains!1903 lt!132429 key!932))))

(assert (=> b!262104 (= lt!132429 (getCurrentListMap!1484 (_keys!7016 thiss!1504) (_values!4811 thiss!1504) (mask!11180 thiss!1504) (extraKeys!4565 thiss!1504) (zeroValue!4669 thiss!1504) (minValue!4669 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4828 thiss!1504)))))

(declare-fun mapNonEmpty!11329 () Bool)

(declare-fun tp!23686 () Bool)

(declare-fun e!169853 () Bool)

(assert (=> mapNonEmpty!11329 (= mapRes!11329 (and tp!23686 e!169853))))

(declare-fun mapKey!11329 () (_ BitVec 32))

(declare-fun mapRest!11329 () (Array (_ BitVec 32) ValueCell!2980))

(declare-fun mapValue!11329 () ValueCell!2980)

(assert (=> mapNonEmpty!11329 (= (arr!5988 (_values!4811 thiss!1504)) (store mapRest!11329 mapKey!11329 mapValue!11329))))

(declare-fun res!128022 () Bool)

(assert (=> start!25138 (=> (not res!128022) (not e!169859))))

(declare-fun valid!1505 (LongMapFixedSize!3860) Bool)

(assert (=> start!25138 (= res!128022 (valid!1505 thiss!1504))))

(assert (=> start!25138 e!169859))

(declare-fun e!169857 () Bool)

(assert (=> start!25138 e!169857))

(assert (=> start!25138 true))

(declare-fun tp_is_empty!6647 () Bool)

(assert (=> start!25138 tp_is_empty!6647))

(declare-fun b!262095 () Bool)

(declare-fun res!128024 () Bool)

(assert (=> b!262095 (= res!128024 (= (select (arr!5989 (_keys!7016 thiss!1504)) (index!6953 lt!132431)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262095 (=> (not res!128024) (not e!169862))))

(declare-fun b!262105 () Bool)

(assert (=> b!262105 (= e!169852 (is-Undefined!1195 lt!132431))))

(declare-fun b!262106 () Bool)

(assert (=> b!262106 (= e!169853 tp_is_empty!6647)))

(declare-fun b!262107 () Bool)

(declare-fun e!169858 () Bool)

(declare-fun e!169863 () Bool)

(assert (=> b!262107 (= e!169858 (and e!169863 mapRes!11329))))

(declare-fun condMapEmpty!11329 () Bool)

(declare-fun mapDefault!11329 () ValueCell!2980)

