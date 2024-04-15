; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73846 () Bool)

(assert start!73846)

(declare-fun b_free!14779 () Bool)

(declare-fun b_next!14779 () Bool)

(assert (=> start!73846 (= b_free!14779 (not b_next!14779))))

(declare-fun tp!51841 () Bool)

(declare-fun b_and!24505 () Bool)

(assert (=> start!73846 (= tp!51841 b_and!24505)))

(declare-fun b!867436 () Bool)

(declare-fun e!483161 () Bool)

(declare-fun e!483163 () Bool)

(assert (=> b!867436 (= e!483161 e!483163)))

(declare-fun res!589426 () Bool)

(assert (=> b!867436 (=> (not res!589426) (not e!483163))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!867436 (= res!589426 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27601 0))(
  ( (V!27602 (val!8505 Int)) )
))
(declare-datatypes ((ValueCell!8018 0))(
  ( (ValueCellFull!8018 (v!10924 V!27601)) (EmptyCell!8018) )
))
(declare-datatypes ((array!49979 0))(
  ( (array!49980 (arr!24021 (Array (_ BitVec 32) ValueCell!8018)) (size!24463 (_ BitVec 32))) )
))
(declare-fun lt!393980 () array!49979)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49981 0))(
  ( (array!49982 (arr!24022 (Array (_ BitVec 32) (_ BitVec 64))) (size!24464 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49981)

(declare-fun minValue!654 () V!27601)

(declare-fun zeroValue!654 () V!27601)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11308 0))(
  ( (tuple2!11309 (_1!5665 (_ BitVec 64)) (_2!5665 V!27601)) )
))
(declare-datatypes ((List!17097 0))(
  ( (Nil!17094) (Cons!17093 (h!18224 tuple2!11308) (t!24125 List!17097)) )
))
(declare-datatypes ((ListLongMap!10067 0))(
  ( (ListLongMap!10068 (toList!5049 List!17097)) )
))
(declare-fun lt!393979 () ListLongMap!10067)

(declare-fun getCurrentListMapNoExtraKeys!3042 (array!49981 array!49979 (_ BitVec 32) (_ BitVec 32) V!27601 V!27601 (_ BitVec 32) Int) ListLongMap!10067)

(assert (=> b!867436 (= lt!393979 (getCurrentListMapNoExtraKeys!3042 _keys!868 lt!393980 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27601)

(declare-fun _values!688 () array!49979)

(assert (=> b!867436 (= lt!393980 (array!49980 (store (arr!24021 _values!688) i!612 (ValueCellFull!8018 v!557)) (size!24463 _values!688)))))

(declare-fun lt!393977 () ListLongMap!10067)

(assert (=> b!867436 (= lt!393977 (getCurrentListMapNoExtraKeys!3042 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867437 () Bool)

(declare-fun res!589428 () Bool)

(assert (=> b!867437 (=> (not res!589428) (not e!483161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867437 (= res!589428 (validMask!0 mask!1196))))

(declare-fun b!867438 () Bool)

(declare-fun e!483160 () Bool)

(declare-fun tp_is_empty!16915 () Bool)

(assert (=> b!867438 (= e!483160 tp_is_empty!16915)))

(declare-fun b!867439 () Bool)

(declare-fun res!589423 () Bool)

(assert (=> b!867439 (=> (not res!589423) (not e!483161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49981 (_ BitVec 32)) Bool)

(assert (=> b!867439 (= res!589423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867440 () Bool)

(assert (=> b!867440 (= e!483163 (not true))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2415 (ListLongMap!10067 tuple2!11308) ListLongMap!10067)

(assert (=> b!867440 (= (getCurrentListMapNoExtraKeys!3042 _keys!868 lt!393980 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2415 (getCurrentListMapNoExtraKeys!3042 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11309 k0!854 v!557)))))

(declare-datatypes ((Unit!29717 0))(
  ( (Unit!29718) )
))
(declare-fun lt!393978 () Unit!29717)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!583 (array!49981 array!49979 (_ BitVec 32) (_ BitVec 32) V!27601 V!27601 (_ BitVec 32) (_ BitVec 64) V!27601 (_ BitVec 32) Int) Unit!29717)

(assert (=> b!867440 (= lt!393978 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!583 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867442 () Bool)

(declare-fun res!589427 () Bool)

(assert (=> b!867442 (=> (not res!589427) (not e!483161))))

(assert (=> b!867442 (= res!589427 (and (= (select (arr!24022 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867443 () Bool)

(declare-fun res!589422 () Bool)

(assert (=> b!867443 (=> (not res!589422) (not e!483161))))

(declare-datatypes ((List!17098 0))(
  ( (Nil!17095) (Cons!17094 (h!18225 (_ BitVec 64)) (t!24126 List!17098)) )
))
(declare-fun arrayNoDuplicates!0 (array!49981 (_ BitVec 32) List!17098) Bool)

(assert (=> b!867443 (= res!589422 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17095))))

(declare-fun b!867444 () Bool)

(declare-fun res!589425 () Bool)

(assert (=> b!867444 (=> (not res!589425) (not e!483161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867444 (= res!589425 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26972 () Bool)

(declare-fun mapRes!26972 () Bool)

(declare-fun tp!51842 () Bool)

(assert (=> mapNonEmpty!26972 (= mapRes!26972 (and tp!51842 e!483160))))

(declare-fun mapValue!26972 () ValueCell!8018)

(declare-fun mapRest!26972 () (Array (_ BitVec 32) ValueCell!8018))

(declare-fun mapKey!26972 () (_ BitVec 32))

(assert (=> mapNonEmpty!26972 (= (arr!24021 _values!688) (store mapRest!26972 mapKey!26972 mapValue!26972))))

(declare-fun mapIsEmpty!26972 () Bool)

(assert (=> mapIsEmpty!26972 mapRes!26972))

(declare-fun b!867445 () Bool)

(declare-fun e!483164 () Bool)

(assert (=> b!867445 (= e!483164 tp_is_empty!16915)))

(declare-fun b!867441 () Bool)

(declare-fun res!589420 () Bool)

(assert (=> b!867441 (=> (not res!589420) (not e!483161))))

(assert (=> b!867441 (= res!589420 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24464 _keys!868))))))

(declare-fun res!589421 () Bool)

(assert (=> start!73846 (=> (not res!589421) (not e!483161))))

(assert (=> start!73846 (= res!589421 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24464 _keys!868))))))

(assert (=> start!73846 e!483161))

(assert (=> start!73846 tp_is_empty!16915))

(assert (=> start!73846 true))

(assert (=> start!73846 tp!51841))

(declare-fun array_inv!19056 (array!49981) Bool)

(assert (=> start!73846 (array_inv!19056 _keys!868)))

(declare-fun e!483165 () Bool)

(declare-fun array_inv!19057 (array!49979) Bool)

(assert (=> start!73846 (and (array_inv!19057 _values!688) e!483165)))

(declare-fun b!867446 () Bool)

(declare-fun res!589424 () Bool)

(assert (=> b!867446 (=> (not res!589424) (not e!483161))))

(assert (=> b!867446 (= res!589424 (and (= (size!24463 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24464 _keys!868) (size!24463 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867447 () Bool)

(assert (=> b!867447 (= e!483165 (and e!483164 mapRes!26972))))

(declare-fun condMapEmpty!26972 () Bool)

(declare-fun mapDefault!26972 () ValueCell!8018)

(assert (=> b!867447 (= condMapEmpty!26972 (= (arr!24021 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8018)) mapDefault!26972)))))

(assert (= (and start!73846 res!589421) b!867437))

(assert (= (and b!867437 res!589428) b!867446))

(assert (= (and b!867446 res!589424) b!867439))

(assert (= (and b!867439 res!589423) b!867443))

(assert (= (and b!867443 res!589422) b!867441))

(assert (= (and b!867441 res!589420) b!867444))

(assert (= (and b!867444 res!589425) b!867442))

(assert (= (and b!867442 res!589427) b!867436))

(assert (= (and b!867436 res!589426) b!867440))

(assert (= (and b!867447 condMapEmpty!26972) mapIsEmpty!26972))

(assert (= (and b!867447 (not condMapEmpty!26972)) mapNonEmpty!26972))

(get-info :version)

(assert (= (and mapNonEmpty!26972 ((_ is ValueCellFull!8018) mapValue!26972)) b!867438))

(assert (= (and b!867447 ((_ is ValueCellFull!8018) mapDefault!26972)) b!867445))

(assert (= start!73846 b!867447))

(declare-fun m!808749 () Bool)

(assert (=> b!867436 m!808749))

(declare-fun m!808751 () Bool)

(assert (=> b!867436 m!808751))

(declare-fun m!808753 () Bool)

(assert (=> b!867436 m!808753))

(declare-fun m!808755 () Bool)

(assert (=> start!73846 m!808755))

(declare-fun m!808757 () Bool)

(assert (=> start!73846 m!808757))

(declare-fun m!808759 () Bool)

(assert (=> b!867443 m!808759))

(declare-fun m!808761 () Bool)

(assert (=> b!867444 m!808761))

(declare-fun m!808763 () Bool)

(assert (=> mapNonEmpty!26972 m!808763))

(declare-fun m!808765 () Bool)

(assert (=> b!867442 m!808765))

(declare-fun m!808767 () Bool)

(assert (=> b!867440 m!808767))

(declare-fun m!808769 () Bool)

(assert (=> b!867440 m!808769))

(assert (=> b!867440 m!808769))

(declare-fun m!808771 () Bool)

(assert (=> b!867440 m!808771))

(declare-fun m!808773 () Bool)

(assert (=> b!867440 m!808773))

(declare-fun m!808775 () Bool)

(assert (=> b!867439 m!808775))

(declare-fun m!808777 () Bool)

(assert (=> b!867437 m!808777))

(check-sat (not start!73846) (not b_next!14779) (not b!867440) (not mapNonEmpty!26972) (not b!867439) tp_is_empty!16915 b_and!24505 (not b!867443) (not b!867444) (not b!867437) (not b!867436))
(check-sat b_and!24505 (not b_next!14779))
