; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24606 () Bool)

(assert start!24606)

(declare-fun b!257522 () Bool)

(declare-fun b_free!6733 () Bool)

(declare-fun b_next!6733 () Bool)

(assert (=> b!257522 (= b_free!6733 (not b_next!6733))))

(declare-fun tp!23508 () Bool)

(declare-fun b_and!13803 () Bool)

(assert (=> b!257522 (= tp!23508 b_and!13803)))

(declare-fun b!257519 () Bool)

(declare-fun e!166933 () Bool)

(declare-datatypes ((V!8441 0))(
  ( (V!8442 (val!3342 Int)) )
))
(declare-datatypes ((ValueCell!2954 0))(
  ( (ValueCellFull!2954 (v!5437 V!8441)) (EmptyCell!2954) )
))
(declare-datatypes ((array!12535 0))(
  ( (array!12536 (arr!5936 (Array (_ BitVec 32) ValueCell!2954)) (size!6283 (_ BitVec 32))) )
))
(declare-datatypes ((array!12537 0))(
  ( (array!12538 (arr!5937 (Array (_ BitVec 32) (_ BitVec 64))) (size!6284 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3808 0))(
  ( (LongMapFixedSize!3809 (defaultEntry!4752 Int) (mask!11042 (_ BitVec 32)) (extraKeys!4489 (_ BitVec 32)) (zeroValue!4593 V!8441) (minValue!4593 V!8441) (_size!1953 (_ BitVec 32)) (_keys!6920 array!12537) (_values!4735 array!12535) (_vacant!1953 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3808)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!257519 (= e!166933 (not (validMask!0 (mask!11042 thiss!1504))))))

(declare-fun lt!129483 () array!12537)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12537 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!257519 (= (arrayCountValidKeys!0 lt!129483 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!7998 0))(
  ( (Unit!7999) )
))
(declare-fun lt!129494 () Unit!7998)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12537 (_ BitVec 32)) Unit!7998)

(assert (=> b!257519 (= lt!129494 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129483 index!297))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!257519 (arrayContainsKey!0 lt!129483 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129486 () Unit!7998)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12537 (_ BitVec 64) (_ BitVec 32)) Unit!7998)

(assert (=> b!257519 (= lt!129486 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129483 key!932 index!297))))

(declare-datatypes ((tuple2!4924 0))(
  ( (tuple2!4925 (_1!2473 (_ BitVec 64)) (_2!2473 V!8441)) )
))
(declare-datatypes ((List!3803 0))(
  ( (Nil!3800) (Cons!3799 (h!4461 tuple2!4924) (t!8864 List!3803)) )
))
(declare-datatypes ((ListLongMap!3837 0))(
  ( (ListLongMap!3838 (toList!1934 List!3803)) )
))
(declare-fun lt!129482 () ListLongMap!3837)

(declare-fun v!346 () V!8441)

(declare-fun +!688 (ListLongMap!3837 tuple2!4924) ListLongMap!3837)

(declare-fun getCurrentListMap!1462 (array!12537 array!12535 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 32) Int) ListLongMap!3837)

(assert (=> b!257519 (= (+!688 lt!129482 (tuple2!4925 key!932 v!346)) (getCurrentListMap!1462 lt!129483 (array!12536 (store (arr!5936 (_values!4735 thiss!1504)) index!297 (ValueCellFull!2954 v!346)) (size!6283 (_values!4735 thiss!1504))) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(declare-fun lt!129493 () Unit!7998)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!98 (array!12537 array!12535 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 32) (_ BitVec 64) V!8441 Int) Unit!7998)

(assert (=> b!257519 (= lt!129493 (lemmaAddValidKeyToArrayThenAddPairToListMap!98 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) index!297 key!932 v!346 (defaultEntry!4752 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12537 (_ BitVec 32)) Bool)

(assert (=> b!257519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129483 (mask!11042 thiss!1504))))

(declare-fun lt!129492 () Unit!7998)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12537 (_ BitVec 32) (_ BitVec 32)) Unit!7998)

(assert (=> b!257519 (= lt!129492 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6920 thiss!1504) index!297 (mask!11042 thiss!1504)))))

(assert (=> b!257519 (= (arrayCountValidKeys!0 lt!129483 #b00000000000000000000000000000000 (size!6284 (_keys!6920 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6920 thiss!1504) #b00000000000000000000000000000000 (size!6284 (_keys!6920 thiss!1504)))))))

(declare-fun lt!129491 () Unit!7998)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12537 (_ BitVec 32) (_ BitVec 64)) Unit!7998)

(assert (=> b!257519 (= lt!129491 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6920 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3804 0))(
  ( (Nil!3801) (Cons!3800 (h!4462 (_ BitVec 64)) (t!8865 List!3804)) )
))
(declare-fun arrayNoDuplicates!0 (array!12537 (_ BitVec 32) List!3804) Bool)

(assert (=> b!257519 (arrayNoDuplicates!0 lt!129483 #b00000000000000000000000000000000 Nil!3801)))

(assert (=> b!257519 (= lt!129483 (array!12538 (store (arr!5937 (_keys!6920 thiss!1504)) index!297 key!932) (size!6284 (_keys!6920 thiss!1504))))))

(declare-fun lt!129485 () Unit!7998)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12537 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3804) Unit!7998)

(assert (=> b!257519 (= lt!129485 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6920 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3801))))

(declare-fun lt!129484 () Unit!7998)

(declare-fun e!166938 () Unit!7998)

(assert (=> b!257519 (= lt!129484 e!166938)))

(declare-fun c!43582 () Bool)

(assert (=> b!257519 (= c!43582 (arrayContainsKey!0 (_keys!6920 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11229 () Bool)

(declare-fun mapRes!11229 () Bool)

(declare-fun tp!23507 () Bool)

(declare-fun e!166928 () Bool)

(assert (=> mapNonEmpty!11229 (= mapRes!11229 (and tp!23507 e!166928))))

(declare-fun mapRest!11229 () (Array (_ BitVec 32) ValueCell!2954))

(declare-fun mapValue!11229 () ValueCell!2954)

(declare-fun mapKey!11229 () (_ BitVec 32))

(assert (=> mapNonEmpty!11229 (= (arr!5936 (_values!4735 thiss!1504)) (store mapRest!11229 mapKey!11229 mapValue!11229))))

(declare-fun b!257520 () Bool)

(declare-fun e!166932 () Unit!7998)

(declare-fun Unit!8000 () Unit!7998)

(assert (=> b!257520 (= e!166932 Unit!8000)))

(declare-fun lt!129488 () Unit!7998)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!433 (array!12537 array!12535 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) Int) Unit!7998)

(assert (=> b!257520 (= lt!129488 (lemmaInListMapThenSeekEntryOrOpenFindsIt!433 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)))))

(assert (=> b!257520 false))

(declare-fun b!257521 () Bool)

(declare-fun e!166930 () Bool)

(declare-fun tp_is_empty!6595 () Bool)

(assert (=> b!257521 (= e!166930 tp_is_empty!6595)))

(declare-fun e!166925 () Bool)

(declare-fun e!166935 () Bool)

(declare-fun array_inv!3923 (array!12537) Bool)

(declare-fun array_inv!3924 (array!12535) Bool)

(assert (=> b!257522 (= e!166935 (and tp!23508 tp_is_empty!6595 (array_inv!3923 (_keys!6920 thiss!1504)) (array_inv!3924 (_values!4735 thiss!1504)) e!166925))))

(declare-fun b!257523 () Bool)

(declare-fun c!43581 () Bool)

(declare-datatypes ((SeekEntryResult!1170 0))(
  ( (MissingZero!1170 (index!6850 (_ BitVec 32))) (Found!1170 (index!6851 (_ BitVec 32))) (Intermediate!1170 (undefined!1982 Bool) (index!6852 (_ BitVec 32)) (x!25020 (_ BitVec 32))) (Undefined!1170) (MissingVacant!1170 (index!6853 (_ BitVec 32))) )
))
(declare-fun lt!129487 () SeekEntryResult!1170)

(assert (=> b!257523 (= c!43581 (is-MissingVacant!1170 lt!129487))))

(declare-fun e!166927 () Bool)

(declare-fun e!166926 () Bool)

(assert (=> b!257523 (= e!166927 e!166926)))

(declare-fun b!257524 () Bool)

(declare-fun Unit!8001 () Unit!7998)

(assert (=> b!257524 (= e!166938 Unit!8001)))

(declare-fun lt!129489 () Unit!7998)

(declare-fun lemmaArrayContainsKeyThenInListMap!240 (array!12537 array!12535 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) (_ BitVec 32) Int) Unit!7998)

(assert (=> b!257524 (= lt!129489 (lemmaArrayContainsKeyThenInListMap!240 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4752 thiss!1504)))))

(assert (=> b!257524 false))

(declare-fun b!257526 () Bool)

(declare-fun lt!129490 () Unit!7998)

(assert (=> b!257526 (= e!166932 lt!129490)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!436 (array!12537 array!12535 (_ BitVec 32) (_ BitVec 32) V!8441 V!8441 (_ BitVec 64) Int) Unit!7998)

(assert (=> b!257526 (= lt!129490 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!436 (_keys!6920 thiss!1504) (_values!4735 thiss!1504) (mask!11042 thiss!1504) (extraKeys!4489 thiss!1504) (zeroValue!4593 thiss!1504) (minValue!4593 thiss!1504) key!932 (defaultEntry!4752 thiss!1504)))))

(declare-fun c!43583 () Bool)

(assert (=> b!257526 (= c!43583 (is-MissingZero!1170 lt!129487))))

(assert (=> b!257526 e!166927))

(declare-fun b!257527 () Bool)

(declare-fun e!166929 () Bool)

(declare-fun e!166937 () Bool)

(assert (=> b!257527 (= e!166929 e!166937)))

(declare-fun res!125964 () Bool)

(assert (=> b!257527 (=> (not res!125964) (not e!166937))))

(assert (=> b!257527 (= res!125964 (or (= lt!129487 (MissingZero!1170 index!297)) (= lt!129487 (MissingVacant!1170 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12537 (_ BitVec 32)) SeekEntryResult!1170)

(assert (=> b!257527 (= lt!129487 (seekEntryOrOpen!0 key!932 (_keys!6920 thiss!1504) (mask!11042 thiss!1504)))))

(declare-fun b!257528 () Bool)

(assert (=> b!257528 (= e!166925 (and e!166930 mapRes!11229))))

(declare-fun condMapEmpty!11229 () Bool)

(declare-fun mapDefault!11229 () ValueCell!2954)

