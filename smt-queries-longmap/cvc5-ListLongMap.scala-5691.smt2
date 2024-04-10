; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73930 () Bool)

(assert start!73930)

(declare-fun b_free!14845 () Bool)

(declare-fun b_next!14845 () Bool)

(assert (=> start!73930 (= b_free!14845 (not b_next!14845))))

(declare-fun tp!52038 () Bool)

(declare-fun b_and!24597 () Bool)

(assert (=> start!73930 (= tp!52038 b_and!24597)))

(declare-fun b!868863 () Bool)

(declare-fun e!483903 () Bool)

(declare-fun e!483904 () Bool)

(assert (=> b!868863 (= e!483903 e!483904)))

(declare-fun res!590426 () Bool)

(assert (=> b!868863 (=> (not res!590426) (not e!483904))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868863 (= res!590426 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27689 0))(
  ( (V!27690 (val!8538 Int)) )
))
(declare-datatypes ((tuple2!11336 0))(
  ( (tuple2!11337 (_1!5679 (_ BitVec 64)) (_2!5679 V!27689)) )
))
(declare-datatypes ((List!17131 0))(
  ( (Nil!17128) (Cons!17127 (h!18258 tuple2!11336) (t!24168 List!17131)) )
))
(declare-datatypes ((ListLongMap!10105 0))(
  ( (ListLongMap!10106 (toList!5068 List!17131)) )
))
(declare-fun lt!394611 () ListLongMap!10105)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50112 0))(
  ( (array!50113 (arr!24087 (Array (_ BitVec 32) (_ BitVec 64))) (size!24527 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50112)

(declare-datatypes ((ValueCell!8051 0))(
  ( (ValueCellFull!8051 (v!10963 V!27689)) (EmptyCell!8051) )
))
(declare-datatypes ((array!50114 0))(
  ( (array!50115 (arr!24088 (Array (_ BitVec 32) ValueCell!8051)) (size!24528 (_ BitVec 32))) )
))
(declare-fun lt!394612 () array!50114)

(declare-fun minValue!654 () V!27689)

(declare-fun zeroValue!654 () V!27689)

(declare-fun getCurrentListMapNoExtraKeys!3037 (array!50112 array!50114 (_ BitVec 32) (_ BitVec 32) V!27689 V!27689 (_ BitVec 32) Int) ListLongMap!10105)

(assert (=> b!868863 (= lt!394611 (getCurrentListMapNoExtraKeys!3037 _keys!868 lt!394612 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27689)

(declare-fun _values!688 () array!50114)

(assert (=> b!868863 (= lt!394612 (array!50115 (store (arr!24088 _values!688) i!612 (ValueCellFull!8051 v!557)) (size!24528 _values!688)))))

(declare-fun lt!394609 () ListLongMap!10105)

(assert (=> b!868863 (= lt!394609 (getCurrentListMapNoExtraKeys!3037 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868864 () Bool)

(declare-fun res!590421 () Bool)

(assert (=> b!868864 (=> (not res!590421) (not e!483903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868864 (= res!590421 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27071 () Bool)

(declare-fun mapRes!27071 () Bool)

(assert (=> mapIsEmpty!27071 mapRes!27071))

(declare-fun res!590422 () Bool)

(assert (=> start!73930 (=> (not res!590422) (not e!483903))))

(assert (=> start!73930 (= res!590422 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24527 _keys!868))))))

(assert (=> start!73930 e!483903))

(declare-fun tp_is_empty!16981 () Bool)

(assert (=> start!73930 tp_is_empty!16981))

(assert (=> start!73930 true))

(assert (=> start!73930 tp!52038))

(declare-fun array_inv!19026 (array!50112) Bool)

(assert (=> start!73930 (array_inv!19026 _keys!868)))

(declare-fun e!483902 () Bool)

(declare-fun array_inv!19027 (array!50114) Bool)

(assert (=> start!73930 (and (array_inv!19027 _values!688) e!483902)))

(declare-fun b!868865 () Bool)

(assert (=> b!868865 (= e!483904 (not true))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2409 (ListLongMap!10105 tuple2!11336) ListLongMap!10105)

(assert (=> b!868865 (= (getCurrentListMapNoExtraKeys!3037 _keys!868 lt!394612 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2409 (getCurrentListMapNoExtraKeys!3037 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11337 k!854 v!557)))))

(declare-datatypes ((Unit!29816 0))(
  ( (Unit!29817) )
))
(declare-fun lt!394610 () Unit!29816)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!603 (array!50112 array!50114 (_ BitVec 32) (_ BitVec 32) V!27689 V!27689 (_ BitVec 32) (_ BitVec 64) V!27689 (_ BitVec 32) Int) Unit!29816)

(assert (=> b!868865 (= lt!394610 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!603 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868866 () Bool)

(declare-fun e!483905 () Bool)

(assert (=> b!868866 (= e!483905 tp_is_empty!16981)))

(declare-fun mapNonEmpty!27071 () Bool)

(declare-fun tp!52039 () Bool)

(declare-fun e!483906 () Bool)

(assert (=> mapNonEmpty!27071 (= mapRes!27071 (and tp!52039 e!483906))))

(declare-fun mapKey!27071 () (_ BitVec 32))

(declare-fun mapValue!27071 () ValueCell!8051)

(declare-fun mapRest!27071 () (Array (_ BitVec 32) ValueCell!8051))

(assert (=> mapNonEmpty!27071 (= (arr!24088 _values!688) (store mapRest!27071 mapKey!27071 mapValue!27071))))

(declare-fun b!868867 () Bool)

(assert (=> b!868867 (= e!483902 (and e!483905 mapRes!27071))))

(declare-fun condMapEmpty!27071 () Bool)

(declare-fun mapDefault!27071 () ValueCell!8051)

