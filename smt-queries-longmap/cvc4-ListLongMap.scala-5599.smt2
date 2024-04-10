; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73382 () Bool)

(assert start!73382)

(declare-fun b_free!14297 () Bool)

(declare-fun b_next!14297 () Bool)

(assert (=> start!73382 (= b_free!14297 (not b_next!14297))))

(declare-fun tp!50394 () Bool)

(declare-fun b_and!23653 () Bool)

(assert (=> start!73382 (= tp!50394 b_and!23653)))

(declare-fun mapNonEmpty!26249 () Bool)

(declare-fun mapRes!26249 () Bool)

(declare-fun tp!50395 () Bool)

(declare-fun e!477414 () Bool)

(assert (=> mapNonEmpty!26249 (= mapRes!26249 (and tp!50395 e!477414))))

(declare-fun mapKey!26249 () (_ BitVec 32))

(declare-datatypes ((V!26957 0))(
  ( (V!26958 (val!8264 Int)) )
))
(declare-datatypes ((ValueCell!7777 0))(
  ( (ValueCellFull!7777 (v!10689 V!26957)) (EmptyCell!7777) )
))
(declare-fun mapRest!26249 () (Array (_ BitVec 32) ValueCell!7777))

(declare-fun mapValue!26249 () ValueCell!7777)

(declare-datatypes ((array!49058 0))(
  ( (array!49059 (arr!23560 (Array (_ BitVec 32) ValueCell!7777)) (size!24000 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49058)

(assert (=> mapNonEmpty!26249 (= (arr!23560 _values!688) (store mapRest!26249 mapKey!26249 mapValue!26249))))

(declare-fun b!856470 () Bool)

(declare-fun res!581719 () Bool)

(declare-fun e!477416 () Bool)

(assert (=> b!856470 (=> (not res!581719) (not e!477416))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49060 0))(
  ( (array!49061 (arr!23561 (Array (_ BitVec 32) (_ BitVec 64))) (size!24001 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49060)

(assert (=> b!856470 (= res!581719 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24001 _keys!868))))))

(declare-fun b!856471 () Bool)

(declare-fun res!581721 () Bool)

(assert (=> b!856471 (=> (not res!581721) (not e!477416))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856471 (= res!581721 (validKeyInArray!0 k!854))))

(declare-fun b!856472 () Bool)

(declare-fun res!581724 () Bool)

(assert (=> b!856472 (=> (not res!581724) (not e!477416))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856472 (= res!581724 (and (= (select (arr!23561 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!856473 () Bool)

(declare-fun res!581726 () Bool)

(assert (=> b!856473 (=> (not res!581726) (not e!477416))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!856473 (= res!581726 (and (= (size!24000 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24001 _keys!868) (size!24000 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856474 () Bool)

(declare-fun e!477417 () Bool)

(assert (=> b!856474 (= e!477417 (not true))))

(declare-fun v!557 () V!26957)

(declare-fun minValue!654 () V!26957)

(declare-fun zeroValue!654 () V!26957)

(declare-fun lt!385967 () array!49058)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10896 0))(
  ( (tuple2!10897 (_1!5459 (_ BitVec 64)) (_2!5459 V!26957)) )
))
(declare-datatypes ((List!16707 0))(
  ( (Nil!16704) (Cons!16703 (h!17834 tuple2!10896) (t!23348 List!16707)) )
))
(declare-datatypes ((ListLongMap!9665 0))(
  ( (ListLongMap!9666 (toList!4848 List!16707)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2829 (array!49060 array!49058 (_ BitVec 32) (_ BitVec 32) V!26957 V!26957 (_ BitVec 32) Int) ListLongMap!9665)

(declare-fun +!2204 (ListLongMap!9665 tuple2!10896) ListLongMap!9665)

(assert (=> b!856474 (= (getCurrentListMapNoExtraKeys!2829 _keys!868 lt!385967 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2204 (getCurrentListMapNoExtraKeys!2829 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10897 k!854 v!557)))))

(declare-datatypes ((Unit!29195 0))(
  ( (Unit!29196) )
))
(declare-fun lt!385966 () Unit!29195)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!425 (array!49060 array!49058 (_ BitVec 32) (_ BitVec 32) V!26957 V!26957 (_ BitVec 32) (_ BitVec 64) V!26957 (_ BitVec 32) Int) Unit!29195)

(assert (=> b!856474 (= lt!385966 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!425 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856475 () Bool)

(declare-fun e!477413 () Bool)

(declare-fun tp_is_empty!16433 () Bool)

(assert (=> b!856475 (= e!477413 tp_is_empty!16433)))

(declare-fun b!856476 () Bool)

(declare-fun e!477415 () Bool)

(assert (=> b!856476 (= e!477415 (and e!477413 mapRes!26249))))

(declare-fun condMapEmpty!26249 () Bool)

(declare-fun mapDefault!26249 () ValueCell!7777)

