; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37292 () Bool)

(assert start!37292)

(declare-fun b_free!8419 () Bool)

(declare-fun b_next!8419 () Bool)

(assert (=> start!37292 (= b_free!8419 (not b_next!8419))))

(declare-fun tp!29972 () Bool)

(declare-fun b_and!15661 () Bool)

(assert (=> start!37292 (= tp!29972 b_and!15661)))

(declare-fun b!377871 () Bool)

(declare-fun e!230023 () Bool)

(declare-fun e!230025 () Bool)

(assert (=> b!377871 (= e!230023 e!230025)))

(declare-fun res!213892 () Bool)

(assert (=> b!377871 (=> res!213892 e!230025)))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!377871 (= res!213892 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13195 0))(
  ( (V!13196 (val!4578 Int)) )
))
(declare-datatypes ((tuple2!6108 0))(
  ( (tuple2!6109 (_1!3065 (_ BitVec 64)) (_2!3065 V!13195)) )
))
(declare-datatypes ((List!5946 0))(
  ( (Nil!5943) (Cons!5942 (h!6798 tuple2!6108) (t!11096 List!5946)) )
))
(declare-datatypes ((ListLongMap!5021 0))(
  ( (ListLongMap!5022 (toList!2526 List!5946)) )
))
(declare-fun lt!175873 () ListLongMap!5021)

(declare-fun lt!175879 () ListLongMap!5021)

(assert (=> b!377871 (= lt!175873 lt!175879)))

(declare-fun lt!175872 () ListLongMap!5021)

(declare-fun lt!175870 () tuple2!6108)

(declare-fun +!872 (ListLongMap!5021 tuple2!6108) ListLongMap!5021)

(assert (=> b!377871 (= lt!175879 (+!872 lt!175872 lt!175870))))

(declare-fun lt!175874 () ListLongMap!5021)

(declare-fun lt!175878 () ListLongMap!5021)

(assert (=> b!377871 (= lt!175874 lt!175878)))

(declare-fun lt!175877 () ListLongMap!5021)

(assert (=> b!377871 (= lt!175878 (+!872 lt!175877 lt!175870))))

(declare-fun lt!175875 () ListLongMap!5021)

(assert (=> b!377871 (= lt!175873 (+!872 lt!175875 lt!175870))))

(declare-fun zeroValue!472 () V!13195)

(assert (=> b!377871 (= lt!175870 (tuple2!6109 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377872 () Bool)

(declare-fun res!213899 () Bool)

(declare-fun e!230030 () Bool)

(assert (=> b!377872 (=> (not res!213899) (not e!230030))))

(declare-datatypes ((array!22061 0))(
  ( (array!22062 (arr!10499 (Array (_ BitVec 32) (_ BitVec 64))) (size!10851 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22061)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377872 (= res!213899 (or (= (select (arr!10499 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10499 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377873 () Bool)

(declare-fun e!230026 () Bool)

(declare-fun tp_is_empty!9067 () Bool)

(assert (=> b!377873 (= e!230026 tp_is_empty!9067)))

(declare-fun b!377874 () Bool)

(declare-fun res!213900 () Bool)

(assert (=> b!377874 (=> (not res!213900) (not e!230030))))

(declare-datatypes ((List!5947 0))(
  ( (Nil!5944) (Cons!5943 (h!6799 (_ BitVec 64)) (t!11097 List!5947)) )
))
(declare-fun arrayNoDuplicates!0 (array!22061 (_ BitVec 32) List!5947) Bool)

(assert (=> b!377874 (= res!213900 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5944))))

(declare-fun mapNonEmpty!15165 () Bool)

(declare-fun mapRes!15165 () Bool)

(declare-fun tp!29973 () Bool)

(declare-fun e!230027 () Bool)

(assert (=> mapNonEmpty!15165 (= mapRes!15165 (and tp!29973 e!230027))))

(declare-datatypes ((ValueCell!4190 0))(
  ( (ValueCellFull!4190 (v!6775 V!13195)) (EmptyCell!4190) )
))
(declare-datatypes ((array!22063 0))(
  ( (array!22064 (arr!10500 (Array (_ BitVec 32) ValueCell!4190)) (size!10852 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22063)

(declare-fun mapValue!15165 () ValueCell!4190)

(declare-fun mapKey!15165 () (_ BitVec 32))

(declare-fun mapRest!15165 () (Array (_ BitVec 32) ValueCell!4190))

(assert (=> mapNonEmpty!15165 (= (arr!10500 _values!506) (store mapRest!15165 mapKey!15165 mapValue!15165))))

(declare-fun b!377875 () Bool)

(declare-fun res!213898 () Bool)

(assert (=> b!377875 (=> (not res!213898) (not e!230030))))

(declare-fun arrayContainsKey!0 (array!22061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377875 (= res!213898 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!377876 () Bool)

(declare-fun e!230028 () Bool)

(assert (=> b!377876 (= e!230028 (and e!230026 mapRes!15165))))

(declare-fun condMapEmpty!15165 () Bool)

(declare-fun mapDefault!15165 () ValueCell!4190)

