; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16770 () Bool)

(assert start!16770)

(declare-fun b!168744 () Bool)

(declare-fun b_free!4075 () Bool)

(declare-fun b_next!4075 () Bool)

(assert (=> b!168744 (= b_free!4075 (not b_next!4075))))

(declare-fun tp!14826 () Bool)

(declare-fun b_and!10489 () Bool)

(assert (=> b!168744 (= tp!14826 b_and!10489)))

(declare-fun mapIsEmpty!6534 () Bool)

(declare-fun mapRes!6534 () Bool)

(assert (=> mapIsEmpty!6534 mapRes!6534))

(declare-fun b!168743 () Bool)

(declare-fun e!110982 () Bool)

(declare-fun tp_is_empty!3877 () Bool)

(assert (=> b!168743 (= e!110982 tp_is_empty!3877)))

(declare-fun e!110983 () Bool)

(declare-fun e!110989 () Bool)

(declare-datatypes ((V!4817 0))(
  ( (V!4818 (val!1983 Int)) )
))
(declare-datatypes ((ValueCell!1595 0))(
  ( (ValueCellFull!1595 (v!3848 V!4817)) (EmptyCell!1595) )
))
(declare-datatypes ((array!6851 0))(
  ( (array!6852 (arr!3261 (Array (_ BitVec 32) (_ BitVec 64))) (size!3549 (_ BitVec 32))) )
))
(declare-datatypes ((array!6853 0))(
  ( (array!6854 (arr!3262 (Array (_ BitVec 32) ValueCell!1595)) (size!3550 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2098 0))(
  ( (LongMapFixedSize!2099 (defaultEntry!3491 Int) (mask!8262 (_ BitVec 32)) (extraKeys!3232 (_ BitVec 32)) (zeroValue!3334 V!4817) (minValue!3334 V!4817) (_size!1098 (_ BitVec 32)) (_keys!5316 array!6851) (_values!3474 array!6853) (_vacant!1098 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2098)

(declare-fun array_inv!2099 (array!6851) Bool)

(declare-fun array_inv!2100 (array!6853) Bool)

(assert (=> b!168744 (= e!110983 (and tp!14826 tp_is_empty!3877 (array_inv!2099 (_keys!5316 thiss!1248)) (array_inv!2100 (_values!3474 thiss!1248)) e!110989))))

(declare-fun b!168745 () Bool)

(declare-fun e!110988 () Bool)

(declare-fun e!110984 () Bool)

(assert (=> b!168745 (= e!110988 e!110984)))

(declare-fun res!80331 () Bool)

(assert (=> b!168745 (=> (not res!80331) (not e!110984))))

(declare-datatypes ((SeekEntryResult!508 0))(
  ( (MissingZero!508 (index!4200 (_ BitVec 32))) (Found!508 (index!4201 (_ BitVec 32))) (Intermediate!508 (undefined!1320 Bool) (index!4202 (_ BitVec 32)) (x!18648 (_ BitVec 32))) (Undefined!508) (MissingVacant!508 (index!4203 (_ BitVec 32))) )
))
(declare-fun lt!84456 () SeekEntryResult!508)

(assert (=> b!168745 (= res!80331 (and (not (is-Undefined!508 lt!84456)) (not (is-MissingVacant!508 lt!84456)) (not (is-MissingZero!508 lt!84456)) (is-Found!508 lt!84456)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6851 (_ BitVec 32)) SeekEntryResult!508)

(assert (=> b!168745 (= lt!84456 (seekEntryOrOpen!0 key!828 (_keys!5316 thiss!1248) (mask!8262 thiss!1248)))))

(declare-fun b!168746 () Bool)

(declare-fun e!110990 () Bool)

(assert (=> b!168746 (= e!110990 (= (select (arr!3261 (_keys!5316 thiss!1248)) (index!4201 lt!84456)) key!828))))

(declare-fun mapNonEmpty!6534 () Bool)

(declare-fun tp!14825 () Bool)

(assert (=> mapNonEmpty!6534 (= mapRes!6534 (and tp!14825 e!110982))))

(declare-fun mapValue!6534 () ValueCell!1595)

(declare-fun mapRest!6534 () (Array (_ BitVec 32) ValueCell!1595))

(declare-fun mapKey!6534 () (_ BitVec 32))

(assert (=> mapNonEmpty!6534 (= (arr!3262 (_values!3474 thiss!1248)) (store mapRest!6534 mapKey!6534 mapValue!6534))))

(declare-fun res!80328 () Bool)

(assert (=> start!16770 (=> (not res!80328) (not e!110988))))

(declare-fun valid!908 (LongMapFixedSize!2098) Bool)

(assert (=> start!16770 (= res!80328 (valid!908 thiss!1248))))

(assert (=> start!16770 e!110988))

(assert (=> start!16770 e!110983))

(assert (=> start!16770 true))

(assert (=> start!16770 tp_is_empty!3877))

(declare-fun b!168747 () Bool)

(declare-fun res!80327 () Bool)

(assert (=> b!168747 (=> (not res!80327) (not e!110988))))

(assert (=> b!168747 (= res!80327 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168748 () Bool)

(declare-fun e!110981 () Bool)

(assert (=> b!168748 (= e!110984 (not e!110981))))

(declare-fun res!80329 () Bool)

(assert (=> b!168748 (=> res!80329 e!110981)))

(declare-fun lt!84457 () LongMapFixedSize!2098)

(assert (=> b!168748 (= res!80329 (not (valid!908 lt!84457)))))

(declare-datatypes ((tuple2!3178 0))(
  ( (tuple2!3179 (_1!1600 (_ BitVec 64)) (_2!1600 V!4817)) )
))
(declare-datatypes ((List!2170 0))(
  ( (Nil!2167) (Cons!2166 (h!2783 tuple2!3178) (t!6972 List!2170)) )
))
(declare-datatypes ((ListLongMap!2133 0))(
  ( (ListLongMap!2134 (toList!1082 List!2170)) )
))
(declare-fun lt!84452 () ListLongMap!2133)

(declare-fun contains!1124 (ListLongMap!2133 (_ BitVec 64)) Bool)

(assert (=> b!168748 (contains!1124 lt!84452 (select (arr!3261 (_keys!5316 thiss!1248)) (index!4201 lt!84456)))))

(declare-fun lt!84458 () array!6853)

(declare-datatypes ((Unit!5204 0))(
  ( (Unit!5205) )
))
(declare-fun lt!84461 () Unit!5204)

(declare-fun lemmaValidKeyInArrayIsInListMap!135 (array!6851 array!6853 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 32) Int) Unit!5204)

(assert (=> b!168748 (= lt!84461 (lemmaValidKeyInArrayIsInListMap!135 (_keys!5316 thiss!1248) lt!84458 (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) (index!4201 lt!84456) (defaultEntry!3491 thiss!1248)))))

(assert (=> b!168748 (= lt!84457 (LongMapFixedSize!2099 (defaultEntry!3491 thiss!1248) (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) (_size!1098 thiss!1248) (_keys!5316 thiss!1248) lt!84458 (_vacant!1098 thiss!1248)))))

(declare-fun lt!84463 () ListLongMap!2133)

(assert (=> b!168748 (= lt!84463 lt!84452)))

(declare-fun getCurrentListMap!740 (array!6851 array!6853 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 32) Int) ListLongMap!2133)

(assert (=> b!168748 (= lt!84452 (getCurrentListMap!740 (_keys!5316 thiss!1248) lt!84458 (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3491 thiss!1248)))))

(declare-fun v!309 () V!4817)

(declare-fun lt!84460 () ListLongMap!2133)

(declare-fun +!234 (ListLongMap!2133 tuple2!3178) ListLongMap!2133)

(assert (=> b!168748 (= lt!84463 (+!234 lt!84460 (tuple2!3179 key!828 v!309)))))

(assert (=> b!168748 (= lt!84458 (array!6854 (store (arr!3262 (_values!3474 thiss!1248)) (index!4201 lt!84456) (ValueCellFull!1595 v!309)) (size!3550 (_values!3474 thiss!1248))))))

(declare-fun lt!84459 () Unit!5204)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!89 (array!6851 array!6853 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 32) (_ BitVec 64) V!4817 Int) Unit!5204)

(assert (=> b!168748 (= lt!84459 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!89 (_keys!5316 thiss!1248) (_values!3474 thiss!1248) (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) (index!4201 lt!84456) key!828 v!309 (defaultEntry!3491 thiss!1248)))))

(declare-fun lt!84462 () Unit!5204)

(declare-fun e!110987 () Unit!5204)

(assert (=> b!168748 (= lt!84462 e!110987)))

(declare-fun c!30394 () Bool)

(assert (=> b!168748 (= c!30394 (contains!1124 lt!84460 key!828))))

(assert (=> b!168748 (= lt!84460 (getCurrentListMap!740 (_keys!5316 thiss!1248) (_values!3474 thiss!1248) (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3491 thiss!1248)))))

(declare-fun b!168749 () Bool)

(declare-fun Unit!5206 () Unit!5204)

(assert (=> b!168749 (= e!110987 Unit!5206)))

(declare-fun lt!84455 () Unit!5204)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!129 (array!6851 array!6853 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 64) Int) Unit!5204)

(assert (=> b!168749 (= lt!84455 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!129 (_keys!5316 thiss!1248) (_values!3474 thiss!1248) (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) key!828 (defaultEntry!3491 thiss!1248)))))

(assert (=> b!168749 false))

(declare-fun b!168750 () Bool)

(assert (=> b!168750 (= e!110981 true)))

(declare-fun lt!84454 () Bool)

(declare-fun map!1800 (LongMapFixedSize!2098) ListLongMap!2133)

(assert (=> b!168750 (= lt!84454 (contains!1124 (map!1800 lt!84457) key!828))))

(declare-fun b!168751 () Bool)

(declare-fun lt!84453 () Unit!5204)

(assert (=> b!168751 (= e!110987 lt!84453)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!128 (array!6851 array!6853 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 64) Int) Unit!5204)

(assert (=> b!168751 (= lt!84453 (lemmaInListMapThenSeekEntryOrOpenFindsIt!128 (_keys!5316 thiss!1248) (_values!3474 thiss!1248) (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) key!828 (defaultEntry!3491 thiss!1248)))))

(declare-fun res!80330 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168751 (= res!80330 (inRange!0 (index!4201 lt!84456) (mask!8262 thiss!1248)))))

(assert (=> b!168751 (=> (not res!80330) (not e!110990))))

(assert (=> b!168751 e!110990))

(declare-fun b!168752 () Bool)

(declare-fun e!110986 () Bool)

(assert (=> b!168752 (= e!110986 tp_is_empty!3877)))

(declare-fun b!168753 () Bool)

(assert (=> b!168753 (= e!110989 (and e!110986 mapRes!6534))))

(declare-fun condMapEmpty!6534 () Bool)

(declare-fun mapDefault!6534 () ValueCell!1595)

