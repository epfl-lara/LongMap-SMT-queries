; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77122 () Bool)

(assert start!77122)

(declare-fun b!900256 () Bool)

(declare-fun b_free!16045 () Bool)

(declare-fun b_next!16045 () Bool)

(assert (=> b!900256 (= b_free!16045 (not b_next!16045))))

(declare-fun tp!56222 () Bool)

(declare-fun b_and!26365 () Bool)

(assert (=> b!900256 (= tp!56222 b_and!26365)))

(declare-fun b!900249 () Bool)

(declare-fun res!607987 () Bool)

(declare-fun e!503830 () Bool)

(assert (=> b!900249 (=> res!607987 e!503830)))

(declare-datatypes ((array!52794 0))(
  ( (array!52795 (arr!25369 (Array (_ BitVec 32) (_ BitVec 64))) (size!25828 (_ BitVec 32))) )
))
(declare-datatypes ((V!29463 0))(
  ( (V!29464 (val!9237 Int)) )
))
(declare-datatypes ((ValueCell!8705 0))(
  ( (ValueCellFull!8705 (v!11733 V!29463)) (EmptyCell!8705) )
))
(declare-datatypes ((array!52796 0))(
  ( (array!52797 (arr!25370 (Array (_ BitVec 32) ValueCell!8705)) (size!25829 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4426 0))(
  ( (LongMapFixedSize!4427 (defaultEntry!5445 Int) (mask!26225 (_ BitVec 32)) (extraKeys!5170 (_ BitVec 32)) (zeroValue!5274 V!29463) (minValue!5274 V!29463) (_size!2268 (_ BitVec 32)) (_keys!10246 array!52794) (_values!5461 array!52796) (_vacant!2268 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4426)

(assert (=> b!900249 (= res!607987 (or (not (= (size!25829 (_values!5461 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26225 thiss!1181)))) (not (= (size!25828 (_keys!10246 thiss!1181)) (size!25829 (_values!5461 thiss!1181)))) (bvslt (mask!26225 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5170 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5170 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!900250 () Bool)

(declare-fun e!503838 () Bool)

(declare-fun e!503831 () Bool)

(assert (=> b!900250 (= e!503838 (not e!503831))))

(declare-fun res!607986 () Bool)

(assert (=> b!900250 (=> res!607986 e!503831)))

(declare-datatypes ((SeekEntryResult!8936 0))(
  ( (MissingZero!8936 (index!38115 (_ BitVec 32))) (Found!8936 (index!38116 (_ BitVec 32))) (Intermediate!8936 (undefined!9748 Bool) (index!38117 (_ BitVec 32)) (x!76705 (_ BitVec 32))) (Undefined!8936) (MissingVacant!8936 (index!38118 (_ BitVec 32))) )
))
(declare-fun lt!406734 () SeekEntryResult!8936)

(assert (=> b!900250 (= res!607986 (not (is-Found!8936 lt!406734)))))

(declare-fun e!503834 () Bool)

(assert (=> b!900250 e!503834))

(declare-fun res!607985 () Bool)

(assert (=> b!900250 (=> res!607985 e!503834)))

(assert (=> b!900250 (= res!607985 (not (is-Found!8936 lt!406734)))))

(declare-datatypes ((Unit!30584 0))(
  ( (Unit!30585) )
))
(declare-fun lt!406736 () Unit!30584)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!100 (array!52794 array!52796 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 64)) Unit!30584)

(assert (=> b!900250 (= lt!406736 (lemmaSeekEntryGivesInRangeIndex!100 (_keys!10246 thiss!1181) (_values!5461 thiss!1181) (mask!26225 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52794 (_ BitVec 32)) SeekEntryResult!8936)

(assert (=> b!900250 (= lt!406734 (seekEntry!0 key!785 (_keys!10246 thiss!1181) (mask!26225 thiss!1181)))))

(declare-fun b!900251 () Bool)

(declare-fun e!503835 () Bool)

(declare-fun e!503836 () Bool)

(declare-fun mapRes!29233 () Bool)

(assert (=> b!900251 (= e!503835 (and e!503836 mapRes!29233))))

(declare-fun condMapEmpty!29233 () Bool)

(declare-fun mapDefault!29233 () ValueCell!8705)

