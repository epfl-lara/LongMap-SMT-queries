; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74006 () Bool)

(assert start!74006)

(declare-fun b_free!14921 () Bool)

(declare-fun b_next!14921 () Bool)

(assert (=> start!74006 (= b_free!14921 (not b_next!14921))))

(declare-fun tp!52266 () Bool)

(declare-fun b_and!24673 () Bool)

(assert (=> start!74006 (= tp!52266 b_and!24673)))

(declare-fun b!870231 () Bool)

(declare-fun res!591450 () Bool)

(declare-fun e!484589 () Bool)

(assert (=> b!870231 (=> (not res!591450) (not e!484589))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870231 (= res!591450 (validMask!0 mask!1196))))

(declare-fun b!870232 () Bool)

(declare-fun res!591453 () Bool)

(assert (=> b!870232 (=> (not res!591453) (not e!484589))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50260 0))(
  ( (array!50261 (arr!24161 (Array (_ BitVec 32) (_ BitVec 64))) (size!24601 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50260)

(declare-datatypes ((V!27789 0))(
  ( (V!27790 (val!8576 Int)) )
))
(declare-datatypes ((ValueCell!8089 0))(
  ( (ValueCellFull!8089 (v!11001 V!27789)) (EmptyCell!8089) )
))
(declare-datatypes ((array!50262 0))(
  ( (array!50263 (arr!24162 (Array (_ BitVec 32) ValueCell!8089)) (size!24602 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50262)

(assert (=> b!870232 (= res!591453 (and (= (size!24602 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24601 _keys!868) (size!24602 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870233 () Bool)

(declare-fun res!591452 () Bool)

(assert (=> b!870233 (=> (not res!591452) (not e!484589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50260 (_ BitVec 32)) Bool)

(assert (=> b!870233 (= res!591452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870234 () Bool)

(declare-fun e!484590 () Bool)

(assert (=> b!870234 (= e!484589 e!484590)))

(declare-fun res!591454 () Bool)

(assert (=> b!870234 (=> (not res!591454) (not e!484590))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870234 (= res!591454 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11394 0))(
  ( (tuple2!11395 (_1!5708 (_ BitVec 64)) (_2!5708 V!27789)) )
))
(declare-datatypes ((List!17186 0))(
  ( (Nil!17183) (Cons!17182 (h!18313 tuple2!11394) (t!24223 List!17186)) )
))
(declare-datatypes ((ListLongMap!10163 0))(
  ( (ListLongMap!10164 (toList!5097 List!17186)) )
))
(declare-fun lt!395065 () ListLongMap!10163)

(declare-fun minValue!654 () V!27789)

(declare-fun zeroValue!654 () V!27789)

(declare-fun lt!395067 () array!50262)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3066 (array!50260 array!50262 (_ BitVec 32) (_ BitVec 32) V!27789 V!27789 (_ BitVec 32) Int) ListLongMap!10163)

(assert (=> b!870234 (= lt!395065 (getCurrentListMapNoExtraKeys!3066 _keys!868 lt!395067 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27789)

(assert (=> b!870234 (= lt!395067 (array!50263 (store (arr!24162 _values!688) i!612 (ValueCellFull!8089 v!557)) (size!24602 _values!688)))))

(declare-fun lt!395066 () ListLongMap!10163)

(assert (=> b!870234 (= lt!395066 (getCurrentListMapNoExtraKeys!3066 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27185 () Bool)

(declare-fun mapRes!27185 () Bool)

(assert (=> mapIsEmpty!27185 mapRes!27185))

(declare-fun b!870235 () Bool)

(declare-fun res!591455 () Bool)

(assert (=> b!870235 (=> (not res!591455) (not e!484589))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!870235 (= res!591455 (and (= (select (arr!24161 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!870236 () Bool)

(declare-fun e!484588 () Bool)

(declare-fun tp_is_empty!17057 () Bool)

(assert (=> b!870236 (= e!484588 tp_is_empty!17057)))

(declare-fun res!591448 () Bool)

(assert (=> start!74006 (=> (not res!591448) (not e!484589))))

(assert (=> start!74006 (= res!591448 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24601 _keys!868))))))

(assert (=> start!74006 e!484589))

(assert (=> start!74006 tp_is_empty!17057))

(assert (=> start!74006 true))

(assert (=> start!74006 tp!52266))

(declare-fun array_inv!19082 (array!50260) Bool)

(assert (=> start!74006 (array_inv!19082 _keys!868)))

(declare-fun e!484586 () Bool)

(declare-fun array_inv!19083 (array!50262) Bool)

(assert (=> start!74006 (and (array_inv!19083 _values!688) e!484586)))

(declare-fun b!870237 () Bool)

(declare-fun e!484587 () Bool)

(assert (=> b!870237 (= e!484586 (and e!484587 mapRes!27185))))

(declare-fun condMapEmpty!27185 () Bool)

(declare-fun mapDefault!27185 () ValueCell!8089)

