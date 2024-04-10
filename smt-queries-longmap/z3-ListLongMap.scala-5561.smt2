; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73152 () Bool)

(assert start!73152)

(declare-fun b_free!14067 () Bool)

(declare-fun b_next!14067 () Bool)

(assert (=> start!73152 (= b_free!14067 (not b_next!14067))))

(declare-fun tp!49705 () Bool)

(declare-fun b_and!23293 () Bool)

(assert (=> start!73152 (= tp!49705 b_and!23293)))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38053 () Bool)

(declare-datatypes ((V!26651 0))(
  ( (V!26652 (val!8149 Int)) )
))
(declare-datatypes ((ValueCell!7662 0))(
  ( (ValueCellFull!7662 (v!10574 V!26651)) (EmptyCell!7662) )
))
(declare-datatypes ((array!48604 0))(
  ( (array!48605 (arr!23333 (Array (_ BitVec 32) ValueCell!7662)) (size!23773 (_ BitVec 32))) )
))
(declare-fun lt!383648 () array!48604)

(declare-datatypes ((array!48606 0))(
  ( (array!48607 (arr!23334 (Array (_ BitVec 32) (_ BitVec 64))) (size!23774 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48606)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26651)

(declare-fun zeroValue!654 () V!26651)

(declare-datatypes ((tuple2!10692 0))(
  ( (tuple2!10693 (_1!5357 (_ BitVec 64)) (_2!5357 V!26651)) )
))
(declare-datatypes ((List!16528 0))(
  ( (Nil!16525) (Cons!16524 (h!17655 tuple2!10692) (t!23041 List!16528)) )
))
(declare-datatypes ((ListLongMap!9461 0))(
  ( (ListLongMap!9462 (toList!4746 List!16528)) )
))
(declare-fun call!38057 () ListLongMap!9461)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2728 (array!48606 array!48604 (_ BitVec 32) (_ BitVec 32) V!26651 V!26651 (_ BitVec 32) Int) ListLongMap!9461)

(assert (=> bm!38053 (= call!38057 (getCurrentListMapNoExtraKeys!2728 _keys!868 lt!383648 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851729 () Bool)

(declare-fun res!578532 () Bool)

(declare-fun e!475072 () Bool)

(assert (=> b!851729 (=> (not res!578532) (not e!475072))))

(declare-datatypes ((List!16529 0))(
  ( (Nil!16526) (Cons!16525 (h!17656 (_ BitVec 64)) (t!23042 List!16529)) )
))
(declare-fun arrayNoDuplicates!0 (array!48606 (_ BitVec 32) List!16529) Bool)

(assert (=> b!851729 (= res!578532 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16526))))

(declare-fun b!851730 () Bool)

(declare-fun res!578535 () Bool)

(assert (=> b!851730 (=> (not res!578535) (not e!475072))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851730 (= res!578535 (validKeyInArray!0 k0!854))))

(declare-fun b!851731 () Bool)

(declare-fun res!578528 () Bool)

(assert (=> b!851731 (=> (not res!578528) (not e!475072))))

(declare-fun _values!688 () array!48604)

(assert (=> b!851731 (= res!578528 (and (= (size!23773 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23774 _keys!868) (size!23773 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851732 () Bool)

(declare-fun e!475071 () Bool)

(declare-fun tp_is_empty!16203 () Bool)

(assert (=> b!851732 (= e!475071 tp_is_empty!16203)))

(declare-fun b!851733 () Bool)

(declare-fun e!475070 () Bool)

(declare-fun mapRes!25904 () Bool)

(assert (=> b!851733 (= e!475070 (and e!475071 mapRes!25904))))

(declare-fun condMapEmpty!25904 () Bool)

(declare-fun mapDefault!25904 () ValueCell!7662)

(assert (=> b!851733 (= condMapEmpty!25904 (= (arr!23333 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7662)) mapDefault!25904)))))

(declare-fun b!851734 () Bool)

(declare-fun e!475065 () Bool)

(assert (=> b!851734 (= e!475065 true)))

(declare-fun lt!383652 () ListLongMap!9461)

(declare-fun lt!383646 () V!26651)

(declare-fun lt!383645 () tuple2!10692)

(declare-fun +!2145 (ListLongMap!9461 tuple2!10692) ListLongMap!9461)

(assert (=> b!851734 (= (+!2145 lt!383652 lt!383645) (+!2145 (+!2145 lt!383652 (tuple2!10693 k0!854 lt!383646)) lt!383645))))

(declare-fun lt!383644 () V!26651)

(assert (=> b!851734 (= lt!383645 (tuple2!10693 k0!854 lt!383644))))

(declare-datatypes ((Unit!29077 0))(
  ( (Unit!29078) )
))
(declare-fun lt!383651 () Unit!29077)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!276 (ListLongMap!9461 (_ BitVec 64) V!26651 V!26651) Unit!29077)

(assert (=> b!851734 (= lt!383651 (addSameAsAddTwiceSameKeyDiffValues!276 lt!383652 k0!854 lt!383646 lt!383644))))

(declare-fun lt!383649 () V!26651)

(declare-fun get!12296 (ValueCell!7662 V!26651) V!26651)

(assert (=> b!851734 (= lt!383646 (get!12296 (select (arr!23333 _values!688) from!1053) lt!383649))))

(declare-fun lt!383653 () ListLongMap!9461)

(assert (=> b!851734 (= lt!383653 (+!2145 lt!383652 (tuple2!10693 (select (arr!23334 _keys!868) from!1053) lt!383644)))))

(declare-fun v!557 () V!26651)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851734 (= lt!383644 (get!12296 (select (store (arr!23333 _values!688) i!612 (ValueCellFull!7662 v!557)) from!1053) lt!383649))))

(declare-fun dynLambda!1030 (Int (_ BitVec 64)) V!26651)

(assert (=> b!851734 (= lt!383649 (dynLambda!1030 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851734 (= lt!383652 (getCurrentListMapNoExtraKeys!2728 _keys!868 lt!383648 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun e!475069 () Bool)

(declare-fun b!851735 () Bool)

(declare-fun call!38056 () ListLongMap!9461)

(assert (=> b!851735 (= e!475069 (= call!38057 (+!2145 call!38056 (tuple2!10693 k0!854 v!557))))))

(declare-fun mapNonEmpty!25904 () Bool)

(declare-fun tp!49704 () Bool)

(declare-fun e!475067 () Bool)

(assert (=> mapNonEmpty!25904 (= mapRes!25904 (and tp!49704 e!475067))))

(declare-fun mapKey!25904 () (_ BitVec 32))

(declare-fun mapRest!25904 () (Array (_ BitVec 32) ValueCell!7662))

(declare-fun mapValue!25904 () ValueCell!7662)

(assert (=> mapNonEmpty!25904 (= (arr!23333 _values!688) (store mapRest!25904 mapKey!25904 mapValue!25904))))

(declare-fun b!851737 () Bool)

(assert (=> b!851737 (= e!475069 (= call!38057 call!38056))))

(declare-fun b!851738 () Bool)

(declare-fun res!578529 () Bool)

(assert (=> b!851738 (=> (not res!578529) (not e!475072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48606 (_ BitVec 32)) Bool)

(assert (=> b!851738 (= res!578529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!38054 () Bool)

(assert (=> bm!38054 (= call!38056 (getCurrentListMapNoExtraKeys!2728 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851739 () Bool)

(assert (=> b!851739 (= e!475067 tp_is_empty!16203)))

(declare-fun b!851740 () Bool)

(declare-fun e!475066 () Bool)

(assert (=> b!851740 (= e!475072 e!475066)))

(declare-fun res!578531 () Bool)

(assert (=> b!851740 (=> (not res!578531) (not e!475066))))

(assert (=> b!851740 (= res!578531 (= from!1053 i!612))))

(assert (=> b!851740 (= lt!383653 (getCurrentListMapNoExtraKeys!2728 _keys!868 lt!383648 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851740 (= lt!383648 (array!48605 (store (arr!23333 _values!688) i!612 (ValueCellFull!7662 v!557)) (size!23773 _values!688)))))

(declare-fun lt!383650 () ListLongMap!9461)

(assert (=> b!851740 (= lt!383650 (getCurrentListMapNoExtraKeys!2728 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851741 () Bool)

(declare-fun res!578530 () Bool)

(assert (=> b!851741 (=> (not res!578530) (not e!475072))))

(assert (=> b!851741 (= res!578530 (and (= (select (arr!23334 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851742 () Bool)

(declare-fun res!578537 () Bool)

(assert (=> b!851742 (=> (not res!578537) (not e!475072))))

(assert (=> b!851742 (= res!578537 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23774 _keys!868))))))

(declare-fun mapIsEmpty!25904 () Bool)

(assert (=> mapIsEmpty!25904 mapRes!25904))

(declare-fun b!851743 () Bool)

(assert (=> b!851743 (= e!475066 (not e!475065))))

(declare-fun res!578534 () Bool)

(assert (=> b!851743 (=> res!578534 e!475065)))

(assert (=> b!851743 (= res!578534 (not (validKeyInArray!0 (select (arr!23334 _keys!868) from!1053))))))

(assert (=> b!851743 e!475069))

(declare-fun c!91771 () Bool)

(assert (=> b!851743 (= c!91771 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383647 () Unit!29077)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!380 (array!48606 array!48604 (_ BitVec 32) (_ BitVec 32) V!26651 V!26651 (_ BitVec 32) (_ BitVec 64) V!26651 (_ BitVec 32) Int) Unit!29077)

(assert (=> b!851743 (= lt!383647 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!380 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!578536 () Bool)

(assert (=> start!73152 (=> (not res!578536) (not e!475072))))

(assert (=> start!73152 (= res!578536 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23774 _keys!868))))))

(assert (=> start!73152 e!475072))

(assert (=> start!73152 tp_is_empty!16203))

(assert (=> start!73152 true))

(assert (=> start!73152 tp!49705))

(declare-fun array_inv!18508 (array!48606) Bool)

(assert (=> start!73152 (array_inv!18508 _keys!868)))

(declare-fun array_inv!18509 (array!48604) Bool)

(assert (=> start!73152 (and (array_inv!18509 _values!688) e!475070)))

(declare-fun b!851736 () Bool)

(declare-fun res!578533 () Bool)

(assert (=> b!851736 (=> (not res!578533) (not e!475072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851736 (= res!578533 (validMask!0 mask!1196))))

(assert (= (and start!73152 res!578536) b!851736))

(assert (= (and b!851736 res!578533) b!851731))

(assert (= (and b!851731 res!578528) b!851738))

(assert (= (and b!851738 res!578529) b!851729))

(assert (= (and b!851729 res!578532) b!851742))

(assert (= (and b!851742 res!578537) b!851730))

(assert (= (and b!851730 res!578535) b!851741))

(assert (= (and b!851741 res!578530) b!851740))

(assert (= (and b!851740 res!578531) b!851743))

(assert (= (and b!851743 c!91771) b!851735))

(assert (= (and b!851743 (not c!91771)) b!851737))

(assert (= (or b!851735 b!851737) bm!38054))

(assert (= (or b!851735 b!851737) bm!38053))

(assert (= (and b!851743 (not res!578534)) b!851734))

(assert (= (and b!851733 condMapEmpty!25904) mapIsEmpty!25904))

(assert (= (and b!851733 (not condMapEmpty!25904)) mapNonEmpty!25904))

(get-info :version)

(assert (= (and mapNonEmpty!25904 ((_ is ValueCellFull!7662) mapValue!25904)) b!851739))

(assert (= (and b!851733 ((_ is ValueCellFull!7662) mapDefault!25904)) b!851732))

(assert (= start!73152 b!851733))

(declare-fun b_lambda!11599 () Bool)

(assert (=> (not b_lambda!11599) (not b!851734)))

(declare-fun t!23040 () Bool)

(declare-fun tb!4369 () Bool)

(assert (=> (and start!73152 (= defaultEntry!696 defaultEntry!696) t!23040) tb!4369))

(declare-fun result!8349 () Bool)

(assert (=> tb!4369 (= result!8349 tp_is_empty!16203)))

(assert (=> b!851734 t!23040))

(declare-fun b_and!23295 () Bool)

(assert (= b_and!23293 (and (=> t!23040 result!8349) b_and!23295)))

(declare-fun m!792685 () Bool)

(assert (=> mapNonEmpty!25904 m!792685))

(declare-fun m!792687 () Bool)

(assert (=> b!851730 m!792687))

(declare-fun m!792689 () Bool)

(assert (=> b!851738 m!792689))

(declare-fun m!792691 () Bool)

(assert (=> start!73152 m!792691))

(declare-fun m!792693 () Bool)

(assert (=> start!73152 m!792693))

(declare-fun m!792695 () Bool)

(assert (=> b!851743 m!792695))

(assert (=> b!851743 m!792695))

(declare-fun m!792697 () Bool)

(assert (=> b!851743 m!792697))

(declare-fun m!792699 () Bool)

(assert (=> b!851743 m!792699))

(declare-fun m!792701 () Bool)

(assert (=> b!851729 m!792701))

(declare-fun m!792703 () Bool)

(assert (=> bm!38053 m!792703))

(declare-fun m!792705 () Bool)

(assert (=> b!851740 m!792705))

(declare-fun m!792707 () Bool)

(assert (=> b!851740 m!792707))

(declare-fun m!792709 () Bool)

(assert (=> b!851740 m!792709))

(declare-fun m!792711 () Bool)

(assert (=> bm!38054 m!792711))

(declare-fun m!792713 () Bool)

(assert (=> b!851741 m!792713))

(declare-fun m!792715 () Bool)

(assert (=> b!851735 m!792715))

(declare-fun m!792717 () Bool)

(assert (=> b!851734 m!792717))

(declare-fun m!792719 () Bool)

(assert (=> b!851734 m!792719))

(declare-fun m!792721 () Bool)

(assert (=> b!851734 m!792721))

(declare-fun m!792723 () Bool)

(assert (=> b!851734 m!792723))

(declare-fun m!792725 () Bool)

(assert (=> b!851734 m!792725))

(declare-fun m!792727 () Bool)

(assert (=> b!851734 m!792727))

(declare-fun m!792729 () Bool)

(assert (=> b!851734 m!792729))

(assert (=> b!851734 m!792723))

(declare-fun m!792731 () Bool)

(assert (=> b!851734 m!792731))

(assert (=> b!851734 m!792707))

(assert (=> b!851734 m!792695))

(declare-fun m!792733 () Bool)

(assert (=> b!851734 m!792733))

(assert (=> b!851734 m!792727))

(declare-fun m!792735 () Bool)

(assert (=> b!851734 m!792735))

(assert (=> b!851734 m!792703))

(assert (=> b!851734 m!792717))

(declare-fun m!792737 () Bool)

(assert (=> b!851736 m!792737))

(check-sat (not start!73152) (not bm!38053) (not b!851734) (not b!851740) (not b!851743) (not b!851738) (not b_lambda!11599) tp_is_empty!16203 b_and!23295 (not b!851730) (not bm!38054) (not b!851729) (not b!851736) (not b!851735) (not mapNonEmpty!25904) (not b_next!14067))
(check-sat b_and!23295 (not b_next!14067))
