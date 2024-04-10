; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73482 () Bool)

(assert start!73482)

(declare-fun b_free!14397 () Bool)

(declare-fun b_next!14397 () Bool)

(assert (=> start!73482 (= b_free!14397 (not b_next!14397))))

(declare-fun tp!50694 () Bool)

(declare-fun b_and!23773 () Bool)

(assert (=> start!73482 (= tp!50694 b_and!23773)))

(declare-fun b!858331 () Bool)

(declare-fun e!478357 () Bool)

(declare-fun tp_is_empty!16533 () Bool)

(assert (=> b!858331 (= e!478357 tp_is_empty!16533)))

(declare-fun mapNonEmpty!26399 () Bool)

(declare-fun mapRes!26399 () Bool)

(declare-fun tp!50695 () Bool)

(assert (=> mapNonEmpty!26399 (= mapRes!26399 (and tp!50695 e!478357))))

(declare-datatypes ((V!27091 0))(
  ( (V!27092 (val!8314 Int)) )
))
(declare-datatypes ((ValueCell!7827 0))(
  ( (ValueCellFull!7827 (v!10739 V!27091)) (EmptyCell!7827) )
))
(declare-fun mapValue!26399 () ValueCell!7827)

(declare-fun mapKey!26399 () (_ BitVec 32))

(declare-fun mapRest!26399 () (Array (_ BitVec 32) ValueCell!7827))

(declare-datatypes ((array!49254 0))(
  ( (array!49255 (arr!23658 (Array (_ BitVec 32) ValueCell!7827)) (size!24098 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49254)

(assert (=> mapNonEmpty!26399 (= (arr!23658 _values!688) (store mapRest!26399 mapKey!26399 mapValue!26399))))

(declare-fun b!858332 () Bool)

(declare-fun res!583111 () Bool)

(declare-fun e!478354 () Bool)

(assert (=> b!858332 (=> (not res!583111) (not e!478354))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49256 0))(
  ( (array!49257 (arr!23659 (Array (_ BitVec 32) (_ BitVec 64))) (size!24099 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49256)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!858332 (= res!583111 (and (= (select (arr!23659 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858333 () Bool)

(declare-fun res!583117 () Bool)

(assert (=> b!858333 (=> (not res!583117) (not e!478354))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858333 (= res!583117 (validMask!0 mask!1196))))

(declare-fun b!858334 () Bool)

(declare-fun e!478359 () Bool)

(assert (=> b!858334 (= e!478359 true)))

(declare-datatypes ((tuple2!10976 0))(
  ( (tuple2!10977 (_1!5499 (_ BitVec 64)) (_2!5499 V!27091)) )
))
(declare-datatypes ((List!16784 0))(
  ( (Nil!16781) (Cons!16780 (h!17911 tuple2!10976) (t!23447 List!16784)) )
))
(declare-datatypes ((ListLongMap!9745 0))(
  ( (ListLongMap!9746 (toList!4888 List!16784)) )
))
(declare-fun lt!386664 () ListLongMap!9745)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386668 () ListLongMap!9745)

(declare-fun +!2241 (ListLongMap!9745 tuple2!10976) ListLongMap!9745)

(declare-fun get!12457 (ValueCell!7827 V!27091) V!27091)

(declare-fun dynLambda!1081 (Int (_ BitVec 64)) V!27091)

(assert (=> b!858334 (= lt!386664 (+!2241 lt!386668 (tuple2!10977 (select (arr!23659 _keys!868) from!1053) (get!12457 (select (arr!23658 _values!688) from!1053) (dynLambda!1081 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858335 () Bool)

(declare-fun e!478358 () Bool)

(assert (=> b!858335 (= e!478358 tp_is_empty!16533)))

(declare-fun b!858336 () Bool)

(declare-fun res!583115 () Bool)

(assert (=> b!858336 (=> (not res!583115) (not e!478354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49256 (_ BitVec 32)) Bool)

(assert (=> b!858336 (= res!583115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858338 () Bool)

(declare-fun e!478356 () Bool)

(assert (=> b!858338 (= e!478356 (and e!478358 mapRes!26399))))

(declare-fun condMapEmpty!26399 () Bool)

(declare-fun mapDefault!26399 () ValueCell!7827)

(assert (=> b!858338 (= condMapEmpty!26399 (= (arr!23658 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7827)) mapDefault!26399)))))

(declare-fun b!858339 () Bool)

(declare-fun res!583114 () Bool)

(assert (=> b!858339 (=> (not res!583114) (not e!478354))))

(declare-datatypes ((List!16785 0))(
  ( (Nil!16782) (Cons!16781 (h!17912 (_ BitVec 64)) (t!23448 List!16785)) )
))
(declare-fun arrayNoDuplicates!0 (array!49256 (_ BitVec 32) List!16785) Bool)

(assert (=> b!858339 (= res!583114 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16782))))

(declare-fun b!858340 () Bool)

(declare-fun res!583110 () Bool)

(assert (=> b!858340 (=> (not res!583110) (not e!478354))))

(assert (=> b!858340 (= res!583110 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24099 _keys!868))))))

(declare-fun b!858341 () Bool)

(declare-fun res!583109 () Bool)

(assert (=> b!858341 (=> (not res!583109) (not e!478354))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!858341 (= res!583109 (and (= (size!24098 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24099 _keys!868) (size!24098 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858342 () Bool)

(declare-fun e!478355 () Bool)

(assert (=> b!858342 (= e!478354 e!478355)))

(declare-fun res!583112 () Bool)

(assert (=> b!858342 (=> (not res!583112) (not e!478355))))

(assert (=> b!858342 (= res!583112 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386666 () array!49254)

(declare-fun minValue!654 () V!27091)

(declare-fun zeroValue!654 () V!27091)

(declare-fun getCurrentListMapNoExtraKeys!2869 (array!49256 array!49254 (_ BitVec 32) (_ BitVec 32) V!27091 V!27091 (_ BitVec 32) Int) ListLongMap!9745)

(assert (=> b!858342 (= lt!386664 (getCurrentListMapNoExtraKeys!2869 _keys!868 lt!386666 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27091)

(assert (=> b!858342 (= lt!386666 (array!49255 (store (arr!23658 _values!688) i!612 (ValueCellFull!7827 v!557)) (size!24098 _values!688)))))

(declare-fun lt!386662 () ListLongMap!9745)

(assert (=> b!858342 (= lt!386662 (getCurrentListMapNoExtraKeys!2869 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858337 () Bool)

(assert (=> b!858337 (= e!478355 (not e!478359))))

(declare-fun res!583118 () Bool)

(assert (=> b!858337 (=> res!583118 e!478359)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858337 (= res!583118 (not (validKeyInArray!0 (select (arr!23659 _keys!868) from!1053))))))

(declare-fun lt!386663 () ListLongMap!9745)

(assert (=> b!858337 (= lt!386663 lt!386668)))

(declare-fun lt!386665 () ListLongMap!9745)

(assert (=> b!858337 (= lt!386668 (+!2241 lt!386665 (tuple2!10977 k0!854 v!557)))))

(assert (=> b!858337 (= lt!386663 (getCurrentListMapNoExtraKeys!2869 _keys!868 lt!386666 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858337 (= lt!386665 (getCurrentListMapNoExtraKeys!2869 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29267 0))(
  ( (Unit!29268) )
))
(declare-fun lt!386667 () Unit!29267)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!461 (array!49256 array!49254 (_ BitVec 32) (_ BitVec 32) V!27091 V!27091 (_ BitVec 32) (_ BitVec 64) V!27091 (_ BitVec 32) Int) Unit!29267)

(assert (=> b!858337 (= lt!386667 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!461 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!583116 () Bool)

(assert (=> start!73482 (=> (not res!583116) (not e!478354))))

(assert (=> start!73482 (= res!583116 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24099 _keys!868))))))

(assert (=> start!73482 e!478354))

(assert (=> start!73482 tp_is_empty!16533))

(assert (=> start!73482 true))

(assert (=> start!73482 tp!50694))

(declare-fun array_inv!18738 (array!49256) Bool)

(assert (=> start!73482 (array_inv!18738 _keys!868)))

(declare-fun array_inv!18739 (array!49254) Bool)

(assert (=> start!73482 (and (array_inv!18739 _values!688) e!478356)))

(declare-fun mapIsEmpty!26399 () Bool)

(assert (=> mapIsEmpty!26399 mapRes!26399))

(declare-fun b!858343 () Bool)

(declare-fun res!583113 () Bool)

(assert (=> b!858343 (=> (not res!583113) (not e!478354))))

(assert (=> b!858343 (= res!583113 (validKeyInArray!0 k0!854))))

(assert (= (and start!73482 res!583116) b!858333))

(assert (= (and b!858333 res!583117) b!858341))

(assert (= (and b!858341 res!583109) b!858336))

(assert (= (and b!858336 res!583115) b!858339))

(assert (= (and b!858339 res!583114) b!858340))

(assert (= (and b!858340 res!583110) b!858343))

(assert (= (and b!858343 res!583113) b!858332))

(assert (= (and b!858332 res!583111) b!858342))

(assert (= (and b!858342 res!583112) b!858337))

(assert (= (and b!858337 (not res!583118)) b!858334))

(assert (= (and b!858338 condMapEmpty!26399) mapIsEmpty!26399))

(assert (= (and b!858338 (not condMapEmpty!26399)) mapNonEmpty!26399))

(get-info :version)

(assert (= (and mapNonEmpty!26399 ((_ is ValueCellFull!7827) mapValue!26399)) b!858331))

(assert (= (and b!858338 ((_ is ValueCellFull!7827) mapDefault!26399)) b!858335))

(assert (= start!73482 b!858338))

(declare-fun b_lambda!11749 () Bool)

(assert (=> (not b_lambda!11749) (not b!858334)))

(declare-fun t!23446 () Bool)

(declare-fun tb!4519 () Bool)

(assert (=> (and start!73482 (= defaultEntry!696 defaultEntry!696) t!23446) tb!4519))

(declare-fun result!8649 () Bool)

(assert (=> tb!4519 (= result!8649 tp_is_empty!16533)))

(assert (=> b!858334 t!23446))

(declare-fun b_and!23775 () Bool)

(assert (= b_and!23773 (and (=> t!23446 result!8649) b_and!23775)))

(declare-fun m!799043 () Bool)

(assert (=> start!73482 m!799043))

(declare-fun m!799045 () Bool)

(assert (=> start!73482 m!799045))

(declare-fun m!799047 () Bool)

(assert (=> b!858339 m!799047))

(declare-fun m!799049 () Bool)

(assert (=> b!858336 m!799049))

(declare-fun m!799051 () Bool)

(assert (=> b!858334 m!799051))

(declare-fun m!799053 () Bool)

(assert (=> b!858334 m!799053))

(declare-fun m!799055 () Bool)

(assert (=> b!858334 m!799055))

(declare-fun m!799057 () Bool)

(assert (=> b!858334 m!799057))

(assert (=> b!858334 m!799053))

(declare-fun m!799059 () Bool)

(assert (=> b!858334 m!799059))

(assert (=> b!858334 m!799055))

(declare-fun m!799061 () Bool)

(assert (=> b!858342 m!799061))

(declare-fun m!799063 () Bool)

(assert (=> b!858342 m!799063))

(declare-fun m!799065 () Bool)

(assert (=> b!858342 m!799065))

(declare-fun m!799067 () Bool)

(assert (=> b!858332 m!799067))

(declare-fun m!799069 () Bool)

(assert (=> b!858333 m!799069))

(declare-fun m!799071 () Bool)

(assert (=> mapNonEmpty!26399 m!799071))

(declare-fun m!799073 () Bool)

(assert (=> b!858343 m!799073))

(declare-fun m!799075 () Bool)

(assert (=> b!858337 m!799075))

(declare-fun m!799077 () Bool)

(assert (=> b!858337 m!799077))

(assert (=> b!858337 m!799059))

(declare-fun m!799079 () Bool)

(assert (=> b!858337 m!799079))

(assert (=> b!858337 m!799059))

(declare-fun m!799081 () Bool)

(assert (=> b!858337 m!799081))

(declare-fun m!799083 () Bool)

(assert (=> b!858337 m!799083))

(check-sat (not b!858334) (not b!858342) (not b!858339) (not b!858333) (not mapNonEmpty!26399) (not start!73482) (not b!858336) (not b!858343) (not b!858337) b_and!23775 (not b_next!14397) (not b_lambda!11749) tp_is_empty!16533)
(check-sat b_and!23775 (not b_next!14397))
