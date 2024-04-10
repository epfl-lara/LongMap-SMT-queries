; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74210 () Bool)

(assert start!74210)

(declare-fun b_free!15017 () Bool)

(declare-fun b_next!15017 () Bool)

(assert (=> start!74210 (= b_free!15017 (not b_next!15017))))

(declare-fun tp!52702 () Bool)

(declare-fun b_and!24769 () Bool)

(assert (=> start!74210 (= tp!52702 b_and!24769)))

(declare-fun mapIsEmpty!27476 () Bool)

(declare-fun mapRes!27476 () Bool)

(assert (=> mapIsEmpty!27476 mapRes!27476))

(declare-fun b!873091 () Bool)

(declare-fun res!593359 () Bool)

(declare-fun e!486200 () Bool)

(assert (=> b!873091 (=> (not res!593359) (not e!486200))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873091 (= res!593359 (validKeyInArray!0 k!854))))

(declare-fun b!873092 () Bool)

(declare-datatypes ((V!28045 0))(
  ( (V!28046 (val!8672 Int)) )
))
(declare-fun v!557 () V!28045)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50624 0))(
  ( (array!50625 (arr!24342 (Array (_ BitVec 32) (_ BitVec 64))) (size!24782 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50624)

(declare-datatypes ((ValueCell!8185 0))(
  ( (ValueCellFull!8185 (v!11097 V!28045)) (EmptyCell!8185) )
))
(declare-datatypes ((array!50626 0))(
  ( (array!50627 (arr!24343 (Array (_ BitVec 32) ValueCell!8185)) (size!24783 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50626)

(declare-fun minValue!654 () V!28045)

(declare-fun zeroValue!654 () V!28045)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!11470 0))(
  ( (tuple2!11471 (_1!5746 (_ BitVec 64)) (_2!5746 V!28045)) )
))
(declare-datatypes ((List!17286 0))(
  ( (Nil!17283) (Cons!17282 (h!18413 tuple2!11470) (t!24323 List!17286)) )
))
(declare-datatypes ((ListLongMap!10239 0))(
  ( (ListLongMap!10240 (toList!5135 List!17286)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3102 (array!50624 array!50626 (_ BitVec 32) (_ BitVec 32) V!28045 V!28045 (_ BitVec 32) Int) ListLongMap!10239)

(assert (=> b!873092 (= e!486200 (not (= (getCurrentListMapNoExtraKeys!3102 _keys!868 (array!50627 (store (arr!24343 _values!688) i!612 (ValueCellFull!8185 v!557)) (size!24783 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) (getCurrentListMapNoExtraKeys!3102 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))))

(declare-fun e!486201 () Bool)

(assert (=> b!873092 e!486201))

(declare-fun c!92419 () Bool)

(assert (=> b!873092 (= c!92419 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29926 0))(
  ( (Unit!29927) )
))
(declare-fun lt!395680 () Unit!29926)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!657 (array!50624 array!50626 (_ BitVec 32) (_ BitVec 32) V!28045 V!28045 (_ BitVec 32) (_ BitVec 64) V!28045 (_ BitVec 32) Int) Unit!29926)

(assert (=> b!873092 (= lt!395680 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!657 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!873093 () Bool)

(declare-fun res!593358 () Bool)

(assert (=> b!873093 (=> (not res!593358) (not e!486200))))

(assert (=> b!873093 (= res!593358 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24782 _keys!868))))))

(declare-fun b!873094 () Bool)

(declare-fun call!38518 () ListLongMap!10239)

(declare-fun call!38519 () ListLongMap!10239)

(assert (=> b!873094 (= e!486201 (= call!38518 call!38519))))

(declare-fun b!873095 () Bool)

(declare-fun +!2464 (ListLongMap!10239 tuple2!11470) ListLongMap!10239)

(assert (=> b!873095 (= e!486201 (= call!38518 (+!2464 call!38519 (tuple2!11471 k!854 v!557))))))

(declare-fun b!873096 () Bool)

(declare-fun e!486197 () Bool)

(declare-fun tp_is_empty!17249 () Bool)

(assert (=> b!873096 (= e!486197 tp_is_empty!17249)))

(declare-fun b!873097 () Bool)

(declare-fun e!486199 () Bool)

(assert (=> b!873097 (= e!486199 (and e!486197 mapRes!27476))))

(declare-fun condMapEmpty!27476 () Bool)

(declare-fun mapDefault!27476 () ValueCell!8185)

