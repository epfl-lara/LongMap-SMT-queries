; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73870 () Bool)

(assert start!73870)

(declare-fun b_free!14617 () Bool)

(declare-fun b_next!14617 () Bool)

(assert (=> start!73870 (= b_free!14617 (not b_next!14617))))

(declare-fun tp!51355 () Bool)

(declare-fun b_and!24223 () Bool)

(assert (=> start!73870 (= tp!51355 b_and!24223)))

(declare-fun mapIsEmpty!26729 () Bool)

(declare-fun mapRes!26729 () Bool)

(assert (=> mapIsEmpty!26729 mapRes!26729))

(declare-fun b!864578 () Bool)

(declare-datatypes ((Unit!29516 0))(
  ( (Unit!29517) )
))
(declare-fun e!481743 () Unit!29516)

(declare-fun Unit!29518 () Unit!29516)

(assert (=> b!864578 (= e!481743 Unit!29518)))

(declare-fun lt!390827 () Unit!29516)

(declare-datatypes ((array!49719 0))(
  ( (array!49720 (arr!23886 (Array (_ BitVec 32) (_ BitVec 64))) (size!24327 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49719)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49719 (_ BitVec 32) (_ BitVec 32)) Unit!29516)

(assert (=> b!864578 (= lt!390827 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16906 0))(
  ( (Nil!16903) (Cons!16902 (h!18039 (_ BitVec 64)) (t!23781 List!16906)) )
))
(declare-fun arrayNoDuplicates!0 (array!49719 (_ BitVec 32) List!16906) Bool)

(assert (=> b!864578 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16903)))

(declare-fun lt!390821 () Unit!29516)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49719 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29516)

(assert (=> b!864578 (= lt!390821 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864578 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390822 () Unit!29516)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49719 (_ BitVec 64) (_ BitVec 32) List!16906) Unit!29516)

(assert (=> b!864578 (= lt!390822 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16903))))

(assert (=> b!864578 false))

(declare-fun b!864579 () Bool)

(declare-fun res!587232 () Bool)

(declare-fun e!481740 () Bool)

(assert (=> b!864579 (=> (not res!587232) (not e!481740))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49719 (_ BitVec 32)) Bool)

(assert (=> b!864579 (= res!587232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864580 () Bool)

(declare-fun e!481744 () Bool)

(assert (=> b!864580 (= e!481744 true)))

(declare-datatypes ((V!27385 0))(
  ( (V!27386 (val!8424 Int)) )
))
(declare-datatypes ((tuple2!11074 0))(
  ( (tuple2!11075 (_1!5548 (_ BitVec 64)) (_2!5548 V!27385)) )
))
(declare-fun lt!390818 () tuple2!11074)

(declare-datatypes ((List!16907 0))(
  ( (Nil!16904) (Cons!16903 (h!18040 tuple2!11074) (t!23782 List!16907)) )
))
(declare-datatypes ((ListLongMap!9845 0))(
  ( (ListLongMap!9846 (toList!4938 List!16907)) )
))
(declare-fun lt!390828 () ListLongMap!9845)

(declare-fun lt!390830 () tuple2!11074)

(declare-fun lt!390832 () ListLongMap!9845)

(declare-fun +!2341 (ListLongMap!9845 tuple2!11074) ListLongMap!9845)

(assert (=> b!864580 (= lt!390832 (+!2341 (+!2341 lt!390828 lt!390830) lt!390818))))

(declare-fun lt!390824 () V!27385)

(declare-fun v!557 () V!27385)

(declare-fun lt!390831 () Unit!29516)

(declare-fun addCommutativeForDiffKeys!492 (ListLongMap!9845 (_ BitVec 64) V!27385 (_ BitVec 64) V!27385) Unit!29516)

(assert (=> b!864580 (= lt!390831 (addCommutativeForDiffKeys!492 lt!390828 k0!854 v!557 (select (arr!23886 _keys!868) from!1053) lt!390824))))

(declare-fun b!864581 () Bool)

(declare-fun e!481741 () Bool)

(assert (=> b!864581 (= e!481741 e!481744)))

(declare-fun res!587228 () Bool)

(assert (=> b!864581 (=> res!587228 e!481744)))

(assert (=> b!864581 (= res!587228 (= k0!854 (select (arr!23886 _keys!868) from!1053)))))

(assert (=> b!864581 (not (= (select (arr!23886 _keys!868) from!1053) k0!854))))

(declare-fun lt!390833 () Unit!29516)

(assert (=> b!864581 (= lt!390833 e!481743)))

(declare-fun c!92428 () Bool)

(assert (=> b!864581 (= c!92428 (= (select (arr!23886 _keys!868) from!1053) k0!854))))

(declare-fun lt!390829 () ListLongMap!9845)

(assert (=> b!864581 (= lt!390829 lt!390832)))

(declare-fun lt!390820 () ListLongMap!9845)

(assert (=> b!864581 (= lt!390832 (+!2341 lt!390820 lt!390830))))

(assert (=> b!864581 (= lt!390830 (tuple2!11075 (select (arr!23886 _keys!868) from!1053) lt!390824))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7937 0))(
  ( (ValueCellFull!7937 (v!10849 V!27385)) (EmptyCell!7937) )
))
(declare-datatypes ((array!49721 0))(
  ( (array!49722 (arr!23887 (Array (_ BitVec 32) ValueCell!7937)) (size!24328 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49721)

(declare-fun get!12622 (ValueCell!7937 V!27385) V!27385)

(declare-fun dynLambda!1166 (Int (_ BitVec 64)) V!27385)

(assert (=> b!864581 (= lt!390824 (get!12622 (select (arr!23887 _values!688) from!1053) (dynLambda!1166 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864582 () Bool)

(declare-fun e!481738 () Bool)

(assert (=> b!864582 (= e!481740 e!481738)))

(declare-fun res!587227 () Bool)

(assert (=> b!864582 (=> (not res!587227) (not e!481738))))

(assert (=> b!864582 (= res!587227 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!390825 () array!49721)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27385)

(declare-fun zeroValue!654 () V!27385)

(declare-fun getCurrentListMapNoExtraKeys!2988 (array!49719 array!49721 (_ BitVec 32) (_ BitVec 32) V!27385 V!27385 (_ BitVec 32) Int) ListLongMap!9845)

(assert (=> b!864582 (= lt!390829 (getCurrentListMapNoExtraKeys!2988 _keys!868 lt!390825 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!864582 (= lt!390825 (array!49722 (store (arr!23887 _values!688) i!612 (ValueCellFull!7937 v!557)) (size!24328 _values!688)))))

(declare-fun lt!390823 () ListLongMap!9845)

(assert (=> b!864582 (= lt!390823 (getCurrentListMapNoExtraKeys!2988 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!587230 () Bool)

(assert (=> start!73870 (=> (not res!587230) (not e!481740))))

(assert (=> start!73870 (= res!587230 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24327 _keys!868))))))

(assert (=> start!73870 e!481740))

(declare-fun tp_is_empty!16753 () Bool)

(assert (=> start!73870 tp_is_empty!16753))

(assert (=> start!73870 true))

(assert (=> start!73870 tp!51355))

(declare-fun array_inv!18946 (array!49719) Bool)

(assert (=> start!73870 (array_inv!18946 _keys!868)))

(declare-fun e!481737 () Bool)

(declare-fun array_inv!18947 (array!49721) Bool)

(assert (=> start!73870 (and (array_inv!18947 _values!688) e!481737)))

(declare-fun b!864583 () Bool)

(declare-fun res!587225 () Bool)

(assert (=> b!864583 (=> (not res!587225) (not e!481740))))

(assert (=> b!864583 (= res!587225 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16903))))

(declare-fun b!864584 () Bool)

(declare-fun e!481742 () Bool)

(assert (=> b!864584 (= e!481737 (and e!481742 mapRes!26729))))

(declare-fun condMapEmpty!26729 () Bool)

(declare-fun mapDefault!26729 () ValueCell!7937)

(assert (=> b!864584 (= condMapEmpty!26729 (= (arr!23887 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7937)) mapDefault!26729)))))

(declare-fun b!864585 () Bool)

(declare-fun res!587231 () Bool)

(assert (=> b!864585 (=> (not res!587231) (not e!481740))))

(assert (=> b!864585 (= res!587231 (and (= (select (arr!23886 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864586 () Bool)

(assert (=> b!864586 (= e!481738 (not e!481741))))

(declare-fun res!587226 () Bool)

(assert (=> b!864586 (=> res!587226 e!481741)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864586 (= res!587226 (not (validKeyInArray!0 (select (arr!23886 _keys!868) from!1053))))))

(declare-fun lt!390819 () ListLongMap!9845)

(assert (=> b!864586 (= lt!390819 lt!390820)))

(assert (=> b!864586 (= lt!390820 (+!2341 lt!390828 lt!390818))))

(assert (=> b!864586 (= lt!390819 (getCurrentListMapNoExtraKeys!2988 _keys!868 lt!390825 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864586 (= lt!390818 (tuple2!11075 k0!854 v!557))))

(assert (=> b!864586 (= lt!390828 (getCurrentListMapNoExtraKeys!2988 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390826 () Unit!29516)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!526 (array!49719 array!49721 (_ BitVec 32) (_ BitVec 32) V!27385 V!27385 (_ BitVec 32) (_ BitVec 64) V!27385 (_ BitVec 32) Int) Unit!29516)

(assert (=> b!864586 (= lt!390826 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!526 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864587 () Bool)

(declare-fun res!587229 () Bool)

(assert (=> b!864587 (=> (not res!587229) (not e!481740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864587 (= res!587229 (validMask!0 mask!1196))))

(declare-fun b!864588 () Bool)

(declare-fun res!587223 () Bool)

(assert (=> b!864588 (=> (not res!587223) (not e!481740))))

(assert (=> b!864588 (= res!587223 (and (= (size!24328 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24327 _keys!868) (size!24328 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864589 () Bool)

(declare-fun e!481739 () Bool)

(assert (=> b!864589 (= e!481739 tp_is_empty!16753)))

(declare-fun b!864590 () Bool)

(declare-fun res!587224 () Bool)

(assert (=> b!864590 (=> (not res!587224) (not e!481740))))

(assert (=> b!864590 (= res!587224 (validKeyInArray!0 k0!854))))

(declare-fun b!864591 () Bool)

(assert (=> b!864591 (= e!481742 tp_is_empty!16753)))

(declare-fun b!864592 () Bool)

(declare-fun Unit!29519 () Unit!29516)

(assert (=> b!864592 (= e!481743 Unit!29519)))

(declare-fun b!864593 () Bool)

(declare-fun res!587233 () Bool)

(assert (=> b!864593 (=> (not res!587233) (not e!481740))))

(assert (=> b!864593 (= res!587233 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24327 _keys!868))))))

(declare-fun mapNonEmpty!26729 () Bool)

(declare-fun tp!51356 () Bool)

(assert (=> mapNonEmpty!26729 (= mapRes!26729 (and tp!51356 e!481739))))

(declare-fun mapKey!26729 () (_ BitVec 32))

(declare-fun mapValue!26729 () ValueCell!7937)

(declare-fun mapRest!26729 () (Array (_ BitVec 32) ValueCell!7937))

(assert (=> mapNonEmpty!26729 (= (arr!23887 _values!688) (store mapRest!26729 mapKey!26729 mapValue!26729))))

(assert (= (and start!73870 res!587230) b!864587))

(assert (= (and b!864587 res!587229) b!864588))

(assert (= (and b!864588 res!587223) b!864579))

(assert (= (and b!864579 res!587232) b!864583))

(assert (= (and b!864583 res!587225) b!864593))

(assert (= (and b!864593 res!587233) b!864590))

(assert (= (and b!864590 res!587224) b!864585))

(assert (= (and b!864585 res!587231) b!864582))

(assert (= (and b!864582 res!587227) b!864586))

(assert (= (and b!864586 (not res!587226)) b!864581))

(assert (= (and b!864581 c!92428) b!864578))

(assert (= (and b!864581 (not c!92428)) b!864592))

(assert (= (and b!864581 (not res!587228)) b!864580))

(assert (= (and b!864584 condMapEmpty!26729) mapIsEmpty!26729))

(assert (= (and b!864584 (not condMapEmpty!26729)) mapNonEmpty!26729))

(get-info :version)

(assert (= (and mapNonEmpty!26729 ((_ is ValueCellFull!7937) mapValue!26729)) b!864589))

(assert (= (and b!864584 ((_ is ValueCellFull!7937) mapDefault!26729)) b!864591))

(assert (= start!73870 b!864584))

(declare-fun b_lambda!11983 () Bool)

(assert (=> (not b_lambda!11983) (not b!864581)))

(declare-fun t!23780 () Bool)

(declare-fun tb!4731 () Bool)

(assert (=> (and start!73870 (= defaultEntry!696 defaultEntry!696) t!23780) tb!4731))

(declare-fun result!9081 () Bool)

(assert (=> tb!4731 (= result!9081 tp_is_empty!16753)))

(assert (=> b!864581 t!23780))

(declare-fun b_and!24225 () Bool)

(assert (= b_and!24223 (and (=> t!23780 result!9081) b_and!24225)))

(declare-fun m!806183 () Bool)

(assert (=> start!73870 m!806183))

(declare-fun m!806185 () Bool)

(assert (=> start!73870 m!806185))

(declare-fun m!806187 () Bool)

(assert (=> b!864579 m!806187))

(declare-fun m!806189 () Bool)

(assert (=> b!864582 m!806189))

(declare-fun m!806191 () Bool)

(assert (=> b!864582 m!806191))

(declare-fun m!806193 () Bool)

(assert (=> b!864582 m!806193))

(declare-fun m!806195 () Bool)

(assert (=> b!864587 m!806195))

(declare-fun m!806197 () Bool)

(assert (=> b!864578 m!806197))

(declare-fun m!806199 () Bool)

(assert (=> b!864578 m!806199))

(declare-fun m!806201 () Bool)

(assert (=> b!864578 m!806201))

(declare-fun m!806203 () Bool)

(assert (=> b!864578 m!806203))

(declare-fun m!806205 () Bool)

(assert (=> b!864578 m!806205))

(declare-fun m!806207 () Bool)

(assert (=> b!864583 m!806207))

(declare-fun m!806209 () Bool)

(assert (=> b!864586 m!806209))

(declare-fun m!806211 () Bool)

(assert (=> b!864586 m!806211))

(declare-fun m!806213 () Bool)

(assert (=> b!864586 m!806213))

(assert (=> b!864586 m!806211))

(declare-fun m!806215 () Bool)

(assert (=> b!864586 m!806215))

(declare-fun m!806217 () Bool)

(assert (=> b!864586 m!806217))

(declare-fun m!806219 () Bool)

(assert (=> b!864586 m!806219))

(declare-fun m!806221 () Bool)

(assert (=> b!864585 m!806221))

(declare-fun m!806223 () Bool)

(assert (=> mapNonEmpty!26729 m!806223))

(declare-fun m!806225 () Bool)

(assert (=> b!864581 m!806225))

(declare-fun m!806227 () Bool)

(assert (=> b!864581 m!806227))

(declare-fun m!806229 () Bool)

(assert (=> b!864581 m!806229))

(declare-fun m!806231 () Bool)

(assert (=> b!864581 m!806231))

(assert (=> b!864581 m!806227))

(assert (=> b!864581 m!806211))

(assert (=> b!864581 m!806229))

(declare-fun m!806233 () Bool)

(assert (=> b!864580 m!806233))

(assert (=> b!864580 m!806233))

(declare-fun m!806235 () Bool)

(assert (=> b!864580 m!806235))

(assert (=> b!864580 m!806211))

(assert (=> b!864580 m!806211))

(declare-fun m!806237 () Bool)

(assert (=> b!864580 m!806237))

(declare-fun m!806239 () Bool)

(assert (=> b!864590 m!806239))

(check-sat (not b!864587) (not b_lambda!11983) (not b!864590) (not b_next!14617) (not start!73870) (not b!864581) (not mapNonEmpty!26729) (not b!864583) (not b!864582) (not b!864586) (not b!864578) (not b!864579) b_and!24225 (not b!864580) tp_is_empty!16753)
(check-sat b_and!24225 (not b_next!14617))
