; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73804 () Bool)

(assert start!73804)

(declare-fun b_free!14737 () Bool)

(declare-fun b_next!14737 () Bool)

(assert (=> start!73804 (= b_free!14737 (not b_next!14737))))

(declare-fun tp!51716 () Bool)

(declare-fun b_and!24427 () Bool)

(assert (=> start!73804 (= tp!51716 b_and!24427)))

(declare-fun b!866436 () Bool)

(declare-datatypes ((Unit!29649 0))(
  ( (Unit!29650) )
))
(declare-fun e!482628 () Unit!29649)

(declare-fun Unit!29651 () Unit!29649)

(assert (=> b!866436 (= e!482628 Unit!29651)))

(declare-fun mapNonEmpty!26909 () Bool)

(declare-fun mapRes!26909 () Bool)

(declare-fun tp!51715 () Bool)

(declare-fun e!482631 () Bool)

(assert (=> mapNonEmpty!26909 (= mapRes!26909 (and tp!51715 e!482631))))

(declare-datatypes ((V!27545 0))(
  ( (V!27546 (val!8484 Int)) )
))
(declare-datatypes ((ValueCell!7997 0))(
  ( (ValueCellFull!7997 (v!10903 V!27545)) (EmptyCell!7997) )
))
(declare-fun mapValue!26909 () ValueCell!7997)

(declare-fun mapRest!26909 () (Array (_ BitVec 32) ValueCell!7997))

(declare-datatypes ((array!49895 0))(
  ( (array!49896 (arr!23979 (Array (_ BitVec 32) ValueCell!7997)) (size!24421 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49895)

(declare-fun mapKey!26909 () (_ BitVec 32))

(assert (=> mapNonEmpty!26909 (= (arr!23979 _values!688) (store mapRest!26909 mapKey!26909 mapValue!26909))))

(declare-fun b!866437 () Bool)

(declare-fun tp_is_empty!16873 () Bool)

(assert (=> b!866437 (= e!482631 tp_is_empty!16873)))

(declare-fun b!866438 () Bool)

(declare-fun e!482626 () Bool)

(declare-fun e!482633 () Bool)

(assert (=> b!866438 (= e!482626 (and e!482633 mapRes!26909))))

(declare-fun condMapEmpty!26909 () Bool)

(declare-fun mapDefault!26909 () ValueCell!7997)

(assert (=> b!866438 (= condMapEmpty!26909 (= (arr!23979 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7997)) mapDefault!26909)))))

(declare-fun res!588753 () Bool)

(declare-fun e!482634 () Bool)

(assert (=> start!73804 (=> (not res!588753) (not e!482634))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49897 0))(
  ( (array!49898 (arr!23980 (Array (_ BitVec 32) (_ BitVec 64))) (size!24422 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49897)

(assert (=> start!73804 (= res!588753 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24422 _keys!868))))))

(assert (=> start!73804 e!482634))

(assert (=> start!73804 tp_is_empty!16873))

(assert (=> start!73804 true))

(assert (=> start!73804 tp!51716))

(declare-fun array_inv!19028 (array!49897) Bool)

(assert (=> start!73804 (array_inv!19028 _keys!868)))

(declare-fun array_inv!19029 (array!49895) Bool)

(assert (=> start!73804 (and (array_inv!19029 _values!688) e!482626)))

(declare-fun b!866439 () Bool)

(declare-fun res!588757 () Bool)

(assert (=> b!866439 (=> (not res!588757) (not e!482634))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!866439 (= res!588757 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24422 _keys!868))))))

(declare-fun b!866440 () Bool)

(declare-fun e!482630 () Bool)

(assert (=> b!866440 (= e!482634 e!482630)))

(declare-fun res!588752 () Bool)

(assert (=> b!866440 (=> (not res!588752) (not e!482630))))

(assert (=> b!866440 (= res!588752 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!393115 () array!49895)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27545)

(declare-fun zeroValue!654 () V!27545)

(declare-datatypes ((tuple2!11272 0))(
  ( (tuple2!11273 (_1!5647 (_ BitVec 64)) (_2!5647 V!27545)) )
))
(declare-datatypes ((List!17060 0))(
  ( (Nil!17057) (Cons!17056 (h!18187 tuple2!11272) (t!24054 List!17060)) )
))
(declare-datatypes ((ListLongMap!10031 0))(
  ( (ListLongMap!10032 (toList!5031 List!17060)) )
))
(declare-fun lt!393104 () ListLongMap!10031)

(declare-fun getCurrentListMapNoExtraKeys!3026 (array!49897 array!49895 (_ BitVec 32) (_ BitVec 32) V!27545 V!27545 (_ BitVec 32) Int) ListLongMap!10031)

(assert (=> b!866440 (= lt!393104 (getCurrentListMapNoExtraKeys!3026 _keys!868 lt!393115 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27545)

(assert (=> b!866440 (= lt!393115 (array!49896 (store (arr!23979 _values!688) i!612 (ValueCellFull!7997 v!557)) (size!24421 _values!688)))))

(declare-fun lt!393112 () ListLongMap!10031)

(assert (=> b!866440 (= lt!393112 (getCurrentListMapNoExtraKeys!3026 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866441 () Bool)

(declare-fun res!588758 () Bool)

(assert (=> b!866441 (=> (not res!588758) (not e!482634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49897 (_ BitVec 32)) Bool)

(assert (=> b!866441 (= res!588758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866442 () Bool)

(declare-fun res!588754 () Bool)

(assert (=> b!866442 (=> (not res!588754) (not e!482634))))

(assert (=> b!866442 (= res!588754 (and (= (size!24421 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24422 _keys!868) (size!24421 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866443 () Bool)

(declare-fun res!588755 () Bool)

(assert (=> b!866443 (=> (not res!588755) (not e!482634))))

(declare-datatypes ((List!17061 0))(
  ( (Nil!17058) (Cons!17057 (h!18188 (_ BitVec 64)) (t!24055 List!17061)) )
))
(declare-fun arrayNoDuplicates!0 (array!49897 (_ BitVec 32) List!17061) Bool)

(assert (=> b!866443 (= res!588755 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17058))))

(declare-fun b!866444 () Bool)

(declare-fun e!482632 () Bool)

(assert (=> b!866444 (= e!482630 (not e!482632))))

(declare-fun res!588750 () Bool)

(assert (=> b!866444 (=> res!588750 e!482632)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866444 (= res!588750 (not (validKeyInArray!0 (select (arr!23980 _keys!868) from!1053))))))

(declare-fun lt!393107 () ListLongMap!10031)

(declare-fun lt!393102 () ListLongMap!10031)

(assert (=> b!866444 (= lt!393107 lt!393102)))

(declare-fun lt!393101 () ListLongMap!10031)

(declare-fun lt!393108 () tuple2!11272)

(declare-fun +!2397 (ListLongMap!10031 tuple2!11272) ListLongMap!10031)

(assert (=> b!866444 (= lt!393102 (+!2397 lt!393101 lt!393108))))

(assert (=> b!866444 (= lt!393107 (getCurrentListMapNoExtraKeys!3026 _keys!868 lt!393115 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!866444 (= lt!393108 (tuple2!11273 k0!854 v!557))))

(assert (=> b!866444 (= lt!393101 (getCurrentListMapNoExtraKeys!3026 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393111 () Unit!29649)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!568 (array!49897 array!49895 (_ BitVec 32) (_ BitVec 32) V!27545 V!27545 (_ BitVec 32) (_ BitVec 64) V!27545 (_ BitVec 32) Int) Unit!29649)

(assert (=> b!866444 (= lt!393111 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!568 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866445 () Bool)

(declare-fun res!588751 () Bool)

(assert (=> b!866445 (=> (not res!588751) (not e!482634))))

(assert (=> b!866445 (= res!588751 (and (= (select (arr!23980 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866446 () Bool)

(declare-fun e!482627 () Bool)

(assert (=> b!866446 (= e!482632 e!482627)))

(declare-fun res!588749 () Bool)

(assert (=> b!866446 (=> res!588749 e!482627)))

(assert (=> b!866446 (= res!588749 (= k0!854 (select (arr!23980 _keys!868) from!1053)))))

(assert (=> b!866446 (not (= (select (arr!23980 _keys!868) from!1053) k0!854))))

(declare-fun lt!393113 () Unit!29649)

(assert (=> b!866446 (= lt!393113 e!482628)))

(declare-fun c!92261 () Bool)

(assert (=> b!866446 (= c!92261 (= (select (arr!23980 _keys!868) from!1053) k0!854))))

(declare-fun lt!393110 () ListLongMap!10031)

(assert (=> b!866446 (= lt!393104 lt!393110)))

(declare-fun lt!393106 () tuple2!11272)

(assert (=> b!866446 (= lt!393110 (+!2397 lt!393102 lt!393106))))

(declare-fun lt!393116 () V!27545)

(assert (=> b!866446 (= lt!393106 (tuple2!11273 (select (arr!23980 _keys!868) from!1053) lt!393116))))

(declare-fun get!12684 (ValueCell!7997 V!27545) V!27545)

(declare-fun dynLambda!1191 (Int (_ BitVec 64)) V!27545)

(assert (=> b!866446 (= lt!393116 (get!12684 (select (arr!23979 _values!688) from!1053) (dynLambda!1191 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!26909 () Bool)

(assert (=> mapIsEmpty!26909 mapRes!26909))

(declare-fun b!866447 () Bool)

(assert (=> b!866447 (= e!482633 tp_is_empty!16873)))

(declare-fun b!866448 () Bool)

(assert (=> b!866448 (= e!482627 true)))

(assert (=> b!866448 (= lt!393110 (+!2397 (+!2397 lt!393101 lt!393106) lt!393108))))

(declare-fun lt!393109 () Unit!29649)

(declare-fun addCommutativeForDiffKeys!535 (ListLongMap!10031 (_ BitVec 64) V!27545 (_ BitVec 64) V!27545) Unit!29649)

(assert (=> b!866448 (= lt!393109 (addCommutativeForDiffKeys!535 lt!393101 k0!854 v!557 (select (arr!23980 _keys!868) from!1053) lt!393116))))

(declare-fun b!866449 () Bool)

(declare-fun res!588759 () Bool)

(assert (=> b!866449 (=> (not res!588759) (not e!482634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866449 (= res!588759 (validMask!0 mask!1196))))

(declare-fun b!866450 () Bool)

(declare-fun res!588756 () Bool)

(assert (=> b!866450 (=> (not res!588756) (not e!482634))))

(assert (=> b!866450 (= res!588756 (validKeyInArray!0 k0!854))))

(declare-fun b!866451 () Bool)

(declare-fun Unit!29652 () Unit!29649)

(assert (=> b!866451 (= e!482628 Unit!29652)))

(declare-fun lt!393105 () Unit!29649)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49897 (_ BitVec 32) (_ BitVec 32)) Unit!29649)

(assert (=> b!866451 (= lt!393105 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866451 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17058)))

(declare-fun lt!393103 () Unit!29649)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49897 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29649)

(assert (=> b!866451 (= lt!393103 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866451 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393114 () Unit!29649)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49897 (_ BitVec 64) (_ BitVec 32) List!17061) Unit!29649)

(assert (=> b!866451 (= lt!393114 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17058))))

(assert (=> b!866451 false))

(assert (= (and start!73804 res!588753) b!866449))

(assert (= (and b!866449 res!588759) b!866442))

(assert (= (and b!866442 res!588754) b!866441))

(assert (= (and b!866441 res!588758) b!866443))

(assert (= (and b!866443 res!588755) b!866439))

(assert (= (and b!866439 res!588757) b!866450))

(assert (= (and b!866450 res!588756) b!866445))

(assert (= (and b!866445 res!588751) b!866440))

(assert (= (and b!866440 res!588752) b!866444))

(assert (= (and b!866444 (not res!588750)) b!866446))

(assert (= (and b!866446 c!92261) b!866451))

(assert (= (and b!866446 (not c!92261)) b!866436))

(assert (= (and b!866446 (not res!588749)) b!866448))

(assert (= (and b!866438 condMapEmpty!26909) mapIsEmpty!26909))

(assert (= (and b!866438 (not condMapEmpty!26909)) mapNonEmpty!26909))

(get-info :version)

(assert (= (and mapNonEmpty!26909 ((_ is ValueCellFull!7997) mapValue!26909)) b!866437))

(assert (= (and b!866438 ((_ is ValueCellFull!7997) mapDefault!26909)) b!866447))

(assert (= start!73804 b!866438))

(declare-fun b_lambda!12071 () Bool)

(assert (=> (not b_lambda!12071) (not b!866446)))

(declare-fun t!24053 () Bool)

(declare-fun tb!4851 () Bool)

(assert (=> (and start!73804 (= defaultEntry!696 defaultEntry!696) t!24053) tb!4851))

(declare-fun result!9321 () Bool)

(assert (=> tb!4851 (= result!9321 tp_is_empty!16873)))

(assert (=> b!866446 t!24053))

(declare-fun b_and!24429 () Bool)

(assert (= b_and!24427 (and (=> t!24053 result!9321) b_and!24429)))

(declare-fun m!807615 () Bool)

(assert (=> start!73804 m!807615))

(declare-fun m!807617 () Bool)

(assert (=> start!73804 m!807617))

(declare-fun m!807619 () Bool)

(assert (=> b!866451 m!807619))

(declare-fun m!807621 () Bool)

(assert (=> b!866451 m!807621))

(declare-fun m!807623 () Bool)

(assert (=> b!866451 m!807623))

(declare-fun m!807625 () Bool)

(assert (=> b!866451 m!807625))

(declare-fun m!807627 () Bool)

(assert (=> b!866451 m!807627))

(declare-fun m!807629 () Bool)

(assert (=> b!866449 m!807629))

(declare-fun m!807631 () Bool)

(assert (=> b!866450 m!807631))

(declare-fun m!807633 () Bool)

(assert (=> b!866444 m!807633))

(declare-fun m!807635 () Bool)

(assert (=> b!866444 m!807635))

(declare-fun m!807637 () Bool)

(assert (=> b!866444 m!807637))

(declare-fun m!807639 () Bool)

(assert (=> b!866444 m!807639))

(declare-fun m!807641 () Bool)

(assert (=> b!866444 m!807641))

(assert (=> b!866444 m!807639))

(declare-fun m!807643 () Bool)

(assert (=> b!866444 m!807643))

(declare-fun m!807645 () Bool)

(assert (=> b!866440 m!807645))

(declare-fun m!807647 () Bool)

(assert (=> b!866440 m!807647))

(declare-fun m!807649 () Bool)

(assert (=> b!866440 m!807649))

(declare-fun m!807651 () Bool)

(assert (=> b!866443 m!807651))

(declare-fun m!807653 () Bool)

(assert (=> b!866448 m!807653))

(assert (=> b!866448 m!807653))

(declare-fun m!807655 () Bool)

(assert (=> b!866448 m!807655))

(assert (=> b!866448 m!807639))

(assert (=> b!866448 m!807639))

(declare-fun m!807657 () Bool)

(assert (=> b!866448 m!807657))

(declare-fun m!807659 () Bool)

(assert (=> b!866445 m!807659))

(declare-fun m!807661 () Bool)

(assert (=> mapNonEmpty!26909 m!807661))

(declare-fun m!807663 () Bool)

(assert (=> b!866441 m!807663))

(declare-fun m!807665 () Bool)

(assert (=> b!866446 m!807665))

(declare-fun m!807667 () Bool)

(assert (=> b!866446 m!807667))

(declare-fun m!807669 () Bool)

(assert (=> b!866446 m!807669))

(declare-fun m!807671 () Bool)

(assert (=> b!866446 m!807671))

(assert (=> b!866446 m!807667))

(assert (=> b!866446 m!807639))

(assert (=> b!866446 m!807669))

(check-sat (not b!866440) (not b_next!14737) (not b!866443) (not b!866450) (not b_lambda!12071) tp_is_empty!16873 (not b!866446) (not b!866449) (not b!866451) (not b!866448) (not start!73804) (not b!866441) (not mapNonEmpty!26909) (not b!866444) b_and!24429)
(check-sat b_and!24429 (not b_next!14737))
