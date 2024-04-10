; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77226 () Bool)

(assert start!77226)

(declare-fun b!901067 () Bool)

(declare-fun b_free!16067 () Bool)

(declare-fun b_next!16067 () Bool)

(assert (=> b!901067 (= b_free!16067 (not b_next!16067))))

(declare-fun tp!56298 () Bool)

(declare-fun b_and!26393 () Bool)

(assert (=> b!901067 (= tp!56298 b_and!26393)))

(declare-fun b!901061 () Bool)

(declare-fun res!608425 () Bool)

(declare-fun e!504408 () Bool)

(assert (=> b!901061 (=> res!608425 e!504408)))

(declare-datatypes ((V!29491 0))(
  ( (V!29492 (val!9248 Int)) )
))
(declare-datatypes ((tuple2!12062 0))(
  ( (tuple2!12063 (_1!6042 (_ BitVec 64)) (_2!6042 V!29491)) )
))
(declare-datatypes ((List!17867 0))(
  ( (Nil!17864) (Cons!17863 (h!19009 tuple2!12062) (t!25224 List!17867)) )
))
(declare-datatypes ((ListLongMap!10759 0))(
  ( (ListLongMap!10760 (toList!5395 List!17867)) )
))
(declare-fun lt!407223 () ListLongMap!10759)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4434 (ListLongMap!10759 (_ BitVec 64)) Bool)

(assert (=> b!901061 (= res!608425 (not (contains!4434 lt!407223 key!785)))))

(declare-fun b!901062 () Bool)

(declare-fun e!504413 () Bool)

(declare-fun tp_is_empty!18395 () Bool)

(assert (=> b!901062 (= e!504413 tp_is_empty!18395)))

(declare-fun b!901063 () Bool)

(declare-fun res!608424 () Bool)

(assert (=> b!901063 (=> res!608424 e!504408)))

(declare-datatypes ((array!52844 0))(
  ( (array!52845 (arr!25391 (Array (_ BitVec 32) (_ BitVec 64))) (size!25850 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8716 0))(
  ( (ValueCellFull!8716 (v!11747 V!29491)) (EmptyCell!8716) )
))
(declare-datatypes ((array!52846 0))(
  ( (array!52847 (arr!25392 (Array (_ BitVec 32) ValueCell!8716)) (size!25851 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4448 0))(
  ( (LongMapFixedSize!4449 (defaultEntry!5462 Int) (mask!26263 (_ BitVec 32)) (extraKeys!5190 (_ BitVec 32)) (zeroValue!5294 V!29491) (minValue!5294 V!29491) (_size!2279 (_ BitVec 32)) (_keys!10272 array!52844) (_values!5481 array!52846) (_vacant!2279 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4448)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52844 (_ BitVec 32)) Bool)

(assert (=> b!901063 (= res!608424 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10272 thiss!1181) (mask!26263 thiss!1181))))))

(declare-fun b!901064 () Bool)

(declare-fun res!608427 () Bool)

(assert (=> b!901064 (=> res!608427 e!504408)))

(assert (=> b!901064 (= res!608427 (or (not (= (size!25851 (_values!5481 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26263 thiss!1181)))) (not (= (size!25850 (_keys!10272 thiss!1181)) (size!25851 (_values!5481 thiss!1181)))) (bvslt (mask!26263 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5190 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5190 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!901065 () Bool)

(declare-fun e!504406 () Bool)

(declare-fun e!504405 () Bool)

(declare-fun mapRes!29275 () Bool)

(assert (=> b!901065 (= e!504406 (and e!504405 mapRes!29275))))

(declare-fun condMapEmpty!29275 () Bool)

(declare-fun mapDefault!29275 () ValueCell!8716)

