; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73864 () Bool)

(assert start!73864)

(declare-fun b_free!14797 () Bool)

(declare-fun b_next!14797 () Bool)

(assert (=> start!73864 (= b_free!14797 (not b_next!14797))))

(declare-fun tp!51896 () Bool)

(declare-fun b_and!24523 () Bool)

(assert (=> start!73864 (= tp!51896 b_and!24523)))

(declare-fun b!867760 () Bool)

(declare-fun res!589670 () Bool)

(declare-fun e!483322 () Bool)

(assert (=> b!867760 (=> (not res!589670) (not e!483322))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867760 (= res!589670 (validKeyInArray!0 k0!854))))

(declare-fun b!867761 () Bool)

(declare-fun e!483326 () Bool)

(declare-fun tp_is_empty!16933 () Bool)

(assert (=> b!867761 (= e!483326 tp_is_empty!16933)))

(declare-fun b!867762 () Bool)

(declare-fun res!589669 () Bool)

(assert (=> b!867762 (=> (not res!589669) (not e!483322))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867762 (= res!589669 (validMask!0 mask!1196))))

(declare-fun b!867763 () Bool)

(declare-fun res!589666 () Bool)

(assert (=> b!867763 (=> (not res!589666) (not e!483322))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50015 0))(
  ( (array!50016 (arr!24039 (Array (_ BitVec 32) (_ BitVec 64))) (size!24481 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50015)

(assert (=> b!867763 (= res!589666 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24481 _keys!868))))))

(declare-fun b!867764 () Bool)

(declare-fun res!589668 () Bool)

(assert (=> b!867764 (=> (not res!589668) (not e!483322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50015 (_ BitVec 32)) Bool)

(assert (=> b!867764 (= res!589668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867765 () Bool)

(declare-fun res!589667 () Bool)

(assert (=> b!867765 (=> (not res!589667) (not e!483322))))

(declare-datatypes ((List!17109 0))(
  ( (Nil!17106) (Cons!17105 (h!18236 (_ BitVec 64)) (t!24137 List!17109)) )
))
(declare-fun arrayNoDuplicates!0 (array!50015 (_ BitVec 32) List!17109) Bool)

(assert (=> b!867765 (= res!589667 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17106))))

(declare-fun res!589664 () Bool)

(assert (=> start!73864 (=> (not res!589664) (not e!483322))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73864 (= res!589664 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24481 _keys!868))))))

(assert (=> start!73864 e!483322))

(assert (=> start!73864 tp_is_empty!16933))

(assert (=> start!73864 true))

(assert (=> start!73864 tp!51896))

(declare-fun array_inv!19068 (array!50015) Bool)

(assert (=> start!73864 (array_inv!19068 _keys!868)))

(declare-datatypes ((V!27625 0))(
  ( (V!27626 (val!8514 Int)) )
))
(declare-datatypes ((ValueCell!8027 0))(
  ( (ValueCellFull!8027 (v!10933 V!27625)) (EmptyCell!8027) )
))
(declare-datatypes ((array!50017 0))(
  ( (array!50018 (arr!24040 (Array (_ BitVec 32) ValueCell!8027)) (size!24482 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50017)

(declare-fun e!483323 () Bool)

(declare-fun array_inv!19069 (array!50017) Bool)

(assert (=> start!73864 (and (array_inv!19069 _values!688) e!483323)))

(declare-fun b!867766 () Bool)

(declare-fun e!483324 () Bool)

(assert (=> b!867766 (= e!483322 e!483324)))

(declare-fun res!589671 () Bool)

(assert (=> b!867766 (=> (not res!589671) (not e!483324))))

(assert (=> b!867766 (= res!589671 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11322 0))(
  ( (tuple2!11323 (_1!5672 (_ BitVec 64)) (_2!5672 V!27625)) )
))
(declare-datatypes ((List!17110 0))(
  ( (Nil!17107) (Cons!17106 (h!18237 tuple2!11322) (t!24138 List!17110)) )
))
(declare-datatypes ((ListLongMap!10081 0))(
  ( (ListLongMap!10082 (toList!5056 List!17110)) )
))
(declare-fun lt!394088 () ListLongMap!10081)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!394087 () array!50017)

(declare-fun minValue!654 () V!27625)

(declare-fun zeroValue!654 () V!27625)

(declare-fun getCurrentListMapNoExtraKeys!3049 (array!50015 array!50017 (_ BitVec 32) (_ BitVec 32) V!27625 V!27625 (_ BitVec 32) Int) ListLongMap!10081)

(assert (=> b!867766 (= lt!394088 (getCurrentListMapNoExtraKeys!3049 _keys!868 lt!394087 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27625)

(assert (=> b!867766 (= lt!394087 (array!50018 (store (arr!24040 _values!688) i!612 (ValueCellFull!8027 v!557)) (size!24482 _values!688)))))

(declare-fun lt!394086 () ListLongMap!10081)

(assert (=> b!867766 (= lt!394086 (getCurrentListMapNoExtraKeys!3049 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867767 () Bool)

(declare-fun e!483325 () Bool)

(declare-fun mapRes!26999 () Bool)

(assert (=> b!867767 (= e!483323 (and e!483325 mapRes!26999))))

(declare-fun condMapEmpty!26999 () Bool)

(declare-fun mapDefault!26999 () ValueCell!8027)

(assert (=> b!867767 (= condMapEmpty!26999 (= (arr!24040 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8027)) mapDefault!26999)))))

(declare-fun b!867768 () Bool)

(declare-fun res!589665 () Bool)

(assert (=> b!867768 (=> (not res!589665) (not e!483322))))

(assert (=> b!867768 (= res!589665 (and (= (size!24482 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24481 _keys!868) (size!24482 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26999 () Bool)

(declare-fun tp!51895 () Bool)

(assert (=> mapNonEmpty!26999 (= mapRes!26999 (and tp!51895 e!483326))))

(declare-fun mapKey!26999 () (_ BitVec 32))

(declare-fun mapValue!26999 () ValueCell!8027)

(declare-fun mapRest!26999 () (Array (_ BitVec 32) ValueCell!8027))

(assert (=> mapNonEmpty!26999 (= (arr!24040 _values!688) (store mapRest!26999 mapKey!26999 mapValue!26999))))

(declare-fun b!867769 () Bool)

(assert (=> b!867769 (= e!483325 tp_is_empty!16933)))

(declare-fun b!867770 () Bool)

(assert (=> b!867770 (= e!483324 (not true))))

(declare-fun +!2421 (ListLongMap!10081 tuple2!11322) ListLongMap!10081)

(assert (=> b!867770 (= (getCurrentListMapNoExtraKeys!3049 _keys!868 lt!394087 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2421 (getCurrentListMapNoExtraKeys!3049 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11323 k0!854 v!557)))))

(declare-datatypes ((Unit!29729 0))(
  ( (Unit!29730) )
))
(declare-fun lt!394085 () Unit!29729)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!589 (array!50015 array!50017 (_ BitVec 32) (_ BitVec 32) V!27625 V!27625 (_ BitVec 32) (_ BitVec 64) V!27625 (_ BitVec 32) Int) Unit!29729)

(assert (=> b!867770 (= lt!394085 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!589 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26999 () Bool)

(assert (=> mapIsEmpty!26999 mapRes!26999))

(declare-fun b!867771 () Bool)

(declare-fun res!589663 () Bool)

(assert (=> b!867771 (=> (not res!589663) (not e!483322))))

(assert (=> b!867771 (= res!589663 (and (= (select (arr!24039 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73864 res!589664) b!867762))

(assert (= (and b!867762 res!589669) b!867768))

(assert (= (and b!867768 res!589665) b!867764))

(assert (= (and b!867764 res!589668) b!867765))

(assert (= (and b!867765 res!589667) b!867763))

(assert (= (and b!867763 res!589666) b!867760))

(assert (= (and b!867760 res!589670) b!867771))

(assert (= (and b!867771 res!589663) b!867766))

(assert (= (and b!867766 res!589671) b!867770))

(assert (= (and b!867767 condMapEmpty!26999) mapIsEmpty!26999))

(assert (= (and b!867767 (not condMapEmpty!26999)) mapNonEmpty!26999))

(get-info :version)

(assert (= (and mapNonEmpty!26999 ((_ is ValueCellFull!8027) mapValue!26999)) b!867761))

(assert (= (and b!867767 ((_ is ValueCellFull!8027) mapDefault!26999)) b!867769))

(assert (= start!73864 b!867767))

(declare-fun m!809019 () Bool)

(assert (=> b!867766 m!809019))

(declare-fun m!809021 () Bool)

(assert (=> b!867766 m!809021))

(declare-fun m!809023 () Bool)

(assert (=> b!867766 m!809023))

(declare-fun m!809025 () Bool)

(assert (=> b!867760 m!809025))

(declare-fun m!809027 () Bool)

(assert (=> b!867770 m!809027))

(declare-fun m!809029 () Bool)

(assert (=> b!867770 m!809029))

(assert (=> b!867770 m!809029))

(declare-fun m!809031 () Bool)

(assert (=> b!867770 m!809031))

(declare-fun m!809033 () Bool)

(assert (=> b!867770 m!809033))

(declare-fun m!809035 () Bool)

(assert (=> start!73864 m!809035))

(declare-fun m!809037 () Bool)

(assert (=> start!73864 m!809037))

(declare-fun m!809039 () Bool)

(assert (=> mapNonEmpty!26999 m!809039))

(declare-fun m!809041 () Bool)

(assert (=> b!867765 m!809041))

(declare-fun m!809043 () Bool)

(assert (=> b!867764 m!809043))

(declare-fun m!809045 () Bool)

(assert (=> b!867771 m!809045))

(declare-fun m!809047 () Bool)

(assert (=> b!867762 m!809047))

(check-sat (not b!867762) tp_is_empty!16933 (not b!867770) (not mapNonEmpty!26999) (not b!867765) b_and!24523 (not b!867764) (not start!73864) (not b_next!14797) (not b!867766) (not b!867760))
(check-sat b_and!24523 (not b_next!14797))
