; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16776 () Bool)

(assert start!16776)

(declare-fun b!168852 () Bool)

(declare-fun b_free!4081 () Bool)

(declare-fun b_next!4081 () Bool)

(assert (=> b!168852 (= b_free!4081 (not b_next!4081))))

(declare-fun tp!14843 () Bool)

(declare-fun b_and!10495 () Bool)

(assert (=> b!168852 (= tp!14843 b_and!10495)))

(declare-fun b!168842 () Bool)

(declare-fun res!80372 () Bool)

(declare-fun e!111074 () Bool)

(assert (=> b!168842 (=> (not res!80372) (not e!111074))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!168842 (= res!80372 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168843 () Bool)

(declare-fun e!111071 () Bool)

(declare-fun tp_is_empty!3883 () Bool)

(assert (=> b!168843 (= e!111071 tp_is_empty!3883)))

(declare-fun b!168844 () Bool)

(declare-fun e!111076 () Bool)

(declare-fun e!111080 () Bool)

(assert (=> b!168844 (= e!111076 (not e!111080))))

(declare-fun res!80376 () Bool)

(assert (=> b!168844 (=> res!80376 e!111080)))

(declare-datatypes ((V!4825 0))(
  ( (V!4826 (val!1986 Int)) )
))
(declare-datatypes ((ValueCell!1598 0))(
  ( (ValueCellFull!1598 (v!3851 V!4825)) (EmptyCell!1598) )
))
(declare-datatypes ((array!6863 0))(
  ( (array!6864 (arr!3267 (Array (_ BitVec 32) (_ BitVec 64))) (size!3555 (_ BitVec 32))) )
))
(declare-datatypes ((array!6865 0))(
  ( (array!6866 (arr!3268 (Array (_ BitVec 32) ValueCell!1598)) (size!3556 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2104 0))(
  ( (LongMapFixedSize!2105 (defaultEntry!3494 Int) (mask!8267 (_ BitVec 32)) (extraKeys!3235 (_ BitVec 32)) (zeroValue!3337 V!4825) (minValue!3337 V!4825) (_size!1101 (_ BitVec 32)) (_keys!5319 array!6863) (_values!3477 array!6865) (_vacant!1101 (_ BitVec 32))) )
))
(declare-fun lt!84565 () LongMapFixedSize!2104)

(declare-fun valid!911 (LongMapFixedSize!2104) Bool)

(assert (=> b!168844 (= res!80376 (not (valid!911 lt!84565)))))

(declare-datatypes ((tuple2!3184 0))(
  ( (tuple2!3185 (_1!1603 (_ BitVec 64)) (_2!1603 V!4825)) )
))
(declare-datatypes ((List!2173 0))(
  ( (Nil!2170) (Cons!2169 (h!2786 tuple2!3184) (t!6975 List!2173)) )
))
(declare-datatypes ((ListLongMap!2139 0))(
  ( (ListLongMap!2140 (toList!1085 List!2173)) )
))
(declare-fun lt!84562 () ListLongMap!2139)

(declare-fun thiss!1248 () LongMapFixedSize!2104)

(declare-datatypes ((SeekEntryResult!511 0))(
  ( (MissingZero!511 (index!4212 (_ BitVec 32))) (Found!511 (index!4213 (_ BitVec 32))) (Intermediate!511 (undefined!1323 Bool) (index!4214 (_ BitVec 32)) (x!18659 (_ BitVec 32))) (Undefined!511) (MissingVacant!511 (index!4215 (_ BitVec 32))) )
))
(declare-fun lt!84568 () SeekEntryResult!511)

(declare-fun contains!1127 (ListLongMap!2139 (_ BitVec 64)) Bool)

(assert (=> b!168844 (contains!1127 lt!84562 (select (arr!3267 (_keys!5319 thiss!1248)) (index!4213 lt!84568)))))

(declare-fun lt!84570 () array!6865)

(declare-datatypes ((Unit!5212 0))(
  ( (Unit!5213) )
))
(declare-fun lt!84560 () Unit!5212)

(declare-fun lemmaValidKeyInArrayIsInListMap!138 (array!6863 array!6865 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 32) Int) Unit!5212)

(assert (=> b!168844 (= lt!84560 (lemmaValidKeyInArrayIsInListMap!138 (_keys!5319 thiss!1248) lt!84570 (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) (index!4213 lt!84568) (defaultEntry!3494 thiss!1248)))))

(assert (=> b!168844 (= lt!84565 (LongMapFixedSize!2105 (defaultEntry!3494 thiss!1248) (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) (_size!1101 thiss!1248) (_keys!5319 thiss!1248) lt!84570 (_vacant!1101 thiss!1248)))))

(declare-fun lt!84561 () ListLongMap!2139)

(assert (=> b!168844 (= lt!84561 lt!84562)))

(declare-fun getCurrentListMap!743 (array!6863 array!6865 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 32) Int) ListLongMap!2139)

(assert (=> b!168844 (= lt!84562 (getCurrentListMap!743 (_keys!5319 thiss!1248) lt!84570 (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3494 thiss!1248)))))

(declare-fun v!309 () V!4825)

(declare-fun lt!84567 () ListLongMap!2139)

(declare-fun +!237 (ListLongMap!2139 tuple2!3184) ListLongMap!2139)

(assert (=> b!168844 (= lt!84561 (+!237 lt!84567 (tuple2!3185 key!828 v!309)))))

(assert (=> b!168844 (= lt!84570 (array!6866 (store (arr!3268 (_values!3477 thiss!1248)) (index!4213 lt!84568) (ValueCellFull!1598 v!309)) (size!3556 (_values!3477 thiss!1248))))))

(declare-fun lt!84564 () Unit!5212)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!92 (array!6863 array!6865 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 32) (_ BitVec 64) V!4825 Int) Unit!5212)

(assert (=> b!168844 (= lt!84564 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!92 (_keys!5319 thiss!1248) (_values!3477 thiss!1248) (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) (index!4213 lt!84568) key!828 v!309 (defaultEntry!3494 thiss!1248)))))

(declare-fun lt!84566 () Unit!5212)

(declare-fun e!111077 () Unit!5212)

(assert (=> b!168844 (= lt!84566 e!111077)))

(declare-fun c!30403 () Bool)

(assert (=> b!168844 (= c!30403 (contains!1127 lt!84567 key!828))))

(assert (=> b!168844 (= lt!84567 (getCurrentListMap!743 (_keys!5319 thiss!1248) (_values!3477 thiss!1248) (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3494 thiss!1248)))))

(declare-fun b!168845 () Bool)

(assert (=> b!168845 (= e!111080 true)))

(declare-fun lt!84569 () Bool)

(declare-fun map!1805 (LongMapFixedSize!2104) ListLongMap!2139)

(assert (=> b!168845 (= lt!84569 (contains!1127 (map!1805 lt!84565) key!828))))

(declare-fun mapNonEmpty!6543 () Bool)

(declare-fun mapRes!6543 () Bool)

(declare-fun tp!14844 () Bool)

(declare-fun e!111079 () Bool)

(assert (=> mapNonEmpty!6543 (= mapRes!6543 (and tp!14844 e!111079))))

(declare-fun mapKey!6543 () (_ BitVec 32))

(declare-fun mapValue!6543 () ValueCell!1598)

(declare-fun mapRest!6543 () (Array (_ BitVec 32) ValueCell!1598))

(assert (=> mapNonEmpty!6543 (= (arr!3268 (_values!3477 thiss!1248)) (store mapRest!6543 mapKey!6543 mapValue!6543))))

(declare-fun b!168846 () Bool)

(declare-fun Unit!5214 () Unit!5212)

(assert (=> b!168846 (= e!111077 Unit!5214)))

(declare-fun lt!84571 () Unit!5212)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!131 (array!6863 array!6865 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 64) Int) Unit!5212)

(assert (=> b!168846 (= lt!84571 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!131 (_keys!5319 thiss!1248) (_values!3477 thiss!1248) (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) key!828 (defaultEntry!3494 thiss!1248)))))

(assert (=> b!168846 false))

(declare-fun b!168848 () Bool)

(assert (=> b!168848 (= e!111079 tp_is_empty!3883)))

(declare-fun b!168849 () Bool)

(assert (=> b!168849 (= e!111074 e!111076)))

(declare-fun res!80375 () Bool)

(assert (=> b!168849 (=> (not res!80375) (not e!111076))))

(assert (=> b!168849 (= res!80375 (and (not (is-Undefined!511 lt!84568)) (not (is-MissingVacant!511 lt!84568)) (not (is-MissingZero!511 lt!84568)) (is-Found!511 lt!84568)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6863 (_ BitVec 32)) SeekEntryResult!511)

(assert (=> b!168849 (= lt!84568 (seekEntryOrOpen!0 key!828 (_keys!5319 thiss!1248) (mask!8267 thiss!1248)))))

(declare-fun b!168850 () Bool)

(declare-fun e!111073 () Bool)

(assert (=> b!168850 (= e!111073 (and e!111071 mapRes!6543))))

(declare-fun condMapEmpty!6543 () Bool)

(declare-fun mapDefault!6543 () ValueCell!1598)

