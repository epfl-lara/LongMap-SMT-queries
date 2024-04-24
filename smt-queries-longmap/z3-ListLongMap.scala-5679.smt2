; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74026 () Bool)

(assert start!74026)

(declare-fun b_free!14773 () Bool)

(declare-fun b_next!14773 () Bool)

(assert (=> start!74026 (= b_free!14773 (not b_next!14773))))

(declare-fun tp!51824 () Bool)

(declare-fun b_and!24535 () Bool)

(assert (=> start!74026 (= tp!51824 b_and!24535)))

(declare-fun b!868470 () Bool)

(declare-fun res!589801 () Bool)

(declare-fun e!483841 () Bool)

(assert (=> b!868470 (=> (not res!589801) (not e!483841))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868470 (= res!589801 (validMask!0 mask!1196))))

(declare-fun b!868471 () Bool)

(declare-fun e!483838 () Bool)

(assert (=> b!868471 (= e!483838 (not true))))

(declare-datatypes ((V!27593 0))(
  ( (V!27594 (val!8502 Int)) )
))
(declare-datatypes ((ValueCell!8015 0))(
  ( (ValueCellFull!8015 (v!10927 V!27593)) (EmptyCell!8015) )
))
(declare-datatypes ((array!50027 0))(
  ( (array!50028 (arr!24040 (Array (_ BitVec 32) ValueCell!8015)) (size!24481 (_ BitVec 32))) )
))
(declare-fun lt!394538 () array!50027)

(declare-fun v!557 () V!27593)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50029 0))(
  ( (array!50030 (arr!24041 (Array (_ BitVec 32) (_ BitVec 64))) (size!24482 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50029)

(declare-fun _values!688 () array!50027)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27593)

(declare-fun zeroValue!654 () V!27593)

(declare-datatypes ((tuple2!11206 0))(
  ( (tuple2!11207 (_1!5614 (_ BitVec 64)) (_2!5614 V!27593)) )
))
(declare-datatypes ((List!17034 0))(
  ( (Nil!17031) (Cons!17030 (h!18167 tuple2!11206) (t!24063 List!17034)) )
))
(declare-datatypes ((ListLongMap!9977 0))(
  ( (ListLongMap!9978 (toList!5004 List!17034)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3048 (array!50029 array!50027 (_ BitVec 32) (_ BitVec 32) V!27593 V!27593 (_ BitVec 32) Int) ListLongMap!9977)

(declare-fun +!2406 (ListLongMap!9977 tuple2!11206) ListLongMap!9977)

(assert (=> b!868471 (= (getCurrentListMapNoExtraKeys!3048 _keys!868 lt!394538 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2406 (getCurrentListMapNoExtraKeys!3048 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11207 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29762 0))(
  ( (Unit!29763) )
))
(declare-fun lt!394539 () Unit!29762)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!577 (array!50029 array!50027 (_ BitVec 32) (_ BitVec 32) V!27593 V!27593 (_ BitVec 32) (_ BitVec 64) V!27593 (_ BitVec 32) Int) Unit!29762)

(assert (=> b!868471 (= lt!394539 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!577 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868472 () Bool)

(declare-fun e!483836 () Bool)

(declare-fun tp_is_empty!16909 () Bool)

(assert (=> b!868472 (= e!483836 tp_is_empty!16909)))

(declare-fun mapNonEmpty!26963 () Bool)

(declare-fun mapRes!26963 () Bool)

(declare-fun tp!51823 () Bool)

(declare-fun e!483839 () Bool)

(assert (=> mapNonEmpty!26963 (= mapRes!26963 (and tp!51823 e!483839))))

(declare-fun mapValue!26963 () ValueCell!8015)

(declare-fun mapRest!26963 () (Array (_ BitVec 32) ValueCell!8015))

(declare-fun mapKey!26963 () (_ BitVec 32))

(assert (=> mapNonEmpty!26963 (= (arr!24040 _values!688) (store mapRest!26963 mapKey!26963 mapValue!26963))))

(declare-fun b!868473 () Bool)

(declare-fun res!589795 () Bool)

(assert (=> b!868473 (=> (not res!589795) (not e!483841))))

(declare-datatypes ((List!17035 0))(
  ( (Nil!17032) (Cons!17031 (h!18168 (_ BitVec 64)) (t!24064 List!17035)) )
))
(declare-fun arrayNoDuplicates!0 (array!50029 (_ BitVec 32) List!17035) Bool)

(assert (=> b!868473 (= res!589795 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17032))))

(declare-fun b!868474 () Bool)

(assert (=> b!868474 (= e!483839 tp_is_empty!16909)))

(declare-fun b!868476 () Bool)

(declare-fun res!589799 () Bool)

(assert (=> b!868476 (=> (not res!589799) (not e!483841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868476 (= res!589799 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26963 () Bool)

(assert (=> mapIsEmpty!26963 mapRes!26963))

(declare-fun b!868477 () Bool)

(declare-fun res!589796 () Bool)

(assert (=> b!868477 (=> (not res!589796) (not e!483841))))

(assert (=> b!868477 (= res!589796 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24482 _keys!868))))))

(declare-fun res!589798 () Bool)

(assert (=> start!74026 (=> (not res!589798) (not e!483841))))

(assert (=> start!74026 (= res!589798 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24482 _keys!868))))))

(assert (=> start!74026 e!483841))

(assert (=> start!74026 tp_is_empty!16909))

(assert (=> start!74026 true))

(assert (=> start!74026 tp!51824))

(declare-fun array_inv!19048 (array!50029) Bool)

(assert (=> start!74026 (array_inv!19048 _keys!868)))

(declare-fun e!483840 () Bool)

(declare-fun array_inv!19049 (array!50027) Bool)

(assert (=> start!74026 (and (array_inv!19049 _values!688) e!483840)))

(declare-fun b!868475 () Bool)

(assert (=> b!868475 (= e!483841 e!483838)))

(declare-fun res!589797 () Bool)

(assert (=> b!868475 (=> (not res!589797) (not e!483838))))

(assert (=> b!868475 (= res!589797 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394540 () ListLongMap!9977)

(assert (=> b!868475 (= lt!394540 (getCurrentListMapNoExtraKeys!3048 _keys!868 lt!394538 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868475 (= lt!394538 (array!50028 (store (arr!24040 _values!688) i!612 (ValueCellFull!8015 v!557)) (size!24481 _values!688)))))

(declare-fun lt!394541 () ListLongMap!9977)

(assert (=> b!868475 (= lt!394541 (getCurrentListMapNoExtraKeys!3048 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868478 () Bool)

(assert (=> b!868478 (= e!483840 (and e!483836 mapRes!26963))))

(declare-fun condMapEmpty!26963 () Bool)

(declare-fun mapDefault!26963 () ValueCell!8015)

(assert (=> b!868478 (= condMapEmpty!26963 (= (arr!24040 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8015)) mapDefault!26963)))))

(declare-fun b!868479 () Bool)

(declare-fun res!589793 () Bool)

(assert (=> b!868479 (=> (not res!589793) (not e!483841))))

(assert (=> b!868479 (= res!589793 (and (= (select (arr!24041 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868480 () Bool)

(declare-fun res!589800 () Bool)

(assert (=> b!868480 (=> (not res!589800) (not e!483841))))

(assert (=> b!868480 (= res!589800 (and (= (size!24481 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24482 _keys!868) (size!24481 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868481 () Bool)

(declare-fun res!589794 () Bool)

(assert (=> b!868481 (=> (not res!589794) (not e!483841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50029 (_ BitVec 32)) Bool)

(assert (=> b!868481 (= res!589794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74026 res!589798) b!868470))

(assert (= (and b!868470 res!589801) b!868480))

(assert (= (and b!868480 res!589800) b!868481))

(assert (= (and b!868481 res!589794) b!868473))

(assert (= (and b!868473 res!589795) b!868477))

(assert (= (and b!868477 res!589796) b!868476))

(assert (= (and b!868476 res!589799) b!868479))

(assert (= (and b!868479 res!589793) b!868475))

(assert (= (and b!868475 res!589797) b!868471))

(assert (= (and b!868478 condMapEmpty!26963) mapIsEmpty!26963))

(assert (= (and b!868478 (not condMapEmpty!26963)) mapNonEmpty!26963))

(get-info :version)

(assert (= (and mapNonEmpty!26963 ((_ is ValueCellFull!8015) mapValue!26963)) b!868474))

(assert (= (and b!868478 ((_ is ValueCellFull!8015) mapDefault!26963)) b!868472))

(assert (= start!74026 b!868478))

(declare-fun m!810707 () Bool)

(assert (=> b!868479 m!810707))

(declare-fun m!810709 () Bool)

(assert (=> b!868475 m!810709))

(declare-fun m!810711 () Bool)

(assert (=> b!868475 m!810711))

(declare-fun m!810713 () Bool)

(assert (=> b!868475 m!810713))

(declare-fun m!810715 () Bool)

(assert (=> b!868470 m!810715))

(declare-fun m!810717 () Bool)

(assert (=> b!868481 m!810717))

(declare-fun m!810719 () Bool)

(assert (=> start!74026 m!810719))

(declare-fun m!810721 () Bool)

(assert (=> start!74026 m!810721))

(declare-fun m!810723 () Bool)

(assert (=> b!868473 m!810723))

(declare-fun m!810725 () Bool)

(assert (=> mapNonEmpty!26963 m!810725))

(declare-fun m!810727 () Bool)

(assert (=> b!868471 m!810727))

(declare-fun m!810729 () Bool)

(assert (=> b!868471 m!810729))

(assert (=> b!868471 m!810729))

(declare-fun m!810731 () Bool)

(assert (=> b!868471 m!810731))

(declare-fun m!810733 () Bool)

(assert (=> b!868471 m!810733))

(declare-fun m!810735 () Bool)

(assert (=> b!868476 m!810735))

(check-sat (not b!868476) b_and!24535 (not start!74026) (not b!868475) (not b!868471) (not b!868481) (not mapNonEmpty!26963) (not b!868473) (not b!868470) tp_is_empty!16909 (not b_next!14773))
(check-sat b_and!24535 (not b_next!14773))
