; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73618 () Bool)

(assert start!73618)

(declare-fun b_free!14551 () Bool)

(declare-fun b_next!14551 () Bool)

(assert (=> start!73618 (= b_free!14551 (not b_next!14551))))

(declare-fun tp!51157 () Bool)

(declare-fun b_and!24055 () Bool)

(assert (=> start!73618 (= tp!51157 b_and!24055)))

(declare-fun b!861793 () Bool)

(declare-datatypes ((Unit!29344 0))(
  ( (Unit!29345) )
))
(declare-fun e!480127 () Unit!29344)

(declare-fun Unit!29346 () Unit!29344)

(assert (=> b!861793 (= e!480127 Unit!29346)))

(declare-fun lt!388673 () Unit!29344)

(declare-datatypes ((array!49527 0))(
  ( (array!49528 (arr!23795 (Array (_ BitVec 32) (_ BitVec 64))) (size!24237 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49527)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49527 (_ BitVec 32) (_ BitVec 32)) Unit!29344)

(assert (=> b!861793 (= lt!388673 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16902 0))(
  ( (Nil!16899) (Cons!16898 (h!18029 (_ BitVec 64)) (t!23710 List!16902)) )
))
(declare-fun arrayNoDuplicates!0 (array!49527 (_ BitVec 32) List!16902) Bool)

(assert (=> b!861793 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16899)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!388680 () Unit!29344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49527 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29344)

(assert (=> b!861793 (= lt!388680 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861793 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388678 () Unit!29344)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49527 (_ BitVec 64) (_ BitVec 32) List!16902) Unit!29344)

(assert (=> b!861793 (= lt!388678 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16899))))

(assert (=> b!861793 false))

(declare-fun b!861794 () Bool)

(declare-fun e!480122 () Bool)

(declare-fun tp_is_empty!16687 () Bool)

(assert (=> b!861794 (= e!480122 tp_is_empty!16687)))

(declare-fun b!861795 () Bool)

(declare-fun res!585693 () Bool)

(declare-fun e!480124 () Bool)

(assert (=> b!861795 (=> (not res!585693) (not e!480124))))

(assert (=> b!861795 (= res!585693 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16899))))

(declare-fun mapNonEmpty!26630 () Bool)

(declare-fun mapRes!26630 () Bool)

(declare-fun tp!51158 () Bool)

(declare-fun e!480129 () Bool)

(assert (=> mapNonEmpty!26630 (= mapRes!26630 (and tp!51158 e!480129))))

(declare-fun mapKey!26630 () (_ BitVec 32))

(declare-datatypes ((V!27297 0))(
  ( (V!27298 (val!8391 Int)) )
))
(declare-datatypes ((ValueCell!7904 0))(
  ( (ValueCellFull!7904 (v!10810 V!27297)) (EmptyCell!7904) )
))
(declare-fun mapRest!26630 () (Array (_ BitVec 32) ValueCell!7904))

(declare-datatypes ((array!49529 0))(
  ( (array!49530 (arr!23796 (Array (_ BitVec 32) ValueCell!7904)) (size!24238 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49529)

(declare-fun mapValue!26630 () ValueCell!7904)

(assert (=> mapNonEmpty!26630 (= (arr!23796 _values!688) (store mapRest!26630 mapKey!26630 mapValue!26630))))

(declare-fun b!861796 () Bool)

(declare-fun e!480126 () Bool)

(assert (=> b!861796 (= e!480124 e!480126)))

(declare-fun res!585690 () Bool)

(assert (=> b!861796 (=> (not res!585690) (not e!480126))))

(assert (=> b!861796 (= res!585690 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!388672 () array!49529)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11106 0))(
  ( (tuple2!11107 (_1!5564 (_ BitVec 64)) (_2!5564 V!27297)) )
))
(declare-datatypes ((List!16903 0))(
  ( (Nil!16900) (Cons!16899 (h!18030 tuple2!11106) (t!23711 List!16903)) )
))
(declare-datatypes ((ListLongMap!9865 0))(
  ( (ListLongMap!9866 (toList!4948 List!16903)) )
))
(declare-fun lt!388674 () ListLongMap!9865)

(declare-fun minValue!654 () V!27297)

(declare-fun zeroValue!654 () V!27297)

(declare-fun getCurrentListMapNoExtraKeys!2951 (array!49527 array!49529 (_ BitVec 32) (_ BitVec 32) V!27297 V!27297 (_ BitVec 32) Int) ListLongMap!9865)

(assert (=> b!861796 (= lt!388674 (getCurrentListMapNoExtraKeys!2951 _keys!868 lt!388672 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27297)

(assert (=> b!861796 (= lt!388672 (array!49530 (store (arr!23796 _values!688) i!612 (ValueCellFull!7904 v!557)) (size!24238 _values!688)))))

(declare-fun lt!388679 () ListLongMap!9865)

(assert (=> b!861796 (= lt!388679 (getCurrentListMapNoExtraKeys!2951 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861797 () Bool)

(declare-fun res!585689 () Bool)

(assert (=> b!861797 (=> (not res!585689) (not e!480124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49527 (_ BitVec 32)) Bool)

(assert (=> b!861797 (= res!585689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861798 () Bool)

(assert (=> b!861798 (= e!480129 tp_is_empty!16687)))

(declare-fun b!861799 () Bool)

(declare-fun e!480125 () Bool)

(assert (=> b!861799 (= e!480125 (and e!480122 mapRes!26630))))

(declare-fun condMapEmpty!26630 () Bool)

(declare-fun mapDefault!26630 () ValueCell!7904)

(assert (=> b!861799 (= condMapEmpty!26630 (= (arr!23796 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7904)) mapDefault!26630)))))

(declare-fun b!861800 () Bool)

(declare-fun res!585695 () Bool)

(assert (=> b!861800 (=> (not res!585695) (not e!480124))))

(assert (=> b!861800 (= res!585695 (and (= (size!24238 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24237 _keys!868) (size!24238 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861802 () Bool)

(declare-fun res!585696 () Bool)

(assert (=> b!861802 (=> (not res!585696) (not e!480124))))

(assert (=> b!861802 (= res!585696 (and (= (select (arr!23795 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26630 () Bool)

(assert (=> mapIsEmpty!26630 mapRes!26630))

(declare-fun b!861803 () Bool)

(declare-fun Unit!29347 () Unit!29344)

(assert (=> b!861803 (= e!480127 Unit!29347)))

(declare-fun b!861804 () Bool)

(declare-fun res!585687 () Bool)

(assert (=> b!861804 (=> (not res!585687) (not e!480124))))

(assert (=> b!861804 (= res!585687 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24237 _keys!868))))))

(declare-fun b!861805 () Bool)

(declare-fun res!585694 () Bool)

(assert (=> b!861805 (=> (not res!585694) (not e!480124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861805 (= res!585694 (validMask!0 mask!1196))))

(declare-fun b!861806 () Bool)

(declare-fun res!585692 () Bool)

(assert (=> b!861806 (=> (not res!585692) (not e!480124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861806 (= res!585692 (validKeyInArray!0 k0!854))))

(declare-fun b!861807 () Bool)

(declare-fun e!480128 () Bool)

(assert (=> b!861807 (= e!480128 true)))

(assert (=> b!861807 (not (= (select (arr!23795 _keys!868) from!1053) k0!854))))

(declare-fun lt!388682 () Unit!29344)

(assert (=> b!861807 (= lt!388682 e!480127)))

(declare-fun c!91982 () Bool)

(assert (=> b!861807 (= c!91982 (= (select (arr!23795 _keys!868) from!1053) k0!854))))

(declare-fun lt!388675 () ListLongMap!9865)

(declare-fun +!2317 (ListLongMap!9865 tuple2!11106) ListLongMap!9865)

(declare-fun get!12555 (ValueCell!7904 V!27297) V!27297)

(declare-fun dynLambda!1124 (Int (_ BitVec 64)) V!27297)

(assert (=> b!861807 (= lt!388674 (+!2317 lt!388675 (tuple2!11107 (select (arr!23795 _keys!868) from!1053) (get!12555 (select (arr!23796 _values!688) from!1053) (dynLambda!1124 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!585688 () Bool)

(assert (=> start!73618 (=> (not res!585688) (not e!480124))))

(assert (=> start!73618 (= res!585688 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24237 _keys!868))))))

(assert (=> start!73618 e!480124))

(assert (=> start!73618 tp_is_empty!16687))

(assert (=> start!73618 true))

(assert (=> start!73618 tp!51157))

(declare-fun array_inv!18900 (array!49527) Bool)

(assert (=> start!73618 (array_inv!18900 _keys!868)))

(declare-fun array_inv!18901 (array!49529) Bool)

(assert (=> start!73618 (and (array_inv!18901 _values!688) e!480125)))

(declare-fun b!861801 () Bool)

(assert (=> b!861801 (= e!480126 (not e!480128))))

(declare-fun res!585691 () Bool)

(assert (=> b!861801 (=> res!585691 e!480128)))

(assert (=> b!861801 (= res!585691 (not (validKeyInArray!0 (select (arr!23795 _keys!868) from!1053))))))

(declare-fun lt!388676 () ListLongMap!9865)

(assert (=> b!861801 (= lt!388676 lt!388675)))

(declare-fun lt!388677 () ListLongMap!9865)

(assert (=> b!861801 (= lt!388675 (+!2317 lt!388677 (tuple2!11107 k0!854 v!557)))))

(assert (=> b!861801 (= lt!388676 (getCurrentListMapNoExtraKeys!2951 _keys!868 lt!388672 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861801 (= lt!388677 (getCurrentListMapNoExtraKeys!2951 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388681 () Unit!29344)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!506 (array!49527 array!49529 (_ BitVec 32) (_ BitVec 32) V!27297 V!27297 (_ BitVec 32) (_ BitVec 64) V!27297 (_ BitVec 32) Int) Unit!29344)

(assert (=> b!861801 (= lt!388681 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!506 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73618 res!585688) b!861805))

(assert (= (and b!861805 res!585694) b!861800))

(assert (= (and b!861800 res!585695) b!861797))

(assert (= (and b!861797 res!585689) b!861795))

(assert (= (and b!861795 res!585693) b!861804))

(assert (= (and b!861804 res!585687) b!861806))

(assert (= (and b!861806 res!585692) b!861802))

(assert (= (and b!861802 res!585696) b!861796))

(assert (= (and b!861796 res!585690) b!861801))

(assert (= (and b!861801 (not res!585691)) b!861807))

(assert (= (and b!861807 c!91982) b!861793))

(assert (= (and b!861807 (not c!91982)) b!861803))

(assert (= (and b!861799 condMapEmpty!26630) mapIsEmpty!26630))

(assert (= (and b!861799 (not condMapEmpty!26630)) mapNonEmpty!26630))

(get-info :version)

(assert (= (and mapNonEmpty!26630 ((_ is ValueCellFull!7904) mapValue!26630)) b!861798))

(assert (= (and b!861799 ((_ is ValueCellFull!7904) mapDefault!26630)) b!861794))

(assert (= start!73618 b!861799))

(declare-fun b_lambda!11885 () Bool)

(assert (=> (not b_lambda!11885) (not b!861807)))

(declare-fun t!23709 () Bool)

(declare-fun tb!4665 () Bool)

(assert (=> (and start!73618 (= defaultEntry!696 defaultEntry!696) t!23709) tb!4665))

(declare-fun result!8949 () Bool)

(assert (=> tb!4665 (= result!8949 tp_is_empty!16687)))

(assert (=> b!861807 t!23709))

(declare-fun b_and!24057 () Bool)

(assert (= b_and!24055 (and (=> t!23709 result!8949) b_and!24057)))

(declare-fun m!802239 () Bool)

(assert (=> b!861801 m!802239))

(declare-fun m!802241 () Bool)

(assert (=> b!861801 m!802241))

(declare-fun m!802243 () Bool)

(assert (=> b!861801 m!802243))

(assert (=> b!861801 m!802241))

(declare-fun m!802245 () Bool)

(assert (=> b!861801 m!802245))

(declare-fun m!802247 () Bool)

(assert (=> b!861801 m!802247))

(declare-fun m!802249 () Bool)

(assert (=> b!861801 m!802249))

(declare-fun m!802251 () Bool)

(assert (=> mapNonEmpty!26630 m!802251))

(declare-fun m!802253 () Bool)

(assert (=> b!861797 m!802253))

(declare-fun m!802255 () Bool)

(assert (=> b!861793 m!802255))

(declare-fun m!802257 () Bool)

(assert (=> b!861793 m!802257))

(declare-fun m!802259 () Bool)

(assert (=> b!861793 m!802259))

(declare-fun m!802261 () Bool)

(assert (=> b!861793 m!802261))

(declare-fun m!802263 () Bool)

(assert (=> b!861793 m!802263))

(declare-fun m!802265 () Bool)

(assert (=> b!861806 m!802265))

(declare-fun m!802267 () Bool)

(assert (=> b!861805 m!802267))

(declare-fun m!802269 () Bool)

(assert (=> b!861802 m!802269))

(declare-fun m!802271 () Bool)

(assert (=> b!861807 m!802271))

(declare-fun m!802273 () Bool)

(assert (=> b!861807 m!802273))

(declare-fun m!802275 () Bool)

(assert (=> b!861807 m!802275))

(assert (=> b!861807 m!802271))

(declare-fun m!802277 () Bool)

(assert (=> b!861807 m!802277))

(assert (=> b!861807 m!802241))

(assert (=> b!861807 m!802273))

(declare-fun m!802279 () Bool)

(assert (=> start!73618 m!802279))

(declare-fun m!802281 () Bool)

(assert (=> start!73618 m!802281))

(declare-fun m!802283 () Bool)

(assert (=> b!861796 m!802283))

(declare-fun m!802285 () Bool)

(assert (=> b!861796 m!802285))

(declare-fun m!802287 () Bool)

(assert (=> b!861796 m!802287))

(declare-fun m!802289 () Bool)

(assert (=> b!861795 m!802289))

(check-sat tp_is_empty!16687 (not b!861801) (not b_lambda!11885) (not b!861795) (not b!861796) (not b_next!14551) (not b!861797) (not b!861807) (not b!861806) (not start!73618) (not mapNonEmpty!26630) (not b!861793) (not b!861805) b_and!24057)
(check-sat b_and!24057 (not b_next!14551))
