; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73840 () Bool)

(assert start!73840)

(declare-fun b_free!14773 () Bool)

(declare-fun b_next!14773 () Bool)

(assert (=> start!73840 (= b_free!14773 (not b_next!14773))))

(declare-fun tp!51823 () Bool)

(declare-fun b_and!24499 () Bool)

(assert (=> start!73840 (= tp!51823 b_and!24499)))

(declare-fun b!867329 () Bool)

(declare-fun e!483110 () Bool)

(declare-fun tp_is_empty!16909 () Bool)

(assert (=> b!867329 (= e!483110 tp_is_empty!16909)))

(declare-fun mapNonEmpty!26963 () Bool)

(declare-fun mapRes!26963 () Bool)

(declare-fun tp!51824 () Bool)

(declare-fun e!483106 () Bool)

(assert (=> mapNonEmpty!26963 (= mapRes!26963 (and tp!51824 e!483106))))

(declare-datatypes ((V!27593 0))(
  ( (V!27594 (val!8502 Int)) )
))
(declare-datatypes ((ValueCell!8015 0))(
  ( (ValueCellFull!8015 (v!10921 V!27593)) (EmptyCell!8015) )
))
(declare-fun mapRest!26963 () (Array (_ BitVec 32) ValueCell!8015))

(declare-fun mapKey!26963 () (_ BitVec 32))

(declare-fun mapValue!26963 () ValueCell!8015)

(declare-datatypes ((array!49967 0))(
  ( (array!49968 (arr!24015 (Array (_ BitVec 32) ValueCell!8015)) (size!24457 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49967)

(assert (=> mapNonEmpty!26963 (= (arr!24015 _values!688) (store mapRest!26963 mapKey!26963 mapValue!26963))))

(declare-fun b!867330 () Bool)

(assert (=> b!867330 (= e!483106 tp_is_empty!16909)))

(declare-fun mapIsEmpty!26963 () Bool)

(assert (=> mapIsEmpty!26963 mapRes!26963))

(declare-fun b!867331 () Bool)

(declare-fun res!589340 () Bool)

(declare-fun e!483107 () Bool)

(assert (=> b!867331 (=> (not res!589340) (not e!483107))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49969 0))(
  ( (array!49970 (arr!24016 (Array (_ BitVec 32) (_ BitVec 64))) (size!24458 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49969)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!867331 (= res!589340 (and (= (select (arr!24016 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867332 () Bool)

(declare-fun e!483109 () Bool)

(assert (=> b!867332 (= e!483109 (and e!483110 mapRes!26963))))

(declare-fun condMapEmpty!26963 () Bool)

(declare-fun mapDefault!26963 () ValueCell!8015)

(assert (=> b!867332 (= condMapEmpty!26963 (= (arr!24015 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8015)) mapDefault!26963)))))

(declare-fun b!867333 () Bool)

(declare-fun res!589345 () Bool)

(assert (=> b!867333 (=> (not res!589345) (not e!483107))))

(assert (=> b!867333 (= res!589345 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24458 _keys!868))))))

(declare-fun b!867334 () Bool)

(declare-fun res!589339 () Bool)

(assert (=> b!867334 (=> (not res!589339) (not e!483107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867334 (= res!589339 (validKeyInArray!0 k0!854))))

(declare-fun b!867335 () Bool)

(declare-fun res!589342 () Bool)

(assert (=> b!867335 (=> (not res!589342) (not e!483107))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!867335 (= res!589342 (and (= (size!24457 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24458 _keys!868) (size!24457 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867328 () Bool)

(declare-fun res!589346 () Bool)

(assert (=> b!867328 (=> (not res!589346) (not e!483107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867328 (= res!589346 (validMask!0 mask!1196))))

(declare-fun res!589347 () Bool)

(assert (=> start!73840 (=> (not res!589347) (not e!483107))))

(assert (=> start!73840 (= res!589347 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24458 _keys!868))))))

(assert (=> start!73840 e!483107))

(assert (=> start!73840 tp_is_empty!16909))

(assert (=> start!73840 true))

(assert (=> start!73840 tp!51823))

(declare-fun array_inv!19050 (array!49969) Bool)

(assert (=> start!73840 (array_inv!19050 _keys!868)))

(declare-fun array_inv!19051 (array!49967) Bool)

(assert (=> start!73840 (and (array_inv!19051 _values!688) e!483109)))

(declare-fun b!867336 () Bool)

(declare-fun e!483108 () Bool)

(assert (=> b!867336 (= e!483108 (not true))))

(declare-fun v!557 () V!27593)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27593)

(declare-fun zeroValue!654 () V!27593)

(declare-fun lt!393942 () array!49967)

(declare-datatypes ((tuple2!11302 0))(
  ( (tuple2!11303 (_1!5662 (_ BitVec 64)) (_2!5662 V!27593)) )
))
(declare-datatypes ((List!17091 0))(
  ( (Nil!17088) (Cons!17087 (h!18218 tuple2!11302) (t!24119 List!17091)) )
))
(declare-datatypes ((ListLongMap!10061 0))(
  ( (ListLongMap!10062 (toList!5046 List!17091)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3039 (array!49969 array!49967 (_ BitVec 32) (_ BitVec 32) V!27593 V!27593 (_ BitVec 32) Int) ListLongMap!10061)

(declare-fun +!2412 (ListLongMap!10061 tuple2!11302) ListLongMap!10061)

(assert (=> b!867336 (= (getCurrentListMapNoExtraKeys!3039 _keys!868 lt!393942 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2412 (getCurrentListMapNoExtraKeys!3039 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11303 k0!854 v!557)))))

(declare-datatypes ((Unit!29711 0))(
  ( (Unit!29712) )
))
(declare-fun lt!393941 () Unit!29711)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!580 (array!49969 array!49967 (_ BitVec 32) (_ BitVec 32) V!27593 V!27593 (_ BitVec 32) (_ BitVec 64) V!27593 (_ BitVec 32) Int) Unit!29711)

(assert (=> b!867336 (= lt!393941 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!580 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867337 () Bool)

(declare-fun res!589344 () Bool)

(assert (=> b!867337 (=> (not res!589344) (not e!483107))))

(declare-datatypes ((List!17092 0))(
  ( (Nil!17089) (Cons!17088 (h!18219 (_ BitVec 64)) (t!24120 List!17092)) )
))
(declare-fun arrayNoDuplicates!0 (array!49969 (_ BitVec 32) List!17092) Bool)

(assert (=> b!867337 (= res!589344 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17089))))

(declare-fun b!867338 () Bool)

(declare-fun res!589343 () Bool)

(assert (=> b!867338 (=> (not res!589343) (not e!483107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49969 (_ BitVec 32)) Bool)

(assert (=> b!867338 (= res!589343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867339 () Bool)

(assert (=> b!867339 (= e!483107 e!483108)))

(declare-fun res!589341 () Bool)

(assert (=> b!867339 (=> (not res!589341) (not e!483108))))

(assert (=> b!867339 (= res!589341 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!393943 () ListLongMap!10061)

(assert (=> b!867339 (= lt!393943 (getCurrentListMapNoExtraKeys!3039 _keys!868 lt!393942 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867339 (= lt!393942 (array!49968 (store (arr!24015 _values!688) i!612 (ValueCellFull!8015 v!557)) (size!24457 _values!688)))))

(declare-fun lt!393944 () ListLongMap!10061)

(assert (=> b!867339 (= lt!393944 (getCurrentListMapNoExtraKeys!3039 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73840 res!589347) b!867328))

(assert (= (and b!867328 res!589346) b!867335))

(assert (= (and b!867335 res!589342) b!867338))

(assert (= (and b!867338 res!589343) b!867337))

(assert (= (and b!867337 res!589344) b!867333))

(assert (= (and b!867333 res!589345) b!867334))

(assert (= (and b!867334 res!589339) b!867331))

(assert (= (and b!867331 res!589340) b!867339))

(assert (= (and b!867339 res!589341) b!867336))

(assert (= (and b!867332 condMapEmpty!26963) mapIsEmpty!26963))

(assert (= (and b!867332 (not condMapEmpty!26963)) mapNonEmpty!26963))

(get-info :version)

(assert (= (and mapNonEmpty!26963 ((_ is ValueCellFull!8015) mapValue!26963)) b!867330))

(assert (= (and b!867332 ((_ is ValueCellFull!8015) mapDefault!26963)) b!867329))

(assert (= start!73840 b!867332))

(declare-fun m!808659 () Bool)

(assert (=> b!867337 m!808659))

(declare-fun m!808661 () Bool)

(assert (=> mapNonEmpty!26963 m!808661))

(declare-fun m!808663 () Bool)

(assert (=> b!867331 m!808663))

(declare-fun m!808665 () Bool)

(assert (=> b!867334 m!808665))

(declare-fun m!808667 () Bool)

(assert (=> b!867336 m!808667))

(declare-fun m!808669 () Bool)

(assert (=> b!867336 m!808669))

(assert (=> b!867336 m!808669))

(declare-fun m!808671 () Bool)

(assert (=> b!867336 m!808671))

(declare-fun m!808673 () Bool)

(assert (=> b!867336 m!808673))

(declare-fun m!808675 () Bool)

(assert (=> start!73840 m!808675))

(declare-fun m!808677 () Bool)

(assert (=> start!73840 m!808677))

(declare-fun m!808679 () Bool)

(assert (=> b!867339 m!808679))

(declare-fun m!808681 () Bool)

(assert (=> b!867339 m!808681))

(declare-fun m!808683 () Bool)

(assert (=> b!867339 m!808683))

(declare-fun m!808685 () Bool)

(assert (=> b!867338 m!808685))

(declare-fun m!808687 () Bool)

(assert (=> b!867328 m!808687))

(check-sat (not mapNonEmpty!26963) b_and!24499 tp_is_empty!16909 (not b!867328) (not b_next!14773) (not b!867338) (not b!867337) (not b!867339) (not start!73840) (not b!867334) (not b!867336))
(check-sat b_and!24499 (not b_next!14773))
