; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76774 () Bool)

(assert start!76774)

(declare-fun b!898242 () Bool)

(declare-fun b_free!16009 () Bool)

(declare-fun b_next!16009 () Bool)

(assert (=> b!898242 (= b_free!16009 (not b_next!16009))))

(declare-fun tp!56093 () Bool)

(declare-fun b_and!26301 () Bool)

(assert (=> b!898242 (= tp!56093 b_and!26301)))

(declare-fun mapIsEmpty!29157 () Bool)

(declare-fun mapRes!29157 () Bool)

(assert (=> mapIsEmpty!29157 mapRes!29157))

(declare-fun b!898237 () Bool)

(declare-fun e!502422 () Bool)

(declare-datatypes ((array!52710 0))(
  ( (array!52711 (arr!25333 (Array (_ BitVec 32) (_ BitVec 64))) (size!25788 (_ BitVec 32))) )
))
(declare-datatypes ((V!29415 0))(
  ( (V!29416 (val!9219 Int)) )
))
(declare-datatypes ((ValueCell!8687 0))(
  ( (ValueCellFull!8687 (v!11709 V!29415)) (EmptyCell!8687) )
))
(declare-datatypes ((array!52712 0))(
  ( (array!52713 (arr!25334 (Array (_ BitVec 32) ValueCell!8687)) (size!25789 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4390 0))(
  ( (LongMapFixedSize!4391 (defaultEntry!5407 Int) (mask!26131 (_ BitVec 32)) (extraKeys!5122 (_ BitVec 32)) (zeroValue!5226 V!29415) (minValue!5226 V!29415) (_size!2250 (_ BitVec 32)) (_keys!10180 array!52710) (_values!5413 array!52712) (_vacant!2250 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4390)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898237 (= e!502422 (validMask!0 (mask!26131 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8922 0))(
  ( (MissingZero!8922 (index!38059 (_ BitVec 32))) (Found!8922 (index!38060 (_ BitVec 32))) (Intermediate!8922 (undefined!9734 Bool) (index!38061 (_ BitVec 32)) (x!76551 (_ BitVec 32))) (Undefined!8922) (MissingVacant!8922 (index!38062 (_ BitVec 32))) )
))
(declare-fun lt!405454 () SeekEntryResult!8922)

(declare-datatypes ((tuple2!12030 0))(
  ( (tuple2!12031 (_1!6026 (_ BitVec 64)) (_2!6026 V!29415)) )
))
(declare-datatypes ((List!17837 0))(
  ( (Nil!17834) (Cons!17833 (h!18975 tuple2!12030) (t!25176 List!17837)) )
))
(declare-datatypes ((ListLongMap!10727 0))(
  ( (ListLongMap!10728 (toList!5379 List!17837)) )
))
(declare-fun contains!4408 (ListLongMap!10727 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2653 (array!52710 array!52712 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 32) Int) ListLongMap!10727)

(assert (=> b!898237 (contains!4408 (getCurrentListMap!2653 (_keys!10180 thiss!1181) (_values!5413 thiss!1181) (mask!26131 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)) (select (arr!25333 (_keys!10180 thiss!1181)) (index!38060 lt!405454)))))

(declare-datatypes ((Unit!30532 0))(
  ( (Unit!30533) )
))
(declare-fun lt!405457 () Unit!30532)

(declare-fun lemmaValidKeyInArrayIsInListMap!242 (array!52710 array!52712 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 32) Int) Unit!30532)

(assert (=> b!898237 (= lt!405457 (lemmaValidKeyInArrayIsInListMap!242 (_keys!10180 thiss!1181) (_values!5413 thiss!1181) (mask!26131 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) (index!38060 lt!405454) (defaultEntry!5407 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898237 (arrayContainsKey!0 (_keys!10180 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405456 () Unit!30532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52710 (_ BitVec 64) (_ BitVec 32)) Unit!30532)

(assert (=> b!898237 (= lt!405456 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10180 thiss!1181) key!785 (index!38060 lt!405454)))))

(declare-fun b!898239 () Bool)

(declare-fun e!502423 () Bool)

(declare-fun tp_is_empty!18337 () Bool)

(assert (=> b!898239 (= e!502423 tp_is_empty!18337)))

(declare-fun b!898240 () Bool)

(declare-fun e!502420 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898240 (= e!502420 (inRange!0 (index!38060 lt!405454) (mask!26131 thiss!1181)))))

(declare-fun b!898241 () Bool)

(declare-fun e!502419 () Bool)

(assert (=> b!898241 (= e!502419 (and e!502423 mapRes!29157))))

(declare-fun condMapEmpty!29157 () Bool)

(declare-fun mapDefault!29157 () ValueCell!8687)

