; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73860 () Bool)

(assert start!73860)

(declare-fun b_free!14775 () Bool)

(declare-fun b_next!14775 () Bool)

(assert (=> start!73860 (= b_free!14775 (not b_next!14775))))

(declare-fun tp!51829 () Bool)

(declare-fun b_and!24527 () Bool)

(assert (=> start!73860 (= tp!51829 b_and!24527)))

(declare-fun b!867603 () Bool)

(declare-fun e!483276 () Bool)

(declare-fun tp_is_empty!16911 () Bool)

(assert (=> b!867603 (= e!483276 tp_is_empty!16911)))

(declare-fun b!867604 () Bool)

(declare-fun res!589476 () Bool)

(declare-fun e!483272 () Bool)

(assert (=> b!867604 (=> (not res!589476) (not e!483272))))

(declare-datatypes ((array!49982 0))(
  ( (array!49983 (arr!24022 (Array (_ BitVec 32) (_ BitVec 64))) (size!24462 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49982)

(declare-datatypes ((List!17080 0))(
  ( (Nil!17077) (Cons!17076 (h!18207 (_ BitVec 64)) (t!24117 List!17080)) )
))
(declare-fun arrayNoDuplicates!0 (array!49982 (_ BitVec 32) List!17080) Bool)

(assert (=> b!867604 (= res!589476 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17077))))

(declare-fun mapIsEmpty!26966 () Bool)

(declare-fun mapRes!26966 () Bool)

(assert (=> mapIsEmpty!26966 mapRes!26966))

(declare-fun b!867605 () Bool)

(declare-fun res!589483 () Bool)

(assert (=> b!867605 (=> (not res!589483) (not e!483272))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!867605 (= res!589483 (and (= (select (arr!24022 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867606 () Bool)

(declare-fun res!589479 () Bool)

(assert (=> b!867606 (=> (not res!589479) (not e!483272))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27595 0))(
  ( (V!27596 (val!8503 Int)) )
))
(declare-datatypes ((ValueCell!8016 0))(
  ( (ValueCellFull!8016 (v!10928 V!27595)) (EmptyCell!8016) )
))
(declare-datatypes ((array!49984 0))(
  ( (array!49985 (arr!24023 (Array (_ BitVec 32) ValueCell!8016)) (size!24463 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49984)

(assert (=> b!867606 (= res!589479 (and (= (size!24463 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24462 _keys!868) (size!24463 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867607 () Bool)

(declare-fun e!483273 () Bool)

(assert (=> b!867607 (= e!483273 tp_is_empty!16911)))

(declare-fun mapNonEmpty!26966 () Bool)

(declare-fun tp!51828 () Bool)

(assert (=> mapNonEmpty!26966 (= mapRes!26966 (and tp!51828 e!483273))))

(declare-fun mapKey!26966 () (_ BitVec 32))

(declare-fun mapValue!26966 () ValueCell!8016)

(declare-fun mapRest!26966 () (Array (_ BitVec 32) ValueCell!8016))

(assert (=> mapNonEmpty!26966 (= (arr!24023 _values!688) (store mapRest!26966 mapKey!26966 mapValue!26966))))

(declare-fun b!867608 () Bool)

(declare-fun res!589480 () Bool)

(assert (=> b!867608 (=> (not res!589480) (not e!483272))))

(assert (=> b!867608 (= res!589480 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24462 _keys!868))))))

(declare-fun res!589478 () Bool)

(assert (=> start!73860 (=> (not res!589478) (not e!483272))))

(assert (=> start!73860 (= res!589478 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24462 _keys!868))))))

(assert (=> start!73860 e!483272))

(assert (=> start!73860 tp_is_empty!16911))

(assert (=> start!73860 true))

(assert (=> start!73860 tp!51829))

(declare-fun array_inv!18980 (array!49982) Bool)

(assert (=> start!73860 (array_inv!18980 _keys!868)))

(declare-fun e!483274 () Bool)

(declare-fun array_inv!18981 (array!49984) Bool)

(assert (=> start!73860 (and (array_inv!18981 _values!688) e!483274)))

(declare-fun b!867609 () Bool)

(assert (=> b!867609 (= e!483274 (and e!483276 mapRes!26966))))

(declare-fun condMapEmpty!26966 () Bool)

(declare-fun mapDefault!26966 () ValueCell!8016)

(assert (=> b!867609 (= condMapEmpty!26966 (= (arr!24023 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8016)) mapDefault!26966)))))

(declare-fun b!867610 () Bool)

(declare-fun res!589481 () Bool)

(assert (=> b!867610 (=> (not res!589481) (not e!483272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867610 (= res!589481 (validKeyInArray!0 k0!854))))

(declare-fun b!867611 () Bool)

(declare-fun e!483277 () Bool)

(assert (=> b!867611 (= e!483272 e!483277)))

(declare-fun res!589484 () Bool)

(assert (=> b!867611 (=> (not res!589484) (not e!483277))))

(assert (=> b!867611 (= res!589484 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394189 () array!49984)

(declare-datatypes ((tuple2!11280 0))(
  ( (tuple2!11281 (_1!5651 (_ BitVec 64)) (_2!5651 V!27595)) )
))
(declare-datatypes ((List!17081 0))(
  ( (Nil!17078) (Cons!17077 (h!18208 tuple2!11280) (t!24118 List!17081)) )
))
(declare-datatypes ((ListLongMap!10049 0))(
  ( (ListLongMap!10050 (toList!5040 List!17081)) )
))
(declare-fun lt!394191 () ListLongMap!10049)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27595)

(declare-fun zeroValue!654 () V!27595)

(declare-fun getCurrentListMapNoExtraKeys!3009 (array!49982 array!49984 (_ BitVec 32) (_ BitVec 32) V!27595 V!27595 (_ BitVec 32) Int) ListLongMap!10049)

(assert (=> b!867611 (= lt!394191 (getCurrentListMapNoExtraKeys!3009 _keys!868 lt!394189 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27595)

(assert (=> b!867611 (= lt!394189 (array!49985 (store (arr!24023 _values!688) i!612 (ValueCellFull!8016 v!557)) (size!24463 _values!688)))))

(declare-fun lt!394190 () ListLongMap!10049)

(assert (=> b!867611 (= lt!394190 (getCurrentListMapNoExtraKeys!3009 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867612 () Bool)

(assert (=> b!867612 (= e!483277 (not true))))

(declare-fun +!2386 (ListLongMap!10049 tuple2!11280) ListLongMap!10049)

(assert (=> b!867612 (= (getCurrentListMapNoExtraKeys!3009 _keys!868 lt!394189 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2386 (getCurrentListMapNoExtraKeys!3009 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11281 k0!854 v!557)))))

(declare-datatypes ((Unit!29770 0))(
  ( (Unit!29771) )
))
(declare-fun lt!394192 () Unit!29770)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!580 (array!49982 array!49984 (_ BitVec 32) (_ BitVec 32) V!27595 V!27595 (_ BitVec 32) (_ BitVec 64) V!27595 (_ BitVec 32) Int) Unit!29770)

(assert (=> b!867612 (= lt!394192 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!580 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867613 () Bool)

(declare-fun res!589482 () Bool)

(assert (=> b!867613 (=> (not res!589482) (not e!483272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867613 (= res!589482 (validMask!0 mask!1196))))

(declare-fun b!867614 () Bool)

(declare-fun res!589477 () Bool)

(assert (=> b!867614 (=> (not res!589477) (not e!483272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49982 (_ BitVec 32)) Bool)

(assert (=> b!867614 (= res!589477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73860 res!589478) b!867613))

(assert (= (and b!867613 res!589482) b!867606))

(assert (= (and b!867606 res!589479) b!867614))

(assert (= (and b!867614 res!589477) b!867604))

(assert (= (and b!867604 res!589476) b!867608))

(assert (= (and b!867608 res!589480) b!867610))

(assert (= (and b!867610 res!589481) b!867605))

(assert (= (and b!867605 res!589483) b!867611))

(assert (= (and b!867611 res!589484) b!867612))

(assert (= (and b!867609 condMapEmpty!26966) mapIsEmpty!26966))

(assert (= (and b!867609 (not condMapEmpty!26966)) mapNonEmpty!26966))

(get-info :version)

(assert (= (and mapNonEmpty!26966 ((_ is ValueCellFull!8016) mapValue!26966)) b!867607))

(assert (= (and b!867609 ((_ is ValueCellFull!8016) mapDefault!26966)) b!867603))

(assert (= start!73860 b!867609))

(declare-fun m!809447 () Bool)

(assert (=> mapNonEmpty!26966 m!809447))

(declare-fun m!809449 () Bool)

(assert (=> start!73860 m!809449))

(declare-fun m!809451 () Bool)

(assert (=> start!73860 m!809451))

(declare-fun m!809453 () Bool)

(assert (=> b!867613 m!809453))

(declare-fun m!809455 () Bool)

(assert (=> b!867611 m!809455))

(declare-fun m!809457 () Bool)

(assert (=> b!867611 m!809457))

(declare-fun m!809459 () Bool)

(assert (=> b!867611 m!809459))

(declare-fun m!809461 () Bool)

(assert (=> b!867610 m!809461))

(declare-fun m!809463 () Bool)

(assert (=> b!867614 m!809463))

(declare-fun m!809465 () Bool)

(assert (=> b!867605 m!809465))

(declare-fun m!809467 () Bool)

(assert (=> b!867604 m!809467))

(declare-fun m!809469 () Bool)

(assert (=> b!867612 m!809469))

(declare-fun m!809471 () Bool)

(assert (=> b!867612 m!809471))

(assert (=> b!867612 m!809471))

(declare-fun m!809473 () Bool)

(assert (=> b!867612 m!809473))

(declare-fun m!809475 () Bool)

(assert (=> b!867612 m!809475))

(check-sat (not b!867611) (not b!867610) tp_is_empty!16911 (not b!867604) (not start!73860) (not b!867614) (not b_next!14775) (not b!867613) b_and!24527 (not mapNonEmpty!26966) (not b!867612))
(check-sat b_and!24527 (not b_next!14775))
