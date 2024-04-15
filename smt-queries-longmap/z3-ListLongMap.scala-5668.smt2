; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73774 () Bool)

(assert start!73774)

(declare-fun b_free!14707 () Bool)

(declare-fun b_next!14707 () Bool)

(assert (=> start!73774 (= b_free!14707 (not b_next!14707))))

(declare-fun tp!51626 () Bool)

(declare-fun b_and!24367 () Bool)

(assert (=> start!73774 (= tp!51626 b_and!24367)))

(declare-fun b!865686 () Bool)

(declare-fun e!482222 () Bool)

(declare-fun e!482228 () Bool)

(assert (=> b!865686 (= e!482222 e!482228)))

(declare-fun res!588256 () Bool)

(assert (=> b!865686 (=> (not res!588256) (not e!482228))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865686 (= res!588256 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27505 0))(
  ( (V!27506 (val!8469 Int)) )
))
(declare-datatypes ((ValueCell!7982 0))(
  ( (ValueCellFull!7982 (v!10888 V!27505)) (EmptyCell!7982) )
))
(declare-datatypes ((array!49837 0))(
  ( (array!49838 (arr!23950 (Array (_ BitVec 32) ValueCell!7982)) (size!24392 (_ BitVec 32))) )
))
(declare-fun lt!392389 () array!49837)

(declare-datatypes ((array!49839 0))(
  ( (array!49840 (arr!23951 (Array (_ BitVec 32) (_ BitVec 64))) (size!24393 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49839)

(declare-datatypes ((tuple2!11246 0))(
  ( (tuple2!11247 (_1!5634 (_ BitVec 64)) (_2!5634 V!27505)) )
))
(declare-datatypes ((List!17034 0))(
  ( (Nil!17031) (Cons!17030 (h!18161 tuple2!11246) (t!23998 List!17034)) )
))
(declare-datatypes ((ListLongMap!10005 0))(
  ( (ListLongMap!10006 (toList!5018 List!17034)) )
))
(declare-fun lt!392382 () ListLongMap!10005)

(declare-fun minValue!654 () V!27505)

(declare-fun zeroValue!654 () V!27505)

(declare-fun getCurrentListMapNoExtraKeys!3014 (array!49839 array!49837 (_ BitVec 32) (_ BitVec 32) V!27505 V!27505 (_ BitVec 32) Int) ListLongMap!10005)

(assert (=> b!865686 (= lt!392382 (getCurrentListMapNoExtraKeys!3014 _keys!868 lt!392389 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27505)

(declare-fun _values!688 () array!49837)

(assert (=> b!865686 (= lt!392389 (array!49838 (store (arr!23950 _values!688) i!612 (ValueCellFull!7982 v!557)) (size!24392 _values!688)))))

(declare-fun lt!392385 () ListLongMap!10005)

(assert (=> b!865686 (= lt!392385 (getCurrentListMapNoExtraKeys!3014 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!588259 () Bool)

(assert (=> start!73774 (=> (not res!588259) (not e!482222))))

(assert (=> start!73774 (= res!588259 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24393 _keys!868))))))

(assert (=> start!73774 e!482222))

(declare-fun tp_is_empty!16843 () Bool)

(assert (=> start!73774 tp_is_empty!16843))

(assert (=> start!73774 true))

(assert (=> start!73774 tp!51626))

(declare-fun array_inv!19004 (array!49839) Bool)

(assert (=> start!73774 (array_inv!19004 _keys!868)))

(declare-fun e!482223 () Bool)

(declare-fun array_inv!19005 (array!49837) Bool)

(assert (=> start!73774 (and (array_inv!19005 _values!688) e!482223)))

(declare-fun b!865687 () Bool)

(declare-fun e!482227 () Bool)

(declare-fun e!482224 () Bool)

(assert (=> b!865687 (= e!482227 e!482224)))

(declare-fun res!588260 () Bool)

(assert (=> b!865687 (=> res!588260 e!482224)))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!865687 (= res!588260 (= k0!854 (select (arr!23951 _keys!868) from!1053)))))

(assert (=> b!865687 (not (= (select (arr!23951 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29596 0))(
  ( (Unit!29597) )
))
(declare-fun lt!392392 () Unit!29596)

(declare-fun e!482221 () Unit!29596)

(assert (=> b!865687 (= lt!392392 e!482221)))

(declare-fun c!92216 () Bool)

(assert (=> b!865687 (= c!92216 (= (select (arr!23951 _keys!868) from!1053) k0!854))))

(declare-fun lt!392390 () ListLongMap!10005)

(assert (=> b!865687 (= lt!392382 lt!392390)))

(declare-fun lt!392395 () ListLongMap!10005)

(declare-fun lt!392388 () tuple2!11246)

(declare-fun +!2386 (ListLongMap!10005 tuple2!11246) ListLongMap!10005)

(assert (=> b!865687 (= lt!392390 (+!2386 lt!392395 lt!392388))))

(declare-fun lt!392387 () V!27505)

(assert (=> b!865687 (= lt!392388 (tuple2!11247 (select (arr!23951 _keys!868) from!1053) lt!392387))))

(declare-fun get!12666 (ValueCell!7982 V!27505) V!27505)

(declare-fun dynLambda!1183 (Int (_ BitVec 64)) V!27505)

(assert (=> b!865687 (= lt!392387 (get!12666 (select (arr!23950 _values!688) from!1053) (dynLambda!1183 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865688 () Bool)

(declare-fun Unit!29598 () Unit!29596)

(assert (=> b!865688 (= e!482221 Unit!29598)))

(declare-fun b!865689 () Bool)

(assert (=> b!865689 (= e!482228 (not e!482227))))

(declare-fun res!588258 () Bool)

(assert (=> b!865689 (=> res!588258 e!482227)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865689 (= res!588258 (not (validKeyInArray!0 (select (arr!23951 _keys!868) from!1053))))))

(declare-fun lt!392391 () ListLongMap!10005)

(assert (=> b!865689 (= lt!392391 lt!392395)))

(declare-fun lt!392394 () ListLongMap!10005)

(declare-fun lt!392383 () tuple2!11246)

(assert (=> b!865689 (= lt!392395 (+!2386 lt!392394 lt!392383))))

(assert (=> b!865689 (= lt!392391 (getCurrentListMapNoExtraKeys!3014 _keys!868 lt!392389 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865689 (= lt!392383 (tuple2!11247 k0!854 v!557))))

(assert (=> b!865689 (= lt!392394 (getCurrentListMapNoExtraKeys!3014 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392381 () Unit!29596)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!558 (array!49839 array!49837 (_ BitVec 32) (_ BitVec 32) V!27505 V!27505 (_ BitVec 32) (_ BitVec 64) V!27505 (_ BitVec 32) Int) Unit!29596)

(assert (=> b!865689 (= lt!392381 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!558 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865690 () Bool)

(declare-fun res!588254 () Bool)

(assert (=> b!865690 (=> (not res!588254) (not e!482222))))

(assert (=> b!865690 (= res!588254 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24393 _keys!868))))))

(declare-fun b!865691 () Bool)

(declare-fun res!588257 () Bool)

(assert (=> b!865691 (=> (not res!588257) (not e!482222))))

(assert (=> b!865691 (= res!588257 (and (= (size!24392 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24393 _keys!868) (size!24392 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865692 () Bool)

(assert (=> b!865692 (= e!482224 true)))

(assert (=> b!865692 (= lt!392390 (+!2386 (+!2386 lt!392394 lt!392388) lt!392383))))

(declare-fun lt!392393 () Unit!29596)

(declare-fun addCommutativeForDiffKeys!524 (ListLongMap!10005 (_ BitVec 64) V!27505 (_ BitVec 64) V!27505) Unit!29596)

(assert (=> b!865692 (= lt!392393 (addCommutativeForDiffKeys!524 lt!392394 k0!854 v!557 (select (arr!23951 _keys!868) from!1053) lt!392387))))

(declare-fun b!865693 () Bool)

(declare-fun e!482225 () Bool)

(assert (=> b!865693 (= e!482225 tp_is_empty!16843)))

(declare-fun b!865694 () Bool)

(declare-fun res!588261 () Bool)

(assert (=> b!865694 (=> (not res!588261) (not e!482222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865694 (= res!588261 (validMask!0 mask!1196))))

(declare-fun b!865695 () Bool)

(declare-fun res!588263 () Bool)

(assert (=> b!865695 (=> (not res!588263) (not e!482222))))

(assert (=> b!865695 (= res!588263 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26864 () Bool)

(declare-fun mapRes!26864 () Bool)

(assert (=> mapIsEmpty!26864 mapRes!26864))

(declare-fun b!865696 () Bool)

(declare-fun res!588264 () Bool)

(assert (=> b!865696 (=> (not res!588264) (not e!482222))))

(declare-datatypes ((List!17035 0))(
  ( (Nil!17032) (Cons!17031 (h!18162 (_ BitVec 64)) (t!23999 List!17035)) )
))
(declare-fun arrayNoDuplicates!0 (array!49839 (_ BitVec 32) List!17035) Bool)

(assert (=> b!865696 (= res!588264 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17032))))

(declare-fun b!865697 () Bool)

(declare-fun e!482229 () Bool)

(assert (=> b!865697 (= e!482229 tp_is_empty!16843)))

(declare-fun b!865698 () Bool)

(assert (=> b!865698 (= e!482223 (and e!482225 mapRes!26864))))

(declare-fun condMapEmpty!26864 () Bool)

(declare-fun mapDefault!26864 () ValueCell!7982)

(assert (=> b!865698 (= condMapEmpty!26864 (= (arr!23950 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7982)) mapDefault!26864)))))

(declare-fun mapNonEmpty!26864 () Bool)

(declare-fun tp!51625 () Bool)

(assert (=> mapNonEmpty!26864 (= mapRes!26864 (and tp!51625 e!482229))))

(declare-fun mapValue!26864 () ValueCell!7982)

(declare-fun mapKey!26864 () (_ BitVec 32))

(declare-fun mapRest!26864 () (Array (_ BitVec 32) ValueCell!7982))

(assert (=> mapNonEmpty!26864 (= (arr!23950 _values!688) (store mapRest!26864 mapKey!26864 mapValue!26864))))

(declare-fun b!865699 () Bool)

(declare-fun res!588255 () Bool)

(assert (=> b!865699 (=> (not res!588255) (not e!482222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49839 (_ BitVec 32)) Bool)

(assert (=> b!865699 (= res!588255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865700 () Bool)

(declare-fun Unit!29599 () Unit!29596)

(assert (=> b!865700 (= e!482221 Unit!29599)))

(declare-fun lt!392384 () Unit!29596)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49839 (_ BitVec 32) (_ BitVec 32)) Unit!29596)

(assert (=> b!865700 (= lt!392384 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!865700 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17032)))

(declare-fun lt!392396 () Unit!29596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49839 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29596)

(assert (=> b!865700 (= lt!392396 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865700 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392386 () Unit!29596)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49839 (_ BitVec 64) (_ BitVec 32) List!17035) Unit!29596)

(assert (=> b!865700 (= lt!392386 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17032))))

(assert (=> b!865700 false))

(declare-fun b!865701 () Bool)

(declare-fun res!588262 () Bool)

(assert (=> b!865701 (=> (not res!588262) (not e!482222))))

(assert (=> b!865701 (= res!588262 (and (= (select (arr!23951 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73774 res!588259) b!865694))

(assert (= (and b!865694 res!588261) b!865691))

(assert (= (and b!865691 res!588257) b!865699))

(assert (= (and b!865699 res!588255) b!865696))

(assert (= (and b!865696 res!588264) b!865690))

(assert (= (and b!865690 res!588254) b!865695))

(assert (= (and b!865695 res!588263) b!865701))

(assert (= (and b!865701 res!588262) b!865686))

(assert (= (and b!865686 res!588256) b!865689))

(assert (= (and b!865689 (not res!588258)) b!865687))

(assert (= (and b!865687 c!92216) b!865700))

(assert (= (and b!865687 (not c!92216)) b!865688))

(assert (= (and b!865687 (not res!588260)) b!865692))

(assert (= (and b!865698 condMapEmpty!26864) mapIsEmpty!26864))

(assert (= (and b!865698 (not condMapEmpty!26864)) mapNonEmpty!26864))

(get-info :version)

(assert (= (and mapNonEmpty!26864 ((_ is ValueCellFull!7982) mapValue!26864)) b!865697))

(assert (= (and b!865698 ((_ is ValueCellFull!7982) mapDefault!26864)) b!865693))

(assert (= start!73774 b!865698))

(declare-fun b_lambda!12041 () Bool)

(assert (=> (not b_lambda!12041) (not b!865687)))

(declare-fun t!23997 () Bool)

(declare-fun tb!4821 () Bool)

(assert (=> (and start!73774 (= defaultEntry!696 defaultEntry!696) t!23997) tb!4821))

(declare-fun result!9261 () Bool)

(assert (=> tb!4821 (= result!9261 tp_is_empty!16843)))

(assert (=> b!865687 t!23997))

(declare-fun b_and!24369 () Bool)

(assert (= b_and!24367 (and (=> t!23997 result!9261) b_and!24369)))

(declare-fun m!806745 () Bool)

(assert (=> b!865701 m!806745))

(declare-fun m!806747 () Bool)

(assert (=> b!865689 m!806747))

(declare-fun m!806749 () Bool)

(assert (=> b!865689 m!806749))

(declare-fun m!806751 () Bool)

(assert (=> b!865689 m!806751))

(declare-fun m!806753 () Bool)

(assert (=> b!865689 m!806753))

(assert (=> b!865689 m!806751))

(declare-fun m!806755 () Bool)

(assert (=> b!865689 m!806755))

(declare-fun m!806757 () Bool)

(assert (=> b!865689 m!806757))

(declare-fun m!806759 () Bool)

(assert (=> b!865700 m!806759))

(declare-fun m!806761 () Bool)

(assert (=> b!865700 m!806761))

(declare-fun m!806763 () Bool)

(assert (=> b!865700 m!806763))

(declare-fun m!806765 () Bool)

(assert (=> b!865700 m!806765))

(declare-fun m!806767 () Bool)

(assert (=> b!865700 m!806767))

(declare-fun m!806769 () Bool)

(assert (=> start!73774 m!806769))

(declare-fun m!806771 () Bool)

(assert (=> start!73774 m!806771))

(declare-fun m!806773 () Bool)

(assert (=> b!865692 m!806773))

(assert (=> b!865692 m!806773))

(declare-fun m!806775 () Bool)

(assert (=> b!865692 m!806775))

(assert (=> b!865692 m!806751))

(assert (=> b!865692 m!806751))

(declare-fun m!806777 () Bool)

(assert (=> b!865692 m!806777))

(declare-fun m!806779 () Bool)

(assert (=> b!865686 m!806779))

(declare-fun m!806781 () Bool)

(assert (=> b!865686 m!806781))

(declare-fun m!806783 () Bool)

(assert (=> b!865686 m!806783))

(declare-fun m!806785 () Bool)

(assert (=> b!865699 m!806785))

(declare-fun m!806787 () Bool)

(assert (=> b!865696 m!806787))

(declare-fun m!806789 () Bool)

(assert (=> b!865687 m!806789))

(declare-fun m!806791 () Bool)

(assert (=> b!865687 m!806791))

(declare-fun m!806793 () Bool)

(assert (=> b!865687 m!806793))

(declare-fun m!806795 () Bool)

(assert (=> b!865687 m!806795))

(assert (=> b!865687 m!806791))

(assert (=> b!865687 m!806751))

(assert (=> b!865687 m!806793))

(declare-fun m!806797 () Bool)

(assert (=> b!865695 m!806797))

(declare-fun m!806799 () Bool)

(assert (=> b!865694 m!806799))

(declare-fun m!806801 () Bool)

(assert (=> mapNonEmpty!26864 m!806801))

(check-sat (not b!865689) (not b!865700) (not b_next!14707) (not b!865696) (not b!865699) (not mapNonEmpty!26864) (not b!865686) (not b!865695) b_and!24369 (not start!73774) (not b!865692) (not b_lambda!12041) tp_is_empty!16843 (not b!865694) (not b!865687))
(check-sat b_and!24369 (not b_next!14707))
