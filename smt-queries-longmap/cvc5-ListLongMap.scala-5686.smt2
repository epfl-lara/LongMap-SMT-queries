; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73900 () Bool)

(assert start!73900)

(declare-fun b_free!14815 () Bool)

(declare-fun b_next!14815 () Bool)

(assert (=> start!73900 (= b_free!14815 (not b_next!14815))))

(declare-fun tp!51949 () Bool)

(declare-fun b_and!24567 () Bool)

(assert (=> start!73900 (= tp!51949 b_and!24567)))

(declare-fun res!590017 () Bool)

(declare-fun e!483636 () Bool)

(assert (=> start!73900 (=> (not res!590017) (not e!483636))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50058 0))(
  ( (array!50059 (arr!24060 (Array (_ BitVec 32) (_ BitVec 64))) (size!24500 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50058)

(assert (=> start!73900 (= res!590017 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24500 _keys!868))))))

(assert (=> start!73900 e!483636))

(declare-fun tp_is_empty!16951 () Bool)

(assert (=> start!73900 tp_is_empty!16951))

(assert (=> start!73900 true))

(assert (=> start!73900 tp!51949))

(declare-fun array_inv!19010 (array!50058) Bool)

(assert (=> start!73900 (array_inv!19010 _keys!868)))

(declare-datatypes ((V!27649 0))(
  ( (V!27650 (val!8523 Int)) )
))
(declare-datatypes ((ValueCell!8036 0))(
  ( (ValueCellFull!8036 (v!10948 V!27649)) (EmptyCell!8036) )
))
(declare-datatypes ((array!50060 0))(
  ( (array!50061 (arr!24061 (Array (_ BitVec 32) ValueCell!8036)) (size!24501 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50060)

(declare-fun e!483634 () Bool)

(declare-fun array_inv!19011 (array!50060) Bool)

(assert (=> start!73900 (and (array_inv!19011 _values!688) e!483634)))

(declare-fun b!868323 () Bool)

(declare-fun res!590016 () Bool)

(assert (=> b!868323 (=> (not res!590016) (not e!483636))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!868323 (= res!590016 (and (= (select (arr!24060 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!868324 () Bool)

(declare-fun res!590018 () Bool)

(assert (=> b!868324 (=> (not res!590018) (not e!483636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868324 (= res!590018 (validKeyInArray!0 k!854))))

(declare-fun b!868325 () Bool)

(declare-fun e!483632 () Bool)

(assert (=> b!868325 (= e!483632 (not true))))

(declare-fun lt!394430 () array!50060)

(declare-fun v!557 () V!27649)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27649)

(declare-fun zeroValue!654 () V!27649)

(declare-datatypes ((tuple2!11314 0))(
  ( (tuple2!11315 (_1!5668 (_ BitVec 64)) (_2!5668 V!27649)) )
))
(declare-datatypes ((List!17110 0))(
  ( (Nil!17107) (Cons!17106 (h!18237 tuple2!11314) (t!24147 List!17110)) )
))
(declare-datatypes ((ListLongMap!10083 0))(
  ( (ListLongMap!10084 (toList!5057 List!17110)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3026 (array!50058 array!50060 (_ BitVec 32) (_ BitVec 32) V!27649 V!27649 (_ BitVec 32) Int) ListLongMap!10083)

(declare-fun +!2399 (ListLongMap!10083 tuple2!11314) ListLongMap!10083)

(assert (=> b!868325 (= (getCurrentListMapNoExtraKeys!3026 _keys!868 lt!394430 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2399 (getCurrentListMapNoExtraKeys!3026 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11315 k!854 v!557)))))

(declare-datatypes ((Unit!29796 0))(
  ( (Unit!29797) )
))
(declare-fun lt!394432 () Unit!29796)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!593 (array!50058 array!50060 (_ BitVec 32) (_ BitVec 32) V!27649 V!27649 (_ BitVec 32) (_ BitVec 64) V!27649 (_ BitVec 32) Int) Unit!29796)

(assert (=> b!868325 (= lt!394432 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!593 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868326 () Bool)

(declare-fun res!590019 () Bool)

(assert (=> b!868326 (=> (not res!590019) (not e!483636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868326 (= res!590019 (validMask!0 mask!1196))))

(declare-fun b!868327 () Bool)

(declare-fun e!483635 () Bool)

(assert (=> b!868327 (= e!483635 tp_is_empty!16951)))

(declare-fun b!868328 () Bool)

(declare-fun res!590022 () Bool)

(assert (=> b!868328 (=> (not res!590022) (not e!483636))))

(assert (=> b!868328 (= res!590022 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24500 _keys!868))))))

(declare-fun b!868329 () Bool)

(declare-fun res!590020 () Bool)

(assert (=> b!868329 (=> (not res!590020) (not e!483636))))

(declare-datatypes ((List!17111 0))(
  ( (Nil!17108) (Cons!17107 (h!18238 (_ BitVec 64)) (t!24148 List!17111)) )
))
(declare-fun arrayNoDuplicates!0 (array!50058 (_ BitVec 32) List!17111) Bool)

(assert (=> b!868329 (= res!590020 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17108))))

(declare-fun mapNonEmpty!27026 () Bool)

(declare-fun mapRes!27026 () Bool)

(declare-fun tp!51948 () Bool)

(declare-fun e!483633 () Bool)

(assert (=> mapNonEmpty!27026 (= mapRes!27026 (and tp!51948 e!483633))))

(declare-fun mapValue!27026 () ValueCell!8036)

(declare-fun mapKey!27026 () (_ BitVec 32))

(declare-fun mapRest!27026 () (Array (_ BitVec 32) ValueCell!8036))

(assert (=> mapNonEmpty!27026 (= (arr!24061 _values!688) (store mapRest!27026 mapKey!27026 mapValue!27026))))

(declare-fun b!868330 () Bool)

(assert (=> b!868330 (= e!483634 (and e!483635 mapRes!27026))))

(declare-fun condMapEmpty!27026 () Bool)

(declare-fun mapDefault!27026 () ValueCell!8036)

