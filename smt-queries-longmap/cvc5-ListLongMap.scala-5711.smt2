; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74050 () Bool)

(assert start!74050)

(declare-fun b_free!14965 () Bool)

(declare-fun b_next!14965 () Bool)

(assert (=> start!74050 (= b_free!14965 (not b_next!14965))))

(declare-fun tp!52398 () Bool)

(declare-fun b_and!24717 () Bool)

(assert (=> start!74050 (= tp!52398 b_and!24717)))

(declare-fun b!871023 () Bool)

(declare-fun res!592045 () Bool)

(declare-fun e!484983 () Bool)

(assert (=> b!871023 (=> (not res!592045) (not e!484983))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50344 0))(
  ( (array!50345 (arr!24203 (Array (_ BitVec 32) (_ BitVec 64))) (size!24643 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50344)

(assert (=> b!871023 (= res!592045 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24643 _keys!868))))))

(declare-fun b!871024 () Bool)

(declare-fun e!484986 () Bool)

(assert (=> b!871024 (= e!484986 (not true))))

(declare-datatypes ((V!27849 0))(
  ( (V!27850 (val!8598 Int)) )
))
(declare-fun v!557 () V!27849)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8111 0))(
  ( (ValueCellFull!8111 (v!11023 V!27849)) (EmptyCell!8111) )
))
(declare-datatypes ((array!50346 0))(
  ( (array!50347 (arr!24204 (Array (_ BitVec 32) ValueCell!8111)) (size!24644 (_ BitVec 32))) )
))
(declare-fun lt!395330 () array!50346)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun _values!688 () array!50346)

(declare-fun minValue!654 () V!27849)

(declare-fun zeroValue!654 () V!27849)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!11424 0))(
  ( (tuple2!11425 (_1!5723 (_ BitVec 64)) (_2!5723 V!27849)) )
))
(declare-datatypes ((List!17212 0))(
  ( (Nil!17209) (Cons!17208 (h!18339 tuple2!11424) (t!24249 List!17212)) )
))
(declare-datatypes ((ListLongMap!10193 0))(
  ( (ListLongMap!10194 (toList!5112 List!17212)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3081 (array!50344 array!50346 (_ BitVec 32) (_ BitVec 32) V!27849 V!27849 (_ BitVec 32) Int) ListLongMap!10193)

(declare-fun +!2448 (ListLongMap!10193 tuple2!11424) ListLongMap!10193)

(assert (=> b!871024 (= (getCurrentListMapNoExtraKeys!3081 _keys!868 lt!395330 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2448 (getCurrentListMapNoExtraKeys!3081 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11425 k!854 v!557)))))

(declare-datatypes ((Unit!29894 0))(
  ( (Unit!29895) )
))
(declare-fun lt!395332 () Unit!29894)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!642 (array!50344 array!50346 (_ BitVec 32) (_ BitVec 32) V!27849 V!27849 (_ BitVec 32) (_ BitVec 64) V!27849 (_ BitVec 32) Int) Unit!29894)

(assert (=> b!871024 (= lt!395332 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!642 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871025 () Bool)

(declare-fun res!592049 () Bool)

(assert (=> b!871025 (=> (not res!592049) (not e!484983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871025 (= res!592049 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27251 () Bool)

(declare-fun mapRes!27251 () Bool)

(assert (=> mapIsEmpty!27251 mapRes!27251))

(declare-fun mapNonEmpty!27251 () Bool)

(declare-fun tp!52399 () Bool)

(declare-fun e!484987 () Bool)

(assert (=> mapNonEmpty!27251 (= mapRes!27251 (and tp!52399 e!484987))))

(declare-fun mapKey!27251 () (_ BitVec 32))

(declare-fun mapValue!27251 () ValueCell!8111)

(declare-fun mapRest!27251 () (Array (_ BitVec 32) ValueCell!8111))

(assert (=> mapNonEmpty!27251 (= (arr!24204 _values!688) (store mapRest!27251 mapKey!27251 mapValue!27251))))

(declare-fun b!871027 () Bool)

(declare-fun res!592044 () Bool)

(assert (=> b!871027 (=> (not res!592044) (not e!484983))))

(assert (=> b!871027 (= res!592044 (and (= (size!24644 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24643 _keys!868) (size!24644 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871028 () Bool)

(declare-fun res!592041 () Bool)

(assert (=> b!871028 (=> (not res!592041) (not e!484983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50344 (_ BitVec 32)) Bool)

(assert (=> b!871028 (= res!592041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871029 () Bool)

(assert (=> b!871029 (= e!484983 e!484986)))

(declare-fun res!592048 () Bool)

(assert (=> b!871029 (=> (not res!592048) (not e!484986))))

(assert (=> b!871029 (= res!592048 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395329 () ListLongMap!10193)

(assert (=> b!871029 (= lt!395329 (getCurrentListMapNoExtraKeys!3081 _keys!868 lt!395330 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871029 (= lt!395330 (array!50347 (store (arr!24204 _values!688) i!612 (ValueCellFull!8111 v!557)) (size!24644 _values!688)))))

(declare-fun lt!395331 () ListLongMap!10193)

(assert (=> b!871029 (= lt!395331 (getCurrentListMapNoExtraKeys!3081 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871026 () Bool)

(declare-fun res!592046 () Bool)

(assert (=> b!871026 (=> (not res!592046) (not e!484983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871026 (= res!592046 (validKeyInArray!0 k!854))))

(declare-fun res!592042 () Bool)

(assert (=> start!74050 (=> (not res!592042) (not e!484983))))

(assert (=> start!74050 (= res!592042 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24643 _keys!868))))))

(assert (=> start!74050 e!484983))

(declare-fun tp_is_empty!17101 () Bool)

(assert (=> start!74050 tp_is_empty!17101))

(assert (=> start!74050 true))

(assert (=> start!74050 tp!52398))

(declare-fun array_inv!19112 (array!50344) Bool)

(assert (=> start!74050 (array_inv!19112 _keys!868)))

(declare-fun e!484984 () Bool)

(declare-fun array_inv!19113 (array!50346) Bool)

(assert (=> start!74050 (and (array_inv!19113 _values!688) e!484984)))

(declare-fun b!871030 () Bool)

(declare-fun res!592047 () Bool)

(assert (=> b!871030 (=> (not res!592047) (not e!484983))))

(assert (=> b!871030 (= res!592047 (and (= (select (arr!24203 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!871031 () Bool)

(declare-fun e!484982 () Bool)

(assert (=> b!871031 (= e!484984 (and e!484982 mapRes!27251))))

(declare-fun condMapEmpty!27251 () Bool)

(declare-fun mapDefault!27251 () ValueCell!8111)

