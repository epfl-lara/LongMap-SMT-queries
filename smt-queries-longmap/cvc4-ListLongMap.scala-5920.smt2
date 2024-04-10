; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76880 () Bool)

(assert start!76880)

(declare-fun b!898896 () Bool)

(declare-fun b_free!16025 () Bool)

(declare-fun b_next!16025 () Bool)

(assert (=> b!898896 (= b_free!16025 (not b_next!16025))))

(declare-fun tp!56147 () Bool)

(declare-fun b_and!26325 () Bool)

(assert (=> b!898896 (= tp!56147 b_and!26325)))

(declare-fun b!898889 () Bool)

(declare-fun e!502899 () Bool)

(declare-fun e!502903 () Bool)

(assert (=> b!898889 (= e!502899 e!502903)))

(declare-fun res!607365 () Bool)

(assert (=> b!898889 (=> res!607365 e!502903)))

(declare-datatypes ((array!52746 0))(
  ( (array!52747 (arr!25349 (Array (_ BitVec 32) (_ BitVec 64))) (size!25805 (_ BitVec 32))) )
))
(declare-datatypes ((V!29435 0))(
  ( (V!29436 (val!9227 Int)) )
))
(declare-datatypes ((ValueCell!8695 0))(
  ( (ValueCellFull!8695 (v!11719 V!29435)) (EmptyCell!8695) )
))
(declare-datatypes ((array!52748 0))(
  ( (array!52749 (arr!25350 (Array (_ BitVec 32) ValueCell!8695)) (size!25806 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4406 0))(
  ( (LongMapFixedSize!4407 (defaultEntry!5421 Int) (mask!26162 (_ BitVec 32)) (extraKeys!5139 (_ BitVec 32)) (zeroValue!5243 V!29435) (minValue!5243 V!29435) (_size!2258 (_ BitVec 32)) (_keys!10202 array!52746) (_values!5430 array!52748) (_vacant!2258 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4406)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898889 (= res!607365 (not (validMask!0 (mask!26162 thiss!1181))))))

(declare-datatypes ((SeekEntryResult!8929 0))(
  ( (MissingZero!8929 (index!38087 (_ BitVec 32))) (Found!8929 (index!38088 (_ BitVec 32))) (Intermediate!8929 (undefined!9741 Bool) (index!38089 (_ BitVec 32)) (x!76602 (_ BitVec 32))) (Undefined!8929) (MissingVacant!8929 (index!38090 (_ BitVec 32))) )
))
(declare-fun lt!405869 () SeekEntryResult!8929)

(declare-datatypes ((tuple2!12040 0))(
  ( (tuple2!12041 (_1!6031 (_ BitVec 64)) (_2!6031 V!29435)) )
))
(declare-datatypes ((List!17844 0))(
  ( (Nil!17841) (Cons!17840 (h!18983 tuple2!12040) (t!25187 List!17844)) )
))
(declare-datatypes ((ListLongMap!10737 0))(
  ( (ListLongMap!10738 (toList!5384 List!17844)) )
))
(declare-fun contains!4415 (ListLongMap!10737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2658 (array!52746 array!52748 (_ BitVec 32) (_ BitVec 32) V!29435 V!29435 (_ BitVec 32) Int) ListLongMap!10737)

(assert (=> b!898889 (contains!4415 (getCurrentListMap!2658 (_keys!10202 thiss!1181) (_values!5430 thiss!1181) (mask!26162 thiss!1181) (extraKeys!5139 thiss!1181) (zeroValue!5243 thiss!1181) (minValue!5243 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5421 thiss!1181)) (select (arr!25349 (_keys!10202 thiss!1181)) (index!38088 lt!405869)))))

(declare-datatypes ((Unit!30550 0))(
  ( (Unit!30551) )
))
(declare-fun lt!405870 () Unit!30550)

(declare-fun lemmaValidKeyInArrayIsInListMap!247 (array!52746 array!52748 (_ BitVec 32) (_ BitVec 32) V!29435 V!29435 (_ BitVec 32) Int) Unit!30550)

(assert (=> b!898889 (= lt!405870 (lemmaValidKeyInArrayIsInListMap!247 (_keys!10202 thiss!1181) (_values!5430 thiss!1181) (mask!26162 thiss!1181) (extraKeys!5139 thiss!1181) (zeroValue!5243 thiss!1181) (minValue!5243 thiss!1181) (index!38088 lt!405869) (defaultEntry!5421 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898889 (arrayContainsKey!0 (_keys!10202 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405867 () Unit!30550)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52746 (_ BitVec 64) (_ BitVec 32)) Unit!30550)

(assert (=> b!898889 (= lt!405867 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10202 thiss!1181) key!785 (index!38088 lt!405869)))))

(declare-fun b!898890 () Bool)

(declare-fun e!502904 () Bool)

(assert (=> b!898890 (= e!502904 (not e!502899))))

(declare-fun res!607362 () Bool)

(assert (=> b!898890 (=> res!607362 e!502899)))

(assert (=> b!898890 (= res!607362 (not (is-Found!8929 lt!405869)))))

(declare-fun e!502905 () Bool)

(assert (=> b!898890 e!502905))

(declare-fun res!607364 () Bool)

(assert (=> b!898890 (=> res!607364 e!502905)))

(assert (=> b!898890 (= res!607364 (not (is-Found!8929 lt!405869)))))

(declare-fun lt!405868 () Unit!30550)

(declare-fun lemmaSeekEntryGivesInRangeIndex!94 (array!52746 array!52748 (_ BitVec 32) (_ BitVec 32) V!29435 V!29435 (_ BitVec 64)) Unit!30550)

(assert (=> b!898890 (= lt!405868 (lemmaSeekEntryGivesInRangeIndex!94 (_keys!10202 thiss!1181) (_values!5430 thiss!1181) (mask!26162 thiss!1181) (extraKeys!5139 thiss!1181) (zeroValue!5243 thiss!1181) (minValue!5243 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52746 (_ BitVec 32)) SeekEntryResult!8929)

(assert (=> b!898890 (= lt!405869 (seekEntry!0 key!785 (_keys!10202 thiss!1181) (mask!26162 thiss!1181)))))

(declare-fun b!898891 () Bool)

(declare-fun res!607363 () Bool)

(assert (=> b!898891 (=> (not res!607363) (not e!502904))))

(assert (=> b!898891 (= res!607363 (not (= key!785 (bvneg key!785))))))

(declare-fun b!898892 () Bool)

(declare-fun e!502901 () Bool)

(declare-fun e!502902 () Bool)

(declare-fun mapRes!29188 () Bool)

(assert (=> b!898892 (= e!502901 (and e!502902 mapRes!29188))))

(declare-fun condMapEmpty!29188 () Bool)

(declare-fun mapDefault!29188 () ValueCell!8695)

