; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73534 () Bool)

(assert start!73534)

(declare-fun b_free!14467 () Bool)

(declare-fun b_next!14467 () Bool)

(assert (=> start!73534 (= b_free!14467 (not b_next!14467))))

(declare-fun tp!50905 () Bool)

(declare-fun b_and!23887 () Bool)

(assert (=> start!73534 (= tp!50905 b_and!23887)))

(declare-fun b!859733 () Bool)

(declare-fun e!479077 () Bool)

(declare-fun e!479076 () Bool)

(assert (=> b!859733 (= e!479077 e!479076)))

(declare-fun res!584266 () Bool)

(assert (=> b!859733 (=> res!584266 e!479076)))

(declare-datatypes ((array!49365 0))(
  ( (array!49366 (arr!23714 (Array (_ BitVec 32) (_ BitVec 64))) (size!24156 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49365)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!859733 (= res!584266 (not (= (select (arr!23714 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((V!27185 0))(
  ( (V!27186 (val!8349 Int)) )
))
(declare-datatypes ((tuple2!11034 0))(
  ( (tuple2!11035 (_1!5528 (_ BitVec 64)) (_2!5528 V!27185)) )
))
(declare-datatypes ((List!16835 0))(
  ( (Nil!16832) (Cons!16831 (h!17962 tuple2!11034) (t!23559 List!16835)) )
))
(declare-datatypes ((ListLongMap!9793 0))(
  ( (ListLongMap!9794 (toList!4912 List!16835)) )
))
(declare-fun lt!387329 () ListLongMap!9793)

(declare-fun lt!387337 () ListLongMap!9793)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7862 0))(
  ( (ValueCellFull!7862 (v!10768 V!27185)) (EmptyCell!7862) )
))
(declare-datatypes ((array!49367 0))(
  ( (array!49368 (arr!23715 (Array (_ BitVec 32) ValueCell!7862)) (size!24157 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49367)

(declare-fun +!2286 (ListLongMap!9793 tuple2!11034) ListLongMap!9793)

(declare-fun get!12505 (ValueCell!7862 V!27185) V!27185)

(declare-fun dynLambda!1102 (Int (_ BitVec 64)) V!27185)

(assert (=> b!859733 (= lt!387337 (+!2286 lt!387329 (tuple2!11035 (select (arr!23714 _keys!868) from!1053) (get!12505 (select (arr!23715 _values!688) from!1053) (dynLambda!1102 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!584267 () Bool)

(declare-fun e!479075 () Bool)

(assert (=> start!73534 (=> (not res!584267) (not e!479075))))

(assert (=> start!73534 (= res!584267 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24156 _keys!868))))))

(assert (=> start!73534 e!479075))

(declare-fun tp_is_empty!16603 () Bool)

(assert (=> start!73534 tp_is_empty!16603))

(assert (=> start!73534 true))

(assert (=> start!73534 tp!50905))

(declare-fun array_inv!18836 (array!49365) Bool)

(assert (=> start!73534 (array_inv!18836 _keys!868)))

(declare-fun e!479074 () Bool)

(declare-fun array_inv!18837 (array!49367) Bool)

(assert (=> start!73534 (and (array_inv!18837 _values!688) e!479074)))

(declare-fun mapIsEmpty!26504 () Bool)

(declare-fun mapRes!26504 () Bool)

(assert (=> mapIsEmpty!26504 mapRes!26504))

(declare-fun b!859734 () Bool)

(declare-fun e!479071 () Bool)

(assert (=> b!859734 (= e!479076 e!479071)))

(declare-fun res!584258 () Bool)

(assert (=> b!859734 (=> res!584258 e!479071)))

(assert (=> b!859734 (= res!584258 (or (bvsge (size!24156 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24156 _keys!868)) (bvsge from!1053 (size!24156 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859734 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29241 0))(
  ( (Unit!29242) )
))
(declare-fun lt!387331 () Unit!29241)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49365 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29241)

(assert (=> b!859734 (= lt!387331 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!16836 0))(
  ( (Nil!16833) (Cons!16832 (h!17963 (_ BitVec 64)) (t!23560 List!16836)) )
))
(declare-fun arrayNoDuplicates!0 (array!49365 (_ BitVec 32) List!16836) Bool)

(assert (=> b!859734 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16833)))

(declare-fun lt!387333 () Unit!29241)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49365 (_ BitVec 32) (_ BitVec 32)) Unit!29241)

(assert (=> b!859734 (= lt!387333 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859735 () Bool)

(declare-fun res!584260 () Bool)

(assert (=> b!859735 (=> res!584260 e!479071)))

(declare-fun noDuplicate!1314 (List!16836) Bool)

(assert (=> b!859735 (= res!584260 (not (noDuplicate!1314 Nil!16833)))))

(declare-fun b!859736 () Bool)

(declare-fun e!479073 () Bool)

(assert (=> b!859736 (= e!479075 e!479073)))

(declare-fun res!584255 () Bool)

(assert (=> b!859736 (=> (not res!584255) (not e!479073))))

(assert (=> b!859736 (= res!584255 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!387330 () array!49367)

(declare-fun minValue!654 () V!27185)

(declare-fun zeroValue!654 () V!27185)

(declare-fun getCurrentListMapNoExtraKeys!2916 (array!49365 array!49367 (_ BitVec 32) (_ BitVec 32) V!27185 V!27185 (_ BitVec 32) Int) ListLongMap!9793)

(assert (=> b!859736 (= lt!387337 (getCurrentListMapNoExtraKeys!2916 _keys!868 lt!387330 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27185)

(assert (=> b!859736 (= lt!387330 (array!49368 (store (arr!23715 _values!688) i!612 (ValueCellFull!7862 v!557)) (size!24157 _values!688)))))

(declare-fun lt!387336 () ListLongMap!9793)

(assert (=> b!859736 (= lt!387336 (getCurrentListMapNoExtraKeys!2916 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859737 () Bool)

(declare-fun e!479072 () Bool)

(assert (=> b!859737 (= e!479072 tp_is_empty!16603)))

(declare-fun b!859738 () Bool)

(declare-fun res!584264 () Bool)

(assert (=> b!859738 (=> (not res!584264) (not e!479075))))

(assert (=> b!859738 (= res!584264 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24156 _keys!868))))))

(declare-fun b!859739 () Bool)

(declare-fun res!584259 () Bool)

(assert (=> b!859739 (=> res!584259 e!479071)))

(declare-fun contains!4205 (List!16836 (_ BitVec 64)) Bool)

(assert (=> b!859739 (= res!584259 (contains!4205 Nil!16833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859740 () Bool)

(declare-fun res!584263 () Bool)

(assert (=> b!859740 (=> (not res!584263) (not e!479075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859740 (= res!584263 (validKeyInArray!0 k0!854))))

(declare-fun b!859741 () Bool)

(declare-fun res!584268 () Bool)

(assert (=> b!859741 (=> (not res!584268) (not e!479075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859741 (= res!584268 (validMask!0 mask!1196))))

(declare-fun b!859742 () Bool)

(declare-fun e!479078 () Bool)

(assert (=> b!859742 (= e!479074 (and e!479078 mapRes!26504))))

(declare-fun condMapEmpty!26504 () Bool)

(declare-fun mapDefault!26504 () ValueCell!7862)

(assert (=> b!859742 (= condMapEmpty!26504 (= (arr!23715 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7862)) mapDefault!26504)))))

(declare-fun b!859743 () Bool)

(assert (=> b!859743 (= e!479071 true)))

(declare-fun lt!387332 () Bool)

(assert (=> b!859743 (= lt!387332 (contains!4205 Nil!16833 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859744 () Bool)

(assert (=> b!859744 (= e!479073 (not e!479077))))

(declare-fun res!584262 () Bool)

(assert (=> b!859744 (=> res!584262 e!479077)))

(assert (=> b!859744 (= res!584262 (not (validKeyInArray!0 (select (arr!23714 _keys!868) from!1053))))))

(declare-fun lt!387335 () ListLongMap!9793)

(assert (=> b!859744 (= lt!387335 lt!387329)))

(declare-fun lt!387334 () ListLongMap!9793)

(assert (=> b!859744 (= lt!387329 (+!2286 lt!387334 (tuple2!11035 k0!854 v!557)))))

(assert (=> b!859744 (= lt!387335 (getCurrentListMapNoExtraKeys!2916 _keys!868 lt!387330 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859744 (= lt!387334 (getCurrentListMapNoExtraKeys!2916 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387338 () Unit!29241)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!478 (array!49365 array!49367 (_ BitVec 32) (_ BitVec 32) V!27185 V!27185 (_ BitVec 32) (_ BitVec 64) V!27185 (_ BitVec 32) Int) Unit!29241)

(assert (=> b!859744 (= lt!387338 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!478 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859745 () Bool)

(declare-fun res!584265 () Bool)

(assert (=> b!859745 (=> (not res!584265) (not e!479075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49365 (_ BitVec 32)) Bool)

(assert (=> b!859745 (= res!584265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859746 () Bool)

(declare-fun res!584257 () Bool)

(assert (=> b!859746 (=> (not res!584257) (not e!479075))))

(assert (=> b!859746 (= res!584257 (and (= (select (arr!23714 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859747 () Bool)

(declare-fun res!584256 () Bool)

(assert (=> b!859747 (=> (not res!584256) (not e!479075))))

(assert (=> b!859747 (= res!584256 (and (= (size!24157 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24156 _keys!868) (size!24157 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859748 () Bool)

(declare-fun res!584261 () Bool)

(assert (=> b!859748 (=> (not res!584261) (not e!479075))))

(assert (=> b!859748 (= res!584261 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16833))))

(declare-fun mapNonEmpty!26504 () Bool)

(declare-fun tp!50906 () Bool)

(assert (=> mapNonEmpty!26504 (= mapRes!26504 (and tp!50906 e!479072))))

(declare-fun mapRest!26504 () (Array (_ BitVec 32) ValueCell!7862))

(declare-fun mapKey!26504 () (_ BitVec 32))

(declare-fun mapValue!26504 () ValueCell!7862)

(assert (=> mapNonEmpty!26504 (= (arr!23715 _values!688) (store mapRest!26504 mapKey!26504 mapValue!26504))))

(declare-fun b!859749 () Bool)

(assert (=> b!859749 (= e!479078 tp_is_empty!16603)))

(assert (= (and start!73534 res!584267) b!859741))

(assert (= (and b!859741 res!584268) b!859747))

(assert (= (and b!859747 res!584256) b!859745))

(assert (= (and b!859745 res!584265) b!859748))

(assert (= (and b!859748 res!584261) b!859738))

(assert (= (and b!859738 res!584264) b!859740))

(assert (= (and b!859740 res!584263) b!859746))

(assert (= (and b!859746 res!584257) b!859736))

(assert (= (and b!859736 res!584255) b!859744))

(assert (= (and b!859744 (not res!584262)) b!859733))

(assert (= (and b!859733 (not res!584266)) b!859734))

(assert (= (and b!859734 (not res!584258)) b!859735))

(assert (= (and b!859735 (not res!584260)) b!859739))

(assert (= (and b!859739 (not res!584259)) b!859743))

(assert (= (and b!859742 condMapEmpty!26504) mapIsEmpty!26504))

(assert (= (and b!859742 (not condMapEmpty!26504)) mapNonEmpty!26504))

(get-info :version)

(assert (= (and mapNonEmpty!26504 ((_ is ValueCellFull!7862) mapValue!26504)) b!859737))

(assert (= (and b!859742 ((_ is ValueCellFull!7862) mapDefault!26504)) b!859749))

(assert (= start!73534 b!859742))

(declare-fun b_lambda!11801 () Bool)

(assert (=> (not b_lambda!11801) (not b!859733)))

(declare-fun t!23558 () Bool)

(declare-fun tb!4581 () Bool)

(assert (=> (and start!73534 (= defaultEntry!696 defaultEntry!696) t!23558) tb!4581))

(declare-fun result!8781 () Bool)

(assert (=> tb!4581 (= result!8781 tp_is_empty!16603)))

(assert (=> b!859733 t!23558))

(declare-fun b_and!23889 () Bool)

(assert (= b_and!23887 (and (=> t!23558 result!8781) b_and!23889)))

(declare-fun m!799995 () Bool)

(assert (=> b!859740 m!799995))

(declare-fun m!799997 () Bool)

(assert (=> b!859746 m!799997))

(declare-fun m!799999 () Bool)

(assert (=> b!859744 m!799999))

(declare-fun m!800001 () Bool)

(assert (=> b!859744 m!800001))

(declare-fun m!800003 () Bool)

(assert (=> b!859744 m!800003))

(declare-fun m!800005 () Bool)

(assert (=> b!859744 m!800005))

(declare-fun m!800007 () Bool)

(assert (=> b!859744 m!800007))

(assert (=> b!859744 m!800001))

(declare-fun m!800009 () Bool)

(assert (=> b!859744 m!800009))

(declare-fun m!800011 () Bool)

(assert (=> b!859743 m!800011))

(declare-fun m!800013 () Bool)

(assert (=> b!859739 m!800013))

(declare-fun m!800015 () Bool)

(assert (=> b!859736 m!800015))

(declare-fun m!800017 () Bool)

(assert (=> b!859736 m!800017))

(declare-fun m!800019 () Bool)

(assert (=> b!859736 m!800019))

(declare-fun m!800021 () Bool)

(assert (=> b!859733 m!800021))

(declare-fun m!800023 () Bool)

(assert (=> b!859733 m!800023))

(declare-fun m!800025 () Bool)

(assert (=> b!859733 m!800025))

(assert (=> b!859733 m!800021))

(declare-fun m!800027 () Bool)

(assert (=> b!859733 m!800027))

(assert (=> b!859733 m!800001))

(assert (=> b!859733 m!800023))

(declare-fun m!800029 () Bool)

(assert (=> mapNonEmpty!26504 m!800029))

(declare-fun m!800031 () Bool)

(assert (=> b!859748 m!800031))

(declare-fun m!800033 () Bool)

(assert (=> start!73534 m!800033))

(declare-fun m!800035 () Bool)

(assert (=> start!73534 m!800035))

(declare-fun m!800037 () Bool)

(assert (=> b!859745 m!800037))

(declare-fun m!800039 () Bool)

(assert (=> b!859734 m!800039))

(declare-fun m!800041 () Bool)

(assert (=> b!859734 m!800041))

(declare-fun m!800043 () Bool)

(assert (=> b!859734 m!800043))

(declare-fun m!800045 () Bool)

(assert (=> b!859734 m!800045))

(declare-fun m!800047 () Bool)

(assert (=> b!859735 m!800047))

(declare-fun m!800049 () Bool)

(assert (=> b!859741 m!800049))

(check-sat (not b_next!14467) (not b!859748) (not b!859744) (not b!859733) (not b!859735) (not b!859739) tp_is_empty!16603 (not b!859736) (not b_lambda!11801) (not b!859741) (not b!859743) (not b!859734) b_and!23889 (not b!859740) (not mapNonEmpty!26504) (not b!859745) (not start!73534))
(check-sat b_and!23889 (not b_next!14467))
