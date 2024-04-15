; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73810 () Bool)

(assert start!73810)

(declare-fun b_free!14743 () Bool)

(declare-fun b_next!14743 () Bool)

(assert (=> start!73810 (= b_free!14743 (not b_next!14743))))

(declare-fun tp!51734 () Bool)

(declare-fun b_and!24439 () Bool)

(assert (=> start!73810 (= tp!51734 b_and!24439)))

(declare-fun b!866586 () Bool)

(declare-datatypes ((Unit!29660 0))(
  ( (Unit!29661) )
))
(declare-fun e!482710 () Unit!29660)

(declare-fun Unit!29662 () Unit!29660)

(assert (=> b!866586 (= e!482710 Unit!29662)))

(declare-fun b!866587 () Bool)

(declare-fun e!482708 () Bool)

(declare-fun tp_is_empty!16879 () Bool)

(assert (=> b!866587 (= e!482708 tp_is_empty!16879)))

(declare-fun mapNonEmpty!26918 () Bool)

(declare-fun mapRes!26918 () Bool)

(declare-fun tp!51733 () Bool)

(assert (=> mapNonEmpty!26918 (= mapRes!26918 (and tp!51733 e!482708))))

(declare-datatypes ((V!27553 0))(
  ( (V!27554 (val!8487 Int)) )
))
(declare-datatypes ((ValueCell!8000 0))(
  ( (ValueCellFull!8000 (v!10906 V!27553)) (EmptyCell!8000) )
))
(declare-fun mapValue!26918 () ValueCell!8000)

(declare-fun mapKey!26918 () (_ BitVec 32))

(declare-fun mapRest!26918 () (Array (_ BitVec 32) ValueCell!8000))

(declare-datatypes ((array!49907 0))(
  ( (array!49908 (arr!23985 (Array (_ BitVec 32) ValueCell!8000)) (size!24427 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49907)

(assert (=> mapNonEmpty!26918 (= (arr!23985 _values!688) (store mapRest!26918 mapKey!26918 mapValue!26918))))

(declare-fun b!866588 () Bool)

(declare-fun e!482714 () Bool)

(declare-fun e!482707 () Bool)

(assert (=> b!866588 (= e!482714 e!482707)))

(declare-fun res!588848 () Bool)

(assert (=> b!866588 (=> res!588848 e!482707)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49909 0))(
  ( (array!49910 (arr!23986 (Array (_ BitVec 32) (_ BitVec 64))) (size!24428 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49909)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!866588 (= res!588848 (= k0!854 (select (arr!23986 _keys!868) from!1053)))))

(assert (=> b!866588 (not (= (select (arr!23986 _keys!868) from!1053) k0!854))))

(declare-fun lt!393258 () Unit!29660)

(assert (=> b!866588 (= lt!393258 e!482710)))

(declare-fun c!92270 () Bool)

(assert (=> b!866588 (= c!92270 (= (select (arr!23986 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11278 0))(
  ( (tuple2!11279 (_1!5650 (_ BitVec 64)) (_2!5650 V!27553)) )
))
(declare-datatypes ((List!17066 0))(
  ( (Nil!17063) (Cons!17062 (h!18193 tuple2!11278) (t!24066 List!17066)) )
))
(declare-datatypes ((ListLongMap!10037 0))(
  ( (ListLongMap!10038 (toList!5034 List!17066)) )
))
(declare-fun lt!393248 () ListLongMap!10037)

(declare-fun lt!393252 () ListLongMap!10037)

(assert (=> b!866588 (= lt!393248 lt!393252)))

(declare-fun lt!393251 () ListLongMap!10037)

(declare-fun lt!393250 () tuple2!11278)

(declare-fun +!2400 (ListLongMap!10037 tuple2!11278) ListLongMap!10037)

(assert (=> b!866588 (= lt!393252 (+!2400 lt!393251 lt!393250))))

(declare-fun lt!393257 () V!27553)

(assert (=> b!866588 (= lt!393250 (tuple2!11279 (select (arr!23986 _keys!868) from!1053) lt!393257))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12687 (ValueCell!8000 V!27553) V!27553)

(declare-fun dynLambda!1192 (Int (_ BitVec 64)) V!27553)

(assert (=> b!866588 (= lt!393257 (get!12687 (select (arr!23985 _values!688) from!1053) (dynLambda!1192 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866589 () Bool)

(declare-fun res!588855 () Bool)

(declare-fun e!482713 () Bool)

(assert (=> b!866589 (=> (not res!588855) (not e!482713))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!866589 (= res!588855 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24428 _keys!868))))))

(declare-fun b!866590 () Bool)

(declare-fun e!482715 () Bool)

(declare-fun e!482709 () Bool)

(assert (=> b!866590 (= e!482715 (and e!482709 mapRes!26918))))

(declare-fun condMapEmpty!26918 () Bool)

(declare-fun mapDefault!26918 () ValueCell!8000)

(assert (=> b!866590 (= condMapEmpty!26918 (= (arr!23985 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8000)) mapDefault!26918)))))

(declare-fun mapIsEmpty!26918 () Bool)

(assert (=> mapIsEmpty!26918 mapRes!26918))

(declare-fun b!866591 () Bool)

(declare-fun e!482711 () Bool)

(assert (=> b!866591 (= e!482711 (not e!482714))))

(declare-fun res!588850 () Bool)

(assert (=> b!866591 (=> res!588850 e!482714)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866591 (= res!588850 (not (validKeyInArray!0 (select (arr!23986 _keys!868) from!1053))))))

(declare-fun lt!393260 () ListLongMap!10037)

(assert (=> b!866591 (= lt!393260 lt!393251)))

(declare-fun lt!393249 () ListLongMap!10037)

(declare-fun lt!393255 () tuple2!11278)

(assert (=> b!866591 (= lt!393251 (+!2400 lt!393249 lt!393255))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!393259 () array!49907)

(declare-fun minValue!654 () V!27553)

(declare-fun zeroValue!654 () V!27553)

(declare-fun getCurrentListMapNoExtraKeys!3029 (array!49909 array!49907 (_ BitVec 32) (_ BitVec 32) V!27553 V!27553 (_ BitVec 32) Int) ListLongMap!10037)

(assert (=> b!866591 (= lt!393260 (getCurrentListMapNoExtraKeys!3029 _keys!868 lt!393259 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27553)

(assert (=> b!866591 (= lt!393255 (tuple2!11279 k0!854 v!557))))

(assert (=> b!866591 (= lt!393249 (getCurrentListMapNoExtraKeys!3029 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393253 () Unit!29660)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!570 (array!49909 array!49907 (_ BitVec 32) (_ BitVec 32) V!27553 V!27553 (_ BitVec 32) (_ BitVec 64) V!27553 (_ BitVec 32) Int) Unit!29660)

(assert (=> b!866591 (= lt!393253 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!570 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866592 () Bool)

(declare-fun res!588856 () Bool)

(assert (=> b!866592 (=> (not res!588856) (not e!482713))))

(assert (=> b!866592 (= res!588856 (and (= (select (arr!23986 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866593 () Bool)

(declare-fun res!588851 () Bool)

(assert (=> b!866593 (=> (not res!588851) (not e!482713))))

(assert (=> b!866593 (= res!588851 (and (= (size!24427 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24428 _keys!868) (size!24427 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866594 () Bool)

(assert (=> b!866594 (= e!482709 tp_is_empty!16879)))

(declare-fun b!866595 () Bool)

(declare-fun Unit!29663 () Unit!29660)

(assert (=> b!866595 (= e!482710 Unit!29663)))

(declare-fun lt!393254 () Unit!29660)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49909 (_ BitVec 32) (_ BitVec 32)) Unit!29660)

(assert (=> b!866595 (= lt!393254 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17067 0))(
  ( (Nil!17064) (Cons!17063 (h!18194 (_ BitVec 64)) (t!24067 List!17067)) )
))
(declare-fun arrayNoDuplicates!0 (array!49909 (_ BitVec 32) List!17067) Bool)

(assert (=> b!866595 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17064)))

(declare-fun lt!393256 () Unit!29660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49909 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29660)

(assert (=> b!866595 (= lt!393256 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866595 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393247 () Unit!29660)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49909 (_ BitVec 64) (_ BitVec 32) List!17067) Unit!29660)

(assert (=> b!866595 (= lt!393247 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17064))))

(assert (=> b!866595 false))

(declare-fun b!866596 () Bool)

(assert (=> b!866596 (= e!482707 true)))

(assert (=> b!866596 (= lt!393252 (+!2400 (+!2400 lt!393249 lt!393250) lt!393255))))

(declare-fun lt!393246 () Unit!29660)

(declare-fun addCommutativeForDiffKeys!538 (ListLongMap!10037 (_ BitVec 64) V!27553 (_ BitVec 64) V!27553) Unit!29660)

(assert (=> b!866596 (= lt!393246 (addCommutativeForDiffKeys!538 lt!393249 k0!854 v!557 (select (arr!23986 _keys!868) from!1053) lt!393257))))

(declare-fun b!866597 () Bool)

(declare-fun res!588849 () Bool)

(assert (=> b!866597 (=> (not res!588849) (not e!482713))))

(assert (=> b!866597 (= res!588849 (validKeyInArray!0 k0!854))))

(declare-fun b!866598 () Bool)

(declare-fun res!588853 () Bool)

(assert (=> b!866598 (=> (not res!588853) (not e!482713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866598 (= res!588853 (validMask!0 mask!1196))))

(declare-fun b!866599 () Bool)

(assert (=> b!866599 (= e!482713 e!482711)))

(declare-fun res!588854 () Bool)

(assert (=> b!866599 (=> (not res!588854) (not e!482711))))

(assert (=> b!866599 (= res!588854 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!866599 (= lt!393248 (getCurrentListMapNoExtraKeys!3029 _keys!868 lt!393259 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866599 (= lt!393259 (array!49908 (store (arr!23985 _values!688) i!612 (ValueCellFull!8000 v!557)) (size!24427 _values!688)))))

(declare-fun lt!393245 () ListLongMap!10037)

(assert (=> b!866599 (= lt!393245 (getCurrentListMapNoExtraKeys!3029 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866600 () Bool)

(declare-fun res!588852 () Bool)

(assert (=> b!866600 (=> (not res!588852) (not e!482713))))

(assert (=> b!866600 (= res!588852 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17064))))

(declare-fun res!588858 () Bool)

(assert (=> start!73810 (=> (not res!588858) (not e!482713))))

(assert (=> start!73810 (= res!588858 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24428 _keys!868))))))

(assert (=> start!73810 e!482713))

(assert (=> start!73810 tp_is_empty!16879))

(assert (=> start!73810 true))

(assert (=> start!73810 tp!51734))

(declare-fun array_inv!19034 (array!49909) Bool)

(assert (=> start!73810 (array_inv!19034 _keys!868)))

(declare-fun array_inv!19035 (array!49907) Bool)

(assert (=> start!73810 (and (array_inv!19035 _values!688) e!482715)))

(declare-fun b!866601 () Bool)

(declare-fun res!588857 () Bool)

(assert (=> b!866601 (=> (not res!588857) (not e!482713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49909 (_ BitVec 32)) Bool)

(assert (=> b!866601 (= res!588857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73810 res!588858) b!866598))

(assert (= (and b!866598 res!588853) b!866593))

(assert (= (and b!866593 res!588851) b!866601))

(assert (= (and b!866601 res!588857) b!866600))

(assert (= (and b!866600 res!588852) b!866589))

(assert (= (and b!866589 res!588855) b!866597))

(assert (= (and b!866597 res!588849) b!866592))

(assert (= (and b!866592 res!588856) b!866599))

(assert (= (and b!866599 res!588854) b!866591))

(assert (= (and b!866591 (not res!588850)) b!866588))

(assert (= (and b!866588 c!92270) b!866595))

(assert (= (and b!866588 (not c!92270)) b!866586))

(assert (= (and b!866588 (not res!588848)) b!866596))

(assert (= (and b!866590 condMapEmpty!26918) mapIsEmpty!26918))

(assert (= (and b!866590 (not condMapEmpty!26918)) mapNonEmpty!26918))

(get-info :version)

(assert (= (and mapNonEmpty!26918 ((_ is ValueCellFull!8000) mapValue!26918)) b!866587))

(assert (= (and b!866590 ((_ is ValueCellFull!8000) mapDefault!26918)) b!866594))

(assert (= start!73810 b!866590))

(declare-fun b_lambda!12077 () Bool)

(assert (=> (not b_lambda!12077) (not b!866588)))

(declare-fun t!24065 () Bool)

(declare-fun tb!4857 () Bool)

(assert (=> (and start!73810 (= defaultEntry!696 defaultEntry!696) t!24065) tb!4857))

(declare-fun result!9333 () Bool)

(assert (=> tb!4857 (= result!9333 tp_is_empty!16879)))

(assert (=> b!866588 t!24065))

(declare-fun b_and!24441 () Bool)

(assert (= b_and!24439 (and (=> t!24065 result!9333) b_and!24441)))

(declare-fun m!807789 () Bool)

(assert (=> mapNonEmpty!26918 m!807789))

(declare-fun m!807791 () Bool)

(assert (=> b!866599 m!807791))

(declare-fun m!807793 () Bool)

(assert (=> b!866599 m!807793))

(declare-fun m!807795 () Bool)

(assert (=> b!866599 m!807795))

(declare-fun m!807797 () Bool)

(assert (=> b!866591 m!807797))

(declare-fun m!807799 () Bool)

(assert (=> b!866591 m!807799))

(declare-fun m!807801 () Bool)

(assert (=> b!866591 m!807801))

(declare-fun m!807803 () Bool)

(assert (=> b!866591 m!807803))

(assert (=> b!866591 m!807801))

(declare-fun m!807805 () Bool)

(assert (=> b!866591 m!807805))

(declare-fun m!807807 () Bool)

(assert (=> b!866591 m!807807))

(declare-fun m!807809 () Bool)

(assert (=> b!866601 m!807809))

(declare-fun m!807811 () Bool)

(assert (=> b!866592 m!807811))

(declare-fun m!807813 () Bool)

(assert (=> b!866600 m!807813))

(declare-fun m!807815 () Bool)

(assert (=> start!73810 m!807815))

(declare-fun m!807817 () Bool)

(assert (=> start!73810 m!807817))

(declare-fun m!807819 () Bool)

(assert (=> b!866588 m!807819))

(assert (=> b!866588 m!807801))

(declare-fun m!807821 () Bool)

(assert (=> b!866588 m!807821))

(assert (=> b!866588 m!807819))

(assert (=> b!866588 m!807821))

(declare-fun m!807823 () Bool)

(assert (=> b!866588 m!807823))

(declare-fun m!807825 () Bool)

(assert (=> b!866588 m!807825))

(declare-fun m!807827 () Bool)

(assert (=> b!866596 m!807827))

(assert (=> b!866596 m!807827))

(declare-fun m!807829 () Bool)

(assert (=> b!866596 m!807829))

(assert (=> b!866596 m!807801))

(assert (=> b!866596 m!807801))

(declare-fun m!807831 () Bool)

(assert (=> b!866596 m!807831))

(declare-fun m!807833 () Bool)

(assert (=> b!866598 m!807833))

(declare-fun m!807835 () Bool)

(assert (=> b!866597 m!807835))

(declare-fun m!807837 () Bool)

(assert (=> b!866595 m!807837))

(declare-fun m!807839 () Bool)

(assert (=> b!866595 m!807839))

(declare-fun m!807841 () Bool)

(assert (=> b!866595 m!807841))

(declare-fun m!807843 () Bool)

(assert (=> b!866595 m!807843))

(declare-fun m!807845 () Bool)

(assert (=> b!866595 m!807845))

(check-sat (not b!866596) (not start!73810) (not b_next!14743) (not b!866598) b_and!24441 (not mapNonEmpty!26918) (not b_lambda!12077) tp_is_empty!16879 (not b!866601) (not b!866591) (not b!866595) (not b!866600) (not b!866597) (not b!866599) (not b!866588))
(check-sat b_and!24441 (not b_next!14743))
