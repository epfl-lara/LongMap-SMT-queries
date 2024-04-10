; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73972 () Bool)

(assert start!73972)

(declare-fun b_free!14887 () Bool)

(declare-fun b_next!14887 () Bool)

(assert (=> start!73972 (= b_free!14887 (not b_next!14887))))

(declare-fun tp!52165 () Bool)

(declare-fun b_and!24639 () Bool)

(assert (=> start!73972 (= tp!52165 b_and!24639)))

(declare-fun b!869619 () Bool)

(declare-fun res!590993 () Bool)

(declare-fun e!484281 () Bool)

(assert (=> b!869619 (=> (not res!590993) (not e!484281))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50194 0))(
  ( (array!50195 (arr!24128 (Array (_ BitVec 32) (_ BitVec 64))) (size!24568 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50194)

(declare-datatypes ((V!27745 0))(
  ( (V!27746 (val!8559 Int)) )
))
(declare-datatypes ((ValueCell!8072 0))(
  ( (ValueCellFull!8072 (v!10984 V!27745)) (EmptyCell!8072) )
))
(declare-datatypes ((array!50196 0))(
  ( (array!50197 (arr!24129 (Array (_ BitVec 32) ValueCell!8072)) (size!24569 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50196)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!869619 (= res!590993 (and (= (size!24569 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24568 _keys!868) (size!24569 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869620 () Bool)

(declare-fun res!590989 () Bool)

(assert (=> b!869620 (=> (not res!590989) (not e!484281))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869620 (= res!590989 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24568 _keys!868))))))

(declare-fun b!869621 () Bool)

(declare-fun e!484280 () Bool)

(assert (=> b!869621 (= e!484281 e!484280)))

(declare-fun res!590990 () Bool)

(assert (=> b!869621 (=> (not res!590990) (not e!484280))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869621 (= res!590990 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394864 () array!50196)

(declare-datatypes ((tuple2!11372 0))(
  ( (tuple2!11373 (_1!5697 (_ BitVec 64)) (_2!5697 V!27745)) )
))
(declare-datatypes ((List!17162 0))(
  ( (Nil!17159) (Cons!17158 (h!18289 tuple2!11372) (t!24199 List!17162)) )
))
(declare-datatypes ((ListLongMap!10141 0))(
  ( (ListLongMap!10142 (toList!5086 List!17162)) )
))
(declare-fun lt!394861 () ListLongMap!10141)

(declare-fun minValue!654 () V!27745)

(declare-fun zeroValue!654 () V!27745)

(declare-fun getCurrentListMapNoExtraKeys!3055 (array!50194 array!50196 (_ BitVec 32) (_ BitVec 32) V!27745 V!27745 (_ BitVec 32) Int) ListLongMap!10141)

(assert (=> b!869621 (= lt!394861 (getCurrentListMapNoExtraKeys!3055 _keys!868 lt!394864 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27745)

(assert (=> b!869621 (= lt!394864 (array!50197 (store (arr!24129 _values!688) i!612 (ValueCellFull!8072 v!557)) (size!24569 _values!688)))))

(declare-fun lt!394863 () ListLongMap!10141)

(assert (=> b!869621 (= lt!394863 (getCurrentListMapNoExtraKeys!3055 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869622 () Bool)

(declare-fun res!590995 () Bool)

(assert (=> b!869622 (=> (not res!590995) (not e!484281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50194 (_ BitVec 32)) Bool)

(assert (=> b!869622 (= res!590995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869623 () Bool)

(declare-fun e!484282 () Bool)

(declare-fun tp_is_empty!17023 () Bool)

(assert (=> b!869623 (= e!484282 tp_is_empty!17023)))

(declare-fun res!590996 () Bool)

(assert (=> start!73972 (=> (not res!590996) (not e!484281))))

(assert (=> start!73972 (= res!590996 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24568 _keys!868))))))

(assert (=> start!73972 e!484281))

(assert (=> start!73972 tp_is_empty!17023))

(assert (=> start!73972 true))

(assert (=> start!73972 tp!52165))

(declare-fun array_inv!19060 (array!50194) Bool)

(assert (=> start!73972 (array_inv!19060 _keys!868)))

(declare-fun e!484284 () Bool)

(declare-fun array_inv!19061 (array!50196) Bool)

(assert (=> start!73972 (and (array_inv!19061 _values!688) e!484284)))

(declare-fun b!869624 () Bool)

(declare-fun res!590992 () Bool)

(assert (=> b!869624 (=> (not res!590992) (not e!484281))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869624 (= res!590992 (validKeyInArray!0 k!854))))

(declare-fun b!869625 () Bool)

(declare-fun res!590994 () Bool)

(assert (=> b!869625 (=> (not res!590994) (not e!484281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869625 (= res!590994 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27134 () Bool)

(declare-fun mapRes!27134 () Bool)

(declare-fun tp!52164 () Bool)

(assert (=> mapNonEmpty!27134 (= mapRes!27134 (and tp!52164 e!484282))))

(declare-fun mapValue!27134 () ValueCell!8072)

(declare-fun mapRest!27134 () (Array (_ BitVec 32) ValueCell!8072))

(declare-fun mapKey!27134 () (_ BitVec 32))

(assert (=> mapNonEmpty!27134 (= (arr!24129 _values!688) (store mapRest!27134 mapKey!27134 mapValue!27134))))

(declare-fun b!869626 () Bool)

(assert (=> b!869626 (= e!484280 (not true))))

(declare-fun +!2426 (ListLongMap!10141 tuple2!11372) ListLongMap!10141)

(assert (=> b!869626 (= (getCurrentListMapNoExtraKeys!3055 _keys!868 lt!394864 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2426 (getCurrentListMapNoExtraKeys!3055 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11373 k!854 v!557)))))

(declare-datatypes ((Unit!29850 0))(
  ( (Unit!29851) )
))
(declare-fun lt!394862 () Unit!29850)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!620 (array!50194 array!50196 (_ BitVec 32) (_ BitVec 32) V!27745 V!27745 (_ BitVec 32) (_ BitVec 64) V!27745 (_ BitVec 32) Int) Unit!29850)

(assert (=> b!869626 (= lt!394862 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!620 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869627 () Bool)

(declare-fun res!590991 () Bool)

(assert (=> b!869627 (=> (not res!590991) (not e!484281))))

(declare-datatypes ((List!17163 0))(
  ( (Nil!17160) (Cons!17159 (h!18290 (_ BitVec 64)) (t!24200 List!17163)) )
))
(declare-fun arrayNoDuplicates!0 (array!50194 (_ BitVec 32) List!17163) Bool)

(assert (=> b!869627 (= res!590991 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17160))))

(declare-fun b!869628 () Bool)

(declare-fun e!484283 () Bool)

(assert (=> b!869628 (= e!484284 (and e!484283 mapRes!27134))))

(declare-fun condMapEmpty!27134 () Bool)

(declare-fun mapDefault!27134 () ValueCell!8072)

