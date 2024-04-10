; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73668 () Bool)

(assert start!73668)

(declare-fun b_free!14583 () Bool)

(declare-fun b_next!14583 () Bool)

(assert (=> start!73668 (= b_free!14583 (not b_next!14583))))

(declare-fun tp!51253 () Bool)

(declare-fun b_and!24145 () Bool)

(assert (=> start!73668 (= tp!51253 b_and!24145)))

(declare-fun b!862825 () Bool)

(declare-datatypes ((Unit!29481 0))(
  ( (Unit!29482) )
))
(declare-fun e!480697 () Unit!29481)

(declare-fun Unit!29483 () Unit!29481)

(assert (=> b!862825 (= e!480697 Unit!29483)))

(declare-fun b!862826 () Bool)

(declare-fun e!480698 () Bool)

(assert (=> b!862826 (= e!480698 true)))

(declare-datatypes ((V!27339 0))(
  ( (V!27340 (val!8407 Int)) )
))
(declare-datatypes ((tuple2!11124 0))(
  ( (tuple2!11125 (_1!5573 (_ BitVec 64)) (_2!5573 V!27339)) )
))
(declare-fun lt!389650 () tuple2!11124)

(declare-datatypes ((List!16933 0))(
  ( (Nil!16930) (Cons!16929 (h!18060 tuple2!11124) (t!23782 List!16933)) )
))
(declare-datatypes ((ListLongMap!9893 0))(
  ( (ListLongMap!9894 (toList!4962 List!16933)) )
))
(declare-fun lt!389643 () ListLongMap!9893)

(declare-fun lt!389646 () ListLongMap!9893)

(declare-fun lt!389641 () tuple2!11124)

(declare-fun +!2311 (ListLongMap!9893 tuple2!11124) ListLongMap!9893)

(assert (=> b!862826 (= lt!389646 (+!2311 (+!2311 lt!389643 lt!389641) lt!389650))))

(declare-fun lt!389651 () V!27339)

(declare-fun v!557 () V!27339)

(declare-fun lt!389642 () Unit!29481)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49602 0))(
  ( (array!49603 (arr!23832 (Array (_ BitVec 32) (_ BitVec 64))) (size!24272 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49602)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!486 (ListLongMap!9893 (_ BitVec 64) V!27339 (_ BitVec 64) V!27339) Unit!29481)

(assert (=> b!862826 (= lt!389642 (addCommutativeForDiffKeys!486 lt!389643 k0!854 v!557 (select (arr!23832 _keys!868) from!1053) lt!389651))))

(declare-fun b!862827 () Bool)

(declare-fun res!586321 () Bool)

(declare-fun e!480702 () Bool)

(assert (=> b!862827 (=> (not res!586321) (not e!480702))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49602 (_ BitVec 32)) Bool)

(assert (=> b!862827 (= res!586321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862828 () Bool)

(declare-fun e!480696 () Bool)

(declare-fun tp_is_empty!16719 () Bool)

(assert (=> b!862828 (= e!480696 tp_is_empty!16719)))

(declare-fun res!586328 () Bool)

(assert (=> start!73668 (=> (not res!586328) (not e!480702))))

(assert (=> start!73668 (= res!586328 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24272 _keys!868))))))

(assert (=> start!73668 e!480702))

(assert (=> start!73668 tp_is_empty!16719))

(assert (=> start!73668 true))

(assert (=> start!73668 tp!51253))

(declare-fun array_inv!18856 (array!49602) Bool)

(assert (=> start!73668 (array_inv!18856 _keys!868)))

(declare-datatypes ((ValueCell!7920 0))(
  ( (ValueCellFull!7920 (v!10832 V!27339)) (EmptyCell!7920) )
))
(declare-datatypes ((array!49604 0))(
  ( (array!49605 (arr!23833 (Array (_ BitVec 32) ValueCell!7920)) (size!24273 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49604)

(declare-fun e!480703 () Bool)

(declare-fun array_inv!18857 (array!49604) Bool)

(assert (=> start!73668 (and (array_inv!18857 _values!688) e!480703)))

(declare-fun b!862829 () Bool)

(declare-fun e!480701 () Bool)

(declare-fun mapRes!26678 () Bool)

(assert (=> b!862829 (= e!480703 (and e!480701 mapRes!26678))))

(declare-fun condMapEmpty!26678 () Bool)

(declare-fun mapDefault!26678 () ValueCell!7920)

(assert (=> b!862829 (= condMapEmpty!26678 (= (arr!23833 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7920)) mapDefault!26678)))))

(declare-fun b!862830 () Bool)

(declare-fun e!480700 () Bool)

(assert (=> b!862830 (= e!480702 e!480700)))

(declare-fun res!586324 () Bool)

(assert (=> b!862830 (=> (not res!586324) (not e!480700))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862830 (= res!586324 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!389648 () array!49604)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27339)

(declare-fun zeroValue!654 () V!27339)

(declare-fun lt!389656 () ListLongMap!9893)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2938 (array!49602 array!49604 (_ BitVec 32) (_ BitVec 32) V!27339 V!27339 (_ BitVec 32) Int) ListLongMap!9893)

(assert (=> b!862830 (= lt!389656 (getCurrentListMapNoExtraKeys!2938 _keys!868 lt!389648 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862830 (= lt!389648 (array!49605 (store (arr!23833 _values!688) i!612 (ValueCellFull!7920 v!557)) (size!24273 _values!688)))))

(declare-fun lt!389647 () ListLongMap!9893)

(assert (=> b!862830 (= lt!389647 (getCurrentListMapNoExtraKeys!2938 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862831 () Bool)

(declare-fun e!480699 () Bool)

(assert (=> b!862831 (= e!480700 (not e!480699))))

(declare-fun res!586320 () Bool)

(assert (=> b!862831 (=> res!586320 e!480699)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862831 (= res!586320 (not (validKeyInArray!0 (select (arr!23832 _keys!868) from!1053))))))

(declare-fun lt!389652 () ListLongMap!9893)

(declare-fun lt!389645 () ListLongMap!9893)

(assert (=> b!862831 (= lt!389652 lt!389645)))

(assert (=> b!862831 (= lt!389645 (+!2311 lt!389643 lt!389650))))

(assert (=> b!862831 (= lt!389652 (getCurrentListMapNoExtraKeys!2938 _keys!868 lt!389648 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862831 (= lt!389650 (tuple2!11125 k0!854 v!557))))

(assert (=> b!862831 (= lt!389643 (getCurrentListMapNoExtraKeys!2938 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389654 () Unit!29481)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!520 (array!49602 array!49604 (_ BitVec 32) (_ BitVec 32) V!27339 V!27339 (_ BitVec 32) (_ BitVec 64) V!27339 (_ BitVec 32) Int) Unit!29481)

(assert (=> b!862831 (= lt!389654 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!520 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862832 () Bool)

(declare-fun res!586327 () Bool)

(assert (=> b!862832 (=> (not res!586327) (not e!480702))))

(assert (=> b!862832 (= res!586327 (and (= (size!24273 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24272 _keys!868) (size!24273 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862833 () Bool)

(declare-fun res!586323 () Bool)

(assert (=> b!862833 (=> (not res!586323) (not e!480702))))

(assert (=> b!862833 (= res!586323 (and (= (select (arr!23832 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862834 () Bool)

(declare-fun res!586319 () Bool)

(assert (=> b!862834 (=> (not res!586319) (not e!480702))))

(assert (=> b!862834 (= res!586319 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24272 _keys!868))))))

(declare-fun b!862835 () Bool)

(declare-fun Unit!29484 () Unit!29481)

(assert (=> b!862835 (= e!480697 Unit!29484)))

(declare-fun lt!389653 () Unit!29481)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49602 (_ BitVec 32) (_ BitVec 32)) Unit!29481)

(assert (=> b!862835 (= lt!389653 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16934 0))(
  ( (Nil!16931) (Cons!16930 (h!18061 (_ BitVec 64)) (t!23783 List!16934)) )
))
(declare-fun arrayNoDuplicates!0 (array!49602 (_ BitVec 32) List!16934) Bool)

(assert (=> b!862835 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16931)))

(declare-fun lt!389649 () Unit!29481)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49602 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29481)

(assert (=> b!862835 (= lt!389649 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862835 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389655 () Unit!29481)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49602 (_ BitVec 64) (_ BitVec 32) List!16934) Unit!29481)

(assert (=> b!862835 (= lt!389655 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16931))))

(assert (=> b!862835 false))

(declare-fun b!862836 () Bool)

(declare-fun res!586318 () Bool)

(assert (=> b!862836 (=> (not res!586318) (not e!480702))))

(assert (=> b!862836 (= res!586318 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16931))))

(declare-fun b!862837 () Bool)

(declare-fun res!586322 () Bool)

(assert (=> b!862837 (=> (not res!586322) (not e!480702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862837 (= res!586322 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26678 () Bool)

(assert (=> mapIsEmpty!26678 mapRes!26678))

(declare-fun mapNonEmpty!26678 () Bool)

(declare-fun tp!51252 () Bool)

(assert (=> mapNonEmpty!26678 (= mapRes!26678 (and tp!51252 e!480696))))

(declare-fun mapValue!26678 () ValueCell!7920)

(declare-fun mapKey!26678 () (_ BitVec 32))

(declare-fun mapRest!26678 () (Array (_ BitVec 32) ValueCell!7920))

(assert (=> mapNonEmpty!26678 (= (arr!23833 _values!688) (store mapRest!26678 mapKey!26678 mapValue!26678))))

(declare-fun b!862838 () Bool)

(assert (=> b!862838 (= e!480701 tp_is_empty!16719)))

(declare-fun b!862839 () Bool)

(declare-fun res!586325 () Bool)

(assert (=> b!862839 (=> (not res!586325) (not e!480702))))

(assert (=> b!862839 (= res!586325 (validKeyInArray!0 k0!854))))

(declare-fun b!862840 () Bool)

(assert (=> b!862840 (= e!480699 e!480698)))

(declare-fun res!586326 () Bool)

(assert (=> b!862840 (=> res!586326 e!480698)))

(assert (=> b!862840 (= res!586326 (= k0!854 (select (arr!23832 _keys!868) from!1053)))))

(assert (=> b!862840 (not (= (select (arr!23832 _keys!868) from!1053) k0!854))))

(declare-fun lt!389644 () Unit!29481)

(assert (=> b!862840 (= lt!389644 e!480697)))

(declare-fun c!92095 () Bool)

(assert (=> b!862840 (= c!92095 (= (select (arr!23832 _keys!868) from!1053) k0!854))))

(assert (=> b!862840 (= lt!389656 lt!389646)))

(assert (=> b!862840 (= lt!389646 (+!2311 lt!389645 lt!389641))))

(assert (=> b!862840 (= lt!389641 (tuple2!11125 (select (arr!23832 _keys!868) from!1053) lt!389651))))

(declare-fun get!12580 (ValueCell!7920 V!27339) V!27339)

(declare-fun dynLambda!1142 (Int (_ BitVec 64)) V!27339)

(assert (=> b!862840 (= lt!389651 (get!12580 (select (arr!23833 _values!688) from!1053) (dynLambda!1142 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!73668 res!586328) b!862837))

(assert (= (and b!862837 res!586322) b!862832))

(assert (= (and b!862832 res!586327) b!862827))

(assert (= (and b!862827 res!586321) b!862836))

(assert (= (and b!862836 res!586318) b!862834))

(assert (= (and b!862834 res!586319) b!862839))

(assert (= (and b!862839 res!586325) b!862833))

(assert (= (and b!862833 res!586323) b!862830))

(assert (= (and b!862830 res!586324) b!862831))

(assert (= (and b!862831 (not res!586320)) b!862840))

(assert (= (and b!862840 c!92095) b!862835))

(assert (= (and b!862840 (not c!92095)) b!862825))

(assert (= (and b!862840 (not res!586326)) b!862826))

(assert (= (and b!862829 condMapEmpty!26678) mapIsEmpty!26678))

(assert (= (and b!862829 (not condMapEmpty!26678)) mapNonEmpty!26678))

(get-info :version)

(assert (= (and mapNonEmpty!26678 ((_ is ValueCellFull!7920) mapValue!26678)) b!862828))

(assert (= (and b!862829 ((_ is ValueCellFull!7920) mapDefault!26678)) b!862838))

(assert (= start!73668 b!862829))

(declare-fun b_lambda!11935 () Bool)

(assert (=> (not b_lambda!11935) (not b!862840)))

(declare-fun t!23781 () Bool)

(declare-fun tb!4705 () Bool)

(assert (=> (and start!73668 (= defaultEntry!696 defaultEntry!696) t!23781) tb!4705))

(declare-fun result!9021 () Bool)

(assert (=> tb!4705 (= result!9021 tp_is_empty!16719)))

(assert (=> b!862840 t!23781))

(declare-fun b_and!24147 () Bool)

(assert (= b_and!24145 (and (=> t!23781 result!9021) b_and!24147)))

(declare-fun m!803907 () Bool)

(assert (=> b!862839 m!803907))

(declare-fun m!803909 () Bool)

(assert (=> b!862833 m!803909))

(declare-fun m!803911 () Bool)

(assert (=> b!862831 m!803911))

(declare-fun m!803913 () Bool)

(assert (=> b!862831 m!803913))

(declare-fun m!803915 () Bool)

(assert (=> b!862831 m!803915))

(declare-fun m!803917 () Bool)

(assert (=> b!862831 m!803917))

(assert (=> b!862831 m!803915))

(declare-fun m!803919 () Bool)

(assert (=> b!862831 m!803919))

(declare-fun m!803921 () Bool)

(assert (=> b!862831 m!803921))

(declare-fun m!803923 () Bool)

(assert (=> b!862827 m!803923))

(declare-fun m!803925 () Bool)

(assert (=> b!862835 m!803925))

(declare-fun m!803927 () Bool)

(assert (=> b!862835 m!803927))

(declare-fun m!803929 () Bool)

(assert (=> b!862835 m!803929))

(declare-fun m!803931 () Bool)

(assert (=> b!862835 m!803931))

(declare-fun m!803933 () Bool)

(assert (=> b!862835 m!803933))

(declare-fun m!803935 () Bool)

(assert (=> mapNonEmpty!26678 m!803935))

(declare-fun m!803937 () Bool)

(assert (=> b!862830 m!803937))

(declare-fun m!803939 () Bool)

(assert (=> b!862830 m!803939))

(declare-fun m!803941 () Bool)

(assert (=> b!862830 m!803941))

(declare-fun m!803943 () Bool)

(assert (=> b!862836 m!803943))

(declare-fun m!803945 () Bool)

(assert (=> b!862826 m!803945))

(assert (=> b!862826 m!803945))

(declare-fun m!803947 () Bool)

(assert (=> b!862826 m!803947))

(assert (=> b!862826 m!803915))

(assert (=> b!862826 m!803915))

(declare-fun m!803949 () Bool)

(assert (=> b!862826 m!803949))

(declare-fun m!803951 () Bool)

(assert (=> b!862837 m!803951))

(declare-fun m!803953 () Bool)

(assert (=> b!862840 m!803953))

(declare-fun m!803955 () Bool)

(assert (=> b!862840 m!803955))

(declare-fun m!803957 () Bool)

(assert (=> b!862840 m!803957))

(declare-fun m!803959 () Bool)

(assert (=> b!862840 m!803959))

(assert (=> b!862840 m!803955))

(assert (=> b!862840 m!803915))

(assert (=> b!862840 m!803957))

(declare-fun m!803961 () Bool)

(assert (=> start!73668 m!803961))

(declare-fun m!803963 () Bool)

(assert (=> start!73668 m!803963))

(check-sat (not b!862827) (not b!862839) (not b!862831) (not b_next!14583) (not b!862836) (not mapNonEmpty!26678) (not b!862826) b_and!24147 (not b_lambda!11935) (not b!862840) tp_is_empty!16719 (not start!73668) (not b!862835) (not b!862837) (not b!862830))
(check-sat b_and!24147 (not b_next!14583))
