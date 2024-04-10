; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73828 () Bool)

(assert start!73828)

(declare-fun b_free!14743 () Bool)

(declare-fun b_next!14743 () Bool)

(assert (=> start!73828 (= b_free!14743 (not b_next!14743))))

(declare-fun tp!51733 () Bool)

(declare-fun b_and!24465 () Bool)

(assert (=> start!73828 (= tp!51733 b_and!24465)))

(declare-fun b!866825 () Bool)

(declare-fun res!588959 () Bool)

(declare-fun e!482862 () Bool)

(assert (=> b!866825 (=> (not res!588959) (not e!482862))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49918 0))(
  ( (array!49919 (arr!23990 (Array (_ BitVec 32) (_ BitVec 64))) (size!24430 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49918)

(declare-datatypes ((V!27553 0))(
  ( (V!27554 (val!8487 Int)) )
))
(declare-datatypes ((ValueCell!8000 0))(
  ( (ValueCellFull!8000 (v!10912 V!27553)) (EmptyCell!8000) )
))
(declare-datatypes ((array!49920 0))(
  ( (array!49921 (arr!23991 (Array (_ BitVec 32) ValueCell!8000)) (size!24431 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49920)

(assert (=> b!866825 (= res!588959 (and (= (size!24431 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24430 _keys!868) (size!24431 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866826 () Bool)

(declare-fun res!588958 () Bool)

(assert (=> b!866826 (=> (not res!588958) (not e!482862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49918 (_ BitVec 32)) Bool)

(assert (=> b!866826 (= res!588958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866827 () Bool)

(declare-fun e!482863 () Bool)

(declare-fun e!482861 () Bool)

(assert (=> b!866827 (= e!482863 (not e!482861))))

(declare-fun res!588966 () Bool)

(assert (=> b!866827 (=> res!588966 e!482861)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866827 (= res!588966 (not (validKeyInArray!0 (select (arr!23990 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11256 0))(
  ( (tuple2!11257 (_1!5639 (_ BitVec 64)) (_2!5639 V!27553)) )
))
(declare-datatypes ((List!17056 0))(
  ( (Nil!17053) (Cons!17052 (h!18183 tuple2!11256) (t!24065 List!17056)) )
))
(declare-datatypes ((ListLongMap!10025 0))(
  ( (ListLongMap!10026 (toList!5028 List!17056)) )
))
(declare-fun lt!393491 () ListLongMap!10025)

(declare-fun lt!393485 () ListLongMap!10025)

(assert (=> b!866827 (= lt!393491 lt!393485)))

(declare-fun lt!393481 () ListLongMap!10025)

(declare-fun lt!393482 () tuple2!11256)

(declare-fun +!2374 (ListLongMap!10025 tuple2!11256) ListLongMap!10025)

(assert (=> b!866827 (= lt!393485 (+!2374 lt!393481 lt!393482))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!393493 () array!49920)

(declare-fun minValue!654 () V!27553)

(declare-fun zeroValue!654 () V!27553)

(declare-fun getCurrentListMapNoExtraKeys!2998 (array!49918 array!49920 (_ BitVec 32) (_ BitVec 32) V!27553 V!27553 (_ BitVec 32) Int) ListLongMap!10025)

(assert (=> b!866827 (= lt!393491 (getCurrentListMapNoExtraKeys!2998 _keys!868 lt!393493 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!27553)

(assert (=> b!866827 (= lt!393482 (tuple2!11257 k!854 v!557))))

(assert (=> b!866827 (= lt!393481 (getCurrentListMapNoExtraKeys!2998 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29717 0))(
  ( (Unit!29718) )
))
(declare-fun lt!393492 () Unit!29717)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!572 (array!49918 array!49920 (_ BitVec 32) (_ BitVec 32) V!27553 V!27553 (_ BitVec 32) (_ BitVec 64) V!27553 (_ BitVec 32) Int) Unit!29717)

(assert (=> b!866827 (= lt!393492 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!572 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866828 () Bool)

(declare-fun e!482857 () Bool)

(declare-fun e!482860 () Bool)

(declare-fun mapRes!26918 () Bool)

(assert (=> b!866828 (= e!482857 (and e!482860 mapRes!26918))))

(declare-fun condMapEmpty!26918 () Bool)

(declare-fun mapDefault!26918 () ValueCell!8000)

