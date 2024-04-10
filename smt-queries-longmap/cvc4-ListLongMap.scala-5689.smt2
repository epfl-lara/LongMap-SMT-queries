; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73922 () Bool)

(assert start!73922)

(declare-fun b_free!14837 () Bool)

(declare-fun b_next!14837 () Bool)

(assert (=> start!73922 (= b_free!14837 (not b_next!14837))))

(declare-fun tp!52015 () Bool)

(declare-fun b_and!24589 () Bool)

(assert (=> start!73922 (= tp!52015 b_and!24589)))

(declare-fun b!868719 () Bool)

(declare-fun res!590316 () Bool)

(declare-fun e!483833 () Bool)

(assert (=> b!868719 (=> (not res!590316) (not e!483833))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868719 (= res!590316 (validKeyInArray!0 k!854))))

(declare-fun b!868720 () Bool)

(declare-fun res!590318 () Bool)

(assert (=> b!868720 (=> (not res!590318) (not e!483833))))

(declare-datatypes ((array!50096 0))(
  ( (array!50097 (arr!24079 (Array (_ BitVec 32) (_ BitVec 64))) (size!24519 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50096)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50096 (_ BitVec 32)) Bool)

(assert (=> b!868720 (= res!590318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868721 () Bool)

(declare-fun e!483832 () Bool)

(assert (=> b!868721 (= e!483833 e!483832)))

(declare-fun res!590319 () Bool)

(assert (=> b!868721 (=> (not res!590319) (not e!483832))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868721 (= res!590319 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27677 0))(
  ( (V!27678 (val!8534 Int)) )
))
(declare-fun minValue!654 () V!27677)

(declare-fun zeroValue!654 () V!27677)

(declare-datatypes ((ValueCell!8047 0))(
  ( (ValueCellFull!8047 (v!10959 V!27677)) (EmptyCell!8047) )
))
(declare-datatypes ((array!50098 0))(
  ( (array!50099 (arr!24080 (Array (_ BitVec 32) ValueCell!8047)) (size!24520 (_ BitVec 32))) )
))
(declare-fun lt!394564 () array!50098)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11328 0))(
  ( (tuple2!11329 (_1!5675 (_ BitVec 64)) (_2!5675 V!27677)) )
))
(declare-datatypes ((List!17124 0))(
  ( (Nil!17121) (Cons!17120 (h!18251 tuple2!11328) (t!24161 List!17124)) )
))
(declare-datatypes ((ListLongMap!10097 0))(
  ( (ListLongMap!10098 (toList!5064 List!17124)) )
))
(declare-fun lt!394561 () ListLongMap!10097)

(declare-fun getCurrentListMapNoExtraKeys!3033 (array!50096 array!50098 (_ BitVec 32) (_ BitVec 32) V!27677 V!27677 (_ BitVec 32) Int) ListLongMap!10097)

(assert (=> b!868721 (= lt!394561 (getCurrentListMapNoExtraKeys!3033 _keys!868 lt!394564 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27677)

(declare-fun _values!688 () array!50098)

(assert (=> b!868721 (= lt!394564 (array!50099 (store (arr!24080 _values!688) i!612 (ValueCellFull!8047 v!557)) (size!24520 _values!688)))))

(declare-fun lt!394563 () ListLongMap!10097)

(assert (=> b!868721 (= lt!394563 (getCurrentListMapNoExtraKeys!3033 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868722 () Bool)

(declare-fun res!590315 () Bool)

(assert (=> b!868722 (=> (not res!590315) (not e!483833))))

(assert (=> b!868722 (= res!590315 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24519 _keys!868))))))

(declare-fun b!868723 () Bool)

(declare-fun res!590313 () Bool)

(assert (=> b!868723 (=> (not res!590313) (not e!483833))))

(assert (=> b!868723 (= res!590313 (and (= (size!24520 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24519 _keys!868) (size!24520 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!590314 () Bool)

(assert (=> start!73922 (=> (not res!590314) (not e!483833))))

(assert (=> start!73922 (= res!590314 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24519 _keys!868))))))

(assert (=> start!73922 e!483833))

(declare-fun tp_is_empty!16973 () Bool)

(assert (=> start!73922 tp_is_empty!16973))

(assert (=> start!73922 true))

(assert (=> start!73922 tp!52015))

(declare-fun array_inv!19020 (array!50096) Bool)

(assert (=> start!73922 (array_inv!19020 _keys!868)))

(declare-fun e!483834 () Bool)

(declare-fun array_inv!19021 (array!50098) Bool)

(assert (=> start!73922 (and (array_inv!19021 _values!688) e!483834)))

(declare-fun b!868724 () Bool)

(declare-fun e!483830 () Bool)

(assert (=> b!868724 (= e!483830 tp_is_empty!16973)))

(declare-fun b!868725 () Bool)

(declare-fun res!590317 () Bool)

(assert (=> b!868725 (=> (not res!590317) (not e!483833))))

(assert (=> b!868725 (= res!590317 (and (= (select (arr!24079 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!868726 () Bool)

(assert (=> b!868726 (= e!483832 (not true))))

(declare-fun +!2406 (ListLongMap!10097 tuple2!11328) ListLongMap!10097)

(assert (=> b!868726 (= (getCurrentListMapNoExtraKeys!3033 _keys!868 lt!394564 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2406 (getCurrentListMapNoExtraKeys!3033 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11329 k!854 v!557)))))

(declare-datatypes ((Unit!29810 0))(
  ( (Unit!29811) )
))
(declare-fun lt!394562 () Unit!29810)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!600 (array!50096 array!50098 (_ BitVec 32) (_ BitVec 32) V!27677 V!27677 (_ BitVec 32) (_ BitVec 64) V!27677 (_ BitVec 32) Int) Unit!29810)

(assert (=> b!868726 (= lt!394562 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!600 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868727 () Bool)

(declare-fun e!483835 () Bool)

(assert (=> b!868727 (= e!483835 tp_is_empty!16973)))

(declare-fun mapIsEmpty!27059 () Bool)

(declare-fun mapRes!27059 () Bool)

(assert (=> mapIsEmpty!27059 mapRes!27059))

(declare-fun mapNonEmpty!27059 () Bool)

(declare-fun tp!52014 () Bool)

(assert (=> mapNonEmpty!27059 (= mapRes!27059 (and tp!52014 e!483835))))

(declare-fun mapValue!27059 () ValueCell!8047)

(declare-fun mapRest!27059 () (Array (_ BitVec 32) ValueCell!8047))

(declare-fun mapKey!27059 () (_ BitVec 32))

(assert (=> mapNonEmpty!27059 (= (arr!24080 _values!688) (store mapRest!27059 mapKey!27059 mapValue!27059))))

(declare-fun b!868728 () Bool)

(assert (=> b!868728 (= e!483834 (and e!483830 mapRes!27059))))

(declare-fun condMapEmpty!27059 () Bool)

(declare-fun mapDefault!27059 () ValueCell!8047)

