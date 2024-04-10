; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18908 () Bool)

(assert start!18908)

(declare-fun b!186681 () Bool)

(declare-fun b_free!4601 () Bool)

(declare-fun b_next!4601 () Bool)

(assert (=> b!186681 (= b_free!4601 (not b_next!4601))))

(declare-fun tp!16609 () Bool)

(declare-fun b_and!11211 () Bool)

(assert (=> b!186681 (= tp!16609 b_and!11211)))

(declare-fun res!88296 () Bool)

(declare-fun e!122870 () Bool)

(assert (=> start!18908 (=> (not res!88296) (not e!122870))))

(declare-datatypes ((V!5477 0))(
  ( (V!5478 (val!2231 Int)) )
))
(declare-datatypes ((ValueCell!1843 0))(
  ( (ValueCellFull!1843 (v!4144 V!5477)) (EmptyCell!1843) )
))
(declare-datatypes ((array!7959 0))(
  ( (array!7960 (arr!3757 (Array (_ BitVec 32) (_ BitVec 64))) (size!4074 (_ BitVec 32))) )
))
(declare-datatypes ((array!7961 0))(
  ( (array!7962 (arr!3758 (Array (_ BitVec 32) ValueCell!1843)) (size!4075 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2594 0))(
  ( (LongMapFixedSize!2595 (defaultEntry!3808 Int) (mask!8939 (_ BitVec 32)) (extraKeys!3545 (_ BitVec 32)) (zeroValue!3649 V!5477) (minValue!3649 V!5477) (_size!1346 (_ BitVec 32)) (_keys!5754 array!7959) (_values!3791 array!7961) (_vacant!1346 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2594)

(declare-fun valid!1068 (LongMapFixedSize!2594) Bool)

(assert (=> start!18908 (= res!88296 (valid!1068 thiss!1248))))

(assert (=> start!18908 e!122870))

(declare-fun e!122873 () Bool)

(assert (=> start!18908 e!122873))

(assert (=> start!18908 true))

(declare-fun b!186674 () Bool)

(declare-fun e!122866 () Bool)

(declare-fun tp_is_empty!4373 () Bool)

(assert (=> b!186674 (= e!122866 tp_is_empty!4373)))

(declare-fun b!186675 () Bool)

(declare-datatypes ((Unit!5624 0))(
  ( (Unit!5625) )
))
(declare-fun e!122874 () Unit!5624)

(declare-fun Unit!5626 () Unit!5624)

(assert (=> b!186675 (= e!122874 Unit!5626)))

(declare-fun lt!92306 () Unit!5624)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!149 (array!7959 array!7961 (_ BitVec 32) (_ BitVec 32) V!5477 V!5477 (_ BitVec 64) Int) Unit!5624)

(assert (=> b!186675 (= lt!92306 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!149 (_keys!5754 thiss!1248) (_values!3791 thiss!1248) (mask!8939 thiss!1248) (extraKeys!3545 thiss!1248) (zeroValue!3649 thiss!1248) (minValue!3649 thiss!1248) key!828 (defaultEntry!3808 thiss!1248)))))

(assert (=> b!186675 false))

(declare-fun b!186676 () Bool)

(declare-fun e!122865 () Bool)

(declare-fun e!122869 () Bool)

(assert (=> b!186676 (= e!122865 e!122869)))

(declare-fun res!88297 () Bool)

(assert (=> b!186676 (=> (not res!88297) (not e!122869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!186676 (= res!88297 (validMask!0 (mask!8939 thiss!1248)))))

(declare-fun lt!92308 () Unit!5624)

(assert (=> b!186676 (= lt!92308 e!122874)))

(declare-fun c!33482 () Bool)

(declare-datatypes ((tuple2!3472 0))(
  ( (tuple2!3473 (_1!1747 (_ BitVec 64)) (_2!1747 V!5477)) )
))
(declare-datatypes ((List!2377 0))(
  ( (Nil!2374) (Cons!2373 (h!3007 tuple2!3472) (t!7265 List!2377)) )
))
(declare-datatypes ((ListLongMap!2389 0))(
  ( (ListLongMap!2390 (toList!1210 List!2377)) )
))
(declare-fun contains!1308 (ListLongMap!2389 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!858 (array!7959 array!7961 (_ BitVec 32) (_ BitVec 32) V!5477 V!5477 (_ BitVec 32) Int) ListLongMap!2389)

(assert (=> b!186676 (= c!33482 (contains!1308 (getCurrentListMap!858 (_keys!5754 thiss!1248) (_values!3791 thiss!1248) (mask!8939 thiss!1248) (extraKeys!3545 thiss!1248) (zeroValue!3649 thiss!1248) (minValue!3649 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3808 thiss!1248)) key!828))))

(declare-fun b!186677 () Bool)

(assert (=> b!186677 (= e!122869 (and (= (size!4075 (_values!3791 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8939 thiss!1248))) (not (= (size!4074 (_keys!5754 thiss!1248)) (size!4075 (_values!3791 thiss!1248))))))))

(declare-fun b!186678 () Bool)

(declare-fun lt!92309 () Unit!5624)

(assert (=> b!186678 (= e!122874 lt!92309)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!147 (array!7959 array!7961 (_ BitVec 32) (_ BitVec 32) V!5477 V!5477 (_ BitVec 64) Int) Unit!5624)

(assert (=> b!186678 (= lt!92309 (lemmaInListMapThenSeekEntryOrOpenFindsIt!147 (_keys!5754 thiss!1248) (_values!3791 thiss!1248) (mask!8939 thiss!1248) (extraKeys!3545 thiss!1248) (zeroValue!3649 thiss!1248) (minValue!3649 thiss!1248) key!828 (defaultEntry!3808 thiss!1248)))))

(declare-fun res!88293 () Bool)

(declare-datatypes ((SeekEntryResult!645 0))(
  ( (MissingZero!645 (index!4750 (_ BitVec 32))) (Found!645 (index!4751 (_ BitVec 32))) (Intermediate!645 (undefined!1457 Bool) (index!4752 (_ BitVec 32)) (x!20235 (_ BitVec 32))) (Undefined!645) (MissingVacant!645 (index!4753 (_ BitVec 32))) )
))
(declare-fun lt!92307 () SeekEntryResult!645)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186678 (= res!88293 (inRange!0 (index!4751 lt!92307) (mask!8939 thiss!1248)))))

(declare-fun e!122868 () Bool)

(assert (=> b!186678 (=> (not res!88293) (not e!122868))))

(assert (=> b!186678 e!122868))

(declare-fun b!186679 () Bool)

(declare-fun res!88294 () Bool)

(assert (=> b!186679 (=> (not res!88294) (not e!122870))))

(assert (=> b!186679 (= res!88294 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7528 () Bool)

(declare-fun mapRes!7528 () Bool)

(assert (=> mapIsEmpty!7528 mapRes!7528))

(declare-fun mapNonEmpty!7528 () Bool)

(declare-fun tp!16608 () Bool)

(declare-fun e!122871 () Bool)

(assert (=> mapNonEmpty!7528 (= mapRes!7528 (and tp!16608 e!122871))))

(declare-fun mapRest!7528 () (Array (_ BitVec 32) ValueCell!1843))

(declare-fun mapKey!7528 () (_ BitVec 32))

(declare-fun mapValue!7528 () ValueCell!1843)

(assert (=> mapNonEmpty!7528 (= (arr!3758 (_values!3791 thiss!1248)) (store mapRest!7528 mapKey!7528 mapValue!7528))))

(declare-fun b!186680 () Bool)

(assert (=> b!186680 (= e!122868 (= (select (arr!3757 (_keys!5754 thiss!1248)) (index!4751 lt!92307)) key!828))))

(declare-fun e!122872 () Bool)

(declare-fun array_inv!2429 (array!7959) Bool)

(declare-fun array_inv!2430 (array!7961) Bool)

(assert (=> b!186681 (= e!122873 (and tp!16609 tp_is_empty!4373 (array_inv!2429 (_keys!5754 thiss!1248)) (array_inv!2430 (_values!3791 thiss!1248)) e!122872))))

(declare-fun b!186682 () Bool)

(assert (=> b!186682 (= e!122872 (and e!122866 mapRes!7528))))

(declare-fun condMapEmpty!7528 () Bool)

(declare-fun mapDefault!7528 () ValueCell!1843)

