; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24514 () Bool)

(assert start!24514)

(declare-fun b!256811 () Bool)

(declare-fun b_free!6725 () Bool)

(declare-fun b_next!6725 () Bool)

(assert (=> b!256811 (= b_free!6725 (not b_next!6725))))

(declare-fun tp!23478 () Bool)

(declare-fun b_and!13787 () Bool)

(assert (=> b!256811 (= tp!23478 b_and!13787)))

(declare-fun bm!24337 () Bool)

(declare-fun call!24340 () Bool)

(declare-datatypes ((V!8429 0))(
  ( (V!8430 (val!3338 Int)) )
))
(declare-datatypes ((ValueCell!2950 0))(
  ( (ValueCellFull!2950 (v!5427 V!8429)) (EmptyCell!2950) )
))
(declare-datatypes ((array!12515 0))(
  ( (array!12516 (arr!5928 (Array (_ BitVec 32) ValueCell!2950)) (size!6275 (_ BitVec 32))) )
))
(declare-datatypes ((array!12517 0))(
  ( (array!12518 (arr!5929 (Array (_ BitVec 32) (_ BitVec 64))) (size!6276 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3800 0))(
  ( (LongMapFixedSize!3801 (defaultEntry!4738 Int) (mask!11016 (_ BitVec 32)) (extraKeys!4475 (_ BitVec 32)) (zeroValue!4579 V!8429) (minValue!4579 V!8429) (_size!1949 (_ BitVec 32)) (_keys!6902 array!12517) (_values!4721 array!12515) (_vacant!1949 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3800)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24337 (= call!24340 (arrayContainsKey!0 (_keys!6902 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256791 () Bool)

(declare-fun e!166467 () Bool)

(assert (=> b!256791 (= e!166467 (bvslt (size!6276 (_keys!6902 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!256792 () Bool)

(declare-datatypes ((Unit!7973 0))(
  ( (Unit!7974) )
))
(declare-fun e!166461 () Unit!7973)

(declare-fun Unit!7975 () Unit!7973)

(assert (=> b!256792 (= e!166461 Unit!7975)))

(declare-fun lt!128993 () Unit!7973)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!430 (array!12517 array!12515 (_ BitVec 32) (_ BitVec 32) V!8429 V!8429 (_ BitVec 64) Int) Unit!7973)

(assert (=> b!256792 (= lt!128993 (lemmaInListMapThenSeekEntryOrOpenFindsIt!430 (_keys!6902 thiss!1504) (_values!4721 thiss!1504) (mask!11016 thiss!1504) (extraKeys!4475 thiss!1504) (zeroValue!4579 thiss!1504) (minValue!4579 thiss!1504) key!932 (defaultEntry!4738 thiss!1504)))))

(assert (=> b!256792 false))

(declare-fun mapNonEmpty!11211 () Bool)

(declare-fun mapRes!11211 () Bool)

(declare-fun tp!23477 () Bool)

(declare-fun e!166463 () Bool)

(assert (=> mapNonEmpty!11211 (= mapRes!11211 (and tp!23477 e!166463))))

(declare-fun mapKey!11211 () (_ BitVec 32))

(declare-fun mapValue!11211 () ValueCell!2950)

(declare-fun mapRest!11211 () (Array (_ BitVec 32) ValueCell!2950))

(assert (=> mapNonEmpty!11211 (= (arr!5928 (_values!4721 thiss!1504)) (store mapRest!11211 mapKey!11211 mapValue!11211))))

(declare-fun b!256793 () Bool)

(declare-fun c!43421 () Bool)

(declare-datatypes ((SeekEntryResult!1166 0))(
  ( (MissingZero!1166 (index!6834 (_ BitVec 32))) (Found!1166 (index!6835 (_ BitVec 32))) (Intermediate!1166 (undefined!1978 Bool) (index!6836 (_ BitVec 32)) (x!24980 (_ BitVec 32))) (Undefined!1166) (MissingVacant!1166 (index!6837 (_ BitVec 32))) )
))
(declare-fun lt!128982 () SeekEntryResult!1166)

(assert (=> b!256793 (= c!43421 (is-MissingVacant!1166 lt!128982))))

(declare-fun e!166462 () Bool)

(declare-fun e!166473 () Bool)

(assert (=> b!256793 (= e!166462 e!166473)))

(declare-fun mapIsEmpty!11211 () Bool)

(assert (=> mapIsEmpty!11211 mapRes!11211))

(declare-fun b!256794 () Bool)

(declare-fun e!166464 () Unit!7973)

(declare-fun Unit!7976 () Unit!7973)

(assert (=> b!256794 (= e!166464 Unit!7976)))

(declare-fun lt!128983 () Unit!7973)

(declare-fun lemmaArrayContainsKeyThenInListMap!236 (array!12517 array!12515 (_ BitVec 32) (_ BitVec 32) V!8429 V!8429 (_ BitVec 64) (_ BitVec 32) Int) Unit!7973)

(assert (=> b!256794 (= lt!128983 (lemmaArrayContainsKeyThenInListMap!236 (_keys!6902 thiss!1504) (_values!4721 thiss!1504) (mask!11016 thiss!1504) (extraKeys!4475 thiss!1504) (zeroValue!4579 thiss!1504) (minValue!4579 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4738 thiss!1504)))))

(assert (=> b!256794 false))

(declare-fun b!256795 () Bool)

(declare-fun e!166466 () Bool)

(declare-fun e!166472 () Bool)

(assert (=> b!256795 (= e!166466 e!166472)))

(declare-fun res!125623 () Bool)

(assert (=> b!256795 (=> (not res!125623) (not e!166472))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!256795 (= res!125623 (or (= lt!128982 (MissingZero!1166 index!297)) (= lt!128982 (MissingVacant!1166 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12517 (_ BitVec 32)) SeekEntryResult!1166)

(assert (=> b!256795 (= lt!128982 (seekEntryOrOpen!0 key!932 (_keys!6902 thiss!1504) (mask!11016 thiss!1504)))))

(declare-fun b!256796 () Bool)

(declare-fun e!166459 () Bool)

(assert (=> b!256796 (= e!166459 (not call!24340))))

(declare-fun b!256797 () Bool)

(assert (=> b!256797 (= e!166473 e!166459)))

(declare-fun res!125628 () Bool)

(declare-fun call!24341 () Bool)

(assert (=> b!256797 (= res!125628 call!24341)))

(assert (=> b!256797 (=> (not res!125628) (not e!166459))))

(declare-fun b!256798 () Bool)

(declare-fun res!125625 () Bool)

(assert (=> b!256798 (= res!125625 (= (select (arr!5929 (_keys!6902 thiss!1504)) (index!6837 lt!128982)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256798 (=> (not res!125625) (not e!166459))))

(declare-fun b!256799 () Bool)

(declare-fun e!166471 () Bool)

(declare-fun tp_is_empty!6587 () Bool)

(assert (=> b!256799 (= e!166471 tp_is_empty!6587)))

(declare-fun b!256800 () Bool)

(declare-fun e!166460 () Bool)

(assert (=> b!256800 (= e!166460 (not e!166467))))

(declare-fun res!125626 () Bool)

(assert (=> b!256800 (=> (not res!125626) (not e!166467))))

(assert (=> b!256800 (= res!125626 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6276 (_keys!6902 thiss!1504)))))))

(declare-fun lt!128990 () array!12517)

(assert (=> b!256800 (arrayContainsKey!0 lt!128990 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!128994 () Unit!7973)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12517 (_ BitVec 64) (_ BitVec 32)) Unit!7973)

(assert (=> b!256800 (= lt!128994 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128990 key!932 index!297))))

(declare-datatypes ((tuple2!4916 0))(
  ( (tuple2!4917 (_1!2469 (_ BitVec 64)) (_2!2469 V!8429)) )
))
(declare-datatypes ((List!3795 0))(
  ( (Nil!3792) (Cons!3791 (h!4453 tuple2!4916) (t!8852 List!3795)) )
))
(declare-datatypes ((ListLongMap!3829 0))(
  ( (ListLongMap!3830 (toList!1930 List!3795)) )
))
(declare-fun lt!128985 () ListLongMap!3829)

(declare-fun v!346 () V!8429)

(declare-fun +!684 (ListLongMap!3829 tuple2!4916) ListLongMap!3829)

(declare-fun getCurrentListMap!1458 (array!12517 array!12515 (_ BitVec 32) (_ BitVec 32) V!8429 V!8429 (_ BitVec 32) Int) ListLongMap!3829)

(assert (=> b!256800 (= (+!684 lt!128985 (tuple2!4917 key!932 v!346)) (getCurrentListMap!1458 lt!128990 (array!12516 (store (arr!5928 (_values!4721 thiss!1504)) index!297 (ValueCellFull!2950 v!346)) (size!6275 (_values!4721 thiss!1504))) (mask!11016 thiss!1504) (extraKeys!4475 thiss!1504) (zeroValue!4579 thiss!1504) (minValue!4579 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4738 thiss!1504)))))

(declare-fun lt!128992 () Unit!7973)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!94 (array!12517 array!12515 (_ BitVec 32) (_ BitVec 32) V!8429 V!8429 (_ BitVec 32) (_ BitVec 64) V!8429 Int) Unit!7973)

(assert (=> b!256800 (= lt!128992 (lemmaAddValidKeyToArrayThenAddPairToListMap!94 (_keys!6902 thiss!1504) (_values!4721 thiss!1504) (mask!11016 thiss!1504) (extraKeys!4475 thiss!1504) (zeroValue!4579 thiss!1504) (minValue!4579 thiss!1504) index!297 key!932 v!346 (defaultEntry!4738 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12517 (_ BitVec 32)) Bool)

(assert (=> b!256800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128990 (mask!11016 thiss!1504))))

(declare-fun lt!128988 () Unit!7973)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12517 (_ BitVec 32) (_ BitVec 32)) Unit!7973)

(assert (=> b!256800 (= lt!128988 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6902 thiss!1504) index!297 (mask!11016 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12517 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!256800 (= (arrayCountValidKeys!0 lt!128990 #b00000000000000000000000000000000 (size!6276 (_keys!6902 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6902 thiss!1504) #b00000000000000000000000000000000 (size!6276 (_keys!6902 thiss!1504)))))))

(declare-fun lt!128991 () Unit!7973)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12517 (_ BitVec 32) (_ BitVec 64)) Unit!7973)

(assert (=> b!256800 (= lt!128991 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6902 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3796 0))(
  ( (Nil!3793) (Cons!3792 (h!4454 (_ BitVec 64)) (t!8853 List!3796)) )
))
(declare-fun arrayNoDuplicates!0 (array!12517 (_ BitVec 32) List!3796) Bool)

(assert (=> b!256800 (arrayNoDuplicates!0 lt!128990 #b00000000000000000000000000000000 Nil!3793)))

(assert (=> b!256800 (= lt!128990 (array!12518 (store (arr!5929 (_keys!6902 thiss!1504)) index!297 key!932) (size!6276 (_keys!6902 thiss!1504))))))

(declare-fun lt!128989 () Unit!7973)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12517 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3796) Unit!7973)

(assert (=> b!256800 (= lt!128989 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6902 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3793))))

(declare-fun lt!128987 () Unit!7973)

(assert (=> b!256800 (= lt!128987 e!166464)))

(declare-fun c!43419 () Bool)

(assert (=> b!256800 (= c!43419 (arrayContainsKey!0 (_keys!6902 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256801 () Bool)

(declare-fun Unit!7977 () Unit!7973)

(assert (=> b!256801 (= e!166464 Unit!7977)))

(declare-fun b!256802 () Bool)

(assert (=> b!256802 (= e!166463 tp_is_empty!6587)))

(declare-fun b!256803 () Bool)

(declare-fun res!125629 () Bool)

(declare-fun e!166470 () Bool)

(assert (=> b!256803 (=> (not res!125629) (not e!166470))))

(assert (=> b!256803 (= res!125629 call!24341)))

(assert (=> b!256803 (= e!166462 e!166470)))

(declare-fun b!256804 () Bool)

(declare-fun res!125621 () Bool)

(assert (=> b!256804 (=> (not res!125621) (not e!166470))))

(assert (=> b!256804 (= res!125621 (= (select (arr!5929 (_keys!6902 thiss!1504)) (index!6834 lt!128982)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256805 () Bool)

(declare-fun res!125622 () Bool)

(assert (=> b!256805 (=> (not res!125622) (not e!166466))))

(assert (=> b!256805 (= res!125622 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!125624 () Bool)

(assert (=> start!24514 (=> (not res!125624) (not e!166466))))

(declare-fun valid!1485 (LongMapFixedSize!3800) Bool)

(assert (=> start!24514 (= res!125624 (valid!1485 thiss!1504))))

(assert (=> start!24514 e!166466))

(declare-fun e!166465 () Bool)

(assert (=> start!24514 e!166465))

(assert (=> start!24514 true))

(assert (=> start!24514 tp_is_empty!6587))

(declare-fun b!256806 () Bool)

(declare-fun res!125630 () Bool)

(assert (=> b!256806 (=> (not res!125630) (not e!166467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!256806 (= res!125630 (validKeyInArray!0 key!932))))

(declare-fun b!256807 () Bool)

(declare-fun e!166469 () Bool)

(assert (=> b!256807 (= e!166469 (and e!166471 mapRes!11211))))

(declare-fun condMapEmpty!11211 () Bool)

(declare-fun mapDefault!11211 () ValueCell!2950)

